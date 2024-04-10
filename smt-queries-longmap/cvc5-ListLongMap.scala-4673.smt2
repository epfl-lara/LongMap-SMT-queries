; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65026 () Bool)

(assert start!65026)

(declare-fun b!734045 () Bool)

(declare-fun e!410732 () Bool)

(declare-fun e!410723 () Bool)

(assert (=> b!734045 (= e!410732 e!410723)))

(declare-fun res!493223 () Bool)

(assert (=> b!734045 (=> (not res!493223) (not e!410723))))

(declare-datatypes ((SeekEntryResult!7349 0))(
  ( (MissingZero!7349 (index!31764 (_ BitVec 32))) (Found!7349 (index!31765 (_ BitVec 32))) (Intermediate!7349 (undefined!8161 Bool) (index!31766 (_ BitVec 32)) (x!62767 (_ BitVec 32))) (Undefined!7349) (MissingVacant!7349 (index!31767 (_ BitVec 32))) )
))
(declare-fun lt!325337 () SeekEntryResult!7349)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734045 (= res!493223 (or (= lt!325337 (MissingZero!7349 i!1173)) (= lt!325337 (MissingVacant!7349 i!1173))))))

(declare-datatypes ((array!41268 0))(
  ( (array!41269 (arr!19749 (Array (_ BitVec 32) (_ BitVec 64))) (size!20170 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41268)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41268 (_ BitVec 32)) SeekEntryResult!7349)

(assert (=> b!734045 (= lt!325337 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!734046 () Bool)

(declare-fun e!410724 () Bool)

(declare-fun e!410730 () Bool)

(assert (=> b!734046 (= e!410724 e!410730)))

(declare-fun res!493230 () Bool)

(assert (=> b!734046 (=> res!493230 e!410730)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734046 (= res!493230 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325334 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734046 (= lt!325334 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734047 () Bool)

(declare-fun res!493233 () Bool)

(assert (=> b!734047 (=> (not res!493233) (not e!410732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734047 (= res!493233 (validKeyInArray!0 k!2102))))

(declare-fun b!734048 () Bool)

(declare-fun res!493225 () Bool)

(assert (=> b!734048 (=> (not res!493225) (not e!410723))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!734048 (= res!493225 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20170 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20170 a!3186))))))

(declare-fun b!734049 () Bool)

(declare-fun res!493224 () Bool)

(assert (=> b!734049 (=> res!493224 e!410730)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41268 (_ BitVec 32)) SeekEntryResult!7349)

(assert (=> b!734049 (= res!493224 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) (Found!7349 j!159)))))

(declare-fun e!410731 () Bool)

(declare-fun b!734051 () Bool)

(assert (=> b!734051 (= e!410731 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) (Found!7349 j!159)))))

(declare-fun b!734052 () Bool)

(assert (=> b!734052 (= e!410730 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325334 #b00000000000000000000000000000000) (bvsge lt!325334 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun b!734053 () Bool)

(declare-fun res!493221 () Bool)

(assert (=> b!734053 (=> (not res!493221) (not e!410723))))

(declare-datatypes ((List!13751 0))(
  ( (Nil!13748) (Cons!13747 (h!14816 (_ BitVec 64)) (t!20066 List!13751)) )
))
(declare-fun arrayNoDuplicates!0 (array!41268 (_ BitVec 32) List!13751) Bool)

(assert (=> b!734053 (= res!493221 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13748))))

(declare-fun lt!325338 () SeekEntryResult!7349)

(declare-fun b!734054 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41268 (_ BitVec 32)) SeekEntryResult!7349)

(assert (=> b!734054 (= e!410731 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325338))))

(declare-fun b!734055 () Bool)

(declare-fun e!410727 () Bool)

(declare-fun e!410725 () Bool)

(assert (=> b!734055 (= e!410727 e!410725)))

(declare-fun res!493236 () Bool)

(assert (=> b!734055 (=> (not res!493236) (not e!410725))))

(declare-fun lt!325332 () SeekEntryResult!7349)

(declare-fun lt!325340 () SeekEntryResult!7349)

(assert (=> b!734055 (= res!493236 (= lt!325332 lt!325340))))

(declare-fun lt!325339 () array!41268)

(declare-fun lt!325333 () (_ BitVec 64))

(assert (=> b!734055 (= lt!325340 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325333 lt!325339 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734055 (= lt!325332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325333 mask!3328) lt!325333 lt!325339 mask!3328))))

(assert (=> b!734055 (= lt!325333 (select (store (arr!19749 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!734055 (= lt!325339 (array!41269 (store (arr!19749 a!3186) i!1173 k!2102) (size!20170 a!3186)))))

(declare-fun e!410726 () Bool)

(declare-fun b!734056 () Bool)

(declare-fun lt!325336 () SeekEntryResult!7349)

(assert (=> b!734056 (= e!410726 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325336))))

(declare-fun b!734057 () Bool)

(declare-fun res!493228 () Bool)

(assert (=> b!734057 (=> (not res!493228) (not e!410727))))

(assert (=> b!734057 (= res!493228 e!410731)))

(declare-fun c!80791 () Bool)

(assert (=> b!734057 (= c!80791 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734058 () Bool)

(declare-fun res!493234 () Bool)

(assert (=> b!734058 (=> (not res!493234) (not e!410723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41268 (_ BitVec 32)) Bool)

(assert (=> b!734058 (= res!493234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734059 () Bool)

(declare-fun res!493222 () Bool)

(assert (=> b!734059 (=> (not res!493222) (not e!410732))))

(declare-fun arrayContainsKey!0 (array!41268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734059 (= res!493222 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734060 () Bool)

(assert (=> b!734060 (= e!410725 (not e!410724))))

(declare-fun res!493237 () Bool)

(assert (=> b!734060 (=> res!493237 e!410724)))

(assert (=> b!734060 (= res!493237 (or (not (is-Intermediate!7349 lt!325340)) (bvsge x!1131 (x!62767 lt!325340))))))

(declare-fun e!410729 () Bool)

(assert (=> b!734060 e!410729))

(declare-fun res!493231 () Bool)

(assert (=> b!734060 (=> (not res!493231) (not e!410729))))

(assert (=> b!734060 (= res!493231 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25016 0))(
  ( (Unit!25017) )
))
(declare-fun lt!325335 () Unit!25016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25016)

(assert (=> b!734060 (= lt!325335 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734061 () Bool)

(declare-fun res!493235 () Bool)

(assert (=> b!734061 (=> (not res!493235) (not e!410732))))

(assert (=> b!734061 (= res!493235 (and (= (size!20170 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20170 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20170 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734062 () Bool)

(declare-fun res!493232 () Bool)

(assert (=> b!734062 (=> (not res!493232) (not e!410732))))

(assert (=> b!734062 (= res!493232 (validKeyInArray!0 (select (arr!19749 a!3186) j!159)))))

(declare-fun b!734063 () Bool)

(assert (=> b!734063 (= e!410723 e!410727)))

(declare-fun res!493226 () Bool)

(assert (=> b!734063 (=> (not res!493226) (not e!410727))))

(assert (=> b!734063 (= res!493226 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19749 a!3186) j!159) mask!3328) (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325338))))

(assert (=> b!734063 (= lt!325338 (Intermediate!7349 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734064 () Bool)

(assert (=> b!734064 (= e!410729 e!410726)))

(declare-fun res!493227 () Bool)

(assert (=> b!734064 (=> (not res!493227) (not e!410726))))

(assert (=> b!734064 (= res!493227 (= (seekEntryOrOpen!0 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325336))))

(assert (=> b!734064 (= lt!325336 (Found!7349 j!159))))

(declare-fun res!493238 () Bool)

(assert (=> start!65026 (=> (not res!493238) (not e!410732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65026 (= res!493238 (validMask!0 mask!3328))))

(assert (=> start!65026 e!410732))

(assert (=> start!65026 true))

(declare-fun array_inv!15545 (array!41268) Bool)

(assert (=> start!65026 (array_inv!15545 a!3186)))

(declare-fun b!734050 () Bool)

(declare-fun res!493229 () Bool)

(assert (=> b!734050 (=> (not res!493229) (not e!410727))))

(assert (=> b!734050 (= res!493229 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19749 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65026 res!493238) b!734061))

(assert (= (and b!734061 res!493235) b!734062))

(assert (= (and b!734062 res!493232) b!734047))

(assert (= (and b!734047 res!493233) b!734059))

(assert (= (and b!734059 res!493222) b!734045))

(assert (= (and b!734045 res!493223) b!734058))

(assert (= (and b!734058 res!493234) b!734053))

(assert (= (and b!734053 res!493221) b!734048))

(assert (= (and b!734048 res!493225) b!734063))

(assert (= (and b!734063 res!493226) b!734050))

(assert (= (and b!734050 res!493229) b!734057))

(assert (= (and b!734057 c!80791) b!734054))

(assert (= (and b!734057 (not c!80791)) b!734051))

(assert (= (and b!734057 res!493228) b!734055))

(assert (= (and b!734055 res!493236) b!734060))

(assert (= (and b!734060 res!493231) b!734064))

(assert (= (and b!734064 res!493227) b!734056))

(assert (= (and b!734060 (not res!493237)) b!734046))

(assert (= (and b!734046 (not res!493230)) b!734049))

(assert (= (and b!734049 (not res!493224)) b!734052))

(declare-fun m!686761 () Bool)

(assert (=> b!734060 m!686761))

(declare-fun m!686763 () Bool)

(assert (=> b!734060 m!686763))

(declare-fun m!686765 () Bool)

(assert (=> b!734049 m!686765))

(assert (=> b!734049 m!686765))

(declare-fun m!686767 () Bool)

(assert (=> b!734049 m!686767))

(declare-fun m!686769 () Bool)

(assert (=> b!734045 m!686769))

(assert (=> b!734051 m!686765))

(assert (=> b!734051 m!686765))

(assert (=> b!734051 m!686767))

(assert (=> b!734054 m!686765))

(assert (=> b!734054 m!686765))

(declare-fun m!686771 () Bool)

(assert (=> b!734054 m!686771))

(declare-fun m!686773 () Bool)

(assert (=> b!734050 m!686773))

(declare-fun m!686775 () Bool)

(assert (=> b!734055 m!686775))

(declare-fun m!686777 () Bool)

(assert (=> b!734055 m!686777))

(declare-fun m!686779 () Bool)

(assert (=> b!734055 m!686779))

(assert (=> b!734055 m!686775))

(declare-fun m!686781 () Bool)

(assert (=> b!734055 m!686781))

(declare-fun m!686783 () Bool)

(assert (=> b!734055 m!686783))

(assert (=> b!734063 m!686765))

(assert (=> b!734063 m!686765))

(declare-fun m!686785 () Bool)

(assert (=> b!734063 m!686785))

(assert (=> b!734063 m!686785))

(assert (=> b!734063 m!686765))

(declare-fun m!686787 () Bool)

(assert (=> b!734063 m!686787))

(declare-fun m!686789 () Bool)

(assert (=> b!734058 m!686789))

(assert (=> b!734062 m!686765))

(assert (=> b!734062 m!686765))

(declare-fun m!686791 () Bool)

(assert (=> b!734062 m!686791))

(declare-fun m!686793 () Bool)

(assert (=> start!65026 m!686793))

(declare-fun m!686795 () Bool)

(assert (=> start!65026 m!686795))

(declare-fun m!686797 () Bool)

(assert (=> b!734047 m!686797))

(declare-fun m!686799 () Bool)

(assert (=> b!734059 m!686799))

(declare-fun m!686801 () Bool)

(assert (=> b!734046 m!686801))

(declare-fun m!686803 () Bool)

(assert (=> b!734053 m!686803))

(assert (=> b!734064 m!686765))

(assert (=> b!734064 m!686765))

(declare-fun m!686805 () Bool)

(assert (=> b!734064 m!686805))

(assert (=> b!734056 m!686765))

(assert (=> b!734056 m!686765))

(declare-fun m!686807 () Bool)

(assert (=> b!734056 m!686807))

(push 1)

(assert (not b!734064))

(assert (not b!734049))

(assert (not start!65026))

(assert (not b!734047))

(assert (not b!734062))

(assert (not b!734063))

(assert (not b!734054))

(assert (not b!734058))

(assert (not b!734059))

(assert (not b!734051))

(assert (not b!734055))

(assert (not b!734046))

(assert (not b!734056))

(assert (not b!734060))

(assert (not b!734045))

(assert (not b!734053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!734264 () Bool)

(declare-fun lt!325432 () SeekEntryResult!7349)

(assert (=> b!734264 (and (bvsge (index!31766 lt!325432) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325432) (size!20170 lt!325339)))))

(declare-fun res!493371 () Bool)

(assert (=> b!734264 (= res!493371 (= (select (arr!19749 lt!325339) (index!31766 lt!325432)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410840 () Bool)

(assert (=> b!734264 (=> res!493371 e!410840)))

(declare-fun b!734265 () Bool)

(assert (=> b!734265 (and (bvsge (index!31766 lt!325432) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325432) (size!20170 lt!325339)))))

(assert (=> b!734265 (= e!410840 (= (select (arr!19749 lt!325339) (index!31766 lt!325432)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100003 () Bool)

(declare-fun e!410842 () Bool)

(assert (=> d!100003 e!410842))

(declare-fun c!80826 () Bool)

(assert (=> d!100003 (= c!80826 (and (is-Intermediate!7349 lt!325432) (undefined!8161 lt!325432)))))

(declare-fun e!410843 () SeekEntryResult!7349)

(assert (=> d!100003 (= lt!325432 e!410843)))

(declare-fun c!80828 () Bool)

(assert (=> d!100003 (= c!80828 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325433 () (_ BitVec 64))

(assert (=> d!100003 (= lt!325433 (select (arr!19749 lt!325339) index!1321))))

(assert (=> d!100003 (validMask!0 mask!3328)))

(assert (=> d!100003 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325333 lt!325339 mask!3328) lt!325432)))

(declare-fun e!410841 () SeekEntryResult!7349)

(declare-fun b!734266 () Bool)

(assert (=> b!734266 (= e!410841 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!325333 lt!325339 mask!3328))))

(declare-fun b!734267 () Bool)

(assert (=> b!734267 (= e!410843 e!410841)))

(declare-fun c!80827 () Bool)

(assert (=> b!734267 (= c!80827 (or (= lt!325433 lt!325333) (= (bvadd lt!325433 lt!325433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734268 () Bool)

(assert (=> b!734268 (= e!410841 (Intermediate!7349 false index!1321 x!1131))))

(declare-fun b!734269 () Bool)

(assert (=> b!734269 (and (bvsge (index!31766 lt!325432) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325432) (size!20170 lt!325339)))))

(declare-fun res!493373 () Bool)

(assert (=> b!734269 (= res!493373 (= (select (arr!19749 lt!325339) (index!31766 lt!325432)) lt!325333))))

(assert (=> b!734269 (=> res!493373 e!410840)))

(declare-fun e!410839 () Bool)

(assert (=> b!734269 (= e!410839 e!410840)))

(declare-fun b!734270 () Bool)

(assert (=> b!734270 (= e!410842 (bvsge (x!62767 lt!325432) #b01111111111111111111111111111110))))

(declare-fun b!734271 () Bool)

(assert (=> b!734271 (= e!410843 (Intermediate!7349 true index!1321 x!1131))))

(declare-fun b!734272 () Bool)

(assert (=> b!734272 (= e!410842 e!410839)))

(declare-fun res!493372 () Bool)

(assert (=> b!734272 (= res!493372 (and (is-Intermediate!7349 lt!325432) (not (undefined!8161 lt!325432)) (bvslt (x!62767 lt!325432) #b01111111111111111111111111111110) (bvsge (x!62767 lt!325432) #b00000000000000000000000000000000) (bvsge (x!62767 lt!325432) x!1131)))))

(assert (=> b!734272 (=> (not res!493372) (not e!410839))))

(assert (= (and d!100003 c!80828) b!734271))

(assert (= (and d!100003 (not c!80828)) b!734267))

(assert (= (and b!734267 c!80827) b!734268))

(assert (= (and b!734267 (not c!80827)) b!734266))

(assert (= (and d!100003 c!80826) b!734270))

(assert (= (and d!100003 (not c!80826)) b!734272))

(assert (= (and b!734272 res!493372) b!734269))

(assert (= (and b!734269 (not res!493373)) b!734264))

(assert (= (and b!734264 (not res!493371)) b!734265))

(declare-fun m!686941 () Bool)

(assert (=> b!734269 m!686941))

(declare-fun m!686943 () Bool)

(assert (=> d!100003 m!686943))

(assert (=> d!100003 m!686793))

(assert (=> b!734264 m!686941))

(assert (=> b!734265 m!686941))

(assert (=> b!734266 m!686801))

(assert (=> b!734266 m!686801))

(declare-fun m!686945 () Bool)

(assert (=> b!734266 m!686945))

(assert (=> b!734055 d!100003))

(declare-fun b!734273 () Bool)

(declare-fun lt!325434 () SeekEntryResult!7349)

(assert (=> b!734273 (and (bvsge (index!31766 lt!325434) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325434) (size!20170 lt!325339)))))

(declare-fun res!493374 () Bool)

(assert (=> b!734273 (= res!493374 (= (select (arr!19749 lt!325339) (index!31766 lt!325434)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410845 () Bool)

(assert (=> b!734273 (=> res!493374 e!410845)))

(declare-fun b!734274 () Bool)

(assert (=> b!734274 (and (bvsge (index!31766 lt!325434) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325434) (size!20170 lt!325339)))))

(assert (=> b!734274 (= e!410845 (= (select (arr!19749 lt!325339) (index!31766 lt!325434)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100013 () Bool)

(declare-fun e!410847 () Bool)

(assert (=> d!100013 e!410847))

(declare-fun c!80829 () Bool)

(assert (=> d!100013 (= c!80829 (and (is-Intermediate!7349 lt!325434) (undefined!8161 lt!325434)))))

(declare-fun e!410848 () SeekEntryResult!7349)

(assert (=> d!100013 (= lt!325434 e!410848)))

(declare-fun c!80831 () Bool)

(assert (=> d!100013 (= c!80831 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!325435 () (_ BitVec 64))

(assert (=> d!100013 (= lt!325435 (select (arr!19749 lt!325339) (toIndex!0 lt!325333 mask!3328)))))

(assert (=> d!100013 (validMask!0 mask!3328)))

(assert (=> d!100013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325333 mask!3328) lt!325333 lt!325339 mask!3328) lt!325434)))

(declare-fun e!410846 () SeekEntryResult!7349)

(declare-fun b!734275 () Bool)

(assert (=> b!734275 (= e!410846 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!325333 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!325333 lt!325339 mask!3328))))

(declare-fun b!734276 () Bool)

(assert (=> b!734276 (= e!410848 e!410846)))

(declare-fun c!80830 () Bool)

(assert (=> b!734276 (= c!80830 (or (= lt!325435 lt!325333) (= (bvadd lt!325435 lt!325435) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734277 () Bool)

(assert (=> b!734277 (= e!410846 (Intermediate!7349 false (toIndex!0 lt!325333 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734278 () Bool)

(assert (=> b!734278 (and (bvsge (index!31766 lt!325434) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325434) (size!20170 lt!325339)))))

(declare-fun res!493376 () Bool)

(assert (=> b!734278 (= res!493376 (= (select (arr!19749 lt!325339) (index!31766 lt!325434)) lt!325333))))

(assert (=> b!734278 (=> res!493376 e!410845)))

(declare-fun e!410844 () Bool)

(assert (=> b!734278 (= e!410844 e!410845)))

(declare-fun b!734279 () Bool)

(assert (=> b!734279 (= e!410847 (bvsge (x!62767 lt!325434) #b01111111111111111111111111111110))))

(declare-fun b!734280 () Bool)

(assert (=> b!734280 (= e!410848 (Intermediate!7349 true (toIndex!0 lt!325333 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734281 () Bool)

(assert (=> b!734281 (= e!410847 e!410844)))

(declare-fun res!493375 () Bool)

(assert (=> b!734281 (= res!493375 (and (is-Intermediate!7349 lt!325434) (not (undefined!8161 lt!325434)) (bvslt (x!62767 lt!325434) #b01111111111111111111111111111110) (bvsge (x!62767 lt!325434) #b00000000000000000000000000000000) (bvsge (x!62767 lt!325434) #b00000000000000000000000000000000)))))

(assert (=> b!734281 (=> (not res!493375) (not e!410844))))

(assert (= (and d!100013 c!80831) b!734280))

(assert (= (and d!100013 (not c!80831)) b!734276))

(assert (= (and b!734276 c!80830) b!734277))

(assert (= (and b!734276 (not c!80830)) b!734275))

(assert (= (and d!100013 c!80829) b!734279))

(assert (= (and d!100013 (not c!80829)) b!734281))

(assert (= (and b!734281 res!493375) b!734278))

(assert (= (and b!734278 (not res!493376)) b!734273))

(assert (= (and b!734273 (not res!493374)) b!734274))

(declare-fun m!686947 () Bool)

(assert (=> b!734278 m!686947))

(assert (=> d!100013 m!686775))

(declare-fun m!686949 () Bool)

(assert (=> d!100013 m!686949))

(assert (=> d!100013 m!686793))

(assert (=> b!734273 m!686947))

(assert (=> b!734274 m!686947))

(assert (=> b!734275 m!686775))

(declare-fun m!686951 () Bool)

(assert (=> b!734275 m!686951))

(assert (=> b!734275 m!686951))

(declare-fun m!686953 () Bool)

(assert (=> b!734275 m!686953))

(assert (=> b!734055 d!100013))

(declare-fun d!100015 () Bool)

(declare-fun lt!325441 () (_ BitVec 32))

(declare-fun lt!325440 () (_ BitVec 32))

(assert (=> d!100015 (= lt!325441 (bvmul (bvxor lt!325440 (bvlshr lt!325440 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100015 (= lt!325440 ((_ extract 31 0) (bvand (bvxor lt!325333 (bvlshr lt!325333 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100015 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493377 (let ((h!14820 ((_ extract 31 0) (bvand (bvxor lt!325333 (bvlshr lt!325333 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62774 (bvmul (bvxor h!14820 (bvlshr h!14820 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62774 (bvlshr x!62774 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493377 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493377 #b00000000000000000000000000000000))))))

(assert (=> d!100015 (= (toIndex!0 lt!325333 mask!3328) (bvand (bvxor lt!325441 (bvlshr lt!325441 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!734055 d!100015))

(declare-fun b!734334 () Bool)

(declare-fun e!410878 () SeekEntryResult!7349)

(assert (=> b!734334 (= e!410878 Undefined!7349)))

(declare-fun b!734335 () Bool)

(declare-fun e!410877 () SeekEntryResult!7349)

(assert (=> b!734335 (= e!410877 (Found!7349 resIntermediateIndex!5))))

(declare-fun b!734336 () Bool)

(declare-fun e!410879 () SeekEntryResult!7349)

(assert (=> b!734336 (= e!410879 (MissingVacant!7349 resIntermediateIndex!5))))

(declare-fun b!734337 () Bool)

(assert (=> b!734337 (= e!410879 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19749 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100019 () Bool)

(declare-fun lt!325458 () SeekEntryResult!7349)

(assert (=> d!100019 (and (or (is-Undefined!7349 lt!325458) (not (is-Found!7349 lt!325458)) (and (bvsge (index!31765 lt!325458) #b00000000000000000000000000000000) (bvslt (index!31765 lt!325458) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325458) (is-Found!7349 lt!325458) (not (is-MissingVacant!7349 lt!325458)) (not (= (index!31767 lt!325458) resIntermediateIndex!5)) (and (bvsge (index!31767 lt!325458) #b00000000000000000000000000000000) (bvslt (index!31767 lt!325458) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325458) (ite (is-Found!7349 lt!325458) (= (select (arr!19749 a!3186) (index!31765 lt!325458)) (select (arr!19749 a!3186) j!159)) (and (is-MissingVacant!7349 lt!325458) (= (index!31767 lt!325458) resIntermediateIndex!5) (= (select (arr!19749 a!3186) (index!31767 lt!325458)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100019 (= lt!325458 e!410878)))

(declare-fun c!80852 () Bool)

(assert (=> d!100019 (= c!80852 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!325459 () (_ BitVec 64))

(assert (=> d!100019 (= lt!325459 (select (arr!19749 a!3186) resIntermediateIndex!5))))

(assert (=> d!100019 (validMask!0 mask!3328)))

(assert (=> d!100019 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325458)))

(declare-fun b!734338 () Bool)

(assert (=> b!734338 (= e!410878 e!410877)))

(declare-fun c!80854 () Bool)

(assert (=> b!734338 (= c!80854 (= lt!325459 (select (arr!19749 a!3186) j!159)))))

(declare-fun b!734339 () Bool)

(declare-fun c!80853 () Bool)

(assert (=> b!734339 (= c!80853 (= lt!325459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734339 (= e!410877 e!410879)))

(assert (= (and d!100019 c!80852) b!734334))

(assert (= (and d!100019 (not c!80852)) b!734338))

(assert (= (and b!734338 c!80854) b!734335))

(assert (= (and b!734338 (not c!80854)) b!734339))

(assert (= (and b!734339 c!80853) b!734336))

(assert (= (and b!734339 (not c!80853)) b!734337))

(declare-fun m!686969 () Bool)

(assert (=> b!734337 m!686969))

(assert (=> b!734337 m!686969))

(assert (=> b!734337 m!686765))

(declare-fun m!686971 () Bool)

(assert (=> b!734337 m!686971))

(declare-fun m!686973 () Bool)

(assert (=> d!100019 m!686973))

(declare-fun m!686975 () Bool)

(assert (=> d!100019 m!686975))

(assert (=> d!100019 m!686773))

(assert (=> d!100019 m!686793))

(assert (=> b!734056 d!100019))

(declare-fun b!734432 () Bool)

(declare-fun e!410933 () SeekEntryResult!7349)

(declare-fun lt!325499 () SeekEntryResult!7349)

(assert (=> b!734432 (= e!410933 (MissingZero!7349 (index!31766 lt!325499)))))

(declare-fun b!734433 () Bool)

(assert (=> b!734433 (= e!410933 (seekKeyOrZeroReturnVacant!0 (x!62767 lt!325499) (index!31766 lt!325499) (index!31766 lt!325499) k!2102 a!3186 mask!3328))))

(declare-fun b!734434 () Bool)

(declare-fun c!80892 () Bool)

(declare-fun lt!325501 () (_ BitVec 64))

(assert (=> b!734434 (= c!80892 (= lt!325501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410934 () SeekEntryResult!7349)

(assert (=> b!734434 (= e!410934 e!410933)))

(declare-fun d!100027 () Bool)

(declare-fun lt!325500 () SeekEntryResult!7349)

(assert (=> d!100027 (and (or (is-Undefined!7349 lt!325500) (not (is-Found!7349 lt!325500)) (and (bvsge (index!31765 lt!325500) #b00000000000000000000000000000000) (bvslt (index!31765 lt!325500) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325500) (is-Found!7349 lt!325500) (not (is-MissingZero!7349 lt!325500)) (and (bvsge (index!31764 lt!325500) #b00000000000000000000000000000000) (bvslt (index!31764 lt!325500) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325500) (is-Found!7349 lt!325500) (is-MissingZero!7349 lt!325500) (not (is-MissingVacant!7349 lt!325500)) (and (bvsge (index!31767 lt!325500) #b00000000000000000000000000000000) (bvslt (index!31767 lt!325500) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325500) (ite (is-Found!7349 lt!325500) (= (select (arr!19749 a!3186) (index!31765 lt!325500)) k!2102) (ite (is-MissingZero!7349 lt!325500) (= (select (arr!19749 a!3186) (index!31764 lt!325500)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7349 lt!325500) (= (select (arr!19749 a!3186) (index!31767 lt!325500)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!410932 () SeekEntryResult!7349)

(assert (=> d!100027 (= lt!325500 e!410932)))

(declare-fun c!80893 () Bool)

(assert (=> d!100027 (= c!80893 (and (is-Intermediate!7349 lt!325499) (undefined!8161 lt!325499)))))

(assert (=> d!100027 (= lt!325499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100027 (validMask!0 mask!3328)))

(assert (=> d!100027 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!325500)))

(declare-fun b!734435 () Bool)

(assert (=> b!734435 (= e!410932 e!410934)))

(assert (=> b!734435 (= lt!325501 (select (arr!19749 a!3186) (index!31766 lt!325499)))))

(declare-fun c!80894 () Bool)

(assert (=> b!734435 (= c!80894 (= lt!325501 k!2102))))

(declare-fun b!734436 () Bool)

(assert (=> b!734436 (= e!410934 (Found!7349 (index!31766 lt!325499)))))

(declare-fun b!734437 () Bool)

(assert (=> b!734437 (= e!410932 Undefined!7349)))

(assert (= (and d!100027 c!80893) b!734437))

(assert (= (and d!100027 (not c!80893)) b!734435))

(assert (= (and b!734435 c!80894) b!734436))

(assert (= (and b!734435 (not c!80894)) b!734434))

(assert (= (and b!734434 c!80892) b!734432))

(assert (= (and b!734434 (not c!80892)) b!734433))

(declare-fun m!687033 () Bool)

(assert (=> b!734433 m!687033))

(declare-fun m!687035 () Bool)

(assert (=> d!100027 m!687035))

(declare-fun m!687037 () Bool)

(assert (=> d!100027 m!687037))

(assert (=> d!100027 m!687035))

(assert (=> d!100027 m!686793))

(declare-fun m!687039 () Bool)

(assert (=> d!100027 m!687039))

(declare-fun m!687041 () Bool)

(assert (=> d!100027 m!687041))

(declare-fun m!687043 () Bool)

(assert (=> d!100027 m!687043))

(declare-fun m!687045 () Bool)

(assert (=> b!734435 m!687045))

(assert (=> b!734045 d!100027))

(declare-fun b!734438 () Bool)

(declare-fun lt!325502 () SeekEntryResult!7349)

(assert (=> b!734438 (and (bvsge (index!31766 lt!325502) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325502) (size!20170 a!3186)))))

(declare-fun res!493409 () Bool)

(assert (=> b!734438 (= res!493409 (= (select (arr!19749 a!3186) (index!31766 lt!325502)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410936 () Bool)

(assert (=> b!734438 (=> res!493409 e!410936)))

(declare-fun b!734439 () Bool)

(assert (=> b!734439 (and (bvsge (index!31766 lt!325502) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325502) (size!20170 a!3186)))))

(assert (=> b!734439 (= e!410936 (= (select (arr!19749 a!3186) (index!31766 lt!325502)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100049 () Bool)

(declare-fun e!410938 () Bool)

(assert (=> d!100049 e!410938))

(declare-fun c!80895 () Bool)

(assert (=> d!100049 (= c!80895 (and (is-Intermediate!7349 lt!325502) (undefined!8161 lt!325502)))))

(declare-fun e!410939 () SeekEntryResult!7349)

(assert (=> d!100049 (= lt!325502 e!410939)))

(declare-fun c!80897 () Bool)

(assert (=> d!100049 (= c!80897 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325503 () (_ BitVec 64))

(assert (=> d!100049 (= lt!325503 (select (arr!19749 a!3186) index!1321))))

(assert (=> d!100049 (validMask!0 mask!3328)))

(assert (=> d!100049 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325502)))

(declare-fun e!410937 () SeekEntryResult!7349)

(declare-fun b!734440 () Bool)

(assert (=> b!734440 (= e!410937 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19749 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734441 () Bool)

(assert (=> b!734441 (= e!410939 e!410937)))

(declare-fun c!80896 () Bool)

(assert (=> b!734441 (= c!80896 (or (= lt!325503 (select (arr!19749 a!3186) j!159)) (= (bvadd lt!325503 lt!325503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734442 () Bool)

(assert (=> b!734442 (= e!410937 (Intermediate!7349 false index!1321 x!1131))))

(declare-fun b!734443 () Bool)

(assert (=> b!734443 (and (bvsge (index!31766 lt!325502) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325502) (size!20170 a!3186)))))

(declare-fun res!493411 () Bool)

(assert (=> b!734443 (= res!493411 (= (select (arr!19749 a!3186) (index!31766 lt!325502)) (select (arr!19749 a!3186) j!159)))))

(assert (=> b!734443 (=> res!493411 e!410936)))

(declare-fun e!410935 () Bool)

(assert (=> b!734443 (= e!410935 e!410936)))

(declare-fun b!734444 () Bool)

(assert (=> b!734444 (= e!410938 (bvsge (x!62767 lt!325502) #b01111111111111111111111111111110))))

(declare-fun b!734445 () Bool)

(assert (=> b!734445 (= e!410939 (Intermediate!7349 true index!1321 x!1131))))

(declare-fun b!734446 () Bool)

(assert (=> b!734446 (= e!410938 e!410935)))

(declare-fun res!493410 () Bool)

(assert (=> b!734446 (= res!493410 (and (is-Intermediate!7349 lt!325502) (not (undefined!8161 lt!325502)) (bvslt (x!62767 lt!325502) #b01111111111111111111111111111110) (bvsge (x!62767 lt!325502) #b00000000000000000000000000000000) (bvsge (x!62767 lt!325502) x!1131)))))

(assert (=> b!734446 (=> (not res!493410) (not e!410935))))

(assert (= (and d!100049 c!80897) b!734445))

(assert (= (and d!100049 (not c!80897)) b!734441))

(assert (= (and b!734441 c!80896) b!734442))

(assert (= (and b!734441 (not c!80896)) b!734440))

(assert (= (and d!100049 c!80895) b!734444))

(assert (= (and d!100049 (not c!80895)) b!734446))

(assert (= (and b!734446 res!493410) b!734443))

(assert (= (and b!734443 (not res!493411)) b!734438))

(assert (= (and b!734438 (not res!493409)) b!734439))

(declare-fun m!687047 () Bool)

(assert (=> b!734443 m!687047))

(declare-fun m!687049 () Bool)

(assert (=> d!100049 m!687049))

(assert (=> d!100049 m!686793))

(assert (=> b!734438 m!687047))

(assert (=> b!734439 m!687047))

(assert (=> b!734440 m!686801))

(assert (=> b!734440 m!686801))

(assert (=> b!734440 m!686765))

(declare-fun m!687051 () Bool)

(assert (=> b!734440 m!687051))

(assert (=> b!734054 d!100049))

(declare-fun b!734457 () Bool)

(declare-fun lt!325507 () SeekEntryResult!7349)

(assert (=> b!734457 (and (bvsge (index!31766 lt!325507) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325507) (size!20170 a!3186)))))

(declare-fun res!493416 () Bool)

(assert (=> b!734457 (= res!493416 (= (select (arr!19749 a!3186) (index!31766 lt!325507)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410948 () Bool)

(assert (=> b!734457 (=> res!493416 e!410948)))

(declare-fun b!734458 () Bool)

(assert (=> b!734458 (and (bvsge (index!31766 lt!325507) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325507) (size!20170 a!3186)))))

(assert (=> b!734458 (= e!410948 (= (select (arr!19749 a!3186) (index!31766 lt!325507)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100051 () Bool)

(declare-fun e!410950 () Bool)

(assert (=> d!100051 e!410950))

(declare-fun c!80901 () Bool)

(assert (=> d!100051 (= c!80901 (and (is-Intermediate!7349 lt!325507) (undefined!8161 lt!325507)))))

(declare-fun e!410951 () SeekEntryResult!7349)

(assert (=> d!100051 (= lt!325507 e!410951)))

(declare-fun c!80903 () Bool)

(assert (=> d!100051 (= c!80903 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!325508 () (_ BitVec 64))

(assert (=> d!100051 (= lt!325508 (select (arr!19749 a!3186) (toIndex!0 (select (arr!19749 a!3186) j!159) mask!3328)))))

(assert (=> d!100051 (validMask!0 mask!3328)))

(assert (=> d!100051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19749 a!3186) j!159) mask!3328) (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325507)))

(declare-fun b!734459 () Bool)

(declare-fun e!410949 () SeekEntryResult!7349)

(assert (=> b!734459 (= e!410949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19749 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19749 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734460 () Bool)

(assert (=> b!734460 (= e!410951 e!410949)))

(declare-fun c!80902 () Bool)

(assert (=> b!734460 (= c!80902 (or (= lt!325508 (select (arr!19749 a!3186) j!159)) (= (bvadd lt!325508 lt!325508) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734461 () Bool)

(assert (=> b!734461 (= e!410949 (Intermediate!7349 false (toIndex!0 (select (arr!19749 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734462 () Bool)

(assert (=> b!734462 (and (bvsge (index!31766 lt!325507) #b00000000000000000000000000000000) (bvslt (index!31766 lt!325507) (size!20170 a!3186)))))

(declare-fun res!493418 () Bool)

(assert (=> b!734462 (= res!493418 (= (select (arr!19749 a!3186) (index!31766 lt!325507)) (select (arr!19749 a!3186) j!159)))))

(assert (=> b!734462 (=> res!493418 e!410948)))

(declare-fun e!410947 () Bool)

(assert (=> b!734462 (= e!410947 e!410948)))

(declare-fun b!734463 () Bool)

(assert (=> b!734463 (= e!410950 (bvsge (x!62767 lt!325507) #b01111111111111111111111111111110))))

(declare-fun b!734464 () Bool)

(assert (=> b!734464 (= e!410951 (Intermediate!7349 true (toIndex!0 (select (arr!19749 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734465 () Bool)

(assert (=> b!734465 (= e!410950 e!410947)))

(declare-fun res!493417 () Bool)

(assert (=> b!734465 (= res!493417 (and (is-Intermediate!7349 lt!325507) (not (undefined!8161 lt!325507)) (bvslt (x!62767 lt!325507) #b01111111111111111111111111111110) (bvsge (x!62767 lt!325507) #b00000000000000000000000000000000) (bvsge (x!62767 lt!325507) #b00000000000000000000000000000000)))))

(assert (=> b!734465 (=> (not res!493417) (not e!410947))))

(assert (= (and d!100051 c!80903) b!734464))

(assert (= (and d!100051 (not c!80903)) b!734460))

(assert (= (and b!734460 c!80902) b!734461))

(assert (= (and b!734460 (not c!80902)) b!734459))

(assert (= (and d!100051 c!80901) b!734463))

(assert (= (and d!100051 (not c!80901)) b!734465))

(assert (= (and b!734465 res!493417) b!734462))

(assert (= (and b!734462 (not res!493418)) b!734457))

(assert (= (and b!734457 (not res!493416)) b!734458))

(declare-fun m!687067 () Bool)

(assert (=> b!734462 m!687067))

(assert (=> d!100051 m!686785))

(declare-fun m!687069 () Bool)

(assert (=> d!100051 m!687069))

(assert (=> d!100051 m!686793))

(assert (=> b!734457 m!687067))

(assert (=> b!734458 m!687067))

(assert (=> b!734459 m!686785))

(declare-fun m!687071 () Bool)

(assert (=> b!734459 m!687071))

(assert (=> b!734459 m!687071))

(assert (=> b!734459 m!686765))

(declare-fun m!687075 () Bool)

(assert (=> b!734459 m!687075))

(assert (=> b!734063 d!100051))

(declare-fun d!100055 () Bool)

(declare-fun lt!325510 () (_ BitVec 32))

(declare-fun lt!325509 () (_ BitVec 32))

(assert (=> d!100055 (= lt!325510 (bvmul (bvxor lt!325509 (bvlshr lt!325509 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100055 (= lt!325509 ((_ extract 31 0) (bvand (bvxor (select (arr!19749 a!3186) j!159) (bvlshr (select (arr!19749 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100055 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493377 (let ((h!14820 ((_ extract 31 0) (bvand (bvxor (select (arr!19749 a!3186) j!159) (bvlshr (select (arr!19749 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62774 (bvmul (bvxor h!14820 (bvlshr h!14820 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62774 (bvlshr x!62774 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493377 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493377 #b00000000000000000000000000000000))))))

(assert (=> d!100055 (= (toIndex!0 (select (arr!19749 a!3186) j!159) mask!3328) (bvand (bvxor lt!325510 (bvlshr lt!325510 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!734063 d!100055))

(declare-fun b!734468 () Bool)

(declare-fun e!410955 () SeekEntryResult!7349)

(declare-fun lt!325511 () SeekEntryResult!7349)

(assert (=> b!734468 (= e!410955 (MissingZero!7349 (index!31766 lt!325511)))))

(declare-fun b!734469 () Bool)

(assert (=> b!734469 (= e!410955 (seekKeyOrZeroReturnVacant!0 (x!62767 lt!325511) (index!31766 lt!325511) (index!31766 lt!325511) (select (arr!19749 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734470 () Bool)

(declare-fun c!80904 () Bool)

(declare-fun lt!325513 () (_ BitVec 64))

(assert (=> b!734470 (= c!80904 (= lt!325513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410956 () SeekEntryResult!7349)

(assert (=> b!734470 (= e!410956 e!410955)))

(declare-fun d!100057 () Bool)

(declare-fun lt!325512 () SeekEntryResult!7349)

(assert (=> d!100057 (and (or (is-Undefined!7349 lt!325512) (not (is-Found!7349 lt!325512)) (and (bvsge (index!31765 lt!325512) #b00000000000000000000000000000000) (bvslt (index!31765 lt!325512) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325512) (is-Found!7349 lt!325512) (not (is-MissingZero!7349 lt!325512)) (and (bvsge (index!31764 lt!325512) #b00000000000000000000000000000000) (bvslt (index!31764 lt!325512) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325512) (is-Found!7349 lt!325512) (is-MissingZero!7349 lt!325512) (not (is-MissingVacant!7349 lt!325512)) (and (bvsge (index!31767 lt!325512) #b00000000000000000000000000000000) (bvslt (index!31767 lt!325512) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325512) (ite (is-Found!7349 lt!325512) (= (select (arr!19749 a!3186) (index!31765 lt!325512)) (select (arr!19749 a!3186) j!159)) (ite (is-MissingZero!7349 lt!325512) (= (select (arr!19749 a!3186) (index!31764 lt!325512)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7349 lt!325512) (= (select (arr!19749 a!3186) (index!31767 lt!325512)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!410954 () SeekEntryResult!7349)

(assert (=> d!100057 (= lt!325512 e!410954)))

(declare-fun c!80905 () Bool)

(assert (=> d!100057 (= c!80905 (and (is-Intermediate!7349 lt!325511) (undefined!8161 lt!325511)))))

(assert (=> d!100057 (= lt!325511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19749 a!3186) j!159) mask!3328) (select (arr!19749 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100057 (validMask!0 mask!3328)))

(assert (=> d!100057 (= (seekEntryOrOpen!0 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325512)))

(declare-fun b!734471 () Bool)

(assert (=> b!734471 (= e!410954 e!410956)))

(assert (=> b!734471 (= lt!325513 (select (arr!19749 a!3186) (index!31766 lt!325511)))))

(declare-fun c!80906 () Bool)

(assert (=> b!734471 (= c!80906 (= lt!325513 (select (arr!19749 a!3186) j!159)))))

(declare-fun b!734472 () Bool)

(assert (=> b!734472 (= e!410956 (Found!7349 (index!31766 lt!325511)))))

(declare-fun b!734473 () Bool)

(assert (=> b!734473 (= e!410954 Undefined!7349)))

(assert (= (and d!100057 c!80905) b!734473))

(assert (= (and d!100057 (not c!80905)) b!734471))

(assert (= (and b!734471 c!80906) b!734472))

(assert (= (and b!734471 (not c!80906)) b!734470))

(assert (= (and b!734470 c!80904) b!734468))

(assert (= (and b!734470 (not c!80904)) b!734469))

(assert (=> b!734469 m!686765))

(declare-fun m!687077 () Bool)

(assert (=> b!734469 m!687077))

(assert (=> d!100057 m!686785))

(assert (=> d!100057 m!686765))

(assert (=> d!100057 m!686787))

(assert (=> d!100057 m!686765))

(assert (=> d!100057 m!686785))

(assert (=> d!100057 m!686793))

(declare-fun m!687079 () Bool)

(assert (=> d!100057 m!687079))

(declare-fun m!687081 () Bool)

(assert (=> d!100057 m!687081))

(declare-fun m!687083 () Bool)

(assert (=> d!100057 m!687083))

(declare-fun m!687085 () Bool)

(assert (=> b!734471 m!687085))

(assert (=> b!734064 d!100057))

(declare-fun b!734484 () Bool)

(declare-fun e!410968 () Bool)

(declare-fun contains!4061 (List!13751 (_ BitVec 64)) Bool)

(assert (=> b!734484 (= e!410968 (contains!4061 Nil!13748 (select (arr!19749 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734485 () Bool)

(declare-fun e!410966 () Bool)

(declare-fun call!34900 () Bool)

(assert (=> b!734485 (= e!410966 call!34900)))

(declare-fun b!734487 () Bool)

(declare-fun e!410967 () Bool)

(declare-fun e!410965 () Bool)

(assert (=> b!734487 (= e!410967 e!410965)))

(declare-fun res!493429 () Bool)

(assert (=> b!734487 (=> (not res!493429) (not e!410965))))

(assert (=> b!734487 (= res!493429 (not e!410968))))

(declare-fun res!493428 () Bool)

(assert (=> b!734487 (=> (not res!493428) (not e!410968))))

(assert (=> b!734487 (= res!493428 (validKeyInArray!0 (select (arr!19749 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734488 () Bool)

(assert (=> b!734488 (= e!410965 e!410966)))

(declare-fun c!80909 () Bool)

(assert (=> b!734488 (= c!80909 (validKeyInArray!0 (select (arr!19749 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34897 () Bool)

(assert (=> bm!34897 (= call!34900 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80909 (Cons!13747 (select (arr!19749 a!3186) #b00000000000000000000000000000000) Nil!13748) Nil!13748)))))

(declare-fun d!100059 () Bool)

(declare-fun res!493427 () Bool)

(assert (=> d!100059 (=> res!493427 e!410967)))

(assert (=> d!100059 (= res!493427 (bvsge #b00000000000000000000000000000000 (size!20170 a!3186)))))

(assert (=> d!100059 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13748) e!410967)))

(declare-fun b!734486 () Bool)

(assert (=> b!734486 (= e!410966 call!34900)))

(assert (= (and d!100059 (not res!493427)) b!734487))

(assert (= (and b!734487 res!493428) b!734484))

(assert (= (and b!734487 res!493429) b!734488))

(assert (= (and b!734488 c!80909) b!734485))

(assert (= (and b!734488 (not c!80909)) b!734486))

(assert (= (or b!734485 b!734486) bm!34897))

(declare-fun m!687087 () Bool)

(assert (=> b!734484 m!687087))

(assert (=> b!734484 m!687087))

(declare-fun m!687089 () Bool)

(assert (=> b!734484 m!687089))

(assert (=> b!734487 m!687087))

(assert (=> b!734487 m!687087))

(declare-fun m!687091 () Bool)

(assert (=> b!734487 m!687091))

(assert (=> b!734488 m!687087))

(assert (=> b!734488 m!687087))

(assert (=> b!734488 m!687091))

(assert (=> bm!34897 m!687087))

(declare-fun m!687093 () Bool)

(assert (=> bm!34897 m!687093))

(assert (=> b!734053 d!100059))

(declare-fun d!100061 () Bool)

(assert (=> d!100061 (= (validKeyInArray!0 (select (arr!19749 a!3186) j!159)) (and (not (= (select (arr!19749 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19749 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!734062 d!100061))

(declare-fun b!734489 () Bool)

(declare-fun e!410970 () SeekEntryResult!7349)

(assert (=> b!734489 (= e!410970 Undefined!7349)))

(declare-fun b!734490 () Bool)

(declare-fun e!410969 () SeekEntryResult!7349)

(assert (=> b!734490 (= e!410969 (Found!7349 index!1321))))

(declare-fun b!734491 () Bool)

(declare-fun e!410971 () SeekEntryResult!7349)

(assert (=> b!734491 (= e!410971 (MissingVacant!7349 resIntermediateIndex!5))))

(declare-fun b!734492 () Bool)

(assert (=> b!734492 (= e!410971 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19749 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!325514 () SeekEntryResult!7349)

(declare-fun d!100063 () Bool)

(assert (=> d!100063 (and (or (is-Undefined!7349 lt!325514) (not (is-Found!7349 lt!325514)) (and (bvsge (index!31765 lt!325514) #b00000000000000000000000000000000) (bvslt (index!31765 lt!325514) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325514) (is-Found!7349 lt!325514) (not (is-MissingVacant!7349 lt!325514)) (not (= (index!31767 lt!325514) resIntermediateIndex!5)) (and (bvsge (index!31767 lt!325514) #b00000000000000000000000000000000) (bvslt (index!31767 lt!325514) (size!20170 a!3186)))) (or (is-Undefined!7349 lt!325514) (ite (is-Found!7349 lt!325514) (= (select (arr!19749 a!3186) (index!31765 lt!325514)) (select (arr!19749 a!3186) j!159)) (and (is-MissingVacant!7349 lt!325514) (= (index!31767 lt!325514) resIntermediateIndex!5) (= (select (arr!19749 a!3186) (index!31767 lt!325514)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100063 (= lt!325514 e!410970)))

(declare-fun c!80910 () Bool)

(assert (=> d!100063 (= c!80910 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325515 () (_ BitVec 64))

(assert (=> d!100063 (= lt!325515 (select (arr!19749 a!3186) index!1321))))

(assert (=> d!100063 (validMask!0 mask!3328)))

(assert (=> d!100063 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) lt!325514)))

(declare-fun b!734493 () Bool)

(assert (=> b!734493 (= e!410970 e!410969)))

(declare-fun c!80912 () Bool)

(assert (=> b!734493 (= c!80912 (= lt!325515 (select (arr!19749 a!3186) j!159)))))

(declare-fun b!734494 () Bool)

(declare-fun c!80911 () Bool)

(assert (=> b!734494 (= c!80911 (= lt!325515 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734494 (= e!410969 e!410971)))

(assert (= (and d!100063 c!80910) b!734489))

(assert (= (and d!100063 (not c!80910)) b!734493))

(assert (= (and b!734493 c!80912) b!734490))

(assert (= (and b!734493 (not c!80912)) b!734494))

(assert (= (and b!734494 c!80911) b!734491))

(assert (= (and b!734494 (not c!80911)) b!734492))

(assert (=> b!734492 m!686801))

(assert (=> b!734492 m!686801))

(assert (=> b!734492 m!686765))

(declare-fun m!687095 () Bool)

(assert (=> b!734492 m!687095))

(declare-fun m!687097 () Bool)

(assert (=> d!100063 m!687097))

(declare-fun m!687099 () Bool)

(assert (=> d!100063 m!687099))

(assert (=> d!100063 m!687049))

(assert (=> d!100063 m!686793))

(assert (=> b!734051 d!100063))

(declare-fun d!100065 () Bool)

(assert (=> d!100065 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65026 d!100065))

(declare-fun d!100073 () Bool)

(assert (=> d!100073 (= (array_inv!15545 a!3186) (bvsge (size!20170 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65026 d!100073))

(declare-fun d!100075 () Bool)

(declare-fun res!493443 () Bool)

(declare-fun e!411001 () Bool)

(assert (=> d!100075 (=> res!493443 e!411001)))

(assert (=> d!100075 (= res!493443 (= (select (arr!19749 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100075 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!411001)))

(declare-fun b!734542 () Bool)

(declare-fun e!411002 () Bool)

(assert (=> b!734542 (= e!411001 e!411002)))

(declare-fun res!493444 () Bool)

(assert (=> b!734542 (=> (not res!493444) (not e!411002))))

(assert (=> b!734542 (= res!493444 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20170 a!3186)))))

(declare-fun b!734543 () Bool)

(assert (=> b!734543 (= e!411002 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100075 (not res!493443)) b!734542))

(assert (= (and b!734542 res!493444) b!734543))

(assert (=> d!100075 m!687087))

(declare-fun m!687121 () Bool)

(assert (=> b!734543 m!687121))

(assert (=> b!734059 d!100075))

(declare-fun b!734565 () Bool)

(declare-fun e!411021 () Bool)

(declare-fun call!34908 () Bool)

(assert (=> b!734565 (= e!411021 call!34908)))

(declare-fun d!100077 () Bool)

(declare-fun res!493457 () Bool)

(declare-fun e!411019 () Bool)

(assert (=> d!100077 (=> res!493457 e!411019)))

(assert (=> d!100077 (= res!493457 (bvsge j!159 (size!20170 a!3186)))))

(assert (=> d!100077 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!411019)))

(declare-fun b!734566 () Bool)

(declare-fun e!411020 () Bool)

(assert (=> b!734566 (= e!411020 e!411021)))

(declare-fun lt!325539 () (_ BitVec 64))

(assert (=> b!734566 (= lt!325539 (select (arr!19749 a!3186) j!159))))

(declare-fun lt!325540 () Unit!25016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41268 (_ BitVec 64) (_ BitVec 32)) Unit!25016)

(assert (=> b!734566 (= lt!325540 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325539 j!159))))

(assert (=> b!734566 (arrayContainsKey!0 a!3186 lt!325539 #b00000000000000000000000000000000)))

(declare-fun lt!325538 () Unit!25016)

(assert (=> b!734566 (= lt!325538 lt!325540)))

(declare-fun res!493456 () Bool)

(assert (=> b!734566 (= res!493456 (= (seekEntryOrOpen!0 (select (arr!19749 a!3186) j!159) a!3186 mask!3328) (Found!7349 j!159)))))

(assert (=> b!734566 (=> (not res!493456) (not e!411021))))

(declare-fun b!734567 () Bool)

(assert (=> b!734567 (= e!411020 call!34908)))

(declare-fun b!734568 () Bool)

(assert (=> b!734568 (= e!411019 e!411020)))

(declare-fun c!80935 () Bool)

(assert (=> b!734568 (= c!80935 (validKeyInArray!0 (select (arr!19749 a!3186) j!159)))))

(declare-fun bm!34905 () Bool)

(assert (=> bm!34905 (= call!34908 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!100077 (not res!493457)) b!734568))

(assert (= (and b!734568 c!80935) b!734566))

(assert (= (and b!734568 (not c!80935)) b!734567))

(assert (= (and b!734566 res!493456) b!734565))

(assert (= (or b!734565 b!734567) bm!34905))

(assert (=> b!734566 m!686765))

(declare-fun m!687131 () Bool)

(assert (=> b!734566 m!687131))

(declare-fun m!687133 () Bool)

(assert (=> b!734566 m!687133))

(assert (=> b!734566 m!686765))

(assert (=> b!734566 m!686805))

(assert (=> b!734568 m!686765))

(assert (=> b!734568 m!686765))

(assert (=> b!734568 m!686791))

(declare-fun m!687135 () Bool)

(assert (=> bm!34905 m!687135))

(assert (=> b!734060 d!100077))

(declare-fun d!100081 () Bool)

(assert (=> d!100081 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!325546 () Unit!25016)

(declare-fun choose!38 (array!41268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25016)

(assert (=> d!100081 (= lt!325546 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100081 (validMask!0 mask!3328)))

(assert (=> d!100081 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!325546)))

(declare-fun bs!20982 () Bool)

(assert (= bs!20982 d!100081))

(assert (=> bs!20982 m!686761))

(declare-fun m!687143 () Bool)

(assert (=> bs!20982 m!687143))

(assert (=> bs!20982 m!686793))

(assert (=> b!734060 d!100081))

(assert (=> b!734049 d!100063))

(declare-fun b!734573 () Bool)

(declare-fun e!411027 () Bool)

(declare-fun call!34910 () Bool)

(assert (=> b!734573 (= e!411027 call!34910)))

(declare-fun d!100085 () Bool)

(declare-fun res!493461 () Bool)

(declare-fun e!411025 () Bool)

(assert (=> d!100085 (=> res!493461 e!411025)))

(assert (=> d!100085 (= res!493461 (bvsge #b00000000000000000000000000000000 (size!20170 a!3186)))))

(assert (=> d!100085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!411025)))

(declare-fun b!734574 () Bool)

(declare-fun e!411026 () Bool)

(assert (=> b!734574 (= e!411026 e!411027)))

(declare-fun lt!325548 () (_ BitVec 64))

(assert (=> b!734574 (= lt!325548 (select (arr!19749 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!325549 () Unit!25016)

(assert (=> b!734574 (= lt!325549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325548 #b00000000000000000000000000000000))))

(assert (=> b!734574 (arrayContainsKey!0 a!3186 lt!325548 #b00000000000000000000000000000000)))

(declare-fun lt!325547 () Unit!25016)

(assert (=> b!734574 (= lt!325547 lt!325549)))

(declare-fun res!493460 () Bool)

(assert (=> b!734574 (= res!493460 (= (seekEntryOrOpen!0 (select (arr!19749 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7349 #b00000000000000000000000000000000)))))

(assert (=> b!734574 (=> (not res!493460) (not e!411027))))

(declare-fun b!734575 () Bool)

(assert (=> b!734575 (= e!411026 call!34910)))

(declare-fun b!734576 () Bool)

(assert (=> b!734576 (= e!411025 e!411026)))

(declare-fun c!80937 () Bool)

(assert (=> b!734576 (= c!80937 (validKeyInArray!0 (select (arr!19749 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34907 () Bool)

(assert (=> bm!34907 (= call!34910 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!100085 (not res!493461)) b!734576))

(assert (= (and b!734576 c!80937) b!734574))

(assert (= (and b!734576 (not c!80937)) b!734575))

(assert (= (and b!734574 res!493460) b!734573))

(assert (= (or b!734573 b!734575) bm!34907))

(assert (=> b!734574 m!687087))

(declare-fun m!687145 () Bool)

(assert (=> b!734574 m!687145))

(declare-fun m!687147 () Bool)

(assert (=> b!734574 m!687147))

(assert (=> b!734574 m!687087))

(declare-fun m!687149 () Bool)

(assert (=> b!734574 m!687149))

(assert (=> b!734576 m!687087))

(assert (=> b!734576 m!687087))

(assert (=> b!734576 m!687091))

(declare-fun m!687151 () Bool)

(assert (=> bm!34907 m!687151))

(assert (=> b!734058 d!100085))

(declare-fun d!100087 () Bool)

(assert (=> d!100087 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!734047 d!100087))

(declare-fun d!100089 () Bool)

(declare-fun lt!325555 () (_ BitVec 32))

(assert (=> d!100089 (and (bvsge lt!325555 #b00000000000000000000000000000000) (bvslt lt!325555 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!100089 (= lt!325555 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!100089 (validMask!0 mask!3328)))

(assert (=> d!100089 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!325555)))

(declare-fun bs!20984 () Bool)

(assert (= bs!20984 d!100089))

(declare-fun m!687155 () Bool)

(assert (=> bs!20984 m!687155))

(assert (=> bs!20984 m!686793))

(assert (=> b!734046 d!100089))

(push 1)

