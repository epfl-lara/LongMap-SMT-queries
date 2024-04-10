; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119696 () Bool)

(assert start!119696)

(declare-fun b!1394305 () Bool)

(declare-fun res!933716 () Bool)

(declare-fun e!789445 () Bool)

(assert (=> b!1394305 (=> (not res!933716) (not e!789445))))

(declare-datatypes ((array!95378 0))(
  ( (array!95379 (arr!46047 (Array (_ BitVec 32) (_ BitVec 64))) (size!46597 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95378)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95378 (_ BitVec 32)) Bool)

(assert (=> b!1394305 (= res!933716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394306 () Bool)

(declare-fun res!933719 () Bool)

(declare-fun e!789443 () Bool)

(assert (=> b!1394306 (=> res!933719 e!789443)))

(declare-datatypes ((SeekEntryResult!10364 0))(
  ( (MissingZero!10364 (index!43827 (_ BitVec 32))) (Found!10364 (index!43828 (_ BitVec 32))) (Intermediate!10364 (undefined!11176 Bool) (index!43829 (_ BitVec 32)) (x!125496 (_ BitVec 32))) (Undefined!10364) (MissingVacant!10364 (index!43830 (_ BitVec 32))) )
))
(declare-fun lt!612371 () SeekEntryResult!10364)

(declare-fun lt!612367 () (_ BitVec 32))

(assert (=> b!1394306 (= res!933719 (or (bvslt (x!125496 lt!612371) #b00000000000000000000000000000000) (bvsgt (x!125496 lt!612371) #b01111111111111111111111111111110) (bvslt lt!612367 #b00000000000000000000000000000000) (bvsge lt!612367 (size!46597 a!2901)) (bvslt (index!43829 lt!612371) #b00000000000000000000000000000000) (bvsge (index!43829 lt!612371) (size!46597 a!2901)) (not (= lt!612371 (Intermediate!10364 false (index!43829 lt!612371) (x!125496 lt!612371))))))))

(declare-fun res!933713 () Bool)

(assert (=> start!119696 (=> (not res!933713) (not e!789445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119696 (= res!933713 (validMask!0 mask!2840))))

(assert (=> start!119696 e!789445))

(assert (=> start!119696 true))

(declare-fun array_inv!35075 (array!95378) Bool)

(assert (=> start!119696 (array_inv!35075 a!2901)))

(declare-fun b!1394307 () Bool)

(declare-fun res!933717 () Bool)

(assert (=> b!1394307 (=> (not res!933717) (not e!789445))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394307 (= res!933717 (validKeyInArray!0 (select (arr!46047 a!2901) i!1037)))))

(declare-fun b!1394308 () Bool)

(declare-fun e!789444 () Bool)

(assert (=> b!1394308 (= e!789445 (not e!789444))))

(declare-fun res!933715 () Bool)

(assert (=> b!1394308 (=> res!933715 e!789444)))

(get-info :version)

(assert (=> b!1394308 (= res!933715 (or (not ((_ is Intermediate!10364) lt!612371)) (undefined!11176 lt!612371)))))

(declare-fun lt!612366 () SeekEntryResult!10364)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394308 (= lt!612366 (Found!10364 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95378 (_ BitVec 32)) SeekEntryResult!10364)

(assert (=> b!1394308 (= lt!612366 (seekEntryOrOpen!0 (select (arr!46047 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394308 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46732 0))(
  ( (Unit!46733) )
))
(declare-fun lt!612369 () Unit!46732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46732)

(assert (=> b!1394308 (= lt!612369 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95378 (_ BitVec 32)) SeekEntryResult!10364)

(assert (=> b!1394308 (= lt!612371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612367 (select (arr!46047 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394308 (= lt!612367 (toIndex!0 (select (arr!46047 a!2901) j!112) mask!2840))))

(declare-fun b!1394309 () Bool)

(assert (=> b!1394309 (= e!789443 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!612372 () (_ BitVec 64))

(declare-fun lt!612370 () array!95378)

(assert (=> b!1394309 (= lt!612366 (seekEntryOrOpen!0 lt!612372 lt!612370 mask!2840))))

(declare-fun lt!612368 () Unit!46732)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46732)

(assert (=> b!1394309 (= lt!612368 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612367 (x!125496 lt!612371) (index!43829 lt!612371) mask!2840))))

(declare-fun b!1394310 () Bool)

(declare-fun res!933718 () Bool)

(assert (=> b!1394310 (=> (not res!933718) (not e!789445))))

(assert (=> b!1394310 (= res!933718 (and (= (size!46597 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46597 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46597 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394311 () Bool)

(declare-fun res!933720 () Bool)

(assert (=> b!1394311 (=> (not res!933720) (not e!789445))))

(declare-datatypes ((List!32566 0))(
  ( (Nil!32563) (Cons!32562 (h!33795 (_ BitVec 64)) (t!47260 List!32566)) )
))
(declare-fun arrayNoDuplicates!0 (array!95378 (_ BitVec 32) List!32566) Bool)

(assert (=> b!1394311 (= res!933720 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32563))))

(declare-fun b!1394312 () Bool)

(declare-fun res!933714 () Bool)

(assert (=> b!1394312 (=> (not res!933714) (not e!789445))))

(assert (=> b!1394312 (= res!933714 (validKeyInArray!0 (select (arr!46047 a!2901) j!112)))))

(declare-fun b!1394313 () Bool)

(assert (=> b!1394313 (= e!789444 e!789443)))

(declare-fun res!933721 () Bool)

(assert (=> b!1394313 (=> res!933721 e!789443)))

(assert (=> b!1394313 (= res!933721 (not (= lt!612371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612372 mask!2840) lt!612372 lt!612370 mask!2840))))))

(assert (=> b!1394313 (= lt!612372 (select (store (arr!46047 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394313 (= lt!612370 (array!95379 (store (arr!46047 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901)))))

(assert (= (and start!119696 res!933713) b!1394310))

(assert (= (and b!1394310 res!933718) b!1394307))

(assert (= (and b!1394307 res!933717) b!1394312))

(assert (= (and b!1394312 res!933714) b!1394305))

(assert (= (and b!1394305 res!933716) b!1394311))

(assert (= (and b!1394311 res!933720) b!1394308))

(assert (= (and b!1394308 (not res!933715)) b!1394313))

(assert (= (and b!1394313 (not res!933721)) b!1394306))

(assert (= (and b!1394306 (not res!933719)) b!1394309))

(declare-fun m!1280573 () Bool)

(assert (=> b!1394307 m!1280573))

(assert (=> b!1394307 m!1280573))

(declare-fun m!1280575 () Bool)

(assert (=> b!1394307 m!1280575))

(declare-fun m!1280577 () Bool)

(assert (=> b!1394311 m!1280577))

(declare-fun m!1280579 () Bool)

(assert (=> b!1394305 m!1280579))

(declare-fun m!1280581 () Bool)

(assert (=> b!1394313 m!1280581))

(assert (=> b!1394313 m!1280581))

(declare-fun m!1280583 () Bool)

(assert (=> b!1394313 m!1280583))

(declare-fun m!1280585 () Bool)

(assert (=> b!1394313 m!1280585))

(declare-fun m!1280587 () Bool)

(assert (=> b!1394313 m!1280587))

(declare-fun m!1280589 () Bool)

(assert (=> b!1394308 m!1280589))

(declare-fun m!1280591 () Bool)

(assert (=> b!1394308 m!1280591))

(assert (=> b!1394308 m!1280589))

(declare-fun m!1280593 () Bool)

(assert (=> b!1394308 m!1280593))

(assert (=> b!1394308 m!1280589))

(declare-fun m!1280595 () Bool)

(assert (=> b!1394308 m!1280595))

(assert (=> b!1394308 m!1280589))

(declare-fun m!1280597 () Bool)

(assert (=> b!1394308 m!1280597))

(declare-fun m!1280599 () Bool)

(assert (=> b!1394308 m!1280599))

(declare-fun m!1280601 () Bool)

(assert (=> start!119696 m!1280601))

(declare-fun m!1280603 () Bool)

(assert (=> start!119696 m!1280603))

(assert (=> b!1394312 m!1280589))

(assert (=> b!1394312 m!1280589))

(declare-fun m!1280605 () Bool)

(assert (=> b!1394312 m!1280605))

(declare-fun m!1280607 () Bool)

(assert (=> b!1394309 m!1280607))

(declare-fun m!1280609 () Bool)

(assert (=> b!1394309 m!1280609))

(check-sat (not b!1394309) (not b!1394312) (not b!1394305) (not b!1394308) (not start!119696) (not b!1394307) (not b!1394311) (not b!1394313))
(check-sat)
