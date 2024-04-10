; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127274 () Bool)

(assert start!127274)

(declare-fun b!1495799 () Bool)

(declare-fun res!1017478 () Bool)

(declare-fun e!837815 () Bool)

(assert (=> b!1495799 (=> (not res!1017478) (not e!837815))))

(declare-datatypes ((array!99795 0))(
  ( (array!99796 (arr!48163 (Array (_ BitVec 32) (_ BitVec 64))) (size!48713 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99795)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495799 (= res!1017478 (validKeyInArray!0 (select (arr!48163 a!2862) i!1006)))))

(declare-fun b!1495800 () Bool)

(declare-fun res!1017481 () Bool)

(assert (=> b!1495800 (=> (not res!1017481) (not e!837815))))

(declare-datatypes ((List!34664 0))(
  ( (Nil!34661) (Cons!34660 (h!36055 (_ BitVec 64)) (t!49358 List!34664)) )
))
(declare-fun arrayNoDuplicates!0 (array!99795 (_ BitVec 32) List!34664) Bool)

(assert (=> b!1495800 (= res!1017481 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34661))))

(declare-fun b!1495801 () Bool)

(declare-fun e!837809 () Bool)

(declare-fun e!837810 () Bool)

(assert (=> b!1495801 (= e!837809 e!837810)))

(declare-fun res!1017490 () Bool)

(assert (=> b!1495801 (=> res!1017490 e!837810)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!651867 () (_ BitVec 32))

(assert (=> b!1495801 (= res!1017490 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651867 #b00000000000000000000000000000000) (bvsge lt!651867 (size!48713 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495801 (= lt!651867 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1495802 () Bool)

(declare-fun res!1017493 () Bool)

(assert (=> b!1495802 (=> res!1017493 e!837810)))

(declare-datatypes ((SeekEntryResult!12403 0))(
  ( (MissingZero!12403 (index!52004 (_ BitVec 32))) (Found!12403 (index!52005 (_ BitVec 32))) (Intermediate!12403 (undefined!13215 Bool) (index!52006 (_ BitVec 32)) (x!133619 (_ BitVec 32))) (Undefined!12403) (MissingVacant!12403 (index!52007 (_ BitVec 32))) )
))
(declare-fun lt!651865 () SeekEntryResult!12403)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99795 (_ BitVec 32)) SeekEntryResult!12403)

(assert (=> b!1495802 (= res!1017493 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651867 (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!651865)))))

(declare-fun res!1017476 () Bool)

(assert (=> start!127274 (=> (not res!1017476) (not e!837815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127274 (= res!1017476 (validMask!0 mask!2687))))

(assert (=> start!127274 e!837815))

(assert (=> start!127274 true))

(declare-fun array_inv!37191 (array!99795) Bool)

(assert (=> start!127274 (array_inv!37191 a!2862)))

(declare-fun lt!651863 () array!99795)

(declare-fun e!837806 () Bool)

(declare-fun lt!651862 () (_ BitVec 64))

(declare-fun b!1495803 () Bool)

(declare-fun lt!651864 () SeekEntryResult!12403)

(assert (=> b!1495803 (= e!837806 (not (= lt!651864 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651867 lt!651862 lt!651863 mask!2687))))))

(declare-fun b!1495804 () Bool)

(declare-fun e!837808 () Bool)

(assert (=> b!1495804 (= e!837808 (not e!837809))))

(declare-fun res!1017480 () Bool)

(assert (=> b!1495804 (=> res!1017480 e!837809)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495804 (= res!1017480 (or (and (= (select (arr!48163 a!2862) index!646) (select (store (arr!48163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48163 a!2862) index!646) (select (arr!48163 a!2862) j!93))) (= (select (arr!48163 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!837814 () Bool)

(assert (=> b!1495804 e!837814))

(declare-fun res!1017491 () Bool)

(assert (=> b!1495804 (=> (not res!1017491) (not e!837814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99795 (_ BitVec 32)) Bool)

(assert (=> b!1495804 (= res!1017491 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50146 0))(
  ( (Unit!50147) )
))
(declare-fun lt!651866 () Unit!50146)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50146)

(assert (=> b!1495804 (= lt!651866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495805 () Bool)

(declare-fun res!1017477 () Bool)

(assert (=> b!1495805 (=> (not res!1017477) (not e!837815))))

(assert (=> b!1495805 (= res!1017477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495806 () Bool)

(declare-fun res!1017475 () Bool)

(assert (=> b!1495806 (=> (not res!1017475) (not e!837815))))

(assert (=> b!1495806 (= res!1017475 (and (= (size!48713 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48713 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48713 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495807 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99795 (_ BitVec 32)) SeekEntryResult!12403)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99795 (_ BitVec 32)) SeekEntryResult!12403)

(assert (=> b!1495807 (= e!837806 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651867 intermediateAfterIndex!19 lt!651862 lt!651863 mask!2687) (seekEntryOrOpen!0 lt!651862 lt!651863 mask!2687))))))

(declare-fun b!1495808 () Bool)

(declare-fun e!837811 () Bool)

(assert (=> b!1495808 (= e!837811 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651862 lt!651863 mask!2687) (seekEntryOrOpen!0 lt!651862 lt!651863 mask!2687)))))

(declare-fun b!1495809 () Bool)

(declare-fun e!837813 () Bool)

(assert (=> b!1495809 (= e!837815 e!837813)))

(declare-fun res!1017487 () Bool)

(assert (=> b!1495809 (=> (not res!1017487) (not e!837813))))

(assert (=> b!1495809 (= res!1017487 (= (select (store (arr!48163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495809 (= lt!651863 (array!99796 (store (arr!48163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48713 a!2862)))))

(declare-fun b!1495810 () Bool)

(declare-fun res!1017488 () Bool)

(assert (=> b!1495810 (=> (not res!1017488) (not e!837808))))

(assert (=> b!1495810 (= res!1017488 e!837811)))

(declare-fun c!138695 () Bool)

(assert (=> b!1495810 (= c!138695 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1495811 () Bool)

(assert (=> b!1495811 (= e!837814 (or (= (select (arr!48163 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48163 a!2862) intermediateBeforeIndex!19) (select (arr!48163 a!2862) j!93))))))

(declare-fun b!1495812 () Bool)

(declare-fun e!837807 () Bool)

(assert (=> b!1495812 (= e!837813 e!837807)))

(declare-fun res!1017485 () Bool)

(assert (=> b!1495812 (=> (not res!1017485) (not e!837807))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495812 (= res!1017485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687) (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!651865))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495812 (= lt!651865 (Intermediate!12403 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495813 () Bool)

(declare-fun res!1017479 () Bool)

(assert (=> b!1495813 (=> (not res!1017479) (not e!837815))))

(assert (=> b!1495813 (= res!1017479 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48713 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48713 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48713 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1495814 () Bool)

(assert (=> b!1495814 (= e!837807 e!837808)))

(declare-fun res!1017482 () Bool)

(assert (=> b!1495814 (=> (not res!1017482) (not e!837808))))

(assert (=> b!1495814 (= res!1017482 (= lt!651864 (Intermediate!12403 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1495814 (= lt!651864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651862 mask!2687) lt!651862 lt!651863 mask!2687))))

(assert (=> b!1495814 (= lt!651862 (select (store (arr!48163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495815 () Bool)

(declare-fun res!1017486 () Bool)

(assert (=> b!1495815 (=> (not res!1017486) (not e!837815))))

(assert (=> b!1495815 (= res!1017486 (validKeyInArray!0 (select (arr!48163 a!2862) j!93)))))

(declare-fun b!1495816 () Bool)

(assert (=> b!1495816 (= e!837810 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1495817 () Bool)

(declare-fun res!1017484 () Bool)

(assert (=> b!1495817 (=> (not res!1017484) (not e!837814))))

(assert (=> b!1495817 (= res!1017484 (= (seekEntryOrOpen!0 (select (arr!48163 a!2862) j!93) a!2862 mask!2687) (Found!12403 j!93)))))

(declare-fun b!1495818 () Bool)

(declare-fun res!1017492 () Bool)

(assert (=> b!1495818 (=> (not res!1017492) (not e!837807))))

(assert (=> b!1495818 (= res!1017492 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!651865))))

(declare-fun b!1495819 () Bool)

(assert (=> b!1495819 (= e!837811 (= lt!651864 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651862 lt!651863 mask!2687)))))

(declare-fun b!1495820 () Bool)

(declare-fun res!1017489 () Bool)

(assert (=> b!1495820 (=> (not res!1017489) (not e!837808))))

(assert (=> b!1495820 (= res!1017489 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495821 () Bool)

(declare-fun res!1017483 () Bool)

(assert (=> b!1495821 (=> res!1017483 e!837810)))

(assert (=> b!1495821 (= res!1017483 e!837806)))

(declare-fun c!138696 () Bool)

(assert (=> b!1495821 (= c!138696 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!127274 res!1017476) b!1495806))

(assert (= (and b!1495806 res!1017475) b!1495799))

(assert (= (and b!1495799 res!1017478) b!1495815))

(assert (= (and b!1495815 res!1017486) b!1495805))

(assert (= (and b!1495805 res!1017477) b!1495800))

(assert (= (and b!1495800 res!1017481) b!1495813))

(assert (= (and b!1495813 res!1017479) b!1495809))

(assert (= (and b!1495809 res!1017487) b!1495812))

(assert (= (and b!1495812 res!1017485) b!1495818))

(assert (= (and b!1495818 res!1017492) b!1495814))

(assert (= (and b!1495814 res!1017482) b!1495810))

(assert (= (and b!1495810 c!138695) b!1495819))

(assert (= (and b!1495810 (not c!138695)) b!1495808))

(assert (= (and b!1495810 res!1017488) b!1495820))

(assert (= (and b!1495820 res!1017489) b!1495804))

(assert (= (and b!1495804 res!1017491) b!1495817))

(assert (= (and b!1495817 res!1017484) b!1495811))

(assert (= (and b!1495804 (not res!1017480)) b!1495801))

(assert (= (and b!1495801 (not res!1017490)) b!1495802))

(assert (= (and b!1495802 (not res!1017493)) b!1495821))

(assert (= (and b!1495821 c!138696) b!1495803))

(assert (= (and b!1495821 (not c!138696)) b!1495807))

(assert (= (and b!1495821 (not res!1017483)) b!1495816))

(declare-fun m!1379169 () Bool)

(assert (=> b!1495805 m!1379169))

(declare-fun m!1379171 () Bool)

(assert (=> b!1495814 m!1379171))

(assert (=> b!1495814 m!1379171))

(declare-fun m!1379173 () Bool)

(assert (=> b!1495814 m!1379173))

(declare-fun m!1379175 () Bool)

(assert (=> b!1495814 m!1379175))

(declare-fun m!1379177 () Bool)

(assert (=> b!1495814 m!1379177))

(declare-fun m!1379179 () Bool)

(assert (=> b!1495811 m!1379179))

(declare-fun m!1379181 () Bool)

(assert (=> b!1495811 m!1379181))

(declare-fun m!1379183 () Bool)

(assert (=> b!1495803 m!1379183))

(declare-fun m!1379185 () Bool)

(assert (=> b!1495807 m!1379185))

(declare-fun m!1379187 () Bool)

(assert (=> b!1495807 m!1379187))

(assert (=> b!1495802 m!1379181))

(assert (=> b!1495802 m!1379181))

(declare-fun m!1379189 () Bool)

(assert (=> b!1495802 m!1379189))

(assert (=> b!1495818 m!1379181))

(assert (=> b!1495818 m!1379181))

(declare-fun m!1379191 () Bool)

(assert (=> b!1495818 m!1379191))

(assert (=> b!1495817 m!1379181))

(assert (=> b!1495817 m!1379181))

(declare-fun m!1379193 () Bool)

(assert (=> b!1495817 m!1379193))

(declare-fun m!1379195 () Bool)

(assert (=> b!1495804 m!1379195))

(assert (=> b!1495804 m!1379175))

(declare-fun m!1379197 () Bool)

(assert (=> b!1495804 m!1379197))

(declare-fun m!1379199 () Bool)

(assert (=> b!1495804 m!1379199))

(declare-fun m!1379201 () Bool)

(assert (=> b!1495804 m!1379201))

(assert (=> b!1495804 m!1379181))

(declare-fun m!1379203 () Bool)

(assert (=> b!1495800 m!1379203))

(assert (=> b!1495815 m!1379181))

(assert (=> b!1495815 m!1379181))

(declare-fun m!1379205 () Bool)

(assert (=> b!1495815 m!1379205))

(declare-fun m!1379207 () Bool)

(assert (=> b!1495799 m!1379207))

(assert (=> b!1495799 m!1379207))

(declare-fun m!1379209 () Bool)

(assert (=> b!1495799 m!1379209))

(declare-fun m!1379211 () Bool)

(assert (=> b!1495819 m!1379211))

(assert (=> b!1495812 m!1379181))

(assert (=> b!1495812 m!1379181))

(declare-fun m!1379213 () Bool)

(assert (=> b!1495812 m!1379213))

(assert (=> b!1495812 m!1379213))

(assert (=> b!1495812 m!1379181))

(declare-fun m!1379215 () Bool)

(assert (=> b!1495812 m!1379215))

(declare-fun m!1379217 () Bool)

(assert (=> b!1495808 m!1379217))

(assert (=> b!1495808 m!1379187))

(declare-fun m!1379219 () Bool)

(assert (=> start!127274 m!1379219))

(declare-fun m!1379221 () Bool)

(assert (=> start!127274 m!1379221))

(declare-fun m!1379223 () Bool)

(assert (=> b!1495801 m!1379223))

(assert (=> b!1495809 m!1379175))

(declare-fun m!1379225 () Bool)

(assert (=> b!1495809 m!1379225))

(push 1)

(assert (not b!1495815))

(assert (not b!1495819))

(assert (not b!1495803))

(assert (not b!1495808))

(assert (not b!1495812))

(assert (not b!1495807))

(assert (not b!1495805))

(assert (not b!1495799))

(assert (not b!1495801))

(assert (not b!1495804))

(assert (not start!127274))

(assert (not b!1495817))

(assert (not b!1495818))

(assert (not b!1495800))

(assert (not b!1495802))

(assert (not b!1495814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1495938 () Bool)

(declare-fun e!837888 () Bool)

(declare-fun call!68029 () Bool)

(assert (=> b!1495938 (= e!837888 call!68029)))

(declare-fun b!1495939 () Bool)

(declare-fun e!837887 () Bool)

(assert (=> b!1495939 (= e!837887 e!837888)))

(declare-fun c!138735 () Bool)

(assert (=> b!1495939 (= c!138735 (validKeyInArray!0 (select (arr!48163 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!157323 () Bool)

(declare-fun res!1017535 () Bool)

(assert (=> d!157323 (=> res!1017535 e!837887)))

(assert (=> d!157323 (= res!1017535 (bvsge #b00000000000000000000000000000000 (size!48713 a!2862)))))

(assert (=> d!157323 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837887)))

(declare-fun b!1495940 () Bool)

(declare-fun e!837889 () Bool)

(assert (=> b!1495940 (= e!837889 call!68029)))

(declare-fun b!1495941 () Bool)

(assert (=> b!1495941 (= e!837888 e!837889)))

(declare-fun lt!651922 () (_ BitVec 64))

(assert (=> b!1495941 (= lt!651922 (select (arr!48163 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651921 () Unit!50146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99795 (_ BitVec 64) (_ BitVec 32)) Unit!50146)

(assert (=> b!1495941 (= lt!651921 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651922 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1495941 (arrayContainsKey!0 a!2862 lt!651922 #b00000000000000000000000000000000)))

(declare-fun lt!651920 () Unit!50146)

(assert (=> b!1495941 (= lt!651920 lt!651921)))

(declare-fun res!1017536 () Bool)

(assert (=> b!1495941 (= res!1017536 (= (seekEntryOrOpen!0 (select (arr!48163 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12403 #b00000000000000000000000000000000)))))

(assert (=> b!1495941 (=> (not res!1017536) (not e!837889))))

(declare-fun bm!68026 () Bool)

(assert (=> bm!68026 (= call!68029 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!157323 (not res!1017535)) b!1495939))

(assert (= (and b!1495939 c!138735) b!1495941))

(assert (= (and b!1495939 (not c!138735)) b!1495938))

(assert (= (and b!1495941 res!1017536) b!1495940))

(assert (= (or b!1495940 b!1495938) bm!68026))

(declare-fun m!1379289 () Bool)

(assert (=> b!1495939 m!1379289))

(assert (=> b!1495939 m!1379289))

(declare-fun m!1379291 () Bool)

(assert (=> b!1495939 m!1379291))

(assert (=> b!1495941 m!1379289))

(declare-fun m!1379293 () Bool)

(assert (=> b!1495941 m!1379293))

(declare-fun m!1379295 () Bool)

(assert (=> b!1495941 m!1379295))

(assert (=> b!1495941 m!1379289))

(declare-fun m!1379297 () Bool)

(assert (=> b!1495941 m!1379297))

(declare-fun m!1379299 () Bool)

(assert (=> bm!68026 m!1379299))

(assert (=> b!1495805 d!157323))

(declare-fun b!1495972 () Bool)

(declare-fun e!837905 () SeekEntryResult!12403)

(declare-fun e!837907 () SeekEntryResult!12403)

(assert (=> b!1495972 (= e!837905 e!837907)))

(declare-fun c!138752 () Bool)

(declare-fun lt!651934 () (_ BitVec 64))

(assert (=> b!1495972 (= c!138752 (= lt!651934 lt!651862))))

(declare-fun b!1495973 () Bool)

(declare-fun c!138753 () Bool)

(assert (=> b!1495973 (= c!138753 (= lt!651934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837906 () SeekEntryResult!12403)

(assert (=> b!1495973 (= e!837907 e!837906)))

(declare-fun b!1495975 () Bool)

(assert (=> b!1495975 (= e!837906 (MissingVacant!12403 intermediateAfterIndex!19))))

(declare-fun b!1495976 () Bool)

(assert (=> b!1495976 (= e!837906 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651867 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!651862 lt!651863 mask!2687))))

(declare-fun b!1495977 () Bool)

(assert (=> b!1495977 (= e!837907 (Found!12403 lt!651867))))

(declare-fun d!157337 () Bool)

(declare-fun lt!651933 () SeekEntryResult!12403)

(assert (=> d!157337 (and (or (is-Undefined!12403 lt!651933) (not (is-Found!12403 lt!651933)) (and (bvsge (index!52005 lt!651933) #b00000000000000000000000000000000) (bvslt (index!52005 lt!651933) (size!48713 lt!651863)))) (or (is-Undefined!12403 lt!651933) (is-Found!12403 lt!651933) (not (is-MissingVacant!12403 lt!651933)) (not (= (index!52007 lt!651933) intermediateAfterIndex!19)) (and (bvsge (index!52007 lt!651933) #b00000000000000000000000000000000) (bvslt (index!52007 lt!651933) (size!48713 lt!651863)))) (or (is-Undefined!12403 lt!651933) (ite (is-Found!12403 lt!651933) (= (select (arr!48163 lt!651863) (index!52005 lt!651933)) lt!651862) (and (is-MissingVacant!12403 lt!651933) (= (index!52007 lt!651933) intermediateAfterIndex!19) (= (select (arr!48163 lt!651863) (index!52007 lt!651933)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157337 (= lt!651933 e!837905)))

(declare-fun c!138751 () Bool)

(assert (=> d!157337 (= c!138751 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157337 (= lt!651934 (select (arr!48163 lt!651863) lt!651867))))

(assert (=> d!157337 (validMask!0 mask!2687)))

(assert (=> d!157337 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651867 intermediateAfterIndex!19 lt!651862 lt!651863 mask!2687) lt!651933)))

(declare-fun b!1495974 () Bool)

(assert (=> b!1495974 (= e!837905 Undefined!12403)))

(assert (= (and d!157337 c!138751) b!1495974))

(assert (= (and d!157337 (not c!138751)) b!1495972))

(assert (= (and b!1495972 c!138752) b!1495977))

(assert (= (and b!1495972 (not c!138752)) b!1495973))

(assert (= (and b!1495973 c!138753) b!1495975))

(assert (= (and b!1495973 (not c!138753)) b!1495976))

(declare-fun m!1379309 () Bool)

(assert (=> b!1495976 m!1379309))

(assert (=> b!1495976 m!1379309))

(declare-fun m!1379311 () Bool)

(assert (=> b!1495976 m!1379311))

(declare-fun m!1379313 () Bool)

(assert (=> d!157337 m!1379313))

(declare-fun m!1379315 () Bool)

(assert (=> d!157337 m!1379315))

(declare-fun m!1379317 () Bool)

(assert (=> d!157337 m!1379317))

(assert (=> d!157337 m!1379219))

(assert (=> b!1495807 d!157337))

(declare-fun b!1496015 () Bool)

(declare-fun e!837929 () SeekEntryResult!12403)

(assert (=> b!1496015 (= e!837929 Undefined!12403)))

(declare-fun b!1496016 () Bool)

(declare-fun e!837930 () SeekEntryResult!12403)

(assert (=> b!1496016 (= e!837929 e!837930)))

(declare-fun lt!651952 () (_ BitVec 64))

(declare-fun lt!651953 () SeekEntryResult!12403)

(assert (=> b!1496016 (= lt!651952 (select (arr!48163 lt!651863) (index!52006 lt!651953)))))

(declare-fun c!138770 () Bool)

(assert (=> b!1496016 (= c!138770 (= lt!651952 lt!651862))))

(declare-fun b!1496017 () Bool)

(declare-fun e!837928 () SeekEntryResult!12403)

(assert (=> b!1496017 (= e!837928 (MissingZero!12403 (index!52006 lt!651953)))))

(declare-fun d!157341 () Bool)

(declare-fun lt!651951 () SeekEntryResult!12403)

(assert (=> d!157341 (and (or (is-Undefined!12403 lt!651951) (not (is-Found!12403 lt!651951)) (and (bvsge (index!52005 lt!651951) #b00000000000000000000000000000000) (bvslt (index!52005 lt!651951) (size!48713 lt!651863)))) (or (is-Undefined!12403 lt!651951) (is-Found!12403 lt!651951) (not (is-MissingZero!12403 lt!651951)) (and (bvsge (index!52004 lt!651951) #b00000000000000000000000000000000) (bvslt (index!52004 lt!651951) (size!48713 lt!651863)))) (or (is-Undefined!12403 lt!651951) (is-Found!12403 lt!651951) (is-MissingZero!12403 lt!651951) (not (is-MissingVacant!12403 lt!651951)) (and (bvsge (index!52007 lt!651951) #b00000000000000000000000000000000) (bvslt (index!52007 lt!651951) (size!48713 lt!651863)))) (or (is-Undefined!12403 lt!651951) (ite (is-Found!12403 lt!651951) (= (select (arr!48163 lt!651863) (index!52005 lt!651951)) lt!651862) (ite (is-MissingZero!12403 lt!651951) (= (select (arr!48163 lt!651863) (index!52004 lt!651951)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12403 lt!651951) (= (select (arr!48163 lt!651863) (index!52007 lt!651951)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157341 (= lt!651951 e!837929)))

(declare-fun c!138771 () Bool)

(assert (=> d!157341 (= c!138771 (and (is-Intermediate!12403 lt!651953) (undefined!13215 lt!651953)))))

(assert (=> d!157341 (= lt!651953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651862 mask!2687) lt!651862 lt!651863 mask!2687))))

(assert (=> d!157341 (validMask!0 mask!2687)))

(assert (=> d!157341 (= (seekEntryOrOpen!0 lt!651862 lt!651863 mask!2687) lt!651951)))

(declare-fun b!1496018 () Bool)

(assert (=> b!1496018 (= e!837928 (seekKeyOrZeroReturnVacant!0 (x!133619 lt!651953) (index!52006 lt!651953) (index!52006 lt!651953) lt!651862 lt!651863 mask!2687))))

(declare-fun b!1496019 () Bool)

(declare-fun c!138772 () Bool)

(assert (=> b!1496019 (= c!138772 (= lt!651952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496019 (= e!837930 e!837928)))

(declare-fun b!1496020 () Bool)

(assert (=> b!1496020 (= e!837930 (Found!12403 (index!52006 lt!651953)))))

(assert (= (and d!157341 c!138771) b!1496015))

(assert (= (and d!157341 (not c!138771)) b!1496016))

(assert (= (and b!1496016 c!138770) b!1496020))

(assert (= (and b!1496016 (not c!138770)) b!1496019))

(assert (= (and b!1496019 c!138772) b!1496017))

(assert (= (and b!1496019 (not c!138772)) b!1496018))

(declare-fun m!1379347 () Bool)

(assert (=> b!1496016 m!1379347))

(declare-fun m!1379349 () Bool)

(assert (=> d!157341 m!1379349))

(assert (=> d!157341 m!1379219))

(assert (=> d!157341 m!1379171))

(assert (=> d!157341 m!1379173))

(declare-fun m!1379351 () Bool)

(assert (=> d!157341 m!1379351))

(assert (=> d!157341 m!1379171))

(declare-fun m!1379353 () Bool)

(assert (=> d!157341 m!1379353))

(declare-fun m!1379355 () Bool)

(assert (=> b!1496018 m!1379355))

(assert (=> b!1495807 d!157341))

(declare-fun b!1496039 () Bool)

(declare-fun lt!651959 () SeekEntryResult!12403)

(assert (=> b!1496039 (and (bvsge (index!52006 lt!651959) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651959) (size!48713 a!2862)))))

(declare-fun e!837942 () Bool)

(assert (=> b!1496039 (= e!837942 (= (select (arr!48163 a!2862) (index!52006 lt!651959)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496041 () Bool)

(declare-fun e!837944 () Bool)

(declare-fun e!837941 () Bool)

(assert (=> b!1496041 (= e!837944 e!837941)))

(declare-fun res!1017550 () Bool)

(assert (=> b!1496041 (= res!1017550 (and (is-Intermediate!12403 lt!651959) (not (undefined!13215 lt!651959)) (bvslt (x!133619 lt!651959) #b01111111111111111111111111111110) (bvsge (x!133619 lt!651959) #b00000000000000000000000000000000) (bvsge (x!133619 lt!651959) x!665)))))

(assert (=> b!1496041 (=> (not res!1017550) (not e!837941))))

(declare-fun b!1496042 () Bool)

(assert (=> b!1496042 (= e!837944 (bvsge (x!133619 lt!651959) #b01111111111111111111111111111110))))

(declare-fun b!1496043 () Bool)

(declare-fun e!837945 () SeekEntryResult!12403)

(assert (=> b!1496043 (= e!837945 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48163 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1496044 () Bool)

(assert (=> b!1496044 (and (bvsge (index!52006 lt!651959) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651959) (size!48713 a!2862)))))

(declare-fun res!1017549 () Bool)

(assert (=> b!1496044 (= res!1017549 (= (select (arr!48163 a!2862) (index!52006 lt!651959)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496044 (=> res!1017549 e!837942)))

(declare-fun b!1496045 () Bool)

(declare-fun e!837943 () SeekEntryResult!12403)

(assert (=> b!1496045 (= e!837943 e!837945)))

(declare-fun lt!651958 () (_ BitVec 64))

(declare-fun c!138781 () Bool)

(assert (=> b!1496045 (= c!138781 (or (= lt!651958 (select (arr!48163 a!2862) j!93)) (= (bvadd lt!651958 lt!651958) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496040 () Bool)

(assert (=> b!1496040 (and (bvsge (index!52006 lt!651959) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651959) (size!48713 a!2862)))))

(declare-fun res!1017548 () Bool)

(assert (=> b!1496040 (= res!1017548 (= (select (arr!48163 a!2862) (index!52006 lt!651959)) (select (arr!48163 a!2862) j!93)))))

(assert (=> b!1496040 (=> res!1017548 e!837942)))

(assert (=> b!1496040 (= e!837941 e!837942)))

(declare-fun d!157353 () Bool)

(assert (=> d!157353 e!837944))

(declare-fun c!138780 () Bool)

(assert (=> d!157353 (= c!138780 (and (is-Intermediate!12403 lt!651959) (undefined!13215 lt!651959)))))

(assert (=> d!157353 (= lt!651959 e!837943)))

(declare-fun c!138779 () Bool)

(assert (=> d!157353 (= c!138779 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157353 (= lt!651958 (select (arr!48163 a!2862) index!646))))

(assert (=> d!157353 (validMask!0 mask!2687)))

(assert (=> d!157353 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!651959)))

(declare-fun b!1496046 () Bool)

(assert (=> b!1496046 (= e!837943 (Intermediate!12403 true index!646 x!665))))

(declare-fun b!1496047 () Bool)

(assert (=> b!1496047 (= e!837945 (Intermediate!12403 false index!646 x!665))))

(assert (= (and d!157353 c!138779) b!1496046))

(assert (= (and d!157353 (not c!138779)) b!1496045))

(assert (= (and b!1496045 c!138781) b!1496047))

(assert (= (and b!1496045 (not c!138781)) b!1496043))

(assert (= (and d!157353 c!138780) b!1496042))

(assert (= (and d!157353 (not c!138780)) b!1496041))

(assert (= (and b!1496041 res!1017550) b!1496040))

(assert (= (and b!1496040 (not res!1017548)) b!1496044))

(assert (= (and b!1496044 (not res!1017549)) b!1496039))

(assert (=> b!1496043 m!1379223))

(assert (=> b!1496043 m!1379223))

(assert (=> b!1496043 m!1379181))

(declare-fun m!1379357 () Bool)

(assert (=> b!1496043 m!1379357))

(declare-fun m!1379359 () Bool)

(assert (=> b!1496039 m!1379359))

(assert (=> b!1496044 m!1379359))

(assert (=> b!1496040 m!1379359))

(assert (=> d!157353 m!1379199))

(assert (=> d!157353 m!1379219))

(assert (=> b!1495818 d!157353))

(declare-fun b!1496048 () Bool)

(declare-fun e!837947 () SeekEntryResult!12403)

(assert (=> b!1496048 (= e!837947 Undefined!12403)))

(declare-fun b!1496049 () Bool)

(declare-fun e!837948 () SeekEntryResult!12403)

(assert (=> b!1496049 (= e!837947 e!837948)))

(declare-fun lt!651961 () (_ BitVec 64))

(declare-fun lt!651962 () SeekEntryResult!12403)

(assert (=> b!1496049 (= lt!651961 (select (arr!48163 a!2862) (index!52006 lt!651962)))))

(declare-fun c!138782 () Bool)

(assert (=> b!1496049 (= c!138782 (= lt!651961 (select (arr!48163 a!2862) j!93)))))

(declare-fun b!1496050 () Bool)

(declare-fun e!837946 () SeekEntryResult!12403)

(assert (=> b!1496050 (= e!837946 (MissingZero!12403 (index!52006 lt!651962)))))

(declare-fun d!157355 () Bool)

(declare-fun lt!651960 () SeekEntryResult!12403)

(assert (=> d!157355 (and (or (is-Undefined!12403 lt!651960) (not (is-Found!12403 lt!651960)) (and (bvsge (index!52005 lt!651960) #b00000000000000000000000000000000) (bvslt (index!52005 lt!651960) (size!48713 a!2862)))) (or (is-Undefined!12403 lt!651960) (is-Found!12403 lt!651960) (not (is-MissingZero!12403 lt!651960)) (and (bvsge (index!52004 lt!651960) #b00000000000000000000000000000000) (bvslt (index!52004 lt!651960) (size!48713 a!2862)))) (or (is-Undefined!12403 lt!651960) (is-Found!12403 lt!651960) (is-MissingZero!12403 lt!651960) (not (is-MissingVacant!12403 lt!651960)) (and (bvsge (index!52007 lt!651960) #b00000000000000000000000000000000) (bvslt (index!52007 lt!651960) (size!48713 a!2862)))) (or (is-Undefined!12403 lt!651960) (ite (is-Found!12403 lt!651960) (= (select (arr!48163 a!2862) (index!52005 lt!651960)) (select (arr!48163 a!2862) j!93)) (ite (is-MissingZero!12403 lt!651960) (= (select (arr!48163 a!2862) (index!52004 lt!651960)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12403 lt!651960) (= (select (arr!48163 a!2862) (index!52007 lt!651960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157355 (= lt!651960 e!837947)))

(declare-fun c!138783 () Bool)

(assert (=> d!157355 (= c!138783 (and (is-Intermediate!12403 lt!651962) (undefined!13215 lt!651962)))))

(assert (=> d!157355 (= lt!651962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687) (select (arr!48163 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157355 (validMask!0 mask!2687)))

(assert (=> d!157355 (= (seekEntryOrOpen!0 (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!651960)))

(declare-fun b!1496051 () Bool)

(assert (=> b!1496051 (= e!837946 (seekKeyOrZeroReturnVacant!0 (x!133619 lt!651962) (index!52006 lt!651962) (index!52006 lt!651962) (select (arr!48163 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1496052 () Bool)

(declare-fun c!138784 () Bool)

(assert (=> b!1496052 (= c!138784 (= lt!651961 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496052 (= e!837948 e!837946)))

(declare-fun b!1496053 () Bool)

(assert (=> b!1496053 (= e!837948 (Found!12403 (index!52006 lt!651962)))))

(assert (= (and d!157355 c!138783) b!1496048))

(assert (= (and d!157355 (not c!138783)) b!1496049))

(assert (= (and b!1496049 c!138782) b!1496053))

(assert (= (and b!1496049 (not c!138782)) b!1496052))

(assert (= (and b!1496052 c!138784) b!1496050))

(assert (= (and b!1496052 (not c!138784)) b!1496051))

(declare-fun m!1379361 () Bool)

(assert (=> b!1496049 m!1379361))

(declare-fun m!1379363 () Bool)

(assert (=> d!157355 m!1379363))

(assert (=> d!157355 m!1379219))

(assert (=> d!157355 m!1379213))

(assert (=> d!157355 m!1379181))

(assert (=> d!157355 m!1379215))

(declare-fun m!1379365 () Bool)

(assert (=> d!157355 m!1379365))

(assert (=> d!157355 m!1379181))

(assert (=> d!157355 m!1379213))

(declare-fun m!1379367 () Bool)

(assert (=> d!157355 m!1379367))

(assert (=> b!1496051 m!1379181))

(declare-fun m!1379369 () Bool)

(assert (=> b!1496051 m!1379369))

(assert (=> b!1495817 d!157355))

(declare-fun b!1496054 () Bool)

(declare-fun lt!651964 () SeekEntryResult!12403)

(assert (=> b!1496054 (and (bvsge (index!52006 lt!651964) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651964) (size!48713 lt!651863)))))

(declare-fun e!837950 () Bool)

(assert (=> b!1496054 (= e!837950 (= (select (arr!48163 lt!651863) (index!52006 lt!651964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496056 () Bool)

(declare-fun e!837952 () Bool)

(declare-fun e!837949 () Bool)

(assert (=> b!1496056 (= e!837952 e!837949)))

(declare-fun res!1017553 () Bool)

(assert (=> b!1496056 (= res!1017553 (and (is-Intermediate!12403 lt!651964) (not (undefined!13215 lt!651964)) (bvslt (x!133619 lt!651964) #b01111111111111111111111111111110) (bvsge (x!133619 lt!651964) #b00000000000000000000000000000000) (bvsge (x!133619 lt!651964) x!665)))))

(assert (=> b!1496056 (=> (not res!1017553) (not e!837949))))

(declare-fun b!1496057 () Bool)

(assert (=> b!1496057 (= e!837952 (bvsge (x!133619 lt!651964) #b01111111111111111111111111111110))))

(declare-fun b!1496058 () Bool)

(declare-fun e!837953 () SeekEntryResult!12403)

(assert (=> b!1496058 (= e!837953 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651862 lt!651863 mask!2687))))

(declare-fun b!1496059 () Bool)

(assert (=> b!1496059 (and (bvsge (index!52006 lt!651964) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651964) (size!48713 lt!651863)))))

(declare-fun res!1017552 () Bool)

(assert (=> b!1496059 (= res!1017552 (= (select (arr!48163 lt!651863) (index!52006 lt!651964)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496059 (=> res!1017552 e!837950)))

(declare-fun b!1496060 () Bool)

(declare-fun e!837951 () SeekEntryResult!12403)

(assert (=> b!1496060 (= e!837951 e!837953)))

(declare-fun c!138787 () Bool)

(declare-fun lt!651963 () (_ BitVec 64))

(assert (=> b!1496060 (= c!138787 (or (= lt!651963 lt!651862) (= (bvadd lt!651963 lt!651963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496055 () Bool)

(assert (=> b!1496055 (and (bvsge (index!52006 lt!651964) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651964) (size!48713 lt!651863)))))

(declare-fun res!1017551 () Bool)

(assert (=> b!1496055 (= res!1017551 (= (select (arr!48163 lt!651863) (index!52006 lt!651964)) lt!651862))))

(assert (=> b!1496055 (=> res!1017551 e!837950)))

(assert (=> b!1496055 (= e!837949 e!837950)))

(declare-fun d!157357 () Bool)

(assert (=> d!157357 e!837952))

(declare-fun c!138786 () Bool)

(assert (=> d!157357 (= c!138786 (and (is-Intermediate!12403 lt!651964) (undefined!13215 lt!651964)))))

(assert (=> d!157357 (= lt!651964 e!837951)))

(declare-fun c!138785 () Bool)

(assert (=> d!157357 (= c!138785 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157357 (= lt!651963 (select (arr!48163 lt!651863) index!646))))

(assert (=> d!157357 (validMask!0 mask!2687)))

(assert (=> d!157357 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651862 lt!651863 mask!2687) lt!651964)))

(declare-fun b!1496061 () Bool)

(assert (=> b!1496061 (= e!837951 (Intermediate!12403 true index!646 x!665))))

(declare-fun b!1496062 () Bool)

(assert (=> b!1496062 (= e!837953 (Intermediate!12403 false index!646 x!665))))

(assert (= (and d!157357 c!138785) b!1496061))

(assert (= (and d!157357 (not c!138785)) b!1496060))

(assert (= (and b!1496060 c!138787) b!1496062))

(assert (= (and b!1496060 (not c!138787)) b!1496058))

(assert (= (and d!157357 c!138786) b!1496057))

(assert (= (and d!157357 (not c!138786)) b!1496056))

(assert (= (and b!1496056 res!1017553) b!1496055))

(assert (= (and b!1496055 (not res!1017551)) b!1496059))

(assert (= (and b!1496059 (not res!1017552)) b!1496054))

(assert (=> b!1496058 m!1379223))

(assert (=> b!1496058 m!1379223))

(declare-fun m!1379371 () Bool)

(assert (=> b!1496058 m!1379371))

(declare-fun m!1379373 () Bool)

(assert (=> b!1496054 m!1379373))

(assert (=> b!1496059 m!1379373))

(assert (=> b!1496055 m!1379373))

(declare-fun m!1379375 () Bool)

(assert (=> d!157357 m!1379375))

(assert (=> d!157357 m!1379219))

(assert (=> b!1495819 d!157357))

(declare-fun b!1496063 () Bool)

(declare-fun e!837954 () SeekEntryResult!12403)

(declare-fun e!837956 () SeekEntryResult!12403)

(assert (=> b!1496063 (= e!837954 e!837956)))

(declare-fun c!138789 () Bool)

(declare-fun lt!651966 () (_ BitVec 64))

(assert (=> b!1496063 (= c!138789 (= lt!651966 lt!651862))))

(declare-fun b!1496064 () Bool)

(declare-fun c!138790 () Bool)

(assert (=> b!1496064 (= c!138790 (= lt!651966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837955 () SeekEntryResult!12403)

(assert (=> b!1496064 (= e!837956 e!837955)))

(declare-fun b!1496066 () Bool)

(assert (=> b!1496066 (= e!837955 (MissingVacant!12403 intermediateAfterIndex!19))))

(declare-fun b!1496067 () Bool)

(assert (=> b!1496067 (= e!837955 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651862 lt!651863 mask!2687))))

(declare-fun b!1496068 () Bool)

(assert (=> b!1496068 (= e!837956 (Found!12403 index!646))))

(declare-fun lt!651965 () SeekEntryResult!12403)

(declare-fun d!157359 () Bool)

(assert (=> d!157359 (and (or (is-Undefined!12403 lt!651965) (not (is-Found!12403 lt!651965)) (and (bvsge (index!52005 lt!651965) #b00000000000000000000000000000000) (bvslt (index!52005 lt!651965) (size!48713 lt!651863)))) (or (is-Undefined!12403 lt!651965) (is-Found!12403 lt!651965) (not (is-MissingVacant!12403 lt!651965)) (not (= (index!52007 lt!651965) intermediateAfterIndex!19)) (and (bvsge (index!52007 lt!651965) #b00000000000000000000000000000000) (bvslt (index!52007 lt!651965) (size!48713 lt!651863)))) (or (is-Undefined!12403 lt!651965) (ite (is-Found!12403 lt!651965) (= (select (arr!48163 lt!651863) (index!52005 lt!651965)) lt!651862) (and (is-MissingVacant!12403 lt!651965) (= (index!52007 lt!651965) intermediateAfterIndex!19) (= (select (arr!48163 lt!651863) (index!52007 lt!651965)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157359 (= lt!651965 e!837954)))

(declare-fun c!138788 () Bool)

(assert (=> d!157359 (= c!138788 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157359 (= lt!651966 (select (arr!48163 lt!651863) index!646))))

(assert (=> d!157359 (validMask!0 mask!2687)))

(assert (=> d!157359 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651862 lt!651863 mask!2687) lt!651965)))

(declare-fun b!1496065 () Bool)

(assert (=> b!1496065 (= e!837954 Undefined!12403)))

(assert (= (and d!157359 c!138788) b!1496065))

(assert (= (and d!157359 (not c!138788)) b!1496063))

(assert (= (and b!1496063 c!138789) b!1496068))

(assert (= (and b!1496063 (not c!138789)) b!1496064))

(assert (= (and b!1496064 c!138790) b!1496066))

(assert (= (and b!1496064 (not c!138790)) b!1496067))

(assert (=> b!1496067 m!1379223))

(assert (=> b!1496067 m!1379223))

(declare-fun m!1379377 () Bool)

(assert (=> b!1496067 m!1379377))

(declare-fun m!1379379 () Bool)

(assert (=> d!157359 m!1379379))

(declare-fun m!1379381 () Bool)

(assert (=> d!157359 m!1379381))

(assert (=> d!157359 m!1379375))

(assert (=> d!157359 m!1379219))

(assert (=> b!1495808 d!157359))

(assert (=> b!1495808 d!157341))

(declare-fun d!157361 () Bool)

(assert (=> d!157361 (= (validKeyInArray!0 (select (arr!48163 a!2862) i!1006)) (and (not (= (select (arr!48163 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48163 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495799 d!157361))

(declare-fun b!1496079 () Bool)

(declare-fun e!837966 () Bool)

(declare-fun contains!9936 (List!34664 (_ BitVec 64)) Bool)

(assert (=> b!1496079 (= e!837966 (contains!9936 Nil!34661 (select (arr!48163 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1496080 () Bool)

(declare-fun e!837968 () Bool)

(declare-fun e!837965 () Bool)

(assert (=> b!1496080 (= e!837968 e!837965)))

(declare-fun res!1017561 () Bool)

(assert (=> b!1496080 (=> (not res!1017561) (not e!837965))))

(assert (=> b!1496080 (= res!1017561 (not e!837966))))

(declare-fun res!1017560 () Bool)

(assert (=> b!1496080 (=> (not res!1017560) (not e!837966))))

(assert (=> b!1496080 (= res!1017560 (validKeyInArray!0 (select (arr!48163 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1496081 () Bool)

(declare-fun e!837967 () Bool)

(declare-fun call!68033 () Bool)

(assert (=> b!1496081 (= e!837967 call!68033)))

(declare-fun d!157363 () Bool)

(declare-fun res!1017562 () Bool)

(assert (=> d!157363 (=> res!1017562 e!837968)))

(assert (=> d!157363 (= res!1017562 (bvsge #b00000000000000000000000000000000 (size!48713 a!2862)))))

(assert (=> d!157363 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34661) e!837968)))

(declare-fun b!1496082 () Bool)

(assert (=> b!1496082 (= e!837965 e!837967)))

(declare-fun c!138793 () Bool)

(assert (=> b!1496082 (= c!138793 (validKeyInArray!0 (select (arr!48163 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!68030 () Bool)

(assert (=> bm!68030 (= call!68033 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138793 (Cons!34660 (select (arr!48163 a!2862) #b00000000000000000000000000000000) Nil!34661) Nil!34661)))))

(declare-fun b!1496083 () Bool)

(assert (=> b!1496083 (= e!837967 call!68033)))

(assert (= (and d!157363 (not res!1017562)) b!1496080))

(assert (= (and b!1496080 res!1017560) b!1496079))

(assert (= (and b!1496080 res!1017561) b!1496082))

(assert (= (and b!1496082 c!138793) b!1496081))

(assert (= (and b!1496082 (not c!138793)) b!1496083))

(assert (= (or b!1496081 b!1496083) bm!68030))

(assert (=> b!1496079 m!1379289))

(assert (=> b!1496079 m!1379289))

(declare-fun m!1379383 () Bool)

(assert (=> b!1496079 m!1379383))

(assert (=> b!1496080 m!1379289))

(assert (=> b!1496080 m!1379289))

(assert (=> b!1496080 m!1379291))

(assert (=> b!1496082 m!1379289))

(assert (=> b!1496082 m!1379289))

(assert (=> b!1496082 m!1379291))

(assert (=> bm!68030 m!1379289))

(declare-fun m!1379385 () Bool)

(assert (=> bm!68030 m!1379385))

(assert (=> b!1495800 d!157363))

(declare-fun b!1496084 () Bool)

(declare-fun lt!651968 () SeekEntryResult!12403)

(assert (=> b!1496084 (and (bvsge (index!52006 lt!651968) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651968) (size!48713 a!2862)))))

(declare-fun e!837970 () Bool)

(assert (=> b!1496084 (= e!837970 (= (select (arr!48163 a!2862) (index!52006 lt!651968)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496086 () Bool)

(declare-fun e!837972 () Bool)

(declare-fun e!837969 () Bool)

(assert (=> b!1496086 (= e!837972 e!837969)))

(declare-fun res!1017565 () Bool)

(assert (=> b!1496086 (= res!1017565 (and (is-Intermediate!12403 lt!651968) (not (undefined!13215 lt!651968)) (bvslt (x!133619 lt!651968) #b01111111111111111111111111111110) (bvsge (x!133619 lt!651968) #b00000000000000000000000000000000) (bvsge (x!133619 lt!651968) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1496086 (=> (not res!1017565) (not e!837969))))

(declare-fun b!1496087 () Bool)

(assert (=> b!1496087 (= e!837972 (bvsge (x!133619 lt!651968) #b01111111111111111111111111111110))))

(declare-fun e!837973 () SeekEntryResult!12403)

(declare-fun b!1496088 () Bool)

(assert (=> b!1496088 (= e!837973 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651867 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48163 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1496089 () Bool)

(assert (=> b!1496089 (and (bvsge (index!52006 lt!651968) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651968) (size!48713 a!2862)))))

(declare-fun res!1017564 () Bool)

(assert (=> b!1496089 (= res!1017564 (= (select (arr!48163 a!2862) (index!52006 lt!651968)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496089 (=> res!1017564 e!837970)))

(declare-fun b!1496090 () Bool)

(declare-fun e!837971 () SeekEntryResult!12403)

(assert (=> b!1496090 (= e!837971 e!837973)))

(declare-fun lt!651967 () (_ BitVec 64))

(declare-fun c!138796 () Bool)

(assert (=> b!1496090 (= c!138796 (or (= lt!651967 (select (arr!48163 a!2862) j!93)) (= (bvadd lt!651967 lt!651967) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496085 () Bool)

(assert (=> b!1496085 (and (bvsge (index!52006 lt!651968) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651968) (size!48713 a!2862)))))

(declare-fun res!1017563 () Bool)

(assert (=> b!1496085 (= res!1017563 (= (select (arr!48163 a!2862) (index!52006 lt!651968)) (select (arr!48163 a!2862) j!93)))))

(assert (=> b!1496085 (=> res!1017563 e!837970)))

(assert (=> b!1496085 (= e!837969 e!837970)))

(declare-fun d!157365 () Bool)

(assert (=> d!157365 e!837972))

(declare-fun c!138795 () Bool)

(assert (=> d!157365 (= c!138795 (and (is-Intermediate!12403 lt!651968) (undefined!13215 lt!651968)))))

(assert (=> d!157365 (= lt!651968 e!837971)))

(declare-fun c!138794 () Bool)

(assert (=> d!157365 (= c!138794 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157365 (= lt!651967 (select (arr!48163 a!2862) lt!651867))))

(assert (=> d!157365 (validMask!0 mask!2687)))

(assert (=> d!157365 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651867 (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!651968)))

(declare-fun b!1496091 () Bool)

(assert (=> b!1496091 (= e!837971 (Intermediate!12403 true lt!651867 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1496092 () Bool)

(assert (=> b!1496092 (= e!837973 (Intermediate!12403 false lt!651867 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!157365 c!138794) b!1496091))

(assert (= (and d!157365 (not c!138794)) b!1496090))

(assert (= (and b!1496090 c!138796) b!1496092))

(assert (= (and b!1496090 (not c!138796)) b!1496088))

(assert (= (and d!157365 c!138795) b!1496087))

(assert (= (and d!157365 (not c!138795)) b!1496086))

(assert (= (and b!1496086 res!1017565) b!1496085))

(assert (= (and b!1496085 (not res!1017563)) b!1496089))

(assert (= (and b!1496089 (not res!1017564)) b!1496084))

(assert (=> b!1496088 m!1379309))

(assert (=> b!1496088 m!1379309))

(assert (=> b!1496088 m!1379181))

(declare-fun m!1379387 () Bool)

(assert (=> b!1496088 m!1379387))

(declare-fun m!1379389 () Bool)

(assert (=> b!1496084 m!1379389))

(assert (=> b!1496089 m!1379389))

(assert (=> b!1496085 m!1379389))

(declare-fun m!1379391 () Bool)

(assert (=> d!157365 m!1379391))

(assert (=> d!157365 m!1379219))

(assert (=> b!1495802 d!157365))

(declare-fun d!157367 () Bool)

(declare-fun lt!651971 () (_ BitVec 32))

(assert (=> d!157367 (and (bvsge lt!651971 #b00000000000000000000000000000000) (bvslt lt!651971 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157367 (= lt!651971 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157367 (validMask!0 mask!2687)))

(assert (=> d!157367 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651971)))

(declare-fun bs!42922 () Bool)

(assert (= bs!42922 d!157367))

(declare-fun m!1379393 () Bool)

(assert (=> bs!42922 m!1379393))

(assert (=> bs!42922 m!1379219))

(assert (=> b!1495801 d!157367))

(declare-fun d!157369 () Bool)

(assert (=> d!157369 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127274 d!157369))

(declare-fun d!157371 () Bool)

(assert (=> d!157371 (= (array_inv!37191 a!2862) (bvsge (size!48713 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127274 d!157371))

(declare-fun b!1496093 () Bool)

(declare-fun lt!651973 () SeekEntryResult!12403)

(assert (=> b!1496093 (and (bvsge (index!52006 lt!651973) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651973) (size!48713 a!2862)))))

(declare-fun e!837975 () Bool)

(assert (=> b!1496093 (= e!837975 (= (select (arr!48163 a!2862) (index!52006 lt!651973)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496095 () Bool)

(declare-fun e!837977 () Bool)

(declare-fun e!837974 () Bool)

(assert (=> b!1496095 (= e!837977 e!837974)))

(declare-fun res!1017568 () Bool)

(assert (=> b!1496095 (= res!1017568 (and (is-Intermediate!12403 lt!651973) (not (undefined!13215 lt!651973)) (bvslt (x!133619 lt!651973) #b01111111111111111111111111111110) (bvsge (x!133619 lt!651973) #b00000000000000000000000000000000) (bvsge (x!133619 lt!651973) #b00000000000000000000000000000000)))))

(assert (=> b!1496095 (=> (not res!1017568) (not e!837974))))

(declare-fun b!1496096 () Bool)

(assert (=> b!1496096 (= e!837977 (bvsge (x!133619 lt!651973) #b01111111111111111111111111111110))))

(declare-fun e!837978 () SeekEntryResult!12403)

(declare-fun b!1496097 () Bool)

(assert (=> b!1496097 (= e!837978 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48163 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1496098 () Bool)

(assert (=> b!1496098 (and (bvsge (index!52006 lt!651973) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651973) (size!48713 a!2862)))))

(declare-fun res!1017567 () Bool)

(assert (=> b!1496098 (= res!1017567 (= (select (arr!48163 a!2862) (index!52006 lt!651973)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496098 (=> res!1017567 e!837975)))

(declare-fun b!1496099 () Bool)

(declare-fun e!837976 () SeekEntryResult!12403)

(assert (=> b!1496099 (= e!837976 e!837978)))

(declare-fun lt!651972 () (_ BitVec 64))

(declare-fun c!138799 () Bool)

(assert (=> b!1496099 (= c!138799 (or (= lt!651972 (select (arr!48163 a!2862) j!93)) (= (bvadd lt!651972 lt!651972) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496094 () Bool)

(assert (=> b!1496094 (and (bvsge (index!52006 lt!651973) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651973) (size!48713 a!2862)))))

(declare-fun res!1017566 () Bool)

(assert (=> b!1496094 (= res!1017566 (= (select (arr!48163 a!2862) (index!52006 lt!651973)) (select (arr!48163 a!2862) j!93)))))

(assert (=> b!1496094 (=> res!1017566 e!837975)))

(assert (=> b!1496094 (= e!837974 e!837975)))

(declare-fun d!157373 () Bool)

(assert (=> d!157373 e!837977))

(declare-fun c!138798 () Bool)

(assert (=> d!157373 (= c!138798 (and (is-Intermediate!12403 lt!651973) (undefined!13215 lt!651973)))))

(assert (=> d!157373 (= lt!651973 e!837976)))

(declare-fun c!138797 () Bool)

(assert (=> d!157373 (= c!138797 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157373 (= lt!651972 (select (arr!48163 a!2862) (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687)))))

(assert (=> d!157373 (validMask!0 mask!2687)))

(assert (=> d!157373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687) (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!651973)))

(declare-fun b!1496100 () Bool)

(assert (=> b!1496100 (= e!837976 (Intermediate!12403 true (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1496101 () Bool)

(assert (=> b!1496101 (= e!837978 (Intermediate!12403 false (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157373 c!138797) b!1496100))

(assert (= (and d!157373 (not c!138797)) b!1496099))

(assert (= (and b!1496099 c!138799) b!1496101))

(assert (= (and b!1496099 (not c!138799)) b!1496097))

(assert (= (and d!157373 c!138798) b!1496096))

(assert (= (and d!157373 (not c!138798)) b!1496095))

(assert (= (and b!1496095 res!1017568) b!1496094))

(assert (= (and b!1496094 (not res!1017566)) b!1496098))

(assert (= (and b!1496098 (not res!1017567)) b!1496093))

(assert (=> b!1496097 m!1379213))

(declare-fun m!1379395 () Bool)

(assert (=> b!1496097 m!1379395))

(assert (=> b!1496097 m!1379395))

(assert (=> b!1496097 m!1379181))

(declare-fun m!1379397 () Bool)

(assert (=> b!1496097 m!1379397))

(declare-fun m!1379399 () Bool)

(assert (=> b!1496093 m!1379399))

(assert (=> b!1496098 m!1379399))

(assert (=> b!1496094 m!1379399))

(assert (=> d!157373 m!1379213))

(declare-fun m!1379401 () Bool)

(assert (=> d!157373 m!1379401))

(assert (=> d!157373 m!1379219))

(assert (=> b!1495812 d!157373))

(declare-fun d!157375 () Bool)

(declare-fun lt!651979 () (_ BitVec 32))

(declare-fun lt!651978 () (_ BitVec 32))

(assert (=> d!157375 (= lt!651979 (bvmul (bvxor lt!651978 (bvlshr lt!651978 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157375 (= lt!651978 ((_ extract 31 0) (bvand (bvxor (select (arr!48163 a!2862) j!93) (bvlshr (select (arr!48163 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157375 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017569 (let ((h!36057 ((_ extract 31 0) (bvand (bvxor (select (arr!48163 a!2862) j!93) (bvlshr (select (arr!48163 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133627 (bvmul (bvxor h!36057 (bvlshr h!36057 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133627 (bvlshr x!133627 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017569 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017569 #b00000000000000000000000000000000))))))

(assert (=> d!157375 (= (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687) (bvand (bvxor lt!651979 (bvlshr lt!651979 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495812 d!157375))

(declare-fun b!1496102 () Bool)

(declare-fun lt!651981 () SeekEntryResult!12403)

(assert (=> b!1496102 (and (bvsge (index!52006 lt!651981) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651981) (size!48713 lt!651863)))))

(declare-fun e!837980 () Bool)

(assert (=> b!1496102 (= e!837980 (= (select (arr!48163 lt!651863) (index!52006 lt!651981)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496104 () Bool)

(declare-fun e!837982 () Bool)

(declare-fun e!837979 () Bool)

(assert (=> b!1496104 (= e!837982 e!837979)))

(declare-fun res!1017572 () Bool)

(assert (=> b!1496104 (= res!1017572 (and (is-Intermediate!12403 lt!651981) (not (undefined!13215 lt!651981)) (bvslt (x!133619 lt!651981) #b01111111111111111111111111111110) (bvsge (x!133619 lt!651981) #b00000000000000000000000000000000) (bvsge (x!133619 lt!651981) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1496104 (=> (not res!1017572) (not e!837979))))

(declare-fun b!1496105 () Bool)

(assert (=> b!1496105 (= e!837982 (bvsge (x!133619 lt!651981) #b01111111111111111111111111111110))))

(declare-fun b!1496106 () Bool)

(declare-fun e!837983 () SeekEntryResult!12403)

(assert (=> b!1496106 (= e!837983 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651867 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!651862 lt!651863 mask!2687))))

(declare-fun b!1496107 () Bool)

(assert (=> b!1496107 (and (bvsge (index!52006 lt!651981) #b00000000000000000000000000000000) (bvslt (index!52006 lt!651981) (size!48713 lt!651863)))))

(declare-fun res!1017571 () Bool)

(assert (=> b!1496107 (= res!1017571 (= (select (arr!48163 lt!651863) (index!52006 lt!651981)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496107 (=> res!1017571 e!837980)))

