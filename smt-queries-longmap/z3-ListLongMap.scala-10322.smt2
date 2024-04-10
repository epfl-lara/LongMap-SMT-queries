; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121418 () Bool)

(assert start!121418)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96419 0))(
  ( (array!96420 (arr!46548 (Array (_ BitVec 32) (_ BitVec 64))) (size!47098 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96419)

(declare-fun e!798314 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1410683 () Bool)

(declare-datatypes ((SeekEntryResult!10859 0))(
  ( (MissingZero!10859 (index!45813 (_ BitVec 32))) (Found!10859 (index!45814 (_ BitVec 32))) (Intermediate!10859 (undefined!11671 Bool) (index!45815 (_ BitVec 32)) (x!127414 (_ BitVec 32))) (Undefined!10859) (MissingVacant!10859 (index!45816 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96419 (_ BitVec 32)) SeekEntryResult!10859)

(assert (=> b!1410683 (= e!798314 (= (seekEntryOrOpen!0 (select (arr!46548 a!2901) j!112) a!2901 mask!2840) (Found!10859 j!112)))))

(declare-fun b!1410684 () Bool)

(declare-fun res!947913 () Bool)

(declare-fun e!798311 () Bool)

(assert (=> b!1410684 (=> (not res!947913) (not e!798311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410684 (= res!947913 (validKeyInArray!0 (select (arr!46548 a!2901) j!112)))))

(declare-fun b!1410685 () Bool)

(declare-fun res!947915 () Bool)

(assert (=> b!1410685 (=> (not res!947915) (not e!798311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96419 (_ BitVec 32)) Bool)

(assert (=> b!1410685 (= res!947915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun lt!621287 () SeekEntryResult!10859)

(declare-fun lt!621288 () (_ BitVec 32))

(declare-fun b!1410686 () Bool)

(declare-fun lt!621286 () SeekEntryResult!10859)

(declare-fun e!798313 () Bool)

(get-info :version)

(assert (=> b!1410686 (= e!798313 (or (= lt!621287 lt!621286) (not ((_ is Intermediate!10859) lt!621286)) (bvslt (x!127414 lt!621287) #b00000000000000000000000000000000) (bvsgt (x!127414 lt!621287) #b01111111111111111111111111111110) (bvslt lt!621288 #b00000000000000000000000000000000) (bvsge lt!621288 (size!47098 a!2901)) (bvslt (index!45815 lt!621287) #b00000000000000000000000000000000) (bvsge (index!45815 lt!621287) (size!47098 a!2901)) (= lt!621287 (Intermediate!10859 false (index!45815 lt!621287) (x!127414 lt!621287)))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96419 (_ BitVec 32)) SeekEntryResult!10859)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410686 (= lt!621286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96420 (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47098 a!2901)) mask!2840))))

(declare-fun b!1410687 () Bool)

(assert (=> b!1410687 (= e!798311 (not e!798313))))

(declare-fun res!947914 () Bool)

(assert (=> b!1410687 (=> res!947914 e!798313)))

(assert (=> b!1410687 (= res!947914 (or (not ((_ is Intermediate!10859) lt!621287)) (undefined!11671 lt!621287)))))

(assert (=> b!1410687 e!798314))

(declare-fun res!947912 () Bool)

(assert (=> b!1410687 (=> (not res!947912) (not e!798314))))

(assert (=> b!1410687 (= res!947912 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47692 0))(
  ( (Unit!47693) )
))
(declare-fun lt!621285 () Unit!47692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47692)

(assert (=> b!1410687 (= lt!621285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410687 (= lt!621287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621288 (select (arr!46548 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410687 (= lt!621288 (toIndex!0 (select (arr!46548 a!2901) j!112) mask!2840))))

(declare-fun b!1410688 () Bool)

(declare-fun res!947917 () Bool)

(assert (=> b!1410688 (=> (not res!947917) (not e!798311))))

(assert (=> b!1410688 (= res!947917 (validKeyInArray!0 (select (arr!46548 a!2901) i!1037)))))

(declare-fun b!1410689 () Bool)

(declare-fun res!947911 () Bool)

(assert (=> b!1410689 (=> (not res!947911) (not e!798311))))

(declare-datatypes ((List!33067 0))(
  ( (Nil!33064) (Cons!33063 (h!34335 (_ BitVec 64)) (t!47761 List!33067)) )
))
(declare-fun arrayNoDuplicates!0 (array!96419 (_ BitVec 32) List!33067) Bool)

(assert (=> b!1410689 (= res!947911 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33064))))

(declare-fun res!947910 () Bool)

(assert (=> start!121418 (=> (not res!947910) (not e!798311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121418 (= res!947910 (validMask!0 mask!2840))))

(assert (=> start!121418 e!798311))

(assert (=> start!121418 true))

(declare-fun array_inv!35576 (array!96419) Bool)

(assert (=> start!121418 (array_inv!35576 a!2901)))

(declare-fun b!1410690 () Bool)

(declare-fun res!947916 () Bool)

(assert (=> b!1410690 (=> (not res!947916) (not e!798311))))

(assert (=> b!1410690 (= res!947916 (and (= (size!47098 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47098 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47098 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121418 res!947910) b!1410690))

(assert (= (and b!1410690 res!947916) b!1410688))

(assert (= (and b!1410688 res!947917) b!1410684))

(assert (= (and b!1410684 res!947913) b!1410685))

(assert (= (and b!1410685 res!947915) b!1410689))

(assert (= (and b!1410689 res!947911) b!1410687))

(assert (= (and b!1410687 res!947912) b!1410683))

(assert (= (and b!1410687 (not res!947914)) b!1410686))

(declare-fun m!1300297 () Bool)

(assert (=> b!1410683 m!1300297))

(assert (=> b!1410683 m!1300297))

(declare-fun m!1300299 () Bool)

(assert (=> b!1410683 m!1300299))

(declare-fun m!1300301 () Bool)

(assert (=> b!1410686 m!1300301))

(declare-fun m!1300303 () Bool)

(assert (=> b!1410686 m!1300303))

(assert (=> b!1410686 m!1300303))

(declare-fun m!1300305 () Bool)

(assert (=> b!1410686 m!1300305))

(assert (=> b!1410686 m!1300305))

(assert (=> b!1410686 m!1300303))

(declare-fun m!1300307 () Bool)

(assert (=> b!1410686 m!1300307))

(declare-fun m!1300309 () Bool)

(assert (=> start!121418 m!1300309))

(declare-fun m!1300311 () Bool)

(assert (=> start!121418 m!1300311))

(declare-fun m!1300313 () Bool)

(assert (=> b!1410685 m!1300313))

(declare-fun m!1300315 () Bool)

(assert (=> b!1410688 m!1300315))

(assert (=> b!1410688 m!1300315))

(declare-fun m!1300317 () Bool)

(assert (=> b!1410688 m!1300317))

(assert (=> b!1410687 m!1300297))

(declare-fun m!1300319 () Bool)

(assert (=> b!1410687 m!1300319))

(assert (=> b!1410687 m!1300297))

(assert (=> b!1410687 m!1300297))

(declare-fun m!1300321 () Bool)

(assert (=> b!1410687 m!1300321))

(declare-fun m!1300323 () Bool)

(assert (=> b!1410687 m!1300323))

(declare-fun m!1300325 () Bool)

(assert (=> b!1410687 m!1300325))

(assert (=> b!1410684 m!1300297))

(assert (=> b!1410684 m!1300297))

(declare-fun m!1300327 () Bool)

(assert (=> b!1410684 m!1300327))

(declare-fun m!1300329 () Bool)

(assert (=> b!1410689 m!1300329))

(check-sat (not b!1410686) (not b!1410684) (not start!121418) (not b!1410685) (not b!1410683) (not b!1410689) (not b!1410687) (not b!1410688))
(check-sat)
