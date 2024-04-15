; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48222 () Bool)

(assert start!48222)

(declare-fun b!530704 () Bool)

(declare-fun e!309104 () Bool)

(declare-datatypes ((array!33657 0))(
  ( (array!33658 (arr!16175 (Array (_ BitVec 32) (_ BitVec 64))) (size!16540 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33657)

(assert (=> b!530704 (= e!309104 (and (bvsle #b00000000000000000000000000000000 (size!16540 a!3154)) (bvsge (size!16540 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!530705 () Bool)

(declare-fun res!326556 () Bool)

(assert (=> b!530705 (=> (not res!326556) (not e!309104))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33657 (_ BitVec 32)) Bool)

(assert (=> b!530705 (= res!326556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!530706 () Bool)

(declare-fun e!309103 () Bool)

(assert (=> b!530706 (= e!309103 e!309104)))

(declare-fun res!326557 () Bool)

(assert (=> b!530706 (=> (not res!326557) (not e!309104))))

(declare-datatypes ((SeekEntryResult!4630 0))(
  ( (MissingZero!4630 (index!20744 (_ BitVec 32))) (Found!4630 (index!20745 (_ BitVec 32))) (Intermediate!4630 (undefined!5442 Bool) (index!20746 (_ BitVec 32)) (x!49735 (_ BitVec 32))) (Undefined!4630) (MissingVacant!4630 (index!20747 (_ BitVec 32))) )
))
(declare-fun lt!244597 () SeekEntryResult!4630)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530706 (= res!326557 (or (= lt!244597 (MissingZero!4630 i!1153)) (= lt!244597 (MissingVacant!4630 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33657 (_ BitVec 32)) SeekEntryResult!4630)

(assert (=> b!530706 (= lt!244597 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530707 () Bool)

(declare-fun res!326553 () Bool)

(assert (=> b!530707 (=> (not res!326553) (not e!309103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530707 (= res!326553 (validKeyInArray!0 k0!1998))))

(declare-fun b!530708 () Bool)

(declare-fun res!326558 () Bool)

(assert (=> b!530708 (=> (not res!326558) (not e!309103))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530708 (= res!326558 (validKeyInArray!0 (select (arr!16175 a!3154) j!147)))))

(declare-fun b!530709 () Bool)

(declare-fun res!326554 () Bool)

(assert (=> b!530709 (=> (not res!326554) (not e!309103))))

(declare-fun arrayContainsKey!0 (array!33657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530709 (= res!326554 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530710 () Bool)

(declare-fun res!326552 () Bool)

(assert (=> b!530710 (=> (not res!326552) (not e!309103))))

(assert (=> b!530710 (= res!326552 (and (= (size!16540 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16540 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16540 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326555 () Bool)

(assert (=> start!48222 (=> (not res!326555) (not e!309103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48222 (= res!326555 (validMask!0 mask!3216))))

(assert (=> start!48222 e!309103))

(assert (=> start!48222 true))

(declare-fun array_inv!12058 (array!33657) Bool)

(assert (=> start!48222 (array_inv!12058 a!3154)))

(assert (= (and start!48222 res!326555) b!530710))

(assert (= (and b!530710 res!326552) b!530708))

(assert (= (and b!530708 res!326558) b!530707))

(assert (= (and b!530707 res!326553) b!530709))

(assert (= (and b!530709 res!326554) b!530706))

(assert (= (and b!530706 res!326557) b!530705))

(assert (= (and b!530705 res!326556) b!530704))

(declare-fun m!510745 () Bool)

(assert (=> b!530705 m!510745))

(declare-fun m!510747 () Bool)

(assert (=> b!530706 m!510747))

(declare-fun m!510749 () Bool)

(assert (=> b!530708 m!510749))

(assert (=> b!530708 m!510749))

(declare-fun m!510751 () Bool)

(assert (=> b!530708 m!510751))

(declare-fun m!510753 () Bool)

(assert (=> b!530709 m!510753))

(declare-fun m!510755 () Bool)

(assert (=> b!530707 m!510755))

(declare-fun m!510757 () Bool)

(assert (=> start!48222 m!510757))

(declare-fun m!510759 () Bool)

(assert (=> start!48222 m!510759))

(check-sat (not b!530708) (not b!530709) (not b!530705) (not start!48222) (not b!530706) (not b!530707))
(check-sat)
(get-model)

(declare-fun b!530761 () Bool)

(declare-fun e!309131 () Bool)

(declare-fun e!309132 () Bool)

(assert (=> b!530761 (= e!309131 e!309132)))

(declare-fun lt!244612 () (_ BitVec 64))

(assert (=> b!530761 (= lt!244612 (select (arr!16175 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16804 0))(
  ( (Unit!16805) )
))
(declare-fun lt!244611 () Unit!16804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33657 (_ BitVec 64) (_ BitVec 32)) Unit!16804)

(assert (=> b!530761 (= lt!244611 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244612 #b00000000000000000000000000000000))))

(assert (=> b!530761 (arrayContainsKey!0 a!3154 lt!244612 #b00000000000000000000000000000000)))

(declare-fun lt!244610 () Unit!16804)

(assert (=> b!530761 (= lt!244610 lt!244611)))

(declare-fun res!326605 () Bool)

(assert (=> b!530761 (= res!326605 (= (seekEntryOrOpen!0 (select (arr!16175 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4630 #b00000000000000000000000000000000)))))

(assert (=> b!530761 (=> (not res!326605) (not e!309132))))

(declare-fun b!530762 () Bool)

(declare-fun e!309130 () Bool)

(assert (=> b!530762 (= e!309130 e!309131)))

(declare-fun c!62388 () Bool)

(assert (=> b!530762 (= c!62388 (validKeyInArray!0 (select (arr!16175 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!530763 () Bool)

(declare-fun call!31912 () Bool)

(assert (=> b!530763 (= e!309132 call!31912)))

(declare-fun b!530764 () Bool)

(assert (=> b!530764 (= e!309131 call!31912)))

(declare-fun bm!31909 () Bool)

(assert (=> bm!31909 (= call!31912 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!80959 () Bool)

(declare-fun res!326606 () Bool)

(assert (=> d!80959 (=> res!326606 e!309130)))

(assert (=> d!80959 (= res!326606 (bvsge #b00000000000000000000000000000000 (size!16540 a!3154)))))

(assert (=> d!80959 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309130)))

(assert (= (and d!80959 (not res!326606)) b!530762))

(assert (= (and b!530762 c!62388) b!530761))

(assert (= (and b!530762 (not c!62388)) b!530764))

(assert (= (and b!530761 res!326605) b!530763))

(assert (= (or b!530763 b!530764) bm!31909))

(declare-fun m!510793 () Bool)

(assert (=> b!530761 m!510793))

(declare-fun m!510795 () Bool)

(assert (=> b!530761 m!510795))

(declare-fun m!510797 () Bool)

(assert (=> b!530761 m!510797))

(assert (=> b!530761 m!510793))

(declare-fun m!510799 () Bool)

(assert (=> b!530761 m!510799))

(assert (=> b!530762 m!510793))

(assert (=> b!530762 m!510793))

(declare-fun m!510801 () Bool)

(assert (=> b!530762 m!510801))

(declare-fun m!510803 () Bool)

(assert (=> bm!31909 m!510803))

(assert (=> b!530705 d!80959))

(declare-fun d!80965 () Bool)

(assert (=> d!80965 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530707 d!80965))

(declare-fun b!530813 () Bool)

(declare-fun e!309163 () SeekEntryResult!4630)

(declare-fun lt!244639 () SeekEntryResult!4630)

(assert (=> b!530813 (= e!309163 (Found!4630 (index!20746 lt!244639)))))

(declare-fun b!530814 () Bool)

(declare-fun e!309165 () SeekEntryResult!4630)

(assert (=> b!530814 (= e!309165 Undefined!4630)))

(declare-fun b!530815 () Bool)

(declare-fun e!309164 () SeekEntryResult!4630)

(assert (=> b!530815 (= e!309164 (MissingZero!4630 (index!20746 lt!244639)))))

(declare-fun b!530816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33657 (_ BitVec 32)) SeekEntryResult!4630)

(assert (=> b!530816 (= e!309164 (seekKeyOrZeroReturnVacant!0 (x!49735 lt!244639) (index!20746 lt!244639) (index!20746 lt!244639) k0!1998 a!3154 mask!3216))))

(declare-fun b!530817 () Bool)

(declare-fun c!62409 () Bool)

(declare-fun lt!244637 () (_ BitVec 64))

(assert (=> b!530817 (= c!62409 (= lt!244637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!530817 (= e!309163 e!309164)))

(declare-fun d!80967 () Bool)

(declare-fun lt!244638 () SeekEntryResult!4630)

(get-info :version)

(assert (=> d!80967 (and (or ((_ is Undefined!4630) lt!244638) (not ((_ is Found!4630) lt!244638)) (and (bvsge (index!20745 lt!244638) #b00000000000000000000000000000000) (bvslt (index!20745 lt!244638) (size!16540 a!3154)))) (or ((_ is Undefined!4630) lt!244638) ((_ is Found!4630) lt!244638) (not ((_ is MissingZero!4630) lt!244638)) (and (bvsge (index!20744 lt!244638) #b00000000000000000000000000000000) (bvslt (index!20744 lt!244638) (size!16540 a!3154)))) (or ((_ is Undefined!4630) lt!244638) ((_ is Found!4630) lt!244638) ((_ is MissingZero!4630) lt!244638) (not ((_ is MissingVacant!4630) lt!244638)) (and (bvsge (index!20747 lt!244638) #b00000000000000000000000000000000) (bvslt (index!20747 lt!244638) (size!16540 a!3154)))) (or ((_ is Undefined!4630) lt!244638) (ite ((_ is Found!4630) lt!244638) (= (select (arr!16175 a!3154) (index!20745 lt!244638)) k0!1998) (ite ((_ is MissingZero!4630) lt!244638) (= (select (arr!16175 a!3154) (index!20744 lt!244638)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4630) lt!244638) (= (select (arr!16175 a!3154) (index!20747 lt!244638)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80967 (= lt!244638 e!309165)))

(declare-fun c!62408 () Bool)

(assert (=> d!80967 (= c!62408 (and ((_ is Intermediate!4630) lt!244639) (undefined!5442 lt!244639)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33657 (_ BitVec 32)) SeekEntryResult!4630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!80967 (= lt!244639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!80967 (validMask!0 mask!3216)))

(assert (=> d!80967 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!244638)))

(declare-fun b!530818 () Bool)

(assert (=> b!530818 (= e!309165 e!309163)))

(assert (=> b!530818 (= lt!244637 (select (arr!16175 a!3154) (index!20746 lt!244639)))))

(declare-fun c!62407 () Bool)

(assert (=> b!530818 (= c!62407 (= lt!244637 k0!1998))))

(assert (= (and d!80967 c!62408) b!530814))

(assert (= (and d!80967 (not c!62408)) b!530818))

(assert (= (and b!530818 c!62407) b!530813))

(assert (= (and b!530818 (not c!62407)) b!530817))

(assert (= (and b!530817 c!62409) b!530815))

(assert (= (and b!530817 (not c!62409)) b!530816))

(declare-fun m!510833 () Bool)

(assert (=> b!530816 m!510833))

(declare-fun m!510835 () Bool)

(assert (=> d!80967 m!510835))

(declare-fun m!510837 () Bool)

(assert (=> d!80967 m!510837))

(assert (=> d!80967 m!510757))

(assert (=> d!80967 m!510835))

(declare-fun m!510839 () Bool)

(assert (=> d!80967 m!510839))

(declare-fun m!510841 () Bool)

(assert (=> d!80967 m!510841))

(declare-fun m!510843 () Bool)

(assert (=> d!80967 m!510843))

(declare-fun m!510845 () Bool)

(assert (=> b!530818 m!510845))

(assert (=> b!530706 d!80967))

(declare-fun d!80979 () Bool)

(assert (=> d!80979 (= (validKeyInArray!0 (select (arr!16175 a!3154) j!147)) (and (not (= (select (arr!16175 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16175 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530708 d!80979))

(declare-fun d!80981 () Bool)

(assert (=> d!80981 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48222 d!80981))

(declare-fun d!80985 () Bool)

(assert (=> d!80985 (= (array_inv!12058 a!3154) (bvsge (size!16540 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48222 d!80985))

(declare-fun d!80987 () Bool)

(declare-fun res!326629 () Bool)

(declare-fun e!309188 () Bool)

(assert (=> d!80987 (=> res!326629 e!309188)))

(assert (=> d!80987 (= res!326629 (= (select (arr!16175 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!80987 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309188)))

(declare-fun b!530853 () Bool)

(declare-fun e!309189 () Bool)

(assert (=> b!530853 (= e!309188 e!309189)))

(declare-fun res!326630 () Bool)

(assert (=> b!530853 (=> (not res!326630) (not e!309189))))

(assert (=> b!530853 (= res!326630 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16540 a!3154)))))

(declare-fun b!530854 () Bool)

(assert (=> b!530854 (= e!309189 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80987 (not res!326629)) b!530853))

(assert (= (and b!530853 res!326630) b!530854))

(assert (=> d!80987 m!510793))

(declare-fun m!510873 () Bool)

(assert (=> b!530854 m!510873))

(assert (=> b!530709 d!80987))

(check-sat (not b!530854) (not b!530762) (not bm!31909) (not b!530816) (not b!530761) (not d!80967))
(check-sat)
