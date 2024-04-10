; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32716 () Bool)

(assert start!32716)

(declare-fun b!327041 () Bool)

(declare-fun res!180075 () Bool)

(declare-fun e!201208 () Bool)

(assert (=> b!327041 (=> (not res!180075) (not e!201208))))

(declare-datatypes ((array!16753 0))(
  ( (array!16754 (arr!7931 (Array (_ BitVec 32) (_ BitVec 64))) (size!8283 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16753)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16753 (_ BitVec 32)) Bool)

(assert (=> b!327041 (= res!180075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327042 () Bool)

(declare-fun res!180072 () Bool)

(declare-fun e!201206 () Bool)

(assert (=> b!327042 (=> (not res!180072) (not e!201206))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!327042 (= res!180072 (and (= (select (arr!7931 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8283 a!3305))))))

(declare-fun b!327043 () Bool)

(declare-fun res!180076 () Bool)

(assert (=> b!327043 (=> (not res!180076) (not e!201208))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327043 (= res!180076 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!180073 () Bool)

(assert (=> start!32716 (=> (not res!180073) (not e!201208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32716 (= res!180073 (validMask!0 mask!3777))))

(assert (=> start!32716 e!201208))

(declare-fun array_inv!5894 (array!16753) Bool)

(assert (=> start!32716 (array_inv!5894 a!3305)))

(assert (=> start!32716 true))

(declare-fun b!327044 () Bool)

(declare-fun res!180079 () Bool)

(assert (=> b!327044 (=> (not res!180079) (not e!201208))))

(assert (=> b!327044 (= res!180079 (and (= (size!8283 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8283 a!3305))))))

(declare-fun b!327045 () Bool)

(declare-fun res!180081 () Bool)

(assert (=> b!327045 (=> (not res!180081) (not e!201208))))

(declare-datatypes ((SeekEntryResult!3062 0))(
  ( (MissingZero!3062 (index!14424 (_ BitVec 32))) (Found!3062 (index!14425 (_ BitVec 32))) (Intermediate!3062 (undefined!3874 Bool) (index!14426 (_ BitVec 32)) (x!32668 (_ BitVec 32))) (Undefined!3062) (MissingVacant!3062 (index!14427 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16753 (_ BitVec 32)) SeekEntryResult!3062)

(assert (=> b!327045 (= res!180081 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3062 i!1250)))))

(declare-fun b!327046 () Bool)

(declare-fun res!180080 () Bool)

(assert (=> b!327046 (=> (not res!180080) (not e!201208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327046 (= res!180080 (validKeyInArray!0 k!2497))))

(declare-fun b!327047 () Bool)

(assert (=> b!327047 (= e!201208 e!201206)))

(declare-fun res!180077 () Bool)

(assert (=> b!327047 (=> (not res!180077) (not e!201206))))

(declare-fun lt!157445 () SeekEntryResult!3062)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16753 (_ BitVec 32)) SeekEntryResult!3062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327047 (= res!180077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157445))))

(assert (=> b!327047 (= lt!157445 (Intermediate!3062 false resIndex!58 resX!58))))

(declare-fun b!327048 () Bool)

(declare-fun res!180074 () Bool)

(assert (=> b!327048 (=> (not res!180074) (not e!201206))))

(assert (=> b!327048 (= res!180074 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157445))))

(declare-fun b!327049 () Bool)

(declare-fun res!180078 () Bool)

(assert (=> b!327049 (=> (not res!180078) (not e!201206))))

(assert (=> b!327049 (= res!180078 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7931 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!327050 () Bool)

(assert (=> b!327050 (= e!201206 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10158 0))(
  ( (Unit!10159) )
))
(declare-fun lt!157446 () Unit!10158)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10158)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327050 (= lt!157446 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(assert (= (and start!32716 res!180073) b!327044))

(assert (= (and b!327044 res!180079) b!327046))

(assert (= (and b!327046 res!180080) b!327043))

(assert (= (and b!327043 res!180076) b!327045))

(assert (= (and b!327045 res!180081) b!327041))

(assert (= (and b!327041 res!180075) b!327047))

(assert (= (and b!327047 res!180077) b!327042))

(assert (= (and b!327042 res!180072) b!327048))

(assert (= (and b!327048 res!180074) b!327049))

(assert (= (and b!327049 res!180078) b!327050))

(declare-fun m!333509 () Bool)

(assert (=> start!32716 m!333509))

(declare-fun m!333511 () Bool)

(assert (=> start!32716 m!333511))

(declare-fun m!333513 () Bool)

(assert (=> b!327050 m!333513))

(assert (=> b!327050 m!333513))

(declare-fun m!333515 () Bool)

(assert (=> b!327050 m!333515))

(declare-fun m!333517 () Bool)

(assert (=> b!327045 m!333517))

(declare-fun m!333519 () Bool)

(assert (=> b!327046 m!333519))

(declare-fun m!333521 () Bool)

(assert (=> b!327049 m!333521))

(declare-fun m!333523 () Bool)

(assert (=> b!327048 m!333523))

(declare-fun m!333525 () Bool)

(assert (=> b!327043 m!333525))

(declare-fun m!333527 () Bool)

(assert (=> b!327047 m!333527))

(assert (=> b!327047 m!333527))

(declare-fun m!333529 () Bool)

(assert (=> b!327047 m!333529))

(declare-fun m!333531 () Bool)

(assert (=> b!327042 m!333531))

(declare-fun m!333533 () Bool)

(assert (=> b!327041 m!333533))

(push 1)

(assert (not b!327045))

(assert (not b!327046))

(assert (not b!327050))

(assert (not b!327043))

(assert (not b!327048))

(assert (not b!327041))

(assert (not b!327047))

(assert (not start!32716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

