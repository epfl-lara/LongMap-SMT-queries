; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128714 () Bool)

(assert start!128714)

(declare-fun b!1507942 () Bool)

(declare-fun res!1027121 () Bool)

(declare-fun e!842910 () Bool)

(assert (=> b!1507942 (=> (not res!1027121) (not e!842910))))

(declare-datatypes ((array!100573 0))(
  ( (array!100574 (arr!48526 (Array (_ BitVec 32) (_ BitVec 64))) (size!49077 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100573)

(declare-datatypes ((List!34996 0))(
  ( (Nil!34993) (Cons!34992 (h!36404 (_ BitVec 64)) (t!49682 List!34996)) )
))
(declare-fun arrayNoDuplicates!0 (array!100573 (_ BitVec 32) List!34996) Bool)

(assert (=> b!1507942 (= res!1027121 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34993))))

(declare-fun b!1507943 () Bool)

(declare-fun res!1027127 () Bool)

(assert (=> b!1507943 (=> (not res!1027127) (not e!842910))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507943 (= res!1027127 (validKeyInArray!0 (select (arr!48526 a!2804) i!961)))))

(declare-fun res!1027125 () Bool)

(assert (=> start!128714 (=> (not res!1027125) (not e!842910))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128714 (= res!1027125 (validMask!0 mask!2512))))

(assert (=> start!128714 e!842910))

(assert (=> start!128714 true))

(declare-fun array_inv!37807 (array!100573) Bool)

(assert (=> start!128714 (array_inv!37807 a!2804)))

(declare-fun b!1507944 () Bool)

(assert (=> b!1507944 (= e!842910 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!654817 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507944 (= lt!654817 (toIndex!0 (select (arr!48526 a!2804) j!70) mask!2512))))

(declare-fun b!1507945 () Bool)

(declare-fun res!1027123 () Bool)

(assert (=> b!1507945 (=> (not res!1027123) (not e!842910))))

(assert (=> b!1507945 (= res!1027123 (validKeyInArray!0 (select (arr!48526 a!2804) j!70)))))

(declare-fun b!1507946 () Bool)

(declare-fun res!1027126 () Bool)

(assert (=> b!1507946 (=> (not res!1027126) (not e!842910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100573 (_ BitVec 32)) Bool)

(assert (=> b!1507946 (= res!1027126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507947 () Bool)

(declare-fun res!1027122 () Bool)

(assert (=> b!1507947 (=> (not res!1027122) (not e!842910))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507947 (= res!1027122 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49077 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49077 a!2804))))))

(declare-fun b!1507948 () Bool)

(declare-fun res!1027124 () Bool)

(assert (=> b!1507948 (=> (not res!1027124) (not e!842910))))

(assert (=> b!1507948 (= res!1027124 (and (= (size!49077 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49077 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49077 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128714 res!1027125) b!1507948))

(assert (= (and b!1507948 res!1027124) b!1507943))

(assert (= (and b!1507943 res!1027127) b!1507945))

(assert (= (and b!1507945 res!1027123) b!1507946))

(assert (= (and b!1507946 res!1027126) b!1507942))

(assert (= (and b!1507942 res!1027121) b!1507947))

(assert (= (and b!1507947 res!1027122) b!1507944))

(declare-fun m!1390917 () Bool)

(assert (=> start!128714 m!1390917))

(declare-fun m!1390919 () Bool)

(assert (=> start!128714 m!1390919))

(declare-fun m!1390921 () Bool)

(assert (=> b!1507943 m!1390921))

(assert (=> b!1507943 m!1390921))

(declare-fun m!1390923 () Bool)

(assert (=> b!1507943 m!1390923))

(declare-fun m!1390925 () Bool)

(assert (=> b!1507944 m!1390925))

(assert (=> b!1507944 m!1390925))

(declare-fun m!1390927 () Bool)

(assert (=> b!1507944 m!1390927))

(declare-fun m!1390929 () Bool)

(assert (=> b!1507942 m!1390929))

(assert (=> b!1507945 m!1390925))

(assert (=> b!1507945 m!1390925))

(declare-fun m!1390931 () Bool)

(assert (=> b!1507945 m!1390931))

(declare-fun m!1390933 () Bool)

(assert (=> b!1507946 m!1390933))

(check-sat (not b!1507944) (not b!1507943) (not b!1507946) (not b!1507945) (not b!1507942) (not start!128714))
(check-sat)
