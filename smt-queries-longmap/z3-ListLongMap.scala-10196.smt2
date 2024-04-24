; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120290 () Bool)

(assert start!120290)

(declare-fun b!1399486 () Bool)

(declare-fun e!792380 () Bool)

(declare-fun e!792377 () Bool)

(assert (=> b!1399486 (= e!792380 e!792377)))

(declare-fun res!937718 () Bool)

(assert (=> b!1399486 (=> res!937718 e!792377)))

(declare-datatypes ((SeekEntryResult!10442 0))(
  ( (MissingZero!10442 (index!44139 (_ BitVec 32))) (Found!10442 (index!44140 (_ BitVec 32))) (Intermediate!10442 (undefined!11254 Bool) (index!44141 (_ BitVec 32)) (x!125939 (_ BitVec 32))) (Undefined!10442) (MissingVacant!10442 (index!44142 (_ BitVec 32))) )
))
(declare-fun lt!615266 () SeekEntryResult!10442)

(declare-fun lt!615262 () SeekEntryResult!10442)

(get-info :version)

(assert (=> b!1399486 (= res!937718 (or (= lt!615266 lt!615262) (not ((_ is Intermediate!10442) lt!615262))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!615261 () (_ BitVec 64))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((array!95741 0))(
  ( (array!95742 (arr!46222 (Array (_ BitVec 32) (_ BitVec 64))) (size!46773 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95741)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95741 (_ BitVec 32)) SeekEntryResult!10442)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399486 (= lt!615262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615261 mask!2840) lt!615261 (array!95742 (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46773 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399486 (= lt!615261 (select (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399487 () Bool)

(declare-fun e!792378 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95741 (_ BitVec 32)) SeekEntryResult!10442)

(assert (=> b!1399487 (= e!792378 (= (seekEntryOrOpen!0 (select (arr!46222 a!2901) j!112) a!2901 mask!2840) (Found!10442 j!112)))))

(declare-fun b!1399488 () Bool)

(declare-fun e!792376 () Bool)

(assert (=> b!1399488 (= e!792376 (not e!792380))))

(declare-fun res!937721 () Bool)

(assert (=> b!1399488 (=> res!937721 e!792380)))

(assert (=> b!1399488 (= res!937721 (or (not ((_ is Intermediate!10442) lt!615266)) (undefined!11254 lt!615266)))))

(assert (=> b!1399488 e!792378))

(declare-fun res!937716 () Bool)

(assert (=> b!1399488 (=> (not res!937716) (not e!792378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95741 (_ BitVec 32)) Bool)

(assert (=> b!1399488 (= res!937716 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46915 0))(
  ( (Unit!46916) )
))
(declare-fun lt!615264 () Unit!46915)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46915)

(assert (=> b!1399488 (= lt!615264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615263 () (_ BitVec 32))

(assert (=> b!1399488 (= lt!615266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615263 (select (arr!46222 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399488 (= lt!615263 (toIndex!0 (select (arr!46222 a!2901) j!112) mask!2840))))

(declare-fun b!1399489 () Bool)

(declare-fun res!937719 () Bool)

(assert (=> b!1399489 (=> (not res!937719) (not e!792376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399489 (= res!937719 (validKeyInArray!0 (select (arr!46222 a!2901) i!1037)))))

(declare-fun b!1399491 () Bool)

(declare-fun res!937715 () Bool)

(assert (=> b!1399491 (=> (not res!937715) (not e!792376))))

(assert (=> b!1399491 (= res!937715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399492 () Bool)

(declare-fun res!937717 () Bool)

(assert (=> b!1399492 (=> (not res!937717) (not e!792376))))

(declare-datatypes ((List!32728 0))(
  ( (Nil!32725) (Cons!32724 (h!33974 (_ BitVec 64)) (t!47414 List!32728)) )
))
(declare-fun arrayNoDuplicates!0 (array!95741 (_ BitVec 32) List!32728) Bool)

(assert (=> b!1399492 (= res!937717 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32725))))

(declare-fun b!1399493 () Bool)

(declare-fun res!937720 () Bool)

(assert (=> b!1399493 (=> (not res!937720) (not e!792376))))

(assert (=> b!1399493 (= res!937720 (validKeyInArray!0 (select (arr!46222 a!2901) j!112)))))

(declare-fun b!1399494 () Bool)

(assert (=> b!1399494 (= e!792377 true)))

(assert (=> b!1399494 (and (not (undefined!11254 lt!615262)) (= (index!44141 lt!615262) i!1037) (bvslt (x!125939 lt!615262) (x!125939 lt!615266)) (= (select (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44141 lt!615262)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615265 () Unit!46915)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46915)

(assert (=> b!1399494 (= lt!615265 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615263 (x!125939 lt!615266) (index!44141 lt!615266) (x!125939 lt!615262) (index!44141 lt!615262) (undefined!11254 lt!615262) mask!2840))))

(declare-fun b!1399490 () Bool)

(declare-fun res!937722 () Bool)

(assert (=> b!1399490 (=> (not res!937722) (not e!792376))))

(assert (=> b!1399490 (= res!937722 (and (= (size!46773 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46773 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46773 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!937723 () Bool)

(assert (=> start!120290 (=> (not res!937723) (not e!792376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120290 (= res!937723 (validMask!0 mask!2840))))

(assert (=> start!120290 e!792376))

(assert (=> start!120290 true))

(declare-fun array_inv!35503 (array!95741) Bool)

(assert (=> start!120290 (array_inv!35503 a!2901)))

(assert (= (and start!120290 res!937723) b!1399490))

(assert (= (and b!1399490 res!937722) b!1399489))

(assert (= (and b!1399489 res!937719) b!1399493))

(assert (= (and b!1399493 res!937720) b!1399491))

(assert (= (and b!1399491 res!937715) b!1399492))

(assert (= (and b!1399492 res!937717) b!1399488))

(assert (= (and b!1399488 res!937716) b!1399487))

(assert (= (and b!1399488 (not res!937721)) b!1399486))

(assert (= (and b!1399486 (not res!937718)) b!1399494))

(declare-fun m!1286809 () Bool)

(assert (=> b!1399488 m!1286809))

(declare-fun m!1286811 () Bool)

(assert (=> b!1399488 m!1286811))

(assert (=> b!1399488 m!1286809))

(declare-fun m!1286813 () Bool)

(assert (=> b!1399488 m!1286813))

(declare-fun m!1286815 () Bool)

(assert (=> b!1399488 m!1286815))

(assert (=> b!1399488 m!1286809))

(declare-fun m!1286817 () Bool)

(assert (=> b!1399488 m!1286817))

(declare-fun m!1286819 () Bool)

(assert (=> start!120290 m!1286819))

(declare-fun m!1286821 () Bool)

(assert (=> start!120290 m!1286821))

(declare-fun m!1286823 () Bool)

(assert (=> b!1399491 m!1286823))

(declare-fun m!1286825 () Bool)

(assert (=> b!1399486 m!1286825))

(declare-fun m!1286827 () Bool)

(assert (=> b!1399486 m!1286827))

(assert (=> b!1399486 m!1286825))

(declare-fun m!1286829 () Bool)

(assert (=> b!1399486 m!1286829))

(declare-fun m!1286831 () Bool)

(assert (=> b!1399486 m!1286831))

(assert (=> b!1399494 m!1286827))

(declare-fun m!1286833 () Bool)

(assert (=> b!1399494 m!1286833))

(declare-fun m!1286835 () Bool)

(assert (=> b!1399494 m!1286835))

(declare-fun m!1286837 () Bool)

(assert (=> b!1399492 m!1286837))

(declare-fun m!1286839 () Bool)

(assert (=> b!1399489 m!1286839))

(assert (=> b!1399489 m!1286839))

(declare-fun m!1286841 () Bool)

(assert (=> b!1399489 m!1286841))

(assert (=> b!1399493 m!1286809))

(assert (=> b!1399493 m!1286809))

(declare-fun m!1286843 () Bool)

(assert (=> b!1399493 m!1286843))

(assert (=> b!1399487 m!1286809))

(assert (=> b!1399487 m!1286809))

(declare-fun m!1286845 () Bool)

(assert (=> b!1399487 m!1286845))

(check-sat (not b!1399494) (not b!1399492) (not b!1399487) (not b!1399486) (not b!1399493) (not start!120290) (not b!1399489) (not b!1399488) (not b!1399491))
(check-sat)
