; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45416 () Bool)

(assert start!45416)

(declare-fun b!499488 () Bool)

(declare-fun res!301499 () Bool)

(declare-fun e!292692 () Bool)

(assert (=> b!499488 (=> (not res!301499) (not e!292692))))

(declare-datatypes ((array!32242 0))(
  ( (array!32243 (arr!15502 (Array (_ BitVec 32) (_ BitVec 64))) (size!15866 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32242)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32242 (_ BitVec 32)) Bool)

(assert (=> b!499488 (= res!301499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499489 () Bool)

(declare-datatypes ((Unit!14935 0))(
  ( (Unit!14936) )
))
(declare-fun e!292689 () Unit!14935)

(declare-fun Unit!14937 () Unit!14935)

(assert (=> b!499489 (= e!292689 Unit!14937)))

(declare-fun lt!226532 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3925 0))(
  ( (MissingZero!3925 (index!17882 (_ BitVec 32))) (Found!3925 (index!17883 (_ BitVec 32))) (Intermediate!3925 (undefined!4737 Bool) (index!17884 (_ BitVec 32)) (x!47071 (_ BitVec 32))) (Undefined!3925) (MissingVacant!3925 (index!17885 (_ BitVec 32))) )
))
(declare-fun lt!226535 () SeekEntryResult!3925)

(declare-fun lt!226538 () Unit!14935)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14935)

(assert (=> b!499489 (= lt!226538 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226532 #b00000000000000000000000000000000 (index!17884 lt!226535) (x!47071 lt!226535) mask!3524))))

(declare-fun lt!226540 () (_ BitVec 64))

(declare-fun res!301496 () Bool)

(declare-fun lt!226537 () array!32242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32242 (_ BitVec 32)) SeekEntryResult!3925)

(assert (=> b!499489 (= res!301496 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226532 lt!226540 lt!226537 mask!3524) (Intermediate!3925 false (index!17884 lt!226535) (x!47071 lt!226535))))))

(declare-fun e!292691 () Bool)

(assert (=> b!499489 (=> (not res!301496) (not e!292691))))

(assert (=> b!499489 e!292691))

(declare-fun b!499490 () Bool)

(declare-fun e!292695 () Bool)

(assert (=> b!499490 (= e!292692 (not e!292695))))

(declare-fun res!301494 () Bool)

(assert (=> b!499490 (=> res!301494 e!292695)))

(declare-fun lt!226534 () (_ BitVec 32))

(assert (=> b!499490 (= res!301494 (= lt!226535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226534 lt!226540 lt!226537 mask!3524)))))

(assert (=> b!499490 (= lt!226535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226532 (select (arr!15502 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499490 (= lt!226534 (toIndex!0 lt!226540 mask!3524))))

(assert (=> b!499490 (= lt!226540 (select (store (arr!15502 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499490 (= lt!226532 (toIndex!0 (select (arr!15502 a!3235) j!176) mask!3524))))

(assert (=> b!499490 (= lt!226537 (array!32243 (store (arr!15502 a!3235) i!1204 k0!2280) (size!15866 a!3235)))))

(declare-fun e!292688 () Bool)

(assert (=> b!499490 e!292688))

(declare-fun res!301491 () Bool)

(assert (=> b!499490 (=> (not res!301491) (not e!292688))))

(assert (=> b!499490 (= res!301491 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226531 () Unit!14935)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14935)

(assert (=> b!499490 (= lt!226531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499491 () Bool)

(assert (=> b!499491 (= e!292691 false)))

(declare-fun b!499492 () Bool)

(declare-fun Unit!14938 () Unit!14935)

(assert (=> b!499492 (= e!292689 Unit!14938)))

(declare-fun b!499493 () Bool)

(declare-fun res!301489 () Bool)

(declare-fun e!292694 () Bool)

(assert (=> b!499493 (=> (not res!301489) (not e!292694))))

(declare-fun arrayContainsKey!0 (array!32242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499493 (= res!301489 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499494 () Bool)

(declare-fun res!301492 () Bool)

(assert (=> b!499494 (=> (not res!301492) (not e!292694))))

(assert (=> b!499494 (= res!301492 (and (= (size!15866 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15866 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15866 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499495 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32242 (_ BitVec 32)) SeekEntryResult!3925)

(assert (=> b!499495 (= e!292688 (= (seekEntryOrOpen!0 (select (arr!15502 a!3235) j!176) a!3235 mask!3524) (Found!3925 j!176)))))

(declare-fun b!499496 () Bool)

(declare-fun res!301498 () Bool)

(assert (=> b!499496 (=> (not res!301498) (not e!292694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499496 (= res!301498 (validKeyInArray!0 k0!2280))))

(declare-fun b!499497 () Bool)

(declare-fun e!292690 () Bool)

(assert (=> b!499497 (= e!292690 true)))

(declare-fun lt!226536 () SeekEntryResult!3925)

(assert (=> b!499497 (= lt!226536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226532 lt!226540 lt!226537 mask!3524))))

(declare-fun b!499498 () Bool)

(declare-fun res!301490 () Bool)

(assert (=> b!499498 (=> (not res!301490) (not e!292692))))

(declare-datatypes ((List!9567 0))(
  ( (Nil!9564) (Cons!9563 (h!10437 (_ BitVec 64)) (t!15787 List!9567)) )
))
(declare-fun arrayNoDuplicates!0 (array!32242 (_ BitVec 32) List!9567) Bool)

(assert (=> b!499498 (= res!301490 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9564))))

(declare-fun b!499499 () Bool)

(declare-fun res!301501 () Bool)

(assert (=> b!499499 (=> res!301501 e!292695)))

(get-info :version)

(assert (=> b!499499 (= res!301501 (or (undefined!4737 lt!226535) (not ((_ is Intermediate!3925) lt!226535))))))

(declare-fun res!301497 () Bool)

(assert (=> start!45416 (=> (not res!301497) (not e!292694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45416 (= res!301497 (validMask!0 mask!3524))))

(assert (=> start!45416 e!292694))

(assert (=> start!45416 true))

(declare-fun array_inv!11361 (array!32242) Bool)

(assert (=> start!45416 (array_inv!11361 a!3235)))

(declare-fun b!499487 () Bool)

(assert (=> b!499487 (= e!292695 e!292690)))

(declare-fun res!301500 () Bool)

(assert (=> b!499487 (=> res!301500 e!292690)))

(assert (=> b!499487 (= res!301500 (or (bvsgt #b00000000000000000000000000000000 (x!47071 lt!226535)) (bvsgt (x!47071 lt!226535) #b01111111111111111111111111111110) (bvslt lt!226532 #b00000000000000000000000000000000) (bvsge lt!226532 (size!15866 a!3235)) (bvslt (index!17884 lt!226535) #b00000000000000000000000000000000) (bvsge (index!17884 lt!226535) (size!15866 a!3235)) (not (= lt!226535 (Intermediate!3925 false (index!17884 lt!226535) (x!47071 lt!226535))))))))

(assert (=> b!499487 (and (or (= (select (arr!15502 a!3235) (index!17884 lt!226535)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15502 a!3235) (index!17884 lt!226535)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15502 a!3235) (index!17884 lt!226535)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15502 a!3235) (index!17884 lt!226535)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226539 () Unit!14935)

(assert (=> b!499487 (= lt!226539 e!292689)))

(declare-fun c!59276 () Bool)

(assert (=> b!499487 (= c!59276 (= (select (arr!15502 a!3235) (index!17884 lt!226535)) (select (arr!15502 a!3235) j!176)))))

(assert (=> b!499487 (and (bvslt (x!47071 lt!226535) #b01111111111111111111111111111110) (or (= (select (arr!15502 a!3235) (index!17884 lt!226535)) (select (arr!15502 a!3235) j!176)) (= (select (arr!15502 a!3235) (index!17884 lt!226535)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15502 a!3235) (index!17884 lt!226535)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499500 () Bool)

(declare-fun res!301495 () Bool)

(assert (=> b!499500 (=> (not res!301495) (not e!292694))))

(assert (=> b!499500 (= res!301495 (validKeyInArray!0 (select (arr!15502 a!3235) j!176)))))

(declare-fun b!499501 () Bool)

(assert (=> b!499501 (= e!292694 e!292692)))

(declare-fun res!301493 () Bool)

(assert (=> b!499501 (=> (not res!301493) (not e!292692))))

(declare-fun lt!226533 () SeekEntryResult!3925)

(assert (=> b!499501 (= res!301493 (or (= lt!226533 (MissingZero!3925 i!1204)) (= lt!226533 (MissingVacant!3925 i!1204))))))

(assert (=> b!499501 (= lt!226533 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45416 res!301497) b!499494))

(assert (= (and b!499494 res!301492) b!499500))

(assert (= (and b!499500 res!301495) b!499496))

(assert (= (and b!499496 res!301498) b!499493))

(assert (= (and b!499493 res!301489) b!499501))

(assert (= (and b!499501 res!301493) b!499488))

(assert (= (and b!499488 res!301499) b!499498))

(assert (= (and b!499498 res!301490) b!499490))

(assert (= (and b!499490 res!301491) b!499495))

(assert (= (and b!499490 (not res!301494)) b!499499))

(assert (= (and b!499499 (not res!301501)) b!499487))

(assert (= (and b!499487 c!59276) b!499489))

(assert (= (and b!499487 (not c!59276)) b!499492))

(assert (= (and b!499489 res!301496) b!499491))

(assert (= (and b!499487 (not res!301500)) b!499497))

(declare-fun m!480925 () Bool)

(assert (=> b!499493 m!480925))

(declare-fun m!480927 () Bool)

(assert (=> b!499487 m!480927))

(declare-fun m!480929 () Bool)

(assert (=> b!499487 m!480929))

(declare-fun m!480931 () Bool)

(assert (=> start!45416 m!480931))

(declare-fun m!480933 () Bool)

(assert (=> start!45416 m!480933))

(declare-fun m!480935 () Bool)

(assert (=> b!499490 m!480935))

(declare-fun m!480937 () Bool)

(assert (=> b!499490 m!480937))

(declare-fun m!480939 () Bool)

(assert (=> b!499490 m!480939))

(declare-fun m!480941 () Bool)

(assert (=> b!499490 m!480941))

(assert (=> b!499490 m!480929))

(declare-fun m!480943 () Bool)

(assert (=> b!499490 m!480943))

(assert (=> b!499490 m!480929))

(declare-fun m!480945 () Bool)

(assert (=> b!499490 m!480945))

(assert (=> b!499490 m!480929))

(declare-fun m!480947 () Bool)

(assert (=> b!499490 m!480947))

(declare-fun m!480949 () Bool)

(assert (=> b!499490 m!480949))

(declare-fun m!480951 () Bool)

(assert (=> b!499498 m!480951))

(declare-fun m!480953 () Bool)

(assert (=> b!499496 m!480953))

(assert (=> b!499495 m!480929))

(assert (=> b!499495 m!480929))

(declare-fun m!480955 () Bool)

(assert (=> b!499495 m!480955))

(declare-fun m!480957 () Bool)

(assert (=> b!499488 m!480957))

(declare-fun m!480959 () Bool)

(assert (=> b!499489 m!480959))

(declare-fun m!480961 () Bool)

(assert (=> b!499489 m!480961))

(assert (=> b!499497 m!480961))

(assert (=> b!499500 m!480929))

(assert (=> b!499500 m!480929))

(declare-fun m!480963 () Bool)

(assert (=> b!499500 m!480963))

(declare-fun m!480965 () Bool)

(assert (=> b!499501 m!480965))

(check-sat (not b!499489) (not b!499496) (not b!499488) (not start!45416) (not b!499498) (not b!499493) (not b!499490) (not b!499501) (not b!499497) (not b!499500) (not b!499495))
(check-sat)
