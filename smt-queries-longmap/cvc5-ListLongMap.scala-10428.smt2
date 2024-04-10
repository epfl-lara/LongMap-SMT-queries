; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122730 () Bool)

(assert start!122730)

(declare-fun b!1422159 () Bool)

(declare-fun res!957596 () Bool)

(declare-fun e!804022 () Bool)

(assert (=> b!1422159 (=> (not res!957596) (not e!804022))))

(declare-fun lt!626557 () (_ BitVec 64))

(declare-datatypes ((array!97095 0))(
  ( (array!97096 (arr!46865 (Array (_ BitVec 32) (_ BitVec 64))) (size!47415 (_ BitVec 32))) )
))
(declare-fun lt!626556 () array!97095)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11150 0))(
  ( (MissingZero!11150 (index!46992 (_ BitVec 32))) (Found!11150 (index!46993 (_ BitVec 32))) (Intermediate!11150 (undefined!11962 Bool) (index!46994 (_ BitVec 32)) (x!128640 (_ BitVec 32))) (Undefined!11150) (MissingVacant!11150 (index!46995 (_ BitVec 32))) )
))
(declare-fun lt!626553 () SeekEntryResult!11150)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97095 (_ BitVec 32)) SeekEntryResult!11150)

(assert (=> b!1422159 (= res!957596 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626557 lt!626556 mask!2608) lt!626553))))

(declare-fun b!1422161 () Bool)

(declare-fun res!957605 () Bool)

(declare-fun e!804020 () Bool)

(assert (=> b!1422161 (=> (not res!957605) (not e!804020))))

(declare-fun a!2831 () array!97095)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422161 (= res!957605 (validKeyInArray!0 (select (arr!46865 a!2831) j!81)))))

(declare-fun e!804019 () Bool)

(declare-fun b!1422162 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97095 (_ BitVec 32)) SeekEntryResult!11150)

(assert (=> b!1422162 (= e!804019 (= (seekEntryOrOpen!0 (select (arr!46865 a!2831) j!81) a!2831 mask!2608) (Found!11150 j!81)))))

(declare-fun b!1422163 () Bool)

(declare-fun res!957607 () Bool)

(assert (=> b!1422163 (=> (not res!957607) (not e!804022))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422163 (= res!957607 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422164 () Bool)

(declare-fun res!957606 () Bool)

(assert (=> b!1422164 (=> (not res!957606) (not e!804020))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422164 (= res!957606 (and (= (size!47415 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47415 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47415 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422165 () Bool)

(declare-fun res!957603 () Bool)

(declare-fun e!804018 () Bool)

(assert (=> b!1422165 (=> res!957603 e!804018)))

(declare-fun lt!626558 () SeekEntryResult!11150)

(declare-fun lt!626554 () (_ BitVec 32))

(assert (=> b!1422165 (= res!957603 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626554 (select (arr!46865 a!2831) j!81) a!2831 mask!2608) lt!626558)))))

(declare-fun b!1422166 () Bool)

(declare-fun e!804021 () Bool)

(assert (=> b!1422166 (= e!804020 e!804021)))

(declare-fun res!957600 () Bool)

(assert (=> b!1422166 (=> (not res!957600) (not e!804021))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422166 (= res!957600 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46865 a!2831) j!81) mask!2608) (select (arr!46865 a!2831) j!81) a!2831 mask!2608) lt!626558))))

(assert (=> b!1422166 (= lt!626558 (Intermediate!11150 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422167 () Bool)

(assert (=> b!1422167 (= e!804021 e!804022)))

(declare-fun res!957595 () Bool)

(assert (=> b!1422167 (=> (not res!957595) (not e!804022))))

(assert (=> b!1422167 (= res!957595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626557 mask!2608) lt!626557 lt!626556 mask!2608) lt!626553))))

(assert (=> b!1422167 (= lt!626553 (Intermediate!11150 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422167 (= lt!626557 (select (store (arr!46865 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422167 (= lt!626556 (array!97096 (store (arr!46865 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47415 a!2831)))))

(declare-fun b!1422168 () Bool)

(declare-fun res!957599 () Bool)

(assert (=> b!1422168 (=> (not res!957599) (not e!804022))))

(assert (=> b!1422168 (= res!957599 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46865 a!2831) j!81) a!2831 mask!2608) lt!626558))))

(declare-fun b!1422169 () Bool)

(declare-fun e!804023 () Bool)

(assert (=> b!1422169 (= e!804022 (not e!804023))))

(declare-fun res!957601 () Bool)

(assert (=> b!1422169 (=> res!957601 e!804023)))

(assert (=> b!1422169 (= res!957601 (or (= (select (arr!46865 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46865 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46865 a!2831) index!585) (select (arr!46865 a!2831) j!81)) (= (select (store (arr!46865 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422169 e!804019))

(declare-fun res!957597 () Bool)

(assert (=> b!1422169 (=> (not res!957597) (not e!804019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97095 (_ BitVec 32)) Bool)

(assert (=> b!1422169 (= res!957597 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48136 0))(
  ( (Unit!48137) )
))
(declare-fun lt!626555 () Unit!48136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48136)

(assert (=> b!1422169 (= lt!626555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422170 () Bool)

(declare-fun res!957598 () Bool)

(assert (=> b!1422170 (=> (not res!957598) (not e!804020))))

(assert (=> b!1422170 (= res!957598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!957592 () Bool)

(assert (=> start!122730 (=> (not res!957592) (not e!804020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122730 (= res!957592 (validMask!0 mask!2608))))

(assert (=> start!122730 e!804020))

(assert (=> start!122730 true))

(declare-fun array_inv!35893 (array!97095) Bool)

(assert (=> start!122730 (array_inv!35893 a!2831)))

(declare-fun b!1422160 () Bool)

(declare-fun res!957602 () Bool)

(assert (=> b!1422160 (=> (not res!957602) (not e!804020))))

(declare-datatypes ((List!33375 0))(
  ( (Nil!33372) (Cons!33371 (h!34673 (_ BitVec 64)) (t!48069 List!33375)) )
))
(declare-fun arrayNoDuplicates!0 (array!97095 (_ BitVec 32) List!33375) Bool)

(assert (=> b!1422160 (= res!957602 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33372))))

(declare-fun b!1422171 () Bool)

(assert (=> b!1422171 (= e!804023 e!804018)))

(declare-fun res!957594 () Bool)

(assert (=> b!1422171 (=> res!957594 e!804018)))

(assert (=> b!1422171 (= res!957594 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626554 #b00000000000000000000000000000000) (bvsge lt!626554 (size!47415 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422171 (= lt!626554 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422172 () Bool)

(declare-fun res!957593 () Bool)

(assert (=> b!1422172 (=> (not res!957593) (not e!804020))))

(assert (=> b!1422172 (= res!957593 (validKeyInArray!0 (select (arr!46865 a!2831) i!982)))))

(declare-fun b!1422173 () Bool)

(assert (=> b!1422173 (= e!804018 true)))

(declare-fun lt!626559 () SeekEntryResult!11150)

(assert (=> b!1422173 (= lt!626559 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626554 lt!626557 lt!626556 mask!2608))))

(declare-fun b!1422174 () Bool)

(declare-fun res!957604 () Bool)

(assert (=> b!1422174 (=> (not res!957604) (not e!804020))))

(assert (=> b!1422174 (= res!957604 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47415 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47415 a!2831))))))

(assert (= (and start!122730 res!957592) b!1422164))

(assert (= (and b!1422164 res!957606) b!1422172))

(assert (= (and b!1422172 res!957593) b!1422161))

(assert (= (and b!1422161 res!957605) b!1422170))

(assert (= (and b!1422170 res!957598) b!1422160))

(assert (= (and b!1422160 res!957602) b!1422174))

(assert (= (and b!1422174 res!957604) b!1422166))

(assert (= (and b!1422166 res!957600) b!1422167))

(assert (= (and b!1422167 res!957595) b!1422168))

(assert (= (and b!1422168 res!957599) b!1422159))

(assert (= (and b!1422159 res!957596) b!1422163))

(assert (= (and b!1422163 res!957607) b!1422169))

(assert (= (and b!1422169 res!957597) b!1422162))

(assert (= (and b!1422169 (not res!957601)) b!1422171))

(assert (= (and b!1422171 (not res!957594)) b!1422165))

(assert (= (and b!1422165 (not res!957603)) b!1422173))

(declare-fun m!1312707 () Bool)

(assert (=> b!1422159 m!1312707))

(declare-fun m!1312709 () Bool)

(assert (=> start!122730 m!1312709))

(declare-fun m!1312711 () Bool)

(assert (=> start!122730 m!1312711))

(declare-fun m!1312713 () Bool)

(assert (=> b!1422169 m!1312713))

(declare-fun m!1312715 () Bool)

(assert (=> b!1422169 m!1312715))

(declare-fun m!1312717 () Bool)

(assert (=> b!1422169 m!1312717))

(declare-fun m!1312719 () Bool)

(assert (=> b!1422169 m!1312719))

(declare-fun m!1312721 () Bool)

(assert (=> b!1422169 m!1312721))

(declare-fun m!1312723 () Bool)

(assert (=> b!1422169 m!1312723))

(declare-fun m!1312725 () Bool)

(assert (=> b!1422171 m!1312725))

(assert (=> b!1422162 m!1312721))

(assert (=> b!1422162 m!1312721))

(declare-fun m!1312727 () Bool)

(assert (=> b!1422162 m!1312727))

(assert (=> b!1422165 m!1312721))

(assert (=> b!1422165 m!1312721))

(declare-fun m!1312729 () Bool)

(assert (=> b!1422165 m!1312729))

(declare-fun m!1312731 () Bool)

(assert (=> b!1422160 m!1312731))

(declare-fun m!1312733 () Bool)

(assert (=> b!1422170 m!1312733))

(assert (=> b!1422168 m!1312721))

(assert (=> b!1422168 m!1312721))

(declare-fun m!1312735 () Bool)

(assert (=> b!1422168 m!1312735))

(declare-fun m!1312737 () Bool)

(assert (=> b!1422167 m!1312737))

(assert (=> b!1422167 m!1312737))

(declare-fun m!1312739 () Bool)

(assert (=> b!1422167 m!1312739))

(assert (=> b!1422167 m!1312713))

(declare-fun m!1312741 () Bool)

(assert (=> b!1422167 m!1312741))

(declare-fun m!1312743 () Bool)

(assert (=> b!1422172 m!1312743))

(assert (=> b!1422172 m!1312743))

(declare-fun m!1312745 () Bool)

(assert (=> b!1422172 m!1312745))

(declare-fun m!1312747 () Bool)

(assert (=> b!1422173 m!1312747))

(assert (=> b!1422166 m!1312721))

(assert (=> b!1422166 m!1312721))

(declare-fun m!1312749 () Bool)

(assert (=> b!1422166 m!1312749))

(assert (=> b!1422166 m!1312749))

(assert (=> b!1422166 m!1312721))

(declare-fun m!1312751 () Bool)

(assert (=> b!1422166 m!1312751))

(assert (=> b!1422161 m!1312721))

(assert (=> b!1422161 m!1312721))

(declare-fun m!1312753 () Bool)

(assert (=> b!1422161 m!1312753))

(push 1)

