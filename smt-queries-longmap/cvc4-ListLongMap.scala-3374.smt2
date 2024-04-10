; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46420 () Bool)

(assert start!46420)

(declare-fun b!513589 () Bool)

(declare-fun res!313888 () Bool)

(declare-fun e!299892 () Bool)

(assert (=> b!513589 (=> (not res!313888) (not e!299892))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32960 0))(
  ( (array!32961 (arr!15854 (Array (_ BitVec 32) (_ BitVec 64))) (size!16218 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32960)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!513589 (= res!313888 (and (= (size!16218 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16218 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16218 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513590 () Bool)

(declare-fun res!313894 () Bool)

(declare-fun e!299891 () Bool)

(assert (=> b!513590 (=> (not res!313894) (not e!299891))))

(declare-datatypes ((List!10012 0))(
  ( (Nil!10009) (Cons!10008 (h!10894 (_ BitVec 64)) (t!16240 List!10012)) )
))
(declare-fun arrayNoDuplicates!0 (array!32960 (_ BitVec 32) List!10012) Bool)

(assert (=> b!513590 (= res!313894 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10009))))

(declare-fun b!513591 () Bool)

(declare-fun res!313889 () Bool)

(declare-fun e!299893 () Bool)

(assert (=> b!513591 (=> res!313889 e!299893)))

(declare-datatypes ((SeekEntryResult!4321 0))(
  ( (MissingZero!4321 (index!19472 (_ BitVec 32))) (Found!4321 (index!19473 (_ BitVec 32))) (Intermediate!4321 (undefined!5133 Bool) (index!19474 (_ BitVec 32)) (x!48420 (_ BitVec 32))) (Undefined!4321) (MissingVacant!4321 (index!19475 (_ BitVec 32))) )
))
(declare-fun lt!235138 () SeekEntryResult!4321)

(assert (=> b!513591 (= res!313889 (or (undefined!5133 lt!235138) (not (is-Intermediate!4321 lt!235138))))))

(declare-fun res!313890 () Bool)

(assert (=> start!46420 (=> (not res!313890) (not e!299892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46420 (= res!313890 (validMask!0 mask!3524))))

(assert (=> start!46420 e!299892))

(assert (=> start!46420 true))

(declare-fun array_inv!11650 (array!32960) Bool)

(assert (=> start!46420 (array_inv!11650 a!3235)))

(declare-fun b!513592 () Bool)

(assert (=> b!513592 (= e!299892 e!299891)))

(declare-fun res!313892 () Bool)

(assert (=> b!513592 (=> (not res!313892) (not e!299891))))

(declare-fun lt!235136 () SeekEntryResult!4321)

(assert (=> b!513592 (= res!313892 (or (= lt!235136 (MissingZero!4321 i!1204)) (= lt!235136 (MissingVacant!4321 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32960 (_ BitVec 32)) SeekEntryResult!4321)

(assert (=> b!513592 (= lt!235136 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!513593 () Bool)

(declare-fun res!313891 () Bool)

(assert (=> b!513593 (=> (not res!313891) (not e!299891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32960 (_ BitVec 32)) Bool)

(assert (=> b!513593 (= res!313891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513594 () Bool)

(assert (=> b!513594 (= e!299893 (or (= (select (arr!15854 a!3235) (index!19474 lt!235138)) (select (arr!15854 a!3235) j!176)) (and (bvsge (index!19474 lt!235138) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235138) (size!16218 a!3235)))))))

(assert (=> b!513594 (bvslt (x!48420 lt!235138) #b01111111111111111111111111111110)))

(declare-fun b!513595 () Bool)

(declare-fun res!313893 () Bool)

(assert (=> b!513595 (=> (not res!313893) (not e!299892))))

(declare-fun arrayContainsKey!0 (array!32960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513595 (= res!313893 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513596 () Bool)

(declare-fun res!313886 () Bool)

(assert (=> b!513596 (=> (not res!313886) (not e!299892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513596 (= res!313886 (validKeyInArray!0 (select (arr!15854 a!3235) j!176)))))

(declare-fun b!513597 () Bool)

(declare-fun e!299894 () Bool)

(assert (=> b!513597 (= e!299894 (= (seekEntryOrOpen!0 (select (arr!15854 a!3235) j!176) a!3235 mask!3524) (Found!4321 j!176)))))

(declare-fun b!513598 () Bool)

(assert (=> b!513598 (= e!299891 (not e!299893))))

(declare-fun res!313887 () Bool)

(assert (=> b!513598 (=> res!313887 e!299893)))

(declare-fun lt!235137 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32960 (_ BitVec 32)) SeekEntryResult!4321)

(assert (=> b!513598 (= res!313887 (= lt!235138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235137 (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235)) mask!3524)))))

(declare-fun lt!235134 () (_ BitVec 32))

(assert (=> b!513598 (= lt!235138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235134 (select (arr!15854 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513598 (= lt!235137 (toIndex!0 (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!513598 (= lt!235134 (toIndex!0 (select (arr!15854 a!3235) j!176) mask!3524))))

(assert (=> b!513598 e!299894))

(declare-fun res!313885 () Bool)

(assert (=> b!513598 (=> (not res!313885) (not e!299894))))

(assert (=> b!513598 (= res!313885 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15900 0))(
  ( (Unit!15901) )
))
(declare-fun lt!235135 () Unit!15900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15900)

(assert (=> b!513598 (= lt!235135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513599 () Bool)

(declare-fun res!313895 () Bool)

(assert (=> b!513599 (=> (not res!313895) (not e!299892))))

(assert (=> b!513599 (= res!313895 (validKeyInArray!0 k!2280))))

(assert (= (and start!46420 res!313890) b!513589))

(assert (= (and b!513589 res!313888) b!513596))

(assert (= (and b!513596 res!313886) b!513599))

(assert (= (and b!513599 res!313895) b!513595))

(assert (= (and b!513595 res!313893) b!513592))

(assert (= (and b!513592 res!313892) b!513593))

(assert (= (and b!513593 res!313891) b!513590))

(assert (= (and b!513590 res!313894) b!513598))

(assert (= (and b!513598 res!313885) b!513597))

(assert (= (and b!513598 (not res!313887)) b!513591))

(assert (= (and b!513591 (not res!313889)) b!513594))

(declare-fun m!495169 () Bool)

(assert (=> b!513595 m!495169))

(declare-fun m!495171 () Bool)

(assert (=> b!513598 m!495171))

(declare-fun m!495173 () Bool)

(assert (=> b!513598 m!495173))

(declare-fun m!495175 () Bool)

(assert (=> b!513598 m!495175))

(declare-fun m!495177 () Bool)

(assert (=> b!513598 m!495177))

(declare-fun m!495179 () Bool)

(assert (=> b!513598 m!495179))

(assert (=> b!513598 m!495177))

(declare-fun m!495181 () Bool)

(assert (=> b!513598 m!495181))

(assert (=> b!513598 m!495177))

(declare-fun m!495183 () Bool)

(assert (=> b!513598 m!495183))

(assert (=> b!513598 m!495175))

(declare-fun m!495185 () Bool)

(assert (=> b!513598 m!495185))

(assert (=> b!513598 m!495175))

(declare-fun m!495187 () Bool)

(assert (=> b!513598 m!495187))

(declare-fun m!495189 () Bool)

(assert (=> b!513593 m!495189))

(declare-fun m!495191 () Bool)

(assert (=> b!513599 m!495191))

(assert (=> b!513597 m!495177))

(assert (=> b!513597 m!495177))

(declare-fun m!495193 () Bool)

(assert (=> b!513597 m!495193))

(declare-fun m!495195 () Bool)

(assert (=> b!513590 m!495195))

(declare-fun m!495197 () Bool)

(assert (=> b!513594 m!495197))

(assert (=> b!513594 m!495177))

(declare-fun m!495199 () Bool)

(assert (=> b!513592 m!495199))

(assert (=> b!513596 m!495177))

(assert (=> b!513596 m!495177))

(declare-fun m!495201 () Bool)

(assert (=> b!513596 m!495201))

(declare-fun m!495203 () Bool)

(assert (=> start!46420 m!495203))

(declare-fun m!495205 () Bool)

(assert (=> start!46420 m!495205))

(push 1)

(assert (not b!513593))

(assert (not b!513598))

(assert (not b!513596))

(assert (not b!513599))

(assert (not b!513597))

(assert (not start!46420))

(assert (not b!513595))

(assert (not b!513592))

(assert (not b!513590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!513696 () Bool)

(declare-fun e!299960 () Bool)

(declare-fun e!299964 () Bool)

(assert (=> b!513696 (= e!299960 e!299964)))

(declare-fun res!313934 () Bool)

(declare-fun lt!235180 () SeekEntryResult!4321)

(assert (=> b!513696 (= res!313934 (and (is-Intermediate!4321 lt!235180) (not (undefined!5133 lt!235180)) (bvslt (x!48420 lt!235180) #b01111111111111111111111111111110) (bvsge (x!48420 lt!235180) #b00000000000000000000000000000000) (bvsge (x!48420 lt!235180) #b00000000000000000000000000000000)))))

(assert (=> b!513696 (=> (not res!313934) (not e!299964))))

(declare-fun b!513697 () Bool)

(assert (=> b!513697 (and (bvsge (index!19474 lt!235180) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235180) (size!16218 a!3235)))))

(declare-fun res!313933 () Bool)

(assert (=> b!513697 (= res!313933 (= (select (arr!15854 a!3235) (index!19474 lt!235180)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299963 () Bool)

(assert (=> b!513697 (=> res!313933 e!299963)))

(declare-fun b!513698 () Bool)

(declare-fun e!299962 () SeekEntryResult!4321)

(assert (=> b!513698 (= e!299962 (Intermediate!4321 true lt!235134 #b00000000000000000000000000000000))))

(declare-fun b!513699 () Bool)

(assert (=> b!513699 (= e!299960 (bvsge (x!48420 lt!235180) #b01111111111111111111111111111110))))

(declare-fun d!79189 () Bool)

(assert (=> d!79189 e!299960))

(declare-fun c!60165 () Bool)

(assert (=> d!79189 (= c!60165 (and (is-Intermediate!4321 lt!235180) (undefined!5133 lt!235180)))))

(assert (=> d!79189 (= lt!235180 e!299962)))

(declare-fun c!60167 () Bool)

(assert (=> d!79189 (= c!60167 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235179 () (_ BitVec 64))

(assert (=> d!79189 (= lt!235179 (select (arr!15854 a!3235) lt!235134))))

(assert (=> d!79189 (validMask!0 mask!3524)))

(assert (=> d!79189 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235134 (select (arr!15854 a!3235) j!176) a!3235 mask!3524) lt!235180)))

(declare-fun b!513700 () Bool)

(assert (=> b!513700 (and (bvsge (index!19474 lt!235180) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235180) (size!16218 a!3235)))))

(assert (=> b!513700 (= e!299963 (= (select (arr!15854 a!3235) (index!19474 lt!235180)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513701 () Bool)

(assert (=> b!513701 (and (bvsge (index!19474 lt!235180) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235180) (size!16218 a!3235)))))

(declare-fun res!313935 () Bool)

(assert (=> b!513701 (= res!313935 (= (select (arr!15854 a!3235) (index!19474 lt!235180)) (select (arr!15854 a!3235) j!176)))))

(assert (=> b!513701 (=> res!313935 e!299963)))

(assert (=> b!513701 (= e!299964 e!299963)))

(declare-fun e!299961 () SeekEntryResult!4321)

(declare-fun b!513702 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513702 (= e!299961 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235134 #b00000000000000000000000000000000 mask!3524) (select (arr!15854 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513703 () Bool)

(assert (=> b!513703 (= e!299961 (Intermediate!4321 false lt!235134 #b00000000000000000000000000000000))))

(declare-fun b!513704 () Bool)

(assert (=> b!513704 (= e!299962 e!299961)))

(declare-fun c!60166 () Bool)

(assert (=> b!513704 (= c!60166 (or (= lt!235179 (select (arr!15854 a!3235) j!176)) (= (bvadd lt!235179 lt!235179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79189 c!60167) b!513698))

(assert (= (and d!79189 (not c!60167)) b!513704))

(assert (= (and b!513704 c!60166) b!513703))

(assert (= (and b!513704 (not c!60166)) b!513702))

(assert (= (and d!79189 c!60165) b!513699))

(assert (= (and d!79189 (not c!60165)) b!513696))

(assert (= (and b!513696 res!313934) b!513701))

(assert (= (and b!513701 (not res!313935)) b!513697))

(assert (= (and b!513697 (not res!313933)) b!513700))

(declare-fun m!495263 () Bool)

(assert (=> b!513697 m!495263))

(assert (=> b!513701 m!495263))

(declare-fun m!495265 () Bool)

(assert (=> d!79189 m!495265))

(assert (=> d!79189 m!495203))

(assert (=> b!513700 m!495263))

(declare-fun m!495267 () Bool)

(assert (=> b!513702 m!495267))

(assert (=> b!513702 m!495267))

(assert (=> b!513702 m!495177))

(declare-fun m!495269 () Bool)

(assert (=> b!513702 m!495269))

(assert (=> b!513598 d!79189))

(declare-fun d!79205 () Bool)

(declare-fun lt!235186 () (_ BitVec 32))

(declare-fun lt!235185 () (_ BitVec 32))

(assert (=> d!79205 (= lt!235186 (bvmul (bvxor lt!235185 (bvlshr lt!235185 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79205 (= lt!235185 ((_ extract 31 0) (bvand (bvxor (select (arr!15854 a!3235) j!176) (bvlshr (select (arr!15854 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79205 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313936 (let ((h!10896 ((_ extract 31 0) (bvand (bvxor (select (arr!15854 a!3235) j!176) (bvlshr (select (arr!15854 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48423 (bvmul (bvxor h!10896 (bvlshr h!10896 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48423 (bvlshr x!48423 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313936 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313936 #b00000000000000000000000000000000))))))

(assert (=> d!79205 (= (toIndex!0 (select (arr!15854 a!3235) j!176) mask!3524) (bvand (bvxor lt!235186 (bvlshr lt!235186 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513598 d!79205))

(declare-fun b!513758 () Bool)

(declare-fun e!299996 () Bool)

(declare-fun e!299998 () Bool)

(assert (=> b!513758 (= e!299996 e!299998)))

(declare-fun lt!235203 () (_ BitVec 64))

(assert (=> b!513758 (= lt!235203 (select (arr!15854 a!3235) j!176))))

(declare-fun lt!235205 () Unit!15900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32960 (_ BitVec 64) (_ BitVec 32)) Unit!15900)

(assert (=> b!513758 (= lt!235205 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235203 j!176))))

(assert (=> b!513758 (arrayContainsKey!0 a!3235 lt!235203 #b00000000000000000000000000000000)))

(declare-fun lt!235204 () Unit!15900)

(assert (=> b!513758 (= lt!235204 lt!235205)))

(declare-fun res!313956 () Bool)

(assert (=> b!513758 (= res!313956 (= (seekEntryOrOpen!0 (select (arr!15854 a!3235) j!176) a!3235 mask!3524) (Found!4321 j!176)))))

(assert (=> b!513758 (=> (not res!313956) (not e!299998))))

(declare-fun call!31571 () Bool)

(declare-fun bm!31568 () Bool)

(assert (=> bm!31568 (= call!31571 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79207 () Bool)

(declare-fun res!313957 () Bool)

(declare-fun e!299997 () Bool)

(assert (=> d!79207 (=> res!313957 e!299997)))

(assert (=> d!79207 (= res!313957 (bvsge j!176 (size!16218 a!3235)))))

(assert (=> d!79207 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299997)))

(declare-fun b!513759 () Bool)

(assert (=> b!513759 (= e!299997 e!299996)))

(declare-fun c!60185 () Bool)

(assert (=> b!513759 (= c!60185 (validKeyInArray!0 (select (arr!15854 a!3235) j!176)))))

(declare-fun b!513760 () Bool)

(assert (=> b!513760 (= e!299998 call!31571)))

(declare-fun b!513761 () Bool)

(assert (=> b!513761 (= e!299996 call!31571)))

(assert (= (and d!79207 (not res!313957)) b!513759))

(assert (= (and b!513759 c!60185) b!513758))

(assert (= (and b!513759 (not c!60185)) b!513761))

(assert (= (and b!513758 res!313956) b!513760))

(assert (= (or b!513760 b!513761) bm!31568))

(assert (=> b!513758 m!495177))

(declare-fun m!495279 () Bool)

(assert (=> b!513758 m!495279))

(declare-fun m!495281 () Bool)

(assert (=> b!513758 m!495281))

(assert (=> b!513758 m!495177))

(assert (=> b!513758 m!495193))

(declare-fun m!495283 () Bool)

(assert (=> bm!31568 m!495283))

(assert (=> b!513759 m!495177))

(assert (=> b!513759 m!495177))

(assert (=> b!513759 m!495201))

(assert (=> b!513598 d!79207))

(declare-fun d!79211 () Bool)

(assert (=> d!79211 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235216 () Unit!15900)

(declare-fun choose!38 (array!32960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15900)

(assert (=> d!79211 (= lt!235216 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79211 (validMask!0 mask!3524)))

(assert (=> d!79211 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235216)))

(declare-fun bs!16256 () Bool)

(assert (= bs!16256 d!79211))

(assert (=> bs!16256 m!495183))

(declare-fun m!495295 () Bool)

(assert (=> bs!16256 m!495295))

(assert (=> bs!16256 m!495203))

(assert (=> b!513598 d!79211))

(declare-fun d!79217 () Bool)

(declare-fun lt!235218 () (_ BitVec 32))

(declare-fun lt!235217 () (_ BitVec 32))

(assert (=> d!79217 (= lt!235218 (bvmul (bvxor lt!235217 (bvlshr lt!235217 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79217 (= lt!235217 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79217 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313936 (let ((h!10896 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48423 (bvmul (bvxor h!10896 (bvlshr h!10896 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48423 (bvlshr x!48423 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313936 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313936 #b00000000000000000000000000000000))))))

(assert (=> d!79217 (= (toIndex!0 (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235218 (bvlshr lt!235218 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513598 d!79217))

(declare-fun b!513784 () Bool)

(declare-fun e!300012 () Bool)

(declare-fun e!300016 () Bool)

(assert (=> b!513784 (= e!300012 e!300016)))

(declare-fun res!313968 () Bool)

(declare-fun lt!235222 () SeekEntryResult!4321)

(assert (=> b!513784 (= res!313968 (and (is-Intermediate!4321 lt!235222) (not (undefined!5133 lt!235222)) (bvslt (x!48420 lt!235222) #b01111111111111111111111111111110) (bvsge (x!48420 lt!235222) #b00000000000000000000000000000000) (bvsge (x!48420 lt!235222) #b00000000000000000000000000000000)))))

(assert (=> b!513784 (=> (not res!313968) (not e!300016))))

(declare-fun b!513785 () Bool)

(assert (=> b!513785 (and (bvsge (index!19474 lt!235222) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235222) (size!16218 (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235)))))))

(declare-fun res!313967 () Bool)

(assert (=> b!513785 (= res!313967 (= (select (arr!15854 (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235))) (index!19474 lt!235222)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300015 () Bool)

(assert (=> b!513785 (=> res!313967 e!300015)))

(declare-fun b!513786 () Bool)

(declare-fun e!300014 () SeekEntryResult!4321)

(assert (=> b!513786 (= e!300014 (Intermediate!4321 true lt!235137 #b00000000000000000000000000000000))))

(declare-fun b!513787 () Bool)

(assert (=> b!513787 (= e!300012 (bvsge (x!48420 lt!235222) #b01111111111111111111111111111110))))

(declare-fun d!79221 () Bool)

(assert (=> d!79221 e!300012))

(declare-fun c!60193 () Bool)

(assert (=> d!79221 (= c!60193 (and (is-Intermediate!4321 lt!235222) (undefined!5133 lt!235222)))))

(assert (=> d!79221 (= lt!235222 e!300014)))

(declare-fun c!60195 () Bool)

(assert (=> d!79221 (= c!60195 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235221 () (_ BitVec 64))

(assert (=> d!79221 (= lt!235221 (select (arr!15854 (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235))) lt!235137))))

(assert (=> d!79221 (validMask!0 mask!3524)))

(assert (=> d!79221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235137 (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235)) mask!3524) lt!235222)))

(declare-fun b!513788 () Bool)

(assert (=> b!513788 (and (bvsge (index!19474 lt!235222) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235222) (size!16218 (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235)))))))

(assert (=> b!513788 (= e!300015 (= (select (arr!15854 (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235))) (index!19474 lt!235222)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513789 () Bool)

(assert (=> b!513789 (and (bvsge (index!19474 lt!235222) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235222) (size!16218 (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235)))))))

(declare-fun res!313969 () Bool)

(assert (=> b!513789 (= res!313969 (= (select (arr!15854 (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235))) (index!19474 lt!235222)) (select (store (arr!15854 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!513789 (=> res!313969 e!300015)))

(assert (=> b!513789 (= e!300016 e!300015)))

(declare-fun e!300013 () SeekEntryResult!4321)

(declare-fun b!513790 () Bool)

(assert (=> b!513790 (= e!300013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235137 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15854 a!3235) i!1204 k!2280) j!176) (array!32961 (store (arr!15854 a!3235) i!1204 k!2280) (size!16218 a!3235)) mask!3524))))

(declare-fun b!513791 () Bool)

(assert (=> b!513791 (= e!300013 (Intermediate!4321 false lt!235137 #b00000000000000000000000000000000))))

(declare-fun b!513792 () Bool)

(assert (=> b!513792 (= e!300014 e!300013)))

(declare-fun c!60194 () Bool)

(assert (=> b!513792 (= c!60194 (or (= lt!235221 (select (store (arr!15854 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235221 lt!235221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79221 c!60195) b!513786))

(assert (= (and d!79221 (not c!60195)) b!513792))

(assert (= (and b!513792 c!60194) b!513791))

(assert (= (and b!513792 (not c!60194)) b!513790))

(assert (= (and d!79221 c!60193) b!513787))

(assert (= (and d!79221 (not c!60193)) b!513784))

(assert (= (and b!513784 res!313968) b!513789))

(assert (= (and b!513789 (not res!313969)) b!513785))

(assert (= (and b!513785 (not res!313967)) b!513788))

(declare-fun m!495309 () Bool)

(assert (=> b!513785 m!495309))

(assert (=> b!513789 m!495309))

(declare-fun m!495313 () Bool)

(assert (=> d!79221 m!495313))

(assert (=> d!79221 m!495203))

(assert (=> b!513788 m!495309))

(declare-fun m!495315 () Bool)

(assert (=> b!513790 m!495315))

(assert (=> b!513790 m!495315))

(assert (=> b!513790 m!495175))

(declare-fun m!495317 () Bool)

(assert (=> b!513790 m!495317))

(assert (=> b!513598 d!79221))

(declare-fun b!513793 () Bool)

(declare-fun e!300017 () Bool)

(declare-fun e!300019 () Bool)

(assert (=> b!513793 (= e!300017 e!300019)))

(declare-fun lt!235227 () (_ BitVec 64))

(assert (=> b!513793 (= lt!235227 (select (arr!15854 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235229 () Unit!15900)

(assert (=> b!513793 (= lt!235229 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235227 #b00000000000000000000000000000000))))

(assert (=> b!513793 (arrayContainsKey!0 a!3235 lt!235227 #b00000000000000000000000000000000)))

(declare-fun lt!235228 () Unit!15900)

(assert (=> b!513793 (= lt!235228 lt!235229)))

(declare-fun res!313970 () Bool)

(assert (=> b!513793 (= res!313970 (= (seekEntryOrOpen!0 (select (arr!15854 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4321 #b00000000000000000000000000000000)))))

(assert (=> b!513793 (=> (not res!313970) (not e!300019))))

(declare-fun bm!31570 () Bool)

(declare-fun call!31573 () Bool)

(assert (=> bm!31570 (= call!31573 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79225 () Bool)

(declare-fun res!313971 () Bool)

(declare-fun e!300018 () Bool)

(assert (=> d!79225 (=> res!313971 e!300018)))

(assert (=> d!79225 (= res!313971 (bvsge #b00000000000000000000000000000000 (size!16218 a!3235)))))

(assert (=> d!79225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300018)))

(declare-fun b!513794 () Bool)

(assert (=> b!513794 (= e!300018 e!300017)))

(declare-fun c!60196 () Bool)

(assert (=> b!513794 (= c!60196 (validKeyInArray!0 (select (arr!15854 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513795 () Bool)

(assert (=> b!513795 (= e!300019 call!31573)))

(declare-fun b!513796 () Bool)

(assert (=> b!513796 (= e!300017 call!31573)))

(assert (= (and d!79225 (not res!313971)) b!513794))

(assert (= (and b!513794 c!60196) b!513793))

(assert (= (and b!513794 (not c!60196)) b!513796))

(assert (= (and b!513793 res!313970) b!513795))

(assert (= (or b!513795 b!513796) bm!31570))

(declare-fun m!495319 () Bool)

(assert (=> b!513793 m!495319))

(declare-fun m!495321 () Bool)

(assert (=> b!513793 m!495321))

(declare-fun m!495323 () Bool)

(assert (=> b!513793 m!495323))

(assert (=> b!513793 m!495319))

(declare-fun m!495325 () Bool)

(assert (=> b!513793 m!495325))

(declare-fun m!495327 () Bool)

(assert (=> bm!31570 m!495327))

(assert (=> b!513794 m!495319))

(assert (=> b!513794 m!495319))

(declare-fun m!495329 () Bool)

(assert (=> b!513794 m!495329))

(assert (=> b!513593 d!79225))

(declare-fun e!300044 () SeekEntryResult!4321)

(declare-fun lt!235253 () SeekEntryResult!4321)

(declare-fun b!513836 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32960 (_ BitVec 32)) SeekEntryResult!4321)

(assert (=> b!513836 (= e!300044 (seekKeyOrZeroReturnVacant!0 (x!48420 lt!235253) (index!19474 lt!235253) (index!19474 lt!235253) (select (arr!15854 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513837 () Bool)

(declare-fun e!300045 () SeekEntryResult!4321)

(assert (=> b!513837 (= e!300045 (Found!4321 (index!19474 lt!235253)))))

(declare-fun b!513838 () Bool)

(assert (=> b!513838 (= e!300044 (MissingZero!4321 (index!19474 lt!235253)))))

(declare-fun d!79229 () Bool)

(declare-fun lt!235254 () SeekEntryResult!4321)

(assert (=> d!79229 (and (or (is-Undefined!4321 lt!235254) (not (is-Found!4321 lt!235254)) (and (bvsge (index!19473 lt!235254) #b00000000000000000000000000000000) (bvslt (index!19473 lt!235254) (size!16218 a!3235)))) (or (is-Undefined!4321 lt!235254) (is-Found!4321 lt!235254) (not (is-MissingZero!4321 lt!235254)) (and (bvsge (index!19472 lt!235254) #b00000000000000000000000000000000) (bvslt (index!19472 lt!235254) (size!16218 a!3235)))) (or (is-Undefined!4321 lt!235254) (is-Found!4321 lt!235254) (is-MissingZero!4321 lt!235254) (not (is-MissingVacant!4321 lt!235254)) (and (bvsge (index!19475 lt!235254) #b00000000000000000000000000000000) (bvslt (index!19475 lt!235254) (size!16218 a!3235)))) (or (is-Undefined!4321 lt!235254) (ite (is-Found!4321 lt!235254) (= (select (arr!15854 a!3235) (index!19473 lt!235254)) (select (arr!15854 a!3235) j!176)) (ite (is-MissingZero!4321 lt!235254) (= (select (arr!15854 a!3235) (index!19472 lt!235254)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4321 lt!235254) (= (select (arr!15854 a!3235) (index!19475 lt!235254)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300043 () SeekEntryResult!4321)

(assert (=> d!79229 (= lt!235254 e!300043)))

(declare-fun c!60212 () Bool)

(assert (=> d!79229 (= c!60212 (and (is-Intermediate!4321 lt!235253) (undefined!5133 lt!235253)))))

(assert (=> d!79229 (= lt!235253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15854 a!3235) j!176) mask!3524) (select (arr!15854 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79229 (validMask!0 mask!3524)))

(assert (=> d!79229 (= (seekEntryOrOpen!0 (select (arr!15854 a!3235) j!176) a!3235 mask!3524) lt!235254)))

(declare-fun b!513839 () Bool)

(assert (=> b!513839 (= e!300043 e!300045)))

(declare-fun lt!235255 () (_ BitVec 64))

(assert (=> b!513839 (= lt!235255 (select (arr!15854 a!3235) (index!19474 lt!235253)))))

(declare-fun c!60213 () Bool)

(assert (=> b!513839 (= c!60213 (= lt!235255 (select (arr!15854 a!3235) j!176)))))

(declare-fun b!513840 () Bool)

(declare-fun c!60214 () Bool)

(assert (=> b!513840 (= c!60214 (= lt!235255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513840 (= e!300045 e!300044)))

(declare-fun b!513841 () Bool)

(assert (=> b!513841 (= e!300043 Undefined!4321)))

(assert (= (and d!79229 c!60212) b!513841))

(assert (= (and d!79229 (not c!60212)) b!513839))

(assert (= (and b!513839 c!60213) b!513837))

(assert (= (and b!513839 (not c!60213)) b!513840))

(assert (= (and b!513840 c!60214) b!513838))

(assert (= (and b!513840 (not c!60214)) b!513836))

(assert (=> b!513836 m!495177))

(declare-fun m!495343 () Bool)

(assert (=> b!513836 m!495343))

(declare-fun m!495345 () Bool)

(assert (=> d!79229 m!495345))

(declare-fun m!495347 () Bool)

(assert (=> d!79229 m!495347))

(assert (=> d!79229 m!495203))

(declare-fun m!495349 () Bool)

(assert (=> d!79229 m!495349))

(assert (=> d!79229 m!495181))

(assert (=> d!79229 m!495177))

(declare-fun m!495351 () Bool)

(assert (=> d!79229 m!495351))

(assert (=> d!79229 m!495177))

(assert (=> d!79229 m!495181))

(declare-fun m!495353 () Bool)

(assert (=> b!513839 m!495353))

(assert (=> b!513597 d!79229))

(declare-fun e!300047 () SeekEntryResult!4321)

(declare-fun lt!235256 () SeekEntryResult!4321)

(declare-fun b!513842 () Bool)

(assert (=> b!513842 (= e!300047 (seekKeyOrZeroReturnVacant!0 (x!48420 lt!235256) (index!19474 lt!235256) (index!19474 lt!235256) k!2280 a!3235 mask!3524))))

(declare-fun b!513843 () Bool)

(declare-fun e!300048 () SeekEntryResult!4321)

(assert (=> b!513843 (= e!300048 (Found!4321 (index!19474 lt!235256)))))

(declare-fun b!513844 () Bool)

(assert (=> b!513844 (= e!300047 (MissingZero!4321 (index!19474 lt!235256)))))

(declare-fun d!79241 () Bool)

(declare-fun lt!235257 () SeekEntryResult!4321)

(assert (=> d!79241 (and (or (is-Undefined!4321 lt!235257) (not (is-Found!4321 lt!235257)) (and (bvsge (index!19473 lt!235257) #b00000000000000000000000000000000) (bvslt (index!19473 lt!235257) (size!16218 a!3235)))) (or (is-Undefined!4321 lt!235257) (is-Found!4321 lt!235257) (not (is-MissingZero!4321 lt!235257)) (and (bvsge (index!19472 lt!235257) #b00000000000000000000000000000000) (bvslt (index!19472 lt!235257) (size!16218 a!3235)))) (or (is-Undefined!4321 lt!235257) (is-Found!4321 lt!235257) (is-MissingZero!4321 lt!235257) (not (is-MissingVacant!4321 lt!235257)) (and (bvsge (index!19475 lt!235257) #b00000000000000000000000000000000) (bvslt (index!19475 lt!235257) (size!16218 a!3235)))) (or (is-Undefined!4321 lt!235257) (ite (is-Found!4321 lt!235257) (= (select (arr!15854 a!3235) (index!19473 lt!235257)) k!2280) (ite (is-MissingZero!4321 lt!235257) (= (select (arr!15854 a!3235) (index!19472 lt!235257)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4321 lt!235257) (= (select (arr!15854 a!3235) (index!19475 lt!235257)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300046 () SeekEntryResult!4321)

(assert (=> d!79241 (= lt!235257 e!300046)))

(declare-fun c!60215 () Bool)

(assert (=> d!79241 (= c!60215 (and (is-Intermediate!4321 lt!235256) (undefined!5133 lt!235256)))))

(assert (=> d!79241 (= lt!235256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79241 (validMask!0 mask!3524)))

(assert (=> d!79241 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!235257)))

(declare-fun b!513845 () Bool)

(assert (=> b!513845 (= e!300046 e!300048)))

(declare-fun lt!235258 () (_ BitVec 64))

(assert (=> b!513845 (= lt!235258 (select (arr!15854 a!3235) (index!19474 lt!235256)))))

(declare-fun c!60216 () Bool)

(assert (=> b!513845 (= c!60216 (= lt!235258 k!2280))))

(declare-fun b!513846 () Bool)

(declare-fun c!60217 () Bool)

(assert (=> b!513846 (= c!60217 (= lt!235258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513846 (= e!300048 e!300047)))

(declare-fun b!513847 () Bool)

(assert (=> b!513847 (= e!300046 Undefined!4321)))

(assert (= (and d!79241 c!60215) b!513847))

(assert (= (and d!79241 (not c!60215)) b!513845))

(assert (= (and b!513845 c!60216) b!513843))

(assert (= (and b!513845 (not c!60216)) b!513846))

(assert (= (and b!513846 c!60217) b!513844))

(assert (= (and b!513846 (not c!60217)) b!513842))

(declare-fun m!495355 () Bool)

(assert (=> b!513842 m!495355))

(declare-fun m!495357 () Bool)

(assert (=> d!79241 m!495357))

(declare-fun m!495359 () Bool)

(assert (=> d!79241 m!495359))

(assert (=> d!79241 m!495203))

(declare-fun m!495361 () Bool)

(assert (=> d!79241 m!495361))

(declare-fun m!495363 () Bool)

(assert (=> d!79241 m!495363))

(declare-fun m!495365 () Bool)

(assert (=> d!79241 m!495365))

(assert (=> d!79241 m!495363))

(declare-fun m!495367 () Bool)

(assert (=> b!513845 m!495367))

(assert (=> b!513592 d!79241))

(declare-fun d!79243 () Bool)

(declare-fun res!313989 () Bool)

(declare-fun e!300060 () Bool)

(assert (=> d!79243 (=> res!313989 e!300060)))

(assert (=> d!79243 (= res!313989 (= (select (arr!15854 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79243 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!300060)))

(declare-fun b!513862 () Bool)

(declare-fun e!300061 () Bool)

(assert (=> b!513862 (= e!300060 e!300061)))

(declare-fun res!313990 () Bool)

(assert (=> b!513862 (=> (not res!313990) (not e!300061))))

(assert (=> b!513862 (= res!313990 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16218 a!3235)))))

(declare-fun b!513863 () Bool)

(assert (=> b!513863 (= e!300061 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79243 (not res!313989)) b!513862))

(assert (= (and b!513862 res!313990) b!513863))

(assert (=> d!79243 m!495319))

(declare-fun m!495383 () Bool)

(assert (=> b!513863 m!495383))

(assert (=> b!513595 d!79243))

(declare-fun bm!31573 () Bool)

(declare-fun call!31576 () Bool)

(declare-fun c!60226 () Bool)

(assert (=> bm!31573 (= call!31576 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60226 (Cons!10008 (select (arr!15854 a!3235) #b00000000000000000000000000000000) Nil!10009) Nil!10009)))))

(declare-fun d!79247 () Bool)

(declare-fun res!314000 () Bool)

(declare-fun e!300077 () Bool)

(assert (=> d!79247 (=> res!314000 e!300077)))

