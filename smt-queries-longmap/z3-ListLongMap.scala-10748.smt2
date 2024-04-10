; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125688 () Bool)

(assert start!125688)

(declare-fun b!1470876 () Bool)

(declare-fun res!998960 () Bool)

(declare-fun e!825634 () Bool)

(assert (=> b!1470876 (=> (not res!998960) (not e!825634))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99079 0))(
  ( (array!99080 (arr!47826 (Array (_ BitVec 32) (_ BitVec 64))) (size!48376 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99079)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470876 (= res!998960 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48376 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48376 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48376 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470877 () Bool)

(declare-fun res!998963 () Bool)

(assert (=> b!1470877 (=> (not res!998963) (not e!825634))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470877 (= res!998963 (validKeyInArray!0 (select (arr!47826 a!2862) i!1006)))))

(declare-fun b!1470878 () Bool)

(declare-fun e!825632 () Bool)

(assert (=> b!1470878 (= e!825632 (not true))))

(declare-fun e!825637 () Bool)

(assert (=> b!1470878 e!825637))

(declare-fun res!998953 () Bool)

(assert (=> b!1470878 (=> (not res!998953) (not e!825637))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99079 (_ BitVec 32)) Bool)

(assert (=> b!1470878 (= res!998953 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49472 0))(
  ( (Unit!49473) )
))
(declare-fun lt!643064 () Unit!49472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49472)

(assert (=> b!1470878 (= lt!643064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470879 () Bool)

(declare-fun res!998959 () Bool)

(declare-fun e!825635 () Bool)

(assert (=> b!1470879 (=> (not res!998959) (not e!825635))))

(declare-datatypes ((SeekEntryResult!12066 0))(
  ( (MissingZero!12066 (index!50656 (_ BitVec 32))) (Found!12066 (index!50657 (_ BitVec 32))) (Intermediate!12066 (undefined!12878 Bool) (index!50658 (_ BitVec 32)) (x!132236 (_ BitVec 32))) (Undefined!12066) (MissingVacant!12066 (index!50659 (_ BitVec 32))) )
))
(declare-fun lt!643061 () SeekEntryResult!12066)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99079 (_ BitVec 32)) SeekEntryResult!12066)

(assert (=> b!1470879 (= res!998959 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47826 a!2862) j!93) a!2862 mask!2687) lt!643061))))

(declare-fun b!1470880 () Bool)

(declare-fun res!998954 () Bool)

(assert (=> b!1470880 (=> (not res!998954) (not e!825634))))

(assert (=> b!1470880 (= res!998954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!998964 () Bool)

(assert (=> start!125688 (=> (not res!998964) (not e!825634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125688 (= res!998964 (validMask!0 mask!2687))))

(assert (=> start!125688 e!825634))

(assert (=> start!125688 true))

(declare-fun array_inv!36854 (array!99079) Bool)

(assert (=> start!125688 (array_inv!36854 a!2862)))

(declare-fun b!1470881 () Bool)

(declare-fun e!825636 () Bool)

(assert (=> b!1470881 (= e!825634 e!825636)))

(declare-fun res!998961 () Bool)

(assert (=> b!1470881 (=> (not res!998961) (not e!825636))))

(assert (=> b!1470881 (= res!998961 (= (select (store (arr!47826 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643065 () array!99079)

(assert (=> b!1470881 (= lt!643065 (array!99080 (store (arr!47826 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48376 a!2862)))))

(declare-fun b!1470882 () Bool)

(declare-fun res!998955 () Bool)

(assert (=> b!1470882 (=> (not res!998955) (not e!825632))))

(declare-fun e!825638 () Bool)

(assert (=> b!1470882 (= res!998955 e!825638)))

(declare-fun c!135474 () Bool)

(assert (=> b!1470882 (= c!135474 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470883 () Bool)

(declare-fun lt!643063 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99079 (_ BitVec 32)) SeekEntryResult!12066)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99079 (_ BitVec 32)) SeekEntryResult!12066)

(assert (=> b!1470883 (= e!825638 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643063 lt!643065 mask!2687) (seekEntryOrOpen!0 lt!643063 lt!643065 mask!2687)))))

(declare-fun b!1470884 () Bool)

(declare-fun res!998958 () Bool)

(assert (=> b!1470884 (=> (not res!998958) (not e!825634))))

(assert (=> b!1470884 (= res!998958 (and (= (size!48376 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48376 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48376 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470885 () Bool)

(declare-fun res!998957 () Bool)

(assert (=> b!1470885 (=> (not res!998957) (not e!825632))))

(assert (=> b!1470885 (= res!998957 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470886 () Bool)

(assert (=> b!1470886 (= e!825635 e!825632)))

(declare-fun res!998952 () Bool)

(assert (=> b!1470886 (=> (not res!998952) (not e!825632))))

(declare-fun lt!643062 () SeekEntryResult!12066)

(assert (=> b!1470886 (= res!998952 (= lt!643062 (Intermediate!12066 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470886 (= lt!643062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643063 mask!2687) lt!643063 lt!643065 mask!2687))))

(assert (=> b!1470886 (= lt!643063 (select (store (arr!47826 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470887 () Bool)

(assert (=> b!1470887 (= e!825638 (= lt!643062 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643063 lt!643065 mask!2687)))))

(declare-fun b!1470888 () Bool)

(declare-fun res!998962 () Bool)

(assert (=> b!1470888 (=> (not res!998962) (not e!825634))))

(assert (=> b!1470888 (= res!998962 (validKeyInArray!0 (select (arr!47826 a!2862) j!93)))))

(declare-fun b!1470889 () Bool)

(declare-fun res!998956 () Bool)

(assert (=> b!1470889 (=> (not res!998956) (not e!825634))))

(declare-datatypes ((List!34327 0))(
  ( (Nil!34324) (Cons!34323 (h!35676 (_ BitVec 64)) (t!49021 List!34327)) )
))
(declare-fun arrayNoDuplicates!0 (array!99079 (_ BitVec 32) List!34327) Bool)

(assert (=> b!1470889 (= res!998956 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34324))))

(declare-fun b!1470890 () Bool)

(assert (=> b!1470890 (= e!825637 (= (seekEntryOrOpen!0 (select (arr!47826 a!2862) j!93) a!2862 mask!2687) (Found!12066 j!93)))))

(declare-fun b!1470891 () Bool)

(assert (=> b!1470891 (= e!825636 e!825635)))

(declare-fun res!998965 () Bool)

(assert (=> b!1470891 (=> (not res!998965) (not e!825635))))

(assert (=> b!1470891 (= res!998965 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47826 a!2862) j!93) mask!2687) (select (arr!47826 a!2862) j!93) a!2862 mask!2687) lt!643061))))

(assert (=> b!1470891 (= lt!643061 (Intermediate!12066 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125688 res!998964) b!1470884))

(assert (= (and b!1470884 res!998958) b!1470877))

(assert (= (and b!1470877 res!998963) b!1470888))

(assert (= (and b!1470888 res!998962) b!1470880))

(assert (= (and b!1470880 res!998954) b!1470889))

(assert (= (and b!1470889 res!998956) b!1470876))

(assert (= (and b!1470876 res!998960) b!1470881))

(assert (= (and b!1470881 res!998961) b!1470891))

(assert (= (and b!1470891 res!998965) b!1470879))

(assert (= (and b!1470879 res!998959) b!1470886))

(assert (= (and b!1470886 res!998952) b!1470882))

(assert (= (and b!1470882 c!135474) b!1470887))

(assert (= (and b!1470882 (not c!135474)) b!1470883))

(assert (= (and b!1470882 res!998955) b!1470885))

(assert (= (and b!1470885 res!998957) b!1470878))

(assert (= (and b!1470878 res!998953) b!1470890))

(declare-fun m!1357839 () Bool)

(assert (=> b!1470877 m!1357839))

(assert (=> b!1470877 m!1357839))

(declare-fun m!1357841 () Bool)

(assert (=> b!1470877 m!1357841))

(declare-fun m!1357843 () Bool)

(assert (=> b!1470879 m!1357843))

(assert (=> b!1470879 m!1357843))

(declare-fun m!1357845 () Bool)

(assert (=> b!1470879 m!1357845))

(declare-fun m!1357847 () Bool)

(assert (=> b!1470889 m!1357847))

(declare-fun m!1357849 () Bool)

(assert (=> b!1470878 m!1357849))

(declare-fun m!1357851 () Bool)

(assert (=> b!1470878 m!1357851))

(declare-fun m!1357853 () Bool)

(assert (=> b!1470881 m!1357853))

(declare-fun m!1357855 () Bool)

(assert (=> b!1470881 m!1357855))

(assert (=> b!1470890 m!1357843))

(assert (=> b!1470890 m!1357843))

(declare-fun m!1357857 () Bool)

(assert (=> b!1470890 m!1357857))

(assert (=> b!1470888 m!1357843))

(assert (=> b!1470888 m!1357843))

(declare-fun m!1357859 () Bool)

(assert (=> b!1470888 m!1357859))

(assert (=> b!1470891 m!1357843))

(assert (=> b!1470891 m!1357843))

(declare-fun m!1357861 () Bool)

(assert (=> b!1470891 m!1357861))

(assert (=> b!1470891 m!1357861))

(assert (=> b!1470891 m!1357843))

(declare-fun m!1357863 () Bool)

(assert (=> b!1470891 m!1357863))

(declare-fun m!1357865 () Bool)

(assert (=> start!125688 m!1357865))

(declare-fun m!1357867 () Bool)

(assert (=> start!125688 m!1357867))

(declare-fun m!1357869 () Bool)

(assert (=> b!1470880 m!1357869))

(declare-fun m!1357871 () Bool)

(assert (=> b!1470886 m!1357871))

(assert (=> b!1470886 m!1357871))

(declare-fun m!1357873 () Bool)

(assert (=> b!1470886 m!1357873))

(assert (=> b!1470886 m!1357853))

(declare-fun m!1357875 () Bool)

(assert (=> b!1470886 m!1357875))

(declare-fun m!1357877 () Bool)

(assert (=> b!1470887 m!1357877))

(declare-fun m!1357879 () Bool)

(assert (=> b!1470883 m!1357879))

(declare-fun m!1357881 () Bool)

(assert (=> b!1470883 m!1357881))

(check-sat (not b!1470877) (not b!1470887) (not b!1470890) (not b!1470891) (not b!1470880) (not b!1470879) (not b!1470886) (not b!1470888) (not b!1470883) (not b!1470889) (not start!125688) (not b!1470878))
(check-sat)
