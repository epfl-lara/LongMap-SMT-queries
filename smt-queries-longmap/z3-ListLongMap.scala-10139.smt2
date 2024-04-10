; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119600 () Bool)

(assert start!119600)

(declare-fun b!1393139 () Bool)

(declare-fun e!788867 () Bool)

(declare-fun e!788868 () Bool)

(assert (=> b!1393139 (= e!788867 (not e!788868))))

(declare-fun res!932547 () Bool)

(assert (=> b!1393139 (=> res!932547 e!788868)))

(declare-datatypes ((SeekEntryResult!10316 0))(
  ( (MissingZero!10316 (index!43635 (_ BitVec 32))) (Found!10316 (index!43636 (_ BitVec 32))) (Intermediate!10316 (undefined!11128 Bool) (index!43637 (_ BitVec 32)) (x!125320 (_ BitVec 32))) (Undefined!10316) (MissingVacant!10316 (index!43638 (_ BitVec 32))) )
))
(declare-fun lt!611879 () SeekEntryResult!10316)

(get-info :version)

(assert (=> b!1393139 (= res!932547 (or (not ((_ is Intermediate!10316) lt!611879)) (undefined!11128 lt!611879)))))

(declare-fun e!788869 () Bool)

(assert (=> b!1393139 e!788869))

(declare-fun res!932548 () Bool)

(assert (=> b!1393139 (=> (not res!932548) (not e!788869))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95282 0))(
  ( (array!95283 (arr!45999 (Array (_ BitVec 32) (_ BitVec 64))) (size!46549 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95282)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95282 (_ BitVec 32)) Bool)

(assert (=> b!1393139 (= res!932548 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46636 0))(
  ( (Unit!46637) )
))
(declare-fun lt!611878 () Unit!46636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46636)

(assert (=> b!1393139 (= lt!611878 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95282 (_ BitVec 32)) SeekEntryResult!10316)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393139 (= lt!611879 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45999 a!2901) j!112) mask!2840) (select (arr!45999 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393140 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95282 (_ BitVec 32)) SeekEntryResult!10316)

(assert (=> b!1393140 (= e!788869 (= (seekEntryOrOpen!0 (select (arr!45999 a!2901) j!112) a!2901 mask!2840) (Found!10316 j!112)))))

(declare-fun res!932550 () Bool)

(assert (=> start!119600 (=> (not res!932550) (not e!788867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119600 (= res!932550 (validMask!0 mask!2840))))

(assert (=> start!119600 e!788867))

(assert (=> start!119600 true))

(declare-fun array_inv!35027 (array!95282) Bool)

(assert (=> start!119600 (array_inv!35027 a!2901)))

(declare-fun b!1393141 () Bool)

(declare-fun res!932553 () Bool)

(assert (=> b!1393141 (=> (not res!932553) (not e!788867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393141 (= res!932553 (validKeyInArray!0 (select (arr!45999 a!2901) j!112)))))

(declare-fun b!1393142 () Bool)

(assert (=> b!1393142 (= e!788868 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!611880 () SeekEntryResult!10316)

(assert (=> b!1393142 (= lt!611880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45999 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45999 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95283 (store (arr!45999 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46549 a!2901)) mask!2840))))

(declare-fun b!1393143 () Bool)

(declare-fun res!932552 () Bool)

(assert (=> b!1393143 (=> (not res!932552) (not e!788867))))

(assert (=> b!1393143 (= res!932552 (and (= (size!46549 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46549 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46549 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393144 () Bool)

(declare-fun res!932551 () Bool)

(assert (=> b!1393144 (=> (not res!932551) (not e!788867))))

(assert (=> b!1393144 (= res!932551 (validKeyInArray!0 (select (arr!45999 a!2901) i!1037)))))

(declare-fun b!1393145 () Bool)

(declare-fun res!932549 () Bool)

(assert (=> b!1393145 (=> (not res!932549) (not e!788867))))

(declare-datatypes ((List!32518 0))(
  ( (Nil!32515) (Cons!32514 (h!33747 (_ BitVec 64)) (t!47212 List!32518)) )
))
(declare-fun arrayNoDuplicates!0 (array!95282 (_ BitVec 32) List!32518) Bool)

(assert (=> b!1393145 (= res!932549 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32515))))

(declare-fun b!1393146 () Bool)

(declare-fun res!932554 () Bool)

(assert (=> b!1393146 (=> (not res!932554) (not e!788867))))

(assert (=> b!1393146 (= res!932554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119600 res!932550) b!1393143))

(assert (= (and b!1393143 res!932552) b!1393144))

(assert (= (and b!1393144 res!932551) b!1393141))

(assert (= (and b!1393141 res!932553) b!1393146))

(assert (= (and b!1393146 res!932554) b!1393145))

(assert (= (and b!1393145 res!932549) b!1393139))

(assert (= (and b!1393139 res!932548) b!1393140))

(assert (= (and b!1393139 (not res!932547)) b!1393142))

(declare-fun m!1278925 () Bool)

(assert (=> start!119600 m!1278925))

(declare-fun m!1278927 () Bool)

(assert (=> start!119600 m!1278927))

(declare-fun m!1278929 () Bool)

(assert (=> b!1393142 m!1278929))

(declare-fun m!1278931 () Bool)

(assert (=> b!1393142 m!1278931))

(assert (=> b!1393142 m!1278931))

(declare-fun m!1278933 () Bool)

(assert (=> b!1393142 m!1278933))

(assert (=> b!1393142 m!1278933))

(assert (=> b!1393142 m!1278931))

(declare-fun m!1278935 () Bool)

(assert (=> b!1393142 m!1278935))

(declare-fun m!1278937 () Bool)

(assert (=> b!1393144 m!1278937))

(assert (=> b!1393144 m!1278937))

(declare-fun m!1278939 () Bool)

(assert (=> b!1393144 m!1278939))

(declare-fun m!1278941 () Bool)

(assert (=> b!1393139 m!1278941))

(declare-fun m!1278943 () Bool)

(assert (=> b!1393139 m!1278943))

(assert (=> b!1393139 m!1278941))

(declare-fun m!1278945 () Bool)

(assert (=> b!1393139 m!1278945))

(assert (=> b!1393139 m!1278943))

(assert (=> b!1393139 m!1278941))

(declare-fun m!1278947 () Bool)

(assert (=> b!1393139 m!1278947))

(declare-fun m!1278949 () Bool)

(assert (=> b!1393139 m!1278949))

(assert (=> b!1393141 m!1278941))

(assert (=> b!1393141 m!1278941))

(declare-fun m!1278951 () Bool)

(assert (=> b!1393141 m!1278951))

(declare-fun m!1278953 () Bool)

(assert (=> b!1393145 m!1278953))

(assert (=> b!1393140 m!1278941))

(assert (=> b!1393140 m!1278941))

(declare-fun m!1278955 () Bool)

(assert (=> b!1393140 m!1278955))

(declare-fun m!1278957 () Bool)

(assert (=> b!1393146 m!1278957))

(check-sat (not b!1393141) (not b!1393144) (not b!1393139) (not b!1393142) (not b!1393145) (not b!1393146) (not start!119600) (not b!1393140))
(check-sat)
