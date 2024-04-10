; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48700 () Bool)

(assert start!48700)

(declare-fun b!535222 () Bool)

(declare-fun res!330434 () Bool)

(declare-fun e!310968 () Bool)

(assert (=> b!535222 (=> (not res!330434) (not e!310968))))

(declare-datatypes ((array!33912 0))(
  ( (array!33913 (arr!16295 (Array (_ BitVec 32) (_ BitVec 64))) (size!16659 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33912)

(declare-datatypes ((List!10414 0))(
  ( (Nil!10411) (Cons!10410 (h!11353 (_ BitVec 64)) (t!16642 List!10414)) )
))
(declare-fun arrayNoDuplicates!0 (array!33912 (_ BitVec 32) List!10414) Bool)

(assert (=> b!535222 (= res!330434 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10411))))

(declare-fun b!535223 () Bool)

(declare-fun res!330435 () Bool)

(declare-fun e!310965 () Bool)

(assert (=> b!535223 (=> (not res!330435) (not e!310965))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535223 (= res!330435 (validKeyInArray!0 (select (arr!16295 a!3154) j!147)))))

(declare-fun b!535224 () Bool)

(declare-fun res!330431 () Bool)

(declare-fun e!310967 () Bool)

(assert (=> b!535224 (=> (not res!330431) (not e!310967))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4753 0))(
  ( (MissingZero!4753 (index!21236 (_ BitVec 32))) (Found!4753 (index!21237 (_ BitVec 32))) (Intermediate!4753 (undefined!5565 Bool) (index!21238 (_ BitVec 32)) (x!50184 (_ BitVec 32))) (Undefined!4753) (MissingVacant!4753 (index!21239 (_ BitVec 32))) )
))
(declare-fun lt!245785 () SeekEntryResult!4753)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33912 (_ BitVec 32)) SeekEntryResult!4753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535224 (= res!330431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16295 a!3154) j!147) mask!3216) (select (arr!16295 a!3154) j!147) a!3154 mask!3216) lt!245785))))

(declare-fun b!535225 () Bool)

(declare-fun res!330433 () Bool)

(assert (=> b!535225 (=> (not res!330433) (not e!310968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33912 (_ BitVec 32)) Bool)

(assert (=> b!535225 (= res!330433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535226 () Bool)

(assert (=> b!535226 (= e!310968 e!310967)))

(declare-fun res!330436 () Bool)

(assert (=> b!535226 (=> (not res!330436) (not e!310967))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535226 (= res!330436 (= lt!245785 (Intermediate!4753 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!535226 (= lt!245785 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16295 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!330430 () Bool)

(assert (=> start!48700 (=> (not res!330430) (not e!310965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48700 (= res!330430 (validMask!0 mask!3216))))

(assert (=> start!48700 e!310965))

(assert (=> start!48700 true))

(declare-fun array_inv!12091 (array!33912) Bool)

(assert (=> start!48700 (array_inv!12091 a!3154)))

(declare-fun b!535227 () Bool)

(declare-fun res!330432 () Bool)

(assert (=> b!535227 (=> (not res!330432) (not e!310965))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535227 (= res!330432 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535228 () Bool)

(assert (=> b!535228 (= e!310967 (and (not (= (select (arr!16295 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16295 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16295 a!3154) index!1177) (select (arr!16295 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!535229 () Bool)

(declare-fun res!330428 () Bool)

(assert (=> b!535229 (=> (not res!330428) (not e!310965))))

(assert (=> b!535229 (= res!330428 (validKeyInArray!0 k!1998))))

(declare-fun b!535230 () Bool)

(assert (=> b!535230 (= e!310965 e!310968)))

(declare-fun res!330437 () Bool)

(assert (=> b!535230 (=> (not res!330437) (not e!310968))))

(declare-fun lt!245784 () SeekEntryResult!4753)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535230 (= res!330437 (or (= lt!245784 (MissingZero!4753 i!1153)) (= lt!245784 (MissingVacant!4753 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33912 (_ BitVec 32)) SeekEntryResult!4753)

(assert (=> b!535230 (= lt!245784 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535231 () Bool)

(declare-fun res!330427 () Bool)

(assert (=> b!535231 (=> (not res!330427) (not e!310968))))

(assert (=> b!535231 (= res!330427 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16659 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16659 a!3154)) (= (select (arr!16295 a!3154) resIndex!32) (select (arr!16295 a!3154) j!147))))))

(declare-fun b!535232 () Bool)

(declare-fun res!330429 () Bool)

(assert (=> b!535232 (=> (not res!330429) (not e!310965))))

(assert (=> b!535232 (= res!330429 (and (= (size!16659 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16659 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16659 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48700 res!330430) b!535232))

(assert (= (and b!535232 res!330429) b!535223))

(assert (= (and b!535223 res!330435) b!535229))

(assert (= (and b!535229 res!330428) b!535227))

(assert (= (and b!535227 res!330432) b!535230))

(assert (= (and b!535230 res!330437) b!535225))

(assert (= (and b!535225 res!330433) b!535222))

(assert (= (and b!535222 res!330434) b!535231))

(assert (= (and b!535231 res!330427) b!535226))

(assert (= (and b!535226 res!330436) b!535224))

(assert (= (and b!535224 res!330431) b!535228))

(declare-fun m!514829 () Bool)

(assert (=> b!535225 m!514829))

(declare-fun m!514831 () Bool)

(assert (=> b!535222 m!514831))

(declare-fun m!514833 () Bool)

(assert (=> b!535228 m!514833))

(declare-fun m!514835 () Bool)

(assert (=> b!535228 m!514835))

(declare-fun m!514837 () Bool)

(assert (=> start!48700 m!514837))

(declare-fun m!514839 () Bool)

(assert (=> start!48700 m!514839))

(assert (=> b!535223 m!514835))

(assert (=> b!535223 m!514835))

(declare-fun m!514841 () Bool)

(assert (=> b!535223 m!514841))

(declare-fun m!514843 () Bool)

(assert (=> b!535227 m!514843))

(declare-fun m!514845 () Bool)

(assert (=> b!535229 m!514845))

(assert (=> b!535224 m!514835))

(assert (=> b!535224 m!514835))

(declare-fun m!514847 () Bool)

(assert (=> b!535224 m!514847))

(assert (=> b!535224 m!514847))

(assert (=> b!535224 m!514835))

(declare-fun m!514849 () Bool)

(assert (=> b!535224 m!514849))

(assert (=> b!535226 m!514835))

(assert (=> b!535226 m!514835))

(declare-fun m!514851 () Bool)

(assert (=> b!535226 m!514851))

(declare-fun m!514853 () Bool)

(assert (=> b!535231 m!514853))

(assert (=> b!535231 m!514835))

(declare-fun m!514855 () Bool)

(assert (=> b!535230 m!514855))

(push 1)

(assert (not b!535222))

(assert (not b!535230))

(assert (not b!535223))

(assert (not b!535227))

(assert (not start!48700))

(assert (not b!535224))

(assert (not b!535226))

(assert (not b!535229))

(assert (not b!535225))

