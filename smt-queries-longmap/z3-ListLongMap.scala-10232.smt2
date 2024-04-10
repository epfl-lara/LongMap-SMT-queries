; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120446 () Bool)

(assert start!120446)

(declare-fun b!1402353 () Bool)

(declare-fun e!794097 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1402353 (= e!794097 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10595 0))(
  ( (MissingZero!10595 (index!44757 (_ BitVec 32))) (Found!10595 (index!44758 (_ BitVec 32))) (Intermediate!10595 (undefined!11407 Bool) (index!44759 (_ BitVec 32)) (x!126382 (_ BitVec 32))) (Undefined!10595) (MissingVacant!10595 (index!44760 (_ BitVec 32))) )
))
(declare-fun lt!617642 () SeekEntryResult!10595)

(declare-fun lt!617637 () SeekEntryResult!10595)

(assert (=> b!1402353 (= lt!617642 lt!617637)))

(declare-datatypes ((array!95855 0))(
  ( (array!95856 (arr!46278 (Array (_ BitVec 32) (_ BitVec 64))) (size!46828 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95855)

(declare-datatypes ((Unit!47194 0))(
  ( (Unit!47195) )
))
(declare-fun lt!617636 () Unit!47194)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!617634 () SeekEntryResult!10595)

(declare-fun lt!617641 () (_ BitVec 32))

(declare-fun lt!617635 () SeekEntryResult!10595)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47194)

(assert (=> b!1402353 (= lt!617636 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617641 (x!126382 lt!617634) (index!44759 lt!617634) (x!126382 lt!617635) (index!44759 lt!617635) mask!2840))))

(declare-fun b!1402354 () Bool)

(declare-fun res!940872 () Bool)

(declare-fun e!794096 () Bool)

(assert (=> b!1402354 (=> (not res!940872) (not e!794096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402354 (= res!940872 (validKeyInArray!0 (select (arr!46278 a!2901) i!1037)))))

(declare-fun b!1402355 () Bool)

(declare-fun e!794095 () Bool)

(assert (=> b!1402355 (= e!794096 (not e!794095))))

(declare-fun res!940865 () Bool)

(assert (=> b!1402355 (=> res!940865 e!794095)))

(get-info :version)

(assert (=> b!1402355 (= res!940865 (or (not ((_ is Intermediate!10595) lt!617634)) (undefined!11407 lt!617634)))))

(assert (=> b!1402355 (= lt!617642 (Found!10595 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95855 (_ BitVec 32)) SeekEntryResult!10595)

(assert (=> b!1402355 (= lt!617642 (seekEntryOrOpen!0 (select (arr!46278 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95855 (_ BitVec 32)) Bool)

(assert (=> b!1402355 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617639 () Unit!47194)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47194)

(assert (=> b!1402355 (= lt!617639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95855 (_ BitVec 32)) SeekEntryResult!10595)

(assert (=> b!1402355 (= lt!617634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617641 (select (arr!46278 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402355 (= lt!617641 (toIndex!0 (select (arr!46278 a!2901) j!112) mask!2840))))

(declare-fun b!1402356 () Bool)

(declare-fun res!940867 () Bool)

(assert (=> b!1402356 (=> res!940867 e!794097)))

(declare-fun lt!617640 () array!95855)

(declare-fun lt!617643 () (_ BitVec 64))

(assert (=> b!1402356 (= res!940867 (not (= lt!617635 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617641 lt!617643 lt!617640 mask!2840))))))

(declare-fun res!940873 () Bool)

(assert (=> start!120446 (=> (not res!940873) (not e!794096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120446 (= res!940873 (validMask!0 mask!2840))))

(assert (=> start!120446 e!794096))

(assert (=> start!120446 true))

(declare-fun array_inv!35306 (array!95855) Bool)

(assert (=> start!120446 (array_inv!35306 a!2901)))

(declare-fun b!1402357 () Bool)

(declare-fun res!940868 () Bool)

(assert (=> b!1402357 (=> (not res!940868) (not e!794096))))

(assert (=> b!1402357 (= res!940868 (validKeyInArray!0 (select (arr!46278 a!2901) j!112)))))

(declare-fun b!1402358 () Bool)

(declare-fun res!940864 () Bool)

(assert (=> b!1402358 (=> (not res!940864) (not e!794096))))

(declare-datatypes ((List!32797 0))(
  ( (Nil!32794) (Cons!32793 (h!34041 (_ BitVec 64)) (t!47491 List!32797)) )
))
(declare-fun arrayNoDuplicates!0 (array!95855 (_ BitVec 32) List!32797) Bool)

(assert (=> b!1402358 (= res!940864 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32794))))

(declare-fun b!1402359 () Bool)

(declare-fun res!940866 () Bool)

(assert (=> b!1402359 (=> (not res!940866) (not e!794096))))

(assert (=> b!1402359 (= res!940866 (and (= (size!46828 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46828 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46828 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402360 () Bool)

(declare-fun e!794099 () Bool)

(assert (=> b!1402360 (= e!794099 e!794097)))

(declare-fun res!940869 () Bool)

(assert (=> b!1402360 (=> res!940869 e!794097)))

(assert (=> b!1402360 (= res!940869 (or (bvslt (x!126382 lt!617634) #b00000000000000000000000000000000) (bvsgt (x!126382 lt!617634) #b01111111111111111111111111111110) (bvslt (x!126382 lt!617635) #b00000000000000000000000000000000) (bvsgt (x!126382 lt!617635) #b01111111111111111111111111111110) (bvslt lt!617641 #b00000000000000000000000000000000) (bvsge lt!617641 (size!46828 a!2901)) (bvslt (index!44759 lt!617634) #b00000000000000000000000000000000) (bvsge (index!44759 lt!617634) (size!46828 a!2901)) (bvslt (index!44759 lt!617635) #b00000000000000000000000000000000) (bvsge (index!44759 lt!617635) (size!46828 a!2901)) (not (= lt!617634 (Intermediate!10595 false (index!44759 lt!617634) (x!126382 lt!617634)))) (not (= lt!617635 (Intermediate!10595 false (index!44759 lt!617635) (x!126382 lt!617635))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95855 (_ BitVec 32)) SeekEntryResult!10595)

(assert (=> b!1402360 (= lt!617637 (seekKeyOrZeroReturnVacant!0 (x!126382 lt!617635) (index!44759 lt!617635) (index!44759 lt!617635) (select (arr!46278 a!2901) j!112) lt!617640 mask!2840))))

(assert (=> b!1402360 (= lt!617637 (seekEntryOrOpen!0 lt!617643 lt!617640 mask!2840))))

(assert (=> b!1402360 (and (not (undefined!11407 lt!617635)) (= (index!44759 lt!617635) i!1037) (bvslt (x!126382 lt!617635) (x!126382 lt!617634)) (= (select (store (arr!46278 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44759 lt!617635)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617638 () Unit!47194)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47194)

(assert (=> b!1402360 (= lt!617638 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617641 (x!126382 lt!617634) (index!44759 lt!617634) (x!126382 lt!617635) (index!44759 lt!617635) (undefined!11407 lt!617635) mask!2840))))

(declare-fun b!1402361 () Bool)

(declare-fun res!940870 () Bool)

(assert (=> b!1402361 (=> (not res!940870) (not e!794096))))

(assert (=> b!1402361 (= res!940870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402362 () Bool)

(assert (=> b!1402362 (= e!794095 e!794099)))

(declare-fun res!940871 () Bool)

(assert (=> b!1402362 (=> res!940871 e!794099)))

(assert (=> b!1402362 (= res!940871 (or (= lt!617634 lt!617635) (not ((_ is Intermediate!10595) lt!617635))))))

(assert (=> b!1402362 (= lt!617635 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617643 mask!2840) lt!617643 lt!617640 mask!2840))))

(assert (=> b!1402362 (= lt!617643 (select (store (arr!46278 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402362 (= lt!617640 (array!95856 (store (arr!46278 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46828 a!2901)))))

(assert (= (and start!120446 res!940873) b!1402359))

(assert (= (and b!1402359 res!940866) b!1402354))

(assert (= (and b!1402354 res!940872) b!1402357))

(assert (= (and b!1402357 res!940868) b!1402361))

(assert (= (and b!1402361 res!940870) b!1402358))

(assert (= (and b!1402358 res!940864) b!1402355))

(assert (= (and b!1402355 (not res!940865)) b!1402362))

(assert (= (and b!1402362 (not res!940871)) b!1402360))

(assert (= (and b!1402360 (not res!940869)) b!1402356))

(assert (= (and b!1402356 (not res!940867)) b!1402353))

(declare-fun m!1290469 () Bool)

(assert (=> b!1402353 m!1290469))

(declare-fun m!1290471 () Bool)

(assert (=> b!1402362 m!1290471))

(assert (=> b!1402362 m!1290471))

(declare-fun m!1290473 () Bool)

(assert (=> b!1402362 m!1290473))

(declare-fun m!1290475 () Bool)

(assert (=> b!1402362 m!1290475))

(declare-fun m!1290477 () Bool)

(assert (=> b!1402362 m!1290477))

(declare-fun m!1290479 () Bool)

(assert (=> b!1402358 m!1290479))

(declare-fun m!1290481 () Bool)

(assert (=> b!1402355 m!1290481))

(declare-fun m!1290483 () Bool)

(assert (=> b!1402355 m!1290483))

(assert (=> b!1402355 m!1290481))

(declare-fun m!1290485 () Bool)

(assert (=> b!1402355 m!1290485))

(assert (=> b!1402355 m!1290481))

(declare-fun m!1290487 () Bool)

(assert (=> b!1402355 m!1290487))

(assert (=> b!1402355 m!1290481))

(declare-fun m!1290489 () Bool)

(assert (=> b!1402355 m!1290489))

(declare-fun m!1290491 () Bool)

(assert (=> b!1402355 m!1290491))

(declare-fun m!1290493 () Bool)

(assert (=> b!1402361 m!1290493))

(declare-fun m!1290495 () Bool)

(assert (=> b!1402354 m!1290495))

(assert (=> b!1402354 m!1290495))

(declare-fun m!1290497 () Bool)

(assert (=> b!1402354 m!1290497))

(declare-fun m!1290499 () Bool)

(assert (=> b!1402360 m!1290499))

(assert (=> b!1402360 m!1290481))

(declare-fun m!1290501 () Bool)

(assert (=> b!1402360 m!1290501))

(declare-fun m!1290503 () Bool)

(assert (=> b!1402360 m!1290503))

(assert (=> b!1402360 m!1290481))

(declare-fun m!1290505 () Bool)

(assert (=> b!1402360 m!1290505))

(assert (=> b!1402360 m!1290475))

(declare-fun m!1290507 () Bool)

(assert (=> start!120446 m!1290507))

(declare-fun m!1290509 () Bool)

(assert (=> start!120446 m!1290509))

(assert (=> b!1402357 m!1290481))

(assert (=> b!1402357 m!1290481))

(declare-fun m!1290511 () Bool)

(assert (=> b!1402357 m!1290511))

(declare-fun m!1290513 () Bool)

(assert (=> b!1402356 m!1290513))

(check-sat (not b!1402362) (not b!1402355) (not start!120446) (not b!1402360) (not b!1402353) (not b!1402361) (not b!1402358) (not b!1402356) (not b!1402354) (not b!1402357))
(check-sat)
