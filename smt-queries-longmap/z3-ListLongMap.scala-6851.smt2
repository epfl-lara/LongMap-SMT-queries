; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86482 () Bool)

(assert start!86482)

(declare-fun b!999960 () Bool)

(declare-fun e!563921 () Bool)

(declare-fun e!563922 () Bool)

(assert (=> b!999960 (= e!563921 e!563922)))

(declare-fun res!669041 () Bool)

(assert (=> b!999960 (=> (not res!669041) (not e!563922))))

(declare-datatypes ((SeekEntryResult!9292 0))(
  ( (MissingZero!9292 (index!39539 (_ BitVec 32))) (Found!9292 (index!39540 (_ BitVec 32))) (Intermediate!9292 (undefined!10104 Bool) (index!39541 (_ BitVec 32)) (x!87128 (_ BitVec 32))) (Undefined!9292) (MissingVacant!9292 (index!39542 (_ BitVec 32))) )
))
(declare-fun lt!442252 () SeekEntryResult!9292)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999960 (= res!669041 (or (= lt!442252 (MissingVacant!9292 i!1194)) (= lt!442252 (MissingZero!9292 i!1194))))))

(declare-datatypes ((array!63204 0))(
  ( (array!63205 (arr!30424 (Array (_ BitVec 32) (_ BitVec 64))) (size!30927 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63204)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63204 (_ BitVec 32)) SeekEntryResult!9292)

(assert (=> b!999960 (= lt!442252 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!669031 () Bool)

(assert (=> start!86482 (=> (not res!669031) (not e!563921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86482 (= res!669031 (validMask!0 mask!3464))))

(assert (=> start!86482 e!563921))

(declare-fun array_inv!23560 (array!63204) Bool)

(assert (=> start!86482 (array_inv!23560 a!3219)))

(assert (=> start!86482 true))

(declare-fun b!999961 () Bool)

(declare-fun res!669033 () Bool)

(assert (=> b!999961 (=> (not res!669033) (not e!563921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999961 (= res!669033 (validKeyInArray!0 k0!2224))))

(declare-fun b!999962 () Bool)

(declare-fun e!563920 () Bool)

(declare-fun lt!442251 () (_ BitVec 32))

(assert (=> b!999962 (= e!563920 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!442251 #b00000000000000000000000000000000) (bvsge lt!442251 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999962 (= lt!442251 (toIndex!0 (select (store (arr!30424 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!999963 () Bool)

(assert (=> b!999963 (= e!563922 e!563920)))

(declare-fun res!669037 () Bool)

(assert (=> b!999963 (=> (not res!669037) (not e!563920))))

(declare-fun lt!442253 () SeekEntryResult!9292)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63204 (_ BitVec 32)) SeekEntryResult!9292)

(assert (=> b!999963 (= res!669037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30424 a!3219) j!170) mask!3464) (select (arr!30424 a!3219) j!170) a!3219 mask!3464) lt!442253))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999963 (= lt!442253 (Intermediate!9292 false resIndex!38 resX!38))))

(declare-fun b!999964 () Bool)

(declare-fun res!669035 () Bool)

(assert (=> b!999964 (=> (not res!669035) (not e!563922))))

(declare-datatypes ((List!21071 0))(
  ( (Nil!21068) (Cons!21067 (h!22247 (_ BitVec 64)) (t!30064 List!21071)) )
))
(declare-fun arrayNoDuplicates!0 (array!63204 (_ BitVec 32) List!21071) Bool)

(assert (=> b!999964 (= res!669035 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21068))))

(declare-fun b!999965 () Bool)

(declare-fun res!669038 () Bool)

(assert (=> b!999965 (=> (not res!669038) (not e!563922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63204 (_ BitVec 32)) Bool)

(assert (=> b!999965 (= res!669038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999966 () Bool)

(declare-fun res!669032 () Bool)

(assert (=> b!999966 (=> (not res!669032) (not e!563920))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999966 (= res!669032 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30424 a!3219) j!170) a!3219 mask!3464) lt!442253))))

(declare-fun b!999967 () Bool)

(declare-fun res!669034 () Bool)

(assert (=> b!999967 (=> (not res!669034) (not e!563922))))

(assert (=> b!999967 (= res!669034 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30927 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30927 a!3219))))))

(declare-fun b!999968 () Bool)

(declare-fun res!669040 () Bool)

(assert (=> b!999968 (=> (not res!669040) (not e!563921))))

(declare-fun arrayContainsKey!0 (array!63204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999968 (= res!669040 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999969 () Bool)

(declare-fun res!669036 () Bool)

(assert (=> b!999969 (=> (not res!669036) (not e!563921))))

(assert (=> b!999969 (= res!669036 (and (= (size!30927 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30927 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30927 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999970 () Bool)

(declare-fun res!669039 () Bool)

(assert (=> b!999970 (=> (not res!669039) (not e!563921))))

(assert (=> b!999970 (= res!669039 (validKeyInArray!0 (select (arr!30424 a!3219) j!170)))))

(assert (= (and start!86482 res!669031) b!999969))

(assert (= (and b!999969 res!669036) b!999970))

(assert (= (and b!999970 res!669039) b!999961))

(assert (= (and b!999961 res!669033) b!999968))

(assert (= (and b!999968 res!669040) b!999960))

(assert (= (and b!999960 res!669041) b!999965))

(assert (= (and b!999965 res!669038) b!999964))

(assert (= (and b!999964 res!669035) b!999967))

(assert (= (and b!999967 res!669034) b!999963))

(assert (= (and b!999963 res!669037) b!999966))

(assert (= (and b!999966 res!669032) b!999962))

(declare-fun m!926741 () Bool)

(assert (=> b!999965 m!926741))

(declare-fun m!926743 () Bool)

(assert (=> start!86482 m!926743))

(declare-fun m!926745 () Bool)

(assert (=> start!86482 m!926745))

(declare-fun m!926747 () Bool)

(assert (=> b!999960 m!926747))

(declare-fun m!926749 () Bool)

(assert (=> b!999961 m!926749))

(declare-fun m!926751 () Bool)

(assert (=> b!999966 m!926751))

(assert (=> b!999966 m!926751))

(declare-fun m!926753 () Bool)

(assert (=> b!999966 m!926753))

(declare-fun m!926755 () Bool)

(assert (=> b!999964 m!926755))

(assert (=> b!999963 m!926751))

(assert (=> b!999963 m!926751))

(declare-fun m!926757 () Bool)

(assert (=> b!999963 m!926757))

(assert (=> b!999963 m!926757))

(assert (=> b!999963 m!926751))

(declare-fun m!926759 () Bool)

(assert (=> b!999963 m!926759))

(assert (=> b!999970 m!926751))

(assert (=> b!999970 m!926751))

(declare-fun m!926761 () Bool)

(assert (=> b!999970 m!926761))

(declare-fun m!926763 () Bool)

(assert (=> b!999962 m!926763))

(declare-fun m!926765 () Bool)

(assert (=> b!999962 m!926765))

(assert (=> b!999962 m!926765))

(declare-fun m!926767 () Bool)

(assert (=> b!999962 m!926767))

(declare-fun m!926769 () Bool)

(assert (=> b!999968 m!926769))

(check-sat (not b!999964) (not b!999968) (not b!999970) (not b!999963) (not b!999965) (not b!999960) (not start!86482) (not b!999962) (not b!999961) (not b!999966))
(check-sat)
(get-model)

(declare-fun b!1000055 () Bool)

(declare-fun e!563959 () SeekEntryResult!9292)

(declare-fun lt!442278 () SeekEntryResult!9292)

(assert (=> b!1000055 (= e!563959 (Found!9292 (index!39541 lt!442278)))))

(declare-fun b!1000056 () Bool)

(declare-fun e!563961 () SeekEntryResult!9292)

(assert (=> b!1000056 (= e!563961 Undefined!9292)))

(declare-fun b!1000057 () Bool)

(declare-fun c!101622 () Bool)

(declare-fun lt!442280 () (_ BitVec 64))

(assert (=> b!1000057 (= c!101622 (= lt!442280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563960 () SeekEntryResult!9292)

(assert (=> b!1000057 (= e!563959 e!563960)))

(declare-fun d!119603 () Bool)

(declare-fun lt!442279 () SeekEntryResult!9292)

(get-info :version)

(assert (=> d!119603 (and (or ((_ is Undefined!9292) lt!442279) (not ((_ is Found!9292) lt!442279)) (and (bvsge (index!39540 lt!442279) #b00000000000000000000000000000000) (bvslt (index!39540 lt!442279) (size!30927 a!3219)))) (or ((_ is Undefined!9292) lt!442279) ((_ is Found!9292) lt!442279) (not ((_ is MissingZero!9292) lt!442279)) (and (bvsge (index!39539 lt!442279) #b00000000000000000000000000000000) (bvslt (index!39539 lt!442279) (size!30927 a!3219)))) (or ((_ is Undefined!9292) lt!442279) ((_ is Found!9292) lt!442279) ((_ is MissingZero!9292) lt!442279) (not ((_ is MissingVacant!9292) lt!442279)) (and (bvsge (index!39542 lt!442279) #b00000000000000000000000000000000) (bvslt (index!39542 lt!442279) (size!30927 a!3219)))) (or ((_ is Undefined!9292) lt!442279) (ite ((_ is Found!9292) lt!442279) (= (select (arr!30424 a!3219) (index!39540 lt!442279)) k0!2224) (ite ((_ is MissingZero!9292) lt!442279) (= (select (arr!30424 a!3219) (index!39539 lt!442279)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9292) lt!442279) (= (select (arr!30424 a!3219) (index!39542 lt!442279)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119603 (= lt!442279 e!563961)))

(declare-fun c!101621 () Bool)

(assert (=> d!119603 (= c!101621 (and ((_ is Intermediate!9292) lt!442278) (undefined!10104 lt!442278)))))

(assert (=> d!119603 (= lt!442278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119603 (validMask!0 mask!3464)))

(assert (=> d!119603 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!442279)))

(declare-fun b!1000058 () Bool)

(assert (=> b!1000058 (= e!563960 (MissingZero!9292 (index!39541 lt!442278)))))

(declare-fun b!1000059 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63204 (_ BitVec 32)) SeekEntryResult!9292)

(assert (=> b!1000059 (= e!563960 (seekKeyOrZeroReturnVacant!0 (x!87128 lt!442278) (index!39541 lt!442278) (index!39541 lt!442278) k0!2224 a!3219 mask!3464))))

(declare-fun b!1000060 () Bool)

(assert (=> b!1000060 (= e!563961 e!563959)))

(assert (=> b!1000060 (= lt!442280 (select (arr!30424 a!3219) (index!39541 lt!442278)))))

(declare-fun c!101623 () Bool)

(assert (=> b!1000060 (= c!101623 (= lt!442280 k0!2224))))

(assert (= (and d!119603 c!101621) b!1000056))

(assert (= (and d!119603 (not c!101621)) b!1000060))

(assert (= (and b!1000060 c!101623) b!1000055))

(assert (= (and b!1000060 (not c!101623)) b!1000057))

(assert (= (and b!1000057 c!101622) b!1000058))

(assert (= (and b!1000057 (not c!101622)) b!1000059))

(assert (=> d!119603 m!926743))

(declare-fun m!926835 () Bool)

(assert (=> d!119603 m!926835))

(declare-fun m!926837 () Bool)

(assert (=> d!119603 m!926837))

(declare-fun m!926839 () Bool)

(assert (=> d!119603 m!926839))

(assert (=> d!119603 m!926837))

(declare-fun m!926841 () Bool)

(assert (=> d!119603 m!926841))

(declare-fun m!926843 () Bool)

(assert (=> d!119603 m!926843))

(declare-fun m!926845 () Bool)

(assert (=> b!1000059 m!926845))

(declare-fun m!926847 () Bool)

(assert (=> b!1000060 m!926847))

(assert (=> b!999960 d!119603))

(declare-fun b!1000069 () Bool)

(declare-fun e!563970 () Bool)

(declare-fun call!42343 () Bool)

(assert (=> b!1000069 (= e!563970 call!42343)))

(declare-fun b!1000070 () Bool)

(declare-fun e!563969 () Bool)

(assert (=> b!1000070 (= e!563969 e!563970)))

(declare-fun lt!442293 () (_ BitVec 64))

(assert (=> b!1000070 (= lt!442293 (select (arr!30424 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32975 0))(
  ( (Unit!32976) )
))
(declare-fun lt!442291 () Unit!32975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63204 (_ BitVec 64) (_ BitVec 32)) Unit!32975)

(assert (=> b!1000070 (= lt!442291 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!442293 #b00000000000000000000000000000000))))

(assert (=> b!1000070 (arrayContainsKey!0 a!3219 lt!442293 #b00000000000000000000000000000000)))

(declare-fun lt!442292 () Unit!32975)

(assert (=> b!1000070 (= lt!442292 lt!442291)))

(declare-fun res!669118 () Bool)

(assert (=> b!1000070 (= res!669118 (= (seekEntryOrOpen!0 (select (arr!30424 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9292 #b00000000000000000000000000000000)))))

(assert (=> b!1000070 (=> (not res!669118) (not e!563970))))

(declare-fun d!119611 () Bool)

(declare-fun res!669119 () Bool)

(declare-fun e!563968 () Bool)

(assert (=> d!119611 (=> res!669119 e!563968)))

(assert (=> d!119611 (= res!669119 (bvsge #b00000000000000000000000000000000 (size!30927 a!3219)))))

(assert (=> d!119611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563968)))

(declare-fun b!1000071 () Bool)

(assert (=> b!1000071 (= e!563969 call!42343)))

(declare-fun b!1000072 () Bool)

(assert (=> b!1000072 (= e!563968 e!563969)))

(declare-fun c!101626 () Bool)

(assert (=> b!1000072 (= c!101626 (validKeyInArray!0 (select (arr!30424 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42340 () Bool)

(assert (=> bm!42340 (= call!42343 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119611 (not res!669119)) b!1000072))

(assert (= (and b!1000072 c!101626) b!1000070))

(assert (= (and b!1000072 (not c!101626)) b!1000071))

(assert (= (and b!1000070 res!669118) b!1000069))

(assert (= (or b!1000069 b!1000071) bm!42340))

(declare-fun m!926849 () Bool)

(assert (=> b!1000070 m!926849))

(declare-fun m!926851 () Bool)

(assert (=> b!1000070 m!926851))

(declare-fun m!926853 () Bool)

(assert (=> b!1000070 m!926853))

(assert (=> b!1000070 m!926849))

(declare-fun m!926855 () Bool)

(assert (=> b!1000070 m!926855))

(assert (=> b!1000072 m!926849))

(assert (=> b!1000072 m!926849))

(declare-fun m!926857 () Bool)

(assert (=> b!1000072 m!926857))

(declare-fun m!926859 () Bool)

(assert (=> bm!42340 m!926859))

(assert (=> b!999965 d!119611))

(declare-fun b!1000136 () Bool)

(declare-fun e!564009 () Bool)

(declare-fun lt!442316 () SeekEntryResult!9292)

(assert (=> b!1000136 (= e!564009 (bvsge (x!87128 lt!442316) #b01111111111111111111111111111110))))

(declare-fun b!1000137 () Bool)

(declare-fun e!564008 () SeekEntryResult!9292)

(assert (=> b!1000137 (= e!564008 (Intermediate!9292 false index!1507 x!1245))))

(declare-fun b!1000138 () Bool)

(assert (=> b!1000138 (and (bvsge (index!39541 lt!442316) #b00000000000000000000000000000000) (bvslt (index!39541 lt!442316) (size!30927 a!3219)))))

(declare-fun e!564007 () Bool)

(assert (=> b!1000138 (= e!564007 (= (select (arr!30424 a!3219) (index!39541 lt!442316)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119617 () Bool)

(assert (=> d!119617 e!564009))

(declare-fun c!101653 () Bool)

(assert (=> d!119617 (= c!101653 (and ((_ is Intermediate!9292) lt!442316) (undefined!10104 lt!442316)))))

(declare-fun e!564005 () SeekEntryResult!9292)

(assert (=> d!119617 (= lt!442316 e!564005)))

(declare-fun c!101652 () Bool)

(assert (=> d!119617 (= c!101652 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!442315 () (_ BitVec 64))

(assert (=> d!119617 (= lt!442315 (select (arr!30424 a!3219) index!1507))))

(assert (=> d!119617 (validMask!0 mask!3464)))

(assert (=> d!119617 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30424 a!3219) j!170) a!3219 mask!3464) lt!442316)))

(declare-fun b!1000139 () Bool)

(declare-fun e!564006 () Bool)

(assert (=> b!1000139 (= e!564009 e!564006)))

(declare-fun res!669137 () Bool)

(assert (=> b!1000139 (= res!669137 (and ((_ is Intermediate!9292) lt!442316) (not (undefined!10104 lt!442316)) (bvslt (x!87128 lt!442316) #b01111111111111111111111111111110) (bvsge (x!87128 lt!442316) #b00000000000000000000000000000000) (bvsge (x!87128 lt!442316) x!1245)))))

(assert (=> b!1000139 (=> (not res!669137) (not e!564006))))

(declare-fun b!1000140 () Bool)

(assert (=> b!1000140 (and (bvsge (index!39541 lt!442316) #b00000000000000000000000000000000) (bvslt (index!39541 lt!442316) (size!30927 a!3219)))))

(declare-fun res!669136 () Bool)

(assert (=> b!1000140 (= res!669136 (= (select (arr!30424 a!3219) (index!39541 lt!442316)) (select (arr!30424 a!3219) j!170)))))

(assert (=> b!1000140 (=> res!669136 e!564007)))

(assert (=> b!1000140 (= e!564006 e!564007)))

(declare-fun b!1000141 () Bool)

(assert (=> b!1000141 (and (bvsge (index!39541 lt!442316) #b00000000000000000000000000000000) (bvslt (index!39541 lt!442316) (size!30927 a!3219)))))

(declare-fun res!669138 () Bool)

(assert (=> b!1000141 (= res!669138 (= (select (arr!30424 a!3219) (index!39541 lt!442316)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1000141 (=> res!669138 e!564007)))

(declare-fun b!1000142 () Bool)

(assert (=> b!1000142 (= e!564005 (Intermediate!9292 true index!1507 x!1245))))

(declare-fun b!1000143 () Bool)

(assert (=> b!1000143 (= e!564005 e!564008)))

(declare-fun c!101651 () Bool)

(assert (=> b!1000143 (= c!101651 (or (= lt!442315 (select (arr!30424 a!3219) j!170)) (= (bvadd lt!442315 lt!442315) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1000144 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000144 (= e!564008 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30424 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119617 c!101652) b!1000142))

(assert (= (and d!119617 (not c!101652)) b!1000143))

(assert (= (and b!1000143 c!101651) b!1000137))

(assert (= (and b!1000143 (not c!101651)) b!1000144))

(assert (= (and d!119617 c!101653) b!1000136))

(assert (= (and d!119617 (not c!101653)) b!1000139))

(assert (= (and b!1000139 res!669137) b!1000140))

(assert (= (and b!1000140 (not res!669136)) b!1000141))

(assert (= (and b!1000141 (not res!669138)) b!1000138))

(declare-fun m!926883 () Bool)

(assert (=> b!1000140 m!926883))

(assert (=> b!1000138 m!926883))

(declare-fun m!926885 () Bool)

(assert (=> d!119617 m!926885))

(assert (=> d!119617 m!926743))

(declare-fun m!926887 () Bool)

(assert (=> b!1000144 m!926887))

(assert (=> b!1000144 m!926887))

(assert (=> b!1000144 m!926751))

(declare-fun m!926889 () Bool)

(assert (=> b!1000144 m!926889))

(assert (=> b!1000141 m!926883))

(assert (=> b!999966 d!119617))

(declare-fun d!119625 () Bool)

(assert (=> d!119625 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999961 d!119625))

(declare-fun d!119627 () Bool)

(declare-fun lt!442328 () (_ BitVec 32))

(declare-fun lt!442327 () (_ BitVec 32))

(assert (=> d!119627 (= lt!442328 (bvmul (bvxor lt!442327 (bvlshr lt!442327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119627 (= lt!442327 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30424 a!3219) i!1194 k0!2224) j!170) (bvlshr (select (store (arr!30424 a!3219) i!1194 k0!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119627 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!669143 (let ((h!22251 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30424 a!3219) i!1194 k0!2224) j!170) (bvlshr (select (store (arr!30424 a!3219) i!1194 k0!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87134 (bvmul (bvxor h!22251 (bvlshr h!22251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87134 (bvlshr x!87134 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!669143 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!669143 #b00000000000000000000000000000000))))))

(assert (=> d!119627 (= (toIndex!0 (select (store (arr!30424 a!3219) i!1194 k0!2224) j!170) mask!3464) (bvand (bvxor lt!442328 (bvlshr lt!442328 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999962 d!119627))

(declare-fun d!119631 () Bool)

(declare-fun res!669150 () Bool)

(declare-fun e!564026 () Bool)

(assert (=> d!119631 (=> res!669150 e!564026)))

(assert (=> d!119631 (= res!669150 (= (select (arr!30424 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119631 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!564026)))

(declare-fun b!1000167 () Bool)

(declare-fun e!564027 () Bool)

(assert (=> b!1000167 (= e!564026 e!564027)))

(declare-fun res!669151 () Bool)

(assert (=> b!1000167 (=> (not res!669151) (not e!564027))))

(assert (=> b!1000167 (= res!669151 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30927 a!3219)))))

(declare-fun b!1000168 () Bool)

(assert (=> b!1000168 (= e!564027 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119631 (not res!669150)) b!1000167))

(assert (= (and b!1000167 res!669151) b!1000168))

(assert (=> d!119631 m!926849))

(declare-fun m!926895 () Bool)

(assert (=> b!1000168 m!926895))

(assert (=> b!999968 d!119631))

(declare-fun b!1000169 () Bool)

(declare-fun e!564032 () Bool)

(declare-fun lt!442330 () SeekEntryResult!9292)

(assert (=> b!1000169 (= e!564032 (bvsge (x!87128 lt!442330) #b01111111111111111111111111111110))))

(declare-fun e!564031 () SeekEntryResult!9292)

(declare-fun b!1000170 () Bool)

(assert (=> b!1000170 (= e!564031 (Intermediate!9292 false (toIndex!0 (select (arr!30424 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1000171 () Bool)

(assert (=> b!1000171 (and (bvsge (index!39541 lt!442330) #b00000000000000000000000000000000) (bvslt (index!39541 lt!442330) (size!30927 a!3219)))))

(declare-fun e!564030 () Bool)

(assert (=> b!1000171 (= e!564030 (= (select (arr!30424 a!3219) (index!39541 lt!442330)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119633 () Bool)

(assert (=> d!119633 e!564032))

(declare-fun c!101662 () Bool)

(assert (=> d!119633 (= c!101662 (and ((_ is Intermediate!9292) lt!442330) (undefined!10104 lt!442330)))))

(declare-fun e!564028 () SeekEntryResult!9292)

(assert (=> d!119633 (= lt!442330 e!564028)))

(declare-fun c!101661 () Bool)

(assert (=> d!119633 (= c!101661 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!442329 () (_ BitVec 64))

(assert (=> d!119633 (= lt!442329 (select (arr!30424 a!3219) (toIndex!0 (select (arr!30424 a!3219) j!170) mask!3464)))))

(assert (=> d!119633 (validMask!0 mask!3464)))

(assert (=> d!119633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30424 a!3219) j!170) mask!3464) (select (arr!30424 a!3219) j!170) a!3219 mask!3464) lt!442330)))

(declare-fun b!1000172 () Bool)

(declare-fun e!564029 () Bool)

(assert (=> b!1000172 (= e!564032 e!564029)))

(declare-fun res!669153 () Bool)

(assert (=> b!1000172 (= res!669153 (and ((_ is Intermediate!9292) lt!442330) (not (undefined!10104 lt!442330)) (bvslt (x!87128 lt!442330) #b01111111111111111111111111111110) (bvsge (x!87128 lt!442330) #b00000000000000000000000000000000) (bvsge (x!87128 lt!442330) #b00000000000000000000000000000000)))))

(assert (=> b!1000172 (=> (not res!669153) (not e!564029))))

(declare-fun b!1000173 () Bool)

(assert (=> b!1000173 (and (bvsge (index!39541 lt!442330) #b00000000000000000000000000000000) (bvslt (index!39541 lt!442330) (size!30927 a!3219)))))

(declare-fun res!669152 () Bool)

(assert (=> b!1000173 (= res!669152 (= (select (arr!30424 a!3219) (index!39541 lt!442330)) (select (arr!30424 a!3219) j!170)))))

(assert (=> b!1000173 (=> res!669152 e!564030)))

(assert (=> b!1000173 (= e!564029 e!564030)))

(declare-fun b!1000174 () Bool)

(assert (=> b!1000174 (and (bvsge (index!39541 lt!442330) #b00000000000000000000000000000000) (bvslt (index!39541 lt!442330) (size!30927 a!3219)))))

(declare-fun res!669154 () Bool)

(assert (=> b!1000174 (= res!669154 (= (select (arr!30424 a!3219) (index!39541 lt!442330)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1000174 (=> res!669154 e!564030)))

(declare-fun b!1000175 () Bool)

(assert (=> b!1000175 (= e!564028 (Intermediate!9292 true (toIndex!0 (select (arr!30424 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1000176 () Bool)

(assert (=> b!1000176 (= e!564028 e!564031)))

(declare-fun c!101660 () Bool)

(assert (=> b!1000176 (= c!101660 (or (= lt!442329 (select (arr!30424 a!3219) j!170)) (= (bvadd lt!442329 lt!442329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1000177 () Bool)

(assert (=> b!1000177 (= e!564031 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30424 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30424 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119633 c!101661) b!1000175))

(assert (= (and d!119633 (not c!101661)) b!1000176))

(assert (= (and b!1000176 c!101660) b!1000170))

(assert (= (and b!1000176 (not c!101660)) b!1000177))

(assert (= (and d!119633 c!101662) b!1000169))

(assert (= (and d!119633 (not c!101662)) b!1000172))

(assert (= (and b!1000172 res!669153) b!1000173))

(assert (= (and b!1000173 (not res!669152)) b!1000174))

(assert (= (and b!1000174 (not res!669154)) b!1000171))

(declare-fun m!926899 () Bool)

(assert (=> b!1000173 m!926899))

(assert (=> b!1000171 m!926899))

(assert (=> d!119633 m!926757))

(declare-fun m!926905 () Bool)

(assert (=> d!119633 m!926905))

(assert (=> d!119633 m!926743))

(assert (=> b!1000177 m!926757))

(declare-fun m!926909 () Bool)

(assert (=> b!1000177 m!926909))

(assert (=> b!1000177 m!926909))

(assert (=> b!1000177 m!926751))

(declare-fun m!926917 () Bool)

(assert (=> b!1000177 m!926917))

(assert (=> b!1000174 m!926899))

(assert (=> b!999963 d!119633))

(declare-fun d!119637 () Bool)

(declare-fun lt!442335 () (_ BitVec 32))

(declare-fun lt!442334 () (_ BitVec 32))

(assert (=> d!119637 (= lt!442335 (bvmul (bvxor lt!442334 (bvlshr lt!442334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119637 (= lt!442334 ((_ extract 31 0) (bvand (bvxor (select (arr!30424 a!3219) j!170) (bvlshr (select (arr!30424 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119637 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!669143 (let ((h!22251 ((_ extract 31 0) (bvand (bvxor (select (arr!30424 a!3219) j!170) (bvlshr (select (arr!30424 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87134 (bvmul (bvxor h!22251 (bvlshr h!22251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87134 (bvlshr x!87134 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!669143 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!669143 #b00000000000000000000000000000000))))))

(assert (=> d!119637 (= (toIndex!0 (select (arr!30424 a!3219) j!170) mask!3464) (bvand (bvxor lt!442335 (bvlshr lt!442335 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999963 d!119637))

(declare-fun d!119639 () Bool)

(assert (=> d!119639 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86482 d!119639))

(declare-fun d!119643 () Bool)

(assert (=> d!119643 (= (array_inv!23560 a!3219) (bvsge (size!30927 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86482 d!119643))

(declare-fun b!1000258 () Bool)

(declare-fun e!564091 () Bool)

(declare-fun call!42354 () Bool)

(assert (=> b!1000258 (= e!564091 call!42354)))

(declare-fun b!1000259 () Bool)

(declare-fun e!564088 () Bool)

(assert (=> b!1000259 (= e!564088 e!564091)))

(declare-fun c!101685 () Bool)

(assert (=> b!1000259 (= c!101685 (validKeyInArray!0 (select (arr!30424 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42349 () Bool)

(assert (=> bm!42349 (= call!42354 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101685 (Cons!21067 (select (arr!30424 a!3219) #b00000000000000000000000000000000) Nil!21068) Nil!21068)))))

(declare-fun b!1000260 () Bool)

(declare-fun e!564090 () Bool)

(declare-fun contains!5894 (List!21071 (_ BitVec 64)) Bool)

(assert (=> b!1000260 (= e!564090 (contains!5894 Nil!21068 (select (arr!30424 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119645 () Bool)

(declare-fun res!669192 () Bool)

(declare-fun e!564089 () Bool)

(assert (=> d!119645 (=> res!669192 e!564089)))

(assert (=> d!119645 (= res!669192 (bvsge #b00000000000000000000000000000000 (size!30927 a!3219)))))

(assert (=> d!119645 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21068) e!564089)))

(declare-fun b!1000261 () Bool)

(assert (=> b!1000261 (= e!564089 e!564088)))

(declare-fun res!669193 () Bool)

(assert (=> b!1000261 (=> (not res!669193) (not e!564088))))

(assert (=> b!1000261 (= res!669193 (not e!564090))))

(declare-fun res!669191 () Bool)

(assert (=> b!1000261 (=> (not res!669191) (not e!564090))))

(assert (=> b!1000261 (= res!669191 (validKeyInArray!0 (select (arr!30424 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1000262 () Bool)

(assert (=> b!1000262 (= e!564091 call!42354)))

(assert (= (and d!119645 (not res!669192)) b!1000261))

(assert (= (and b!1000261 res!669191) b!1000260))

(assert (= (and b!1000261 res!669193) b!1000259))

(assert (= (and b!1000259 c!101685) b!1000258))

(assert (= (and b!1000259 (not c!101685)) b!1000262))

(assert (= (or b!1000258 b!1000262) bm!42349))

(assert (=> b!1000259 m!926849))

(assert (=> b!1000259 m!926849))

(assert (=> b!1000259 m!926857))

(assert (=> bm!42349 m!926849))

(declare-fun m!926941 () Bool)

(assert (=> bm!42349 m!926941))

(assert (=> b!1000260 m!926849))

(assert (=> b!1000260 m!926849))

(declare-fun m!926943 () Bool)

(assert (=> b!1000260 m!926943))

(assert (=> b!1000261 m!926849))

(assert (=> b!1000261 m!926849))

(assert (=> b!1000261 m!926857))

(assert (=> b!999964 d!119645))

(declare-fun d!119653 () Bool)

(assert (=> d!119653 (= (validKeyInArray!0 (select (arr!30424 a!3219) j!170)) (and (not (= (select (arr!30424 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30424 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999970 d!119653))

(check-sat (not b!1000168) (not b!1000260) (not b!1000259) (not d!119617) (not b!1000072) (not b!1000144) (not b!1000261) (not bm!42349) (not b!1000059) (not b!1000070) (not bm!42340) (not b!1000177) (not d!119633) (not d!119603))
(check-sat)
