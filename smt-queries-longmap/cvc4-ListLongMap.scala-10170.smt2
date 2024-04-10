; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119896 () Bool)

(assert start!119896)

(declare-fun b!1396040 () Bool)

(declare-fun res!935124 () Bool)

(declare-fun e!790343 () Bool)

(assert (=> b!1396040 (=> (not res!935124) (not e!790343))))

(declare-datatypes ((array!95476 0))(
  ( (array!95477 (arr!46093 (Array (_ BitVec 32) (_ BitVec 64))) (size!46643 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95476)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396040 (= res!935124 (validKeyInArray!0 (select (arr!46093 a!2901) i!1037)))))

(declare-fun b!1396041 () Bool)

(declare-datatypes ((SeekEntryResult!10410 0))(
  ( (MissingZero!10410 (index!44011 (_ BitVec 32))) (Found!10410 (index!44012 (_ BitVec 32))) (Intermediate!10410 (undefined!11222 Bool) (index!44013 (_ BitVec 32)) (x!125674 (_ BitVec 32))) (Undefined!10410) (MissingVacant!10410 (index!44014 (_ BitVec 32))) )
))
(declare-fun lt!613227 () SeekEntryResult!10410)

(declare-fun lt!613226 () SeekEntryResult!10410)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!790340 () Bool)

(assert (=> b!1396041 (= e!790340 (or (= lt!613227 lt!613226) (not (is-Intermediate!10410 lt!613226)) (bvsge mask!2840 #b00000000000000000000000000000000)))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95476 (_ BitVec 32)) SeekEntryResult!10410)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396041 (= lt!613226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46093 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46093 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95477 (store (arr!46093 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46643 a!2901)) mask!2840))))

(declare-fun res!935120 () Bool)

(assert (=> start!119896 (=> (not res!935120) (not e!790343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119896 (= res!935120 (validMask!0 mask!2840))))

(assert (=> start!119896 e!790343))

(assert (=> start!119896 true))

(declare-fun array_inv!35121 (array!95476) Bool)

(assert (=> start!119896 (array_inv!35121 a!2901)))

(declare-fun b!1396042 () Bool)

(declare-fun res!935125 () Bool)

(assert (=> b!1396042 (=> (not res!935125) (not e!790343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95476 (_ BitVec 32)) Bool)

(assert (=> b!1396042 (= res!935125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396043 () Bool)

(assert (=> b!1396043 (= e!790343 (not e!790340))))

(declare-fun res!935118 () Bool)

(assert (=> b!1396043 (=> res!935118 e!790340)))

(assert (=> b!1396043 (= res!935118 (or (not (is-Intermediate!10410 lt!613227)) (undefined!11222 lt!613227)))))

(declare-fun e!790342 () Bool)

(assert (=> b!1396043 e!790342))

(declare-fun res!935123 () Bool)

(assert (=> b!1396043 (=> (not res!935123) (not e!790342))))

(assert (=> b!1396043 (= res!935123 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46824 0))(
  ( (Unit!46825) )
))
(declare-fun lt!613225 () Unit!46824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46824)

(assert (=> b!1396043 (= lt!613225 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396043 (= lt!613227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46093 a!2901) j!112) mask!2840) (select (arr!46093 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396044 () Bool)

(declare-fun res!935122 () Bool)

(assert (=> b!1396044 (=> (not res!935122) (not e!790343))))

(assert (=> b!1396044 (= res!935122 (and (= (size!46643 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46643 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46643 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396045 () Bool)

(declare-fun res!935121 () Bool)

(assert (=> b!1396045 (=> (not res!935121) (not e!790343))))

(declare-datatypes ((List!32612 0))(
  ( (Nil!32609) (Cons!32608 (h!33847 (_ BitVec 64)) (t!47306 List!32612)) )
))
(declare-fun arrayNoDuplicates!0 (array!95476 (_ BitVec 32) List!32612) Bool)

(assert (=> b!1396045 (= res!935121 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32609))))

(declare-fun b!1396046 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95476 (_ BitVec 32)) SeekEntryResult!10410)

(assert (=> b!1396046 (= e!790342 (= (seekEntryOrOpen!0 (select (arr!46093 a!2901) j!112) a!2901 mask!2840) (Found!10410 j!112)))))

(declare-fun b!1396047 () Bool)

(declare-fun res!935119 () Bool)

(assert (=> b!1396047 (=> (not res!935119) (not e!790343))))

(assert (=> b!1396047 (= res!935119 (validKeyInArray!0 (select (arr!46093 a!2901) j!112)))))

(assert (= (and start!119896 res!935120) b!1396044))

(assert (= (and b!1396044 res!935122) b!1396040))

(assert (= (and b!1396040 res!935124) b!1396047))

(assert (= (and b!1396047 res!935119) b!1396042))

(assert (= (and b!1396042 res!935125) b!1396045))

(assert (= (and b!1396045 res!935121) b!1396043))

(assert (= (and b!1396043 res!935123) b!1396046))

(assert (= (and b!1396043 (not res!935118)) b!1396041))

(declare-fun m!1282529 () Bool)

(assert (=> b!1396042 m!1282529))

(declare-fun m!1282531 () Bool)

(assert (=> b!1396043 m!1282531))

(declare-fun m!1282533 () Bool)

(assert (=> b!1396043 m!1282533))

(assert (=> b!1396043 m!1282531))

(declare-fun m!1282535 () Bool)

(assert (=> b!1396043 m!1282535))

(assert (=> b!1396043 m!1282533))

(assert (=> b!1396043 m!1282531))

(declare-fun m!1282537 () Bool)

(assert (=> b!1396043 m!1282537))

(declare-fun m!1282539 () Bool)

(assert (=> b!1396043 m!1282539))

(assert (=> b!1396047 m!1282531))

(assert (=> b!1396047 m!1282531))

(declare-fun m!1282541 () Bool)

(assert (=> b!1396047 m!1282541))

(declare-fun m!1282543 () Bool)

(assert (=> start!119896 m!1282543))

(declare-fun m!1282545 () Bool)

(assert (=> start!119896 m!1282545))

(declare-fun m!1282547 () Bool)

(assert (=> b!1396040 m!1282547))

(assert (=> b!1396040 m!1282547))

(declare-fun m!1282549 () Bool)

(assert (=> b!1396040 m!1282549))

(declare-fun m!1282551 () Bool)

(assert (=> b!1396045 m!1282551))

(declare-fun m!1282553 () Bool)

(assert (=> b!1396041 m!1282553))

(declare-fun m!1282555 () Bool)

(assert (=> b!1396041 m!1282555))

(assert (=> b!1396041 m!1282555))

(declare-fun m!1282557 () Bool)

(assert (=> b!1396041 m!1282557))

(assert (=> b!1396041 m!1282557))

(assert (=> b!1396041 m!1282555))

(declare-fun m!1282559 () Bool)

(assert (=> b!1396041 m!1282559))

(assert (=> b!1396046 m!1282531))

(assert (=> b!1396046 m!1282531))

(declare-fun m!1282561 () Bool)

(assert (=> b!1396046 m!1282561))

(push 1)

(assert (not b!1396041))

(assert (not b!1396047))

(assert (not b!1396042))

(assert (not b!1396043))

(assert (not b!1396040))

