; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122942 () Bool)

(assert start!122942)

(declare-fun b!1426137 () Bool)

(declare-fun e!805601 () Bool)

(declare-fun e!805600 () Bool)

(assert (=> b!1426137 (= e!805601 e!805600)))

(declare-fun res!961571 () Bool)

(assert (=> b!1426137 (=> (not res!961571) (not e!805600))))

(declare-datatypes ((SeekEntryResult!11250 0))(
  ( (MissingZero!11250 (index!47392 (_ BitVec 32))) (Found!11250 (index!47393 (_ BitVec 32))) (Intermediate!11250 (undefined!12062 Bool) (index!47394 (_ BitVec 32)) (x!129020 (_ BitVec 32))) (Undefined!11250) (MissingVacant!11250 (index!47395 (_ BitVec 32))) )
))
(declare-fun lt!628037 () SeekEntryResult!11250)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97307 0))(
  ( (array!97308 (arr!46971 (Array (_ BitVec 32) (_ BitVec 64))) (size!47521 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97307)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97307 (_ BitVec 32)) SeekEntryResult!11250)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426137 (= res!961571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46971 a!2831) j!81) mask!2608) (select (arr!46971 a!2831) j!81) a!2831 mask!2608) lt!628037))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426137 (= lt!628037 (Intermediate!11250 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426138 () Bool)

(declare-fun res!961578 () Bool)

(assert (=> b!1426138 (=> (not res!961578) (not e!805601))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426138 (= res!961578 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47521 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47521 a!2831))))))

(declare-fun res!961572 () Bool)

(assert (=> start!122942 (=> (not res!961572) (not e!805601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122942 (= res!961572 (validMask!0 mask!2608))))

(assert (=> start!122942 e!805601))

(assert (=> start!122942 true))

(declare-fun array_inv!35999 (array!97307) Bool)

(assert (=> start!122942 (array_inv!35999 a!2831)))

(declare-fun b!1426139 () Bool)

(declare-fun res!961576 () Bool)

(assert (=> b!1426139 (=> (not res!961576) (not e!805601))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426139 (= res!961576 (validKeyInArray!0 (select (arr!46971 a!2831) i!982)))))

(declare-fun b!1426140 () Bool)

(declare-fun res!961575 () Bool)

(declare-fun e!805599 () Bool)

(assert (=> b!1426140 (=> (not res!961575) (not e!805599))))

(assert (=> b!1426140 (= res!961575 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46971 a!2831) j!81) a!2831 mask!2608) lt!628037))))

(declare-fun b!1426141 () Bool)

(assert (=> b!1426141 (= e!805600 e!805599)))

(declare-fun res!961577 () Bool)

(assert (=> b!1426141 (=> (not res!961577) (not e!805599))))

(declare-fun lt!628036 () array!97307)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!628038 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426141 (= res!961577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628038 mask!2608) lt!628038 lt!628036 mask!2608) (Intermediate!11250 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1426141 (= lt!628038 (select (store (arr!46971 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426141 (= lt!628036 (array!97308 (store (arr!46971 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47521 a!2831)))))

(declare-fun b!1426142 () Bool)

(declare-fun res!961574 () Bool)

(assert (=> b!1426142 (=> (not res!961574) (not e!805601))))

(assert (=> b!1426142 (= res!961574 (and (= (size!47521 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47521 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47521 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426143 () Bool)

(assert (=> b!1426143 (= e!805599 false)))

(declare-fun lt!628035 () SeekEntryResult!11250)

(assert (=> b!1426143 (= lt!628035 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628038 lt!628036 mask!2608))))

(declare-fun b!1426144 () Bool)

(declare-fun res!961570 () Bool)

(assert (=> b!1426144 (=> (not res!961570) (not e!805601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97307 (_ BitVec 32)) Bool)

(assert (=> b!1426144 (= res!961570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426145 () Bool)

(declare-fun res!961573 () Bool)

(assert (=> b!1426145 (=> (not res!961573) (not e!805601))))

(assert (=> b!1426145 (= res!961573 (validKeyInArray!0 (select (arr!46971 a!2831) j!81)))))

(declare-fun b!1426146 () Bool)

(declare-fun res!961579 () Bool)

(assert (=> b!1426146 (=> (not res!961579) (not e!805601))))

(declare-datatypes ((List!33481 0))(
  ( (Nil!33478) (Cons!33477 (h!34779 (_ BitVec 64)) (t!48175 List!33481)) )
))
(declare-fun arrayNoDuplicates!0 (array!97307 (_ BitVec 32) List!33481) Bool)

(assert (=> b!1426146 (= res!961579 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33478))))

(assert (= (and start!122942 res!961572) b!1426142))

(assert (= (and b!1426142 res!961574) b!1426139))

(assert (= (and b!1426139 res!961576) b!1426145))

(assert (= (and b!1426145 res!961573) b!1426144))

(assert (= (and b!1426144 res!961570) b!1426146))

(assert (= (and b!1426146 res!961579) b!1426138))

(assert (= (and b!1426138 res!961578) b!1426137))

(assert (= (and b!1426137 res!961571) b!1426141))

(assert (= (and b!1426141 res!961577) b!1426140))

(assert (= (and b!1426140 res!961575) b!1426143))

(declare-fun m!1316747 () Bool)

(assert (=> b!1426146 m!1316747))

(declare-fun m!1316749 () Bool)

(assert (=> b!1426137 m!1316749))

(assert (=> b!1426137 m!1316749))

(declare-fun m!1316751 () Bool)

(assert (=> b!1426137 m!1316751))

(assert (=> b!1426137 m!1316751))

(assert (=> b!1426137 m!1316749))

(declare-fun m!1316753 () Bool)

(assert (=> b!1426137 m!1316753))

(declare-fun m!1316755 () Bool)

(assert (=> b!1426141 m!1316755))

(assert (=> b!1426141 m!1316755))

(declare-fun m!1316757 () Bool)

(assert (=> b!1426141 m!1316757))

(declare-fun m!1316759 () Bool)

(assert (=> b!1426141 m!1316759))

(declare-fun m!1316761 () Bool)

(assert (=> b!1426141 m!1316761))

(declare-fun m!1316763 () Bool)

(assert (=> b!1426139 m!1316763))

(assert (=> b!1426139 m!1316763))

(declare-fun m!1316765 () Bool)

(assert (=> b!1426139 m!1316765))

(assert (=> b!1426145 m!1316749))

(assert (=> b!1426145 m!1316749))

(declare-fun m!1316767 () Bool)

(assert (=> b!1426145 m!1316767))

(declare-fun m!1316769 () Bool)

(assert (=> start!122942 m!1316769))

(declare-fun m!1316771 () Bool)

(assert (=> start!122942 m!1316771))

(declare-fun m!1316773 () Bool)

(assert (=> b!1426143 m!1316773))

(declare-fun m!1316775 () Bool)

(assert (=> b!1426144 m!1316775))

(assert (=> b!1426140 m!1316749))

(assert (=> b!1426140 m!1316749))

(declare-fun m!1316777 () Bool)

(assert (=> b!1426140 m!1316777))

(check-sat (not start!122942) (not b!1426141) (not b!1426139) (not b!1426137) (not b!1426144) (not b!1426146) (not b!1426140) (not b!1426143) (not b!1426145))
(check-sat)
