; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120106 () Bool)

(assert start!120106)

(declare-fun b!1398400 () Bool)

(declare-fun res!937313 () Bool)

(declare-fun e!791668 () Bool)

(assert (=> b!1398400 (=> (not res!937313) (not e!791668))))

(declare-datatypes ((array!95635 0))(
  ( (array!95636 (arr!46171 (Array (_ BitVec 32) (_ BitVec 64))) (size!46721 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95635)

(declare-datatypes ((List!32690 0))(
  ( (Nil!32687) (Cons!32686 (h!33928 (_ BitVec 64)) (t!47384 List!32690)) )
))
(declare-fun arrayNoDuplicates!0 (array!95635 (_ BitVec 32) List!32690) Bool)

(assert (=> b!1398400 (= res!937313 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32687))))

(declare-fun b!1398401 () Bool)

(declare-fun res!937320 () Bool)

(assert (=> b!1398401 (=> (not res!937320) (not e!791668))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398401 (= res!937320 (validKeyInArray!0 (select (arr!46171 a!2901) j!112)))))

(declare-fun b!1398402 () Bool)

(declare-fun e!791669 () Bool)

(assert (=> b!1398402 (= e!791668 (not e!791669))))

(declare-fun res!937316 () Bool)

(assert (=> b!1398402 (=> res!937316 e!791669)))

(declare-datatypes ((SeekEntryResult!10488 0))(
  ( (MissingZero!10488 (index!44323 (_ BitVec 32))) (Found!10488 (index!44324 (_ BitVec 32))) (Intermediate!10488 (undefined!11300 Bool) (index!44325 (_ BitVec 32)) (x!125966 (_ BitVec 32))) (Undefined!10488) (MissingVacant!10488 (index!44326 (_ BitVec 32))) )
))
(declare-fun lt!614902 () SeekEntryResult!10488)

(assert (=> b!1398402 (= res!937316 (or (not (is-Intermediate!10488 lt!614902)) (undefined!11300 lt!614902)))))

(declare-fun e!791671 () Bool)

(assert (=> b!1398402 e!791671))

(declare-fun res!937318 () Bool)

(assert (=> b!1398402 (=> (not res!937318) (not e!791671))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95635 (_ BitVec 32)) Bool)

(assert (=> b!1398402 (= res!937318 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46980 0))(
  ( (Unit!46981) )
))
(declare-fun lt!614899 () Unit!46980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46980)

(assert (=> b!1398402 (= lt!614899 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614904 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95635 (_ BitVec 32)) SeekEntryResult!10488)

(assert (=> b!1398402 (= lt!614902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614904 (select (arr!46171 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398402 (= lt!614904 (toIndex!0 (select (arr!46171 a!2901) j!112) mask!2840))))

(declare-fun b!1398403 () Bool)

(declare-fun res!937321 () Bool)

(assert (=> b!1398403 (=> (not res!937321) (not e!791668))))

(assert (=> b!1398403 (= res!937321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398404 () Bool)

(declare-fun e!791670 () Bool)

(assert (=> b!1398404 (= e!791669 e!791670)))

(declare-fun res!937319 () Bool)

(assert (=> b!1398404 (=> res!937319 e!791670)))

(declare-fun lt!614900 () SeekEntryResult!10488)

(assert (=> b!1398404 (= res!937319 (or (= lt!614902 lt!614900) (not (is-Intermediate!10488 lt!614900))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614903 () (_ BitVec 64))

(assert (=> b!1398404 (= lt!614900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614903 mask!2840) lt!614903 (array!95636 (store (arr!46171 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46721 a!2901)) mask!2840))))

(assert (=> b!1398404 (= lt!614903 (select (store (arr!46171 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398405 () Bool)

(assert (=> b!1398405 (= e!791670 true)))

(assert (=> b!1398405 (and (not (undefined!11300 lt!614900)) (= (index!44325 lt!614900) i!1037) (bvslt (x!125966 lt!614900) (x!125966 lt!614902)) (= (select (store (arr!46171 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44325 lt!614900)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614901 () Unit!46980)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46980)

(assert (=> b!1398405 (= lt!614901 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614904 (x!125966 lt!614902) (index!44325 lt!614902) (x!125966 lt!614900) (index!44325 lt!614900) (undefined!11300 lt!614900) mask!2840))))

(declare-fun b!1398407 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95635 (_ BitVec 32)) SeekEntryResult!10488)

(assert (=> b!1398407 (= e!791671 (= (seekEntryOrOpen!0 (select (arr!46171 a!2901) j!112) a!2901 mask!2840) (Found!10488 j!112)))))

(declare-fun b!1398408 () Bool)

(declare-fun res!937314 () Bool)

(assert (=> b!1398408 (=> (not res!937314) (not e!791668))))

(assert (=> b!1398408 (= res!937314 (validKeyInArray!0 (select (arr!46171 a!2901) i!1037)))))

(declare-fun res!937317 () Bool)

(assert (=> start!120106 (=> (not res!937317) (not e!791668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120106 (= res!937317 (validMask!0 mask!2840))))

(assert (=> start!120106 e!791668))

(assert (=> start!120106 true))

(declare-fun array_inv!35199 (array!95635) Bool)

(assert (=> start!120106 (array_inv!35199 a!2901)))

(declare-fun b!1398406 () Bool)

(declare-fun res!937315 () Bool)

(assert (=> b!1398406 (=> (not res!937315) (not e!791668))))

(assert (=> b!1398406 (= res!937315 (and (= (size!46721 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46721 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46721 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120106 res!937317) b!1398406))

(assert (= (and b!1398406 res!937315) b!1398408))

(assert (= (and b!1398408 res!937314) b!1398401))

(assert (= (and b!1398401 res!937320) b!1398403))

(assert (= (and b!1398403 res!937321) b!1398400))

(assert (= (and b!1398400 res!937313) b!1398402))

(assert (= (and b!1398402 res!937318) b!1398407))

(assert (= (and b!1398402 (not res!937316)) b!1398404))

(assert (= (and b!1398404 (not res!937319)) b!1398405))

(declare-fun m!1285513 () Bool)

(assert (=> b!1398401 m!1285513))

(assert (=> b!1398401 m!1285513))

(declare-fun m!1285515 () Bool)

(assert (=> b!1398401 m!1285515))

(declare-fun m!1285517 () Bool)

(assert (=> b!1398400 m!1285517))

(assert (=> b!1398407 m!1285513))

(assert (=> b!1398407 m!1285513))

(declare-fun m!1285519 () Bool)

(assert (=> b!1398407 m!1285519))

(declare-fun m!1285521 () Bool)

(assert (=> b!1398408 m!1285521))

(assert (=> b!1398408 m!1285521))

(declare-fun m!1285523 () Bool)

(assert (=> b!1398408 m!1285523))

(declare-fun m!1285525 () Bool)

(assert (=> start!120106 m!1285525))

(declare-fun m!1285527 () Bool)

(assert (=> start!120106 m!1285527))

(declare-fun m!1285529 () Bool)

(assert (=> b!1398403 m!1285529))

(assert (=> b!1398402 m!1285513))

(declare-fun m!1285531 () Bool)

(assert (=> b!1398402 m!1285531))

(assert (=> b!1398402 m!1285513))

(declare-fun m!1285533 () Bool)

(assert (=> b!1398402 m!1285533))

(assert (=> b!1398402 m!1285513))

(declare-fun m!1285535 () Bool)

(assert (=> b!1398402 m!1285535))

(declare-fun m!1285537 () Bool)

(assert (=> b!1398402 m!1285537))

(declare-fun m!1285539 () Bool)

(assert (=> b!1398404 m!1285539))

(declare-fun m!1285541 () Bool)

(assert (=> b!1398404 m!1285541))

(assert (=> b!1398404 m!1285539))

(declare-fun m!1285543 () Bool)

(assert (=> b!1398404 m!1285543))

(declare-fun m!1285545 () Bool)

(assert (=> b!1398404 m!1285545))

(assert (=> b!1398405 m!1285541))

(declare-fun m!1285547 () Bool)

(assert (=> b!1398405 m!1285547))

(declare-fun m!1285549 () Bool)

(assert (=> b!1398405 m!1285549))

(push 1)

