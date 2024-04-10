; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128472 () Bool)

(assert start!128472)

(declare-fun b!1506443 () Bool)

(declare-fun res!1026772 () Bool)

(declare-fun e!841909 () Bool)

(assert (=> b!1506443 (=> (not res!1026772) (not e!841909))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100484 0))(
  ( (array!100485 (arr!48485 (Array (_ BitVec 32) (_ BitVec 64))) (size!49035 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100484)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506443 (= res!1026772 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49035 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49035 a!2804))))))

(declare-fun b!1506444 () Bool)

(declare-fun res!1026771 () Bool)

(assert (=> b!1506444 (=> (not res!1026771) (not e!841909))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506444 (= res!1026771 (validKeyInArray!0 (select (arr!48485 a!2804) j!70)))))

(declare-fun b!1506445 () Bool)

(assert (=> b!1506445 (= e!841909 false)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!654235 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506445 (= lt!654235 (toIndex!0 (select (arr!48485 a!2804) j!70) mask!2512))))

(declare-fun b!1506446 () Bool)

(declare-fun res!1026766 () Bool)

(assert (=> b!1506446 (=> (not res!1026766) (not e!841909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100484 (_ BitVec 32)) Bool)

(assert (=> b!1506446 (= res!1026766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1026767 () Bool)

(assert (=> start!128472 (=> (not res!1026767) (not e!841909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128472 (= res!1026767 (validMask!0 mask!2512))))

(assert (=> start!128472 e!841909))

(assert (=> start!128472 true))

(declare-fun array_inv!37513 (array!100484) Bool)

(assert (=> start!128472 (array_inv!37513 a!2804)))

(declare-fun b!1506447 () Bool)

(declare-fun res!1026770 () Bool)

(assert (=> b!1506447 (=> (not res!1026770) (not e!841909))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506447 (= res!1026770 (and (= (size!49035 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49035 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49035 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506448 () Bool)

(declare-fun res!1026768 () Bool)

(assert (=> b!1506448 (=> (not res!1026768) (not e!841909))))

(assert (=> b!1506448 (= res!1026768 (validKeyInArray!0 (select (arr!48485 a!2804) i!961)))))

(declare-fun b!1506449 () Bool)

(declare-fun res!1026769 () Bool)

(assert (=> b!1506449 (=> (not res!1026769) (not e!841909))))

(declare-datatypes ((List!34968 0))(
  ( (Nil!34965) (Cons!34964 (h!36364 (_ BitVec 64)) (t!49662 List!34968)) )
))
(declare-fun arrayNoDuplicates!0 (array!100484 (_ BitVec 32) List!34968) Bool)

(assert (=> b!1506449 (= res!1026769 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34965))))

(assert (= (and start!128472 res!1026767) b!1506447))

(assert (= (and b!1506447 res!1026770) b!1506448))

(assert (= (and b!1506448 res!1026768) b!1506444))

(assert (= (and b!1506444 res!1026771) b!1506446))

(assert (= (and b!1506446 res!1026766) b!1506449))

(assert (= (and b!1506449 res!1026769) b!1506443))

(assert (= (and b!1506443 res!1026772) b!1506445))

(declare-fun m!1389385 () Bool)

(assert (=> b!1506444 m!1389385))

(assert (=> b!1506444 m!1389385))

(declare-fun m!1389387 () Bool)

(assert (=> b!1506444 m!1389387))

(declare-fun m!1389389 () Bool)

(assert (=> b!1506449 m!1389389))

(declare-fun m!1389391 () Bool)

(assert (=> b!1506446 m!1389391))

(declare-fun m!1389393 () Bool)

(assert (=> b!1506448 m!1389393))

(assert (=> b!1506448 m!1389393))

(declare-fun m!1389395 () Bool)

(assert (=> b!1506448 m!1389395))

(declare-fun m!1389397 () Bool)

(assert (=> start!128472 m!1389397))

(declare-fun m!1389399 () Bool)

(assert (=> start!128472 m!1389399))

(assert (=> b!1506445 m!1389385))

(assert (=> b!1506445 m!1389385))

(declare-fun m!1389401 () Bool)

(assert (=> b!1506445 m!1389401))

(push 1)

(assert (not b!1506444))

(assert (not b!1506448))

(assert (not b!1506446))

(assert (not b!1506445))

(assert (not b!1506449))

(assert (not start!128472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

