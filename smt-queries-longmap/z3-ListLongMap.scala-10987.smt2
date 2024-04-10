; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128714 () Bool)

(assert start!128714)

(declare-fun b!1508436 () Bool)

(declare-fun e!842702 () Bool)

(assert (=> b!1508436 (= e!842702 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!654631 () (_ BitVec 32))

(declare-datatypes ((array!100609 0))(
  ( (array!100610 (arr!48543 (Array (_ BitVec 32) (_ BitVec 64))) (size!49093 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100609)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508436 (= lt!654631 (toIndex!0 (select (store (arr!48543 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508437 () Bool)

(declare-fun res!1028445 () Bool)

(declare-fun e!842704 () Bool)

(assert (=> b!1508437 (=> (not res!1028445) (not e!842704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508437 (= res!1028445 (validKeyInArray!0 (select (arr!48543 a!2804) i!961)))))

(declare-fun b!1508438 () Bool)

(declare-fun res!1028444 () Bool)

(assert (=> b!1508438 (=> (not res!1028444) (not e!842704))))

(assert (=> b!1508438 (= res!1028444 (validKeyInArray!0 (select (arr!48543 a!2804) j!70)))))

(declare-fun b!1508439 () Bool)

(declare-fun res!1028451 () Bool)

(assert (=> b!1508439 (=> (not res!1028451) (not e!842704))))

(assert (=> b!1508439 (= res!1028451 (and (= (size!49093 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49093 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49093 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508440 () Bool)

(declare-fun res!1028447 () Bool)

(assert (=> b!1508440 (=> (not res!1028447) (not e!842704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100609 (_ BitVec 32)) Bool)

(assert (=> b!1508440 (= res!1028447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1028452 () Bool)

(assert (=> start!128714 (=> (not res!1028452) (not e!842704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128714 (= res!1028452 (validMask!0 mask!2512))))

(assert (=> start!128714 e!842704))

(assert (=> start!128714 true))

(declare-fun array_inv!37571 (array!100609) Bool)

(assert (=> start!128714 (array_inv!37571 a!2804)))

(declare-fun b!1508441 () Bool)

(declare-fun res!1028448 () Bool)

(assert (=> b!1508441 (=> (not res!1028448) (not e!842702))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12714 0))(
  ( (MissingZero!12714 (index!53251 (_ BitVec 32))) (Found!12714 (index!53252 (_ BitVec 32))) (Intermediate!12714 (undefined!13526 Bool) (index!53253 (_ BitVec 32)) (x!135010 (_ BitVec 32))) (Undefined!12714) (MissingVacant!12714 (index!53254 (_ BitVec 32))) )
))
(declare-fun lt!654630 () SeekEntryResult!12714)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100609 (_ BitVec 32)) SeekEntryResult!12714)

(assert (=> b!1508441 (= res!1028448 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48543 a!2804) j!70) a!2804 mask!2512) lt!654630))))

(declare-fun b!1508442 () Bool)

(assert (=> b!1508442 (= e!842704 e!842702)))

(declare-fun res!1028446 () Bool)

(assert (=> b!1508442 (=> (not res!1028446) (not e!842702))))

(assert (=> b!1508442 (= res!1028446 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48543 a!2804) j!70) mask!2512) (select (arr!48543 a!2804) j!70) a!2804 mask!2512) lt!654630))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508442 (= lt!654630 (Intermediate!12714 false resIndex!21 resX!21))))

(declare-fun b!1508443 () Bool)

(declare-fun res!1028449 () Bool)

(assert (=> b!1508443 (=> (not res!1028449) (not e!842704))))

(declare-datatypes ((List!35026 0))(
  ( (Nil!35023) (Cons!35022 (h!36431 (_ BitVec 64)) (t!49720 List!35026)) )
))
(declare-fun arrayNoDuplicates!0 (array!100609 (_ BitVec 32) List!35026) Bool)

(assert (=> b!1508443 (= res!1028449 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35023))))

(declare-fun b!1508444 () Bool)

(declare-fun res!1028450 () Bool)

(assert (=> b!1508444 (=> (not res!1028450) (not e!842704))))

(assert (=> b!1508444 (= res!1028450 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49093 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49093 a!2804))))))

(assert (= (and start!128714 res!1028452) b!1508439))

(assert (= (and b!1508439 res!1028451) b!1508437))

(assert (= (and b!1508437 res!1028445) b!1508438))

(assert (= (and b!1508438 res!1028444) b!1508440))

(assert (= (and b!1508440 res!1028447) b!1508443))

(assert (= (and b!1508443 res!1028449) b!1508444))

(assert (= (and b!1508444 res!1028450) b!1508442))

(assert (= (and b!1508442 res!1028446) b!1508441))

(assert (= (and b!1508441 res!1028448) b!1508436))

(declare-fun m!1390943 () Bool)

(assert (=> b!1508436 m!1390943))

(declare-fun m!1390945 () Bool)

(assert (=> b!1508436 m!1390945))

(assert (=> b!1508436 m!1390945))

(declare-fun m!1390947 () Bool)

(assert (=> b!1508436 m!1390947))

(declare-fun m!1390949 () Bool)

(assert (=> start!128714 m!1390949))

(declare-fun m!1390951 () Bool)

(assert (=> start!128714 m!1390951))

(declare-fun m!1390953 () Bool)

(assert (=> b!1508438 m!1390953))

(assert (=> b!1508438 m!1390953))

(declare-fun m!1390955 () Bool)

(assert (=> b!1508438 m!1390955))

(declare-fun m!1390957 () Bool)

(assert (=> b!1508440 m!1390957))

(assert (=> b!1508441 m!1390953))

(assert (=> b!1508441 m!1390953))

(declare-fun m!1390959 () Bool)

(assert (=> b!1508441 m!1390959))

(declare-fun m!1390961 () Bool)

(assert (=> b!1508437 m!1390961))

(assert (=> b!1508437 m!1390961))

(declare-fun m!1390963 () Bool)

(assert (=> b!1508437 m!1390963))

(declare-fun m!1390965 () Bool)

(assert (=> b!1508443 m!1390965))

(assert (=> b!1508442 m!1390953))

(assert (=> b!1508442 m!1390953))

(declare-fun m!1390967 () Bool)

(assert (=> b!1508442 m!1390967))

(assert (=> b!1508442 m!1390967))

(assert (=> b!1508442 m!1390953))

(declare-fun m!1390969 () Bool)

(assert (=> b!1508442 m!1390969))

(check-sat (not b!1508436) (not b!1508442) (not b!1508440) (not b!1508438) (not start!128714) (not b!1508441) (not b!1508443) (not b!1508437))
(check-sat)
