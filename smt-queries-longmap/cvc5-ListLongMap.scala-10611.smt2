; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124804 () Bool)

(assert start!124804)

(declare-fun b!1448142 () Bool)

(declare-fun res!979725 () Bool)

(declare-fun e!815564 () Bool)

(assert (=> b!1448142 (=> (not res!979725) (not e!815564))))

(declare-datatypes ((array!98252 0))(
  ( (array!98253 (arr!47414 (Array (_ BitVec 32) (_ BitVec 64))) (size!47964 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98252)

(declare-datatypes ((List!33915 0))(
  ( (Nil!33912) (Cons!33911 (h!35261 (_ BitVec 64)) (t!48609 List!33915)) )
))
(declare-fun arrayNoDuplicates!0 (array!98252 (_ BitVec 32) List!33915) Bool)

(assert (=> b!1448142 (= res!979725 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33912))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1448143 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!635426 () array!98252)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635425 () (_ BitVec 64))

(declare-fun e!815562 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11666 0))(
  ( (MissingZero!11666 (index!49056 (_ BitVec 32))) (Found!11666 (index!49057 (_ BitVec 32))) (Intermediate!11666 (undefined!12478 Bool) (index!49058 (_ BitVec 32)) (x!130731 (_ BitVec 32))) (Undefined!11666) (MissingVacant!11666 (index!49059 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98252 (_ BitVec 32)) SeekEntryResult!11666)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98252 (_ BitVec 32)) SeekEntryResult!11666)

(assert (=> b!1448143 (= e!815562 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635425 lt!635426 mask!2687) (seekEntryOrOpen!0 lt!635425 lt!635426 mask!2687)))))

(declare-fun b!1448144 () Bool)

(declare-fun e!815557 () Bool)

(declare-fun e!815560 () Bool)

(assert (=> b!1448144 (= e!815557 e!815560)))

(declare-fun res!979728 () Bool)

(assert (=> b!1448144 (=> (not res!979728) (not e!815560))))

(declare-fun lt!635427 () SeekEntryResult!11666)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1448144 (= res!979728 (= lt!635427 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47414 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448145 () Bool)

(declare-fun res!979726 () Bool)

(declare-fun e!815558 () Bool)

(assert (=> b!1448145 (=> (not res!979726) (not e!815558))))

(declare-fun lt!635422 () SeekEntryResult!11666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98252 (_ BitVec 32)) SeekEntryResult!11666)

(assert (=> b!1448145 (= res!979726 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47414 a!2862) j!93) a!2862 mask!2687) lt!635422))))

(declare-fun b!1448146 () Bool)

(declare-fun e!815556 () Bool)

(assert (=> b!1448146 (= e!815556 e!815557)))

(declare-fun res!979733 () Bool)

(assert (=> b!1448146 (=> res!979733 e!815557)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448146 (= res!979733 (or (and (= (select (arr!47414 a!2862) index!646) (select (store (arr!47414 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47414 a!2862) index!646) (select (arr!47414 a!2862) j!93))) (not (= (select (arr!47414 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!979732 () Bool)

(assert (=> start!124804 (=> (not res!979732) (not e!815564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124804 (= res!979732 (validMask!0 mask!2687))))

(assert (=> start!124804 e!815564))

(assert (=> start!124804 true))

(declare-fun array_inv!36442 (array!98252) Bool)

(assert (=> start!124804 (array_inv!36442 a!2862)))

(declare-fun b!1448147 () Bool)

(declare-fun e!815555 () Bool)

(assert (=> b!1448147 (= e!815558 e!815555)))

(declare-fun res!979730 () Bool)

(assert (=> b!1448147 (=> (not res!979730) (not e!815555))))

(declare-fun lt!635423 () SeekEntryResult!11666)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448147 (= res!979730 (= lt!635423 (Intermediate!11666 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448147 (= lt!635423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635425 mask!2687) lt!635425 lt!635426 mask!2687))))

(assert (=> b!1448147 (= lt!635425 (select (store (arr!47414 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448148 () Bool)

(declare-fun res!979734 () Bool)

(assert (=> b!1448148 (=> (not res!979734) (not e!815555))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448148 (= res!979734 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448149 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1448149 (= e!815560 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448150 () Bool)

(declare-fun res!979731 () Bool)

(assert (=> b!1448150 (=> (not res!979731) (not e!815564))))

(assert (=> b!1448150 (= res!979731 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47964 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47964 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47964 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448151 () Bool)

(declare-fun e!815559 () Bool)

(assert (=> b!1448151 (= e!815559 true)))

(declare-fun lt!635424 () SeekEntryResult!11666)

(assert (=> b!1448151 (= lt!635424 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47414 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448152 () Bool)

(declare-fun res!979729 () Bool)

(assert (=> b!1448152 (=> (not res!979729) (not e!815564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448152 (= res!979729 (validKeyInArray!0 (select (arr!47414 a!2862) i!1006)))))

(declare-fun b!1448153 () Bool)

(declare-fun res!979722 () Bool)

(assert (=> b!1448153 (=> (not res!979722) (not e!815555))))

(assert (=> b!1448153 (= res!979722 e!815562)))

(declare-fun c!133722 () Bool)

(assert (=> b!1448153 (= c!133722 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448154 () Bool)

(assert (=> b!1448154 (= e!815562 (= lt!635423 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635425 lt!635426 mask!2687)))))

(declare-fun b!1448155 () Bool)

(declare-fun res!979723 () Bool)

(assert (=> b!1448155 (=> (not res!979723) (not e!815564))))

(assert (=> b!1448155 (= res!979723 (and (= (size!47964 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47964 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47964 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448156 () Bool)

(declare-fun e!815561 () Bool)

(assert (=> b!1448156 (= e!815561 e!815558)))

(declare-fun res!979719 () Bool)

(assert (=> b!1448156 (=> (not res!979719) (not e!815558))))

(assert (=> b!1448156 (= res!979719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47414 a!2862) j!93) mask!2687) (select (arr!47414 a!2862) j!93) a!2862 mask!2687) lt!635422))))

(assert (=> b!1448156 (= lt!635422 (Intermediate!11666 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448157 () Bool)

(declare-fun res!979720 () Bool)

(assert (=> b!1448157 (=> (not res!979720) (not e!815564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98252 (_ BitVec 32)) Bool)

(assert (=> b!1448157 (= res!979720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448158 () Bool)

(declare-fun res!979721 () Bool)

(assert (=> b!1448158 (=> (not res!979721) (not e!815564))))

(assert (=> b!1448158 (= res!979721 (validKeyInArray!0 (select (arr!47414 a!2862) j!93)))))

(declare-fun b!1448159 () Bool)

(assert (=> b!1448159 (= e!815564 e!815561)))

(declare-fun res!979727 () Bool)

(assert (=> b!1448159 (=> (not res!979727) (not e!815561))))

(assert (=> b!1448159 (= res!979727 (= (select (store (arr!47414 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448159 (= lt!635426 (array!98253 (store (arr!47414 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47964 a!2862)))))

(declare-fun b!1448160 () Bool)

(assert (=> b!1448160 (= e!815555 (not e!815559))))

(declare-fun res!979724 () Bool)

(assert (=> b!1448160 (=> res!979724 e!815559)))

(assert (=> b!1448160 (= res!979724 (or (and (= (select (arr!47414 a!2862) index!646) (select (store (arr!47414 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47414 a!2862) index!646) (select (arr!47414 a!2862) j!93))) (not (= (select (arr!47414 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47414 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448160 e!815556))

(declare-fun res!979735 () Bool)

(assert (=> b!1448160 (=> (not res!979735) (not e!815556))))

(assert (=> b!1448160 (= res!979735 (and (= lt!635427 (Found!11666 j!93)) (or (= (select (arr!47414 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47414 a!2862) intermediateBeforeIndex!19) (select (arr!47414 a!2862) j!93)))))))

(assert (=> b!1448160 (= lt!635427 (seekEntryOrOpen!0 (select (arr!47414 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448160 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48828 0))(
  ( (Unit!48829) )
))
(declare-fun lt!635421 () Unit!48828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48828)

(assert (=> b!1448160 (= lt!635421 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124804 res!979732) b!1448155))

(assert (= (and b!1448155 res!979723) b!1448152))

(assert (= (and b!1448152 res!979729) b!1448158))

(assert (= (and b!1448158 res!979721) b!1448157))

(assert (= (and b!1448157 res!979720) b!1448142))

(assert (= (and b!1448142 res!979725) b!1448150))

(assert (= (and b!1448150 res!979731) b!1448159))

(assert (= (and b!1448159 res!979727) b!1448156))

(assert (= (and b!1448156 res!979719) b!1448145))

(assert (= (and b!1448145 res!979726) b!1448147))

(assert (= (and b!1448147 res!979730) b!1448153))

(assert (= (and b!1448153 c!133722) b!1448154))

(assert (= (and b!1448153 (not c!133722)) b!1448143))

(assert (= (and b!1448153 res!979722) b!1448148))

(assert (= (and b!1448148 res!979734) b!1448160))

(assert (= (and b!1448160 res!979735) b!1448146))

(assert (= (and b!1448146 (not res!979733)) b!1448144))

(assert (= (and b!1448144 res!979728) b!1448149))

(assert (= (and b!1448160 (not res!979724)) b!1448151))

(declare-fun m!1336921 () Bool)

(assert (=> b!1448143 m!1336921))

(declare-fun m!1336923 () Bool)

(assert (=> b!1448143 m!1336923))

(declare-fun m!1336925 () Bool)

(assert (=> b!1448142 m!1336925))

(declare-fun m!1336927 () Bool)

(assert (=> b!1448146 m!1336927))

(declare-fun m!1336929 () Bool)

(assert (=> b!1448146 m!1336929))

(declare-fun m!1336931 () Bool)

(assert (=> b!1448146 m!1336931))

(declare-fun m!1336933 () Bool)

(assert (=> b!1448146 m!1336933))

(declare-fun m!1336935 () Bool)

(assert (=> b!1448154 m!1336935))

(declare-fun m!1336937 () Bool)

(assert (=> b!1448157 m!1336937))

(assert (=> b!1448144 m!1336933))

(assert (=> b!1448144 m!1336933))

(declare-fun m!1336939 () Bool)

(assert (=> b!1448144 m!1336939))

(declare-fun m!1336941 () Bool)

(assert (=> b!1448152 m!1336941))

(assert (=> b!1448152 m!1336941))

(declare-fun m!1336943 () Bool)

(assert (=> b!1448152 m!1336943))

(declare-fun m!1336945 () Bool)

(assert (=> b!1448147 m!1336945))

(assert (=> b!1448147 m!1336945))

(declare-fun m!1336947 () Bool)

(assert (=> b!1448147 m!1336947))

(assert (=> b!1448147 m!1336929))

(declare-fun m!1336949 () Bool)

(assert (=> b!1448147 m!1336949))

(assert (=> b!1448158 m!1336933))

(assert (=> b!1448158 m!1336933))

(declare-fun m!1336951 () Bool)

(assert (=> b!1448158 m!1336951))

(assert (=> b!1448156 m!1336933))

(assert (=> b!1448156 m!1336933))

(declare-fun m!1336953 () Bool)

(assert (=> b!1448156 m!1336953))

(assert (=> b!1448156 m!1336953))

(assert (=> b!1448156 m!1336933))

(declare-fun m!1336955 () Bool)

(assert (=> b!1448156 m!1336955))

(declare-fun m!1336957 () Bool)

(assert (=> b!1448160 m!1336957))

(assert (=> b!1448160 m!1336929))

(declare-fun m!1336959 () Bool)

(assert (=> b!1448160 m!1336959))

(assert (=> b!1448160 m!1336931))

(assert (=> b!1448160 m!1336927))

(assert (=> b!1448160 m!1336933))

(declare-fun m!1336961 () Bool)

(assert (=> b!1448160 m!1336961))

(declare-fun m!1336963 () Bool)

(assert (=> b!1448160 m!1336963))

(assert (=> b!1448160 m!1336933))

(assert (=> b!1448151 m!1336933))

(assert (=> b!1448151 m!1336933))

(declare-fun m!1336965 () Bool)

(assert (=> b!1448151 m!1336965))

(declare-fun m!1336967 () Bool)

(assert (=> start!124804 m!1336967))

(declare-fun m!1336969 () Bool)

(assert (=> start!124804 m!1336969))

(assert (=> b!1448159 m!1336929))

(declare-fun m!1336971 () Bool)

(assert (=> b!1448159 m!1336971))

(assert (=> b!1448145 m!1336933))

(assert (=> b!1448145 m!1336933))

(declare-fun m!1336973 () Bool)

(assert (=> b!1448145 m!1336973))

(push 1)

