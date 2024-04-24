; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131104 () Bool)

(assert start!131104)

(declare-fun b!1535401 () Bool)

(declare-fun res!1051001 () Bool)

(declare-fun e!855564 () Bool)

(assert (=> b!1535401 (=> (not res!1051001) (not e!855564))))

(declare-datatypes ((array!101939 0))(
  ( (array!101940 (arr!49179 (Array (_ BitVec 32) (_ BitVec 64))) (size!49730 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101939)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535401 (= res!1051001 (and (= (size!49730 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49730 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49730 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1051003 () Bool)

(assert (=> start!131104 (=> (not res!1051003) (not e!855564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131104 (= res!1051003 (validMask!0 mask!2480))))

(assert (=> start!131104 e!855564))

(assert (=> start!131104 true))

(declare-fun array_inv!38460 (array!101939) Bool)

(assert (=> start!131104 (array_inv!38460 a!2792)))

(declare-fun b!1535402 () Bool)

(declare-fun res!1051004 () Bool)

(assert (=> b!1535402 (=> (not res!1051004) (not e!855564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101939 (_ BitVec 32)) Bool)

(assert (=> b!1535402 (= res!1051004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535403 () Bool)

(declare-fun res!1051005 () Bool)

(assert (=> b!1535403 (=> (not res!1051005) (not e!855564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535403 (= res!1051005 (validKeyInArray!0 (select (arr!49179 a!2792) i!951)))))

(declare-fun b!1535404 () Bool)

(declare-fun res!1051002 () Bool)

(assert (=> b!1535404 (=> (not res!1051002) (not e!855564))))

(assert (=> b!1535404 (= res!1051002 (validKeyInArray!0 (select (arr!49179 a!2792) j!64)))))

(declare-fun b!1535405 () Bool)

(assert (=> b!1535405 (= e!855564 false)))

(declare-fun lt!664650 () Bool)

(declare-datatypes ((List!35640 0))(
  ( (Nil!35637) (Cons!35636 (h!37099 (_ BitVec 64)) (t!50326 List!35640)) )
))
(declare-fun arrayNoDuplicates!0 (array!101939 (_ BitVec 32) List!35640) Bool)

(assert (=> b!1535405 (= lt!664650 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35637))))

(assert (= (and start!131104 res!1051003) b!1535401))

(assert (= (and b!1535401 res!1051001) b!1535403))

(assert (= (and b!1535403 res!1051005) b!1535404))

(assert (= (and b!1535404 res!1051002) b!1535402))

(assert (= (and b!1535402 res!1051004) b!1535405))

(declare-fun m!1417983 () Bool)

(assert (=> b!1535404 m!1417983))

(assert (=> b!1535404 m!1417983))

(declare-fun m!1417985 () Bool)

(assert (=> b!1535404 m!1417985))

(declare-fun m!1417987 () Bool)

(assert (=> b!1535403 m!1417987))

(assert (=> b!1535403 m!1417987))

(declare-fun m!1417989 () Bool)

(assert (=> b!1535403 m!1417989))

(declare-fun m!1417991 () Bool)

(assert (=> b!1535405 m!1417991))

(declare-fun m!1417993 () Bool)

(assert (=> start!131104 m!1417993))

(declare-fun m!1417995 () Bool)

(assert (=> start!131104 m!1417995))

(declare-fun m!1417997 () Bool)

(assert (=> b!1535402 m!1417997))

(push 1)

(assert (not b!1535403))

(assert (not b!1535402))

(assert (not b!1535405))

(assert (not b!1535404))

(assert (not start!131104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

