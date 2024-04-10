; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120404 () Bool)

(assert start!120404)

(declare-fun b!1401674 () Bool)

(declare-fun e!793684 () Bool)

(declare-fun e!793683 () Bool)

(assert (=> b!1401674 (= e!793684 (not e!793683))))

(declare-fun res!940188 () Bool)

(assert (=> b!1401674 (=> res!940188 e!793683)))

(declare-datatypes ((SeekEntryResult!10574 0))(
  ( (MissingZero!10574 (index!44673 (_ BitVec 32))) (Found!10574 (index!44674 (_ BitVec 32))) (Intermediate!10574 (undefined!11386 Bool) (index!44675 (_ BitVec 32)) (x!126305 (_ BitVec 32))) (Undefined!10574) (MissingVacant!10574 (index!44676 (_ BitVec 32))) )
))
(declare-fun lt!617104 () SeekEntryResult!10574)

(get-info :version)

(assert (=> b!1401674 (= res!940188 (or (not ((_ is Intermediate!10574) lt!617104)) (undefined!11386 lt!617104)))))

(declare-fun e!793682 () Bool)

(assert (=> b!1401674 e!793682))

(declare-fun res!940191 () Bool)

(assert (=> b!1401674 (=> (not res!940191) (not e!793682))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95813 0))(
  ( (array!95814 (arr!46257 (Array (_ BitVec 32) (_ BitVec 64))) (size!46807 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95813)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95813 (_ BitVec 32)) Bool)

(assert (=> b!1401674 (= res!940191 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47152 0))(
  ( (Unit!47153) )
))
(declare-fun lt!617107 () Unit!47152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47152)

(assert (=> b!1401674 (= lt!617107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617102 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95813 (_ BitVec 32)) SeekEntryResult!10574)

(assert (=> b!1401674 (= lt!617104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617102 (select (arr!46257 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401674 (= lt!617102 (toIndex!0 (select (arr!46257 a!2901) j!112) mask!2840))))

(declare-fun lt!617108 () array!95813)

(declare-fun b!1401675 () Bool)

(declare-fun e!793688 () Bool)

(declare-fun lt!617103 () (_ BitVec 64))

(declare-fun lt!617109 () SeekEntryResult!10574)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95813 (_ BitVec 32)) SeekEntryResult!10574)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95813 (_ BitVec 32)) SeekEntryResult!10574)

(assert (=> b!1401675 (= e!793688 (= (seekEntryOrOpen!0 lt!617103 lt!617108 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126305 lt!617109) (index!44675 lt!617109) (index!44675 lt!617109) (select (arr!46257 a!2901) j!112) lt!617108 mask!2840)))))

(declare-fun res!940185 () Bool)

(assert (=> start!120404 (=> (not res!940185) (not e!793684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120404 (= res!940185 (validMask!0 mask!2840))))

(assert (=> start!120404 e!793684))

(assert (=> start!120404 true))

(declare-fun array_inv!35285 (array!95813) Bool)

(assert (=> start!120404 (array_inv!35285 a!2901)))

(declare-fun b!1401676 () Bool)

(declare-fun res!940194 () Bool)

(assert (=> b!1401676 (=> (not res!940194) (not e!793684))))

(declare-datatypes ((List!32776 0))(
  ( (Nil!32773) (Cons!32772 (h!34020 (_ BitVec 64)) (t!47470 List!32776)) )
))
(declare-fun arrayNoDuplicates!0 (array!95813 (_ BitVec 32) List!32776) Bool)

(assert (=> b!1401676 (= res!940194 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32773))))

(declare-fun b!1401677 () Bool)

(assert (=> b!1401677 (= e!793682 (= (seekEntryOrOpen!0 (select (arr!46257 a!2901) j!112) a!2901 mask!2840) (Found!10574 j!112)))))

(declare-fun b!1401678 () Bool)

(declare-fun e!793685 () Bool)

(assert (=> b!1401678 (= e!793685 true)))

(declare-fun lt!617106 () SeekEntryResult!10574)

(assert (=> b!1401678 (= lt!617106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617102 lt!617103 lt!617108 mask!2840))))

(declare-fun b!1401679 () Bool)

(declare-fun res!940195 () Bool)

(assert (=> b!1401679 (=> (not res!940195) (not e!793684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401679 (= res!940195 (validKeyInArray!0 (select (arr!46257 a!2901) j!112)))))

(declare-fun b!1401680 () Bool)

(declare-fun res!940189 () Bool)

(assert (=> b!1401680 (=> (not res!940189) (not e!793684))))

(assert (=> b!1401680 (= res!940189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401681 () Bool)

(declare-fun res!940192 () Bool)

(assert (=> b!1401681 (=> (not res!940192) (not e!793684))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401681 (= res!940192 (validKeyInArray!0 (select (arr!46257 a!2901) i!1037)))))

(declare-fun b!1401682 () Bool)

(declare-fun res!940186 () Bool)

(assert (=> b!1401682 (=> (not res!940186) (not e!793684))))

(assert (=> b!1401682 (= res!940186 (and (= (size!46807 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46807 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46807 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401683 () Bool)

(declare-fun e!793686 () Bool)

(assert (=> b!1401683 (= e!793686 e!793685)))

(declare-fun res!940190 () Bool)

(assert (=> b!1401683 (=> res!940190 e!793685)))

(assert (=> b!1401683 (= res!940190 (or (bvslt (x!126305 lt!617104) #b00000000000000000000000000000000) (bvsgt (x!126305 lt!617104) #b01111111111111111111111111111110) (bvslt (x!126305 lt!617109) #b00000000000000000000000000000000) (bvsgt (x!126305 lt!617109) #b01111111111111111111111111111110) (bvslt lt!617102 #b00000000000000000000000000000000) (bvsge lt!617102 (size!46807 a!2901)) (bvslt (index!44675 lt!617104) #b00000000000000000000000000000000) (bvsge (index!44675 lt!617104) (size!46807 a!2901)) (bvslt (index!44675 lt!617109) #b00000000000000000000000000000000) (bvsge (index!44675 lt!617109) (size!46807 a!2901)) (not (= lt!617104 (Intermediate!10574 false (index!44675 lt!617104) (x!126305 lt!617104)))) (not (= lt!617109 (Intermediate!10574 false (index!44675 lt!617109) (x!126305 lt!617109))))))))

(assert (=> b!1401683 e!793688))

(declare-fun res!940187 () Bool)

(assert (=> b!1401683 (=> (not res!940187) (not e!793688))))

(assert (=> b!1401683 (= res!940187 (and (not (undefined!11386 lt!617109)) (= (index!44675 lt!617109) i!1037) (bvslt (x!126305 lt!617109) (x!126305 lt!617104)) (= (select (store (arr!46257 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44675 lt!617109)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617105 () Unit!47152)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47152)

(assert (=> b!1401683 (= lt!617105 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617102 (x!126305 lt!617104) (index!44675 lt!617104) (x!126305 lt!617109) (index!44675 lt!617109) (undefined!11386 lt!617109) mask!2840))))

(declare-fun b!1401684 () Bool)

(assert (=> b!1401684 (= e!793683 e!793686)))

(declare-fun res!940193 () Bool)

(assert (=> b!1401684 (=> res!940193 e!793686)))

(assert (=> b!1401684 (= res!940193 (or (= lt!617104 lt!617109) (not ((_ is Intermediate!10574) lt!617109))))))

(assert (=> b!1401684 (= lt!617109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617103 mask!2840) lt!617103 lt!617108 mask!2840))))

(assert (=> b!1401684 (= lt!617103 (select (store (arr!46257 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401684 (= lt!617108 (array!95814 (store (arr!46257 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46807 a!2901)))))

(assert (= (and start!120404 res!940185) b!1401682))

(assert (= (and b!1401682 res!940186) b!1401681))

(assert (= (and b!1401681 res!940192) b!1401679))

(assert (= (and b!1401679 res!940195) b!1401680))

(assert (= (and b!1401680 res!940189) b!1401676))

(assert (= (and b!1401676 res!940194) b!1401674))

(assert (= (and b!1401674 res!940191) b!1401677))

(assert (= (and b!1401674 (not res!940188)) b!1401684))

(assert (= (and b!1401684 (not res!940193)) b!1401683))

(assert (= (and b!1401683 res!940187) b!1401675))

(assert (= (and b!1401683 (not res!940190)) b!1401678))

(declare-fun m!1289537 () Bool)

(assert (=> b!1401676 m!1289537))

(declare-fun m!1289539 () Bool)

(assert (=> b!1401683 m!1289539))

(declare-fun m!1289541 () Bool)

(assert (=> b!1401683 m!1289541))

(declare-fun m!1289543 () Bool)

(assert (=> b!1401683 m!1289543))

(declare-fun m!1289545 () Bool)

(assert (=> b!1401680 m!1289545))

(declare-fun m!1289547 () Bool)

(assert (=> b!1401678 m!1289547))

(declare-fun m!1289549 () Bool)

(assert (=> start!120404 m!1289549))

(declare-fun m!1289551 () Bool)

(assert (=> start!120404 m!1289551))

(declare-fun m!1289553 () Bool)

(assert (=> b!1401679 m!1289553))

(assert (=> b!1401679 m!1289553))

(declare-fun m!1289555 () Bool)

(assert (=> b!1401679 m!1289555))

(assert (=> b!1401677 m!1289553))

(assert (=> b!1401677 m!1289553))

(declare-fun m!1289557 () Bool)

(assert (=> b!1401677 m!1289557))

(declare-fun m!1289559 () Bool)

(assert (=> b!1401684 m!1289559))

(assert (=> b!1401684 m!1289559))

(declare-fun m!1289561 () Bool)

(assert (=> b!1401684 m!1289561))

(assert (=> b!1401684 m!1289539))

(declare-fun m!1289563 () Bool)

(assert (=> b!1401684 m!1289563))

(assert (=> b!1401674 m!1289553))

(declare-fun m!1289565 () Bool)

(assert (=> b!1401674 m!1289565))

(assert (=> b!1401674 m!1289553))

(declare-fun m!1289567 () Bool)

(assert (=> b!1401674 m!1289567))

(assert (=> b!1401674 m!1289553))

(declare-fun m!1289569 () Bool)

(assert (=> b!1401674 m!1289569))

(declare-fun m!1289571 () Bool)

(assert (=> b!1401674 m!1289571))

(declare-fun m!1289573 () Bool)

(assert (=> b!1401681 m!1289573))

(assert (=> b!1401681 m!1289573))

(declare-fun m!1289575 () Bool)

(assert (=> b!1401681 m!1289575))

(declare-fun m!1289577 () Bool)

(assert (=> b!1401675 m!1289577))

(assert (=> b!1401675 m!1289553))

(assert (=> b!1401675 m!1289553))

(declare-fun m!1289579 () Bool)

(assert (=> b!1401675 m!1289579))

(check-sat (not b!1401678) (not b!1401677) (not b!1401683) (not b!1401684) (not b!1401674) (not b!1401680) (not b!1401676) (not b!1401681) (not b!1401675) (not b!1401679) (not start!120404))
(check-sat)
