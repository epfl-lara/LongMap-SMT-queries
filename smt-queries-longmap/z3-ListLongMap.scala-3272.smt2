; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45566 () Bool)

(assert start!45566)

(declare-fun b!501555 () Bool)

(declare-fun e!293826 () Bool)

(assert (=> b!501555 (= e!293826 true)))

(declare-datatypes ((array!32323 0))(
  ( (array!32324 (arr!15541 (Array (_ BitVec 32) (_ BitVec 64))) (size!15905 (_ BitVec 32))) )
))
(declare-fun lt!227862 () array!32323)

(declare-fun lt!227861 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227863 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3964 0))(
  ( (MissingZero!3964 (index!18044 (_ BitVec 32))) (Found!3964 (index!18045 (_ BitVec 32))) (Intermediate!3964 (undefined!4776 Bool) (index!18046 (_ BitVec 32)) (x!47226 (_ BitVec 32))) (Undefined!3964) (MissingVacant!3964 (index!18047 (_ BitVec 32))) )
))
(declare-fun lt!227864 () SeekEntryResult!3964)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32323 (_ BitVec 32)) SeekEntryResult!3964)

(assert (=> b!501555 (= lt!227864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227861 lt!227863 lt!227862 mask!3524))))

(declare-fun b!501556 () Bool)

(declare-datatypes ((Unit!15091 0))(
  ( (Unit!15092) )
))
(declare-fun e!293824 () Unit!15091)

(declare-fun Unit!15093 () Unit!15091)

(assert (=> b!501556 (= e!293824 Unit!15093)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!227856 () Unit!15091)

(declare-fun a!3235 () array!32323)

(declare-fun lt!227858 () SeekEntryResult!3964)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15091)

(assert (=> b!501556 (= lt!227856 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227861 #b00000000000000000000000000000000 (index!18046 lt!227858) (x!47226 lt!227858) mask!3524))))

(declare-fun res!303128 () Bool)

(assert (=> b!501556 (= res!303128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227861 lt!227863 lt!227862 mask!3524) (Intermediate!3964 false (index!18046 lt!227858) (x!47226 lt!227858))))))

(declare-fun e!293821 () Bool)

(assert (=> b!501556 (=> (not res!303128) (not e!293821))))

(assert (=> b!501556 e!293821))

(declare-fun b!501558 () Bool)

(declare-fun e!293819 () Bool)

(declare-fun e!293823 () Bool)

(assert (=> b!501558 (= e!293819 (not e!293823))))

(declare-fun res!303131 () Bool)

(assert (=> b!501558 (=> res!303131 e!293823)))

(declare-fun lt!227859 () (_ BitVec 32))

(assert (=> b!501558 (= res!303131 (= lt!227858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227859 lt!227863 lt!227862 mask!3524)))))

(assert (=> b!501558 (= lt!227858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227861 (select (arr!15541 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501558 (= lt!227859 (toIndex!0 lt!227863 mask!3524))))

(assert (=> b!501558 (= lt!227863 (select (store (arr!15541 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501558 (= lt!227861 (toIndex!0 (select (arr!15541 a!3235) j!176) mask!3524))))

(assert (=> b!501558 (= lt!227862 (array!32324 (store (arr!15541 a!3235) i!1204 k0!2280) (size!15905 a!3235)))))

(declare-fun e!293820 () Bool)

(assert (=> b!501558 e!293820))

(declare-fun res!303125 () Bool)

(assert (=> b!501558 (=> (not res!303125) (not e!293820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32323 (_ BitVec 32)) Bool)

(assert (=> b!501558 (= res!303125 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227866 () Unit!15091)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15091)

(assert (=> b!501558 (= lt!227866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501559 () Bool)

(declare-fun res!303136 () Bool)

(assert (=> b!501559 (=> (not res!303136) (not e!293819))))

(declare-datatypes ((List!9606 0))(
  ( (Nil!9603) (Cons!9602 (h!10479 (_ BitVec 64)) (t!15826 List!9606)) )
))
(declare-fun arrayNoDuplicates!0 (array!32323 (_ BitVec 32) List!9606) Bool)

(assert (=> b!501559 (= res!303136 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9603))))

(declare-fun b!501560 () Bool)

(declare-fun res!303127 () Bool)

(assert (=> b!501560 (=> res!303127 e!293826)))

(declare-fun e!293825 () Bool)

(assert (=> b!501560 (= res!303127 e!293825)))

(declare-fun res!303126 () Bool)

(assert (=> b!501560 (=> (not res!303126) (not e!293825))))

(assert (=> b!501560 (= res!303126 (bvsgt #b00000000000000000000000000000000 (x!47226 lt!227858)))))

(declare-fun b!501561 () Bool)

(declare-fun res!303123 () Bool)

(declare-fun e!293822 () Bool)

(assert (=> b!501561 (=> (not res!303123) (not e!293822))))

(declare-fun arrayContainsKey!0 (array!32323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501561 (= res!303123 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501562 () Bool)

(declare-fun Unit!15094 () Unit!15091)

(assert (=> b!501562 (= e!293824 Unit!15094)))

(declare-fun b!501563 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32323 (_ BitVec 32)) SeekEntryResult!3964)

(assert (=> b!501563 (= e!293820 (= (seekEntryOrOpen!0 (select (arr!15541 a!3235) j!176) a!3235 mask!3524) (Found!3964 j!176)))))

(declare-fun b!501564 () Bool)

(assert (=> b!501564 (= e!293822 e!293819)))

(declare-fun res!303129 () Bool)

(assert (=> b!501564 (=> (not res!303129) (not e!293819))))

(declare-fun lt!227865 () SeekEntryResult!3964)

(assert (=> b!501564 (= res!303129 (or (= lt!227865 (MissingZero!3964 i!1204)) (= lt!227865 (MissingVacant!3964 i!1204))))))

(assert (=> b!501564 (= lt!227865 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501565 () Bool)

(declare-fun res!303135 () Bool)

(assert (=> b!501565 (=> (not res!303135) (not e!293822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501565 (= res!303135 (validKeyInArray!0 k0!2280))))

(declare-fun b!501566 () Bool)

(assert (=> b!501566 (= e!293821 false)))

(declare-fun b!501567 () Bool)

(declare-fun res!303122 () Bool)

(assert (=> b!501567 (=> (not res!303122) (not e!293822))))

(assert (=> b!501567 (= res!303122 (validKeyInArray!0 (select (arr!15541 a!3235) j!176)))))

(declare-fun res!303130 () Bool)

(assert (=> start!45566 (=> (not res!303130) (not e!293822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45566 (= res!303130 (validMask!0 mask!3524))))

(assert (=> start!45566 e!293822))

(assert (=> start!45566 true))

(declare-fun array_inv!11400 (array!32323) Bool)

(assert (=> start!45566 (array_inv!11400 a!3235)))

(declare-fun b!501557 () Bool)

(assert (=> b!501557 (= e!293823 e!293826)))

(declare-fun res!303134 () Bool)

(assert (=> b!501557 (=> res!303134 e!293826)))

(assert (=> b!501557 (= res!303134 (or (bvsgt (x!47226 lt!227858) #b01111111111111111111111111111110) (bvslt lt!227861 #b00000000000000000000000000000000) (bvsge lt!227861 (size!15905 a!3235)) (bvslt (index!18046 lt!227858) #b00000000000000000000000000000000) (bvsge (index!18046 lt!227858) (size!15905 a!3235)) (not (= lt!227858 (Intermediate!3964 false (index!18046 lt!227858) (x!47226 lt!227858))))))))

(assert (=> b!501557 (= (index!18046 lt!227858) i!1204)))

(declare-fun lt!227860 () Unit!15091)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15091)

(assert (=> b!501557 (= lt!227860 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227861 #b00000000000000000000000000000000 (index!18046 lt!227858) (x!47226 lt!227858) mask!3524))))

(assert (=> b!501557 (and (or (= (select (arr!15541 a!3235) (index!18046 lt!227858)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15541 a!3235) (index!18046 lt!227858)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15541 a!3235) (index!18046 lt!227858)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15541 a!3235) (index!18046 lt!227858)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227857 () Unit!15091)

(assert (=> b!501557 (= lt!227857 e!293824)))

(declare-fun c!59495 () Bool)

(assert (=> b!501557 (= c!59495 (= (select (arr!15541 a!3235) (index!18046 lt!227858)) (select (arr!15541 a!3235) j!176)))))

(assert (=> b!501557 (and (bvslt (x!47226 lt!227858) #b01111111111111111111111111111110) (or (= (select (arr!15541 a!3235) (index!18046 lt!227858)) (select (arr!15541 a!3235) j!176)) (= (select (arr!15541 a!3235) (index!18046 lt!227858)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15541 a!3235) (index!18046 lt!227858)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501568 () Bool)

(declare-fun res!303124 () Bool)

(assert (=> b!501568 (=> (not res!303124) (not e!293822))))

(assert (=> b!501568 (= res!303124 (and (= (size!15905 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15905 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15905 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501569 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32323 (_ BitVec 32)) SeekEntryResult!3964)

(assert (=> b!501569 (= e!293825 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227861 (index!18046 lt!227858) (select (arr!15541 a!3235) j!176) a!3235 mask!3524) (Found!3964 j!176))))))

(declare-fun b!501570 () Bool)

(declare-fun res!303132 () Bool)

(assert (=> b!501570 (=> res!303132 e!293823)))

(get-info :version)

(assert (=> b!501570 (= res!303132 (or (undefined!4776 lt!227858) (not ((_ is Intermediate!3964) lt!227858))))))

(declare-fun b!501571 () Bool)

(declare-fun res!303133 () Bool)

(assert (=> b!501571 (=> (not res!303133) (not e!293819))))

(assert (=> b!501571 (= res!303133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45566 res!303130) b!501568))

(assert (= (and b!501568 res!303124) b!501567))

(assert (= (and b!501567 res!303122) b!501565))

(assert (= (and b!501565 res!303135) b!501561))

(assert (= (and b!501561 res!303123) b!501564))

(assert (= (and b!501564 res!303129) b!501571))

(assert (= (and b!501571 res!303133) b!501559))

(assert (= (and b!501559 res!303136) b!501558))

(assert (= (and b!501558 res!303125) b!501563))

(assert (= (and b!501558 (not res!303131)) b!501570))

(assert (= (and b!501570 (not res!303132)) b!501557))

(assert (= (and b!501557 c!59495) b!501556))

(assert (= (and b!501557 (not c!59495)) b!501562))

(assert (= (and b!501556 res!303128) b!501566))

(assert (= (and b!501557 (not res!303134)) b!501560))

(assert (= (and b!501560 res!303126) b!501569))

(assert (= (and b!501560 (not res!303127)) b!501555))

(declare-fun m!482815 () Bool)

(assert (=> b!501558 m!482815))

(declare-fun m!482817 () Bool)

(assert (=> b!501558 m!482817))

(declare-fun m!482819 () Bool)

(assert (=> b!501558 m!482819))

(declare-fun m!482821 () Bool)

(assert (=> b!501558 m!482821))

(declare-fun m!482823 () Bool)

(assert (=> b!501558 m!482823))

(assert (=> b!501558 m!482815))

(declare-fun m!482825 () Bool)

(assert (=> b!501558 m!482825))

(declare-fun m!482827 () Bool)

(assert (=> b!501558 m!482827))

(declare-fun m!482829 () Bool)

(assert (=> b!501558 m!482829))

(assert (=> b!501558 m!482815))

(declare-fun m!482831 () Bool)

(assert (=> b!501558 m!482831))

(declare-fun m!482833 () Bool)

(assert (=> b!501565 m!482833))

(declare-fun m!482835 () Bool)

(assert (=> b!501555 m!482835))

(declare-fun m!482837 () Bool)

(assert (=> b!501564 m!482837))

(assert (=> b!501567 m!482815))

(assert (=> b!501567 m!482815))

(declare-fun m!482839 () Bool)

(assert (=> b!501567 m!482839))

(declare-fun m!482841 () Bool)

(assert (=> b!501556 m!482841))

(assert (=> b!501556 m!482835))

(assert (=> b!501569 m!482815))

(assert (=> b!501569 m!482815))

(declare-fun m!482843 () Bool)

(assert (=> b!501569 m!482843))

(declare-fun m!482845 () Bool)

(assert (=> b!501561 m!482845))

(assert (=> b!501563 m!482815))

(assert (=> b!501563 m!482815))

(declare-fun m!482847 () Bool)

(assert (=> b!501563 m!482847))

(declare-fun m!482849 () Bool)

(assert (=> b!501559 m!482849))

(declare-fun m!482851 () Bool)

(assert (=> b!501557 m!482851))

(declare-fun m!482853 () Bool)

(assert (=> b!501557 m!482853))

(assert (=> b!501557 m!482815))

(declare-fun m!482855 () Bool)

(assert (=> start!45566 m!482855))

(declare-fun m!482857 () Bool)

(assert (=> start!45566 m!482857))

(declare-fun m!482859 () Bool)

(assert (=> b!501571 m!482859))

(check-sat (not b!501564) (not b!501559) (not b!501569) (not b!501567) (not b!501563) (not b!501561) (not b!501557) (not b!501565) (not b!501558) (not start!45566) (not b!501555) (not b!501571) (not b!501556))
(check-sat)
