; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126396 () Bool)

(assert start!126396)

(declare-fun b!1481924 () Bool)

(declare-fun res!1007201 () Bool)

(declare-fun e!831076 () Bool)

(assert (=> b!1481924 (=> (not res!1007201) (not e!831076))))

(declare-datatypes ((array!99415 0))(
  ( (array!99416 (arr!47985 (Array (_ BitVec 32) (_ BitVec 64))) (size!48535 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99415)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481924 (= res!1007201 (validKeyInArray!0 (select (arr!47985 a!2862) j!93)))))

(declare-fun b!1481925 () Bool)

(declare-fun res!1007198 () Bool)

(assert (=> b!1481925 (=> (not res!1007198) (not e!831076))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99415 (_ BitVec 32)) Bool)

(assert (=> b!1481925 (= res!1007198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481926 () Bool)

(declare-fun res!1007197 () Bool)

(declare-fun e!831080 () Bool)

(assert (=> b!1481926 (=> (not res!1007197) (not e!831080))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12225 0))(
  ( (MissingZero!12225 (index!51292 (_ BitVec 32))) (Found!12225 (index!51293 (_ BitVec 32))) (Intermediate!12225 (undefined!13037 Bool) (index!51294 (_ BitVec 32)) (x!132876 (_ BitVec 32))) (Undefined!12225) (MissingVacant!12225 (index!51295 (_ BitVec 32))) )
))
(declare-fun lt!646919 () SeekEntryResult!12225)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99415 (_ BitVec 32)) SeekEntryResult!12225)

(assert (=> b!1481926 (= res!1007197 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47985 a!2862) j!93) a!2862 mask!2687) lt!646919))))

(declare-fun res!1007195 () Bool)

(assert (=> start!126396 (=> (not res!1007195) (not e!831076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126396 (= res!1007195 (validMask!0 mask!2687))))

(assert (=> start!126396 e!831076))

(assert (=> start!126396 true))

(declare-fun array_inv!37013 (array!99415) Bool)

(assert (=> start!126396 (array_inv!37013 a!2862)))

(declare-fun b!1481927 () Bool)

(declare-fun res!1007199 () Bool)

(assert (=> b!1481927 (=> (not res!1007199) (not e!831076))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481927 (= res!1007199 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48535 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48535 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48535 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481928 () Bool)

(declare-fun res!1007194 () Bool)

(declare-fun e!831077 () Bool)

(assert (=> b!1481928 (=> (not res!1007194) (not e!831077))))

(declare-fun e!831074 () Bool)

(assert (=> b!1481928 (= res!1007194 e!831074)))

(declare-fun c!136887 () Bool)

(assert (=> b!1481928 (= c!136887 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!646920 () (_ BitVec 64))

(declare-fun lt!646923 () array!99415)

(declare-fun lt!646921 () SeekEntryResult!12225)

(declare-fun b!1481929 () Bool)

(assert (=> b!1481929 (= e!831074 (= lt!646921 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646920 lt!646923 mask!2687)))))

(declare-fun b!1481930 () Bool)

(assert (=> b!1481930 (= e!831077 (not true))))

(declare-fun e!831075 () Bool)

(assert (=> b!1481930 e!831075))

(declare-fun res!1007205 () Bool)

(assert (=> b!1481930 (=> (not res!1007205) (not e!831075))))

(assert (=> b!1481930 (= res!1007205 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49790 0))(
  ( (Unit!49791) )
))
(declare-fun lt!646922 () Unit!49790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49790)

(assert (=> b!1481930 (= lt!646922 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481931 () Bool)

(declare-fun e!831079 () Bool)

(assert (=> b!1481931 (= e!831076 e!831079)))

(declare-fun res!1007204 () Bool)

(assert (=> b!1481931 (=> (not res!1007204) (not e!831079))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481931 (= res!1007204 (= (select (store (arr!47985 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481931 (= lt!646923 (array!99416 (store (arr!47985 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48535 a!2862)))))

(declare-fun b!1481932 () Bool)

(declare-fun res!1007192 () Bool)

(assert (=> b!1481932 (=> (not res!1007192) (not e!831076))))

(declare-datatypes ((List!34486 0))(
  ( (Nil!34483) (Cons!34482 (h!35853 (_ BitVec 64)) (t!49180 List!34486)) )
))
(declare-fun arrayNoDuplicates!0 (array!99415 (_ BitVec 32) List!34486) Bool)

(assert (=> b!1481932 (= res!1007192 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34483))))

(declare-fun b!1481933 () Bool)

(declare-fun res!1007193 () Bool)

(assert (=> b!1481933 (=> (not res!1007193) (not e!831075))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99415 (_ BitVec 32)) SeekEntryResult!12225)

(assert (=> b!1481933 (= res!1007193 (= (seekEntryOrOpen!0 (select (arr!47985 a!2862) j!93) a!2862 mask!2687) (Found!12225 j!93)))))

(declare-fun b!1481934 () Bool)

(assert (=> b!1481934 (= e!831075 (and (or (= (select (arr!47985 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47985 a!2862) intermediateBeforeIndex!19) (select (arr!47985 a!2862) j!93))) (or (and (= (select (arr!47985 a!2862) index!646) (select (store (arr!47985 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47985 a!2862) index!646) (select (arr!47985 a!2862) j!93))) (= (select (arr!47985 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47985 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481935 () Bool)

(declare-fun res!1007206 () Bool)

(assert (=> b!1481935 (=> (not res!1007206) (not e!831077))))

(assert (=> b!1481935 (= res!1007206 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481936 () Bool)

(declare-fun res!1007196 () Bool)

(assert (=> b!1481936 (=> (not res!1007196) (not e!831076))))

(assert (=> b!1481936 (= res!1007196 (validKeyInArray!0 (select (arr!47985 a!2862) i!1006)))))

(declare-fun b!1481937 () Bool)

(assert (=> b!1481937 (= e!831079 e!831080)))

(declare-fun res!1007203 () Bool)

(assert (=> b!1481937 (=> (not res!1007203) (not e!831080))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481937 (= res!1007203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47985 a!2862) j!93) mask!2687) (select (arr!47985 a!2862) j!93) a!2862 mask!2687) lt!646919))))

(assert (=> b!1481937 (= lt!646919 (Intermediate!12225 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481938 () Bool)

(assert (=> b!1481938 (= e!831080 e!831077)))

(declare-fun res!1007202 () Bool)

(assert (=> b!1481938 (=> (not res!1007202) (not e!831077))))

(assert (=> b!1481938 (= res!1007202 (= lt!646921 (Intermediate!12225 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481938 (= lt!646921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646920 mask!2687) lt!646920 lt!646923 mask!2687))))

(assert (=> b!1481938 (= lt!646920 (select (store (arr!47985 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481939 () Bool)

(declare-fun res!1007200 () Bool)

(assert (=> b!1481939 (=> (not res!1007200) (not e!831076))))

(assert (=> b!1481939 (= res!1007200 (and (= (size!48535 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48535 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48535 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481940 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99415 (_ BitVec 32)) SeekEntryResult!12225)

(assert (=> b!1481940 (= e!831074 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646920 lt!646923 mask!2687) (seekEntryOrOpen!0 lt!646920 lt!646923 mask!2687)))))

(assert (= (and start!126396 res!1007195) b!1481939))

(assert (= (and b!1481939 res!1007200) b!1481936))

(assert (= (and b!1481936 res!1007196) b!1481924))

(assert (= (and b!1481924 res!1007201) b!1481925))

(assert (= (and b!1481925 res!1007198) b!1481932))

(assert (= (and b!1481932 res!1007192) b!1481927))

(assert (= (and b!1481927 res!1007199) b!1481931))

(assert (= (and b!1481931 res!1007204) b!1481937))

(assert (= (and b!1481937 res!1007203) b!1481926))

(assert (= (and b!1481926 res!1007197) b!1481938))

(assert (= (and b!1481938 res!1007202) b!1481928))

(assert (= (and b!1481928 c!136887) b!1481929))

(assert (= (and b!1481928 (not c!136887)) b!1481940))

(assert (= (and b!1481928 res!1007194) b!1481935))

(assert (= (and b!1481935 res!1007206) b!1481930))

(assert (= (and b!1481930 res!1007205) b!1481933))

(assert (= (and b!1481933 res!1007193) b!1481934))

(declare-fun m!1367655 () Bool)

(assert (=> start!126396 m!1367655))

(declare-fun m!1367657 () Bool)

(assert (=> start!126396 m!1367657))

(declare-fun m!1367659 () Bool)

(assert (=> b!1481930 m!1367659))

(declare-fun m!1367661 () Bool)

(assert (=> b!1481930 m!1367661))

(declare-fun m!1367663 () Bool)

(assert (=> b!1481932 m!1367663))

(declare-fun m!1367665 () Bool)

(assert (=> b!1481938 m!1367665))

(assert (=> b!1481938 m!1367665))

(declare-fun m!1367667 () Bool)

(assert (=> b!1481938 m!1367667))

(declare-fun m!1367669 () Bool)

(assert (=> b!1481938 m!1367669))

(declare-fun m!1367671 () Bool)

(assert (=> b!1481938 m!1367671))

(declare-fun m!1367673 () Bool)

(assert (=> b!1481940 m!1367673))

(declare-fun m!1367675 () Bool)

(assert (=> b!1481940 m!1367675))

(declare-fun m!1367677 () Bool)

(assert (=> b!1481937 m!1367677))

(assert (=> b!1481937 m!1367677))

(declare-fun m!1367679 () Bool)

(assert (=> b!1481937 m!1367679))

(assert (=> b!1481937 m!1367679))

(assert (=> b!1481937 m!1367677))

(declare-fun m!1367681 () Bool)

(assert (=> b!1481937 m!1367681))

(assert (=> b!1481931 m!1367669))

(declare-fun m!1367683 () Bool)

(assert (=> b!1481931 m!1367683))

(assert (=> b!1481926 m!1367677))

(assert (=> b!1481926 m!1367677))

(declare-fun m!1367685 () Bool)

(assert (=> b!1481926 m!1367685))

(declare-fun m!1367687 () Bool)

(assert (=> b!1481936 m!1367687))

(assert (=> b!1481936 m!1367687))

(declare-fun m!1367689 () Bool)

(assert (=> b!1481936 m!1367689))

(assert (=> b!1481924 m!1367677))

(assert (=> b!1481924 m!1367677))

(declare-fun m!1367691 () Bool)

(assert (=> b!1481924 m!1367691))

(assert (=> b!1481934 m!1367669))

(declare-fun m!1367693 () Bool)

(assert (=> b!1481934 m!1367693))

(declare-fun m!1367695 () Bool)

(assert (=> b!1481934 m!1367695))

(declare-fun m!1367697 () Bool)

(assert (=> b!1481934 m!1367697))

(assert (=> b!1481934 m!1367677))

(declare-fun m!1367699 () Bool)

(assert (=> b!1481925 m!1367699))

(declare-fun m!1367701 () Bool)

(assert (=> b!1481929 m!1367701))

(assert (=> b!1481933 m!1367677))

(assert (=> b!1481933 m!1367677))

(declare-fun m!1367703 () Bool)

(assert (=> b!1481933 m!1367703))

(check-sat (not b!1481925) (not start!126396) (not b!1481936) (not b!1481932) (not b!1481940) (not b!1481924) (not b!1481938) (not b!1481926) (not b!1481929) (not b!1481933) (not b!1481937) (not b!1481930))
(check-sat)
