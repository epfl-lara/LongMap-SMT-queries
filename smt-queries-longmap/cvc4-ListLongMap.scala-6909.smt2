; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86820 () Bool)

(assert start!86820)

(declare-fun b!1006815 () Bool)

(declare-fun res!675909 () Bool)

(declare-fun e!566658 () Bool)

(assert (=> b!1006815 (=> (not res!675909) (not e!566658))))

(declare-datatypes ((SeekEntryResult!9514 0))(
  ( (MissingZero!9514 (index!40427 (_ BitVec 32))) (Found!9514 (index!40428 (_ BitVec 32))) (Intermediate!9514 (undefined!10326 Bool) (index!40429 (_ BitVec 32)) (x!87818 (_ BitVec 32))) (Undefined!9514) (MissingVacant!9514 (index!40430 (_ BitVec 32))) )
))
(declare-fun lt!444930 () SeekEntryResult!9514)

(declare-fun lt!444934 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((array!63519 0))(
  ( (array!63520 (arr!30582 (Array (_ BitVec 32) (_ BitVec 64))) (size!31084 (_ BitVec 32))) )
))
(declare-fun lt!444933 () array!63519)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63519 (_ BitVec 32)) SeekEntryResult!9514)

(assert (=> b!1006815 (= res!675909 (not (= lt!444930 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444934 lt!444933 mask!3464))))))

(declare-fun b!1006816 () Bool)

(declare-fun res!675905 () Bool)

(declare-fun e!566656 () Bool)

(assert (=> b!1006816 (=> (not res!675905) (not e!566656))))

(declare-fun a!3219 () array!63519)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006816 (= res!675905 (validKeyInArray!0 (select (arr!30582 a!3219) j!170)))))

(declare-fun b!1006817 () Bool)

(declare-fun res!675908 () Bool)

(declare-fun e!566659 () Bool)

(assert (=> b!1006817 (=> (not res!675908) (not e!566659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63519 (_ BitVec 32)) Bool)

(assert (=> b!1006817 (= res!675908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!675915 () Bool)

(assert (=> start!86820 (=> (not res!675915) (not e!566656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86820 (= res!675915 (validMask!0 mask!3464))))

(assert (=> start!86820 e!566656))

(declare-fun array_inv!23706 (array!63519) Bool)

(assert (=> start!86820 (array_inv!23706 a!3219)))

(assert (=> start!86820 true))

(declare-fun b!1006818 () Bool)

(assert (=> b!1006818 (= e!566656 e!566659)))

(declare-fun res!675913 () Bool)

(assert (=> b!1006818 (=> (not res!675913) (not e!566659))))

(declare-fun lt!444932 () SeekEntryResult!9514)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006818 (= res!675913 (or (= lt!444932 (MissingVacant!9514 i!1194)) (= lt!444932 (MissingZero!9514 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63519 (_ BitVec 32)) SeekEntryResult!9514)

(assert (=> b!1006818 (= lt!444932 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006819 () Bool)

(declare-fun e!566657 () Bool)

(assert (=> b!1006819 (= e!566659 e!566657)))

(declare-fun res!675907 () Bool)

(assert (=> b!1006819 (=> (not res!675907) (not e!566657))))

(declare-fun lt!444931 () SeekEntryResult!9514)

(declare-fun lt!444935 () SeekEntryResult!9514)

(assert (=> b!1006819 (= res!675907 (= lt!444931 lt!444935))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006819 (= lt!444935 (Intermediate!9514 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006819 (= lt!444931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30582 a!3219) j!170) mask!3464) (select (arr!30582 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006820 () Bool)

(declare-fun res!675906 () Bool)

(assert (=> b!1006820 (=> (not res!675906) (not e!566659))))

(assert (=> b!1006820 (= res!675906 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31084 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31084 a!3219))))))

(declare-fun b!1006821 () Bool)

(declare-fun res!675904 () Bool)

(assert (=> b!1006821 (=> (not res!675904) (not e!566656))))

(assert (=> b!1006821 (= res!675904 (and (= (size!31084 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31084 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31084 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006822 () Bool)

(declare-fun e!566654 () Bool)

(assert (=> b!1006822 (= e!566657 e!566654)))

(declare-fun res!675903 () Bool)

(assert (=> b!1006822 (=> (not res!675903) (not e!566654))))

(assert (=> b!1006822 (= res!675903 (= lt!444930 lt!444935))))

(assert (=> b!1006822 (= lt!444930 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30582 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006823 () Bool)

(assert (=> b!1006823 (= e!566654 e!566658)))

(declare-fun res!675912 () Bool)

(assert (=> b!1006823 (=> (not res!675912) (not e!566658))))

(assert (=> b!1006823 (= res!675912 (not (= lt!444931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444934 mask!3464) lt!444934 lt!444933 mask!3464))))))

(assert (=> b!1006823 (= lt!444934 (select (store (arr!30582 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1006823 (= lt!444933 (array!63520 (store (arr!30582 a!3219) i!1194 k!2224) (size!31084 a!3219)))))

(declare-fun b!1006824 () Bool)

(declare-fun res!675910 () Bool)

(assert (=> b!1006824 (=> (not res!675910) (not e!566656))))

(declare-fun arrayContainsKey!0 (array!63519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006824 (= res!675910 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006825 () Bool)

(declare-fun res!675914 () Bool)

(assert (=> b!1006825 (=> (not res!675914) (not e!566656))))

(assert (=> b!1006825 (= res!675914 (validKeyInArray!0 k!2224))))

(declare-fun b!1006826 () Bool)

(assert (=> b!1006826 (= e!566658 (and (= index!1507 resIndex!38) (= x!1245 resX!38) (not (= resIndex!38 i!1194))))))

(declare-fun b!1006827 () Bool)

(declare-fun res!675911 () Bool)

(assert (=> b!1006827 (=> (not res!675911) (not e!566659))))

(declare-datatypes ((List!21258 0))(
  ( (Nil!21255) (Cons!21254 (h!22437 (_ BitVec 64)) (t!30259 List!21258)) )
))
(declare-fun arrayNoDuplicates!0 (array!63519 (_ BitVec 32) List!21258) Bool)

(assert (=> b!1006827 (= res!675911 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21255))))

(assert (= (and start!86820 res!675915) b!1006821))

(assert (= (and b!1006821 res!675904) b!1006816))

(assert (= (and b!1006816 res!675905) b!1006825))

(assert (= (and b!1006825 res!675914) b!1006824))

(assert (= (and b!1006824 res!675910) b!1006818))

(assert (= (and b!1006818 res!675913) b!1006817))

(assert (= (and b!1006817 res!675908) b!1006827))

(assert (= (and b!1006827 res!675911) b!1006820))

(assert (= (and b!1006820 res!675906) b!1006819))

(assert (= (and b!1006819 res!675907) b!1006822))

(assert (= (and b!1006822 res!675903) b!1006823))

(assert (= (and b!1006823 res!675912) b!1006815))

(assert (= (and b!1006815 res!675909) b!1006826))

(declare-fun m!931879 () Bool)

(assert (=> b!1006825 m!931879))

(declare-fun m!931881 () Bool)

(assert (=> b!1006817 m!931881))

(declare-fun m!931883 () Bool)

(assert (=> b!1006824 m!931883))

(declare-fun m!931885 () Bool)

(assert (=> b!1006815 m!931885))

(declare-fun m!931887 () Bool)

(assert (=> b!1006823 m!931887))

(assert (=> b!1006823 m!931887))

(declare-fun m!931889 () Bool)

(assert (=> b!1006823 m!931889))

(declare-fun m!931891 () Bool)

(assert (=> b!1006823 m!931891))

(declare-fun m!931893 () Bool)

(assert (=> b!1006823 m!931893))

(declare-fun m!931895 () Bool)

(assert (=> b!1006822 m!931895))

(assert (=> b!1006822 m!931895))

(declare-fun m!931897 () Bool)

(assert (=> b!1006822 m!931897))

(assert (=> b!1006816 m!931895))

(assert (=> b!1006816 m!931895))

(declare-fun m!931899 () Bool)

(assert (=> b!1006816 m!931899))

(declare-fun m!931901 () Bool)

(assert (=> b!1006818 m!931901))

(declare-fun m!931903 () Bool)

(assert (=> b!1006827 m!931903))

(declare-fun m!931905 () Bool)

(assert (=> start!86820 m!931905))

(declare-fun m!931907 () Bool)

(assert (=> start!86820 m!931907))

(assert (=> b!1006819 m!931895))

(assert (=> b!1006819 m!931895))

(declare-fun m!931909 () Bool)

(assert (=> b!1006819 m!931909))

(assert (=> b!1006819 m!931909))

(assert (=> b!1006819 m!931895))

(declare-fun m!931911 () Bool)

(assert (=> b!1006819 m!931911))

(push 1)

(assert (not b!1006823))

(assert (not b!1006822))

(assert (not b!1006816))

(assert (not b!1006827))

(assert (not b!1006818))

(assert (not start!86820))

(assert (not b!1006824))

(assert (not b!1006819))

(assert (not b!1006815))

(assert (not b!1006825))

(assert (not b!1006817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1006894 () Bool)

(declare-fun e!566696 () SeekEntryResult!9514)

(declare-fun lt!444963 () SeekEntryResult!9514)

(assert (=> b!1006894 (= e!566696 (Found!9514 (index!40429 lt!444963)))))

(declare-fun b!1006895 () Bool)

(declare-fun e!566698 () SeekEntryResult!9514)

(assert (=> b!1006895 (= e!566698 (MissingZero!9514 (index!40429 lt!444963)))))

(declare-fun d!119615 () Bool)

(declare-fun lt!444964 () SeekEntryResult!9514)

(assert (=> d!119615 (and (or (is-Undefined!9514 lt!444964) (not (is-Found!9514 lt!444964)) (and (bvsge (index!40428 lt!444964) #b00000000000000000000000000000000) (bvslt (index!40428 lt!444964) (size!31084 a!3219)))) (or (is-Undefined!9514 lt!444964) (is-Found!9514 lt!444964) (not (is-MissingZero!9514 lt!444964)) (and (bvsge (index!40427 lt!444964) #b00000000000000000000000000000000) (bvslt (index!40427 lt!444964) (size!31084 a!3219)))) (or (is-Undefined!9514 lt!444964) (is-Found!9514 lt!444964) (is-MissingZero!9514 lt!444964) (not (is-MissingVacant!9514 lt!444964)) (and (bvsge (index!40430 lt!444964) #b00000000000000000000000000000000) (bvslt (index!40430 lt!444964) (size!31084 a!3219)))) (or (is-Undefined!9514 lt!444964) (ite (is-Found!9514 lt!444964) (= (select (arr!30582 a!3219) (index!40428 lt!444964)) k!2224) (ite (is-MissingZero!9514 lt!444964) (= (select (arr!30582 a!3219) (index!40427 lt!444964)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9514 lt!444964) (= (select (arr!30582 a!3219) (index!40430 lt!444964)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!566697 () SeekEntryResult!9514)

(assert (=> d!119615 (= lt!444964 e!566697)))

(declare-fun c!101632 () Bool)

(assert (=> d!119615 (= c!101632 (and (is-Intermediate!9514 lt!444963) (undefined!10326 lt!444963)))))

(assert (=> d!119615 (= lt!444963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119615 (validMask!0 mask!3464)))

(assert (=> d!119615 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!444964)))

(declare-fun b!1006896 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63519 (_ BitVec 32)) SeekEntryResult!9514)

(assert (=> b!1006896 (= e!566698 (seekKeyOrZeroReturnVacant!0 (x!87818 lt!444963) (index!40429 lt!444963) (index!40429 lt!444963) k!2224 a!3219 mask!3464))))

(declare-fun b!1006897 () Bool)

(assert (=> b!1006897 (= e!566697 Undefined!9514)))

(declare-fun b!1006898 () Bool)

(assert (=> b!1006898 (= e!566697 e!566696)))

(declare-fun lt!444962 () (_ BitVec 64))

(assert (=> b!1006898 (= lt!444962 (select (arr!30582 a!3219) (index!40429 lt!444963)))))

(declare-fun c!101631 () Bool)

(assert (=> b!1006898 (= c!101631 (= lt!444962 k!2224))))

(declare-fun b!1006899 () Bool)

(declare-fun c!101633 () Bool)

(assert (=> b!1006899 (= c!101633 (= lt!444962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006899 (= e!566696 e!566698)))

(assert (= (and d!119615 c!101632) b!1006897))

(assert (= (and d!119615 (not c!101632)) b!1006898))

(assert (= (and b!1006898 c!101631) b!1006894))

(assert (= (and b!1006898 (not c!101631)) b!1006899))

(assert (= (and b!1006899 c!101633) b!1006895))

(assert (= (and b!1006899 (not c!101633)) b!1006896))

(declare-fun m!931929 () Bool)

(assert (=> d!119615 m!931929))

(declare-fun m!931931 () Bool)

(assert (=> d!119615 m!931931))

(declare-fun m!931933 () Bool)

(assert (=> d!119615 m!931933))

(declare-fun m!931935 () Bool)

(assert (=> d!119615 m!931935))

(assert (=> d!119615 m!931929))

(assert (=> d!119615 m!931905))

(declare-fun m!931937 () Bool)

(assert (=> d!119615 m!931937))

(declare-fun m!931939 () Bool)

(assert (=> b!1006896 m!931939))

(declare-fun m!931941 () Bool)

(assert (=> b!1006898 m!931941))

(assert (=> b!1006818 d!119615))

(declare-fun b!1006993 () Bool)

(declare-fun e!566759 () Bool)

(declare-fun e!566756 () Bool)

(assert (=> b!1006993 (= e!566759 e!566756)))

(declare-fun res!675970 () Bool)

(declare-fun lt!444995 () SeekEntryResult!9514)

(assert (=> b!1006993 (= res!675970 (and (is-Intermediate!9514 lt!444995) (not (undefined!10326 lt!444995)) (bvslt (x!87818 lt!444995) #b01111111111111111111111111111110) (bvsge (x!87818 lt!444995) #b00000000000000000000000000000000) (bvsge (x!87818 lt!444995) #b00000000000000000000000000000000)))))

(assert (=> b!1006993 (=> (not res!675970) (not e!566756))))

(declare-fun b!1006994 () Bool)

(declare-fun e!566760 () SeekEntryResult!9514)

(assert (=> b!1006994 (= e!566760 (Intermediate!9514 false (toIndex!0 lt!444934 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006995 () Bool)

(assert (=> b!1006995 (and (bvsge (index!40429 lt!444995) #b00000000000000000000000000000000) (bvslt (index!40429 lt!444995) (size!31084 lt!444933)))))

(declare-fun res!675971 () Bool)

(assert (=> b!1006995 (= res!675971 (= (select (arr!30582 lt!444933) (index!40429 lt!444995)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566757 () Bool)

(assert (=> b!1006995 (=> res!675971 e!566757)))

(declare-fun b!1006996 () Bool)

(assert (=> b!1006996 (and (bvsge (index!40429 lt!444995) #b00000000000000000000000000000000) (bvslt (index!40429 lt!444995) (size!31084 lt!444933)))))

(assert (=> b!1006996 (= e!566757 (= (select (arr!30582 lt!444933) (index!40429 lt!444995)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119631 () Bool)

(assert (=> d!119631 e!566759))

(declare-fun c!101665 () Bool)

(assert (=> d!119631 (= c!101665 (and (is-Intermediate!9514 lt!444995) (undefined!10326 lt!444995)))))

(declare-fun e!566758 () SeekEntryResult!9514)

(assert (=> d!119631 (= lt!444995 e!566758)))

(declare-fun c!101664 () Bool)

(assert (=> d!119631 (= c!101664 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444994 () (_ BitVec 64))

(assert (=> d!119631 (= lt!444994 (select (arr!30582 lt!444933) (toIndex!0 lt!444934 mask!3464)))))

(assert (=> d!119631 (validMask!0 mask!3464)))

(assert (=> d!119631 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444934 mask!3464) lt!444934 lt!444933 mask!3464) lt!444995)))

(declare-fun b!1006997 () Bool)

(assert (=> b!1006997 (= e!566759 (bvsge (x!87818 lt!444995) #b01111111111111111111111111111110))))

(declare-fun b!1006998 () Bool)

(assert (=> b!1006998 (and (bvsge (index!40429 lt!444995) #b00000000000000000000000000000000) (bvslt (index!40429 lt!444995) (size!31084 lt!444933)))))

(declare-fun res!675969 () Bool)

(assert (=> b!1006998 (= res!675969 (= (select (arr!30582 lt!444933) (index!40429 lt!444995)) lt!444934))))

(assert (=> b!1006998 (=> res!675969 e!566757)))

(assert (=> b!1006998 (= e!566756 e!566757)))

(declare-fun b!1006999 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006999 (= e!566760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444934 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444934 lt!444933 mask!3464))))

(declare-fun b!1007000 () Bool)

(assert (=> b!1007000 (= e!566758 (Intermediate!9514 true (toIndex!0 lt!444934 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1007001 () Bool)

(assert (=> b!1007001 (= e!566758 e!566760)))

(declare-fun c!101666 () Bool)

(assert (=> b!1007001 (= c!101666 (or (= lt!444994 lt!444934) (= (bvadd lt!444994 lt!444994) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!119631 c!101664) b!1007000))

(assert (= (and d!119631 (not c!101664)) b!1007001))

(assert (= (and b!1007001 c!101666) b!1006994))

(assert (= (and b!1007001 (not c!101666)) b!1006999))

(assert (= (and d!119631 c!101665) b!1006997))

(assert (= (and d!119631 (not c!101665)) b!1006993))

(assert (= (and b!1006993 res!675970) b!1006998))

(assert (= (and b!1006998 (not res!675969)) b!1006995))

(assert (= (and b!1006995 (not res!675971)) b!1006996))

(declare-fun m!931997 () Bool)

(assert (=> b!1006996 m!931997))

(assert (=> b!1006995 m!931997))

(assert (=> b!1006998 m!931997))

(assert (=> d!119631 m!931887))

(declare-fun m!931999 () Bool)

(assert (=> d!119631 m!931999))

(assert (=> d!119631 m!931905))

(assert (=> b!1006999 m!931887))

(declare-fun m!932001 () Bool)

(assert (=> b!1006999 m!932001))

(assert (=> b!1006999 m!932001))

(declare-fun m!932003 () Bool)

(assert (=> b!1006999 m!932003))

(assert (=> b!1006823 d!119631))

(declare-fun d!119655 () Bool)

(declare-fun lt!445007 () (_ BitVec 32))

(declare-fun lt!445006 () (_ BitVec 32))

(assert (=> d!119655 (= lt!445007 (bvmul (bvxor lt!445006 (bvlshr lt!445006 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119655 (= lt!445006 ((_ extract 31 0) (bvand (bvxor lt!444934 (bvlshr lt!444934 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119655 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!675972 (let ((h!22440 ((_ extract 31 0) (bvand (bvxor lt!444934 (bvlshr lt!444934 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87824 (bvmul (bvxor h!22440 (bvlshr h!22440 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87824 (bvlshr x!87824 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!675972 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!675972 #b00000000000000000000000000000000))))))

(assert (=> d!119655 (= (toIndex!0 lt!444934 mask!3464) (bvand (bvxor lt!445007 (bvlshr lt!445007 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006823 d!119655))

(declare-fun b!1007010 () Bool)

(declare-fun e!566770 () Bool)

(declare-fun e!566767 () Bool)

(assert (=> b!1007010 (= e!566770 e!566767)))

(declare-fun res!675978 () Bool)

(declare-fun lt!445009 () SeekEntryResult!9514)

(assert (=> b!1007010 (= res!675978 (and (is-Intermediate!9514 lt!445009) (not (undefined!10326 lt!445009)) (bvslt (x!87818 lt!445009) #b01111111111111111111111111111110) (bvsge (x!87818 lt!445009) #b00000000000000000000000000000000) (bvsge (x!87818 lt!445009) x!1245)))))

(assert (=> b!1007010 (=> (not res!675978) (not e!566767))))

(declare-fun b!1007011 () Bool)

(declare-fun e!566771 () SeekEntryResult!9514)

(assert (=> b!1007011 (= e!566771 (Intermediate!9514 false index!1507 x!1245))))

(declare-fun b!1007012 () Bool)

(assert (=> b!1007012 (and (bvsge (index!40429 lt!445009) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445009) (size!31084 a!3219)))))

(declare-fun res!675979 () Bool)

(assert (=> b!1007012 (= res!675979 (= (select (arr!30582 a!3219) (index!40429 lt!445009)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566768 () Bool)

(assert (=> b!1007012 (=> res!675979 e!566768)))

(declare-fun b!1007013 () Bool)

(assert (=> b!1007013 (and (bvsge (index!40429 lt!445009) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445009) (size!31084 a!3219)))))

(assert (=> b!1007013 (= e!566768 (= (select (arr!30582 a!3219) (index!40429 lt!445009)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119661 () Bool)

(assert (=> d!119661 e!566770))

(declare-fun c!101670 () Bool)

(assert (=> d!119661 (= c!101670 (and (is-Intermediate!9514 lt!445009) (undefined!10326 lt!445009)))))

(declare-fun e!566769 () SeekEntryResult!9514)

(assert (=> d!119661 (= lt!445009 e!566769)))

(declare-fun c!101669 () Bool)

(assert (=> d!119661 (= c!101669 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!445008 () (_ BitVec 64))

(assert (=> d!119661 (= lt!445008 (select (arr!30582 a!3219) index!1507))))

(assert (=> d!119661 (validMask!0 mask!3464)))

(assert (=> d!119661 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30582 a!3219) j!170) a!3219 mask!3464) lt!445009)))

(declare-fun b!1007014 () Bool)

(assert (=> b!1007014 (= e!566770 (bvsge (x!87818 lt!445009) #b01111111111111111111111111111110))))

(declare-fun b!1007015 () Bool)

(assert (=> b!1007015 (and (bvsge (index!40429 lt!445009) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445009) (size!31084 a!3219)))))

(declare-fun res!675977 () Bool)

(assert (=> b!1007015 (= res!675977 (= (select (arr!30582 a!3219) (index!40429 lt!445009)) (select (arr!30582 a!3219) j!170)))))

(assert (=> b!1007015 (=> res!675977 e!566768)))

(assert (=> b!1007015 (= e!566767 e!566768)))

(declare-fun b!1007016 () Bool)

(assert (=> b!1007016 (= e!566771 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30582 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007017 () Bool)

(assert (=> b!1007017 (= e!566769 (Intermediate!9514 true index!1507 x!1245))))

(declare-fun b!1007018 () Bool)

(assert (=> b!1007018 (= e!566769 e!566771)))

(declare-fun c!101671 () Bool)

(assert (=> b!1007018 (= c!101671 (or (= lt!445008 (select (arr!30582 a!3219) j!170)) (= (bvadd lt!445008 lt!445008) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!119661 c!101669) b!1007017))

(assert (= (and d!119661 (not c!101669)) b!1007018))

(assert (= (and b!1007018 c!101671) b!1007011))

(assert (= (and b!1007018 (not c!101671)) b!1007016))

(assert (= (and d!119661 c!101670) b!1007014))

(assert (= (and d!119661 (not c!101670)) b!1007010))

(assert (= (and b!1007010 res!675978) b!1007015))

(assert (= (and b!1007015 (not res!675977)) b!1007012))

(assert (= (and b!1007012 (not res!675979)) b!1007013))

(declare-fun m!932005 () Bool)

(assert (=> b!1007013 m!932005))

(assert (=> b!1007012 m!932005))

(assert (=> b!1007015 m!932005))

(declare-fun m!932007 () Bool)

(assert (=> d!119661 m!932007))

(assert (=> d!119661 m!931905))

(declare-fun m!932009 () Bool)

(assert (=> b!1007016 m!932009))

(assert (=> b!1007016 m!932009))

(assert (=> b!1007016 m!931895))

(declare-fun m!932011 () Bool)

(assert (=> b!1007016 m!932011))

(assert (=> b!1006822 d!119661))

(declare-fun bm!42353 () Bool)

(declare-fun call!42356 () Bool)

(assert (=> bm!42353 (= call!42356 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun d!119663 () Bool)

(declare-fun res!675986 () Bool)

(declare-fun e!566781 () Bool)

(assert (=> d!119663 (=> res!675986 e!566781)))

(assert (=> d!119663 (= res!675986 (bvsge #b00000000000000000000000000000000 (size!31084 a!3219)))))

(assert (=> d!119663 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566781)))

(declare-fun b!1007031 () Bool)

(declare-fun e!566783 () Bool)

(declare-fun e!566782 () Bool)

(assert (=> b!1007031 (= e!566783 e!566782)))

(declare-fun lt!445021 () (_ BitVec 64))

(assert (=> b!1007031 (= lt!445021 (select (arr!30582 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33014 0))(
  ( (Unit!33015) )
))
(declare-fun lt!445020 () Unit!33014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63519 (_ BitVec 64) (_ BitVec 32)) Unit!33014)

(assert (=> b!1007031 (= lt!445020 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445021 #b00000000000000000000000000000000))))

(assert (=> b!1007031 (arrayContainsKey!0 a!3219 lt!445021 #b00000000000000000000000000000000)))

(declare-fun lt!445019 () Unit!33014)

(assert (=> b!1007031 (= lt!445019 lt!445020)))

(declare-fun res!675987 () Bool)

(assert (=> b!1007031 (= res!675987 (= (seekEntryOrOpen!0 (select (arr!30582 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9514 #b00000000000000000000000000000000)))))

(assert (=> b!1007031 (=> (not res!675987) (not e!566782))))

(declare-fun b!1007032 () Bool)

(assert (=> b!1007032 (= e!566783 call!42356)))

(declare-fun b!1007033 () Bool)

(assert (=> b!1007033 (= e!566782 call!42356)))

(declare-fun b!1007034 () Bool)

(assert (=> b!1007034 (= e!566781 e!566783)))

(declare-fun c!101675 () Bool)

(assert (=> b!1007034 (= c!101675 (validKeyInArray!0 (select (arr!30582 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119663 (not res!675986)) b!1007034))

(assert (= (and b!1007034 c!101675) b!1007031))

(assert (= (and b!1007034 (not c!101675)) b!1007032))

(assert (= (and b!1007031 res!675987) b!1007033))

(assert (= (or b!1007033 b!1007032) bm!42353))

(declare-fun m!932021 () Bool)

(assert (=> bm!42353 m!932021))

(declare-fun m!932023 () Bool)

(assert (=> b!1007031 m!932023))

(declare-fun m!932025 () Bool)

(assert (=> b!1007031 m!932025))

(declare-fun m!932027 () Bool)

(assert (=> b!1007031 m!932027))

(assert (=> b!1007031 m!932023))

(declare-fun m!932029 () Bool)

(assert (=> b!1007031 m!932029))

(assert (=> b!1007034 m!932023))

(assert (=> b!1007034 m!932023))

(declare-fun m!932031 () Bool)

(assert (=> b!1007034 m!932031))

(assert (=> b!1006817 d!119663))

(declare-fun d!119665 () Bool)

(assert (=> d!119665 (= (validKeyInArray!0 (select (arr!30582 a!3219) j!170)) (and (not (= (select (arr!30582 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30582 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006816 d!119665))

(declare-fun bm!42356 () Bool)

(declare-fun call!42359 () Bool)

(declare-fun c!101687 () Bool)

(assert (=> bm!42356 (= call!42359 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101687 (Cons!21254 (select (arr!30582 a!3219) #b00000000000000000000000000000000) Nil!21255) Nil!21255)))))

(declare-fun b!1007063 () Bool)

(declare-fun e!566802 () Bool)

(declare-fun contains!5887 (List!21258 (_ BitVec 64)) Bool)

(assert (=> b!1007063 (= e!566802 (contains!5887 Nil!21255 (select (arr!30582 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1007064 () Bool)

(declare-fun e!566801 () Bool)

(declare-fun e!566804 () Bool)

(assert (=> b!1007064 (= e!566801 e!566804)))

(declare-fun res!675996 () Bool)

(assert (=> b!1007064 (=> (not res!675996) (not e!566804))))

(assert (=> b!1007064 (= res!675996 (not e!566802))))

(declare-fun res!675995 () Bool)

(assert (=> b!1007064 (=> (not res!675995) (not e!566802))))

(assert (=> b!1007064 (= res!675995 (validKeyInArray!0 (select (arr!30582 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1007065 () Bool)

(declare-fun e!566803 () Bool)

(assert (=> b!1007065 (= e!566804 e!566803)))

(assert (=> b!1007065 (= c!101687 (validKeyInArray!0 (select (arr!30582 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119667 () Bool)

(declare-fun res!675994 () Bool)

(assert (=> d!119667 (=> res!675994 e!566801)))

(assert (=> d!119667 (= res!675994 (bvsge #b00000000000000000000000000000000 (size!31084 a!3219)))))

(assert (=> d!119667 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21255) e!566801)))

(declare-fun b!1007066 () Bool)

(assert (=> b!1007066 (= e!566803 call!42359)))

(declare-fun b!1007067 () Bool)

(assert (=> b!1007067 (= e!566803 call!42359)))

(assert (= (and d!119667 (not res!675994)) b!1007064))

(assert (= (and b!1007064 res!675995) b!1007063))

(assert (= (and b!1007064 res!675996) b!1007065))

(assert (= (and b!1007065 c!101687) b!1007066))

(assert (= (and b!1007065 (not c!101687)) b!1007067))

(assert (= (or b!1007066 b!1007067) bm!42356))

(assert (=> bm!42356 m!932023))

(declare-fun m!932047 () Bool)

(assert (=> bm!42356 m!932047))

(assert (=> b!1007063 m!932023))

(assert (=> b!1007063 m!932023))

(declare-fun m!932049 () Bool)

(assert (=> b!1007063 m!932049))

(assert (=> b!1007064 m!932023))

(assert (=> b!1007064 m!932023))

(assert (=> b!1007064 m!932031))

(assert (=> b!1007065 m!932023))

(assert (=> b!1007065 m!932023))

(assert (=> b!1007065 m!932031))

(assert (=> b!1006827 d!119667))

(declare-fun b!1007068 () Bool)

(declare-fun e!566808 () Bool)

(declare-fun e!566805 () Bool)

(assert (=> b!1007068 (= e!566808 e!566805)))

(declare-fun res!675998 () Bool)

(declare-fun lt!445032 () SeekEntryResult!9514)

(assert (=> b!1007068 (= res!675998 (and (is-Intermediate!9514 lt!445032) (not (undefined!10326 lt!445032)) (bvslt (x!87818 lt!445032) #b01111111111111111111111111111110) (bvsge (x!87818 lt!445032) #b00000000000000000000000000000000) (bvsge (x!87818 lt!445032) x!1245)))))

(assert (=> b!1007068 (=> (not res!675998) (not e!566805))))

(declare-fun b!1007069 () Bool)

(declare-fun e!566809 () SeekEntryResult!9514)

(assert (=> b!1007069 (= e!566809 (Intermediate!9514 false index!1507 x!1245))))

(declare-fun b!1007070 () Bool)

(assert (=> b!1007070 (and (bvsge (index!40429 lt!445032) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445032) (size!31084 lt!444933)))))

(declare-fun res!675999 () Bool)

(assert (=> b!1007070 (= res!675999 (= (select (arr!30582 lt!444933) (index!40429 lt!445032)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566806 () Bool)

(assert (=> b!1007070 (=> res!675999 e!566806)))

(declare-fun b!1007071 () Bool)

(assert (=> b!1007071 (and (bvsge (index!40429 lt!445032) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445032) (size!31084 lt!444933)))))

(assert (=> b!1007071 (= e!566806 (= (select (arr!30582 lt!444933) (index!40429 lt!445032)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119671 () Bool)

(assert (=> d!119671 e!566808))

(declare-fun c!101689 () Bool)

(assert (=> d!119671 (= c!101689 (and (is-Intermediate!9514 lt!445032) (undefined!10326 lt!445032)))))

(declare-fun e!566807 () SeekEntryResult!9514)

(assert (=> d!119671 (= lt!445032 e!566807)))

(declare-fun c!101688 () Bool)

(assert (=> d!119671 (= c!101688 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!445031 () (_ BitVec 64))

(assert (=> d!119671 (= lt!445031 (select (arr!30582 lt!444933) index!1507))))

(assert (=> d!119671 (validMask!0 mask!3464)))

(assert (=> d!119671 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444934 lt!444933 mask!3464) lt!445032)))

(declare-fun b!1007072 () Bool)

(assert (=> b!1007072 (= e!566808 (bvsge (x!87818 lt!445032) #b01111111111111111111111111111110))))

(declare-fun b!1007073 () Bool)

(assert (=> b!1007073 (and (bvsge (index!40429 lt!445032) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445032) (size!31084 lt!444933)))))

(declare-fun res!675997 () Bool)

(assert (=> b!1007073 (= res!675997 (= (select (arr!30582 lt!444933) (index!40429 lt!445032)) lt!444934))))

(assert (=> b!1007073 (=> res!675997 e!566806)))

(assert (=> b!1007073 (= e!566805 e!566806)))

(declare-fun b!1007074 () Bool)

(assert (=> b!1007074 (= e!566809 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444934 lt!444933 mask!3464))))

(declare-fun b!1007075 () Bool)

(assert (=> b!1007075 (= e!566807 (Intermediate!9514 true index!1507 x!1245))))

(declare-fun b!1007076 () Bool)

(assert (=> b!1007076 (= e!566807 e!566809)))

(declare-fun c!101690 () Bool)

(assert (=> b!1007076 (= c!101690 (or (= lt!445031 lt!444934) (= (bvadd lt!445031 lt!445031) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!119671 c!101688) b!1007075))

(assert (= (and d!119671 (not c!101688)) b!1007076))

(assert (= (and b!1007076 c!101690) b!1007069))

(assert (= (and b!1007076 (not c!101690)) b!1007074))

(assert (= (and d!119671 c!101689) b!1007072))

(assert (= (and d!119671 (not c!101689)) b!1007068))

(assert (= (and b!1007068 res!675998) b!1007073))

(assert (= (and b!1007073 (not res!675997)) b!1007070))

(assert (= (and b!1007070 (not res!675999)) b!1007071))

(declare-fun m!932051 () Bool)

(assert (=> b!1007071 m!932051))

(assert (=> b!1007070 m!932051))

(assert (=> b!1007073 m!932051))

(declare-fun m!932053 () Bool)

(assert (=> d!119671 m!932053))

(assert (=> d!119671 m!931905))

(assert (=> b!1007074 m!932009))

(assert (=> b!1007074 m!932009))

(declare-fun m!932055 () Bool)

(assert (=> b!1007074 m!932055))

(assert (=> b!1006815 d!119671))

(declare-fun d!119673 () Bool)

(assert (=> d!119673 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006825 d!119673))

(declare-fun d!119675 () Bool)

(assert (=> d!119675 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86820 d!119675))

(declare-fun d!119681 () Bool)

(assert (=> d!119681 (= (array_inv!23706 a!3219) (bvsge (size!31084 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86820 d!119681))

(declare-fun d!119683 () Bool)

(declare-fun res!676019 () Bool)

(declare-fun e!566836 () Bool)

(assert (=> d!119683 (=> res!676019 e!566836)))

(assert (=> d!119683 (= res!676019 (= (select (arr!30582 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119683 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!566836)))

(declare-fun b!1007112 () Bool)

(declare-fun e!566837 () Bool)

(assert (=> b!1007112 (= e!566836 e!566837)))

(declare-fun res!676020 () Bool)

(assert (=> b!1007112 (=> (not res!676020) (not e!566837))))

(assert (=> b!1007112 (= res!676020 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31084 a!3219)))))

(declare-fun b!1007113 () Bool)

(assert (=> b!1007113 (= e!566837 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119683 (not res!676019)) b!1007112))

(assert (= (and b!1007112 res!676020) b!1007113))

(assert (=> d!119683 m!932023))

(declare-fun m!932077 () Bool)

(assert (=> b!1007113 m!932077))

(assert (=> b!1006824 d!119683))

(declare-fun b!1007119 () Bool)

(declare-fun e!566845 () Bool)

(declare-fun e!566842 () Bool)

(assert (=> b!1007119 (= e!566845 e!566842)))

(declare-fun res!676025 () Bool)

(declare-fun lt!445045 () SeekEntryResult!9514)

(assert (=> b!1007119 (= res!676025 (and (is-Intermediate!9514 lt!445045) (not (undefined!10326 lt!445045)) (bvslt (x!87818 lt!445045) #b01111111111111111111111111111110) (bvsge (x!87818 lt!445045) #b00000000000000000000000000000000) (bvsge (x!87818 lt!445045) #b00000000000000000000000000000000)))))

(assert (=> b!1007119 (=> (not res!676025) (not e!566842))))

(declare-fun e!566846 () SeekEntryResult!9514)

(declare-fun b!1007120 () Bool)

(assert (=> b!1007120 (= e!566846 (Intermediate!9514 false (toIndex!0 (select (arr!30582 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1007121 () Bool)

(assert (=> b!1007121 (and (bvsge (index!40429 lt!445045) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445045) (size!31084 a!3219)))))

(declare-fun res!676026 () Bool)

(assert (=> b!1007121 (= res!676026 (= (select (arr!30582 a!3219) (index!40429 lt!445045)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566843 () Bool)

(assert (=> b!1007121 (=> res!676026 e!566843)))

(declare-fun b!1007122 () Bool)

(assert (=> b!1007122 (and (bvsge (index!40429 lt!445045) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445045) (size!31084 a!3219)))))

(assert (=> b!1007122 (= e!566843 (= (select (arr!30582 a!3219) (index!40429 lt!445045)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119685 () Bool)

(assert (=> d!119685 e!566845))

(declare-fun c!101701 () Bool)

(assert (=> d!119685 (= c!101701 (and (is-Intermediate!9514 lt!445045) (undefined!10326 lt!445045)))))

(declare-fun e!566844 () SeekEntryResult!9514)

(assert (=> d!119685 (= lt!445045 e!566844)))

(declare-fun c!101700 () Bool)

(assert (=> d!119685 (= c!101700 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!445044 () (_ BitVec 64))

(assert (=> d!119685 (= lt!445044 (select (arr!30582 a!3219) (toIndex!0 (select (arr!30582 a!3219) j!170) mask!3464)))))

(assert (=> d!119685 (validMask!0 mask!3464)))

(assert (=> d!119685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30582 a!3219) j!170) mask!3464) (select (arr!30582 a!3219) j!170) a!3219 mask!3464) lt!445045)))

(declare-fun b!1007123 () Bool)

(assert (=> b!1007123 (= e!566845 (bvsge (x!87818 lt!445045) #b01111111111111111111111111111110))))

(declare-fun b!1007124 () Bool)

(assert (=> b!1007124 (and (bvsge (index!40429 lt!445045) #b00000000000000000000000000000000) (bvslt (index!40429 lt!445045) (size!31084 a!3219)))))

(declare-fun res!676024 () Bool)

(assert (=> b!1007124 (= res!676024 (= (select (arr!30582 a!3219) (index!40429 lt!445045)) (select (arr!30582 a!3219) j!170)))))

(assert (=> b!1007124 (=> res!676024 e!566843)))

(assert (=> b!1007124 (= e!566842 e!566843)))

(declare-fun b!1007125 () Bool)

(assert (=> b!1007125 (= e!566846 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30582 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30582 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007126 () Bool)

(assert (=> b!1007126 (= e!566844 (Intermediate!9514 true (toIndex!0 (select (arr!30582 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1007127 () Bool)

(assert (=> b!1007127 (= e!566844 e!566846)))

(declare-fun c!101702 () Bool)

(assert (=> b!1007127 (= c!101702 (or (= lt!445044 (select (arr!30582 a!3219) j!170)) (= (bvadd lt!445044 lt!445044) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!119685 c!101700) b!1007126))

(assert (= (and d!119685 (not c!101700)) b!1007127))

(assert (= (and b!1007127 c!101702) b!1007120))

(assert (= (and b!1007127 (not c!101702)) b!1007125))

(assert (= (and d!119685 c!101701) b!1007123))

(assert (= (and d!119685 (not c!101701)) b!1007119))

(assert (= (and b!1007119 res!676025) b!1007124))

(assert (= (and b!1007124 (not res!676024)) b!1007121))

(assert (= (and b!1007121 (not res!676026)) b!1007122))

(declare-fun m!932083 () Bool)

(assert (=> b!1007122 m!932083))

(assert (=> b!1007121 m!932083))

(assert (=> b!1007124 m!932083))

(assert (=> d!119685 m!931909))

(declare-fun m!932085 () Bool)

(assert (=> d!119685 m!932085))

(assert (=> d!119685 m!931905))

(assert (=> b!1007125 m!931909))

(declare-fun m!932087 () Bool)

(assert (=> b!1007125 m!932087))

(assert (=> b!1007125 m!932087))

(assert (=> b!1007125 m!931895))

(declare-fun m!932089 () Bool)

(assert (=> b!1007125 m!932089))

(assert (=> b!1006819 d!119685))

(declare-fun d!119689 () Bool)

(declare-fun lt!445047 () (_ BitVec 32))

(declare-fun lt!445046 () (_ BitVec 32))

(assert (=> d!119689 (= lt!445047 (bvmul (bvxor lt!445046 (bvlshr lt!445046 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119689 (= lt!445046 ((_ extract 31 0) (bvand (bvxor (select (arr!30582 a!3219) j!170) (bvlshr (select (arr!30582 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119689 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!675972 (let ((h!22440 ((_ extract 31 0) (bvand (bvxor (select (arr!30582 a!3219) j!170) (bvlshr (select (arr!30582 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87824 (bvmul (bvxor h!22440 (bvlshr h!22440 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87824 (bvlshr x!87824 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!675972 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!675972 #b00000000000000000000000000000000))))))

(assert (=> d!119689 (= (toIndex!0 (select (arr!30582 a!3219) j!170) mask!3464) (bvand (bvxor lt!445047 (bvlshr lt!445047 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006819 d!119689))

(push 1)

