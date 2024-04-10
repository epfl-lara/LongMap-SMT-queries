; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119966 () Bool)

(assert start!119966)

(declare-fun b!1396501 () Bool)

(declare-fun res!935414 () Bool)

(declare-fun e!790613 () Bool)

(assert (=> b!1396501 (=> (not res!935414) (not e!790613))))

(declare-datatypes ((array!95495 0))(
  ( (array!95496 (arr!46101 (Array (_ BitVec 32) (_ BitVec 64))) (size!46651 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95495)

(declare-datatypes ((List!32620 0))(
  ( (Nil!32617) (Cons!32616 (h!33858 (_ BitVec 64)) (t!47314 List!32620)) )
))
(declare-fun arrayNoDuplicates!0 (array!95495 (_ BitVec 32) List!32620) Bool)

(assert (=> b!1396501 (= res!935414 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32617))))

(declare-fun b!1396502 () Bool)

(declare-fun e!790611 () Bool)

(assert (=> b!1396502 (= e!790613 (not e!790611))))

(declare-fun res!935417 () Bool)

(assert (=> b!1396502 (=> res!935417 e!790611)))

(declare-datatypes ((SeekEntryResult!10418 0))(
  ( (MissingZero!10418 (index!44043 (_ BitVec 32))) (Found!10418 (index!44044 (_ BitVec 32))) (Intermediate!10418 (undefined!11230 Bool) (index!44045 (_ BitVec 32)) (x!125712 (_ BitVec 32))) (Undefined!10418) (MissingVacant!10418 (index!44046 (_ BitVec 32))) )
))
(declare-fun lt!613474 () SeekEntryResult!10418)

(get-info :version)

(assert (=> b!1396502 (= res!935417 (or (not ((_ is Intermediate!10418) lt!613474)) (undefined!11230 lt!613474)))))

(declare-fun e!790610 () Bool)

(assert (=> b!1396502 e!790610))

(declare-fun res!935416 () Bool)

(assert (=> b!1396502 (=> (not res!935416) (not e!790610))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95495 (_ BitVec 32)) Bool)

(assert (=> b!1396502 (= res!935416 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46840 0))(
  ( (Unit!46841) )
))
(declare-fun lt!613473 () Unit!46840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46840)

(assert (=> b!1396502 (= lt!613473 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613475 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95495 (_ BitVec 32)) SeekEntryResult!10418)

(assert (=> b!1396502 (= lt!613474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613475 (select (arr!46101 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396502 (= lt!613475 (toIndex!0 (select (arr!46101 a!2901) j!112) mask!2840))))

(declare-fun b!1396503 () Bool)

(declare-fun res!935418 () Bool)

(assert (=> b!1396503 (=> (not res!935418) (not e!790613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396503 (= res!935418 (validKeyInArray!0 (select (arr!46101 a!2901) j!112)))))

(declare-fun res!935415 () Bool)

(assert (=> start!119966 (=> (not res!935415) (not e!790613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119966 (= res!935415 (validMask!0 mask!2840))))

(assert (=> start!119966 e!790613))

(assert (=> start!119966 true))

(declare-fun array_inv!35129 (array!95495) Bool)

(assert (=> start!119966 (array_inv!35129 a!2901)))

(declare-fun b!1396504 () Bool)

(declare-fun res!935419 () Bool)

(assert (=> b!1396504 (=> (not res!935419) (not e!790613))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396504 (= res!935419 (and (= (size!46651 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46651 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46651 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396505 () Bool)

(declare-fun res!935422 () Bool)

(assert (=> b!1396505 (=> (not res!935422) (not e!790613))))

(assert (=> b!1396505 (= res!935422 (validKeyInArray!0 (select (arr!46101 a!2901) i!1037)))))

(declare-fun b!1396506 () Bool)

(declare-fun e!790609 () Bool)

(assert (=> b!1396506 (= e!790609 true)))

(declare-fun lt!613479 () array!95495)

(declare-fun lt!613478 () (_ BitVec 64))

(declare-fun lt!613477 () SeekEntryResult!10418)

(assert (=> b!1396506 (= lt!613477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613475 lt!613478 lt!613479 mask!2840))))

(declare-fun b!1396507 () Bool)

(declare-fun res!935420 () Bool)

(assert (=> b!1396507 (=> (not res!935420) (not e!790613))))

(assert (=> b!1396507 (= res!935420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396508 () Bool)

(assert (=> b!1396508 (= e!790611 e!790609)))

(declare-fun res!935421 () Bool)

(assert (=> b!1396508 (=> res!935421 e!790609)))

(declare-fun lt!613476 () SeekEntryResult!10418)

(assert (=> b!1396508 (= res!935421 (or (= lt!613474 lt!613476) (not ((_ is Intermediate!10418) lt!613476)) (bvslt (x!125712 lt!613474) #b00000000000000000000000000000000) (bvsgt (x!125712 lt!613474) #b01111111111111111111111111111110) (bvslt lt!613475 #b00000000000000000000000000000000) (bvsge lt!613475 (size!46651 a!2901)) (bvslt (index!44045 lt!613474) #b00000000000000000000000000000000) (bvsge (index!44045 lt!613474) (size!46651 a!2901)) (not (= lt!613474 (Intermediate!10418 false (index!44045 lt!613474) (x!125712 lt!613474)))) (not (= lt!613476 (Intermediate!10418 (undefined!11230 lt!613476) (index!44045 lt!613476) (x!125712 lt!613476))))))))

(assert (=> b!1396508 (= lt!613476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613478 mask!2840) lt!613478 lt!613479 mask!2840))))

(assert (=> b!1396508 (= lt!613478 (select (store (arr!46101 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396508 (= lt!613479 (array!95496 (store (arr!46101 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46651 a!2901)))))

(declare-fun b!1396509 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95495 (_ BitVec 32)) SeekEntryResult!10418)

(assert (=> b!1396509 (= e!790610 (= (seekEntryOrOpen!0 (select (arr!46101 a!2901) j!112) a!2901 mask!2840) (Found!10418 j!112)))))

(assert (= (and start!119966 res!935415) b!1396504))

(assert (= (and b!1396504 res!935419) b!1396505))

(assert (= (and b!1396505 res!935422) b!1396503))

(assert (= (and b!1396503 res!935418) b!1396507))

(assert (= (and b!1396507 res!935420) b!1396501))

(assert (= (and b!1396501 res!935414) b!1396502))

(assert (= (and b!1396502 res!935416) b!1396509))

(assert (= (and b!1396502 (not res!935417)) b!1396508))

(assert (= (and b!1396508 (not res!935421)) b!1396506))

(declare-fun m!1282959 () Bool)

(assert (=> b!1396501 m!1282959))

(declare-fun m!1282961 () Bool)

(assert (=> b!1396503 m!1282961))

(assert (=> b!1396503 m!1282961))

(declare-fun m!1282963 () Bool)

(assert (=> b!1396503 m!1282963))

(declare-fun m!1282965 () Bool)

(assert (=> b!1396508 m!1282965))

(assert (=> b!1396508 m!1282965))

(declare-fun m!1282967 () Bool)

(assert (=> b!1396508 m!1282967))

(declare-fun m!1282969 () Bool)

(assert (=> b!1396508 m!1282969))

(declare-fun m!1282971 () Bool)

(assert (=> b!1396508 m!1282971))

(declare-fun m!1282973 () Bool)

(assert (=> start!119966 m!1282973))

(declare-fun m!1282975 () Bool)

(assert (=> start!119966 m!1282975))

(declare-fun m!1282977 () Bool)

(assert (=> b!1396505 m!1282977))

(assert (=> b!1396505 m!1282977))

(declare-fun m!1282979 () Bool)

(assert (=> b!1396505 m!1282979))

(assert (=> b!1396502 m!1282961))

(declare-fun m!1282981 () Bool)

(assert (=> b!1396502 m!1282981))

(assert (=> b!1396502 m!1282961))

(declare-fun m!1282983 () Bool)

(assert (=> b!1396502 m!1282983))

(assert (=> b!1396502 m!1282961))

(declare-fun m!1282985 () Bool)

(assert (=> b!1396502 m!1282985))

(declare-fun m!1282987 () Bool)

(assert (=> b!1396502 m!1282987))

(declare-fun m!1282989 () Bool)

(assert (=> b!1396506 m!1282989))

(declare-fun m!1282991 () Bool)

(assert (=> b!1396507 m!1282991))

(assert (=> b!1396509 m!1282961))

(assert (=> b!1396509 m!1282961))

(declare-fun m!1282993 () Bool)

(assert (=> b!1396509 m!1282993))

(check-sat (not b!1396507) (not b!1396502) (not b!1396503) (not b!1396506) (not b!1396505) (not b!1396508) (not b!1396501) (not start!119966) (not b!1396509))
(check-sat)
