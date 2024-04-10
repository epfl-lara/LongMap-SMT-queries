; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67272 () Bool)

(assert start!67272)

(declare-fun b!778079 () Bool)

(declare-fun res!526455 () Bool)

(declare-fun e!432899 () Bool)

(assert (=> b!778079 (=> (not res!526455) (not e!432899))))

(declare-datatypes ((array!42564 0))(
  ( (array!42565 (arr!20376 (Array (_ BitVec 32) (_ BitVec 64))) (size!20797 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42564)

(declare-datatypes ((List!14378 0))(
  ( (Nil!14375) (Cons!14374 (h!15485 (_ BitVec 64)) (t!20693 List!14378)) )
))
(declare-fun arrayNoDuplicates!0 (array!42564 (_ BitVec 32) List!14378) Bool)

(assert (=> b!778079 (= res!526455 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14375))))

(declare-fun b!778080 () Bool)

(declare-fun res!526454 () Bool)

(declare-fun e!432894 () Bool)

(assert (=> b!778080 (=> (not res!526454) (not e!432894))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!778080 (= res!526454 (and (= (size!20797 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20797 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20797 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7976 0))(
  ( (MissingZero!7976 (index!34272 (_ BitVec 32))) (Found!7976 (index!34273 (_ BitVec 32))) (Intermediate!7976 (undefined!8788 Bool) (index!34274 (_ BitVec 32)) (x!65216 (_ BitVec 32))) (Undefined!7976) (MissingVacant!7976 (index!34275 (_ BitVec 32))) )
))
(declare-fun lt!346655 () SeekEntryResult!7976)

(declare-fun b!778081 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!432896 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42564 (_ BitVec 32)) SeekEntryResult!7976)

(assert (=> b!778081 (= e!432896 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346655))))

(declare-fun e!432898 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!346653 () SeekEntryResult!7976)

(declare-fun b!778082 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42564 (_ BitVec 32)) SeekEntryResult!7976)

(assert (=> b!778082 (= e!432898 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346653))))

(declare-fun b!778084 () Bool)

(declare-fun res!526451 () Bool)

(declare-fun e!432895 () Bool)

(assert (=> b!778084 (=> (not res!526451) (not e!432895))))

(assert (=> b!778084 (= res!526451 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20376 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778085 () Bool)

(declare-fun res!526450 () Bool)

(declare-fun e!432893 () Bool)

(assert (=> b!778085 (=> res!526450 e!432893)))

(declare-fun lt!346661 () SeekEntryResult!7976)

(assert (=> b!778085 (= res!526450 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346661)))))

(declare-fun b!778086 () Bool)

(declare-fun res!526457 () Bool)

(assert (=> b!778086 (=> (not res!526457) (not e!432899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42564 (_ BitVec 32)) Bool)

(assert (=> b!778086 (= res!526457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778087 () Bool)

(assert (=> b!778087 (= e!432898 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) (Found!7976 j!159)))))

(declare-fun b!778088 () Bool)

(assert (=> b!778088 (= e!432894 e!432899)))

(declare-fun res!526448 () Bool)

(assert (=> b!778088 (=> (not res!526448) (not e!432899))))

(declare-fun lt!346654 () SeekEntryResult!7976)

(assert (=> b!778088 (= res!526448 (or (= lt!346654 (MissingZero!7976 i!1173)) (= lt!346654 (MissingVacant!7976 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42564 (_ BitVec 32)) SeekEntryResult!7976)

(assert (=> b!778088 (= lt!346654 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!778089 () Bool)

(declare-fun e!432892 () Bool)

(assert (=> b!778089 (= e!432895 e!432892)))

(declare-fun res!526461 () Bool)

(assert (=> b!778089 (=> (not res!526461) (not e!432892))))

(declare-fun lt!346656 () SeekEntryResult!7976)

(declare-fun lt!346659 () SeekEntryResult!7976)

(assert (=> b!778089 (= res!526461 (= lt!346656 lt!346659))))

(declare-fun lt!346660 () array!42564)

(declare-fun lt!346658 () (_ BitVec 64))

(assert (=> b!778089 (= lt!346659 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346658 lt!346660 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778089 (= lt!346656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346658 mask!3328) lt!346658 lt!346660 mask!3328))))

(assert (=> b!778089 (= lt!346658 (select (store (arr!20376 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!778089 (= lt!346660 (array!42565 (store (arr!20376 a!3186) i!1173 k!2102) (size!20797 a!3186)))))

(declare-fun b!778090 () Bool)

(declare-fun e!432897 () Bool)

(assert (=> b!778090 (= e!432897 e!432896)))

(declare-fun res!526456 () Bool)

(assert (=> b!778090 (=> (not res!526456) (not e!432896))))

(assert (=> b!778090 (= res!526456 (= (seekEntryOrOpen!0 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346655))))

(assert (=> b!778090 (= lt!346655 (Found!7976 j!159))))

(declare-fun b!778091 () Bool)

(declare-fun res!526459 () Bool)

(assert (=> b!778091 (=> (not res!526459) (not e!432894))))

(declare-fun arrayContainsKey!0 (array!42564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778091 (= res!526459 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778092 () Bool)

(declare-fun res!526447 () Bool)

(assert (=> b!778092 (=> (not res!526447) (not e!432899))))

(assert (=> b!778092 (= res!526447 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20797 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20797 a!3186))))))

(declare-fun b!778093 () Bool)

(assert (=> b!778093 (= e!432892 (not e!432893))))

(declare-fun res!526460 () Bool)

(assert (=> b!778093 (=> res!526460 e!432893)))

(assert (=> b!778093 (= res!526460 (or (not (is-Intermediate!7976 lt!346659)) (bvslt x!1131 (x!65216 lt!346659)) (not (= x!1131 (x!65216 lt!346659))) (not (= index!1321 (index!34274 lt!346659)))))))

(assert (=> b!778093 (= lt!346661 (Found!7976 j!159))))

(assert (=> b!778093 e!432897))

(declare-fun res!526449 () Bool)

(assert (=> b!778093 (=> (not res!526449) (not e!432897))))

(assert (=> b!778093 (= res!526449 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26846 0))(
  ( (Unit!26847) )
))
(declare-fun lt!346657 () Unit!26846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26846)

(assert (=> b!778093 (= lt!346657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!346652 () SeekEntryResult!7976)

(declare-fun b!778094 () Bool)

(assert (=> b!778094 (= e!432893 (or (not (= lt!346652 (Found!7976 index!1321))) (= lt!346652 lt!346661)))))

(assert (=> b!778094 (= lt!346652 (seekEntryOrOpen!0 lt!346658 lt!346660 mask!3328))))

(declare-fun b!778095 () Bool)

(declare-fun res!526446 () Bool)

(assert (=> b!778095 (=> (not res!526446) (not e!432894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778095 (= res!526446 (validKeyInArray!0 k!2102))))

(declare-fun b!778096 () Bool)

(declare-fun res!526458 () Bool)

(assert (=> b!778096 (=> (not res!526458) (not e!432895))))

(assert (=> b!778096 (= res!526458 e!432898)))

(declare-fun c!86218 () Bool)

(assert (=> b!778096 (= c!86218 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!526462 () Bool)

(assert (=> start!67272 (=> (not res!526462) (not e!432894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67272 (= res!526462 (validMask!0 mask!3328))))

(assert (=> start!67272 e!432894))

(assert (=> start!67272 true))

(declare-fun array_inv!16172 (array!42564) Bool)

(assert (=> start!67272 (array_inv!16172 a!3186)))

(declare-fun b!778083 () Bool)

(assert (=> b!778083 (= e!432899 e!432895)))

(declare-fun res!526453 () Bool)

(assert (=> b!778083 (=> (not res!526453) (not e!432895))))

(assert (=> b!778083 (= res!526453 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20376 a!3186) j!159) mask!3328) (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346653))))

(assert (=> b!778083 (= lt!346653 (Intermediate!7976 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778097 () Bool)

(declare-fun res!526463 () Bool)

(assert (=> b!778097 (=> (not res!526463) (not e!432894))))

(assert (=> b!778097 (= res!526463 (validKeyInArray!0 (select (arr!20376 a!3186) j!159)))))

(declare-fun b!778098 () Bool)

(declare-fun res!526452 () Bool)

(assert (=> b!778098 (=> res!526452 e!432893)))

(assert (=> b!778098 (= res!526452 (or (not (= (select (store (arr!20376 a!3186) i!1173 k!2102) index!1321) lt!346658)) (undefined!8788 lt!346659)))))

(assert (= (and start!67272 res!526462) b!778080))

(assert (= (and b!778080 res!526454) b!778097))

(assert (= (and b!778097 res!526463) b!778095))

(assert (= (and b!778095 res!526446) b!778091))

(assert (= (and b!778091 res!526459) b!778088))

(assert (= (and b!778088 res!526448) b!778086))

(assert (= (and b!778086 res!526457) b!778079))

(assert (= (and b!778079 res!526455) b!778092))

(assert (= (and b!778092 res!526447) b!778083))

(assert (= (and b!778083 res!526453) b!778084))

(assert (= (and b!778084 res!526451) b!778096))

(assert (= (and b!778096 c!86218) b!778082))

(assert (= (and b!778096 (not c!86218)) b!778087))

(assert (= (and b!778096 res!526458) b!778089))

(assert (= (and b!778089 res!526461) b!778093))

(assert (= (and b!778093 res!526449) b!778090))

(assert (= (and b!778090 res!526456) b!778081))

(assert (= (and b!778093 (not res!526460)) b!778085))

(assert (= (and b!778085 (not res!526450)) b!778098))

(assert (= (and b!778098 (not res!526452)) b!778094))

(declare-fun m!721841 () Bool)

(assert (=> b!778089 m!721841))

(declare-fun m!721843 () Bool)

(assert (=> b!778089 m!721843))

(declare-fun m!721845 () Bool)

(assert (=> b!778089 m!721845))

(declare-fun m!721847 () Bool)

(assert (=> b!778089 m!721847))

(declare-fun m!721849 () Bool)

(assert (=> b!778089 m!721849))

(assert (=> b!778089 m!721843))

(declare-fun m!721851 () Bool)

(assert (=> b!778085 m!721851))

(assert (=> b!778085 m!721851))

(declare-fun m!721853 () Bool)

(assert (=> b!778085 m!721853))

(assert (=> b!778081 m!721851))

(assert (=> b!778081 m!721851))

(declare-fun m!721855 () Bool)

(assert (=> b!778081 m!721855))

(declare-fun m!721857 () Bool)

(assert (=> b!778093 m!721857))

(declare-fun m!721859 () Bool)

(assert (=> b!778093 m!721859))

(declare-fun m!721861 () Bool)

(assert (=> b!778084 m!721861))

(declare-fun m!721863 () Bool)

(assert (=> b!778088 m!721863))

(declare-fun m!721865 () Bool)

(assert (=> b!778094 m!721865))

(assert (=> b!778097 m!721851))

(assert (=> b!778097 m!721851))

(declare-fun m!721867 () Bool)

(assert (=> b!778097 m!721867))

(declare-fun m!721869 () Bool)

(assert (=> b!778091 m!721869))

(declare-fun m!721871 () Bool)

(assert (=> start!67272 m!721871))

(declare-fun m!721873 () Bool)

(assert (=> start!67272 m!721873))

(assert (=> b!778083 m!721851))

(assert (=> b!778083 m!721851))

(declare-fun m!721875 () Bool)

(assert (=> b!778083 m!721875))

(assert (=> b!778083 m!721875))

(assert (=> b!778083 m!721851))

(declare-fun m!721877 () Bool)

(assert (=> b!778083 m!721877))

(assert (=> b!778082 m!721851))

(assert (=> b!778082 m!721851))

(declare-fun m!721879 () Bool)

(assert (=> b!778082 m!721879))

(assert (=> b!778098 m!721841))

(declare-fun m!721881 () Bool)

(assert (=> b!778098 m!721881))

(declare-fun m!721883 () Bool)

(assert (=> b!778086 m!721883))

(assert (=> b!778090 m!721851))

(assert (=> b!778090 m!721851))

(declare-fun m!721885 () Bool)

(assert (=> b!778090 m!721885))

(declare-fun m!721887 () Bool)

(assert (=> b!778095 m!721887))

(assert (=> b!778087 m!721851))

(assert (=> b!778087 m!721851))

(assert (=> b!778087 m!721853))

(declare-fun m!721889 () Bool)

(assert (=> b!778079 m!721889))

(push 1)

(assert (not start!67272))

(assert (not b!778082))

(assert (not b!778087))

(assert (not b!778094))

(assert (not b!778089))

(assert (not b!778079))

(assert (not b!778097))

(assert (not b!778093))

(assert (not b!778088))

(assert (not b!778086))

(assert (not b!778090))

(assert (not b!778095))

(assert (not b!778091))

(assert (not b!778083))

(assert (not b!778085))

(assert (not b!778081))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!778272 () Bool)

(declare-fun e!432984 () Bool)

(declare-fun e!432986 () Bool)

(assert (=> b!778272 (= e!432984 e!432986)))

(declare-fun lt!346741 () (_ BitVec 64))

(assert (=> b!778272 (= lt!346741 (select (arr!20376 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!346742 () Unit!26846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42564 (_ BitVec 64) (_ BitVec 32)) Unit!26846)

(assert (=> b!778272 (= lt!346742 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346741 #b00000000000000000000000000000000))))

(assert (=> b!778272 (arrayContainsKey!0 a!3186 lt!346741 #b00000000000000000000000000000000)))

(declare-fun lt!346740 () Unit!26846)

(assert (=> b!778272 (= lt!346740 lt!346742)))

(declare-fun res!526586 () Bool)

(assert (=> b!778272 (= res!526586 (= (seekEntryOrOpen!0 (select (arr!20376 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7976 #b00000000000000000000000000000000)))))

(assert (=> b!778272 (=> (not res!526586) (not e!432986))))

(declare-fun d!102273 () Bool)

(declare-fun res!526585 () Bool)

(declare-fun e!432985 () Bool)

(assert (=> d!102273 (=> res!526585 e!432985)))

(assert (=> d!102273 (= res!526585 (bvsge #b00000000000000000000000000000000 (size!20797 a!3186)))))

(assert (=> d!102273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!432985)))

(declare-fun b!778273 () Bool)

(declare-fun call!35196 () Bool)

(assert (=> b!778273 (= e!432986 call!35196)))

(declare-fun b!778274 () Bool)

(assert (=> b!778274 (= e!432985 e!432984)))

(declare-fun c!86245 () Bool)

(assert (=> b!778274 (= c!86245 (validKeyInArray!0 (select (arr!20376 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!778275 () Bool)

(assert (=> b!778275 (= e!432984 call!35196)))

(declare-fun bm!35193 () Bool)

(assert (=> bm!35193 (= call!35196 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102273 (not res!526585)) b!778274))

(assert (= (and b!778274 c!86245) b!778272))

(assert (= (and b!778274 (not c!86245)) b!778275))

(assert (= (and b!778272 res!526586) b!778273))

(assert (= (or b!778273 b!778275) bm!35193))

(declare-fun m!722003 () Bool)

(assert (=> b!778272 m!722003))

(declare-fun m!722005 () Bool)

(assert (=> b!778272 m!722005))

(declare-fun m!722007 () Bool)

(assert (=> b!778272 m!722007))

(assert (=> b!778272 m!722003))

(declare-fun m!722011 () Bool)

(assert (=> b!778272 m!722011))

(assert (=> b!778274 m!722003))

(assert (=> b!778274 m!722003))

(declare-fun m!722013 () Bool)

(assert (=> b!778274 m!722013))

(declare-fun m!722015 () Bool)

(assert (=> bm!35193 m!722015))

(assert (=> b!778086 d!102273))

(declare-fun d!102277 () Bool)

(assert (=> d!102277 (= (validKeyInArray!0 (select (arr!20376 a!3186) j!159)) (and (not (= (select (arr!20376 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20376 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!778097 d!102277))

(declare-fun b!778297 () Bool)

(declare-fun e!433000 () SeekEntryResult!7976)

(assert (=> b!778297 (= e!433000 (MissingVacant!7976 resIntermediateIndex!5))))

(declare-fun b!778298 () Bool)

(declare-fun e!432998 () SeekEntryResult!7976)

(assert (=> b!778298 (= e!432998 Undefined!7976)))

(declare-fun b!778299 () Bool)

(declare-fun c!86256 () Bool)

(declare-fun lt!346756 () (_ BitVec 64))

(assert (=> b!778299 (= c!86256 (= lt!346756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432999 () SeekEntryResult!7976)

(assert (=> b!778299 (= e!432999 e!433000)))

(declare-fun b!778300 () Bool)

(assert (=> b!778300 (= e!432998 e!432999)))

(declare-fun c!86255 () Bool)

(assert (=> b!778300 (= c!86255 (= lt!346756 (select (arr!20376 a!3186) j!159)))))

(declare-fun b!778301 () Bool)

(assert (=> b!778301 (= e!432999 (Found!7976 index!1321))))

(declare-fun d!102279 () Bool)

(declare-fun lt!346755 () SeekEntryResult!7976)

(assert (=> d!102279 (and (or (is-Undefined!7976 lt!346755) (not (is-Found!7976 lt!346755)) (and (bvsge (index!34273 lt!346755) #b00000000000000000000000000000000) (bvslt (index!34273 lt!346755) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346755) (is-Found!7976 lt!346755) (not (is-MissingVacant!7976 lt!346755)) (not (= (index!34275 lt!346755) resIntermediateIndex!5)) (and (bvsge (index!34275 lt!346755) #b00000000000000000000000000000000) (bvslt (index!34275 lt!346755) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346755) (ite (is-Found!7976 lt!346755) (= (select (arr!20376 a!3186) (index!34273 lt!346755)) (select (arr!20376 a!3186) j!159)) (and (is-MissingVacant!7976 lt!346755) (= (index!34275 lt!346755) resIntermediateIndex!5) (= (select (arr!20376 a!3186) (index!34275 lt!346755)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102279 (= lt!346755 e!432998)))

(declare-fun c!86257 () Bool)

(assert (=> d!102279 (= c!86257 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102279 (= lt!346756 (select (arr!20376 a!3186) index!1321))))

(assert (=> d!102279 (validMask!0 mask!3328)))

(assert (=> d!102279 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346755)))

(declare-fun b!778302 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778302 (= e!433000 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20376 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102279 c!86257) b!778298))

(assert (= (and d!102279 (not c!86257)) b!778300))

(assert (= (and b!778300 c!86255) b!778301))

(assert (= (and b!778300 (not c!86255)) b!778299))

(assert (= (and b!778299 c!86256) b!778297))

(assert (= (and b!778299 (not c!86256)) b!778302))

(declare-fun m!722025 () Bool)

(assert (=> d!102279 m!722025))

(declare-fun m!722027 () Bool)

(assert (=> d!102279 m!722027))

(declare-fun m!722029 () Bool)

(assert (=> d!102279 m!722029))

(assert (=> d!102279 m!721871))

(declare-fun m!722031 () Bool)

(assert (=> b!778302 m!722031))

(assert (=> b!778302 m!722031))

(assert (=> b!778302 m!721851))

(declare-fun m!722033 () Bool)

(assert (=> b!778302 m!722033))

(assert (=> b!778085 d!102279))

(declare-fun d!102287 () Bool)

(assert (=> d!102287 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!778095 d!102287))

(declare-fun b!778366 () Bool)

(declare-fun lt!346777 () SeekEntryResult!7976)

(assert (=> b!778366 (and (bvsge (index!34274 lt!346777) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346777) (size!20797 lt!346660)))))

(declare-fun res!526606 () Bool)

(assert (=> b!778366 (= res!526606 (= (select (arr!20376 lt!346660) (index!34274 lt!346777)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433038 () Bool)

(assert (=> b!778366 (=> res!526606 e!433038)))

(declare-fun b!778367 () Bool)

(declare-fun e!433035 () SeekEntryResult!7976)

(assert (=> b!778367 (= e!433035 (Intermediate!7976 false index!1321 x!1131))))

(declare-fun d!102289 () Bool)

(declare-fun e!433039 () Bool)

(assert (=> d!102289 e!433039))

(declare-fun c!86282 () Bool)

(assert (=> d!102289 (= c!86282 (and (is-Intermediate!7976 lt!346777) (undefined!8788 lt!346777)))))

(declare-fun e!433036 () SeekEntryResult!7976)

(assert (=> d!102289 (= lt!346777 e!433036)))

(declare-fun c!86284 () Bool)

(assert (=> d!102289 (= c!86284 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346776 () (_ BitVec 64))

(assert (=> d!102289 (= lt!346776 (select (arr!20376 lt!346660) index!1321))))

(assert (=> d!102289 (validMask!0 mask!3328)))

(assert (=> d!102289 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346658 lt!346660 mask!3328) lt!346777)))

(declare-fun b!778368 () Bool)

(assert (=> b!778368 (and (bvsge (index!34274 lt!346777) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346777) (size!20797 lt!346660)))))

(assert (=> b!778368 (= e!433038 (= (select (arr!20376 lt!346660) (index!34274 lt!346777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!778369 () Bool)

(assert (=> b!778369 (= e!433035 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!346658 lt!346660 mask!3328))))

(declare-fun b!778370 () Bool)

(declare-fun e!433037 () Bool)

(assert (=> b!778370 (= e!433039 e!433037)))

(declare-fun res!526608 () Bool)

(assert (=> b!778370 (= res!526608 (and (is-Intermediate!7976 lt!346777) (not (undefined!8788 lt!346777)) (bvslt (x!65216 lt!346777) #b01111111111111111111111111111110) (bvsge (x!65216 lt!346777) #b00000000000000000000000000000000) (bvsge (x!65216 lt!346777) x!1131)))))

(assert (=> b!778370 (=> (not res!526608) (not e!433037))))

(declare-fun b!778371 () Bool)

(assert (=> b!778371 (= e!433036 e!433035)))

(declare-fun c!86283 () Bool)

(assert (=> b!778371 (= c!86283 (or (= lt!346776 lt!346658) (= (bvadd lt!346776 lt!346776) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778372 () Bool)

(assert (=> b!778372 (= e!433039 (bvsge (x!65216 lt!346777) #b01111111111111111111111111111110))))

(declare-fun b!778373 () Bool)

(assert (=> b!778373 (and (bvsge (index!34274 lt!346777) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346777) (size!20797 lt!346660)))))

(declare-fun res!526607 () Bool)

(assert (=> b!778373 (= res!526607 (= (select (arr!20376 lt!346660) (index!34274 lt!346777)) lt!346658))))

(assert (=> b!778373 (=> res!526607 e!433038)))

(assert (=> b!778373 (= e!433037 e!433038)))

(declare-fun b!778374 () Bool)

(assert (=> b!778374 (= e!433036 (Intermediate!7976 true index!1321 x!1131))))

(assert (= (and d!102289 c!86284) b!778374))

(assert (= (and d!102289 (not c!86284)) b!778371))

(assert (= (and b!778371 c!86283) b!778367))

(assert (= (and b!778371 (not c!86283)) b!778369))

(assert (= (and d!102289 c!86282) b!778372))

(assert (= (and d!102289 (not c!86282)) b!778370))

(assert (= (and b!778370 res!526608) b!778373))

(assert (= (and b!778373 (not res!526607)) b!778366))

(assert (= (and b!778366 (not res!526606)) b!778368))

(declare-fun m!722057 () Bool)

(assert (=> d!102289 m!722057))

(assert (=> d!102289 m!721871))

(declare-fun m!722059 () Bool)

(assert (=> b!778366 m!722059))

(assert (=> b!778368 m!722059))

(assert (=> b!778373 m!722059))

(assert (=> b!778369 m!722031))

(assert (=> b!778369 m!722031))

(declare-fun m!722063 () Bool)

(assert (=> b!778369 m!722063))

(assert (=> b!778089 d!102289))

(declare-fun b!778381 () Bool)

(declare-fun lt!346782 () SeekEntryResult!7976)

(assert (=> b!778381 (and (bvsge (index!34274 lt!346782) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346782) (size!20797 lt!346660)))))

(declare-fun res!526609 () Bool)

(assert (=> b!778381 (= res!526609 (= (select (arr!20376 lt!346660) (index!34274 lt!346782)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433046 () Bool)

(assert (=> b!778381 (=> res!526609 e!433046)))

(declare-fun b!778382 () Bool)

(declare-fun e!433043 () SeekEntryResult!7976)

(assert (=> b!778382 (= e!433043 (Intermediate!7976 false (toIndex!0 lt!346658 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102299 () Bool)

(declare-fun e!433047 () Bool)

(assert (=> d!102299 e!433047))

(declare-fun c!86288 () Bool)

(assert (=> d!102299 (= c!86288 (and (is-Intermediate!7976 lt!346782) (undefined!8788 lt!346782)))))

(declare-fun e!433044 () SeekEntryResult!7976)

(assert (=> d!102299 (= lt!346782 e!433044)))

(declare-fun c!86290 () Bool)

(assert (=> d!102299 (= c!86290 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346781 () (_ BitVec 64))

(assert (=> d!102299 (= lt!346781 (select (arr!20376 lt!346660) (toIndex!0 lt!346658 mask!3328)))))

(assert (=> d!102299 (validMask!0 mask!3328)))

(assert (=> d!102299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346658 mask!3328) lt!346658 lt!346660 mask!3328) lt!346782)))

(declare-fun b!778383 () Bool)

(assert (=> b!778383 (and (bvsge (index!34274 lt!346782) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346782) (size!20797 lt!346660)))))

(assert (=> b!778383 (= e!433046 (= (select (arr!20376 lt!346660) (index!34274 lt!346782)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!778384 () Bool)

(assert (=> b!778384 (= e!433043 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346658 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!346658 lt!346660 mask!3328))))

(declare-fun b!778385 () Bool)

(declare-fun e!433045 () Bool)

(assert (=> b!778385 (= e!433047 e!433045)))

(declare-fun res!526611 () Bool)

(assert (=> b!778385 (= res!526611 (and (is-Intermediate!7976 lt!346782) (not (undefined!8788 lt!346782)) (bvslt (x!65216 lt!346782) #b01111111111111111111111111111110) (bvsge (x!65216 lt!346782) #b00000000000000000000000000000000) (bvsge (x!65216 lt!346782) #b00000000000000000000000000000000)))))

(assert (=> b!778385 (=> (not res!526611) (not e!433045))))

(declare-fun b!778386 () Bool)

(assert (=> b!778386 (= e!433044 e!433043)))

(declare-fun c!86289 () Bool)

(assert (=> b!778386 (= c!86289 (or (= lt!346781 lt!346658) (= (bvadd lt!346781 lt!346781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778387 () Bool)

(assert (=> b!778387 (= e!433047 (bvsge (x!65216 lt!346782) #b01111111111111111111111111111110))))

(declare-fun b!778388 () Bool)

(assert (=> b!778388 (and (bvsge (index!34274 lt!346782) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346782) (size!20797 lt!346660)))))

(declare-fun res!526610 () Bool)

(assert (=> b!778388 (= res!526610 (= (select (arr!20376 lt!346660) (index!34274 lt!346782)) lt!346658))))

(assert (=> b!778388 (=> res!526610 e!433046)))

(assert (=> b!778388 (= e!433045 e!433046)))

(declare-fun b!778389 () Bool)

(assert (=> b!778389 (= e!433044 (Intermediate!7976 true (toIndex!0 lt!346658 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102299 c!86290) b!778389))

(assert (= (and d!102299 (not c!86290)) b!778386))

(assert (= (and b!778386 c!86289) b!778382))

(assert (= (and b!778386 (not c!86289)) b!778384))

(assert (= (and d!102299 c!86288) b!778387))

(assert (= (and d!102299 (not c!86288)) b!778385))

(assert (= (and b!778385 res!526611) b!778388))

(assert (= (and b!778388 (not res!526610)) b!778381))

(assert (= (and b!778381 (not res!526609)) b!778383))

(assert (=> d!102299 m!721843))

(declare-fun m!722073 () Bool)

(assert (=> d!102299 m!722073))

(assert (=> d!102299 m!721871))

(declare-fun m!722075 () Bool)

(assert (=> b!778381 m!722075))

(assert (=> b!778383 m!722075))

(assert (=> b!778388 m!722075))

(assert (=> b!778384 m!721843))

(declare-fun m!722079 () Bool)

(assert (=> b!778384 m!722079))

(assert (=> b!778384 m!722079))

(declare-fun m!722085 () Bool)

(assert (=> b!778384 m!722085))

(assert (=> b!778089 d!102299))

(declare-fun d!102303 () Bool)

(declare-fun lt!346793 () (_ BitVec 32))

(declare-fun lt!346792 () (_ BitVec 32))

(assert (=> d!102303 (= lt!346793 (bvmul (bvxor lt!346792 (bvlshr lt!346792 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102303 (= lt!346792 ((_ extract 31 0) (bvand (bvxor lt!346658 (bvlshr lt!346658 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102303 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526612 (let ((h!15489 ((_ extract 31 0) (bvand (bvxor lt!346658 (bvlshr lt!346658 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65225 (bvmul (bvxor h!15489 (bvlshr h!15489 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65225 (bvlshr x!65225 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526612 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526612 #b00000000000000000000000000000000))))))

(assert (=> d!102303 (= (toIndex!0 lt!346658 mask!3328) (bvand (bvxor lt!346793 (bvlshr lt!346793 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!778089 d!102303))

(declare-fun d!102313 () Bool)

(declare-fun lt!346843 () SeekEntryResult!7976)

(assert (=> d!102313 (and (or (is-Undefined!7976 lt!346843) (not (is-Found!7976 lt!346843)) (and (bvsge (index!34273 lt!346843) #b00000000000000000000000000000000) (bvslt (index!34273 lt!346843) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346843) (is-Found!7976 lt!346843) (not (is-MissingZero!7976 lt!346843)) (and (bvsge (index!34272 lt!346843) #b00000000000000000000000000000000) (bvslt (index!34272 lt!346843) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346843) (is-Found!7976 lt!346843) (is-MissingZero!7976 lt!346843) (not (is-MissingVacant!7976 lt!346843)) (and (bvsge (index!34275 lt!346843) #b00000000000000000000000000000000) (bvslt (index!34275 lt!346843) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346843) (ite (is-Found!7976 lt!346843) (= (select (arr!20376 a!3186) (index!34273 lt!346843)) k!2102) (ite (is-MissingZero!7976 lt!346843) (= (select (arr!20376 a!3186) (index!34272 lt!346843)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7976 lt!346843) (= (select (arr!20376 a!3186) (index!34275 lt!346843)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!433117 () SeekEntryResult!7976)

(assert (=> d!102313 (= lt!346843 e!433117)))

(declare-fun c!86331 () Bool)

(declare-fun lt!346845 () SeekEntryResult!7976)

(assert (=> d!102313 (= c!86331 (and (is-Intermediate!7976 lt!346845) (undefined!8788 lt!346845)))))

(assert (=> d!102313 (= lt!346845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102313 (validMask!0 mask!3328)))

(assert (=> d!102313 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!346843)))

(declare-fun b!778502 () Bool)

(declare-fun e!433116 () SeekEntryResult!7976)

(assert (=> b!778502 (= e!433116 (Found!7976 (index!34274 lt!346845)))))

(declare-fun b!778503 () Bool)

(assert (=> b!778503 (= e!433117 e!433116)))

(declare-fun lt!346844 () (_ BitVec 64))

(assert (=> b!778503 (= lt!346844 (select (arr!20376 a!3186) (index!34274 lt!346845)))))

(declare-fun c!86332 () Bool)

(assert (=> b!778503 (= c!86332 (= lt!346844 k!2102))))

(declare-fun b!778504 () Bool)

(assert (=> b!778504 (= e!433117 Undefined!7976)))

(declare-fun b!778505 () Bool)

(declare-fun e!433120 () SeekEntryResult!7976)

(assert (=> b!778505 (= e!433120 (MissingZero!7976 (index!34274 lt!346845)))))

(declare-fun b!778506 () Bool)

(declare-fun c!86333 () Bool)

(assert (=> b!778506 (= c!86333 (= lt!346844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778506 (= e!433116 e!433120)))

(declare-fun b!778507 () Bool)

(assert (=> b!778507 (= e!433120 (seekKeyOrZeroReturnVacant!0 (x!65216 lt!346845) (index!34274 lt!346845) (index!34274 lt!346845) k!2102 a!3186 mask!3328))))

(assert (= (and d!102313 c!86331) b!778504))

(assert (= (and d!102313 (not c!86331)) b!778503))

(assert (= (and b!778503 c!86332) b!778502))

(assert (= (and b!778503 (not c!86332)) b!778506))

(assert (= (and b!778506 c!86333) b!778505))

(assert (= (and b!778506 (not c!86333)) b!778507))

(declare-fun m!722175 () Bool)

(assert (=> d!102313 m!722175))

(declare-fun m!722177 () Bool)

(assert (=> d!102313 m!722177))

(declare-fun m!722179 () Bool)

(assert (=> d!102313 m!722179))

(declare-fun m!722181 () Bool)

(assert (=> d!102313 m!722181))

(assert (=> d!102313 m!721871))

(declare-fun m!722183 () Bool)

(assert (=> d!102313 m!722183))

(assert (=> d!102313 m!722179))

(declare-fun m!722185 () Bool)

(assert (=> b!778503 m!722185))

(declare-fun m!722187 () Bool)

(assert (=> b!778507 m!722187))

(assert (=> b!778088 d!102313))

(assert (=> b!778087 d!102279))

(declare-fun b!778518 () Bool)

(declare-fun e!433129 () SeekEntryResult!7976)

(assert (=> b!778518 (= e!433129 (MissingVacant!7976 resIntermediateIndex!5))))

(declare-fun b!778519 () Bool)

(declare-fun e!433127 () SeekEntryResult!7976)

(assert (=> b!778519 (= e!433127 Undefined!7976)))

(declare-fun b!778520 () Bool)

(declare-fun c!86337 () Bool)

(declare-fun lt!346847 () (_ BitVec 64))

(assert (=> b!778520 (= c!86337 (= lt!346847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433128 () SeekEntryResult!7976)

(assert (=> b!778520 (= e!433128 e!433129)))

(declare-fun b!778521 () Bool)

(assert (=> b!778521 (= e!433127 e!433128)))

(declare-fun c!86336 () Bool)

(assert (=> b!778521 (= c!86336 (= lt!346847 (select (arr!20376 a!3186) j!159)))))

(declare-fun b!778522 () Bool)

(assert (=> b!778522 (= e!433128 (Found!7976 resIntermediateIndex!5))))

(declare-fun lt!346846 () SeekEntryResult!7976)

(declare-fun d!102335 () Bool)

(assert (=> d!102335 (and (or (is-Undefined!7976 lt!346846) (not (is-Found!7976 lt!346846)) (and (bvsge (index!34273 lt!346846) #b00000000000000000000000000000000) (bvslt (index!34273 lt!346846) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346846) (is-Found!7976 lt!346846) (not (is-MissingVacant!7976 lt!346846)) (not (= (index!34275 lt!346846) resIntermediateIndex!5)) (and (bvsge (index!34275 lt!346846) #b00000000000000000000000000000000) (bvslt (index!34275 lt!346846) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346846) (ite (is-Found!7976 lt!346846) (= (select (arr!20376 a!3186) (index!34273 lt!346846)) (select (arr!20376 a!3186) j!159)) (and (is-MissingVacant!7976 lt!346846) (= (index!34275 lt!346846) resIntermediateIndex!5) (= (select (arr!20376 a!3186) (index!34275 lt!346846)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102335 (= lt!346846 e!433127)))

(declare-fun c!86338 () Bool)

(assert (=> d!102335 (= c!86338 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102335 (= lt!346847 (select (arr!20376 a!3186) resIntermediateIndex!5))))

(assert (=> d!102335 (validMask!0 mask!3328)))

(assert (=> d!102335 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346846)))

(declare-fun b!778523 () Bool)

(assert (=> b!778523 (= e!433129 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20376 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102335 c!86338) b!778519))

(assert (= (and d!102335 (not c!86338)) b!778521))

(assert (= (and b!778521 c!86336) b!778522))

(assert (= (and b!778521 (not c!86336)) b!778520))

(assert (= (and b!778520 c!86337) b!778518))

(assert (= (and b!778520 (not c!86337)) b!778523))

(declare-fun m!722189 () Bool)

(assert (=> d!102335 m!722189))

(declare-fun m!722191 () Bool)

(assert (=> d!102335 m!722191))

(assert (=> d!102335 m!721861))

(assert (=> d!102335 m!721871))

(declare-fun m!722193 () Bool)

(assert (=> b!778523 m!722193))

(assert (=> b!778523 m!722193))

(assert (=> b!778523 m!721851))

(declare-fun m!722195 () Bool)

(assert (=> b!778523 m!722195))

(assert (=> b!778081 d!102335))

(declare-fun d!102337 () Bool)

(declare-fun res!526659 () Bool)

(declare-fun e!433138 () Bool)

(assert (=> d!102337 (=> res!526659 e!433138)))

(assert (=> d!102337 (= res!526659 (= (select (arr!20376 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102337 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!433138)))

(declare-fun b!778533 () Bool)

(declare-fun e!433139 () Bool)

(assert (=> b!778533 (= e!433138 e!433139)))

(declare-fun res!526660 () Bool)

(assert (=> b!778533 (=> (not res!526660) (not e!433139))))

(assert (=> b!778533 (= res!526660 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20797 a!3186)))))

(declare-fun b!778534 () Bool)

(assert (=> b!778534 (= e!433139 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102337 (not res!526659)) b!778533))

(assert (= (and b!778533 res!526660) b!778534))

(assert (=> d!102337 m!722003))

(declare-fun m!722201 () Bool)

(assert (=> b!778534 m!722201))

(assert (=> b!778091 d!102337))

(declare-fun d!102341 () Bool)

(declare-fun lt!346854 () SeekEntryResult!7976)

(assert (=> d!102341 (and (or (is-Undefined!7976 lt!346854) (not (is-Found!7976 lt!346854)) (and (bvsge (index!34273 lt!346854) #b00000000000000000000000000000000) (bvslt (index!34273 lt!346854) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346854) (is-Found!7976 lt!346854) (not (is-MissingZero!7976 lt!346854)) (and (bvsge (index!34272 lt!346854) #b00000000000000000000000000000000) (bvslt (index!34272 lt!346854) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346854) (is-Found!7976 lt!346854) (is-MissingZero!7976 lt!346854) (not (is-MissingVacant!7976 lt!346854)) (and (bvsge (index!34275 lt!346854) #b00000000000000000000000000000000) (bvslt (index!34275 lt!346854) (size!20797 a!3186)))) (or (is-Undefined!7976 lt!346854) (ite (is-Found!7976 lt!346854) (= (select (arr!20376 a!3186) (index!34273 lt!346854)) (select (arr!20376 a!3186) j!159)) (ite (is-MissingZero!7976 lt!346854) (= (select (arr!20376 a!3186) (index!34272 lt!346854)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7976 lt!346854) (= (select (arr!20376 a!3186) (index!34275 lt!346854)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!433141 () SeekEntryResult!7976)

(assert (=> d!102341 (= lt!346854 e!433141)))

(declare-fun c!86340 () Bool)

(declare-fun lt!346856 () SeekEntryResult!7976)

(assert (=> d!102341 (= c!86340 (and (is-Intermediate!7976 lt!346856) (undefined!8788 lt!346856)))))

(assert (=> d!102341 (= lt!346856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20376 a!3186) j!159) mask!3328) (select (arr!20376 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102341 (validMask!0 mask!3328)))

(assert (=> d!102341 (= (seekEntryOrOpen!0 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346854)))

(declare-fun b!778535 () Bool)

(declare-fun e!433140 () SeekEntryResult!7976)

(assert (=> b!778535 (= e!433140 (Found!7976 (index!34274 lt!346856)))))

(declare-fun b!778536 () Bool)

(assert (=> b!778536 (= e!433141 e!433140)))

(declare-fun lt!346855 () (_ BitVec 64))

(assert (=> b!778536 (= lt!346855 (select (arr!20376 a!3186) (index!34274 lt!346856)))))

(declare-fun c!86341 () Bool)

(assert (=> b!778536 (= c!86341 (= lt!346855 (select (arr!20376 a!3186) j!159)))))

(declare-fun b!778537 () Bool)

(assert (=> b!778537 (= e!433141 Undefined!7976)))

(declare-fun b!778538 () Bool)

(declare-fun e!433142 () SeekEntryResult!7976)

(assert (=> b!778538 (= e!433142 (MissingZero!7976 (index!34274 lt!346856)))))

(declare-fun b!778539 () Bool)

(declare-fun c!86342 () Bool)

(assert (=> b!778539 (= c!86342 (= lt!346855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778539 (= e!433140 e!433142)))

(declare-fun b!778540 () Bool)

(assert (=> b!778540 (= e!433142 (seekKeyOrZeroReturnVacant!0 (x!65216 lt!346856) (index!34274 lt!346856) (index!34274 lt!346856) (select (arr!20376 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102341 c!86340) b!778537))

(assert (= (and d!102341 (not c!86340)) b!778536))

(assert (= (and b!778536 c!86341) b!778535))

(assert (= (and b!778536 (not c!86341)) b!778539))

(assert (= (and b!778539 c!86342) b!778538))

(assert (= (and b!778539 (not c!86342)) b!778540))

(declare-fun m!722203 () Bool)

(assert (=> d!102341 m!722203))

(declare-fun m!722205 () Bool)

(assert (=> d!102341 m!722205))

(assert (=> d!102341 m!721875))

(assert (=> d!102341 m!721851))

(assert (=> d!102341 m!721877))

(assert (=> d!102341 m!721871))

(declare-fun m!722207 () Bool)

(assert (=> d!102341 m!722207))

(assert (=> d!102341 m!721851))

(assert (=> d!102341 m!721875))

(declare-fun m!722209 () Bool)

(assert (=> b!778536 m!722209))

(assert (=> b!778540 m!721851))

(declare-fun m!722211 () Bool)

(assert (=> b!778540 m!722211))

(assert (=> b!778090 d!102341))

(declare-fun b!778551 () Bool)

(declare-fun e!433154 () Bool)

(declare-fun e!433151 () Bool)

(assert (=> b!778551 (= e!433154 e!433151)))

(declare-fun res!526668 () Bool)

(assert (=> b!778551 (=> (not res!526668) (not e!433151))))

(declare-fun e!433152 () Bool)

(assert (=> b!778551 (= res!526668 (not e!433152))))

(declare-fun res!526667 () Bool)

(assert (=> b!778551 (=> (not res!526667) (not e!433152))))

(assert (=> b!778551 (= res!526667 (validKeyInArray!0 (select (arr!20376 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!778552 () Bool)

(declare-fun contains!4099 (List!14378 (_ BitVec 64)) Bool)

(assert (=> b!778552 (= e!433152 (contains!4099 Nil!14375 (select (arr!20376 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35206 () Bool)

(declare-fun call!35209 () Bool)

(declare-fun c!86345 () Bool)

(assert (=> bm!35206 (= call!35209 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86345 (Cons!14374 (select (arr!20376 a!3186) #b00000000000000000000000000000000) Nil!14375) Nil!14375)))))

(declare-fun b!778553 () Bool)

(declare-fun e!433153 () Bool)

(assert (=> b!778553 (= e!433153 call!35209)))

(declare-fun d!102343 () Bool)

(declare-fun res!526669 () Bool)

(assert (=> d!102343 (=> res!526669 e!433154)))

(assert (=> d!102343 (= res!526669 (bvsge #b00000000000000000000000000000000 (size!20797 a!3186)))))

(assert (=> d!102343 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14375) e!433154)))

(declare-fun b!778554 () Bool)

(assert (=> b!778554 (= e!433153 call!35209)))

(declare-fun b!778555 () Bool)

(assert (=> b!778555 (= e!433151 e!433153)))

(assert (=> b!778555 (= c!86345 (validKeyInArray!0 (select (arr!20376 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102343 (not res!526669)) b!778551))

(assert (= (and b!778551 res!526667) b!778552))

(assert (= (and b!778551 res!526668) b!778555))

(assert (= (and b!778555 c!86345) b!778553))

(assert (= (and b!778555 (not c!86345)) b!778554))

(assert (= (or b!778553 b!778554) bm!35206))

(assert (=> b!778551 m!722003))

(assert (=> b!778551 m!722003))

(assert (=> b!778551 m!722013))

(assert (=> b!778552 m!722003))

(assert (=> b!778552 m!722003))

(declare-fun m!722213 () Bool)

(assert (=> b!778552 m!722213))

(assert (=> bm!35206 m!722003))

(declare-fun m!722215 () Bool)

(assert (=> bm!35206 m!722215))

(assert (=> b!778555 m!722003))

(assert (=> b!778555 m!722003))

(assert (=> b!778555 m!722013))

(assert (=> b!778079 d!102343))

(declare-fun d!102345 () Bool)

(declare-fun lt!346857 () SeekEntryResult!7976)

(assert (=> d!102345 (and (or (is-Undefined!7976 lt!346857) (not (is-Found!7976 lt!346857)) (and (bvsge (index!34273 lt!346857) #b00000000000000000000000000000000) (bvslt (index!34273 lt!346857) (size!20797 lt!346660)))) (or (is-Undefined!7976 lt!346857) (is-Found!7976 lt!346857) (not (is-MissingZero!7976 lt!346857)) (and (bvsge (index!34272 lt!346857) #b00000000000000000000000000000000) (bvslt (index!34272 lt!346857) (size!20797 lt!346660)))) (or (is-Undefined!7976 lt!346857) (is-Found!7976 lt!346857) (is-MissingZero!7976 lt!346857) (not (is-MissingVacant!7976 lt!346857)) (and (bvsge (index!34275 lt!346857) #b00000000000000000000000000000000) (bvslt (index!34275 lt!346857) (size!20797 lt!346660)))) (or (is-Undefined!7976 lt!346857) (ite (is-Found!7976 lt!346857) (= (select (arr!20376 lt!346660) (index!34273 lt!346857)) lt!346658) (ite (is-MissingZero!7976 lt!346857) (= (select (arr!20376 lt!346660) (index!34272 lt!346857)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7976 lt!346857) (= (select (arr!20376 lt!346660) (index!34275 lt!346857)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!433156 () SeekEntryResult!7976)

(assert (=> d!102345 (= lt!346857 e!433156)))

(declare-fun c!86346 () Bool)

(declare-fun lt!346859 () SeekEntryResult!7976)

(assert (=> d!102345 (= c!86346 (and (is-Intermediate!7976 lt!346859) (undefined!8788 lt!346859)))))

(assert (=> d!102345 (= lt!346859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346658 mask!3328) lt!346658 lt!346660 mask!3328))))

(assert (=> d!102345 (validMask!0 mask!3328)))

(assert (=> d!102345 (= (seekEntryOrOpen!0 lt!346658 lt!346660 mask!3328) lt!346857)))

(declare-fun b!778556 () Bool)

(declare-fun e!433155 () SeekEntryResult!7976)

(assert (=> b!778556 (= e!433155 (Found!7976 (index!34274 lt!346859)))))

(declare-fun b!778557 () Bool)

(assert (=> b!778557 (= e!433156 e!433155)))

(declare-fun lt!346858 () (_ BitVec 64))

(assert (=> b!778557 (= lt!346858 (select (arr!20376 lt!346660) (index!34274 lt!346859)))))

(declare-fun c!86347 () Bool)

(assert (=> b!778557 (= c!86347 (= lt!346858 lt!346658))))

(declare-fun b!778558 () Bool)

(assert (=> b!778558 (= e!433156 Undefined!7976)))

(declare-fun b!778559 () Bool)

(declare-fun e!433157 () SeekEntryResult!7976)

(assert (=> b!778559 (= e!433157 (MissingZero!7976 (index!34274 lt!346859)))))

(declare-fun b!778560 () Bool)

(declare-fun c!86348 () Bool)

(assert (=> b!778560 (= c!86348 (= lt!346858 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778560 (= e!433155 e!433157)))

(declare-fun b!778561 () Bool)

(assert (=> b!778561 (= e!433157 (seekKeyOrZeroReturnVacant!0 (x!65216 lt!346859) (index!34274 lt!346859) (index!34274 lt!346859) lt!346658 lt!346660 mask!3328))))

(assert (= (and d!102345 c!86346) b!778558))

(assert (= (and d!102345 (not c!86346)) b!778557))

(assert (= (and b!778557 c!86347) b!778556))

(assert (= (and b!778557 (not c!86347)) b!778560))

(assert (= (and b!778560 c!86348) b!778559))

(assert (= (and b!778560 (not c!86348)) b!778561))

(declare-fun m!722217 () Bool)

(assert (=> d!102345 m!722217))

(declare-fun m!722219 () Bool)

(assert (=> d!102345 m!722219))

(assert (=> d!102345 m!721843))

(assert (=> d!102345 m!721845))

(assert (=> d!102345 m!721871))

(declare-fun m!722221 () Bool)

(assert (=> d!102345 m!722221))

(assert (=> d!102345 m!721843))

(declare-fun m!722223 () Bool)

(assert (=> b!778557 m!722223))

(declare-fun m!722225 () Bool)

(assert (=> b!778561 m!722225))

(assert (=> b!778094 d!102345))

(declare-fun b!778562 () Bool)

(declare-fun lt!346861 () SeekEntryResult!7976)

(assert (=> b!778562 (and (bvsge (index!34274 lt!346861) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346861) (size!20797 a!3186)))))

(declare-fun res!526670 () Bool)

(assert (=> b!778562 (= res!526670 (= (select (arr!20376 a!3186) (index!34274 lt!346861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433161 () Bool)

(assert (=> b!778562 (=> res!526670 e!433161)))

(declare-fun b!778563 () Bool)

(declare-fun e!433158 () SeekEntryResult!7976)

(assert (=> b!778563 (= e!433158 (Intermediate!7976 false (toIndex!0 (select (arr!20376 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102347 () Bool)

(declare-fun e!433162 () Bool)

(assert (=> d!102347 e!433162))

(declare-fun c!86349 () Bool)

(assert (=> d!102347 (= c!86349 (and (is-Intermediate!7976 lt!346861) (undefined!8788 lt!346861)))))

(declare-fun e!433159 () SeekEntryResult!7976)

(assert (=> d!102347 (= lt!346861 e!433159)))

(declare-fun c!86351 () Bool)

(assert (=> d!102347 (= c!86351 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346860 () (_ BitVec 64))

(assert (=> d!102347 (= lt!346860 (select (arr!20376 a!3186) (toIndex!0 (select (arr!20376 a!3186) j!159) mask!3328)))))

(assert (=> d!102347 (validMask!0 mask!3328)))

(assert (=> d!102347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20376 a!3186) j!159) mask!3328) (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346861)))

(declare-fun b!778564 () Bool)

(assert (=> b!778564 (and (bvsge (index!34274 lt!346861) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346861) (size!20797 a!3186)))))

(assert (=> b!778564 (= e!433161 (= (select (arr!20376 a!3186) (index!34274 lt!346861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!778565 () Bool)

(assert (=> b!778565 (= e!433158 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20376 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20376 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778566 () Bool)

(declare-fun e!433160 () Bool)

(assert (=> b!778566 (= e!433162 e!433160)))

(declare-fun res!526672 () Bool)

(assert (=> b!778566 (= res!526672 (and (is-Intermediate!7976 lt!346861) (not (undefined!8788 lt!346861)) (bvslt (x!65216 lt!346861) #b01111111111111111111111111111110) (bvsge (x!65216 lt!346861) #b00000000000000000000000000000000) (bvsge (x!65216 lt!346861) #b00000000000000000000000000000000)))))

(assert (=> b!778566 (=> (not res!526672) (not e!433160))))

(declare-fun b!778567 () Bool)

(assert (=> b!778567 (= e!433159 e!433158)))

(declare-fun c!86350 () Bool)

(assert (=> b!778567 (= c!86350 (or (= lt!346860 (select (arr!20376 a!3186) j!159)) (= (bvadd lt!346860 lt!346860) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778568 () Bool)

(assert (=> b!778568 (= e!433162 (bvsge (x!65216 lt!346861) #b01111111111111111111111111111110))))

(declare-fun b!778569 () Bool)

(assert (=> b!778569 (and (bvsge (index!34274 lt!346861) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346861) (size!20797 a!3186)))))

(declare-fun res!526671 () Bool)

(assert (=> b!778569 (= res!526671 (= (select (arr!20376 a!3186) (index!34274 lt!346861)) (select (arr!20376 a!3186) j!159)))))

(assert (=> b!778569 (=> res!526671 e!433161)))

(assert (=> b!778569 (= e!433160 e!433161)))

(declare-fun b!778570 () Bool)

(assert (=> b!778570 (= e!433159 (Intermediate!7976 true (toIndex!0 (select (arr!20376 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102347 c!86351) b!778570))

(assert (= (and d!102347 (not c!86351)) b!778567))

(assert (= (and b!778567 c!86350) b!778563))

(assert (= (and b!778567 (not c!86350)) b!778565))

(assert (= (and d!102347 c!86349) b!778568))

(assert (= (and d!102347 (not c!86349)) b!778566))

(assert (= (and b!778566 res!526672) b!778569))

(assert (= (and b!778569 (not res!526671)) b!778562))

(assert (= (and b!778562 (not res!526670)) b!778564))

(assert (=> d!102347 m!721875))

(declare-fun m!722227 () Bool)

(assert (=> d!102347 m!722227))

(assert (=> d!102347 m!721871))

(declare-fun m!722229 () Bool)

(assert (=> b!778562 m!722229))

(assert (=> b!778564 m!722229))

(assert (=> b!778569 m!722229))

(assert (=> b!778565 m!721875))

(declare-fun m!722231 () Bool)

(assert (=> b!778565 m!722231))

(assert (=> b!778565 m!722231))

(assert (=> b!778565 m!721851))

(declare-fun m!722233 () Bool)

(assert (=> b!778565 m!722233))

(assert (=> b!778083 d!102347))

(declare-fun d!102349 () Bool)

(declare-fun lt!346863 () (_ BitVec 32))

(declare-fun lt!346862 () (_ BitVec 32))

(assert (=> d!102349 (= lt!346863 (bvmul (bvxor lt!346862 (bvlshr lt!346862 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102349 (= lt!346862 ((_ extract 31 0) (bvand (bvxor (select (arr!20376 a!3186) j!159) (bvlshr (select (arr!20376 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102349 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526612 (let ((h!15489 ((_ extract 31 0) (bvand (bvxor (select (arr!20376 a!3186) j!159) (bvlshr (select (arr!20376 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65225 (bvmul (bvxor h!15489 (bvlshr h!15489 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65225 (bvlshr x!65225 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526612 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526612 #b00000000000000000000000000000000))))))

(assert (=> d!102349 (= (toIndex!0 (select (arr!20376 a!3186) j!159) mask!3328) (bvand (bvxor lt!346863 (bvlshr lt!346863 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!778083 d!102349))

(declare-fun d!102351 () Bool)

(assert (=> d!102351 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67272 d!102351))

(declare-fun d!102359 () Bool)

(assert (=> d!102359 (= (array_inv!16172 a!3186) (bvsge (size!20797 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67272 d!102359))

(declare-fun b!778599 () Bool)

(declare-fun lt!346876 () SeekEntryResult!7976)

(assert (=> b!778599 (and (bvsge (index!34274 lt!346876) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346876) (size!20797 a!3186)))))

(declare-fun res!526675 () Bool)

(assert (=> b!778599 (= res!526675 (= (select (arr!20376 a!3186) (index!34274 lt!346876)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433181 () Bool)

(assert (=> b!778599 (=> res!526675 e!433181)))

(declare-fun b!778600 () Bool)

(declare-fun e!433178 () SeekEntryResult!7976)

(assert (=> b!778600 (= e!433178 (Intermediate!7976 false index!1321 x!1131))))

(declare-fun d!102363 () Bool)

(declare-fun e!433182 () Bool)

(assert (=> d!102363 e!433182))

(declare-fun c!86365 () Bool)

(assert (=> d!102363 (= c!86365 (and (is-Intermediate!7976 lt!346876) (undefined!8788 lt!346876)))))

(declare-fun e!433179 () SeekEntryResult!7976)

(assert (=> d!102363 (= lt!346876 e!433179)))

(declare-fun c!86367 () Bool)

(assert (=> d!102363 (= c!86367 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346875 () (_ BitVec 64))

(assert (=> d!102363 (= lt!346875 (select (arr!20376 a!3186) index!1321))))

(assert (=> d!102363 (validMask!0 mask!3328)))

(assert (=> d!102363 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) lt!346876)))

(declare-fun b!778601 () Bool)

(assert (=> b!778601 (and (bvsge (index!34274 lt!346876) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346876) (size!20797 a!3186)))))

(assert (=> b!778601 (= e!433181 (= (select (arr!20376 a!3186) (index!34274 lt!346876)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!778602 () Bool)

(assert (=> b!778602 (= e!433178 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20376 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778603 () Bool)

(declare-fun e!433180 () Bool)

(assert (=> b!778603 (= e!433182 e!433180)))

(declare-fun res!526677 () Bool)

(assert (=> b!778603 (= res!526677 (and (is-Intermediate!7976 lt!346876) (not (undefined!8788 lt!346876)) (bvslt (x!65216 lt!346876) #b01111111111111111111111111111110) (bvsge (x!65216 lt!346876) #b00000000000000000000000000000000) (bvsge (x!65216 lt!346876) x!1131)))))

(assert (=> b!778603 (=> (not res!526677) (not e!433180))))

(declare-fun b!778604 () Bool)

(assert (=> b!778604 (= e!433179 e!433178)))

(declare-fun c!86366 () Bool)

(assert (=> b!778604 (= c!86366 (or (= lt!346875 (select (arr!20376 a!3186) j!159)) (= (bvadd lt!346875 lt!346875) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778605 () Bool)

(assert (=> b!778605 (= e!433182 (bvsge (x!65216 lt!346876) #b01111111111111111111111111111110))))

(declare-fun b!778606 () Bool)

(assert (=> b!778606 (and (bvsge (index!34274 lt!346876) #b00000000000000000000000000000000) (bvslt (index!34274 lt!346876) (size!20797 a!3186)))))

(declare-fun res!526676 () Bool)

(assert (=> b!778606 (= res!526676 (= (select (arr!20376 a!3186) (index!34274 lt!346876)) (select (arr!20376 a!3186) j!159)))))

(assert (=> b!778606 (=> res!526676 e!433181)))

(assert (=> b!778606 (= e!433180 e!433181)))

(declare-fun b!778607 () Bool)

(assert (=> b!778607 (= e!433179 (Intermediate!7976 true index!1321 x!1131))))

(assert (= (and d!102363 c!86367) b!778607))

(assert (= (and d!102363 (not c!86367)) b!778604))

(assert (= (and b!778604 c!86366) b!778600))

(assert (= (and b!778604 (not c!86366)) b!778602))

(assert (= (and d!102363 c!86365) b!778605))

(assert (= (and d!102363 (not c!86365)) b!778603))

(assert (= (and b!778603 res!526677) b!778606))

(assert (= (and b!778606 (not res!526676)) b!778599))

(assert (= (and b!778599 (not res!526675)) b!778601))

(assert (=> d!102363 m!722029))

(assert (=> d!102363 m!721871))

(declare-fun m!722255 () Bool)

(assert (=> b!778599 m!722255))

(assert (=> b!778601 m!722255))

(assert (=> b!778606 m!722255))

(assert (=> b!778602 m!722031))

(assert (=> b!778602 m!722031))

(assert (=> b!778602 m!721851))

(declare-fun m!722257 () Bool)

(assert (=> b!778602 m!722257))

(assert (=> b!778082 d!102363))

(declare-fun b!778608 () Bool)

(declare-fun e!433183 () Bool)

(declare-fun e!433185 () Bool)

(assert (=> b!778608 (= e!433183 e!433185)))

(declare-fun lt!346878 () (_ BitVec 64))

(assert (=> b!778608 (= lt!346878 (select (arr!20376 a!3186) j!159))))

(declare-fun lt!346879 () Unit!26846)

(assert (=> b!778608 (= lt!346879 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346878 j!159))))

(assert (=> b!778608 (arrayContainsKey!0 a!3186 lt!346878 #b00000000000000000000000000000000)))

(declare-fun lt!346877 () Unit!26846)

(assert (=> b!778608 (= lt!346877 lt!346879)))

(declare-fun res!526679 () Bool)

(assert (=> b!778608 (= res!526679 (= (seekEntryOrOpen!0 (select (arr!20376 a!3186) j!159) a!3186 mask!3328) (Found!7976 j!159)))))

(assert (=> b!778608 (=> (not res!526679) (not e!433185))))

(declare-fun d!102365 () Bool)

(declare-fun res!526678 () Bool)

(declare-fun e!433184 () Bool)

(assert (=> d!102365 (=> res!526678 e!433184)))

(assert (=> d!102365 (= res!526678 (bvsge j!159 (size!20797 a!3186)))))

(assert (=> d!102365 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!433184)))

(declare-fun b!778609 () Bool)

(declare-fun call!35211 () Bool)

(assert (=> b!778609 (= e!433185 call!35211)))

(declare-fun b!778610 () Bool)

(assert (=> b!778610 (= e!433184 e!433183)))

(declare-fun c!86368 () Bool)

(assert (=> b!778610 (= c!86368 (validKeyInArray!0 (select (arr!20376 a!3186) j!159)))))

(declare-fun b!778611 () Bool)

(assert (=> b!778611 (= e!433183 call!35211)))

(declare-fun bm!35208 () Bool)

(assert (=> bm!35208 (= call!35211 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102365 (not res!526678)) b!778610))

(assert (= (and b!778610 c!86368) b!778608))

(assert (= (and b!778610 (not c!86368)) b!778611))

(assert (= (and b!778608 res!526679) b!778609))

(assert (= (or b!778609 b!778611) bm!35208))

(assert (=> b!778608 m!721851))

(declare-fun m!722259 () Bool)

(assert (=> b!778608 m!722259))

(declare-fun m!722261 () Bool)

(assert (=> b!778608 m!722261))

(assert (=> b!778608 m!721851))

(assert (=> b!778608 m!721885))

(assert (=> b!778610 m!721851))

(assert (=> b!778610 m!721851))

(assert (=> b!778610 m!721867))

(declare-fun m!722263 () Bool)

(assert (=> bm!35208 m!722263))

(assert (=> b!778093 d!102365))

(declare-fun d!102367 () Bool)

(assert (=> d!102367 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!346887 () Unit!26846)

(declare-fun choose!38 (array!42564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26846)

(assert (=> d!102367 (= lt!346887 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102367 (validMask!0 mask!3328)))

(assert (=> d!102367 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!346887)))

(declare-fun bs!21693 () Bool)

(assert (= bs!21693 d!102367))

(assert (=> bs!21693 m!721857))

(declare-fun m!722273 () Bool)

(assert (=> bs!21693 m!722273))

(assert (=> bs!21693 m!721871))

(assert (=> b!778093 d!102367))

(push 1)

