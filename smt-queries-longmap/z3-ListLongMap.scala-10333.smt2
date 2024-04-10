; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121484 () Bool)

(assert start!121484)

(declare-fun b!1411579 () Bool)

(declare-fun res!948812 () Bool)

(declare-fun e!798804 () Bool)

(assert (=> b!1411579 (=> (not res!948812) (not e!798804))))

(declare-datatypes ((array!96485 0))(
  ( (array!96486 (arr!46581 (Array (_ BitVec 32) (_ BitVec 64))) (size!47131 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96485)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96485 (_ BitVec 32)) Bool)

(assert (=> b!1411579 (= res!948812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!798805 () Bool)

(declare-fun b!1411580 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10892 0))(
  ( (MissingZero!10892 (index!45945 (_ BitVec 32))) (Found!10892 (index!45946 (_ BitVec 32))) (Intermediate!10892 (undefined!11704 Bool) (index!45947 (_ BitVec 32)) (x!127535 (_ BitVec 32))) (Undefined!10892) (MissingVacant!10892 (index!45948 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96485 (_ BitVec 32)) SeekEntryResult!10892)

(assert (=> b!1411580 (= e!798805 (= (seekEntryOrOpen!0 (select (arr!46581 a!2901) j!112) a!2901 mask!2840) (Found!10892 j!112)))))

(declare-fun res!948814 () Bool)

(assert (=> start!121484 (=> (not res!948814) (not e!798804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121484 (= res!948814 (validMask!0 mask!2840))))

(assert (=> start!121484 e!798804))

(assert (=> start!121484 true))

(declare-fun array_inv!35609 (array!96485) Bool)

(assert (=> start!121484 (array_inv!35609 a!2901)))

(declare-fun b!1411581 () Bool)

(declare-fun res!948806 () Bool)

(assert (=> b!1411581 (=> (not res!948806) (not e!798804))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1411581 (= res!948806 (and (= (size!47131 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47131 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47131 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411582 () Bool)

(declare-fun res!948813 () Bool)

(assert (=> b!1411582 (=> (not res!948813) (not e!798804))))

(declare-datatypes ((List!33100 0))(
  ( (Nil!33097) (Cons!33096 (h!34368 (_ BitVec 64)) (t!47794 List!33100)) )
))
(declare-fun arrayNoDuplicates!0 (array!96485 (_ BitVec 32) List!33100) Bool)

(assert (=> b!1411582 (= res!948813 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33097))))

(declare-fun b!1411583 () Bool)

(declare-fun e!798802 () Bool)

(assert (=> b!1411583 (= e!798802 true)))

(declare-fun lt!621812 () SeekEntryResult!10892)

(declare-fun lt!621810 () SeekEntryResult!10892)

(assert (=> b!1411583 (and (not (undefined!11704 lt!621810)) (= (index!45947 lt!621810) i!1037) (bvslt (x!127535 lt!621810) (x!127535 lt!621812)) (= (select (store (arr!46581 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45947 lt!621810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47758 0))(
  ( (Unit!47759) )
))
(declare-fun lt!621811 () Unit!47758)

(declare-fun lt!621809 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47758)

(assert (=> b!1411583 (= lt!621811 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621809 (x!127535 lt!621812) (index!45947 lt!621812) (x!127535 lt!621810) (index!45947 lt!621810) (undefined!11704 lt!621810) mask!2840))))

(declare-fun b!1411584 () Bool)

(declare-fun res!948811 () Bool)

(assert (=> b!1411584 (=> (not res!948811) (not e!798804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411584 (= res!948811 (validKeyInArray!0 (select (arr!46581 a!2901) i!1037)))))

(declare-fun b!1411585 () Bool)

(declare-fun e!798803 () Bool)

(assert (=> b!1411585 (= e!798804 (not e!798803))))

(declare-fun res!948808 () Bool)

(assert (=> b!1411585 (=> res!948808 e!798803)))

(get-info :version)

(assert (=> b!1411585 (= res!948808 (or (not ((_ is Intermediate!10892) lt!621812)) (undefined!11704 lt!621812)))))

(assert (=> b!1411585 e!798805))

(declare-fun res!948807 () Bool)

(assert (=> b!1411585 (=> (not res!948807) (not e!798805))))

(assert (=> b!1411585 (= res!948807 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621813 () Unit!47758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47758)

(assert (=> b!1411585 (= lt!621813 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96485 (_ BitVec 32)) SeekEntryResult!10892)

(assert (=> b!1411585 (= lt!621812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621809 (select (arr!46581 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411585 (= lt!621809 (toIndex!0 (select (arr!46581 a!2901) j!112) mask!2840))))

(declare-fun b!1411586 () Bool)

(declare-fun res!948809 () Bool)

(assert (=> b!1411586 (=> (not res!948809) (not e!798804))))

(assert (=> b!1411586 (= res!948809 (validKeyInArray!0 (select (arr!46581 a!2901) j!112)))))

(declare-fun b!1411587 () Bool)

(assert (=> b!1411587 (= e!798803 e!798802)))

(declare-fun res!948810 () Bool)

(assert (=> b!1411587 (=> res!948810 e!798802)))

(assert (=> b!1411587 (= res!948810 (or (= lt!621812 lt!621810) (not ((_ is Intermediate!10892) lt!621810))))))

(declare-fun lt!621808 () (_ BitVec 64))

(assert (=> b!1411587 (= lt!621810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621808 mask!2840) lt!621808 (array!96486 (store (arr!46581 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47131 a!2901)) mask!2840))))

(assert (=> b!1411587 (= lt!621808 (select (store (arr!46581 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!121484 res!948814) b!1411581))

(assert (= (and b!1411581 res!948806) b!1411584))

(assert (= (and b!1411584 res!948811) b!1411586))

(assert (= (and b!1411586 res!948809) b!1411579))

(assert (= (and b!1411579 res!948812) b!1411582))

(assert (= (and b!1411582 res!948813) b!1411585))

(assert (= (and b!1411585 res!948807) b!1411580))

(assert (= (and b!1411585 (not res!948808)) b!1411587))

(assert (= (and b!1411587 (not res!948810)) b!1411583))

(declare-fun m!1301483 () Bool)

(assert (=> b!1411584 m!1301483))

(assert (=> b!1411584 m!1301483))

(declare-fun m!1301485 () Bool)

(assert (=> b!1411584 m!1301485))

(declare-fun m!1301487 () Bool)

(assert (=> b!1411579 m!1301487))

(declare-fun m!1301489 () Bool)

(assert (=> b!1411580 m!1301489))

(assert (=> b!1411580 m!1301489))

(declare-fun m!1301491 () Bool)

(assert (=> b!1411580 m!1301491))

(declare-fun m!1301493 () Bool)

(assert (=> b!1411583 m!1301493))

(declare-fun m!1301495 () Bool)

(assert (=> b!1411583 m!1301495))

(declare-fun m!1301497 () Bool)

(assert (=> b!1411583 m!1301497))

(declare-fun m!1301499 () Bool)

(assert (=> start!121484 m!1301499))

(declare-fun m!1301501 () Bool)

(assert (=> start!121484 m!1301501))

(declare-fun m!1301503 () Bool)

(assert (=> b!1411587 m!1301503))

(assert (=> b!1411587 m!1301493))

(assert (=> b!1411587 m!1301503))

(declare-fun m!1301505 () Bool)

(assert (=> b!1411587 m!1301505))

(declare-fun m!1301507 () Bool)

(assert (=> b!1411587 m!1301507))

(declare-fun m!1301509 () Bool)

(assert (=> b!1411582 m!1301509))

(assert (=> b!1411585 m!1301489))

(declare-fun m!1301511 () Bool)

(assert (=> b!1411585 m!1301511))

(assert (=> b!1411585 m!1301489))

(declare-fun m!1301513 () Bool)

(assert (=> b!1411585 m!1301513))

(declare-fun m!1301515 () Bool)

(assert (=> b!1411585 m!1301515))

(assert (=> b!1411585 m!1301489))

(declare-fun m!1301517 () Bool)

(assert (=> b!1411585 m!1301517))

(assert (=> b!1411586 m!1301489))

(assert (=> b!1411586 m!1301489))

(declare-fun m!1301519 () Bool)

(assert (=> b!1411586 m!1301519))

(check-sat (not start!121484) (not b!1411586) (not b!1411579) (not b!1411582) (not b!1411587) (not b!1411584) (not b!1411580) (not b!1411585) (not b!1411583))
(check-sat)
