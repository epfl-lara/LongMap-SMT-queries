; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131616 () Bool)

(assert start!131616)

(declare-fun res!1057009 () Bool)

(declare-fun e!857667 () Bool)

(assert (=> start!131616 (=> (not res!1057009) (not e!857667))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131616 (= res!1057009 (validMask!0 mask!2480))))

(assert (=> start!131616 e!857667))

(assert (=> start!131616 true))

(declare-datatypes ((array!102385 0))(
  ( (array!102386 (arr!49399 (Array (_ BitVec 32) (_ BitVec 64))) (size!49950 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102385)

(declare-fun array_inv!38680 (array!102385) Bool)

(assert (=> start!131616 (array_inv!38680 a!2792)))

(declare-fun b!1541607 () Bool)

(declare-fun res!1057011 () Bool)

(assert (=> b!1541607 (=> (not res!1057011) (not e!857667))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13420 0))(
  ( (MissingZero!13420 (index!56075 (_ BitVec 32))) (Found!13420 (index!56076 (_ BitVec 32))) (Intermediate!13420 (undefined!14232 Bool) (index!56077 (_ BitVec 32)) (x!138011 (_ BitVec 32))) (Undefined!13420) (MissingVacant!13420 (index!56078 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102385 (_ BitVec 32)) SeekEntryResult!13420)

(assert (=> b!1541607 (= res!1057011 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49399 a!2792) j!64) a!2792 mask!2480) (Found!13420 j!64)))))

(declare-fun b!1541608 () Bool)

(declare-fun res!1057010 () Bool)

(assert (=> b!1541608 (=> (not res!1057010) (not e!857667))))

(assert (=> b!1541608 (= res!1057010 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49950 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49950 a!2792)) (= (select (arr!49399 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1541609 () Bool)

(declare-fun res!1057015 () Bool)

(assert (=> b!1541609 (=> (not res!1057015) (not e!857667))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541609 (= res!1057015 (validKeyInArray!0 (select (arr!49399 a!2792) i!951)))))

(declare-fun b!1541610 () Bool)

(declare-fun res!1057017 () Bool)

(assert (=> b!1541610 (=> (not res!1057017) (not e!857667))))

(assert (=> b!1541610 (= res!1057017 (not (= (select (arr!49399 a!2792) index!463) (select (arr!49399 a!2792) j!64))))))

(declare-fun b!1541611 () Bool)

(declare-fun res!1057012 () Bool)

(assert (=> b!1541611 (=> (not res!1057012) (not e!857667))))

(assert (=> b!1541611 (= res!1057012 (validKeyInArray!0 (select (arr!49399 a!2792) j!64)))))

(declare-fun b!1541612 () Bool)

(declare-fun res!1057016 () Bool)

(assert (=> b!1541612 (=> (not res!1057016) (not e!857667))))

(declare-datatypes ((List!35860 0))(
  ( (Nil!35857) (Cons!35856 (h!37319 (_ BitVec 64)) (t!50546 List!35860)) )
))
(declare-fun arrayNoDuplicates!0 (array!102385 (_ BitVec 32) List!35860) Bool)

(assert (=> b!1541612 (= res!1057016 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35857))))

(declare-fun b!1541613 () Bool)

(declare-fun res!1057013 () Bool)

(assert (=> b!1541613 (=> (not res!1057013) (not e!857667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102385 (_ BitVec 32)) Bool)

(assert (=> b!1541613 (= res!1057013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541614 () Bool)

(declare-fun res!1057014 () Bool)

(assert (=> b!1541614 (=> (not res!1057014) (not e!857667))))

(assert (=> b!1541614 (= res!1057014 (and (= (size!49950 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49950 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49950 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1541615 () Bool)

(assert (=> b!1541615 (= e!857667 (or (bvslt (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110)))))

(declare-fun lt!665892 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541615 (= lt!665892 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(assert (= (and start!131616 res!1057009) b!1541614))

(assert (= (and b!1541614 res!1057014) b!1541609))

(assert (= (and b!1541609 res!1057015) b!1541611))

(assert (= (and b!1541611 res!1057012) b!1541613))

(assert (= (and b!1541613 res!1057013) b!1541612))

(assert (= (and b!1541612 res!1057016) b!1541608))

(assert (= (and b!1541608 res!1057010) b!1541607))

(assert (= (and b!1541607 res!1057011) b!1541610))

(assert (= (and b!1541610 res!1057017) b!1541615))

(declare-fun m!1423759 () Bool)

(assert (=> b!1541608 m!1423759))

(declare-fun m!1423761 () Bool)

(assert (=> b!1541615 m!1423761))

(declare-fun m!1423763 () Bool)

(assert (=> b!1541613 m!1423763))

(declare-fun m!1423765 () Bool)

(assert (=> b!1541607 m!1423765))

(assert (=> b!1541607 m!1423765))

(declare-fun m!1423767 () Bool)

(assert (=> b!1541607 m!1423767))

(declare-fun m!1423769 () Bool)

(assert (=> b!1541609 m!1423769))

(assert (=> b!1541609 m!1423769))

(declare-fun m!1423771 () Bool)

(assert (=> b!1541609 m!1423771))

(declare-fun m!1423773 () Bool)

(assert (=> start!131616 m!1423773))

(declare-fun m!1423775 () Bool)

(assert (=> start!131616 m!1423775))

(declare-fun m!1423777 () Bool)

(assert (=> b!1541610 m!1423777))

(assert (=> b!1541610 m!1423765))

(assert (=> b!1541611 m!1423765))

(assert (=> b!1541611 m!1423765))

(declare-fun m!1423779 () Bool)

(assert (=> b!1541611 m!1423779))

(declare-fun m!1423781 () Bool)

(assert (=> b!1541612 m!1423781))

(check-sat (not b!1541609) (not b!1541615) (not start!131616) (not b!1541612) (not b!1541613) (not b!1541611) (not b!1541607))
(check-sat)
(get-model)

(declare-fun d!161081 () Bool)

(assert (=> d!161081 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131616 d!161081))

(declare-fun d!161083 () Bool)

(assert (=> d!161083 (= (array_inv!38680 a!2792) (bvsge (size!49950 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131616 d!161083))

(declare-fun d!161085 () Bool)

(assert (=> d!161085 (= (validKeyInArray!0 (select (arr!49399 a!2792) j!64)) (and (not (= (select (arr!49399 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49399 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1541611 d!161085))

(declare-fun d!161087 () Bool)

(declare-fun res!1057080 () Bool)

(declare-fun e!857690 () Bool)

(assert (=> d!161087 (=> res!1057080 e!857690)))

(assert (=> d!161087 (= res!1057080 (bvsge #b00000000000000000000000000000000 (size!49950 a!2792)))))

(assert (=> d!161087 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35857) e!857690)))

(declare-fun bm!68748 () Bool)

(declare-fun call!68751 () Bool)

(declare-fun c!141871 () Bool)

(assert (=> bm!68748 (= call!68751 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141871 (Cons!35856 (select (arr!49399 a!2792) #b00000000000000000000000000000000) Nil!35857) Nil!35857)))))

(declare-fun b!1541680 () Bool)

(declare-fun e!857692 () Bool)

(assert (=> b!1541680 (= e!857690 e!857692)))

(declare-fun res!1057078 () Bool)

(assert (=> b!1541680 (=> (not res!1057078) (not e!857692))))

(declare-fun e!857691 () Bool)

(assert (=> b!1541680 (= res!1057078 (not e!857691))))

(declare-fun res!1057079 () Bool)

(assert (=> b!1541680 (=> (not res!1057079) (not e!857691))))

(assert (=> b!1541680 (= res!1057079 (validKeyInArray!0 (select (arr!49399 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1541681 () Bool)

(declare-fun e!857689 () Bool)

(assert (=> b!1541681 (= e!857692 e!857689)))

(assert (=> b!1541681 (= c!141871 (validKeyInArray!0 (select (arr!49399 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1541682 () Bool)

(assert (=> b!1541682 (= e!857689 call!68751)))

(declare-fun b!1541683 () Bool)

(assert (=> b!1541683 (= e!857689 call!68751)))

(declare-fun b!1541684 () Bool)

(declare-fun contains!10063 (List!35860 (_ BitVec 64)) Bool)

(assert (=> b!1541684 (= e!857691 (contains!10063 Nil!35857 (select (arr!49399 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!161087 (not res!1057080)) b!1541680))

(assert (= (and b!1541680 res!1057079) b!1541684))

(assert (= (and b!1541680 res!1057078) b!1541681))

(assert (= (and b!1541681 c!141871) b!1541682))

(assert (= (and b!1541681 (not c!141871)) b!1541683))

(assert (= (or b!1541682 b!1541683) bm!68748))

(declare-fun m!1423831 () Bool)

(assert (=> bm!68748 m!1423831))

(declare-fun m!1423833 () Bool)

(assert (=> bm!68748 m!1423833))

(assert (=> b!1541680 m!1423831))

(assert (=> b!1541680 m!1423831))

(declare-fun m!1423835 () Bool)

(assert (=> b!1541680 m!1423835))

(assert (=> b!1541681 m!1423831))

(assert (=> b!1541681 m!1423831))

(assert (=> b!1541681 m!1423835))

(assert (=> b!1541684 m!1423831))

(assert (=> b!1541684 m!1423831))

(declare-fun m!1423837 () Bool)

(assert (=> b!1541684 m!1423837))

(assert (=> b!1541612 d!161087))

(declare-fun b!1541719 () Bool)

(declare-fun c!141887 () Bool)

(declare-fun lt!665913 () (_ BitVec 64))

(assert (=> b!1541719 (= c!141887 (= lt!665913 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!857713 () SeekEntryResult!13420)

(declare-fun e!857714 () SeekEntryResult!13420)

(assert (=> b!1541719 (= e!857713 e!857714)))

(declare-fun b!1541720 () Bool)

(assert (=> b!1541720 (= e!857714 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 (bvadd x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (arr!49399 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1541721 () Bool)

(assert (=> b!1541721 (= e!857714 (MissingVacant!13420 vacantIndex!5))))

(declare-fun b!1541723 () Bool)

(declare-fun e!857715 () SeekEntryResult!13420)

(assert (=> b!1541723 (= e!857715 Undefined!13420)))

(declare-fun b!1541724 () Bool)

(assert (=> b!1541724 (= e!857715 e!857713)))

(declare-fun c!141888 () Bool)

(assert (=> b!1541724 (= c!141888 (= lt!665913 (select (arr!49399 a!2792) j!64)))))

(declare-fun b!1541722 () Bool)

(assert (=> b!1541722 (= e!857713 (Found!13420 index!463))))

(declare-fun lt!665914 () SeekEntryResult!13420)

(declare-fun d!161093 () Bool)

(get-info :version)

(assert (=> d!161093 (and (or ((_ is Undefined!13420) lt!665914) (not ((_ is Found!13420) lt!665914)) (and (bvsge (index!56076 lt!665914) #b00000000000000000000000000000000) (bvslt (index!56076 lt!665914) (size!49950 a!2792)))) (or ((_ is Undefined!13420) lt!665914) ((_ is Found!13420) lt!665914) (not ((_ is MissingVacant!13420) lt!665914)) (not (= (index!56078 lt!665914) vacantIndex!5)) (and (bvsge (index!56078 lt!665914) #b00000000000000000000000000000000) (bvslt (index!56078 lt!665914) (size!49950 a!2792)))) (or ((_ is Undefined!13420) lt!665914) (ite ((_ is Found!13420) lt!665914) (= (select (arr!49399 a!2792) (index!56076 lt!665914)) (select (arr!49399 a!2792) j!64)) (and ((_ is MissingVacant!13420) lt!665914) (= (index!56078 lt!665914) vacantIndex!5) (= (select (arr!49399 a!2792) (index!56078 lt!665914)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161093 (= lt!665914 e!857715)))

(declare-fun c!141886 () Bool)

(assert (=> d!161093 (= c!141886 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!161093 (= lt!665913 (select (arr!49399 a!2792) index!463))))

(assert (=> d!161093 (validMask!0 mask!2480)))

(assert (=> d!161093 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49399 a!2792) j!64) a!2792 mask!2480) lt!665914)))

(assert (= (and d!161093 c!141886) b!1541723))

(assert (= (and d!161093 (not c!141886)) b!1541724))

(assert (= (and b!1541724 c!141888) b!1541722))

(assert (= (and b!1541724 (not c!141888)) b!1541719))

(assert (= (and b!1541719 c!141887) b!1541721))

(assert (= (and b!1541719 (not c!141887)) b!1541720))

(declare-fun m!1423843 () Bool)

(assert (=> b!1541720 m!1423843))

(assert (=> b!1541720 m!1423843))

(assert (=> b!1541720 m!1423765))

(declare-fun m!1423845 () Bool)

(assert (=> b!1541720 m!1423845))

(declare-fun m!1423847 () Bool)

(assert (=> d!161093 m!1423847))

(declare-fun m!1423849 () Bool)

(assert (=> d!161093 m!1423849))

(assert (=> d!161093 m!1423777))

(assert (=> d!161093 m!1423773))

(assert (=> b!1541607 d!161093))

(declare-fun b!1541746 () Bool)

(declare-fun e!857732 () Bool)

(declare-fun call!68757 () Bool)

(assert (=> b!1541746 (= e!857732 call!68757)))

(declare-fun d!161107 () Bool)

(declare-fun res!1057097 () Bool)

(declare-fun e!857733 () Bool)

(assert (=> d!161107 (=> res!1057097 e!857733)))

(assert (=> d!161107 (= res!1057097 (bvsge #b00000000000000000000000000000000 (size!49950 a!2792)))))

(assert (=> d!161107 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!857733)))

(declare-fun b!1541747 () Bool)

(declare-fun e!857731 () Bool)

(assert (=> b!1541747 (= e!857731 call!68757)))

(declare-fun b!1541748 () Bool)

(assert (=> b!1541748 (= e!857733 e!857731)))

(declare-fun c!141895 () Bool)

(assert (=> b!1541748 (= c!141895 (validKeyInArray!0 (select (arr!49399 a!2792) #b00000000000000000000000000000000)))))

(declare-fun bm!68754 () Bool)

(assert (=> bm!68754 (= call!68757 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1541749 () Bool)

(assert (=> b!1541749 (= e!857731 e!857732)))

(declare-fun lt!665924 () (_ BitVec 64))

(assert (=> b!1541749 (= lt!665924 (select (arr!49399 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51337 0))(
  ( (Unit!51338) )
))
(declare-fun lt!665923 () Unit!51337)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102385 (_ BitVec 64) (_ BitVec 32)) Unit!51337)

(assert (=> b!1541749 (= lt!665923 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665924 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541749 (arrayContainsKey!0 a!2792 lt!665924 #b00000000000000000000000000000000)))

(declare-fun lt!665925 () Unit!51337)

(assert (=> b!1541749 (= lt!665925 lt!665923)))

(declare-fun res!1057096 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102385 (_ BitVec 32)) SeekEntryResult!13420)

(assert (=> b!1541749 (= res!1057096 (= (seekEntryOrOpen!0 (select (arr!49399 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13420 #b00000000000000000000000000000000)))))

(assert (=> b!1541749 (=> (not res!1057096) (not e!857732))))

(assert (= (and d!161107 (not res!1057097)) b!1541748))

(assert (= (and b!1541748 c!141895) b!1541749))

(assert (= (and b!1541748 (not c!141895)) b!1541747))

(assert (= (and b!1541749 res!1057096) b!1541746))

(assert (= (or b!1541746 b!1541747) bm!68754))

(assert (=> b!1541748 m!1423831))

(assert (=> b!1541748 m!1423831))

(assert (=> b!1541748 m!1423835))

(declare-fun m!1423867 () Bool)

(assert (=> bm!68754 m!1423867))

(assert (=> b!1541749 m!1423831))

(declare-fun m!1423869 () Bool)

(assert (=> b!1541749 m!1423869))

(declare-fun m!1423871 () Bool)

(assert (=> b!1541749 m!1423871))

(assert (=> b!1541749 m!1423831))

(declare-fun m!1423873 () Bool)

(assert (=> b!1541749 m!1423873))

(assert (=> b!1541613 d!161107))

(declare-fun d!161115 () Bool)

(assert (=> d!161115 (= (validKeyInArray!0 (select (arr!49399 a!2792) i!951)) (and (not (= (select (arr!49399 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49399 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1541609 d!161115))

(declare-fun d!161117 () Bool)

(declare-fun lt!665940 () (_ BitVec 32))

(assert (=> d!161117 (and (bvsge lt!665940 #b00000000000000000000000000000000) (bvslt lt!665940 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!161117 (= lt!665940 (choose!52 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(assert (=> d!161117 (validMask!0 mask!2480)))

(assert (=> d!161117 (= (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) lt!665940)))

(declare-fun bs!44209 () Bool)

(assert (= bs!44209 d!161117))

(declare-fun m!1423875 () Bool)

(assert (=> bs!44209 m!1423875))

(assert (=> bs!44209 m!1423773))

(assert (=> b!1541615 d!161117))

(check-sat (not b!1541749) (not d!161093) (not b!1541684) (not b!1541748) (not b!1541720) (not bm!68748) (not d!161117) (not b!1541681) (not b!1541680) (not bm!68754))
(check-sat)
