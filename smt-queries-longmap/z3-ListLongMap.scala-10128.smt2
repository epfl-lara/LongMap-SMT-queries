; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119426 () Bool)

(assert start!119426)

(declare-fun b!1391837 () Bool)

(declare-fun e!788161 () Bool)

(assert (=> b!1391837 (= e!788161 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95210 0))(
  ( (array!95211 (arr!45966 (Array (_ BitVec 32) (_ BitVec 64))) (size!46516 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95210)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!611365 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391837 (= lt!611365 (toIndex!0 (select (store (arr!45966 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391838 () Bool)

(declare-fun e!788162 () Bool)

(declare-datatypes ((SeekEntryResult!10283 0))(
  ( (MissingZero!10283 (index!43503 (_ BitVec 32))) (Found!10283 (index!43504 (_ BitVec 32))) (Intermediate!10283 (undefined!11095 Bool) (index!43505 (_ BitVec 32)) (x!125187 (_ BitVec 32))) (Undefined!10283) (MissingVacant!10283 (index!43506 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95210 (_ BitVec 32)) SeekEntryResult!10283)

(assert (=> b!1391838 (= e!788162 (= (seekEntryOrOpen!0 (select (arr!45966 a!2901) j!112) a!2901 mask!2840) (Found!10283 j!112)))))

(declare-fun b!1391839 () Bool)

(declare-fun e!788160 () Bool)

(assert (=> b!1391839 (= e!788160 (not e!788161))))

(declare-fun res!931562 () Bool)

(assert (=> b!1391839 (=> res!931562 e!788161)))

(declare-fun lt!611367 () SeekEntryResult!10283)

(get-info :version)

(assert (=> b!1391839 (= res!931562 (or (not ((_ is Intermediate!10283) lt!611367)) (undefined!11095 lt!611367)))))

(assert (=> b!1391839 e!788162))

(declare-fun res!931559 () Bool)

(assert (=> b!1391839 (=> (not res!931559) (not e!788162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95210 (_ BitVec 32)) Bool)

(assert (=> b!1391839 (= res!931559 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46570 0))(
  ( (Unit!46571) )
))
(declare-fun lt!611366 () Unit!46570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46570)

(assert (=> b!1391839 (= lt!611366 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95210 (_ BitVec 32)) SeekEntryResult!10283)

(assert (=> b!1391839 (= lt!611367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45966 a!2901) j!112) mask!2840) (select (arr!45966 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391840 () Bool)

(declare-fun res!931563 () Bool)

(assert (=> b!1391840 (=> (not res!931563) (not e!788160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391840 (= res!931563 (validKeyInArray!0 (select (arr!45966 a!2901) i!1037)))))

(declare-fun b!1391841 () Bool)

(declare-fun res!931558 () Bool)

(assert (=> b!1391841 (=> (not res!931558) (not e!788160))))

(assert (=> b!1391841 (= res!931558 (and (= (size!46516 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46516 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46516 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391842 () Bool)

(declare-fun res!931564 () Bool)

(assert (=> b!1391842 (=> (not res!931564) (not e!788160))))

(assert (=> b!1391842 (= res!931564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391843 () Bool)

(declare-fun res!931561 () Bool)

(assert (=> b!1391843 (=> (not res!931561) (not e!788160))))

(declare-datatypes ((List!32485 0))(
  ( (Nil!32482) (Cons!32481 (h!33708 (_ BitVec 64)) (t!47179 List!32485)) )
))
(declare-fun arrayNoDuplicates!0 (array!95210 (_ BitVec 32) List!32485) Bool)

(assert (=> b!1391843 (= res!931561 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32482))))

(declare-fun b!1391844 () Bool)

(declare-fun res!931557 () Bool)

(assert (=> b!1391844 (=> (not res!931557) (not e!788160))))

(assert (=> b!1391844 (= res!931557 (validKeyInArray!0 (select (arr!45966 a!2901) j!112)))))

(declare-fun res!931560 () Bool)

(assert (=> start!119426 (=> (not res!931560) (not e!788160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119426 (= res!931560 (validMask!0 mask!2840))))

(assert (=> start!119426 e!788160))

(assert (=> start!119426 true))

(declare-fun array_inv!34994 (array!95210) Bool)

(assert (=> start!119426 (array_inv!34994 a!2901)))

(assert (= (and start!119426 res!931560) b!1391841))

(assert (= (and b!1391841 res!931558) b!1391840))

(assert (= (and b!1391840 res!931563) b!1391844))

(assert (= (and b!1391844 res!931557) b!1391842))

(assert (= (and b!1391842 res!931564) b!1391843))

(assert (= (and b!1391843 res!931561) b!1391839))

(assert (= (and b!1391839 res!931559) b!1391838))

(assert (= (and b!1391839 (not res!931562)) b!1391837))

(declare-fun m!1277555 () Bool)

(assert (=> b!1391843 m!1277555))

(declare-fun m!1277557 () Bool)

(assert (=> b!1391839 m!1277557))

(declare-fun m!1277559 () Bool)

(assert (=> b!1391839 m!1277559))

(assert (=> b!1391839 m!1277557))

(declare-fun m!1277561 () Bool)

(assert (=> b!1391839 m!1277561))

(assert (=> b!1391839 m!1277559))

(assert (=> b!1391839 m!1277557))

(declare-fun m!1277563 () Bool)

(assert (=> b!1391839 m!1277563))

(declare-fun m!1277565 () Bool)

(assert (=> b!1391839 m!1277565))

(assert (=> b!1391844 m!1277557))

(assert (=> b!1391844 m!1277557))

(declare-fun m!1277567 () Bool)

(assert (=> b!1391844 m!1277567))

(declare-fun m!1277569 () Bool)

(assert (=> b!1391842 m!1277569))

(assert (=> b!1391838 m!1277557))

(assert (=> b!1391838 m!1277557))

(declare-fun m!1277571 () Bool)

(assert (=> b!1391838 m!1277571))

(declare-fun m!1277573 () Bool)

(assert (=> b!1391840 m!1277573))

(assert (=> b!1391840 m!1277573))

(declare-fun m!1277575 () Bool)

(assert (=> b!1391840 m!1277575))

(declare-fun m!1277577 () Bool)

(assert (=> start!119426 m!1277577))

(declare-fun m!1277579 () Bool)

(assert (=> start!119426 m!1277579))

(declare-fun m!1277581 () Bool)

(assert (=> b!1391837 m!1277581))

(declare-fun m!1277583 () Bool)

(assert (=> b!1391837 m!1277583))

(assert (=> b!1391837 m!1277583))

(declare-fun m!1277585 () Bool)

(assert (=> b!1391837 m!1277585))

(check-sat (not start!119426) (not b!1391839) (not b!1391840) (not b!1391838) (not b!1391843) (not b!1391837) (not b!1391842) (not b!1391844))
