; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48648 () Bool)

(assert start!48648)

(declare-fun b!534416 () Bool)

(declare-fun res!329628 () Bool)

(declare-fun e!310705 () Bool)

(assert (=> b!534416 (=> (not res!329628) (not e!310705))))

(declare-datatypes ((array!33860 0))(
  ( (array!33861 (arr!16269 (Array (_ BitVec 32) (_ BitVec 64))) (size!16633 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33860)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534416 (= res!329628 (validKeyInArray!0 (select (arr!16269 a!3154) j!147)))))

(declare-fun b!534417 () Bool)

(declare-fun e!310706 () Bool)

(assert (=> b!534417 (= e!310705 e!310706)))

(declare-fun res!329630 () Bool)

(assert (=> b!534417 (=> (not res!329630) (not e!310706))))

(declare-datatypes ((SeekEntryResult!4727 0))(
  ( (MissingZero!4727 (index!21132 (_ BitVec 32))) (Found!4727 (index!21133 (_ BitVec 32))) (Intermediate!4727 (undefined!5539 Bool) (index!21134 (_ BitVec 32)) (x!50094 (_ BitVec 32))) (Undefined!4727) (MissingVacant!4727 (index!21135 (_ BitVec 32))) )
))
(declare-fun lt!245629 () SeekEntryResult!4727)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534417 (= res!329630 (or (= lt!245629 (MissingZero!4727 i!1153)) (= lt!245629 (MissingVacant!4727 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33860 (_ BitVec 32)) SeekEntryResult!4727)

(assert (=> b!534417 (= lt!245629 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534418 () Bool)

(declare-fun res!329624 () Bool)

(assert (=> b!534418 (=> (not res!329624) (not e!310705))))

(assert (=> b!534418 (= res!329624 (and (= (size!16633 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16633 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16633 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534419 () Bool)

(assert (=> b!534419 (= e!310706 false)))

(declare-fun lt!245628 () SeekEntryResult!4727)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33860 (_ BitVec 32)) SeekEntryResult!4727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534419 (= lt!245628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16269 a!3154) j!147) mask!3216) (select (arr!16269 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534420 () Bool)

(declare-fun res!329625 () Bool)

(assert (=> b!534420 (=> (not res!329625) (not e!310706))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534420 (= res!329625 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16633 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16633 a!3154)) (= (select (arr!16269 a!3154) resIndex!32) (select (arr!16269 a!3154) j!147))))))

(declare-fun b!534421 () Bool)

(declare-fun res!329622 () Bool)

(assert (=> b!534421 (=> (not res!329622) (not e!310706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33860 (_ BitVec 32)) Bool)

(assert (=> b!534421 (= res!329622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534422 () Bool)

(declare-fun res!329621 () Bool)

(assert (=> b!534422 (=> (not res!329621) (not e!310706))))

(declare-datatypes ((List!10388 0))(
  ( (Nil!10385) (Cons!10384 (h!11327 (_ BitVec 64)) (t!16616 List!10388)) )
))
(declare-fun arrayNoDuplicates!0 (array!33860 (_ BitVec 32) List!10388) Bool)

(assert (=> b!534422 (= res!329621 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10385))))

(declare-fun b!534423 () Bool)

(declare-fun res!329623 () Bool)

(assert (=> b!534423 (=> (not res!329623) (not e!310705))))

(assert (=> b!534423 (= res!329623 (validKeyInArray!0 k!1998))))

(declare-fun res!329629 () Bool)

(assert (=> start!48648 (=> (not res!329629) (not e!310705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48648 (= res!329629 (validMask!0 mask!3216))))

(assert (=> start!48648 e!310705))

(assert (=> start!48648 true))

(declare-fun array_inv!12065 (array!33860) Bool)

(assert (=> start!48648 (array_inv!12065 a!3154)))

(declare-fun b!534424 () Bool)

(declare-fun res!329626 () Bool)

(assert (=> b!534424 (=> (not res!329626) (not e!310706))))

(assert (=> b!534424 (= res!329626 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16269 a!3154) j!147) a!3154 mask!3216) (Intermediate!4727 false resIndex!32 resX!32)))))

(declare-fun b!534425 () Bool)

(declare-fun res!329627 () Bool)

(assert (=> b!534425 (=> (not res!329627) (not e!310705))))

(declare-fun arrayContainsKey!0 (array!33860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534425 (= res!329627 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48648 res!329629) b!534418))

(assert (= (and b!534418 res!329624) b!534416))

(assert (= (and b!534416 res!329628) b!534423))

(assert (= (and b!534423 res!329623) b!534425))

(assert (= (and b!534425 res!329627) b!534417))

(assert (= (and b!534417 res!329630) b!534421))

(assert (= (and b!534421 res!329622) b!534422))

(assert (= (and b!534422 res!329621) b!534420))

(assert (= (and b!534420 res!329625) b!534424))

(assert (= (and b!534424 res!329626) b!534419))

(declare-fun m!514137 () Bool)

(assert (=> b!534420 m!514137))

(declare-fun m!514139 () Bool)

(assert (=> b!534420 m!514139))

(declare-fun m!514141 () Bool)

(assert (=> start!48648 m!514141))

(declare-fun m!514143 () Bool)

(assert (=> start!48648 m!514143))

(declare-fun m!514145 () Bool)

(assert (=> b!534423 m!514145))

(declare-fun m!514147 () Bool)

(assert (=> b!534422 m!514147))

(assert (=> b!534419 m!514139))

(assert (=> b!534419 m!514139))

(declare-fun m!514149 () Bool)

(assert (=> b!534419 m!514149))

(assert (=> b!534419 m!514149))

(assert (=> b!534419 m!514139))

(declare-fun m!514151 () Bool)

(assert (=> b!534419 m!514151))

(assert (=> b!534424 m!514139))

(assert (=> b!534424 m!514139))

(declare-fun m!514153 () Bool)

(assert (=> b!534424 m!514153))

(declare-fun m!514155 () Bool)

(assert (=> b!534425 m!514155))

(declare-fun m!514157 () Bool)

(assert (=> b!534417 m!514157))

(assert (=> b!534416 m!514139))

(assert (=> b!534416 m!514139))

(declare-fun m!514159 () Bool)

(assert (=> b!534416 m!514159))

(declare-fun m!514161 () Bool)

(assert (=> b!534421 m!514161))

(push 1)

