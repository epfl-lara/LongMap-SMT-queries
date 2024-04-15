; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46992 () Bool)

(assert start!46992)

(declare-fun b!518076 () Bool)

(declare-fun res!317239 () Bool)

(declare-fun e!302267 () Bool)

(assert (=> b!518076 (=> (not res!317239) (not e!302267))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518076 (= res!317239 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33143 0))(
  ( (array!33144 (arr!15935 (Array (_ BitVec 32) (_ BitVec 64))) (size!16300 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33143)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!302268 () Bool)

(declare-fun b!518077 () Bool)

(declare-datatypes ((SeekEntryResult!4399 0))(
  ( (MissingZero!4399 (index!19784 (_ BitVec 32))) (Found!4399 (index!19785 (_ BitVec 32))) (Intermediate!4399 (undefined!5211 Bool) (index!19786 (_ BitVec 32)) (x!48759 (_ BitVec 32))) (Undefined!4399) (MissingVacant!4399 (index!19787 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33143 (_ BitVec 32)) SeekEntryResult!4399)

(assert (=> b!518077 (= e!302268 (= (seekEntryOrOpen!0 (select (arr!15935 a!3235) j!176) a!3235 mask!3524) (Found!4399 j!176)))))

(declare-fun b!518078 () Bool)

(declare-datatypes ((Unit!16042 0))(
  ( (Unit!16043) )
))
(declare-fun e!302264 () Unit!16042)

(declare-fun Unit!16044 () Unit!16042)

(assert (=> b!518078 (= e!302264 Unit!16044)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!237069 () SeekEntryResult!4399)

(declare-fun lt!237074 () (_ BitVec 32))

(declare-fun lt!237073 () Unit!16042)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33143 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16042)

(assert (=> b!518078 (= lt!237073 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237074 #b00000000000000000000000000000000 (index!19786 lt!237069) (x!48759 lt!237069) mask!3524))))

(declare-fun lt!237072 () array!33143)

(declare-fun res!317232 () Bool)

(declare-fun lt!237068 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33143 (_ BitVec 32)) SeekEntryResult!4399)

(assert (=> b!518078 (= res!317232 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237074 lt!237068 lt!237072 mask!3524) (Intermediate!4399 false (index!19786 lt!237069) (x!48759 lt!237069))))))

(declare-fun e!302263 () Bool)

(assert (=> b!518078 (=> (not res!317232) (not e!302263))))

(assert (=> b!518078 e!302263))

(declare-fun b!518079 () Bool)

(declare-fun Unit!16045 () Unit!16042)

(assert (=> b!518079 (= e!302264 Unit!16045)))

(declare-fun b!518080 () Bool)

(declare-fun res!317240 () Bool)

(declare-fun e!302266 () Bool)

(assert (=> b!518080 (=> (not res!317240) (not e!302266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33143 (_ BitVec 32)) Bool)

(assert (=> b!518080 (= res!317240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!317238 () Bool)

(assert (=> start!46992 (=> (not res!317238) (not e!302267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46992 (= res!317238 (validMask!0 mask!3524))))

(assert (=> start!46992 e!302267))

(assert (=> start!46992 true))

(declare-fun array_inv!11818 (array!33143) Bool)

(assert (=> start!46992 (array_inv!11818 a!3235)))

(declare-fun b!518081 () Bool)

(declare-fun e!302265 () Bool)

(assert (=> b!518081 (= e!302266 (not e!302265))))

(declare-fun res!317237 () Bool)

(assert (=> b!518081 (=> res!317237 e!302265)))

(declare-fun lt!237071 () (_ BitVec 32))

(assert (=> b!518081 (= res!317237 (= lt!237069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237071 lt!237068 lt!237072 mask!3524)))))

(assert (=> b!518081 (= lt!237069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237074 (select (arr!15935 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518081 (= lt!237071 (toIndex!0 lt!237068 mask!3524))))

(assert (=> b!518081 (= lt!237068 (select (store (arr!15935 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518081 (= lt!237074 (toIndex!0 (select (arr!15935 a!3235) j!176) mask!3524))))

(assert (=> b!518081 (= lt!237072 (array!33144 (store (arr!15935 a!3235) i!1204 k0!2280) (size!16300 a!3235)))))

(assert (=> b!518081 e!302268))

(declare-fun res!317236 () Bool)

(assert (=> b!518081 (=> (not res!317236) (not e!302268))))

(assert (=> b!518081 (= res!317236 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237070 () Unit!16042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16042)

(assert (=> b!518081 (= lt!237070 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518082 () Bool)

(declare-fun res!317231 () Bool)

(assert (=> b!518082 (=> (not res!317231) (not e!302267))))

(declare-fun arrayContainsKey!0 (array!33143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518082 (= res!317231 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518083 () Bool)

(assert (=> b!518083 (= e!302263 false)))

(declare-fun b!518084 () Bool)

(declare-fun res!317235 () Bool)

(assert (=> b!518084 (=> (not res!317235) (not e!302267))))

(assert (=> b!518084 (= res!317235 (and (= (size!16300 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16300 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16300 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518085 () Bool)

(declare-fun res!317233 () Bool)

(assert (=> b!518085 (=> (not res!317233) (not e!302267))))

(assert (=> b!518085 (= res!317233 (validKeyInArray!0 (select (arr!15935 a!3235) j!176)))))

(declare-fun b!518086 () Bool)

(assert (=> b!518086 (= e!302267 e!302266)))

(declare-fun res!317230 () Bool)

(assert (=> b!518086 (=> (not res!317230) (not e!302266))))

(declare-fun lt!237075 () SeekEntryResult!4399)

(assert (=> b!518086 (= res!317230 (or (= lt!237075 (MissingZero!4399 i!1204)) (= lt!237075 (MissingVacant!4399 i!1204))))))

(assert (=> b!518086 (= lt!237075 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518087 () Bool)

(declare-fun res!317229 () Bool)

(assert (=> b!518087 (=> res!317229 e!302265)))

(get-info :version)

(assert (=> b!518087 (= res!317229 (or (undefined!5211 lt!237069) (not ((_ is Intermediate!4399) lt!237069))))))

(declare-fun b!518088 () Bool)

(declare-fun res!317234 () Bool)

(assert (=> b!518088 (=> (not res!317234) (not e!302266))))

(declare-datatypes ((List!10132 0))(
  ( (Nil!10129) (Cons!10128 (h!11035 (_ BitVec 64)) (t!16351 List!10132)) )
))
(declare-fun arrayNoDuplicates!0 (array!33143 (_ BitVec 32) List!10132) Bool)

(assert (=> b!518088 (= res!317234 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10129))))

(declare-fun b!518089 () Bool)

(assert (=> b!518089 (= e!302265 (and (bvsge (index!19786 lt!237069) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237069) (size!16300 a!3235))))))

(declare-fun lt!237076 () Unit!16042)

(assert (=> b!518089 (= lt!237076 e!302264)))

(declare-fun c!60717 () Bool)

(assert (=> b!518089 (= c!60717 (= (select (arr!15935 a!3235) (index!19786 lt!237069)) (select (arr!15935 a!3235) j!176)))))

(assert (=> b!518089 (and (bvslt (x!48759 lt!237069) #b01111111111111111111111111111110) (or (= (select (arr!15935 a!3235) (index!19786 lt!237069)) (select (arr!15935 a!3235) j!176)) (= (select (arr!15935 a!3235) (index!19786 lt!237069)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15935 a!3235) (index!19786 lt!237069)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46992 res!317238) b!518084))

(assert (= (and b!518084 res!317235) b!518085))

(assert (= (and b!518085 res!317233) b!518076))

(assert (= (and b!518076 res!317239) b!518082))

(assert (= (and b!518082 res!317231) b!518086))

(assert (= (and b!518086 res!317230) b!518080))

(assert (= (and b!518080 res!317240) b!518088))

(assert (= (and b!518088 res!317234) b!518081))

(assert (= (and b!518081 res!317236) b!518077))

(assert (= (and b!518081 (not res!317237)) b!518087))

(assert (= (and b!518087 (not res!317229)) b!518089))

(assert (= (and b!518089 c!60717) b!518078))

(assert (= (and b!518089 (not c!60717)) b!518079))

(assert (= (and b!518078 res!317232) b!518083))

(declare-fun m!498973 () Bool)

(assert (=> start!46992 m!498973))

(declare-fun m!498975 () Bool)

(assert (=> start!46992 m!498975))

(declare-fun m!498977 () Bool)

(assert (=> b!518077 m!498977))

(assert (=> b!518077 m!498977))

(declare-fun m!498979 () Bool)

(assert (=> b!518077 m!498979))

(declare-fun m!498981 () Bool)

(assert (=> b!518082 m!498981))

(declare-fun m!498983 () Bool)

(assert (=> b!518078 m!498983))

(declare-fun m!498985 () Bool)

(assert (=> b!518078 m!498985))

(assert (=> b!518085 m!498977))

(assert (=> b!518085 m!498977))

(declare-fun m!498987 () Bool)

(assert (=> b!518085 m!498987))

(declare-fun m!498989 () Bool)

(assert (=> b!518089 m!498989))

(assert (=> b!518089 m!498977))

(declare-fun m!498991 () Bool)

(assert (=> b!518081 m!498991))

(declare-fun m!498993 () Bool)

(assert (=> b!518081 m!498993))

(declare-fun m!498995 () Bool)

(assert (=> b!518081 m!498995))

(declare-fun m!498997 () Bool)

(assert (=> b!518081 m!498997))

(declare-fun m!498999 () Bool)

(assert (=> b!518081 m!498999))

(assert (=> b!518081 m!498977))

(declare-fun m!499001 () Bool)

(assert (=> b!518081 m!499001))

(assert (=> b!518081 m!498977))

(assert (=> b!518081 m!498977))

(declare-fun m!499003 () Bool)

(assert (=> b!518081 m!499003))

(declare-fun m!499005 () Bool)

(assert (=> b!518081 m!499005))

(declare-fun m!499007 () Bool)

(assert (=> b!518076 m!499007))

(declare-fun m!499009 () Bool)

(assert (=> b!518088 m!499009))

(declare-fun m!499011 () Bool)

(assert (=> b!518086 m!499011))

(declare-fun m!499013 () Bool)

(assert (=> b!518080 m!499013))

(check-sat (not b!518086) (not b!518085) (not b!518082) (not b!518077) (not b!518081) (not start!46992) (not b!518076) (not b!518088) (not b!518078) (not b!518080))
(check-sat)
(get-model)

(declare-fun b!518182 () Bool)

(declare-fun e!302319 () Bool)

(declare-fun e!302318 () Bool)

(assert (=> b!518182 (= e!302319 e!302318)))

(declare-fun c!60726 () Bool)

(assert (=> b!518182 (= c!60726 (validKeyInArray!0 (select (arr!15935 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79657 () Bool)

(declare-fun res!317318 () Bool)

(assert (=> d!79657 (=> res!317318 e!302319)))

(assert (=> d!79657 (= res!317318 (bvsge #b00000000000000000000000000000000 (size!16300 a!3235)))))

(assert (=> d!79657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302319)))

(declare-fun bm!31678 () Bool)

(declare-fun call!31681 () Bool)

(assert (=> bm!31678 (= call!31681 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518183 () Bool)

(declare-fun e!302317 () Bool)

(assert (=> b!518183 (= e!302317 call!31681)))

(declare-fun b!518184 () Bool)

(assert (=> b!518184 (= e!302318 call!31681)))

(declare-fun b!518185 () Bool)

(assert (=> b!518185 (= e!302318 e!302317)))

(declare-fun lt!237137 () (_ BitVec 64))

(assert (=> b!518185 (= lt!237137 (select (arr!15935 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237138 () Unit!16042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33143 (_ BitVec 64) (_ BitVec 32)) Unit!16042)

(assert (=> b!518185 (= lt!237138 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237137 #b00000000000000000000000000000000))))

(assert (=> b!518185 (arrayContainsKey!0 a!3235 lt!237137 #b00000000000000000000000000000000)))

(declare-fun lt!237139 () Unit!16042)

(assert (=> b!518185 (= lt!237139 lt!237138)))

(declare-fun res!317317 () Bool)

(assert (=> b!518185 (= res!317317 (= (seekEntryOrOpen!0 (select (arr!15935 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4399 #b00000000000000000000000000000000)))))

(assert (=> b!518185 (=> (not res!317317) (not e!302317))))

(assert (= (and d!79657 (not res!317318)) b!518182))

(assert (= (and b!518182 c!60726) b!518185))

(assert (= (and b!518182 (not c!60726)) b!518184))

(assert (= (and b!518185 res!317317) b!518183))

(assert (= (or b!518183 b!518184) bm!31678))

(declare-fun m!499099 () Bool)

(assert (=> b!518182 m!499099))

(assert (=> b!518182 m!499099))

(declare-fun m!499101 () Bool)

(assert (=> b!518182 m!499101))

(declare-fun m!499103 () Bool)

(assert (=> bm!31678 m!499103))

(assert (=> b!518185 m!499099))

(declare-fun m!499105 () Bool)

(assert (=> b!518185 m!499105))

(declare-fun m!499107 () Bool)

(assert (=> b!518185 m!499107))

(assert (=> b!518185 m!499099))

(declare-fun m!499109 () Bool)

(assert (=> b!518185 m!499109))

(assert (=> b!518080 d!79657))

(declare-fun d!79659 () Bool)

(assert (=> d!79659 (= (validKeyInArray!0 (select (arr!15935 a!3235) j!176)) (and (not (= (select (arr!15935 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15935 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518085 d!79659))

(declare-fun d!79661 () Bool)

(declare-fun lt!237146 () SeekEntryResult!4399)

(assert (=> d!79661 (and (or ((_ is Undefined!4399) lt!237146) (not ((_ is Found!4399) lt!237146)) (and (bvsge (index!19785 lt!237146) #b00000000000000000000000000000000) (bvslt (index!19785 lt!237146) (size!16300 a!3235)))) (or ((_ is Undefined!4399) lt!237146) ((_ is Found!4399) lt!237146) (not ((_ is MissingZero!4399) lt!237146)) (and (bvsge (index!19784 lt!237146) #b00000000000000000000000000000000) (bvslt (index!19784 lt!237146) (size!16300 a!3235)))) (or ((_ is Undefined!4399) lt!237146) ((_ is Found!4399) lt!237146) ((_ is MissingZero!4399) lt!237146) (not ((_ is MissingVacant!4399) lt!237146)) (and (bvsge (index!19787 lt!237146) #b00000000000000000000000000000000) (bvslt (index!19787 lt!237146) (size!16300 a!3235)))) (or ((_ is Undefined!4399) lt!237146) (ite ((_ is Found!4399) lt!237146) (= (select (arr!15935 a!3235) (index!19785 lt!237146)) k0!2280) (ite ((_ is MissingZero!4399) lt!237146) (= (select (arr!15935 a!3235) (index!19784 lt!237146)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4399) lt!237146) (= (select (arr!15935 a!3235) (index!19787 lt!237146)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302328 () SeekEntryResult!4399)

(assert (=> d!79661 (= lt!237146 e!302328)))

(declare-fun c!60734 () Bool)

(declare-fun lt!237148 () SeekEntryResult!4399)

(assert (=> d!79661 (= c!60734 (and ((_ is Intermediate!4399) lt!237148) (undefined!5211 lt!237148)))))

(assert (=> d!79661 (= lt!237148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79661 (validMask!0 mask!3524)))

(assert (=> d!79661 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237146)))

(declare-fun b!518198 () Bool)

(assert (=> b!518198 (= e!302328 Undefined!4399)))

(declare-fun b!518199 () Bool)

(declare-fun e!302327 () SeekEntryResult!4399)

(assert (=> b!518199 (= e!302327 (MissingZero!4399 (index!19786 lt!237148)))))

(declare-fun b!518200 () Bool)

(declare-fun c!60733 () Bool)

(declare-fun lt!237147 () (_ BitVec 64))

(assert (=> b!518200 (= c!60733 (= lt!237147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302326 () SeekEntryResult!4399)

(assert (=> b!518200 (= e!302326 e!302327)))

(declare-fun b!518201 () Bool)

(assert (=> b!518201 (= e!302326 (Found!4399 (index!19786 lt!237148)))))

(declare-fun b!518202 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33143 (_ BitVec 32)) SeekEntryResult!4399)

(assert (=> b!518202 (= e!302327 (seekKeyOrZeroReturnVacant!0 (x!48759 lt!237148) (index!19786 lt!237148) (index!19786 lt!237148) k0!2280 a!3235 mask!3524))))

(declare-fun b!518203 () Bool)

(assert (=> b!518203 (= e!302328 e!302326)))

(assert (=> b!518203 (= lt!237147 (select (arr!15935 a!3235) (index!19786 lt!237148)))))

(declare-fun c!60735 () Bool)

(assert (=> b!518203 (= c!60735 (= lt!237147 k0!2280))))

(assert (= (and d!79661 c!60734) b!518198))

(assert (= (and d!79661 (not c!60734)) b!518203))

(assert (= (and b!518203 c!60735) b!518201))

(assert (= (and b!518203 (not c!60735)) b!518200))

(assert (= (and b!518200 c!60733) b!518199))

(assert (= (and b!518200 (not c!60733)) b!518202))

(assert (=> d!79661 m!498973))

(declare-fun m!499111 () Bool)

(assert (=> d!79661 m!499111))

(declare-fun m!499113 () Bool)

(assert (=> d!79661 m!499113))

(declare-fun m!499115 () Bool)

(assert (=> d!79661 m!499115))

(declare-fun m!499117 () Bool)

(assert (=> d!79661 m!499117))

(assert (=> d!79661 m!499117))

(declare-fun m!499119 () Bool)

(assert (=> d!79661 m!499119))

(declare-fun m!499121 () Bool)

(assert (=> b!518202 m!499121))

(declare-fun m!499123 () Bool)

(assert (=> b!518203 m!499123))

(assert (=> b!518086 d!79661))

(declare-fun b!518222 () Bool)

(declare-fun e!302347 () Bool)

(declare-fun call!31686 () Bool)

(assert (=> b!518222 (= e!302347 call!31686)))

(declare-fun bm!31683 () Bool)

(declare-fun c!60740 () Bool)

(assert (=> bm!31683 (= call!31686 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60740 (Cons!10128 (select (arr!15935 a!3235) #b00000000000000000000000000000000) Nil!10129) Nil!10129)))))

(declare-fun b!518223 () Bool)

(assert (=> b!518223 (= e!302347 call!31686)))

(declare-fun d!79665 () Bool)

(declare-fun res!317332 () Bool)

(declare-fun e!302345 () Bool)

(assert (=> d!79665 (=> res!317332 e!302345)))

(assert (=> d!79665 (= res!317332 (bvsge #b00000000000000000000000000000000 (size!16300 a!3235)))))

(assert (=> d!79665 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10129) e!302345)))

(declare-fun b!518224 () Bool)

(declare-fun e!302348 () Bool)

(assert (=> b!518224 (= e!302345 e!302348)))

(declare-fun res!317331 () Bool)

(assert (=> b!518224 (=> (not res!317331) (not e!302348))))

(declare-fun e!302346 () Bool)

(assert (=> b!518224 (= res!317331 (not e!302346))))

(declare-fun res!317333 () Bool)

(assert (=> b!518224 (=> (not res!317333) (not e!302346))))

(assert (=> b!518224 (= res!317333 (validKeyInArray!0 (select (arr!15935 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518225 () Bool)

(assert (=> b!518225 (= e!302348 e!302347)))

(assert (=> b!518225 (= c!60740 (validKeyInArray!0 (select (arr!15935 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518226 () Bool)

(declare-fun contains!2734 (List!10132 (_ BitVec 64)) Bool)

(assert (=> b!518226 (= e!302346 (contains!2734 Nil!10129 (select (arr!15935 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79665 (not res!317332)) b!518224))

(assert (= (and b!518224 res!317333) b!518226))

(assert (= (and b!518224 res!317331) b!518225))

(assert (= (and b!518225 c!60740) b!518223))

(assert (= (and b!518225 (not c!60740)) b!518222))

(assert (= (or b!518223 b!518222) bm!31683))

(assert (=> bm!31683 m!499099))

(declare-fun m!499125 () Bool)

(assert (=> bm!31683 m!499125))

(assert (=> b!518224 m!499099))

(assert (=> b!518224 m!499099))

(assert (=> b!518224 m!499101))

(assert (=> b!518225 m!499099))

(assert (=> b!518225 m!499099))

(assert (=> b!518225 m!499101))

(assert (=> b!518226 m!499099))

(assert (=> b!518226 m!499099))

(declare-fun m!499127 () Bool)

(assert (=> b!518226 m!499127))

(assert (=> b!518088 d!79665))

(declare-fun d!79669 () Bool)

(assert (=> d!79669 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46992 d!79669))

(declare-fun d!79675 () Bool)

(assert (=> d!79675 (= (array_inv!11818 a!3235) (bvsge (size!16300 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46992 d!79675))

(declare-fun d!79677 () Bool)

(declare-fun lt!237161 () SeekEntryResult!4399)

(assert (=> d!79677 (and (or ((_ is Undefined!4399) lt!237161) (not ((_ is Found!4399) lt!237161)) (and (bvsge (index!19785 lt!237161) #b00000000000000000000000000000000) (bvslt (index!19785 lt!237161) (size!16300 a!3235)))) (or ((_ is Undefined!4399) lt!237161) ((_ is Found!4399) lt!237161) (not ((_ is MissingZero!4399) lt!237161)) (and (bvsge (index!19784 lt!237161) #b00000000000000000000000000000000) (bvslt (index!19784 lt!237161) (size!16300 a!3235)))) (or ((_ is Undefined!4399) lt!237161) ((_ is Found!4399) lt!237161) ((_ is MissingZero!4399) lt!237161) (not ((_ is MissingVacant!4399) lt!237161)) (and (bvsge (index!19787 lt!237161) #b00000000000000000000000000000000) (bvslt (index!19787 lt!237161) (size!16300 a!3235)))) (or ((_ is Undefined!4399) lt!237161) (ite ((_ is Found!4399) lt!237161) (= (select (arr!15935 a!3235) (index!19785 lt!237161)) (select (arr!15935 a!3235) j!176)) (ite ((_ is MissingZero!4399) lt!237161) (= (select (arr!15935 a!3235) (index!19784 lt!237161)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4399) lt!237161) (= (select (arr!15935 a!3235) (index!19787 lt!237161)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302355 () SeekEntryResult!4399)

(assert (=> d!79677 (= lt!237161 e!302355)))

(declare-fun c!60743 () Bool)

(declare-fun lt!237163 () SeekEntryResult!4399)

(assert (=> d!79677 (= c!60743 (and ((_ is Intermediate!4399) lt!237163) (undefined!5211 lt!237163)))))

(assert (=> d!79677 (= lt!237163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15935 a!3235) j!176) mask!3524) (select (arr!15935 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79677 (validMask!0 mask!3524)))

(assert (=> d!79677 (= (seekEntryOrOpen!0 (select (arr!15935 a!3235) j!176) a!3235 mask!3524) lt!237161)))

(declare-fun b!518234 () Bool)

(assert (=> b!518234 (= e!302355 Undefined!4399)))

(declare-fun b!518235 () Bool)

(declare-fun e!302354 () SeekEntryResult!4399)

(assert (=> b!518235 (= e!302354 (MissingZero!4399 (index!19786 lt!237163)))))

(declare-fun b!518236 () Bool)

(declare-fun c!60742 () Bool)

(declare-fun lt!237162 () (_ BitVec 64))

(assert (=> b!518236 (= c!60742 (= lt!237162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302353 () SeekEntryResult!4399)

(assert (=> b!518236 (= e!302353 e!302354)))

(declare-fun b!518237 () Bool)

(assert (=> b!518237 (= e!302353 (Found!4399 (index!19786 lt!237163)))))

(declare-fun b!518238 () Bool)

(assert (=> b!518238 (= e!302354 (seekKeyOrZeroReturnVacant!0 (x!48759 lt!237163) (index!19786 lt!237163) (index!19786 lt!237163) (select (arr!15935 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518239 () Bool)

(assert (=> b!518239 (= e!302355 e!302353)))

(assert (=> b!518239 (= lt!237162 (select (arr!15935 a!3235) (index!19786 lt!237163)))))

(declare-fun c!60744 () Bool)

(assert (=> b!518239 (= c!60744 (= lt!237162 (select (arr!15935 a!3235) j!176)))))

(assert (= (and d!79677 c!60743) b!518234))

(assert (= (and d!79677 (not c!60743)) b!518239))

(assert (= (and b!518239 c!60744) b!518237))

(assert (= (and b!518239 (not c!60744)) b!518236))

(assert (= (and b!518236 c!60742) b!518235))

(assert (= (and b!518236 (not c!60742)) b!518238))

(assert (=> d!79677 m!498973))

(declare-fun m!499145 () Bool)

(assert (=> d!79677 m!499145))

(declare-fun m!499147 () Bool)

(assert (=> d!79677 m!499147))

(declare-fun m!499149 () Bool)

(assert (=> d!79677 m!499149))

(assert (=> d!79677 m!498977))

(assert (=> d!79677 m!499001))

(assert (=> d!79677 m!499001))

(assert (=> d!79677 m!498977))

(declare-fun m!499151 () Bool)

(assert (=> d!79677 m!499151))

(assert (=> b!518238 m!498977))

(declare-fun m!499153 () Bool)

(assert (=> b!518238 m!499153))

(declare-fun m!499155 () Bool)

(assert (=> b!518239 m!499155))

(assert (=> b!518077 d!79677))

(declare-fun d!79679 () Bool)

(declare-fun e!302382 () Bool)

(assert (=> d!79679 e!302382))

(declare-fun res!317348 () Bool)

(assert (=> d!79679 (=> (not res!317348) (not e!302382))))

(assert (=> d!79679 (= res!317348 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16300 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16300 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16300 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16300 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16300 a!3235))))))

(declare-fun lt!237181 () Unit!16042)

(declare-fun choose!47 (array!33143 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16042)

(assert (=> d!79679 (= lt!237181 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237074 #b00000000000000000000000000000000 (index!19786 lt!237069) (x!48759 lt!237069) mask!3524))))

(assert (=> d!79679 (validMask!0 mask!3524)))

(assert (=> d!79679 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237074 #b00000000000000000000000000000000 (index!19786 lt!237069) (x!48759 lt!237069) mask!3524) lt!237181)))

(declare-fun b!518287 () Bool)

(assert (=> b!518287 (= e!302382 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237074 (select (store (arr!15935 a!3235) i!1204 k0!2280) j!176) (array!33144 (store (arr!15935 a!3235) i!1204 k0!2280) (size!16300 a!3235)) mask!3524) (Intermediate!4399 false (index!19786 lt!237069) (x!48759 lt!237069))))))

(assert (= (and d!79679 res!317348) b!518287))

(declare-fun m!499165 () Bool)

(assert (=> d!79679 m!499165))

(assert (=> d!79679 m!498973))

(assert (=> b!518287 m!498991))

(assert (=> b!518287 m!498997))

(assert (=> b!518287 m!498997))

(declare-fun m!499179 () Bool)

(assert (=> b!518287 m!499179))

(assert (=> b!518078 d!79679))

(declare-fun b!518339 () Bool)

(declare-fun lt!237190 () SeekEntryResult!4399)

(assert (=> b!518339 (and (bvsge (index!19786 lt!237190) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237190) (size!16300 lt!237072)))))

(declare-fun res!317377 () Bool)

(assert (=> b!518339 (= res!317377 (= (select (arr!15935 lt!237072) (index!19786 lt!237190)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302424 () Bool)

(assert (=> b!518339 (=> res!317377 e!302424)))

(declare-fun b!518340 () Bool)

(declare-fun e!302422 () Bool)

(declare-fun e!302423 () Bool)

(assert (=> b!518340 (= e!302422 e!302423)))

(declare-fun res!317376 () Bool)

(assert (=> b!518340 (= res!317376 (and ((_ is Intermediate!4399) lt!237190) (not (undefined!5211 lt!237190)) (bvslt (x!48759 lt!237190) #b01111111111111111111111111111110) (bvsge (x!48759 lt!237190) #b00000000000000000000000000000000) (bvsge (x!48759 lt!237190) #b00000000000000000000000000000000)))))

(assert (=> b!518340 (=> (not res!317376) (not e!302423))))

(declare-fun d!79683 () Bool)

(assert (=> d!79683 e!302422))

(declare-fun c!60776 () Bool)

(assert (=> d!79683 (= c!60776 (and ((_ is Intermediate!4399) lt!237190) (undefined!5211 lt!237190)))))

(declare-fun e!302420 () SeekEntryResult!4399)

(assert (=> d!79683 (= lt!237190 e!302420)))

(declare-fun c!60775 () Bool)

(assert (=> d!79683 (= c!60775 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237189 () (_ BitVec 64))

(assert (=> d!79683 (= lt!237189 (select (arr!15935 lt!237072) lt!237074))))

(assert (=> d!79683 (validMask!0 mask!3524)))

(assert (=> d!79683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237074 lt!237068 lt!237072 mask!3524) lt!237190)))

(declare-fun b!518341 () Bool)

(assert (=> b!518341 (= e!302422 (bvsge (x!48759 lt!237190) #b01111111111111111111111111111110))))

(declare-fun b!518342 () Bool)

(declare-fun e!302421 () SeekEntryResult!4399)

(assert (=> b!518342 (= e!302420 e!302421)))

(declare-fun c!60777 () Bool)

(assert (=> b!518342 (= c!60777 (or (= lt!237189 lt!237068) (= (bvadd lt!237189 lt!237189) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518343 () Bool)

(assert (=> b!518343 (and (bvsge (index!19786 lt!237190) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237190) (size!16300 lt!237072)))))

(declare-fun res!317378 () Bool)

(assert (=> b!518343 (= res!317378 (= (select (arr!15935 lt!237072) (index!19786 lt!237190)) lt!237068))))

(assert (=> b!518343 (=> res!317378 e!302424)))

(assert (=> b!518343 (= e!302423 e!302424)))

(declare-fun b!518344 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518344 (= e!302421 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237074 #b00000000000000000000000000000000 mask!3524) lt!237068 lt!237072 mask!3524))))

(declare-fun b!518345 () Bool)

(assert (=> b!518345 (and (bvsge (index!19786 lt!237190) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237190) (size!16300 lt!237072)))))

(assert (=> b!518345 (= e!302424 (= (select (arr!15935 lt!237072) (index!19786 lt!237190)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518346 () Bool)

(assert (=> b!518346 (= e!302420 (Intermediate!4399 true lt!237074 #b00000000000000000000000000000000))))

(declare-fun b!518347 () Bool)

(assert (=> b!518347 (= e!302421 (Intermediate!4399 false lt!237074 #b00000000000000000000000000000000))))

(assert (= (and d!79683 c!60775) b!518346))

(assert (= (and d!79683 (not c!60775)) b!518342))

(assert (= (and b!518342 c!60777) b!518347))

(assert (= (and b!518342 (not c!60777)) b!518344))

(assert (= (and d!79683 c!60776) b!518341))

(assert (= (and d!79683 (not c!60776)) b!518340))

(assert (= (and b!518340 res!317376) b!518343))

(assert (= (and b!518343 (not res!317378)) b!518339))

(assert (= (and b!518339 (not res!317377)) b!518345))

(declare-fun m!499199 () Bool)

(assert (=> b!518339 m!499199))

(declare-fun m!499201 () Bool)

(assert (=> d!79683 m!499201))

(assert (=> d!79683 m!498973))

(declare-fun m!499203 () Bool)

(assert (=> b!518344 m!499203))

(assert (=> b!518344 m!499203))

(declare-fun m!499205 () Bool)

(assert (=> b!518344 m!499205))

(assert (=> b!518343 m!499199))

(assert (=> b!518345 m!499199))

(assert (=> b!518078 d!79683))

(declare-fun d!79699 () Bool)

(assert (=> d!79699 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518076 d!79699))

(declare-fun b!518348 () Bool)

(declare-fun lt!237192 () SeekEntryResult!4399)

(assert (=> b!518348 (and (bvsge (index!19786 lt!237192) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237192) (size!16300 a!3235)))))

(declare-fun res!317380 () Bool)

(assert (=> b!518348 (= res!317380 (= (select (arr!15935 a!3235) (index!19786 lt!237192)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302429 () Bool)

(assert (=> b!518348 (=> res!317380 e!302429)))

(declare-fun b!518349 () Bool)

(declare-fun e!302427 () Bool)

(declare-fun e!302428 () Bool)

(assert (=> b!518349 (= e!302427 e!302428)))

(declare-fun res!317379 () Bool)

(assert (=> b!518349 (= res!317379 (and ((_ is Intermediate!4399) lt!237192) (not (undefined!5211 lt!237192)) (bvslt (x!48759 lt!237192) #b01111111111111111111111111111110) (bvsge (x!48759 lt!237192) #b00000000000000000000000000000000) (bvsge (x!48759 lt!237192) #b00000000000000000000000000000000)))))

(assert (=> b!518349 (=> (not res!317379) (not e!302428))))

(declare-fun d!79701 () Bool)

(assert (=> d!79701 e!302427))

(declare-fun c!60779 () Bool)

(assert (=> d!79701 (= c!60779 (and ((_ is Intermediate!4399) lt!237192) (undefined!5211 lt!237192)))))

(declare-fun e!302425 () SeekEntryResult!4399)

(assert (=> d!79701 (= lt!237192 e!302425)))

(declare-fun c!60778 () Bool)

(assert (=> d!79701 (= c!60778 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237191 () (_ BitVec 64))

(assert (=> d!79701 (= lt!237191 (select (arr!15935 a!3235) lt!237074))))

(assert (=> d!79701 (validMask!0 mask!3524)))

(assert (=> d!79701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237074 (select (arr!15935 a!3235) j!176) a!3235 mask!3524) lt!237192)))

(declare-fun b!518350 () Bool)

(assert (=> b!518350 (= e!302427 (bvsge (x!48759 lt!237192) #b01111111111111111111111111111110))))

(declare-fun b!518351 () Bool)

(declare-fun e!302426 () SeekEntryResult!4399)

(assert (=> b!518351 (= e!302425 e!302426)))

(declare-fun c!60780 () Bool)

(assert (=> b!518351 (= c!60780 (or (= lt!237191 (select (arr!15935 a!3235) j!176)) (= (bvadd lt!237191 lt!237191) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518352 () Bool)

(assert (=> b!518352 (and (bvsge (index!19786 lt!237192) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237192) (size!16300 a!3235)))))

(declare-fun res!317381 () Bool)

(assert (=> b!518352 (= res!317381 (= (select (arr!15935 a!3235) (index!19786 lt!237192)) (select (arr!15935 a!3235) j!176)))))

(assert (=> b!518352 (=> res!317381 e!302429)))

(assert (=> b!518352 (= e!302428 e!302429)))

(declare-fun b!518353 () Bool)

(assert (=> b!518353 (= e!302426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237074 #b00000000000000000000000000000000 mask!3524) (select (arr!15935 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518354 () Bool)

(assert (=> b!518354 (and (bvsge (index!19786 lt!237192) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237192) (size!16300 a!3235)))))

(assert (=> b!518354 (= e!302429 (= (select (arr!15935 a!3235) (index!19786 lt!237192)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518355 () Bool)

(assert (=> b!518355 (= e!302425 (Intermediate!4399 true lt!237074 #b00000000000000000000000000000000))))

(declare-fun b!518356 () Bool)

(assert (=> b!518356 (= e!302426 (Intermediate!4399 false lt!237074 #b00000000000000000000000000000000))))

(assert (= (and d!79701 c!60778) b!518355))

(assert (= (and d!79701 (not c!60778)) b!518351))

(assert (= (and b!518351 c!60780) b!518356))

(assert (= (and b!518351 (not c!60780)) b!518353))

(assert (= (and d!79701 c!60779) b!518350))

(assert (= (and d!79701 (not c!60779)) b!518349))

(assert (= (and b!518349 res!317379) b!518352))

(assert (= (and b!518352 (not res!317381)) b!518348))

(assert (= (and b!518348 (not res!317380)) b!518354))

(declare-fun m!499207 () Bool)

(assert (=> b!518348 m!499207))

(declare-fun m!499209 () Bool)

(assert (=> d!79701 m!499209))

(assert (=> d!79701 m!498973))

(assert (=> b!518353 m!499203))

(assert (=> b!518353 m!499203))

(assert (=> b!518353 m!498977))

(declare-fun m!499211 () Bool)

(assert (=> b!518353 m!499211))

(assert (=> b!518352 m!499207))

(assert (=> b!518354 m!499207))

(assert (=> b!518081 d!79701))

(declare-fun d!79703 () Bool)

(declare-fun lt!237207 () (_ BitVec 32))

(declare-fun lt!237206 () (_ BitVec 32))

(assert (=> d!79703 (= lt!237207 (bvmul (bvxor lt!237206 (bvlshr lt!237206 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79703 (= lt!237206 ((_ extract 31 0) (bvand (bvxor (select (arr!15935 a!3235) j!176) (bvlshr (select (arr!15935 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79703 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317384 (let ((h!11038 ((_ extract 31 0) (bvand (bvxor (select (arr!15935 a!3235) j!176) (bvlshr (select (arr!15935 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48767 (bvmul (bvxor h!11038 (bvlshr h!11038 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48767 (bvlshr x!48767 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317384 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317384 #b00000000000000000000000000000000))))))

(assert (=> d!79703 (= (toIndex!0 (select (arr!15935 a!3235) j!176) mask!3524) (bvand (bvxor lt!237207 (bvlshr lt!237207 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518081 d!79703))

(declare-fun b!518369 () Bool)

(declare-fun e!302441 () Bool)

(declare-fun e!302440 () Bool)

(assert (=> b!518369 (= e!302441 e!302440)))

(declare-fun c!60784 () Bool)

(assert (=> b!518369 (= c!60784 (validKeyInArray!0 (select (arr!15935 a!3235) j!176)))))

(declare-fun d!79707 () Bool)

(declare-fun res!317390 () Bool)

(assert (=> d!79707 (=> res!317390 e!302441)))

(assert (=> d!79707 (= res!317390 (bvsge j!176 (size!16300 a!3235)))))

(assert (=> d!79707 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302441)))

(declare-fun call!31697 () Bool)

(declare-fun bm!31694 () Bool)

(assert (=> bm!31694 (= call!31697 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518370 () Bool)

(declare-fun e!302439 () Bool)

(assert (=> b!518370 (= e!302439 call!31697)))

(declare-fun b!518371 () Bool)

(assert (=> b!518371 (= e!302440 call!31697)))

(declare-fun b!518372 () Bool)

(assert (=> b!518372 (= e!302440 e!302439)))

(declare-fun lt!237208 () (_ BitVec 64))

(assert (=> b!518372 (= lt!237208 (select (arr!15935 a!3235) j!176))))

(declare-fun lt!237209 () Unit!16042)

(assert (=> b!518372 (= lt!237209 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237208 j!176))))

(assert (=> b!518372 (arrayContainsKey!0 a!3235 lt!237208 #b00000000000000000000000000000000)))

(declare-fun lt!237210 () Unit!16042)

(assert (=> b!518372 (= lt!237210 lt!237209)))

(declare-fun res!317389 () Bool)

(assert (=> b!518372 (= res!317389 (= (seekEntryOrOpen!0 (select (arr!15935 a!3235) j!176) a!3235 mask!3524) (Found!4399 j!176)))))

(assert (=> b!518372 (=> (not res!317389) (not e!302439))))

(assert (= (and d!79707 (not res!317390)) b!518369))

(assert (= (and b!518369 c!60784) b!518372))

(assert (= (and b!518369 (not c!60784)) b!518371))

(assert (= (and b!518372 res!317389) b!518370))

(assert (= (or b!518370 b!518371) bm!31694))

(assert (=> b!518369 m!498977))

(assert (=> b!518369 m!498977))

(assert (=> b!518369 m!498987))

(declare-fun m!499221 () Bool)

(assert (=> bm!31694 m!499221))

(assert (=> b!518372 m!498977))

(declare-fun m!499223 () Bool)

(assert (=> b!518372 m!499223))

(declare-fun m!499225 () Bool)

(assert (=> b!518372 m!499225))

(assert (=> b!518372 m!498977))

(assert (=> b!518372 m!498979))

(assert (=> b!518081 d!79707))

(declare-fun d!79709 () Bool)

(declare-fun lt!237212 () (_ BitVec 32))

(declare-fun lt!237211 () (_ BitVec 32))

(assert (=> d!79709 (= lt!237212 (bvmul (bvxor lt!237211 (bvlshr lt!237211 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79709 (= lt!237211 ((_ extract 31 0) (bvand (bvxor lt!237068 (bvlshr lt!237068 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79709 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317384 (let ((h!11038 ((_ extract 31 0) (bvand (bvxor lt!237068 (bvlshr lt!237068 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48767 (bvmul (bvxor h!11038 (bvlshr h!11038 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48767 (bvlshr x!48767 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317384 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317384 #b00000000000000000000000000000000))))))

(assert (=> d!79709 (= (toIndex!0 lt!237068 mask!3524) (bvand (bvxor lt!237212 (bvlshr lt!237212 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518081 d!79709))

(declare-fun d!79711 () Bool)

(assert (=> d!79711 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237217 () Unit!16042)

(declare-fun choose!38 (array!33143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16042)

(assert (=> d!79711 (= lt!237217 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79711 (validMask!0 mask!3524)))

(assert (=> d!79711 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237217)))

(declare-fun bs!16330 () Bool)

(assert (= bs!16330 d!79711))

(assert (=> bs!16330 m!499005))

(declare-fun m!499235 () Bool)

(assert (=> bs!16330 m!499235))

(assert (=> bs!16330 m!498973))

(assert (=> b!518081 d!79711))

(declare-fun b!518388 () Bool)

(declare-fun lt!237219 () SeekEntryResult!4399)

(assert (=> b!518388 (and (bvsge (index!19786 lt!237219) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237219) (size!16300 lt!237072)))))

(declare-fun res!317402 () Bool)

(assert (=> b!518388 (= res!317402 (= (select (arr!15935 lt!237072) (index!19786 lt!237219)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302457 () Bool)

(assert (=> b!518388 (=> res!317402 e!302457)))

(declare-fun b!518389 () Bool)

(declare-fun e!302455 () Bool)

(declare-fun e!302456 () Bool)

(assert (=> b!518389 (= e!302455 e!302456)))

(declare-fun res!317401 () Bool)

(assert (=> b!518389 (= res!317401 (and ((_ is Intermediate!4399) lt!237219) (not (undefined!5211 lt!237219)) (bvslt (x!48759 lt!237219) #b01111111111111111111111111111110) (bvsge (x!48759 lt!237219) #b00000000000000000000000000000000) (bvsge (x!48759 lt!237219) #b00000000000000000000000000000000)))))

(assert (=> b!518389 (=> (not res!317401) (not e!302456))))

(declare-fun d!79717 () Bool)

(assert (=> d!79717 e!302455))

(declare-fun c!60789 () Bool)

(assert (=> d!79717 (= c!60789 (and ((_ is Intermediate!4399) lt!237219) (undefined!5211 lt!237219)))))

(declare-fun e!302453 () SeekEntryResult!4399)

(assert (=> d!79717 (= lt!237219 e!302453)))

(declare-fun c!60788 () Bool)

(assert (=> d!79717 (= c!60788 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237218 () (_ BitVec 64))

(assert (=> d!79717 (= lt!237218 (select (arr!15935 lt!237072) lt!237071))))

(assert (=> d!79717 (validMask!0 mask!3524)))

(assert (=> d!79717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237071 lt!237068 lt!237072 mask!3524) lt!237219)))

(declare-fun b!518390 () Bool)

(assert (=> b!518390 (= e!302455 (bvsge (x!48759 lt!237219) #b01111111111111111111111111111110))))

(declare-fun b!518391 () Bool)

(declare-fun e!302454 () SeekEntryResult!4399)

(assert (=> b!518391 (= e!302453 e!302454)))

(declare-fun c!60790 () Bool)

(assert (=> b!518391 (= c!60790 (or (= lt!237218 lt!237068) (= (bvadd lt!237218 lt!237218) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518392 () Bool)

(assert (=> b!518392 (and (bvsge (index!19786 lt!237219) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237219) (size!16300 lt!237072)))))

(declare-fun res!317403 () Bool)

(assert (=> b!518392 (= res!317403 (= (select (arr!15935 lt!237072) (index!19786 lt!237219)) lt!237068))))

(assert (=> b!518392 (=> res!317403 e!302457)))

(assert (=> b!518392 (= e!302456 e!302457)))

(declare-fun b!518393 () Bool)

(assert (=> b!518393 (= e!302454 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237071 #b00000000000000000000000000000000 mask!3524) lt!237068 lt!237072 mask!3524))))

(declare-fun b!518394 () Bool)

(assert (=> b!518394 (and (bvsge (index!19786 lt!237219) #b00000000000000000000000000000000) (bvslt (index!19786 lt!237219) (size!16300 lt!237072)))))

(assert (=> b!518394 (= e!302457 (= (select (arr!15935 lt!237072) (index!19786 lt!237219)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518395 () Bool)

(assert (=> b!518395 (= e!302453 (Intermediate!4399 true lt!237071 #b00000000000000000000000000000000))))

(declare-fun b!518396 () Bool)

(assert (=> b!518396 (= e!302454 (Intermediate!4399 false lt!237071 #b00000000000000000000000000000000))))

(assert (= (and d!79717 c!60788) b!518395))

(assert (= (and d!79717 (not c!60788)) b!518391))

(assert (= (and b!518391 c!60790) b!518396))

(assert (= (and b!518391 (not c!60790)) b!518393))

(assert (= (and d!79717 c!60789) b!518390))

(assert (= (and d!79717 (not c!60789)) b!518389))

(assert (= (and b!518389 res!317401) b!518392))

(assert (= (and b!518392 (not res!317403)) b!518388))

(assert (= (and b!518388 (not res!317402)) b!518394))

(declare-fun m!499237 () Bool)

(assert (=> b!518388 m!499237))

(declare-fun m!499239 () Bool)

(assert (=> d!79717 m!499239))

(assert (=> d!79717 m!498973))

(declare-fun m!499241 () Bool)

(assert (=> b!518393 m!499241))

(assert (=> b!518393 m!499241))

(declare-fun m!499243 () Bool)

(assert (=> b!518393 m!499243))

(assert (=> b!518392 m!499237))

(assert (=> b!518394 m!499237))

(assert (=> b!518081 d!79717))

(declare-fun d!79719 () Bool)

(declare-fun res!317419 () Bool)

(declare-fun e!302480 () Bool)

(assert (=> d!79719 (=> res!317419 e!302480)))

(assert (=> d!79719 (= res!317419 (= (select (arr!15935 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79719 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302480)))

(declare-fun b!518432 () Bool)

(declare-fun e!302481 () Bool)

(assert (=> b!518432 (= e!302480 e!302481)))

(declare-fun res!317420 () Bool)

(assert (=> b!518432 (=> (not res!317420) (not e!302481))))

(assert (=> b!518432 (= res!317420 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16300 a!3235)))))

(declare-fun b!518433 () Bool)

(assert (=> b!518433 (= e!302481 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79719 (not res!317419)) b!518432))

(assert (= (and b!518432 res!317420) b!518433))

(assert (=> d!79719 m!499099))

(declare-fun m!499251 () Bool)

(assert (=> b!518433 m!499251))

(assert (=> b!518082 d!79719))

(check-sat (not b!518369) (not b!518393) (not bm!31694) (not d!79661) (not d!79717) (not d!79711) (not b!518226) (not d!79683) (not b!518287) (not b!518202) (not b!518433) (not bm!31683) (not b!518353) (not b!518225) (not b!518372) (not b!518224) (not d!79677) (not d!79679) (not b!518238) (not b!518344) (not b!518182) (not d!79701) (not b!518185) (not bm!31678))
(check-sat)
