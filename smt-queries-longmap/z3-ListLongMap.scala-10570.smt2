; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124560 () Bool)

(assert start!124560)

(declare-fun b!1441717 () Bool)

(declare-fun e!812686 () Bool)

(declare-fun e!812685 () Bool)

(assert (=> b!1441717 (= e!812686 e!812685)))

(declare-fun res!974034 () Bool)

(assert (=> b!1441717 (=> (not res!974034) (not e!812685))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98008 0))(
  ( (array!98009 (arr!47292 (Array (_ BitVec 32) (_ BitVec 64))) (size!47842 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98008)

(assert (=> b!1441717 (= res!974034 (= (select (store (arr!47292 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633337 () array!98008)

(assert (=> b!1441717 (= lt!633337 (array!98009 (store (arr!47292 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47842 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!812688 () Bool)

(declare-fun b!1441718 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633336 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11544 0))(
  ( (MissingZero!11544 (index!48568 (_ BitVec 32))) (Found!11544 (index!48569 (_ BitVec 32))) (Intermediate!11544 (undefined!12356 Bool) (index!48570 (_ BitVec 32)) (x!130281 (_ BitVec 32))) (Undefined!11544) (MissingVacant!11544 (index!48571 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98008 (_ BitVec 32)) SeekEntryResult!11544)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98008 (_ BitVec 32)) SeekEntryResult!11544)

(assert (=> b!1441718 (= e!812688 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633336 lt!633337 mask!2687) (seekEntryOrOpen!0 lt!633336 lt!633337 mask!2687)))))

(declare-fun res!974035 () Bool)

(assert (=> start!124560 (=> (not res!974035) (not e!812686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124560 (= res!974035 (validMask!0 mask!2687))))

(assert (=> start!124560 e!812686))

(assert (=> start!124560 true))

(declare-fun array_inv!36320 (array!98008) Bool)

(assert (=> start!124560 (array_inv!36320 a!2862)))

(declare-fun b!1441719 () Bool)

(declare-fun res!974029 () Bool)

(declare-fun e!812687 () Bool)

(assert (=> b!1441719 (=> (not res!974029) (not e!812687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!633335 () SeekEntryResult!11544)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98008 (_ BitVec 32)) SeekEntryResult!11544)

(assert (=> b!1441719 (= res!974029 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47292 a!2862) j!93) a!2862 mask!2687) lt!633335))))

(declare-fun b!1441720 () Bool)

(declare-fun res!974027 () Bool)

(assert (=> b!1441720 (=> (not res!974027) (not e!812686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98008 (_ BitVec 32)) Bool)

(assert (=> b!1441720 (= res!974027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441721 () Bool)

(declare-fun res!974037 () Bool)

(assert (=> b!1441721 (=> (not res!974037) (not e!812686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441721 (= res!974037 (validKeyInArray!0 (select (arr!47292 a!2862) j!93)))))

(declare-fun b!1441722 () Bool)

(declare-fun e!812690 () Bool)

(assert (=> b!1441722 (= e!812687 e!812690)))

(declare-fun res!974036 () Bool)

(assert (=> b!1441722 (=> (not res!974036) (not e!812690))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!633339 () SeekEntryResult!11544)

(assert (=> b!1441722 (= res!974036 (= lt!633339 (Intermediate!11544 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441722 (= lt!633339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633336 mask!2687) lt!633336 lt!633337 mask!2687))))

(assert (=> b!1441722 (= lt!633336 (select (store (arr!47292 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441723 () Bool)

(assert (=> b!1441723 (= e!812685 e!812687)))

(declare-fun res!974032 () Bool)

(assert (=> b!1441723 (=> (not res!974032) (not e!812687))))

(assert (=> b!1441723 (= res!974032 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47292 a!2862) j!93) mask!2687) (select (arr!47292 a!2862) j!93) a!2862 mask!2687) lt!633335))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441723 (= lt!633335 (Intermediate!11544 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441724 () Bool)

(declare-fun res!974028 () Bool)

(assert (=> b!1441724 (=> (not res!974028) (not e!812690))))

(assert (=> b!1441724 (= res!974028 e!812688)))

(declare-fun c!133356 () Bool)

(assert (=> b!1441724 (= c!133356 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441725 () Bool)

(declare-fun res!974038 () Bool)

(assert (=> b!1441725 (=> (not res!974038) (not e!812686))))

(declare-datatypes ((List!33793 0))(
  ( (Nil!33790) (Cons!33789 (h!35139 (_ BitVec 64)) (t!48487 List!33793)) )
))
(declare-fun arrayNoDuplicates!0 (array!98008 (_ BitVec 32) List!33793) Bool)

(assert (=> b!1441725 (= res!974038 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33790))))

(declare-fun b!1441726 () Bool)

(declare-fun res!974026 () Bool)

(assert (=> b!1441726 (=> (not res!974026) (not e!812690))))

(assert (=> b!1441726 (= res!974026 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441727 () Bool)

(declare-fun res!974030 () Bool)

(assert (=> b!1441727 (=> (not res!974030) (not e!812686))))

(assert (=> b!1441727 (= res!974030 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47842 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47842 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47842 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441728 () Bool)

(assert (=> b!1441728 (= e!812688 (= lt!633339 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633336 lt!633337 mask!2687)))))

(declare-fun b!1441729 () Bool)

(assert (=> b!1441729 (= e!812690 (not (bvsge mask!2687 #b00000000000000000000000000000000)))))

(assert (=> b!1441729 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48584 0))(
  ( (Unit!48585) )
))
(declare-fun lt!633338 () Unit!48584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48584)

(assert (=> b!1441729 (= lt!633338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441730 () Bool)

(declare-fun res!974031 () Bool)

(assert (=> b!1441730 (=> (not res!974031) (not e!812686))))

(assert (=> b!1441730 (= res!974031 (and (= (size!47842 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47842 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47842 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441731 () Bool)

(declare-fun res!974033 () Bool)

(assert (=> b!1441731 (=> (not res!974033) (not e!812686))))

(assert (=> b!1441731 (= res!974033 (validKeyInArray!0 (select (arr!47292 a!2862) i!1006)))))

(assert (= (and start!124560 res!974035) b!1441730))

(assert (= (and b!1441730 res!974031) b!1441731))

(assert (= (and b!1441731 res!974033) b!1441721))

(assert (= (and b!1441721 res!974037) b!1441720))

(assert (= (and b!1441720 res!974027) b!1441725))

(assert (= (and b!1441725 res!974038) b!1441727))

(assert (= (and b!1441727 res!974030) b!1441717))

(assert (= (and b!1441717 res!974034) b!1441723))

(assert (= (and b!1441723 res!974032) b!1441719))

(assert (= (and b!1441719 res!974029) b!1441722))

(assert (= (and b!1441722 res!974036) b!1441724))

(assert (= (and b!1441724 c!133356) b!1441728))

(assert (= (and b!1441724 (not c!133356)) b!1441718))

(assert (= (and b!1441724 res!974028) b!1441726))

(assert (= (and b!1441726 res!974026) b!1441729))

(declare-fun m!1330921 () Bool)

(assert (=> b!1441722 m!1330921))

(assert (=> b!1441722 m!1330921))

(declare-fun m!1330923 () Bool)

(assert (=> b!1441722 m!1330923))

(declare-fun m!1330925 () Bool)

(assert (=> b!1441722 m!1330925))

(declare-fun m!1330927 () Bool)

(assert (=> b!1441722 m!1330927))

(declare-fun m!1330929 () Bool)

(assert (=> b!1441725 m!1330929))

(declare-fun m!1330931 () Bool)

(assert (=> start!124560 m!1330931))

(declare-fun m!1330933 () Bool)

(assert (=> start!124560 m!1330933))

(declare-fun m!1330935 () Bool)

(assert (=> b!1441721 m!1330935))

(assert (=> b!1441721 m!1330935))

(declare-fun m!1330937 () Bool)

(assert (=> b!1441721 m!1330937))

(declare-fun m!1330939 () Bool)

(assert (=> b!1441720 m!1330939))

(assert (=> b!1441717 m!1330925))

(declare-fun m!1330941 () Bool)

(assert (=> b!1441717 m!1330941))

(declare-fun m!1330943 () Bool)

(assert (=> b!1441729 m!1330943))

(declare-fun m!1330945 () Bool)

(assert (=> b!1441729 m!1330945))

(declare-fun m!1330947 () Bool)

(assert (=> b!1441718 m!1330947))

(declare-fun m!1330949 () Bool)

(assert (=> b!1441718 m!1330949))

(assert (=> b!1441723 m!1330935))

(assert (=> b!1441723 m!1330935))

(declare-fun m!1330951 () Bool)

(assert (=> b!1441723 m!1330951))

(assert (=> b!1441723 m!1330951))

(assert (=> b!1441723 m!1330935))

(declare-fun m!1330953 () Bool)

(assert (=> b!1441723 m!1330953))

(assert (=> b!1441719 m!1330935))

(assert (=> b!1441719 m!1330935))

(declare-fun m!1330955 () Bool)

(assert (=> b!1441719 m!1330955))

(declare-fun m!1330957 () Bool)

(assert (=> b!1441731 m!1330957))

(assert (=> b!1441731 m!1330957))

(declare-fun m!1330959 () Bool)

(assert (=> b!1441731 m!1330959))

(declare-fun m!1330961 () Bool)

(assert (=> b!1441728 m!1330961))

(check-sat (not b!1441719) (not b!1441718) (not b!1441721) (not b!1441723) (not b!1441728) (not b!1441722) (not b!1441731) (not b!1441725) (not b!1441729) (not start!124560) (not b!1441720))
(check-sat)
