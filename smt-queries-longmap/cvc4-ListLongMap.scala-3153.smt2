; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44392 () Bool)

(assert start!44392)

(declare-fun b!487932 () Bool)

(declare-fun res!291205 () Bool)

(declare-fun e!287054 () Bool)

(assert (=> b!487932 (=> (not res!291205) (not e!287054))))

(declare-datatypes ((array!31598 0))(
  ( (array!31599 (arr!15191 (Array (_ BitVec 32) (_ BitVec 64))) (size!15555 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31598)

(declare-datatypes ((List!9349 0))(
  ( (Nil!9346) (Cons!9345 (h!10201 (_ BitVec 64)) (t!15577 List!9349)) )
))
(declare-fun arrayNoDuplicates!0 (array!31598 (_ BitVec 32) List!9349) Bool)

(assert (=> b!487932 (= res!291205 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9346))))

(declare-fun b!487933 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!220207 () (_ BitVec 32))

(assert (=> b!487933 (= e!287054 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220207 #b00000000000000000000000000000000) (bvslt lt!220207 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487933 (= lt!220207 (toIndex!0 (select (arr!15191 a!3235) j!176) mask!3524))))

(declare-fun e!287055 () Bool)

(assert (=> b!487933 e!287055))

(declare-fun res!291206 () Bool)

(assert (=> b!487933 (=> (not res!291206) (not e!287055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31598 (_ BitVec 32)) Bool)

(assert (=> b!487933 (= res!291206 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14262 0))(
  ( (Unit!14263) )
))
(declare-fun lt!220205 () Unit!14262)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14262)

(assert (=> b!487933 (= lt!220205 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487934 () Bool)

(declare-fun res!291209 () Bool)

(declare-fun e!287052 () Bool)

(assert (=> b!487934 (=> (not res!291209) (not e!287052))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487934 (= res!291209 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487935 () Bool)

(assert (=> b!487935 (= e!287052 e!287054)))

(declare-fun res!291210 () Bool)

(assert (=> b!487935 (=> (not res!291210) (not e!287054))))

(declare-datatypes ((SeekEntryResult!3658 0))(
  ( (MissingZero!3658 (index!16811 (_ BitVec 32))) (Found!3658 (index!16812 (_ BitVec 32))) (Intermediate!3658 (undefined!4470 Bool) (index!16813 (_ BitVec 32)) (x!45926 (_ BitVec 32))) (Undefined!3658) (MissingVacant!3658 (index!16814 (_ BitVec 32))) )
))
(declare-fun lt!220206 () SeekEntryResult!3658)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487935 (= res!291210 (or (= lt!220206 (MissingZero!3658 i!1204)) (= lt!220206 (MissingVacant!3658 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31598 (_ BitVec 32)) SeekEntryResult!3658)

(assert (=> b!487935 (= lt!220206 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487936 () Bool)

(declare-fun res!291212 () Bool)

(assert (=> b!487936 (=> (not res!291212) (not e!287052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487936 (= res!291212 (validKeyInArray!0 k!2280))))

(declare-fun b!487937 () Bool)

(assert (=> b!487937 (= e!287055 (= (seekEntryOrOpen!0 (select (arr!15191 a!3235) j!176) a!3235 mask!3524) (Found!3658 j!176)))))

(declare-fun b!487938 () Bool)

(declare-fun res!291208 () Bool)

(assert (=> b!487938 (=> (not res!291208) (not e!287054))))

(assert (=> b!487938 (= res!291208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487940 () Bool)

(declare-fun res!291207 () Bool)

(assert (=> b!487940 (=> (not res!291207) (not e!287052))))

(assert (=> b!487940 (= res!291207 (and (= (size!15555 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15555 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15555 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!291204 () Bool)

(assert (=> start!44392 (=> (not res!291204) (not e!287052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44392 (= res!291204 (validMask!0 mask!3524))))

(assert (=> start!44392 e!287052))

(assert (=> start!44392 true))

(declare-fun array_inv!10987 (array!31598) Bool)

(assert (=> start!44392 (array_inv!10987 a!3235)))

(declare-fun b!487939 () Bool)

(declare-fun res!291211 () Bool)

(assert (=> b!487939 (=> (not res!291211) (not e!287052))))

(assert (=> b!487939 (= res!291211 (validKeyInArray!0 (select (arr!15191 a!3235) j!176)))))

(assert (= (and start!44392 res!291204) b!487940))

(assert (= (and b!487940 res!291207) b!487939))

(assert (= (and b!487939 res!291211) b!487936))

(assert (= (and b!487936 res!291212) b!487934))

(assert (= (and b!487934 res!291209) b!487935))

(assert (= (and b!487935 res!291210) b!487938))

(assert (= (and b!487938 res!291208) b!487932))

(assert (= (and b!487932 res!291205) b!487933))

(assert (= (and b!487933 res!291206) b!487937))

(declare-fun m!467713 () Bool)

(assert (=> b!487934 m!467713))

(declare-fun m!467715 () Bool)

(assert (=> b!487938 m!467715))

(declare-fun m!467717 () Bool)

(assert (=> b!487936 m!467717))

(declare-fun m!467719 () Bool)

(assert (=> b!487937 m!467719))

(assert (=> b!487937 m!467719))

(declare-fun m!467721 () Bool)

(assert (=> b!487937 m!467721))

(assert (=> b!487933 m!467719))

(assert (=> b!487933 m!467719))

(declare-fun m!467723 () Bool)

(assert (=> b!487933 m!467723))

(declare-fun m!467725 () Bool)

(assert (=> b!487933 m!467725))

(declare-fun m!467727 () Bool)

(assert (=> b!487933 m!467727))

(declare-fun m!467729 () Bool)

(assert (=> b!487932 m!467729))

(declare-fun m!467731 () Bool)

(assert (=> b!487935 m!467731))

(assert (=> b!487939 m!467719))

(assert (=> b!487939 m!467719))

(declare-fun m!467733 () Bool)

(assert (=> b!487939 m!467733))

(declare-fun m!467735 () Bool)

(assert (=> start!44392 m!467735))

(declare-fun m!467737 () Bool)

(assert (=> start!44392 m!467737))

(push 1)

(assert (not b!487937))

(assert (not b!487939))

(assert (not b!487938))

(assert (not b!487935))

(assert (not b!487932))

(assert (not b!487934))

(assert (not b!487936))

(assert (not start!44392))

(assert (not b!487933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!487959 () Bool)

(declare-fun e!287070 () Bool)

(declare-fun e!287071 () Bool)

(assert (=> b!487959 (= e!287070 e!287071)))

(declare-fun lt!220214 () (_ BitVec 64))

(assert (=> b!487959 (= lt!220214 (select (arr!15191 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220216 () Unit!14262)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31598 (_ BitVec 64) (_ BitVec 32)) Unit!14262)

(assert (=> b!487959 (= lt!220216 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220214 #b00000000000000000000000000000000))))

(assert (=> b!487959 (arrayContainsKey!0 a!3235 lt!220214 #b00000000000000000000000000000000)))

(declare-fun lt!220215 () Unit!14262)

(assert (=> b!487959 (= lt!220215 lt!220216)))

(declare-fun res!291223 () Bool)

(assert (=> b!487959 (= res!291223 (= (seekEntryOrOpen!0 (select (arr!15191 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3658 #b00000000000000000000000000000000)))))

(assert (=> b!487959 (=> (not res!291223) (not e!287071))))

(declare-fun d!77711 () Bool)

(declare-fun res!291224 () Bool)

(declare-fun e!287072 () Bool)

(assert (=> d!77711 (=> res!291224 e!287072)))

(assert (=> d!77711 (= res!291224 (bvsge #b00000000000000000000000000000000 (size!15555 a!3235)))))

(assert (=> d!77711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287072)))

(declare-fun b!487960 () Bool)

(assert (=> b!487960 (= e!287072 e!287070)))

(declare-fun c!58636 () Bool)

(assert (=> b!487960 (= c!58636 (validKeyInArray!0 (select (arr!15191 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487961 () Bool)

(declare-fun call!31309 () Bool)

(assert (=> b!487961 (= e!287070 call!31309)))

(declare-fun bm!31306 () Bool)

(assert (=> bm!31306 (= call!31309 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487962 () Bool)

(assert (=> b!487962 (= e!287071 call!31309)))

(assert (= (and d!77711 (not res!291224)) b!487960))

(assert (= (and b!487960 c!58636) b!487959))

(assert (= (and b!487960 (not c!58636)) b!487961))

(assert (= (and b!487959 res!291223) b!487962))

(assert (= (or b!487962 b!487961) bm!31306))

(declare-fun m!467739 () Bool)

(assert (=> b!487959 m!467739))

(declare-fun m!467741 () Bool)

(assert (=> b!487959 m!467741))

(declare-fun m!467743 () Bool)

(assert (=> b!487959 m!467743))

(assert (=> b!487959 m!467739))

(declare-fun m!467745 () Bool)

(assert (=> b!487959 m!467745))

(assert (=> b!487960 m!467739))

(assert (=> b!487960 m!467739))

(declare-fun m!467747 () Bool)

(assert (=> b!487960 m!467747))

(declare-fun m!467749 () Bool)

(assert (=> bm!31306 m!467749))

(assert (=> b!487938 d!77711))

(declare-fun d!77713 () Bool)

(declare-fun lt!220228 () (_ BitVec 32))

(declare-fun lt!220227 () (_ BitVec 32))

(assert (=> d!77713 (= lt!220228 (bvmul (bvxor lt!220227 (bvlshr lt!220227 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77713 (= lt!220227 ((_ extract 31 0) (bvand (bvxor (select (arr!15191 a!3235) j!176) (bvlshr (select (arr!15191 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77713 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!291225 (let ((h!10202 ((_ extract 31 0) (bvand (bvxor (select (arr!15191 a!3235) j!176) (bvlshr (select (arr!15191 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!45927 (bvmul (bvxor h!10202 (bvlshr h!10202 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!45927 (bvlshr x!45927 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!291225 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!291225 #b00000000000000000000000000000000))))))

(assert (=> d!77713 (= (toIndex!0 (select (arr!15191 a!3235) j!176) mask!3524) (bvand (bvxor lt!220228 (bvlshr lt!220228 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!487933 d!77713))

(declare-fun b!487980 () Bool)

(declare-fun e!287083 () Bool)

(declare-fun e!287084 () Bool)

(assert (=> b!487980 (= e!287083 e!287084)))

(declare-fun lt!220229 () (_ BitVec 64))

(assert (=> b!487980 (= lt!220229 (select (arr!15191 a!3235) j!176))))

(declare-fun lt!220231 () Unit!14262)

(assert (=> b!487980 (= lt!220231 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220229 j!176))))

(assert (=> b!487980 (arrayContainsKey!0 a!3235 lt!220229 #b00000000000000000000000000000000)))

(declare-fun lt!220230 () Unit!14262)

(assert (=> b!487980 (= lt!220230 lt!220231)))

(declare-fun res!291229 () Bool)

(assert (=> b!487980 (= res!291229 (= (seekEntryOrOpen!0 (select (arr!15191 a!3235) j!176) a!3235 mask!3524) (Found!3658 j!176)))))

(assert (=> b!487980 (=> (not res!291229) (not e!287084))))

(declare-fun d!77715 () Bool)

(declare-fun res!291230 () Bool)

(declare-fun e!287085 () Bool)

(assert (=> d!77715 (=> res!291230 e!287085)))

(assert (=> d!77715 (= res!291230 (bvsge j!176 (size!15555 a!3235)))))

(assert (=> d!77715 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287085)))

(declare-fun b!487981 () Bool)

(assert (=> b!487981 (= e!287085 e!287083)))

(declare-fun c!58644 () Bool)

(assert (=> b!487981 (= c!58644 (validKeyInArray!0 (select (arr!15191 a!3235) j!176)))))

(declare-fun b!487982 () Bool)

(declare-fun call!31311 () Bool)

(assert (=> b!487982 (= e!287083 call!31311)))

(declare-fun bm!31308 () Bool)

(assert (=> bm!31308 (= call!31311 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487983 () Bool)

(assert (=> b!487983 (= e!287084 call!31311)))

(assert (= (and d!77715 (not res!291230)) b!487981))

(assert (= (and b!487981 c!58644) b!487980))

(assert (= (and b!487981 (not c!58644)) b!487982))

(assert (= (and b!487980 res!291229) b!487983))

(assert (= (or b!487983 b!487982) bm!31308))

(assert (=> b!487980 m!467719))

(declare-fun m!467757 () Bool)

(assert (=> b!487980 m!467757))

(declare-fun m!467761 () Bool)

(assert (=> b!487980 m!467761))

(assert (=> b!487980 m!467719))

(assert (=> b!487980 m!467721))

(assert (=> b!487981 m!467719))

(assert (=> b!487981 m!467719))

(assert (=> b!487981 m!467733))

(declare-fun m!467763 () Bool)

(assert (=> bm!31308 m!467763))

(assert (=> b!487933 d!77715))

(declare-fun d!77717 () Bool)

(assert (=> d!77717 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220240 () Unit!14262)

(declare-fun choose!38 (array!31598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14262)

(assert (=> d!77717 (= lt!220240 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77717 (validMask!0 mask!3524)))

(assert (=> d!77717 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220240)))

(declare-fun bs!15553 () Bool)

(assert (= bs!15553 d!77717))

(assert (=> bs!15553 m!467725))

(declare-fun m!467791 () Bool)

(assert (=> bs!15553 m!467791))

(assert (=> bs!15553 m!467735))

(assert (=> b!487933 d!77717))

(declare-fun d!77725 () Bool)

(assert (=> d!77725 (= (validKeyInArray!0 (select (arr!15191 a!3235) j!176)) (and (not (= (select (arr!15191 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15191 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487939 d!77725))

(declare-fun d!77727 () Bool)

(declare-fun res!291239 () Bool)

(declare-fun e!287102 () Bool)

(assert (=> d!77727 (=> res!291239 e!287102)))

(assert (=> d!77727 (= res!291239 (= (select (arr!15191 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77727 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!287102)))

(declare-fun b!488008 () Bool)

(declare-fun e!287103 () Bool)

(assert (=> b!488008 (= e!287102 e!287103)))

(declare-fun res!291240 () Bool)

(assert (=> b!488008 (=> (not res!291240) (not e!287103))))

(assert (=> b!488008 (= res!291240 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15555 a!3235)))))

(declare-fun b!488009 () Bool)

(assert (=> b!488009 (= e!287103 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77727 (not res!291239)) b!488008))

(assert (= (and b!488008 res!291240) b!488009))

(assert (=> d!77727 m!467739))

(declare-fun m!467793 () Bool)

(assert (=> b!488009 m!467793))

(assert (=> b!487934 d!77727))

(declare-fun d!77729 () Bool)

(assert (=> d!77729 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44392 d!77729))

(declare-fun d!77737 () Bool)

(assert (=> d!77737 (= (array_inv!10987 a!3235) (bvsge (size!15555 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44392 d!77737))

(declare-fun b!488081 () Bool)

(declare-fun e!287153 () SeekEntryResult!3658)

(declare-fun lt!220283 () SeekEntryResult!3658)

(assert (=> b!488081 (= e!287153 (Found!3658 (index!16813 lt!220283)))))

(declare-fun e!287152 () SeekEntryResult!3658)

(declare-fun b!488082 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31598 (_ BitVec 32)) SeekEntryResult!3658)

(assert (=> b!488082 (= e!287152 (seekKeyOrZeroReturnVacant!0 (x!45926 lt!220283) (index!16813 lt!220283) (index!16813 lt!220283) k!2280 a!3235 mask!3524))))

(declare-fun b!488083 () Bool)

(declare-fun e!287154 () SeekEntryResult!3658)

(assert (=> b!488083 (= e!287154 Undefined!3658)))

(declare-fun d!77739 () Bool)

(declare-fun lt!220285 () SeekEntryResult!3658)

(assert (=> d!77739 (and (or (is-Undefined!3658 lt!220285) (not (is-Found!3658 lt!220285)) (and (bvsge (index!16812 lt!220285) #b00000000000000000000000000000000) (bvslt (index!16812 lt!220285) (size!15555 a!3235)))) (or (is-Undefined!3658 lt!220285) (is-Found!3658 lt!220285) (not (is-MissingZero!3658 lt!220285)) (and (bvsge (index!16811 lt!220285) #b00000000000000000000000000000000) (bvslt (index!16811 lt!220285) (size!15555 a!3235)))) (or (is-Undefined!3658 lt!220285) (is-Found!3658 lt!220285) (is-MissingZero!3658 lt!220285) (not (is-MissingVacant!3658 lt!220285)) (and (bvsge (index!16814 lt!220285) #b00000000000000000000000000000000) (bvslt (index!16814 lt!220285) (size!15555 a!3235)))) (or (is-Undefined!3658 lt!220285) (ite (is-Found!3658 lt!220285) (= (select (arr!15191 a!3235) (index!16812 lt!220285)) k!2280) (ite (is-MissingZero!3658 lt!220285) (= (select (arr!15191 a!3235) (index!16811 lt!220285)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3658 lt!220285) (= (select (arr!15191 a!3235) (index!16814 lt!220285)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77739 (= lt!220285 e!287154)))

(declare-fun c!58677 () Bool)

(assert (=> d!77739 (= c!58677 (and (is-Intermediate!3658 lt!220283) (undefined!4470 lt!220283)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31598 (_ BitVec 32)) SeekEntryResult!3658)

(assert (=> d!77739 (= lt!220283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77739 (validMask!0 mask!3524)))

(assert (=> d!77739 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!220285)))

(declare-fun b!488084 () Bool)

(declare-fun c!58678 () Bool)

(declare-fun lt!220284 () (_ BitVec 64))

(assert (=> b!488084 (= c!58678 (= lt!220284 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488084 (= e!287153 e!287152)))

(declare-fun b!488085 () Bool)

(assert (=> b!488085 (= e!287152 (MissingZero!3658 (index!16813 lt!220283)))))

(declare-fun b!488086 () Bool)

(assert (=> b!488086 (= e!287154 e!287153)))

(assert (=> b!488086 (= lt!220284 (select (arr!15191 a!3235) (index!16813 lt!220283)))))

(declare-fun c!58676 () Bool)

(assert (=> b!488086 (= c!58676 (= lt!220284 k!2280))))

(assert (= (and d!77739 c!58677) b!488083))

(assert (= (and d!77739 (not c!58677)) b!488086))

(assert (= (and b!488086 c!58676) b!488081))

(assert (= (and b!488086 (not c!58676)) b!488084))

(assert (= (and b!488084 c!58678) b!488085))

(assert (= (and b!488084 (not c!58678)) b!488082))

(declare-fun m!467839 () Bool)

(assert (=> b!488082 m!467839))

(declare-fun m!467841 () Bool)

(assert (=> d!77739 m!467841))

(declare-fun m!467843 () Bool)

(assert (=> d!77739 m!467843))

(assert (=> d!77739 m!467735))

(declare-fun m!467845 () Bool)

(assert (=> d!77739 m!467845))

(declare-fun m!467847 () Bool)

(assert (=> d!77739 m!467847))

(assert (=> d!77739 m!467841))

(declare-fun m!467849 () Bool)

(assert (=> d!77739 m!467849))

(declare-fun m!467851 () Bool)

(assert (=> b!488086 m!467851))

(assert (=> b!487935 d!77739))

(declare-fun d!77761 () Bool)

(assert (=> d!77761 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487936 d!77761))

(declare-fun b!488087 () Bool)

(declare-fun e!287156 () SeekEntryResult!3658)

(declare-fun lt!220286 () SeekEntryResult!3658)

(assert (=> b!488087 (= e!287156 (Found!3658 (index!16813 lt!220286)))))

(declare-fun b!488088 () Bool)

(declare-fun e!287155 () SeekEntryResult!3658)

(assert (=> b!488088 (= e!287155 (seekKeyOrZeroReturnVacant!0 (x!45926 lt!220286) (index!16813 lt!220286) (index!16813 lt!220286) (select (arr!15191 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!488089 () Bool)

(declare-fun e!287157 () SeekEntryResult!3658)

(assert (=> b!488089 (= e!287157 Undefined!3658)))

(declare-fun d!77763 () Bool)

(declare-fun lt!220288 () SeekEntryResult!3658)

(assert (=> d!77763 (and (or (is-Undefined!3658 lt!220288) (not (is-Found!3658 lt!220288)) (and (bvsge (index!16812 lt!220288) #b00000000000000000000000000000000) (bvslt (index!16812 lt!220288) (size!15555 a!3235)))) (or (is-Undefined!3658 lt!220288) (is-Found!3658 lt!220288) (not (is-MissingZero!3658 lt!220288)) (and (bvsge (index!16811 lt!220288) #b00000000000000000000000000000000) (bvslt (index!16811 lt!220288) (size!15555 a!3235)))) (or (is-Undefined!3658 lt!220288) (is-Found!3658 lt!220288) (is-MissingZero!3658 lt!220288) (not (is-MissingVacant!3658 lt!220288)) (and (bvsge (index!16814 lt!220288) #b00000000000000000000000000000000) (bvslt (index!16814 lt!220288) (size!15555 a!3235)))) (or (is-Undefined!3658 lt!220288) (ite (is-Found!3658 lt!220288) (= (select (arr!15191 a!3235) (index!16812 lt!220288)) (select (arr!15191 a!3235) j!176)) (ite (is-MissingZero!3658 lt!220288) (= (select (arr!15191 a!3235) (index!16811 lt!220288)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3658 lt!220288) (= (select (arr!15191 a!3235) (index!16814 lt!220288)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77763 (= lt!220288 e!287157)))

(declare-fun c!58680 () Bool)

(assert (=> d!77763 (= c!58680 (and (is-Intermediate!3658 lt!220286) (undefined!4470 lt!220286)))))

(assert (=> d!77763 (= lt!220286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15191 a!3235) j!176) mask!3524) (select (arr!15191 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77763 (validMask!0 mask!3524)))

(assert (=> d!77763 (= (seekEntryOrOpen!0 (select (arr!15191 a!3235) j!176) a!3235 mask!3524) lt!220288)))

(declare-fun b!488090 () Bool)

(declare-fun c!58681 () Bool)

(declare-fun lt!220287 () (_ BitVec 64))

(assert (=> b!488090 (= c!58681 (= lt!220287 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488090 (= e!287156 e!287155)))

(declare-fun b!488091 () Bool)

(assert (=> b!488091 (= e!287155 (MissingZero!3658 (index!16813 lt!220286)))))

(declare-fun b!488092 () Bool)

(assert (=> b!488092 (= e!287157 e!287156)))

(assert (=> b!488092 (= lt!220287 (select (arr!15191 a!3235) (index!16813 lt!220286)))))

(declare-fun c!58679 () Bool)

(assert (=> b!488092 (= c!58679 (= lt!220287 (select (arr!15191 a!3235) j!176)))))

(assert (= (and d!77763 c!58680) b!488089))

(assert (= (and d!77763 (not c!58680)) b!488092))

(assert (= (and b!488092 c!58679) b!488087))

(assert (= (and b!488092 (not c!58679)) b!488090))

(assert (= (and b!488090 c!58681) b!488091))

(assert (= (and b!488090 (not c!58681)) b!488088))

(assert (=> b!488088 m!467719))

(declare-fun m!467853 () Bool)

(assert (=> b!488088 m!467853))

(assert (=> d!77763 m!467723))

(assert (=> d!77763 m!467719))

(declare-fun m!467855 () Bool)

(assert (=> d!77763 m!467855))

(assert (=> d!77763 m!467735))

(declare-fun m!467857 () Bool)

(assert (=> d!77763 m!467857))

(declare-fun m!467859 () Bool)

(assert (=> d!77763 m!467859))

(assert (=> d!77763 m!467719))

(assert (=> d!77763 m!467723))

(declare-fun m!467861 () Bool)

(assert (=> d!77763 m!467861))

(declare-fun m!467863 () Bool)

(assert (=> b!488092 m!467863))

(assert (=> b!487937 d!77763))

(declare-fun b!488103 () Bool)

(declare-fun e!287168 () Bool)

(declare-fun call!31324 () Bool)

(assert (=> b!488103 (= e!287168 call!31324)))

(declare-fun b!488104 () Bool)

(declare-fun e!287169 () Bool)

(declare-fun e!287166 () Bool)

(assert (=> b!488104 (= e!287169 e!287166)))

(declare-fun res!291275 () Bool)

(assert (=> b!488104 (=> (not res!291275) (not e!287166))))

(declare-fun e!287167 () Bool)

(assert (=> b!488104 (= res!291275 (not e!287167))))

(declare-fun res!291273 () Bool)

(assert (=> b!488104 (=> (not res!291273) (not e!287167))))

(assert (=> b!488104 (= res!291273 (validKeyInArray!0 (select (arr!15191 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488105 () Bool)

(declare-fun contains!2703 (List!9349 (_ BitVec 64)) Bool)

(assert (=> b!488105 (= e!287167 (contains!2703 Nil!9346 (select (arr!15191 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77765 () Bool)

(declare-fun res!291274 () Bool)

(assert (=> d!77765 (=> res!291274 e!287169)))

(assert (=> d!77765 (= res!291274 (bvsge #b00000000000000000000000000000000 (size!15555 a!3235)))))

(assert (=> d!77765 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9346) e!287169)))

(declare-fun bm!31321 () Bool)

(declare-fun c!58684 () Bool)

(assert (=> bm!31321 (= call!31324 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58684 (Cons!9345 (select (arr!15191 a!3235) #b00000000000000000000000000000000) Nil!9346) Nil!9346)))))

(declare-fun b!488106 () Bool)

(assert (=> b!488106 (= e!287168 call!31324)))

(declare-fun b!488107 () Bool)

(assert (=> b!488107 (= e!287166 e!287168)))

(assert (=> b!488107 (= c!58684 (validKeyInArray!0 (select (arr!15191 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77765 (not res!291274)) b!488104))

(assert (= (and b!488104 res!291273) b!488105))

(assert (= (and b!488104 res!291275) b!488107))

(assert (= (and b!488107 c!58684) b!488106))

(assert (= (and b!488107 (not c!58684)) b!488103))

(assert (= (or b!488106 b!488103) bm!31321))

(assert (=> b!488104 m!467739))

(assert (=> b!488104 m!467739))

(assert (=> b!488104 m!467747))

(assert (=> b!488105 m!467739))

(assert (=> b!488105 m!467739))

(declare-fun m!467867 () Bool)

(assert (=> b!488105 m!467867))

(assert (=> bm!31321 m!467739))

(declare-fun m!467869 () Bool)

(assert (=> bm!31321 m!467869))

(assert (=> b!488107 m!467739))

(assert (=> b!488107 m!467739))

(assert (=> b!488107 m!467747))

(assert (=> b!487932 d!77765))

(push 1)

(assert (not d!77763))

(assert (not b!488104))

(assert (not b!488082))

(assert (not b!488107))

(assert (not bm!31306))

(assert (not b!487960))

(assert (not b!487959))

(assert (not b!487980))

(assert (not b!487981))

(assert (not d!77717))

(assert (not b!488088))

(assert (not d!77739))

(assert (not b!488105))

(assert (not b!488009))

(assert (not bm!31321))

(assert (not bm!31308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

