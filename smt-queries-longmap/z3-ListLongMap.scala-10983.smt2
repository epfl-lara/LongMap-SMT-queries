; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128648 () Bool)

(assert start!128648)

(declare-fun b!1507923 () Bool)

(declare-fun res!1028042 () Bool)

(declare-fun e!842472 () Bool)

(assert (=> b!1507923 (=> (not res!1028042) (not e!842472))))

(declare-datatypes ((array!100582 0))(
  ( (array!100583 (arr!48531 (Array (_ BitVec 32) (_ BitVec 64))) (size!49081 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100582)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100582 (_ BitVec 32)) Bool)

(assert (=> b!1507923 (= res!1028042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507924 () Bool)

(declare-fun res!1028044 () Bool)

(assert (=> b!1507924 (=> (not res!1028044) (not e!842472))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507924 (= res!1028044 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49081 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49081 a!2804))))))

(declare-fun b!1507925 () Bool)

(declare-fun res!1028037 () Bool)

(assert (=> b!1507925 (=> (not res!1028037) (not e!842472))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507925 (= res!1028037 (validKeyInArray!0 (select (arr!48531 a!2804) i!961)))))

(declare-fun b!1507926 () Bool)

(declare-fun res!1028040 () Bool)

(assert (=> b!1507926 (=> (not res!1028040) (not e!842472))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1507926 (= res!1028040 (and (= (size!49081 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49081 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49081 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1028038 () Bool)

(assert (=> start!128648 (=> (not res!1028038) (not e!842472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128648 (= res!1028038 (validMask!0 mask!2512))))

(assert (=> start!128648 e!842472))

(assert (=> start!128648 true))

(declare-fun array_inv!37559 (array!100582) Bool)

(assert (=> start!128648 (array_inv!37559 a!2804)))

(declare-fun b!1507927 () Bool)

(declare-fun res!1028043 () Bool)

(assert (=> b!1507927 (=> (not res!1028043) (not e!842472))))

(assert (=> b!1507927 (= res!1028043 (validKeyInArray!0 (select (arr!48531 a!2804) j!70)))))

(declare-fun b!1507928 () Bool)

(declare-fun e!842471 () Bool)

(assert (=> b!1507928 (= e!842472 e!842471)))

(declare-fun res!1028039 () Bool)

(assert (=> b!1507928 (=> (not res!1028039) (not e!842471))))

(declare-datatypes ((SeekEntryResult!12702 0))(
  ( (MissingZero!12702 (index!53203 (_ BitVec 32))) (Found!12702 (index!53204 (_ BitVec 32))) (Intermediate!12702 (undefined!13514 Bool) (index!53205 (_ BitVec 32)) (x!134960 (_ BitVec 32))) (Undefined!12702) (MissingVacant!12702 (index!53206 (_ BitVec 32))) )
))
(declare-fun lt!654502 () SeekEntryResult!12702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100582 (_ BitVec 32)) SeekEntryResult!12702)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507928 (= res!1028039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48531 a!2804) j!70) mask!2512) (select (arr!48531 a!2804) j!70) a!2804 mask!2512) lt!654502))))

(assert (=> b!1507928 (= lt!654502 (Intermediate!12702 false resIndex!21 resX!21))))

(declare-fun b!1507929 () Bool)

(declare-fun res!1028036 () Bool)

(assert (=> b!1507929 (=> (not res!1028036) (not e!842472))))

(declare-datatypes ((List!35014 0))(
  ( (Nil!35011) (Cons!35010 (h!36416 (_ BitVec 64)) (t!49708 List!35014)) )
))
(declare-fun arrayNoDuplicates!0 (array!100582 (_ BitVec 32) List!35014) Bool)

(assert (=> b!1507929 (= res!1028036 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35011))))

(declare-fun b!1507930 () Bool)

(assert (=> b!1507930 (= e!842471 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1507931 () Bool)

(declare-fun res!1028041 () Bool)

(assert (=> b!1507931 (=> (not res!1028041) (not e!842471))))

(assert (=> b!1507931 (= res!1028041 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48531 a!2804) j!70) a!2804 mask!2512) lt!654502))))

(assert (= (and start!128648 res!1028038) b!1507926))

(assert (= (and b!1507926 res!1028040) b!1507925))

(assert (= (and b!1507925 res!1028037) b!1507927))

(assert (= (and b!1507927 res!1028043) b!1507923))

(assert (= (and b!1507923 res!1028042) b!1507929))

(assert (= (and b!1507929 res!1028036) b!1507924))

(assert (= (and b!1507924 res!1028044) b!1507928))

(assert (= (and b!1507928 res!1028039) b!1507931))

(assert (= (and b!1507931 res!1028041) b!1507930))

(declare-fun m!1390541 () Bool)

(assert (=> b!1507928 m!1390541))

(assert (=> b!1507928 m!1390541))

(declare-fun m!1390543 () Bool)

(assert (=> b!1507928 m!1390543))

(assert (=> b!1507928 m!1390543))

(assert (=> b!1507928 m!1390541))

(declare-fun m!1390545 () Bool)

(assert (=> b!1507928 m!1390545))

(assert (=> b!1507931 m!1390541))

(assert (=> b!1507931 m!1390541))

(declare-fun m!1390547 () Bool)

(assert (=> b!1507931 m!1390547))

(declare-fun m!1390549 () Bool)

(assert (=> b!1507925 m!1390549))

(assert (=> b!1507925 m!1390549))

(declare-fun m!1390551 () Bool)

(assert (=> b!1507925 m!1390551))

(declare-fun m!1390553 () Bool)

(assert (=> start!128648 m!1390553))

(declare-fun m!1390555 () Bool)

(assert (=> start!128648 m!1390555))

(declare-fun m!1390557 () Bool)

(assert (=> b!1507923 m!1390557))

(declare-fun m!1390559 () Bool)

(assert (=> b!1507929 m!1390559))

(assert (=> b!1507927 m!1390541))

(assert (=> b!1507927 m!1390541))

(declare-fun m!1390561 () Bool)

(assert (=> b!1507927 m!1390561))

(check-sat (not start!128648) (not b!1507929) (not b!1507931) (not b!1507925) (not b!1507928) (not b!1507927) (not b!1507923))
(check-sat)
