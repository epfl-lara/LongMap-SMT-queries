; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48640 () Bool)

(assert start!48640)

(declare-fun b!534296 () Bool)

(declare-fun e!310671 () Bool)

(assert (=> b!534296 (= e!310671 false)))

(declare-datatypes ((SeekEntryResult!4723 0))(
  ( (MissingZero!4723 (index!21116 (_ BitVec 32))) (Found!4723 (index!21117 (_ BitVec 32))) (Intermediate!4723 (undefined!5535 Bool) (index!21118 (_ BitVec 32)) (x!50074 (_ BitVec 32))) (Undefined!4723) (MissingVacant!4723 (index!21119 (_ BitVec 32))) )
))
(declare-fun lt!245604 () SeekEntryResult!4723)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33852 0))(
  ( (array!33853 (arr!16265 (Array (_ BitVec 32) (_ BitVec 64))) (size!16629 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33852)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33852 (_ BitVec 32)) SeekEntryResult!4723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534296 (= lt!245604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16265 a!3154) j!147) mask!3216) (select (arr!16265 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534297 () Bool)

(declare-fun res!329504 () Bool)

(declare-fun e!310670 () Bool)

(assert (=> b!534297 (=> (not res!329504) (not e!310670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534297 (= res!329504 (validKeyInArray!0 (select (arr!16265 a!3154) j!147)))))

(declare-fun b!534298 () Bool)

(assert (=> b!534298 (= e!310670 e!310671)))

(declare-fun res!329505 () Bool)

(assert (=> b!534298 (=> (not res!329505) (not e!310671))))

(declare-fun lt!245605 () SeekEntryResult!4723)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534298 (= res!329505 (or (= lt!245605 (MissingZero!4723 i!1153)) (= lt!245605 (MissingVacant!4723 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33852 (_ BitVec 32)) SeekEntryResult!4723)

(assert (=> b!534298 (= lt!245605 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!329509 () Bool)

(assert (=> start!48640 (=> (not res!329509) (not e!310670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48640 (= res!329509 (validMask!0 mask!3216))))

(assert (=> start!48640 e!310670))

(assert (=> start!48640 true))

(declare-fun array_inv!12061 (array!33852) Bool)

(assert (=> start!48640 (array_inv!12061 a!3154)))

(declare-fun b!534299 () Bool)

(declare-fun res!329510 () Bool)

(assert (=> b!534299 (=> (not res!329510) (not e!310671))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534299 (= res!329510 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16265 a!3154) j!147) a!3154 mask!3216) (Intermediate!4723 false resIndex!32 resX!32)))))

(declare-fun b!534300 () Bool)

(declare-fun res!329506 () Bool)

(assert (=> b!534300 (=> (not res!329506) (not e!310670))))

(declare-fun arrayContainsKey!0 (array!33852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534300 (= res!329506 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534301 () Bool)

(declare-fun res!329508 () Bool)

(assert (=> b!534301 (=> (not res!329508) (not e!310670))))

(assert (=> b!534301 (= res!329508 (validKeyInArray!0 k!1998))))

(declare-fun b!534302 () Bool)

(declare-fun res!329503 () Bool)

(assert (=> b!534302 (=> (not res!329503) (not e!310670))))

(assert (=> b!534302 (= res!329503 (and (= (size!16629 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16629 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16629 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534303 () Bool)

(declare-fun res!329502 () Bool)

(assert (=> b!534303 (=> (not res!329502) (not e!310671))))

(declare-datatypes ((List!10384 0))(
  ( (Nil!10381) (Cons!10380 (h!11323 (_ BitVec 64)) (t!16612 List!10384)) )
))
(declare-fun arrayNoDuplicates!0 (array!33852 (_ BitVec 32) List!10384) Bool)

(assert (=> b!534303 (= res!329502 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10381))))

(declare-fun b!534304 () Bool)

(declare-fun res!329507 () Bool)

(assert (=> b!534304 (=> (not res!329507) (not e!310671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33852 (_ BitVec 32)) Bool)

(assert (=> b!534304 (= res!329507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534305 () Bool)

(declare-fun res!329501 () Bool)

(assert (=> b!534305 (=> (not res!329501) (not e!310671))))

(assert (=> b!534305 (= res!329501 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16629 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16629 a!3154)) (= (select (arr!16265 a!3154) resIndex!32) (select (arr!16265 a!3154) j!147))))))

(assert (= (and start!48640 res!329509) b!534302))

(assert (= (and b!534302 res!329503) b!534297))

(assert (= (and b!534297 res!329504) b!534301))

(assert (= (and b!534301 res!329508) b!534300))

(assert (= (and b!534300 res!329506) b!534298))

(assert (= (and b!534298 res!329505) b!534304))

(assert (= (and b!534304 res!329507) b!534303))

(assert (= (and b!534303 res!329502) b!534305))

(assert (= (and b!534305 res!329501) b!534299))

(assert (= (and b!534299 res!329510) b!534296))

(declare-fun m!514033 () Bool)

(assert (=> b!534305 m!514033))

(declare-fun m!514035 () Bool)

(assert (=> b!534305 m!514035))

(declare-fun m!514037 () Bool)

(assert (=> start!48640 m!514037))

(declare-fun m!514039 () Bool)

(assert (=> start!48640 m!514039))

(declare-fun m!514041 () Bool)

(assert (=> b!534303 m!514041))

(assert (=> b!534299 m!514035))

(assert (=> b!534299 m!514035))

(declare-fun m!514043 () Bool)

(assert (=> b!534299 m!514043))

(declare-fun m!514045 () Bool)

(assert (=> b!534304 m!514045))

(declare-fun m!514047 () Bool)

(assert (=> b!534298 m!514047))

(declare-fun m!514049 () Bool)

(assert (=> b!534301 m!514049))

(declare-fun m!514051 () Bool)

(assert (=> b!534300 m!514051))

(assert (=> b!534296 m!514035))

(assert (=> b!534296 m!514035))

(declare-fun m!514053 () Bool)

(assert (=> b!534296 m!514053))

(assert (=> b!534296 m!514053))

(assert (=> b!534296 m!514035))

(declare-fun m!514055 () Bool)

(assert (=> b!534296 m!514055))

(assert (=> b!534297 m!514035))

(assert (=> b!534297 m!514035))

(declare-fun m!514057 () Bool)

(assert (=> b!534297 m!514057))

(push 1)

(assert (not b!534303))

(assert (not b!534298))

(assert (not start!48640))

(assert (not b!534301))

(assert (not b!534304))

(assert (not b!534296))

(assert (not b!534299))

(assert (not b!534300))

