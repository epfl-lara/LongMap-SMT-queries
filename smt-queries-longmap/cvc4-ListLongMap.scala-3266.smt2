; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45472 () Bool)

(assert start!45472)

(declare-fun b!500583 () Bool)

(declare-fun e!293286 () Bool)

(declare-fun e!293285 () Bool)

(assert (=> b!500583 (= e!293286 e!293285)))

(declare-fun res!302405 () Bool)

(assert (=> b!500583 (=> res!302405 e!293285)))

(declare-fun lt!227209 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3997 0))(
  ( (MissingZero!3997 (index!18170 (_ BitVec 32))) (Found!3997 (index!18171 (_ BitVec 32))) (Intermediate!3997 (undefined!4809 Bool) (index!18172 (_ BitVec 32)) (x!47202 (_ BitVec 32))) (Undefined!3997) (MissingVacant!3997 (index!18173 (_ BitVec 32))) )
))
(declare-fun lt!227214 () SeekEntryResult!3997)

(declare-datatypes ((array!32297 0))(
  ( (array!32298 (arr!15530 (Array (_ BitVec 32) (_ BitVec 64))) (size!15894 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32297)

(assert (=> b!500583 (= res!302405 (or (bvsgt #b00000000000000000000000000000000 (x!47202 lt!227214)) (bvsgt (x!47202 lt!227214) #b01111111111111111111111111111110) (bvslt lt!227209 #b00000000000000000000000000000000) (bvsge lt!227209 (size!15894 a!3235)) (bvslt (index!18172 lt!227214) #b00000000000000000000000000000000) (bvsge (index!18172 lt!227214) (size!15894 a!3235)) (not (= lt!227214 (Intermediate!3997 false (index!18172 lt!227214) (x!47202 lt!227214))))))))

(assert (=> b!500583 (and (or (= (select (arr!15530 a!3235) (index!18172 lt!227214)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15530 a!3235) (index!18172 lt!227214)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15530 a!3235) (index!18172 lt!227214)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15530 a!3235) (index!18172 lt!227214)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15064 0))(
  ( (Unit!15065) )
))
(declare-fun lt!227211 () Unit!15064)

(declare-fun e!293281 () Unit!15064)

(assert (=> b!500583 (= lt!227211 e!293281)))

(declare-fun c!59372 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500583 (= c!59372 (= (select (arr!15530 a!3235) (index!18172 lt!227214)) (select (arr!15530 a!3235) j!176)))))

(assert (=> b!500583 (and (bvslt (x!47202 lt!227214) #b01111111111111111111111111111110) (or (= (select (arr!15530 a!3235) (index!18172 lt!227214)) (select (arr!15530 a!3235) j!176)) (= (select (arr!15530 a!3235) (index!18172 lt!227214)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15530 a!3235) (index!18172 lt!227214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500584 () Bool)

(declare-fun res!302393 () Bool)

(declare-fun e!293279 () Bool)

(assert (=> b!500584 (=> (not res!302393) (not e!293279))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500584 (= res!302393 (validKeyInArray!0 k!2280))))

(declare-fun b!500585 () Bool)

(declare-fun Unit!15066 () Unit!15064)

(assert (=> b!500585 (= e!293281 Unit!15066)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!227212 () Unit!15064)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15064)

(assert (=> b!500585 (= lt!227212 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227209 #b00000000000000000000000000000000 (index!18172 lt!227214) (x!47202 lt!227214) mask!3524))))

(declare-fun res!302399 () Bool)

(declare-fun lt!227217 () (_ BitVec 64))

(declare-fun lt!227218 () array!32297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32297 (_ BitVec 32)) SeekEntryResult!3997)

(assert (=> b!500585 (= res!302399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227209 lt!227217 lt!227218 mask!3524) (Intermediate!3997 false (index!18172 lt!227214) (x!47202 lt!227214))))))

(declare-fun e!293284 () Bool)

(assert (=> b!500585 (=> (not res!302399) (not e!293284))))

(assert (=> b!500585 e!293284))

(declare-fun b!500586 () Bool)

(declare-fun res!302396 () Bool)

(declare-fun e!293280 () Bool)

(assert (=> b!500586 (=> (not res!302396) (not e!293280))))

(declare-datatypes ((List!9688 0))(
  ( (Nil!9685) (Cons!9684 (h!10558 (_ BitVec 64)) (t!15916 List!9688)) )
))
(declare-fun arrayNoDuplicates!0 (array!32297 (_ BitVec 32) List!9688) Bool)

(assert (=> b!500586 (= res!302396 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9685))))

(declare-fun b!500587 () Bool)

(declare-fun res!302403 () Bool)

(assert (=> b!500587 (=> (not res!302403) (not e!293279))))

(assert (=> b!500587 (= res!302403 (and (= (size!15894 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15894 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15894 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500588 () Bool)

(declare-fun e!293283 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32297 (_ BitVec 32)) SeekEntryResult!3997)

(assert (=> b!500588 (= e!293283 (= (seekEntryOrOpen!0 (select (arr!15530 a!3235) j!176) a!3235 mask!3524) (Found!3997 j!176)))))

(declare-fun b!500589 () Bool)

(declare-fun res!302394 () Bool)

(assert (=> b!500589 (=> (not res!302394) (not e!293280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32297 (_ BitVec 32)) Bool)

(assert (=> b!500589 (= res!302394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500590 () Bool)

(assert (=> b!500590 (= e!293280 (not e!293286))))

(declare-fun res!302395 () Bool)

(assert (=> b!500590 (=> res!302395 e!293286)))

(declare-fun lt!227210 () (_ BitVec 32))

(assert (=> b!500590 (= res!302395 (= lt!227214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227210 lt!227217 lt!227218 mask!3524)))))

(assert (=> b!500590 (= lt!227214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227209 (select (arr!15530 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500590 (= lt!227210 (toIndex!0 lt!227217 mask!3524))))

(assert (=> b!500590 (= lt!227217 (select (store (arr!15530 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500590 (= lt!227209 (toIndex!0 (select (arr!15530 a!3235) j!176) mask!3524))))

(assert (=> b!500590 (= lt!227218 (array!32298 (store (arr!15530 a!3235) i!1204 k!2280) (size!15894 a!3235)))))

(assert (=> b!500590 e!293283))

(declare-fun res!302398 () Bool)

(assert (=> b!500590 (=> (not res!302398) (not e!293283))))

(assert (=> b!500590 (= res!302398 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227213 () Unit!15064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15064)

(assert (=> b!500590 (= lt!227213 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500591 () Bool)

(assert (=> b!500591 (= e!293279 e!293280)))

(declare-fun res!302404 () Bool)

(assert (=> b!500591 (=> (not res!302404) (not e!293280))))

(declare-fun lt!227215 () SeekEntryResult!3997)

(assert (=> b!500591 (= res!302404 (or (= lt!227215 (MissingZero!3997 i!1204)) (= lt!227215 (MissingVacant!3997 i!1204))))))

(assert (=> b!500591 (= lt!227215 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500592 () Bool)

(assert (=> b!500592 (= e!293284 false)))

(declare-fun b!500593 () Bool)

(declare-fun res!302401 () Bool)

(assert (=> b!500593 (=> (not res!302401) (not e!293279))))

(declare-fun arrayContainsKey!0 (array!32297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500593 (= res!302401 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500594 () Bool)

(assert (=> b!500594 (= e!293285 true)))

(declare-fun lt!227216 () SeekEntryResult!3997)

(assert (=> b!500594 (= lt!227216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227209 lt!227217 lt!227218 mask!3524))))

(declare-fun b!500596 () Bool)

(declare-fun res!302397 () Bool)

(assert (=> b!500596 (=> (not res!302397) (not e!293279))))

(assert (=> b!500596 (= res!302397 (validKeyInArray!0 (select (arr!15530 a!3235) j!176)))))

(declare-fun b!500597 () Bool)

(declare-fun res!302402 () Bool)

(assert (=> b!500597 (=> res!302402 e!293286)))

(assert (=> b!500597 (= res!302402 (or (undefined!4809 lt!227214) (not (is-Intermediate!3997 lt!227214))))))

(declare-fun b!500595 () Bool)

(declare-fun Unit!15067 () Unit!15064)

(assert (=> b!500595 (= e!293281 Unit!15067)))

(declare-fun res!302400 () Bool)

(assert (=> start!45472 (=> (not res!302400) (not e!293279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45472 (= res!302400 (validMask!0 mask!3524))))

(assert (=> start!45472 e!293279))

(assert (=> start!45472 true))

(declare-fun array_inv!11326 (array!32297) Bool)

(assert (=> start!45472 (array_inv!11326 a!3235)))

(assert (= (and start!45472 res!302400) b!500587))

(assert (= (and b!500587 res!302403) b!500596))

(assert (= (and b!500596 res!302397) b!500584))

(assert (= (and b!500584 res!302393) b!500593))

(assert (= (and b!500593 res!302401) b!500591))

(assert (= (and b!500591 res!302404) b!500589))

(assert (= (and b!500589 res!302394) b!500586))

(assert (= (and b!500586 res!302396) b!500590))

(assert (= (and b!500590 res!302398) b!500588))

(assert (= (and b!500590 (not res!302395)) b!500597))

(assert (= (and b!500597 (not res!302402)) b!500583))

(assert (= (and b!500583 c!59372) b!500585))

(assert (= (and b!500583 (not c!59372)) b!500595))

(assert (= (and b!500585 res!302399) b!500592))

(assert (= (and b!500583 (not res!302405)) b!500594))

(declare-fun m!481707 () Bool)

(assert (=> b!500589 m!481707))

(declare-fun m!481709 () Bool)

(assert (=> b!500586 m!481709))

(declare-fun m!481711 () Bool)

(assert (=> b!500596 m!481711))

(assert (=> b!500596 m!481711))

(declare-fun m!481713 () Bool)

(assert (=> b!500596 m!481713))

(declare-fun m!481715 () Bool)

(assert (=> b!500593 m!481715))

(declare-fun m!481717 () Bool)

(assert (=> b!500594 m!481717))

(declare-fun m!481719 () Bool)

(assert (=> b!500585 m!481719))

(assert (=> b!500585 m!481717))

(declare-fun m!481721 () Bool)

(assert (=> b!500584 m!481721))

(declare-fun m!481723 () Bool)

(assert (=> b!500590 m!481723))

(declare-fun m!481725 () Bool)

(assert (=> b!500590 m!481725))

(declare-fun m!481727 () Bool)

(assert (=> b!500590 m!481727))

(declare-fun m!481729 () Bool)

(assert (=> b!500590 m!481729))

(assert (=> b!500590 m!481711))

(declare-fun m!481731 () Bool)

(assert (=> b!500590 m!481731))

(assert (=> b!500590 m!481711))

(declare-fun m!481733 () Bool)

(assert (=> b!500590 m!481733))

(assert (=> b!500590 m!481711))

(declare-fun m!481735 () Bool)

(assert (=> b!500590 m!481735))

(declare-fun m!481737 () Bool)

(assert (=> b!500590 m!481737))

(assert (=> b!500588 m!481711))

(assert (=> b!500588 m!481711))

(declare-fun m!481739 () Bool)

(assert (=> b!500588 m!481739))

(declare-fun m!481741 () Bool)

(assert (=> b!500583 m!481741))

(assert (=> b!500583 m!481711))

(declare-fun m!481743 () Bool)

(assert (=> b!500591 m!481743))

(declare-fun m!481745 () Bool)

(assert (=> start!45472 m!481745))

(declare-fun m!481747 () Bool)

(assert (=> start!45472 m!481747))

(push 1)

(assert (not b!500584))

(assert (not start!45472))

(assert (not b!500585))

(assert (not b!500594))

(assert (not b!500586))

(assert (not b!500590))

(assert (not b!500588))

(assert (not b!500589))

(assert (not b!500591))

(assert (not b!500596))

(assert (not b!500593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

