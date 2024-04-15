; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119628 () Bool)

(assert start!119628)

(declare-fun b!1393442 () Bool)

(declare-fun res!932902 () Bool)

(declare-fun e!789022 () Bool)

(assert (=> b!1393442 (=> (not res!932902) (not e!789022))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95263 0))(
  ( (array!95264 (arr!45990 (Array (_ BitVec 32) (_ BitVec 64))) (size!46542 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95263)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393442 (= res!932902 (and (= (size!46542 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46542 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46542 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393443 () Bool)

(declare-fun e!789021 () Bool)

(assert (=> b!1393443 (= e!789022 (not e!789021))))

(declare-fun res!932904 () Bool)

(assert (=> b!1393443 (=> res!932904 e!789021)))

(declare-datatypes ((SeekEntryResult!10333 0))(
  ( (MissingZero!10333 (index!43703 (_ BitVec 32))) (Found!10333 (index!43704 (_ BitVec 32))) (Intermediate!10333 (undefined!11145 Bool) (index!43705 (_ BitVec 32)) (x!125374 (_ BitVec 32))) (Undefined!10333) (MissingVacant!10333 (index!43706 (_ BitVec 32))) )
))
(declare-fun lt!611832 () SeekEntryResult!10333)

(assert (=> b!1393443 (= res!932904 (or (not (is-Intermediate!10333 lt!611832)) (undefined!11145 lt!611832)))))

(declare-fun e!789020 () Bool)

(assert (=> b!1393443 e!789020))

(declare-fun res!932905 () Bool)

(assert (=> b!1393443 (=> (not res!932905) (not e!789020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95263 (_ BitVec 32)) Bool)

(assert (=> b!1393443 (= res!932905 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46513 0))(
  ( (Unit!46514) )
))
(declare-fun lt!611834 () Unit!46513)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46513)

(assert (=> b!1393443 (= lt!611834 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95263 (_ BitVec 32)) SeekEntryResult!10333)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393443 (= lt!611832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45990 a!2901) j!112) mask!2840) (select (arr!45990 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932906 () Bool)

(assert (=> start!119628 (=> (not res!932906) (not e!789022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119628 (= res!932906 (validMask!0 mask!2840))))

(assert (=> start!119628 e!789022))

(assert (=> start!119628 true))

(declare-fun array_inv!35223 (array!95263) Bool)

(assert (=> start!119628 (array_inv!35223 a!2901)))

(declare-fun b!1393444 () Bool)

(declare-fun res!932907 () Bool)

(assert (=> b!1393444 (=> (not res!932907) (not e!789022))))

(declare-datatypes ((List!32587 0))(
  ( (Nil!32584) (Cons!32583 (h!33816 (_ BitVec 64)) (t!47273 List!32587)) )
))
(declare-fun arrayNoDuplicates!0 (array!95263 (_ BitVec 32) List!32587) Bool)

(assert (=> b!1393444 (= res!932907 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32584))))

(declare-fun b!1393445 () Bool)

(declare-fun res!932903 () Bool)

(assert (=> b!1393445 (=> (not res!932903) (not e!789022))))

(assert (=> b!1393445 (= res!932903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393446 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95263 (_ BitVec 32)) SeekEntryResult!10333)

(assert (=> b!1393446 (= e!789020 (= (seekEntryOrOpen!0 (select (arr!45990 a!2901) j!112) a!2901 mask!2840) (Found!10333 j!112)))))

(declare-fun b!1393447 () Bool)

(declare-fun res!932901 () Bool)

(assert (=> b!1393447 (=> (not res!932901) (not e!789022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393447 (= res!932901 (validKeyInArray!0 (select (arr!45990 a!2901) i!1037)))))

(declare-fun b!1393448 () Bool)

(declare-fun res!932908 () Bool)

(assert (=> b!1393448 (=> (not res!932908) (not e!789022))))

(assert (=> b!1393448 (= res!932908 (validKeyInArray!0 (select (arr!45990 a!2901) j!112)))))

(declare-fun b!1393449 () Bool)

(assert (=> b!1393449 (= e!789021 true)))

(declare-fun lt!611833 () SeekEntryResult!10333)

(assert (=> b!1393449 (= lt!611833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45990 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45990 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95264 (store (arr!45990 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46542 a!2901)) mask!2840))))

(assert (= (and start!119628 res!932906) b!1393442))

(assert (= (and b!1393442 res!932902) b!1393447))

(assert (= (and b!1393447 res!932901) b!1393448))

(assert (= (and b!1393448 res!932908) b!1393445))

(assert (= (and b!1393445 res!932903) b!1393444))

(assert (= (and b!1393444 res!932907) b!1393443))

(assert (= (and b!1393443 res!932905) b!1393446))

(assert (= (and b!1393443 (not res!932904)) b!1393449))

(declare-fun m!1278933 () Bool)

(assert (=> b!1393448 m!1278933))

(assert (=> b!1393448 m!1278933))

(declare-fun m!1278935 () Bool)

(assert (=> b!1393448 m!1278935))

(assert (=> b!1393443 m!1278933))

(declare-fun m!1278937 () Bool)

(assert (=> b!1393443 m!1278937))

(assert (=> b!1393443 m!1278933))

(declare-fun m!1278939 () Bool)

(assert (=> b!1393443 m!1278939))

(assert (=> b!1393443 m!1278937))

(assert (=> b!1393443 m!1278933))

(declare-fun m!1278941 () Bool)

(assert (=> b!1393443 m!1278941))

(declare-fun m!1278943 () Bool)

(assert (=> b!1393443 m!1278943))

(declare-fun m!1278945 () Bool)

(assert (=> b!1393449 m!1278945))

(declare-fun m!1278947 () Bool)

(assert (=> b!1393449 m!1278947))

(assert (=> b!1393449 m!1278947))

(declare-fun m!1278949 () Bool)

(assert (=> b!1393449 m!1278949))

(assert (=> b!1393449 m!1278949))

(assert (=> b!1393449 m!1278947))

(declare-fun m!1278951 () Bool)

(assert (=> b!1393449 m!1278951))

(declare-fun m!1278953 () Bool)

(assert (=> b!1393447 m!1278953))

(assert (=> b!1393447 m!1278953))

(declare-fun m!1278955 () Bool)

(assert (=> b!1393447 m!1278955))

(declare-fun m!1278957 () Bool)

(assert (=> b!1393444 m!1278957))

(assert (=> b!1393446 m!1278933))

(assert (=> b!1393446 m!1278933))

(declare-fun m!1278959 () Bool)

(assert (=> b!1393446 m!1278959))

(declare-fun m!1278961 () Bool)

(assert (=> b!1393445 m!1278961))

(declare-fun m!1278963 () Bool)

(assert (=> start!119628 m!1278963))

(declare-fun m!1278965 () Bool)

(assert (=> start!119628 m!1278965))

(push 1)

(assert (not start!119628))

(assert (not b!1393443))

(assert (not b!1393446))

(assert (not b!1393447))

(assert (not b!1393444))

(assert (not b!1393448))

(assert (not b!1393445))

(assert (not b!1393449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

