; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125664 () Bool)

(assert start!125664)

(declare-fun b!1467919 () Bool)

(declare-fun res!995573 () Bool)

(declare-fun e!824830 () Bool)

(assert (=> b!1467919 (=> (not res!995573) (not e!824830))))

(declare-datatypes ((array!98950 0))(
  ( (array!98951 (arr!47758 (Array (_ BitVec 32) (_ BitVec 64))) (size!48309 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98950)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98950 (_ BitVec 32)) Bool)

(assert (=> b!1467919 (= res!995573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467920 () Bool)

(declare-datatypes ((SeekEntryResult!11907 0))(
  ( (MissingZero!11907 (index!50020 (_ BitVec 32))) (Found!11907 (index!50021 (_ BitVec 32))) (Intermediate!11907 (undefined!12719 Bool) (index!50022 (_ BitVec 32)) (x!131781 (_ BitVec 32))) (Undefined!11907) (MissingVacant!11907 (index!50023 (_ BitVec 32))) )
))
(declare-fun lt!642309 () SeekEntryResult!11907)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!642310 () (_ BitVec 32))

(declare-fun e!824828 () Bool)

(declare-fun lt!642313 () (_ BitVec 64))

(declare-fun lt!642308 () array!98950)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98950 (_ BitVec 32)) SeekEntryResult!11907)

(assert (=> b!1467920 (= e!824828 (not (= lt!642309 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642310 lt!642313 lt!642308 mask!2687))))))

(declare-fun b!1467921 () Bool)

(declare-fun res!995571 () Bool)

(declare-fun e!824826 () Bool)

(assert (=> b!1467921 (=> res!995571 e!824826)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467921 (= res!995571 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467922 () Bool)

(declare-fun e!824829 () Bool)

(declare-fun e!824832 () Bool)

(assert (=> b!1467922 (= e!824829 e!824832)))

(declare-fun res!995570 () Bool)

(assert (=> b!1467922 (=> (not res!995570) (not e!824832))))

(declare-fun lt!642306 () SeekEntryResult!11907)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467922 (= res!995570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47758 a!2862) j!93) mask!2687) (select (arr!47758 a!2862) j!93) a!2862 mask!2687) lt!642306))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1467922 (= lt!642306 (Intermediate!11907 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467923 () Bool)

(declare-fun e!824824 () Bool)

(assert (=> b!1467923 (= e!824824 e!824826)))

(declare-fun res!995578 () Bool)

(assert (=> b!1467923 (=> res!995578 e!824826)))

(assert (=> b!1467923 (= res!995578 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642310 #b00000000000000000000000000000000) (bvsge lt!642310 (size!48309 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467923 (= lt!642310 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1467925 () Bool)

(declare-fun res!995584 () Bool)

(declare-fun e!824827 () Bool)

(assert (=> b!1467925 (=> (not res!995584) (not e!824827))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467925 (= res!995584 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467926 () Bool)

(declare-fun res!995582 () Bool)

(assert (=> b!1467926 (=> res!995582 e!824826)))

(assert (=> b!1467926 (= res!995582 e!824828)))

(declare-fun c!135697 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1467926 (= c!135697 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467927 () Bool)

(declare-fun res!995585 () Bool)

(assert (=> b!1467927 (=> (not res!995585) (not e!824830))))

(assert (=> b!1467927 (= res!995585 (and (= (size!48309 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48309 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48309 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467928 () Bool)

(assert (=> b!1467928 (= e!824832 e!824827)))

(declare-fun res!995574 () Bool)

(assert (=> b!1467928 (=> (not res!995574) (not e!824827))))

(assert (=> b!1467928 (= res!995574 (= lt!642309 (Intermediate!11907 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1467928 (= lt!642309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642313 mask!2687) lt!642313 lt!642308 mask!2687))))

(assert (=> b!1467928 (= lt!642313 (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467929 () Bool)

(assert (=> b!1467929 (= e!824830 e!824829)))

(declare-fun res!995577 () Bool)

(assert (=> b!1467929 (=> (not res!995577) (not e!824829))))

(assert (=> b!1467929 (= res!995577 (= (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467929 (= lt!642308 (array!98951 (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48309 a!2862)))))

(declare-fun b!1467930 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98950 (_ BitVec 32)) SeekEntryResult!11907)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98950 (_ BitVec 32)) SeekEntryResult!11907)

(assert (=> b!1467930 (= e!824828 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642310 intermediateAfterIndex!19 lt!642313 lt!642308 mask!2687) (seekEntryOrOpen!0 lt!642313 lt!642308 mask!2687))))))

(declare-fun b!1467931 () Bool)

(assert (=> b!1467931 (= e!824827 (not e!824824))))

(declare-fun res!995579 () Bool)

(assert (=> b!1467931 (=> res!995579 e!824824)))

(assert (=> b!1467931 (= res!995579 (or (and (= (select (arr!47758 a!2862) index!646) (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47758 a!2862) index!646) (select (arr!47758 a!2862) j!93))) (= (select (arr!47758 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!642307 () SeekEntryResult!11907)

(assert (=> b!1467931 (and (= lt!642307 (Found!11907 j!93)) (or (= (select (arr!47758 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47758 a!2862) intermediateBeforeIndex!19) (select (arr!47758 a!2862) j!93))))))

(assert (=> b!1467931 (= lt!642307 (seekEntryOrOpen!0 (select (arr!47758 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1467931 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49343 0))(
  ( (Unit!49344) )
))
(declare-fun lt!642312 () Unit!49343)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49343)

(assert (=> b!1467931 (= lt!642312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467932 () Bool)

(declare-fun e!824831 () Bool)

(assert (=> b!1467932 (= e!824831 (= lt!642309 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642313 lt!642308 mask!2687)))))

(declare-fun b!1467933 () Bool)

(declare-fun res!995580 () Bool)

(assert (=> b!1467933 (=> (not res!995580) (not e!824830))))

(declare-datatypes ((List!34246 0))(
  ( (Nil!34243) (Cons!34242 (h!35606 (_ BitVec 64)) (t!48932 List!34246)) )
))
(declare-fun arrayNoDuplicates!0 (array!98950 (_ BitVec 32) List!34246) Bool)

(assert (=> b!1467933 (= res!995580 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34243))))

(declare-fun b!1467934 () Bool)

(declare-fun res!995576 () Bool)

(assert (=> b!1467934 (=> (not res!995576) (not e!824830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467934 (= res!995576 (validKeyInArray!0 (select (arr!47758 a!2862) j!93)))))

(declare-fun b!1467935 () Bool)

(declare-fun res!995583 () Bool)

(assert (=> b!1467935 (=> (not res!995583) (not e!824827))))

(assert (=> b!1467935 (= res!995583 e!824831)))

(declare-fun c!135696 () Bool)

(assert (=> b!1467935 (= c!135696 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467936 () Bool)

(assert (=> b!1467936 (= e!824826 true)))

(assert (=> b!1467936 (= lt!642307 (seekEntryOrOpen!0 lt!642313 lt!642308 mask!2687))))

(declare-fun lt!642311 () Unit!49343)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49343)

(assert (=> b!1467936 (= lt!642311 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642310 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467937 () Bool)

(assert (=> b!1467937 (= e!824831 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642313 lt!642308 mask!2687) (seekEntryOrOpen!0 lt!642313 lt!642308 mask!2687)))))

(declare-fun b!1467938 () Bool)

(declare-fun res!995569 () Bool)

(assert (=> b!1467938 (=> (not res!995569) (not e!824830))))

(assert (=> b!1467938 (= res!995569 (validKeyInArray!0 (select (arr!47758 a!2862) i!1006)))))

(declare-fun b!1467924 () Bool)

(declare-fun res!995581 () Bool)

(assert (=> b!1467924 (=> (not res!995581) (not e!824830))))

(assert (=> b!1467924 (= res!995581 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48309 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48309 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48309 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!995572 () Bool)

(assert (=> start!125664 (=> (not res!995572) (not e!824830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125664 (= res!995572 (validMask!0 mask!2687))))

(assert (=> start!125664 e!824830))

(assert (=> start!125664 true))

(declare-fun array_inv!37039 (array!98950) Bool)

(assert (=> start!125664 (array_inv!37039 a!2862)))

(declare-fun b!1467939 () Bool)

(declare-fun res!995575 () Bool)

(assert (=> b!1467939 (=> (not res!995575) (not e!824832))))

(assert (=> b!1467939 (= res!995575 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47758 a!2862) j!93) a!2862 mask!2687) lt!642306))))

(declare-fun b!1467940 () Bool)

(declare-fun res!995568 () Bool)

(assert (=> b!1467940 (=> res!995568 e!824826)))

(assert (=> b!1467940 (= res!995568 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642310 (select (arr!47758 a!2862) j!93) a!2862 mask!2687) lt!642306)))))

(assert (= (and start!125664 res!995572) b!1467927))

(assert (= (and b!1467927 res!995585) b!1467938))

(assert (= (and b!1467938 res!995569) b!1467934))

(assert (= (and b!1467934 res!995576) b!1467919))

(assert (= (and b!1467919 res!995573) b!1467933))

(assert (= (and b!1467933 res!995580) b!1467924))

(assert (= (and b!1467924 res!995581) b!1467929))

(assert (= (and b!1467929 res!995577) b!1467922))

(assert (= (and b!1467922 res!995570) b!1467939))

(assert (= (and b!1467939 res!995575) b!1467928))

(assert (= (and b!1467928 res!995574) b!1467935))

(assert (= (and b!1467935 c!135696) b!1467932))

(assert (= (and b!1467935 (not c!135696)) b!1467937))

(assert (= (and b!1467935 res!995583) b!1467925))

(assert (= (and b!1467925 res!995584) b!1467931))

(assert (= (and b!1467931 (not res!995579)) b!1467923))

(assert (= (and b!1467923 (not res!995578)) b!1467940))

(assert (= (and b!1467940 (not res!995568)) b!1467926))

(assert (= (and b!1467926 c!135697) b!1467920))

(assert (= (and b!1467926 (not c!135697)) b!1467930))

(assert (= (and b!1467926 (not res!995582)) b!1467921))

(assert (= (and b!1467921 (not res!995571)) b!1467936))

(declare-fun m!1354909 () Bool)

(assert (=> start!125664 m!1354909))

(declare-fun m!1354911 () Bool)

(assert (=> start!125664 m!1354911))

(declare-fun m!1354913 () Bool)

(assert (=> b!1467931 m!1354913))

(declare-fun m!1354915 () Bool)

(assert (=> b!1467931 m!1354915))

(declare-fun m!1354917 () Bool)

(assert (=> b!1467931 m!1354917))

(declare-fun m!1354919 () Bool)

(assert (=> b!1467931 m!1354919))

(declare-fun m!1354921 () Bool)

(assert (=> b!1467931 m!1354921))

(declare-fun m!1354923 () Bool)

(assert (=> b!1467931 m!1354923))

(declare-fun m!1354925 () Bool)

(assert (=> b!1467931 m!1354925))

(declare-fun m!1354927 () Bool)

(assert (=> b!1467931 m!1354927))

(assert (=> b!1467931 m!1354923))

(declare-fun m!1354929 () Bool)

(assert (=> b!1467938 m!1354929))

(assert (=> b!1467938 m!1354929))

(declare-fun m!1354931 () Bool)

(assert (=> b!1467938 m!1354931))

(assert (=> b!1467940 m!1354923))

(assert (=> b!1467940 m!1354923))

(declare-fun m!1354933 () Bool)

(assert (=> b!1467940 m!1354933))

(declare-fun m!1354935 () Bool)

(assert (=> b!1467920 m!1354935))

(declare-fun m!1354937 () Bool)

(assert (=> b!1467923 m!1354937))

(declare-fun m!1354939 () Bool)

(assert (=> b!1467937 m!1354939))

(declare-fun m!1354941 () Bool)

(assert (=> b!1467937 m!1354941))

(declare-fun m!1354943 () Bool)

(assert (=> b!1467932 m!1354943))

(declare-fun m!1354945 () Bool)

(assert (=> b!1467928 m!1354945))

(assert (=> b!1467928 m!1354945))

(declare-fun m!1354947 () Bool)

(assert (=> b!1467928 m!1354947))

(assert (=> b!1467928 m!1354915))

(declare-fun m!1354949 () Bool)

(assert (=> b!1467928 m!1354949))

(declare-fun m!1354951 () Bool)

(assert (=> b!1467930 m!1354951))

(assert (=> b!1467930 m!1354941))

(declare-fun m!1354953 () Bool)

(assert (=> b!1467933 m!1354953))

(assert (=> b!1467934 m!1354923))

(assert (=> b!1467934 m!1354923))

(declare-fun m!1354955 () Bool)

(assert (=> b!1467934 m!1354955))

(assert (=> b!1467936 m!1354941))

(declare-fun m!1354957 () Bool)

(assert (=> b!1467936 m!1354957))

(assert (=> b!1467929 m!1354915))

(declare-fun m!1354959 () Bool)

(assert (=> b!1467929 m!1354959))

(assert (=> b!1467922 m!1354923))

(assert (=> b!1467922 m!1354923))

(declare-fun m!1354961 () Bool)

(assert (=> b!1467922 m!1354961))

(assert (=> b!1467922 m!1354961))

(assert (=> b!1467922 m!1354923))

(declare-fun m!1354963 () Bool)

(assert (=> b!1467922 m!1354963))

(assert (=> b!1467939 m!1354923))

(assert (=> b!1467939 m!1354923))

(declare-fun m!1354965 () Bool)

(assert (=> b!1467939 m!1354965))

(declare-fun m!1354967 () Bool)

(assert (=> b!1467919 m!1354967))

(check-sat (not b!1467920) (not b!1467932) (not b!1467919) (not b!1467940) (not b!1467938) (not b!1467928) (not b!1467930) (not b!1467936) (not b!1467923) (not b!1467934) (not b!1467933) (not b!1467939) (not b!1467931) (not b!1467922) (not b!1467937) (not start!125664))
(check-sat)
