; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124702 () Bool)

(assert start!124702)

(declare-fun b!1445927 () Bool)

(declare-fun res!977837 () Bool)

(declare-fun e!814407 () Bool)

(assert (=> b!1445927 (=> (not res!977837) (not e!814407))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98128 0))(
  ( (array!98129 (arr!47353 (Array (_ BitVec 32) (_ BitVec 64))) (size!47905 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98128)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445927 (= res!977837 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47905 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47905 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47905 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445928 () Bool)

(declare-fun res!977848 () Bool)

(declare-fun e!814410 () Bool)

(assert (=> b!1445928 (=> (not res!977848) (not e!814410))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445928 (= res!977848 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!814409 () Bool)

(declare-fun lt!634463 () array!98128)

(declare-fun b!1445929 () Bool)

(declare-fun lt!634467 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11630 0))(
  ( (MissingZero!11630 (index!48912 (_ BitVec 32))) (Found!11630 (index!48913 (_ BitVec 32))) (Intermediate!11630 (undefined!12442 Bool) (index!48914 (_ BitVec 32)) (x!130594 (_ BitVec 32))) (Undefined!11630) (MissingVacant!11630 (index!48915 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98128 (_ BitVec 32)) SeekEntryResult!11630)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98128 (_ BitVec 32)) SeekEntryResult!11630)

(assert (=> b!1445929 (= e!814409 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634467 lt!634463 mask!2687) (seekEntryOrOpen!0 lt!634467 lt!634463 mask!2687)))))

(declare-fun b!1445930 () Bool)

(assert (=> b!1445930 (= e!814410 (not true))))

(declare-fun e!814413 () Bool)

(assert (=> b!1445930 e!814413))

(declare-fun res!977847 () Bool)

(assert (=> b!1445930 (=> (not res!977847) (not e!814413))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98128 (_ BitVec 32)) Bool)

(assert (=> b!1445930 (= res!977847 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48597 0))(
  ( (Unit!48598) )
))
(declare-fun lt!634466 () Unit!48597)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48597)

(assert (=> b!1445930 (= lt!634466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!977849 () Bool)

(assert (=> start!124702 (=> (not res!977849) (not e!814407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124702 (= res!977849 (validMask!0 mask!2687))))

(assert (=> start!124702 e!814407))

(assert (=> start!124702 true))

(declare-fun array_inv!36586 (array!98128) Bool)

(assert (=> start!124702 (array_inv!36586 a!2862)))

(declare-fun b!1445931 () Bool)

(declare-fun e!814408 () Bool)

(assert (=> b!1445931 (= e!814407 e!814408)))

(declare-fun res!977845 () Bool)

(assert (=> b!1445931 (=> (not res!977845) (not e!814408))))

(assert (=> b!1445931 (= res!977845 (= (select (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445931 (= lt!634463 (array!98129 (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47905 a!2862)))))

(declare-fun b!1445932 () Bool)

(declare-fun res!977850 () Bool)

(assert (=> b!1445932 (=> (not res!977850) (not e!814407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445932 (= res!977850 (validKeyInArray!0 (select (arr!47353 a!2862) j!93)))))

(declare-fun b!1445933 () Bool)

(declare-fun res!977846 () Bool)

(declare-fun e!814412 () Bool)

(assert (=> b!1445933 (=> (not res!977846) (not e!814412))))

(declare-fun lt!634464 () SeekEntryResult!11630)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98128 (_ BitVec 32)) SeekEntryResult!11630)

(assert (=> b!1445933 (= res!977846 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47353 a!2862) j!93) a!2862 mask!2687) lt!634464))))

(declare-fun b!1445934 () Bool)

(declare-fun res!977842 () Bool)

(assert (=> b!1445934 (=> (not res!977842) (not e!814407))))

(assert (=> b!1445934 (= res!977842 (and (= (size!47905 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47905 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47905 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445935 () Bool)

(assert (=> b!1445935 (= e!814408 e!814412)))

(declare-fun res!977840 () Bool)

(assert (=> b!1445935 (=> (not res!977840) (not e!814412))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445935 (= res!977840 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47353 a!2862) j!93) mask!2687) (select (arr!47353 a!2862) j!93) a!2862 mask!2687) lt!634464))))

(assert (=> b!1445935 (= lt!634464 (Intermediate!11630 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445936 () Bool)

(assert (=> b!1445936 (= e!814413 (or (= (select (arr!47353 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47353 a!2862) intermediateBeforeIndex!19) (select (arr!47353 a!2862) j!93))))))

(declare-fun b!1445937 () Bool)

(declare-fun res!977843 () Bool)

(assert (=> b!1445937 (=> (not res!977843) (not e!814410))))

(assert (=> b!1445937 (= res!977843 e!814409)))

(declare-fun c!133558 () Bool)

(assert (=> b!1445937 (= c!133558 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445938 () Bool)

(assert (=> b!1445938 (= e!814412 e!814410)))

(declare-fun res!977838 () Bool)

(assert (=> b!1445938 (=> (not res!977838) (not e!814410))))

(declare-fun lt!634465 () SeekEntryResult!11630)

(assert (=> b!1445938 (= res!977838 (= lt!634465 (Intermediate!11630 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445938 (= lt!634465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634467 mask!2687) lt!634467 lt!634463 mask!2687))))

(assert (=> b!1445938 (= lt!634467 (select (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445939 () Bool)

(assert (=> b!1445939 (= e!814409 (= lt!634465 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634467 lt!634463 mask!2687)))))

(declare-fun b!1445940 () Bool)

(declare-fun res!977841 () Bool)

(assert (=> b!1445940 (=> (not res!977841) (not e!814413))))

(assert (=> b!1445940 (= res!977841 (= (seekEntryOrOpen!0 (select (arr!47353 a!2862) j!93) a!2862 mask!2687) (Found!11630 j!93)))))

(declare-fun b!1445941 () Bool)

(declare-fun res!977851 () Bool)

(assert (=> b!1445941 (=> (not res!977851) (not e!814407))))

(assert (=> b!1445941 (= res!977851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445942 () Bool)

(declare-fun res!977844 () Bool)

(assert (=> b!1445942 (=> (not res!977844) (not e!814407))))

(assert (=> b!1445942 (= res!977844 (validKeyInArray!0 (select (arr!47353 a!2862) i!1006)))))

(declare-fun b!1445943 () Bool)

(declare-fun res!977839 () Bool)

(assert (=> b!1445943 (=> (not res!977839) (not e!814407))))

(declare-datatypes ((List!33932 0))(
  ( (Nil!33929) (Cons!33928 (h!35278 (_ BitVec 64)) (t!48618 List!33932)) )
))
(declare-fun arrayNoDuplicates!0 (array!98128 (_ BitVec 32) List!33932) Bool)

(assert (=> b!1445943 (= res!977839 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33929))))

(assert (= (and start!124702 res!977849) b!1445934))

(assert (= (and b!1445934 res!977842) b!1445942))

(assert (= (and b!1445942 res!977844) b!1445932))

(assert (= (and b!1445932 res!977850) b!1445941))

(assert (= (and b!1445941 res!977851) b!1445943))

(assert (= (and b!1445943 res!977839) b!1445927))

(assert (= (and b!1445927 res!977837) b!1445931))

(assert (= (and b!1445931 res!977845) b!1445935))

(assert (= (and b!1445935 res!977840) b!1445933))

(assert (= (and b!1445933 res!977846) b!1445938))

(assert (= (and b!1445938 res!977838) b!1445937))

(assert (= (and b!1445937 c!133558) b!1445939))

(assert (= (and b!1445937 (not c!133558)) b!1445929))

(assert (= (and b!1445937 res!977843) b!1445928))

(assert (= (and b!1445928 res!977848) b!1445930))

(assert (= (and b!1445930 res!977847) b!1445940))

(assert (= (and b!1445940 res!977841) b!1445936))

(declare-fun m!1334349 () Bool)

(assert (=> b!1445930 m!1334349))

(declare-fun m!1334351 () Bool)

(assert (=> b!1445930 m!1334351))

(declare-fun m!1334353 () Bool)

(assert (=> b!1445933 m!1334353))

(assert (=> b!1445933 m!1334353))

(declare-fun m!1334355 () Bool)

(assert (=> b!1445933 m!1334355))

(assert (=> b!1445940 m!1334353))

(assert (=> b!1445940 m!1334353))

(declare-fun m!1334357 () Bool)

(assert (=> b!1445940 m!1334357))

(declare-fun m!1334359 () Bool)

(assert (=> b!1445931 m!1334359))

(declare-fun m!1334361 () Bool)

(assert (=> b!1445931 m!1334361))

(declare-fun m!1334363 () Bool)

(assert (=> b!1445943 m!1334363))

(declare-fun m!1334365 () Bool)

(assert (=> b!1445929 m!1334365))

(declare-fun m!1334367 () Bool)

(assert (=> b!1445929 m!1334367))

(declare-fun m!1334369 () Bool)

(assert (=> b!1445938 m!1334369))

(assert (=> b!1445938 m!1334369))

(declare-fun m!1334371 () Bool)

(assert (=> b!1445938 m!1334371))

(assert (=> b!1445938 m!1334359))

(declare-fun m!1334373 () Bool)

(assert (=> b!1445938 m!1334373))

(declare-fun m!1334375 () Bool)

(assert (=> b!1445941 m!1334375))

(assert (=> b!1445935 m!1334353))

(assert (=> b!1445935 m!1334353))

(declare-fun m!1334377 () Bool)

(assert (=> b!1445935 m!1334377))

(assert (=> b!1445935 m!1334377))

(assert (=> b!1445935 m!1334353))

(declare-fun m!1334379 () Bool)

(assert (=> b!1445935 m!1334379))

(assert (=> b!1445932 m!1334353))

(assert (=> b!1445932 m!1334353))

(declare-fun m!1334381 () Bool)

(assert (=> b!1445932 m!1334381))

(declare-fun m!1334383 () Bool)

(assert (=> b!1445942 m!1334383))

(assert (=> b!1445942 m!1334383))

(declare-fun m!1334385 () Bool)

(assert (=> b!1445942 m!1334385))

(declare-fun m!1334387 () Bool)

(assert (=> start!124702 m!1334387))

(declare-fun m!1334389 () Bool)

(assert (=> start!124702 m!1334389))

(declare-fun m!1334391 () Bool)

(assert (=> b!1445939 m!1334391))

(declare-fun m!1334393 () Bool)

(assert (=> b!1445936 m!1334393))

(assert (=> b!1445936 m!1334353))

(check-sat (not b!1445932) (not b!1445941) (not b!1445942) (not b!1445940) (not b!1445930) (not start!124702) (not b!1445939) (not b!1445938) (not b!1445929) (not b!1445943) (not b!1445933) (not b!1445935))
(check-sat)
