; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48412 () Bool)

(assert start!48412)

(declare-fun b!532024 () Bool)

(declare-fun res!327574 () Bool)

(declare-fun e!309793 () Bool)

(assert (=> b!532024 (=> (not res!327574) (not e!309793))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33719 0))(
  ( (array!33720 (arr!16201 (Array (_ BitVec 32) (_ BitVec 64))) (size!16565 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33719)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532024 (= res!327574 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16565 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16565 a!3154)) (= (select (arr!16201 a!3154) resIndex!32) (select (arr!16201 a!3154) j!147))))))

(declare-fun b!532025 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!532025 (= e!309793 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsgt mask!3216 #b00111111111111111111111111111111)))))

(declare-fun b!532026 () Bool)

(declare-fun res!327577 () Bool)

(declare-fun e!309794 () Bool)

(assert (=> b!532026 (=> (not res!327577) (not e!309794))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532026 (= res!327577 (and (= (size!16565 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16565 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16565 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532027 () Bool)

(declare-fun res!327569 () Bool)

(assert (=> b!532027 (=> (not res!327569) (not e!309793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33719 (_ BitVec 32)) Bool)

(assert (=> b!532027 (= res!327569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532028 () Bool)

(declare-fun res!327576 () Bool)

(assert (=> b!532028 (=> (not res!327576) (not e!309794))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532028 (= res!327576 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532029 () Bool)

(assert (=> b!532029 (= e!309794 e!309793)))

(declare-fun res!327568 () Bool)

(assert (=> b!532029 (=> (not res!327568) (not e!309793))))

(declare-datatypes ((SeekEntryResult!4615 0))(
  ( (MissingZero!4615 (index!20684 (_ BitVec 32))) (Found!4615 (index!20685 (_ BitVec 32))) (Intermediate!4615 (undefined!5427 Bool) (index!20686 (_ BitVec 32)) (x!49802 (_ BitVec 32))) (Undefined!4615) (MissingVacant!4615 (index!20687 (_ BitVec 32))) )
))
(declare-fun lt!245134 () SeekEntryResult!4615)

(assert (=> b!532029 (= res!327568 (or (= lt!245134 (MissingZero!4615 i!1153)) (= lt!245134 (MissingVacant!4615 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33719 (_ BitVec 32)) SeekEntryResult!4615)

(assert (=> b!532029 (= lt!245134 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532030 () Bool)

(declare-fun res!327571 () Bool)

(assert (=> b!532030 (=> (not res!327571) (not e!309793))))

(declare-datatypes ((List!10227 0))(
  ( (Nil!10224) (Cons!10223 (h!11163 (_ BitVec 64)) (t!16447 List!10227)) )
))
(declare-fun arrayNoDuplicates!0 (array!33719 (_ BitVec 32) List!10227) Bool)

(assert (=> b!532030 (= res!327571 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10224))))

(declare-fun res!327573 () Bool)

(assert (=> start!48412 (=> (not res!327573) (not e!309794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48412 (= res!327573 (validMask!0 mask!3216))))

(assert (=> start!48412 e!309794))

(assert (=> start!48412 true))

(declare-fun array_inv!12060 (array!33719) Bool)

(assert (=> start!48412 (array_inv!12060 a!3154)))

(declare-fun b!532031 () Bool)

(declare-fun res!327572 () Bool)

(assert (=> b!532031 (=> (not res!327572) (not e!309794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532031 (= res!327572 (validKeyInArray!0 (select (arr!16201 a!3154) j!147)))))

(declare-fun b!532032 () Bool)

(declare-fun res!327570 () Bool)

(assert (=> b!532032 (=> (not res!327570) (not e!309793))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33719 (_ BitVec 32)) SeekEntryResult!4615)

(assert (=> b!532032 (= res!327570 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16201 a!3154) j!147) a!3154 mask!3216) (Intermediate!4615 false resIndex!32 resX!32)))))

(declare-fun b!532033 () Bool)

(declare-fun res!327575 () Bool)

(assert (=> b!532033 (=> (not res!327575) (not e!309794))))

(assert (=> b!532033 (= res!327575 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48412 res!327573) b!532026))

(assert (= (and b!532026 res!327577) b!532031))

(assert (= (and b!532031 res!327572) b!532033))

(assert (= (and b!532033 res!327575) b!532028))

(assert (= (and b!532028 res!327576) b!532029))

(assert (= (and b!532029 res!327568) b!532027))

(assert (= (and b!532027 res!327569) b!532030))

(assert (= (and b!532030 res!327571) b!532024))

(assert (= (and b!532024 res!327574) b!532032))

(assert (= (and b!532032 res!327570) b!532025))

(declare-fun m!512563 () Bool)

(assert (=> b!532030 m!512563))

(declare-fun m!512565 () Bool)

(assert (=> b!532033 m!512565))

(declare-fun m!512567 () Bool)

(assert (=> b!532029 m!512567))

(declare-fun m!512569 () Bool)

(assert (=> b!532028 m!512569))

(declare-fun m!512571 () Bool)

(assert (=> b!532024 m!512571))

(declare-fun m!512573 () Bool)

(assert (=> b!532024 m!512573))

(assert (=> b!532032 m!512573))

(assert (=> b!532032 m!512573))

(declare-fun m!512575 () Bool)

(assert (=> b!532032 m!512575))

(declare-fun m!512577 () Bool)

(assert (=> start!48412 m!512577))

(declare-fun m!512579 () Bool)

(assert (=> start!48412 m!512579))

(declare-fun m!512581 () Bool)

(assert (=> b!532027 m!512581))

(assert (=> b!532031 m!512573))

(assert (=> b!532031 m!512573))

(declare-fun m!512583 () Bool)

(assert (=> b!532031 m!512583))

(check-sat (not b!532027) (not b!532033) (not b!532028) (not b!532030) (not b!532032) (not b!532031) (not start!48412) (not b!532029))
(check-sat)
(get-model)

(declare-fun d!81371 () Bool)

(declare-fun res!327643 () Bool)

(declare-fun e!309821 () Bool)

(assert (=> d!81371 (=> res!327643 e!309821)))

(assert (=> d!81371 (= res!327643 (bvsge #b00000000000000000000000000000000 (size!16565 a!3154)))))

(assert (=> d!81371 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309821)))

(declare-fun bm!31947 () Bool)

(declare-fun call!31950 () Bool)

(assert (=> bm!31947 (= call!31950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!532102 () Bool)

(declare-fun e!309822 () Bool)

(assert (=> b!532102 (= e!309822 call!31950)))

(declare-fun b!532103 () Bool)

(declare-fun e!309820 () Bool)

(assert (=> b!532103 (= e!309820 call!31950)))

(declare-fun b!532104 () Bool)

(assert (=> b!532104 (= e!309821 e!309820)))

(declare-fun c!62540 () Bool)

(assert (=> b!532104 (= c!62540 (validKeyInArray!0 (select (arr!16201 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532105 () Bool)

(assert (=> b!532105 (= e!309820 e!309822)))

(declare-fun lt!245147 () (_ BitVec 64))

(assert (=> b!532105 (= lt!245147 (select (arr!16201 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16807 0))(
  ( (Unit!16808) )
))
(declare-fun lt!245148 () Unit!16807)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33719 (_ BitVec 64) (_ BitVec 32)) Unit!16807)

(assert (=> b!532105 (= lt!245148 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245147 #b00000000000000000000000000000000))))

(assert (=> b!532105 (arrayContainsKey!0 a!3154 lt!245147 #b00000000000000000000000000000000)))

(declare-fun lt!245149 () Unit!16807)

(assert (=> b!532105 (= lt!245149 lt!245148)))

(declare-fun res!327642 () Bool)

(assert (=> b!532105 (= res!327642 (= (seekEntryOrOpen!0 (select (arr!16201 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4615 #b00000000000000000000000000000000)))))

(assert (=> b!532105 (=> (not res!327642) (not e!309822))))

(assert (= (and d!81371 (not res!327643)) b!532104))

(assert (= (and b!532104 c!62540) b!532105))

(assert (= (and b!532104 (not c!62540)) b!532103))

(assert (= (and b!532105 res!327642) b!532102))

(assert (= (or b!532102 b!532103) bm!31947))

(declare-fun m!512629 () Bool)

(assert (=> bm!31947 m!512629))

(declare-fun m!512631 () Bool)

(assert (=> b!532104 m!512631))

(assert (=> b!532104 m!512631))

(declare-fun m!512633 () Bool)

(assert (=> b!532104 m!512633))

(assert (=> b!532105 m!512631))

(declare-fun m!512635 () Bool)

(assert (=> b!532105 m!512635))

(declare-fun m!512637 () Bool)

(assert (=> b!532105 m!512637))

(assert (=> b!532105 m!512631))

(declare-fun m!512639 () Bool)

(assert (=> b!532105 m!512639))

(assert (=> b!532027 d!81371))

(declare-fun d!81373 () Bool)

(assert (=> d!81373 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532033 d!81373))

(declare-fun d!81375 () Bool)

(declare-fun res!327648 () Bool)

(declare-fun e!309827 () Bool)

(assert (=> d!81375 (=> res!327648 e!309827)))

(assert (=> d!81375 (= res!327648 (= (select (arr!16201 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81375 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309827)))

(declare-fun b!532110 () Bool)

(declare-fun e!309828 () Bool)

(assert (=> b!532110 (= e!309827 e!309828)))

(declare-fun res!327649 () Bool)

(assert (=> b!532110 (=> (not res!327649) (not e!309828))))

(assert (=> b!532110 (= res!327649 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16565 a!3154)))))

(declare-fun b!532111 () Bool)

(assert (=> b!532111 (= e!309828 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81375 (not res!327648)) b!532110))

(assert (= (and b!532110 res!327649) b!532111))

(assert (=> d!81375 m!512631))

(declare-fun m!512641 () Bool)

(assert (=> b!532111 m!512641))

(assert (=> b!532028 d!81375))

(declare-fun d!81377 () Bool)

(assert (=> d!81377 (= (validKeyInArray!0 (select (arr!16201 a!3154) j!147)) (and (not (= (select (arr!16201 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16201 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532031 d!81377))

(declare-fun b!532175 () Bool)

(declare-fun lt!245168 () SeekEntryResult!4615)

(assert (=> b!532175 (and (bvsge (index!20686 lt!245168) #b00000000000000000000000000000000) (bvslt (index!20686 lt!245168) (size!16565 a!3154)))))

(declare-fun res!327677 () Bool)

(assert (=> b!532175 (= res!327677 (= (select (arr!16201 a!3154) (index!20686 lt!245168)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309870 () Bool)

(assert (=> b!532175 (=> res!327677 e!309870)))

(declare-fun d!81379 () Bool)

(declare-fun e!309872 () Bool)

(assert (=> d!81379 e!309872))

(declare-fun c!62560 () Bool)

(get-info :version)

(assert (=> d!81379 (= c!62560 (and ((_ is Intermediate!4615) lt!245168) (undefined!5427 lt!245168)))))

(declare-fun e!309874 () SeekEntryResult!4615)

(assert (=> d!81379 (= lt!245168 e!309874)))

(declare-fun c!62561 () Bool)

(assert (=> d!81379 (= c!62561 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!245167 () (_ BitVec 64))

(assert (=> d!81379 (= lt!245167 (select (arr!16201 a!3154) index!1177))))

(assert (=> d!81379 (validMask!0 mask!3216)))

(assert (=> d!81379 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16201 a!3154) j!147) a!3154 mask!3216) lt!245168)))

(declare-fun b!532176 () Bool)

(declare-fun e!309871 () SeekEntryResult!4615)

(assert (=> b!532176 (= e!309871 (Intermediate!4615 false index!1177 x!1030))))

(declare-fun b!532177 () Bool)

(assert (=> b!532177 (and (bvsge (index!20686 lt!245168) #b00000000000000000000000000000000) (bvslt (index!20686 lt!245168) (size!16565 a!3154)))))

(declare-fun res!327678 () Bool)

(assert (=> b!532177 (= res!327678 (= (select (arr!16201 a!3154) (index!20686 lt!245168)) (select (arr!16201 a!3154) j!147)))))

(assert (=> b!532177 (=> res!327678 e!309870)))

(declare-fun e!309873 () Bool)

(assert (=> b!532177 (= e!309873 e!309870)))

(declare-fun b!532178 () Bool)

(assert (=> b!532178 (and (bvsge (index!20686 lt!245168) #b00000000000000000000000000000000) (bvslt (index!20686 lt!245168) (size!16565 a!3154)))))

(assert (=> b!532178 (= e!309870 (= (select (arr!16201 a!3154) (index!20686 lt!245168)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!532179 () Bool)

(assert (=> b!532179 (= e!309874 (Intermediate!4615 true index!1177 x!1030))))

(declare-fun b!532180 () Bool)

(assert (=> b!532180 (= e!309872 e!309873)))

(declare-fun res!327679 () Bool)

(assert (=> b!532180 (= res!327679 (and ((_ is Intermediate!4615) lt!245168) (not (undefined!5427 lt!245168)) (bvslt (x!49802 lt!245168) #b01111111111111111111111111111110) (bvsge (x!49802 lt!245168) #b00000000000000000000000000000000) (bvsge (x!49802 lt!245168) x!1030)))))

(assert (=> b!532180 (=> (not res!327679) (not e!309873))))

(declare-fun b!532181 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532181 (= e!309871 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16201 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!532182 () Bool)

(assert (=> b!532182 (= e!309872 (bvsge (x!49802 lt!245168) #b01111111111111111111111111111110))))

(declare-fun b!532183 () Bool)

(assert (=> b!532183 (= e!309874 e!309871)))

(declare-fun c!62559 () Bool)

(assert (=> b!532183 (= c!62559 (or (= lt!245167 (select (arr!16201 a!3154) j!147)) (= (bvadd lt!245167 lt!245167) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!81379 c!62561) b!532179))

(assert (= (and d!81379 (not c!62561)) b!532183))

(assert (= (and b!532183 c!62559) b!532176))

(assert (= (and b!532183 (not c!62559)) b!532181))

(assert (= (and d!81379 c!62560) b!532182))

(assert (= (and d!81379 (not c!62560)) b!532180))

(assert (= (and b!532180 res!327679) b!532177))

(assert (= (and b!532177 (not res!327678)) b!532175))

(assert (= (and b!532175 (not res!327677)) b!532178))

(declare-fun m!512659 () Bool)

(assert (=> d!81379 m!512659))

(assert (=> d!81379 m!512577))

(declare-fun m!512661 () Bool)

(assert (=> b!532175 m!512661))

(assert (=> b!532178 m!512661))

(declare-fun m!512663 () Bool)

(assert (=> b!532181 m!512663))

(assert (=> b!532181 m!512663))

(assert (=> b!532181 m!512573))

(declare-fun m!512665 () Bool)

(assert (=> b!532181 m!512665))

(assert (=> b!532177 m!512661))

(assert (=> b!532032 d!81379))

(declare-fun b!532209 () Bool)

(declare-fun e!309896 () Bool)

(declare-fun call!31959 () Bool)

(assert (=> b!532209 (= e!309896 call!31959)))

(declare-fun b!532210 () Bool)

(declare-fun e!309897 () Bool)

(assert (=> b!532210 (= e!309897 e!309896)))

(declare-fun c!62567 () Bool)

(assert (=> b!532210 (= c!62567 (validKeyInArray!0 (select (arr!16201 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532211 () Bool)

(assert (=> b!532211 (= e!309896 call!31959)))

(declare-fun d!81389 () Bool)

(declare-fun res!327696 () Bool)

(declare-fun e!309895 () Bool)

(assert (=> d!81389 (=> res!327696 e!309895)))

(assert (=> d!81389 (= res!327696 (bvsge #b00000000000000000000000000000000 (size!16565 a!3154)))))

(assert (=> d!81389 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10224) e!309895)))

(declare-fun bm!31956 () Bool)

(assert (=> bm!31956 (= call!31959 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62567 (Cons!10223 (select (arr!16201 a!3154) #b00000000000000000000000000000000) Nil!10224) Nil!10224)))))

(declare-fun b!532212 () Bool)

(declare-fun e!309894 () Bool)

(declare-fun contains!2763 (List!10227 (_ BitVec 64)) Bool)

(assert (=> b!532212 (= e!309894 (contains!2763 Nil!10224 (select (arr!16201 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532213 () Bool)

(assert (=> b!532213 (= e!309895 e!309897)))

(declare-fun res!327695 () Bool)

(assert (=> b!532213 (=> (not res!327695) (not e!309897))))

(assert (=> b!532213 (= res!327695 (not e!309894))))

(declare-fun res!327697 () Bool)

(assert (=> b!532213 (=> (not res!327697) (not e!309894))))

(assert (=> b!532213 (= res!327697 (validKeyInArray!0 (select (arr!16201 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81389 (not res!327696)) b!532213))

(assert (= (and b!532213 res!327697) b!532212))

(assert (= (and b!532213 res!327695) b!532210))

(assert (= (and b!532210 c!62567) b!532209))

(assert (= (and b!532210 (not c!62567)) b!532211))

(assert (= (or b!532209 b!532211) bm!31956))

(assert (=> b!532210 m!512631))

(assert (=> b!532210 m!512631))

(assert (=> b!532210 m!512633))

(assert (=> bm!31956 m!512631))

(declare-fun m!512679 () Bool)

(assert (=> bm!31956 m!512679))

(assert (=> b!532212 m!512631))

(assert (=> b!532212 m!512631))

(declare-fun m!512681 () Bool)

(assert (=> b!532212 m!512681))

(assert (=> b!532213 m!512631))

(assert (=> b!532213 m!512631))

(assert (=> b!532213 m!512633))

(assert (=> b!532030 d!81389))

(declare-fun d!81397 () Bool)

(assert (=> d!81397 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48412 d!81397))

(declare-fun d!81403 () Bool)

(assert (=> d!81403 (= (array_inv!12060 a!3154) (bvsge (size!16565 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48412 d!81403))

(declare-fun e!309934 () SeekEntryResult!4615)

(declare-fun lt!245194 () SeekEntryResult!4615)

(declare-fun b!532277 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33719 (_ BitVec 32)) SeekEntryResult!4615)

(assert (=> b!532277 (= e!309934 (seekKeyOrZeroReturnVacant!0 (x!49802 lt!245194) (index!20686 lt!245194) (index!20686 lt!245194) k0!1998 a!3154 mask!3216))))

(declare-fun b!532278 () Bool)

(declare-fun c!62593 () Bool)

(declare-fun lt!245192 () (_ BitVec 64))

(assert (=> b!532278 (= c!62593 (= lt!245192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309936 () SeekEntryResult!4615)

(assert (=> b!532278 (= e!309936 e!309934)))

(declare-fun b!532279 () Bool)

(assert (=> b!532279 (= e!309934 (MissingZero!4615 (index!20686 lt!245194)))))

(declare-fun b!532280 () Bool)

(declare-fun e!309935 () SeekEntryResult!4615)

(assert (=> b!532280 (= e!309935 Undefined!4615)))

(declare-fun b!532281 () Bool)

(assert (=> b!532281 (= e!309936 (Found!4615 (index!20686 lt!245194)))))

(declare-fun b!532282 () Bool)

(assert (=> b!532282 (= e!309935 e!309936)))

(assert (=> b!532282 (= lt!245192 (select (arr!16201 a!3154) (index!20686 lt!245194)))))

(declare-fun c!62594 () Bool)

(assert (=> b!532282 (= c!62594 (= lt!245192 k0!1998))))

(declare-fun d!81405 () Bool)

(declare-fun lt!245193 () SeekEntryResult!4615)

(assert (=> d!81405 (and (or ((_ is Undefined!4615) lt!245193) (not ((_ is Found!4615) lt!245193)) (and (bvsge (index!20685 lt!245193) #b00000000000000000000000000000000) (bvslt (index!20685 lt!245193) (size!16565 a!3154)))) (or ((_ is Undefined!4615) lt!245193) ((_ is Found!4615) lt!245193) (not ((_ is MissingZero!4615) lt!245193)) (and (bvsge (index!20684 lt!245193) #b00000000000000000000000000000000) (bvslt (index!20684 lt!245193) (size!16565 a!3154)))) (or ((_ is Undefined!4615) lt!245193) ((_ is Found!4615) lt!245193) ((_ is MissingZero!4615) lt!245193) (not ((_ is MissingVacant!4615) lt!245193)) (and (bvsge (index!20687 lt!245193) #b00000000000000000000000000000000) (bvslt (index!20687 lt!245193) (size!16565 a!3154)))) (or ((_ is Undefined!4615) lt!245193) (ite ((_ is Found!4615) lt!245193) (= (select (arr!16201 a!3154) (index!20685 lt!245193)) k0!1998) (ite ((_ is MissingZero!4615) lt!245193) (= (select (arr!16201 a!3154) (index!20684 lt!245193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4615) lt!245193) (= (select (arr!16201 a!3154) (index!20687 lt!245193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81405 (= lt!245193 e!309935)))

(declare-fun c!62592 () Bool)

(assert (=> d!81405 (= c!62592 (and ((_ is Intermediate!4615) lt!245194) (undefined!5427 lt!245194)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81405 (= lt!245194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81405 (validMask!0 mask!3216)))

(assert (=> d!81405 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!245193)))

(assert (= (and d!81405 c!62592) b!532280))

(assert (= (and d!81405 (not c!62592)) b!532282))

(assert (= (and b!532282 c!62594) b!532281))

(assert (= (and b!532282 (not c!62594)) b!532278))

(assert (= (and b!532278 c!62593) b!532279))

(assert (= (and b!532278 (not c!62593)) b!532277))

(declare-fun m!512707 () Bool)

(assert (=> b!532277 m!512707))

(declare-fun m!512709 () Bool)

(assert (=> b!532282 m!512709))

(declare-fun m!512711 () Bool)

(assert (=> d!81405 m!512711))

(assert (=> d!81405 m!512711))

(declare-fun m!512713 () Bool)

(assert (=> d!81405 m!512713))

(declare-fun m!512715 () Bool)

(assert (=> d!81405 m!512715))

(declare-fun m!512717 () Bool)

(assert (=> d!81405 m!512717))

(assert (=> d!81405 m!512577))

(declare-fun m!512719 () Bool)

(assert (=> d!81405 m!512719))

(assert (=> b!532029 d!81405))

(check-sat (not d!81379) (not d!81405) (not b!532181) (not b!532277) (not bm!31956) (not b!532213) (not bm!31947) (not b!532210) (not b!532111) (not b!532212) (not b!532105) (not b!532104))
(check-sat)
