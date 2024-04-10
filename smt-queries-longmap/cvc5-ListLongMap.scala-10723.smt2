; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125476 () Bool)

(assert start!125476)

(declare-fun b!1467940 () Bool)

(declare-fun e!824415 () Bool)

(assert (=> b!1467940 (= e!824415 false)))

(declare-fun lt!642179 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98924 0))(
  ( (array!98925 (arr!47750 (Array (_ BitVec 32) (_ BitVec 64))) (size!48300 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467940 (= lt!642179 (toIndex!0 (select (store (arr!47750 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun res!996481 () Bool)

(declare-fun e!824417 () Bool)

(assert (=> start!125476 (=> (not res!996481) (not e!824417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125476 (= res!996481 (validMask!0 mask!2687))))

(assert (=> start!125476 e!824417))

(assert (=> start!125476 true))

(declare-fun array_inv!36778 (array!98924) Bool)

(assert (=> start!125476 (array_inv!36778 a!2862)))

(declare-fun b!1467941 () Bool)

(declare-fun res!996486 () Bool)

(assert (=> b!1467941 (=> (not res!996486) (not e!824417))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467941 (= res!996486 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48300 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48300 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48300 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47750 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467942 () Bool)

(declare-fun res!996487 () Bool)

(assert (=> b!1467942 (=> (not res!996487) (not e!824415))))

(declare-datatypes ((SeekEntryResult!11990 0))(
  ( (MissingZero!11990 (index!50352 (_ BitVec 32))) (Found!11990 (index!50353 (_ BitVec 32))) (Intermediate!11990 (undefined!12802 Bool) (index!50354 (_ BitVec 32)) (x!131951 (_ BitVec 32))) (Undefined!11990) (MissingVacant!11990 (index!50355 (_ BitVec 32))) )
))
(declare-fun lt!642180 () SeekEntryResult!11990)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98924 (_ BitVec 32)) SeekEntryResult!11990)

(assert (=> b!1467942 (= res!996487 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47750 a!2862) j!93) a!2862 mask!2687) lt!642180))))

(declare-fun b!1467943 () Bool)

(declare-fun res!996482 () Bool)

(assert (=> b!1467943 (=> (not res!996482) (not e!824417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467943 (= res!996482 (validKeyInArray!0 (select (arr!47750 a!2862) i!1006)))))

(declare-fun b!1467944 () Bool)

(declare-fun res!996479 () Bool)

(assert (=> b!1467944 (=> (not res!996479) (not e!824417))))

(declare-datatypes ((List!34251 0))(
  ( (Nil!34248) (Cons!34247 (h!35597 (_ BitVec 64)) (t!48945 List!34251)) )
))
(declare-fun arrayNoDuplicates!0 (array!98924 (_ BitVec 32) List!34251) Bool)

(assert (=> b!1467944 (= res!996479 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34248))))

(declare-fun b!1467945 () Bool)

(assert (=> b!1467945 (= e!824417 e!824415)))

(declare-fun res!996483 () Bool)

(assert (=> b!1467945 (=> (not res!996483) (not e!824415))))

(assert (=> b!1467945 (= res!996483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47750 a!2862) j!93) mask!2687) (select (arr!47750 a!2862) j!93) a!2862 mask!2687) lt!642180))))

(assert (=> b!1467945 (= lt!642180 (Intermediate!11990 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467946 () Bool)

(declare-fun res!996484 () Bool)

(assert (=> b!1467946 (=> (not res!996484) (not e!824417))))

(assert (=> b!1467946 (= res!996484 (validKeyInArray!0 (select (arr!47750 a!2862) j!93)))))

(declare-fun b!1467947 () Bool)

(declare-fun res!996480 () Bool)

(assert (=> b!1467947 (=> (not res!996480) (not e!824417))))

(assert (=> b!1467947 (= res!996480 (and (= (size!48300 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48300 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48300 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467948 () Bool)

(declare-fun res!996485 () Bool)

(assert (=> b!1467948 (=> (not res!996485) (not e!824417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98924 (_ BitVec 32)) Bool)

(assert (=> b!1467948 (= res!996485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125476 res!996481) b!1467947))

(assert (= (and b!1467947 res!996480) b!1467943))

(assert (= (and b!1467943 res!996482) b!1467946))

(assert (= (and b!1467946 res!996484) b!1467948))

(assert (= (and b!1467948 res!996485) b!1467944))

(assert (= (and b!1467944 res!996479) b!1467941))

(assert (= (and b!1467941 res!996486) b!1467945))

(assert (= (and b!1467945 res!996483) b!1467942))

(assert (= (and b!1467942 res!996487) b!1467940))

(declare-fun m!1354915 () Bool)

(assert (=> b!1467940 m!1354915))

(declare-fun m!1354917 () Bool)

(assert (=> b!1467940 m!1354917))

(assert (=> b!1467940 m!1354917))

(declare-fun m!1354919 () Bool)

(assert (=> b!1467940 m!1354919))

(declare-fun m!1354921 () Bool)

(assert (=> b!1467948 m!1354921))

(declare-fun m!1354923 () Bool)

(assert (=> start!125476 m!1354923))

(declare-fun m!1354925 () Bool)

(assert (=> start!125476 m!1354925))

(assert (=> b!1467941 m!1354915))

(declare-fun m!1354927 () Bool)

(assert (=> b!1467941 m!1354927))

(declare-fun m!1354929 () Bool)

(assert (=> b!1467946 m!1354929))

(assert (=> b!1467946 m!1354929))

(declare-fun m!1354931 () Bool)

(assert (=> b!1467946 m!1354931))

(assert (=> b!1467945 m!1354929))

(assert (=> b!1467945 m!1354929))

(declare-fun m!1354933 () Bool)

(assert (=> b!1467945 m!1354933))

(assert (=> b!1467945 m!1354933))

(assert (=> b!1467945 m!1354929))

(declare-fun m!1354935 () Bool)

(assert (=> b!1467945 m!1354935))

(assert (=> b!1467942 m!1354929))

(assert (=> b!1467942 m!1354929))

(declare-fun m!1354937 () Bool)

(assert (=> b!1467942 m!1354937))

(declare-fun m!1354939 () Bool)

(assert (=> b!1467944 m!1354939))

(declare-fun m!1354941 () Bool)

(assert (=> b!1467943 m!1354941))

(assert (=> b!1467943 m!1354941))

(declare-fun m!1354943 () Bool)

(assert (=> b!1467943 m!1354943))

(push 1)

