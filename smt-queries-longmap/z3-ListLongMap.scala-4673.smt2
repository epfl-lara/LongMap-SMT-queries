; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65006 () Bool)

(assert start!65006)

(declare-fun res!493126 () Bool)

(declare-fun e!410572 () Bool)

(assert (=> start!65006 (=> (not res!493126) (not e!410572))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65006 (= res!493126 (validMask!0 mask!3328))))

(assert (=> start!65006 e!410572))

(assert (=> start!65006 true))

(declare-datatypes ((array!41265 0))(
  ( (array!41266 (arr!19748 (Array (_ BitVec 32) (_ BitVec 64))) (size!20169 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41265)

(declare-fun array_inv!15631 (array!41265) Bool)

(assert (=> start!65006 (array_inv!15631 a!3186)))

(declare-fun b!733795 () Bool)

(declare-fun res!493128 () Bool)

(declare-fun e!410575 () Bool)

(assert (=> b!733795 (=> (not res!493128) (not e!410575))))

(declare-datatypes ((List!13789 0))(
  ( (Nil!13786) (Cons!13785 (h!14854 (_ BitVec 64)) (t!20095 List!13789)) )
))
(declare-fun arrayNoDuplicates!0 (array!41265 (_ BitVec 32) List!13789) Bool)

(assert (=> b!733795 (= res!493128 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13786))))

(declare-fun b!733796 () Bool)

(declare-fun e!410573 () Bool)

(declare-fun e!410569 () Bool)

(assert (=> b!733796 (= e!410573 e!410569)))

(declare-fun res!493121 () Bool)

(assert (=> b!733796 (=> (not res!493121) (not e!410569))))

(declare-datatypes ((SeekEntryResult!7345 0))(
  ( (MissingZero!7345 (index!31748 (_ BitVec 32))) (Found!7345 (index!31749 (_ BitVec 32))) (Intermediate!7345 (undefined!8157 Bool) (index!31750 (_ BitVec 32)) (x!62758 (_ BitVec 32))) (Undefined!7345) (MissingVacant!7345 (index!31751 (_ BitVec 32))) )
))
(declare-fun lt!325096 () SeekEntryResult!7345)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41265 (_ BitVec 32)) SeekEntryResult!7345)

(assert (=> b!733796 (= res!493121 (= (seekEntryOrOpen!0 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325096))))

(assert (=> b!733796 (= lt!325096 (Found!7345 j!159))))

(declare-fun b!733797 () Bool)

(declare-fun res!493111 () Bool)

(assert (=> b!733797 (=> (not res!493111) (not e!410572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733797 (= res!493111 (validKeyInArray!0 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!733798 () Bool)

(declare-fun e!410574 () Bool)

(assert (=> b!733798 (= e!410575 e!410574)))

(declare-fun res!493123 () Bool)

(assert (=> b!733798 (=> (not res!493123) (not e!410574))))

(declare-fun lt!325093 () SeekEntryResult!7345)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41265 (_ BitVec 32)) SeekEntryResult!7345)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733798 (= res!493123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325093))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733798 (= lt!325093 (Intermediate!7345 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733799 () Bool)

(declare-fun res!493114 () Bool)

(assert (=> b!733799 (=> (not res!493114) (not e!410574))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733799 (= res!493114 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19748 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733800 () Bool)

(declare-fun res!493113 () Bool)

(assert (=> b!733800 (=> (not res!493113) (not e!410572))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!733800 (= res!493113 (validKeyInArray!0 k0!2102))))

(declare-fun b!733801 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!410571 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41265 (_ BitVec 32)) SeekEntryResult!7345)

(assert (=> b!733801 (= e!410571 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) (Found!7345 j!159)))))

(declare-fun b!733802 () Bool)

(declare-fun res!493124 () Bool)

(assert (=> b!733802 (=> (not res!493124) (not e!410572))))

(declare-fun arrayContainsKey!0 (array!41265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733802 (= res!493124 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733803 () Bool)

(declare-fun e!410576 () Bool)

(declare-fun lt!325098 () (_ BitVec 32))

(assert (=> b!733803 (= e!410576 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325098 #b00000000000000000000000000000000) (bvsge lt!325098 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun b!733804 () Bool)

(declare-fun res!493120 () Bool)

(assert (=> b!733804 (=> (not res!493120) (not e!410574))))

(assert (=> b!733804 (= res!493120 e!410571)))

(declare-fun c!80721 () Bool)

(assert (=> b!733804 (= c!80721 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733805 () Bool)

(assert (=> b!733805 (= e!410569 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325096))))

(declare-fun b!733806 () Bool)

(declare-fun e!410578 () Bool)

(assert (=> b!733806 (= e!410578 e!410576)))

(declare-fun res!493112 () Bool)

(assert (=> b!733806 (=> res!493112 e!410576)))

(assert (=> b!733806 (= res!493112 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733806 (= lt!325098 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733807 () Bool)

(declare-fun res!493116 () Bool)

(assert (=> b!733807 (=> (not res!493116) (not e!410575))))

(assert (=> b!733807 (= res!493116 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20169 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20169 a!3186))))))

(declare-fun b!733808 () Bool)

(assert (=> b!733808 (= e!410571 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325093))))

(declare-fun b!733809 () Bool)

(assert (=> b!733809 (= e!410572 e!410575)))

(declare-fun res!493122 () Bool)

(assert (=> b!733809 (=> (not res!493122) (not e!410575))))

(declare-fun lt!325100 () SeekEntryResult!7345)

(assert (=> b!733809 (= res!493122 (or (= lt!325100 (MissingZero!7345 i!1173)) (= lt!325100 (MissingVacant!7345 i!1173))))))

(assert (=> b!733809 (= lt!325100 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733810 () Bool)

(declare-fun res!493119 () Bool)

(assert (=> b!733810 (=> (not res!493119) (not e!410575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41265 (_ BitVec 32)) Bool)

(assert (=> b!733810 (= res!493119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733811 () Bool)

(declare-fun res!493115 () Bool)

(assert (=> b!733811 (=> res!493115 e!410576)))

(assert (=> b!733811 (= res!493115 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) (Found!7345 j!159)))))

(declare-fun b!733812 () Bool)

(declare-fun e!410577 () Bool)

(assert (=> b!733812 (= e!410574 e!410577)))

(declare-fun res!493117 () Bool)

(assert (=> b!733812 (=> (not res!493117) (not e!410577))))

(declare-fun lt!325097 () SeekEntryResult!7345)

(declare-fun lt!325092 () SeekEntryResult!7345)

(assert (=> b!733812 (= res!493117 (= lt!325097 lt!325092))))

(declare-fun lt!325099 () array!41265)

(declare-fun lt!325095 () (_ BitVec 64))

(assert (=> b!733812 (= lt!325092 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325095 lt!325099 mask!3328))))

(assert (=> b!733812 (= lt!325097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325095 mask!3328) lt!325095 lt!325099 mask!3328))))

(assert (=> b!733812 (= lt!325095 (select (store (arr!19748 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733812 (= lt!325099 (array!41266 (store (arr!19748 a!3186) i!1173 k0!2102) (size!20169 a!3186)))))

(declare-fun b!733813 () Bool)

(declare-fun res!493125 () Bool)

(assert (=> b!733813 (=> (not res!493125) (not e!410572))))

(assert (=> b!733813 (= res!493125 (and (= (size!20169 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20169 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20169 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733814 () Bool)

(assert (=> b!733814 (= e!410577 (not e!410578))))

(declare-fun res!493127 () Bool)

(assert (=> b!733814 (=> res!493127 e!410578)))

(get-info :version)

(assert (=> b!733814 (= res!493127 (or (not ((_ is Intermediate!7345) lt!325092)) (bvsge x!1131 (x!62758 lt!325092))))))

(assert (=> b!733814 e!410573))

(declare-fun res!493118 () Bool)

(assert (=> b!733814 (=> (not res!493118) (not e!410573))))

(assert (=> b!733814 (= res!493118 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24980 0))(
  ( (Unit!24981) )
))
(declare-fun lt!325094 () Unit!24980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24980)

(assert (=> b!733814 (= lt!325094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65006 res!493126) b!733813))

(assert (= (and b!733813 res!493125) b!733797))

(assert (= (and b!733797 res!493111) b!733800))

(assert (= (and b!733800 res!493113) b!733802))

(assert (= (and b!733802 res!493124) b!733809))

(assert (= (and b!733809 res!493122) b!733810))

(assert (= (and b!733810 res!493119) b!733795))

(assert (= (and b!733795 res!493128) b!733807))

(assert (= (and b!733807 res!493116) b!733798))

(assert (= (and b!733798 res!493123) b!733799))

(assert (= (and b!733799 res!493114) b!733804))

(assert (= (and b!733804 c!80721) b!733808))

(assert (= (and b!733804 (not c!80721)) b!733801))

(assert (= (and b!733804 res!493120) b!733812))

(assert (= (and b!733812 res!493117) b!733814))

(assert (= (and b!733814 res!493118) b!733796))

(assert (= (and b!733796 res!493121) b!733805))

(assert (= (and b!733814 (not res!493127)) b!733806))

(assert (= (and b!733806 (not res!493112)) b!733811))

(assert (= (and b!733811 (not res!493115)) b!733803))

(declare-fun m!686003 () Bool)

(assert (=> b!733801 m!686003))

(assert (=> b!733801 m!686003))

(declare-fun m!686005 () Bool)

(assert (=> b!733801 m!686005))

(declare-fun m!686007 () Bool)

(assert (=> b!733795 m!686007))

(assert (=> b!733796 m!686003))

(assert (=> b!733796 m!686003))

(declare-fun m!686009 () Bool)

(assert (=> b!733796 m!686009))

(assert (=> b!733798 m!686003))

(assert (=> b!733798 m!686003))

(declare-fun m!686011 () Bool)

(assert (=> b!733798 m!686011))

(assert (=> b!733798 m!686011))

(assert (=> b!733798 m!686003))

(declare-fun m!686013 () Bool)

(assert (=> b!733798 m!686013))

(declare-fun m!686015 () Bool)

(assert (=> b!733809 m!686015))

(declare-fun m!686017 () Bool)

(assert (=> b!733800 m!686017))

(declare-fun m!686019 () Bool)

(assert (=> b!733814 m!686019))

(declare-fun m!686021 () Bool)

(assert (=> b!733814 m!686021))

(declare-fun m!686023 () Bool)

(assert (=> b!733812 m!686023))

(declare-fun m!686025 () Bool)

(assert (=> b!733812 m!686025))

(declare-fun m!686027 () Bool)

(assert (=> b!733812 m!686027))

(declare-fun m!686029 () Bool)

(assert (=> b!733812 m!686029))

(assert (=> b!733812 m!686023))

(declare-fun m!686031 () Bool)

(assert (=> b!733812 m!686031))

(assert (=> b!733797 m!686003))

(assert (=> b!733797 m!686003))

(declare-fun m!686033 () Bool)

(assert (=> b!733797 m!686033))

(assert (=> b!733805 m!686003))

(assert (=> b!733805 m!686003))

(declare-fun m!686035 () Bool)

(assert (=> b!733805 m!686035))

(declare-fun m!686037 () Bool)

(assert (=> b!733802 m!686037))

(assert (=> b!733808 m!686003))

(assert (=> b!733808 m!686003))

(declare-fun m!686039 () Bool)

(assert (=> b!733808 m!686039))

(declare-fun m!686041 () Bool)

(assert (=> b!733810 m!686041))

(assert (=> b!733811 m!686003))

(assert (=> b!733811 m!686003))

(assert (=> b!733811 m!686005))

(declare-fun m!686043 () Bool)

(assert (=> b!733806 m!686043))

(declare-fun m!686045 () Bool)

(assert (=> start!65006 m!686045))

(declare-fun m!686047 () Bool)

(assert (=> start!65006 m!686047))

(declare-fun m!686049 () Bool)

(assert (=> b!733799 m!686049))

(check-sat (not b!733802) (not b!733812) (not b!733814) (not b!733806) (not b!733796) (not b!733795) (not b!733810) (not start!65006) (not b!733808) (not b!733801) (not b!733805) (not b!733811) (not b!733798) (not b!733797) (not b!733809) (not b!733800))
(check-sat)
(get-model)

(declare-fun b!733947 () Bool)

(declare-fun e!410645 () SeekEntryResult!7345)

(assert (=> b!733947 (= e!410645 (Found!7345 resIntermediateIndex!5))))

(declare-fun b!733948 () Bool)

(declare-fun e!410646 () SeekEntryResult!7345)

(assert (=> b!733948 (= e!410646 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99795 () Bool)

(declare-fun lt!325160 () SeekEntryResult!7345)

(assert (=> d!99795 (and (or ((_ is Undefined!7345) lt!325160) (not ((_ is Found!7345) lt!325160)) (and (bvsge (index!31749 lt!325160) #b00000000000000000000000000000000) (bvslt (index!31749 lt!325160) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325160) ((_ is Found!7345) lt!325160) (not ((_ is MissingVacant!7345) lt!325160)) (not (= (index!31751 lt!325160) resIntermediateIndex!5)) (and (bvsge (index!31751 lt!325160) #b00000000000000000000000000000000) (bvslt (index!31751 lt!325160) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325160) (ite ((_ is Found!7345) lt!325160) (= (select (arr!19748 a!3186) (index!31749 lt!325160)) (select (arr!19748 a!3186) j!159)) (and ((_ is MissingVacant!7345) lt!325160) (= (index!31751 lt!325160) resIntermediateIndex!5) (= (select (arr!19748 a!3186) (index!31751 lt!325160)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!410647 () SeekEntryResult!7345)

(assert (=> d!99795 (= lt!325160 e!410647)))

(declare-fun c!80736 () Bool)

(assert (=> d!99795 (= c!80736 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!325159 () (_ BitVec 64))

(assert (=> d!99795 (= lt!325159 (select (arr!19748 a!3186) resIntermediateIndex!5))))

(assert (=> d!99795 (validMask!0 mask!3328)))

(assert (=> d!99795 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325160)))

(declare-fun b!733949 () Bool)

(declare-fun c!80735 () Bool)

(assert (=> b!733949 (= c!80735 (= lt!325159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733949 (= e!410645 e!410646)))

(declare-fun b!733950 () Bool)

(assert (=> b!733950 (= e!410647 Undefined!7345)))

(declare-fun b!733951 () Bool)

(assert (=> b!733951 (= e!410647 e!410645)))

(declare-fun c!80734 () Bool)

(assert (=> b!733951 (= c!80734 (= lt!325159 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!733952 () Bool)

(assert (=> b!733952 (= e!410646 (MissingVacant!7345 resIntermediateIndex!5))))

(assert (= (and d!99795 c!80736) b!733950))

(assert (= (and d!99795 (not c!80736)) b!733951))

(assert (= (and b!733951 c!80734) b!733947))

(assert (= (and b!733951 (not c!80734)) b!733949))

(assert (= (and b!733949 c!80735) b!733952))

(assert (= (and b!733949 (not c!80735)) b!733948))

(declare-fun m!686147 () Bool)

(assert (=> b!733948 m!686147))

(assert (=> b!733948 m!686147))

(assert (=> b!733948 m!686003))

(declare-fun m!686149 () Bool)

(assert (=> b!733948 m!686149))

(declare-fun m!686151 () Bool)

(assert (=> d!99795 m!686151))

(declare-fun m!686153 () Bool)

(assert (=> d!99795 m!686153))

(assert (=> d!99795 m!686049))

(assert (=> d!99795 m!686045))

(assert (=> b!733805 d!99795))

(declare-fun b!733961 () Bool)

(declare-fun e!410654 () Bool)

(declare-fun call!34867 () Bool)

(assert (=> b!733961 (= e!410654 call!34867)))

(declare-fun d!99797 () Bool)

(declare-fun res!493242 () Bool)

(declare-fun e!410656 () Bool)

(assert (=> d!99797 (=> res!493242 e!410656)))

(assert (=> d!99797 (= res!493242 (bvsge j!159 (size!20169 a!3186)))))

(assert (=> d!99797 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!410656)))

(declare-fun bm!34864 () Bool)

(assert (=> bm!34864 (= call!34867 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!733962 () Bool)

(assert (=> b!733962 (= e!410656 e!410654)))

(declare-fun c!80739 () Bool)

(assert (=> b!733962 (= c!80739 (validKeyInArray!0 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!733963 () Bool)

(declare-fun e!410655 () Bool)

(assert (=> b!733963 (= e!410654 e!410655)))

(declare-fun lt!325168 () (_ BitVec 64))

(assert (=> b!733963 (= lt!325168 (select (arr!19748 a!3186) j!159))))

(declare-fun lt!325167 () Unit!24980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41265 (_ BitVec 64) (_ BitVec 32)) Unit!24980)

(assert (=> b!733963 (= lt!325167 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325168 j!159))))

(assert (=> b!733963 (arrayContainsKey!0 a!3186 lt!325168 #b00000000000000000000000000000000)))

(declare-fun lt!325169 () Unit!24980)

(assert (=> b!733963 (= lt!325169 lt!325167)))

(declare-fun res!493241 () Bool)

(assert (=> b!733963 (= res!493241 (= (seekEntryOrOpen!0 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) (Found!7345 j!159)))))

(assert (=> b!733963 (=> (not res!493241) (not e!410655))))

(declare-fun b!733964 () Bool)

(assert (=> b!733964 (= e!410655 call!34867)))

(assert (= (and d!99797 (not res!493242)) b!733962))

(assert (= (and b!733962 c!80739) b!733963))

(assert (= (and b!733962 (not c!80739)) b!733961))

(assert (= (and b!733963 res!493241) b!733964))

(assert (= (or b!733964 b!733961) bm!34864))

(declare-fun m!686155 () Bool)

(assert (=> bm!34864 m!686155))

(assert (=> b!733962 m!686003))

(assert (=> b!733962 m!686003))

(assert (=> b!733962 m!686033))

(assert (=> b!733963 m!686003))

(declare-fun m!686157 () Bool)

(assert (=> b!733963 m!686157))

(declare-fun m!686159 () Bool)

(assert (=> b!733963 m!686159))

(assert (=> b!733963 m!686003))

(assert (=> b!733963 m!686009))

(assert (=> b!733814 d!99797))

(declare-fun d!99799 () Bool)

(assert (=> d!99799 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!325172 () Unit!24980)

(declare-fun choose!38 (array!41265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24980)

(assert (=> d!99799 (= lt!325172 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99799 (validMask!0 mask!3328)))

(assert (=> d!99799 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!325172)))

(declare-fun bs!20949 () Bool)

(assert (= bs!20949 d!99799))

(assert (=> bs!20949 m!686019))

(declare-fun m!686161 () Bool)

(assert (=> bs!20949 m!686161))

(assert (=> bs!20949 m!686045))

(assert (=> b!733814 d!99799))

(declare-fun d!99801 () Bool)

(declare-fun res!493247 () Bool)

(declare-fun e!410661 () Bool)

(assert (=> d!99801 (=> res!493247 e!410661)))

(assert (=> d!99801 (= res!493247 (= (select (arr!19748 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99801 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!410661)))

(declare-fun b!733969 () Bool)

(declare-fun e!410662 () Bool)

(assert (=> b!733969 (= e!410661 e!410662)))

(declare-fun res!493248 () Bool)

(assert (=> b!733969 (=> (not res!493248) (not e!410662))))

(assert (=> b!733969 (= res!493248 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20169 a!3186)))))

(declare-fun b!733970 () Bool)

(assert (=> b!733970 (= e!410662 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99801 (not res!493247)) b!733969))

(assert (= (and b!733969 res!493248) b!733970))

(declare-fun m!686163 () Bool)

(assert (=> d!99801 m!686163))

(declare-fun m!686165 () Bool)

(assert (=> b!733970 m!686165))

(assert (=> b!733802 d!99801))

(declare-fun d!99803 () Bool)

(declare-fun e!410684 () Bool)

(assert (=> d!99803 e!410684))

(declare-fun c!80756 () Bool)

(declare-fun lt!325183 () SeekEntryResult!7345)

(assert (=> d!99803 (= c!80756 (and ((_ is Intermediate!7345) lt!325183) (undefined!8157 lt!325183)))))

(declare-fun e!410685 () SeekEntryResult!7345)

(assert (=> d!99803 (= lt!325183 e!410685)))

(declare-fun c!80755 () Bool)

(assert (=> d!99803 (= c!80755 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325184 () (_ BitVec 64))

(assert (=> d!99803 (= lt!325184 (select (arr!19748 lt!325099) index!1321))))

(assert (=> d!99803 (validMask!0 mask!3328)))

(assert (=> d!99803 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325095 lt!325099 mask!3328) lt!325183)))

(declare-fun b!734007 () Bool)

(declare-fun e!410686 () SeekEntryResult!7345)

(assert (=> b!734007 (= e!410686 (Intermediate!7345 false index!1321 x!1131))))

(declare-fun b!734008 () Bool)

(assert (=> b!734008 (= e!410685 e!410686)))

(declare-fun c!80757 () Bool)

(assert (=> b!734008 (= c!80757 (or (= lt!325184 lt!325095) (= (bvadd lt!325184 lt!325184) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734009 () Bool)

(assert (=> b!734009 (and (bvsge (index!31750 lt!325183) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325183) (size!20169 lt!325099)))))

(declare-fun e!410682 () Bool)

(assert (=> b!734009 (= e!410682 (= (select (arr!19748 lt!325099) (index!31750 lt!325183)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734010 () Bool)

(assert (=> b!734010 (= e!410684 (bvsge (x!62758 lt!325183) #b01111111111111111111111111111110))))

(declare-fun b!734011 () Bool)

(assert (=> b!734011 (= e!410685 (Intermediate!7345 true index!1321 x!1131))))

(declare-fun b!734012 () Bool)

(declare-fun e!410683 () Bool)

(assert (=> b!734012 (= e!410684 e!410683)))

(declare-fun res!493255 () Bool)

(assert (=> b!734012 (= res!493255 (and ((_ is Intermediate!7345) lt!325183) (not (undefined!8157 lt!325183)) (bvslt (x!62758 lt!325183) #b01111111111111111111111111111110) (bvsge (x!62758 lt!325183) #b00000000000000000000000000000000) (bvsge (x!62758 lt!325183) x!1131)))))

(assert (=> b!734012 (=> (not res!493255) (not e!410683))))

(declare-fun b!734013 () Bool)

(assert (=> b!734013 (and (bvsge (index!31750 lt!325183) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325183) (size!20169 lt!325099)))))

(declare-fun res!493257 () Bool)

(assert (=> b!734013 (= res!493257 (= (select (arr!19748 lt!325099) (index!31750 lt!325183)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734013 (=> res!493257 e!410682)))

(declare-fun b!734014 () Bool)

(assert (=> b!734014 (= e!410686 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!325095 lt!325099 mask!3328))))

(declare-fun b!734015 () Bool)

(assert (=> b!734015 (and (bvsge (index!31750 lt!325183) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325183) (size!20169 lt!325099)))))

(declare-fun res!493256 () Bool)

(assert (=> b!734015 (= res!493256 (= (select (arr!19748 lt!325099) (index!31750 lt!325183)) lt!325095))))

(assert (=> b!734015 (=> res!493256 e!410682)))

(assert (=> b!734015 (= e!410683 e!410682)))

(assert (= (and d!99803 c!80755) b!734011))

(assert (= (and d!99803 (not c!80755)) b!734008))

(assert (= (and b!734008 c!80757) b!734007))

(assert (= (and b!734008 (not c!80757)) b!734014))

(assert (= (and d!99803 c!80756) b!734010))

(assert (= (and d!99803 (not c!80756)) b!734012))

(assert (= (and b!734012 res!493255) b!734015))

(assert (= (and b!734015 (not res!493256)) b!734013))

(assert (= (and b!734013 (not res!493257)) b!734009))

(declare-fun m!686175 () Bool)

(assert (=> b!734009 m!686175))

(declare-fun m!686177 () Bool)

(assert (=> d!99803 m!686177))

(assert (=> d!99803 m!686045))

(assert (=> b!734015 m!686175))

(assert (=> b!734014 m!686043))

(assert (=> b!734014 m!686043))

(declare-fun m!686179 () Bool)

(assert (=> b!734014 m!686179))

(assert (=> b!734013 m!686175))

(assert (=> b!733812 d!99803))

(declare-fun d!99811 () Bool)

(declare-fun e!410689 () Bool)

(assert (=> d!99811 e!410689))

(declare-fun c!80759 () Bool)

(declare-fun lt!325185 () SeekEntryResult!7345)

(assert (=> d!99811 (= c!80759 (and ((_ is Intermediate!7345) lt!325185) (undefined!8157 lt!325185)))))

(declare-fun e!410690 () SeekEntryResult!7345)

(assert (=> d!99811 (= lt!325185 e!410690)))

(declare-fun c!80758 () Bool)

(assert (=> d!99811 (= c!80758 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!325186 () (_ BitVec 64))

(assert (=> d!99811 (= lt!325186 (select (arr!19748 lt!325099) (toIndex!0 lt!325095 mask!3328)))))

(assert (=> d!99811 (validMask!0 mask!3328)))

(assert (=> d!99811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325095 mask!3328) lt!325095 lt!325099 mask!3328) lt!325185)))

(declare-fun b!734016 () Bool)

(declare-fun e!410691 () SeekEntryResult!7345)

(assert (=> b!734016 (= e!410691 (Intermediate!7345 false (toIndex!0 lt!325095 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734017 () Bool)

(assert (=> b!734017 (= e!410690 e!410691)))

(declare-fun c!80760 () Bool)

(assert (=> b!734017 (= c!80760 (or (= lt!325186 lt!325095) (= (bvadd lt!325186 lt!325186) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734018 () Bool)

(assert (=> b!734018 (and (bvsge (index!31750 lt!325185) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325185) (size!20169 lt!325099)))))

(declare-fun e!410687 () Bool)

(assert (=> b!734018 (= e!410687 (= (select (arr!19748 lt!325099) (index!31750 lt!325185)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734019 () Bool)

(assert (=> b!734019 (= e!410689 (bvsge (x!62758 lt!325185) #b01111111111111111111111111111110))))

(declare-fun b!734020 () Bool)

(assert (=> b!734020 (= e!410690 (Intermediate!7345 true (toIndex!0 lt!325095 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734021 () Bool)

(declare-fun e!410688 () Bool)

(assert (=> b!734021 (= e!410689 e!410688)))

(declare-fun res!493258 () Bool)

(assert (=> b!734021 (= res!493258 (and ((_ is Intermediate!7345) lt!325185) (not (undefined!8157 lt!325185)) (bvslt (x!62758 lt!325185) #b01111111111111111111111111111110) (bvsge (x!62758 lt!325185) #b00000000000000000000000000000000) (bvsge (x!62758 lt!325185) #b00000000000000000000000000000000)))))

(assert (=> b!734021 (=> (not res!493258) (not e!410688))))

(declare-fun b!734022 () Bool)

(assert (=> b!734022 (and (bvsge (index!31750 lt!325185) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325185) (size!20169 lt!325099)))))

(declare-fun res!493260 () Bool)

(assert (=> b!734022 (= res!493260 (= (select (arr!19748 lt!325099) (index!31750 lt!325185)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734022 (=> res!493260 e!410687)))

(declare-fun b!734023 () Bool)

(assert (=> b!734023 (= e!410691 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!325095 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!325095 lt!325099 mask!3328))))

(declare-fun b!734024 () Bool)

(assert (=> b!734024 (and (bvsge (index!31750 lt!325185) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325185) (size!20169 lt!325099)))))

(declare-fun res!493259 () Bool)

(assert (=> b!734024 (= res!493259 (= (select (arr!19748 lt!325099) (index!31750 lt!325185)) lt!325095))))

(assert (=> b!734024 (=> res!493259 e!410687)))

(assert (=> b!734024 (= e!410688 e!410687)))

(assert (= (and d!99811 c!80758) b!734020))

(assert (= (and d!99811 (not c!80758)) b!734017))

(assert (= (and b!734017 c!80760) b!734016))

(assert (= (and b!734017 (not c!80760)) b!734023))

(assert (= (and d!99811 c!80759) b!734019))

(assert (= (and d!99811 (not c!80759)) b!734021))

(assert (= (and b!734021 res!493258) b!734024))

(assert (= (and b!734024 (not res!493259)) b!734022))

(assert (= (and b!734022 (not res!493260)) b!734018))

(declare-fun m!686181 () Bool)

(assert (=> b!734018 m!686181))

(assert (=> d!99811 m!686023))

(declare-fun m!686183 () Bool)

(assert (=> d!99811 m!686183))

(assert (=> d!99811 m!686045))

(assert (=> b!734024 m!686181))

(assert (=> b!734023 m!686023))

(declare-fun m!686185 () Bool)

(assert (=> b!734023 m!686185))

(assert (=> b!734023 m!686185))

(declare-fun m!686187 () Bool)

(assert (=> b!734023 m!686187))

(assert (=> b!734022 m!686181))

(assert (=> b!733812 d!99811))

(declare-fun d!99813 () Bool)

(declare-fun lt!325198 () (_ BitVec 32))

(declare-fun lt!325197 () (_ BitVec 32))

(assert (=> d!99813 (= lt!325198 (bvmul (bvxor lt!325197 (bvlshr lt!325197 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99813 (= lt!325197 ((_ extract 31 0) (bvand (bvxor lt!325095 (bvlshr lt!325095 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99813 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493261 (let ((h!14857 ((_ extract 31 0) (bvand (bvxor lt!325095 (bvlshr lt!325095 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62764 (bvmul (bvxor h!14857 (bvlshr h!14857 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62764 (bvlshr x!62764 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493261 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493261 #b00000000000000000000000000000000))))))

(assert (=> d!99813 (= (toIndex!0 lt!325095 mask!3328) (bvand (bvxor lt!325198 (bvlshr lt!325198 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!733812 d!99813))

(declare-fun b!734037 () Bool)

(declare-fun e!410698 () SeekEntryResult!7345)

(assert (=> b!734037 (= e!410698 (Found!7345 index!1321))))

(declare-fun e!410699 () SeekEntryResult!7345)

(declare-fun b!734038 () Bool)

(assert (=> b!734038 (= e!410699 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99815 () Bool)

(declare-fun lt!325200 () SeekEntryResult!7345)

(assert (=> d!99815 (and (or ((_ is Undefined!7345) lt!325200) (not ((_ is Found!7345) lt!325200)) (and (bvsge (index!31749 lt!325200) #b00000000000000000000000000000000) (bvslt (index!31749 lt!325200) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325200) ((_ is Found!7345) lt!325200) (not ((_ is MissingVacant!7345) lt!325200)) (not (= (index!31751 lt!325200) resIntermediateIndex!5)) (and (bvsge (index!31751 lt!325200) #b00000000000000000000000000000000) (bvslt (index!31751 lt!325200) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325200) (ite ((_ is Found!7345) lt!325200) (= (select (arr!19748 a!3186) (index!31749 lt!325200)) (select (arr!19748 a!3186) j!159)) (and ((_ is MissingVacant!7345) lt!325200) (= (index!31751 lt!325200) resIntermediateIndex!5) (= (select (arr!19748 a!3186) (index!31751 lt!325200)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!410700 () SeekEntryResult!7345)

(assert (=> d!99815 (= lt!325200 e!410700)))

(declare-fun c!80769 () Bool)

(assert (=> d!99815 (= c!80769 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325199 () (_ BitVec 64))

(assert (=> d!99815 (= lt!325199 (select (arr!19748 a!3186) index!1321))))

(assert (=> d!99815 (validMask!0 mask!3328)))

(assert (=> d!99815 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325200)))

(declare-fun b!734039 () Bool)

(declare-fun c!80768 () Bool)

(assert (=> b!734039 (= c!80768 (= lt!325199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734039 (= e!410698 e!410699)))

(declare-fun b!734040 () Bool)

(assert (=> b!734040 (= e!410700 Undefined!7345)))

(declare-fun b!734041 () Bool)

(assert (=> b!734041 (= e!410700 e!410698)))

(declare-fun c!80767 () Bool)

(assert (=> b!734041 (= c!80767 (= lt!325199 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!734042 () Bool)

(assert (=> b!734042 (= e!410699 (MissingVacant!7345 resIntermediateIndex!5))))

(assert (= (and d!99815 c!80769) b!734040))

(assert (= (and d!99815 (not c!80769)) b!734041))

(assert (= (and b!734041 c!80767) b!734037))

(assert (= (and b!734041 (not c!80767)) b!734039))

(assert (= (and b!734039 c!80768) b!734042))

(assert (= (and b!734039 (not c!80768)) b!734038))

(assert (=> b!734038 m!686043))

(assert (=> b!734038 m!686043))

(assert (=> b!734038 m!686003))

(declare-fun m!686189 () Bool)

(assert (=> b!734038 m!686189))

(declare-fun m!686191 () Bool)

(assert (=> d!99815 m!686191))

(declare-fun m!686193 () Bool)

(assert (=> d!99815 m!686193))

(declare-fun m!686195 () Bool)

(assert (=> d!99815 m!686195))

(assert (=> d!99815 m!686045))

(assert (=> b!733801 d!99815))

(assert (=> b!733811 d!99815))

(declare-fun d!99817 () Bool)

(assert (=> d!99817 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!733800 d!99817))

(declare-fun b!734043 () Bool)

(declare-fun e!410701 () Bool)

(declare-fun call!34868 () Bool)

(assert (=> b!734043 (= e!410701 call!34868)))

(declare-fun d!99819 () Bool)

(declare-fun res!493263 () Bool)

(declare-fun e!410703 () Bool)

(assert (=> d!99819 (=> res!493263 e!410703)))

(assert (=> d!99819 (= res!493263 (bvsge #b00000000000000000000000000000000 (size!20169 a!3186)))))

(assert (=> d!99819 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!410703)))

(declare-fun bm!34865 () Bool)

(assert (=> bm!34865 (= call!34868 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!734044 () Bool)

(assert (=> b!734044 (= e!410703 e!410701)))

(declare-fun c!80770 () Bool)

(assert (=> b!734044 (= c!80770 (validKeyInArray!0 (select (arr!19748 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734045 () Bool)

(declare-fun e!410702 () Bool)

(assert (=> b!734045 (= e!410701 e!410702)))

(declare-fun lt!325202 () (_ BitVec 64))

(assert (=> b!734045 (= lt!325202 (select (arr!19748 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!325201 () Unit!24980)

(assert (=> b!734045 (= lt!325201 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325202 #b00000000000000000000000000000000))))

(assert (=> b!734045 (arrayContainsKey!0 a!3186 lt!325202 #b00000000000000000000000000000000)))

(declare-fun lt!325203 () Unit!24980)

(assert (=> b!734045 (= lt!325203 lt!325201)))

(declare-fun res!493262 () Bool)

(assert (=> b!734045 (= res!493262 (= (seekEntryOrOpen!0 (select (arr!19748 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7345 #b00000000000000000000000000000000)))))

(assert (=> b!734045 (=> (not res!493262) (not e!410702))))

(declare-fun b!734046 () Bool)

(assert (=> b!734046 (= e!410702 call!34868)))

(assert (= (and d!99819 (not res!493263)) b!734044))

(assert (= (and b!734044 c!80770) b!734045))

(assert (= (and b!734044 (not c!80770)) b!734043))

(assert (= (and b!734045 res!493262) b!734046))

(assert (= (or b!734046 b!734043) bm!34865))

(declare-fun m!686197 () Bool)

(assert (=> bm!34865 m!686197))

(assert (=> b!734044 m!686163))

(assert (=> b!734044 m!686163))

(declare-fun m!686199 () Bool)

(assert (=> b!734044 m!686199))

(assert (=> b!734045 m!686163))

(declare-fun m!686201 () Bool)

(assert (=> b!734045 m!686201))

(declare-fun m!686203 () Bool)

(assert (=> b!734045 m!686203))

(assert (=> b!734045 m!686163))

(declare-fun m!686205 () Bool)

(assert (=> b!734045 m!686205))

(assert (=> b!733810 d!99819))

(declare-fun d!99821 () Bool)

(assert (=> d!99821 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65006 d!99821))

(declare-fun d!99827 () Bool)

(assert (=> d!99827 (= (array_inv!15631 a!3186) (bvsge (size!20169 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65006 d!99827))

(declare-fun b!734142 () Bool)

(declare-fun e!410763 () SeekEntryResult!7345)

(declare-fun lt!325246 () SeekEntryResult!7345)

(assert (=> b!734142 (= e!410763 (MissingZero!7345 (index!31750 lt!325246)))))

(declare-fun b!734143 () Bool)

(assert (=> b!734143 (= e!410763 (seekKeyOrZeroReturnVacant!0 (x!62758 lt!325246) (index!31750 lt!325246) (index!31750 lt!325246) k0!2102 a!3186 mask!3328))))

(declare-fun b!734144 () Bool)

(declare-fun e!410764 () SeekEntryResult!7345)

(assert (=> b!734144 (= e!410764 (Found!7345 (index!31750 lt!325246)))))

(declare-fun b!734145 () Bool)

(declare-fun e!410765 () SeekEntryResult!7345)

(assert (=> b!734145 (= e!410765 e!410764)))

(declare-fun lt!325247 () (_ BitVec 64))

(assert (=> b!734145 (= lt!325247 (select (arr!19748 a!3186) (index!31750 lt!325246)))))

(declare-fun c!80809 () Bool)

(assert (=> b!734145 (= c!80809 (= lt!325247 k0!2102))))

(declare-fun b!734146 () Bool)

(declare-fun c!80807 () Bool)

(assert (=> b!734146 (= c!80807 (= lt!325247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734146 (= e!410764 e!410763)))

(declare-fun b!734147 () Bool)

(assert (=> b!734147 (= e!410765 Undefined!7345)))

(declare-fun d!99829 () Bool)

(declare-fun lt!325248 () SeekEntryResult!7345)

(assert (=> d!99829 (and (or ((_ is Undefined!7345) lt!325248) (not ((_ is Found!7345) lt!325248)) (and (bvsge (index!31749 lt!325248) #b00000000000000000000000000000000) (bvslt (index!31749 lt!325248) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325248) ((_ is Found!7345) lt!325248) (not ((_ is MissingZero!7345) lt!325248)) (and (bvsge (index!31748 lt!325248) #b00000000000000000000000000000000) (bvslt (index!31748 lt!325248) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325248) ((_ is Found!7345) lt!325248) ((_ is MissingZero!7345) lt!325248) (not ((_ is MissingVacant!7345) lt!325248)) (and (bvsge (index!31751 lt!325248) #b00000000000000000000000000000000) (bvslt (index!31751 lt!325248) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325248) (ite ((_ is Found!7345) lt!325248) (= (select (arr!19748 a!3186) (index!31749 lt!325248)) k0!2102) (ite ((_ is MissingZero!7345) lt!325248) (= (select (arr!19748 a!3186) (index!31748 lt!325248)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7345) lt!325248) (= (select (arr!19748 a!3186) (index!31751 lt!325248)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99829 (= lt!325248 e!410765)))

(declare-fun c!80808 () Bool)

(assert (=> d!99829 (= c!80808 (and ((_ is Intermediate!7345) lt!325246) (undefined!8157 lt!325246)))))

(assert (=> d!99829 (= lt!325246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99829 (validMask!0 mask!3328)))

(assert (=> d!99829 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!325248)))

(assert (= (and d!99829 c!80808) b!734147))

(assert (= (and d!99829 (not c!80808)) b!734145))

(assert (= (and b!734145 c!80809) b!734144))

(assert (= (and b!734145 (not c!80809)) b!734146))

(assert (= (and b!734146 c!80807) b!734142))

(assert (= (and b!734146 (not c!80807)) b!734143))

(declare-fun m!686273 () Bool)

(assert (=> b!734143 m!686273))

(declare-fun m!686275 () Bool)

(assert (=> b!734145 m!686275))

(assert (=> d!99829 m!686045))

(declare-fun m!686277 () Bool)

(assert (=> d!99829 m!686277))

(declare-fun m!686279 () Bool)

(assert (=> d!99829 m!686279))

(declare-fun m!686281 () Bool)

(assert (=> d!99829 m!686281))

(assert (=> d!99829 m!686281))

(declare-fun m!686283 () Bool)

(assert (=> d!99829 m!686283))

(declare-fun m!686285 () Bool)

(assert (=> d!99829 m!686285))

(assert (=> b!733809 d!99829))

(declare-fun d!99845 () Bool)

(declare-fun e!410768 () Bool)

(assert (=> d!99845 e!410768))

(declare-fun c!80811 () Bool)

(declare-fun lt!325249 () SeekEntryResult!7345)

(assert (=> d!99845 (= c!80811 (and ((_ is Intermediate!7345) lt!325249) (undefined!8157 lt!325249)))))

(declare-fun e!410769 () SeekEntryResult!7345)

(assert (=> d!99845 (= lt!325249 e!410769)))

(declare-fun c!80810 () Bool)

(assert (=> d!99845 (= c!80810 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!325250 () (_ BitVec 64))

(assert (=> d!99845 (= lt!325250 (select (arr!19748 a!3186) (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328)))))

(assert (=> d!99845 (validMask!0 mask!3328)))

(assert (=> d!99845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325249)))

(declare-fun b!734148 () Bool)

(declare-fun e!410770 () SeekEntryResult!7345)

(assert (=> b!734148 (= e!410770 (Intermediate!7345 false (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734149 () Bool)

(assert (=> b!734149 (= e!410769 e!410770)))

(declare-fun c!80812 () Bool)

(assert (=> b!734149 (= c!80812 (or (= lt!325250 (select (arr!19748 a!3186) j!159)) (= (bvadd lt!325250 lt!325250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734150 () Bool)

(assert (=> b!734150 (and (bvsge (index!31750 lt!325249) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325249) (size!20169 a!3186)))))

(declare-fun e!410766 () Bool)

(assert (=> b!734150 (= e!410766 (= (select (arr!19748 a!3186) (index!31750 lt!325249)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734151 () Bool)

(assert (=> b!734151 (= e!410768 (bvsge (x!62758 lt!325249) #b01111111111111111111111111111110))))

(declare-fun b!734152 () Bool)

(assert (=> b!734152 (= e!410769 (Intermediate!7345 true (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734153 () Bool)

(declare-fun e!410767 () Bool)

(assert (=> b!734153 (= e!410768 e!410767)))

(declare-fun res!493287 () Bool)

(assert (=> b!734153 (= res!493287 (and ((_ is Intermediate!7345) lt!325249) (not (undefined!8157 lt!325249)) (bvslt (x!62758 lt!325249) #b01111111111111111111111111111110) (bvsge (x!62758 lt!325249) #b00000000000000000000000000000000) (bvsge (x!62758 lt!325249) #b00000000000000000000000000000000)))))

(assert (=> b!734153 (=> (not res!493287) (not e!410767))))

(declare-fun b!734154 () Bool)

(assert (=> b!734154 (and (bvsge (index!31750 lt!325249) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325249) (size!20169 a!3186)))))

(declare-fun res!493289 () Bool)

(assert (=> b!734154 (= res!493289 (= (select (arr!19748 a!3186) (index!31750 lt!325249)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734154 (=> res!493289 e!410766)))

(declare-fun b!734155 () Bool)

(assert (=> b!734155 (= e!410770 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734156 () Bool)

(assert (=> b!734156 (and (bvsge (index!31750 lt!325249) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325249) (size!20169 a!3186)))))

(declare-fun res!493288 () Bool)

(assert (=> b!734156 (= res!493288 (= (select (arr!19748 a!3186) (index!31750 lt!325249)) (select (arr!19748 a!3186) j!159)))))

(assert (=> b!734156 (=> res!493288 e!410766)))

(assert (=> b!734156 (= e!410767 e!410766)))

(assert (= (and d!99845 c!80810) b!734152))

(assert (= (and d!99845 (not c!80810)) b!734149))

(assert (= (and b!734149 c!80812) b!734148))

(assert (= (and b!734149 (not c!80812)) b!734155))

(assert (= (and d!99845 c!80811) b!734151))

(assert (= (and d!99845 (not c!80811)) b!734153))

(assert (= (and b!734153 res!493287) b!734156))

(assert (= (and b!734156 (not res!493288)) b!734154))

(assert (= (and b!734154 (not res!493289)) b!734150))

(declare-fun m!686287 () Bool)

(assert (=> b!734150 m!686287))

(assert (=> d!99845 m!686011))

(declare-fun m!686289 () Bool)

(assert (=> d!99845 m!686289))

(assert (=> d!99845 m!686045))

(assert (=> b!734156 m!686287))

(assert (=> b!734155 m!686011))

(declare-fun m!686291 () Bool)

(assert (=> b!734155 m!686291))

(assert (=> b!734155 m!686291))

(assert (=> b!734155 m!686003))

(declare-fun m!686293 () Bool)

(assert (=> b!734155 m!686293))

(assert (=> b!734154 m!686287))

(assert (=> b!733798 d!99845))

(declare-fun d!99847 () Bool)

(declare-fun lt!325252 () (_ BitVec 32))

(declare-fun lt!325251 () (_ BitVec 32))

(assert (=> d!99847 (= lt!325252 (bvmul (bvxor lt!325251 (bvlshr lt!325251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99847 (= lt!325251 ((_ extract 31 0) (bvand (bvxor (select (arr!19748 a!3186) j!159) (bvlshr (select (arr!19748 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99847 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493261 (let ((h!14857 ((_ extract 31 0) (bvand (bvxor (select (arr!19748 a!3186) j!159) (bvlshr (select (arr!19748 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62764 (bvmul (bvxor h!14857 (bvlshr h!14857 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62764 (bvlshr x!62764 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493261 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493261 #b00000000000000000000000000000000))))))

(assert (=> d!99847 (= (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) (bvand (bvxor lt!325252 (bvlshr lt!325252 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!733798 d!99847))

(declare-fun d!99849 () Bool)

(declare-fun e!410777 () Bool)

(assert (=> d!99849 e!410777))

(declare-fun c!80815 () Bool)

(declare-fun lt!325253 () SeekEntryResult!7345)

(assert (=> d!99849 (= c!80815 (and ((_ is Intermediate!7345) lt!325253) (undefined!8157 lt!325253)))))

(declare-fun e!410778 () SeekEntryResult!7345)

(assert (=> d!99849 (= lt!325253 e!410778)))

(declare-fun c!80814 () Bool)

(assert (=> d!99849 (= c!80814 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325254 () (_ BitVec 64))

(assert (=> d!99849 (= lt!325254 (select (arr!19748 a!3186) index!1321))))

(assert (=> d!99849 (validMask!0 mask!3328)))

(assert (=> d!99849 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325253)))

(declare-fun b!734162 () Bool)

(declare-fun e!410779 () SeekEntryResult!7345)

(assert (=> b!734162 (= e!410779 (Intermediate!7345 false index!1321 x!1131))))

(declare-fun b!734163 () Bool)

(assert (=> b!734163 (= e!410778 e!410779)))

(declare-fun c!80816 () Bool)

(assert (=> b!734163 (= c!80816 (or (= lt!325254 (select (arr!19748 a!3186) j!159)) (= (bvadd lt!325254 lt!325254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734164 () Bool)

(assert (=> b!734164 (and (bvsge (index!31750 lt!325253) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325253) (size!20169 a!3186)))))

(declare-fun e!410775 () Bool)

(assert (=> b!734164 (= e!410775 (= (select (arr!19748 a!3186) (index!31750 lt!325253)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734165 () Bool)

(assert (=> b!734165 (= e!410777 (bvsge (x!62758 lt!325253) #b01111111111111111111111111111110))))

(declare-fun b!734166 () Bool)

(assert (=> b!734166 (= e!410778 (Intermediate!7345 true index!1321 x!1131))))

(declare-fun b!734167 () Bool)

(declare-fun e!410776 () Bool)

(assert (=> b!734167 (= e!410777 e!410776)))

(declare-fun res!493293 () Bool)

(assert (=> b!734167 (= res!493293 (and ((_ is Intermediate!7345) lt!325253) (not (undefined!8157 lt!325253)) (bvslt (x!62758 lt!325253) #b01111111111111111111111111111110) (bvsge (x!62758 lt!325253) #b00000000000000000000000000000000) (bvsge (x!62758 lt!325253) x!1131)))))

(assert (=> b!734167 (=> (not res!493293) (not e!410776))))

(declare-fun b!734168 () Bool)

(assert (=> b!734168 (and (bvsge (index!31750 lt!325253) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325253) (size!20169 a!3186)))))

(declare-fun res!493295 () Bool)

(assert (=> b!734168 (= res!493295 (= (select (arr!19748 a!3186) (index!31750 lt!325253)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734168 (=> res!493295 e!410775)))

(declare-fun b!734169 () Bool)

(assert (=> b!734169 (= e!410779 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734170 () Bool)

(assert (=> b!734170 (and (bvsge (index!31750 lt!325253) #b00000000000000000000000000000000) (bvslt (index!31750 lt!325253) (size!20169 a!3186)))))

(declare-fun res!493294 () Bool)

(assert (=> b!734170 (= res!493294 (= (select (arr!19748 a!3186) (index!31750 lt!325253)) (select (arr!19748 a!3186) j!159)))))

(assert (=> b!734170 (=> res!493294 e!410775)))

(assert (=> b!734170 (= e!410776 e!410775)))

(assert (= (and d!99849 c!80814) b!734166))

(assert (= (and d!99849 (not c!80814)) b!734163))

(assert (= (and b!734163 c!80816) b!734162))

(assert (= (and b!734163 (not c!80816)) b!734169))

(assert (= (and d!99849 c!80815) b!734165))

(assert (= (and d!99849 (not c!80815)) b!734167))

(assert (= (and b!734167 res!493293) b!734170))

(assert (= (and b!734170 (not res!493294)) b!734168))

(assert (= (and b!734168 (not res!493295)) b!734164))

(declare-fun m!686299 () Bool)

(assert (=> b!734164 m!686299))

(assert (=> d!99849 m!686195))

(assert (=> d!99849 m!686045))

(assert (=> b!734170 m!686299))

(assert (=> b!734169 m!686043))

(assert (=> b!734169 m!686043))

(assert (=> b!734169 m!686003))

(declare-fun m!686301 () Bool)

(assert (=> b!734169 m!686301))

(assert (=> b!734168 m!686299))

(assert (=> b!733808 d!99849))

(declare-fun d!99853 () Bool)

(assert (=> d!99853 (= (validKeyInArray!0 (select (arr!19748 a!3186) j!159)) (and (not (= (select (arr!19748 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19748 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!733797 d!99853))

(declare-fun b!734171 () Bool)

(declare-fun e!410780 () SeekEntryResult!7345)

(declare-fun lt!325255 () SeekEntryResult!7345)

(assert (=> b!734171 (= e!410780 (MissingZero!7345 (index!31750 lt!325255)))))

(declare-fun b!734172 () Bool)

(assert (=> b!734172 (= e!410780 (seekKeyOrZeroReturnVacant!0 (x!62758 lt!325255) (index!31750 lt!325255) (index!31750 lt!325255) (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734173 () Bool)

(declare-fun e!410781 () SeekEntryResult!7345)

(assert (=> b!734173 (= e!410781 (Found!7345 (index!31750 lt!325255)))))

(declare-fun b!734174 () Bool)

(declare-fun e!410782 () SeekEntryResult!7345)

(assert (=> b!734174 (= e!410782 e!410781)))

(declare-fun lt!325256 () (_ BitVec 64))

(assert (=> b!734174 (= lt!325256 (select (arr!19748 a!3186) (index!31750 lt!325255)))))

(declare-fun c!80819 () Bool)

(assert (=> b!734174 (= c!80819 (= lt!325256 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!734175 () Bool)

(declare-fun c!80817 () Bool)

(assert (=> b!734175 (= c!80817 (= lt!325256 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734175 (= e!410781 e!410780)))

(declare-fun b!734176 () Bool)

(assert (=> b!734176 (= e!410782 Undefined!7345)))

(declare-fun d!99855 () Bool)

(declare-fun lt!325257 () SeekEntryResult!7345)

(assert (=> d!99855 (and (or ((_ is Undefined!7345) lt!325257) (not ((_ is Found!7345) lt!325257)) (and (bvsge (index!31749 lt!325257) #b00000000000000000000000000000000) (bvslt (index!31749 lt!325257) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325257) ((_ is Found!7345) lt!325257) (not ((_ is MissingZero!7345) lt!325257)) (and (bvsge (index!31748 lt!325257) #b00000000000000000000000000000000) (bvslt (index!31748 lt!325257) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325257) ((_ is Found!7345) lt!325257) ((_ is MissingZero!7345) lt!325257) (not ((_ is MissingVacant!7345) lt!325257)) (and (bvsge (index!31751 lt!325257) #b00000000000000000000000000000000) (bvslt (index!31751 lt!325257) (size!20169 a!3186)))) (or ((_ is Undefined!7345) lt!325257) (ite ((_ is Found!7345) lt!325257) (= (select (arr!19748 a!3186) (index!31749 lt!325257)) (select (arr!19748 a!3186) j!159)) (ite ((_ is MissingZero!7345) lt!325257) (= (select (arr!19748 a!3186) (index!31748 lt!325257)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7345) lt!325257) (= (select (arr!19748 a!3186) (index!31751 lt!325257)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99855 (= lt!325257 e!410782)))

(declare-fun c!80818 () Bool)

(assert (=> d!99855 (= c!80818 (and ((_ is Intermediate!7345) lt!325255) (undefined!8157 lt!325255)))))

(assert (=> d!99855 (= lt!325255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99855 (validMask!0 mask!3328)))

(assert (=> d!99855 (= (seekEntryOrOpen!0 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325257)))

(assert (= (and d!99855 c!80818) b!734176))

(assert (= (and d!99855 (not c!80818)) b!734174))

(assert (= (and b!734174 c!80819) b!734173))

(assert (= (and b!734174 (not c!80819)) b!734175))

(assert (= (and b!734175 c!80817) b!734171))

(assert (= (and b!734175 (not c!80817)) b!734172))

(assert (=> b!734172 m!686003))

(declare-fun m!686303 () Bool)

(assert (=> b!734172 m!686303))

(declare-fun m!686305 () Bool)

(assert (=> b!734174 m!686305))

(assert (=> d!99855 m!686045))

(declare-fun m!686307 () Bool)

(assert (=> d!99855 m!686307))

(declare-fun m!686309 () Bool)

(assert (=> d!99855 m!686309))

(assert (=> d!99855 m!686003))

(assert (=> d!99855 m!686011))

(assert (=> d!99855 m!686011))

(assert (=> d!99855 m!686003))

(assert (=> d!99855 m!686013))

(declare-fun m!686311 () Bool)

(assert (=> d!99855 m!686311))

(assert (=> b!733796 d!99855))

(declare-fun d!99859 () Bool)

(declare-fun lt!325260 () (_ BitVec 32))

(assert (=> d!99859 (and (bvsge lt!325260 #b00000000000000000000000000000000) (bvslt lt!325260 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99859 (= lt!325260 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99859 (validMask!0 mask!3328)))

(assert (=> d!99859 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!325260)))

(declare-fun bs!20952 () Bool)

(assert (= bs!20952 d!99859))

(declare-fun m!686313 () Bool)

(assert (=> bs!20952 m!686313))

(assert (=> bs!20952 m!686045))

(assert (=> b!733806 d!99859))

(declare-fun b!734195 () Bool)

(declare-fun e!410797 () Bool)

(declare-fun call!34883 () Bool)

(assert (=> b!734195 (= e!410797 call!34883)))

(declare-fun b!734196 () Bool)

(declare-fun e!410798 () Bool)

(declare-fun contains!4044 (List!13789 (_ BitVec 64)) Bool)

(assert (=> b!734196 (= e!410798 (contains!4044 Nil!13786 (select (arr!19748 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734197 () Bool)

(declare-fun e!410800 () Bool)

(assert (=> b!734197 (= e!410800 e!410797)))

(declare-fun c!80824 () Bool)

(assert (=> b!734197 (= c!80824 (validKeyInArray!0 (select (arr!19748 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34880 () Bool)

(assert (=> bm!34880 (= call!34883 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80824 (Cons!13785 (select (arr!19748 a!3186) #b00000000000000000000000000000000) Nil!13786) Nil!13786)))))

(declare-fun d!99865 () Bool)

(declare-fun res!493308 () Bool)

(declare-fun e!410799 () Bool)

(assert (=> d!99865 (=> res!493308 e!410799)))

(assert (=> d!99865 (= res!493308 (bvsge #b00000000000000000000000000000000 (size!20169 a!3186)))))

(assert (=> d!99865 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13786) e!410799)))

(declare-fun b!734198 () Bool)

(assert (=> b!734198 (= e!410797 call!34883)))

(declare-fun b!734199 () Bool)

(assert (=> b!734199 (= e!410799 e!410800)))

(declare-fun res!493307 () Bool)

(assert (=> b!734199 (=> (not res!493307) (not e!410800))))

(assert (=> b!734199 (= res!493307 (not e!410798))))

(declare-fun res!493306 () Bool)

(assert (=> b!734199 (=> (not res!493306) (not e!410798))))

(assert (=> b!734199 (= res!493306 (validKeyInArray!0 (select (arr!19748 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99865 (not res!493308)) b!734199))

(assert (= (and b!734199 res!493306) b!734196))

(assert (= (and b!734199 res!493307) b!734197))

(assert (= (and b!734197 c!80824) b!734195))

(assert (= (and b!734197 (not c!80824)) b!734198))

(assert (= (or b!734195 b!734198) bm!34880))

(assert (=> b!734196 m!686163))

(assert (=> b!734196 m!686163))

(declare-fun m!686315 () Bool)

(assert (=> b!734196 m!686315))

(assert (=> b!734197 m!686163))

(assert (=> b!734197 m!686163))

(assert (=> b!734197 m!686199))

(assert (=> bm!34880 m!686163))

(declare-fun m!686317 () Bool)

(assert (=> bm!34880 m!686317))

(assert (=> b!734199 m!686163))

(assert (=> b!734199 m!686163))

(assert (=> b!734199 m!686199))

(assert (=> b!733795 d!99865))

(check-sat (not d!99799) (not d!99849) (not d!99815) (not b!733948) (not b!734169) (not b!733962) (not b!734038) (not bm!34880) (not b!734143) (not bm!34865) (not b!734045) (not bm!34864) (not d!99803) (not b!734023) (not d!99795) (not d!99855) (not d!99845) (not b!734155) (not b!734172) (not d!99829) (not b!734196) (not b!734197) (not b!734014) (not d!99811) (not b!734199) (not b!734044) (not b!733963) (not d!99859) (not b!733970))
(check-sat)
