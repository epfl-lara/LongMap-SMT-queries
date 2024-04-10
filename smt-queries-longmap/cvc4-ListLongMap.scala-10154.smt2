; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119692 () Bool)

(assert start!119692)

(declare-fun b!1394251 () Bool)

(declare-fun res!933662 () Bool)

(declare-fun e!789420 () Bool)

(assert (=> b!1394251 (=> (not res!933662) (not e!789420))))

(declare-datatypes ((array!95374 0))(
  ( (array!95375 (arr!46045 (Array (_ BitVec 32) (_ BitVec 64))) (size!46595 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95374)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394251 (= res!933662 (validKeyInArray!0 (select (arr!46045 a!2901) j!112)))))

(declare-fun b!1394252 () Bool)

(declare-fun e!789422 () Bool)

(assert (=> b!1394252 (= e!789422 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!612326 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10362 0))(
  ( (MissingZero!10362 (index!43819 (_ BitVec 32))) (Found!10362 (index!43820 (_ BitVec 32))) (Intermediate!10362 (undefined!11174 Bool) (index!43821 (_ BitVec 32)) (x!125486 (_ BitVec 32))) (Undefined!10362) (MissingVacant!10362 (index!43822 (_ BitVec 32))) )
))
(declare-fun lt!612329 () SeekEntryResult!10362)

(declare-fun lt!612327 () array!95374)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95374 (_ BitVec 32)) SeekEntryResult!10362)

(assert (=> b!1394252 (= lt!612329 (seekEntryOrOpen!0 lt!612326 lt!612327 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612330 () (_ BitVec 32))

(declare-fun lt!612328 () SeekEntryResult!10362)

(declare-datatypes ((Unit!46728 0))(
  ( (Unit!46729) )
))
(declare-fun lt!612324 () Unit!46728)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46728)

(assert (=> b!1394252 (= lt!612324 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612330 (x!125486 lt!612328) (index!43821 lt!612328) mask!2840))))

(declare-fun b!1394253 () Bool)

(declare-fun res!933661 () Bool)

(assert (=> b!1394253 (=> (not res!933661) (not e!789420))))

(assert (=> b!1394253 (= res!933661 (and (= (size!46595 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46595 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46595 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394254 () Bool)

(declare-fun res!933663 () Bool)

(assert (=> b!1394254 (=> (not res!933663) (not e!789420))))

(assert (=> b!1394254 (= res!933663 (validKeyInArray!0 (select (arr!46045 a!2901) i!1037)))))

(declare-fun b!1394255 () Bool)

(declare-fun e!789419 () Bool)

(assert (=> b!1394255 (= e!789419 e!789422)))

(declare-fun res!933667 () Bool)

(assert (=> b!1394255 (=> res!933667 e!789422)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95374 (_ BitVec 32)) SeekEntryResult!10362)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394255 (= res!933667 (not (= lt!612328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612326 mask!2840) lt!612326 lt!612327 mask!2840))))))

(assert (=> b!1394255 (= lt!612326 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394255 (= lt!612327 (array!95375 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46595 a!2901)))))

(declare-fun b!1394257 () Bool)

(declare-fun res!933665 () Bool)

(assert (=> b!1394257 (=> res!933665 e!789422)))

(assert (=> b!1394257 (= res!933665 (or (bvslt (x!125486 lt!612328) #b00000000000000000000000000000000) (bvsgt (x!125486 lt!612328) #b01111111111111111111111111111110) (bvslt lt!612330 #b00000000000000000000000000000000) (bvsge lt!612330 (size!46595 a!2901)) (bvslt (index!43821 lt!612328) #b00000000000000000000000000000000) (bvsge (index!43821 lt!612328) (size!46595 a!2901)) (not (= lt!612328 (Intermediate!10362 false (index!43821 lt!612328) (x!125486 lt!612328))))))))

(declare-fun b!1394258 () Bool)

(declare-fun res!933659 () Bool)

(assert (=> b!1394258 (=> (not res!933659) (not e!789420))))

(declare-datatypes ((List!32564 0))(
  ( (Nil!32561) (Cons!32560 (h!33793 (_ BitVec 64)) (t!47258 List!32564)) )
))
(declare-fun arrayNoDuplicates!0 (array!95374 (_ BitVec 32) List!32564) Bool)

(assert (=> b!1394258 (= res!933659 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32561))))

(declare-fun b!1394259 () Bool)

(declare-fun res!933660 () Bool)

(assert (=> b!1394259 (=> (not res!933660) (not e!789420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95374 (_ BitVec 32)) Bool)

(assert (=> b!1394259 (= res!933660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394256 () Bool)

(assert (=> b!1394256 (= e!789420 (not e!789419))))

(declare-fun res!933664 () Bool)

(assert (=> b!1394256 (=> res!933664 e!789419)))

(assert (=> b!1394256 (= res!933664 (or (not (is-Intermediate!10362 lt!612328)) (undefined!11174 lt!612328)))))

(assert (=> b!1394256 (= lt!612329 (Found!10362 j!112))))

(assert (=> b!1394256 (= lt!612329 (seekEntryOrOpen!0 (select (arr!46045 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394256 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612325 () Unit!46728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46728)

(assert (=> b!1394256 (= lt!612325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394256 (= lt!612328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612330 (select (arr!46045 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394256 (= lt!612330 (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840))))

(declare-fun res!933666 () Bool)

(assert (=> start!119692 (=> (not res!933666) (not e!789420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119692 (= res!933666 (validMask!0 mask!2840))))

(assert (=> start!119692 e!789420))

(assert (=> start!119692 true))

(declare-fun array_inv!35073 (array!95374) Bool)

(assert (=> start!119692 (array_inv!35073 a!2901)))

(assert (= (and start!119692 res!933666) b!1394253))

(assert (= (and b!1394253 res!933661) b!1394254))

(assert (= (and b!1394254 res!933663) b!1394251))

(assert (= (and b!1394251 res!933662) b!1394259))

(assert (= (and b!1394259 res!933660) b!1394258))

(assert (= (and b!1394258 res!933659) b!1394256))

(assert (= (and b!1394256 (not res!933664)) b!1394255))

(assert (= (and b!1394255 (not res!933667)) b!1394257))

(assert (= (and b!1394257 (not res!933665)) b!1394252))

(declare-fun m!1280497 () Bool)

(assert (=> b!1394256 m!1280497))

(declare-fun m!1280499 () Bool)

(assert (=> b!1394256 m!1280499))

(assert (=> b!1394256 m!1280497))

(assert (=> b!1394256 m!1280497))

(declare-fun m!1280501 () Bool)

(assert (=> b!1394256 m!1280501))

(declare-fun m!1280503 () Bool)

(assert (=> b!1394256 m!1280503))

(assert (=> b!1394256 m!1280497))

(declare-fun m!1280505 () Bool)

(assert (=> b!1394256 m!1280505))

(declare-fun m!1280507 () Bool)

(assert (=> b!1394256 m!1280507))

(declare-fun m!1280509 () Bool)

(assert (=> start!119692 m!1280509))

(declare-fun m!1280511 () Bool)

(assert (=> start!119692 m!1280511))

(declare-fun m!1280513 () Bool)

(assert (=> b!1394258 m!1280513))

(declare-fun m!1280515 () Bool)

(assert (=> b!1394255 m!1280515))

(assert (=> b!1394255 m!1280515))

(declare-fun m!1280517 () Bool)

(assert (=> b!1394255 m!1280517))

(declare-fun m!1280519 () Bool)

(assert (=> b!1394255 m!1280519))

(declare-fun m!1280521 () Bool)

(assert (=> b!1394255 m!1280521))

(declare-fun m!1280523 () Bool)

(assert (=> b!1394254 m!1280523))

(assert (=> b!1394254 m!1280523))

(declare-fun m!1280525 () Bool)

(assert (=> b!1394254 m!1280525))

(declare-fun m!1280527 () Bool)

(assert (=> b!1394259 m!1280527))

(assert (=> b!1394251 m!1280497))

(assert (=> b!1394251 m!1280497))

(declare-fun m!1280529 () Bool)

(assert (=> b!1394251 m!1280529))

(declare-fun m!1280531 () Bool)

(assert (=> b!1394252 m!1280531))

(declare-fun m!1280533 () Bool)

(assert (=> b!1394252 m!1280533))

(push 1)

