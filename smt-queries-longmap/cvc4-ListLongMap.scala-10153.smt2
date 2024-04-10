; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119686 () Bool)

(assert start!119686)

(declare-fun b!1394171 () Bool)

(declare-fun res!933582 () Bool)

(declare-fun e!789383 () Bool)

(assert (=> b!1394171 (=> (not res!933582) (not e!789383))))

(declare-datatypes ((array!95368 0))(
  ( (array!95369 (arr!46042 (Array (_ BitVec 32) (_ BitVec 64))) (size!46592 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95368)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95368 (_ BitVec 32)) Bool)

(assert (=> b!1394171 (= res!933582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394172 () Bool)

(declare-fun e!789386 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10359 0))(
  ( (MissingZero!10359 (index!43807 (_ BitVec 32))) (Found!10359 (index!43808 (_ BitVec 32))) (Intermediate!10359 (undefined!11171 Bool) (index!43809 (_ BitVec 32)) (x!125475 (_ BitVec 32))) (Undefined!10359) (MissingVacant!10359 (index!43810 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95368 (_ BitVec 32)) SeekEntryResult!10359)

(assert (=> b!1394172 (= e!789386 (= (seekEntryOrOpen!0 (select (arr!46042 a!2901) j!112) a!2901 mask!2840) (Found!10359 j!112)))))

(declare-fun b!1394173 () Bool)

(declare-fun res!933585 () Bool)

(assert (=> b!1394173 (=> (not res!933585) (not e!789383))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394173 (= res!933585 (validKeyInArray!0 (select (arr!46042 a!2901) i!1037)))))

(declare-fun b!1394174 () Bool)

(declare-fun e!789384 () Bool)

(assert (=> b!1394174 (= e!789384 true)))

(declare-fun lt!612266 () SeekEntryResult!10359)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95368 (_ BitVec 32)) SeekEntryResult!10359)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394174 (= lt!612266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46042 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46042 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95369 (store (arr!46042 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46592 a!2901)) mask!2840))))

(declare-fun b!1394175 () Bool)

(declare-fun res!933584 () Bool)

(assert (=> b!1394175 (=> (not res!933584) (not e!789383))))

(declare-datatypes ((List!32561 0))(
  ( (Nil!32558) (Cons!32557 (h!33790 (_ BitVec 64)) (t!47255 List!32561)) )
))
(declare-fun arrayNoDuplicates!0 (array!95368 (_ BitVec 32) List!32561) Bool)

(assert (=> b!1394175 (= res!933584 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32558))))

(declare-fun b!1394176 () Bool)

(declare-fun res!933579 () Bool)

(assert (=> b!1394176 (=> (not res!933579) (not e!789383))))

(assert (=> b!1394176 (= res!933579 (and (= (size!46592 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46592 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46592 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!933586 () Bool)

(assert (=> start!119686 (=> (not res!933586) (not e!789383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119686 (= res!933586 (validMask!0 mask!2840))))

(assert (=> start!119686 e!789383))

(assert (=> start!119686 true))

(declare-fun array_inv!35070 (array!95368) Bool)

(assert (=> start!119686 (array_inv!35070 a!2901)))

(declare-fun b!1394177 () Bool)

(declare-fun res!933583 () Bool)

(assert (=> b!1394177 (=> (not res!933583) (not e!789383))))

(assert (=> b!1394177 (= res!933583 (validKeyInArray!0 (select (arr!46042 a!2901) j!112)))))

(declare-fun b!1394178 () Bool)

(assert (=> b!1394178 (= e!789383 (not e!789384))))

(declare-fun res!933580 () Bool)

(assert (=> b!1394178 (=> res!933580 e!789384)))

(declare-fun lt!612267 () SeekEntryResult!10359)

(assert (=> b!1394178 (= res!933580 (or (not (is-Intermediate!10359 lt!612267)) (undefined!11171 lt!612267)))))

(assert (=> b!1394178 e!789386))

(declare-fun res!933581 () Bool)

(assert (=> b!1394178 (=> (not res!933581) (not e!789386))))

(assert (=> b!1394178 (= res!933581 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46722 0))(
  ( (Unit!46723) )
))
(declare-fun lt!612265 () Unit!46722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46722)

(assert (=> b!1394178 (= lt!612265 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394178 (= lt!612267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46042 a!2901) j!112) mask!2840) (select (arr!46042 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119686 res!933586) b!1394176))

(assert (= (and b!1394176 res!933579) b!1394173))

(assert (= (and b!1394173 res!933585) b!1394177))

(assert (= (and b!1394177 res!933583) b!1394171))

(assert (= (and b!1394171 res!933582) b!1394175))

(assert (= (and b!1394175 res!933584) b!1394178))

(assert (= (and b!1394178 res!933581) b!1394172))

(assert (= (and b!1394178 (not res!933580)) b!1394174))

(declare-fun m!1280387 () Bool)

(assert (=> b!1394178 m!1280387))

(declare-fun m!1280389 () Bool)

(assert (=> b!1394178 m!1280389))

(assert (=> b!1394178 m!1280387))

(declare-fun m!1280391 () Bool)

(assert (=> b!1394178 m!1280391))

(assert (=> b!1394178 m!1280389))

(assert (=> b!1394178 m!1280387))

(declare-fun m!1280393 () Bool)

(assert (=> b!1394178 m!1280393))

(declare-fun m!1280395 () Bool)

(assert (=> b!1394178 m!1280395))

(declare-fun m!1280397 () Bool)

(assert (=> b!1394175 m!1280397))

(assert (=> b!1394177 m!1280387))

(assert (=> b!1394177 m!1280387))

(declare-fun m!1280399 () Bool)

(assert (=> b!1394177 m!1280399))

(declare-fun m!1280401 () Bool)

(assert (=> b!1394171 m!1280401))

(declare-fun m!1280403 () Bool)

(assert (=> start!119686 m!1280403))

(declare-fun m!1280405 () Bool)

(assert (=> start!119686 m!1280405))

(assert (=> b!1394172 m!1280387))

(assert (=> b!1394172 m!1280387))

(declare-fun m!1280407 () Bool)

(assert (=> b!1394172 m!1280407))

(declare-fun m!1280409 () Bool)

(assert (=> b!1394174 m!1280409))

(declare-fun m!1280411 () Bool)

(assert (=> b!1394174 m!1280411))

(assert (=> b!1394174 m!1280411))

(declare-fun m!1280413 () Bool)

(assert (=> b!1394174 m!1280413))

(assert (=> b!1394174 m!1280413))

(assert (=> b!1394174 m!1280411))

(declare-fun m!1280415 () Bool)

(assert (=> b!1394174 m!1280415))

(declare-fun m!1280417 () Bool)

(assert (=> b!1394173 m!1280417))

(assert (=> b!1394173 m!1280417))

(declare-fun m!1280419 () Bool)

(assert (=> b!1394173 m!1280419))

(push 1)

(assert (not b!1394171))

(assert (not b!1394172))

(assert (not b!1394174))

(assert (not b!1394173))

(assert (not b!1394175))

(assert (not b!1394177))

(assert (not start!119686))

(assert (not b!1394178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

