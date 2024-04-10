; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119502 () Bool)

(assert start!119502)

(declare-fun b!1392329 () Bool)

(declare-fun res!931906 () Bool)

(declare-fun e!788435 () Bool)

(assert (=> b!1392329 (=> (not res!931906) (not e!788435))))

(declare-datatypes ((array!95235 0))(
  ( (array!95236 (arr!45977 (Array (_ BitVec 32) (_ BitVec 64))) (size!46527 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95235)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95235 (_ BitVec 32)) Bool)

(assert (=> b!1392329 (= res!931906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392330 () Bool)

(declare-fun res!931909 () Bool)

(assert (=> b!1392330 (=> (not res!931909) (not e!788435))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392330 (= res!931909 (validKeyInArray!0 (select (arr!45977 a!2901) j!112)))))

(declare-fun b!1392331 () Bool)

(declare-fun res!931905 () Bool)

(assert (=> b!1392331 (=> (not res!931905) (not e!788435))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392331 (= res!931905 (and (= (size!46527 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46527 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46527 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931907 () Bool)

(assert (=> start!119502 (=> (not res!931907) (not e!788435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119502 (= res!931907 (validMask!0 mask!2840))))

(assert (=> start!119502 e!788435))

(assert (=> start!119502 true))

(declare-fun array_inv!35005 (array!95235) Bool)

(assert (=> start!119502 (array_inv!35005 a!2901)))

(declare-fun b!1392332 () Bool)

(declare-fun e!788438 () Bool)

(assert (=> b!1392332 (= e!788435 (not e!788438))))

(declare-fun res!931903 () Bool)

(assert (=> b!1392332 (=> res!931903 e!788438)))

(declare-datatypes ((SeekEntryResult!10294 0))(
  ( (MissingZero!10294 (index!43547 (_ BitVec 32))) (Found!10294 (index!43548 (_ BitVec 32))) (Intermediate!10294 (undefined!11106 Bool) (index!43549 (_ BitVec 32)) (x!125236 (_ BitVec 32))) (Undefined!10294) (MissingVacant!10294 (index!43550 (_ BitVec 32))) )
))
(declare-fun lt!611580 () SeekEntryResult!10294)

(assert (=> b!1392332 (= res!931903 (or (not (is-Intermediate!10294 lt!611580)) (undefined!11106 lt!611580)))))

(declare-fun e!788437 () Bool)

(assert (=> b!1392332 e!788437))

(declare-fun res!931908 () Bool)

(assert (=> b!1392332 (=> (not res!931908) (not e!788437))))

(assert (=> b!1392332 (= res!931908 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46592 0))(
  ( (Unit!46593) )
))
(declare-fun lt!611578 () Unit!46592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46592)

(assert (=> b!1392332 (= lt!611578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95235 (_ BitVec 32)) SeekEntryResult!10294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392332 (= lt!611580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45977 a!2901) j!112) mask!2840) (select (arr!45977 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392333 () Bool)

(assert (=> b!1392333 (= e!788438 true)))

(declare-fun lt!611579 () (_ BitVec 32))

(assert (=> b!1392333 (= lt!611579 (toIndex!0 (select (store (arr!45977 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392334 () Bool)

(declare-fun res!931904 () Bool)

(assert (=> b!1392334 (=> (not res!931904) (not e!788435))))

(assert (=> b!1392334 (= res!931904 (validKeyInArray!0 (select (arr!45977 a!2901) i!1037)))))

(declare-fun b!1392335 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95235 (_ BitVec 32)) SeekEntryResult!10294)

(assert (=> b!1392335 (= e!788437 (= (seekEntryOrOpen!0 (select (arr!45977 a!2901) j!112) a!2901 mask!2840) (Found!10294 j!112)))))

(declare-fun b!1392336 () Bool)

(declare-fun res!931902 () Bool)

(assert (=> b!1392336 (=> (not res!931902) (not e!788435))))

(declare-datatypes ((List!32496 0))(
  ( (Nil!32493) (Cons!32492 (h!33722 (_ BitVec 64)) (t!47190 List!32496)) )
))
(declare-fun arrayNoDuplicates!0 (array!95235 (_ BitVec 32) List!32496) Bool)

(assert (=> b!1392336 (= res!931902 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32493))))

(assert (= (and start!119502 res!931907) b!1392331))

(assert (= (and b!1392331 res!931905) b!1392334))

(assert (= (and b!1392334 res!931904) b!1392330))

(assert (= (and b!1392330 res!931909) b!1392329))

(assert (= (and b!1392329 res!931906) b!1392336))

(assert (= (and b!1392336 res!931902) b!1392332))

(assert (= (and b!1392332 res!931908) b!1392335))

(assert (= (and b!1392332 (not res!931903)) b!1392333))

(declare-fun m!1278033 () Bool)

(assert (=> b!1392336 m!1278033))

(declare-fun m!1278035 () Bool)

(assert (=> b!1392329 m!1278035))

(declare-fun m!1278037 () Bool)

(assert (=> b!1392335 m!1278037))

(assert (=> b!1392335 m!1278037))

(declare-fun m!1278039 () Bool)

(assert (=> b!1392335 m!1278039))

(assert (=> b!1392332 m!1278037))

(declare-fun m!1278041 () Bool)

(assert (=> b!1392332 m!1278041))

(assert (=> b!1392332 m!1278037))

(declare-fun m!1278043 () Bool)

(assert (=> b!1392332 m!1278043))

(assert (=> b!1392332 m!1278041))

(assert (=> b!1392332 m!1278037))

(declare-fun m!1278045 () Bool)

(assert (=> b!1392332 m!1278045))

(declare-fun m!1278047 () Bool)

(assert (=> b!1392332 m!1278047))

(assert (=> b!1392330 m!1278037))

(assert (=> b!1392330 m!1278037))

(declare-fun m!1278049 () Bool)

(assert (=> b!1392330 m!1278049))

(declare-fun m!1278051 () Bool)

(assert (=> b!1392333 m!1278051))

(declare-fun m!1278053 () Bool)

(assert (=> b!1392333 m!1278053))

(assert (=> b!1392333 m!1278053))

(declare-fun m!1278055 () Bool)

(assert (=> b!1392333 m!1278055))

(declare-fun m!1278057 () Bool)

(assert (=> start!119502 m!1278057))

(declare-fun m!1278059 () Bool)

(assert (=> start!119502 m!1278059))

(declare-fun m!1278061 () Bool)

(assert (=> b!1392334 m!1278061))

(assert (=> b!1392334 m!1278061))

(declare-fun m!1278063 () Bool)

(assert (=> b!1392334 m!1278063))

(push 1)

(assert (not b!1392334))

(assert (not b!1392336))

(assert (not b!1392333))

(assert (not b!1392332))

(assert (not b!1392329))

(assert (not b!1392335))

(assert (not start!119502))

(assert (not b!1392330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

