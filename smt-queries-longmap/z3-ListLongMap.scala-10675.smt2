; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125190 () Bool)

(assert start!125190)

(declare-fun b!1459914 () Bool)

(declare-fun e!820953 () Bool)

(declare-fun e!820959 () Bool)

(assert (=> b!1459914 (= e!820953 e!820959)))

(declare-fun res!989768 () Bool)

(assert (=> b!1459914 (=> (not res!989768) (not e!820959))))

(declare-datatypes ((SeekEntryResult!11859 0))(
  ( (MissingZero!11859 (index!49828 (_ BitVec 32))) (Found!11859 (index!49829 (_ BitVec 32))) (Intermediate!11859 (undefined!12671 Bool) (index!49830 (_ BitVec 32)) (x!131436 (_ BitVec 32))) (Undefined!11859) (MissingVacant!11859 (index!49831 (_ BitVec 32))) )
))
(declare-fun lt!639645 () SeekEntryResult!11859)

(declare-datatypes ((array!98638 0))(
  ( (array!98639 (arr!47607 (Array (_ BitVec 32) (_ BitVec 64))) (size!48157 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98638)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98638 (_ BitVec 32)) SeekEntryResult!11859)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459914 (= res!989768 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47607 a!2862) j!93) mask!2687) (select (arr!47607 a!2862) j!93) a!2862 mask!2687) lt!639645))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459914 (= lt!639645 (Intermediate!11859 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459915 () Bool)

(declare-fun e!820958 () Bool)

(assert (=> b!1459915 (= e!820959 e!820958)))

(declare-fun res!989770 () Bool)

(assert (=> b!1459915 (=> (not res!989770) (not e!820958))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!639643 () SeekEntryResult!11859)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459915 (= res!989770 (= lt!639643 (Intermediate!11859 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639642 () array!98638)

(declare-fun lt!639641 () (_ BitVec 64))

(assert (=> b!1459915 (= lt!639643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639641 mask!2687) lt!639641 lt!639642 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459915 (= lt!639641 (select (store (arr!47607 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459916 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639637 () (_ BitVec 32))

(declare-fun lt!639639 () SeekEntryResult!11859)

(declare-fun e!820961 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98638 (_ BitVec 32)) SeekEntryResult!11859)

(assert (=> b!1459916 (= e!820961 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639637 intermediateAfterIndex!19 lt!639641 lt!639642 mask!2687) lt!639639)))))

(declare-fun b!1459917 () Bool)

(declare-fun res!989773 () Bool)

(declare-fun e!820957 () Bool)

(assert (=> b!1459917 (=> (not res!989773) (not e!820957))))

(declare-datatypes ((List!34108 0))(
  ( (Nil!34105) (Cons!34104 (h!35454 (_ BitVec 64)) (t!48802 List!34108)) )
))
(declare-fun arrayNoDuplicates!0 (array!98638 (_ BitVec 32) List!34108) Bool)

(assert (=> b!1459917 (= res!989773 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34105))))

(declare-fun b!1459918 () Bool)

(declare-fun res!989769 () Bool)

(assert (=> b!1459918 (=> (not res!989769) (not e!820957))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1459918 (= res!989769 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48157 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48157 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48157 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459919 () Bool)

(declare-fun e!820955 () Bool)

(declare-fun e!820960 () Bool)

(assert (=> b!1459919 (= e!820955 e!820960)))

(declare-fun res!989771 () Bool)

(assert (=> b!1459919 (=> res!989771 e!820960)))

(assert (=> b!1459919 (= res!989771 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639637 #b00000000000000000000000000000000) (bvsge lt!639637 (size!48157 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459919 (= lt!639637 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459919 (= lt!639639 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639641 lt!639642 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98638 (_ BitVec 32)) SeekEntryResult!11859)

(assert (=> b!1459919 (= lt!639639 (seekEntryOrOpen!0 lt!639641 lt!639642 mask!2687))))

(declare-fun b!1459920 () Bool)

(assert (=> b!1459920 (= e!820961 (not (= lt!639643 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639637 lt!639641 lt!639642 mask!2687))))))

(declare-fun b!1459921 () Bool)

(declare-fun res!989778 () Bool)

(assert (=> b!1459921 (=> (not res!989778) (not e!820958))))

(assert (=> b!1459921 (= res!989778 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459922 () Bool)

(assert (=> b!1459922 (= e!820960 true)))

(declare-fun lt!639644 () SeekEntryResult!11859)

(assert (=> b!1459922 (= lt!639644 lt!639639)))

(declare-datatypes ((Unit!49214 0))(
  ( (Unit!49215) )
))
(declare-fun lt!639640 () Unit!49214)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49214)

(assert (=> b!1459922 (= lt!639640 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639637 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459923 () Bool)

(declare-fun res!989779 () Bool)

(assert (=> b!1459923 (=> res!989779 e!820960)))

(assert (=> b!1459923 (= res!989779 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459924 () Bool)

(declare-fun res!989774 () Bool)

(assert (=> b!1459924 (=> (not res!989774) (not e!820957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98638 (_ BitVec 32)) Bool)

(assert (=> b!1459924 (= res!989774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!820956 () Bool)

(declare-fun b!1459925 () Bool)

(assert (=> b!1459925 (= e!820956 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639641 lt!639642 mask!2687) (seekEntryOrOpen!0 lt!639641 lt!639642 mask!2687)))))

(declare-fun b!1459926 () Bool)

(declare-fun res!989766 () Bool)

(assert (=> b!1459926 (=> res!989766 e!820960)))

(assert (=> b!1459926 (= res!989766 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639637 (select (arr!47607 a!2862) j!93) a!2862 mask!2687) lt!639645)))))

(declare-fun b!1459927 () Bool)

(declare-fun res!989777 () Bool)

(assert (=> b!1459927 (=> (not res!989777) (not e!820957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459927 (= res!989777 (validKeyInArray!0 (select (arr!47607 a!2862) j!93)))))

(declare-fun res!989767 () Bool)

(assert (=> start!125190 (=> (not res!989767) (not e!820957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125190 (= res!989767 (validMask!0 mask!2687))))

(assert (=> start!125190 e!820957))

(assert (=> start!125190 true))

(declare-fun array_inv!36635 (array!98638) Bool)

(assert (=> start!125190 (array_inv!36635 a!2862)))

(declare-fun b!1459928 () Bool)

(declare-fun res!989765 () Bool)

(assert (=> b!1459928 (=> (not res!989765) (not e!820958))))

(assert (=> b!1459928 (= res!989765 e!820956)))

(declare-fun c!134586 () Bool)

(assert (=> b!1459928 (= c!134586 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459929 () Bool)

(declare-fun res!989772 () Bool)

(assert (=> b!1459929 (=> res!989772 e!820960)))

(assert (=> b!1459929 (= res!989772 e!820961)))

(declare-fun c!134585 () Bool)

(assert (=> b!1459929 (= c!134585 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459930 () Bool)

(declare-fun res!989775 () Bool)

(assert (=> b!1459930 (=> (not res!989775) (not e!820957))))

(assert (=> b!1459930 (= res!989775 (and (= (size!48157 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48157 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48157 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459931 () Bool)

(declare-fun res!989776 () Bool)

(assert (=> b!1459931 (=> (not res!989776) (not e!820959))))

(assert (=> b!1459931 (= res!989776 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47607 a!2862) j!93) a!2862 mask!2687) lt!639645))))

(declare-fun b!1459932 () Bool)

(assert (=> b!1459932 (= e!820956 (= lt!639643 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639641 lt!639642 mask!2687)))))

(declare-fun b!1459933 () Bool)

(assert (=> b!1459933 (= e!820957 e!820953)))

(declare-fun res!989780 () Bool)

(assert (=> b!1459933 (=> (not res!989780) (not e!820953))))

(assert (=> b!1459933 (= res!989780 (= (select (store (arr!47607 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459933 (= lt!639642 (array!98639 (store (arr!47607 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48157 a!2862)))))

(declare-fun b!1459934 () Bool)

(declare-fun res!989781 () Bool)

(assert (=> b!1459934 (=> (not res!989781) (not e!820957))))

(assert (=> b!1459934 (= res!989781 (validKeyInArray!0 (select (arr!47607 a!2862) i!1006)))))

(declare-fun b!1459935 () Bool)

(assert (=> b!1459935 (= e!820958 (not e!820955))))

(declare-fun res!989782 () Bool)

(assert (=> b!1459935 (=> res!989782 e!820955)))

(assert (=> b!1459935 (= res!989782 (or (and (= (select (arr!47607 a!2862) index!646) (select (store (arr!47607 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47607 a!2862) index!646) (select (arr!47607 a!2862) j!93))) (= (select (arr!47607 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459935 (and (= lt!639644 (Found!11859 j!93)) (or (= (select (arr!47607 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47607 a!2862) intermediateBeforeIndex!19) (select (arr!47607 a!2862) j!93))) (let ((bdg!53547 (select (store (arr!47607 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47607 a!2862) index!646) bdg!53547) (= (select (arr!47607 a!2862) index!646) (select (arr!47607 a!2862) j!93))) (= (select (arr!47607 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53547 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459935 (= lt!639644 (seekEntryOrOpen!0 (select (arr!47607 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459935 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639638 () Unit!49214)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49214)

(assert (=> b!1459935 (= lt!639638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125190 res!989767) b!1459930))

(assert (= (and b!1459930 res!989775) b!1459934))

(assert (= (and b!1459934 res!989781) b!1459927))

(assert (= (and b!1459927 res!989777) b!1459924))

(assert (= (and b!1459924 res!989774) b!1459917))

(assert (= (and b!1459917 res!989773) b!1459918))

(assert (= (and b!1459918 res!989769) b!1459933))

(assert (= (and b!1459933 res!989780) b!1459914))

(assert (= (and b!1459914 res!989768) b!1459931))

(assert (= (and b!1459931 res!989776) b!1459915))

(assert (= (and b!1459915 res!989770) b!1459928))

(assert (= (and b!1459928 c!134586) b!1459932))

(assert (= (and b!1459928 (not c!134586)) b!1459925))

(assert (= (and b!1459928 res!989765) b!1459921))

(assert (= (and b!1459921 res!989778) b!1459935))

(assert (= (and b!1459935 (not res!989782)) b!1459919))

(assert (= (and b!1459919 (not res!989771)) b!1459926))

(assert (= (and b!1459926 (not res!989766)) b!1459929))

(assert (= (and b!1459929 c!134585) b!1459920))

(assert (= (and b!1459929 (not c!134585)) b!1459916))

(assert (= (and b!1459929 (not res!989772)) b!1459923))

(assert (= (and b!1459923 (not res!989779)) b!1459922))

(declare-fun m!1347631 () Bool)

(assert (=> b!1459920 m!1347631))

(declare-fun m!1347633 () Bool)

(assert (=> b!1459932 m!1347633))

(declare-fun m!1347635 () Bool)

(assert (=> b!1459933 m!1347635))

(declare-fun m!1347637 () Bool)

(assert (=> b!1459933 m!1347637))

(declare-fun m!1347639 () Bool)

(assert (=> b!1459915 m!1347639))

(assert (=> b!1459915 m!1347639))

(declare-fun m!1347641 () Bool)

(assert (=> b!1459915 m!1347641))

(assert (=> b!1459915 m!1347635))

(declare-fun m!1347643 () Bool)

(assert (=> b!1459915 m!1347643))

(declare-fun m!1347645 () Bool)

(assert (=> b!1459919 m!1347645))

(declare-fun m!1347647 () Bool)

(assert (=> b!1459919 m!1347647))

(declare-fun m!1347649 () Bool)

(assert (=> b!1459919 m!1347649))

(declare-fun m!1347651 () Bool)

(assert (=> start!125190 m!1347651))

(declare-fun m!1347653 () Bool)

(assert (=> start!125190 m!1347653))

(declare-fun m!1347655 () Bool)

(assert (=> b!1459922 m!1347655))

(declare-fun m!1347657 () Bool)

(assert (=> b!1459931 m!1347657))

(assert (=> b!1459931 m!1347657))

(declare-fun m!1347659 () Bool)

(assert (=> b!1459931 m!1347659))

(assert (=> b!1459914 m!1347657))

(assert (=> b!1459914 m!1347657))

(declare-fun m!1347661 () Bool)

(assert (=> b!1459914 m!1347661))

(assert (=> b!1459914 m!1347661))

(assert (=> b!1459914 m!1347657))

(declare-fun m!1347663 () Bool)

(assert (=> b!1459914 m!1347663))

(declare-fun m!1347665 () Bool)

(assert (=> b!1459935 m!1347665))

(assert (=> b!1459935 m!1347635))

(declare-fun m!1347667 () Bool)

(assert (=> b!1459935 m!1347667))

(declare-fun m!1347669 () Bool)

(assert (=> b!1459935 m!1347669))

(declare-fun m!1347671 () Bool)

(assert (=> b!1459935 m!1347671))

(assert (=> b!1459935 m!1347657))

(declare-fun m!1347673 () Bool)

(assert (=> b!1459935 m!1347673))

(declare-fun m!1347675 () Bool)

(assert (=> b!1459935 m!1347675))

(assert (=> b!1459935 m!1347657))

(declare-fun m!1347677 () Bool)

(assert (=> b!1459916 m!1347677))

(assert (=> b!1459925 m!1347647))

(assert (=> b!1459925 m!1347649))

(declare-fun m!1347679 () Bool)

(assert (=> b!1459917 m!1347679))

(declare-fun m!1347681 () Bool)

(assert (=> b!1459934 m!1347681))

(assert (=> b!1459934 m!1347681))

(declare-fun m!1347683 () Bool)

(assert (=> b!1459934 m!1347683))

(assert (=> b!1459926 m!1347657))

(assert (=> b!1459926 m!1347657))

(declare-fun m!1347685 () Bool)

(assert (=> b!1459926 m!1347685))

(declare-fun m!1347687 () Bool)

(assert (=> b!1459924 m!1347687))

(assert (=> b!1459927 m!1347657))

(assert (=> b!1459927 m!1347657))

(declare-fun m!1347689 () Bool)

(assert (=> b!1459927 m!1347689))

(check-sat (not b!1459915) (not b!1459919) (not b!1459922) (not b!1459935) (not b!1459920) (not b!1459932) (not b!1459924) (not b!1459917) (not b!1459916) (not b!1459934) (not b!1459927) (not b!1459926) (not b!1459914) (not b!1459931) (not start!125190) (not b!1459925))
(check-sat)
