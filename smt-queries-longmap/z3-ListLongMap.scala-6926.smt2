; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87286 () Bool)

(assert start!87286)

(declare-fun b!1011012 () Bool)

(declare-fun res!678797 () Bool)

(declare-fun e!568897 () Bool)

(assert (=> b!1011012 (=> (not res!678797) (not e!568897))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011012 (= res!678797 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011013 () Bool)

(declare-fun res!678784 () Bool)

(declare-fun e!568898 () Bool)

(assert (=> b!1011013 (=> (not res!678784) (not e!568898))))

(declare-datatypes ((array!63672 0))(
  ( (array!63673 (arr!30649 (Array (_ BitVec 32) (_ BitVec 64))) (size!31152 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63672)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011013 (= res!678784 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31152 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31152 a!3219))))))

(declare-fun b!1011014 () Bool)

(declare-fun res!678791 () Bool)

(assert (=> b!1011014 (=> (not res!678791) (not e!568897))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9517 0))(
  ( (MissingZero!9517 (index!40439 (_ BitVec 32))) (Found!9517 (index!40440 (_ BitVec 32))) (Intermediate!9517 (undefined!10329 Bool) (index!40441 (_ BitVec 32)) (x!87998 (_ BitVec 32))) (Undefined!9517) (MissingVacant!9517 (index!40442 (_ BitVec 32))) )
))
(declare-fun lt!446774 () SeekEntryResult!9517)

(declare-fun lt!446776 () array!63672)

(declare-fun lt!446775 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63672 (_ BitVec 32)) SeekEntryResult!9517)

(assert (=> b!1011014 (= res!678791 (not (= lt!446774 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446775 lt!446776 mask!3464))))))

(declare-fun res!678789 () Bool)

(declare-fun e!568900 () Bool)

(assert (=> start!87286 (=> (not res!678789) (not e!568900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87286 (= res!678789 (validMask!0 mask!3464))))

(assert (=> start!87286 e!568900))

(declare-fun array_inv!23785 (array!63672) Bool)

(assert (=> start!87286 (array_inv!23785 a!3219)))

(assert (=> start!87286 true))

(declare-fun b!1011015 () Bool)

(declare-fun e!568902 () Bool)

(assert (=> b!1011015 (= e!568898 e!568902)))

(declare-fun res!678788 () Bool)

(assert (=> b!1011015 (=> (not res!678788) (not e!568902))))

(declare-fun lt!446779 () SeekEntryResult!9517)

(declare-fun lt!446778 () SeekEntryResult!9517)

(assert (=> b!1011015 (= res!678788 (= lt!446779 lt!446778))))

(assert (=> b!1011015 (= lt!446778 (Intermediate!9517 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011015 (= lt!446779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30649 a!3219) j!170) mask!3464) (select (arr!30649 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011016 () Bool)

(declare-fun e!568899 () Bool)

(assert (=> b!1011016 (= e!568899 e!568897)))

(declare-fun res!678792 () Bool)

(assert (=> b!1011016 (=> (not res!678792) (not e!568897))))

(assert (=> b!1011016 (= res!678792 (not (= lt!446779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446775 mask!3464) lt!446775 lt!446776 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1011016 (= lt!446775 (select (store (arr!30649 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011016 (= lt!446776 (array!63673 (store (arr!30649 a!3219) i!1194 k0!2224) (size!31152 a!3219)))))

(declare-fun b!1011017 () Bool)

(declare-fun res!678786 () Bool)

(assert (=> b!1011017 (=> (not res!678786) (not e!568900))))

(declare-fun arrayContainsKey!0 (array!63672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011017 (= res!678786 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011018 () Bool)

(declare-fun res!678790 () Bool)

(assert (=> b!1011018 (=> (not res!678790) (not e!568900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011018 (= res!678790 (validKeyInArray!0 k0!2224))))

(declare-fun lt!446780 () (_ BitVec 32))

(declare-fun b!1011019 () Bool)

(assert (=> b!1011019 (= e!568897 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (or (bvslt lt!446780 #b00000000000000000000000000000000) (bvsge lt!446780 (size!31152 a!3219)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011019 (= lt!446780 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1011020 () Bool)

(assert (=> b!1011020 (= e!568900 e!568898)))

(declare-fun res!678794 () Bool)

(assert (=> b!1011020 (=> (not res!678794) (not e!568898))))

(declare-fun lt!446777 () SeekEntryResult!9517)

(assert (=> b!1011020 (= res!678794 (or (= lt!446777 (MissingVacant!9517 i!1194)) (= lt!446777 (MissingZero!9517 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63672 (_ BitVec 32)) SeekEntryResult!9517)

(assert (=> b!1011020 (= lt!446777 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1011021 () Bool)

(declare-fun res!678785 () Bool)

(assert (=> b!1011021 (=> (not res!678785) (not e!568900))))

(assert (=> b!1011021 (= res!678785 (and (= (size!31152 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31152 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31152 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011022 () Bool)

(declare-fun res!678795 () Bool)

(assert (=> b!1011022 (=> (not res!678795) (not e!568900))))

(assert (=> b!1011022 (= res!678795 (validKeyInArray!0 (select (arr!30649 a!3219) j!170)))))

(declare-fun b!1011023 () Bool)

(declare-fun res!678796 () Bool)

(assert (=> b!1011023 (=> (not res!678796) (not e!568898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63672 (_ BitVec 32)) Bool)

(assert (=> b!1011023 (= res!678796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011024 () Bool)

(assert (=> b!1011024 (= e!568902 e!568899)))

(declare-fun res!678793 () Bool)

(assert (=> b!1011024 (=> (not res!678793) (not e!568899))))

(assert (=> b!1011024 (= res!678793 (= lt!446774 lt!446778))))

(assert (=> b!1011024 (= lt!446774 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30649 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011025 () Bool)

(declare-fun res!678787 () Bool)

(assert (=> b!1011025 (=> (not res!678787) (not e!568898))))

(declare-datatypes ((List!21296 0))(
  ( (Nil!21293) (Cons!21292 (h!22490 (_ BitVec 64)) (t!30289 List!21296)) )
))
(declare-fun arrayNoDuplicates!0 (array!63672 (_ BitVec 32) List!21296) Bool)

(assert (=> b!1011025 (= res!678787 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21293))))

(assert (= (and start!87286 res!678789) b!1011021))

(assert (= (and b!1011021 res!678785) b!1011022))

(assert (= (and b!1011022 res!678795) b!1011018))

(assert (= (and b!1011018 res!678790) b!1011017))

(assert (= (and b!1011017 res!678786) b!1011020))

(assert (= (and b!1011020 res!678794) b!1011023))

(assert (= (and b!1011023 res!678796) b!1011025))

(assert (= (and b!1011025 res!678787) b!1011013))

(assert (= (and b!1011013 res!678784) b!1011015))

(assert (= (and b!1011015 res!678788) b!1011024))

(assert (= (and b!1011024 res!678793) b!1011016))

(assert (= (and b!1011016 res!678792) b!1011014))

(assert (= (and b!1011014 res!678791) b!1011012))

(assert (= (and b!1011012 res!678797) b!1011019))

(declare-fun m!935825 () Bool)

(assert (=> b!1011019 m!935825))

(declare-fun m!935827 () Bool)

(assert (=> b!1011018 m!935827))

(declare-fun m!935829 () Bool)

(assert (=> b!1011023 m!935829))

(declare-fun m!935831 () Bool)

(assert (=> b!1011024 m!935831))

(assert (=> b!1011024 m!935831))

(declare-fun m!935833 () Bool)

(assert (=> b!1011024 m!935833))

(assert (=> b!1011015 m!935831))

(assert (=> b!1011015 m!935831))

(declare-fun m!935835 () Bool)

(assert (=> b!1011015 m!935835))

(assert (=> b!1011015 m!935835))

(assert (=> b!1011015 m!935831))

(declare-fun m!935837 () Bool)

(assert (=> b!1011015 m!935837))

(declare-fun m!935839 () Bool)

(assert (=> start!87286 m!935839))

(declare-fun m!935841 () Bool)

(assert (=> start!87286 m!935841))

(declare-fun m!935843 () Bool)

(assert (=> b!1011025 m!935843))

(declare-fun m!935845 () Bool)

(assert (=> b!1011017 m!935845))

(declare-fun m!935847 () Bool)

(assert (=> b!1011016 m!935847))

(assert (=> b!1011016 m!935847))

(declare-fun m!935849 () Bool)

(assert (=> b!1011016 m!935849))

(declare-fun m!935851 () Bool)

(assert (=> b!1011016 m!935851))

(declare-fun m!935853 () Bool)

(assert (=> b!1011016 m!935853))

(declare-fun m!935855 () Bool)

(assert (=> b!1011020 m!935855))

(assert (=> b!1011022 m!935831))

(assert (=> b!1011022 m!935831))

(declare-fun m!935857 () Bool)

(assert (=> b!1011022 m!935857))

(declare-fun m!935859 () Bool)

(assert (=> b!1011014 m!935859))

(check-sat (not b!1011022) (not b!1011015) (not b!1011017) (not b!1011014) (not b!1011024) (not b!1011016) (not start!87286) (not b!1011018) (not b!1011025) (not b!1011023) (not b!1011020) (not b!1011019))
(check-sat)
(get-model)

(declare-fun b!1011128 () Bool)

(declare-fun lt!446828 () SeekEntryResult!9517)

(assert (=> b!1011128 (and (bvsge (index!40441 lt!446828) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446828) (size!31152 a!3219)))))

(declare-fun e!568949 () Bool)

(assert (=> b!1011128 (= e!568949 (= (select (arr!30649 a!3219) (index!40441 lt!446828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!120365 () Bool)

(declare-fun e!568952 () Bool)

(assert (=> d!120365 e!568952))

(declare-fun c!102286 () Bool)

(get-info :version)

(assert (=> d!120365 (= c!102286 (and ((_ is Intermediate!9517) lt!446828) (undefined!10329 lt!446828)))))

(declare-fun e!568950 () SeekEntryResult!9517)

(assert (=> d!120365 (= lt!446828 e!568950)))

(declare-fun c!102284 () Bool)

(assert (=> d!120365 (= c!102284 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446827 () (_ BitVec 64))

(assert (=> d!120365 (= lt!446827 (select (arr!30649 a!3219) index!1507))))

(assert (=> d!120365 (validMask!0 mask!3464)))

(assert (=> d!120365 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30649 a!3219) j!170) a!3219 mask!3464) lt!446828)))

(declare-fun b!1011129 () Bool)

(declare-fun e!568951 () SeekEntryResult!9517)

(assert (=> b!1011129 (= e!568951 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30649 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011130 () Bool)

(declare-fun e!568953 () Bool)

(assert (=> b!1011130 (= e!568952 e!568953)))

(declare-fun res!678888 () Bool)

(assert (=> b!1011130 (= res!678888 (and ((_ is Intermediate!9517) lt!446828) (not (undefined!10329 lt!446828)) (bvslt (x!87998 lt!446828) #b01111111111111111111111111111110) (bvsge (x!87998 lt!446828) #b00000000000000000000000000000000) (bvsge (x!87998 lt!446828) x!1245)))))

(assert (=> b!1011130 (=> (not res!678888) (not e!568953))))

(declare-fun b!1011131 () Bool)

(assert (=> b!1011131 (= e!568950 (Intermediate!9517 true index!1507 x!1245))))

(declare-fun b!1011132 () Bool)

(assert (=> b!1011132 (= e!568952 (bvsge (x!87998 lt!446828) #b01111111111111111111111111111110))))

(declare-fun b!1011133 () Bool)

(assert (=> b!1011133 (= e!568951 (Intermediate!9517 false index!1507 x!1245))))

(declare-fun b!1011134 () Bool)

(assert (=> b!1011134 (= e!568950 e!568951)))

(declare-fun c!102285 () Bool)

(assert (=> b!1011134 (= c!102285 (or (= lt!446827 (select (arr!30649 a!3219) j!170)) (= (bvadd lt!446827 lt!446827) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011135 () Bool)

(assert (=> b!1011135 (and (bvsge (index!40441 lt!446828) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446828) (size!31152 a!3219)))))

(declare-fun res!678889 () Bool)

(assert (=> b!1011135 (= res!678889 (= (select (arr!30649 a!3219) (index!40441 lt!446828)) (select (arr!30649 a!3219) j!170)))))

(assert (=> b!1011135 (=> res!678889 e!568949)))

(assert (=> b!1011135 (= e!568953 e!568949)))

(declare-fun b!1011136 () Bool)

(assert (=> b!1011136 (and (bvsge (index!40441 lt!446828) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446828) (size!31152 a!3219)))))

(declare-fun res!678890 () Bool)

(assert (=> b!1011136 (= res!678890 (= (select (arr!30649 a!3219) (index!40441 lt!446828)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011136 (=> res!678890 e!568949)))

(assert (= (and d!120365 c!102284) b!1011131))

(assert (= (and d!120365 (not c!102284)) b!1011134))

(assert (= (and b!1011134 c!102285) b!1011133))

(assert (= (and b!1011134 (not c!102285)) b!1011129))

(assert (= (and d!120365 c!102286) b!1011132))

(assert (= (and d!120365 (not c!102286)) b!1011130))

(assert (= (and b!1011130 res!678888) b!1011135))

(assert (= (and b!1011135 (not res!678889)) b!1011136))

(assert (= (and b!1011136 (not res!678890)) b!1011128))

(declare-fun m!935933 () Bool)

(assert (=> b!1011128 m!935933))

(assert (=> b!1011136 m!935933))

(assert (=> b!1011135 m!935933))

(declare-fun m!935935 () Bool)

(assert (=> d!120365 m!935935))

(assert (=> d!120365 m!935839))

(declare-fun m!935937 () Bool)

(assert (=> b!1011129 m!935937))

(assert (=> b!1011129 m!935937))

(assert (=> b!1011129 m!935831))

(declare-fun m!935939 () Bool)

(assert (=> b!1011129 m!935939))

(assert (=> b!1011024 d!120365))

(declare-fun b!1011137 () Bool)

(declare-fun lt!446830 () SeekEntryResult!9517)

(assert (=> b!1011137 (and (bvsge (index!40441 lt!446830) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446830) (size!31152 a!3219)))))

(declare-fun e!568954 () Bool)

(assert (=> b!1011137 (= e!568954 (= (select (arr!30649 a!3219) (index!40441 lt!446830)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!120367 () Bool)

(declare-fun e!568957 () Bool)

(assert (=> d!120367 e!568957))

(declare-fun c!102289 () Bool)

(assert (=> d!120367 (= c!102289 (and ((_ is Intermediate!9517) lt!446830) (undefined!10329 lt!446830)))))

(declare-fun e!568955 () SeekEntryResult!9517)

(assert (=> d!120367 (= lt!446830 e!568955)))

(declare-fun c!102287 () Bool)

(assert (=> d!120367 (= c!102287 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446829 () (_ BitVec 64))

(assert (=> d!120367 (= lt!446829 (select (arr!30649 a!3219) (toIndex!0 (select (arr!30649 a!3219) j!170) mask!3464)))))

(assert (=> d!120367 (validMask!0 mask!3464)))

(assert (=> d!120367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30649 a!3219) j!170) mask!3464) (select (arr!30649 a!3219) j!170) a!3219 mask!3464) lt!446830)))

(declare-fun e!568956 () SeekEntryResult!9517)

(declare-fun b!1011138 () Bool)

(assert (=> b!1011138 (= e!568956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30649 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30649 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011139 () Bool)

(declare-fun e!568958 () Bool)

(assert (=> b!1011139 (= e!568957 e!568958)))

(declare-fun res!678891 () Bool)

(assert (=> b!1011139 (= res!678891 (and ((_ is Intermediate!9517) lt!446830) (not (undefined!10329 lt!446830)) (bvslt (x!87998 lt!446830) #b01111111111111111111111111111110) (bvsge (x!87998 lt!446830) #b00000000000000000000000000000000) (bvsge (x!87998 lt!446830) #b00000000000000000000000000000000)))))

(assert (=> b!1011139 (=> (not res!678891) (not e!568958))))

(declare-fun b!1011140 () Bool)

(assert (=> b!1011140 (= e!568955 (Intermediate!9517 true (toIndex!0 (select (arr!30649 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011141 () Bool)

(assert (=> b!1011141 (= e!568957 (bvsge (x!87998 lt!446830) #b01111111111111111111111111111110))))

(declare-fun b!1011142 () Bool)

(assert (=> b!1011142 (= e!568956 (Intermediate!9517 false (toIndex!0 (select (arr!30649 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011143 () Bool)

(assert (=> b!1011143 (= e!568955 e!568956)))

(declare-fun c!102288 () Bool)

(assert (=> b!1011143 (= c!102288 (or (= lt!446829 (select (arr!30649 a!3219) j!170)) (= (bvadd lt!446829 lt!446829) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011144 () Bool)

(assert (=> b!1011144 (and (bvsge (index!40441 lt!446830) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446830) (size!31152 a!3219)))))

(declare-fun res!678892 () Bool)

(assert (=> b!1011144 (= res!678892 (= (select (arr!30649 a!3219) (index!40441 lt!446830)) (select (arr!30649 a!3219) j!170)))))

(assert (=> b!1011144 (=> res!678892 e!568954)))

(assert (=> b!1011144 (= e!568958 e!568954)))

(declare-fun b!1011145 () Bool)

(assert (=> b!1011145 (and (bvsge (index!40441 lt!446830) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446830) (size!31152 a!3219)))))

(declare-fun res!678893 () Bool)

(assert (=> b!1011145 (= res!678893 (= (select (arr!30649 a!3219) (index!40441 lt!446830)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011145 (=> res!678893 e!568954)))

(assert (= (and d!120367 c!102287) b!1011140))

(assert (= (and d!120367 (not c!102287)) b!1011143))

(assert (= (and b!1011143 c!102288) b!1011142))

(assert (= (and b!1011143 (not c!102288)) b!1011138))

(assert (= (and d!120367 c!102289) b!1011141))

(assert (= (and d!120367 (not c!102289)) b!1011139))

(assert (= (and b!1011139 res!678891) b!1011144))

(assert (= (and b!1011144 (not res!678892)) b!1011145))

(assert (= (and b!1011145 (not res!678893)) b!1011137))

(declare-fun m!935941 () Bool)

(assert (=> b!1011137 m!935941))

(assert (=> b!1011145 m!935941))

(assert (=> b!1011144 m!935941))

(assert (=> d!120367 m!935835))

(declare-fun m!935943 () Bool)

(assert (=> d!120367 m!935943))

(assert (=> d!120367 m!935839))

(assert (=> b!1011138 m!935835))

(declare-fun m!935945 () Bool)

(assert (=> b!1011138 m!935945))

(assert (=> b!1011138 m!935945))

(assert (=> b!1011138 m!935831))

(declare-fun m!935947 () Bool)

(assert (=> b!1011138 m!935947))

(assert (=> b!1011015 d!120367))

(declare-fun d!120369 () Bool)

(declare-fun lt!446836 () (_ BitVec 32))

(declare-fun lt!446835 () (_ BitVec 32))

(assert (=> d!120369 (= lt!446836 (bvmul (bvxor lt!446835 (bvlshr lt!446835 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120369 (= lt!446835 ((_ extract 31 0) (bvand (bvxor (select (arr!30649 a!3219) j!170) (bvlshr (select (arr!30649 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120369 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678894 (let ((h!22493 ((_ extract 31 0) (bvand (bvxor (select (arr!30649 a!3219) j!170) (bvlshr (select (arr!30649 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88002 (bvmul (bvxor h!22493 (bvlshr h!22493 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88002 (bvlshr x!88002 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678894 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678894 #b00000000000000000000000000000000))))))

(assert (=> d!120369 (= (toIndex!0 (select (arr!30649 a!3219) j!170) mask!3464) (bvand (bvxor lt!446836 (bvlshr lt!446836 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1011015 d!120369))

(declare-fun b!1011156 () Bool)

(declare-fun e!568970 () Bool)

(declare-fun e!568969 () Bool)

(assert (=> b!1011156 (= e!568970 e!568969)))

(declare-fun res!678901 () Bool)

(assert (=> b!1011156 (=> (not res!678901) (not e!568969))))

(declare-fun e!568968 () Bool)

(assert (=> b!1011156 (= res!678901 (not e!568968))))

(declare-fun res!678902 () Bool)

(assert (=> b!1011156 (=> (not res!678902) (not e!568968))))

(assert (=> b!1011156 (= res!678902 (validKeyInArray!0 (select (arr!30649 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42454 () Bool)

(declare-fun call!42457 () Bool)

(declare-fun c!102292 () Bool)

(assert (=> bm!42454 (= call!42457 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102292 (Cons!21292 (select (arr!30649 a!3219) #b00000000000000000000000000000000) Nil!21293) Nil!21293)))))

(declare-fun b!1011157 () Bool)

(declare-fun contains!5911 (List!21296 (_ BitVec 64)) Bool)

(assert (=> b!1011157 (= e!568968 (contains!5911 Nil!21293 (select (arr!30649 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011159 () Bool)

(declare-fun e!568967 () Bool)

(assert (=> b!1011159 (= e!568967 call!42457)))

(declare-fun b!1011160 () Bool)

(assert (=> b!1011160 (= e!568969 e!568967)))

(assert (=> b!1011160 (= c!102292 (validKeyInArray!0 (select (arr!30649 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!120371 () Bool)

(declare-fun res!678903 () Bool)

(assert (=> d!120371 (=> res!678903 e!568970)))

(assert (=> d!120371 (= res!678903 (bvsge #b00000000000000000000000000000000 (size!31152 a!3219)))))

(assert (=> d!120371 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21293) e!568970)))

(declare-fun b!1011158 () Bool)

(assert (=> b!1011158 (= e!568967 call!42457)))

(assert (= (and d!120371 (not res!678903)) b!1011156))

(assert (= (and b!1011156 res!678902) b!1011157))

(assert (= (and b!1011156 res!678901) b!1011160))

(assert (= (and b!1011160 c!102292) b!1011158))

(assert (= (and b!1011160 (not c!102292)) b!1011159))

(assert (= (or b!1011158 b!1011159) bm!42454))

(declare-fun m!935949 () Bool)

(assert (=> b!1011156 m!935949))

(assert (=> b!1011156 m!935949))

(declare-fun m!935951 () Bool)

(assert (=> b!1011156 m!935951))

(assert (=> bm!42454 m!935949))

(declare-fun m!935953 () Bool)

(assert (=> bm!42454 m!935953))

(assert (=> b!1011157 m!935949))

(assert (=> b!1011157 m!935949))

(declare-fun m!935955 () Bool)

(assert (=> b!1011157 m!935955))

(assert (=> b!1011160 m!935949))

(assert (=> b!1011160 m!935949))

(assert (=> b!1011160 m!935951))

(assert (=> b!1011025 d!120371))

(declare-fun b!1011161 () Bool)

(declare-fun lt!446838 () SeekEntryResult!9517)

(assert (=> b!1011161 (and (bvsge (index!40441 lt!446838) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446838) (size!31152 lt!446776)))))

(declare-fun e!568971 () Bool)

(assert (=> b!1011161 (= e!568971 (= (select (arr!30649 lt!446776) (index!40441 lt!446838)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!120373 () Bool)

(declare-fun e!568974 () Bool)

(assert (=> d!120373 e!568974))

(declare-fun c!102295 () Bool)

(assert (=> d!120373 (= c!102295 (and ((_ is Intermediate!9517) lt!446838) (undefined!10329 lt!446838)))))

(declare-fun e!568972 () SeekEntryResult!9517)

(assert (=> d!120373 (= lt!446838 e!568972)))

(declare-fun c!102293 () Bool)

(assert (=> d!120373 (= c!102293 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446837 () (_ BitVec 64))

(assert (=> d!120373 (= lt!446837 (select (arr!30649 lt!446776) index!1507))))

(assert (=> d!120373 (validMask!0 mask!3464)))

(assert (=> d!120373 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446775 lt!446776 mask!3464) lt!446838)))

(declare-fun e!568973 () SeekEntryResult!9517)

(declare-fun b!1011162 () Bool)

(assert (=> b!1011162 (= e!568973 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!446775 lt!446776 mask!3464))))

(declare-fun b!1011163 () Bool)

(declare-fun e!568975 () Bool)

(assert (=> b!1011163 (= e!568974 e!568975)))

(declare-fun res!678904 () Bool)

(assert (=> b!1011163 (= res!678904 (and ((_ is Intermediate!9517) lt!446838) (not (undefined!10329 lt!446838)) (bvslt (x!87998 lt!446838) #b01111111111111111111111111111110) (bvsge (x!87998 lt!446838) #b00000000000000000000000000000000) (bvsge (x!87998 lt!446838) x!1245)))))

(assert (=> b!1011163 (=> (not res!678904) (not e!568975))))

(declare-fun b!1011164 () Bool)

(assert (=> b!1011164 (= e!568972 (Intermediate!9517 true index!1507 x!1245))))

(declare-fun b!1011165 () Bool)

(assert (=> b!1011165 (= e!568974 (bvsge (x!87998 lt!446838) #b01111111111111111111111111111110))))

(declare-fun b!1011166 () Bool)

(assert (=> b!1011166 (= e!568973 (Intermediate!9517 false index!1507 x!1245))))

(declare-fun b!1011167 () Bool)

(assert (=> b!1011167 (= e!568972 e!568973)))

(declare-fun c!102294 () Bool)

(assert (=> b!1011167 (= c!102294 (or (= lt!446837 lt!446775) (= (bvadd lt!446837 lt!446837) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011168 () Bool)

(assert (=> b!1011168 (and (bvsge (index!40441 lt!446838) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446838) (size!31152 lt!446776)))))

(declare-fun res!678905 () Bool)

(assert (=> b!1011168 (= res!678905 (= (select (arr!30649 lt!446776) (index!40441 lt!446838)) lt!446775))))

(assert (=> b!1011168 (=> res!678905 e!568971)))

(assert (=> b!1011168 (= e!568975 e!568971)))

(declare-fun b!1011169 () Bool)

(assert (=> b!1011169 (and (bvsge (index!40441 lt!446838) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446838) (size!31152 lt!446776)))))

(declare-fun res!678906 () Bool)

(assert (=> b!1011169 (= res!678906 (= (select (arr!30649 lt!446776) (index!40441 lt!446838)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011169 (=> res!678906 e!568971)))

(assert (= (and d!120373 c!102293) b!1011164))

(assert (= (and d!120373 (not c!102293)) b!1011167))

(assert (= (and b!1011167 c!102294) b!1011166))

(assert (= (and b!1011167 (not c!102294)) b!1011162))

(assert (= (and d!120373 c!102295) b!1011165))

(assert (= (and d!120373 (not c!102295)) b!1011163))

(assert (= (and b!1011163 res!678904) b!1011168))

(assert (= (and b!1011168 (not res!678905)) b!1011169))

(assert (= (and b!1011169 (not res!678906)) b!1011161))

(declare-fun m!935957 () Bool)

(assert (=> b!1011161 m!935957))

(assert (=> b!1011169 m!935957))

(assert (=> b!1011168 m!935957))

(declare-fun m!935959 () Bool)

(assert (=> d!120373 m!935959))

(assert (=> d!120373 m!935839))

(assert (=> b!1011162 m!935937))

(assert (=> b!1011162 m!935937))

(declare-fun m!935961 () Bool)

(assert (=> b!1011162 m!935961))

(assert (=> b!1011014 d!120373))

(declare-fun b!1011170 () Bool)

(declare-fun lt!446840 () SeekEntryResult!9517)

(assert (=> b!1011170 (and (bvsge (index!40441 lt!446840) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446840) (size!31152 lt!446776)))))

(declare-fun e!568976 () Bool)

(assert (=> b!1011170 (= e!568976 (= (select (arr!30649 lt!446776) (index!40441 lt!446840)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!120375 () Bool)

(declare-fun e!568979 () Bool)

(assert (=> d!120375 e!568979))

(declare-fun c!102298 () Bool)

(assert (=> d!120375 (= c!102298 (and ((_ is Intermediate!9517) lt!446840) (undefined!10329 lt!446840)))))

(declare-fun e!568977 () SeekEntryResult!9517)

(assert (=> d!120375 (= lt!446840 e!568977)))

(declare-fun c!102296 () Bool)

(assert (=> d!120375 (= c!102296 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446839 () (_ BitVec 64))

(assert (=> d!120375 (= lt!446839 (select (arr!30649 lt!446776) (toIndex!0 lt!446775 mask!3464)))))

(assert (=> d!120375 (validMask!0 mask!3464)))

(assert (=> d!120375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446775 mask!3464) lt!446775 lt!446776 mask!3464) lt!446840)))

(declare-fun b!1011171 () Bool)

(declare-fun e!568978 () SeekEntryResult!9517)

(assert (=> b!1011171 (= e!568978 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446775 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!446775 lt!446776 mask!3464))))

(declare-fun b!1011172 () Bool)

(declare-fun e!568980 () Bool)

(assert (=> b!1011172 (= e!568979 e!568980)))

(declare-fun res!678907 () Bool)

(assert (=> b!1011172 (= res!678907 (and ((_ is Intermediate!9517) lt!446840) (not (undefined!10329 lt!446840)) (bvslt (x!87998 lt!446840) #b01111111111111111111111111111110) (bvsge (x!87998 lt!446840) #b00000000000000000000000000000000) (bvsge (x!87998 lt!446840) #b00000000000000000000000000000000)))))

(assert (=> b!1011172 (=> (not res!678907) (not e!568980))))

(declare-fun b!1011173 () Bool)

(assert (=> b!1011173 (= e!568977 (Intermediate!9517 true (toIndex!0 lt!446775 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011174 () Bool)

(assert (=> b!1011174 (= e!568979 (bvsge (x!87998 lt!446840) #b01111111111111111111111111111110))))

(declare-fun b!1011175 () Bool)

(assert (=> b!1011175 (= e!568978 (Intermediate!9517 false (toIndex!0 lt!446775 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011176 () Bool)

(assert (=> b!1011176 (= e!568977 e!568978)))

(declare-fun c!102297 () Bool)

(assert (=> b!1011176 (= c!102297 (or (= lt!446839 lt!446775) (= (bvadd lt!446839 lt!446839) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011177 () Bool)

(assert (=> b!1011177 (and (bvsge (index!40441 lt!446840) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446840) (size!31152 lt!446776)))))

(declare-fun res!678908 () Bool)

(assert (=> b!1011177 (= res!678908 (= (select (arr!30649 lt!446776) (index!40441 lt!446840)) lt!446775))))

(assert (=> b!1011177 (=> res!678908 e!568976)))

(assert (=> b!1011177 (= e!568980 e!568976)))

(declare-fun b!1011178 () Bool)

(assert (=> b!1011178 (and (bvsge (index!40441 lt!446840) #b00000000000000000000000000000000) (bvslt (index!40441 lt!446840) (size!31152 lt!446776)))))

(declare-fun res!678909 () Bool)

(assert (=> b!1011178 (= res!678909 (= (select (arr!30649 lt!446776) (index!40441 lt!446840)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011178 (=> res!678909 e!568976)))

(assert (= (and d!120375 c!102296) b!1011173))

(assert (= (and d!120375 (not c!102296)) b!1011176))

(assert (= (and b!1011176 c!102297) b!1011175))

(assert (= (and b!1011176 (not c!102297)) b!1011171))

(assert (= (and d!120375 c!102298) b!1011174))

(assert (= (and d!120375 (not c!102298)) b!1011172))

(assert (= (and b!1011172 res!678907) b!1011177))

(assert (= (and b!1011177 (not res!678908)) b!1011178))

(assert (= (and b!1011178 (not res!678909)) b!1011170))

(declare-fun m!935963 () Bool)

(assert (=> b!1011170 m!935963))

(assert (=> b!1011178 m!935963))

(assert (=> b!1011177 m!935963))

(assert (=> d!120375 m!935847))

(declare-fun m!935965 () Bool)

(assert (=> d!120375 m!935965))

(assert (=> d!120375 m!935839))

(assert (=> b!1011171 m!935847))

(declare-fun m!935967 () Bool)

(assert (=> b!1011171 m!935967))

(assert (=> b!1011171 m!935967))

(declare-fun m!935969 () Bool)

(assert (=> b!1011171 m!935969))

(assert (=> b!1011016 d!120375))

(declare-fun d!120377 () Bool)

(declare-fun lt!446842 () (_ BitVec 32))

(declare-fun lt!446841 () (_ BitVec 32))

(assert (=> d!120377 (= lt!446842 (bvmul (bvxor lt!446841 (bvlshr lt!446841 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120377 (= lt!446841 ((_ extract 31 0) (bvand (bvxor lt!446775 (bvlshr lt!446775 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120377 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678894 (let ((h!22493 ((_ extract 31 0) (bvand (bvxor lt!446775 (bvlshr lt!446775 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88002 (bvmul (bvxor h!22493 (bvlshr h!22493 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88002 (bvlshr x!88002 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678894 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678894 #b00000000000000000000000000000000))))))

(assert (=> d!120377 (= (toIndex!0 lt!446775 mask!3464) (bvand (bvxor lt!446842 (bvlshr lt!446842 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1011016 d!120377))

(declare-fun d!120381 () Bool)

(declare-fun res!678914 () Bool)

(declare-fun e!568985 () Bool)

(assert (=> d!120381 (=> res!678914 e!568985)))

(assert (=> d!120381 (= res!678914 (= (select (arr!30649 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!120381 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!568985)))

(declare-fun b!1011183 () Bool)

(declare-fun e!568986 () Bool)

(assert (=> b!1011183 (= e!568985 e!568986)))

(declare-fun res!678915 () Bool)

(assert (=> b!1011183 (=> (not res!678915) (not e!568986))))

(assert (=> b!1011183 (= res!678915 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31152 a!3219)))))

(declare-fun b!1011184 () Bool)

(assert (=> b!1011184 (= e!568986 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120381 (not res!678914)) b!1011183))

(assert (= (and b!1011183 res!678915) b!1011184))

(assert (=> d!120381 m!935949))

(declare-fun m!935971 () Bool)

(assert (=> b!1011184 m!935971))

(assert (=> b!1011017 d!120381))

(declare-fun d!120385 () Bool)

(declare-fun lt!446845 () (_ BitVec 32))

(assert (=> d!120385 (and (bvsge lt!446845 #b00000000000000000000000000000000) (bvslt lt!446845 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120385 (= lt!446845 (choose!52 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(assert (=> d!120385 (validMask!0 mask!3464)))

(assert (=> d!120385 (= (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) lt!446845)))

(declare-fun bs!28733 () Bool)

(assert (= bs!28733 d!120385))

(declare-fun m!935973 () Bool)

(assert (=> bs!28733 m!935973))

(assert (=> bs!28733 m!935839))

(assert (=> b!1011019 d!120385))

(declare-fun d!120387 () Bool)

(assert (=> d!120387 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1011018 d!120387))

(declare-fun b!1011260 () Bool)

(declare-fun e!569028 () SeekEntryResult!9517)

(declare-fun lt!446874 () SeekEntryResult!9517)

(assert (=> b!1011260 (= e!569028 (MissingZero!9517 (index!40441 lt!446874)))))

(declare-fun d!120389 () Bool)

(declare-fun lt!446872 () SeekEntryResult!9517)

(assert (=> d!120389 (and (or ((_ is Undefined!9517) lt!446872) (not ((_ is Found!9517) lt!446872)) (and (bvsge (index!40440 lt!446872) #b00000000000000000000000000000000) (bvslt (index!40440 lt!446872) (size!31152 a!3219)))) (or ((_ is Undefined!9517) lt!446872) ((_ is Found!9517) lt!446872) (not ((_ is MissingZero!9517) lt!446872)) (and (bvsge (index!40439 lt!446872) #b00000000000000000000000000000000) (bvslt (index!40439 lt!446872) (size!31152 a!3219)))) (or ((_ is Undefined!9517) lt!446872) ((_ is Found!9517) lt!446872) ((_ is MissingZero!9517) lt!446872) (not ((_ is MissingVacant!9517) lt!446872)) (and (bvsge (index!40442 lt!446872) #b00000000000000000000000000000000) (bvslt (index!40442 lt!446872) (size!31152 a!3219)))) (or ((_ is Undefined!9517) lt!446872) (ite ((_ is Found!9517) lt!446872) (= (select (arr!30649 a!3219) (index!40440 lt!446872)) k0!2224) (ite ((_ is MissingZero!9517) lt!446872) (= (select (arr!30649 a!3219) (index!40439 lt!446872)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9517) lt!446872) (= (select (arr!30649 a!3219) (index!40442 lt!446872)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!569029 () SeekEntryResult!9517)

(assert (=> d!120389 (= lt!446872 e!569029)))

(declare-fun c!102327 () Bool)

(assert (=> d!120389 (= c!102327 (and ((_ is Intermediate!9517) lt!446874) (undefined!10329 lt!446874)))))

(assert (=> d!120389 (= lt!446874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!120389 (validMask!0 mask!3464)))

(assert (=> d!120389 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!446872)))

(declare-fun b!1011261 () Bool)

(declare-fun c!102326 () Bool)

(declare-fun lt!446873 () (_ BitVec 64))

(assert (=> b!1011261 (= c!102326 (= lt!446873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!569030 () SeekEntryResult!9517)

(assert (=> b!1011261 (= e!569030 e!569028)))

(declare-fun b!1011262 () Bool)

(assert (=> b!1011262 (= e!569030 (Found!9517 (index!40441 lt!446874)))))

(declare-fun b!1011263 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63672 (_ BitVec 32)) SeekEntryResult!9517)

(assert (=> b!1011263 (= e!569028 (seekKeyOrZeroReturnVacant!0 (x!87998 lt!446874) (index!40441 lt!446874) (index!40441 lt!446874) k0!2224 a!3219 mask!3464))))

(declare-fun b!1011264 () Bool)

(assert (=> b!1011264 (= e!569029 Undefined!9517)))

(declare-fun b!1011265 () Bool)

(assert (=> b!1011265 (= e!569029 e!569030)))

(assert (=> b!1011265 (= lt!446873 (select (arr!30649 a!3219) (index!40441 lt!446874)))))

(declare-fun c!102328 () Bool)

(assert (=> b!1011265 (= c!102328 (= lt!446873 k0!2224))))

(assert (= (and d!120389 c!102327) b!1011264))

(assert (= (and d!120389 (not c!102327)) b!1011265))

(assert (= (and b!1011265 c!102328) b!1011262))

(assert (= (and b!1011265 (not c!102328)) b!1011261))

(assert (= (and b!1011261 c!102326) b!1011260))

(assert (= (and b!1011261 (not c!102326)) b!1011263))

(declare-fun m!935999 () Bool)

(assert (=> d!120389 m!935999))

(assert (=> d!120389 m!935839))

(declare-fun m!936001 () Bool)

(assert (=> d!120389 m!936001))

(declare-fun m!936003 () Bool)

(assert (=> d!120389 m!936003))

(declare-fun m!936005 () Bool)

(assert (=> d!120389 m!936005))

(assert (=> d!120389 m!935999))

(declare-fun m!936007 () Bool)

(assert (=> d!120389 m!936007))

(declare-fun m!936009 () Bool)

(assert (=> b!1011263 m!936009))

(declare-fun m!936011 () Bool)

(assert (=> b!1011265 m!936011))

(assert (=> b!1011020 d!120389))

(declare-fun d!120401 () Bool)

(assert (=> d!120401 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87286 d!120401))

(declare-fun d!120411 () Bool)

(assert (=> d!120411 (= (array_inv!23785 a!3219) (bvsge (size!31152 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87286 d!120411))

(declare-fun b!1011343 () Bool)

(declare-fun e!569089 () Bool)

(declare-fun call!42468 () Bool)

(assert (=> b!1011343 (= e!569089 call!42468)))

(declare-fun b!1011344 () Bool)

(declare-fun e!569088 () Bool)

(assert (=> b!1011344 (= e!569088 call!42468)))

(declare-fun b!1011345 () Bool)

(declare-fun e!569090 () Bool)

(assert (=> b!1011345 (= e!569090 e!569089)))

(declare-fun c!102347 () Bool)

(assert (=> b!1011345 (= c!102347 (validKeyInArray!0 (select (arr!30649 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!120413 () Bool)

(declare-fun res!678981 () Bool)

(assert (=> d!120413 (=> res!678981 e!569090)))

(assert (=> d!120413 (= res!678981 (bvsge #b00000000000000000000000000000000 (size!31152 a!3219)))))

(assert (=> d!120413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!569090)))

(declare-fun bm!42465 () Bool)

(assert (=> bm!42465 (= call!42468 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1011346 () Bool)

(assert (=> b!1011346 (= e!569089 e!569088)))

(declare-fun lt!446913 () (_ BitVec 64))

(assert (=> b!1011346 (= lt!446913 (select (arr!30649 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33009 0))(
  ( (Unit!33010) )
))
(declare-fun lt!446912 () Unit!33009)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63672 (_ BitVec 64) (_ BitVec 32)) Unit!33009)

(assert (=> b!1011346 (= lt!446912 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446913 #b00000000000000000000000000000000))))

(assert (=> b!1011346 (arrayContainsKey!0 a!3219 lt!446913 #b00000000000000000000000000000000)))

(declare-fun lt!446911 () Unit!33009)

(assert (=> b!1011346 (= lt!446911 lt!446912)))

(declare-fun res!678980 () Bool)

(assert (=> b!1011346 (= res!678980 (= (seekEntryOrOpen!0 (select (arr!30649 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9517 #b00000000000000000000000000000000)))))

(assert (=> b!1011346 (=> (not res!678980) (not e!569088))))

(assert (= (and d!120413 (not res!678981)) b!1011345))

(assert (= (and b!1011345 c!102347) b!1011346))

(assert (= (and b!1011345 (not c!102347)) b!1011343))

(assert (= (and b!1011346 res!678980) b!1011344))

(assert (= (or b!1011344 b!1011343) bm!42465))

(assert (=> b!1011345 m!935949))

(assert (=> b!1011345 m!935949))

(assert (=> b!1011345 m!935951))

(declare-fun m!936053 () Bool)

(assert (=> bm!42465 m!936053))

(assert (=> b!1011346 m!935949))

(declare-fun m!936055 () Bool)

(assert (=> b!1011346 m!936055))

(declare-fun m!936057 () Bool)

(assert (=> b!1011346 m!936057))

(assert (=> b!1011346 m!935949))

(declare-fun m!936059 () Bool)

(assert (=> b!1011346 m!936059))

(assert (=> b!1011023 d!120413))

(declare-fun d!120425 () Bool)

(assert (=> d!120425 (= (validKeyInArray!0 (select (arr!30649 a!3219) j!170)) (and (not (= (select (arr!30649 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30649 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1011022 d!120425))

(check-sat (not bm!42465) (not b!1011138) (not d!120389) (not b!1011129) (not b!1011157) (not b!1011346) (not bm!42454) (not b!1011162) (not d!120373) (not b!1011160) (not b!1011171) (not d!120385) (not b!1011263) (not b!1011184) (not d!120375) (not d!120367) (not b!1011156) (not d!120365) (not b!1011345))
(check-sat)
