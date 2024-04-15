; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45438 () Bool)

(assert start!45438)

(declare-fun b!499817 () Bool)

(declare-fun res!301842 () Bool)

(declare-fun e!292847 () Bool)

(assert (=> b!499817 (=> (not res!301842) (not e!292847))))

(declare-datatypes ((array!32273 0))(
  ( (array!32274 (arr!15518 (Array (_ BitVec 32) (_ BitVec 64))) (size!15883 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32273)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499817 (= res!301842 (validKeyInArray!0 (select (arr!15518 a!3235) j!176)))))

(declare-fun b!499818 () Bool)

(declare-fun e!292842 () Bool)

(assert (=> b!499818 (= e!292847 e!292842)))

(declare-fun res!301835 () Bool)

(assert (=> b!499818 (=> (not res!301835) (not e!292842))))

(declare-datatypes ((SeekEntryResult!3982 0))(
  ( (MissingZero!3982 (index!18110 (_ BitVec 32))) (Found!3982 (index!18111 (_ BitVec 32))) (Intermediate!3982 (undefined!4794 Bool) (index!18112 (_ BitVec 32)) (x!47158 (_ BitVec 32))) (Undefined!3982) (MissingVacant!3982 (index!18113 (_ BitVec 32))) )
))
(declare-fun lt!226647 () SeekEntryResult!3982)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499818 (= res!301835 (or (= lt!226647 (MissingZero!3982 i!1204)) (= lt!226647 (MissingVacant!3982 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32273 (_ BitVec 32)) SeekEntryResult!3982)

(assert (=> b!499818 (= lt!226647 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499819 () Bool)

(declare-fun res!301836 () Bool)

(assert (=> b!499819 (=> (not res!301836) (not e!292847))))

(assert (=> b!499819 (= res!301836 (validKeyInArray!0 k0!2280))))

(declare-fun b!499820 () Bool)

(declare-fun res!301839 () Bool)

(assert (=> b!499820 (=> (not res!301839) (not e!292842))))

(declare-datatypes ((List!9715 0))(
  ( (Nil!9712) (Cons!9711 (h!10585 (_ BitVec 64)) (t!15934 List!9715)) )
))
(declare-fun arrayNoDuplicates!0 (array!32273 (_ BitVec 32) List!9715) Bool)

(assert (=> b!499820 (= res!301839 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9712))))

(declare-fun b!499821 () Bool)

(declare-fun res!301837 () Bool)

(assert (=> b!499821 (=> (not res!301837) (not e!292847))))

(declare-fun arrayContainsKey!0 (array!32273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499821 (= res!301837 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499822 () Bool)

(declare-fun e!292844 () Bool)

(assert (=> b!499822 (= e!292844 true)))

(declare-fun lt!226651 () array!32273)

(declare-fun lt!226649 () (_ BitVec 64))

(declare-fun lt!226645 () SeekEntryResult!3982)

(declare-fun lt!226652 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32273 (_ BitVec 32)) SeekEntryResult!3982)

(assert (=> b!499822 (= lt!226645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226652 lt!226649 lt!226651 mask!3524))))

(declare-fun b!499824 () Bool)

(declare-fun e!292841 () Bool)

(assert (=> b!499824 (= e!292842 (not e!292841))))

(declare-fun res!301844 () Bool)

(assert (=> b!499824 (=> res!301844 e!292841)))

(declare-fun lt!226654 () (_ BitVec 32))

(declare-fun lt!226648 () SeekEntryResult!3982)

(assert (=> b!499824 (= res!301844 (= lt!226648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226654 lt!226649 lt!226651 mask!3524)))))

(assert (=> b!499824 (= lt!226648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226652 (select (arr!15518 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499824 (= lt!226654 (toIndex!0 lt!226649 mask!3524))))

(assert (=> b!499824 (= lt!226649 (select (store (arr!15518 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499824 (= lt!226652 (toIndex!0 (select (arr!15518 a!3235) j!176) mask!3524))))

(assert (=> b!499824 (= lt!226651 (array!32274 (store (arr!15518 a!3235) i!1204 k0!2280) (size!15883 a!3235)))))

(declare-fun e!292843 () Bool)

(assert (=> b!499824 e!292843))

(declare-fun res!301841 () Bool)

(assert (=> b!499824 (=> (not res!301841) (not e!292843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32273 (_ BitVec 32)) Bool)

(assert (=> b!499824 (= res!301841 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14998 0))(
  ( (Unit!14999) )
))
(declare-fun lt!226650 () Unit!14998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14998)

(assert (=> b!499824 (= lt!226650 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499825 () Bool)

(declare-fun res!301846 () Bool)

(assert (=> b!499825 (=> (not res!301846) (not e!292847))))

(assert (=> b!499825 (= res!301846 (and (= (size!15883 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15883 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15883 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499826 () Bool)

(declare-fun e!292848 () Unit!14998)

(declare-fun Unit!15000 () Unit!14998)

(assert (=> b!499826 (= e!292848 Unit!15000)))

(declare-fun lt!226646 () Unit!14998)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14998)

(assert (=> b!499826 (= lt!226646 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226652 #b00000000000000000000000000000000 (index!18112 lt!226648) (x!47158 lt!226648) mask!3524))))

(declare-fun res!301840 () Bool)

(assert (=> b!499826 (= res!301840 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226652 lt!226649 lt!226651 mask!3524) (Intermediate!3982 false (index!18112 lt!226648) (x!47158 lt!226648))))))

(declare-fun e!292846 () Bool)

(assert (=> b!499826 (=> (not res!301840) (not e!292846))))

(assert (=> b!499826 e!292846))

(declare-fun b!499827 () Bool)

(assert (=> b!499827 (= e!292841 e!292844)))

(declare-fun res!301838 () Bool)

(assert (=> b!499827 (=> res!301838 e!292844)))

(assert (=> b!499827 (= res!301838 (or (bvsgt #b00000000000000000000000000000000 (x!47158 lt!226648)) (bvsgt (x!47158 lt!226648) #b01111111111111111111111111111110) (bvslt lt!226652 #b00000000000000000000000000000000) (bvsge lt!226652 (size!15883 a!3235)) (bvslt (index!18112 lt!226648) #b00000000000000000000000000000000) (bvsge (index!18112 lt!226648) (size!15883 a!3235)) (not (= lt!226648 (Intermediate!3982 false (index!18112 lt!226648) (x!47158 lt!226648))))))))

(assert (=> b!499827 (and (or (= (select (arr!15518 a!3235) (index!18112 lt!226648)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15518 a!3235) (index!18112 lt!226648)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15518 a!3235) (index!18112 lt!226648)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15518 a!3235) (index!18112 lt!226648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226653 () Unit!14998)

(assert (=> b!499827 (= lt!226653 e!292848)))

(declare-fun c!59268 () Bool)

(assert (=> b!499827 (= c!59268 (= (select (arr!15518 a!3235) (index!18112 lt!226648)) (select (arr!15518 a!3235) j!176)))))

(assert (=> b!499827 (and (bvslt (x!47158 lt!226648) #b01111111111111111111111111111110) (or (= (select (arr!15518 a!3235) (index!18112 lt!226648)) (select (arr!15518 a!3235) j!176)) (= (select (arr!15518 a!3235) (index!18112 lt!226648)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15518 a!3235) (index!18112 lt!226648)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499828 () Bool)

(declare-fun res!301845 () Bool)

(assert (=> b!499828 (=> res!301845 e!292841)))

(get-info :version)

(assert (=> b!499828 (= res!301845 (or (undefined!4794 lt!226648) (not ((_ is Intermediate!3982) lt!226648))))))

(declare-fun b!499829 () Bool)

(declare-fun Unit!15001 () Unit!14998)

(assert (=> b!499829 (= e!292848 Unit!15001)))

(declare-fun b!499823 () Bool)

(declare-fun res!301843 () Bool)

(assert (=> b!499823 (=> (not res!301843) (not e!292842))))

(assert (=> b!499823 (= res!301843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!301847 () Bool)

(assert (=> start!45438 (=> (not res!301847) (not e!292847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45438 (= res!301847 (validMask!0 mask!3524))))

(assert (=> start!45438 e!292847))

(assert (=> start!45438 true))

(declare-fun array_inv!11401 (array!32273) Bool)

(assert (=> start!45438 (array_inv!11401 a!3235)))

(declare-fun b!499830 () Bool)

(assert (=> b!499830 (= e!292846 false)))

(declare-fun b!499831 () Bool)

(assert (=> b!499831 (= e!292843 (= (seekEntryOrOpen!0 (select (arr!15518 a!3235) j!176) a!3235 mask!3524) (Found!3982 j!176)))))

(assert (= (and start!45438 res!301847) b!499825))

(assert (= (and b!499825 res!301846) b!499817))

(assert (= (and b!499817 res!301842) b!499819))

(assert (= (and b!499819 res!301836) b!499821))

(assert (= (and b!499821 res!301837) b!499818))

(assert (= (and b!499818 res!301835) b!499823))

(assert (= (and b!499823 res!301843) b!499820))

(assert (= (and b!499820 res!301839) b!499824))

(assert (= (and b!499824 res!301841) b!499831))

(assert (= (and b!499824 (not res!301844)) b!499828))

(assert (= (and b!499828 (not res!301845)) b!499827))

(assert (= (and b!499827 c!59268) b!499826))

(assert (= (and b!499827 (not c!59268)) b!499829))

(assert (= (and b!499826 res!301840) b!499830))

(assert (= (and b!499827 (not res!301838)) b!499822))

(declare-fun m!480493 () Bool)

(assert (=> b!499817 m!480493))

(assert (=> b!499817 m!480493))

(declare-fun m!480495 () Bool)

(assert (=> b!499817 m!480495))

(declare-fun m!480497 () Bool)

(assert (=> b!499823 m!480497))

(declare-fun m!480499 () Bool)

(assert (=> b!499826 m!480499))

(declare-fun m!480501 () Bool)

(assert (=> b!499826 m!480501))

(declare-fun m!480503 () Bool)

(assert (=> b!499824 m!480503))

(declare-fun m!480505 () Bool)

(assert (=> b!499824 m!480505))

(declare-fun m!480507 () Bool)

(assert (=> b!499824 m!480507))

(assert (=> b!499824 m!480493))

(declare-fun m!480509 () Bool)

(assert (=> b!499824 m!480509))

(declare-fun m!480511 () Bool)

(assert (=> b!499824 m!480511))

(assert (=> b!499824 m!480493))

(declare-fun m!480513 () Bool)

(assert (=> b!499824 m!480513))

(assert (=> b!499824 m!480493))

(declare-fun m!480515 () Bool)

(assert (=> b!499824 m!480515))

(declare-fun m!480517 () Bool)

(assert (=> b!499824 m!480517))

(declare-fun m!480519 () Bool)

(assert (=> b!499820 m!480519))

(assert (=> b!499831 m!480493))

(assert (=> b!499831 m!480493))

(declare-fun m!480521 () Bool)

(assert (=> b!499831 m!480521))

(declare-fun m!480523 () Bool)

(assert (=> start!45438 m!480523))

(declare-fun m!480525 () Bool)

(assert (=> start!45438 m!480525))

(declare-fun m!480527 () Bool)

(assert (=> b!499821 m!480527))

(assert (=> b!499822 m!480501))

(declare-fun m!480529 () Bool)

(assert (=> b!499819 m!480529))

(declare-fun m!480531 () Bool)

(assert (=> b!499827 m!480531))

(assert (=> b!499827 m!480493))

(declare-fun m!480533 () Bool)

(assert (=> b!499818 m!480533))

(check-sat (not b!499822) (not start!45438) (not b!499819) (not b!499818) (not b!499823) (not b!499820) (not b!499817) (not b!499821) (not b!499824) (not b!499831) (not b!499826))
(check-sat)
