; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120074 () Bool)

(assert start!120074)

(declare-fun res!936903 () Bool)

(declare-fun e!791411 () Bool)

(assert (=> start!120074 (=> (not res!936903) (not e!791411))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120074 (= res!936903 (validMask!0 mask!2840))))

(assert (=> start!120074 e!791411))

(assert (=> start!120074 true))

(declare-datatypes ((array!95556 0))(
  ( (array!95557 (arr!46132 (Array (_ BitVec 32) (_ BitVec 64))) (size!46684 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95556)

(declare-fun array_inv!35365 (array!95556) Bool)

(assert (=> start!120074 (array_inv!35365 a!2901)))

(declare-fun b!1397932 () Bool)

(declare-fun res!936897 () Bool)

(assert (=> b!1397932 (=> (not res!936897) (not e!791411))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397932 (= res!936897 (validKeyInArray!0 (select (arr!46132 a!2901) j!112)))))

(declare-fun b!1397933 () Bool)

(declare-fun e!791412 () Bool)

(declare-datatypes ((SeekEntryResult!10475 0))(
  ( (MissingZero!10475 (index!44271 (_ BitVec 32))) (Found!10475 (index!44272 (_ BitVec 32))) (Intermediate!10475 (undefined!11287 Bool) (index!44273 (_ BitVec 32)) (x!125918 (_ BitVec 32))) (Undefined!10475) (MissingVacant!10475 (index!44274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95556 (_ BitVec 32)) SeekEntryResult!10475)

(assert (=> b!1397933 (= e!791412 (= (seekEntryOrOpen!0 (select (arr!46132 a!2901) j!112) a!2901 mask!2840) (Found!10475 j!112)))))

(declare-fun b!1397934 () Bool)

(declare-fun e!791414 () Bool)

(declare-fun e!791413 () Bool)

(assert (=> b!1397934 (= e!791414 e!791413)))

(declare-fun res!936902 () Bool)

(assert (=> b!1397934 (=> res!936902 e!791413)))

(declare-fun lt!614462 () SeekEntryResult!10475)

(declare-fun lt!614458 () SeekEntryResult!10475)

(get-info :version)

(assert (=> b!1397934 (= res!936902 (or (= lt!614462 lt!614458) (not ((_ is Intermediate!10475) lt!614458))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614460 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95556 (_ BitVec 32)) SeekEntryResult!10475)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397934 (= lt!614458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614460 mask!2840) lt!614460 (array!95557 (store (arr!46132 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46684 a!2901)) mask!2840))))

(assert (=> b!1397934 (= lt!614460 (select (store (arr!46132 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1397935 () Bool)

(declare-fun res!936901 () Bool)

(assert (=> b!1397935 (=> (not res!936901) (not e!791411))))

(assert (=> b!1397935 (= res!936901 (validKeyInArray!0 (select (arr!46132 a!2901) i!1037)))))

(declare-fun b!1397936 () Bool)

(declare-fun res!936900 () Bool)

(assert (=> b!1397936 (=> (not res!936900) (not e!791411))))

(assert (=> b!1397936 (= res!936900 (and (= (size!46684 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46684 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46684 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397937 () Bool)

(assert (=> b!1397937 (= e!791411 (not e!791414))))

(declare-fun res!936896 () Bool)

(assert (=> b!1397937 (=> res!936896 e!791414)))

(assert (=> b!1397937 (= res!936896 (or (not ((_ is Intermediate!10475) lt!614462)) (undefined!11287 lt!614462)))))

(assert (=> b!1397937 e!791412))

(declare-fun res!936904 () Bool)

(assert (=> b!1397937 (=> (not res!936904) (not e!791412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95556 (_ BitVec 32)) Bool)

(assert (=> b!1397937 (= res!936904 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46797 0))(
  ( (Unit!46798) )
))
(declare-fun lt!614459 () Unit!46797)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46797)

(assert (=> b!1397937 (= lt!614459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614457 () (_ BitVec 32))

(assert (=> b!1397937 (= lt!614462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614457 (select (arr!46132 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397937 (= lt!614457 (toIndex!0 (select (arr!46132 a!2901) j!112) mask!2840))))

(declare-fun b!1397938 () Bool)

(assert (=> b!1397938 (= e!791413 true)))

(assert (=> b!1397938 (and (not (undefined!11287 lt!614458)) (= (index!44273 lt!614458) i!1037) (bvslt (x!125918 lt!614458) (x!125918 lt!614462)) (= (select (store (arr!46132 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44273 lt!614458)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614461 () Unit!46797)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46797)

(assert (=> b!1397938 (= lt!614461 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614457 (x!125918 lt!614462) (index!44273 lt!614462) (x!125918 lt!614458) (index!44273 lt!614458) (undefined!11287 lt!614458) mask!2840))))

(declare-fun b!1397939 () Bool)

(declare-fun res!936899 () Bool)

(assert (=> b!1397939 (=> (not res!936899) (not e!791411))))

(declare-datatypes ((List!32729 0))(
  ( (Nil!32726) (Cons!32725 (h!33967 (_ BitVec 64)) (t!47415 List!32729)) )
))
(declare-fun arrayNoDuplicates!0 (array!95556 (_ BitVec 32) List!32729) Bool)

(assert (=> b!1397939 (= res!936899 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32726))))

(declare-fun b!1397940 () Bool)

(declare-fun res!936898 () Bool)

(assert (=> b!1397940 (=> (not res!936898) (not e!791411))))

(assert (=> b!1397940 (= res!936898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120074 res!936903) b!1397936))

(assert (= (and b!1397936 res!936900) b!1397935))

(assert (= (and b!1397935 res!936901) b!1397932))

(assert (= (and b!1397932 res!936897) b!1397940))

(assert (= (and b!1397940 res!936898) b!1397939))

(assert (= (and b!1397939 res!936899) b!1397937))

(assert (= (and b!1397937 res!936904) b!1397933))

(assert (= (and b!1397937 (not res!936896)) b!1397934))

(assert (= (and b!1397934 (not res!936902)) b!1397938))

(declare-fun m!1284439 () Bool)

(assert (=> b!1397938 m!1284439))

(declare-fun m!1284441 () Bool)

(assert (=> b!1397938 m!1284441))

(declare-fun m!1284443 () Bool)

(assert (=> b!1397938 m!1284443))

(declare-fun m!1284445 () Bool)

(assert (=> b!1397937 m!1284445))

(declare-fun m!1284447 () Bool)

(assert (=> b!1397937 m!1284447))

(assert (=> b!1397937 m!1284445))

(declare-fun m!1284449 () Bool)

(assert (=> b!1397937 m!1284449))

(declare-fun m!1284451 () Bool)

(assert (=> b!1397937 m!1284451))

(assert (=> b!1397937 m!1284445))

(declare-fun m!1284453 () Bool)

(assert (=> b!1397937 m!1284453))

(declare-fun m!1284455 () Bool)

(assert (=> start!120074 m!1284455))

(declare-fun m!1284457 () Bool)

(assert (=> start!120074 m!1284457))

(declare-fun m!1284459 () Bool)

(assert (=> b!1397935 m!1284459))

(assert (=> b!1397935 m!1284459))

(declare-fun m!1284461 () Bool)

(assert (=> b!1397935 m!1284461))

(declare-fun m!1284463 () Bool)

(assert (=> b!1397934 m!1284463))

(assert (=> b!1397934 m!1284439))

(assert (=> b!1397934 m!1284463))

(declare-fun m!1284465 () Bool)

(assert (=> b!1397934 m!1284465))

(declare-fun m!1284467 () Bool)

(assert (=> b!1397934 m!1284467))

(assert (=> b!1397933 m!1284445))

(assert (=> b!1397933 m!1284445))

(declare-fun m!1284469 () Bool)

(assert (=> b!1397933 m!1284469))

(declare-fun m!1284471 () Bool)

(assert (=> b!1397940 m!1284471))

(assert (=> b!1397932 m!1284445))

(assert (=> b!1397932 m!1284445))

(declare-fun m!1284473 () Bool)

(assert (=> b!1397932 m!1284473))

(declare-fun m!1284475 () Bool)

(assert (=> b!1397939 m!1284475))

(check-sat (not b!1397940) (not b!1397933) (not start!120074) (not b!1397932) (not b!1397938) (not b!1397939) (not b!1397934) (not b!1397937) (not b!1397935))
(check-sat)
