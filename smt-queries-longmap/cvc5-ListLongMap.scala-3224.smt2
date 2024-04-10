; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45090 () Bool)

(assert start!45090)

(declare-fun b!495007 () Bool)

(declare-fun e!290418 () Bool)

(declare-fun e!290417 () Bool)

(assert (=> b!495007 (= e!290418 e!290417)))

(declare-fun res!297584 () Bool)

(assert (=> b!495007 (=> (not res!297584) (not e!290417))))

(declare-datatypes ((SeekEntryResult!3869 0))(
  ( (MissingZero!3869 (index!17655 (_ BitVec 32))) (Found!3869 (index!17656 (_ BitVec 32))) (Intermediate!3869 (undefined!4681 Bool) (index!17657 (_ BitVec 32)) (x!46723 (_ BitVec 32))) (Undefined!3869) (MissingVacant!3869 (index!17658 (_ BitVec 32))) )
))
(declare-fun lt!224098 () SeekEntryResult!3869)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495007 (= res!297584 (or (= lt!224098 (MissingZero!3869 i!1204)) (= lt!224098 (MissingVacant!3869 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32035 0))(
  ( (array!32036 (arr!15402 (Array (_ BitVec 32) (_ BitVec 64))) (size!15766 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32035)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32035 (_ BitVec 32)) SeekEntryResult!3869)

(assert (=> b!495007 (= lt!224098 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495008 () Bool)

(declare-fun res!297577 () Bool)

(assert (=> b!495008 (=> (not res!297577) (not e!290418))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495008 (= res!297577 (validKeyInArray!0 (select (arr!15402 a!3235) j!176)))))

(declare-fun b!495009 () Bool)

(declare-fun res!297580 () Bool)

(assert (=> b!495009 (=> (not res!297580) (not e!290417))))

(declare-datatypes ((List!9560 0))(
  ( (Nil!9557) (Cons!9556 (h!10424 (_ BitVec 64)) (t!15788 List!9560)) )
))
(declare-fun arrayNoDuplicates!0 (array!32035 (_ BitVec 32) List!9560) Bool)

(assert (=> b!495009 (= res!297580 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9557))))

(declare-fun lt!224097 () SeekEntryResult!3869)

(declare-fun b!495010 () Bool)

(declare-fun e!290419 () Bool)

(assert (=> b!495010 (= e!290419 (or (not (= (select (arr!15402 a!3235) (index!17657 lt!224097)) (select (arr!15402 a!3235) j!176))) (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!495010 (and (bvslt (x!46723 lt!224097) #b01111111111111111111111111111110) (or (= (select (arr!15402 a!3235) (index!17657 lt!224097)) (select (arr!15402 a!3235) j!176)) (= (select (arr!15402 a!3235) (index!17657 lt!224097)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15402 a!3235) (index!17657 lt!224097)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495011 () Bool)

(declare-fun res!297578 () Bool)

(assert (=> b!495011 (=> (not res!297578) (not e!290418))))

(declare-fun arrayContainsKey!0 (array!32035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495011 (= res!297578 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495012 () Bool)

(declare-fun res!297583 () Bool)

(assert (=> b!495012 (=> res!297583 e!290419)))

(assert (=> b!495012 (= res!297583 (or (undefined!4681 lt!224097) (not (is-Intermediate!3869 lt!224097))))))

(declare-fun b!495013 () Bool)

(assert (=> b!495013 (= e!290417 (not e!290419))))

(declare-fun res!297585 () Bool)

(assert (=> b!495013 (=> res!297585 e!290419)))

(declare-fun lt!224094 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32035 (_ BitVec 32)) SeekEntryResult!3869)

(assert (=> b!495013 (= res!297585 (= lt!224097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224094 (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235)) mask!3524)))))

(declare-fun lt!224095 () (_ BitVec 32))

(assert (=> b!495013 (= lt!224097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224095 (select (arr!15402 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495013 (= lt!224094 (toIndex!0 (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495013 (= lt!224095 (toIndex!0 (select (arr!15402 a!3235) j!176) mask!3524))))

(declare-fun e!290421 () Bool)

(assert (=> b!495013 e!290421))

(declare-fun res!297587 () Bool)

(assert (=> b!495013 (=> (not res!297587) (not e!290421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32035 (_ BitVec 32)) Bool)

(assert (=> b!495013 (= res!297587 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14684 0))(
  ( (Unit!14685) )
))
(declare-fun lt!224096 () Unit!14684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14684)

(assert (=> b!495013 (= lt!224096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495014 () Bool)

(declare-fun res!297581 () Bool)

(assert (=> b!495014 (=> (not res!297581) (not e!290417))))

(assert (=> b!495014 (= res!297581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495015 () Bool)

(declare-fun res!297579 () Bool)

(assert (=> b!495015 (=> (not res!297579) (not e!290418))))

(assert (=> b!495015 (= res!297579 (and (= (size!15766 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15766 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15766 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495017 () Bool)

(declare-fun res!297582 () Bool)

(assert (=> b!495017 (=> (not res!297582) (not e!290418))))

(assert (=> b!495017 (= res!297582 (validKeyInArray!0 k!2280))))

(declare-fun b!495016 () Bool)

(assert (=> b!495016 (= e!290421 (= (seekEntryOrOpen!0 (select (arr!15402 a!3235) j!176) a!3235 mask!3524) (Found!3869 j!176)))))

(declare-fun res!297586 () Bool)

(assert (=> start!45090 (=> (not res!297586) (not e!290418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45090 (= res!297586 (validMask!0 mask!3524))))

(assert (=> start!45090 e!290418))

(assert (=> start!45090 true))

(declare-fun array_inv!11198 (array!32035) Bool)

(assert (=> start!45090 (array_inv!11198 a!3235)))

(assert (= (and start!45090 res!297586) b!495015))

(assert (= (and b!495015 res!297579) b!495008))

(assert (= (and b!495008 res!297577) b!495017))

(assert (= (and b!495017 res!297582) b!495011))

(assert (= (and b!495011 res!297578) b!495007))

(assert (= (and b!495007 res!297584) b!495014))

(assert (= (and b!495014 res!297581) b!495009))

(assert (= (and b!495009 res!297580) b!495013))

(assert (= (and b!495013 res!297587) b!495016))

(assert (= (and b!495013 (not res!297585)) b!495012))

(assert (= (and b!495012 (not res!297583)) b!495010))

(declare-fun m!476157 () Bool)

(assert (=> b!495009 m!476157))

(declare-fun m!476159 () Bool)

(assert (=> b!495014 m!476159))

(declare-fun m!476161 () Bool)

(assert (=> b!495008 m!476161))

(assert (=> b!495008 m!476161))

(declare-fun m!476163 () Bool)

(assert (=> b!495008 m!476163))

(assert (=> b!495016 m!476161))

(assert (=> b!495016 m!476161))

(declare-fun m!476165 () Bool)

(assert (=> b!495016 m!476165))

(declare-fun m!476167 () Bool)

(assert (=> start!45090 m!476167))

(declare-fun m!476169 () Bool)

(assert (=> start!45090 m!476169))

(declare-fun m!476171 () Bool)

(assert (=> b!495011 m!476171))

(declare-fun m!476173 () Bool)

(assert (=> b!495017 m!476173))

(declare-fun m!476175 () Bool)

(assert (=> b!495007 m!476175))

(declare-fun m!476177 () Bool)

(assert (=> b!495010 m!476177))

(assert (=> b!495010 m!476161))

(declare-fun m!476179 () Bool)

(assert (=> b!495013 m!476179))

(declare-fun m!476181 () Bool)

(assert (=> b!495013 m!476181))

(declare-fun m!476183 () Bool)

(assert (=> b!495013 m!476183))

(assert (=> b!495013 m!476161))

(declare-fun m!476185 () Bool)

(assert (=> b!495013 m!476185))

(assert (=> b!495013 m!476161))

(declare-fun m!476187 () Bool)

(assert (=> b!495013 m!476187))

(assert (=> b!495013 m!476161))

(declare-fun m!476189 () Bool)

(assert (=> b!495013 m!476189))

(assert (=> b!495013 m!476183))

(declare-fun m!476191 () Bool)

(assert (=> b!495013 m!476191))

(assert (=> b!495013 m!476183))

(declare-fun m!476193 () Bool)

(assert (=> b!495013 m!476193))

(push 1)

(assert (not b!495008))

(assert (not b!495007))

(assert (not b!495013))

(assert (not b!495016))

(assert (not b!495009))

(assert (not b!495014))

(assert (not b!495017))

(assert (not start!45090))

(assert (not b!495011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78243 () Bool)

(declare-fun res!297665 () Bool)

(declare-fun e!290462 () Bool)

(assert (=> d!78243 (=> res!297665 e!290462)))

(assert (=> d!78243 (= res!297665 (= (select (arr!15402 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78243 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!290462)))

(declare-fun b!495094 () Bool)

(declare-fun e!290463 () Bool)

(assert (=> b!495094 (= e!290462 e!290463)))

(declare-fun res!297666 () Bool)

(assert (=> b!495094 (=> (not res!297666) (not e!290463))))

(assert (=> b!495094 (= res!297666 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15766 a!3235)))))

(declare-fun b!495095 () Bool)

(assert (=> b!495095 (= e!290463 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78243 (not res!297665)) b!495094))

(assert (= (and b!495094 res!297666) b!495095))

(declare-fun m!476275 () Bool)

(assert (=> d!78243 m!476275))

(declare-fun m!476277 () Bool)

(assert (=> b!495095 m!476277))

(assert (=> b!495011 d!78243))

(declare-fun d!78249 () Bool)

(assert (=> d!78249 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!495017 d!78249))

(declare-fun d!78253 () Bool)

(assert (=> d!78253 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45090 d!78253))

(declare-fun d!78259 () Bool)

(assert (=> d!78259 (= (array_inv!11198 a!3235) (bvsge (size!15766 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45090 d!78259))

(declare-fun b!495144 () Bool)

(declare-fun e!290497 () SeekEntryResult!3869)

(declare-fun e!290495 () SeekEntryResult!3869)

(assert (=> b!495144 (= e!290497 e!290495)))

(declare-fun lt!224155 () (_ BitVec 64))

(declare-fun lt!224156 () SeekEntryResult!3869)

(assert (=> b!495144 (= lt!224155 (select (arr!15402 a!3235) (index!17657 lt!224156)))))

(declare-fun c!59005 () Bool)

(assert (=> b!495144 (= c!59005 (= lt!224155 (select (arr!15402 a!3235) j!176)))))

(declare-fun d!78261 () Bool)

(declare-fun lt!224154 () SeekEntryResult!3869)

(assert (=> d!78261 (and (or (is-Undefined!3869 lt!224154) (not (is-Found!3869 lt!224154)) (and (bvsge (index!17656 lt!224154) #b00000000000000000000000000000000) (bvslt (index!17656 lt!224154) (size!15766 a!3235)))) (or (is-Undefined!3869 lt!224154) (is-Found!3869 lt!224154) (not (is-MissingZero!3869 lt!224154)) (and (bvsge (index!17655 lt!224154) #b00000000000000000000000000000000) (bvslt (index!17655 lt!224154) (size!15766 a!3235)))) (or (is-Undefined!3869 lt!224154) (is-Found!3869 lt!224154) (is-MissingZero!3869 lt!224154) (not (is-MissingVacant!3869 lt!224154)) (and (bvsge (index!17658 lt!224154) #b00000000000000000000000000000000) (bvslt (index!17658 lt!224154) (size!15766 a!3235)))) (or (is-Undefined!3869 lt!224154) (ite (is-Found!3869 lt!224154) (= (select (arr!15402 a!3235) (index!17656 lt!224154)) (select (arr!15402 a!3235) j!176)) (ite (is-MissingZero!3869 lt!224154) (= (select (arr!15402 a!3235) (index!17655 lt!224154)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3869 lt!224154) (= (select (arr!15402 a!3235) (index!17658 lt!224154)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78261 (= lt!224154 e!290497)))

(declare-fun c!59004 () Bool)

(assert (=> d!78261 (= c!59004 (and (is-Intermediate!3869 lt!224156) (undefined!4681 lt!224156)))))

(assert (=> d!78261 (= lt!224156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15402 a!3235) j!176) mask!3524) (select (arr!15402 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78261 (validMask!0 mask!3524)))

(assert (=> d!78261 (= (seekEntryOrOpen!0 (select (arr!15402 a!3235) j!176) a!3235 mask!3524) lt!224154)))

(declare-fun b!495145 () Bool)

(declare-fun e!290496 () SeekEntryResult!3869)

(assert (=> b!495145 (= e!290496 (MissingZero!3869 (index!17657 lt!224156)))))

(declare-fun b!495146 () Bool)

(assert (=> b!495146 (= e!290497 Undefined!3869)))

(declare-fun b!495147 () Bool)

(assert (=> b!495147 (= e!290495 (Found!3869 (index!17657 lt!224156)))))

(declare-fun b!495148 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32035 (_ BitVec 32)) SeekEntryResult!3869)

(assert (=> b!495148 (= e!290496 (seekKeyOrZeroReturnVacant!0 (x!46723 lt!224156) (index!17657 lt!224156) (index!17657 lt!224156) (select (arr!15402 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!495149 () Bool)

(declare-fun c!59006 () Bool)

(assert (=> b!495149 (= c!59006 (= lt!224155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495149 (= e!290495 e!290496)))

(assert (= (and d!78261 c!59004) b!495146))

(assert (= (and d!78261 (not c!59004)) b!495144))

(assert (= (and b!495144 c!59005) b!495147))

(assert (= (and b!495144 (not c!59005)) b!495149))

(assert (= (and b!495149 c!59006) b!495145))

(assert (= (and b!495149 (not c!59006)) b!495148))

(declare-fun m!476289 () Bool)

(assert (=> b!495144 m!476289))

(assert (=> d!78261 m!476167))

(declare-fun m!476291 () Bool)

(assert (=> d!78261 m!476291))

(assert (=> d!78261 m!476161))

(assert (=> d!78261 m!476185))

(assert (=> d!78261 m!476185))

(assert (=> d!78261 m!476161))

(declare-fun m!476293 () Bool)

(assert (=> d!78261 m!476293))

(declare-fun m!476295 () Bool)

(assert (=> d!78261 m!476295))

(declare-fun m!476297 () Bool)

(assert (=> d!78261 m!476297))

(assert (=> b!495148 m!476161))

(declare-fun m!476299 () Bool)

(assert (=> b!495148 m!476299))

(assert (=> b!495016 d!78261))

(declare-fun b!495200 () Bool)

(declare-fun e!290528 () Bool)

(declare-fun call!31415 () Bool)

(assert (=> b!495200 (= e!290528 call!31415)))

(declare-fun d!78271 () Bool)

(declare-fun res!297697 () Bool)

(declare-fun e!290527 () Bool)

(assert (=> d!78271 (=> res!297697 e!290527)))

(assert (=> d!78271 (= res!297697 (bvsge #b00000000000000000000000000000000 (size!15766 a!3235)))))

(assert (=> d!78271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!290527)))

(declare-fun b!495201 () Bool)

(declare-fun e!290526 () Bool)

(assert (=> b!495201 (= e!290526 call!31415)))

(declare-fun b!495202 () Bool)

(assert (=> b!495202 (= e!290527 e!290526)))

(declare-fun c!59027 () Bool)

(assert (=> b!495202 (= c!59027 (validKeyInArray!0 (select (arr!15402 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31412 () Bool)

(assert (=> bm!31412 (= call!31415 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!495203 () Bool)

(assert (=> b!495203 (= e!290526 e!290528)))

(declare-fun lt!224184 () (_ BitVec 64))

(assert (=> b!495203 (= lt!224184 (select (arr!15402 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!224186 () Unit!14684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32035 (_ BitVec 64) (_ BitVec 32)) Unit!14684)

(assert (=> b!495203 (= lt!224186 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!224184 #b00000000000000000000000000000000))))

(assert (=> b!495203 (arrayContainsKey!0 a!3235 lt!224184 #b00000000000000000000000000000000)))

(declare-fun lt!224185 () Unit!14684)

(assert (=> b!495203 (= lt!224185 lt!224186)))

(declare-fun res!297696 () Bool)

(assert (=> b!495203 (= res!297696 (= (seekEntryOrOpen!0 (select (arr!15402 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3869 #b00000000000000000000000000000000)))))

(assert (=> b!495203 (=> (not res!297696) (not e!290528))))

(assert (= (and d!78271 (not res!297697)) b!495202))

(assert (= (and b!495202 c!59027) b!495203))

(assert (= (and b!495202 (not c!59027)) b!495201))

(assert (= (and b!495203 res!297696) b!495200))

(assert (= (or b!495200 b!495201) bm!31412))

(assert (=> b!495202 m!476275))

(assert (=> b!495202 m!476275))

(declare-fun m!476345 () Bool)

(assert (=> b!495202 m!476345))

(declare-fun m!476347 () Bool)

(assert (=> bm!31412 m!476347))

(assert (=> b!495203 m!476275))

(declare-fun m!476349 () Bool)

(assert (=> b!495203 m!476349))

(declare-fun m!476351 () Bool)

(assert (=> b!495203 m!476351))

(assert (=> b!495203 m!476275))

(declare-fun m!476353 () Bool)

(assert (=> b!495203 m!476353))

(assert (=> b!495014 d!78271))

(declare-fun b!495214 () Bool)

(declare-fun e!290539 () Bool)

(declare-fun call!31418 () Bool)

(assert (=> b!495214 (= e!290539 call!31418)))

(declare-fun b!495215 () Bool)

(declare-fun e!290537 () Bool)

(assert (=> b!495215 (= e!290537 e!290539)))

(declare-fun c!59030 () Bool)

(assert (=> b!495215 (= c!59030 (validKeyInArray!0 (select (arr!15402 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!495216 () Bool)

(declare-fun e!290540 () Bool)

(assert (=> b!495216 (= e!290540 e!290537)))

(declare-fun res!297704 () Bool)

(assert (=> b!495216 (=> (not res!297704) (not e!290537))))

(declare-fun e!290538 () Bool)

(assert (=> b!495216 (= res!297704 (not e!290538))))

(declare-fun res!297706 () Bool)

(assert (=> b!495216 (=> (not res!297706) (not e!290538))))

(assert (=> b!495216 (= res!297706 (validKeyInArray!0 (select (arr!15402 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!495217 () Bool)

(declare-fun contains!2714 (List!9560 (_ BitVec 64)) Bool)

(assert (=> b!495217 (= e!290538 (contains!2714 Nil!9557 (select (arr!15402 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31415 () Bool)

(assert (=> bm!31415 (= call!31418 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59030 (Cons!9556 (select (arr!15402 a!3235) #b00000000000000000000000000000000) Nil!9557) Nil!9557)))))

(declare-fun b!495218 () Bool)

(assert (=> b!495218 (= e!290539 call!31418)))

(declare-fun d!78289 () Bool)

(declare-fun res!297705 () Bool)

(assert (=> d!78289 (=> res!297705 e!290540)))

(assert (=> d!78289 (= res!297705 (bvsge #b00000000000000000000000000000000 (size!15766 a!3235)))))

(assert (=> d!78289 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9557) e!290540)))

(assert (= (and d!78289 (not res!297705)) b!495216))

(assert (= (and b!495216 res!297706) b!495217))

(assert (= (and b!495216 res!297704) b!495215))

(assert (= (and b!495215 c!59030) b!495214))

(assert (= (and b!495215 (not c!59030)) b!495218))

(assert (= (or b!495214 b!495218) bm!31415))

(assert (=> b!495215 m!476275))

(assert (=> b!495215 m!476275))

(assert (=> b!495215 m!476345))

(assert (=> b!495216 m!476275))

(assert (=> b!495216 m!476275))

(assert (=> b!495216 m!476345))

(assert (=> b!495217 m!476275))

(assert (=> b!495217 m!476275))

(declare-fun m!476355 () Bool)

(assert (=> b!495217 m!476355))

(assert (=> bm!31415 m!476275))

(declare-fun m!476357 () Bool)

(assert (=> bm!31415 m!476357))

(assert (=> b!495009 d!78289))

(declare-fun b!495219 () Bool)

(declare-fun e!290543 () SeekEntryResult!3869)

(declare-fun e!290541 () SeekEntryResult!3869)

(assert (=> b!495219 (= e!290543 e!290541)))

(declare-fun lt!224194 () (_ BitVec 64))

(declare-fun lt!224195 () SeekEntryResult!3869)

(assert (=> b!495219 (= lt!224194 (select (arr!15402 a!3235) (index!17657 lt!224195)))))

(declare-fun c!59032 () Bool)

(assert (=> b!495219 (= c!59032 (= lt!224194 k!2280))))

(declare-fun d!78293 () Bool)

(declare-fun lt!224193 () SeekEntryResult!3869)

(assert (=> d!78293 (and (or (is-Undefined!3869 lt!224193) (not (is-Found!3869 lt!224193)) (and (bvsge (index!17656 lt!224193) #b00000000000000000000000000000000) (bvslt (index!17656 lt!224193) (size!15766 a!3235)))) (or (is-Undefined!3869 lt!224193) (is-Found!3869 lt!224193) (not (is-MissingZero!3869 lt!224193)) (and (bvsge (index!17655 lt!224193) #b00000000000000000000000000000000) (bvslt (index!17655 lt!224193) (size!15766 a!3235)))) (or (is-Undefined!3869 lt!224193) (is-Found!3869 lt!224193) (is-MissingZero!3869 lt!224193) (not (is-MissingVacant!3869 lt!224193)) (and (bvsge (index!17658 lt!224193) #b00000000000000000000000000000000) (bvslt (index!17658 lt!224193) (size!15766 a!3235)))) (or (is-Undefined!3869 lt!224193) (ite (is-Found!3869 lt!224193) (= (select (arr!15402 a!3235) (index!17656 lt!224193)) k!2280) (ite (is-MissingZero!3869 lt!224193) (= (select (arr!15402 a!3235) (index!17655 lt!224193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3869 lt!224193) (= (select (arr!15402 a!3235) (index!17658 lt!224193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78293 (= lt!224193 e!290543)))

(declare-fun c!59031 () Bool)

(assert (=> d!78293 (= c!59031 (and (is-Intermediate!3869 lt!224195) (undefined!4681 lt!224195)))))

(assert (=> d!78293 (= lt!224195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78293 (validMask!0 mask!3524)))

(assert (=> d!78293 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!224193)))

(declare-fun b!495220 () Bool)

(declare-fun e!290542 () SeekEntryResult!3869)

(assert (=> b!495220 (= e!290542 (MissingZero!3869 (index!17657 lt!224195)))))

(declare-fun b!495221 () Bool)

(assert (=> b!495221 (= e!290543 Undefined!3869)))

(declare-fun b!495222 () Bool)

(assert (=> b!495222 (= e!290541 (Found!3869 (index!17657 lt!224195)))))

(declare-fun b!495223 () Bool)

(assert (=> b!495223 (= e!290542 (seekKeyOrZeroReturnVacant!0 (x!46723 lt!224195) (index!17657 lt!224195) (index!17657 lt!224195) k!2280 a!3235 mask!3524))))

(declare-fun b!495224 () Bool)

(declare-fun c!59033 () Bool)

(assert (=> b!495224 (= c!59033 (= lt!224194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495224 (= e!290541 e!290542)))

(assert (= (and d!78293 c!59031) b!495221))

(assert (= (and d!78293 (not c!59031)) b!495219))

(assert (= (and b!495219 c!59032) b!495222))

(assert (= (and b!495219 (not c!59032)) b!495224))

(assert (= (and b!495224 c!59033) b!495220))

(assert (= (and b!495224 (not c!59033)) b!495223))

(declare-fun m!476359 () Bool)

(assert (=> b!495219 m!476359))

(assert (=> d!78293 m!476167))

(declare-fun m!476361 () Bool)

(assert (=> d!78293 m!476361))

(declare-fun m!476363 () Bool)

(assert (=> d!78293 m!476363))

(assert (=> d!78293 m!476363))

(declare-fun m!476365 () Bool)

(assert (=> d!78293 m!476365))

(declare-fun m!476367 () Bool)

(assert (=> d!78293 m!476367))

(declare-fun m!476369 () Bool)

(assert (=> d!78293 m!476369))

(declare-fun m!476371 () Bool)

(assert (=> b!495223 m!476371))

(assert (=> b!495007 d!78293))

(declare-fun lt!224222 () SeekEntryResult!3869)

(declare-fun b!495313 () Bool)

(assert (=> b!495313 (and (bvsge (index!17657 lt!224222) #b00000000000000000000000000000000) (bvslt (index!17657 lt!224222) (size!15766 (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235)))))))

(declare-fun e!290596 () Bool)

(assert (=> b!495313 (= e!290596 (= (select (arr!15402 (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235))) (index!17657 lt!224222)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!495314 () Bool)

(declare-fun e!290597 () SeekEntryResult!3869)

(declare-fun e!290600 () SeekEntryResult!3869)

(assert (=> b!495314 (= e!290597 e!290600)))

(declare-fun c!59067 () Bool)

(declare-fun lt!224221 () (_ BitVec 64))

(assert (=> b!495314 (= c!59067 (or (= lt!224221 (select (store (arr!15402 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!224221 lt!224221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495315 () Bool)

(declare-fun e!290599 () Bool)

(assert (=> b!495315 (= e!290599 (bvsge (x!46723 lt!224222) #b01111111111111111111111111111110))))

(declare-fun b!495316 () Bool)

(assert (=> b!495316 (= e!290600 (Intermediate!3869 false lt!224094 #b00000000000000000000000000000000))))

(declare-fun b!495317 () Bool)

(declare-fun e!290598 () Bool)

(assert (=> b!495317 (= e!290599 e!290598)))

(declare-fun res!297735 () Bool)

(assert (=> b!495317 (= res!297735 (and (is-Intermediate!3869 lt!224222) (not (undefined!4681 lt!224222)) (bvslt (x!46723 lt!224222) #b01111111111111111111111111111110) (bvsge (x!46723 lt!224222) #b00000000000000000000000000000000) (bvsge (x!46723 lt!224222) #b00000000000000000000000000000000)))))

(assert (=> b!495317 (=> (not res!297735) (not e!290598))))

(declare-fun b!495318 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495318 (= e!290600 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!224094 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235)) mask!3524))))

(declare-fun b!495319 () Bool)

(assert (=> b!495319 (= e!290597 (Intermediate!3869 true lt!224094 #b00000000000000000000000000000000))))

(declare-fun b!495320 () Bool)

(assert (=> b!495320 (and (bvsge (index!17657 lt!224222) #b00000000000000000000000000000000) (bvslt (index!17657 lt!224222) (size!15766 (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235)))))))

(declare-fun res!297734 () Bool)

(assert (=> b!495320 (= res!297734 (= (select (arr!15402 (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235))) (index!17657 lt!224222)) (select (store (arr!15402 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!495320 (=> res!297734 e!290596)))

(assert (=> b!495320 (= e!290598 e!290596)))

(declare-fun d!78295 () Bool)

(assert (=> d!78295 e!290599))

(declare-fun c!59065 () Bool)

(assert (=> d!78295 (= c!59065 (and (is-Intermediate!3869 lt!224222) (undefined!4681 lt!224222)))))

(assert (=> d!78295 (= lt!224222 e!290597)))

(declare-fun c!59066 () Bool)

(assert (=> d!78295 (= c!59066 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78295 (= lt!224221 (select (arr!15402 (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235))) lt!224094))))

(assert (=> d!78295 (validMask!0 mask!3524)))

(assert (=> d!78295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224094 (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235)) mask!3524) lt!224222)))

(declare-fun b!495321 () Bool)

(assert (=> b!495321 (and (bvsge (index!17657 lt!224222) #b00000000000000000000000000000000) (bvslt (index!17657 lt!224222) (size!15766 (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235)))))))

(declare-fun res!297733 () Bool)

(assert (=> b!495321 (= res!297733 (= (select (arr!15402 (array!32036 (store (arr!15402 a!3235) i!1204 k!2280) (size!15766 a!3235))) (index!17657 lt!224222)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495321 (=> res!297733 e!290596)))

(assert (= (and d!78295 c!59066) b!495319))

(assert (= (and d!78295 (not c!59066)) b!495314))

(assert (= (and b!495314 c!59067) b!495316))

(assert (= (and b!495314 (not c!59067)) b!495318))

(assert (= (and d!78295 c!59065) b!495315))

(assert (= (and d!78295 (not c!59065)) b!495317))

(assert (= (and b!495317 res!297735) b!495320))

(assert (= (and b!495320 (not res!297734)) b!495321))

(assert (= (and b!495321 (not res!297733)) b!495313))

(declare-fun m!476421 () Bool)

(assert (=> b!495313 m!476421))

(assert (=> b!495321 m!476421))

(declare-fun m!476423 () Bool)

(assert (=> d!78295 m!476423))

(assert (=> d!78295 m!476167))

(assert (=> b!495320 m!476421))

(declare-fun m!476425 () Bool)

(assert (=> b!495318 m!476425))

(assert (=> b!495318 m!476425))

(assert (=> b!495318 m!476183))

(declare-fun m!476427 () Bool)

(assert (=> b!495318 m!476427))

(assert (=> b!495013 d!78295))

(declare-fun d!78307 () Bool)

(declare-fun lt!224239 () (_ BitVec 32))

(declare-fun lt!224238 () (_ BitVec 32))

(assert (=> d!78307 (= lt!224239 (bvmul (bvxor lt!224238 (bvlshr lt!224238 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78307 (= lt!224238 ((_ extract 31 0) (bvand (bvxor (select (arr!15402 a!3235) j!176) (bvlshr (select (arr!15402 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78307 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297740 (let ((h!10429 ((_ extract 31 0) (bvand (bvxor (select (arr!15402 a!3235) j!176) (bvlshr (select (arr!15402 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46731 (bvmul (bvxor h!10429 (bvlshr h!10429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46731 (bvlshr x!46731 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297740 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297740 #b00000000000000000000000000000000))))))

(assert (=> d!78307 (= (toIndex!0 (select (arr!15402 a!3235) j!176) mask!3524) (bvand (bvxor lt!224239 (bvlshr lt!224239 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!495013 d!78307))

(declare-fun b!495343 () Bool)

(declare-fun e!290617 () Bool)

(declare-fun call!31426 () Bool)

(assert (=> b!495343 (= e!290617 call!31426)))

(declare-fun d!78313 () Bool)

(declare-fun res!297747 () Bool)

(declare-fun e!290616 () Bool)

(assert (=> d!78313 (=> res!297747 e!290616)))

(assert (=> d!78313 (= res!297747 (bvsge j!176 (size!15766 a!3235)))))

(assert (=> d!78313 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!290616)))

(declare-fun b!495344 () Bool)

(declare-fun e!290615 () Bool)

(assert (=> b!495344 (= e!290615 call!31426)))

(declare-fun b!495345 () Bool)

(assert (=> b!495345 (= e!290616 e!290615)))

(declare-fun c!59074 () Bool)

(assert (=> b!495345 (= c!59074 (validKeyInArray!0 (select (arr!15402 a!3235) j!176)))))

(declare-fun bm!31423 () Bool)

(assert (=> bm!31423 (= call!31426 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!495346 () Bool)

(assert (=> b!495346 (= e!290615 e!290617)))

(declare-fun lt!224240 () (_ BitVec 64))

(assert (=> b!495346 (= lt!224240 (select (arr!15402 a!3235) j!176))))

(declare-fun lt!224242 () Unit!14684)

(assert (=> b!495346 (= lt!224242 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!224240 j!176))))

(assert (=> b!495346 (arrayContainsKey!0 a!3235 lt!224240 #b00000000000000000000000000000000)))

(declare-fun lt!224241 () Unit!14684)

(assert (=> b!495346 (= lt!224241 lt!224242)))

(declare-fun res!297746 () Bool)

(assert (=> b!495346 (= res!297746 (= (seekEntryOrOpen!0 (select (arr!15402 a!3235) j!176) a!3235 mask!3524) (Found!3869 j!176)))))

(assert (=> b!495346 (=> (not res!297746) (not e!290617))))

(assert (= (and d!78313 (not res!297747)) b!495345))

(assert (= (and b!495345 c!59074) b!495346))

(assert (= (and b!495345 (not c!59074)) b!495344))

(assert (= (and b!495346 res!297746) b!495343))

(assert (= (or b!495343 b!495344) bm!31423))

(assert (=> b!495345 m!476161))

(assert (=> b!495345 m!476161))

(assert (=> b!495345 m!476163))

(declare-fun m!476443 () Bool)

(assert (=> bm!31423 m!476443))

(assert (=> b!495346 m!476161))

(declare-fun m!476445 () Bool)

(assert (=> b!495346 m!476445))

(declare-fun m!476447 () Bool)

(assert (=> b!495346 m!476447))

(assert (=> b!495346 m!476161))

(assert (=> b!495346 m!476165))

(assert (=> b!495013 d!78313))

(declare-fun d!78315 () Bool)

(assert (=> d!78315 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!224250 () Unit!14684)

(declare-fun choose!38 (array!32035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14684)

(assert (=> d!78315 (= lt!224250 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78315 (validMask!0 mask!3524)))

(assert (=> d!78315 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!224250)))

(declare-fun bs!15783 () Bool)

(assert (= bs!15783 d!78315))

(assert (=> bs!15783 m!476189))

(declare-fun m!476451 () Bool)

(assert (=> bs!15783 m!476451))

(assert (=> bs!15783 m!476167))

(assert (=> b!495013 d!78315))

(declare-fun d!78321 () Bool)

(declare-fun lt!224252 () (_ BitVec 32))

(declare-fun lt!224251 () (_ BitVec 32))

(assert (=> d!78321 (= lt!224252 (bvmul (bvxor lt!224251 (bvlshr lt!224251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78321 (= lt!224251 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78321 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297740 (let ((h!10429 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46731 (bvmul (bvxor h!10429 (bvlshr h!10429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46731 (bvlshr x!46731 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297740 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297740 #b00000000000000000000000000000000))))))

(assert (=> d!78321 (= (toIndex!0 (select (store (arr!15402 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!224252 (bvlshr lt!224252 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!495013 d!78321))

(declare-fun b!495349 () Bool)

(declare-fun lt!224254 () SeekEntryResult!3869)

(assert (=> b!495349 (and (bvsge (index!17657 lt!224254) #b00000000000000000000000000000000) (bvslt (index!17657 lt!224254) (size!15766 a!3235)))))

(declare-fun e!290622 () Bool)

(assert (=> b!495349 (= e!290622 (= (select (arr!15402 a!3235) (index!17657 lt!224254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!495350 () Bool)

(declare-fun e!290625 () SeekEntryResult!3869)

(declare-fun e!290628 () SeekEntryResult!3869)

(assert (=> b!495350 (= e!290625 e!290628)))

(declare-fun c!59077 () Bool)

(declare-fun lt!224253 () (_ BitVec 64))

(assert (=> b!495350 (= c!59077 (or (= lt!224253 (select (arr!15402 a!3235) j!176)) (= (bvadd lt!224253 lt!224253) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495351 () Bool)

(declare-fun e!290627 () Bool)

(assert (=> b!495351 (= e!290627 (bvsge (x!46723 lt!224254) #b01111111111111111111111111111110))))

(declare-fun b!495352 () Bool)

(assert (=> b!495352 (= e!290628 (Intermediate!3869 false lt!224095 #b00000000000000000000000000000000))))

(declare-fun b!495354 () Bool)

(declare-fun e!290626 () Bool)

(assert (=> b!495354 (= e!290627 e!290626)))

(declare-fun res!297756 () Bool)

(assert (=> b!495354 (= res!297756 (and (is-Intermediate!3869 lt!224254) (not (undefined!4681 lt!224254)) (bvslt (x!46723 lt!224254) #b01111111111111111111111111111110) (bvsge (x!46723 lt!224254) #b00000000000000000000000000000000) (bvsge (x!46723 lt!224254) #b00000000000000000000000000000000)))))

(assert (=> b!495354 (=> (not res!297756) (not e!290626))))

(declare-fun b!495356 () Bool)

(assert (=> b!495356 (= e!290628 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!224095 #b00000000000000000000000000000000 mask!3524) (select (arr!15402 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!495357 () Bool)

(assert (=> b!495357 (= e!290625 (Intermediate!3869 true lt!224095 #b00000000000000000000000000000000))))

(declare-fun b!495358 () Bool)

(assert (=> b!495358 (and (bvsge (index!17657 lt!224254) #b00000000000000000000000000000000) (bvslt (index!17657 lt!224254) (size!15766 a!3235)))))

(declare-fun res!297755 () Bool)

(assert (=> b!495358 (= res!297755 (= (select (arr!15402 a!3235) (index!17657 lt!224254)) (select (arr!15402 a!3235) j!176)))))

(assert (=> b!495358 (=> res!297755 e!290622)))

(assert (=> b!495358 (= e!290626 e!290622)))

(declare-fun d!78323 () Bool)

(assert (=> d!78323 e!290627))

(declare-fun c!59075 () Bool)

(assert (=> d!78323 (= c!59075 (and (is-Intermediate!3869 lt!224254) (undefined!4681 lt!224254)))))

(assert (=> d!78323 (= lt!224254 e!290625)))

(declare-fun c!59076 () Bool)

(assert (=> d!78323 (= c!59076 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78323 (= lt!224253 (select (arr!15402 a!3235) lt!224095))))

(assert (=> d!78323 (validMask!0 mask!3524)))

(assert (=> d!78323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224095 (select (arr!15402 a!3235) j!176) a!3235 mask!3524) lt!224254)))

(declare-fun b!495359 () Bool)

(assert (=> b!495359 (and (bvsge (index!17657 lt!224254) #b00000000000000000000000000000000) (bvslt (index!17657 lt!224254) (size!15766 a!3235)))))

(declare-fun res!297752 () Bool)

(assert (=> b!495359 (= res!297752 (= (select (arr!15402 a!3235) (index!17657 lt!224254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495359 (=> res!297752 e!290622)))

(assert (= (and d!78323 c!59076) b!495357))

(assert (= (and d!78323 (not c!59076)) b!495350))

(assert (= (and b!495350 c!59077) b!495352))

(assert (= (and b!495350 (not c!59077)) b!495356))

(assert (= (and d!78323 c!59075) b!495351))

(assert (= (and d!78323 (not c!59075)) b!495354))

(assert (= (and b!495354 res!297756) b!495358))

(assert (= (and b!495358 (not res!297755)) b!495359))

(assert (= (and b!495359 (not res!297752)) b!495349))

(declare-fun m!476453 () Bool)

(assert (=> b!495349 m!476453))

(assert (=> b!495359 m!476453))

(declare-fun m!476455 () Bool)

(assert (=> d!78323 m!476455))

(assert (=> d!78323 m!476167))

(assert (=> b!495358 m!476453))

(declare-fun m!476457 () Bool)

(assert (=> b!495356 m!476457))

(assert (=> b!495356 m!476457))

(assert (=> b!495356 m!476161))

(declare-fun m!476459 () Bool)

(assert (=> b!495356 m!476459))

(assert (=> b!495013 d!78323))

(declare-fun d!78325 () Bool)

(assert (=> d!78325 (= (validKeyInArray!0 (select (arr!15402 a!3235) j!176)) (and (not (= (select (arr!15402 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15402 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!495008 d!78325))

(push 1)

