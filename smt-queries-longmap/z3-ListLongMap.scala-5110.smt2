; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69246 () Bool)

(assert start!69246)

(declare-fun b!807979 () Bool)

(declare-fun res!552243 () Bool)

(declare-fun e!447255 () Bool)

(assert (=> b!807979 (=> (not res!552243) (not e!447255))))

(declare-datatypes ((array!43963 0))(
  ( (array!43964 (arr!21059 (Array (_ BitVec 32) (_ BitVec 64))) (size!21480 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43963)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807979 (= res!552243 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807980 () Bool)

(declare-fun res!552246 () Bool)

(declare-fun e!447256 () Bool)

(assert (=> b!807980 (=> (not res!552246) (not e!447256))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807980 (= res!552246 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21480 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21059 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21480 a!3170)) (= (select (arr!21059 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807981 () Bool)

(declare-fun e!447257 () Bool)

(assert (=> b!807981 (= e!447256 e!447257)))

(declare-fun res!552251 () Bool)

(assert (=> b!807981 (=> (not res!552251) (not e!447257))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!361925 () (_ BitVec 64))

(declare-fun lt!361920 () array!43963)

(declare-datatypes ((SeekEntryResult!8647 0))(
  ( (MissingZero!8647 (index!36956 (_ BitVec 32))) (Found!8647 (index!36957 (_ BitVec 32))) (Intermediate!8647 (undefined!9459 Bool) (index!36958 (_ BitVec 32)) (x!67766 (_ BitVec 32))) (Undefined!8647) (MissingVacant!8647 (index!36959 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43963 (_ BitVec 32)) SeekEntryResult!8647)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43963 (_ BitVec 32)) SeekEntryResult!8647)

(assert (=> b!807981 (= res!552251 (= (seekEntryOrOpen!0 lt!361925 lt!361920 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361925 lt!361920 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807981 (= lt!361925 (select (store (arr!21059 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807981 (= lt!361920 (array!43964 (store (arr!21059 a!3170) i!1163 k0!2044) (size!21480 a!3170)))))

(declare-fun b!807982 () Bool)

(declare-fun e!447259 () Bool)

(assert (=> b!807982 (= e!447257 e!447259)))

(declare-fun res!552244 () Bool)

(assert (=> b!807982 (=> (not res!552244) (not e!447259))))

(declare-fun lt!361921 () SeekEntryResult!8647)

(declare-fun lt!361923 () SeekEntryResult!8647)

(assert (=> b!807982 (= res!552244 (and (= lt!361921 lt!361923) (= lt!361923 (Found!8647 j!153)) (not (= (select (arr!21059 a!3170) index!1236) (select (arr!21059 a!3170) j!153)))))))

(assert (=> b!807982 (= lt!361923 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21059 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807982 (= lt!361921 (seekEntryOrOpen!0 (select (arr!21059 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807983 () Bool)

(declare-fun res!552250 () Bool)

(assert (=> b!807983 (=> (not res!552250) (not e!447255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807983 (= res!552250 (validKeyInArray!0 k0!2044))))

(declare-fun res!552247 () Bool)

(assert (=> start!69246 (=> (not res!552247) (not e!447255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69246 (= res!552247 (validMask!0 mask!3266))))

(assert (=> start!69246 e!447255))

(assert (=> start!69246 true))

(declare-fun array_inv!16942 (array!43963) Bool)

(assert (=> start!69246 (array_inv!16942 a!3170)))

(declare-fun b!807984 () Bool)

(declare-fun res!552252 () Bool)

(assert (=> b!807984 (=> (not res!552252) (not e!447256))))

(declare-datatypes ((List!15061 0))(
  ( (Nil!15058) (Cons!15057 (h!16186 (_ BitVec 64)) (t!21367 List!15061)) )
))
(declare-fun arrayNoDuplicates!0 (array!43963 (_ BitVec 32) List!15061) Bool)

(assert (=> b!807984 (= res!552252 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15058))))

(declare-fun b!807985 () Bool)

(assert (=> b!807985 (= e!447259 (bvsgt (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!361922 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807985 (= lt!361922 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807986 () Bool)

(declare-fun res!552245 () Bool)

(assert (=> b!807986 (=> (not res!552245) (not e!447256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43963 (_ BitVec 32)) Bool)

(assert (=> b!807986 (= res!552245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807987 () Bool)

(declare-fun res!552248 () Bool)

(assert (=> b!807987 (=> (not res!552248) (not e!447255))))

(assert (=> b!807987 (= res!552248 (and (= (size!21480 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21480 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21480 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807988 () Bool)

(assert (=> b!807988 (= e!447255 e!447256)))

(declare-fun res!552242 () Bool)

(assert (=> b!807988 (=> (not res!552242) (not e!447256))))

(declare-fun lt!361924 () SeekEntryResult!8647)

(assert (=> b!807988 (= res!552242 (or (= lt!361924 (MissingZero!8647 i!1163)) (= lt!361924 (MissingVacant!8647 i!1163))))))

(assert (=> b!807988 (= lt!361924 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807989 () Bool)

(declare-fun res!552249 () Bool)

(assert (=> b!807989 (=> (not res!552249) (not e!447255))))

(assert (=> b!807989 (= res!552249 (validKeyInArray!0 (select (arr!21059 a!3170) j!153)))))

(assert (= (and start!69246 res!552247) b!807987))

(assert (= (and b!807987 res!552248) b!807989))

(assert (= (and b!807989 res!552249) b!807983))

(assert (= (and b!807983 res!552250) b!807979))

(assert (= (and b!807979 res!552243) b!807988))

(assert (= (and b!807988 res!552242) b!807986))

(assert (= (and b!807986 res!552245) b!807984))

(assert (= (and b!807984 res!552252) b!807980))

(assert (= (and b!807980 res!552246) b!807981))

(assert (= (and b!807981 res!552251) b!807982))

(assert (= (and b!807982 res!552244) b!807985))

(declare-fun m!749641 () Bool)

(assert (=> b!807986 m!749641))

(declare-fun m!749643 () Bool)

(assert (=> b!807985 m!749643))

(declare-fun m!749645 () Bool)

(assert (=> b!807988 m!749645))

(declare-fun m!749647 () Bool)

(assert (=> b!807984 m!749647))

(declare-fun m!749649 () Bool)

(assert (=> b!807980 m!749649))

(declare-fun m!749651 () Bool)

(assert (=> b!807980 m!749651))

(declare-fun m!749653 () Bool)

(assert (=> b!807979 m!749653))

(declare-fun m!749655 () Bool)

(assert (=> b!807981 m!749655))

(declare-fun m!749657 () Bool)

(assert (=> b!807981 m!749657))

(declare-fun m!749659 () Bool)

(assert (=> b!807981 m!749659))

(declare-fun m!749661 () Bool)

(assert (=> b!807981 m!749661))

(declare-fun m!749663 () Bool)

(assert (=> b!807989 m!749663))

(assert (=> b!807989 m!749663))

(declare-fun m!749665 () Bool)

(assert (=> b!807989 m!749665))

(declare-fun m!749667 () Bool)

(assert (=> b!807983 m!749667))

(declare-fun m!749669 () Bool)

(assert (=> start!69246 m!749669))

(declare-fun m!749671 () Bool)

(assert (=> start!69246 m!749671))

(declare-fun m!749673 () Bool)

(assert (=> b!807982 m!749673))

(assert (=> b!807982 m!749663))

(assert (=> b!807982 m!749663))

(declare-fun m!749675 () Bool)

(assert (=> b!807982 m!749675))

(assert (=> b!807982 m!749663))

(declare-fun m!749677 () Bool)

(assert (=> b!807982 m!749677))

(check-sat (not b!807981) (not b!807983) (not b!807985) (not b!807989) (not b!807982) (not b!807979) (not start!69246) (not b!807986) (not b!807984) (not b!807988))
(check-sat)
(get-model)

(declare-fun d!103547 () Bool)

(assert (=> d!103547 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!807983 d!103547))

(declare-fun b!808068 () Bool)

(declare-fun c!88286 () Bool)

(declare-fun lt!361968 () (_ BitVec 64))

(assert (=> b!808068 (= c!88286 (= lt!361968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447297 () SeekEntryResult!8647)

(declare-fun e!447298 () SeekEntryResult!8647)

(assert (=> b!808068 (= e!447297 e!447298)))

(declare-fun b!808069 () Bool)

(declare-fun lt!361969 () SeekEntryResult!8647)

(assert (=> b!808069 (= e!447298 (MissingZero!8647 (index!36958 lt!361969)))))

(declare-fun b!808070 () Bool)

(assert (=> b!808070 (= e!447297 (Found!8647 (index!36958 lt!361969)))))

(declare-fun b!808071 () Bool)

(declare-fun e!447296 () SeekEntryResult!8647)

(assert (=> b!808071 (= e!447296 e!447297)))

(assert (=> b!808071 (= lt!361968 (select (arr!21059 a!3170) (index!36958 lt!361969)))))

(declare-fun c!88287 () Bool)

(assert (=> b!808071 (= c!88287 (= lt!361968 k0!2044))))

(declare-fun d!103549 () Bool)

(declare-fun lt!361970 () SeekEntryResult!8647)

(get-info :version)

(assert (=> d!103549 (and (or ((_ is Undefined!8647) lt!361970) (not ((_ is Found!8647) lt!361970)) (and (bvsge (index!36957 lt!361970) #b00000000000000000000000000000000) (bvslt (index!36957 lt!361970) (size!21480 a!3170)))) (or ((_ is Undefined!8647) lt!361970) ((_ is Found!8647) lt!361970) (not ((_ is MissingZero!8647) lt!361970)) (and (bvsge (index!36956 lt!361970) #b00000000000000000000000000000000) (bvslt (index!36956 lt!361970) (size!21480 a!3170)))) (or ((_ is Undefined!8647) lt!361970) ((_ is Found!8647) lt!361970) ((_ is MissingZero!8647) lt!361970) (not ((_ is MissingVacant!8647) lt!361970)) (and (bvsge (index!36959 lt!361970) #b00000000000000000000000000000000) (bvslt (index!36959 lt!361970) (size!21480 a!3170)))) (or ((_ is Undefined!8647) lt!361970) (ite ((_ is Found!8647) lt!361970) (= (select (arr!21059 a!3170) (index!36957 lt!361970)) k0!2044) (ite ((_ is MissingZero!8647) lt!361970) (= (select (arr!21059 a!3170) (index!36956 lt!361970)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8647) lt!361970) (= (select (arr!21059 a!3170) (index!36959 lt!361970)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103549 (= lt!361970 e!447296)))

(declare-fun c!88285 () Bool)

(assert (=> d!103549 (= c!88285 (and ((_ is Intermediate!8647) lt!361969) (undefined!9459 lt!361969)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43963 (_ BitVec 32)) SeekEntryResult!8647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103549 (= lt!361969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103549 (validMask!0 mask!3266)))

(assert (=> d!103549 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!361970)))

(declare-fun b!808072 () Bool)

(assert (=> b!808072 (= e!447298 (seekKeyOrZeroReturnVacant!0 (x!67766 lt!361969) (index!36958 lt!361969) (index!36958 lt!361969) k0!2044 a!3170 mask!3266))))

(declare-fun b!808073 () Bool)

(assert (=> b!808073 (= e!447296 Undefined!8647)))

(assert (= (and d!103549 c!88285) b!808073))

(assert (= (and d!103549 (not c!88285)) b!808071))

(assert (= (and b!808071 c!88287) b!808070))

(assert (= (and b!808071 (not c!88287)) b!808068))

(assert (= (and b!808068 c!88286) b!808069))

(assert (= (and b!808068 (not c!88286)) b!808072))

(declare-fun m!749755 () Bool)

(assert (=> b!808071 m!749755))

(declare-fun m!749757 () Bool)

(assert (=> d!103549 m!749757))

(declare-fun m!749759 () Bool)

(assert (=> d!103549 m!749759))

(declare-fun m!749761 () Bool)

(assert (=> d!103549 m!749761))

(assert (=> d!103549 m!749669))

(declare-fun m!749763 () Bool)

(assert (=> d!103549 m!749763))

(assert (=> d!103549 m!749763))

(declare-fun m!749765 () Bool)

(assert (=> d!103549 m!749765))

(declare-fun m!749767 () Bool)

(assert (=> b!808072 m!749767))

(assert (=> b!807988 d!103549))

(declare-fun d!103551 () Bool)

(assert (=> d!103551 (= (validKeyInArray!0 (select (arr!21059 a!3170) j!153)) (and (not (= (select (arr!21059 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21059 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!807989 d!103551))

(declare-fun d!103553 () Bool)

(declare-fun res!552323 () Bool)

(declare-fun e!447303 () Bool)

(assert (=> d!103553 (=> res!552323 e!447303)))

(assert (=> d!103553 (= res!552323 (= (select (arr!21059 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103553 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!447303)))

(declare-fun b!808078 () Bool)

(declare-fun e!447304 () Bool)

(assert (=> b!808078 (= e!447303 e!447304)))

(declare-fun res!552324 () Bool)

(assert (=> b!808078 (=> (not res!552324) (not e!447304))))

(assert (=> b!808078 (= res!552324 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21480 a!3170)))))

(declare-fun b!808079 () Bool)

(assert (=> b!808079 (= e!447304 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103553 (not res!552323)) b!808078))

(assert (= (and b!808078 res!552324) b!808079))

(declare-fun m!749769 () Bool)

(assert (=> d!103553 m!749769))

(declare-fun m!749771 () Bool)

(assert (=> b!808079 m!749771))

(assert (=> b!807979 d!103553))

(declare-fun d!103555 () Bool)

(declare-fun res!552331 () Bool)

(declare-fun e!447315 () Bool)

(assert (=> d!103555 (=> res!552331 e!447315)))

(assert (=> d!103555 (= res!552331 (bvsge #b00000000000000000000000000000000 (size!21480 a!3170)))))

(assert (=> d!103555 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15058) e!447315)))

(declare-fun b!808090 () Bool)

(declare-fun e!447313 () Bool)

(declare-fun contains!4103 (List!15061 (_ BitVec 64)) Bool)

(assert (=> b!808090 (= e!447313 (contains!4103 Nil!15058 (select (arr!21059 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808091 () Bool)

(declare-fun e!447314 () Bool)

(declare-fun call!35359 () Bool)

(assert (=> b!808091 (= e!447314 call!35359)))

(declare-fun b!808092 () Bool)

(assert (=> b!808092 (= e!447314 call!35359)))

(declare-fun b!808093 () Bool)

(declare-fun e!447316 () Bool)

(assert (=> b!808093 (= e!447315 e!447316)))

(declare-fun res!552332 () Bool)

(assert (=> b!808093 (=> (not res!552332) (not e!447316))))

(assert (=> b!808093 (= res!552332 (not e!447313))))

(declare-fun res!552333 () Bool)

(assert (=> b!808093 (=> (not res!552333) (not e!447313))))

(assert (=> b!808093 (= res!552333 (validKeyInArray!0 (select (arr!21059 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808094 () Bool)

(assert (=> b!808094 (= e!447316 e!447314)))

(declare-fun c!88290 () Bool)

(assert (=> b!808094 (= c!88290 (validKeyInArray!0 (select (arr!21059 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35356 () Bool)

(assert (=> bm!35356 (= call!35359 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88290 (Cons!15057 (select (arr!21059 a!3170) #b00000000000000000000000000000000) Nil!15058) Nil!15058)))))

(assert (= (and d!103555 (not res!552331)) b!808093))

(assert (= (and b!808093 res!552333) b!808090))

(assert (= (and b!808093 res!552332) b!808094))

(assert (= (and b!808094 c!88290) b!808092))

(assert (= (and b!808094 (not c!88290)) b!808091))

(assert (= (or b!808092 b!808091) bm!35356))

(assert (=> b!808090 m!749769))

(assert (=> b!808090 m!749769))

(declare-fun m!749773 () Bool)

(assert (=> b!808090 m!749773))

(assert (=> b!808093 m!749769))

(assert (=> b!808093 m!749769))

(declare-fun m!749775 () Bool)

(assert (=> b!808093 m!749775))

(assert (=> b!808094 m!749769))

(assert (=> b!808094 m!749769))

(assert (=> b!808094 m!749775))

(assert (=> bm!35356 m!749769))

(declare-fun m!749777 () Bool)

(assert (=> bm!35356 m!749777))

(assert (=> b!807984 d!103555))

(declare-fun d!103557 () Bool)

(declare-fun lt!361973 () (_ BitVec 32))

(assert (=> d!103557 (and (bvsge lt!361973 #b00000000000000000000000000000000) (bvslt lt!361973 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103557 (= lt!361973 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103557 (validMask!0 mask!3266)))

(assert (=> d!103557 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!361973)))

(declare-fun bs!22362 () Bool)

(assert (= bs!22362 d!103557))

(declare-fun m!749779 () Bool)

(assert (=> bs!22362 m!749779))

(assert (=> bs!22362 m!749669))

(assert (=> b!807985 d!103557))

(declare-fun b!808095 () Bool)

(declare-fun c!88292 () Bool)

(declare-fun lt!361974 () (_ BitVec 64))

(assert (=> b!808095 (= c!88292 (= lt!361974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447318 () SeekEntryResult!8647)

(declare-fun e!447319 () SeekEntryResult!8647)

(assert (=> b!808095 (= e!447318 e!447319)))

(declare-fun b!808096 () Bool)

(declare-fun lt!361975 () SeekEntryResult!8647)

(assert (=> b!808096 (= e!447319 (MissingZero!8647 (index!36958 lt!361975)))))

(declare-fun b!808097 () Bool)

(assert (=> b!808097 (= e!447318 (Found!8647 (index!36958 lt!361975)))))

(declare-fun b!808098 () Bool)

(declare-fun e!447317 () SeekEntryResult!8647)

(assert (=> b!808098 (= e!447317 e!447318)))

(assert (=> b!808098 (= lt!361974 (select (arr!21059 lt!361920) (index!36958 lt!361975)))))

(declare-fun c!88293 () Bool)

(assert (=> b!808098 (= c!88293 (= lt!361974 lt!361925))))

(declare-fun d!103559 () Bool)

(declare-fun lt!361976 () SeekEntryResult!8647)

(assert (=> d!103559 (and (or ((_ is Undefined!8647) lt!361976) (not ((_ is Found!8647) lt!361976)) (and (bvsge (index!36957 lt!361976) #b00000000000000000000000000000000) (bvslt (index!36957 lt!361976) (size!21480 lt!361920)))) (or ((_ is Undefined!8647) lt!361976) ((_ is Found!8647) lt!361976) (not ((_ is MissingZero!8647) lt!361976)) (and (bvsge (index!36956 lt!361976) #b00000000000000000000000000000000) (bvslt (index!36956 lt!361976) (size!21480 lt!361920)))) (or ((_ is Undefined!8647) lt!361976) ((_ is Found!8647) lt!361976) ((_ is MissingZero!8647) lt!361976) (not ((_ is MissingVacant!8647) lt!361976)) (and (bvsge (index!36959 lt!361976) #b00000000000000000000000000000000) (bvslt (index!36959 lt!361976) (size!21480 lt!361920)))) (or ((_ is Undefined!8647) lt!361976) (ite ((_ is Found!8647) lt!361976) (= (select (arr!21059 lt!361920) (index!36957 lt!361976)) lt!361925) (ite ((_ is MissingZero!8647) lt!361976) (= (select (arr!21059 lt!361920) (index!36956 lt!361976)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8647) lt!361976) (= (select (arr!21059 lt!361920) (index!36959 lt!361976)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103559 (= lt!361976 e!447317)))

(declare-fun c!88291 () Bool)

(assert (=> d!103559 (= c!88291 (and ((_ is Intermediate!8647) lt!361975) (undefined!9459 lt!361975)))))

(assert (=> d!103559 (= lt!361975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!361925 mask!3266) lt!361925 lt!361920 mask!3266))))

(assert (=> d!103559 (validMask!0 mask!3266)))

(assert (=> d!103559 (= (seekEntryOrOpen!0 lt!361925 lt!361920 mask!3266) lt!361976)))

(declare-fun b!808099 () Bool)

(assert (=> b!808099 (= e!447319 (seekKeyOrZeroReturnVacant!0 (x!67766 lt!361975) (index!36958 lt!361975) (index!36958 lt!361975) lt!361925 lt!361920 mask!3266))))

(declare-fun b!808100 () Bool)

(assert (=> b!808100 (= e!447317 Undefined!8647)))

(assert (= (and d!103559 c!88291) b!808100))

(assert (= (and d!103559 (not c!88291)) b!808098))

(assert (= (and b!808098 c!88293) b!808097))

(assert (= (and b!808098 (not c!88293)) b!808095))

(assert (= (and b!808095 c!88292) b!808096))

(assert (= (and b!808095 (not c!88292)) b!808099))

(declare-fun m!749781 () Bool)

(assert (=> b!808098 m!749781))

(declare-fun m!749783 () Bool)

(assert (=> d!103559 m!749783))

(declare-fun m!749785 () Bool)

(assert (=> d!103559 m!749785))

(declare-fun m!749787 () Bool)

(assert (=> d!103559 m!749787))

(assert (=> d!103559 m!749669))

(declare-fun m!749789 () Bool)

(assert (=> d!103559 m!749789))

(assert (=> d!103559 m!749789))

(declare-fun m!749791 () Bool)

(assert (=> d!103559 m!749791))

(declare-fun m!749793 () Bool)

(assert (=> b!808099 m!749793))

(assert (=> b!807981 d!103559))

(declare-fun b!808128 () Bool)

(declare-fun e!447339 () SeekEntryResult!8647)

(declare-fun e!447338 () SeekEntryResult!8647)

(assert (=> b!808128 (= e!447339 e!447338)))

(declare-fun c!88304 () Bool)

(declare-fun lt!361982 () (_ BitVec 64))

(assert (=> b!808128 (= c!88304 (= lt!361982 lt!361925))))

(declare-fun b!808129 () Bool)

(assert (=> b!808129 (= e!447339 Undefined!8647)))

(declare-fun d!103561 () Bool)

(declare-fun lt!361981 () SeekEntryResult!8647)

(assert (=> d!103561 (and (or ((_ is Undefined!8647) lt!361981) (not ((_ is Found!8647) lt!361981)) (and (bvsge (index!36957 lt!361981) #b00000000000000000000000000000000) (bvslt (index!36957 lt!361981) (size!21480 lt!361920)))) (or ((_ is Undefined!8647) lt!361981) ((_ is Found!8647) lt!361981) (not ((_ is MissingVacant!8647) lt!361981)) (not (= (index!36959 lt!361981) vacantAfter!23)) (and (bvsge (index!36959 lt!361981) #b00000000000000000000000000000000) (bvslt (index!36959 lt!361981) (size!21480 lt!361920)))) (or ((_ is Undefined!8647) lt!361981) (ite ((_ is Found!8647) lt!361981) (= (select (arr!21059 lt!361920) (index!36957 lt!361981)) lt!361925) (and ((_ is MissingVacant!8647) lt!361981) (= (index!36959 lt!361981) vacantAfter!23) (= (select (arr!21059 lt!361920) (index!36959 lt!361981)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103561 (= lt!361981 e!447339)))

(declare-fun c!88303 () Bool)

(assert (=> d!103561 (= c!88303 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103561 (= lt!361982 (select (arr!21059 lt!361920) index!1236))))

(assert (=> d!103561 (validMask!0 mask!3266)))

(assert (=> d!103561 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361925 lt!361920 mask!3266) lt!361981)))

(declare-fun b!808130 () Bool)

(declare-fun e!447340 () SeekEntryResult!8647)

(assert (=> b!808130 (= e!447340 (MissingVacant!8647 vacantAfter!23))))

(declare-fun b!808131 () Bool)

(declare-fun c!88305 () Bool)

(assert (=> b!808131 (= c!88305 (= lt!361982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!808131 (= e!447338 e!447340)))

(declare-fun b!808132 () Bool)

(assert (=> b!808132 (= e!447338 (Found!8647 index!1236))))

(declare-fun b!808133 () Bool)

(assert (=> b!808133 (= e!447340 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!361925 lt!361920 mask!3266))))

(assert (= (and d!103561 c!88303) b!808129))

(assert (= (and d!103561 (not c!88303)) b!808128))

(assert (= (and b!808128 c!88304) b!808132))

(assert (= (and b!808128 (not c!88304)) b!808131))

(assert (= (and b!808131 c!88305) b!808130))

(assert (= (and b!808131 (not c!88305)) b!808133))

(declare-fun m!749803 () Bool)

(assert (=> d!103561 m!749803))

(declare-fun m!749805 () Bool)

(assert (=> d!103561 m!749805))

(declare-fun m!749807 () Bool)

(assert (=> d!103561 m!749807))

(assert (=> d!103561 m!749669))

(assert (=> b!808133 m!749643))

(assert (=> b!808133 m!749643))

(declare-fun m!749809 () Bool)

(assert (=> b!808133 m!749809))

(assert (=> b!807981 d!103561))

(declare-fun bm!35362 () Bool)

(declare-fun call!35365 () Bool)

(assert (=> bm!35362 (= call!35365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!808178 () Bool)

(declare-fun e!447367 () Bool)

(declare-fun e!447366 () Bool)

(assert (=> b!808178 (= e!447367 e!447366)))

(declare-fun lt!362004 () (_ BitVec 64))

(assert (=> b!808178 (= lt!362004 (select (arr!21059 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27578 0))(
  ( (Unit!27579) )
))
(declare-fun lt!362006 () Unit!27578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43963 (_ BitVec 64) (_ BitVec 32)) Unit!27578)

(assert (=> b!808178 (= lt!362006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362004 #b00000000000000000000000000000000))))

(assert (=> b!808178 (arrayContainsKey!0 a!3170 lt!362004 #b00000000000000000000000000000000)))

(declare-fun lt!362005 () Unit!27578)

(assert (=> b!808178 (= lt!362005 lt!362006)))

(declare-fun res!552347 () Bool)

(assert (=> b!808178 (= res!552347 (= (seekEntryOrOpen!0 (select (arr!21059 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8647 #b00000000000000000000000000000000)))))

(assert (=> b!808178 (=> (not res!552347) (not e!447366))))

(declare-fun d!103569 () Bool)

(declare-fun res!552348 () Bool)

(declare-fun e!447365 () Bool)

(assert (=> d!103569 (=> res!552348 e!447365)))

(assert (=> d!103569 (= res!552348 (bvsge #b00000000000000000000000000000000 (size!21480 a!3170)))))

(assert (=> d!103569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!447365)))

(declare-fun b!808179 () Bool)

(assert (=> b!808179 (= e!447365 e!447367)))

(declare-fun c!88326 () Bool)

(assert (=> b!808179 (= c!88326 (validKeyInArray!0 (select (arr!21059 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808180 () Bool)

(assert (=> b!808180 (= e!447366 call!35365)))

(declare-fun b!808181 () Bool)

(assert (=> b!808181 (= e!447367 call!35365)))

(assert (= (and d!103569 (not res!552348)) b!808179))

(assert (= (and b!808179 c!88326) b!808178))

(assert (= (and b!808179 (not c!88326)) b!808181))

(assert (= (and b!808178 res!552347) b!808180))

(assert (= (or b!808180 b!808181) bm!35362))

(declare-fun m!749831 () Bool)

(assert (=> bm!35362 m!749831))

(assert (=> b!808178 m!749769))

(declare-fun m!749833 () Bool)

(assert (=> b!808178 m!749833))

(declare-fun m!749835 () Bool)

(assert (=> b!808178 m!749835))

(assert (=> b!808178 m!749769))

(declare-fun m!749837 () Bool)

(assert (=> b!808178 m!749837))

(assert (=> b!808179 m!749769))

(assert (=> b!808179 m!749769))

(assert (=> b!808179 m!749775))

(assert (=> b!807986 d!103569))

(declare-fun d!103575 () Bool)

(assert (=> d!103575 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69246 d!103575))

(declare-fun d!103577 () Bool)

(assert (=> d!103577 (= (array_inv!16942 a!3170) (bvsge (size!21480 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69246 d!103577))

(declare-fun b!808194 () Bool)

(declare-fun e!447375 () SeekEntryResult!8647)

(declare-fun e!447374 () SeekEntryResult!8647)

(assert (=> b!808194 (= e!447375 e!447374)))

(declare-fun c!88334 () Bool)

(declare-fun lt!362012 () (_ BitVec 64))

(assert (=> b!808194 (= c!88334 (= lt!362012 (select (arr!21059 a!3170) j!153)))))

(declare-fun b!808195 () Bool)

(assert (=> b!808195 (= e!447375 Undefined!8647)))

(declare-fun lt!362011 () SeekEntryResult!8647)

(declare-fun d!103579 () Bool)

(assert (=> d!103579 (and (or ((_ is Undefined!8647) lt!362011) (not ((_ is Found!8647) lt!362011)) (and (bvsge (index!36957 lt!362011) #b00000000000000000000000000000000) (bvslt (index!36957 lt!362011) (size!21480 a!3170)))) (or ((_ is Undefined!8647) lt!362011) ((_ is Found!8647) lt!362011) (not ((_ is MissingVacant!8647) lt!362011)) (not (= (index!36959 lt!362011) vacantBefore!23)) (and (bvsge (index!36959 lt!362011) #b00000000000000000000000000000000) (bvslt (index!36959 lt!362011) (size!21480 a!3170)))) (or ((_ is Undefined!8647) lt!362011) (ite ((_ is Found!8647) lt!362011) (= (select (arr!21059 a!3170) (index!36957 lt!362011)) (select (arr!21059 a!3170) j!153)) (and ((_ is MissingVacant!8647) lt!362011) (= (index!36959 lt!362011) vacantBefore!23) (= (select (arr!21059 a!3170) (index!36959 lt!362011)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103579 (= lt!362011 e!447375)))

(declare-fun c!88333 () Bool)

(assert (=> d!103579 (= c!88333 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103579 (= lt!362012 (select (arr!21059 a!3170) index!1236))))

(assert (=> d!103579 (validMask!0 mask!3266)))

(assert (=> d!103579 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21059 a!3170) j!153) a!3170 mask!3266) lt!362011)))

(declare-fun b!808196 () Bool)

(declare-fun e!447376 () SeekEntryResult!8647)

(assert (=> b!808196 (= e!447376 (MissingVacant!8647 vacantBefore!23))))

(declare-fun b!808197 () Bool)

(declare-fun c!88335 () Bool)

(assert (=> b!808197 (= c!88335 (= lt!362012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!808197 (= e!447374 e!447376)))

(declare-fun b!808198 () Bool)

(assert (=> b!808198 (= e!447374 (Found!8647 index!1236))))

(declare-fun b!808199 () Bool)

(assert (=> b!808199 (= e!447376 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21059 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!103579 c!88333) b!808195))

(assert (= (and d!103579 (not c!88333)) b!808194))

(assert (= (and b!808194 c!88334) b!808198))

(assert (= (and b!808194 (not c!88334)) b!808197))

(assert (= (and b!808197 c!88335) b!808196))

(assert (= (and b!808197 (not c!88335)) b!808199))

(declare-fun m!749839 () Bool)

(assert (=> d!103579 m!749839))

(declare-fun m!749841 () Bool)

(assert (=> d!103579 m!749841))

(assert (=> d!103579 m!749673))

(assert (=> d!103579 m!749669))

(assert (=> b!808199 m!749643))

(assert (=> b!808199 m!749643))

(assert (=> b!808199 m!749663))

(declare-fun m!749843 () Bool)

(assert (=> b!808199 m!749843))

(assert (=> b!807982 d!103579))

(declare-fun b!808206 () Bool)

(declare-fun c!88340 () Bool)

(declare-fun lt!362015 () (_ BitVec 64))

(assert (=> b!808206 (= c!88340 (= lt!362015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447381 () SeekEntryResult!8647)

(declare-fun e!447382 () SeekEntryResult!8647)

(assert (=> b!808206 (= e!447381 e!447382)))

(declare-fun b!808207 () Bool)

(declare-fun lt!362016 () SeekEntryResult!8647)

(assert (=> b!808207 (= e!447382 (MissingZero!8647 (index!36958 lt!362016)))))

(declare-fun b!808208 () Bool)

(assert (=> b!808208 (= e!447381 (Found!8647 (index!36958 lt!362016)))))

(declare-fun b!808209 () Bool)

(declare-fun e!447380 () SeekEntryResult!8647)

(assert (=> b!808209 (= e!447380 e!447381)))

(assert (=> b!808209 (= lt!362015 (select (arr!21059 a!3170) (index!36958 lt!362016)))))

(declare-fun c!88341 () Bool)

(assert (=> b!808209 (= c!88341 (= lt!362015 (select (arr!21059 a!3170) j!153)))))

(declare-fun d!103581 () Bool)

(declare-fun lt!362017 () SeekEntryResult!8647)

(assert (=> d!103581 (and (or ((_ is Undefined!8647) lt!362017) (not ((_ is Found!8647) lt!362017)) (and (bvsge (index!36957 lt!362017) #b00000000000000000000000000000000) (bvslt (index!36957 lt!362017) (size!21480 a!3170)))) (or ((_ is Undefined!8647) lt!362017) ((_ is Found!8647) lt!362017) (not ((_ is MissingZero!8647) lt!362017)) (and (bvsge (index!36956 lt!362017) #b00000000000000000000000000000000) (bvslt (index!36956 lt!362017) (size!21480 a!3170)))) (or ((_ is Undefined!8647) lt!362017) ((_ is Found!8647) lt!362017) ((_ is MissingZero!8647) lt!362017) (not ((_ is MissingVacant!8647) lt!362017)) (and (bvsge (index!36959 lt!362017) #b00000000000000000000000000000000) (bvslt (index!36959 lt!362017) (size!21480 a!3170)))) (or ((_ is Undefined!8647) lt!362017) (ite ((_ is Found!8647) lt!362017) (= (select (arr!21059 a!3170) (index!36957 lt!362017)) (select (arr!21059 a!3170) j!153)) (ite ((_ is MissingZero!8647) lt!362017) (= (select (arr!21059 a!3170) (index!36956 lt!362017)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8647) lt!362017) (= (select (arr!21059 a!3170) (index!36959 lt!362017)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103581 (= lt!362017 e!447380)))

(declare-fun c!88339 () Bool)

(assert (=> d!103581 (= c!88339 (and ((_ is Intermediate!8647) lt!362016) (undefined!9459 lt!362016)))))

(assert (=> d!103581 (= lt!362016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21059 a!3170) j!153) mask!3266) (select (arr!21059 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103581 (validMask!0 mask!3266)))

(assert (=> d!103581 (= (seekEntryOrOpen!0 (select (arr!21059 a!3170) j!153) a!3170 mask!3266) lt!362017)))

(declare-fun b!808210 () Bool)

(assert (=> b!808210 (= e!447382 (seekKeyOrZeroReturnVacant!0 (x!67766 lt!362016) (index!36958 lt!362016) (index!36958 lt!362016) (select (arr!21059 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808211 () Bool)

(assert (=> b!808211 (= e!447380 Undefined!8647)))

(assert (= (and d!103581 c!88339) b!808211))

(assert (= (and d!103581 (not c!88339)) b!808209))

(assert (= (and b!808209 c!88341) b!808208))

(assert (= (and b!808209 (not c!88341)) b!808206))

(assert (= (and b!808206 c!88340) b!808207))

(assert (= (and b!808206 (not c!88340)) b!808210))

(declare-fun m!749853 () Bool)

(assert (=> b!808209 m!749853))

(declare-fun m!749855 () Bool)

(assert (=> d!103581 m!749855))

(declare-fun m!749857 () Bool)

(assert (=> d!103581 m!749857))

(declare-fun m!749859 () Bool)

(assert (=> d!103581 m!749859))

(assert (=> d!103581 m!749669))

(assert (=> d!103581 m!749663))

(declare-fun m!749861 () Bool)

(assert (=> d!103581 m!749861))

(assert (=> d!103581 m!749861))

(assert (=> d!103581 m!749663))

(declare-fun m!749865 () Bool)

(assert (=> d!103581 m!749865))

(assert (=> b!808210 m!749663))

(declare-fun m!749869 () Bool)

(assert (=> b!808210 m!749869))

(assert (=> b!807982 d!103581))

(check-sat (not b!808079) (not b!808199) (not d!103557) (not b!808178) (not b!808090) (not b!808179) (not d!103581) (not bm!35356) (not bm!35362) (not b!808093) (not d!103579) (not b!808072) (not d!103549) (not b!808099) (not d!103559) (not b!808210) (not d!103561) (not b!808094) (not b!808133))
(check-sat)
