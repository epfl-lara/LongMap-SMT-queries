; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69012 () Bool)

(assert start!69012)

(declare-fun e!445885 () Bool)

(declare-datatypes ((SeekEntryResult!8578 0))(
  ( (MissingZero!8578 (index!36680 (_ BitVec 32))) (Found!8578 (index!36681 (_ BitVec 32))) (Intermediate!8578 (undefined!9390 Bool) (index!36682 (_ BitVec 32)) (x!67507 (_ BitVec 32))) (Undefined!8578) (MissingVacant!8578 (index!36683 (_ BitVec 32))) )
))
(declare-fun lt!360384 () SeekEntryResult!8578)

(declare-fun lt!360383 () SeekEntryResult!8578)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun b!805169 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43819 0))(
  ( (array!43820 (arr!20990 (Array (_ BitVec 32) (_ BitVec 64))) (size!21411 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43819)

(declare-fun lt!360381 () SeekEntryResult!8578)

(assert (=> b!805169 (= e!445885 (and (= lt!360384 lt!360383) (= lt!360383 (Found!8578 j!153)) (= (select (arr!20990 a!3170) index!1236) (select (arr!20990 a!3170) j!153)) (not (= lt!360381 (Found!8578 index!1236)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43819 (_ BitVec 32)) SeekEntryResult!8578)

(assert (=> b!805169 (= lt!360383 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20990 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43819 (_ BitVec 32)) SeekEntryResult!8578)

(assert (=> b!805169 (= lt!360384 (seekEntryOrOpen!0 (select (arr!20990 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805170 () Bool)

(declare-fun res!549829 () Bool)

(declare-fun e!445888 () Bool)

(assert (=> b!805170 (=> (not res!549829) (not e!445888))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805170 (= res!549829 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21411 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20990 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21411 a!3170)) (= (select (arr!20990 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805171 () Bool)

(declare-fun res!549836 () Bool)

(declare-fun e!445886 () Bool)

(assert (=> b!805171 (=> (not res!549836) (not e!445886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805171 (= res!549836 (validKeyInArray!0 (select (arr!20990 a!3170) j!153)))))

(declare-fun res!549834 () Bool)

(assert (=> start!69012 (=> (not res!549834) (not e!445886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69012 (= res!549834 (validMask!0 mask!3266))))

(assert (=> start!69012 e!445886))

(assert (=> start!69012 true))

(declare-fun array_inv!16873 (array!43819) Bool)

(assert (=> start!69012 (array_inv!16873 a!3170)))

(declare-fun b!805172 () Bool)

(declare-fun res!549835 () Bool)

(assert (=> b!805172 (=> (not res!549835) (not e!445886))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805172 (= res!549835 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805173 () Bool)

(assert (=> b!805173 (= e!445888 e!445885)))

(declare-fun res!549831 () Bool)

(assert (=> b!805173 (=> (not res!549831) (not e!445885))))

(declare-fun lt!360382 () SeekEntryResult!8578)

(assert (=> b!805173 (= res!549831 (= lt!360382 lt!360381))))

(declare-fun lt!360380 () (_ BitVec 64))

(declare-fun lt!360386 () array!43819)

(assert (=> b!805173 (= lt!360381 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360380 lt!360386 mask!3266))))

(assert (=> b!805173 (= lt!360382 (seekEntryOrOpen!0 lt!360380 lt!360386 mask!3266))))

(assert (=> b!805173 (= lt!360380 (select (store (arr!20990 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805173 (= lt!360386 (array!43820 (store (arr!20990 a!3170) i!1163 k0!2044) (size!21411 a!3170)))))

(declare-fun b!805174 () Bool)

(declare-fun res!549833 () Bool)

(assert (=> b!805174 (=> (not res!549833) (not e!445888))))

(declare-datatypes ((List!14992 0))(
  ( (Nil!14989) (Cons!14988 (h!16117 (_ BitVec 64)) (t!21298 List!14992)) )
))
(declare-fun arrayNoDuplicates!0 (array!43819 (_ BitVec 32) List!14992) Bool)

(assert (=> b!805174 (= res!549833 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14989))))

(declare-fun b!805175 () Bool)

(assert (=> b!805175 (= e!445886 e!445888)))

(declare-fun res!549832 () Bool)

(assert (=> b!805175 (=> (not res!549832) (not e!445888))))

(declare-fun lt!360385 () SeekEntryResult!8578)

(assert (=> b!805175 (= res!549832 (or (= lt!360385 (MissingZero!8578 i!1163)) (= lt!360385 (MissingVacant!8578 i!1163))))))

(assert (=> b!805175 (= lt!360385 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805176 () Bool)

(declare-fun res!549837 () Bool)

(assert (=> b!805176 (=> (not res!549837) (not e!445888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43819 (_ BitVec 32)) Bool)

(assert (=> b!805176 (= res!549837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805177 () Bool)

(declare-fun res!549830 () Bool)

(assert (=> b!805177 (=> (not res!549830) (not e!445886))))

(assert (=> b!805177 (= res!549830 (and (= (size!21411 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21411 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21411 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805178 () Bool)

(declare-fun res!549828 () Bool)

(assert (=> b!805178 (=> (not res!549828) (not e!445886))))

(assert (=> b!805178 (= res!549828 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69012 res!549834) b!805177))

(assert (= (and b!805177 res!549830) b!805171))

(assert (= (and b!805171 res!549836) b!805178))

(assert (= (and b!805178 res!549828) b!805172))

(assert (= (and b!805172 res!549835) b!805175))

(assert (= (and b!805175 res!549832) b!805176))

(assert (= (and b!805176 res!549837) b!805174))

(assert (= (and b!805174 res!549833) b!805170))

(assert (= (and b!805170 res!549829) b!805173))

(assert (= (and b!805173 res!549831) b!805169))

(declare-fun m!746623 () Bool)

(assert (=> b!805175 m!746623))

(declare-fun m!746625 () Bool)

(assert (=> start!69012 m!746625))

(declare-fun m!746627 () Bool)

(assert (=> start!69012 m!746627))

(declare-fun m!746629 () Bool)

(assert (=> b!805169 m!746629))

(declare-fun m!746631 () Bool)

(assert (=> b!805169 m!746631))

(assert (=> b!805169 m!746631))

(declare-fun m!746633 () Bool)

(assert (=> b!805169 m!746633))

(assert (=> b!805169 m!746631))

(declare-fun m!746635 () Bool)

(assert (=> b!805169 m!746635))

(declare-fun m!746637 () Bool)

(assert (=> b!805170 m!746637))

(declare-fun m!746639 () Bool)

(assert (=> b!805170 m!746639))

(declare-fun m!746641 () Bool)

(assert (=> b!805178 m!746641))

(declare-fun m!746643 () Bool)

(assert (=> b!805173 m!746643))

(declare-fun m!746645 () Bool)

(assert (=> b!805173 m!746645))

(declare-fun m!746647 () Bool)

(assert (=> b!805173 m!746647))

(declare-fun m!746649 () Bool)

(assert (=> b!805173 m!746649))

(assert (=> b!805171 m!746631))

(assert (=> b!805171 m!746631))

(declare-fun m!746651 () Bool)

(assert (=> b!805171 m!746651))

(declare-fun m!746653 () Bool)

(assert (=> b!805172 m!746653))

(declare-fun m!746655 () Bool)

(assert (=> b!805174 m!746655))

(declare-fun m!746657 () Bool)

(assert (=> b!805176 m!746657))

(check-sat (not b!805176) (not b!805174) (not start!69012) (not b!805169) (not b!805171) (not b!805175) (not b!805173) (not b!805178) (not b!805172))
(check-sat)
(get-model)

(declare-fun b!805251 () Bool)

(declare-fun e!445920 () SeekEntryResult!8578)

(assert (=> b!805251 (= e!445920 (Found!8578 index!1236))))

(declare-fun b!805252 () Bool)

(declare-fun e!445919 () SeekEntryResult!8578)

(assert (=> b!805252 (= e!445919 e!445920)))

(declare-fun c!88087 () Bool)

(declare-fun lt!360434 () (_ BitVec 64))

(assert (=> b!805252 (= c!88087 (= lt!360434 (select (arr!20990 a!3170) j!153)))))

(declare-fun lt!360433 () SeekEntryResult!8578)

(declare-fun d!103357 () Bool)

(get-info :version)

(assert (=> d!103357 (and (or ((_ is Undefined!8578) lt!360433) (not ((_ is Found!8578) lt!360433)) (and (bvsge (index!36681 lt!360433) #b00000000000000000000000000000000) (bvslt (index!36681 lt!360433) (size!21411 a!3170)))) (or ((_ is Undefined!8578) lt!360433) ((_ is Found!8578) lt!360433) (not ((_ is MissingVacant!8578) lt!360433)) (not (= (index!36683 lt!360433) vacantBefore!23)) (and (bvsge (index!36683 lt!360433) #b00000000000000000000000000000000) (bvslt (index!36683 lt!360433) (size!21411 a!3170)))) (or ((_ is Undefined!8578) lt!360433) (ite ((_ is Found!8578) lt!360433) (= (select (arr!20990 a!3170) (index!36681 lt!360433)) (select (arr!20990 a!3170) j!153)) (and ((_ is MissingVacant!8578) lt!360433) (= (index!36683 lt!360433) vacantBefore!23) (= (select (arr!20990 a!3170) (index!36683 lt!360433)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103357 (= lt!360433 e!445919)))

(declare-fun c!88089 () Bool)

(assert (=> d!103357 (= c!88089 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103357 (= lt!360434 (select (arr!20990 a!3170) index!1236))))

(assert (=> d!103357 (validMask!0 mask!3266)))

(assert (=> d!103357 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20990 a!3170) j!153) a!3170 mask!3266) lt!360433)))

(declare-fun b!805253 () Bool)

(declare-fun e!445921 () SeekEntryResult!8578)

(assert (=> b!805253 (= e!445921 (MissingVacant!8578 vacantBefore!23))))

(declare-fun b!805254 () Bool)

(declare-fun c!88088 () Bool)

(assert (=> b!805254 (= c!88088 (= lt!360434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805254 (= e!445920 e!445921)))

(declare-fun b!805255 () Bool)

(assert (=> b!805255 (= e!445919 Undefined!8578)))

(declare-fun b!805256 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!805256 (= e!445921 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!20990 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!103357 c!88089) b!805255))

(assert (= (and d!103357 (not c!88089)) b!805252))

(assert (= (and b!805252 c!88087) b!805251))

(assert (= (and b!805252 (not c!88087)) b!805254))

(assert (= (and b!805254 c!88088) b!805253))

(assert (= (and b!805254 (not c!88088)) b!805256))

(declare-fun m!746731 () Bool)

(assert (=> d!103357 m!746731))

(declare-fun m!746733 () Bool)

(assert (=> d!103357 m!746733))

(assert (=> d!103357 m!746629))

(assert (=> d!103357 m!746625))

(declare-fun m!746735 () Bool)

(assert (=> b!805256 m!746735))

(assert (=> b!805256 m!746735))

(assert (=> b!805256 m!746631))

(declare-fun m!746737 () Bool)

(assert (=> b!805256 m!746737))

(assert (=> b!805169 d!103357))

(declare-fun lt!360456 () SeekEntryResult!8578)

(declare-fun b!805289 () Bool)

(declare-fun e!445944 () SeekEntryResult!8578)

(assert (=> b!805289 (= e!445944 (seekKeyOrZeroReturnVacant!0 (x!67507 lt!360456) (index!36682 lt!360456) (index!36682 lt!360456) (select (arr!20990 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805290 () Bool)

(declare-fun c!88103 () Bool)

(declare-fun lt!360457 () (_ BitVec 64))

(assert (=> b!805290 (= c!88103 (= lt!360457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!445945 () SeekEntryResult!8578)

(assert (=> b!805290 (= e!445945 e!445944)))

(declare-fun b!805291 () Bool)

(assert (=> b!805291 (= e!445944 (MissingZero!8578 (index!36682 lt!360456)))))

(declare-fun d!103359 () Bool)

(declare-fun lt!360458 () SeekEntryResult!8578)

(assert (=> d!103359 (and (or ((_ is Undefined!8578) lt!360458) (not ((_ is Found!8578) lt!360458)) (and (bvsge (index!36681 lt!360458) #b00000000000000000000000000000000) (bvslt (index!36681 lt!360458) (size!21411 a!3170)))) (or ((_ is Undefined!8578) lt!360458) ((_ is Found!8578) lt!360458) (not ((_ is MissingZero!8578) lt!360458)) (and (bvsge (index!36680 lt!360458) #b00000000000000000000000000000000) (bvslt (index!36680 lt!360458) (size!21411 a!3170)))) (or ((_ is Undefined!8578) lt!360458) ((_ is Found!8578) lt!360458) ((_ is MissingZero!8578) lt!360458) (not ((_ is MissingVacant!8578) lt!360458)) (and (bvsge (index!36683 lt!360458) #b00000000000000000000000000000000) (bvslt (index!36683 lt!360458) (size!21411 a!3170)))) (or ((_ is Undefined!8578) lt!360458) (ite ((_ is Found!8578) lt!360458) (= (select (arr!20990 a!3170) (index!36681 lt!360458)) (select (arr!20990 a!3170) j!153)) (ite ((_ is MissingZero!8578) lt!360458) (= (select (arr!20990 a!3170) (index!36680 lt!360458)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8578) lt!360458) (= (select (arr!20990 a!3170) (index!36683 lt!360458)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!445943 () SeekEntryResult!8578)

(assert (=> d!103359 (= lt!360458 e!445943)))

(declare-fun c!88102 () Bool)

(assert (=> d!103359 (= c!88102 (and ((_ is Intermediate!8578) lt!360456) (undefined!9390 lt!360456)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43819 (_ BitVec 32)) SeekEntryResult!8578)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103359 (= lt!360456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20990 a!3170) j!153) mask!3266) (select (arr!20990 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103359 (validMask!0 mask!3266)))

(assert (=> d!103359 (= (seekEntryOrOpen!0 (select (arr!20990 a!3170) j!153) a!3170 mask!3266) lt!360458)))

(declare-fun b!805292 () Bool)

(assert (=> b!805292 (= e!445943 Undefined!8578)))

(declare-fun b!805293 () Bool)

(assert (=> b!805293 (= e!445943 e!445945)))

(assert (=> b!805293 (= lt!360457 (select (arr!20990 a!3170) (index!36682 lt!360456)))))

(declare-fun c!88101 () Bool)

(assert (=> b!805293 (= c!88101 (= lt!360457 (select (arr!20990 a!3170) j!153)))))

(declare-fun b!805294 () Bool)

(assert (=> b!805294 (= e!445945 (Found!8578 (index!36682 lt!360456)))))

(assert (= (and d!103359 c!88102) b!805292))

(assert (= (and d!103359 (not c!88102)) b!805293))

(assert (= (and b!805293 c!88101) b!805294))

(assert (= (and b!805293 (not c!88101)) b!805290))

(assert (= (and b!805290 c!88103) b!805291))

(assert (= (and b!805290 (not c!88103)) b!805289))

(assert (=> b!805289 m!746631))

(declare-fun m!746761 () Bool)

(assert (=> b!805289 m!746761))

(declare-fun m!746765 () Bool)

(assert (=> d!103359 m!746765))

(declare-fun m!746767 () Bool)

(assert (=> d!103359 m!746767))

(assert (=> d!103359 m!746631))

(declare-fun m!746769 () Bool)

(assert (=> d!103359 m!746769))

(assert (=> d!103359 m!746631))

(assert (=> d!103359 m!746767))

(declare-fun m!746771 () Bool)

(assert (=> d!103359 m!746771))

(declare-fun m!746773 () Bool)

(assert (=> d!103359 m!746773))

(assert (=> d!103359 m!746625))

(declare-fun m!746775 () Bool)

(assert (=> b!805293 m!746775))

(assert (=> b!805169 d!103359))

(declare-fun b!805315 () Bool)

(declare-fun e!445965 () Bool)

(declare-fun call!35329 () Bool)

(assert (=> b!805315 (= e!445965 call!35329)))

(declare-fun b!805316 () Bool)

(assert (=> b!805316 (= e!445965 call!35329)))

(declare-fun d!103369 () Bool)

(declare-fun res!549922 () Bool)

(declare-fun e!445963 () Bool)

(assert (=> d!103369 (=> res!549922 e!445963)))

(assert (=> d!103369 (= res!549922 (bvsge #b00000000000000000000000000000000 (size!21411 a!3170)))))

(assert (=> d!103369 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14989) e!445963)))

(declare-fun b!805317 () Bool)

(declare-fun e!445964 () Bool)

(assert (=> b!805317 (= e!445964 e!445965)))

(declare-fun c!88107 () Bool)

(assert (=> b!805317 (= c!88107 (validKeyInArray!0 (select (arr!20990 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805318 () Bool)

(declare-fun e!445966 () Bool)

(declare-fun contains!4099 (List!14992 (_ BitVec 64)) Bool)

(assert (=> b!805318 (= e!445966 (contains!4099 Nil!14989 (select (arr!20990 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35326 () Bool)

(assert (=> bm!35326 (= call!35329 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88107 (Cons!14988 (select (arr!20990 a!3170) #b00000000000000000000000000000000) Nil!14989) Nil!14989)))))

(declare-fun b!805319 () Bool)

(assert (=> b!805319 (= e!445963 e!445964)))

(declare-fun res!549923 () Bool)

(assert (=> b!805319 (=> (not res!549923) (not e!445964))))

(assert (=> b!805319 (= res!549923 (not e!445966))))

(declare-fun res!549924 () Bool)

(assert (=> b!805319 (=> (not res!549924) (not e!445966))))

(assert (=> b!805319 (= res!549924 (validKeyInArray!0 (select (arr!20990 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103369 (not res!549922)) b!805319))

(assert (= (and b!805319 res!549924) b!805318))

(assert (= (and b!805319 res!549923) b!805317))

(assert (= (and b!805317 c!88107) b!805315))

(assert (= (and b!805317 (not c!88107)) b!805316))

(assert (= (or b!805315 b!805316) bm!35326))

(declare-fun m!746779 () Bool)

(assert (=> b!805317 m!746779))

(assert (=> b!805317 m!746779))

(declare-fun m!746781 () Bool)

(assert (=> b!805317 m!746781))

(assert (=> b!805318 m!746779))

(assert (=> b!805318 m!746779))

(declare-fun m!746783 () Bool)

(assert (=> b!805318 m!746783))

(assert (=> bm!35326 m!746779))

(declare-fun m!746785 () Bool)

(assert (=> bm!35326 m!746785))

(assert (=> b!805319 m!746779))

(assert (=> b!805319 m!746779))

(assert (=> b!805319 m!746781))

(assert (=> b!805174 d!103369))

(declare-fun lt!360462 () SeekEntryResult!8578)

(declare-fun b!805320 () Bool)

(declare-fun e!445968 () SeekEntryResult!8578)

(assert (=> b!805320 (= e!445968 (seekKeyOrZeroReturnVacant!0 (x!67507 lt!360462) (index!36682 lt!360462) (index!36682 lt!360462) k0!2044 a!3170 mask!3266))))

(declare-fun b!805321 () Bool)

(declare-fun c!88110 () Bool)

(declare-fun lt!360463 () (_ BitVec 64))

(assert (=> b!805321 (= c!88110 (= lt!360463 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!445969 () SeekEntryResult!8578)

(assert (=> b!805321 (= e!445969 e!445968)))

(declare-fun b!805322 () Bool)

(assert (=> b!805322 (= e!445968 (MissingZero!8578 (index!36682 lt!360462)))))

(declare-fun d!103379 () Bool)

(declare-fun lt!360464 () SeekEntryResult!8578)

(assert (=> d!103379 (and (or ((_ is Undefined!8578) lt!360464) (not ((_ is Found!8578) lt!360464)) (and (bvsge (index!36681 lt!360464) #b00000000000000000000000000000000) (bvslt (index!36681 lt!360464) (size!21411 a!3170)))) (or ((_ is Undefined!8578) lt!360464) ((_ is Found!8578) lt!360464) (not ((_ is MissingZero!8578) lt!360464)) (and (bvsge (index!36680 lt!360464) #b00000000000000000000000000000000) (bvslt (index!36680 lt!360464) (size!21411 a!3170)))) (or ((_ is Undefined!8578) lt!360464) ((_ is Found!8578) lt!360464) ((_ is MissingZero!8578) lt!360464) (not ((_ is MissingVacant!8578) lt!360464)) (and (bvsge (index!36683 lt!360464) #b00000000000000000000000000000000) (bvslt (index!36683 lt!360464) (size!21411 a!3170)))) (or ((_ is Undefined!8578) lt!360464) (ite ((_ is Found!8578) lt!360464) (= (select (arr!20990 a!3170) (index!36681 lt!360464)) k0!2044) (ite ((_ is MissingZero!8578) lt!360464) (= (select (arr!20990 a!3170) (index!36680 lt!360464)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8578) lt!360464) (= (select (arr!20990 a!3170) (index!36683 lt!360464)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!445967 () SeekEntryResult!8578)

(assert (=> d!103379 (= lt!360464 e!445967)))

(declare-fun c!88109 () Bool)

(assert (=> d!103379 (= c!88109 (and ((_ is Intermediate!8578) lt!360462) (undefined!9390 lt!360462)))))

(assert (=> d!103379 (= lt!360462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103379 (validMask!0 mask!3266)))

(assert (=> d!103379 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!360464)))

(declare-fun b!805323 () Bool)

(assert (=> b!805323 (= e!445967 Undefined!8578)))

(declare-fun b!805324 () Bool)

(assert (=> b!805324 (= e!445967 e!445969)))

(assert (=> b!805324 (= lt!360463 (select (arr!20990 a!3170) (index!36682 lt!360462)))))

(declare-fun c!88108 () Bool)

(assert (=> b!805324 (= c!88108 (= lt!360463 k0!2044))))

(declare-fun b!805325 () Bool)

(assert (=> b!805325 (= e!445969 (Found!8578 (index!36682 lt!360462)))))

(assert (= (and d!103379 c!88109) b!805323))

(assert (= (and d!103379 (not c!88109)) b!805324))

(assert (= (and b!805324 c!88108) b!805325))

(assert (= (and b!805324 (not c!88108)) b!805321))

(assert (= (and b!805321 c!88110) b!805322))

(assert (= (and b!805321 (not c!88110)) b!805320))

(declare-fun m!746787 () Bool)

(assert (=> b!805320 m!746787))

(declare-fun m!746789 () Bool)

(assert (=> d!103379 m!746789))

(declare-fun m!746791 () Bool)

(assert (=> d!103379 m!746791))

(declare-fun m!746793 () Bool)

(assert (=> d!103379 m!746793))

(assert (=> d!103379 m!746791))

(declare-fun m!746795 () Bool)

(assert (=> d!103379 m!746795))

(declare-fun m!746797 () Bool)

(assert (=> d!103379 m!746797))

(assert (=> d!103379 m!746625))

(declare-fun m!746799 () Bool)

(assert (=> b!805324 m!746799))

(assert (=> b!805175 d!103379))

(declare-fun d!103381 () Bool)

(assert (=> d!103381 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69012 d!103381))

(declare-fun d!103387 () Bool)

(assert (=> d!103387 (= (array_inv!16873 a!3170) (bvsge (size!21411 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69012 d!103387))

(declare-fun d!103389 () Bool)

(assert (=> d!103389 (= (validKeyInArray!0 (select (arr!20990 a!3170) j!153)) (and (not (= (select (arr!20990 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20990 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805171 d!103389))

(declare-fun d!103391 () Bool)

(declare-fun res!549930 () Bool)

(declare-fun e!446001 () Bool)

(assert (=> d!103391 (=> res!549930 e!446001)))

(assert (=> d!103391 (= res!549930 (bvsge #b00000000000000000000000000000000 (size!21411 a!3170)))))

(assert (=> d!103391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446001)))

(declare-fun b!805382 () Bool)

(declare-fun e!446000 () Bool)

(declare-fun call!35332 () Bool)

(assert (=> b!805382 (= e!446000 call!35332)))

(declare-fun b!805383 () Bool)

(declare-fun e!446002 () Bool)

(assert (=> b!805383 (= e!446001 e!446002)))

(declare-fun c!88137 () Bool)

(assert (=> b!805383 (= c!88137 (validKeyInArray!0 (select (arr!20990 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805384 () Bool)

(assert (=> b!805384 (= e!446002 call!35332)))

(declare-fun bm!35329 () Bool)

(assert (=> bm!35329 (= call!35332 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!805385 () Bool)

(assert (=> b!805385 (= e!446002 e!446000)))

(declare-fun lt!360491 () (_ BitVec 64))

(assert (=> b!805385 (= lt!360491 (select (arr!20990 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27570 0))(
  ( (Unit!27571) )
))
(declare-fun lt!360489 () Unit!27570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43819 (_ BitVec 64) (_ BitVec 32)) Unit!27570)

(assert (=> b!805385 (= lt!360489 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!360491 #b00000000000000000000000000000000))))

(assert (=> b!805385 (arrayContainsKey!0 a!3170 lt!360491 #b00000000000000000000000000000000)))

(declare-fun lt!360490 () Unit!27570)

(assert (=> b!805385 (= lt!360490 lt!360489)))

(declare-fun res!549929 () Bool)

(assert (=> b!805385 (= res!549929 (= (seekEntryOrOpen!0 (select (arr!20990 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8578 #b00000000000000000000000000000000)))))

(assert (=> b!805385 (=> (not res!549929) (not e!446000))))

(assert (= (and d!103391 (not res!549930)) b!805383))

(assert (= (and b!805383 c!88137) b!805385))

(assert (= (and b!805383 (not c!88137)) b!805384))

(assert (= (and b!805385 res!549929) b!805382))

(assert (= (or b!805382 b!805384) bm!35329))

(assert (=> b!805383 m!746779))

(assert (=> b!805383 m!746779))

(assert (=> b!805383 m!746781))

(declare-fun m!746819 () Bool)

(assert (=> bm!35329 m!746819))

(assert (=> b!805385 m!746779))

(declare-fun m!746821 () Bool)

(assert (=> b!805385 m!746821))

(declare-fun m!746823 () Bool)

(assert (=> b!805385 m!746823))

(assert (=> b!805385 m!746779))

(declare-fun m!746825 () Bool)

(assert (=> b!805385 m!746825))

(assert (=> b!805176 d!103391))

(declare-fun d!103393 () Bool)

(declare-fun res!549935 () Bool)

(declare-fun e!446019 () Bool)

(assert (=> d!103393 (=> res!549935 e!446019)))

(assert (=> d!103393 (= res!549935 (= (select (arr!20990 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103393 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!446019)))

(declare-fun b!805414 () Bool)

(declare-fun e!446020 () Bool)

(assert (=> b!805414 (= e!446019 e!446020)))

(declare-fun res!549936 () Bool)

(assert (=> b!805414 (=> (not res!549936) (not e!446020))))

(assert (=> b!805414 (= res!549936 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21411 a!3170)))))

(declare-fun b!805415 () Bool)

(assert (=> b!805415 (= e!446020 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103393 (not res!549935)) b!805414))

(assert (= (and b!805414 res!549936) b!805415))

(assert (=> d!103393 m!746779))

(declare-fun m!746875 () Bool)

(assert (=> b!805415 m!746875))

(assert (=> b!805172 d!103393))

(declare-fun b!805420 () Bool)

(declare-fun e!446024 () SeekEntryResult!8578)

(assert (=> b!805420 (= e!446024 (Found!8578 index!1236))))

(declare-fun b!805421 () Bool)

(declare-fun e!446023 () SeekEntryResult!8578)

(assert (=> b!805421 (= e!446023 e!446024)))

(declare-fun c!88152 () Bool)

(declare-fun lt!360508 () (_ BitVec 64))

(assert (=> b!805421 (= c!88152 (= lt!360508 lt!360380))))

(declare-fun d!103405 () Bool)

(declare-fun lt!360507 () SeekEntryResult!8578)

(assert (=> d!103405 (and (or ((_ is Undefined!8578) lt!360507) (not ((_ is Found!8578) lt!360507)) (and (bvsge (index!36681 lt!360507) #b00000000000000000000000000000000) (bvslt (index!36681 lt!360507) (size!21411 lt!360386)))) (or ((_ is Undefined!8578) lt!360507) ((_ is Found!8578) lt!360507) (not ((_ is MissingVacant!8578) lt!360507)) (not (= (index!36683 lt!360507) vacantAfter!23)) (and (bvsge (index!36683 lt!360507) #b00000000000000000000000000000000) (bvslt (index!36683 lt!360507) (size!21411 lt!360386)))) (or ((_ is Undefined!8578) lt!360507) (ite ((_ is Found!8578) lt!360507) (= (select (arr!20990 lt!360386) (index!36681 lt!360507)) lt!360380) (and ((_ is MissingVacant!8578) lt!360507) (= (index!36683 lt!360507) vacantAfter!23) (= (select (arr!20990 lt!360386) (index!36683 lt!360507)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103405 (= lt!360507 e!446023)))

(declare-fun c!88154 () Bool)

(assert (=> d!103405 (= c!88154 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103405 (= lt!360508 (select (arr!20990 lt!360386) index!1236))))

(assert (=> d!103405 (validMask!0 mask!3266)))

(assert (=> d!103405 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360380 lt!360386 mask!3266) lt!360507)))

(declare-fun b!805422 () Bool)

(declare-fun e!446025 () SeekEntryResult!8578)

(assert (=> b!805422 (= e!446025 (MissingVacant!8578 vacantAfter!23))))

(declare-fun b!805423 () Bool)

(declare-fun c!88153 () Bool)

(assert (=> b!805423 (= c!88153 (= lt!360508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805423 (= e!446024 e!446025)))

(declare-fun b!805424 () Bool)

(assert (=> b!805424 (= e!446023 Undefined!8578)))

(declare-fun b!805425 () Bool)

(assert (=> b!805425 (= e!446025 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!360380 lt!360386 mask!3266))))

(assert (= (and d!103405 c!88154) b!805424))

(assert (= (and d!103405 (not c!88154)) b!805421))

(assert (= (and b!805421 c!88152) b!805420))

(assert (= (and b!805421 (not c!88152)) b!805423))

(assert (= (and b!805423 c!88153) b!805422))

(assert (= (and b!805423 (not c!88153)) b!805425))

(declare-fun m!746877 () Bool)

(assert (=> d!103405 m!746877))

(declare-fun m!746879 () Bool)

(assert (=> d!103405 m!746879))

(declare-fun m!746881 () Bool)

(assert (=> d!103405 m!746881))

(assert (=> d!103405 m!746625))

(assert (=> b!805425 m!746735))

(assert (=> b!805425 m!746735))

(declare-fun m!746883 () Bool)

(assert (=> b!805425 m!746883))

(assert (=> b!805173 d!103405))

(declare-fun b!805434 () Bool)

(declare-fun lt!360511 () SeekEntryResult!8578)

(declare-fun e!446031 () SeekEntryResult!8578)

(assert (=> b!805434 (= e!446031 (seekKeyOrZeroReturnVacant!0 (x!67507 lt!360511) (index!36682 lt!360511) (index!36682 lt!360511) lt!360380 lt!360386 mask!3266))))

(declare-fun b!805435 () Bool)

(declare-fun c!88161 () Bool)

(declare-fun lt!360512 () (_ BitVec 64))

(assert (=> b!805435 (= c!88161 (= lt!360512 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446032 () SeekEntryResult!8578)

(assert (=> b!805435 (= e!446032 e!446031)))

(declare-fun b!805436 () Bool)

(assert (=> b!805436 (= e!446031 (MissingZero!8578 (index!36682 lt!360511)))))

(declare-fun d!103407 () Bool)

(declare-fun lt!360513 () SeekEntryResult!8578)

(assert (=> d!103407 (and (or ((_ is Undefined!8578) lt!360513) (not ((_ is Found!8578) lt!360513)) (and (bvsge (index!36681 lt!360513) #b00000000000000000000000000000000) (bvslt (index!36681 lt!360513) (size!21411 lt!360386)))) (or ((_ is Undefined!8578) lt!360513) ((_ is Found!8578) lt!360513) (not ((_ is MissingZero!8578) lt!360513)) (and (bvsge (index!36680 lt!360513) #b00000000000000000000000000000000) (bvslt (index!36680 lt!360513) (size!21411 lt!360386)))) (or ((_ is Undefined!8578) lt!360513) ((_ is Found!8578) lt!360513) ((_ is MissingZero!8578) lt!360513) (not ((_ is MissingVacant!8578) lt!360513)) (and (bvsge (index!36683 lt!360513) #b00000000000000000000000000000000) (bvslt (index!36683 lt!360513) (size!21411 lt!360386)))) (or ((_ is Undefined!8578) lt!360513) (ite ((_ is Found!8578) lt!360513) (= (select (arr!20990 lt!360386) (index!36681 lt!360513)) lt!360380) (ite ((_ is MissingZero!8578) lt!360513) (= (select (arr!20990 lt!360386) (index!36680 lt!360513)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8578) lt!360513) (= (select (arr!20990 lt!360386) (index!36683 lt!360513)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!446030 () SeekEntryResult!8578)

(assert (=> d!103407 (= lt!360513 e!446030)))

(declare-fun c!88160 () Bool)

(assert (=> d!103407 (= c!88160 (and ((_ is Intermediate!8578) lt!360511) (undefined!9390 lt!360511)))))

(assert (=> d!103407 (= lt!360511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!360380 mask!3266) lt!360380 lt!360386 mask!3266))))

(assert (=> d!103407 (validMask!0 mask!3266)))

(assert (=> d!103407 (= (seekEntryOrOpen!0 lt!360380 lt!360386 mask!3266) lt!360513)))

(declare-fun b!805437 () Bool)

(assert (=> b!805437 (= e!446030 Undefined!8578)))

(declare-fun b!805438 () Bool)

(assert (=> b!805438 (= e!446030 e!446032)))

(assert (=> b!805438 (= lt!360512 (select (arr!20990 lt!360386) (index!36682 lt!360511)))))

(declare-fun c!88159 () Bool)

(assert (=> b!805438 (= c!88159 (= lt!360512 lt!360380))))

(declare-fun b!805439 () Bool)

(assert (=> b!805439 (= e!446032 (Found!8578 (index!36682 lt!360511)))))

(assert (= (and d!103407 c!88160) b!805437))

(assert (= (and d!103407 (not c!88160)) b!805438))

(assert (= (and b!805438 c!88159) b!805439))

(assert (= (and b!805438 (not c!88159)) b!805435))

(assert (= (and b!805435 c!88161) b!805436))

(assert (= (and b!805435 (not c!88161)) b!805434))

(declare-fun m!746885 () Bool)

(assert (=> b!805434 m!746885))

(declare-fun m!746887 () Bool)

(assert (=> d!103407 m!746887))

(declare-fun m!746889 () Bool)

(assert (=> d!103407 m!746889))

(declare-fun m!746891 () Bool)

(assert (=> d!103407 m!746891))

(assert (=> d!103407 m!746889))

(declare-fun m!746893 () Bool)

(assert (=> d!103407 m!746893))

(declare-fun m!746895 () Bool)

(assert (=> d!103407 m!746895))

(assert (=> d!103407 m!746625))

(declare-fun m!746897 () Bool)

(assert (=> b!805438 m!746897))

(assert (=> b!805173 d!103407))

(declare-fun d!103409 () Bool)

(assert (=> d!103409 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805178 d!103409))

(check-sat (not bm!35326) (not d!103407) (not d!103359) (not d!103357) (not b!805383) (not d!103405) (not b!805415) (not b!805289) (not b!805317) (not b!805434) (not b!805425) (not b!805320) (not bm!35329) (not b!805385) (not b!805319) (not b!805318) (not b!805256) (not d!103379))
(check-sat)
