; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45264 () Bool)

(assert start!45264)

(declare-datatypes ((array!32152 0))(
  ( (array!32153 (arr!15459 (Array (_ BitVec 32) (_ BitVec 64))) (size!15823 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32152)

(declare-fun e!291459 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!497179 () Bool)

(declare-datatypes ((SeekEntryResult!3926 0))(
  ( (MissingZero!3926 (index!17883 (_ BitVec 32))) (Found!3926 (index!17884 (_ BitVec 32))) (Intermediate!3926 (undefined!4738 Bool) (index!17885 (_ BitVec 32)) (x!46938 (_ BitVec 32))) (Undefined!3926) (MissingVacant!3926 (index!17886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32152 (_ BitVec 32)) SeekEntryResult!3926)

(assert (=> b!497179 (= e!291459 (= (seekEntryOrOpen!0 (select (arr!15459 a!3235) j!176) a!3235 mask!3524) (Found!3926 j!176)))))

(declare-fun b!497180 () Bool)

(declare-fun res!299566 () Bool)

(declare-fun e!291461 () Bool)

(assert (=> b!497180 (=> res!299566 e!291461)))

(declare-fun lt!225080 () SeekEntryResult!3926)

(assert (=> b!497180 (= res!299566 (or (undefined!4738 lt!225080) (not (is-Intermediate!3926 lt!225080))))))

(declare-fun b!497181 () Bool)

(declare-fun e!291462 () Bool)

(assert (=> b!497181 (= e!291462 (not e!291461))))

(declare-fun res!299570 () Bool)

(assert (=> b!497181 (=> res!299570 e!291461)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225079 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32152 (_ BitVec 32)) SeekEntryResult!3926)

(assert (=> b!497181 (= res!299570 (= lt!225080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225079 (select (store (arr!15459 a!3235) i!1204 k!2280) j!176) (array!32153 (store (arr!15459 a!3235) i!1204 k!2280) (size!15823 a!3235)) mask!3524)))))

(declare-fun lt!225082 () (_ BitVec 32))

(assert (=> b!497181 (= lt!225080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225082 (select (arr!15459 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497181 (= lt!225079 (toIndex!0 (select (store (arr!15459 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497181 (= lt!225082 (toIndex!0 (select (arr!15459 a!3235) j!176) mask!3524))))

(assert (=> b!497181 e!291459))

(declare-fun res!299576 () Bool)

(assert (=> b!497181 (=> (not res!299576) (not e!291459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32152 (_ BitVec 32)) Bool)

(assert (=> b!497181 (= res!299576 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14798 0))(
  ( (Unit!14799) )
))
(declare-fun lt!225081 () Unit!14798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14798)

(assert (=> b!497181 (= lt!225081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497182 () Bool)

(declare-fun res!299569 () Bool)

(declare-fun e!291458 () Bool)

(assert (=> b!497182 (=> (not res!299569) (not e!291458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497182 (= res!299569 (validKeyInArray!0 (select (arr!15459 a!3235) j!176)))))

(declare-fun b!497183 () Bool)

(declare-fun res!299567 () Bool)

(assert (=> b!497183 (=> (not res!299567) (not e!291458))))

(declare-fun arrayContainsKey!0 (array!32152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497183 (= res!299567 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!299573 () Bool)

(assert (=> start!45264 (=> (not res!299573) (not e!291458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45264 (= res!299573 (validMask!0 mask!3524))))

(assert (=> start!45264 e!291458))

(assert (=> start!45264 true))

(declare-fun array_inv!11255 (array!32152) Bool)

(assert (=> start!45264 (array_inv!11255 a!3235)))

(declare-fun b!497184 () Bool)

(assert (=> b!497184 (= e!291461 true)))

(assert (=> b!497184 (and (bvslt (x!46938 lt!225080) #b01111111111111111111111111111110) (or (= (select (arr!15459 a!3235) (index!17885 lt!225080)) (select (arr!15459 a!3235) j!176)) (= (select (arr!15459 a!3235) (index!17885 lt!225080)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15459 a!3235) (index!17885 lt!225080)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497185 () Bool)

(assert (=> b!497185 (= e!291458 e!291462)))

(declare-fun res!299572 () Bool)

(assert (=> b!497185 (=> (not res!299572) (not e!291462))))

(declare-fun lt!225078 () SeekEntryResult!3926)

(assert (=> b!497185 (= res!299572 (or (= lt!225078 (MissingZero!3926 i!1204)) (= lt!225078 (MissingVacant!3926 i!1204))))))

(assert (=> b!497185 (= lt!225078 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497186 () Bool)

(declare-fun res!299575 () Bool)

(assert (=> b!497186 (=> (not res!299575) (not e!291458))))

(assert (=> b!497186 (= res!299575 (validKeyInArray!0 k!2280))))

(declare-fun b!497187 () Bool)

(declare-fun res!299568 () Bool)

(assert (=> b!497187 (=> (not res!299568) (not e!291462))))

(declare-datatypes ((List!9617 0))(
  ( (Nil!9614) (Cons!9613 (h!10484 (_ BitVec 64)) (t!15845 List!9617)) )
))
(declare-fun arrayNoDuplicates!0 (array!32152 (_ BitVec 32) List!9617) Bool)

(assert (=> b!497187 (= res!299568 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9614))))

(declare-fun b!497188 () Bool)

(declare-fun res!299571 () Bool)

(assert (=> b!497188 (=> (not res!299571) (not e!291462))))

(assert (=> b!497188 (= res!299571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497189 () Bool)

(declare-fun res!299574 () Bool)

(assert (=> b!497189 (=> (not res!299574) (not e!291458))))

(assert (=> b!497189 (= res!299574 (and (= (size!15823 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15823 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15823 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45264 res!299573) b!497189))

(assert (= (and b!497189 res!299574) b!497182))

(assert (= (and b!497182 res!299569) b!497186))

(assert (= (and b!497186 res!299575) b!497183))

(assert (= (and b!497183 res!299567) b!497185))

(assert (= (and b!497185 res!299572) b!497188))

(assert (= (and b!497188 res!299571) b!497187))

(assert (= (and b!497187 res!299568) b!497181))

(assert (= (and b!497181 res!299576) b!497179))

(assert (= (and b!497181 (not res!299570)) b!497180))

(assert (= (and b!497180 (not res!299566)) b!497184))

(declare-fun m!478527 () Bool)

(assert (=> b!497181 m!478527))

(declare-fun m!478529 () Bool)

(assert (=> b!497181 m!478529))

(declare-fun m!478531 () Bool)

(assert (=> b!497181 m!478531))

(declare-fun m!478533 () Bool)

(assert (=> b!497181 m!478533))

(declare-fun m!478535 () Bool)

(assert (=> b!497181 m!478535))

(assert (=> b!497181 m!478527))

(declare-fun m!478537 () Bool)

(assert (=> b!497181 m!478537))

(assert (=> b!497181 m!478527))

(declare-fun m!478539 () Bool)

(assert (=> b!497181 m!478539))

(assert (=> b!497181 m!478535))

(declare-fun m!478541 () Bool)

(assert (=> b!497181 m!478541))

(assert (=> b!497181 m!478535))

(declare-fun m!478543 () Bool)

(assert (=> b!497181 m!478543))

(declare-fun m!478545 () Bool)

(assert (=> b!497186 m!478545))

(assert (=> b!497182 m!478527))

(assert (=> b!497182 m!478527))

(declare-fun m!478547 () Bool)

(assert (=> b!497182 m!478547))

(declare-fun m!478549 () Bool)

(assert (=> b!497184 m!478549))

(assert (=> b!497184 m!478527))

(declare-fun m!478551 () Bool)

(assert (=> start!45264 m!478551))

(declare-fun m!478553 () Bool)

(assert (=> start!45264 m!478553))

(declare-fun m!478555 () Bool)

(assert (=> b!497188 m!478555))

(declare-fun m!478557 () Bool)

(assert (=> b!497183 m!478557))

(declare-fun m!478559 () Bool)

(assert (=> b!497185 m!478559))

(declare-fun m!478561 () Bool)

(assert (=> b!497187 m!478561))

(assert (=> b!497179 m!478527))

(assert (=> b!497179 m!478527))

(declare-fun m!478563 () Bool)

(assert (=> b!497179 m!478563))

(push 1)

(assert (not b!497188))

(assert (not start!45264))

(assert (not b!497187))

(assert (not b!497179))

(assert (not b!497182))

(assert (not b!497183))

(assert (not b!497181))

(assert (not b!497185))

(assert (not b!497186))

(check-sat)

