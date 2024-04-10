; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119722 () Bool)

(assert start!119722)

(declare-fun res!934068 () Bool)

(declare-fun e!789601 () Bool)

(assert (=> start!119722 (=> (not res!934068) (not e!789601))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119722 (= res!934068 (validMask!0 mask!2840))))

(assert (=> start!119722 e!789601))

(assert (=> start!119722 true))

(declare-datatypes ((array!95404 0))(
  ( (array!95405 (arr!46060 (Array (_ BitVec 32) (_ BitVec 64))) (size!46610 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95404)

(declare-fun array_inv!35088 (array!95404) Bool)

(assert (=> start!119722 (array_inv!35088 a!2901)))

(declare-fun b!1394656 () Bool)

(declare-fun e!789599 () Bool)

(declare-fun e!789600 () Bool)

(assert (=> b!1394656 (= e!789599 e!789600)))

(declare-fun res!934067 () Bool)

(assert (=> b!1394656 (=> res!934067 e!789600)))

(declare-fun lt!612641 () (_ BitVec 64))

(declare-fun lt!612644 () array!95404)

(declare-datatypes ((SeekEntryResult!10377 0))(
  ( (MissingZero!10377 (index!43879 (_ BitVec 32))) (Found!10377 (index!43880 (_ BitVec 32))) (Intermediate!10377 (undefined!11189 Bool) (index!43881 (_ BitVec 32)) (x!125541 (_ BitVec 32))) (Undefined!10377) (MissingVacant!10377 (index!43882 (_ BitVec 32))) )
))
(declare-fun lt!612645 () SeekEntryResult!10377)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95404 (_ BitVec 32)) SeekEntryResult!10377)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394656 (= res!934067 (not (= lt!612645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612641 mask!2840) lt!612641 lt!612644 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394656 (= lt!612641 (select (store (arr!46060 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394656 (= lt!612644 (array!95405 (store (arr!46060 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46610 a!2901)))))

(declare-fun b!1394657 () Bool)

(assert (=> b!1394657 (= e!789601 (not e!789599))))

(declare-fun res!934071 () Bool)

(assert (=> b!1394657 (=> res!934071 e!789599)))

(assert (=> b!1394657 (= res!934071 (or (not (is-Intermediate!10377 lt!612645)) (undefined!11189 lt!612645)))))

(declare-fun lt!612640 () SeekEntryResult!10377)

(assert (=> b!1394657 (= lt!612640 (Found!10377 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95404 (_ BitVec 32)) SeekEntryResult!10377)

(assert (=> b!1394657 (= lt!612640 (seekEntryOrOpen!0 (select (arr!46060 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95404 (_ BitVec 32)) Bool)

(assert (=> b!1394657 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46758 0))(
  ( (Unit!46759) )
))
(declare-fun lt!612642 () Unit!46758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46758)

(assert (=> b!1394657 (= lt!612642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!612643 () (_ BitVec 32))

(assert (=> b!1394657 (= lt!612645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612643 (select (arr!46060 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394657 (= lt!612643 (toIndex!0 (select (arr!46060 a!2901) j!112) mask!2840))))

(declare-fun b!1394658 () Bool)

(declare-fun res!934064 () Bool)

(assert (=> b!1394658 (=> (not res!934064) (not e!789601))))

(assert (=> b!1394658 (= res!934064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394659 () Bool)

(declare-fun res!934069 () Bool)

(assert (=> b!1394659 (=> res!934069 e!789600)))

(assert (=> b!1394659 (= res!934069 (or (bvslt (x!125541 lt!612645) #b00000000000000000000000000000000) (bvsgt (x!125541 lt!612645) #b01111111111111111111111111111110) (bvslt lt!612643 #b00000000000000000000000000000000) (bvsge lt!612643 (size!46610 a!2901)) (bvslt (index!43881 lt!612645) #b00000000000000000000000000000000) (bvsge (index!43881 lt!612645) (size!46610 a!2901)) (not (= lt!612645 (Intermediate!10377 false (index!43881 lt!612645) (x!125541 lt!612645))))))))

(declare-fun b!1394660 () Bool)

(assert (=> b!1394660 (= e!789600 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1394660 (= lt!612640 (seekEntryOrOpen!0 lt!612641 lt!612644 mask!2840))))

(declare-fun lt!612639 () Unit!46758)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46758)

(assert (=> b!1394660 (= lt!612639 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612643 (x!125541 lt!612645) (index!43881 lt!612645) mask!2840))))

(declare-fun b!1394661 () Bool)

(declare-fun res!934070 () Bool)

(assert (=> b!1394661 (=> (not res!934070) (not e!789601))))

(declare-datatypes ((List!32579 0))(
  ( (Nil!32576) (Cons!32575 (h!33808 (_ BitVec 64)) (t!47273 List!32579)) )
))
(declare-fun arrayNoDuplicates!0 (array!95404 (_ BitVec 32) List!32579) Bool)

(assert (=> b!1394661 (= res!934070 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32576))))

(declare-fun b!1394662 () Bool)

(declare-fun res!934066 () Bool)

(assert (=> b!1394662 (=> (not res!934066) (not e!789601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394662 (= res!934066 (validKeyInArray!0 (select (arr!46060 a!2901) j!112)))))

(declare-fun b!1394663 () Bool)

(declare-fun res!934065 () Bool)

(assert (=> b!1394663 (=> (not res!934065) (not e!789601))))

(assert (=> b!1394663 (= res!934065 (and (= (size!46610 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46610 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46610 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394664 () Bool)

(declare-fun res!934072 () Bool)

(assert (=> b!1394664 (=> (not res!934072) (not e!789601))))

(assert (=> b!1394664 (= res!934072 (validKeyInArray!0 (select (arr!46060 a!2901) i!1037)))))

(assert (= (and start!119722 res!934068) b!1394663))

(assert (= (and b!1394663 res!934065) b!1394664))

(assert (= (and b!1394664 res!934072) b!1394662))

(assert (= (and b!1394662 res!934066) b!1394658))

(assert (= (and b!1394658 res!934064) b!1394661))

(assert (= (and b!1394661 res!934070) b!1394657))

(assert (= (and b!1394657 (not res!934071)) b!1394656))

(assert (= (and b!1394656 (not res!934067)) b!1394659))

(assert (= (and b!1394659 (not res!934069)) b!1394660))

(declare-fun m!1281067 () Bool)

(assert (=> b!1394656 m!1281067))

(assert (=> b!1394656 m!1281067))

(declare-fun m!1281069 () Bool)

(assert (=> b!1394656 m!1281069))

(declare-fun m!1281071 () Bool)

(assert (=> b!1394656 m!1281071))

(declare-fun m!1281073 () Bool)

(assert (=> b!1394656 m!1281073))

(declare-fun m!1281075 () Bool)

(assert (=> b!1394658 m!1281075))

(declare-fun m!1281077 () Bool)

(assert (=> b!1394664 m!1281077))

(assert (=> b!1394664 m!1281077))

(declare-fun m!1281079 () Bool)

(assert (=> b!1394664 m!1281079))

(declare-fun m!1281081 () Bool)

(assert (=> b!1394661 m!1281081))

(declare-fun m!1281083 () Bool)

(assert (=> b!1394660 m!1281083))

(declare-fun m!1281085 () Bool)

(assert (=> b!1394660 m!1281085))

(declare-fun m!1281087 () Bool)

(assert (=> start!119722 m!1281087))

(declare-fun m!1281089 () Bool)

(assert (=> start!119722 m!1281089))

(declare-fun m!1281091 () Bool)

(assert (=> b!1394657 m!1281091))

(declare-fun m!1281093 () Bool)

(assert (=> b!1394657 m!1281093))

(assert (=> b!1394657 m!1281091))

(assert (=> b!1394657 m!1281091))

(declare-fun m!1281095 () Bool)

(assert (=> b!1394657 m!1281095))

(declare-fun m!1281097 () Bool)

(assert (=> b!1394657 m!1281097))

(assert (=> b!1394657 m!1281091))

(declare-fun m!1281099 () Bool)

(assert (=> b!1394657 m!1281099))

(declare-fun m!1281101 () Bool)

(assert (=> b!1394657 m!1281101))

(assert (=> b!1394662 m!1281091))

(assert (=> b!1394662 m!1281091))

(declare-fun m!1281103 () Bool)

(assert (=> b!1394662 m!1281103))

(push 1)

(assert (not b!1394662))

(assert (not b!1394660))

(assert (not b!1394656))

