; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45730 () Bool)

(assert start!45730)

(declare-fun b!505543 () Bool)

(declare-fun e!295938 () Bool)

(declare-fun e!295941 () Bool)

(assert (=> b!505543 (= e!295938 e!295941)))

(declare-fun res!306600 () Bool)

(assert (=> b!505543 (=> res!306600 e!295941)))

(declare-datatypes ((SeekEntryResult!4090 0))(
  ( (MissingZero!4090 (index!18548 (_ BitVec 32))) (Found!4090 (index!18549 (_ BitVec 32))) (Intermediate!4090 (undefined!4902 Bool) (index!18550 (_ BitVec 32)) (x!47555 (_ BitVec 32))) (Undefined!4090) (MissingVacant!4090 (index!18551 (_ BitVec 32))) )
))
(declare-fun lt!230447 () SeekEntryResult!4090)

(declare-fun lt!230444 () (_ BitVec 32))

(declare-datatypes ((array!32486 0))(
  ( (array!32487 (arr!15623 (Array (_ BitVec 32) (_ BitVec 64))) (size!15987 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32486)

(assert (=> b!505543 (= res!306600 (or (bvsgt (x!47555 lt!230447) #b01111111111111111111111111111110) (bvslt lt!230444 #b00000000000000000000000000000000) (bvsge lt!230444 (size!15987 a!3235)) (bvslt (index!18550 lt!230447) #b00000000000000000000000000000000) (bvsge (index!18550 lt!230447) (size!15987 a!3235)) (not (= lt!230447 (Intermediate!4090 false (index!18550 lt!230447) (x!47555 lt!230447))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505543 (= (index!18550 lt!230447) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!15436 0))(
  ( (Unit!15437) )
))
(declare-fun lt!230446 () Unit!15436)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15436)

(assert (=> b!505543 (= lt!230446 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230444 #b00000000000000000000000000000000 (index!18550 lt!230447) (x!47555 lt!230447) mask!3524))))

(assert (=> b!505543 (and (or (= (select (arr!15623 a!3235) (index!18550 lt!230447)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15623 a!3235) (index!18550 lt!230447)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15623 a!3235) (index!18550 lt!230447)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15623 a!3235) (index!18550 lt!230447)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230448 () Unit!15436)

(declare-fun e!295937 () Unit!15436)

(assert (=> b!505543 (= lt!230448 e!295937)))

(declare-fun c!59753 () Bool)

(assert (=> b!505543 (= c!59753 (= (select (arr!15623 a!3235) (index!18550 lt!230447)) (select (arr!15623 a!3235) j!176)))))

(assert (=> b!505543 (and (bvslt (x!47555 lt!230447) #b01111111111111111111111111111110) (or (= (select (arr!15623 a!3235) (index!18550 lt!230447)) (select (arr!15623 a!3235) j!176)) (= (select (arr!15623 a!3235) (index!18550 lt!230447)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15623 a!3235) (index!18550 lt!230447)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505544 () Bool)

(assert (=> b!505544 (= e!295941 true)))

(declare-fun lt!230442 () (_ BitVec 64))

(declare-fun lt!230449 () SeekEntryResult!4090)

(declare-fun lt!230437 () array!32486)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32486 (_ BitVec 32)) SeekEntryResult!4090)

(assert (=> b!505544 (= (seekEntryOrOpen!0 lt!230442 lt!230437 mask!3524) lt!230449)))

(declare-fun lt!230445 () Unit!15436)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15436)

(assert (=> b!505544 (= lt!230445 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230444 #b00000000000000000000000000000000 (index!18550 lt!230447) (x!47555 lt!230447) mask!3524))))

(declare-fun b!505545 () Bool)

(declare-fun res!306604 () Bool)

(declare-fun e!295944 () Bool)

(assert (=> b!505545 (=> (not res!306604) (not e!295944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32486 (_ BitVec 32)) Bool)

(assert (=> b!505545 (= res!306604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!306603 () Bool)

(declare-fun e!295936 () Bool)

(assert (=> start!45730 (=> (not res!306603) (not e!295936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45730 (= res!306603 (validMask!0 mask!3524))))

(assert (=> start!45730 e!295936))

(assert (=> start!45730 true))

(declare-fun array_inv!11419 (array!32486) Bool)

(assert (=> start!45730 (array_inv!11419 a!3235)))

(declare-fun b!505546 () Bool)

(declare-fun res!306594 () Bool)

(assert (=> b!505546 (=> (not res!306594) (not e!295936))))

(assert (=> b!505546 (= res!306594 (and (= (size!15987 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15987 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15987 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505547 () Bool)

(assert (=> b!505547 (= e!295936 e!295944)))

(declare-fun res!306595 () Bool)

(assert (=> b!505547 (=> (not res!306595) (not e!295944))))

(declare-fun lt!230438 () SeekEntryResult!4090)

(assert (=> b!505547 (= res!306595 (or (= lt!230438 (MissingZero!4090 i!1204)) (= lt!230438 (MissingVacant!4090 i!1204))))))

(assert (=> b!505547 (= lt!230438 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505548 () Bool)

(declare-fun res!306605 () Bool)

(assert (=> b!505548 (=> (not res!306605) (not e!295936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505548 (= res!306605 (validKeyInArray!0 (select (arr!15623 a!3235) j!176)))))

(declare-fun b!505549 () Bool)

(declare-fun Unit!15438 () Unit!15436)

(assert (=> b!505549 (= e!295937 Unit!15438)))

(declare-fun e!295939 () Bool)

(declare-fun b!505550 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32486 (_ BitVec 32)) SeekEntryResult!4090)

(assert (=> b!505550 (= e!295939 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230444 (index!18550 lt!230447) (select (arr!15623 a!3235) j!176) a!3235 mask!3524) lt!230449)))))

(declare-fun b!505551 () Bool)

(declare-fun res!306596 () Bool)

(assert (=> b!505551 (=> (not res!306596) (not e!295936))))

(assert (=> b!505551 (= res!306596 (validKeyInArray!0 k!2280))))

(declare-fun b!505552 () Bool)

(declare-fun e!295940 () Bool)

(assert (=> b!505552 (= e!295940 (= (seekEntryOrOpen!0 (select (arr!15623 a!3235) j!176) a!3235 mask!3524) (Found!4090 j!176)))))

(declare-fun b!505553 () Bool)

(declare-fun res!306599 () Bool)

(assert (=> b!505553 (=> (not res!306599) (not e!295944))))

(declare-datatypes ((List!9781 0))(
  ( (Nil!9778) (Cons!9777 (h!10654 (_ BitVec 64)) (t!16009 List!9781)) )
))
(declare-fun arrayNoDuplicates!0 (array!32486 (_ BitVec 32) List!9781) Bool)

(assert (=> b!505553 (= res!306599 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9778))))

(declare-fun b!505554 () Bool)

(assert (=> b!505554 (= e!295944 (not e!295938))))

(declare-fun res!306606 () Bool)

(assert (=> b!505554 (=> res!306606 e!295938)))

(declare-fun lt!230441 () SeekEntryResult!4090)

(assert (=> b!505554 (= res!306606 (or (= lt!230447 lt!230441) (undefined!4902 lt!230447) (not (is-Intermediate!4090 lt!230447))))))

(declare-fun lt!230439 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32486 (_ BitVec 32)) SeekEntryResult!4090)

(assert (=> b!505554 (= lt!230441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230439 lt!230442 lt!230437 mask!3524))))

(assert (=> b!505554 (= lt!230447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230444 (select (arr!15623 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505554 (= lt!230439 (toIndex!0 lt!230442 mask!3524))))

(assert (=> b!505554 (= lt!230442 (select (store (arr!15623 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505554 (= lt!230444 (toIndex!0 (select (arr!15623 a!3235) j!176) mask!3524))))

(assert (=> b!505554 (= lt!230437 (array!32487 (store (arr!15623 a!3235) i!1204 k!2280) (size!15987 a!3235)))))

(assert (=> b!505554 (= lt!230449 (Found!4090 j!176))))

(assert (=> b!505554 e!295940))

(declare-fun res!306597 () Bool)

(assert (=> b!505554 (=> (not res!306597) (not e!295940))))

(assert (=> b!505554 (= res!306597 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230440 () Unit!15436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15436)

(assert (=> b!505554 (= lt!230440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505555 () Bool)

(declare-fun res!306601 () Bool)

(assert (=> b!505555 (=> res!306601 e!295941)))

(assert (=> b!505555 (= res!306601 e!295939)))

(declare-fun res!306602 () Bool)

(assert (=> b!505555 (=> (not res!306602) (not e!295939))))

(assert (=> b!505555 (= res!306602 (bvsgt #b00000000000000000000000000000000 (x!47555 lt!230447)))))

(declare-fun b!505556 () Bool)

(declare-fun res!306608 () Bool)

(assert (=> b!505556 (=> (not res!306608) (not e!295936))))

(declare-fun arrayContainsKey!0 (array!32486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505556 (= res!306608 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505557 () Bool)

(declare-fun Unit!15439 () Unit!15436)

(assert (=> b!505557 (= e!295937 Unit!15439)))

(declare-fun lt!230443 () Unit!15436)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15436)

(assert (=> b!505557 (= lt!230443 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230444 #b00000000000000000000000000000000 (index!18550 lt!230447) (x!47555 lt!230447) mask!3524))))

(declare-fun res!306598 () Bool)

(assert (=> b!505557 (= res!306598 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230444 lt!230442 lt!230437 mask!3524) (Intermediate!4090 false (index!18550 lt!230447) (x!47555 lt!230447))))))

(declare-fun e!295943 () Bool)

(assert (=> b!505557 (=> (not res!306598) (not e!295943))))

(assert (=> b!505557 e!295943))

(declare-fun b!505558 () Bool)

(declare-fun res!306607 () Bool)

(assert (=> b!505558 (=> res!306607 e!295941)))

(assert (=> b!505558 (= res!306607 (not (= lt!230441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230444 lt!230442 lt!230437 mask!3524))))))

(declare-fun b!505559 () Bool)

(assert (=> b!505559 (= e!295943 false)))

(assert (= (and start!45730 res!306603) b!505546))

(assert (= (and b!505546 res!306594) b!505548))

(assert (= (and b!505548 res!306605) b!505551))

(assert (= (and b!505551 res!306596) b!505556))

(assert (= (and b!505556 res!306608) b!505547))

(assert (= (and b!505547 res!306595) b!505545))

(assert (= (and b!505545 res!306604) b!505553))

(assert (= (and b!505553 res!306599) b!505554))

(assert (= (and b!505554 res!306597) b!505552))

(assert (= (and b!505554 (not res!306606)) b!505543))

(assert (= (and b!505543 c!59753) b!505557))

(assert (= (and b!505543 (not c!59753)) b!505549))

(assert (= (and b!505557 res!306598) b!505559))

(assert (= (and b!505543 (not res!306600)) b!505555))

(assert (= (and b!505555 res!306602) b!505550))

(assert (= (and b!505555 (not res!306601)) b!505558))

(assert (= (and b!505558 (not res!306607)) b!505544))

(declare-fun m!486205 () Bool)

(assert (=> b!505543 m!486205))

(declare-fun m!486207 () Bool)

(assert (=> b!505543 m!486207))

(declare-fun m!486209 () Bool)

(assert (=> b!505543 m!486209))

(assert (=> b!505548 m!486209))

(assert (=> b!505548 m!486209))

(declare-fun m!486211 () Bool)

(assert (=> b!505548 m!486211))

(assert (=> b!505552 m!486209))

(assert (=> b!505552 m!486209))

(declare-fun m!486213 () Bool)

(assert (=> b!505552 m!486213))

(declare-fun m!486215 () Bool)

(assert (=> b!505556 m!486215))

(declare-fun m!486217 () Bool)

(assert (=> b!505544 m!486217))

(declare-fun m!486219 () Bool)

(assert (=> b!505544 m!486219))

(declare-fun m!486221 () Bool)

(assert (=> b!505553 m!486221))

(declare-fun m!486223 () Bool)

(assert (=> b!505547 m!486223))

(declare-fun m!486225 () Bool)

(assert (=> b!505558 m!486225))

(declare-fun m!486227 () Bool)

(assert (=> b!505557 m!486227))

(assert (=> b!505557 m!486225))

(declare-fun m!486229 () Bool)

(assert (=> b!505551 m!486229))

(declare-fun m!486231 () Bool)

(assert (=> b!505554 m!486231))

(declare-fun m!486233 () Bool)

(assert (=> b!505554 m!486233))

(declare-fun m!486235 () Bool)

(assert (=> b!505554 m!486235))

(declare-fun m!486237 () Bool)

(assert (=> b!505554 m!486237))

(assert (=> b!505554 m!486209))

(declare-fun m!486239 () Bool)

(assert (=> b!505554 m!486239))

(declare-fun m!486241 () Bool)

(assert (=> b!505554 m!486241))

(assert (=> b!505554 m!486209))

(declare-fun m!486243 () Bool)

(assert (=> b!505554 m!486243))

(declare-fun m!486245 () Bool)

(assert (=> b!505554 m!486245))

(assert (=> b!505554 m!486209))

(declare-fun m!486247 () Bool)

(assert (=> start!45730 m!486247))

(declare-fun m!486249 () Bool)

(assert (=> start!45730 m!486249))

(assert (=> b!505550 m!486209))

(assert (=> b!505550 m!486209))

(declare-fun m!486251 () Bool)

(assert (=> b!505550 m!486251))

(declare-fun m!486253 () Bool)

(assert (=> b!505545 m!486253))

(push 1)

