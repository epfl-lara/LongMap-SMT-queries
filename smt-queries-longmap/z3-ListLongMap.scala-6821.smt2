; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85740 () Bool)

(assert start!85740)

(declare-fun b!994711 () Bool)

(declare-fun res!665342 () Bool)

(declare-fun e!561287 () Bool)

(assert (=> b!994711 (=> (not res!665342) (not e!561287))))

(declare-datatypes ((array!62893 0))(
  ( (array!62894 (arr!30285 (Array (_ BitVec 32) (_ BitVec 64))) (size!30789 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62893)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994711 (= res!665342 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994712 () Bool)

(declare-fun res!665346 () Bool)

(assert (=> b!994712 (=> (not res!665346) (not e!561287))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994712 (= res!665346 (and (= (size!30789 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30789 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30789 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665344 () Bool)

(assert (=> start!85740 (=> (not res!665344) (not e!561287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85740 (= res!665344 (validMask!0 mask!3464))))

(assert (=> start!85740 e!561287))

(declare-fun array_inv!23428 (array!62893) Bool)

(assert (=> start!85740 (array_inv!23428 a!3219)))

(assert (=> start!85740 true))

(declare-fun b!994713 () Bool)

(declare-fun res!665345 () Bool)

(assert (=> b!994713 (=> (not res!665345) (not e!561287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994713 (= res!665345 (validKeyInArray!0 k0!2224))))

(declare-fun b!994714 () Bool)

(declare-fun e!561286 () Bool)

(assert (=> b!994714 (= e!561286 (and (bvsle #b00000000000000000000000000000000 (size!30789 a!3219)) (bvsge (size!30789 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!994715 () Bool)

(declare-fun res!665347 () Bool)

(assert (=> b!994715 (=> (not res!665347) (not e!561286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62893 (_ BitVec 32)) Bool)

(assert (=> b!994715 (= res!665347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!994716 () Bool)

(declare-fun res!665343 () Bool)

(assert (=> b!994716 (=> (not res!665343) (not e!561287))))

(assert (=> b!994716 (= res!665343 (validKeyInArray!0 (select (arr!30285 a!3219) j!170)))))

(declare-fun b!994717 () Bool)

(assert (=> b!994717 (= e!561287 e!561286)))

(declare-fun res!665348 () Bool)

(assert (=> b!994717 (=> (not res!665348) (not e!561286))))

(declare-datatypes ((SeekEntryResult!9242 0))(
  ( (MissingZero!9242 (index!39339 (_ BitVec 32))) (Found!9242 (index!39340 (_ BitVec 32))) (Intermediate!9242 (undefined!10054 Bool) (index!39341 (_ BitVec 32)) (x!86798 (_ BitVec 32))) (Undefined!9242) (MissingVacant!9242 (index!39342 (_ BitVec 32))) )
))
(declare-fun lt!440557 () SeekEntryResult!9242)

(assert (=> b!994717 (= res!665348 (or (= lt!440557 (MissingVacant!9242 i!1194)) (= lt!440557 (MissingZero!9242 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62893 (_ BitVec 32)) SeekEntryResult!9242)

(assert (=> b!994717 (= lt!440557 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!85740 res!665344) b!994712))

(assert (= (and b!994712 res!665346) b!994716))

(assert (= (and b!994716 res!665343) b!994713))

(assert (= (and b!994713 res!665345) b!994711))

(assert (= (and b!994711 res!665342) b!994717))

(assert (= (and b!994717 res!665348) b!994715))

(assert (= (and b!994715 res!665347) b!994714))

(declare-fun m!921721 () Bool)

(assert (=> b!994711 m!921721))

(declare-fun m!921723 () Bool)

(assert (=> b!994717 m!921723))

(declare-fun m!921725 () Bool)

(assert (=> b!994716 m!921725))

(assert (=> b!994716 m!921725))

(declare-fun m!921727 () Bool)

(assert (=> b!994716 m!921727))

(declare-fun m!921729 () Bool)

(assert (=> b!994715 m!921729))

(declare-fun m!921731 () Bool)

(assert (=> start!85740 m!921731))

(declare-fun m!921733 () Bool)

(assert (=> start!85740 m!921733))

(declare-fun m!921735 () Bool)

(assert (=> b!994713 m!921735))

(check-sat (not b!994713) (not start!85740) (not b!994717) (not b!994715) (not b!994716) (not b!994711))
(check-sat)
(get-model)

(declare-fun b!994768 () Bool)

(declare-fun e!561314 () Bool)

(declare-fun call!42154 () Bool)

(assert (=> b!994768 (= e!561314 call!42154)))

(declare-fun d!118569 () Bool)

(declare-fun res!665396 () Bool)

(declare-fun e!561312 () Bool)

(assert (=> d!118569 (=> res!665396 e!561312)))

(assert (=> d!118569 (= res!665396 (bvsge #b00000000000000000000000000000000 (size!30789 a!3219)))))

(assert (=> d!118569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561312)))

(declare-fun b!994769 () Bool)

(declare-fun e!561313 () Bool)

(assert (=> b!994769 (= e!561313 call!42154)))

(declare-fun b!994770 () Bool)

(assert (=> b!994770 (= e!561312 e!561313)))

(declare-fun c!100828 () Bool)

(assert (=> b!994770 (= c!100828 (validKeyInArray!0 (select (arr!30285 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!994771 () Bool)

(assert (=> b!994771 (= e!561313 e!561314)))

(declare-fun lt!440571 () (_ BitVec 64))

(assert (=> b!994771 (= lt!440571 (select (arr!30285 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32819 0))(
  ( (Unit!32820) )
))
(declare-fun lt!440570 () Unit!32819)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62893 (_ BitVec 64) (_ BitVec 32)) Unit!32819)

(assert (=> b!994771 (= lt!440570 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440571 #b00000000000000000000000000000000))))

(assert (=> b!994771 (arrayContainsKey!0 a!3219 lt!440571 #b00000000000000000000000000000000)))

(declare-fun lt!440572 () Unit!32819)

(assert (=> b!994771 (= lt!440572 lt!440570)))

(declare-fun res!665395 () Bool)

(assert (=> b!994771 (= res!665395 (= (seekEntryOrOpen!0 (select (arr!30285 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9242 #b00000000000000000000000000000000)))))

(assert (=> b!994771 (=> (not res!665395) (not e!561314))))

(declare-fun bm!42151 () Bool)

(assert (=> bm!42151 (= call!42154 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!118569 (not res!665396)) b!994770))

(assert (= (and b!994770 c!100828) b!994771))

(assert (= (and b!994770 (not c!100828)) b!994769))

(assert (= (and b!994771 res!665395) b!994768))

(assert (= (or b!994768 b!994769) bm!42151))

(declare-fun m!921769 () Bool)

(assert (=> b!994770 m!921769))

(assert (=> b!994770 m!921769))

(declare-fun m!921771 () Bool)

(assert (=> b!994770 m!921771))

(assert (=> b!994771 m!921769))

(declare-fun m!921773 () Bool)

(assert (=> b!994771 m!921773))

(declare-fun m!921775 () Bool)

(assert (=> b!994771 m!921775))

(assert (=> b!994771 m!921769))

(declare-fun m!921777 () Bool)

(assert (=> b!994771 m!921777))

(declare-fun m!921779 () Bool)

(assert (=> bm!42151 m!921779))

(assert (=> b!994715 d!118569))

(declare-fun d!118575 () Bool)

(declare-fun res!665401 () Bool)

(declare-fun e!561319 () Bool)

(assert (=> d!118575 (=> res!665401 e!561319)))

(assert (=> d!118575 (= res!665401 (= (select (arr!30285 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118575 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!561319)))

(declare-fun b!994776 () Bool)

(declare-fun e!561320 () Bool)

(assert (=> b!994776 (= e!561319 e!561320)))

(declare-fun res!665402 () Bool)

(assert (=> b!994776 (=> (not res!665402) (not e!561320))))

(assert (=> b!994776 (= res!665402 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30789 a!3219)))))

(declare-fun b!994777 () Bool)

(assert (=> b!994777 (= e!561320 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118575 (not res!665401)) b!994776))

(assert (= (and b!994776 res!665402) b!994777))

(assert (=> d!118575 m!921769))

(declare-fun m!921781 () Bool)

(assert (=> b!994777 m!921781))

(assert (=> b!994711 d!118575))

(declare-fun d!118577 () Bool)

(assert (=> d!118577 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85740 d!118577))

(declare-fun d!118585 () Bool)

(assert (=> d!118585 (= (array_inv!23428 a!3219) (bvsge (size!30789 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85740 d!118585))

(declare-fun d!118587 () Bool)

(assert (=> d!118587 (= (validKeyInArray!0 (select (arr!30285 a!3219) j!170)) (and (not (= (select (arr!30285 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30285 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994716 d!118587))

(declare-fun b!994850 () Bool)

(declare-fun e!561367 () SeekEntryResult!9242)

(assert (=> b!994850 (= e!561367 Undefined!9242)))

(declare-fun b!994851 () Bool)

(declare-fun e!561368 () SeekEntryResult!9242)

(assert (=> b!994851 (= e!561367 e!561368)))

(declare-fun lt!440606 () (_ BitVec 64))

(declare-fun lt!440608 () SeekEntryResult!9242)

(assert (=> b!994851 (= lt!440606 (select (arr!30285 a!3219) (index!39341 lt!440608)))))

(declare-fun c!100858 () Bool)

(assert (=> b!994851 (= c!100858 (= lt!440606 k0!2224))))

(declare-fun b!994852 () Bool)

(assert (=> b!994852 (= e!561368 (Found!9242 (index!39341 lt!440608)))))

(declare-fun b!994853 () Bool)

(declare-fun c!100856 () Bool)

(assert (=> b!994853 (= c!100856 (= lt!440606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561366 () SeekEntryResult!9242)

(assert (=> b!994853 (= e!561368 e!561366)))

(declare-fun b!994854 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62893 (_ BitVec 32)) SeekEntryResult!9242)

(assert (=> b!994854 (= e!561366 (seekKeyOrZeroReturnVacant!0 (x!86798 lt!440608) (index!39341 lt!440608) (index!39341 lt!440608) k0!2224 a!3219 mask!3464))))

(declare-fun b!994855 () Bool)

(assert (=> b!994855 (= e!561366 (MissingZero!9242 (index!39341 lt!440608)))))

(declare-fun d!118589 () Bool)

(declare-fun lt!440607 () SeekEntryResult!9242)

(get-info :version)

(assert (=> d!118589 (and (or ((_ is Undefined!9242) lt!440607) (not ((_ is Found!9242) lt!440607)) (and (bvsge (index!39340 lt!440607) #b00000000000000000000000000000000) (bvslt (index!39340 lt!440607) (size!30789 a!3219)))) (or ((_ is Undefined!9242) lt!440607) ((_ is Found!9242) lt!440607) (not ((_ is MissingZero!9242) lt!440607)) (and (bvsge (index!39339 lt!440607) #b00000000000000000000000000000000) (bvslt (index!39339 lt!440607) (size!30789 a!3219)))) (or ((_ is Undefined!9242) lt!440607) ((_ is Found!9242) lt!440607) ((_ is MissingZero!9242) lt!440607) (not ((_ is MissingVacant!9242) lt!440607)) (and (bvsge (index!39342 lt!440607) #b00000000000000000000000000000000) (bvslt (index!39342 lt!440607) (size!30789 a!3219)))) (or ((_ is Undefined!9242) lt!440607) (ite ((_ is Found!9242) lt!440607) (= (select (arr!30285 a!3219) (index!39340 lt!440607)) k0!2224) (ite ((_ is MissingZero!9242) lt!440607) (= (select (arr!30285 a!3219) (index!39339 lt!440607)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9242) lt!440607) (= (select (arr!30285 a!3219) (index!39342 lt!440607)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118589 (= lt!440607 e!561367)))

(declare-fun c!100857 () Bool)

(assert (=> d!118589 (= c!100857 (and ((_ is Intermediate!9242) lt!440608) (undefined!10054 lt!440608)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62893 (_ BitVec 32)) SeekEntryResult!9242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118589 (= lt!440608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118589 (validMask!0 mask!3464)))

(assert (=> d!118589 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!440607)))

(assert (= (and d!118589 c!100857) b!994850))

(assert (= (and d!118589 (not c!100857)) b!994851))

(assert (= (and b!994851 c!100858) b!994852))

(assert (= (and b!994851 (not c!100858)) b!994853))

(assert (= (and b!994853 c!100856) b!994855))

(assert (= (and b!994853 (not c!100856)) b!994854))

(declare-fun m!921829 () Bool)

(assert (=> b!994851 m!921829))

(declare-fun m!921831 () Bool)

(assert (=> b!994854 m!921831))

(declare-fun m!921833 () Bool)

(assert (=> d!118589 m!921833))

(declare-fun m!921835 () Bool)

(assert (=> d!118589 m!921835))

(assert (=> d!118589 m!921731))

(assert (=> d!118589 m!921833))

(declare-fun m!921837 () Bool)

(assert (=> d!118589 m!921837))

(declare-fun m!921839 () Bool)

(assert (=> d!118589 m!921839))

(declare-fun m!921841 () Bool)

(assert (=> d!118589 m!921841))

(assert (=> b!994717 d!118589))

(declare-fun d!118607 () Bool)

(assert (=> d!118607 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994713 d!118607))

(check-sat (not bm!42151) (not b!994771) (not b!994777) (not b!994770) (not b!994854) (not d!118589))
(check-sat)
