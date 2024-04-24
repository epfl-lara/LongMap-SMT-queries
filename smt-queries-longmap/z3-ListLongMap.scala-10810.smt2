; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126786 () Bool)

(assert start!126786)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!648184 () (_ BitVec 64))

(declare-fun b!1485500 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12201 0))(
  ( (MissingZero!12201 (index!51196 (_ BitVec 32))) (Found!12201 (index!51197 (_ BitVec 32))) (Intermediate!12201 (undefined!13013 Bool) (index!51198 (_ BitVec 32)) (x!132966 (_ BitVec 32))) (Undefined!12201) (MissingVacant!12201 (index!51199 (_ BitVec 32))) )
))
(declare-fun lt!648185 () SeekEntryResult!12201)

(declare-datatypes ((array!99586 0))(
  ( (array!99587 (arr!48064 (Array (_ BitVec 32) (_ BitVec 64))) (size!48615 (_ BitVec 32))) )
))
(declare-fun lt!648183 () array!99586)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!833038 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99586 (_ BitVec 32)) SeekEntryResult!12201)

(assert (=> b!1485500 (= e!833038 (= lt!648185 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648184 lt!648183 mask!2687)))))

(declare-fun b!1485501 () Bool)

(declare-fun e!833031 () Bool)

(declare-fun e!833036 () Bool)

(assert (=> b!1485501 (= e!833031 e!833036)))

(declare-fun res!1009243 () Bool)

(assert (=> b!1485501 (=> (not res!1009243) (not e!833036))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485501 (= res!1009243 (= lt!648185 (Intermediate!12201 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485501 (= lt!648185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648184 mask!2687) lt!648184 lt!648183 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99586)

(assert (=> b!1485501 (= lt!648184 (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1009254 () Bool)

(declare-fun e!833032 () Bool)

(assert (=> start!126786 (=> (not res!1009254) (not e!833032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126786 (= res!1009254 (validMask!0 mask!2687))))

(assert (=> start!126786 e!833032))

(assert (=> start!126786 true))

(declare-fun array_inv!37345 (array!99586) Bool)

(assert (=> start!126786 (array_inv!37345 a!2862)))

(declare-fun b!1485502 () Bool)

(declare-fun e!833039 () Bool)

(assert (=> b!1485502 (= e!833039 e!833031)))

(declare-fun res!1009251 () Bool)

(assert (=> b!1485502 (=> (not res!1009251) (not e!833031))))

(declare-fun lt!648181 () SeekEntryResult!12201)

(assert (=> b!1485502 (= res!1009251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48064 a!2862) j!93) mask!2687) (select (arr!48064 a!2862) j!93) a!2862 mask!2687) lt!648181))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485502 (= lt!648181 (Intermediate!12201 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485503 () Bool)

(declare-fun res!1009249 () Bool)

(assert (=> b!1485503 (=> (not res!1009249) (not e!833032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99586 (_ BitVec 32)) Bool)

(assert (=> b!1485503 (= res!1009249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485504 () Bool)

(declare-fun res!1009250 () Bool)

(assert (=> b!1485504 (=> (not res!1009250) (not e!833032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485504 (= res!1009250 (validKeyInArray!0 (select (arr!48064 a!2862) i!1006)))))

(declare-fun b!1485505 () Bool)

(declare-fun e!833035 () Bool)

(assert (=> b!1485505 (= e!833036 (not e!833035))))

(declare-fun res!1009253 () Bool)

(assert (=> b!1485505 (=> res!1009253 e!833035)))

(assert (=> b!1485505 (= res!1009253 (or (and (= (select (arr!48064 a!2862) index!646) (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48064 a!2862) index!646) (select (arr!48064 a!2862) j!93))) (= (select (arr!48064 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833034 () Bool)

(assert (=> b!1485505 e!833034))

(declare-fun res!1009252 () Bool)

(assert (=> b!1485505 (=> (not res!1009252) (not e!833034))))

(assert (=> b!1485505 (= res!1009252 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49775 0))(
  ( (Unit!49776) )
))
(declare-fun lt!648186 () Unit!49775)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49775)

(assert (=> b!1485505 (= lt!648186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485506 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99586 (_ BitVec 32)) SeekEntryResult!12201)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99586 (_ BitVec 32)) SeekEntryResult!12201)

(assert (=> b!1485506 (= e!833038 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648184 lt!648183 mask!2687) (seekEntryOrOpen!0 lt!648184 lt!648183 mask!2687)))))

(declare-fun b!1485507 () Bool)

(declare-fun res!1009246 () Bool)

(assert (=> b!1485507 (=> (not res!1009246) (not e!833032))))

(declare-datatypes ((List!34552 0))(
  ( (Nil!34549) (Cons!34548 (h!35936 (_ BitVec 64)) (t!49238 List!34552)) )
))
(declare-fun arrayNoDuplicates!0 (array!99586 (_ BitVec 32) List!34552) Bool)

(assert (=> b!1485507 (= res!1009246 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34549))))

(declare-fun e!833037 () Bool)

(declare-fun b!1485508 () Bool)

(assert (=> b!1485508 (= e!833037 (= (seekEntryOrOpen!0 lt!648184 lt!648183 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648184 lt!648183 mask!2687)))))

(declare-fun b!1485509 () Bool)

(declare-fun res!1009256 () Bool)

(assert (=> b!1485509 (=> (not res!1009256) (not e!833034))))

(assert (=> b!1485509 (= res!1009256 (or (= (select (arr!48064 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48064 a!2862) intermediateBeforeIndex!19) (select (arr!48064 a!2862) j!93))))))

(declare-fun b!1485510 () Bool)

(assert (=> b!1485510 (= e!833032 e!833039)))

(declare-fun res!1009242 () Bool)

(assert (=> b!1485510 (=> (not res!1009242) (not e!833039))))

(assert (=> b!1485510 (= res!1009242 (= (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485510 (= lt!648183 (array!99587 (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48615 a!2862)))))

(declare-fun b!1485511 () Bool)

(declare-fun res!1009248 () Bool)

(assert (=> b!1485511 (=> (not res!1009248) (not e!833036))))

(assert (=> b!1485511 (= res!1009248 e!833038)))

(declare-fun c!137662 () Bool)

(assert (=> b!1485511 (= c!137662 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485512 () Bool)

(declare-fun res!1009241 () Bool)

(assert (=> b!1485512 (=> (not res!1009241) (not e!833032))))

(assert (=> b!1485512 (= res!1009241 (validKeyInArray!0 (select (arr!48064 a!2862) j!93)))))

(declare-fun b!1485513 () Bool)

(declare-fun res!1009244 () Bool)

(assert (=> b!1485513 (=> (not res!1009244) (not e!833032))))

(assert (=> b!1485513 (= res!1009244 (and (= (size!48615 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48615 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48615 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485514 () Bool)

(declare-fun res!1009245 () Bool)

(assert (=> b!1485514 (=> (not res!1009245) (not e!833031))))

(assert (=> b!1485514 (= res!1009245 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48064 a!2862) j!93) a!2862 mask!2687) lt!648181))))

(declare-fun b!1485515 () Bool)

(assert (=> b!1485515 (= e!833035 true)))

(declare-fun lt!648182 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485515 (= lt!648182 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1485516 () Bool)

(declare-fun res!1009257 () Bool)

(assert (=> b!1485516 (=> (not res!1009257) (not e!833032))))

(assert (=> b!1485516 (= res!1009257 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48615 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48615 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48615 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485517 () Bool)

(declare-fun e!833033 () Bool)

(assert (=> b!1485517 (= e!833034 e!833033)))

(declare-fun res!1009255 () Bool)

(assert (=> b!1485517 (=> res!1009255 e!833033)))

(declare-fun lt!648187 () (_ BitVec 64))

(assert (=> b!1485517 (= res!1009255 (or (and (= (select (arr!48064 a!2862) index!646) lt!648187) (= (select (arr!48064 a!2862) index!646) (select (arr!48064 a!2862) j!93))) (= (select (arr!48064 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485517 (= lt!648187 (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485518 () Bool)

(declare-fun res!1009247 () Bool)

(assert (=> b!1485518 (=> (not res!1009247) (not e!833034))))

(assert (=> b!1485518 (= res!1009247 (= (seekEntryOrOpen!0 (select (arr!48064 a!2862) j!93) a!2862 mask!2687) (Found!12201 j!93)))))

(declare-fun b!1485519 () Bool)

(assert (=> b!1485519 (= e!833033 e!833037)))

(declare-fun res!1009258 () Bool)

(assert (=> b!1485519 (=> (not res!1009258) (not e!833037))))

(assert (=> b!1485519 (= res!1009258 (and (= index!646 intermediateAfterIndex!19) (= lt!648187 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485520 () Bool)

(declare-fun res!1009259 () Bool)

(assert (=> b!1485520 (=> (not res!1009259) (not e!833036))))

(assert (=> b!1485520 (= res!1009259 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126786 res!1009254) b!1485513))

(assert (= (and b!1485513 res!1009244) b!1485504))

(assert (= (and b!1485504 res!1009250) b!1485512))

(assert (= (and b!1485512 res!1009241) b!1485503))

(assert (= (and b!1485503 res!1009249) b!1485507))

(assert (= (and b!1485507 res!1009246) b!1485516))

(assert (= (and b!1485516 res!1009257) b!1485510))

(assert (= (and b!1485510 res!1009242) b!1485502))

(assert (= (and b!1485502 res!1009251) b!1485514))

(assert (= (and b!1485514 res!1009245) b!1485501))

(assert (= (and b!1485501 res!1009243) b!1485511))

(assert (= (and b!1485511 c!137662) b!1485500))

(assert (= (and b!1485511 (not c!137662)) b!1485506))

(assert (= (and b!1485511 res!1009248) b!1485520))

(assert (= (and b!1485520 res!1009259) b!1485505))

(assert (= (and b!1485505 res!1009252) b!1485518))

(assert (= (and b!1485518 res!1009247) b!1485509))

(assert (= (and b!1485509 res!1009256) b!1485517))

(assert (= (and b!1485517 (not res!1009255)) b!1485519))

(assert (= (and b!1485519 res!1009258) b!1485508))

(assert (= (and b!1485505 (not res!1009253)) b!1485515))

(declare-fun m!1370899 () Bool)

(assert (=> start!126786 m!1370899))

(declare-fun m!1370901 () Bool)

(assert (=> start!126786 m!1370901))

(declare-fun m!1370903 () Bool)

(assert (=> b!1485502 m!1370903))

(assert (=> b!1485502 m!1370903))

(declare-fun m!1370905 () Bool)

(assert (=> b!1485502 m!1370905))

(assert (=> b!1485502 m!1370905))

(assert (=> b!1485502 m!1370903))

(declare-fun m!1370907 () Bool)

(assert (=> b!1485502 m!1370907))

(declare-fun m!1370909 () Bool)

(assert (=> b!1485515 m!1370909))

(declare-fun m!1370911 () Bool)

(assert (=> b!1485510 m!1370911))

(declare-fun m!1370913 () Bool)

(assert (=> b!1485510 m!1370913))

(declare-fun m!1370915 () Bool)

(assert (=> b!1485505 m!1370915))

(assert (=> b!1485505 m!1370911))

(declare-fun m!1370917 () Bool)

(assert (=> b!1485505 m!1370917))

(declare-fun m!1370919 () Bool)

(assert (=> b!1485505 m!1370919))

(declare-fun m!1370921 () Bool)

(assert (=> b!1485505 m!1370921))

(assert (=> b!1485505 m!1370903))

(declare-fun m!1370923 () Bool)

(assert (=> b!1485506 m!1370923))

(declare-fun m!1370925 () Bool)

(assert (=> b!1485506 m!1370925))

(assert (=> b!1485518 m!1370903))

(assert (=> b!1485518 m!1370903))

(declare-fun m!1370927 () Bool)

(assert (=> b!1485518 m!1370927))

(declare-fun m!1370929 () Bool)

(assert (=> b!1485501 m!1370929))

(assert (=> b!1485501 m!1370929))

(declare-fun m!1370931 () Bool)

(assert (=> b!1485501 m!1370931))

(assert (=> b!1485501 m!1370911))

(declare-fun m!1370933 () Bool)

(assert (=> b!1485501 m!1370933))

(declare-fun m!1370935 () Bool)

(assert (=> b!1485504 m!1370935))

(assert (=> b!1485504 m!1370935))

(declare-fun m!1370937 () Bool)

(assert (=> b!1485504 m!1370937))

(assert (=> b!1485514 m!1370903))

(assert (=> b!1485514 m!1370903))

(declare-fun m!1370939 () Bool)

(assert (=> b!1485514 m!1370939))

(declare-fun m!1370941 () Bool)

(assert (=> b!1485509 m!1370941))

(assert (=> b!1485509 m!1370903))

(declare-fun m!1370943 () Bool)

(assert (=> b!1485507 m!1370943))

(assert (=> b!1485512 m!1370903))

(assert (=> b!1485512 m!1370903))

(declare-fun m!1370945 () Bool)

(assert (=> b!1485512 m!1370945))

(assert (=> b!1485508 m!1370925))

(assert (=> b!1485508 m!1370923))

(declare-fun m!1370947 () Bool)

(assert (=> b!1485500 m!1370947))

(assert (=> b!1485517 m!1370919))

(assert (=> b!1485517 m!1370903))

(assert (=> b!1485517 m!1370911))

(assert (=> b!1485517 m!1370917))

(declare-fun m!1370949 () Bool)

(assert (=> b!1485503 m!1370949))

(check-sat (not b!1485503) (not start!126786) (not b!1485506) (not b!1485504) (not b!1485512) (not b!1485514) (not b!1485508) (not b!1485518) (not b!1485502) (not b!1485515) (not b!1485500) (not b!1485505) (not b!1485507) (not b!1485501))
(check-sat)
