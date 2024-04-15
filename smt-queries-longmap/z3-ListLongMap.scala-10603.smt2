; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124726 () Bool)

(assert start!124726)

(declare-fun b!1446579 () Bool)

(declare-fun e!814723 () Bool)

(declare-fun e!814727 () Bool)

(assert (=> b!1446579 (= e!814723 e!814727)))

(declare-fun res!978423 () Bool)

(assert (=> b!1446579 (=> (not res!978423) (not e!814727))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98152 0))(
  ( (array!98153 (arr!47365 (Array (_ BitVec 32) (_ BitVec 64))) (size!47917 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98152)

(assert (=> b!1446579 (= res!978423 (= (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634683 () array!98152)

(assert (=> b!1446579 (= lt!634683 (array!98153 (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47917 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1446580 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!814726 () Bool)

(assert (=> b!1446580 (= e!814726 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun e!814728 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634689 () (_ BitVec 64))

(declare-fun b!1446582 () Bool)

(declare-datatypes ((SeekEntryResult!11642 0))(
  ( (MissingZero!11642 (index!48960 (_ BitVec 32))) (Found!11642 (index!48961 (_ BitVec 32))) (Intermediate!11642 (undefined!12454 Bool) (index!48962 (_ BitVec 32)) (x!130638 (_ BitVec 32))) (Undefined!11642) (MissingVacant!11642 (index!48963 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98152 (_ BitVec 32)) SeekEntryResult!11642)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98152 (_ BitVec 32)) SeekEntryResult!11642)

(assert (=> b!1446582 (= e!814728 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634689 lt!634683 mask!2687) (seekEntryOrOpen!0 lt!634689 lt!634683 mask!2687)))))

(declare-fun b!1446583 () Bool)

(declare-fun res!978417 () Bool)

(assert (=> b!1446583 (=> (not res!978417) (not e!814723))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446583 (= res!978417 (validKeyInArray!0 (select (arr!47365 a!2862) j!93)))))

(declare-fun b!1446584 () Bool)

(declare-fun e!814722 () Bool)

(assert (=> b!1446584 (= e!814722 true)))

(declare-fun lt!634688 () SeekEntryResult!11642)

(assert (=> b!1446584 (= lt!634688 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47365 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446585 () Bool)

(declare-fun res!978431 () Bool)

(declare-fun e!814719 () Bool)

(assert (=> b!1446585 (=> (not res!978431) (not e!814719))))

(assert (=> b!1446585 (= res!978431 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446586 () Bool)

(declare-fun e!814721 () Bool)

(assert (=> b!1446586 (= e!814727 e!814721)))

(declare-fun res!978421 () Bool)

(assert (=> b!1446586 (=> (not res!978421) (not e!814721))))

(declare-fun lt!634684 () SeekEntryResult!11642)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98152 (_ BitVec 32)) SeekEntryResult!11642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446586 (= res!978421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47365 a!2862) j!93) mask!2687) (select (arr!47365 a!2862) j!93) a!2862 mask!2687) lt!634684))))

(assert (=> b!1446586 (= lt!634684 (Intermediate!11642 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!634687 () SeekEntryResult!11642)

(declare-fun b!1446587 () Bool)

(assert (=> b!1446587 (= e!814728 (= lt!634687 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634689 lt!634683 mask!2687)))))

(declare-fun b!1446588 () Bool)

(declare-fun res!978419 () Bool)

(assert (=> b!1446588 (=> (not res!978419) (not e!814723))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446588 (= res!978419 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47917 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47917 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47917 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446589 () Bool)

(declare-fun e!814725 () Bool)

(declare-fun e!814724 () Bool)

(assert (=> b!1446589 (= e!814725 e!814724)))

(declare-fun res!978430 () Bool)

(assert (=> b!1446589 (=> res!978430 e!814724)))

(assert (=> b!1446589 (= res!978430 (or (and (= (select (arr!47365 a!2862) index!646) (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47365 a!2862) index!646) (select (arr!47365 a!2862) j!93))) (not (= (select (arr!47365 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446590 () Bool)

(declare-fun res!978422 () Bool)

(assert (=> b!1446590 (=> (not res!978422) (not e!814723))))

(assert (=> b!1446590 (= res!978422 (and (= (size!47917 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47917 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47917 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446591 () Bool)

(assert (=> b!1446591 (= e!814721 e!814719)))

(declare-fun res!978427 () Bool)

(assert (=> b!1446591 (=> (not res!978427) (not e!814719))))

(assert (=> b!1446591 (= res!978427 (= lt!634687 (Intermediate!11642 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446591 (= lt!634687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634689 mask!2687) lt!634689 lt!634683 mask!2687))))

(assert (=> b!1446591 (= lt!634689 (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446592 () Bool)

(declare-fun res!978429 () Bool)

(assert (=> b!1446592 (=> (not res!978429) (not e!814719))))

(assert (=> b!1446592 (= res!978429 e!814728)))

(declare-fun c!133594 () Bool)

(assert (=> b!1446592 (= c!133594 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446593 () Bool)

(declare-fun res!978425 () Bool)

(assert (=> b!1446593 (=> (not res!978425) (not e!814721))))

(assert (=> b!1446593 (= res!978425 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47365 a!2862) j!93) a!2862 mask!2687) lt!634684))))

(declare-fun b!1446581 () Bool)

(assert (=> b!1446581 (= e!814719 (not e!814722))))

(declare-fun res!978420 () Bool)

(assert (=> b!1446581 (=> res!978420 e!814722)))

(assert (=> b!1446581 (= res!978420 (or (and (= (select (arr!47365 a!2862) index!646) (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47365 a!2862) index!646) (select (arr!47365 a!2862) j!93))) (not (= (select (arr!47365 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47365 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446581 e!814725))

(declare-fun res!978432 () Bool)

(assert (=> b!1446581 (=> (not res!978432) (not e!814725))))

(declare-fun lt!634686 () SeekEntryResult!11642)

(assert (=> b!1446581 (= res!978432 (and (= lt!634686 (Found!11642 j!93)) (or (= (select (arr!47365 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47365 a!2862) intermediateBeforeIndex!19) (select (arr!47365 a!2862) j!93)))))))

(assert (=> b!1446581 (= lt!634686 (seekEntryOrOpen!0 (select (arr!47365 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98152 (_ BitVec 32)) Bool)

(assert (=> b!1446581 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48621 0))(
  ( (Unit!48622) )
))
(declare-fun lt!634685 () Unit!48621)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48621)

(assert (=> b!1446581 (= lt!634685 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!978433 () Bool)

(assert (=> start!124726 (=> (not res!978433) (not e!814723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124726 (= res!978433 (validMask!0 mask!2687))))

(assert (=> start!124726 e!814723))

(assert (=> start!124726 true))

(declare-fun array_inv!36598 (array!98152) Bool)

(assert (=> start!124726 (array_inv!36598 a!2862)))

(declare-fun b!1446594 () Bool)

(declare-fun res!978428 () Bool)

(assert (=> b!1446594 (=> (not res!978428) (not e!814723))))

(assert (=> b!1446594 (= res!978428 (validKeyInArray!0 (select (arr!47365 a!2862) i!1006)))))

(declare-fun b!1446595 () Bool)

(declare-fun res!978418 () Bool)

(assert (=> b!1446595 (=> (not res!978418) (not e!814723))))

(assert (=> b!1446595 (= res!978418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446596 () Bool)

(declare-fun res!978426 () Bool)

(assert (=> b!1446596 (=> (not res!978426) (not e!814723))))

(declare-datatypes ((List!33944 0))(
  ( (Nil!33941) (Cons!33940 (h!35290 (_ BitVec 64)) (t!48630 List!33944)) )
))
(declare-fun arrayNoDuplicates!0 (array!98152 (_ BitVec 32) List!33944) Bool)

(assert (=> b!1446596 (= res!978426 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33941))))

(declare-fun b!1446597 () Bool)

(assert (=> b!1446597 (= e!814724 e!814726)))

(declare-fun res!978424 () Bool)

(assert (=> b!1446597 (=> (not res!978424) (not e!814726))))

(assert (=> b!1446597 (= res!978424 (= lt!634686 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47365 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!124726 res!978433) b!1446590))

(assert (= (and b!1446590 res!978422) b!1446594))

(assert (= (and b!1446594 res!978428) b!1446583))

(assert (= (and b!1446583 res!978417) b!1446595))

(assert (= (and b!1446595 res!978418) b!1446596))

(assert (= (and b!1446596 res!978426) b!1446588))

(assert (= (and b!1446588 res!978419) b!1446579))

(assert (= (and b!1446579 res!978423) b!1446586))

(assert (= (and b!1446586 res!978421) b!1446593))

(assert (= (and b!1446593 res!978425) b!1446591))

(assert (= (and b!1446591 res!978427) b!1446592))

(assert (= (and b!1446592 c!133594) b!1446587))

(assert (= (and b!1446592 (not c!133594)) b!1446582))

(assert (= (and b!1446592 res!978429) b!1446585))

(assert (= (and b!1446585 res!978431) b!1446581))

(assert (= (and b!1446581 res!978432) b!1446589))

(assert (= (and b!1446589 (not res!978430)) b!1446597))

(assert (= (and b!1446597 res!978424) b!1446580))

(assert (= (and b!1446581 (not res!978420)) b!1446584))

(declare-fun m!1334949 () Bool)

(assert (=> b!1446586 m!1334949))

(assert (=> b!1446586 m!1334949))

(declare-fun m!1334951 () Bool)

(assert (=> b!1446586 m!1334951))

(assert (=> b!1446586 m!1334951))

(assert (=> b!1446586 m!1334949))

(declare-fun m!1334953 () Bool)

(assert (=> b!1446586 m!1334953))

(assert (=> b!1446593 m!1334949))

(assert (=> b!1446593 m!1334949))

(declare-fun m!1334955 () Bool)

(assert (=> b!1446593 m!1334955))

(assert (=> b!1446583 m!1334949))

(assert (=> b!1446583 m!1334949))

(declare-fun m!1334957 () Bool)

(assert (=> b!1446583 m!1334957))

(declare-fun m!1334959 () Bool)

(assert (=> start!124726 m!1334959))

(declare-fun m!1334961 () Bool)

(assert (=> start!124726 m!1334961))

(declare-fun m!1334963 () Bool)

(assert (=> b!1446581 m!1334963))

(declare-fun m!1334965 () Bool)

(assert (=> b!1446581 m!1334965))

(declare-fun m!1334967 () Bool)

(assert (=> b!1446581 m!1334967))

(declare-fun m!1334969 () Bool)

(assert (=> b!1446581 m!1334969))

(declare-fun m!1334971 () Bool)

(assert (=> b!1446581 m!1334971))

(assert (=> b!1446581 m!1334949))

(declare-fun m!1334973 () Bool)

(assert (=> b!1446581 m!1334973))

(declare-fun m!1334975 () Bool)

(assert (=> b!1446581 m!1334975))

(assert (=> b!1446581 m!1334949))

(declare-fun m!1334977 () Bool)

(assert (=> b!1446595 m!1334977))

(assert (=> b!1446597 m!1334949))

(assert (=> b!1446597 m!1334949))

(declare-fun m!1334979 () Bool)

(assert (=> b!1446597 m!1334979))

(declare-fun m!1334981 () Bool)

(assert (=> b!1446582 m!1334981))

(declare-fun m!1334983 () Bool)

(assert (=> b!1446582 m!1334983))

(assert (=> b!1446589 m!1334971))

(assert (=> b!1446589 m!1334965))

(assert (=> b!1446589 m!1334969))

(assert (=> b!1446589 m!1334949))

(declare-fun m!1334985 () Bool)

(assert (=> b!1446594 m!1334985))

(assert (=> b!1446594 m!1334985))

(declare-fun m!1334987 () Bool)

(assert (=> b!1446594 m!1334987))

(assert (=> b!1446584 m!1334949))

(assert (=> b!1446584 m!1334949))

(declare-fun m!1334989 () Bool)

(assert (=> b!1446584 m!1334989))

(assert (=> b!1446579 m!1334965))

(declare-fun m!1334991 () Bool)

(assert (=> b!1446579 m!1334991))

(declare-fun m!1334993 () Bool)

(assert (=> b!1446587 m!1334993))

(declare-fun m!1334995 () Bool)

(assert (=> b!1446591 m!1334995))

(assert (=> b!1446591 m!1334995))

(declare-fun m!1334997 () Bool)

(assert (=> b!1446591 m!1334997))

(assert (=> b!1446591 m!1334965))

(declare-fun m!1334999 () Bool)

(assert (=> b!1446591 m!1334999))

(declare-fun m!1335001 () Bool)

(assert (=> b!1446596 m!1335001))

(check-sat (not b!1446591) (not b!1446597) (not b!1446583) (not b!1446593) (not b!1446594) (not b!1446587) (not b!1446582) (not b!1446586) (not start!124726) (not b!1446581) (not b!1446595) (not b!1446596) (not b!1446584))
(check-sat)
