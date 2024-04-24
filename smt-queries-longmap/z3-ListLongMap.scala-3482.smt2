; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48226 () Bool)

(assert start!48226)

(declare-fun b!530914 () Bool)

(declare-fun res!326676 () Bool)

(declare-fun e!309239 () Bool)

(assert (=> b!530914 (=> (not res!326676) (not e!309239))))

(declare-datatypes ((array!33650 0))(
  ( (array!33651 (arr!16171 (Array (_ BitVec 32) (_ BitVec 64))) (size!16535 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33650)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530914 (= res!326676 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530916 () Bool)

(declare-fun res!326674 () Bool)

(assert (=> b!530916 (=> (not res!326674) (not e!309239))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530916 (= res!326674 (and (= (size!16535 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16535 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16535 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530917 () Bool)

(declare-fun e!309240 () Bool)

(assert (=> b!530917 (= e!309239 e!309240)))

(declare-fun res!326679 () Bool)

(assert (=> b!530917 (=> (not res!326679) (not e!309240))))

(declare-datatypes ((SeekEntryResult!4585 0))(
  ( (MissingZero!4585 (index!20564 (_ BitVec 32))) (Found!4585 (index!20565 (_ BitVec 32))) (Intermediate!4585 (undefined!5397 Bool) (index!20566 (_ BitVec 32)) (x!49692 (_ BitVec 32))) (Undefined!4585) (MissingVacant!4585 (index!20567 (_ BitVec 32))) )
))
(declare-fun lt!244843 () SeekEntryResult!4585)

(assert (=> b!530917 (= res!326679 (or (= lt!244843 (MissingZero!4585 i!1153)) (= lt!244843 (MissingVacant!4585 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33650 (_ BitVec 32)) SeekEntryResult!4585)

(assert (=> b!530917 (= lt!244843 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530918 () Bool)

(declare-fun res!326677 () Bool)

(assert (=> b!530918 (=> (not res!326677) (not e!309240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33650 (_ BitVec 32)) Bool)

(assert (=> b!530918 (= res!326677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!530919 () Bool)

(declare-fun res!326675 () Bool)

(assert (=> b!530919 (=> (not res!326675) (not e!309239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530919 (= res!326675 (validKeyInArray!0 k0!1998))))

(declare-fun b!530920 () Bool)

(declare-fun res!326680 () Bool)

(assert (=> b!530920 (=> (not res!326680) (not e!309239))))

(assert (=> b!530920 (= res!326680 (validKeyInArray!0 (select (arr!16171 a!3154) j!147)))))

(declare-fun res!326678 () Bool)

(assert (=> start!48226 (=> (not res!326678) (not e!309239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48226 (= res!326678 (validMask!0 mask!3216))))

(assert (=> start!48226 e!309239))

(assert (=> start!48226 true))

(declare-fun array_inv!12030 (array!33650) Bool)

(assert (=> start!48226 (array_inv!12030 a!3154)))

(declare-fun b!530915 () Bool)

(assert (=> b!530915 (= e!309240 (and (bvsle #b00000000000000000000000000000000 (size!16535 a!3154)) (bvsge (size!16535 a!3154) #b01111111111111111111111111111111)))))

(assert (= (and start!48226 res!326678) b!530916))

(assert (= (and b!530916 res!326674) b!530920))

(assert (= (and b!530920 res!326680) b!530919))

(assert (= (and b!530919 res!326675) b!530914))

(assert (= (and b!530914 res!326676) b!530917))

(assert (= (and b!530917 res!326679) b!530918))

(assert (= (and b!530918 res!326677) b!530915))

(declare-fun m!511681 () Bool)

(assert (=> start!48226 m!511681))

(declare-fun m!511683 () Bool)

(assert (=> start!48226 m!511683))

(declare-fun m!511685 () Bool)

(assert (=> b!530919 m!511685))

(declare-fun m!511687 () Bool)

(assert (=> b!530914 m!511687))

(declare-fun m!511689 () Bool)

(assert (=> b!530920 m!511689))

(assert (=> b!530920 m!511689))

(declare-fun m!511691 () Bool)

(assert (=> b!530920 m!511691))

(declare-fun m!511693 () Bool)

(assert (=> b!530918 m!511693))

(declare-fun m!511695 () Bool)

(assert (=> b!530917 m!511695))

(check-sat (not b!530919) (not b!530918) (not b!530914) (not b!530917) (not start!48226) (not b!530920))
(check-sat)
(get-model)

(declare-fun d!81201 () Bool)

(assert (=> d!81201 (= (validKeyInArray!0 (select (arr!16171 a!3154) j!147)) (and (not (= (select (arr!16171 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16171 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530920 d!81201))

(declare-fun d!81203 () Bool)

(declare-fun res!326727 () Bool)

(declare-fun e!309263 () Bool)

(assert (=> d!81203 (=> res!326727 e!309263)))

(assert (=> d!81203 (= res!326727 (= (select (arr!16171 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81203 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309263)))

(declare-fun b!530967 () Bool)

(declare-fun e!309264 () Bool)

(assert (=> b!530967 (= e!309263 e!309264)))

(declare-fun res!326728 () Bool)

(assert (=> b!530967 (=> (not res!326728) (not e!309264))))

(assert (=> b!530967 (= res!326728 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16535 a!3154)))))

(declare-fun b!530968 () Bool)

(assert (=> b!530968 (= e!309264 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81203 (not res!326727)) b!530967))

(assert (= (and b!530967 res!326728) b!530968))

(declare-fun m!511729 () Bool)

(assert (=> d!81203 m!511729))

(declare-fun m!511731 () Bool)

(assert (=> b!530968 m!511731))

(assert (=> b!530914 d!81203))

(declare-fun d!81205 () Bool)

(assert (=> d!81205 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48226 d!81205))

(declare-fun d!81211 () Bool)

(assert (=> d!81211 (= (array_inv!12030 a!3154) (bvsge (size!16535 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48226 d!81211))

(declare-fun b!531017 () Bool)

(declare-fun e!309295 () SeekEntryResult!4585)

(assert (=> b!531017 (= e!309295 Undefined!4585)))

(declare-fun b!531019 () Bool)

(declare-fun e!309297 () SeekEntryResult!4585)

(declare-fun lt!244876 () SeekEntryResult!4585)

(assert (=> b!531019 (= e!309297 (Found!4585 (index!20566 lt!244876)))))

(declare-fun b!531020 () Bool)

(declare-fun c!62449 () Bool)

(declare-fun lt!244875 () (_ BitVec 64))

(assert (=> b!531020 (= c!62449 (= lt!244875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309296 () SeekEntryResult!4585)

(assert (=> b!531020 (= e!309297 e!309296)))

(declare-fun b!531021 () Bool)

(assert (=> b!531021 (= e!309296 (MissingZero!4585 (index!20566 lt!244876)))))

(declare-fun b!531022 () Bool)

(assert (=> b!531022 (= e!309295 e!309297)))

(assert (=> b!531022 (= lt!244875 (select (arr!16171 a!3154) (index!20566 lt!244876)))))

(declare-fun c!62450 () Bool)

(assert (=> b!531022 (= c!62450 (= lt!244875 k0!1998))))

(declare-fun d!81213 () Bool)

(declare-fun lt!244874 () SeekEntryResult!4585)

(get-info :version)

(assert (=> d!81213 (and (or ((_ is Undefined!4585) lt!244874) (not ((_ is Found!4585) lt!244874)) (and (bvsge (index!20565 lt!244874) #b00000000000000000000000000000000) (bvslt (index!20565 lt!244874) (size!16535 a!3154)))) (or ((_ is Undefined!4585) lt!244874) ((_ is Found!4585) lt!244874) (not ((_ is MissingZero!4585) lt!244874)) (and (bvsge (index!20564 lt!244874) #b00000000000000000000000000000000) (bvslt (index!20564 lt!244874) (size!16535 a!3154)))) (or ((_ is Undefined!4585) lt!244874) ((_ is Found!4585) lt!244874) ((_ is MissingZero!4585) lt!244874) (not ((_ is MissingVacant!4585) lt!244874)) (and (bvsge (index!20567 lt!244874) #b00000000000000000000000000000000) (bvslt (index!20567 lt!244874) (size!16535 a!3154)))) (or ((_ is Undefined!4585) lt!244874) (ite ((_ is Found!4585) lt!244874) (= (select (arr!16171 a!3154) (index!20565 lt!244874)) k0!1998) (ite ((_ is MissingZero!4585) lt!244874) (= (select (arr!16171 a!3154) (index!20564 lt!244874)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4585) lt!244874) (= (select (arr!16171 a!3154) (index!20567 lt!244874)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81213 (= lt!244874 e!309295)))

(declare-fun c!62448 () Bool)

(assert (=> d!81213 (= c!62448 (and ((_ is Intermediate!4585) lt!244876) (undefined!5397 lt!244876)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33650 (_ BitVec 32)) SeekEntryResult!4585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81213 (= lt!244876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81213 (validMask!0 mask!3216)))

(assert (=> d!81213 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!244874)))

(declare-fun b!531018 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33650 (_ BitVec 32)) SeekEntryResult!4585)

(assert (=> b!531018 (= e!309296 (seekKeyOrZeroReturnVacant!0 (x!49692 lt!244876) (index!20566 lt!244876) (index!20566 lt!244876) k0!1998 a!3154 mask!3216))))

(assert (= (and d!81213 c!62448) b!531017))

(assert (= (and d!81213 (not c!62448)) b!531022))

(assert (= (and b!531022 c!62450) b!531019))

(assert (= (and b!531022 (not c!62450)) b!531020))

(assert (= (and b!531020 c!62449) b!531021))

(assert (= (and b!531020 (not c!62449)) b!531018))

(declare-fun m!511761 () Bool)

(assert (=> b!531022 m!511761))

(declare-fun m!511763 () Bool)

(assert (=> d!81213 m!511763))

(assert (=> d!81213 m!511763))

(declare-fun m!511765 () Bool)

(assert (=> d!81213 m!511765))

(declare-fun m!511767 () Bool)

(assert (=> d!81213 m!511767))

(assert (=> d!81213 m!511681))

(declare-fun m!511769 () Bool)

(assert (=> d!81213 m!511769))

(declare-fun m!511771 () Bool)

(assert (=> d!81213 m!511771))

(declare-fun m!511773 () Bool)

(assert (=> b!531018 m!511773))

(assert (=> b!530917 d!81213))

(declare-fun d!81221 () Bool)

(assert (=> d!81221 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530919 d!81221))

(declare-fun b!531049 () Bool)

(declare-fun e!309315 () Bool)

(declare-fun e!309313 () Bool)

(assert (=> b!531049 (= e!309315 e!309313)))

(declare-fun c!62462 () Bool)

(assert (=> b!531049 (= c!62462 (validKeyInArray!0 (select (arr!16171 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!531050 () Bool)

(declare-fun call!31926 () Bool)

(assert (=> b!531050 (= e!309313 call!31926)))

(declare-fun d!81223 () Bool)

(declare-fun res!326745 () Bool)

(assert (=> d!81223 (=> res!326745 e!309315)))

(assert (=> d!81223 (= res!326745 (bvsge #b00000000000000000000000000000000 (size!16535 a!3154)))))

(assert (=> d!81223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309315)))

(declare-fun bm!31923 () Bool)

(assert (=> bm!31923 (= call!31926 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!531051 () Bool)

(declare-fun e!309314 () Bool)

(assert (=> b!531051 (= e!309313 e!309314)))

(declare-fun lt!244892 () (_ BitVec 64))

(assert (=> b!531051 (= lt!244892 (select (arr!16171 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16791 0))(
  ( (Unit!16792) )
))
(declare-fun lt!244893 () Unit!16791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33650 (_ BitVec 64) (_ BitVec 32)) Unit!16791)

(assert (=> b!531051 (= lt!244893 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244892 #b00000000000000000000000000000000))))

(assert (=> b!531051 (arrayContainsKey!0 a!3154 lt!244892 #b00000000000000000000000000000000)))

(declare-fun lt!244894 () Unit!16791)

(assert (=> b!531051 (= lt!244894 lt!244893)))

(declare-fun res!326746 () Bool)

(assert (=> b!531051 (= res!326746 (= (seekEntryOrOpen!0 (select (arr!16171 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4585 #b00000000000000000000000000000000)))))

(assert (=> b!531051 (=> (not res!326746) (not e!309314))))

(declare-fun b!531052 () Bool)

(assert (=> b!531052 (= e!309314 call!31926)))

(assert (= (and d!81223 (not res!326745)) b!531049))

(assert (= (and b!531049 c!62462) b!531051))

(assert (= (and b!531049 (not c!62462)) b!531050))

(assert (= (and b!531051 res!326746) b!531052))

(assert (= (or b!531052 b!531050) bm!31923))

(assert (=> b!531049 m!511729))

(assert (=> b!531049 m!511729))

(declare-fun m!511789 () Bool)

(assert (=> b!531049 m!511789))

(declare-fun m!511791 () Bool)

(assert (=> bm!31923 m!511791))

(assert (=> b!531051 m!511729))

(declare-fun m!511793 () Bool)

(assert (=> b!531051 m!511793))

(declare-fun m!511795 () Bool)

(assert (=> b!531051 m!511795))

(assert (=> b!531051 m!511729))

(declare-fun m!511797 () Bool)

(assert (=> b!531051 m!511797))

(assert (=> b!530918 d!81223))

(check-sat (not b!531049) (not bm!31923) (not d!81213) (not b!530968) (not b!531051) (not b!531018))
(check-sat)
