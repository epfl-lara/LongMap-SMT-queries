; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124648 () Bool)

(assert start!124648)

(declare-fun b!1443955 () Bool)

(declare-fun e!813632 () Bool)

(declare-fun e!813629 () Bool)

(assert (=> b!1443955 (= e!813632 (not e!813629))))

(declare-fun res!976015 () Bool)

(assert (=> b!1443955 (=> res!976015 e!813629)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98096 0))(
  ( (array!98097 (arr!47336 (Array (_ BitVec 32) (_ BitVec 64))) (size!47886 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98096)

(assert (=> b!1443955 (= res!976015 (or (not (= (select (arr!47336 a!2862) index!646) (select (store (arr!47336 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47336 a!2862) index!646) (select (arr!47336 a!2862) j!93)))))))

(declare-fun e!813626 () Bool)

(assert (=> b!1443955 e!813626))

(declare-fun res!976007 () Bool)

(assert (=> b!1443955 (=> (not res!976007) (not e!813626))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98096 (_ BitVec 32)) Bool)

(assert (=> b!1443955 (= res!976007 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48672 0))(
  ( (Unit!48673) )
))
(declare-fun lt!634038 () Unit!48672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48672)

(assert (=> b!1443955 (= lt!634038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443956 () Bool)

(declare-fun res!976008 () Bool)

(declare-fun e!813625 () Bool)

(assert (=> b!1443956 (=> (not res!976008) (not e!813625))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443956 (= res!976008 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47886 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47886 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47886 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443957 () Bool)

(declare-fun e!813630 () Bool)

(assert (=> b!1443957 (= e!813630 e!813632)))

(declare-fun res!976001 () Bool)

(assert (=> b!1443957 (=> (not res!976001) (not e!813632))))

(declare-datatypes ((SeekEntryResult!11588 0))(
  ( (MissingZero!11588 (index!48744 (_ BitVec 32))) (Found!11588 (index!48745 (_ BitVec 32))) (Intermediate!11588 (undefined!12400 Bool) (index!48746 (_ BitVec 32)) (x!130445 (_ BitVec 32))) (Undefined!11588) (MissingVacant!11588 (index!48747 (_ BitVec 32))) )
))
(declare-fun lt!634033 () SeekEntryResult!11588)

(assert (=> b!1443957 (= res!976001 (= lt!634033 (Intermediate!11588 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634035 () (_ BitVec 64))

(declare-fun lt!634036 () array!98096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98096 (_ BitVec 32)) SeekEntryResult!11588)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443957 (= lt!634033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634035 mask!2687) lt!634035 lt!634036 mask!2687))))

(assert (=> b!1443957 (= lt!634035 (select (store (arr!47336 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443958 () Bool)

(declare-fun res!976013 () Bool)

(assert (=> b!1443958 (=> (not res!976013) (not e!813625))))

(assert (=> b!1443958 (= res!976013 (and (= (size!47886 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47886 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47886 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443960 () Bool)

(declare-fun res!976000 () Bool)

(assert (=> b!1443960 (=> (not res!976000) (not e!813632))))

(assert (=> b!1443960 (= res!976000 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443961 () Bool)

(declare-fun res!976005 () Bool)

(assert (=> b!1443961 (=> (not res!976005) (not e!813625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443961 (= res!976005 (validKeyInArray!0 (select (arr!47336 a!2862) i!1006)))))

(declare-fun b!1443962 () Bool)

(declare-fun res!976010 () Bool)

(assert (=> b!1443962 (=> (not res!976010) (not e!813632))))

(declare-fun e!813628 () Bool)

(assert (=> b!1443962 (= res!976010 e!813628)))

(declare-fun c!133488 () Bool)

(assert (=> b!1443962 (= c!133488 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443963 () Bool)

(declare-fun res!976012 () Bool)

(assert (=> b!1443963 (=> (not res!976012) (not e!813626))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98096 (_ BitVec 32)) SeekEntryResult!11588)

(assert (=> b!1443963 (= res!976012 (= (seekEntryOrOpen!0 (select (arr!47336 a!2862) j!93) a!2862 mask!2687) (Found!11588 j!93)))))

(declare-fun b!1443964 () Bool)

(assert (=> b!1443964 (= e!813629 true)))

(declare-fun lt!634034 () SeekEntryResult!11588)

(assert (=> b!1443964 (= lt!634034 (seekEntryOrOpen!0 lt!634035 lt!634036 mask!2687))))

(declare-fun b!1443965 () Bool)

(assert (=> b!1443965 (= e!813628 (= lt!634033 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634035 lt!634036 mask!2687)))))

(declare-fun b!1443966 () Bool)

(assert (=> b!1443966 (= e!813626 (or (= (select (arr!47336 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47336 a!2862) intermediateBeforeIndex!19) (select (arr!47336 a!2862) j!93))))))

(declare-fun b!1443959 () Bool)

(declare-fun res!976003 () Bool)

(assert (=> b!1443959 (=> (not res!976003) (not e!813630))))

(declare-fun lt!634037 () SeekEntryResult!11588)

(assert (=> b!1443959 (= res!976003 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47336 a!2862) j!93) a!2862 mask!2687) lt!634037))))

(declare-fun res!976004 () Bool)

(assert (=> start!124648 (=> (not res!976004) (not e!813625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124648 (= res!976004 (validMask!0 mask!2687))))

(assert (=> start!124648 e!813625))

(assert (=> start!124648 true))

(declare-fun array_inv!36364 (array!98096) Bool)

(assert (=> start!124648 (array_inv!36364 a!2862)))

(declare-fun b!1443967 () Bool)

(declare-fun res!976011 () Bool)

(assert (=> b!1443967 (=> (not res!976011) (not e!813625))))

(assert (=> b!1443967 (= res!976011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443968 () Bool)

(declare-fun res!976002 () Bool)

(assert (=> b!1443968 (=> (not res!976002) (not e!813625))))

(declare-datatypes ((List!33837 0))(
  ( (Nil!33834) (Cons!33833 (h!35183 (_ BitVec 64)) (t!48531 List!33837)) )
))
(declare-fun arrayNoDuplicates!0 (array!98096 (_ BitVec 32) List!33837) Bool)

(assert (=> b!1443968 (= res!976002 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33834))))

(declare-fun b!1443969 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98096 (_ BitVec 32)) SeekEntryResult!11588)

(assert (=> b!1443969 (= e!813628 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634035 lt!634036 mask!2687) (seekEntryOrOpen!0 lt!634035 lt!634036 mask!2687)))))

(declare-fun b!1443970 () Bool)

(declare-fun e!813627 () Bool)

(assert (=> b!1443970 (= e!813627 e!813630)))

(declare-fun res!976009 () Bool)

(assert (=> b!1443970 (=> (not res!976009) (not e!813630))))

(assert (=> b!1443970 (= res!976009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47336 a!2862) j!93) mask!2687) (select (arr!47336 a!2862) j!93) a!2862 mask!2687) lt!634037))))

(assert (=> b!1443970 (= lt!634037 (Intermediate!11588 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443971 () Bool)

(assert (=> b!1443971 (= e!813625 e!813627)))

(declare-fun res!976006 () Bool)

(assert (=> b!1443971 (=> (not res!976006) (not e!813627))))

(assert (=> b!1443971 (= res!976006 (= (select (store (arr!47336 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443971 (= lt!634036 (array!98097 (store (arr!47336 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47886 a!2862)))))

(declare-fun b!1443972 () Bool)

(declare-fun res!976014 () Bool)

(assert (=> b!1443972 (=> (not res!976014) (not e!813625))))

(assert (=> b!1443972 (= res!976014 (validKeyInArray!0 (select (arr!47336 a!2862) j!93)))))

(assert (= (and start!124648 res!976004) b!1443958))

(assert (= (and b!1443958 res!976013) b!1443961))

(assert (= (and b!1443961 res!976005) b!1443972))

(assert (= (and b!1443972 res!976014) b!1443967))

(assert (= (and b!1443967 res!976011) b!1443968))

(assert (= (and b!1443968 res!976002) b!1443956))

(assert (= (and b!1443956 res!976008) b!1443971))

(assert (= (and b!1443971 res!976006) b!1443970))

(assert (= (and b!1443970 res!976009) b!1443959))

(assert (= (and b!1443959 res!976003) b!1443957))

(assert (= (and b!1443957 res!976001) b!1443962))

(assert (= (and b!1443962 c!133488) b!1443965))

(assert (= (and b!1443962 (not c!133488)) b!1443969))

(assert (= (and b!1443962 res!976010) b!1443960))

(assert (= (and b!1443960 res!976000) b!1443955))

(assert (= (and b!1443955 res!976007) b!1443963))

(assert (= (and b!1443963 res!976012) b!1443966))

(assert (= (and b!1443955 (not res!976015)) b!1443964))

(declare-fun m!1333003 () Bool)

(assert (=> b!1443968 m!1333003))

(declare-fun m!1333005 () Bool)

(assert (=> b!1443955 m!1333005))

(declare-fun m!1333007 () Bool)

(assert (=> b!1443955 m!1333007))

(declare-fun m!1333009 () Bool)

(assert (=> b!1443955 m!1333009))

(declare-fun m!1333011 () Bool)

(assert (=> b!1443955 m!1333011))

(declare-fun m!1333013 () Bool)

(assert (=> b!1443955 m!1333013))

(declare-fun m!1333015 () Bool)

(assert (=> b!1443955 m!1333015))

(declare-fun m!1333017 () Bool)

(assert (=> b!1443961 m!1333017))

(assert (=> b!1443961 m!1333017))

(declare-fun m!1333019 () Bool)

(assert (=> b!1443961 m!1333019))

(assert (=> b!1443971 m!1333007))

(declare-fun m!1333021 () Bool)

(assert (=> b!1443971 m!1333021))

(declare-fun m!1333023 () Bool)

(assert (=> b!1443964 m!1333023))

(declare-fun m!1333025 () Bool)

(assert (=> b!1443966 m!1333025))

(assert (=> b!1443966 m!1333015))

(declare-fun m!1333027 () Bool)

(assert (=> b!1443967 m!1333027))

(assert (=> b!1443963 m!1333015))

(assert (=> b!1443963 m!1333015))

(declare-fun m!1333029 () Bool)

(assert (=> b!1443963 m!1333029))

(assert (=> b!1443959 m!1333015))

(assert (=> b!1443959 m!1333015))

(declare-fun m!1333031 () Bool)

(assert (=> b!1443959 m!1333031))

(declare-fun m!1333033 () Bool)

(assert (=> start!124648 m!1333033))

(declare-fun m!1333035 () Bool)

(assert (=> start!124648 m!1333035))

(declare-fun m!1333037 () Bool)

(assert (=> b!1443965 m!1333037))

(declare-fun m!1333039 () Bool)

(assert (=> b!1443957 m!1333039))

(assert (=> b!1443957 m!1333039))

(declare-fun m!1333041 () Bool)

(assert (=> b!1443957 m!1333041))

(assert (=> b!1443957 m!1333007))

(declare-fun m!1333043 () Bool)

(assert (=> b!1443957 m!1333043))

(assert (=> b!1443970 m!1333015))

(assert (=> b!1443970 m!1333015))

(declare-fun m!1333045 () Bool)

(assert (=> b!1443970 m!1333045))

(assert (=> b!1443970 m!1333045))

(assert (=> b!1443970 m!1333015))

(declare-fun m!1333047 () Bool)

(assert (=> b!1443970 m!1333047))

(assert (=> b!1443972 m!1333015))

(assert (=> b!1443972 m!1333015))

(declare-fun m!1333049 () Bool)

(assert (=> b!1443972 m!1333049))

(declare-fun m!1333051 () Bool)

(assert (=> b!1443969 m!1333051))

(assert (=> b!1443969 m!1333023))

(push 1)

