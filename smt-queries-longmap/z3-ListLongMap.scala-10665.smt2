; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125130 () Bool)

(assert start!125130)

(declare-fun b!1457934 () Bool)

(declare-fun res!988153 () Bool)

(declare-fun e!820115 () Bool)

(assert (=> b!1457934 (=> (not res!988153) (not e!820115))))

(declare-datatypes ((array!98578 0))(
  ( (array!98579 (arr!47577 (Array (_ BitVec 32) (_ BitVec 64))) (size!48127 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98578)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11829 0))(
  ( (MissingZero!11829 (index!49708 (_ BitVec 32))) (Found!11829 (index!49709 (_ BitVec 32))) (Intermediate!11829 (undefined!12641 Bool) (index!49710 (_ BitVec 32)) (x!131326 (_ BitVec 32))) (Undefined!11829) (MissingVacant!11829 (index!49711 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98578 (_ BitVec 32)) SeekEntryResult!11829)

(assert (=> b!1457934 (= res!988153 (= (seekEntryOrOpen!0 (select (arr!47577 a!2862) j!93) a!2862 mask!2687) (Found!11829 j!93)))))

(declare-fun b!1457935 () Bool)

(declare-fun res!988150 () Bool)

(declare-fun e!820114 () Bool)

(assert (=> b!1457935 (=> (not res!988150) (not e!820114))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457935 (= res!988150 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!638865 () array!98578)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!820116 () Bool)

(declare-fun b!1457936 () Bool)

(declare-fun lt!638864 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98578 (_ BitVec 32)) SeekEntryResult!11829)

(assert (=> b!1457936 (= e!820116 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638864 lt!638865 mask!2687) (seekEntryOrOpen!0 lt!638864 lt!638865 mask!2687)))))

(declare-fun b!1457937 () Bool)

(declare-fun res!988157 () Bool)

(declare-fun e!820120 () Bool)

(assert (=> b!1457937 (=> (not res!988157) (not e!820120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457937 (= res!988157 (validKeyInArray!0 (select (arr!47577 a!2862) i!1006)))))

(declare-fun b!1457938 () Bool)

(declare-fun e!820117 () Bool)

(assert (=> b!1457938 (= e!820120 e!820117)))

(declare-fun res!988156 () Bool)

(assert (=> b!1457938 (=> (not res!988156) (not e!820117))))

(assert (=> b!1457938 (= res!988156 (= (select (store (arr!47577 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457938 (= lt!638865 (array!98579 (store (arr!47577 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48127 a!2862)))))

(declare-fun b!1457939 () Bool)

(declare-fun res!988158 () Bool)

(assert (=> b!1457939 (=> (not res!988158) (not e!820120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98578 (_ BitVec 32)) Bool)

(assert (=> b!1457939 (= res!988158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457940 () Bool)

(declare-fun e!820113 () Bool)

(assert (=> b!1457940 (= e!820113 true)))

(declare-fun lt!638862 () Bool)

(declare-fun e!820121 () Bool)

(assert (=> b!1457940 (= lt!638862 e!820121)))

(declare-fun c!134405 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457940 (= c!134405 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun lt!638863 () (_ BitVec 32))

(declare-fun lt!638858 () SeekEntryResult!11829)

(declare-fun b!1457942 () Bool)

(assert (=> b!1457942 (= e!820121 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638863 intermediateAfterIndex!19 lt!638864 lt!638865 mask!2687) lt!638858)))))

(declare-fun b!1457943 () Bool)

(declare-fun e!820118 () Bool)

(assert (=> b!1457943 (= e!820117 e!820118)))

(declare-fun res!988154 () Bool)

(assert (=> b!1457943 (=> (not res!988154) (not e!820118))))

(declare-fun lt!638861 () SeekEntryResult!11829)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98578 (_ BitVec 32)) SeekEntryResult!11829)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457943 (= res!988154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47577 a!2862) j!93) mask!2687) (select (arr!47577 a!2862) j!93) a!2862 mask!2687) lt!638861))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1457943 (= lt!638861 (Intermediate!11829 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457944 () Bool)

(declare-fun res!988155 () Bool)

(assert (=> b!1457944 (=> (not res!988155) (not e!820120))))

(declare-datatypes ((List!34078 0))(
  ( (Nil!34075) (Cons!34074 (h!35424 (_ BitVec 64)) (t!48772 List!34078)) )
))
(declare-fun arrayNoDuplicates!0 (array!98578 (_ BitVec 32) List!34078) Bool)

(assert (=> b!1457944 (= res!988155 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34075))))

(declare-fun b!1457945 () Bool)

(assert (=> b!1457945 (= e!820115 (and (or (= (select (arr!47577 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47577 a!2862) intermediateBeforeIndex!19) (select (arr!47577 a!2862) j!93))) (let ((bdg!53380 (select (store (arr!47577 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47577 a!2862) index!646) bdg!53380) (= (select (arr!47577 a!2862) index!646) (select (arr!47577 a!2862) j!93))) (= (select (arr!47577 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53380 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457946 () Bool)

(declare-fun res!988151 () Bool)

(assert (=> b!1457946 (=> (not res!988151) (not e!820114))))

(assert (=> b!1457946 (= res!988151 e!820116)))

(declare-fun c!134406 () Bool)

(assert (=> b!1457946 (= c!134406 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457947 () Bool)

(declare-fun res!988160 () Bool)

(assert (=> b!1457947 (=> (not res!988160) (not e!820120))))

(assert (=> b!1457947 (= res!988160 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48127 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48127 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48127 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457948 () Bool)

(declare-fun lt!638860 () SeekEntryResult!11829)

(assert (=> b!1457948 (= e!820121 (not (= lt!638860 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638863 lt!638864 lt!638865 mask!2687))))))

(declare-fun b!1457949 () Bool)

(declare-fun res!988148 () Bool)

(assert (=> b!1457949 (=> (not res!988148) (not e!820120))))

(assert (=> b!1457949 (= res!988148 (and (= (size!48127 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48127 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48127 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457950 () Bool)

(assert (=> b!1457950 (= e!820116 (= lt!638860 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638864 lt!638865 mask!2687)))))

(declare-fun b!1457951 () Bool)

(declare-fun res!988161 () Bool)

(assert (=> b!1457951 (=> res!988161 e!820113)))

(assert (=> b!1457951 (= res!988161 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638863 (select (arr!47577 a!2862) j!93) a!2862 mask!2687) lt!638861)))))

(declare-fun b!1457941 () Bool)

(declare-fun res!988147 () Bool)

(assert (=> b!1457941 (=> (not res!988147) (not e!820118))))

(assert (=> b!1457941 (= res!988147 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47577 a!2862) j!93) a!2862 mask!2687) lt!638861))))

(declare-fun res!988162 () Bool)

(assert (=> start!125130 (=> (not res!988162) (not e!820120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125130 (= res!988162 (validMask!0 mask!2687))))

(assert (=> start!125130 e!820120))

(assert (=> start!125130 true))

(declare-fun array_inv!36605 (array!98578) Bool)

(assert (=> start!125130 (array_inv!36605 a!2862)))

(declare-fun b!1457952 () Bool)

(declare-fun res!988159 () Bool)

(assert (=> b!1457952 (=> (not res!988159) (not e!820120))))

(assert (=> b!1457952 (= res!988159 (validKeyInArray!0 (select (arr!47577 a!2862) j!93)))))

(declare-fun b!1457953 () Bool)

(assert (=> b!1457953 (= e!820118 e!820114)))

(declare-fun res!988152 () Bool)

(assert (=> b!1457953 (=> (not res!988152) (not e!820114))))

(assert (=> b!1457953 (= res!988152 (= lt!638860 (Intermediate!11829 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457953 (= lt!638860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638864 mask!2687) lt!638864 lt!638865 mask!2687))))

(assert (=> b!1457953 (= lt!638864 (select (store (arr!47577 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457954 () Bool)

(declare-fun e!820119 () Bool)

(assert (=> b!1457954 (= e!820119 e!820113)))

(declare-fun res!988145 () Bool)

(assert (=> b!1457954 (=> res!988145 e!820113)))

(assert (=> b!1457954 (= res!988145 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638863 #b00000000000000000000000000000000) (bvsge lt!638863 (size!48127 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457954 (= lt!638863 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457954 (= lt!638858 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638864 lt!638865 mask!2687))))

(assert (=> b!1457954 (= lt!638858 (seekEntryOrOpen!0 lt!638864 lt!638865 mask!2687))))

(declare-fun b!1457955 () Bool)

(assert (=> b!1457955 (= e!820114 (not e!820119))))

(declare-fun res!988146 () Bool)

(assert (=> b!1457955 (=> res!988146 e!820119)))

(assert (=> b!1457955 (= res!988146 (or (and (= (select (arr!47577 a!2862) index!646) (select (store (arr!47577 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47577 a!2862) index!646) (select (arr!47577 a!2862) j!93))) (= (select (arr!47577 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457955 e!820115))

(declare-fun res!988149 () Bool)

(assert (=> b!1457955 (=> (not res!988149) (not e!820115))))

(assert (=> b!1457955 (= res!988149 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49154 0))(
  ( (Unit!49155) )
))
(declare-fun lt!638859 () Unit!49154)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49154)

(assert (=> b!1457955 (= lt!638859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125130 res!988162) b!1457949))

(assert (= (and b!1457949 res!988148) b!1457937))

(assert (= (and b!1457937 res!988157) b!1457952))

(assert (= (and b!1457952 res!988159) b!1457939))

(assert (= (and b!1457939 res!988158) b!1457944))

(assert (= (and b!1457944 res!988155) b!1457947))

(assert (= (and b!1457947 res!988160) b!1457938))

(assert (= (and b!1457938 res!988156) b!1457943))

(assert (= (and b!1457943 res!988154) b!1457941))

(assert (= (and b!1457941 res!988147) b!1457953))

(assert (= (and b!1457953 res!988152) b!1457946))

(assert (= (and b!1457946 c!134406) b!1457950))

(assert (= (and b!1457946 (not c!134406)) b!1457936))

(assert (= (and b!1457946 res!988151) b!1457935))

(assert (= (and b!1457935 res!988150) b!1457955))

(assert (= (and b!1457955 res!988149) b!1457934))

(assert (= (and b!1457934 res!988153) b!1457945))

(assert (= (and b!1457955 (not res!988146)) b!1457954))

(assert (= (and b!1457954 (not res!988145)) b!1457951))

(assert (= (and b!1457951 (not res!988161)) b!1457940))

(assert (= (and b!1457940 c!134405) b!1457948))

(assert (= (and b!1457940 (not c!134405)) b!1457942))

(declare-fun m!1345853 () Bool)

(assert (=> b!1457955 m!1345853))

(declare-fun m!1345855 () Bool)

(assert (=> b!1457955 m!1345855))

(declare-fun m!1345857 () Bool)

(assert (=> b!1457955 m!1345857))

(declare-fun m!1345859 () Bool)

(assert (=> b!1457955 m!1345859))

(declare-fun m!1345861 () Bool)

(assert (=> b!1457955 m!1345861))

(declare-fun m!1345863 () Bool)

(assert (=> b!1457955 m!1345863))

(declare-fun m!1345865 () Bool)

(assert (=> start!125130 m!1345865))

(declare-fun m!1345867 () Bool)

(assert (=> start!125130 m!1345867))

(assert (=> b!1457938 m!1345855))

(declare-fun m!1345869 () Bool)

(assert (=> b!1457938 m!1345869))

(assert (=> b!1457951 m!1345863))

(assert (=> b!1457951 m!1345863))

(declare-fun m!1345871 () Bool)

(assert (=> b!1457951 m!1345871))

(assert (=> b!1457941 m!1345863))

(assert (=> b!1457941 m!1345863))

(declare-fun m!1345873 () Bool)

(assert (=> b!1457941 m!1345873))

(declare-fun m!1345875 () Bool)

(assert (=> b!1457942 m!1345875))

(assert (=> b!1457943 m!1345863))

(assert (=> b!1457943 m!1345863))

(declare-fun m!1345877 () Bool)

(assert (=> b!1457943 m!1345877))

(assert (=> b!1457943 m!1345877))

(assert (=> b!1457943 m!1345863))

(declare-fun m!1345879 () Bool)

(assert (=> b!1457943 m!1345879))

(declare-fun m!1345881 () Bool)

(assert (=> b!1457953 m!1345881))

(assert (=> b!1457953 m!1345881))

(declare-fun m!1345883 () Bool)

(assert (=> b!1457953 m!1345883))

(assert (=> b!1457953 m!1345855))

(declare-fun m!1345885 () Bool)

(assert (=> b!1457953 m!1345885))

(assert (=> b!1457934 m!1345863))

(assert (=> b!1457934 m!1345863))

(declare-fun m!1345887 () Bool)

(assert (=> b!1457934 m!1345887))

(assert (=> b!1457945 m!1345855))

(declare-fun m!1345889 () Bool)

(assert (=> b!1457945 m!1345889))

(assert (=> b!1457945 m!1345857))

(assert (=> b!1457945 m!1345859))

(assert (=> b!1457945 m!1345863))

(declare-fun m!1345891 () Bool)

(assert (=> b!1457944 m!1345891))

(declare-fun m!1345893 () Bool)

(assert (=> b!1457937 m!1345893))

(assert (=> b!1457937 m!1345893))

(declare-fun m!1345895 () Bool)

(assert (=> b!1457937 m!1345895))

(declare-fun m!1345897 () Bool)

(assert (=> b!1457950 m!1345897))

(assert (=> b!1457952 m!1345863))

(assert (=> b!1457952 m!1345863))

(declare-fun m!1345899 () Bool)

(assert (=> b!1457952 m!1345899))

(declare-fun m!1345901 () Bool)

(assert (=> b!1457954 m!1345901))

(declare-fun m!1345903 () Bool)

(assert (=> b!1457954 m!1345903))

(declare-fun m!1345905 () Bool)

(assert (=> b!1457954 m!1345905))

(declare-fun m!1345907 () Bool)

(assert (=> b!1457948 m!1345907))

(assert (=> b!1457936 m!1345903))

(assert (=> b!1457936 m!1345905))

(declare-fun m!1345909 () Bool)

(assert (=> b!1457939 m!1345909))

(check-sat (not b!1457951) (not b!1457936) (not b!1457952) (not b!1457941) (not b!1457937) (not b!1457948) (not b!1457939) (not b!1457944) (not b!1457954) (not b!1457934) (not b!1457943) (not b!1457950) (not b!1457942) (not b!1457955) (not start!125130) (not b!1457953))
(check-sat)
