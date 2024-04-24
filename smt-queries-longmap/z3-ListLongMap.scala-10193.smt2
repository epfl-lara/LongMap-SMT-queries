; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120272 () Bool)

(assert start!120272)

(declare-fun b!1399234 () Bool)

(declare-fun res!937463 () Bool)

(declare-fun e!792236 () Bool)

(assert (=> b!1399234 (=> (not res!937463) (not e!792236))))

(declare-datatypes ((array!95723 0))(
  ( (array!95724 (arr!46213 (Array (_ BitVec 32) (_ BitVec 64))) (size!46764 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95723)

(declare-datatypes ((List!32719 0))(
  ( (Nil!32716) (Cons!32715 (h!33965 (_ BitVec 64)) (t!47405 List!32719)) )
))
(declare-fun arrayNoDuplicates!0 (array!95723 (_ BitVec 32) List!32719) Bool)

(assert (=> b!1399234 (= res!937463 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32716))))

(declare-fun b!1399235 () Bool)

(declare-fun res!937464 () Bool)

(assert (=> b!1399235 (=> (not res!937464) (not e!792236))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399235 (= res!937464 (validKeyInArray!0 (select (arr!46213 a!2901) j!112)))))

(declare-fun b!1399236 () Bool)

(declare-fun res!937465 () Bool)

(assert (=> b!1399236 (=> (not res!937465) (not e!792236))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399236 (= res!937465 (validKeyInArray!0 (select (arr!46213 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1399237 () Bool)

(declare-fun e!792234 () Bool)

(declare-datatypes ((SeekEntryResult!10433 0))(
  ( (MissingZero!10433 (index!44103 (_ BitVec 32))) (Found!10433 (index!44104 (_ BitVec 32))) (Intermediate!10433 (undefined!11245 Bool) (index!44105 (_ BitVec 32)) (x!125906 (_ BitVec 32))) (Undefined!10433) (MissingVacant!10433 (index!44106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95723 (_ BitVec 32)) SeekEntryResult!10433)

(assert (=> b!1399237 (= e!792234 (= (seekEntryOrOpen!0 (select (arr!46213 a!2901) j!112) a!2901 mask!2840) (Found!10433 j!112)))))

(declare-fun b!1399238 () Bool)

(declare-fun e!792233 () Bool)

(declare-fun e!792235 () Bool)

(assert (=> b!1399238 (= e!792233 e!792235)))

(declare-fun res!937467 () Bool)

(assert (=> b!1399238 (=> res!937467 e!792235)))

(declare-fun lt!615099 () SeekEntryResult!10433)

(declare-fun lt!615103 () SeekEntryResult!10433)

(get-info :version)

(assert (=> b!1399238 (= res!937467 (or (= lt!615099 lt!615103) (not ((_ is Intermediate!10433) lt!615103))))))

(declare-fun lt!615104 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95723 (_ BitVec 32)) SeekEntryResult!10433)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399238 (= lt!615103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615104 mask!2840) lt!615104 (array!95724 (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46764 a!2901)) mask!2840))))

(assert (=> b!1399238 (= lt!615104 (select (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun res!937470 () Bool)

(assert (=> start!120272 (=> (not res!937470) (not e!792236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120272 (= res!937470 (validMask!0 mask!2840))))

(assert (=> start!120272 e!792236))

(assert (=> start!120272 true))

(declare-fun array_inv!35494 (array!95723) Bool)

(assert (=> start!120272 (array_inv!35494 a!2901)))

(declare-fun b!1399239 () Bool)

(declare-fun res!937468 () Bool)

(assert (=> b!1399239 (=> (not res!937468) (not e!792236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95723 (_ BitVec 32)) Bool)

(assert (=> b!1399239 (= res!937468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399240 () Bool)

(declare-fun res!937469 () Bool)

(assert (=> b!1399240 (=> (not res!937469) (not e!792236))))

(assert (=> b!1399240 (= res!937469 (and (= (size!46764 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46764 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46764 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399241 () Bool)

(assert (=> b!1399241 (= e!792236 (not e!792233))))

(declare-fun res!937471 () Bool)

(assert (=> b!1399241 (=> res!937471 e!792233)))

(assert (=> b!1399241 (= res!937471 (or (not ((_ is Intermediate!10433) lt!615099)) (undefined!11245 lt!615099)))))

(assert (=> b!1399241 e!792234))

(declare-fun res!937466 () Bool)

(assert (=> b!1399241 (=> (not res!937466) (not e!792234))))

(assert (=> b!1399241 (= res!937466 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46897 0))(
  ( (Unit!46898) )
))
(declare-fun lt!615100 () Unit!46897)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46897)

(assert (=> b!1399241 (= lt!615100 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615102 () (_ BitVec 32))

(assert (=> b!1399241 (= lt!615099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615102 (select (arr!46213 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399241 (= lt!615102 (toIndex!0 (select (arr!46213 a!2901) j!112) mask!2840))))

(declare-fun b!1399242 () Bool)

(assert (=> b!1399242 (= e!792235 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1399242 (and (not (undefined!11245 lt!615103)) (= (index!44105 lt!615103) i!1037) (bvslt (x!125906 lt!615103) (x!125906 lt!615099)) (= (select (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44105 lt!615103)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615101 () Unit!46897)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46897)

(assert (=> b!1399242 (= lt!615101 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615102 (x!125906 lt!615099) (index!44105 lt!615099) (x!125906 lt!615103) (index!44105 lt!615103) (undefined!11245 lt!615103) mask!2840))))

(assert (= (and start!120272 res!937470) b!1399240))

(assert (= (and b!1399240 res!937469) b!1399236))

(assert (= (and b!1399236 res!937465) b!1399235))

(assert (= (and b!1399235 res!937464) b!1399239))

(assert (= (and b!1399239 res!937468) b!1399234))

(assert (= (and b!1399234 res!937463) b!1399241))

(assert (= (and b!1399241 res!937466) b!1399237))

(assert (= (and b!1399241 (not res!937471)) b!1399238))

(assert (= (and b!1399238 (not res!937467)) b!1399242))

(declare-fun m!1286461 () Bool)

(assert (=> start!120272 m!1286461))

(declare-fun m!1286463 () Bool)

(assert (=> start!120272 m!1286463))

(declare-fun m!1286465 () Bool)

(assert (=> b!1399242 m!1286465))

(declare-fun m!1286467 () Bool)

(assert (=> b!1399242 m!1286467))

(declare-fun m!1286469 () Bool)

(assert (=> b!1399242 m!1286469))

(declare-fun m!1286471 () Bool)

(assert (=> b!1399236 m!1286471))

(assert (=> b!1399236 m!1286471))

(declare-fun m!1286473 () Bool)

(assert (=> b!1399236 m!1286473))

(declare-fun m!1286475 () Bool)

(assert (=> b!1399241 m!1286475))

(declare-fun m!1286477 () Bool)

(assert (=> b!1399241 m!1286477))

(assert (=> b!1399241 m!1286475))

(assert (=> b!1399241 m!1286475))

(declare-fun m!1286479 () Bool)

(assert (=> b!1399241 m!1286479))

(declare-fun m!1286481 () Bool)

(assert (=> b!1399241 m!1286481))

(declare-fun m!1286483 () Bool)

(assert (=> b!1399241 m!1286483))

(assert (=> b!1399235 m!1286475))

(assert (=> b!1399235 m!1286475))

(declare-fun m!1286485 () Bool)

(assert (=> b!1399235 m!1286485))

(declare-fun m!1286487 () Bool)

(assert (=> b!1399239 m!1286487))

(declare-fun m!1286489 () Bool)

(assert (=> b!1399234 m!1286489))

(declare-fun m!1286491 () Bool)

(assert (=> b!1399238 m!1286491))

(assert (=> b!1399238 m!1286465))

(assert (=> b!1399238 m!1286491))

(declare-fun m!1286493 () Bool)

(assert (=> b!1399238 m!1286493))

(declare-fun m!1286495 () Bool)

(assert (=> b!1399238 m!1286495))

(assert (=> b!1399237 m!1286475))

(assert (=> b!1399237 m!1286475))

(declare-fun m!1286497 () Bool)

(assert (=> b!1399237 m!1286497))

(check-sat (not b!1399236) (not b!1399234) (not b!1399241) (not b!1399237) (not b!1399242) (not start!120272) (not b!1399239) (not b!1399238) (not b!1399235))
(check-sat)
