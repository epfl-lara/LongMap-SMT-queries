; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120152 () Bool)

(assert start!120152)

(declare-fun res!935845 () Bool)

(declare-fun e!791335 () Bool)

(assert (=> start!120152 (=> (not res!935845) (not e!791335))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120152 (= res!935845 (validMask!0 mask!2840))))

(assert (=> start!120152 e!791335))

(assert (=> start!120152 true))

(declare-datatypes ((array!95603 0))(
  ( (array!95604 (arr!46153 (Array (_ BitVec 32) (_ BitVec 64))) (size!46704 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95603)

(declare-fun array_inv!35434 (array!95603) Bool)

(assert (=> start!120152 (array_inv!35434 a!2901)))

(declare-fun b!1397614 () Bool)

(declare-fun res!935850 () Bool)

(assert (=> b!1397614 (=> (not res!935850) (not e!791335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95603 (_ BitVec 32)) Bool)

(assert (=> b!1397614 (= res!935850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397615 () Bool)

(declare-fun e!791333 () Bool)

(assert (=> b!1397615 (= e!791335 (not e!791333))))

(declare-fun res!935844 () Bool)

(assert (=> b!1397615 (=> res!935844 e!791333)))

(declare-datatypes ((SeekEntryResult!10373 0))(
  ( (MissingZero!10373 (index!43863 (_ BitVec 32))) (Found!10373 (index!43864 (_ BitVec 32))) (Intermediate!10373 (undefined!11185 Bool) (index!43865 (_ BitVec 32)) (x!125686 (_ BitVec 32))) (Undefined!10373) (MissingVacant!10373 (index!43866 (_ BitVec 32))) )
))
(declare-fun lt!613856 () SeekEntryResult!10373)

(get-info :version)

(assert (=> b!1397615 (= res!935844 (or (not ((_ is Intermediate!10373) lt!613856)) (undefined!11185 lt!613856)))))

(declare-fun e!791332 () Bool)

(assert (=> b!1397615 e!791332))

(declare-fun res!935847 () Bool)

(assert (=> b!1397615 (=> (not res!935847) (not e!791332))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397615 (= res!935847 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46777 0))(
  ( (Unit!46778) )
))
(declare-fun lt!613851 () Unit!46777)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46777)

(assert (=> b!1397615 (= lt!613851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613853 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95603 (_ BitVec 32)) SeekEntryResult!10373)

(assert (=> b!1397615 (= lt!613856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613853 (select (arr!46153 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397615 (= lt!613853 (toIndex!0 (select (arr!46153 a!2901) j!112) mask!2840))))

(declare-fun b!1397616 () Bool)

(declare-fun res!935851 () Bool)

(assert (=> b!1397616 (=> (not res!935851) (not e!791335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397616 (= res!935851 (validKeyInArray!0 (select (arr!46153 a!2901) j!112)))))

(declare-fun b!1397617 () Bool)

(declare-fun res!935843 () Bool)

(assert (=> b!1397617 (=> (not res!935843) (not e!791335))))

(declare-datatypes ((List!32659 0))(
  ( (Nil!32656) (Cons!32655 (h!33905 (_ BitVec 64)) (t!47345 List!32659)) )
))
(declare-fun arrayNoDuplicates!0 (array!95603 (_ BitVec 32) List!32659) Bool)

(assert (=> b!1397617 (= res!935843 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32656))))

(declare-fun b!1397618 () Bool)

(declare-fun e!791336 () Bool)

(assert (=> b!1397618 (= e!791336 true)))

(declare-fun lt!613855 () SeekEntryResult!10373)

(declare-fun lt!613854 () array!95603)

(declare-fun lt!613850 () (_ BitVec 64))

(assert (=> b!1397618 (= lt!613855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613853 lt!613850 lt!613854 mask!2840))))

(declare-fun b!1397619 () Bool)

(declare-fun res!935849 () Bool)

(assert (=> b!1397619 (=> (not res!935849) (not e!791335))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397619 (= res!935849 (and (= (size!46704 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46704 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46704 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397620 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95603 (_ BitVec 32)) SeekEntryResult!10373)

(assert (=> b!1397620 (= e!791332 (= (seekEntryOrOpen!0 (select (arr!46153 a!2901) j!112) a!2901 mask!2840) (Found!10373 j!112)))))

(declare-fun b!1397621 () Bool)

(assert (=> b!1397621 (= e!791333 e!791336)))

(declare-fun res!935846 () Bool)

(assert (=> b!1397621 (=> res!935846 e!791336)))

(declare-fun lt!613852 () SeekEntryResult!10373)

(assert (=> b!1397621 (= res!935846 (or (= lt!613856 lt!613852) (not ((_ is Intermediate!10373) lt!613852)) (bvslt (x!125686 lt!613856) #b00000000000000000000000000000000) (bvsgt (x!125686 lt!613856) #b01111111111111111111111111111110) (bvslt lt!613853 #b00000000000000000000000000000000) (bvsge lt!613853 (size!46704 a!2901)) (bvslt (index!43865 lt!613856) #b00000000000000000000000000000000) (bvsge (index!43865 lt!613856) (size!46704 a!2901)) (not (= lt!613856 (Intermediate!10373 false (index!43865 lt!613856) (x!125686 lt!613856)))) (not (= lt!613852 (Intermediate!10373 (undefined!11185 lt!613852) (index!43865 lt!613852) (x!125686 lt!613852))))))))

(assert (=> b!1397621 (= lt!613852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613850 mask!2840) lt!613850 lt!613854 mask!2840))))

(assert (=> b!1397621 (= lt!613850 (select (store (arr!46153 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397621 (= lt!613854 (array!95604 (store (arr!46153 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46704 a!2901)))))

(declare-fun b!1397622 () Bool)

(declare-fun res!935848 () Bool)

(assert (=> b!1397622 (=> (not res!935848) (not e!791335))))

(assert (=> b!1397622 (= res!935848 (validKeyInArray!0 (select (arr!46153 a!2901) i!1037)))))

(assert (= (and start!120152 res!935845) b!1397619))

(assert (= (and b!1397619 res!935849) b!1397622))

(assert (= (and b!1397622 res!935848) b!1397616))

(assert (= (and b!1397616 res!935851) b!1397614))

(assert (= (and b!1397614 res!935850) b!1397617))

(assert (= (and b!1397617 res!935843) b!1397615))

(assert (= (and b!1397615 res!935847) b!1397620))

(assert (= (and b!1397615 (not res!935844)) b!1397621))

(assert (= (and b!1397621 (not res!935846)) b!1397618))

(declare-fun m!1284295 () Bool)

(assert (=> b!1397618 m!1284295))

(declare-fun m!1284297 () Bool)

(assert (=> b!1397615 m!1284297))

(declare-fun m!1284299 () Bool)

(assert (=> b!1397615 m!1284299))

(assert (=> b!1397615 m!1284297))

(declare-fun m!1284301 () Bool)

(assert (=> b!1397615 m!1284301))

(assert (=> b!1397615 m!1284297))

(declare-fun m!1284303 () Bool)

(assert (=> b!1397615 m!1284303))

(declare-fun m!1284305 () Bool)

(assert (=> b!1397615 m!1284305))

(declare-fun m!1284307 () Bool)

(assert (=> b!1397622 m!1284307))

(assert (=> b!1397622 m!1284307))

(declare-fun m!1284309 () Bool)

(assert (=> b!1397622 m!1284309))

(declare-fun m!1284311 () Bool)

(assert (=> b!1397621 m!1284311))

(assert (=> b!1397621 m!1284311))

(declare-fun m!1284313 () Bool)

(assert (=> b!1397621 m!1284313))

(declare-fun m!1284315 () Bool)

(assert (=> b!1397621 m!1284315))

(declare-fun m!1284317 () Bool)

(assert (=> b!1397621 m!1284317))

(assert (=> b!1397620 m!1284297))

(assert (=> b!1397620 m!1284297))

(declare-fun m!1284319 () Bool)

(assert (=> b!1397620 m!1284319))

(declare-fun m!1284321 () Bool)

(assert (=> start!120152 m!1284321))

(declare-fun m!1284323 () Bool)

(assert (=> start!120152 m!1284323))

(declare-fun m!1284325 () Bool)

(assert (=> b!1397617 m!1284325))

(assert (=> b!1397616 m!1284297))

(assert (=> b!1397616 m!1284297))

(declare-fun m!1284327 () Bool)

(assert (=> b!1397616 m!1284327))

(declare-fun m!1284329 () Bool)

(assert (=> b!1397614 m!1284329))

(check-sat (not b!1397622) (not b!1397618) (not b!1397614) (not start!120152) (not b!1397620) (not b!1397616) (not b!1397621) (not b!1397617) (not b!1397615))
(check-sat)
