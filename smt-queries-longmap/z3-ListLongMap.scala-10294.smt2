; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121088 () Bool)

(assert start!121088)

(declare-fun b!1407857 () Bool)

(declare-fun res!945586 () Bool)

(declare-fun e!796829 () Bool)

(assert (=> b!1407857 (=> (not res!945586) (not e!796829))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96242 0))(
  ( (array!96243 (arr!46464 (Array (_ BitVec 32) (_ BitVec 64))) (size!47014 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96242)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1407857 (= res!945586 (and (= (size!47014 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47014 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47014 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!796828 () Bool)

(declare-fun b!1407858 () Bool)

(declare-datatypes ((SeekEntryResult!10775 0))(
  ( (MissingZero!10775 (index!45477 (_ BitVec 32))) (Found!10775 (index!45478 (_ BitVec 32))) (Intermediate!10775 (undefined!11587 Bool) (index!45479 (_ BitVec 32)) (x!127088 (_ BitVec 32))) (Undefined!10775) (MissingVacant!10775 (index!45480 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96242 (_ BitVec 32)) SeekEntryResult!10775)

(assert (=> b!1407858 (= e!796828 (= (seekEntryOrOpen!0 (select (arr!46464 a!2901) j!112) a!2901 mask!2840) (Found!10775 j!112)))))

(declare-fun res!945585 () Bool)

(assert (=> start!121088 (=> (not res!945585) (not e!796829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121088 (= res!945585 (validMask!0 mask!2840))))

(assert (=> start!121088 e!796829))

(assert (=> start!121088 true))

(declare-fun array_inv!35492 (array!96242) Bool)

(assert (=> start!121088 (array_inv!35492 a!2901)))

(declare-fun b!1407859 () Bool)

(declare-fun res!945584 () Bool)

(assert (=> b!1407859 (=> (not res!945584) (not e!796829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96242 (_ BitVec 32)) Bool)

(assert (=> b!1407859 (= res!945584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407860 () Bool)

(declare-fun e!796827 () Bool)

(assert (=> b!1407860 (= e!796829 (not e!796827))))

(declare-fun res!945581 () Bool)

(assert (=> b!1407860 (=> res!945581 e!796827)))

(declare-fun lt!619967 () SeekEntryResult!10775)

(get-info :version)

(assert (=> b!1407860 (= res!945581 (or (not ((_ is Intermediate!10775) lt!619967)) (undefined!11587 lt!619967)))))

(assert (=> b!1407860 e!796828))

(declare-fun res!945579 () Bool)

(assert (=> b!1407860 (=> (not res!945579) (not e!796828))))

(assert (=> b!1407860 (= res!945579 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47524 0))(
  ( (Unit!47525) )
))
(declare-fun lt!619968 () Unit!47524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47524)

(assert (=> b!1407860 (= lt!619968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96242 (_ BitVec 32)) SeekEntryResult!10775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407860 (= lt!619967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46464 a!2901) j!112) mask!2840) (select (arr!46464 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407861 () Bool)

(assert (=> b!1407861 (= e!796827 true)))

(declare-fun lt!619966 () SeekEntryResult!10775)

(assert (=> b!1407861 (= lt!619966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46464 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46464 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96243 (store (arr!46464 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47014 a!2901)) mask!2840))))

(declare-fun b!1407862 () Bool)

(declare-fun res!945582 () Bool)

(assert (=> b!1407862 (=> (not res!945582) (not e!796829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407862 (= res!945582 (validKeyInArray!0 (select (arr!46464 a!2901) i!1037)))))

(declare-fun b!1407863 () Bool)

(declare-fun res!945580 () Bool)

(assert (=> b!1407863 (=> (not res!945580) (not e!796829))))

(declare-datatypes ((List!32983 0))(
  ( (Nil!32980) (Cons!32979 (h!34242 (_ BitVec 64)) (t!47677 List!32983)) )
))
(declare-fun arrayNoDuplicates!0 (array!96242 (_ BitVec 32) List!32983) Bool)

(assert (=> b!1407863 (= res!945580 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32980))))

(declare-fun b!1407864 () Bool)

(declare-fun res!945583 () Bool)

(assert (=> b!1407864 (=> (not res!945583) (not e!796829))))

(assert (=> b!1407864 (= res!945583 (validKeyInArray!0 (select (arr!46464 a!2901) j!112)))))

(assert (= (and start!121088 res!945585) b!1407857))

(assert (= (and b!1407857 res!945586) b!1407862))

(assert (= (and b!1407862 res!945582) b!1407864))

(assert (= (and b!1407864 res!945583) b!1407859))

(assert (= (and b!1407859 res!945584) b!1407863))

(assert (= (and b!1407863 res!945580) b!1407860))

(assert (= (and b!1407860 res!945579) b!1407858))

(assert (= (and b!1407860 (not res!945581)) b!1407861))

(declare-fun m!1296919 () Bool)

(assert (=> start!121088 m!1296919))

(declare-fun m!1296921 () Bool)

(assert (=> start!121088 m!1296921))

(declare-fun m!1296923 () Bool)

(assert (=> b!1407858 m!1296923))

(assert (=> b!1407858 m!1296923))

(declare-fun m!1296925 () Bool)

(assert (=> b!1407858 m!1296925))

(declare-fun m!1296927 () Bool)

(assert (=> b!1407859 m!1296927))

(declare-fun m!1296929 () Bool)

(assert (=> b!1407863 m!1296929))

(declare-fun m!1296931 () Bool)

(assert (=> b!1407862 m!1296931))

(assert (=> b!1407862 m!1296931))

(declare-fun m!1296933 () Bool)

(assert (=> b!1407862 m!1296933))

(assert (=> b!1407864 m!1296923))

(assert (=> b!1407864 m!1296923))

(declare-fun m!1296935 () Bool)

(assert (=> b!1407864 m!1296935))

(assert (=> b!1407860 m!1296923))

(declare-fun m!1296937 () Bool)

(assert (=> b!1407860 m!1296937))

(assert (=> b!1407860 m!1296923))

(declare-fun m!1296939 () Bool)

(assert (=> b!1407860 m!1296939))

(assert (=> b!1407860 m!1296937))

(assert (=> b!1407860 m!1296923))

(declare-fun m!1296941 () Bool)

(assert (=> b!1407860 m!1296941))

(declare-fun m!1296943 () Bool)

(assert (=> b!1407860 m!1296943))

(declare-fun m!1296945 () Bool)

(assert (=> b!1407861 m!1296945))

(declare-fun m!1296947 () Bool)

(assert (=> b!1407861 m!1296947))

(assert (=> b!1407861 m!1296947))

(declare-fun m!1296949 () Bool)

(assert (=> b!1407861 m!1296949))

(assert (=> b!1407861 m!1296949))

(assert (=> b!1407861 m!1296947))

(declare-fun m!1296951 () Bool)

(assert (=> b!1407861 m!1296951))

(check-sat (not b!1407863) (not b!1407861) (not b!1407859) (not b!1407862) (not b!1407860) (not b!1407864) (not start!121088) (not b!1407858))
