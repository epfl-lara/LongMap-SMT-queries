; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128802 () Bool)

(assert start!128802)

(declare-fun b!1508586 () Bool)

(declare-fun res!1027734 () Bool)

(declare-fun e!843129 () Bool)

(assert (=> b!1508586 (=> (not res!1027734) (not e!843129))))

(declare-datatypes ((array!100628 0))(
  ( (array!100629 (arr!48552 (Array (_ BitVec 32) (_ BitVec 64))) (size!49103 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100628)

(declare-datatypes ((List!35022 0))(
  ( (Nil!35019) (Cons!35018 (h!36433 (_ BitVec 64)) (t!49708 List!35022)) )
))
(declare-fun arrayNoDuplicates!0 (array!100628 (_ BitVec 32) List!35022) Bool)

(assert (=> b!1508586 (= res!1027734 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35019))))

(declare-fun b!1508587 () Bool)

(declare-fun res!1027732 () Bool)

(assert (=> b!1508587 (=> (not res!1027732) (not e!843129))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1508587 (= res!1027732 (and (= (size!49103 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49103 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49103 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508588 () Bool)

(declare-fun res!1027735 () Bool)

(assert (=> b!1508588 (=> (not res!1027735) (not e!843129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100628 (_ BitVec 32)) Bool)

(assert (=> b!1508588 (= res!1027735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508589 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1508589 (= e!843129 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(declare-fun b!1508590 () Bool)

(declare-fun res!1027736 () Bool)

(assert (=> b!1508590 (=> (not res!1027736) (not e!843129))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12616 0))(
  ( (MissingZero!12616 (index!52859 (_ BitVec 32))) (Found!12616 (index!52860 (_ BitVec 32))) (Intermediate!12616 (undefined!13428 Bool) (index!52861 (_ BitVec 32)) (x!134811 (_ BitVec 32))) (Undefined!12616) (MissingVacant!12616 (index!52862 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100628 (_ BitVec 32)) SeekEntryResult!12616)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508590 (= res!1027736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48552 a!2804) j!70) mask!2512) (select (arr!48552 a!2804) j!70) a!2804 mask!2512) (Intermediate!12616 false resIndex!21 resX!21)))))

(declare-fun b!1508591 () Bool)

(declare-fun res!1027738 () Bool)

(assert (=> b!1508591 (=> (not res!1027738) (not e!843129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508591 (= res!1027738 (validKeyInArray!0 (select (arr!48552 a!2804) i!961)))))

(declare-fun b!1508592 () Bool)

(declare-fun res!1027733 () Bool)

(assert (=> b!1508592 (=> (not res!1027733) (not e!843129))))

(assert (=> b!1508592 (= res!1027733 (validKeyInArray!0 (select (arr!48552 a!2804) j!70)))))

(declare-fun res!1027737 () Bool)

(assert (=> start!128802 (=> (not res!1027737) (not e!843129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128802 (= res!1027737 (validMask!0 mask!2512))))

(assert (=> start!128802 e!843129))

(assert (=> start!128802 true))

(declare-fun array_inv!37833 (array!100628) Bool)

(assert (=> start!128802 (array_inv!37833 a!2804)))

(declare-fun b!1508593 () Bool)

(declare-fun res!1027739 () Bool)

(assert (=> b!1508593 (=> (not res!1027739) (not e!843129))))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508593 (= res!1027739 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49103 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49103 a!2804))))))

(assert (= (and start!128802 res!1027737) b!1508587))

(assert (= (and b!1508587 res!1027732) b!1508591))

(assert (= (and b!1508591 res!1027738) b!1508592))

(assert (= (and b!1508592 res!1027733) b!1508588))

(assert (= (and b!1508588 res!1027735) b!1508586))

(assert (= (and b!1508586 res!1027734) b!1508593))

(assert (= (and b!1508593 res!1027739) b!1508590))

(assert (= (and b!1508590 res!1027736) b!1508589))

(declare-fun m!1391455 () Bool)

(assert (=> b!1508591 m!1391455))

(assert (=> b!1508591 m!1391455))

(declare-fun m!1391457 () Bool)

(assert (=> b!1508591 m!1391457))

(declare-fun m!1391459 () Bool)

(assert (=> b!1508588 m!1391459))

(declare-fun m!1391461 () Bool)

(assert (=> b!1508590 m!1391461))

(assert (=> b!1508590 m!1391461))

(declare-fun m!1391463 () Bool)

(assert (=> b!1508590 m!1391463))

(assert (=> b!1508590 m!1391463))

(assert (=> b!1508590 m!1391461))

(declare-fun m!1391465 () Bool)

(assert (=> b!1508590 m!1391465))

(assert (=> b!1508592 m!1391461))

(assert (=> b!1508592 m!1391461))

(declare-fun m!1391467 () Bool)

(assert (=> b!1508592 m!1391467))

(declare-fun m!1391469 () Bool)

(assert (=> b!1508586 m!1391469))

(declare-fun m!1391471 () Bool)

(assert (=> start!128802 m!1391471))

(declare-fun m!1391473 () Bool)

(assert (=> start!128802 m!1391473))

(push 1)

(assert (not b!1508591))

(assert (not b!1508588))

(assert (not b!1508590))

(assert (not start!128802))

(assert (not b!1508592))

(assert (not b!1508586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

