; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119716 () Bool)

(assert start!119716)

(declare-fun b!1394575 () Bool)

(declare-fun res!933990 () Bool)

(declare-fun e!789566 () Bool)

(assert (=> b!1394575 (=> (not res!933990) (not e!789566))))

(declare-datatypes ((array!95398 0))(
  ( (array!95399 (arr!46057 (Array (_ BitVec 32) (_ BitVec 64))) (size!46607 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95398)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394575 (= res!933990 (validKeyInArray!0 (select (arr!46057 a!2901) j!112)))))

(declare-fun b!1394576 () Bool)

(declare-fun e!789563 () Bool)

(assert (=> b!1394576 (= e!789566 (not e!789563))))

(declare-fun res!933985 () Bool)

(assert (=> b!1394576 (=> res!933985 e!789563)))

(declare-datatypes ((SeekEntryResult!10374 0))(
  ( (MissingZero!10374 (index!43867 (_ BitVec 32))) (Found!10374 (index!43868 (_ BitVec 32))) (Intermediate!10374 (undefined!11186 Bool) (index!43869 (_ BitVec 32)) (x!125530 (_ BitVec 32))) (Undefined!10374) (MissingVacant!10374 (index!43870 (_ BitVec 32))) )
))
(declare-fun lt!612576 () SeekEntryResult!10374)

(assert (=> b!1394576 (= res!933985 (or (not (is-Intermediate!10374 lt!612576)) (undefined!11186 lt!612576)))))

(declare-fun lt!612579 () SeekEntryResult!10374)

(assert (=> b!1394576 (= lt!612579 (Found!10374 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95398 (_ BitVec 32)) SeekEntryResult!10374)

(assert (=> b!1394576 (= lt!612579 (seekEntryOrOpen!0 (select (arr!46057 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95398 (_ BitVec 32)) Bool)

(assert (=> b!1394576 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46752 0))(
  ( (Unit!46753) )
))
(declare-fun lt!612581 () Unit!46752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46752)

(assert (=> b!1394576 (= lt!612581 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!612580 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95398 (_ BitVec 32)) SeekEntryResult!10374)

(assert (=> b!1394576 (= lt!612576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612580 (select (arr!46057 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394576 (= lt!612580 (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840))))

(declare-fun b!1394577 () Bool)

(declare-fun res!933986 () Bool)

(assert (=> b!1394577 (=> (not res!933986) (not e!789566))))

(assert (=> b!1394577 (= res!933986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394578 () Bool)

(declare-fun res!933991 () Bool)

(declare-fun e!789565 () Bool)

(assert (=> b!1394578 (=> res!933991 e!789565)))

(assert (=> b!1394578 (= res!933991 (or (bvslt (x!125530 lt!612576) #b00000000000000000000000000000000) (bvsgt (x!125530 lt!612576) #b01111111111111111111111111111110) (bvslt lt!612580 #b00000000000000000000000000000000) (bvsge lt!612580 (size!46607 a!2901)) (bvslt (index!43869 lt!612576) #b00000000000000000000000000000000) (bvsge (index!43869 lt!612576) (size!46607 a!2901)) (not (= lt!612576 (Intermediate!10374 false (index!43869 lt!612576) (x!125530 lt!612576))))))))

(declare-fun res!933983 () Bool)

(assert (=> start!119716 (=> (not res!933983) (not e!789566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119716 (= res!933983 (validMask!0 mask!2840))))

(assert (=> start!119716 e!789566))

(assert (=> start!119716 true))

(declare-fun array_inv!35085 (array!95398) Bool)

(assert (=> start!119716 (array_inv!35085 a!2901)))

(declare-fun b!1394579 () Bool)

(assert (=> b!1394579 (= e!789563 e!789565)))

(declare-fun res!933987 () Bool)

(assert (=> b!1394579 (=> res!933987 e!789565)))

(declare-fun lt!612578 () (_ BitVec 64))

(declare-fun lt!612577 () array!95398)

(assert (=> b!1394579 (= res!933987 (not (= lt!612576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612578 mask!2840) lt!612578 lt!612577 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394579 (= lt!612578 (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394579 (= lt!612577 (array!95399 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46607 a!2901)))))

(declare-fun b!1394580 () Bool)

(assert (=> b!1394580 (= e!789565 true)))

(assert (=> b!1394580 (= lt!612579 (seekEntryOrOpen!0 lt!612578 lt!612577 mask!2840))))

(declare-fun lt!612582 () Unit!46752)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46752)

(assert (=> b!1394580 (= lt!612582 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612580 (x!125530 lt!612576) (index!43869 lt!612576) mask!2840))))

(declare-fun b!1394581 () Bool)

(declare-fun res!933984 () Bool)

(assert (=> b!1394581 (=> (not res!933984) (not e!789566))))

(assert (=> b!1394581 (= res!933984 (validKeyInArray!0 (select (arr!46057 a!2901) i!1037)))))

(declare-fun b!1394582 () Bool)

(declare-fun res!933989 () Bool)

(assert (=> b!1394582 (=> (not res!933989) (not e!789566))))

(assert (=> b!1394582 (= res!933989 (and (= (size!46607 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46607 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46607 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394583 () Bool)

(declare-fun res!933988 () Bool)

(assert (=> b!1394583 (=> (not res!933988) (not e!789566))))

(declare-datatypes ((List!32576 0))(
  ( (Nil!32573) (Cons!32572 (h!33805 (_ BitVec 64)) (t!47270 List!32576)) )
))
(declare-fun arrayNoDuplicates!0 (array!95398 (_ BitVec 32) List!32576) Bool)

(assert (=> b!1394583 (= res!933988 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32573))))

(assert (= (and start!119716 res!933983) b!1394582))

(assert (= (and b!1394582 res!933989) b!1394581))

(assert (= (and b!1394581 res!933984) b!1394575))

(assert (= (and b!1394575 res!933990) b!1394577))

(assert (= (and b!1394577 res!933986) b!1394583))

(assert (= (and b!1394583 res!933988) b!1394576))

(assert (= (and b!1394576 (not res!933985)) b!1394579))

(assert (= (and b!1394579 (not res!933987)) b!1394578))

(assert (= (and b!1394578 (not res!933991)) b!1394580))

(declare-fun m!1280953 () Bool)

(assert (=> b!1394575 m!1280953))

(assert (=> b!1394575 m!1280953))

(declare-fun m!1280955 () Bool)

(assert (=> b!1394575 m!1280955))

(declare-fun m!1280957 () Bool)

(assert (=> b!1394580 m!1280957))

(declare-fun m!1280959 () Bool)

(assert (=> b!1394580 m!1280959))

(assert (=> b!1394576 m!1280953))

(declare-fun m!1280961 () Bool)

(assert (=> b!1394576 m!1280961))

(assert (=> b!1394576 m!1280953))

(declare-fun m!1280963 () Bool)

(assert (=> b!1394576 m!1280963))

(declare-fun m!1280965 () Bool)

(assert (=> b!1394576 m!1280965))

(assert (=> b!1394576 m!1280953))

(declare-fun m!1280967 () Bool)

(assert (=> b!1394576 m!1280967))

(assert (=> b!1394576 m!1280953))

(declare-fun m!1280969 () Bool)

(assert (=> b!1394576 m!1280969))

(declare-fun m!1280971 () Bool)

(assert (=> b!1394577 m!1280971))

(declare-fun m!1280973 () Bool)

(assert (=> b!1394581 m!1280973))

(assert (=> b!1394581 m!1280973))

(declare-fun m!1280975 () Bool)

(assert (=> b!1394581 m!1280975))

(declare-fun m!1280977 () Bool)

(assert (=> b!1394583 m!1280977))

(declare-fun m!1280979 () Bool)

(assert (=> b!1394579 m!1280979))

(assert (=> b!1394579 m!1280979))

(declare-fun m!1280981 () Bool)

(assert (=> b!1394579 m!1280981))

(declare-fun m!1280983 () Bool)

(assert (=> b!1394579 m!1280983))

(declare-fun m!1280985 () Bool)

(assert (=> b!1394579 m!1280985))

(declare-fun m!1280987 () Bool)

(assert (=> start!119716 m!1280987))

(declare-fun m!1280989 () Bool)

(assert (=> start!119716 m!1280989))

(push 1)

