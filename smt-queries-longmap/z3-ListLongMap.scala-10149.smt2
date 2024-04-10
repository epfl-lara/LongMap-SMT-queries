; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119660 () Bool)

(assert start!119660)

(declare-fun res!933269 () Bool)

(declare-fun e!789229 () Bool)

(assert (=> start!119660 (=> (not res!933269) (not e!789229))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119660 (= res!933269 (validMask!0 mask!2840))))

(assert (=> start!119660 e!789229))

(assert (=> start!119660 true))

(declare-datatypes ((array!95342 0))(
  ( (array!95343 (arr!46029 (Array (_ BitVec 32) (_ BitVec 64))) (size!46579 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95342)

(declare-fun array_inv!35057 (array!95342) Bool)

(assert (=> start!119660 (array_inv!35057 a!2901)))

(declare-fun b!1393859 () Bool)

(declare-fun res!933268 () Bool)

(assert (=> b!1393859 (=> (not res!933268) (not e!789229))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393859 (= res!933268 (and (= (size!46579 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46579 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46579 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393860 () Bool)

(declare-fun e!789230 () Bool)

(assert (=> b!1393860 (= e!789229 (not e!789230))))

(declare-fun res!933270 () Bool)

(assert (=> b!1393860 (=> res!933270 e!789230)))

(declare-datatypes ((SeekEntryResult!10346 0))(
  ( (MissingZero!10346 (index!43755 (_ BitVec 32))) (Found!10346 (index!43756 (_ BitVec 32))) (Intermediate!10346 (undefined!11158 Bool) (index!43757 (_ BitVec 32)) (x!125430 (_ BitVec 32))) (Undefined!10346) (MissingVacant!10346 (index!43758 (_ BitVec 32))) )
))
(declare-fun lt!612150 () SeekEntryResult!10346)

(get-info :version)

(assert (=> b!1393860 (= res!933270 (or (not ((_ is Intermediate!10346) lt!612150)) (undefined!11158 lt!612150)))))

(declare-fun e!789227 () Bool)

(assert (=> b!1393860 e!789227))

(declare-fun res!933274 () Bool)

(assert (=> b!1393860 (=> (not res!933274) (not e!789227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95342 (_ BitVec 32)) Bool)

(assert (=> b!1393860 (= res!933274 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46696 0))(
  ( (Unit!46697) )
))
(declare-fun lt!612149 () Unit!46696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46696)

(assert (=> b!1393860 (= lt!612149 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95342 (_ BitVec 32)) SeekEntryResult!10346)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393860 (= lt!612150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46029 a!2901) j!112) mask!2840) (select (arr!46029 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393861 () Bool)

(declare-fun res!933271 () Bool)

(assert (=> b!1393861 (=> (not res!933271) (not e!789229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393861 (= res!933271 (validKeyInArray!0 (select (arr!46029 a!2901) j!112)))))

(declare-fun b!1393862 () Bool)

(declare-fun res!933273 () Bool)

(assert (=> b!1393862 (=> (not res!933273) (not e!789229))))

(assert (=> b!1393862 (= res!933273 (validKeyInArray!0 (select (arr!46029 a!2901) i!1037)))))

(declare-fun b!1393863 () Bool)

(declare-fun res!933272 () Bool)

(assert (=> b!1393863 (=> (not res!933272) (not e!789229))))

(declare-datatypes ((List!32548 0))(
  ( (Nil!32545) (Cons!32544 (h!33777 (_ BitVec 64)) (t!47242 List!32548)) )
))
(declare-fun arrayNoDuplicates!0 (array!95342 (_ BitVec 32) List!32548) Bool)

(assert (=> b!1393863 (= res!933272 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32545))))

(declare-fun b!1393864 () Bool)

(assert (=> b!1393864 (= e!789230 true)))

(declare-fun lt!612148 () SeekEntryResult!10346)

(assert (=> b!1393864 (= lt!612148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46029 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46029 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95343 (store (arr!46029 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46579 a!2901)) mask!2840))))

(declare-fun b!1393865 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95342 (_ BitVec 32)) SeekEntryResult!10346)

(assert (=> b!1393865 (= e!789227 (= (seekEntryOrOpen!0 (select (arr!46029 a!2901) j!112) a!2901 mask!2840) (Found!10346 j!112)))))

(declare-fun b!1393866 () Bool)

(declare-fun res!933267 () Bool)

(assert (=> b!1393866 (=> (not res!933267) (not e!789229))))

(assert (=> b!1393866 (= res!933267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119660 res!933269) b!1393859))

(assert (= (and b!1393859 res!933268) b!1393862))

(assert (= (and b!1393862 res!933273) b!1393861))

(assert (= (and b!1393861 res!933271) b!1393866))

(assert (= (and b!1393866 res!933267) b!1393863))

(assert (= (and b!1393863 res!933272) b!1393860))

(assert (= (and b!1393860 res!933274) b!1393865))

(assert (= (and b!1393860 (not res!933270)) b!1393864))

(declare-fun m!1279945 () Bool)

(assert (=> b!1393865 m!1279945))

(assert (=> b!1393865 m!1279945))

(declare-fun m!1279947 () Bool)

(assert (=> b!1393865 m!1279947))

(declare-fun m!1279949 () Bool)

(assert (=> b!1393864 m!1279949))

(declare-fun m!1279951 () Bool)

(assert (=> b!1393864 m!1279951))

(assert (=> b!1393864 m!1279951))

(declare-fun m!1279953 () Bool)

(assert (=> b!1393864 m!1279953))

(assert (=> b!1393864 m!1279953))

(assert (=> b!1393864 m!1279951))

(declare-fun m!1279955 () Bool)

(assert (=> b!1393864 m!1279955))

(assert (=> b!1393861 m!1279945))

(assert (=> b!1393861 m!1279945))

(declare-fun m!1279957 () Bool)

(assert (=> b!1393861 m!1279957))

(declare-fun m!1279959 () Bool)

(assert (=> b!1393863 m!1279959))

(declare-fun m!1279961 () Bool)

(assert (=> b!1393862 m!1279961))

(assert (=> b!1393862 m!1279961))

(declare-fun m!1279963 () Bool)

(assert (=> b!1393862 m!1279963))

(declare-fun m!1279965 () Bool)

(assert (=> start!119660 m!1279965))

(declare-fun m!1279967 () Bool)

(assert (=> start!119660 m!1279967))

(assert (=> b!1393860 m!1279945))

(declare-fun m!1279969 () Bool)

(assert (=> b!1393860 m!1279969))

(assert (=> b!1393860 m!1279945))

(declare-fun m!1279971 () Bool)

(assert (=> b!1393860 m!1279971))

(assert (=> b!1393860 m!1279969))

(assert (=> b!1393860 m!1279945))

(declare-fun m!1279973 () Bool)

(assert (=> b!1393860 m!1279973))

(declare-fun m!1279975 () Bool)

(assert (=> b!1393860 m!1279975))

(declare-fun m!1279977 () Bool)

(assert (=> b!1393866 m!1279977))

(check-sat (not b!1393861) (not start!119660) (not b!1393860) (not b!1393866) (not b!1393863) (not b!1393864) (not b!1393862) (not b!1393865))
