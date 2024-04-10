; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120122 () Bool)

(assert start!120122)

(declare-fun b!1398616 () Bool)

(declare-fun res!937531 () Bool)

(declare-fun e!791788 () Bool)

(assert (=> b!1398616 (=> (not res!937531) (not e!791788))))

(declare-datatypes ((array!95651 0))(
  ( (array!95652 (arr!46179 (Array (_ BitVec 32) (_ BitVec 64))) (size!46729 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95651)

(declare-datatypes ((List!32698 0))(
  ( (Nil!32695) (Cons!32694 (h!33936 (_ BitVec 64)) (t!47392 List!32698)) )
))
(declare-fun arrayNoDuplicates!0 (array!95651 (_ BitVec 32) List!32698) Bool)

(assert (=> b!1398616 (= res!937531 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32695))))

(declare-fun b!1398617 () Bool)

(declare-fun res!937530 () Bool)

(assert (=> b!1398617 (=> (not res!937530) (not e!791788))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398617 (= res!937530 (validKeyInArray!0 (select (arr!46179 a!2901) i!1037)))))

(declare-fun res!937534 () Bool)

(assert (=> start!120122 (=> (not res!937534) (not e!791788))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120122 (= res!937534 (validMask!0 mask!2840))))

(assert (=> start!120122 e!791788))

(assert (=> start!120122 true))

(declare-fun array_inv!35207 (array!95651) Bool)

(assert (=> start!120122 (array_inv!35207 a!2901)))

(declare-fun b!1398618 () Bool)

(declare-fun e!791792 () Bool)

(declare-fun e!791790 () Bool)

(assert (=> b!1398618 (= e!791792 e!791790)))

(declare-fun res!937533 () Bool)

(assert (=> b!1398618 (=> res!937533 e!791790)))

(declare-datatypes ((SeekEntryResult!10496 0))(
  ( (MissingZero!10496 (index!44355 (_ BitVec 32))) (Found!10496 (index!44356 (_ BitVec 32))) (Intermediate!10496 (undefined!11308 Bool) (index!44357 (_ BitVec 32)) (x!125998 (_ BitVec 32))) (Undefined!10496) (MissingVacant!10496 (index!44358 (_ BitVec 32))) )
))
(declare-fun lt!615047 () SeekEntryResult!10496)

(declare-fun lt!615046 () SeekEntryResult!10496)

(get-info :version)

(assert (=> b!1398618 (= res!937533 (or (= lt!615047 lt!615046) (not ((_ is Intermediate!10496) lt!615046))))))

(declare-fun lt!615045 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95651 (_ BitVec 32)) SeekEntryResult!10496)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398618 (= lt!615046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615045 mask!2840) lt!615045 (array!95652 (store (arr!46179 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46729 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398618 (= lt!615045 (select (store (arr!46179 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398619 () Bool)

(declare-fun res!937532 () Bool)

(assert (=> b!1398619 (=> (not res!937532) (not e!791788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95651 (_ BitVec 32)) Bool)

(assert (=> b!1398619 (= res!937532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!791791 () Bool)

(declare-fun b!1398620 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95651 (_ BitVec 32)) SeekEntryResult!10496)

(assert (=> b!1398620 (= e!791791 (= (seekEntryOrOpen!0 (select (arr!46179 a!2901) j!112) a!2901 mask!2840) (Found!10496 j!112)))))

(declare-fun b!1398621 () Bool)

(declare-fun res!937537 () Bool)

(assert (=> b!1398621 (=> (not res!937537) (not e!791788))))

(assert (=> b!1398621 (= res!937537 (validKeyInArray!0 (select (arr!46179 a!2901) j!112)))))

(declare-fun b!1398622 () Bool)

(assert (=> b!1398622 (= e!791790 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge (index!44357 lt!615046) #b00000000000000000000000000000000) (bvslt (index!44357 lt!615046) (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(assert (=> b!1398622 (and (not (undefined!11308 lt!615046)) (= (index!44357 lt!615046) i!1037) (bvslt (x!125998 lt!615046) (x!125998 lt!615047)) (= (select (store (arr!46179 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44357 lt!615046)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46996 0))(
  ( (Unit!46997) )
))
(declare-fun lt!615048 () Unit!46996)

(declare-fun lt!615043 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46996)

(assert (=> b!1398622 (= lt!615048 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615043 (x!125998 lt!615047) (index!44357 lt!615047) (x!125998 lt!615046) (index!44357 lt!615046) (undefined!11308 lt!615046) mask!2840))))

(declare-fun b!1398623 () Bool)

(assert (=> b!1398623 (= e!791788 (not e!791792))))

(declare-fun res!937529 () Bool)

(assert (=> b!1398623 (=> res!937529 e!791792)))

(assert (=> b!1398623 (= res!937529 (or (not ((_ is Intermediate!10496) lt!615047)) (undefined!11308 lt!615047)))))

(assert (=> b!1398623 e!791791))

(declare-fun res!937536 () Bool)

(assert (=> b!1398623 (=> (not res!937536) (not e!791791))))

(assert (=> b!1398623 (= res!937536 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615044 () Unit!46996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46996)

(assert (=> b!1398623 (= lt!615044 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398623 (= lt!615047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615043 (select (arr!46179 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398623 (= lt!615043 (toIndex!0 (select (arr!46179 a!2901) j!112) mask!2840))))

(declare-fun b!1398624 () Bool)

(declare-fun res!937535 () Bool)

(assert (=> b!1398624 (=> (not res!937535) (not e!791788))))

(assert (=> b!1398624 (= res!937535 (and (= (size!46729 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46729 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46729 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120122 res!937534) b!1398624))

(assert (= (and b!1398624 res!937535) b!1398617))

(assert (= (and b!1398617 res!937530) b!1398621))

(assert (= (and b!1398621 res!937537) b!1398619))

(assert (= (and b!1398619 res!937532) b!1398616))

(assert (= (and b!1398616 res!937531) b!1398623))

(assert (= (and b!1398623 res!937536) b!1398620))

(assert (= (and b!1398623 (not res!937529)) b!1398618))

(assert (= (and b!1398618 (not res!937533)) b!1398622))

(declare-fun m!1285817 () Bool)

(assert (=> b!1398621 m!1285817))

(assert (=> b!1398621 m!1285817))

(declare-fun m!1285819 () Bool)

(assert (=> b!1398621 m!1285819))

(declare-fun m!1285821 () Bool)

(assert (=> b!1398619 m!1285821))

(declare-fun m!1285823 () Bool)

(assert (=> b!1398622 m!1285823))

(declare-fun m!1285825 () Bool)

(assert (=> b!1398622 m!1285825))

(declare-fun m!1285827 () Bool)

(assert (=> b!1398622 m!1285827))

(declare-fun m!1285829 () Bool)

(assert (=> b!1398618 m!1285829))

(assert (=> b!1398618 m!1285823))

(assert (=> b!1398618 m!1285829))

(declare-fun m!1285831 () Bool)

(assert (=> b!1398618 m!1285831))

(declare-fun m!1285833 () Bool)

(assert (=> b!1398618 m!1285833))

(assert (=> b!1398623 m!1285817))

(declare-fun m!1285835 () Bool)

(assert (=> b!1398623 m!1285835))

(assert (=> b!1398623 m!1285817))

(assert (=> b!1398623 m!1285817))

(declare-fun m!1285837 () Bool)

(assert (=> b!1398623 m!1285837))

(declare-fun m!1285839 () Bool)

(assert (=> b!1398623 m!1285839))

(declare-fun m!1285841 () Bool)

(assert (=> b!1398623 m!1285841))

(declare-fun m!1285843 () Bool)

(assert (=> start!120122 m!1285843))

(declare-fun m!1285845 () Bool)

(assert (=> start!120122 m!1285845))

(declare-fun m!1285847 () Bool)

(assert (=> b!1398616 m!1285847))

(assert (=> b!1398620 m!1285817))

(assert (=> b!1398620 m!1285817))

(declare-fun m!1285849 () Bool)

(assert (=> b!1398620 m!1285849))

(declare-fun m!1285851 () Bool)

(assert (=> b!1398617 m!1285851))

(assert (=> b!1398617 m!1285851))

(declare-fun m!1285853 () Bool)

(assert (=> b!1398617 m!1285853))

(check-sat (not start!120122) (not b!1398622) (not b!1398618) (not b!1398621) (not b!1398617) (not b!1398619) (not b!1398616) (not b!1398623) (not b!1398620))
(check-sat)
