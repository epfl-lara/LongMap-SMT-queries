; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48484 () Bool)

(assert start!48484)

(declare-fun b!532618 () Bool)

(declare-fun res!328021 () Bool)

(declare-fun e!310055 () Bool)

(assert (=> b!532618 (=> (not res!328021) (not e!310055))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532618 (= res!328021 (validKeyInArray!0 k0!1998))))

(declare-fun b!532619 () Bool)

(declare-fun res!328023 () Bool)

(declare-fun e!310056 () Bool)

(assert (=> b!532619 (=> (not res!328023) (not e!310056))))

(declare-datatypes ((array!33746 0))(
  ( (array!33747 (arr!16213 (Array (_ BitVec 32) (_ BitVec 64))) (size!16577 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33746)

(declare-datatypes ((List!10239 0))(
  ( (Nil!10236) (Cons!10235 (h!11175 (_ BitVec 64)) (t!16459 List!10239)) )
))
(declare-fun arrayNoDuplicates!0 (array!33746 (_ BitVec 32) List!10239) Bool)

(assert (=> b!532619 (= res!328023 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10236))))

(declare-fun res!328019 () Bool)

(assert (=> start!48484 (=> (not res!328019) (not e!310055))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48484 (= res!328019 (validMask!0 mask!3216))))

(assert (=> start!48484 e!310055))

(assert (=> start!48484 true))

(declare-fun array_inv!12072 (array!33746) Bool)

(assert (=> start!48484 (array_inv!12072 a!3154)))

(declare-fun b!532620 () Bool)

(declare-fun lt!245272 () (_ BitVec 32))

(assert (=> b!532620 (= e!310056 (and (bvsge mask!3216 #b00000000000000000000000000000000) (or (bvslt lt!245272 #b00000000000000000000000000000000) (bvsge lt!245272 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532620 (= lt!245272 (toIndex!0 (select (arr!16213 a!3154) j!147) mask!3216))))

(declare-fun b!532621 () Bool)

(declare-fun res!328022 () Bool)

(assert (=> b!532621 (=> (not res!328022) (not e!310056))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!532621 (= res!328022 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16577 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16577 a!3154)) (= (select (arr!16213 a!3154) resIndex!32) (select (arr!16213 a!3154) j!147))))))

(declare-fun b!532622 () Bool)

(declare-fun res!328024 () Bool)

(assert (=> b!532622 (=> (not res!328024) (not e!310055))))

(declare-fun arrayContainsKey!0 (array!33746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532622 (= res!328024 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532623 () Bool)

(declare-fun res!328018 () Bool)

(assert (=> b!532623 (=> (not res!328018) (not e!310055))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532623 (= res!328018 (and (= (size!16577 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16577 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16577 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532624 () Bool)

(declare-fun res!328027 () Bool)

(assert (=> b!532624 (=> (not res!328027) (not e!310056))))

(declare-datatypes ((SeekEntryResult!4627 0))(
  ( (MissingZero!4627 (index!20732 (_ BitVec 32))) (Found!4627 (index!20733 (_ BitVec 32))) (Intermediate!4627 (undefined!5439 Bool) (index!20734 (_ BitVec 32)) (x!49849 (_ BitVec 32))) (Undefined!4627) (MissingVacant!4627 (index!20735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33746 (_ BitVec 32)) SeekEntryResult!4627)

(assert (=> b!532624 (= res!328027 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16213 a!3154) j!147) a!3154 mask!3216) (Intermediate!4627 false resIndex!32 resX!32)))))

(declare-fun b!532625 () Bool)

(declare-fun res!328026 () Bool)

(assert (=> b!532625 (=> (not res!328026) (not e!310056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33746 (_ BitVec 32)) Bool)

(assert (=> b!532625 (= res!328026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532626 () Bool)

(declare-fun res!328020 () Bool)

(assert (=> b!532626 (=> (not res!328020) (not e!310055))))

(assert (=> b!532626 (= res!328020 (validKeyInArray!0 (select (arr!16213 a!3154) j!147)))))

(declare-fun b!532627 () Bool)

(assert (=> b!532627 (= e!310055 e!310056)))

(declare-fun res!328025 () Bool)

(assert (=> b!532627 (=> (not res!328025) (not e!310056))))

(declare-fun lt!245271 () SeekEntryResult!4627)

(assert (=> b!532627 (= res!328025 (or (= lt!245271 (MissingZero!4627 i!1153)) (= lt!245271 (MissingVacant!4627 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33746 (_ BitVec 32)) SeekEntryResult!4627)

(assert (=> b!532627 (= lt!245271 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48484 res!328019) b!532623))

(assert (= (and b!532623 res!328018) b!532626))

(assert (= (and b!532626 res!328020) b!532618))

(assert (= (and b!532618 res!328021) b!532622))

(assert (= (and b!532622 res!328024) b!532627))

(assert (= (and b!532627 res!328025) b!532625))

(assert (= (and b!532625 res!328026) b!532619))

(assert (= (and b!532619 res!328023) b!532621))

(assert (= (and b!532621 res!328022) b!532624))

(assert (= (and b!532624 res!328027) b!532620))

(declare-fun m!512965 () Bool)

(assert (=> b!532620 m!512965))

(assert (=> b!532620 m!512965))

(declare-fun m!512967 () Bool)

(assert (=> b!532620 m!512967))

(assert (=> b!532626 m!512965))

(assert (=> b!532626 m!512965))

(declare-fun m!512969 () Bool)

(assert (=> b!532626 m!512969))

(declare-fun m!512971 () Bool)

(assert (=> b!532622 m!512971))

(declare-fun m!512973 () Bool)

(assert (=> start!48484 m!512973))

(declare-fun m!512975 () Bool)

(assert (=> start!48484 m!512975))

(assert (=> b!532624 m!512965))

(assert (=> b!532624 m!512965))

(declare-fun m!512977 () Bool)

(assert (=> b!532624 m!512977))

(declare-fun m!512979 () Bool)

(assert (=> b!532625 m!512979))

(declare-fun m!512981 () Bool)

(assert (=> b!532618 m!512981))

(declare-fun m!512983 () Bool)

(assert (=> b!532619 m!512983))

(declare-fun m!512985 () Bool)

(assert (=> b!532621 m!512985))

(assert (=> b!532621 m!512965))

(declare-fun m!512987 () Bool)

(assert (=> b!532627 m!512987))

(check-sat (not b!532627) (not b!532624) (not start!48484) (not b!532619) (not b!532620) (not b!532618) (not b!532626) (not b!532622) (not b!532625))
(check-sat)
(get-model)

(declare-fun d!81433 () Bool)

(declare-fun res!328092 () Bool)

(declare-fun e!310079 () Bool)

(assert (=> d!81433 (=> res!328092 e!310079)))

(assert (=> d!81433 (= res!328092 (= (select (arr!16213 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81433 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!310079)))

(declare-fun b!532692 () Bool)

(declare-fun e!310080 () Bool)

(assert (=> b!532692 (= e!310079 e!310080)))

(declare-fun res!328093 () Bool)

(assert (=> b!532692 (=> (not res!328093) (not e!310080))))

(assert (=> b!532692 (= res!328093 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16577 a!3154)))))

(declare-fun b!532693 () Bool)

(assert (=> b!532693 (= e!310080 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81433 (not res!328092)) b!532692))

(assert (= (and b!532692 res!328093) b!532693))

(declare-fun m!513037 () Bool)

(assert (=> d!81433 m!513037))

(declare-fun m!513039 () Bool)

(assert (=> b!532693 m!513039))

(assert (=> b!532622 d!81433))

(declare-fun d!81435 () Bool)

(assert (=> d!81435 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532618 d!81435))

(declare-fun b!532704 () Bool)

(declare-fun e!310091 () Bool)

(declare-fun call!31968 () Bool)

(assert (=> b!532704 (= e!310091 call!31968)))

(declare-fun b!532705 () Bool)

(declare-fun e!310092 () Bool)

(declare-fun e!310089 () Bool)

(assert (=> b!532705 (= e!310092 e!310089)))

(declare-fun res!328101 () Bool)

(assert (=> b!532705 (=> (not res!328101) (not e!310089))))

(declare-fun e!310090 () Bool)

(assert (=> b!532705 (= res!328101 (not e!310090))))

(declare-fun res!328102 () Bool)

(assert (=> b!532705 (=> (not res!328102) (not e!310090))))

(assert (=> b!532705 (= res!328102 (validKeyInArray!0 (select (arr!16213 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532707 () Bool)

(declare-fun contains!2766 (List!10239 (_ BitVec 64)) Bool)

(assert (=> b!532707 (= e!310090 (contains!2766 Nil!10236 (select (arr!16213 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532708 () Bool)

(assert (=> b!532708 (= e!310091 call!31968)))

(declare-fun bm!31965 () Bool)

(declare-fun c!62612 () Bool)

(assert (=> bm!31965 (= call!31968 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62612 (Cons!10235 (select (arr!16213 a!3154) #b00000000000000000000000000000000) Nil!10236) Nil!10236)))))

(declare-fun b!532706 () Bool)

(assert (=> b!532706 (= e!310089 e!310091)))

(assert (=> b!532706 (= c!62612 (validKeyInArray!0 (select (arr!16213 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81437 () Bool)

(declare-fun res!328100 () Bool)

(assert (=> d!81437 (=> res!328100 e!310092)))

(assert (=> d!81437 (= res!328100 (bvsge #b00000000000000000000000000000000 (size!16577 a!3154)))))

(assert (=> d!81437 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10236) e!310092)))

(assert (= (and d!81437 (not res!328100)) b!532705))

(assert (= (and b!532705 res!328102) b!532707))

(assert (= (and b!532705 res!328101) b!532706))

(assert (= (and b!532706 c!62612) b!532708))

(assert (= (and b!532706 (not c!62612)) b!532704))

(assert (= (or b!532708 b!532704) bm!31965))

(assert (=> b!532705 m!513037))

(assert (=> b!532705 m!513037))

(declare-fun m!513041 () Bool)

(assert (=> b!532705 m!513041))

(assert (=> b!532707 m!513037))

(assert (=> b!532707 m!513037))

(declare-fun m!513043 () Bool)

(assert (=> b!532707 m!513043))

(assert (=> bm!31965 m!513037))

(declare-fun m!513045 () Bool)

(assert (=> bm!31965 m!513045))

(assert (=> b!532706 m!513037))

(assert (=> b!532706 m!513037))

(assert (=> b!532706 m!513041))

(assert (=> b!532619 d!81437))

(declare-fun b!532756 () Bool)

(declare-fun e!310131 () Bool)

(declare-fun lt!245295 () SeekEntryResult!4627)

(assert (=> b!532756 (= e!310131 (bvsge (x!49849 lt!245295) #b01111111111111111111111111111110))))

(declare-fun b!532757 () Bool)

(assert (=> b!532757 (and (bvsge (index!20734 lt!245295) #b00000000000000000000000000000000) (bvslt (index!20734 lt!245295) (size!16577 a!3154)))))

(declare-fun e!310130 () Bool)

(assert (=> b!532757 (= e!310130 (= (select (arr!16213 a!3154) (index!20734 lt!245295)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!532758 () Bool)

(assert (=> b!532758 (and (bvsge (index!20734 lt!245295) #b00000000000000000000000000000000) (bvslt (index!20734 lt!245295) (size!16577 a!3154)))))

(declare-fun res!328128 () Bool)

(assert (=> b!532758 (= res!328128 (= (select (arr!16213 a!3154) (index!20734 lt!245295)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532758 (=> res!328128 e!310130)))

(declare-fun d!81439 () Bool)

(assert (=> d!81439 e!310131))

(declare-fun c!62626 () Bool)

(get-info :version)

(assert (=> d!81439 (= c!62626 (and ((_ is Intermediate!4627) lt!245295) (undefined!5439 lt!245295)))))

(declare-fun e!310129 () SeekEntryResult!4627)

(assert (=> d!81439 (= lt!245295 e!310129)))

(declare-fun c!62624 () Bool)

(assert (=> d!81439 (= c!62624 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!245296 () (_ BitVec 64))

(assert (=> d!81439 (= lt!245296 (select (arr!16213 a!3154) index!1177))))

(assert (=> d!81439 (validMask!0 mask!3216)))

(assert (=> d!81439 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16213 a!3154) j!147) a!3154 mask!3216) lt!245295)))

(declare-fun b!532759 () Bool)

(declare-fun e!310127 () SeekEntryResult!4627)

(assert (=> b!532759 (= e!310127 (Intermediate!4627 false index!1177 x!1030))))

(declare-fun b!532760 () Bool)

(assert (=> b!532760 (= e!310129 e!310127)))

(declare-fun c!62625 () Bool)

(assert (=> b!532760 (= c!62625 (or (= lt!245296 (select (arr!16213 a!3154) j!147)) (= (bvadd lt!245296 lt!245296) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!532761 () Bool)

(assert (=> b!532761 (and (bvsge (index!20734 lt!245295) #b00000000000000000000000000000000) (bvslt (index!20734 lt!245295) (size!16577 a!3154)))))

(declare-fun res!328130 () Bool)

(assert (=> b!532761 (= res!328130 (= (select (arr!16213 a!3154) (index!20734 lt!245295)) (select (arr!16213 a!3154) j!147)))))

(assert (=> b!532761 (=> res!328130 e!310130)))

(declare-fun e!310128 () Bool)

(assert (=> b!532761 (= e!310128 e!310130)))

(declare-fun b!532762 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532762 (= e!310127 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16213 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!532763 () Bool)

(assert (=> b!532763 (= e!310131 e!310128)))

(declare-fun res!328129 () Bool)

(assert (=> b!532763 (= res!328129 (and ((_ is Intermediate!4627) lt!245295) (not (undefined!5439 lt!245295)) (bvslt (x!49849 lt!245295) #b01111111111111111111111111111110) (bvsge (x!49849 lt!245295) #b00000000000000000000000000000000) (bvsge (x!49849 lt!245295) x!1030)))))

(assert (=> b!532763 (=> (not res!328129) (not e!310128))))

(declare-fun b!532764 () Bool)

(assert (=> b!532764 (= e!310129 (Intermediate!4627 true index!1177 x!1030))))

(assert (= (and d!81439 c!62624) b!532764))

(assert (= (and d!81439 (not c!62624)) b!532760))

(assert (= (and b!532760 c!62625) b!532759))

(assert (= (and b!532760 (not c!62625)) b!532762))

(assert (= (and d!81439 c!62626) b!532756))

(assert (= (and d!81439 (not c!62626)) b!532763))

(assert (= (and b!532763 res!328129) b!532761))

(assert (= (and b!532761 (not res!328130)) b!532758))

(assert (= (and b!532758 (not res!328128)) b!532757))

(declare-fun m!513059 () Bool)

(assert (=> d!81439 m!513059))

(assert (=> d!81439 m!512973))

(declare-fun m!513061 () Bool)

(assert (=> b!532757 m!513061))

(assert (=> b!532761 m!513061))

(declare-fun m!513063 () Bool)

(assert (=> b!532762 m!513063))

(assert (=> b!532762 m!513063))

(assert (=> b!532762 m!512965))

(declare-fun m!513065 () Bool)

(assert (=> b!532762 m!513065))

(assert (=> b!532758 m!513061))

(assert (=> b!532624 d!81439))

(declare-fun d!81453 () Bool)

(declare-fun res!328152 () Bool)

(declare-fun e!310162 () Bool)

(assert (=> d!81453 (=> res!328152 e!310162)))

(assert (=> d!81453 (= res!328152 (bvsge #b00000000000000000000000000000000 (size!16577 a!3154)))))

(assert (=> d!81453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!310162)))

(declare-fun bm!31980 () Bool)

(declare-fun call!31983 () Bool)

(assert (=> bm!31980 (= call!31983 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!532804 () Bool)

(declare-fun e!310164 () Bool)

(declare-fun e!310163 () Bool)

(assert (=> b!532804 (= e!310164 e!310163)))

(declare-fun lt!245315 () (_ BitVec 64))

(assert (=> b!532804 (= lt!245315 (select (arr!16213 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16811 0))(
  ( (Unit!16812) )
))
(declare-fun lt!245316 () Unit!16811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33746 (_ BitVec 64) (_ BitVec 32)) Unit!16811)

(assert (=> b!532804 (= lt!245316 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245315 #b00000000000000000000000000000000))))

(assert (=> b!532804 (arrayContainsKey!0 a!3154 lt!245315 #b00000000000000000000000000000000)))

(declare-fun lt!245317 () Unit!16811)

(assert (=> b!532804 (= lt!245317 lt!245316)))

(declare-fun res!328153 () Bool)

(assert (=> b!532804 (= res!328153 (= (seekEntryOrOpen!0 (select (arr!16213 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4627 #b00000000000000000000000000000000)))))

(assert (=> b!532804 (=> (not res!328153) (not e!310163))))

(declare-fun b!532805 () Bool)

(assert (=> b!532805 (= e!310163 call!31983)))

(declare-fun b!532806 () Bool)

(assert (=> b!532806 (= e!310164 call!31983)))

(declare-fun b!532807 () Bool)

(assert (=> b!532807 (= e!310162 e!310164)))

(declare-fun c!62636 () Bool)

(assert (=> b!532807 (= c!62636 (validKeyInArray!0 (select (arr!16213 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81453 (not res!328152)) b!532807))

(assert (= (and b!532807 c!62636) b!532804))

(assert (= (and b!532807 (not c!62636)) b!532806))

(assert (= (and b!532804 res!328153) b!532805))

(assert (= (or b!532805 b!532806) bm!31980))

(declare-fun m!513089 () Bool)

(assert (=> bm!31980 m!513089))

(assert (=> b!532804 m!513037))

(declare-fun m!513091 () Bool)

(assert (=> b!532804 m!513091))

(declare-fun m!513093 () Bool)

(assert (=> b!532804 m!513093))

(assert (=> b!532804 m!513037))

(declare-fun m!513095 () Bool)

(assert (=> b!532804 m!513095))

(assert (=> b!532807 m!513037))

(assert (=> b!532807 m!513037))

(assert (=> b!532807 m!513041))

(assert (=> b!532625 d!81453))

(declare-fun d!81461 () Bool)

(declare-fun lt!245329 () (_ BitVec 32))

(declare-fun lt!245328 () (_ BitVec 32))

(assert (=> d!81461 (= lt!245329 (bvmul (bvxor lt!245328 (bvlshr lt!245328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81461 (= lt!245328 ((_ extract 31 0) (bvand (bvxor (select (arr!16213 a!3154) j!147) (bvlshr (select (arr!16213 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81461 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!328155 (let ((h!11179 ((_ extract 31 0) (bvand (bvxor (select (arr!16213 a!3154) j!147) (bvlshr (select (arr!16213 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49854 (bvmul (bvxor h!11179 (bvlshr h!11179 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49854 (bvlshr x!49854 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!328155 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!328155 #b00000000000000000000000000000000))))))

(assert (=> d!81461 (= (toIndex!0 (select (arr!16213 a!3154) j!147) mask!3216) (bvand (bvxor lt!245329 (bvlshr lt!245329 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!532620 d!81461))

(declare-fun d!81467 () Bool)

(assert (=> d!81467 (= (validKeyInArray!0 (select (arr!16213 a!3154) j!147)) (and (not (= (select (arr!16213 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16213 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532626 d!81467))

(declare-fun lt!245356 () SeekEntryResult!4627)

(declare-fun e!310198 () SeekEntryResult!4627)

(declare-fun b!532865 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33746 (_ BitVec 32)) SeekEntryResult!4627)

(assert (=> b!532865 (= e!310198 (seekKeyOrZeroReturnVacant!0 (x!49849 lt!245356) (index!20734 lt!245356) (index!20734 lt!245356) k0!1998 a!3154 mask!3216))))

(declare-fun b!532866 () Bool)

(declare-fun e!310199 () SeekEntryResult!4627)

(declare-fun e!310200 () SeekEntryResult!4627)

(assert (=> b!532866 (= e!310199 e!310200)))

(declare-fun lt!245355 () (_ BitVec 64))

(assert (=> b!532866 (= lt!245355 (select (arr!16213 a!3154) (index!20734 lt!245356)))))

(declare-fun c!62659 () Bool)

(assert (=> b!532866 (= c!62659 (= lt!245355 k0!1998))))

(declare-fun b!532867 () Bool)

(assert (=> b!532867 (= e!310199 Undefined!4627)))

(declare-fun b!532868 () Bool)

(assert (=> b!532868 (= e!310198 (MissingZero!4627 (index!20734 lt!245356)))))

(declare-fun d!81469 () Bool)

(declare-fun lt!245354 () SeekEntryResult!4627)

(assert (=> d!81469 (and (or ((_ is Undefined!4627) lt!245354) (not ((_ is Found!4627) lt!245354)) (and (bvsge (index!20733 lt!245354) #b00000000000000000000000000000000) (bvslt (index!20733 lt!245354) (size!16577 a!3154)))) (or ((_ is Undefined!4627) lt!245354) ((_ is Found!4627) lt!245354) (not ((_ is MissingZero!4627) lt!245354)) (and (bvsge (index!20732 lt!245354) #b00000000000000000000000000000000) (bvslt (index!20732 lt!245354) (size!16577 a!3154)))) (or ((_ is Undefined!4627) lt!245354) ((_ is Found!4627) lt!245354) ((_ is MissingZero!4627) lt!245354) (not ((_ is MissingVacant!4627) lt!245354)) (and (bvsge (index!20735 lt!245354) #b00000000000000000000000000000000) (bvslt (index!20735 lt!245354) (size!16577 a!3154)))) (or ((_ is Undefined!4627) lt!245354) (ite ((_ is Found!4627) lt!245354) (= (select (arr!16213 a!3154) (index!20733 lt!245354)) k0!1998) (ite ((_ is MissingZero!4627) lt!245354) (= (select (arr!16213 a!3154) (index!20732 lt!245354)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4627) lt!245354) (= (select (arr!16213 a!3154) (index!20735 lt!245354)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81469 (= lt!245354 e!310199)))

(declare-fun c!62658 () Bool)

(assert (=> d!81469 (= c!62658 (and ((_ is Intermediate!4627) lt!245356) (undefined!5439 lt!245356)))))

(assert (=> d!81469 (= lt!245356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81469 (validMask!0 mask!3216)))

(assert (=> d!81469 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!245354)))

(declare-fun b!532869 () Bool)

(assert (=> b!532869 (= e!310200 (Found!4627 (index!20734 lt!245356)))))

(declare-fun b!532870 () Bool)

(declare-fun c!62660 () Bool)

(assert (=> b!532870 (= c!62660 (= lt!245355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532870 (= e!310200 e!310198)))

(assert (= (and d!81469 c!62658) b!532867))

(assert (= (and d!81469 (not c!62658)) b!532866))

(assert (= (and b!532866 c!62659) b!532869))

(assert (= (and b!532866 (not c!62659)) b!532870))

(assert (= (and b!532870 c!62660) b!532868))

(assert (= (and b!532870 (not c!62660)) b!532865))

(declare-fun m!513099 () Bool)

(assert (=> b!532865 m!513099))

(declare-fun m!513101 () Bool)

(assert (=> b!532866 m!513101))

(declare-fun m!513105 () Bool)

(assert (=> d!81469 m!513105))

(declare-fun m!513107 () Bool)

(assert (=> d!81469 m!513107))

(assert (=> d!81469 m!512973))

(declare-fun m!513111 () Bool)

(assert (=> d!81469 m!513111))

(declare-fun m!513115 () Bool)

(assert (=> d!81469 m!513115))

(assert (=> d!81469 m!513107))

(declare-fun m!513117 () Bool)

(assert (=> d!81469 m!513117))

(assert (=> b!532627 d!81469))

(declare-fun d!81475 () Bool)

(assert (=> d!81475 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48484 d!81475))

(declare-fun d!81485 () Bool)

(assert (=> d!81485 (= (array_inv!12072 a!3154) (bvsge (size!16577 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48484 d!81485))

(check-sat (not bm!31965) (not b!532762) (not d!81439) (not b!532707) (not b!532705) (not b!532804) (not b!532807) (not b!532865) (not b!532693) (not d!81469) (not bm!31980) (not b!532706))
(check-sat)
