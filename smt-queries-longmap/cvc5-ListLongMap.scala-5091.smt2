; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69104 () Bool)

(assert start!69104)

(declare-fun b!806071 () Bool)

(declare-fun res!550396 () Bool)

(declare-fun e!446378 () Bool)

(assert (=> b!806071 (=> (not res!550396) (not e!446378))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806071 (= res!550396 (validKeyInArray!0 k!2044))))

(declare-fun b!806072 () Bool)

(declare-fun e!446376 () Bool)

(declare-fun e!446379 () Bool)

(assert (=> b!806072 (= e!446376 e!446379)))

(declare-fun res!550403 () Bool)

(assert (=> b!806072 (=> (not res!550403) (not e!446379))))

(declare-datatypes ((SeekEntryResult!8594 0))(
  ( (MissingZero!8594 (index!36744 (_ BitVec 32))) (Found!8594 (index!36745 (_ BitVec 32))) (Intermediate!8594 (undefined!9406 Bool) (index!36746 (_ BitVec 32)) (x!67563 (_ BitVec 32))) (Undefined!8594) (MissingVacant!8594 (index!36747 (_ BitVec 32))) )
))
(declare-fun lt!360975 () SeekEntryResult!8594)

(declare-fun lt!360972 () SeekEntryResult!8594)

(assert (=> b!806072 (= res!550403 (= lt!360975 lt!360972))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360976 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43849 0))(
  ( (array!43850 (arr!21003 (Array (_ BitVec 32) (_ BitVec 64))) (size!21424 (_ BitVec 32))) )
))
(declare-fun lt!360971 () array!43849)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43849 (_ BitVec 32)) SeekEntryResult!8594)

(assert (=> b!806072 (= lt!360972 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360976 lt!360971 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43849 (_ BitVec 32)) SeekEntryResult!8594)

(assert (=> b!806072 (= lt!360975 (seekEntryOrOpen!0 lt!360976 lt!360971 mask!3266))))

(declare-fun a!3170 () array!43849)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806072 (= lt!360976 (select (store (arr!21003 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806072 (= lt!360971 (array!43850 (store (arr!21003 a!3170) i!1163 k!2044) (size!21424 a!3170)))))

(declare-fun b!806073 () Bool)

(declare-fun res!550393 () Bool)

(assert (=> b!806073 (=> (not res!550393) (not e!446376))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806073 (= res!550393 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21424 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21003 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21424 a!3170)) (= (select (arr!21003 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806074 () Bool)

(declare-fun e!446377 () Bool)

(declare-fun e!446381 () Bool)

(assert (=> b!806074 (= e!446377 e!446381)))

(declare-fun res!550397 () Bool)

(assert (=> b!806074 (=> (not res!550397) (not e!446381))))

(declare-fun lt!360977 () SeekEntryResult!8594)

(declare-fun lt!360970 () SeekEntryResult!8594)

(assert (=> b!806074 (= res!550397 (and (= lt!360970 lt!360977) (= (select (arr!21003 a!3170) index!1236) (select (arr!21003 a!3170) j!153))))))

(assert (=> b!806074 (= lt!360977 (Found!8594 j!153))))

(declare-fun b!806075 () Bool)

(declare-fun res!550394 () Bool)

(assert (=> b!806075 (=> (not res!550394) (not e!446378))))

(assert (=> b!806075 (= res!550394 (validKeyInArray!0 (select (arr!21003 a!3170) j!153)))))

(declare-fun b!806076 () Bool)

(declare-fun res!550395 () Bool)

(assert (=> b!806076 (=> (not res!550395) (not e!446376))))

(declare-datatypes ((List!14966 0))(
  ( (Nil!14963) (Cons!14962 (h!16091 (_ BitVec 64)) (t!21281 List!14966)) )
))
(declare-fun arrayNoDuplicates!0 (array!43849 (_ BitVec 32) List!14966) Bool)

(assert (=> b!806076 (= res!550395 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14963))))

(declare-fun b!806077 () Bool)

(declare-fun res!550402 () Bool)

(assert (=> b!806077 (=> (not res!550402) (not e!446376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43849 (_ BitVec 32)) Bool)

(assert (=> b!806077 (= res!550402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!550401 () Bool)

(assert (=> start!69104 (=> (not res!550401) (not e!446378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69104 (= res!550401 (validMask!0 mask!3266))))

(assert (=> start!69104 e!446378))

(assert (=> start!69104 true))

(declare-fun array_inv!16799 (array!43849) Bool)

(assert (=> start!69104 (array_inv!16799 a!3170)))

(declare-fun b!806078 () Bool)

(assert (=> b!806078 (= e!446381 (not (= lt!360972 lt!360977)))))

(assert (=> b!806078 (= lt!360972 (Found!8594 index!1236))))

(declare-fun b!806079 () Bool)

(assert (=> b!806079 (= e!446378 e!446376)))

(declare-fun res!550399 () Bool)

(assert (=> b!806079 (=> (not res!550399) (not e!446376))))

(declare-fun lt!360974 () SeekEntryResult!8594)

(assert (=> b!806079 (= res!550399 (or (= lt!360974 (MissingZero!8594 i!1163)) (= lt!360974 (MissingVacant!8594 i!1163))))))

(assert (=> b!806079 (= lt!360974 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806080 () Bool)

(declare-fun res!550400 () Bool)

(assert (=> b!806080 (=> (not res!550400) (not e!446378))))

(declare-fun arrayContainsKey!0 (array!43849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806080 (= res!550400 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806081 () Bool)

(assert (=> b!806081 (= e!446379 e!446377)))

(declare-fun res!550398 () Bool)

(assert (=> b!806081 (=> (not res!550398) (not e!446377))))

(declare-fun lt!360973 () SeekEntryResult!8594)

(assert (=> b!806081 (= res!550398 (= lt!360973 lt!360970))))

(assert (=> b!806081 (= lt!360970 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21003 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806081 (= lt!360973 (seekEntryOrOpen!0 (select (arr!21003 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806082 () Bool)

(declare-fun res!550392 () Bool)

(assert (=> b!806082 (=> (not res!550392) (not e!446378))))

(assert (=> b!806082 (= res!550392 (and (= (size!21424 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21424 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21424 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69104 res!550401) b!806082))

(assert (= (and b!806082 res!550392) b!806075))

(assert (= (and b!806075 res!550394) b!806071))

(assert (= (and b!806071 res!550396) b!806080))

(assert (= (and b!806080 res!550400) b!806079))

(assert (= (and b!806079 res!550399) b!806077))

(assert (= (and b!806077 res!550402) b!806076))

(assert (= (and b!806076 res!550395) b!806073))

(assert (= (and b!806073 res!550393) b!806072))

(assert (= (and b!806072 res!550403) b!806081))

(assert (= (and b!806081 res!550398) b!806074))

(assert (= (and b!806074 res!550397) b!806078))

(declare-fun m!748025 () Bool)

(assert (=> b!806072 m!748025))

(declare-fun m!748027 () Bool)

(assert (=> b!806072 m!748027))

(declare-fun m!748029 () Bool)

(assert (=> b!806072 m!748029))

(declare-fun m!748031 () Bool)

(assert (=> b!806072 m!748031))

(declare-fun m!748033 () Bool)

(assert (=> b!806074 m!748033))

(declare-fun m!748035 () Bool)

(assert (=> b!806074 m!748035))

(assert (=> b!806075 m!748035))

(assert (=> b!806075 m!748035))

(declare-fun m!748037 () Bool)

(assert (=> b!806075 m!748037))

(declare-fun m!748039 () Bool)

(assert (=> b!806073 m!748039))

(declare-fun m!748041 () Bool)

(assert (=> b!806073 m!748041))

(assert (=> b!806081 m!748035))

(assert (=> b!806081 m!748035))

(declare-fun m!748043 () Bool)

(assert (=> b!806081 m!748043))

(assert (=> b!806081 m!748035))

(declare-fun m!748045 () Bool)

(assert (=> b!806081 m!748045))

(declare-fun m!748047 () Bool)

(assert (=> b!806080 m!748047))

(declare-fun m!748049 () Bool)

(assert (=> b!806076 m!748049))

(declare-fun m!748051 () Bool)

(assert (=> b!806079 m!748051))

(declare-fun m!748053 () Bool)

(assert (=> b!806077 m!748053))

(declare-fun m!748055 () Bool)

(assert (=> b!806071 m!748055))

(declare-fun m!748057 () Bool)

(assert (=> start!69104 m!748057))

(declare-fun m!748059 () Bool)

(assert (=> start!69104 m!748059))

(push 1)

(assert (not b!806072))

(assert (not b!806076))

(assert (not start!69104))

(assert (not b!806071))

(assert (not b!806080))

(assert (not b!806075))

(assert (not b!806077))

(assert (not b!806081))

(assert (not b!806079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103633 () Bool)

(assert (=> d!103633 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806071 d!103633))

(declare-fun b!806181 () Bool)

(declare-fun e!446434 () Bool)

(declare-fun e!446435 () Bool)

(assert (=> b!806181 (= e!446434 e!446435)))

(declare-fun lt!361043 () (_ BitVec 64))

(assert (=> b!806181 (= lt!361043 (select (arr!21003 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27610 0))(
  ( (Unit!27611) )
))
(declare-fun lt!361042 () Unit!27610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43849 (_ BitVec 64) (_ BitVec 32)) Unit!27610)

(assert (=> b!806181 (= lt!361042 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!361043 #b00000000000000000000000000000000))))

(assert (=> b!806181 (arrayContainsKey!0 a!3170 lt!361043 #b00000000000000000000000000000000)))

(declare-fun lt!361041 () Unit!27610)

(assert (=> b!806181 (= lt!361041 lt!361042)))

(declare-fun res!550481 () Bool)

(assert (=> b!806181 (= res!550481 (= (seekEntryOrOpen!0 (select (arr!21003 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8594 #b00000000000000000000000000000000)))))

(assert (=> b!806181 (=> (not res!550481) (not e!446435))))

(declare-fun b!806182 () Bool)

(declare-fun call!35367 () Bool)

(assert (=> b!806182 (= e!446435 call!35367)))

(declare-fun bm!35364 () Bool)

(assert (=> bm!35364 (= call!35367 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!806183 () Bool)

(assert (=> b!806183 (= e!446434 call!35367)))

(declare-fun b!806184 () Bool)

(declare-fun e!446433 () Bool)

(assert (=> b!806184 (= e!446433 e!446434)))

(declare-fun c!88261 () Bool)

(assert (=> b!806184 (= c!88261 (validKeyInArray!0 (select (arr!21003 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103637 () Bool)

(declare-fun res!550480 () Bool)

(assert (=> d!103637 (=> res!550480 e!446433)))

(assert (=> d!103637 (= res!550480 (bvsge #b00000000000000000000000000000000 (size!21424 a!3170)))))

(assert (=> d!103637 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446433)))

(assert (= (and d!103637 (not res!550480)) b!806184))

(assert (= (and b!806184 c!88261) b!806181))

(assert (= (and b!806184 (not c!88261)) b!806183))

(assert (= (and b!806181 res!550481) b!806182))

(assert (= (or b!806182 b!806183) bm!35364))

(declare-fun m!748147 () Bool)

(assert (=> b!806181 m!748147))

(declare-fun m!748149 () Bool)

(assert (=> b!806181 m!748149))

(declare-fun m!748151 () Bool)

(assert (=> b!806181 m!748151))

(assert (=> b!806181 m!748147))

(declare-fun m!748153 () Bool)

(assert (=> b!806181 m!748153))

(declare-fun m!748155 () Bool)

(assert (=> bm!35364 m!748155))

(assert (=> b!806184 m!748147))

(assert (=> b!806184 m!748147))

(declare-fun m!748157 () Bool)

(assert (=> b!806184 m!748157))

(assert (=> b!806077 d!103637))

(declare-fun b!806227 () Bool)

(declare-fun e!446460 () SeekEntryResult!8594)

(declare-fun e!446461 () SeekEntryResult!8594)

(assert (=> b!806227 (= e!446460 e!446461)))

(declare-fun c!88282 () Bool)

(declare-fun lt!361064 () (_ BitVec 64))

(assert (=> b!806227 (= c!88282 (= lt!361064 lt!360976))))

(declare-fun b!806228 () Bool)

(assert (=> b!806228 (= e!446461 (Found!8594 index!1236))))

(declare-fun d!103645 () Bool)

(declare-fun lt!361063 () SeekEntryResult!8594)

(assert (=> d!103645 (and (or (is-Undefined!8594 lt!361063) (not (is-Found!8594 lt!361063)) (and (bvsge (index!36745 lt!361063) #b00000000000000000000000000000000) (bvslt (index!36745 lt!361063) (size!21424 lt!360971)))) (or (is-Undefined!8594 lt!361063) (is-Found!8594 lt!361063) (not (is-MissingVacant!8594 lt!361063)) (not (= (index!36747 lt!361063) vacantAfter!23)) (and (bvsge (index!36747 lt!361063) #b00000000000000000000000000000000) (bvslt (index!36747 lt!361063) (size!21424 lt!360971)))) (or (is-Undefined!8594 lt!361063) (ite (is-Found!8594 lt!361063) (= (select (arr!21003 lt!360971) (index!36745 lt!361063)) lt!360976) (and (is-MissingVacant!8594 lt!361063) (= (index!36747 lt!361063) vacantAfter!23) (= (select (arr!21003 lt!360971) (index!36747 lt!361063)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103645 (= lt!361063 e!446460)))

(declare-fun c!88281 () Bool)

(assert (=> d!103645 (= c!88281 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103645 (= lt!361064 (select (arr!21003 lt!360971) index!1236))))

(assert (=> d!103645 (validMask!0 mask!3266)))

(assert (=> d!103645 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360976 lt!360971 mask!3266) lt!361063)))

(declare-fun b!806229 () Bool)

(declare-fun e!446462 () SeekEntryResult!8594)

(assert (=> b!806229 (= e!446462 (MissingVacant!8594 vacantAfter!23))))

(declare-fun b!806230 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806230 (= e!446462 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!360976 lt!360971 mask!3266))))

(declare-fun b!806231 () Bool)

(assert (=> b!806231 (= e!446460 Undefined!8594)))

(declare-fun b!806232 () Bool)

(declare-fun c!88280 () Bool)

(assert (=> b!806232 (= c!88280 (= lt!361064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806232 (= e!446461 e!446462)))

(assert (= (and d!103645 c!88281) b!806231))

(assert (= (and d!103645 (not c!88281)) b!806227))

(assert (= (and b!806227 c!88282) b!806228))

(assert (= (and b!806227 (not c!88282)) b!806232))

(assert (= (and b!806232 c!88280) b!806229))

(assert (= (and b!806232 (not c!88280)) b!806230))

(declare-fun m!748179 () Bool)

(assert (=> d!103645 m!748179))

(declare-fun m!748181 () Bool)

(assert (=> d!103645 m!748181))

(declare-fun m!748183 () Bool)

(assert (=> d!103645 m!748183))

(assert (=> d!103645 m!748057))

(declare-fun m!748185 () Bool)

(assert (=> b!806230 m!748185))

(assert (=> b!806230 m!748185))

(declare-fun m!748187 () Bool)

(assert (=> b!806230 m!748187))

(assert (=> b!806072 d!103645))

(declare-fun b!806334 () Bool)

(declare-fun c!88326 () Bool)

(declare-fun lt!361103 () (_ BitVec 64))

(assert (=> b!806334 (= c!88326 (= lt!361103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446524 () SeekEntryResult!8594)

(declare-fun e!446523 () SeekEntryResult!8594)

(assert (=> b!806334 (= e!446524 e!446523)))

(declare-fun b!806335 () Bool)

(declare-fun lt!361105 () SeekEntryResult!8594)

(assert (=> b!806335 (= e!446523 (MissingZero!8594 (index!36746 lt!361105)))))

(declare-fun b!806336 () Bool)

(declare-fun e!446525 () SeekEntryResult!8594)

(assert (=> b!806336 (= e!446525 e!446524)))

(assert (=> b!806336 (= lt!361103 (select (arr!21003 lt!360971) (index!36746 lt!361105)))))

(declare-fun c!88325 () Bool)

(assert (=> b!806336 (= c!88325 (= lt!361103 lt!360976))))

(declare-fun b!806337 () Bool)

(assert (=> b!806337 (= e!446523 (seekKeyOrZeroReturnVacant!0 (x!67563 lt!361105) (index!36746 lt!361105) (index!36746 lt!361105) lt!360976 lt!360971 mask!3266))))

(declare-fun b!806338 () Bool)

(assert (=> b!806338 (= e!446525 Undefined!8594)))

(declare-fun d!103653 () Bool)

(declare-fun lt!361104 () SeekEntryResult!8594)

(assert (=> d!103653 (and (or (is-Undefined!8594 lt!361104) (not (is-Found!8594 lt!361104)) (and (bvsge (index!36745 lt!361104) #b00000000000000000000000000000000) (bvslt (index!36745 lt!361104) (size!21424 lt!360971)))) (or (is-Undefined!8594 lt!361104) (is-Found!8594 lt!361104) (not (is-MissingZero!8594 lt!361104)) (and (bvsge (index!36744 lt!361104) #b00000000000000000000000000000000) (bvslt (index!36744 lt!361104) (size!21424 lt!360971)))) (or (is-Undefined!8594 lt!361104) (is-Found!8594 lt!361104) (is-MissingZero!8594 lt!361104) (not (is-MissingVacant!8594 lt!361104)) (and (bvsge (index!36747 lt!361104) #b00000000000000000000000000000000) (bvslt (index!36747 lt!361104) (size!21424 lt!360971)))) (or (is-Undefined!8594 lt!361104) (ite (is-Found!8594 lt!361104) (= (select (arr!21003 lt!360971) (index!36745 lt!361104)) lt!360976) (ite (is-MissingZero!8594 lt!361104) (= (select (arr!21003 lt!360971) (index!36744 lt!361104)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8594 lt!361104) (= (select (arr!21003 lt!360971) (index!36747 lt!361104)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103653 (= lt!361104 e!446525)))

(declare-fun c!88324 () Bool)

(assert (=> d!103653 (= c!88324 (and (is-Intermediate!8594 lt!361105) (undefined!9406 lt!361105)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43849 (_ BitVec 32)) SeekEntryResult!8594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103653 (= lt!361105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!360976 mask!3266) lt!360976 lt!360971 mask!3266))))

(assert (=> d!103653 (validMask!0 mask!3266)))

(assert (=> d!103653 (= (seekEntryOrOpen!0 lt!360976 lt!360971 mask!3266) lt!361104)))

(declare-fun b!806339 () Bool)

(assert (=> b!806339 (= e!446524 (Found!8594 (index!36746 lt!361105)))))

(assert (= (and d!103653 c!88324) b!806338))

(assert (= (and d!103653 (not c!88324)) b!806336))

(assert (= (and b!806336 c!88325) b!806339))

(assert (= (and b!806336 (not c!88325)) b!806334))

(assert (= (and b!806334 c!88326) b!806335))

(assert (= (and b!806334 (not c!88326)) b!806337))

(declare-fun m!748269 () Bool)

(assert (=> b!806336 m!748269))

(declare-fun m!748271 () Bool)

(assert (=> b!806337 m!748271))

(declare-fun m!748273 () Bool)

(assert (=> d!103653 m!748273))

(assert (=> d!103653 m!748057))

(declare-fun m!748275 () Bool)

(assert (=> d!103653 m!748275))

(declare-fun m!748277 () Bool)

(assert (=> d!103653 m!748277))

(declare-fun m!748279 () Bool)

(assert (=> d!103653 m!748279))

(declare-fun m!748281 () Bool)

(assert (=> d!103653 m!748281))

(assert (=> d!103653 m!748279))

(assert (=> b!806072 d!103653))

(declare-fun d!103677 () Bool)

(assert (=> d!103677 (= (validKeyInArray!0 (select (arr!21003 a!3170) j!153)) (and (not (= (select (arr!21003 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21003 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806075 d!103677))

(declare-fun b!806344 () Bool)

(declare-fun e!446530 () SeekEntryResult!8594)

(declare-fun e!446531 () SeekEntryResult!8594)

(assert (=> b!806344 (= e!446530 e!446531)))

(declare-fun c!88329 () Bool)

(declare-fun lt!361107 () (_ BitVec 64))

(assert (=> b!806344 (= c!88329 (= lt!361107 (select (arr!21003 a!3170) j!153)))))

(declare-fun b!806345 () Bool)

(assert (=> b!806345 (= e!446531 (Found!8594 index!1236))))

(declare-fun d!103679 () Bool)

(declare-fun lt!361106 () SeekEntryResult!8594)

(assert (=> d!103679 (and (or (is-Undefined!8594 lt!361106) (not (is-Found!8594 lt!361106)) (and (bvsge (index!36745 lt!361106) #b00000000000000000000000000000000) (bvslt (index!36745 lt!361106) (size!21424 a!3170)))) (or (is-Undefined!8594 lt!361106) (is-Found!8594 lt!361106) (not (is-MissingVacant!8594 lt!361106)) (not (= (index!36747 lt!361106) vacantBefore!23)) (and (bvsge (index!36747 lt!361106) #b00000000000000000000000000000000) (bvslt (index!36747 lt!361106) (size!21424 a!3170)))) (or (is-Undefined!8594 lt!361106) (ite (is-Found!8594 lt!361106) (= (select (arr!21003 a!3170) (index!36745 lt!361106)) (select (arr!21003 a!3170) j!153)) (and (is-MissingVacant!8594 lt!361106) (= (index!36747 lt!361106) vacantBefore!23) (= (select (arr!21003 a!3170) (index!36747 lt!361106)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103679 (= lt!361106 e!446530)))

(declare-fun c!88328 () Bool)

(assert (=> d!103679 (= c!88328 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103679 (= lt!361107 (select (arr!21003 a!3170) index!1236))))

(assert (=> d!103679 (validMask!0 mask!3266)))

(assert (=> d!103679 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21003 a!3170) j!153) a!3170 mask!3266) lt!361106)))

(declare-fun b!806346 () Bool)

(declare-fun e!446532 () SeekEntryResult!8594)

(assert (=> b!806346 (= e!446532 (MissingVacant!8594 vacantBefore!23))))

(declare-fun b!806347 () Bool)

(assert (=> b!806347 (= e!446532 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21003 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806348 () Bool)

(assert (=> b!806348 (= e!446530 Undefined!8594)))

(declare-fun b!806349 () Bool)

(declare-fun c!88327 () Bool)

(assert (=> b!806349 (= c!88327 (= lt!361107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806349 (= e!446531 e!446532)))

(assert (= (and d!103679 c!88328) b!806348))

(assert (= (and d!103679 (not c!88328)) b!806344))

(assert (= (and b!806344 c!88329) b!806345))

(assert (= (and b!806344 (not c!88329)) b!806349))

(assert (= (and b!806349 c!88327) b!806346))

(assert (= (and b!806349 (not c!88327)) b!806347))

(declare-fun m!748283 () Bool)

(assert (=> d!103679 m!748283))

(declare-fun m!748285 () Bool)

(assert (=> d!103679 m!748285))

(assert (=> d!103679 m!748033))

(assert (=> d!103679 m!748057))

(assert (=> b!806347 m!748185))

(assert (=> b!806347 m!748185))

(assert (=> b!806347 m!748035))

(declare-fun m!748287 () Bool)

(assert (=> b!806347 m!748287))

(assert (=> b!806081 d!103679))

(declare-fun b!806350 () Bool)

(declare-fun c!88332 () Bool)

(declare-fun lt!361108 () (_ BitVec 64))

(assert (=> b!806350 (= c!88332 (= lt!361108 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446534 () SeekEntryResult!8594)

(declare-fun e!446533 () SeekEntryResult!8594)

(assert (=> b!806350 (= e!446534 e!446533)))

(declare-fun b!806351 () Bool)

(declare-fun lt!361110 () SeekEntryResult!8594)

(assert (=> b!806351 (= e!446533 (MissingZero!8594 (index!36746 lt!361110)))))

(declare-fun b!806352 () Bool)

(declare-fun e!446535 () SeekEntryResult!8594)

(assert (=> b!806352 (= e!446535 e!446534)))

(assert (=> b!806352 (= lt!361108 (select (arr!21003 a!3170) (index!36746 lt!361110)))))

(declare-fun c!88331 () Bool)

(assert (=> b!806352 (= c!88331 (= lt!361108 (select (arr!21003 a!3170) j!153)))))

(declare-fun b!806353 () Bool)

(assert (=> b!806353 (= e!446533 (seekKeyOrZeroReturnVacant!0 (x!67563 lt!361110) (index!36746 lt!361110) (index!36746 lt!361110) (select (arr!21003 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806354 () Bool)

(assert (=> b!806354 (= e!446535 Undefined!8594)))

(declare-fun d!103681 () Bool)

(declare-fun lt!361109 () SeekEntryResult!8594)

(assert (=> d!103681 (and (or (is-Undefined!8594 lt!361109) (not (is-Found!8594 lt!361109)) (and (bvsge (index!36745 lt!361109) #b00000000000000000000000000000000) (bvslt (index!36745 lt!361109) (size!21424 a!3170)))) (or (is-Undefined!8594 lt!361109) (is-Found!8594 lt!361109) (not (is-MissingZero!8594 lt!361109)) (and (bvsge (index!36744 lt!361109) #b00000000000000000000000000000000) (bvslt (index!36744 lt!361109) (size!21424 a!3170)))) (or (is-Undefined!8594 lt!361109) (is-Found!8594 lt!361109) (is-MissingZero!8594 lt!361109) (not (is-MissingVacant!8594 lt!361109)) (and (bvsge (index!36747 lt!361109) #b00000000000000000000000000000000) (bvslt (index!36747 lt!361109) (size!21424 a!3170)))) (or (is-Undefined!8594 lt!361109) (ite (is-Found!8594 lt!361109) (= (select (arr!21003 a!3170) (index!36745 lt!361109)) (select (arr!21003 a!3170) j!153)) (ite (is-MissingZero!8594 lt!361109) (= (select (arr!21003 a!3170) (index!36744 lt!361109)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8594 lt!361109) (= (select (arr!21003 a!3170) (index!36747 lt!361109)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103681 (= lt!361109 e!446535)))

(declare-fun c!88330 () Bool)

(assert (=> d!103681 (= c!88330 (and (is-Intermediate!8594 lt!361110) (undefined!9406 lt!361110)))))

(assert (=> d!103681 (= lt!361110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21003 a!3170) j!153) mask!3266) (select (arr!21003 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103681 (validMask!0 mask!3266)))

(assert (=> d!103681 (= (seekEntryOrOpen!0 (select (arr!21003 a!3170) j!153) a!3170 mask!3266) lt!361109)))

(declare-fun b!806355 () Bool)

(assert (=> b!806355 (= e!446534 (Found!8594 (index!36746 lt!361110)))))

(assert (= (and d!103681 c!88330) b!806354))

(assert (= (and d!103681 (not c!88330)) b!806352))

(assert (= (and b!806352 c!88331) b!806355))

(assert (= (and b!806352 (not c!88331)) b!806350))

(assert (= (and b!806350 c!88332) b!806351))

(assert (= (and b!806350 (not c!88332)) b!806353))

(declare-fun m!748291 () Bool)

(assert (=> b!806352 m!748291))

(assert (=> b!806353 m!748035))

(declare-fun m!748293 () Bool)

(assert (=> b!806353 m!748293))

(declare-fun m!748295 () Bool)

(assert (=> d!103681 m!748295))

(assert (=> d!103681 m!748057))

(declare-fun m!748297 () Bool)

(assert (=> d!103681 m!748297))

(declare-fun m!748299 () Bool)

(assert (=> d!103681 m!748299))

(declare-fun m!748301 () Bool)

(assert (=> d!103681 m!748301))

(assert (=> d!103681 m!748035))

(declare-fun m!748303 () Bool)

(assert (=> d!103681 m!748303))

(assert (=> d!103681 m!748035))

(assert (=> d!103681 m!748301))

(assert (=> b!806081 d!103681))

(declare-fun b!806372 () Bool)

(declare-fun e!446552 () Bool)

(declare-fun e!446550 () Bool)

(assert (=> b!806372 (= e!446552 e!446550)))

(declare-fun c!88336 () Bool)

(assert (=> b!806372 (= c!88336 (validKeyInArray!0 (select (arr!21003 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!806373 () Bool)

(declare-fun e!446549 () Bool)

(declare-fun contains!4124 (List!14966 (_ BitVec 64)) Bool)

(assert (=> b!806373 (= e!446549 (contains!4124 Nil!14963 (select (arr!21003 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!806374 () Bool)

(declare-fun call!35379 () Bool)

(assert (=> b!806374 (= e!446550 call!35379)))

(declare-fun bm!35376 () Bool)

(assert (=> bm!35376 (= call!35379 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88336 (Cons!14962 (select (arr!21003 a!3170) #b00000000000000000000000000000000) Nil!14963) Nil!14963)))))

(declare-fun b!806375 () Bool)

(declare-fun e!446551 () Bool)

(assert (=> b!806375 (= e!446551 e!446552)))

(declare-fun res!550522 () Bool)

(assert (=> b!806375 (=> (not res!550522) (not e!446552))))

(assert (=> b!806375 (= res!550522 (not e!446549))))

(declare-fun res!550523 () Bool)

(assert (=> b!806375 (=> (not res!550523) (not e!446549))))

(assert (=> b!806375 (= res!550523 (validKeyInArray!0 (select (arr!21003 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!806376 () Bool)

(assert (=> b!806376 (= e!446550 call!35379)))

(declare-fun d!103683 () Bool)

(declare-fun res!550521 () Bool)

(assert (=> d!103683 (=> res!550521 e!446551)))

(assert (=> d!103683 (= res!550521 (bvsge #b00000000000000000000000000000000 (size!21424 a!3170)))))

(assert (=> d!103683 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14963) e!446551)))

(assert (= (and d!103683 (not res!550521)) b!806375))

(assert (= (and b!806375 res!550523) b!806373))

(assert (= (and b!806375 res!550522) b!806372))

(assert (= (and b!806372 c!88336) b!806376))

(assert (= (and b!806372 (not c!88336)) b!806374))

(assert (= (or b!806376 b!806374) bm!35376))

(assert (=> b!806372 m!748147))

(assert (=> b!806372 m!748147))

(assert (=> b!806372 m!748157))

(assert (=> b!806373 m!748147))

(assert (=> b!806373 m!748147))

(declare-fun m!748315 () Bool)

(assert (=> b!806373 m!748315))

(assert (=> bm!35376 m!748147))

(declare-fun m!748317 () Bool)

(assert (=> bm!35376 m!748317))

(assert (=> b!806375 m!748147))

(assert (=> b!806375 m!748147))

(assert (=> b!806375 m!748157))

(assert (=> b!806076 d!103683))

(declare-fun b!806377 () Bool)

(declare-fun c!88339 () Bool)

(declare-fun lt!361114 () (_ BitVec 64))

(assert (=> b!806377 (= c!88339 (= lt!361114 #b0000000000000000000000000000000000000000000000000000000000000000))))

