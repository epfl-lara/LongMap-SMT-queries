; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45734 () Bool)

(assert start!45734)

(declare-fun b!505645 () Bool)

(declare-fun res!306692 () Bool)

(declare-fun e!295996 () Bool)

(assert (=> b!505645 (=> (not res!306692) (not e!295996))))

(declare-datatypes ((array!32490 0))(
  ( (array!32491 (arr!15625 (Array (_ BitVec 32) (_ BitVec 64))) (size!15989 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32490)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505645 (= res!306692 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!306689 () Bool)

(assert (=> start!45734 (=> (not res!306689) (not e!295996))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45734 (= res!306689 (validMask!0 mask!3524))))

(assert (=> start!45734 e!295996))

(assert (=> start!45734 true))

(declare-fun array_inv!11421 (array!32490) Bool)

(assert (=> start!45734 (array_inv!11421 a!3235)))

(declare-fun b!505646 () Bool)

(declare-fun res!306690 () Bool)

(declare-fun e!295997 () Bool)

(assert (=> b!505646 (=> res!306690 e!295997)))

(declare-fun lt!230523 () array!32490)

(declare-fun lt!230516 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4092 0))(
  ( (MissingZero!4092 (index!18556 (_ BitVec 32))) (Found!4092 (index!18557 (_ BitVec 32))) (Intermediate!4092 (undefined!4904 Bool) (index!18558 (_ BitVec 32)) (x!47565 (_ BitVec 32))) (Undefined!4092) (MissingVacant!4092 (index!18559 (_ BitVec 32))) )
))
(declare-fun lt!230519 () SeekEntryResult!4092)

(declare-fun lt!230524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32490 (_ BitVec 32)) SeekEntryResult!4092)

(assert (=> b!505646 (= res!306690 (not (= lt!230519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230516 lt!230524 lt!230523 mask!3524))))))

(declare-fun b!505647 () Bool)

(declare-fun res!306698 () Bool)

(assert (=> b!505647 (=> (not res!306698) (not e!295996))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505647 (= res!306698 (validKeyInArray!0 (select (arr!15625 a!3235) j!176)))))

(declare-fun b!505648 () Bool)

(declare-fun e!295990 () Bool)

(assert (=> b!505648 (= e!295990 e!295997)))

(declare-fun res!306693 () Bool)

(assert (=> b!505648 (=> res!306693 e!295997)))

(declare-fun lt!230520 () SeekEntryResult!4092)

(assert (=> b!505648 (= res!306693 (or (bvsgt (x!47565 lt!230520) #b01111111111111111111111111111110) (bvslt lt!230516 #b00000000000000000000000000000000) (bvsge lt!230516 (size!15989 a!3235)) (bvslt (index!18558 lt!230520) #b00000000000000000000000000000000) (bvsge (index!18558 lt!230520) (size!15989 a!3235)) (not (= lt!230520 (Intermediate!4092 false (index!18558 lt!230520) (x!47565 lt!230520))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505648 (= (index!18558 lt!230520) i!1204)))

(declare-datatypes ((Unit!15444 0))(
  ( (Unit!15445) )
))
(declare-fun lt!230527 () Unit!15444)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15444)

(assert (=> b!505648 (= lt!230527 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230516 #b00000000000000000000000000000000 (index!18558 lt!230520) (x!47565 lt!230520) mask!3524))))

(assert (=> b!505648 (and (or (= (select (arr!15625 a!3235) (index!18558 lt!230520)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15625 a!3235) (index!18558 lt!230520)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15625 a!3235) (index!18558 lt!230520)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15625 a!3235) (index!18558 lt!230520)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230515 () Unit!15444)

(declare-fun e!295995 () Unit!15444)

(assert (=> b!505648 (= lt!230515 e!295995)))

(declare-fun c!59759 () Bool)

(assert (=> b!505648 (= c!59759 (= (select (arr!15625 a!3235) (index!18558 lt!230520)) (select (arr!15625 a!3235) j!176)))))

(assert (=> b!505648 (and (bvslt (x!47565 lt!230520) #b01111111111111111111111111111110) (or (= (select (arr!15625 a!3235) (index!18558 lt!230520)) (select (arr!15625 a!3235) j!176)) (= (select (arr!15625 a!3235) (index!18558 lt!230520)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15625 a!3235) (index!18558 lt!230520)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!295991 () Bool)

(declare-fun b!505649 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32490 (_ BitVec 32)) SeekEntryResult!4092)

(assert (=> b!505649 (= e!295991 (= (seekEntryOrOpen!0 (select (arr!15625 a!3235) j!176) a!3235 mask!3524) (Found!4092 j!176)))))

(declare-fun b!505650 () Bool)

(declare-fun res!306688 () Bool)

(declare-fun e!295998 () Bool)

(assert (=> b!505650 (=> (not res!306688) (not e!295998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32490 (_ BitVec 32)) Bool)

(assert (=> b!505650 (= res!306688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505651 () Bool)

(assert (=> b!505651 (= e!295997 true)))

(declare-fun lt!230525 () SeekEntryResult!4092)

(assert (=> b!505651 (= (seekEntryOrOpen!0 lt!230524 lt!230523 mask!3524) lt!230525)))

(declare-fun lt!230518 () Unit!15444)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15444)

(assert (=> b!505651 (= lt!230518 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230516 #b00000000000000000000000000000000 (index!18558 lt!230520) (x!47565 lt!230520) mask!3524))))

(declare-fun b!505652 () Bool)

(declare-fun res!306685 () Bool)

(assert (=> b!505652 (=> (not res!306685) (not e!295998))))

(declare-datatypes ((List!9783 0))(
  ( (Nil!9780) (Cons!9779 (h!10656 (_ BitVec 64)) (t!16011 List!9783)) )
))
(declare-fun arrayNoDuplicates!0 (array!32490 (_ BitVec 32) List!9783) Bool)

(assert (=> b!505652 (= res!306685 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9780))))

(declare-fun b!505653 () Bool)

(assert (=> b!505653 (= e!295998 (not e!295990))))

(declare-fun res!306684 () Bool)

(assert (=> b!505653 (=> res!306684 e!295990)))

(get-info :version)

(assert (=> b!505653 (= res!306684 (or (= lt!230520 lt!230519) (undefined!4904 lt!230520) (not ((_ is Intermediate!4092) lt!230520))))))

(declare-fun lt!230522 () (_ BitVec 32))

(assert (=> b!505653 (= lt!230519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230522 lt!230524 lt!230523 mask!3524))))

(assert (=> b!505653 (= lt!230520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230516 (select (arr!15625 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505653 (= lt!230522 (toIndex!0 lt!230524 mask!3524))))

(assert (=> b!505653 (= lt!230524 (select (store (arr!15625 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505653 (= lt!230516 (toIndex!0 (select (arr!15625 a!3235) j!176) mask!3524))))

(assert (=> b!505653 (= lt!230523 (array!32491 (store (arr!15625 a!3235) i!1204 k0!2280) (size!15989 a!3235)))))

(assert (=> b!505653 (= lt!230525 (Found!4092 j!176))))

(assert (=> b!505653 e!295991))

(declare-fun res!306687 () Bool)

(assert (=> b!505653 (=> (not res!306687) (not e!295991))))

(assert (=> b!505653 (= res!306687 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230517 () Unit!15444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15444)

(assert (=> b!505653 (= lt!230517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505654 () Bool)

(declare-fun e!295992 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32490 (_ BitVec 32)) SeekEntryResult!4092)

(assert (=> b!505654 (= e!295992 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230516 (index!18558 lt!230520) (select (arr!15625 a!3235) j!176) a!3235 mask!3524) lt!230525)))))

(declare-fun b!505655 () Bool)

(declare-fun res!306691 () Bool)

(assert (=> b!505655 (=> res!306691 e!295997)))

(assert (=> b!505655 (= res!306691 e!295992)))

(declare-fun res!306686 () Bool)

(assert (=> b!505655 (=> (not res!306686) (not e!295992))))

(assert (=> b!505655 (= res!306686 (bvsgt #b00000000000000000000000000000000 (x!47565 lt!230520)))))

(declare-fun b!505656 () Bool)

(declare-fun Unit!15446 () Unit!15444)

(assert (=> b!505656 (= e!295995 Unit!15446)))

(declare-fun lt!230521 () Unit!15444)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15444)

(assert (=> b!505656 (= lt!230521 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230516 #b00000000000000000000000000000000 (index!18558 lt!230520) (x!47565 lt!230520) mask!3524))))

(declare-fun res!306694 () Bool)

(assert (=> b!505656 (= res!306694 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230516 lt!230524 lt!230523 mask!3524) (Intermediate!4092 false (index!18558 lt!230520) (x!47565 lt!230520))))))

(declare-fun e!295994 () Bool)

(assert (=> b!505656 (=> (not res!306694) (not e!295994))))

(assert (=> b!505656 e!295994))

(declare-fun b!505657 () Bool)

(declare-fun Unit!15447 () Unit!15444)

(assert (=> b!505657 (= e!295995 Unit!15447)))

(declare-fun b!505658 () Bool)

(assert (=> b!505658 (= e!295994 false)))

(declare-fun b!505659 () Bool)

(declare-fun res!306696 () Bool)

(assert (=> b!505659 (=> (not res!306696) (not e!295996))))

(assert (=> b!505659 (= res!306696 (and (= (size!15989 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15989 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15989 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505660 () Bool)

(declare-fun res!306695 () Bool)

(assert (=> b!505660 (=> (not res!306695) (not e!295996))))

(assert (=> b!505660 (= res!306695 (validKeyInArray!0 k0!2280))))

(declare-fun b!505661 () Bool)

(assert (=> b!505661 (= e!295996 e!295998)))

(declare-fun res!306697 () Bool)

(assert (=> b!505661 (=> (not res!306697) (not e!295998))))

(declare-fun lt!230526 () SeekEntryResult!4092)

(assert (=> b!505661 (= res!306697 (or (= lt!230526 (MissingZero!4092 i!1204)) (= lt!230526 (MissingVacant!4092 i!1204))))))

(assert (=> b!505661 (= lt!230526 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45734 res!306689) b!505659))

(assert (= (and b!505659 res!306696) b!505647))

(assert (= (and b!505647 res!306698) b!505660))

(assert (= (and b!505660 res!306695) b!505645))

(assert (= (and b!505645 res!306692) b!505661))

(assert (= (and b!505661 res!306697) b!505650))

(assert (= (and b!505650 res!306688) b!505652))

(assert (= (and b!505652 res!306685) b!505653))

(assert (= (and b!505653 res!306687) b!505649))

(assert (= (and b!505653 (not res!306684)) b!505648))

(assert (= (and b!505648 c!59759) b!505656))

(assert (= (and b!505648 (not c!59759)) b!505657))

(assert (= (and b!505656 res!306694) b!505658))

(assert (= (and b!505648 (not res!306693)) b!505655))

(assert (= (and b!505655 res!306686) b!505654))

(assert (= (and b!505655 (not res!306691)) b!505646))

(assert (= (and b!505646 (not res!306690)) b!505651))

(declare-fun m!486305 () Bool)

(assert (=> b!505653 m!486305))

(declare-fun m!486307 () Bool)

(assert (=> b!505653 m!486307))

(declare-fun m!486309 () Bool)

(assert (=> b!505653 m!486309))

(declare-fun m!486311 () Bool)

(assert (=> b!505653 m!486311))

(declare-fun m!486313 () Bool)

(assert (=> b!505653 m!486313))

(assert (=> b!505653 m!486311))

(declare-fun m!486315 () Bool)

(assert (=> b!505653 m!486315))

(assert (=> b!505653 m!486311))

(declare-fun m!486317 () Bool)

(assert (=> b!505653 m!486317))

(declare-fun m!486319 () Bool)

(assert (=> b!505653 m!486319))

(declare-fun m!486321 () Bool)

(assert (=> b!505653 m!486321))

(declare-fun m!486323 () Bool)

(assert (=> b!505645 m!486323))

(assert (=> b!505649 m!486311))

(assert (=> b!505649 m!486311))

(declare-fun m!486325 () Bool)

(assert (=> b!505649 m!486325))

(declare-fun m!486327 () Bool)

(assert (=> b!505652 m!486327))

(declare-fun m!486329 () Bool)

(assert (=> b!505646 m!486329))

(assert (=> b!505647 m!486311))

(assert (=> b!505647 m!486311))

(declare-fun m!486331 () Bool)

(assert (=> b!505647 m!486331))

(declare-fun m!486333 () Bool)

(assert (=> b!505648 m!486333))

(declare-fun m!486335 () Bool)

(assert (=> b!505648 m!486335))

(assert (=> b!505648 m!486311))

(assert (=> b!505654 m!486311))

(assert (=> b!505654 m!486311))

(declare-fun m!486337 () Bool)

(assert (=> b!505654 m!486337))

(declare-fun m!486339 () Bool)

(assert (=> b!505650 m!486339))

(declare-fun m!486341 () Bool)

(assert (=> b!505651 m!486341))

(declare-fun m!486343 () Bool)

(assert (=> b!505651 m!486343))

(declare-fun m!486345 () Bool)

(assert (=> b!505661 m!486345))

(declare-fun m!486347 () Bool)

(assert (=> start!45734 m!486347))

(declare-fun m!486349 () Bool)

(assert (=> start!45734 m!486349))

(declare-fun m!486351 () Bool)

(assert (=> b!505656 m!486351))

(assert (=> b!505656 m!486329))

(declare-fun m!486353 () Bool)

(assert (=> b!505660 m!486353))

(check-sat (not b!505648) (not b!505646) (not b!505651) (not b!505649) (not b!505661) (not b!505652) (not start!45734) (not b!505645) (not b!505654) (not b!505653) (not b!505656) (not b!505647) (not b!505650) (not b!505660))
(check-sat)
