; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86326 () Bool)

(assert start!86326)

(declare-fun b!998664 () Bool)

(declare-fun res!668057 () Bool)

(declare-fun e!563315 () Bool)

(assert (=> b!998664 (=> (not res!668057) (not e!563315))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998664 (= res!668057 (validKeyInArray!0 k0!2224))))

(declare-fun b!998665 () Bool)

(declare-fun res!668054 () Bool)

(declare-fun e!563313 () Bool)

(assert (=> b!998665 (=> (not res!668054) (not e!563313))))

(declare-datatypes ((array!63150 0))(
  ( (array!63151 (arr!30400 (Array (_ BitVec 32) (_ BitVec 64))) (size!30903 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63150)

(declare-datatypes ((List!21047 0))(
  ( (Nil!21044) (Cons!21043 (h!22217 (_ BitVec 64)) (t!30040 List!21047)) )
))
(declare-fun arrayNoDuplicates!0 (array!63150 (_ BitVec 32) List!21047) Bool)

(assert (=> b!998665 (= res!668054 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21044))))

(declare-fun b!998666 () Bool)

(declare-fun res!668060 () Bool)

(declare-fun e!563316 () Bool)

(assert (=> b!998666 (=> (not res!668060) (not e!563316))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9268 0))(
  ( (MissingZero!9268 (index!39443 (_ BitVec 32))) (Found!9268 (index!39444 (_ BitVec 32))) (Intermediate!9268 (undefined!10080 Bool) (index!39445 (_ BitVec 32)) (x!87028 (_ BitVec 32))) (Undefined!9268) (MissingVacant!9268 (index!39446 (_ BitVec 32))) )
))
(declare-fun lt!441879 () SeekEntryResult!9268)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63150 (_ BitVec 32)) SeekEntryResult!9268)

(assert (=> b!998666 (= res!668060 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30400 a!3219) j!170) a!3219 mask!3464) lt!441879))))

(declare-fun b!998667 () Bool)

(declare-fun res!668055 () Bool)

(assert (=> b!998667 (=> (not res!668055) (not e!563315))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998667 (= res!668055 (and (= (size!30903 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30903 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30903 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!668062 () Bool)

(assert (=> start!86326 (=> (not res!668062) (not e!563315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86326 (= res!668062 (validMask!0 mask!3464))))

(assert (=> start!86326 e!563315))

(declare-fun array_inv!23536 (array!63150) Bool)

(assert (=> start!86326 (array_inv!23536 a!3219)))

(assert (=> start!86326 true))

(declare-fun b!998668 () Bool)

(declare-fun res!668053 () Bool)

(assert (=> b!998668 (=> (not res!668053) (not e!563313))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998668 (= res!668053 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30903 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30903 a!3219))))))

(declare-fun b!998669 () Bool)

(declare-fun lt!441880 () (_ BitVec 32))

(assert (=> b!998669 (= e!563316 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441880 #b00000000000000000000000000000000) (bvsge lt!441880 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun b!998670 () Bool)

(declare-fun res!668061 () Bool)

(assert (=> b!998670 (=> (not res!668061) (not e!563315))))

(assert (=> b!998670 (= res!668061 (validKeyInArray!0 (select (arr!30400 a!3219) j!170)))))

(declare-fun b!998671 () Bool)

(declare-fun res!668056 () Bool)

(assert (=> b!998671 (=> (not res!668056) (not e!563315))))

(declare-fun arrayContainsKey!0 (array!63150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998671 (= res!668056 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998672 () Bool)

(assert (=> b!998672 (= e!563315 e!563313)))

(declare-fun res!668058 () Bool)

(assert (=> b!998672 (=> (not res!668058) (not e!563313))))

(declare-fun lt!441881 () SeekEntryResult!9268)

(assert (=> b!998672 (= res!668058 (or (= lt!441881 (MissingVacant!9268 i!1194)) (= lt!441881 (MissingZero!9268 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63150 (_ BitVec 32)) SeekEntryResult!9268)

(assert (=> b!998672 (= lt!441881 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998673 () Bool)

(assert (=> b!998673 (= e!563313 e!563316)))

(declare-fun res!668059 () Bool)

(assert (=> b!998673 (=> (not res!668059) (not e!563316))))

(assert (=> b!998673 (= res!668059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441880 (select (arr!30400 a!3219) j!170) a!3219 mask!3464) lt!441879))))

(assert (=> b!998673 (= lt!441879 (Intermediate!9268 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998673 (= lt!441880 (toIndex!0 (select (arr!30400 a!3219) j!170) mask!3464))))

(declare-fun b!998674 () Bool)

(declare-fun res!668063 () Bool)

(assert (=> b!998674 (=> (not res!668063) (not e!563313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63150 (_ BitVec 32)) Bool)

(assert (=> b!998674 (= res!668063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86326 res!668062) b!998667))

(assert (= (and b!998667 res!668055) b!998670))

(assert (= (and b!998670 res!668061) b!998664))

(assert (= (and b!998664 res!668057) b!998671))

(assert (= (and b!998671 res!668056) b!998672))

(assert (= (and b!998672 res!668058) b!998674))

(assert (= (and b!998674 res!668063) b!998665))

(assert (= (and b!998665 res!668054) b!998668))

(assert (= (and b!998668 res!668053) b!998673))

(assert (= (and b!998673 res!668059) b!998666))

(assert (= (and b!998666 res!668060) b!998669))

(declare-fun m!925823 () Bool)

(assert (=> b!998664 m!925823))

(declare-fun m!925825 () Bool)

(assert (=> b!998672 m!925825))

(declare-fun m!925827 () Bool)

(assert (=> b!998665 m!925827))

(declare-fun m!925829 () Bool)

(assert (=> b!998670 m!925829))

(assert (=> b!998670 m!925829))

(declare-fun m!925831 () Bool)

(assert (=> b!998670 m!925831))

(declare-fun m!925833 () Bool)

(assert (=> b!998674 m!925833))

(assert (=> b!998673 m!925829))

(assert (=> b!998673 m!925829))

(declare-fun m!925835 () Bool)

(assert (=> b!998673 m!925835))

(assert (=> b!998673 m!925829))

(declare-fun m!925837 () Bool)

(assert (=> b!998673 m!925837))

(declare-fun m!925839 () Bool)

(assert (=> b!998671 m!925839))

(assert (=> b!998666 m!925829))

(assert (=> b!998666 m!925829))

(declare-fun m!925841 () Bool)

(assert (=> b!998666 m!925841))

(declare-fun m!925843 () Bool)

(assert (=> start!86326 m!925843))

(declare-fun m!925845 () Bool)

(assert (=> start!86326 m!925845))

(check-sat (not b!998671) (not b!998665) (not b!998673) (not b!998674) (not b!998672) (not b!998664) (not start!86326) (not b!998666) (not b!998670))
(check-sat)
(get-model)

(declare-fun b!998753 () Bool)

(declare-fun e!563349 () SeekEntryResult!9268)

(declare-fun e!563348 () SeekEntryResult!9268)

(assert (=> b!998753 (= e!563349 e!563348)))

(declare-fun lt!441908 () (_ BitVec 64))

(declare-fun lt!441906 () SeekEntryResult!9268)

(assert (=> b!998753 (= lt!441908 (select (arr!30400 a!3219) (index!39445 lt!441906)))))

(declare-fun c!101459 () Bool)

(assert (=> b!998753 (= c!101459 (= lt!441908 k0!2224))))

(declare-fun d!119455 () Bool)

(declare-fun lt!441907 () SeekEntryResult!9268)

(get-info :version)

(assert (=> d!119455 (and (or ((_ is Undefined!9268) lt!441907) (not ((_ is Found!9268) lt!441907)) (and (bvsge (index!39444 lt!441907) #b00000000000000000000000000000000) (bvslt (index!39444 lt!441907) (size!30903 a!3219)))) (or ((_ is Undefined!9268) lt!441907) ((_ is Found!9268) lt!441907) (not ((_ is MissingZero!9268) lt!441907)) (and (bvsge (index!39443 lt!441907) #b00000000000000000000000000000000) (bvslt (index!39443 lt!441907) (size!30903 a!3219)))) (or ((_ is Undefined!9268) lt!441907) ((_ is Found!9268) lt!441907) ((_ is MissingZero!9268) lt!441907) (not ((_ is MissingVacant!9268) lt!441907)) (and (bvsge (index!39446 lt!441907) #b00000000000000000000000000000000) (bvslt (index!39446 lt!441907) (size!30903 a!3219)))) (or ((_ is Undefined!9268) lt!441907) (ite ((_ is Found!9268) lt!441907) (= (select (arr!30400 a!3219) (index!39444 lt!441907)) k0!2224) (ite ((_ is MissingZero!9268) lt!441907) (= (select (arr!30400 a!3219) (index!39443 lt!441907)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9268) lt!441907) (= (select (arr!30400 a!3219) (index!39446 lt!441907)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119455 (= lt!441907 e!563349)))

(declare-fun c!101461 () Bool)

(assert (=> d!119455 (= c!101461 (and ((_ is Intermediate!9268) lt!441906) (undefined!10080 lt!441906)))))

(assert (=> d!119455 (= lt!441906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119455 (validMask!0 mask!3464)))

(assert (=> d!119455 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441907)))

(declare-fun b!998754 () Bool)

(assert (=> b!998754 (= e!563349 Undefined!9268)))

(declare-fun b!998755 () Bool)

(declare-fun c!101460 () Bool)

(assert (=> b!998755 (= c!101460 (= lt!441908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563347 () SeekEntryResult!9268)

(assert (=> b!998755 (= e!563348 e!563347)))

(declare-fun b!998756 () Bool)

(assert (=> b!998756 (= e!563347 (MissingZero!9268 (index!39445 lt!441906)))))

(declare-fun b!998757 () Bool)

(assert (=> b!998757 (= e!563348 (Found!9268 (index!39445 lt!441906)))))

(declare-fun b!998758 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63150 (_ BitVec 32)) SeekEntryResult!9268)

(assert (=> b!998758 (= e!563347 (seekKeyOrZeroReturnVacant!0 (x!87028 lt!441906) (index!39445 lt!441906) (index!39445 lt!441906) k0!2224 a!3219 mask!3464))))

(assert (= (and d!119455 c!101461) b!998754))

(assert (= (and d!119455 (not c!101461)) b!998753))

(assert (= (and b!998753 c!101459) b!998757))

(assert (= (and b!998753 (not c!101459)) b!998755))

(assert (= (and b!998755 c!101460) b!998756))

(assert (= (and b!998755 (not c!101460)) b!998758))

(declare-fun m!925895 () Bool)

(assert (=> b!998753 m!925895))

(declare-fun m!925897 () Bool)

(assert (=> d!119455 m!925897))

(declare-fun m!925899 () Bool)

(assert (=> d!119455 m!925899))

(declare-fun m!925901 () Bool)

(assert (=> d!119455 m!925901))

(declare-fun m!925903 () Bool)

(assert (=> d!119455 m!925903))

(assert (=> d!119455 m!925843))

(assert (=> d!119455 m!925897))

(declare-fun m!925905 () Bool)

(assert (=> d!119455 m!925905))

(declare-fun m!925907 () Bool)

(assert (=> b!998758 m!925907))

(assert (=> b!998672 d!119455))

(declare-fun e!563370 () SeekEntryResult!9268)

(declare-fun b!998783 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998783 (= e!563370 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30400 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998784 () Bool)

(declare-fun e!563369 () Bool)

(declare-fun e!563366 () Bool)

(assert (=> b!998784 (= e!563369 e!563366)))

(declare-fun res!668144 () Bool)

(declare-fun lt!441913 () SeekEntryResult!9268)

(assert (=> b!998784 (= res!668144 (and ((_ is Intermediate!9268) lt!441913) (not (undefined!10080 lt!441913)) (bvslt (x!87028 lt!441913) #b01111111111111111111111111111110) (bvsge (x!87028 lt!441913) #b00000000000000000000000000000000) (bvsge (x!87028 lt!441913) x!1245)))))

(assert (=> b!998784 (=> (not res!668144) (not e!563366))))

(declare-fun b!998785 () Bool)

(assert (=> b!998785 (= e!563370 (Intermediate!9268 false index!1507 x!1245))))

(declare-fun b!998787 () Bool)

(declare-fun e!563368 () SeekEntryResult!9268)

(assert (=> b!998787 (= e!563368 (Intermediate!9268 true index!1507 x!1245))))

(declare-fun d!119465 () Bool)

(assert (=> d!119465 e!563369))

(declare-fun c!101470 () Bool)

(assert (=> d!119465 (= c!101470 (and ((_ is Intermediate!9268) lt!441913) (undefined!10080 lt!441913)))))

(assert (=> d!119465 (= lt!441913 e!563368)))

(declare-fun c!101468 () Bool)

(assert (=> d!119465 (= c!101468 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441914 () (_ BitVec 64))

(assert (=> d!119465 (= lt!441914 (select (arr!30400 a!3219) index!1507))))

(assert (=> d!119465 (validMask!0 mask!3464)))

(assert (=> d!119465 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30400 a!3219) j!170) a!3219 mask!3464) lt!441913)))

(declare-fun b!998786 () Bool)

(assert (=> b!998786 (and (bvsge (index!39445 lt!441913) #b00000000000000000000000000000000) (bvslt (index!39445 lt!441913) (size!30903 a!3219)))))

(declare-fun res!668142 () Bool)

(assert (=> b!998786 (= res!668142 (= (select (arr!30400 a!3219) (index!39445 lt!441913)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563367 () Bool)

(assert (=> b!998786 (=> res!668142 e!563367)))

(declare-fun b!998788 () Bool)

(assert (=> b!998788 (and (bvsge (index!39445 lt!441913) #b00000000000000000000000000000000) (bvslt (index!39445 lt!441913) (size!30903 a!3219)))))

(declare-fun res!668143 () Bool)

(assert (=> b!998788 (= res!668143 (= (select (arr!30400 a!3219) (index!39445 lt!441913)) (select (arr!30400 a!3219) j!170)))))

(assert (=> b!998788 (=> res!668143 e!563367)))

(assert (=> b!998788 (= e!563366 e!563367)))

(declare-fun b!998789 () Bool)

(assert (=> b!998789 (= e!563368 e!563370)))

(declare-fun c!101469 () Bool)

(assert (=> b!998789 (= c!101469 (or (= lt!441914 (select (arr!30400 a!3219) j!170)) (= (bvadd lt!441914 lt!441914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998790 () Bool)

(assert (=> b!998790 (and (bvsge (index!39445 lt!441913) #b00000000000000000000000000000000) (bvslt (index!39445 lt!441913) (size!30903 a!3219)))))

(assert (=> b!998790 (= e!563367 (= (select (arr!30400 a!3219) (index!39445 lt!441913)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998791 () Bool)

(assert (=> b!998791 (= e!563369 (bvsge (x!87028 lt!441913) #b01111111111111111111111111111110))))

(assert (= (and d!119465 c!101468) b!998787))

(assert (= (and d!119465 (not c!101468)) b!998789))

(assert (= (and b!998789 c!101469) b!998785))

(assert (= (and b!998789 (not c!101469)) b!998783))

(assert (= (and d!119465 c!101470) b!998791))

(assert (= (and d!119465 (not c!101470)) b!998784))

(assert (= (and b!998784 res!668144) b!998788))

(assert (= (and b!998788 (not res!668143)) b!998786))

(assert (= (and b!998786 (not res!668142)) b!998790))

(declare-fun m!925913 () Bool)

(assert (=> b!998788 m!925913))

(declare-fun m!925915 () Bool)

(assert (=> d!119465 m!925915))

(assert (=> d!119465 m!925843))

(declare-fun m!925917 () Bool)

(assert (=> b!998783 m!925917))

(assert (=> b!998783 m!925917))

(assert (=> b!998783 m!925829))

(declare-fun m!925919 () Bool)

(assert (=> b!998783 m!925919))

(assert (=> b!998790 m!925913))

(assert (=> b!998786 m!925913))

(assert (=> b!998666 d!119465))

(declare-fun d!119473 () Bool)

(declare-fun res!668151 () Bool)

(declare-fun e!563383 () Bool)

(assert (=> d!119473 (=> res!668151 e!563383)))

(assert (=> d!119473 (= res!668151 (= (select (arr!30400 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119473 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!563383)))

(declare-fun b!998812 () Bool)

(declare-fun e!563384 () Bool)

(assert (=> b!998812 (= e!563383 e!563384)))

(declare-fun res!668152 () Bool)

(assert (=> b!998812 (=> (not res!668152) (not e!563384))))

(assert (=> b!998812 (= res!668152 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30903 a!3219)))))

(declare-fun b!998813 () Bool)

(assert (=> b!998813 (= e!563384 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119473 (not res!668151)) b!998812))

(assert (= (and b!998812 res!668152) b!998813))

(declare-fun m!925921 () Bool)

(assert (=> d!119473 m!925921))

(declare-fun m!925923 () Bool)

(assert (=> b!998813 m!925923))

(assert (=> b!998671 d!119473))

(declare-fun bm!42307 () Bool)

(declare-fun call!42310 () Bool)

(declare-fun c!101484 () Bool)

(assert (=> bm!42307 (= call!42310 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101484 (Cons!21043 (select (arr!30400 a!3219) #b00000000000000000000000000000000) Nil!21044) Nil!21044)))))

(declare-fun b!998834 () Bool)

(declare-fun e!563403 () Bool)

(declare-fun contains!5891 (List!21047 (_ BitVec 64)) Bool)

(assert (=> b!998834 (= e!563403 (contains!5891 Nil!21044 (select (arr!30400 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998836 () Bool)

(declare-fun e!563404 () Bool)

(declare-fun e!563406 () Bool)

(assert (=> b!998836 (= e!563404 e!563406)))

(declare-fun res!668163 () Bool)

(assert (=> b!998836 (=> (not res!668163) (not e!563406))))

(assert (=> b!998836 (= res!668163 (not e!563403))))

(declare-fun res!668164 () Bool)

(assert (=> b!998836 (=> (not res!668164) (not e!563403))))

(assert (=> b!998836 (= res!668164 (validKeyInArray!0 (select (arr!30400 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998838 () Bool)

(declare-fun e!563401 () Bool)

(assert (=> b!998838 (= e!563406 e!563401)))

(assert (=> b!998838 (= c!101484 (validKeyInArray!0 (select (arr!30400 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998840 () Bool)

(assert (=> b!998840 (= e!563401 call!42310)))

(declare-fun d!119475 () Bool)

(declare-fun res!668165 () Bool)

(assert (=> d!119475 (=> res!668165 e!563404)))

(assert (=> d!119475 (= res!668165 (bvsge #b00000000000000000000000000000000 (size!30903 a!3219)))))

(assert (=> d!119475 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21044) e!563404)))

(declare-fun b!998842 () Bool)

(assert (=> b!998842 (= e!563401 call!42310)))

(assert (= (and d!119475 (not res!668165)) b!998836))

(assert (= (and b!998836 res!668164) b!998834))

(assert (= (and b!998836 res!668163) b!998838))

(assert (= (and b!998838 c!101484) b!998840))

(assert (= (and b!998838 (not c!101484)) b!998842))

(assert (= (or b!998840 b!998842) bm!42307))

(assert (=> bm!42307 m!925921))

(declare-fun m!925935 () Bool)

(assert (=> bm!42307 m!925935))

(assert (=> b!998834 m!925921))

(assert (=> b!998834 m!925921))

(declare-fun m!925937 () Bool)

(assert (=> b!998834 m!925937))

(assert (=> b!998836 m!925921))

(assert (=> b!998836 m!925921))

(declare-fun m!925939 () Bool)

(assert (=> b!998836 m!925939))

(assert (=> b!998838 m!925921))

(assert (=> b!998838 m!925921))

(assert (=> b!998838 m!925939))

(assert (=> b!998665 d!119475))

(declare-fun d!119479 () Bool)

(assert (=> d!119479 (= (validKeyInArray!0 (select (arr!30400 a!3219) j!170)) (and (not (= (select (arr!30400 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30400 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998670 d!119479))

(declare-fun d!119483 () Bool)

(assert (=> d!119483 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998664 d!119483))

(declare-fun b!998857 () Bool)

(declare-fun e!563417 () Bool)

(declare-fun call!42313 () Bool)

(assert (=> b!998857 (= e!563417 call!42313)))

(declare-fun b!998858 () Bool)

(declare-fun e!563418 () Bool)

(assert (=> b!998858 (= e!563418 call!42313)))

(declare-fun d!119485 () Bool)

(declare-fun res!668172 () Bool)

(declare-fun e!563419 () Bool)

(assert (=> d!119485 (=> res!668172 e!563419)))

(assert (=> d!119485 (= res!668172 (bvsge #b00000000000000000000000000000000 (size!30903 a!3219)))))

(assert (=> d!119485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563419)))

(declare-fun b!998859 () Bool)

(assert (=> b!998859 (= e!563418 e!563417)))

(declare-fun lt!441941 () (_ BitVec 64))

(assert (=> b!998859 (= lt!441941 (select (arr!30400 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32965 0))(
  ( (Unit!32966) )
))
(declare-fun lt!441940 () Unit!32965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63150 (_ BitVec 64) (_ BitVec 32)) Unit!32965)

(assert (=> b!998859 (= lt!441940 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441941 #b00000000000000000000000000000000))))

(assert (=> b!998859 (arrayContainsKey!0 a!3219 lt!441941 #b00000000000000000000000000000000)))

(declare-fun lt!441939 () Unit!32965)

(assert (=> b!998859 (= lt!441939 lt!441940)))

(declare-fun res!668173 () Bool)

(assert (=> b!998859 (= res!668173 (= (seekEntryOrOpen!0 (select (arr!30400 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9268 #b00000000000000000000000000000000)))))

(assert (=> b!998859 (=> (not res!668173) (not e!563417))))

(declare-fun b!998860 () Bool)

(assert (=> b!998860 (= e!563419 e!563418)))

(declare-fun c!101490 () Bool)

(assert (=> b!998860 (= c!101490 (validKeyInArray!0 (select (arr!30400 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42310 () Bool)

(assert (=> bm!42310 (= call!42313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119485 (not res!668172)) b!998860))

(assert (= (and b!998860 c!101490) b!998859))

(assert (= (and b!998860 (not c!101490)) b!998858))

(assert (= (and b!998859 res!668173) b!998857))

(assert (= (or b!998857 b!998858) bm!42310))

(assert (=> b!998859 m!925921))

(declare-fun m!925955 () Bool)

(assert (=> b!998859 m!925955))

(declare-fun m!925957 () Bool)

(assert (=> b!998859 m!925957))

(assert (=> b!998859 m!925921))

(declare-fun m!925959 () Bool)

(assert (=> b!998859 m!925959))

(assert (=> b!998860 m!925921))

(assert (=> b!998860 m!925921))

(assert (=> b!998860 m!925939))

(declare-fun m!925961 () Bool)

(assert (=> bm!42310 m!925961))

(assert (=> b!998674 d!119485))

(declare-fun b!998863 () Bool)

(declare-fun e!563426 () SeekEntryResult!9268)

(assert (=> b!998863 (= e!563426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!441880 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30400 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998864 () Bool)

(declare-fun e!563425 () Bool)

(declare-fun e!563422 () Bool)

(assert (=> b!998864 (= e!563425 e!563422)))

(declare-fun res!668178 () Bool)

(declare-fun lt!441948 () SeekEntryResult!9268)

(assert (=> b!998864 (= res!668178 (and ((_ is Intermediate!9268) lt!441948) (not (undefined!10080 lt!441948)) (bvslt (x!87028 lt!441948) #b01111111111111111111111111111110) (bvsge (x!87028 lt!441948) #b00000000000000000000000000000000) (bvsge (x!87028 lt!441948) #b00000000000000000000000000000000)))))

(assert (=> b!998864 (=> (not res!668178) (not e!563422))))

(declare-fun b!998865 () Bool)

(assert (=> b!998865 (= e!563426 (Intermediate!9268 false lt!441880 #b00000000000000000000000000000000))))

(declare-fun b!998867 () Bool)

(declare-fun e!563424 () SeekEntryResult!9268)

(assert (=> b!998867 (= e!563424 (Intermediate!9268 true lt!441880 #b00000000000000000000000000000000))))

(declare-fun d!119487 () Bool)

(assert (=> d!119487 e!563425))

(declare-fun c!101493 () Bool)

(assert (=> d!119487 (= c!101493 (and ((_ is Intermediate!9268) lt!441948) (undefined!10080 lt!441948)))))

(assert (=> d!119487 (= lt!441948 e!563424)))

(declare-fun c!101491 () Bool)

(assert (=> d!119487 (= c!101491 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441949 () (_ BitVec 64))

(assert (=> d!119487 (= lt!441949 (select (arr!30400 a!3219) lt!441880))))

(assert (=> d!119487 (validMask!0 mask!3464)))

(assert (=> d!119487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441880 (select (arr!30400 a!3219) j!170) a!3219 mask!3464) lt!441948)))

(declare-fun b!998866 () Bool)

(assert (=> b!998866 (and (bvsge (index!39445 lt!441948) #b00000000000000000000000000000000) (bvslt (index!39445 lt!441948) (size!30903 a!3219)))))

(declare-fun res!668176 () Bool)

(assert (=> b!998866 (= res!668176 (= (select (arr!30400 a!3219) (index!39445 lt!441948)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563423 () Bool)

(assert (=> b!998866 (=> res!668176 e!563423)))

(declare-fun b!998868 () Bool)

(assert (=> b!998868 (and (bvsge (index!39445 lt!441948) #b00000000000000000000000000000000) (bvslt (index!39445 lt!441948) (size!30903 a!3219)))))

(declare-fun res!668177 () Bool)

(assert (=> b!998868 (= res!668177 (= (select (arr!30400 a!3219) (index!39445 lt!441948)) (select (arr!30400 a!3219) j!170)))))

(assert (=> b!998868 (=> res!668177 e!563423)))

(assert (=> b!998868 (= e!563422 e!563423)))

(declare-fun b!998869 () Bool)

(assert (=> b!998869 (= e!563424 e!563426)))

(declare-fun c!101492 () Bool)

(assert (=> b!998869 (= c!101492 (or (= lt!441949 (select (arr!30400 a!3219) j!170)) (= (bvadd lt!441949 lt!441949) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998870 () Bool)

(assert (=> b!998870 (and (bvsge (index!39445 lt!441948) #b00000000000000000000000000000000) (bvslt (index!39445 lt!441948) (size!30903 a!3219)))))

(assert (=> b!998870 (= e!563423 (= (select (arr!30400 a!3219) (index!39445 lt!441948)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998871 () Bool)

(assert (=> b!998871 (= e!563425 (bvsge (x!87028 lt!441948) #b01111111111111111111111111111110))))

(assert (= (and d!119487 c!101491) b!998867))

(assert (= (and d!119487 (not c!101491)) b!998869))

(assert (= (and b!998869 c!101492) b!998865))

(assert (= (and b!998869 (not c!101492)) b!998863))

(assert (= (and d!119487 c!101493) b!998871))

(assert (= (and d!119487 (not c!101493)) b!998864))

(assert (= (and b!998864 res!668178) b!998868))

(assert (= (and b!998868 (not res!668177)) b!998866))

(assert (= (and b!998866 (not res!668176)) b!998870))

(declare-fun m!925963 () Bool)

(assert (=> b!998868 m!925963))

(declare-fun m!925965 () Bool)

(assert (=> d!119487 m!925965))

(assert (=> d!119487 m!925843))

(declare-fun m!925967 () Bool)

(assert (=> b!998863 m!925967))

(assert (=> b!998863 m!925967))

(assert (=> b!998863 m!925829))

(declare-fun m!925969 () Bool)

(assert (=> b!998863 m!925969))

(assert (=> b!998870 m!925963))

(assert (=> b!998866 m!925963))

(assert (=> b!998673 d!119487))

(declare-fun d!119489 () Bool)

(declare-fun lt!441958 () (_ BitVec 32))

(declare-fun lt!441957 () (_ BitVec 32))

(assert (=> d!119489 (= lt!441958 (bvmul (bvxor lt!441957 (bvlshr lt!441957 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119489 (= lt!441957 ((_ extract 31 0) (bvand (bvxor (select (arr!30400 a!3219) j!170) (bvlshr (select (arr!30400 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119489 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668179 (let ((h!22220 ((_ extract 31 0) (bvand (bvxor (select (arr!30400 a!3219) j!170) (bvlshr (select (arr!30400 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87032 (bvmul (bvxor h!22220 (bvlshr h!22220 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87032 (bvlshr x!87032 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668179 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668179 #b00000000000000000000000000000000))))))

(assert (=> d!119489 (= (toIndex!0 (select (arr!30400 a!3219) j!170) mask!3464) (bvand (bvxor lt!441958 (bvlshr lt!441958 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!998673 d!119489))

(declare-fun d!119493 () Bool)

(assert (=> d!119493 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86326 d!119493))

(declare-fun d!119497 () Bool)

(assert (=> d!119497 (= (array_inv!23536 a!3219) (bvsge (size!30903 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86326 d!119497))

(check-sat (not d!119465) (not b!998863) (not b!998813) (not b!998860) (not b!998834) (not d!119487) (not bm!42310) (not b!998836) (not bm!42307) (not b!998859) (not d!119455) (not b!998838) (not b!998758) (not b!998783))
(check-sat)
