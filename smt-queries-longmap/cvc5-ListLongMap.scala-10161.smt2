; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119730 () Bool)

(assert start!119730)

(declare-fun b!1394766 () Bool)

(declare-fun res!934179 () Bool)

(declare-fun e!789652 () Bool)

(assert (=> b!1394766 (=> (not res!934179) (not e!789652))))

(declare-datatypes ((array!95412 0))(
  ( (array!95413 (arr!46064 (Array (_ BitVec 32) (_ BitVec 64))) (size!46614 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95412)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95412 (_ BitVec 32)) Bool)

(assert (=> b!1394766 (= res!934179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394767 () Bool)

(declare-fun e!789651 () Bool)

(declare-fun e!789650 () Bool)

(assert (=> b!1394767 (= e!789651 e!789650)))

(declare-fun res!934175 () Bool)

(assert (=> b!1394767 (=> res!934175 e!789650)))

(declare-fun lt!612727 () array!95412)

(declare-fun lt!612724 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10381 0))(
  ( (MissingZero!10381 (index!43895 (_ BitVec 32))) (Found!10381 (index!43896 (_ BitVec 32))) (Intermediate!10381 (undefined!11193 Bool) (index!43897 (_ BitVec 32)) (x!125561 (_ BitVec 32))) (Undefined!10381) (MissingVacant!10381 (index!43898 (_ BitVec 32))) )
))
(declare-fun lt!612729 () SeekEntryResult!10381)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95412 (_ BitVec 32)) SeekEntryResult!10381)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394767 (= res!934175 (not (= lt!612729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612724 mask!2840) lt!612724 lt!612727 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394767 (= lt!612724 (select (store (arr!46064 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394767 (= lt!612727 (array!95413 (store (arr!46064 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46614 a!2901)))))

(declare-fun b!1394768 () Bool)

(declare-fun res!934177 () Bool)

(assert (=> b!1394768 (=> (not res!934177) (not e!789652))))

(assert (=> b!1394768 (= res!934177 (and (= (size!46614 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46614 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46614 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394769 () Bool)

(declare-fun res!934182 () Bool)

(assert (=> b!1394769 (=> (not res!934182) (not e!789652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394769 (= res!934182 (validKeyInArray!0 (select (arr!46064 a!2901) i!1037)))))

(declare-fun b!1394770 () Bool)

(declare-fun e!789649 () Bool)

(assert (=> b!1394770 (= e!789650 e!789649)))

(declare-fun res!934180 () Bool)

(assert (=> b!1394770 (=> res!934180 e!789649)))

(assert (=> b!1394770 (= res!934180 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!612725 () SeekEntryResult!10381)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95412 (_ BitVec 32)) SeekEntryResult!10381)

(assert (=> b!1394770 (= lt!612725 (seekEntryOrOpen!0 lt!612724 lt!612727 mask!2840))))

(declare-fun lt!612728 () (_ BitVec 32))

(declare-datatypes ((Unit!46766 0))(
  ( (Unit!46767) )
))
(declare-fun lt!612726 () Unit!46766)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46766)

(assert (=> b!1394770 (= lt!612726 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612728 (x!125561 lt!612729) (index!43897 lt!612729) mask!2840))))

(declare-fun b!1394772 () Bool)

(assert (=> b!1394772 (= e!789649 (validKeyInArray!0 lt!612724))))

(declare-fun b!1394773 () Bool)

(assert (=> b!1394773 (= e!789652 (not e!789651))))

(declare-fun res!934183 () Bool)

(assert (=> b!1394773 (=> res!934183 e!789651)))

(assert (=> b!1394773 (= res!934183 (or (not (is-Intermediate!10381 lt!612729)) (undefined!11193 lt!612729)))))

(assert (=> b!1394773 (= lt!612725 (Found!10381 j!112))))

(assert (=> b!1394773 (= lt!612725 (seekEntryOrOpen!0 (select (arr!46064 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394773 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612723 () Unit!46766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46766)

(assert (=> b!1394773 (= lt!612723 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394773 (= lt!612729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612728 (select (arr!46064 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394773 (= lt!612728 (toIndex!0 (select (arr!46064 a!2901) j!112) mask!2840))))

(declare-fun b!1394774 () Bool)

(declare-fun res!934178 () Bool)

(assert (=> b!1394774 (=> res!934178 e!789650)))

(assert (=> b!1394774 (= res!934178 (or (bvslt (x!125561 lt!612729) #b00000000000000000000000000000000) (bvsgt (x!125561 lt!612729) #b01111111111111111111111111111110) (bvslt lt!612728 #b00000000000000000000000000000000) (bvsge lt!612728 (size!46614 a!2901)) (bvslt (index!43897 lt!612729) #b00000000000000000000000000000000) (bvsge (index!43897 lt!612729) (size!46614 a!2901)) (not (= lt!612729 (Intermediate!10381 false (index!43897 lt!612729) (x!125561 lt!612729))))))))

(declare-fun b!1394775 () Bool)

(declare-fun res!934181 () Bool)

(assert (=> b!1394775 (=> (not res!934181) (not e!789652))))

(declare-datatypes ((List!32583 0))(
  ( (Nil!32580) (Cons!32579 (h!33812 (_ BitVec 64)) (t!47277 List!32583)) )
))
(declare-fun arrayNoDuplicates!0 (array!95412 (_ BitVec 32) List!32583) Bool)

(assert (=> b!1394775 (= res!934181 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32580))))

(declare-fun res!934176 () Bool)

(assert (=> start!119730 (=> (not res!934176) (not e!789652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119730 (= res!934176 (validMask!0 mask!2840))))

(assert (=> start!119730 e!789652))

(assert (=> start!119730 true))

(declare-fun array_inv!35092 (array!95412) Bool)

(assert (=> start!119730 (array_inv!35092 a!2901)))

(declare-fun b!1394771 () Bool)

(declare-fun res!934174 () Bool)

(assert (=> b!1394771 (=> (not res!934174) (not e!789652))))

(assert (=> b!1394771 (= res!934174 (validKeyInArray!0 (select (arr!46064 a!2901) j!112)))))

(assert (= (and start!119730 res!934176) b!1394768))

(assert (= (and b!1394768 res!934177) b!1394769))

(assert (= (and b!1394769 res!934182) b!1394771))

(assert (= (and b!1394771 res!934174) b!1394766))

(assert (= (and b!1394766 res!934179) b!1394775))

(assert (= (and b!1394775 res!934181) b!1394773))

(assert (= (and b!1394773 (not res!934183)) b!1394767))

(assert (= (and b!1394767 (not res!934175)) b!1394774))

(assert (= (and b!1394774 (not res!934178)) b!1394770))

(assert (= (and b!1394770 (not res!934180)) b!1394772))

(declare-fun m!1281219 () Bool)

(assert (=> b!1394766 m!1281219))

(declare-fun m!1281221 () Bool)

(assert (=> b!1394772 m!1281221))

(declare-fun m!1281223 () Bool)

(assert (=> b!1394775 m!1281223))

(declare-fun m!1281225 () Bool)

(assert (=> b!1394770 m!1281225))

(declare-fun m!1281227 () Bool)

(assert (=> b!1394770 m!1281227))

(declare-fun m!1281229 () Bool)

(assert (=> b!1394771 m!1281229))

(assert (=> b!1394771 m!1281229))

(declare-fun m!1281231 () Bool)

(assert (=> b!1394771 m!1281231))

(declare-fun m!1281233 () Bool)

(assert (=> b!1394767 m!1281233))

(assert (=> b!1394767 m!1281233))

(declare-fun m!1281235 () Bool)

(assert (=> b!1394767 m!1281235))

(declare-fun m!1281237 () Bool)

(assert (=> b!1394767 m!1281237))

(declare-fun m!1281239 () Bool)

(assert (=> b!1394767 m!1281239))

(declare-fun m!1281241 () Bool)

(assert (=> b!1394769 m!1281241))

(assert (=> b!1394769 m!1281241))

(declare-fun m!1281243 () Bool)

(assert (=> b!1394769 m!1281243))

(declare-fun m!1281245 () Bool)

(assert (=> start!119730 m!1281245))

(declare-fun m!1281247 () Bool)

(assert (=> start!119730 m!1281247))

(assert (=> b!1394773 m!1281229))

(declare-fun m!1281249 () Bool)

(assert (=> b!1394773 m!1281249))

(assert (=> b!1394773 m!1281229))

(declare-fun m!1281251 () Bool)

(assert (=> b!1394773 m!1281251))

(assert (=> b!1394773 m!1281229))

(declare-fun m!1281253 () Bool)

(assert (=> b!1394773 m!1281253))

(declare-fun m!1281255 () Bool)

(assert (=> b!1394773 m!1281255))

(assert (=> b!1394773 m!1281229))

(declare-fun m!1281257 () Bool)

(assert (=> b!1394773 m!1281257))

(push 1)

