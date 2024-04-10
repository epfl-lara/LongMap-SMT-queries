; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119988 () Bool)

(assert start!119988)

(declare-fun b!1396798 () Bool)

(declare-fun res!935714 () Bool)

(declare-fun e!790775 () Bool)

(assert (=> b!1396798 (=> (not res!935714) (not e!790775))))

(declare-datatypes ((array!95517 0))(
  ( (array!95518 (arr!46112 (Array (_ BitVec 32) (_ BitVec 64))) (size!46662 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95517)

(declare-datatypes ((List!32631 0))(
  ( (Nil!32628) (Cons!32627 (h!33869 (_ BitVec 64)) (t!47325 List!32631)) )
))
(declare-fun arrayNoDuplicates!0 (array!95517 (_ BitVec 32) List!32631) Bool)

(assert (=> b!1396798 (= res!935714 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32628))))

(declare-fun b!1396799 () Bool)

(declare-fun res!935711 () Bool)

(assert (=> b!1396799 (=> (not res!935711) (not e!790775))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396799 (= res!935711 (validKeyInArray!0 (select (arr!46112 a!2901) j!112)))))

(declare-fun b!1396800 () Bool)

(declare-fun res!935716 () Bool)

(assert (=> b!1396800 (=> (not res!935716) (not e!790775))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396800 (= res!935716 (and (= (size!46662 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46662 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46662 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396802 () Bool)

(declare-fun e!790778 () Bool)

(assert (=> b!1396802 (= e!790778 true)))

(declare-datatypes ((SeekEntryResult!10429 0))(
  ( (MissingZero!10429 (index!44087 (_ BitVec 32))) (Found!10429 (index!44088 (_ BitVec 32))) (Intermediate!10429 (undefined!11241 Bool) (index!44089 (_ BitVec 32)) (x!125755 (_ BitVec 32))) (Undefined!10429) (MissingVacant!10429 (index!44090 (_ BitVec 32))) )
))
(declare-fun lt!613705 () SeekEntryResult!10429)

(declare-fun lt!613709 () (_ BitVec 32))

(declare-fun lt!613708 () array!95517)

(declare-fun lt!613710 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95517 (_ BitVec 32)) SeekEntryResult!10429)

(assert (=> b!1396802 (= lt!613705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613709 lt!613710 lt!613708 mask!2840))))

(declare-fun b!1396803 () Bool)

(declare-fun res!935719 () Bool)

(assert (=> b!1396803 (=> (not res!935719) (not e!790775))))

(assert (=> b!1396803 (= res!935719 (validKeyInArray!0 (select (arr!46112 a!2901) i!1037)))))

(declare-fun b!1396804 () Bool)

(declare-fun e!790777 () Bool)

(assert (=> b!1396804 (= e!790777 e!790778)))

(declare-fun res!935718 () Bool)

(assert (=> b!1396804 (=> res!935718 e!790778)))

(declare-fun lt!613704 () SeekEntryResult!10429)

(declare-fun lt!613706 () SeekEntryResult!10429)

(assert (=> b!1396804 (= res!935718 (or (= lt!613706 lt!613704) (not (is-Intermediate!10429 lt!613704)) (bvslt (x!125755 lt!613706) #b00000000000000000000000000000000) (bvsgt (x!125755 lt!613706) #b01111111111111111111111111111110) (bvslt lt!613709 #b00000000000000000000000000000000) (bvsge lt!613709 (size!46662 a!2901)) (bvslt (index!44089 lt!613706) #b00000000000000000000000000000000) (bvsge (index!44089 lt!613706) (size!46662 a!2901)) (not (= lt!613706 (Intermediate!10429 false (index!44089 lt!613706) (x!125755 lt!613706)))) (not (= lt!613704 (Intermediate!10429 (undefined!11241 lt!613704) (index!44089 lt!613704) (x!125755 lt!613704))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396804 (= lt!613704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613710 mask!2840) lt!613710 lt!613708 mask!2840))))

(assert (=> b!1396804 (= lt!613710 (select (store (arr!46112 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396804 (= lt!613708 (array!95518 (store (arr!46112 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46662 a!2901)))))

(declare-fun b!1396801 () Bool)

(declare-fun res!935712 () Bool)

(assert (=> b!1396801 (=> (not res!935712) (not e!790775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95517 (_ BitVec 32)) Bool)

(assert (=> b!1396801 (= res!935712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!935715 () Bool)

(assert (=> start!119988 (=> (not res!935715) (not e!790775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119988 (= res!935715 (validMask!0 mask!2840))))

(assert (=> start!119988 e!790775))

(assert (=> start!119988 true))

(declare-fun array_inv!35140 (array!95517) Bool)

(assert (=> start!119988 (array_inv!35140 a!2901)))

(declare-fun e!790776 () Bool)

(declare-fun b!1396805 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95517 (_ BitVec 32)) SeekEntryResult!10429)

(assert (=> b!1396805 (= e!790776 (= (seekEntryOrOpen!0 (select (arr!46112 a!2901) j!112) a!2901 mask!2840) (Found!10429 j!112)))))

(declare-fun b!1396806 () Bool)

(assert (=> b!1396806 (= e!790775 (not e!790777))))

(declare-fun res!935717 () Bool)

(assert (=> b!1396806 (=> res!935717 e!790777)))

(assert (=> b!1396806 (= res!935717 (or (not (is-Intermediate!10429 lt!613706)) (undefined!11241 lt!613706)))))

(assert (=> b!1396806 e!790776))

(declare-fun res!935713 () Bool)

(assert (=> b!1396806 (=> (not res!935713) (not e!790776))))

(assert (=> b!1396806 (= res!935713 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46862 0))(
  ( (Unit!46863) )
))
(declare-fun lt!613707 () Unit!46862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46862)

(assert (=> b!1396806 (= lt!613707 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396806 (= lt!613706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613709 (select (arr!46112 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396806 (= lt!613709 (toIndex!0 (select (arr!46112 a!2901) j!112) mask!2840))))

(assert (= (and start!119988 res!935715) b!1396800))

(assert (= (and b!1396800 res!935716) b!1396803))

(assert (= (and b!1396803 res!935719) b!1396799))

(assert (= (and b!1396799 res!935711) b!1396801))

(assert (= (and b!1396801 res!935712) b!1396798))

(assert (= (and b!1396798 res!935714) b!1396806))

(assert (= (and b!1396806 res!935713) b!1396805))

(assert (= (and b!1396806 (not res!935717)) b!1396804))

(assert (= (and b!1396804 (not res!935718)) b!1396802))

(declare-fun m!1283355 () Bool)

(assert (=> b!1396804 m!1283355))

(assert (=> b!1396804 m!1283355))

(declare-fun m!1283357 () Bool)

(assert (=> b!1396804 m!1283357))

(declare-fun m!1283359 () Bool)

(assert (=> b!1396804 m!1283359))

(declare-fun m!1283361 () Bool)

(assert (=> b!1396804 m!1283361))

(declare-fun m!1283363 () Bool)

(assert (=> b!1396801 m!1283363))

(declare-fun m!1283365 () Bool)

(assert (=> b!1396798 m!1283365))

(declare-fun m!1283367 () Bool)

(assert (=> b!1396805 m!1283367))

(assert (=> b!1396805 m!1283367))

(declare-fun m!1283369 () Bool)

(assert (=> b!1396805 m!1283369))

(declare-fun m!1283371 () Bool)

(assert (=> start!119988 m!1283371))

(declare-fun m!1283373 () Bool)

(assert (=> start!119988 m!1283373))

(declare-fun m!1283375 () Bool)

(assert (=> b!1396803 m!1283375))

(assert (=> b!1396803 m!1283375))

(declare-fun m!1283377 () Bool)

(assert (=> b!1396803 m!1283377))

(assert (=> b!1396799 m!1283367))

(assert (=> b!1396799 m!1283367))

(declare-fun m!1283379 () Bool)

(assert (=> b!1396799 m!1283379))

(declare-fun m!1283381 () Bool)

(assert (=> b!1396802 m!1283381))

(assert (=> b!1396806 m!1283367))

(declare-fun m!1283383 () Bool)

(assert (=> b!1396806 m!1283383))

(assert (=> b!1396806 m!1283367))

(assert (=> b!1396806 m!1283367))

(declare-fun m!1283385 () Bool)

(assert (=> b!1396806 m!1283385))

(declare-fun m!1283387 () Bool)

(assert (=> b!1396806 m!1283387))

(declare-fun m!1283389 () Bool)

(assert (=> b!1396806 m!1283389))

(push 1)

