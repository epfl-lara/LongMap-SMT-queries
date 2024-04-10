; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122334 () Bool)

(assert start!122334)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun e!802576 () Bool)

(declare-fun b!1418170 () Bool)

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96837 0))(
  ( (array!96838 (arr!46742 (Array (_ BitVec 32) (_ BitVec 64))) (size!47292 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96837)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418170 (= e!802576 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47292 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47292 a!2831)) (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(declare-fun b!1418172 () Bool)

(declare-fun res!953848 () Bool)

(assert (=> b!1418172 (=> (not res!953848) (not e!802576))))

(declare-datatypes ((List!33252 0))(
  ( (Nil!33249) (Cons!33248 (h!34541 (_ BitVec 64)) (t!47946 List!33252)) )
))
(declare-fun arrayNoDuplicates!0 (array!96837 (_ BitVec 32) List!33252) Bool)

(assert (=> b!1418172 (= res!953848 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33249))))

(declare-fun b!1418173 () Bool)

(declare-fun res!953847 () Bool)

(assert (=> b!1418173 (=> (not res!953847) (not e!802576))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418173 (= res!953847 (and (= (size!47292 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47292 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47292 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418174 () Bool)

(declare-fun res!953849 () Bool)

(assert (=> b!1418174 (=> (not res!953849) (not e!802576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418174 (= res!953849 (validKeyInArray!0 (select (arr!46742 a!2831) i!982)))))

(declare-fun b!1418175 () Bool)

(declare-fun res!953850 () Bool)

(assert (=> b!1418175 (=> (not res!953850) (not e!802576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96837 (_ BitVec 32)) Bool)

(assert (=> b!1418175 (= res!953850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418171 () Bool)

(declare-fun res!953846 () Bool)

(assert (=> b!1418171 (=> (not res!953846) (not e!802576))))

(assert (=> b!1418171 (= res!953846 (validKeyInArray!0 (select (arr!46742 a!2831) j!81)))))

(declare-fun res!953851 () Bool)

(assert (=> start!122334 (=> (not res!953851) (not e!802576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122334 (= res!953851 (validMask!0 mask!2608))))

(assert (=> start!122334 e!802576))

(assert (=> start!122334 true))

(declare-fun array_inv!35770 (array!96837) Bool)

(assert (=> start!122334 (array_inv!35770 a!2831)))

(assert (= (and start!122334 res!953851) b!1418173))

(assert (= (and b!1418173 res!953847) b!1418174))

(assert (= (and b!1418174 res!953849) b!1418171))

(assert (= (and b!1418171 res!953846) b!1418175))

(assert (= (and b!1418175 res!953850) b!1418172))

(assert (= (and b!1418172 res!953848) b!1418170))

(declare-fun m!1308915 () Bool)

(assert (=> b!1418171 m!1308915))

(assert (=> b!1418171 m!1308915))

(declare-fun m!1308917 () Bool)

(assert (=> b!1418171 m!1308917))

(declare-fun m!1308919 () Bool)

(assert (=> b!1418174 m!1308919))

(assert (=> b!1418174 m!1308919))

(declare-fun m!1308921 () Bool)

(assert (=> b!1418174 m!1308921))

(declare-fun m!1308923 () Bool)

(assert (=> b!1418175 m!1308923))

(declare-fun m!1308925 () Bool)

(assert (=> start!122334 m!1308925))

(declare-fun m!1308927 () Bool)

(assert (=> start!122334 m!1308927))

(declare-fun m!1308929 () Bool)

(assert (=> b!1418172 m!1308929))

(push 1)

(assert (not b!1418171))

(assert (not start!122334))

(assert (not b!1418175))

(assert (not b!1418172))

(assert (not b!1418174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152841 () Bool)

(assert (=> d!152841 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122334 d!152841))

(declare-fun d!152853 () Bool)

(assert (=> d!152853 (= (array_inv!35770 a!2831) (bvsge (size!47292 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122334 d!152853))

(declare-fun b!1418247 () Bool)

(declare-fun e!802619 () Bool)

(declare-fun e!802617 () Bool)

(assert (=> b!1418247 (= e!802619 e!802617)))

(declare-fun c!131652 () Bool)

(assert (=> b!1418247 (= c!131652 (validKeyInArray!0 (select (arr!46742 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67255 () Bool)

(declare-fun call!67258 () Bool)

(assert (=> bm!67255 (= call!67258 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418248 () Bool)

(declare-fun e!802618 () Bool)

(assert (=> b!1418248 (= e!802618 call!67258)))

(declare-fun d!152855 () Bool)

(declare-fun res!953908 () Bool)

(assert (=> d!152855 (=> res!953908 e!802619)))

(assert (=> d!152855 (= res!953908 (bvsge #b00000000000000000000000000000000 (size!47292 a!2831)))))

(assert (=> d!152855 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802619)))

(declare-fun b!1418249 () Bool)

(assert (=> b!1418249 (= e!802617 e!802618)))

(declare-fun lt!625550 () (_ BitVec 64))

(assert (=> b!1418249 (= lt!625550 (select (arr!46742 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48062 0))(
  ( (Unit!48063) )
))
(declare-fun lt!625551 () Unit!48062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96837 (_ BitVec 64) (_ BitVec 32)) Unit!48062)

(assert (=> b!1418249 (= lt!625551 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625550 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418249 (arrayContainsKey!0 a!2831 lt!625550 #b00000000000000000000000000000000)))

(declare-fun lt!625549 () Unit!48062)

(assert (=> b!1418249 (= lt!625549 lt!625551)))

(declare-fun res!953907 () Bool)

(declare-datatypes ((SeekEntryResult!11044 0))(
  ( (MissingZero!11044 (index!46568 (_ BitVec 32))) (Found!11044 (index!46569 (_ BitVec 32))) (Intermediate!11044 (undefined!11856 Bool) (index!46570 (_ BitVec 32)) (x!128191 (_ BitVec 32))) (Undefined!11044) (MissingVacant!11044 (index!46571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96837 (_ BitVec 32)) SeekEntryResult!11044)

(assert (=> b!1418249 (= res!953907 (= (seekEntryOrOpen!0 (select (arr!46742 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11044 #b00000000000000000000000000000000)))))

(assert (=> b!1418249 (=> (not res!953907) (not e!802618))))

(declare-fun b!1418250 () Bool)

(assert (=> b!1418250 (= e!802617 call!67258)))

(assert (= (and d!152855 (not res!953908)) b!1418247))

(assert (= (and b!1418247 c!131652) b!1418249))

(assert (= (and b!1418247 (not c!131652)) b!1418250))

(assert (= (and b!1418249 res!953907) b!1418248))

(assert (= (or b!1418248 b!1418250) bm!67255))

(declare-fun m!1308979 () Bool)

(assert (=> b!1418247 m!1308979))

(assert (=> b!1418247 m!1308979))

(declare-fun m!1308981 () Bool)

(assert (=> b!1418247 m!1308981))

(declare-fun m!1308983 () Bool)

(assert (=> bm!67255 m!1308983))

(assert (=> b!1418249 m!1308979))

(declare-fun m!1308985 () Bool)

(assert (=> b!1418249 m!1308985))

(declare-fun m!1308987 () Bool)

(assert (=> b!1418249 m!1308987))

(assert (=> b!1418249 m!1308979))

(declare-fun m!1308989 () Bool)

(assert (=> b!1418249 m!1308989))

(assert (=> b!1418175 d!152855))

(declare-fun d!152863 () Bool)

(assert (=> d!152863 (= (validKeyInArray!0 (select (arr!46742 a!2831) j!81)) (and (not (= (select (arr!46742 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46742 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418171 d!152863))

(declare-fun d!152865 () Bool)

(declare-fun res!953922 () Bool)

(declare-fun e!802640 () Bool)

(assert (=> d!152865 (=> res!953922 e!802640)))

(assert (=> d!152865 (= res!953922 (bvsge #b00000000000000000000000000000000 (size!47292 a!2831)))))

(assert (=> d!152865 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33249) e!802640)))

(declare-fun b!1418273 () Bool)

(declare-fun e!802637 () Bool)

(declare-fun call!67264 () Bool)

(assert (=> b!1418273 (= e!802637 call!67264)))

(declare-fun b!1418274 () Bool)

(declare-fun e!802639 () Bool)

(assert (=> b!1418274 (= e!802640 e!802639)))

(declare-fun res!953921 () Bool)

(assert (=> b!1418274 (=> (not res!953921) (not e!802639))))

(declare-fun e!802638 () Bool)

(assert (=> b!1418274 (= res!953921 (not e!802638))))

