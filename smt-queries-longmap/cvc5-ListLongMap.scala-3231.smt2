; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45192 () Bool)

(assert start!45192)

(declare-fun b!495991 () Bool)

(declare-fun res!298378 () Bool)

(declare-fun e!290919 () Bool)

(assert (=> b!495991 (=> (not res!298378) (not e!290919))))

(declare-datatypes ((array!32080 0))(
  ( (array!32081 (arr!15423 (Array (_ BitVec 32) (_ BitVec 64))) (size!15787 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32080)

(declare-datatypes ((List!9581 0))(
  ( (Nil!9578) (Cons!9577 (h!10448 (_ BitVec 64)) (t!15809 List!9581)) )
))
(declare-fun arrayNoDuplicates!0 (array!32080 (_ BitVec 32) List!9581) Bool)

(assert (=> b!495991 (= res!298378 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9578))))

(declare-fun b!495993 () Bool)

(declare-fun res!298386 () Bool)

(assert (=> b!495993 (=> (not res!298386) (not e!290919))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32080 (_ BitVec 32)) Bool)

(assert (=> b!495993 (= res!298386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495994 () Bool)

(declare-fun res!298383 () Bool)

(declare-fun e!290918 () Bool)

(assert (=> b!495994 (=> res!298383 e!290918)))

(declare-datatypes ((SeekEntryResult!3890 0))(
  ( (MissingZero!3890 (index!17739 (_ BitVec 32))) (Found!3890 (index!17740 (_ BitVec 32))) (Intermediate!3890 (undefined!4702 Bool) (index!17741 (_ BitVec 32)) (x!46806 (_ BitVec 32))) (Undefined!3890) (MissingVacant!3890 (index!17742 (_ BitVec 32))) )
))
(declare-fun lt!224538 () SeekEntryResult!3890)

(assert (=> b!495994 (= res!298383 (or (undefined!4702 lt!224538) (not (is-Intermediate!3890 lt!224538))))))

(declare-fun b!495995 () Bool)

(declare-fun res!298384 () Bool)

(declare-fun e!290920 () Bool)

(assert (=> b!495995 (=> (not res!298384) (not e!290920))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495995 (= res!298384 (and (= (size!15787 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15787 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15787 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495996 () Bool)

(assert (=> b!495996 (= e!290920 e!290919)))

(declare-fun res!298381 () Bool)

(assert (=> b!495996 (=> (not res!298381) (not e!290919))))

(declare-fun lt!224541 () SeekEntryResult!3890)

(assert (=> b!495996 (= res!298381 (or (= lt!224541 (MissingZero!3890 i!1204)) (= lt!224541 (MissingVacant!3890 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32080 (_ BitVec 32)) SeekEntryResult!3890)

(assert (=> b!495996 (= lt!224541 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495997 () Bool)

(declare-fun res!298388 () Bool)

(assert (=> b!495997 (=> (not res!298388) (not e!290920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495997 (= res!298388 (validKeyInArray!0 k!2280))))

(declare-fun b!495998 () Bool)

(declare-fun e!290921 () Bool)

(assert (=> b!495998 (= e!290921 (= (seekEntryOrOpen!0 (select (arr!15423 a!3235) j!176) a!3235 mask!3524) (Found!3890 j!176)))))

(declare-fun b!495999 () Bool)

(assert (=> b!495999 (= e!290919 (not e!290918))))

(declare-fun res!298380 () Bool)

(assert (=> b!495999 (=> res!298380 e!290918)))

(declare-fun lt!224542 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32080 (_ BitVec 32)) SeekEntryResult!3890)

(assert (=> b!495999 (= res!298380 (= lt!224538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224542 (select (store (arr!15423 a!3235) i!1204 k!2280) j!176) (array!32081 (store (arr!15423 a!3235) i!1204 k!2280) (size!15787 a!3235)) mask!3524)))))

(declare-fun lt!224539 () (_ BitVec 32))

(assert (=> b!495999 (= lt!224538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224539 (select (arr!15423 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495999 (= lt!224542 (toIndex!0 (select (store (arr!15423 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495999 (= lt!224539 (toIndex!0 (select (arr!15423 a!3235) j!176) mask!3524))))

(assert (=> b!495999 e!290921))

(declare-fun res!298379 () Bool)

(assert (=> b!495999 (=> (not res!298379) (not e!290921))))

(assert (=> b!495999 (= res!298379 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14726 0))(
  ( (Unit!14727) )
))
(declare-fun lt!224540 () Unit!14726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14726)

(assert (=> b!495999 (= lt!224540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495992 () Bool)

(declare-fun res!298385 () Bool)

(assert (=> b!495992 (=> (not res!298385) (not e!290920))))

(assert (=> b!495992 (= res!298385 (validKeyInArray!0 (select (arr!15423 a!3235) j!176)))))

(declare-fun res!298382 () Bool)

(assert (=> start!45192 (=> (not res!298382) (not e!290920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45192 (= res!298382 (validMask!0 mask!3524))))

(assert (=> start!45192 e!290920))

(assert (=> start!45192 true))

(declare-fun array_inv!11219 (array!32080) Bool)

(assert (=> start!45192 (array_inv!11219 a!3235)))

(declare-fun b!496000 () Bool)

(declare-fun res!298387 () Bool)

(assert (=> b!496000 (=> (not res!298387) (not e!290920))))

(declare-fun arrayContainsKey!0 (array!32080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496000 (= res!298387 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496001 () Bool)

(assert (=> b!496001 (= e!290918 true)))

(assert (=> b!496001 (and (bvslt (x!46806 lt!224538) #b01111111111111111111111111111110) (or (= (select (arr!15423 a!3235) (index!17741 lt!224538)) (select (arr!15423 a!3235) j!176)) (= (select (arr!15423 a!3235) (index!17741 lt!224538)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15423 a!3235) (index!17741 lt!224538)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45192 res!298382) b!495995))

(assert (= (and b!495995 res!298384) b!495992))

(assert (= (and b!495992 res!298385) b!495997))

(assert (= (and b!495997 res!298388) b!496000))

(assert (= (and b!496000 res!298387) b!495996))

(assert (= (and b!495996 res!298381) b!495993))

(assert (= (and b!495993 res!298386) b!495991))

(assert (= (and b!495991 res!298378) b!495999))

(assert (= (and b!495999 res!298379) b!495998))

(assert (= (and b!495999 (not res!298380)) b!495994))

(assert (= (and b!495994 (not res!298383)) b!496001))

(declare-fun m!477159 () Bool)

(assert (=> b!495998 m!477159))

(assert (=> b!495998 m!477159))

(declare-fun m!477161 () Bool)

(assert (=> b!495998 m!477161))

(declare-fun m!477163 () Bool)

(assert (=> b!496001 m!477163))

(assert (=> b!496001 m!477159))

(declare-fun m!477165 () Bool)

(assert (=> b!495991 m!477165))

(declare-fun m!477167 () Bool)

(assert (=> b!496000 m!477167))

(declare-fun m!477169 () Bool)

(assert (=> start!45192 m!477169))

(declare-fun m!477171 () Bool)

(assert (=> start!45192 m!477171))

(declare-fun m!477173 () Bool)

(assert (=> b!495999 m!477173))

(declare-fun m!477175 () Bool)

(assert (=> b!495999 m!477175))

(declare-fun m!477177 () Bool)

(assert (=> b!495999 m!477177))

(declare-fun m!477179 () Bool)

(assert (=> b!495999 m!477179))

(assert (=> b!495999 m!477173))

(assert (=> b!495999 m!477159))

(declare-fun m!477181 () Bool)

(assert (=> b!495999 m!477181))

(assert (=> b!495999 m!477159))

(declare-fun m!477183 () Bool)

(assert (=> b!495999 m!477183))

(assert (=> b!495999 m!477173))

(declare-fun m!477185 () Bool)

(assert (=> b!495999 m!477185))

(assert (=> b!495999 m!477159))

(declare-fun m!477187 () Bool)

(assert (=> b!495999 m!477187))

(declare-fun m!477189 () Bool)

(assert (=> b!495993 m!477189))

(assert (=> b!495992 m!477159))

(assert (=> b!495992 m!477159))

(declare-fun m!477191 () Bool)

(assert (=> b!495992 m!477191))

(declare-fun m!477193 () Bool)

(assert (=> b!495997 m!477193))

(declare-fun m!477195 () Bool)

(assert (=> b!495996 m!477195))

(push 1)

