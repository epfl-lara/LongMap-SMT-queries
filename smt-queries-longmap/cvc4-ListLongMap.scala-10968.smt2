; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128476 () Bool)

(assert start!128476)

(declare-fun b!1506485 () Bool)

(declare-fun e!841921 () Bool)

(assert (=> b!1506485 (= e!841921 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!654241 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100488 0))(
  ( (array!100489 (arr!48487 (Array (_ BitVec 32) (_ BitVec 64))) (size!49037 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100488)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506485 (= lt!654241 (toIndex!0 (select (arr!48487 a!2804) j!70) mask!2512))))

(declare-fun b!1506486 () Bool)

(declare-fun res!1026812 () Bool)

(assert (=> b!1506486 (=> (not res!1026812) (not e!841921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100488 (_ BitVec 32)) Bool)

(assert (=> b!1506486 (= res!1026812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506487 () Bool)

(declare-fun res!1026808 () Bool)

(assert (=> b!1506487 (=> (not res!1026808) (not e!841921))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506487 (= res!1026808 (and (= (size!49037 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49037 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49037 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506488 () Bool)

(declare-fun res!1026811 () Bool)

(assert (=> b!1506488 (=> (not res!1026811) (not e!841921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506488 (= res!1026811 (validKeyInArray!0 (select (arr!48487 a!2804) j!70)))))

(declare-fun b!1506489 () Bool)

(declare-fun res!1026809 () Bool)

(assert (=> b!1506489 (=> (not res!1026809) (not e!841921))))

(declare-datatypes ((List!34970 0))(
  ( (Nil!34967) (Cons!34966 (h!36366 (_ BitVec 64)) (t!49664 List!34970)) )
))
(declare-fun arrayNoDuplicates!0 (array!100488 (_ BitVec 32) List!34970) Bool)

(assert (=> b!1506489 (= res!1026809 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34967))))

(declare-fun b!1506490 () Bool)

(declare-fun res!1026813 () Bool)

(assert (=> b!1506490 (=> (not res!1026813) (not e!841921))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506490 (= res!1026813 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49037 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49037 a!2804))))))

(declare-fun res!1026810 () Bool)

(assert (=> start!128476 (=> (not res!1026810) (not e!841921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128476 (= res!1026810 (validMask!0 mask!2512))))

(assert (=> start!128476 e!841921))

(assert (=> start!128476 true))

(declare-fun array_inv!37515 (array!100488) Bool)

(assert (=> start!128476 (array_inv!37515 a!2804)))

(declare-fun b!1506491 () Bool)

(declare-fun res!1026814 () Bool)

(assert (=> b!1506491 (=> (not res!1026814) (not e!841921))))

(assert (=> b!1506491 (= res!1026814 (validKeyInArray!0 (select (arr!48487 a!2804) i!961)))))

(assert (= (and start!128476 res!1026810) b!1506487))

(assert (= (and b!1506487 res!1026808) b!1506491))

(assert (= (and b!1506491 res!1026814) b!1506488))

(assert (= (and b!1506488 res!1026811) b!1506486))

(assert (= (and b!1506486 res!1026812) b!1506489))

(assert (= (and b!1506489 res!1026809) b!1506490))

(assert (= (and b!1506490 res!1026813) b!1506485))

(declare-fun m!1389421 () Bool)

(assert (=> b!1506486 m!1389421))

(declare-fun m!1389423 () Bool)

(assert (=> b!1506491 m!1389423))

(assert (=> b!1506491 m!1389423))

(declare-fun m!1389425 () Bool)

(assert (=> b!1506491 m!1389425))

(declare-fun m!1389427 () Bool)

(assert (=> start!128476 m!1389427))

(declare-fun m!1389429 () Bool)

(assert (=> start!128476 m!1389429))

(declare-fun m!1389431 () Bool)

(assert (=> b!1506485 m!1389431))

(assert (=> b!1506485 m!1389431))

(declare-fun m!1389433 () Bool)

(assert (=> b!1506485 m!1389433))

(assert (=> b!1506488 m!1389431))

(assert (=> b!1506488 m!1389431))

(declare-fun m!1389435 () Bool)

(assert (=> b!1506488 m!1389435))

(declare-fun m!1389437 () Bool)

(assert (=> b!1506489 m!1389437))

(push 1)

(assert (not b!1506491))

(assert (not b!1506488))

(assert (not b!1506486))

(assert (not b!1506489))

(assert (not start!128476))

(assert (not b!1506485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

