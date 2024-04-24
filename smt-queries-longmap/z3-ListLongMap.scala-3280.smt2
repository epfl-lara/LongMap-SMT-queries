; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45614 () Bool)

(assert start!45614)

(declare-fun b!502779 () Bool)

(declare-datatypes ((Unit!15187 0))(
  ( (Unit!15188) )
))
(declare-fun e!294472 () Unit!15187)

(declare-fun Unit!15189 () Unit!15187)

(assert (=> b!502779 (= e!294472 Unit!15189)))

(declare-fun lt!228649 () Unit!15187)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32371 0))(
  ( (array!32372 (arr!15565 (Array (_ BitVec 32) (_ BitVec 64))) (size!15929 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32371)

(declare-fun lt!228658 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3988 0))(
  ( (MissingZero!3988 (index!18140 (_ BitVec 32))) (Found!3988 (index!18141 (_ BitVec 32))) (Intermediate!3988 (undefined!4800 Bool) (index!18142 (_ BitVec 32)) (x!47314 (_ BitVec 32))) (Undefined!3988) (MissingVacant!3988 (index!18143 (_ BitVec 32))) )
))
(declare-fun lt!228654 () SeekEntryResult!3988)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15187)

(assert (=> b!502779 (= lt!228649 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228658 #b00000000000000000000000000000000 (index!18142 lt!228654) (x!47314 lt!228654) mask!3524))))

(declare-fun lt!228648 () (_ BitVec 64))

(declare-fun lt!228651 () array!32371)

(declare-fun res!304202 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32371 (_ BitVec 32)) SeekEntryResult!3988)

(assert (=> b!502779 (= res!304202 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228658 lt!228648 lt!228651 mask!3524) (Intermediate!3988 false (index!18142 lt!228654) (x!47314 lt!228654))))))

(declare-fun e!294468 () Bool)

(assert (=> b!502779 (=> (not res!304202) (not e!294468))))

(assert (=> b!502779 e!294468))

(declare-fun b!502780 () Bool)

(declare-fun e!294474 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32371 (_ BitVec 32)) SeekEntryResult!3988)

(assert (=> b!502780 (= e!294474 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228658 (index!18142 lt!228654) (select (arr!15565 a!3235) j!176) a!3235 mask!3524) (Found!3988 j!176))))))

(declare-fun b!502781 () Bool)

(declare-fun e!294470 () Bool)

(declare-fun e!294466 () Bool)

(assert (=> b!502781 (= e!294470 e!294466)))

(declare-fun res!304210 () Bool)

(assert (=> b!502781 (=> res!304210 e!294466)))

(assert (=> b!502781 (= res!304210 (or (bvsgt (x!47314 lt!228654) #b01111111111111111111111111111110) (bvslt lt!228658 #b00000000000000000000000000000000) (bvsge lt!228658 (size!15929 a!3235)) (bvslt (index!18142 lt!228654) #b00000000000000000000000000000000) (bvsge (index!18142 lt!228654) (size!15929 a!3235)) (not (= lt!228654 (Intermediate!3988 false (index!18142 lt!228654) (x!47314 lt!228654))))))))

(assert (=> b!502781 (= (index!18142 lt!228654) i!1204)))

(declare-fun lt!228652 () Unit!15187)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15187)

(assert (=> b!502781 (= lt!228652 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228658 #b00000000000000000000000000000000 (index!18142 lt!228654) (x!47314 lt!228654) mask!3524))))

(assert (=> b!502781 (and (or (= (select (arr!15565 a!3235) (index!18142 lt!228654)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15565 a!3235) (index!18142 lt!228654)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15565 a!3235) (index!18142 lt!228654)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15565 a!3235) (index!18142 lt!228654)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228650 () Unit!15187)

(assert (=> b!502781 (= lt!228650 e!294472)))

(declare-fun c!59567 () Bool)

(assert (=> b!502781 (= c!59567 (= (select (arr!15565 a!3235) (index!18142 lt!228654)) (select (arr!15565 a!3235) j!176)))))

(assert (=> b!502781 (and (bvslt (x!47314 lt!228654) #b01111111111111111111111111111110) (or (= (select (arr!15565 a!3235) (index!18142 lt!228654)) (select (arr!15565 a!3235) j!176)) (= (select (arr!15565 a!3235) (index!18142 lt!228654)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15565 a!3235) (index!18142 lt!228654)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502782 () Bool)

(declare-fun res!304212 () Bool)

(declare-fun e!294473 () Bool)

(assert (=> b!502782 (=> (not res!304212) (not e!294473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32371 (_ BitVec 32)) Bool)

(assert (=> b!502782 (= res!304212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502783 () Bool)

(declare-fun res!304213 () Bool)

(assert (=> b!502783 (=> res!304213 e!294470)))

(get-info :version)

(assert (=> b!502783 (= res!304213 (or (undefined!4800 lt!228654) (not ((_ is Intermediate!3988) lt!228654))))))

(declare-fun b!502784 () Bool)

(assert (=> b!502784 (= e!294468 false)))

(declare-fun b!502785 () Bool)

(declare-fun res!304214 () Bool)

(assert (=> b!502785 (=> (not res!304214) (not e!294473))))

(declare-datatypes ((List!9630 0))(
  ( (Nil!9627) (Cons!9626 (h!10503 (_ BitVec 64)) (t!15850 List!9630)) )
))
(declare-fun arrayNoDuplicates!0 (array!32371 (_ BitVec 32) List!9630) Bool)

(assert (=> b!502785 (= res!304214 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9627))))

(declare-fun b!502786 () Bool)

(declare-fun res!304216 () Bool)

(declare-fun e!294471 () Bool)

(assert (=> b!502786 (=> (not res!304216) (not e!294471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502786 (= res!304216 (validKeyInArray!0 (select (arr!15565 a!3235) j!176)))))

(declare-fun res!304209 () Bool)

(assert (=> start!45614 (=> (not res!304209) (not e!294471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45614 (= res!304209 (validMask!0 mask!3524))))

(assert (=> start!45614 e!294471))

(assert (=> start!45614 true))

(declare-fun array_inv!11424 (array!32371) Bool)

(assert (=> start!45614 (array_inv!11424 a!3235)))

(declare-fun b!502787 () Bool)

(declare-fun res!304207 () Bool)

(assert (=> b!502787 (=> (not res!304207) (not e!294471))))

(declare-fun arrayContainsKey!0 (array!32371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502787 (= res!304207 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502788 () Bool)

(declare-fun res!304208 () Bool)

(assert (=> b!502788 (=> res!304208 e!294466)))

(assert (=> b!502788 (= res!304208 e!294474)))

(declare-fun res!304215 () Bool)

(assert (=> b!502788 (=> (not res!304215) (not e!294474))))

(assert (=> b!502788 (= res!304215 (bvsgt #b00000000000000000000000000000000 (x!47314 lt!228654)))))

(declare-fun b!502789 () Bool)

(declare-fun e!294469 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32371 (_ BitVec 32)) SeekEntryResult!3988)

(assert (=> b!502789 (= e!294469 (= (seekEntryOrOpen!0 (select (arr!15565 a!3235) j!176) a!3235 mask!3524) (Found!3988 j!176)))))

(declare-fun b!502790 () Bool)

(declare-fun res!304205 () Bool)

(assert (=> b!502790 (=> (not res!304205) (not e!294471))))

(assert (=> b!502790 (= res!304205 (validKeyInArray!0 k0!2280))))

(declare-fun b!502791 () Bool)

(declare-fun Unit!15190 () Unit!15187)

(assert (=> b!502791 (= e!294472 Unit!15190)))

(declare-fun b!502792 () Bool)

(assert (=> b!502792 (= e!294466 true)))

(declare-fun lt!228655 () SeekEntryResult!3988)

(assert (=> b!502792 (= lt!228655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228658 lt!228648 lt!228651 mask!3524))))

(declare-fun b!502793 () Bool)

(declare-fun res!304203 () Bool)

(assert (=> b!502793 (=> (not res!304203) (not e!294471))))

(assert (=> b!502793 (= res!304203 (and (= (size!15929 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15929 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15929 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502794 () Bool)

(assert (=> b!502794 (= e!294471 e!294473)))

(declare-fun res!304211 () Bool)

(assert (=> b!502794 (=> (not res!304211) (not e!294473))))

(declare-fun lt!228653 () SeekEntryResult!3988)

(assert (=> b!502794 (= res!304211 (or (= lt!228653 (MissingZero!3988 i!1204)) (= lt!228653 (MissingVacant!3988 i!1204))))))

(assert (=> b!502794 (= lt!228653 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502795 () Bool)

(assert (=> b!502795 (= e!294473 (not e!294470))))

(declare-fun res!304206 () Bool)

(assert (=> b!502795 (=> res!304206 e!294470)))

(declare-fun lt!228657 () (_ BitVec 32))

(assert (=> b!502795 (= res!304206 (= lt!228654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228657 lt!228648 lt!228651 mask!3524)))))

(assert (=> b!502795 (= lt!228654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228658 (select (arr!15565 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502795 (= lt!228657 (toIndex!0 lt!228648 mask!3524))))

(assert (=> b!502795 (= lt!228648 (select (store (arr!15565 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502795 (= lt!228658 (toIndex!0 (select (arr!15565 a!3235) j!176) mask!3524))))

(assert (=> b!502795 (= lt!228651 (array!32372 (store (arr!15565 a!3235) i!1204 k0!2280) (size!15929 a!3235)))))

(assert (=> b!502795 e!294469))

(declare-fun res!304204 () Bool)

(assert (=> b!502795 (=> (not res!304204) (not e!294469))))

(assert (=> b!502795 (= res!304204 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228656 () Unit!15187)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15187)

(assert (=> b!502795 (= lt!228656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45614 res!304209) b!502793))

(assert (= (and b!502793 res!304203) b!502786))

(assert (= (and b!502786 res!304216) b!502790))

(assert (= (and b!502790 res!304205) b!502787))

(assert (= (and b!502787 res!304207) b!502794))

(assert (= (and b!502794 res!304211) b!502782))

(assert (= (and b!502782 res!304212) b!502785))

(assert (= (and b!502785 res!304214) b!502795))

(assert (= (and b!502795 res!304204) b!502789))

(assert (= (and b!502795 (not res!304206)) b!502783))

(assert (= (and b!502783 (not res!304213)) b!502781))

(assert (= (and b!502781 c!59567) b!502779))

(assert (= (and b!502781 (not c!59567)) b!502791))

(assert (= (and b!502779 res!304202) b!502784))

(assert (= (and b!502781 (not res!304210)) b!502788))

(assert (= (and b!502788 res!304215) b!502780))

(assert (= (and b!502788 (not res!304208)) b!502792))

(declare-fun m!483919 () Bool)

(assert (=> b!502782 m!483919))

(declare-fun m!483921 () Bool)

(assert (=> b!502790 m!483921))

(declare-fun m!483923 () Bool)

(assert (=> b!502789 m!483923))

(assert (=> b!502789 m!483923))

(declare-fun m!483925 () Bool)

(assert (=> b!502789 m!483925))

(declare-fun m!483927 () Bool)

(assert (=> b!502795 m!483927))

(declare-fun m!483929 () Bool)

(assert (=> b!502795 m!483929))

(declare-fun m!483931 () Bool)

(assert (=> b!502795 m!483931))

(assert (=> b!502795 m!483923))

(declare-fun m!483933 () Bool)

(assert (=> b!502795 m!483933))

(assert (=> b!502795 m!483923))

(declare-fun m!483935 () Bool)

(assert (=> b!502795 m!483935))

(assert (=> b!502795 m!483923))

(declare-fun m!483937 () Bool)

(assert (=> b!502795 m!483937))

(declare-fun m!483939 () Bool)

(assert (=> b!502795 m!483939))

(declare-fun m!483941 () Bool)

(assert (=> b!502795 m!483941))

(assert (=> b!502786 m!483923))

(assert (=> b!502786 m!483923))

(declare-fun m!483943 () Bool)

(assert (=> b!502786 m!483943))

(declare-fun m!483945 () Bool)

(assert (=> b!502779 m!483945))

(declare-fun m!483947 () Bool)

(assert (=> b!502779 m!483947))

(assert (=> b!502780 m!483923))

(assert (=> b!502780 m!483923))

(declare-fun m!483949 () Bool)

(assert (=> b!502780 m!483949))

(declare-fun m!483951 () Bool)

(assert (=> start!45614 m!483951))

(declare-fun m!483953 () Bool)

(assert (=> start!45614 m!483953))

(declare-fun m!483955 () Bool)

(assert (=> b!502794 m!483955))

(declare-fun m!483957 () Bool)

(assert (=> b!502787 m!483957))

(declare-fun m!483959 () Bool)

(assert (=> b!502781 m!483959))

(declare-fun m!483961 () Bool)

(assert (=> b!502781 m!483961))

(assert (=> b!502781 m!483923))

(declare-fun m!483963 () Bool)

(assert (=> b!502785 m!483963))

(assert (=> b!502792 m!483947))

(check-sat (not b!502792) (not b!502786) (not b!502781) (not b!502785) (not b!502795) (not start!45614) (not b!502782) (not b!502789) (not b!502790) (not b!502794) (not b!502779) (not b!502787) (not b!502780))
(check-sat)
