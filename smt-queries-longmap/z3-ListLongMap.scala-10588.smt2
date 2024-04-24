; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124884 () Bool)

(assert start!124884)

(declare-fun b!1445759 () Bool)

(declare-fun res!976930 () Bool)

(declare-fun e!814674 () Bool)

(assert (=> b!1445759 (=> (not res!976930) (not e!814674))))

(declare-datatypes ((array!98227 0))(
  ( (array!98228 (arr!47398 (Array (_ BitVec 32) (_ BitVec 64))) (size!47949 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98227)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445759 (= res!976930 (validKeyInArray!0 (select (arr!47398 a!2862) i!1006)))))

(declare-fun b!1445760 () Bool)

(declare-fun res!976925 () Bool)

(declare-fun e!814671 () Bool)

(assert (=> b!1445760 (=> (not res!976925) (not e!814671))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445760 (= res!976925 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445761 () Bool)

(declare-fun res!976937 () Bool)

(assert (=> b!1445761 (=> (not res!976937) (not e!814674))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445761 (= res!976937 (validKeyInArray!0 (select (arr!47398 a!2862) j!93)))))

(declare-fun b!1445762 () Bool)

(declare-fun res!976934 () Bool)

(declare-fun e!814668 () Bool)

(assert (=> b!1445762 (=> (not res!976934) (not e!814668))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11547 0))(
  ( (MissingZero!11547 (index!48580 (_ BitVec 32))) (Found!11547 (index!48581 (_ BitVec 32))) (Intermediate!11547 (undefined!12359 Bool) (index!48582 (_ BitVec 32)) (x!130452 (_ BitVec 32))) (Undefined!11547) (MissingVacant!11547 (index!48583 (_ BitVec 32))) )
))
(declare-fun lt!634675 () SeekEntryResult!11547)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98227 (_ BitVec 32)) SeekEntryResult!11547)

(assert (=> b!1445762 (= res!976934 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47398 a!2862) j!93) a!2862 mask!2687) lt!634675))))

(declare-fun b!1445763 () Bool)

(declare-fun e!814672 () Bool)

(declare-fun lt!634676 () (_ BitVec 64))

(assert (=> b!1445763 (= e!814672 (validKeyInArray!0 lt!634676))))

(declare-fun b!1445764 () Bool)

(declare-fun res!976939 () Bool)

(assert (=> b!1445764 (=> res!976939 e!814672)))

(assert (=> b!1445764 (= res!976939 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1445765 () Bool)

(declare-fun res!976936 () Bool)

(assert (=> b!1445765 (=> (not res!976936) (not e!814674))))

(assert (=> b!1445765 (= res!976936 (and (= (size!47949 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47949 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47949 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445766 () Bool)

(declare-fun res!976933 () Bool)

(assert (=> b!1445766 (=> res!976933 e!814672)))

(declare-fun lt!634678 () array!98227)

(declare-fun lt!634674 () SeekEntryResult!11547)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98227 (_ BitVec 32)) SeekEntryResult!11547)

(assert (=> b!1445766 (= res!976933 (not (= lt!634674 (seekEntryOrOpen!0 lt!634676 lt!634678 mask!2687))))))

(declare-fun b!1445767 () Bool)

(assert (=> b!1445767 (= e!814671 (not e!814672))))

(declare-fun res!976931 () Bool)

(assert (=> b!1445767 (=> res!976931 e!814672)))

(assert (=> b!1445767 (= res!976931 (or (not (= (select (arr!47398 a!2862) index!646) (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47398 a!2862) index!646) (select (arr!47398 a!2862) j!93)))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445767 (and (= lt!634674 (Found!11547 j!93)) (or (= (select (arr!47398 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47398 a!2862) intermediateBeforeIndex!19) (select (arr!47398 a!2862) j!93))))))

(assert (=> b!1445767 (= lt!634674 (seekEntryOrOpen!0 (select (arr!47398 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98227 (_ BitVec 32)) Bool)

(assert (=> b!1445767 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48623 0))(
  ( (Unit!48624) )
))
(declare-fun lt!634673 () Unit!48623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48623)

(assert (=> b!1445767 (= lt!634673 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445768 () Bool)

(declare-fun res!976928 () Bool)

(assert (=> b!1445768 (=> (not res!976928) (not e!814674))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445768 (= res!976928 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47949 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47949 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47949 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445769 () Bool)

(assert (=> b!1445769 (= e!814668 e!814671)))

(declare-fun res!976929 () Bool)

(assert (=> b!1445769 (=> (not res!976929) (not e!814671))))

(declare-fun lt!634677 () SeekEntryResult!11547)

(assert (=> b!1445769 (= res!976929 (= lt!634677 (Intermediate!11547 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445769 (= lt!634677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634676 mask!2687) lt!634676 lt!634678 mask!2687))))

(assert (=> b!1445769 (= lt!634676 (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445770 () Bool)

(declare-fun res!976926 () Bool)

(assert (=> b!1445770 (=> (not res!976926) (not e!814674))))

(declare-datatypes ((List!33886 0))(
  ( (Nil!33883) (Cons!33882 (h!35243 (_ BitVec 64)) (t!48572 List!33886)) )
))
(declare-fun arrayNoDuplicates!0 (array!98227 (_ BitVec 32) List!33886) Bool)

(assert (=> b!1445770 (= res!976926 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33883))))

(declare-fun b!1445771 () Bool)

(declare-fun res!976940 () Bool)

(assert (=> b!1445771 (=> (not res!976940) (not e!814671))))

(declare-fun e!814669 () Bool)

(assert (=> b!1445771 (= res!976940 e!814669)))

(declare-fun c!133936 () Bool)

(assert (=> b!1445771 (= c!133936 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445772 () Bool)

(declare-fun e!814670 () Bool)

(assert (=> b!1445772 (= e!814674 e!814670)))

(declare-fun res!976932 () Bool)

(assert (=> b!1445772 (=> (not res!976932) (not e!814670))))

(assert (=> b!1445772 (= res!976932 (= (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445772 (= lt!634678 (array!98228 (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47949 a!2862)))))

(declare-fun b!1445773 () Bool)

(assert (=> b!1445773 (= e!814670 e!814668)))

(declare-fun res!976938 () Bool)

(assert (=> b!1445773 (=> (not res!976938) (not e!814668))))

(assert (=> b!1445773 (= res!976938 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47398 a!2862) j!93) mask!2687) (select (arr!47398 a!2862) j!93) a!2862 mask!2687) lt!634675))))

(assert (=> b!1445773 (= lt!634675 (Intermediate!11547 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!976927 () Bool)

(assert (=> start!124884 (=> (not res!976927) (not e!814674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124884 (= res!976927 (validMask!0 mask!2687))))

(assert (=> start!124884 e!814674))

(assert (=> start!124884 true))

(declare-fun array_inv!36679 (array!98227) Bool)

(assert (=> start!124884 (array_inv!36679 a!2862)))

(declare-fun b!1445774 () Bool)

(assert (=> b!1445774 (= e!814669 (= lt!634677 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634676 lt!634678 mask!2687)))))

(declare-fun b!1445775 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98227 (_ BitVec 32)) SeekEntryResult!11547)

(assert (=> b!1445775 (= e!814669 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634676 lt!634678 mask!2687) (seekEntryOrOpen!0 lt!634676 lt!634678 mask!2687)))))

(declare-fun b!1445776 () Bool)

(declare-fun res!976935 () Bool)

(assert (=> b!1445776 (=> (not res!976935) (not e!814674))))

(assert (=> b!1445776 (= res!976935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124884 res!976927) b!1445765))

(assert (= (and b!1445765 res!976936) b!1445759))

(assert (= (and b!1445759 res!976930) b!1445761))

(assert (= (and b!1445761 res!976937) b!1445776))

(assert (= (and b!1445776 res!976935) b!1445770))

(assert (= (and b!1445770 res!976926) b!1445768))

(assert (= (and b!1445768 res!976928) b!1445772))

(assert (= (and b!1445772 res!976932) b!1445773))

(assert (= (and b!1445773 res!976938) b!1445762))

(assert (= (and b!1445762 res!976934) b!1445769))

(assert (= (and b!1445769 res!976929) b!1445771))

(assert (= (and b!1445771 c!133936) b!1445774))

(assert (= (and b!1445771 (not c!133936)) b!1445775))

(assert (= (and b!1445771 res!976940) b!1445760))

(assert (= (and b!1445760 res!976925) b!1445767))

(assert (= (and b!1445767 (not res!976931)) b!1445766))

(assert (= (and b!1445766 (not res!976933)) b!1445764))

(assert (= (and b!1445764 (not res!976939)) b!1445763))

(declare-fun m!1334893 () Bool)

(assert (=> b!1445766 m!1334893))

(declare-fun m!1334895 () Bool)

(assert (=> b!1445776 m!1334895))

(declare-fun m!1334897 () Bool)

(assert (=> b!1445774 m!1334897))

(declare-fun m!1334899 () Bool)

(assert (=> b!1445775 m!1334899))

(assert (=> b!1445775 m!1334893))

(declare-fun m!1334901 () Bool)

(assert (=> b!1445769 m!1334901))

(assert (=> b!1445769 m!1334901))

(declare-fun m!1334903 () Bool)

(assert (=> b!1445769 m!1334903))

(declare-fun m!1334905 () Bool)

(assert (=> b!1445769 m!1334905))

(declare-fun m!1334907 () Bool)

(assert (=> b!1445769 m!1334907))

(assert (=> b!1445772 m!1334905))

(declare-fun m!1334909 () Bool)

(assert (=> b!1445772 m!1334909))

(declare-fun m!1334911 () Bool)

(assert (=> start!124884 m!1334911))

(declare-fun m!1334913 () Bool)

(assert (=> start!124884 m!1334913))

(declare-fun m!1334915 () Bool)

(assert (=> b!1445761 m!1334915))

(assert (=> b!1445761 m!1334915))

(declare-fun m!1334917 () Bool)

(assert (=> b!1445761 m!1334917))

(declare-fun m!1334919 () Bool)

(assert (=> b!1445767 m!1334919))

(assert (=> b!1445767 m!1334905))

(declare-fun m!1334921 () Bool)

(assert (=> b!1445767 m!1334921))

(declare-fun m!1334923 () Bool)

(assert (=> b!1445767 m!1334923))

(declare-fun m!1334925 () Bool)

(assert (=> b!1445767 m!1334925))

(assert (=> b!1445767 m!1334915))

(declare-fun m!1334927 () Bool)

(assert (=> b!1445767 m!1334927))

(declare-fun m!1334929 () Bool)

(assert (=> b!1445767 m!1334929))

(assert (=> b!1445767 m!1334915))

(assert (=> b!1445773 m!1334915))

(assert (=> b!1445773 m!1334915))

(declare-fun m!1334931 () Bool)

(assert (=> b!1445773 m!1334931))

(assert (=> b!1445773 m!1334931))

(assert (=> b!1445773 m!1334915))

(declare-fun m!1334933 () Bool)

(assert (=> b!1445773 m!1334933))

(declare-fun m!1334935 () Bool)

(assert (=> b!1445770 m!1334935))

(declare-fun m!1334937 () Bool)

(assert (=> b!1445759 m!1334937))

(assert (=> b!1445759 m!1334937))

(declare-fun m!1334939 () Bool)

(assert (=> b!1445759 m!1334939))

(declare-fun m!1334941 () Bool)

(assert (=> b!1445763 m!1334941))

(assert (=> b!1445762 m!1334915))

(assert (=> b!1445762 m!1334915))

(declare-fun m!1334943 () Bool)

(assert (=> b!1445762 m!1334943))

(check-sat (not b!1445762) (not b!1445775) (not b!1445769) (not b!1445761) (not b!1445774) (not b!1445776) (not b!1445766) (not b!1445759) (not b!1445767) (not b!1445770) (not start!124884) (not b!1445763) (not b!1445773))
(check-sat)
