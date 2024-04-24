; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119826 () Bool)

(assert start!119826)

(declare-fun b!1394735 () Bool)

(declare-fun res!933460 () Bool)

(declare-fun e!789833 () Bool)

(assert (=> b!1394735 (=> (not res!933460) (not e!789833))))

(declare-datatypes ((array!95430 0))(
  ( (array!95431 (arr!46071 (Array (_ BitVec 32) (_ BitVec 64))) (size!46622 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95430)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394735 (= res!933460 (validKeyInArray!0 (select (arr!46071 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!789835 () Bool)

(declare-fun b!1394736 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10291 0))(
  ( (MissingZero!10291 (index!43535 (_ BitVec 32))) (Found!10291 (index!43536 (_ BitVec 32))) (Intermediate!10291 (undefined!11103 Bool) (index!43537 (_ BitVec 32)) (x!125362 (_ BitVec 32))) (Undefined!10291) (MissingVacant!10291 (index!43538 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95430 (_ BitVec 32)) SeekEntryResult!10291)

(assert (=> b!1394736 (= e!789835 (= (seekEntryOrOpen!0 (select (arr!46071 a!2901) j!112) a!2901 mask!2840) (Found!10291 j!112)))))

(declare-fun b!1394737 () Bool)

(declare-fun res!933466 () Bool)

(assert (=> b!1394737 (=> (not res!933466) (not e!789833))))

(assert (=> b!1394737 (= res!933466 (and (= (size!46622 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46622 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46622 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394738 () Bool)

(declare-fun res!933462 () Bool)

(assert (=> b!1394738 (=> (not res!933462) (not e!789833))))

(assert (=> b!1394738 (= res!933462 (validKeyInArray!0 (select (arr!46071 a!2901) j!112)))))

(declare-fun b!1394739 () Bool)

(declare-fun e!789836 () Bool)

(assert (=> b!1394739 (= e!789833 (not e!789836))))

(declare-fun res!933464 () Bool)

(assert (=> b!1394739 (=> res!933464 e!789836)))

(declare-fun lt!612449 () SeekEntryResult!10291)

(assert (=> b!1394739 (= res!933464 (or (not (is-Intermediate!10291 lt!612449)) (undefined!11103 lt!612449)))))

(assert (=> b!1394739 e!789835))

(declare-fun res!933459 () Bool)

(assert (=> b!1394739 (=> (not res!933459) (not e!789835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95430 (_ BitVec 32)) Bool)

(assert (=> b!1394739 (= res!933459 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46613 0))(
  ( (Unit!46614) )
))
(declare-fun lt!612447 () Unit!46613)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46613)

(assert (=> b!1394739 (= lt!612447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95430 (_ BitVec 32)) SeekEntryResult!10291)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394739 (= lt!612449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840) (select (arr!46071 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394740 () Bool)

(assert (=> b!1394740 (= e!789836 true)))

(declare-fun lt!612448 () SeekEntryResult!10291)

(assert (=> b!1394740 (= lt!612448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95431 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901)) mask!2840))))

(declare-fun b!1394741 () Bool)

(declare-fun res!933463 () Bool)

(assert (=> b!1394741 (=> (not res!933463) (not e!789833))))

(declare-datatypes ((List!32577 0))(
  ( (Nil!32574) (Cons!32573 (h!33814 (_ BitVec 64)) (t!47263 List!32577)) )
))
(declare-fun arrayNoDuplicates!0 (array!95430 (_ BitVec 32) List!32577) Bool)

(assert (=> b!1394741 (= res!933463 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32574))))

(declare-fun res!933461 () Bool)

(assert (=> start!119826 (=> (not res!933461) (not e!789833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119826 (= res!933461 (validMask!0 mask!2840))))

(assert (=> start!119826 e!789833))

(assert (=> start!119826 true))

(declare-fun array_inv!35352 (array!95430) Bool)

(assert (=> start!119826 (array_inv!35352 a!2901)))

(declare-fun b!1394742 () Bool)

(declare-fun res!933465 () Bool)

(assert (=> b!1394742 (=> (not res!933465) (not e!789833))))

(assert (=> b!1394742 (= res!933465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119826 res!933461) b!1394737))

(assert (= (and b!1394737 res!933466) b!1394735))

(assert (= (and b!1394735 res!933460) b!1394738))

(assert (= (and b!1394738 res!933462) b!1394742))

(assert (= (and b!1394742 res!933465) b!1394741))

(assert (= (and b!1394741 res!933463) b!1394739))

(assert (= (and b!1394739 res!933459) b!1394736))

(assert (= (and b!1394739 (not res!933464)) b!1394740))

(declare-fun m!1280943 () Bool)

(assert (=> b!1394739 m!1280943))

(declare-fun m!1280945 () Bool)

(assert (=> b!1394739 m!1280945))

(assert (=> b!1394739 m!1280943))

(declare-fun m!1280947 () Bool)

(assert (=> b!1394739 m!1280947))

(assert (=> b!1394739 m!1280945))

(assert (=> b!1394739 m!1280943))

(declare-fun m!1280949 () Bool)

(assert (=> b!1394739 m!1280949))

(declare-fun m!1280951 () Bool)

(assert (=> b!1394739 m!1280951))

(declare-fun m!1280953 () Bool)

(assert (=> b!1394740 m!1280953))

(declare-fun m!1280955 () Bool)

(assert (=> b!1394740 m!1280955))

(assert (=> b!1394740 m!1280955))

(declare-fun m!1280957 () Bool)

(assert (=> b!1394740 m!1280957))

(assert (=> b!1394740 m!1280957))

(assert (=> b!1394740 m!1280955))

(declare-fun m!1280959 () Bool)

(assert (=> b!1394740 m!1280959))

(assert (=> b!1394736 m!1280943))

(assert (=> b!1394736 m!1280943))

(declare-fun m!1280961 () Bool)

(assert (=> b!1394736 m!1280961))

(assert (=> b!1394738 m!1280943))

(assert (=> b!1394738 m!1280943))

(declare-fun m!1280963 () Bool)

(assert (=> b!1394738 m!1280963))

(declare-fun m!1280965 () Bool)

(assert (=> b!1394742 m!1280965))

(declare-fun m!1280967 () Bool)

(assert (=> b!1394735 m!1280967))

(assert (=> b!1394735 m!1280967))

(declare-fun m!1280969 () Bool)

(assert (=> b!1394735 m!1280969))

(declare-fun m!1280971 () Bool)

(assert (=> start!119826 m!1280971))

(declare-fun m!1280973 () Bool)

(assert (=> start!119826 m!1280973))

(declare-fun m!1280975 () Bool)

(assert (=> b!1394741 m!1280975))

(push 1)

(assert (not b!1394741))

(assert (not b!1394739))

(assert (not b!1394742))

(assert (not b!1394740))

(assert (not b!1394735))

(assert (not start!119826))

(assert (not b!1394736))

(assert (not b!1394738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

