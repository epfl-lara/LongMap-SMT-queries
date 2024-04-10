; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47228 () Bool)

(assert start!47228)

(declare-fun b!519874 () Bool)

(declare-datatypes ((Unit!16116 0))(
  ( (Unit!16117) )
))
(declare-fun e!303345 () Unit!16116)

(declare-fun Unit!16118 () Unit!16116)

(assert (=> b!519874 (= e!303345 Unit!16118)))

(declare-fun b!519875 () Bool)

(declare-fun res!318210 () Bool)

(declare-fun e!303339 () Bool)

(assert (=> b!519875 (=> res!318210 e!303339)))

(declare-datatypes ((SeekEntryResult!4416 0))(
  ( (MissingZero!4416 (index!19861 (_ BitVec 32))) (Found!4416 (index!19862 (_ BitVec 32))) (Intermediate!4416 (undefined!5228 Bool) (index!19863 (_ BitVec 32)) (x!48840 (_ BitVec 32))) (Undefined!4416) (MissingVacant!4416 (index!19864 (_ BitVec 32))) )
))
(declare-fun lt!238088 () SeekEntryResult!4416)

(get-info :version)

(assert (=> b!519875 (= res!318210 (or (undefined!5228 lt!238088) (not ((_ is Intermediate!4416) lt!238088))))))

(declare-fun b!519876 () Bool)

(declare-fun res!318212 () Bool)

(declare-fun e!303344 () Bool)

(assert (=> b!519876 (=> (not res!318212) (not e!303344))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519876 (= res!318212 (validKeyInArray!0 k0!2280))))

(declare-fun b!519877 () Bool)

(declare-fun res!318208 () Bool)

(assert (=> b!519877 (=> (not res!318208) (not e!303344))))

(declare-datatypes ((array!33180 0))(
  ( (array!33181 (arr!15949 (Array (_ BitVec 32) (_ BitVec 64))) (size!16313 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33180)

(declare-fun arrayContainsKey!0 (array!33180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519877 (= res!318208 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519878 () Bool)

(declare-fun e!303340 () Bool)

(assert (=> b!519878 (= e!303340 (not e!303339))))

(declare-fun res!318209 () Bool)

(assert (=> b!519878 (=> res!318209 e!303339)))

(declare-fun lt!238093 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!238092 () array!33180)

(declare-fun lt!238087 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33180 (_ BitVec 32)) SeekEntryResult!4416)

(assert (=> b!519878 (= res!318209 (= lt!238088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238093 lt!238087 lt!238092 mask!3524)))))

(declare-fun lt!238089 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!519878 (= lt!238088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238089 (select (arr!15949 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519878 (= lt!238093 (toIndex!0 lt!238087 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!519878 (= lt!238087 (select (store (arr!15949 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!519878 (= lt!238089 (toIndex!0 (select (arr!15949 a!3235) j!176) mask!3524))))

(assert (=> b!519878 (= lt!238092 (array!33181 (store (arr!15949 a!3235) i!1204 k0!2280) (size!16313 a!3235)))))

(declare-fun e!303341 () Bool)

(assert (=> b!519878 e!303341))

(declare-fun res!318207 () Bool)

(assert (=> b!519878 (=> (not res!318207) (not e!303341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33180 (_ BitVec 32)) Bool)

(assert (=> b!519878 (= res!318207 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238091 () Unit!16116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16116)

(assert (=> b!519878 (= lt!238091 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519879 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33180 (_ BitVec 32)) SeekEntryResult!4416)

(assert (=> b!519879 (= e!303341 (= (seekEntryOrOpen!0 (select (arr!15949 a!3235) j!176) a!3235 mask!3524) (Found!4416 j!176)))))

(declare-fun b!519880 () Bool)

(declare-fun res!318214 () Bool)

(assert (=> b!519880 (=> (not res!318214) (not e!303340))))

(declare-datatypes ((List!10107 0))(
  ( (Nil!10104) (Cons!10103 (h!11019 (_ BitVec 64)) (t!16335 List!10107)) )
))
(declare-fun arrayNoDuplicates!0 (array!33180 (_ BitVec 32) List!10107) Bool)

(assert (=> b!519880 (= res!318214 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10104))))

(declare-fun b!519881 () Bool)

(declare-fun e!303343 () Bool)

(assert (=> b!519881 (= e!303343 false)))

(declare-fun b!519882 () Bool)

(declare-fun res!318206 () Bool)

(assert (=> b!519882 (=> (not res!318206) (not e!303344))))

(assert (=> b!519882 (= res!318206 (and (= (size!16313 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16313 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16313 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519883 () Bool)

(assert (=> b!519883 (= e!303344 e!303340)))

(declare-fun res!318215 () Bool)

(assert (=> b!519883 (=> (not res!318215) (not e!303340))))

(declare-fun lt!238086 () SeekEntryResult!4416)

(assert (=> b!519883 (= res!318215 (or (= lt!238086 (MissingZero!4416 i!1204)) (= lt!238086 (MissingVacant!4416 i!1204))))))

(assert (=> b!519883 (= lt!238086 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!519884 () Bool)

(declare-fun Unit!16119 () Unit!16116)

(assert (=> b!519884 (= e!303345 Unit!16119)))

(declare-fun lt!238090 () Unit!16116)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33180 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16116)

(assert (=> b!519884 (= lt!238090 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238089 #b00000000000000000000000000000000 (index!19863 lt!238088) (x!48840 lt!238088) mask!3524))))

(declare-fun res!318211 () Bool)

(assert (=> b!519884 (= res!318211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238089 lt!238087 lt!238092 mask!3524) (Intermediate!4416 false (index!19863 lt!238088) (x!48840 lt!238088))))))

(assert (=> b!519884 (=> (not res!318211) (not e!303343))))

(assert (=> b!519884 e!303343))

(declare-fun res!318213 () Bool)

(assert (=> start!47228 (=> (not res!318213) (not e!303344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47228 (= res!318213 (validMask!0 mask!3524))))

(assert (=> start!47228 e!303344))

(assert (=> start!47228 true))

(declare-fun array_inv!11745 (array!33180) Bool)

(assert (=> start!47228 (array_inv!11745 a!3235)))

(declare-fun b!519885 () Bool)

(assert (=> b!519885 (= e!303339 (not (= (select (arr!15949 a!3235) (index!19863 lt!238088)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!519885 (or (= (select (arr!15949 a!3235) (index!19863 lt!238088)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15949 a!3235) (index!19863 lt!238088)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238085 () Unit!16116)

(assert (=> b!519885 (= lt!238085 e!303345)))

(declare-fun c!61133 () Bool)

(assert (=> b!519885 (= c!61133 (= (select (arr!15949 a!3235) (index!19863 lt!238088)) (select (arr!15949 a!3235) j!176)))))

(assert (=> b!519885 (and (bvslt (x!48840 lt!238088) #b01111111111111111111111111111110) (or (= (select (arr!15949 a!3235) (index!19863 lt!238088)) (select (arr!15949 a!3235) j!176)) (= (select (arr!15949 a!3235) (index!19863 lt!238088)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15949 a!3235) (index!19863 lt!238088)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519886 () Bool)

(declare-fun res!318205 () Bool)

(assert (=> b!519886 (=> (not res!318205) (not e!303344))))

(assert (=> b!519886 (= res!318205 (validKeyInArray!0 (select (arr!15949 a!3235) j!176)))))

(declare-fun b!519887 () Bool)

(declare-fun res!318204 () Bool)

(assert (=> b!519887 (=> (not res!318204) (not e!303340))))

(assert (=> b!519887 (= res!318204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47228 res!318213) b!519882))

(assert (= (and b!519882 res!318206) b!519886))

(assert (= (and b!519886 res!318205) b!519876))

(assert (= (and b!519876 res!318212) b!519877))

(assert (= (and b!519877 res!318208) b!519883))

(assert (= (and b!519883 res!318215) b!519887))

(assert (= (and b!519887 res!318204) b!519880))

(assert (= (and b!519880 res!318214) b!519878))

(assert (= (and b!519878 res!318207) b!519879))

(assert (= (and b!519878 (not res!318209)) b!519875))

(assert (= (and b!519875 (not res!318210)) b!519885))

(assert (= (and b!519885 c!61133) b!519884))

(assert (= (and b!519885 (not c!61133)) b!519874))

(assert (= (and b!519884 res!318211) b!519881))

(declare-fun m!500973 () Bool)

(assert (=> b!519877 m!500973))

(declare-fun m!500975 () Bool)

(assert (=> b!519887 m!500975))

(declare-fun m!500977 () Bool)

(assert (=> b!519880 m!500977))

(declare-fun m!500979 () Bool)

(assert (=> b!519879 m!500979))

(assert (=> b!519879 m!500979))

(declare-fun m!500981 () Bool)

(assert (=> b!519879 m!500981))

(declare-fun m!500983 () Bool)

(assert (=> b!519878 m!500983))

(declare-fun m!500985 () Bool)

(assert (=> b!519878 m!500985))

(declare-fun m!500987 () Bool)

(assert (=> b!519878 m!500987))

(declare-fun m!500989 () Bool)

(assert (=> b!519878 m!500989))

(assert (=> b!519878 m!500979))

(declare-fun m!500991 () Bool)

(assert (=> b!519878 m!500991))

(assert (=> b!519878 m!500979))

(declare-fun m!500993 () Bool)

(assert (=> b!519878 m!500993))

(assert (=> b!519878 m!500979))

(declare-fun m!500995 () Bool)

(assert (=> b!519878 m!500995))

(declare-fun m!500997 () Bool)

(assert (=> b!519878 m!500997))

(assert (=> b!519886 m!500979))

(assert (=> b!519886 m!500979))

(declare-fun m!500999 () Bool)

(assert (=> b!519886 m!500999))

(declare-fun m!501001 () Bool)

(assert (=> start!47228 m!501001))

(declare-fun m!501003 () Bool)

(assert (=> start!47228 m!501003))

(declare-fun m!501005 () Bool)

(assert (=> b!519876 m!501005))

(declare-fun m!501007 () Bool)

(assert (=> b!519884 m!501007))

(declare-fun m!501009 () Bool)

(assert (=> b!519884 m!501009))

(declare-fun m!501011 () Bool)

(assert (=> b!519883 m!501011))

(declare-fun m!501013 () Bool)

(assert (=> b!519885 m!501013))

(assert (=> b!519885 m!500979))

(check-sat (not b!519876) (not b!519886) (not b!519880) (not b!519877) (not b!519883) (not b!519884) (not start!47228) (not b!519879) (not b!519878) (not b!519887))
(check-sat)
(get-model)

(declare-fun d!80175 () Bool)

(declare-fun lt!238126 () (_ BitVec 32))

(declare-fun lt!238125 () (_ BitVec 32))

(assert (=> d!80175 (= lt!238126 (bvmul (bvxor lt!238125 (bvlshr lt!238125 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80175 (= lt!238125 ((_ extract 31 0) (bvand (bvxor lt!238087 (bvlshr lt!238087 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80175 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318252 (let ((h!11021 ((_ extract 31 0) (bvand (bvxor lt!238087 (bvlshr lt!238087 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48842 (bvmul (bvxor h!11021 (bvlshr h!11021 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48842 (bvlshr x!48842 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318252 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318252 #b00000000000000000000000000000000))))))

(assert (=> d!80175 (= (toIndex!0 lt!238087 mask!3524) (bvand (bvxor lt!238126 (bvlshr lt!238126 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519878 d!80175))

(declare-fun b!519948 () Bool)

(declare-fun e!303379 () SeekEntryResult!4416)

(assert (=> b!519948 (= e!303379 (Intermediate!4416 true lt!238093 #b00000000000000000000000000000000))))

(declare-fun b!519949 () Bool)

(declare-fun lt!238132 () SeekEntryResult!4416)

(assert (=> b!519949 (and (bvsge (index!19863 lt!238132) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238132) (size!16313 lt!238092)))))

(declare-fun res!318260 () Bool)

(assert (=> b!519949 (= res!318260 (= (select (arr!15949 lt!238092) (index!19863 lt!238132)) lt!238087))))

(declare-fun e!303380 () Bool)

(assert (=> b!519949 (=> res!318260 e!303380)))

(declare-fun e!303377 () Bool)

(assert (=> b!519949 (= e!303377 e!303380)))

(declare-fun b!519950 () Bool)

(assert (=> b!519950 (and (bvsge (index!19863 lt!238132) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238132) (size!16313 lt!238092)))))

(declare-fun res!318259 () Bool)

(assert (=> b!519950 (= res!318259 (= (select (arr!15949 lt!238092) (index!19863 lt!238132)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519950 (=> res!318259 e!303380)))

(declare-fun b!519952 () Bool)

(declare-fun e!303381 () Bool)

(assert (=> b!519952 (= e!303381 (bvsge (x!48840 lt!238132) #b01111111111111111111111111111110))))

(declare-fun b!519953 () Bool)

(declare-fun e!303378 () SeekEntryResult!4416)

(assert (=> b!519953 (= e!303378 (Intermediate!4416 false lt!238093 #b00000000000000000000000000000000))))

(declare-fun b!519954 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519954 (= e!303378 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238093 #b00000000000000000000000000000000 mask!3524) lt!238087 lt!238092 mask!3524))))

(declare-fun b!519955 () Bool)

(assert (=> b!519955 (= e!303381 e!303377)))

(declare-fun res!318261 () Bool)

(assert (=> b!519955 (= res!318261 (and ((_ is Intermediate!4416) lt!238132) (not (undefined!5228 lt!238132)) (bvslt (x!48840 lt!238132) #b01111111111111111111111111111110) (bvsge (x!48840 lt!238132) #b00000000000000000000000000000000) (bvsge (x!48840 lt!238132) #b00000000000000000000000000000000)))))

(assert (=> b!519955 (=> (not res!318261) (not e!303377))))

(declare-fun b!519956 () Bool)

(assert (=> b!519956 (= e!303379 e!303378)))

(declare-fun c!61145 () Bool)

(declare-fun lt!238131 () (_ BitVec 64))

(assert (=> b!519956 (= c!61145 (or (= lt!238131 lt!238087) (= (bvadd lt!238131 lt!238131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519951 () Bool)

(assert (=> b!519951 (and (bvsge (index!19863 lt!238132) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238132) (size!16313 lt!238092)))))

(assert (=> b!519951 (= e!303380 (= (select (arr!15949 lt!238092) (index!19863 lt!238132)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80177 () Bool)

(assert (=> d!80177 e!303381))

(declare-fun c!61144 () Bool)

(assert (=> d!80177 (= c!61144 (and ((_ is Intermediate!4416) lt!238132) (undefined!5228 lt!238132)))))

(assert (=> d!80177 (= lt!238132 e!303379)))

(declare-fun c!61143 () Bool)

(assert (=> d!80177 (= c!61143 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80177 (= lt!238131 (select (arr!15949 lt!238092) lt!238093))))

(assert (=> d!80177 (validMask!0 mask!3524)))

(assert (=> d!80177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238093 lt!238087 lt!238092 mask!3524) lt!238132)))

(assert (= (and d!80177 c!61143) b!519948))

(assert (= (and d!80177 (not c!61143)) b!519956))

(assert (= (and b!519956 c!61145) b!519953))

(assert (= (and b!519956 (not c!61145)) b!519954))

(assert (= (and d!80177 c!61144) b!519952))

(assert (= (and d!80177 (not c!61144)) b!519955))

(assert (= (and b!519955 res!318261) b!519949))

(assert (= (and b!519949 (not res!318260)) b!519950))

(assert (= (and b!519950 (not res!318259)) b!519951))

(declare-fun m!501057 () Bool)

(assert (=> b!519951 m!501057))

(assert (=> b!519950 m!501057))

(declare-fun m!501059 () Bool)

(assert (=> d!80177 m!501059))

(assert (=> d!80177 m!501001))

(declare-fun m!501061 () Bool)

(assert (=> b!519954 m!501061))

(assert (=> b!519954 m!501061))

(declare-fun m!501063 () Bool)

(assert (=> b!519954 m!501063))

(assert (=> b!519949 m!501057))

(assert (=> b!519878 d!80177))

(declare-fun d!80179 () Bool)

(declare-fun lt!238134 () (_ BitVec 32))

(declare-fun lt!238133 () (_ BitVec 32))

(assert (=> d!80179 (= lt!238134 (bvmul (bvxor lt!238133 (bvlshr lt!238133 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80179 (= lt!238133 ((_ extract 31 0) (bvand (bvxor (select (arr!15949 a!3235) j!176) (bvlshr (select (arr!15949 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80179 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318252 (let ((h!11021 ((_ extract 31 0) (bvand (bvxor (select (arr!15949 a!3235) j!176) (bvlshr (select (arr!15949 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48842 (bvmul (bvxor h!11021 (bvlshr h!11021 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48842 (bvlshr x!48842 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318252 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318252 #b00000000000000000000000000000000))))))

(assert (=> d!80179 (= (toIndex!0 (select (arr!15949 a!3235) j!176) mask!3524) (bvand (bvxor lt!238134 (bvlshr lt!238134 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519878 d!80179))

(declare-fun b!519957 () Bool)

(declare-fun e!303384 () SeekEntryResult!4416)

(assert (=> b!519957 (= e!303384 (Intermediate!4416 true lt!238089 #b00000000000000000000000000000000))))

(declare-fun b!519958 () Bool)

(declare-fun lt!238136 () SeekEntryResult!4416)

(assert (=> b!519958 (and (bvsge (index!19863 lt!238136) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238136) (size!16313 a!3235)))))

(declare-fun res!318263 () Bool)

(assert (=> b!519958 (= res!318263 (= (select (arr!15949 a!3235) (index!19863 lt!238136)) (select (arr!15949 a!3235) j!176)))))

(declare-fun e!303385 () Bool)

(assert (=> b!519958 (=> res!318263 e!303385)))

(declare-fun e!303382 () Bool)

(assert (=> b!519958 (= e!303382 e!303385)))

(declare-fun b!519959 () Bool)

(assert (=> b!519959 (and (bvsge (index!19863 lt!238136) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238136) (size!16313 a!3235)))))

(declare-fun res!318262 () Bool)

(assert (=> b!519959 (= res!318262 (= (select (arr!15949 a!3235) (index!19863 lt!238136)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519959 (=> res!318262 e!303385)))

(declare-fun b!519961 () Bool)

(declare-fun e!303386 () Bool)

(assert (=> b!519961 (= e!303386 (bvsge (x!48840 lt!238136) #b01111111111111111111111111111110))))

(declare-fun b!519962 () Bool)

(declare-fun e!303383 () SeekEntryResult!4416)

(assert (=> b!519962 (= e!303383 (Intermediate!4416 false lt!238089 #b00000000000000000000000000000000))))

(declare-fun b!519963 () Bool)

(assert (=> b!519963 (= e!303383 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238089 #b00000000000000000000000000000000 mask!3524) (select (arr!15949 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519964 () Bool)

(assert (=> b!519964 (= e!303386 e!303382)))

(declare-fun res!318264 () Bool)

(assert (=> b!519964 (= res!318264 (and ((_ is Intermediate!4416) lt!238136) (not (undefined!5228 lt!238136)) (bvslt (x!48840 lt!238136) #b01111111111111111111111111111110) (bvsge (x!48840 lt!238136) #b00000000000000000000000000000000) (bvsge (x!48840 lt!238136) #b00000000000000000000000000000000)))))

(assert (=> b!519964 (=> (not res!318264) (not e!303382))))

(declare-fun b!519965 () Bool)

(assert (=> b!519965 (= e!303384 e!303383)))

(declare-fun lt!238135 () (_ BitVec 64))

(declare-fun c!61148 () Bool)

(assert (=> b!519965 (= c!61148 (or (= lt!238135 (select (arr!15949 a!3235) j!176)) (= (bvadd lt!238135 lt!238135) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519960 () Bool)

(assert (=> b!519960 (and (bvsge (index!19863 lt!238136) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238136) (size!16313 a!3235)))))

(assert (=> b!519960 (= e!303385 (= (select (arr!15949 a!3235) (index!19863 lt!238136)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80181 () Bool)

(assert (=> d!80181 e!303386))

(declare-fun c!61147 () Bool)

(assert (=> d!80181 (= c!61147 (and ((_ is Intermediate!4416) lt!238136) (undefined!5228 lt!238136)))))

(assert (=> d!80181 (= lt!238136 e!303384)))

(declare-fun c!61146 () Bool)

(assert (=> d!80181 (= c!61146 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80181 (= lt!238135 (select (arr!15949 a!3235) lt!238089))))

(assert (=> d!80181 (validMask!0 mask!3524)))

(assert (=> d!80181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238089 (select (arr!15949 a!3235) j!176) a!3235 mask!3524) lt!238136)))

(assert (= (and d!80181 c!61146) b!519957))

(assert (= (and d!80181 (not c!61146)) b!519965))

(assert (= (and b!519965 c!61148) b!519962))

(assert (= (and b!519965 (not c!61148)) b!519963))

(assert (= (and d!80181 c!61147) b!519961))

(assert (= (and d!80181 (not c!61147)) b!519964))

(assert (= (and b!519964 res!318264) b!519958))

(assert (= (and b!519958 (not res!318263)) b!519959))

(assert (= (and b!519959 (not res!318262)) b!519960))

(declare-fun m!501065 () Bool)

(assert (=> b!519960 m!501065))

(assert (=> b!519959 m!501065))

(declare-fun m!501067 () Bool)

(assert (=> d!80181 m!501067))

(assert (=> d!80181 m!501001))

(declare-fun m!501069 () Bool)

(assert (=> b!519963 m!501069))

(assert (=> b!519963 m!501069))

(assert (=> b!519963 m!500979))

(declare-fun m!501071 () Bool)

(assert (=> b!519963 m!501071))

(assert (=> b!519958 m!501065))

(assert (=> b!519878 d!80181))

(declare-fun b!519974 () Bool)

(declare-fun e!303393 () Bool)

(declare-fun call!31769 () Bool)

(assert (=> b!519974 (= e!303393 call!31769)))

(declare-fun b!519975 () Bool)

(declare-fun e!303394 () Bool)

(assert (=> b!519975 (= e!303393 e!303394)))

(declare-fun lt!238144 () (_ BitVec 64))

(assert (=> b!519975 (= lt!238144 (select (arr!15949 a!3235) j!176))))

(declare-fun lt!238145 () Unit!16116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33180 (_ BitVec 64) (_ BitVec 32)) Unit!16116)

(assert (=> b!519975 (= lt!238145 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238144 j!176))))

(assert (=> b!519975 (arrayContainsKey!0 a!3235 lt!238144 #b00000000000000000000000000000000)))

(declare-fun lt!238143 () Unit!16116)

(assert (=> b!519975 (= lt!238143 lt!238145)))

(declare-fun res!318270 () Bool)

(assert (=> b!519975 (= res!318270 (= (seekEntryOrOpen!0 (select (arr!15949 a!3235) j!176) a!3235 mask!3524) (Found!4416 j!176)))))

(assert (=> b!519975 (=> (not res!318270) (not e!303394))))

(declare-fun b!519976 () Bool)

(assert (=> b!519976 (= e!303394 call!31769)))

(declare-fun d!80183 () Bool)

(declare-fun res!318269 () Bool)

(declare-fun e!303395 () Bool)

(assert (=> d!80183 (=> res!318269 e!303395)))

(assert (=> d!80183 (= res!318269 (bvsge j!176 (size!16313 a!3235)))))

(assert (=> d!80183 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303395)))

(declare-fun bm!31766 () Bool)

(assert (=> bm!31766 (= call!31769 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519977 () Bool)

(assert (=> b!519977 (= e!303395 e!303393)))

(declare-fun c!61151 () Bool)

(assert (=> b!519977 (= c!61151 (validKeyInArray!0 (select (arr!15949 a!3235) j!176)))))

(assert (= (and d!80183 (not res!318269)) b!519977))

(assert (= (and b!519977 c!61151) b!519975))

(assert (= (and b!519977 (not c!61151)) b!519974))

(assert (= (and b!519975 res!318270) b!519976))

(assert (= (or b!519976 b!519974) bm!31766))

(assert (=> b!519975 m!500979))

(declare-fun m!501073 () Bool)

(assert (=> b!519975 m!501073))

(declare-fun m!501075 () Bool)

(assert (=> b!519975 m!501075))

(assert (=> b!519975 m!500979))

(assert (=> b!519975 m!500981))

(declare-fun m!501077 () Bool)

(assert (=> bm!31766 m!501077))

(assert (=> b!519977 m!500979))

(assert (=> b!519977 m!500979))

(assert (=> b!519977 m!500999))

(assert (=> b!519878 d!80183))

(declare-fun d!80191 () Bool)

(assert (=> d!80191 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238155 () Unit!16116)

(declare-fun choose!38 (array!33180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16116)

(assert (=> d!80191 (= lt!238155 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80191 (validMask!0 mask!3524)))

(assert (=> d!80191 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238155)))

(declare-fun bs!16381 () Bool)

(assert (= bs!16381 d!80191))

(assert (=> bs!16381 m!500993))

(declare-fun m!501079 () Bool)

(assert (=> bs!16381 m!501079))

(assert (=> bs!16381 m!501001))

(assert (=> b!519878 d!80191))

(declare-fun b!520041 () Bool)

(declare-fun c!61173 () Bool)

(declare-fun lt!238179 () (_ BitVec 64))

(assert (=> b!520041 (= c!61173 (= lt!238179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303436 () SeekEntryResult!4416)

(declare-fun e!303437 () SeekEntryResult!4416)

(assert (=> b!520041 (= e!303436 e!303437)))

(declare-fun b!520043 () Bool)

(declare-fun e!303438 () SeekEntryResult!4416)

(assert (=> b!520043 (= e!303438 Undefined!4416)))

(declare-fun b!520044 () Bool)

(assert (=> b!520044 (= e!303438 e!303436)))

(declare-fun lt!238178 () SeekEntryResult!4416)

(assert (=> b!520044 (= lt!238179 (select (arr!15949 a!3235) (index!19863 lt!238178)))))

(declare-fun c!61174 () Bool)

(assert (=> b!520044 (= c!61174 (= lt!238179 k0!2280))))

(declare-fun b!520045 () Bool)

(assert (=> b!520045 (= e!303437 (MissingZero!4416 (index!19863 lt!238178)))))

(declare-fun b!520046 () Bool)

(assert (=> b!520046 (= e!303436 (Found!4416 (index!19863 lt!238178)))))

(declare-fun d!80193 () Bool)

(declare-fun lt!238177 () SeekEntryResult!4416)

(assert (=> d!80193 (and (or ((_ is Undefined!4416) lt!238177) (not ((_ is Found!4416) lt!238177)) (and (bvsge (index!19862 lt!238177) #b00000000000000000000000000000000) (bvslt (index!19862 lt!238177) (size!16313 a!3235)))) (or ((_ is Undefined!4416) lt!238177) ((_ is Found!4416) lt!238177) (not ((_ is MissingZero!4416) lt!238177)) (and (bvsge (index!19861 lt!238177) #b00000000000000000000000000000000) (bvslt (index!19861 lt!238177) (size!16313 a!3235)))) (or ((_ is Undefined!4416) lt!238177) ((_ is Found!4416) lt!238177) ((_ is MissingZero!4416) lt!238177) (not ((_ is MissingVacant!4416) lt!238177)) (and (bvsge (index!19864 lt!238177) #b00000000000000000000000000000000) (bvslt (index!19864 lt!238177) (size!16313 a!3235)))) (or ((_ is Undefined!4416) lt!238177) (ite ((_ is Found!4416) lt!238177) (= (select (arr!15949 a!3235) (index!19862 lt!238177)) k0!2280) (ite ((_ is MissingZero!4416) lt!238177) (= (select (arr!15949 a!3235) (index!19861 lt!238177)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4416) lt!238177) (= (select (arr!15949 a!3235) (index!19864 lt!238177)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80193 (= lt!238177 e!303438)))

(declare-fun c!61175 () Bool)

(assert (=> d!80193 (= c!61175 (and ((_ is Intermediate!4416) lt!238178) (undefined!5228 lt!238178)))))

(assert (=> d!80193 (= lt!238178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80193 (validMask!0 mask!3524)))

(assert (=> d!80193 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!238177)))

(declare-fun b!520042 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33180 (_ BitVec 32)) SeekEntryResult!4416)

(assert (=> b!520042 (= e!303437 (seekKeyOrZeroReturnVacant!0 (x!48840 lt!238178) (index!19863 lt!238178) (index!19863 lt!238178) k0!2280 a!3235 mask!3524))))

(assert (= (and d!80193 c!61175) b!520043))

(assert (= (and d!80193 (not c!61175)) b!520044))

(assert (= (and b!520044 c!61174) b!520046))

(assert (= (and b!520044 (not c!61174)) b!520041))

(assert (= (and b!520041 c!61173) b!520045))

(assert (= (and b!520041 (not c!61173)) b!520042))

(declare-fun m!501099 () Bool)

(assert (=> b!520044 m!501099))

(declare-fun m!501101 () Bool)

(assert (=> d!80193 m!501101))

(assert (=> d!80193 m!501001))

(declare-fun m!501103 () Bool)

(assert (=> d!80193 m!501103))

(declare-fun m!501105 () Bool)

(assert (=> d!80193 m!501105))

(declare-fun m!501107 () Bool)

(assert (=> d!80193 m!501107))

(assert (=> d!80193 m!501105))

(declare-fun m!501109 () Bool)

(assert (=> d!80193 m!501109))

(declare-fun m!501111 () Bool)

(assert (=> b!520042 m!501111))

(assert (=> b!519883 d!80193))

(declare-fun d!80201 () Bool)

(declare-fun e!303455 () Bool)

(assert (=> d!80201 e!303455))

(declare-fun res!318300 () Bool)

(assert (=> d!80201 (=> (not res!318300) (not e!303455))))

(assert (=> d!80201 (= res!318300 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16313 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16313 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16313 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16313 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16313 a!3235))))))

(declare-fun lt!238201 () Unit!16116)

(declare-fun choose!47 (array!33180 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16116)

(assert (=> d!80201 (= lt!238201 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!238089 #b00000000000000000000000000000000 (index!19863 lt!238088) (x!48840 lt!238088) mask!3524))))

(assert (=> d!80201 (validMask!0 mask!3524)))

(assert (=> d!80201 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238089 #b00000000000000000000000000000000 (index!19863 lt!238088) (x!48840 lt!238088) mask!3524) lt!238201)))

(declare-fun b!520074 () Bool)

(assert (=> b!520074 (= e!303455 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238089 (select (store (arr!15949 a!3235) i!1204 k0!2280) j!176) (array!33181 (store (arr!15949 a!3235) i!1204 k0!2280) (size!16313 a!3235)) mask!3524) (Intermediate!4416 false (index!19863 lt!238088) (x!48840 lt!238088))))))

(assert (= (and d!80201 res!318300) b!520074))

(declare-fun m!501153 () Bool)

(assert (=> d!80201 m!501153))

(assert (=> d!80201 m!501001))

(assert (=> b!520074 m!500985))

(assert (=> b!520074 m!500989))

(assert (=> b!520074 m!500989))

(declare-fun m!501155 () Bool)

(assert (=> b!520074 m!501155))

(assert (=> b!519884 d!80201))

(declare-fun b!520075 () Bool)

(declare-fun e!303458 () SeekEntryResult!4416)

(assert (=> b!520075 (= e!303458 (Intermediate!4416 true lt!238089 #b00000000000000000000000000000000))))

(declare-fun b!520076 () Bool)

(declare-fun lt!238203 () SeekEntryResult!4416)

(assert (=> b!520076 (and (bvsge (index!19863 lt!238203) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238203) (size!16313 lt!238092)))))

(declare-fun res!318302 () Bool)

(assert (=> b!520076 (= res!318302 (= (select (arr!15949 lt!238092) (index!19863 lt!238203)) lt!238087))))

(declare-fun e!303459 () Bool)

(assert (=> b!520076 (=> res!318302 e!303459)))

(declare-fun e!303456 () Bool)

(assert (=> b!520076 (= e!303456 e!303459)))

(declare-fun b!520077 () Bool)

(assert (=> b!520077 (and (bvsge (index!19863 lt!238203) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238203) (size!16313 lt!238092)))))

(declare-fun res!318301 () Bool)

(assert (=> b!520077 (= res!318301 (= (select (arr!15949 lt!238092) (index!19863 lt!238203)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520077 (=> res!318301 e!303459)))

(declare-fun b!520079 () Bool)

(declare-fun e!303460 () Bool)

(assert (=> b!520079 (= e!303460 (bvsge (x!48840 lt!238203) #b01111111111111111111111111111110))))

(declare-fun b!520080 () Bool)

(declare-fun e!303457 () SeekEntryResult!4416)

(assert (=> b!520080 (= e!303457 (Intermediate!4416 false lt!238089 #b00000000000000000000000000000000))))

(declare-fun b!520081 () Bool)

(assert (=> b!520081 (= e!303457 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238089 #b00000000000000000000000000000000 mask!3524) lt!238087 lt!238092 mask!3524))))

(declare-fun b!520082 () Bool)

(assert (=> b!520082 (= e!303460 e!303456)))

(declare-fun res!318303 () Bool)

(assert (=> b!520082 (= res!318303 (and ((_ is Intermediate!4416) lt!238203) (not (undefined!5228 lt!238203)) (bvslt (x!48840 lt!238203) #b01111111111111111111111111111110) (bvsge (x!48840 lt!238203) #b00000000000000000000000000000000) (bvsge (x!48840 lt!238203) #b00000000000000000000000000000000)))))

(assert (=> b!520082 (=> (not res!318303) (not e!303456))))

(declare-fun b!520083 () Bool)

(assert (=> b!520083 (= e!303458 e!303457)))

(declare-fun c!61188 () Bool)

(declare-fun lt!238202 () (_ BitVec 64))

(assert (=> b!520083 (= c!61188 (or (= lt!238202 lt!238087) (= (bvadd lt!238202 lt!238202) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520078 () Bool)

(assert (=> b!520078 (and (bvsge (index!19863 lt!238203) #b00000000000000000000000000000000) (bvslt (index!19863 lt!238203) (size!16313 lt!238092)))))

(assert (=> b!520078 (= e!303459 (= (select (arr!15949 lt!238092) (index!19863 lt!238203)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80217 () Bool)

(assert (=> d!80217 e!303460))

(declare-fun c!61187 () Bool)

(assert (=> d!80217 (= c!61187 (and ((_ is Intermediate!4416) lt!238203) (undefined!5228 lt!238203)))))

(assert (=> d!80217 (= lt!238203 e!303458)))

(declare-fun c!61186 () Bool)

(assert (=> d!80217 (= c!61186 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80217 (= lt!238202 (select (arr!15949 lt!238092) lt!238089))))

(assert (=> d!80217 (validMask!0 mask!3524)))

(assert (=> d!80217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238089 lt!238087 lt!238092 mask!3524) lt!238203)))

(assert (= (and d!80217 c!61186) b!520075))

(assert (= (and d!80217 (not c!61186)) b!520083))

(assert (= (and b!520083 c!61188) b!520080))

(assert (= (and b!520083 (not c!61188)) b!520081))

(assert (= (and d!80217 c!61187) b!520079))

(assert (= (and d!80217 (not c!61187)) b!520082))

(assert (= (and b!520082 res!318303) b!520076))

(assert (= (and b!520076 (not res!318302)) b!520077))

(assert (= (and b!520077 (not res!318301)) b!520078))

(declare-fun m!501157 () Bool)

(assert (=> b!520078 m!501157))

(assert (=> b!520077 m!501157))

(declare-fun m!501159 () Bool)

(assert (=> d!80217 m!501159))

(assert (=> d!80217 m!501001))

(assert (=> b!520081 m!501069))

(assert (=> b!520081 m!501069))

(declare-fun m!501161 () Bool)

(assert (=> b!520081 m!501161))

(assert (=> b!520076 m!501157))

(assert (=> b!519884 d!80217))

(declare-fun b!520084 () Bool)

(declare-fun e!303461 () Bool)

(declare-fun call!31774 () Bool)

(assert (=> b!520084 (= e!303461 call!31774)))

(declare-fun b!520085 () Bool)

(declare-fun e!303462 () Bool)

(assert (=> b!520085 (= e!303461 e!303462)))

(declare-fun lt!238205 () (_ BitVec 64))

(assert (=> b!520085 (= lt!238205 (select (arr!15949 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238206 () Unit!16116)

(assert (=> b!520085 (= lt!238206 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238205 #b00000000000000000000000000000000))))

(assert (=> b!520085 (arrayContainsKey!0 a!3235 lt!238205 #b00000000000000000000000000000000)))

(declare-fun lt!238204 () Unit!16116)

(assert (=> b!520085 (= lt!238204 lt!238206)))

(declare-fun res!318305 () Bool)

(assert (=> b!520085 (= res!318305 (= (seekEntryOrOpen!0 (select (arr!15949 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4416 #b00000000000000000000000000000000)))))

(assert (=> b!520085 (=> (not res!318305) (not e!303462))))

(declare-fun b!520086 () Bool)

(assert (=> b!520086 (= e!303462 call!31774)))

(declare-fun d!80219 () Bool)

(declare-fun res!318304 () Bool)

(declare-fun e!303463 () Bool)

(assert (=> d!80219 (=> res!318304 e!303463)))

(assert (=> d!80219 (= res!318304 (bvsge #b00000000000000000000000000000000 (size!16313 a!3235)))))

(assert (=> d!80219 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303463)))

(declare-fun bm!31771 () Bool)

(assert (=> bm!31771 (= call!31774 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520087 () Bool)

(assert (=> b!520087 (= e!303463 e!303461)))

(declare-fun c!61189 () Bool)

(assert (=> b!520087 (= c!61189 (validKeyInArray!0 (select (arr!15949 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80219 (not res!318304)) b!520087))

(assert (= (and b!520087 c!61189) b!520085))

(assert (= (and b!520087 (not c!61189)) b!520084))

(assert (= (and b!520085 res!318305) b!520086))

(assert (= (or b!520086 b!520084) bm!31771))

(declare-fun m!501163 () Bool)

(assert (=> b!520085 m!501163))

(declare-fun m!501165 () Bool)

(assert (=> b!520085 m!501165))

(declare-fun m!501167 () Bool)

(assert (=> b!520085 m!501167))

(assert (=> b!520085 m!501163))

(declare-fun m!501169 () Bool)

(assert (=> b!520085 m!501169))

(declare-fun m!501171 () Bool)

(assert (=> bm!31771 m!501171))

(assert (=> b!520087 m!501163))

(assert (=> b!520087 m!501163))

(declare-fun m!501173 () Bool)

(assert (=> b!520087 m!501173))

(assert (=> b!519887 d!80219))

(declare-fun d!80221 () Bool)

(declare-fun res!318310 () Bool)

(declare-fun e!303468 () Bool)

(assert (=> d!80221 (=> res!318310 e!303468)))

(assert (=> d!80221 (= res!318310 (= (select (arr!15949 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80221 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!303468)))

(declare-fun b!520092 () Bool)

(declare-fun e!303469 () Bool)

(assert (=> b!520092 (= e!303468 e!303469)))

(declare-fun res!318311 () Bool)

(assert (=> b!520092 (=> (not res!318311) (not e!303469))))

(assert (=> b!520092 (= res!318311 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16313 a!3235)))))

(declare-fun b!520093 () Bool)

(assert (=> b!520093 (= e!303469 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80221 (not res!318310)) b!520092))

(assert (= (and b!520092 res!318311) b!520093))

(assert (=> d!80221 m!501163))

(declare-fun m!501175 () Bool)

(assert (=> b!520093 m!501175))

(assert (=> b!519877 d!80221))

(declare-fun d!80223 () Bool)

(assert (=> d!80223 (= (validKeyInArray!0 (select (arr!15949 a!3235) j!176)) (and (not (= (select (arr!15949 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15949 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519886 d!80223))

(declare-fun d!80225 () Bool)

(assert (=> d!80225 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47228 d!80225))

(declare-fun d!80231 () Bool)

(assert (=> d!80231 (= (array_inv!11745 a!3235) (bvsge (size!16313 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47228 d!80231))

(declare-fun d!80233 () Bool)

(assert (=> d!80233 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519876 d!80233))

(declare-fun b!520136 () Bool)

(declare-fun c!61205 () Bool)

(declare-fun lt!238222 () (_ BitVec 64))

(assert (=> b!520136 (= c!61205 (= lt!238222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303495 () SeekEntryResult!4416)

(declare-fun e!303496 () SeekEntryResult!4416)

(assert (=> b!520136 (= e!303495 e!303496)))

(declare-fun b!520138 () Bool)

(declare-fun e!303497 () SeekEntryResult!4416)

(assert (=> b!520138 (= e!303497 Undefined!4416)))

(declare-fun b!520139 () Bool)

(assert (=> b!520139 (= e!303497 e!303495)))

(declare-fun lt!238221 () SeekEntryResult!4416)

(assert (=> b!520139 (= lt!238222 (select (arr!15949 a!3235) (index!19863 lt!238221)))))

(declare-fun c!61206 () Bool)

(assert (=> b!520139 (= c!61206 (= lt!238222 (select (arr!15949 a!3235) j!176)))))

(declare-fun b!520140 () Bool)

(assert (=> b!520140 (= e!303496 (MissingZero!4416 (index!19863 lt!238221)))))

(declare-fun b!520141 () Bool)

(assert (=> b!520141 (= e!303495 (Found!4416 (index!19863 lt!238221)))))

(declare-fun d!80235 () Bool)

(declare-fun lt!238220 () SeekEntryResult!4416)

(assert (=> d!80235 (and (or ((_ is Undefined!4416) lt!238220) (not ((_ is Found!4416) lt!238220)) (and (bvsge (index!19862 lt!238220) #b00000000000000000000000000000000) (bvslt (index!19862 lt!238220) (size!16313 a!3235)))) (or ((_ is Undefined!4416) lt!238220) ((_ is Found!4416) lt!238220) (not ((_ is MissingZero!4416) lt!238220)) (and (bvsge (index!19861 lt!238220) #b00000000000000000000000000000000) (bvslt (index!19861 lt!238220) (size!16313 a!3235)))) (or ((_ is Undefined!4416) lt!238220) ((_ is Found!4416) lt!238220) ((_ is MissingZero!4416) lt!238220) (not ((_ is MissingVacant!4416) lt!238220)) (and (bvsge (index!19864 lt!238220) #b00000000000000000000000000000000) (bvslt (index!19864 lt!238220) (size!16313 a!3235)))) (or ((_ is Undefined!4416) lt!238220) (ite ((_ is Found!4416) lt!238220) (= (select (arr!15949 a!3235) (index!19862 lt!238220)) (select (arr!15949 a!3235) j!176)) (ite ((_ is MissingZero!4416) lt!238220) (= (select (arr!15949 a!3235) (index!19861 lt!238220)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4416) lt!238220) (= (select (arr!15949 a!3235) (index!19864 lt!238220)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80235 (= lt!238220 e!303497)))

(declare-fun c!61207 () Bool)

(assert (=> d!80235 (= c!61207 (and ((_ is Intermediate!4416) lt!238221) (undefined!5228 lt!238221)))))

(assert (=> d!80235 (= lt!238221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15949 a!3235) j!176) mask!3524) (select (arr!15949 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80235 (validMask!0 mask!3524)))

(assert (=> d!80235 (= (seekEntryOrOpen!0 (select (arr!15949 a!3235) j!176) a!3235 mask!3524) lt!238220)))

(declare-fun b!520137 () Bool)

(assert (=> b!520137 (= e!303496 (seekKeyOrZeroReturnVacant!0 (x!48840 lt!238221) (index!19863 lt!238221) (index!19863 lt!238221) (select (arr!15949 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80235 c!61207) b!520138))

(assert (= (and d!80235 (not c!61207)) b!520139))

(assert (= (and b!520139 c!61206) b!520141))

(assert (= (and b!520139 (not c!61206)) b!520136))

(assert (= (and b!520136 c!61205) b!520140))

(assert (= (and b!520136 (not c!61205)) b!520137))

(declare-fun m!501193 () Bool)

(assert (=> b!520139 m!501193))

(declare-fun m!501195 () Bool)

(assert (=> d!80235 m!501195))

(assert (=> d!80235 m!501001))

(declare-fun m!501197 () Bool)

(assert (=> d!80235 m!501197))

(assert (=> d!80235 m!500991))

(assert (=> d!80235 m!500979))

(declare-fun m!501199 () Bool)

(assert (=> d!80235 m!501199))

(assert (=> d!80235 m!500979))

(assert (=> d!80235 m!500991))

(declare-fun m!501201 () Bool)

(assert (=> d!80235 m!501201))

(assert (=> b!520137 m!500979))

(declare-fun m!501203 () Bool)

(assert (=> b!520137 m!501203))

(assert (=> b!519879 d!80235))

(declare-fun d!80237 () Bool)

(declare-fun res!318342 () Bool)

(declare-fun e!303531 () Bool)

(assert (=> d!80237 (=> res!318342 e!303531)))

(assert (=> d!80237 (= res!318342 (bvsge #b00000000000000000000000000000000 (size!16313 a!3235)))))

(assert (=> d!80237 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10104) e!303531)))

(declare-fun bm!31777 () Bool)

(declare-fun call!31780 () Bool)

(declare-fun c!61222 () Bool)

(assert (=> bm!31777 (= call!31780 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61222 (Cons!10103 (select (arr!15949 a!3235) #b00000000000000000000000000000000) Nil!10104) Nil!10104)))))

(declare-fun b!520188 () Bool)

(declare-fun e!303530 () Bool)

(assert (=> b!520188 (= e!303530 call!31780)))

(declare-fun b!520189 () Bool)

(declare-fun e!303528 () Bool)

(declare-fun contains!2758 (List!10107 (_ BitVec 64)) Bool)

(assert (=> b!520189 (= e!303528 (contains!2758 Nil!10104 (select (arr!15949 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520190 () Bool)

(assert (=> b!520190 (= e!303530 call!31780)))

(declare-fun b!520191 () Bool)

(declare-fun e!303529 () Bool)

(assert (=> b!520191 (= e!303529 e!303530)))

(assert (=> b!520191 (= c!61222 (validKeyInArray!0 (select (arr!15949 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520192 () Bool)

(assert (=> b!520192 (= e!303531 e!303529)))

(declare-fun res!318344 () Bool)

(assert (=> b!520192 (=> (not res!318344) (not e!303529))))

(assert (=> b!520192 (= res!318344 (not e!303528))))

(declare-fun res!318343 () Bool)

(assert (=> b!520192 (=> (not res!318343) (not e!303528))))

(assert (=> b!520192 (= res!318343 (validKeyInArray!0 (select (arr!15949 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80237 (not res!318342)) b!520192))

(assert (= (and b!520192 res!318343) b!520189))

(assert (= (and b!520192 res!318344) b!520191))

(assert (= (and b!520191 c!61222) b!520188))

(assert (= (and b!520191 (not c!61222)) b!520190))

(assert (= (or b!520188 b!520190) bm!31777))

(assert (=> bm!31777 m!501163))

(declare-fun m!501245 () Bool)

(assert (=> bm!31777 m!501245))

(assert (=> b!520189 m!501163))

(assert (=> b!520189 m!501163))

(declare-fun m!501247 () Bool)

(assert (=> b!520189 m!501247))

(assert (=> b!520191 m!501163))

(assert (=> b!520191 m!501163))

(assert (=> b!520191 m!501173))

(assert (=> b!520192 m!501163))

(assert (=> b!520192 m!501163))

(assert (=> b!520192 m!501173))

(assert (=> b!519880 d!80237))

(check-sat (not d!80235) (not d!80201) (not b!520087) (not b!519977) (not b!520074) (not bm!31777) (not d!80177) (not b!519954) (not b!520189) (not b!519975) (not d!80181) (not b!520093) (not d!80191) (not b!519963) (not b!520137) (not b!520042) (not bm!31771) (not b!520192) (not b!520191) (not d!80193) (not b!520081) (not d!80217) (not b!520085) (not bm!31766))
(check-sat)
