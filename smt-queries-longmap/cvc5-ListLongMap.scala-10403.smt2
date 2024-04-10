; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122580 () Bool)

(assert start!122580)

(declare-fun b!1419751 () Bool)

(declare-fun res!955185 () Bool)

(declare-fun e!803215 () Bool)

(assert (=> b!1419751 (=> (not res!955185) (not e!803215))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96945 0))(
  ( (array!96946 (arr!46790 (Array (_ BitVec 32) (_ BitVec 64))) (size!47340 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96945)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11075 0))(
  ( (MissingZero!11075 (index!46692 (_ BitVec 32))) (Found!11075 (index!46693 (_ BitVec 32))) (Intermediate!11075 (undefined!11887 Bool) (index!46694 (_ BitVec 32)) (x!128365 (_ BitVec 32))) (Undefined!11075) (MissingVacant!11075 (index!46695 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96945 (_ BitVec 32)) SeekEntryResult!11075)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419751 (= res!955185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46790 a!2831) j!81) mask!2608) (select (arr!46790 a!2831) j!81) a!2831 mask!2608) (Intermediate!11075 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419752 () Bool)

(declare-fun res!955188 () Bool)

(assert (=> b!1419752 (=> (not res!955188) (not e!803215))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1419752 (= res!955188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46790 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46790 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96946 (store (arr!46790 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47340 a!2831)) mask!2608) (Intermediate!11075 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1419753 () Bool)

(declare-fun res!955190 () Bool)

(assert (=> b!1419753 (=> (not res!955190) (not e!803215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419753 (= res!955190 (validKeyInArray!0 (select (arr!46790 a!2831) i!982)))))

(declare-fun b!1419754 () Bool)

(declare-fun res!955189 () Bool)

(assert (=> b!1419754 (=> (not res!955189) (not e!803215))))

(assert (=> b!1419754 (= res!955189 (validKeyInArray!0 (select (arr!46790 a!2831) j!81)))))

(declare-fun b!1419756 () Bool)

(assert (=> b!1419756 (= e!803215 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1419757 () Bool)

(declare-fun res!955186 () Bool)

(assert (=> b!1419757 (=> (not res!955186) (not e!803215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96945 (_ BitVec 32)) Bool)

(assert (=> b!1419757 (= res!955186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419758 () Bool)

(declare-fun res!955191 () Bool)

(assert (=> b!1419758 (=> (not res!955191) (not e!803215))))

(assert (=> b!1419758 (= res!955191 (and (= (size!47340 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47340 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47340 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419759 () Bool)

(declare-fun res!955187 () Bool)

(assert (=> b!1419759 (=> (not res!955187) (not e!803215))))

(declare-datatypes ((List!33300 0))(
  ( (Nil!33297) (Cons!33296 (h!34598 (_ BitVec 64)) (t!47994 List!33300)) )
))
(declare-fun arrayNoDuplicates!0 (array!96945 (_ BitVec 32) List!33300) Bool)

(assert (=> b!1419759 (= res!955187 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33297))))

(declare-fun b!1419755 () Bool)

(declare-fun res!955184 () Bool)

(assert (=> b!1419755 (=> (not res!955184) (not e!803215))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419755 (= res!955184 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47340 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47340 a!2831))))))

(declare-fun res!955192 () Bool)

(assert (=> start!122580 (=> (not res!955192) (not e!803215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122580 (= res!955192 (validMask!0 mask!2608))))

(assert (=> start!122580 e!803215))

(assert (=> start!122580 true))

(declare-fun array_inv!35818 (array!96945) Bool)

(assert (=> start!122580 (array_inv!35818 a!2831)))

(assert (= (and start!122580 res!955192) b!1419758))

(assert (= (and b!1419758 res!955191) b!1419753))

(assert (= (and b!1419753 res!955190) b!1419754))

(assert (= (and b!1419754 res!955189) b!1419757))

(assert (= (and b!1419757 res!955186) b!1419759))

(assert (= (and b!1419759 res!955187) b!1419755))

(assert (= (and b!1419755 res!955184) b!1419751))

(assert (= (and b!1419751 res!955185) b!1419752))

(assert (= (and b!1419752 res!955188) b!1419756))

(declare-fun m!1310205 () Bool)

(assert (=> b!1419751 m!1310205))

(assert (=> b!1419751 m!1310205))

(declare-fun m!1310207 () Bool)

(assert (=> b!1419751 m!1310207))

(assert (=> b!1419751 m!1310207))

(assert (=> b!1419751 m!1310205))

(declare-fun m!1310209 () Bool)

(assert (=> b!1419751 m!1310209))

(declare-fun m!1310211 () Bool)

(assert (=> b!1419752 m!1310211))

(declare-fun m!1310213 () Bool)

(assert (=> b!1419752 m!1310213))

(assert (=> b!1419752 m!1310213))

(declare-fun m!1310215 () Bool)

(assert (=> b!1419752 m!1310215))

(assert (=> b!1419752 m!1310215))

(assert (=> b!1419752 m!1310213))

(declare-fun m!1310217 () Bool)

(assert (=> b!1419752 m!1310217))

(declare-fun m!1310219 () Bool)

(assert (=> b!1419759 m!1310219))

(declare-fun m!1310221 () Bool)

(assert (=> b!1419753 m!1310221))

(assert (=> b!1419753 m!1310221))

(declare-fun m!1310223 () Bool)

(assert (=> b!1419753 m!1310223))

(declare-fun m!1310225 () Bool)

(assert (=> start!122580 m!1310225))

(declare-fun m!1310227 () Bool)

(assert (=> start!122580 m!1310227))

(assert (=> b!1419754 m!1310205))

(assert (=> b!1419754 m!1310205))

(declare-fun m!1310229 () Bool)

(assert (=> b!1419754 m!1310229))

(declare-fun m!1310231 () Bool)

(assert (=> b!1419757 m!1310231))

(push 1)

(assert (not b!1419751))

