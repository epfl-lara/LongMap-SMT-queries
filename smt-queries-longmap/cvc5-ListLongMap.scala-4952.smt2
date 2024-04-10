; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68136 () Bool)

(assert start!68136)

(declare-fun b!792257 () Bool)

(declare-fun res!536921 () Bool)

(declare-fun e!440206 () Bool)

(assert (=> b!792257 (=> (not res!536921) (not e!440206))))

(declare-datatypes ((array!43006 0))(
  ( (array!43007 (arr!20586 (Array (_ BitVec 32) (_ BitVec 64))) (size!21007 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43006)

(assert (=> b!792257 (= res!536921 (and (bvsle #b00000000000000000000000000000000 (size!21007 a!3170)) (bvslt (size!21007 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792259 () Bool)

(declare-fun res!536924 () Bool)

(declare-fun e!440207 () Bool)

(assert (=> b!792259 (=> (not res!536924) (not e!440207))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!792259 (= res!536924 (and (= (size!21007 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21007 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21007 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792260 () Bool)

(declare-datatypes ((List!14549 0))(
  ( (Nil!14546) (Cons!14545 (h!15674 (_ BitVec 64)) (t!20864 List!14549)) )
))
(declare-fun noDuplicate!1284 (List!14549) Bool)

(assert (=> b!792260 (= e!440206 (not (noDuplicate!1284 Nil!14546)))))

(declare-fun b!792261 () Bool)

(declare-fun res!536925 () Bool)

(assert (=> b!792261 (=> (not res!536925) (not e!440207))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792261 (= res!536925 (validKeyInArray!0 k!2044))))

(declare-fun b!792262 () Bool)

(declare-fun res!536920 () Bool)

(assert (=> b!792262 (=> (not res!536920) (not e!440207))))

(assert (=> b!792262 (= res!536920 (validKeyInArray!0 (select (arr!20586 a!3170) j!153)))))

(declare-fun b!792258 () Bool)

(declare-fun res!536926 () Bool)

(assert (=> b!792258 (=> (not res!536926) (not e!440207))))

(declare-fun arrayContainsKey!0 (array!43006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792258 (= res!536926 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536923 () Bool)

(assert (=> start!68136 (=> (not res!536923) (not e!440207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68136 (= res!536923 (validMask!0 mask!3266))))

(assert (=> start!68136 e!440207))

(assert (=> start!68136 true))

(declare-fun array_inv!16382 (array!43006) Bool)

(assert (=> start!68136 (array_inv!16382 a!3170)))

(declare-fun b!792263 () Bool)

(declare-fun res!536927 () Bool)

(assert (=> b!792263 (=> (not res!536927) (not e!440206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43006 (_ BitVec 32)) Bool)

(assert (=> b!792263 (= res!536927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792264 () Bool)

(assert (=> b!792264 (= e!440207 e!440206)))

(declare-fun res!536922 () Bool)

(assert (=> b!792264 (=> (not res!536922) (not e!440206))))

(declare-datatypes ((SeekEntryResult!8177 0))(
  ( (MissingZero!8177 (index!35076 (_ BitVec 32))) (Found!8177 (index!35077 (_ BitVec 32))) (Intermediate!8177 (undefined!8989 Bool) (index!35078 (_ BitVec 32)) (x!66031 (_ BitVec 32))) (Undefined!8177) (MissingVacant!8177 (index!35079 (_ BitVec 32))) )
))
(declare-fun lt!353423 () SeekEntryResult!8177)

(assert (=> b!792264 (= res!536922 (or (= lt!353423 (MissingZero!8177 i!1163)) (= lt!353423 (MissingVacant!8177 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43006 (_ BitVec 32)) SeekEntryResult!8177)

(assert (=> b!792264 (= lt!353423 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68136 res!536923) b!792259))

(assert (= (and b!792259 res!536924) b!792262))

(assert (= (and b!792262 res!536920) b!792261))

(assert (= (and b!792261 res!536925) b!792258))

(assert (= (and b!792258 res!536926) b!792264))

(assert (= (and b!792264 res!536922) b!792263))

(assert (= (and b!792263 res!536927) b!792257))

(assert (= (and b!792257 res!536921) b!792260))

(declare-fun m!732893 () Bool)

(assert (=> start!68136 m!732893))

(declare-fun m!732895 () Bool)

(assert (=> start!68136 m!732895))

(declare-fun m!732897 () Bool)

(assert (=> b!792258 m!732897))

(declare-fun m!732899 () Bool)

(assert (=> b!792261 m!732899))

(declare-fun m!732901 () Bool)

(assert (=> b!792262 m!732901))

(assert (=> b!792262 m!732901))

(declare-fun m!732903 () Bool)

(assert (=> b!792262 m!732903))

(declare-fun m!732905 () Bool)

(assert (=> b!792263 m!732905))

(declare-fun m!732907 () Bool)

(assert (=> b!792260 m!732907))

(declare-fun m!732909 () Bool)

(assert (=> b!792264 m!732909))

(push 1)

(assert (not b!792264))

(assert (not b!792263))

(assert (not b!792262))

(assert (not b!792258))

(assert (not b!792261))

(assert (not start!68136))

(assert (not b!792260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103183 () Bool)

(assert (=> d!103183 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792261 d!103183))

(declare-fun d!103185 () Bool)

(assert (=> d!103185 (= (validKeyInArray!0 (select (arr!20586 a!3170) j!153)) (and (not (= (select (arr!20586 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20586 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792262 d!103185))

(declare-fun d!103187 () Bool)

(declare-fun res!536986 () Bool)

(declare-fun e!440236 () Bool)

(assert (=> d!103187 (=> res!536986 e!440236)))

(assert (=> d!103187 (= res!536986 (is-Nil!14546 Nil!14546))))

(assert (=> d!103187 (= (noDuplicate!1284 Nil!14546) e!440236)))

(declare-fun b!792323 () Bool)

(declare-fun e!440237 () Bool)

(assert (=> b!792323 (= e!440236 e!440237)))

(declare-fun res!536987 () Bool)

(assert (=> b!792323 (=> (not res!536987) (not e!440237))))

(declare-fun contains!4116 (List!14549 (_ BitVec 64)) Bool)

(assert (=> b!792323 (= res!536987 (not (contains!4116 (t!20864 Nil!14546) (h!15674 Nil!14546))))))

(declare-fun b!792324 () Bool)

(assert (=> b!792324 (= e!440237 (noDuplicate!1284 (t!20864 Nil!14546)))))

(assert (= (and d!103187 (not res!536986)) b!792323))

(assert (= (and b!792323 res!536987) b!792324))

(declare-fun m!732951 () Bool)

(assert (=> b!792323 m!732951))

(declare-fun m!732953 () Bool)

(assert (=> b!792324 m!732953))

(assert (=> b!792260 d!103187))

(declare-fun d!103189 () Bool)

(declare-fun lt!353455 () SeekEntryResult!8177)

(assert (=> d!103189 (and (or (is-Undefined!8177 lt!353455) (not (is-Found!8177 lt!353455)) (and (bvsge (index!35077 lt!353455) #b00000000000000000000000000000000) (bvslt (index!35077 lt!353455) (size!21007 a!3170)))) (or (is-Undefined!8177 lt!353455) (is-Found!8177 lt!353455) (not (is-MissingZero!8177 lt!353455)) (and (bvsge (index!35076 lt!353455) #b00000000000000000000000000000000) (bvslt (index!35076 lt!353455) (size!21007 a!3170)))) (or (is-Undefined!8177 lt!353455) (is-Found!8177 lt!353455) (is-MissingZero!8177 lt!353455) (not (is-MissingVacant!8177 lt!353455)) (and (bvsge (index!35079 lt!353455) #b00000000000000000000000000000000) (bvslt (index!35079 lt!353455) (size!21007 a!3170)))) (or (is-Undefined!8177 lt!353455) (ite (is-Found!8177 lt!353455) (= (select (arr!20586 a!3170) (index!35077 lt!353455)) k!2044) (ite (is-MissingZero!8177 lt!353455) (= (select (arr!20586 a!3170) (index!35076 lt!353455)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8177 lt!353455) (= (select (arr!20586 a!3170) (index!35079 lt!353455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!440269 () SeekEntryResult!8177)

(assert (=> d!103189 (= lt!353455 e!440269)))

(declare-fun c!88097 () Bool)

(declare-fun lt!353456 () SeekEntryResult!8177)

(assert (=> d!103189 (= c!88097 (and (is-Intermediate!8177 lt!353456) (undefined!8989 lt!353456)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43006 (_ BitVec 32)) SeekEntryResult!8177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103189 (= lt!353456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103189 (validMask!0 mask!3266)))

(assert (=> d!103189 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!353455)))

(declare-fun b!792373 () Bool)

(declare-fun e!440270 () SeekEntryResult!8177)

(assert (=> b!792373 (= e!440270 (MissingZero!8177 (index!35078 lt!353456)))))

(declare-fun b!792374 () Bool)

(declare-fun e!440268 () SeekEntryResult!8177)

(assert (=> b!792374 (= e!440269 e!440268)))

(declare-fun lt!353454 () (_ BitVec 64))

(assert (=> b!792374 (= lt!353454 (select (arr!20586 a!3170) (index!35078 lt!353456)))))

(declare-fun c!88099 () Bool)

(assert (=> b!792374 (= c!88099 (= lt!353454 k!2044))))

(declare-fun b!792375 () Bool)

(assert (=> b!792375 (= e!440268 (Found!8177 (index!35078 lt!353456)))))

(declare-fun b!792376 () Bool)

(assert (=> b!792376 (= e!440269 Undefined!8177)))

(declare-fun b!792377 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43006 (_ BitVec 32)) SeekEntryResult!8177)

(assert (=> b!792377 (= e!440270 (seekKeyOrZeroReturnVacant!0 (x!66031 lt!353456) (index!35078 lt!353456) (index!35078 lt!353456) k!2044 a!3170 mask!3266))))

(declare-fun b!792378 () Bool)

(declare-fun c!88098 () Bool)

(assert (=> b!792378 (= c!88098 (= lt!353454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!792378 (= e!440268 e!440270)))

(assert (= (and d!103189 c!88097) b!792376))

(assert (= (and d!103189 (not c!88097)) b!792374))

(assert (= (and b!792374 c!88099) b!792375))

(assert (= (and b!792374 (not c!88099)) b!792378))

(assert (= (and b!792378 c!88098) b!792373))

(assert (= (and b!792378 (not c!88098)) b!792377))

(declare-fun m!732983 () Bool)

(assert (=> d!103189 m!732983))

(declare-fun m!732985 () Bool)

(assert (=> d!103189 m!732985))

(assert (=> d!103189 m!732893))

(assert (=> d!103189 m!732985))

(declare-fun m!732987 () Bool)

(assert (=> d!103189 m!732987))

(declare-fun m!732989 () Bool)

(assert (=> d!103189 m!732989))

(declare-fun m!732991 () Bool)

(assert (=> d!103189 m!732991))

(declare-fun m!732993 () Bool)

(assert (=> b!792374 m!732993))

(declare-fun m!732995 () Bool)

(assert (=> b!792377 m!732995))

(assert (=> b!792264 d!103189))

(declare-fun d!103199 () Bool)

(assert (=> d!103199 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68136 d!103199))

(declare-fun d!103205 () Bool)

(assert (=> d!103205 (= (array_inv!16382 a!3170) (bvsge (size!21007 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68136 d!103205))

(declare-fun d!103209 () Bool)

(declare-fun res!537014 () Bool)

(declare-fun e!440288 () Bool)

(assert (=> d!103209 (=> res!537014 e!440288)))

(assert (=> d!103209 (= res!537014 (= (select (arr!20586 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103209 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!440288)))

(declare-fun b!792399 () Bool)

(declare-fun e!440289 () Bool)

(assert (=> b!792399 (= e!440288 e!440289)))

(declare-fun res!537015 () Bool)

(assert (=> b!792399 (=> (not res!537015) (not e!440289))))

(assert (=> b!792399 (= res!537015 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21007 a!3170)))))

(declare-fun b!792400 () Bool)

(assert (=> b!792400 (= e!440289 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103209 (not res!537014)) b!792399))

(assert (= (and b!792399 res!537015) b!792400))

(declare-fun m!733007 () Bool)

(assert (=> d!103209 m!733007))

(declare-fun m!733009 () Bool)

(assert (=> b!792400 m!733009))

(assert (=> b!792258 d!103209))

(declare-fun b!792411 () Bool)

(declare-fun e!440300 () Bool)

(declare-fun call!35337 () Bool)

