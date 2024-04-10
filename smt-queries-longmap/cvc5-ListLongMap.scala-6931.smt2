; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87198 () Bool)

(assert start!87198)

(declare-fun b!1010987 () Bool)

(declare-fun e!568744 () Bool)

(declare-fun e!568746 () Bool)

(assert (=> b!1010987 (= e!568744 e!568746)))

(declare-fun res!679176 () Bool)

(assert (=> b!1010987 (=> (not res!679176) (not e!568746))))

(declare-datatypes ((SeekEntryResult!9578 0))(
  ( (MissingZero!9578 (index!40683 (_ BitVec 32))) (Found!9578 (index!40684 (_ BitVec 32))) (Intermediate!9578 (undefined!10390 Bool) (index!40685 (_ BitVec 32)) (x!88095 (_ BitVec 32))) (Undefined!9578) (MissingVacant!9578 (index!40686 (_ BitVec 32))) )
))
(declare-fun lt!446840 () SeekEntryResult!9578)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010987 (= res!679176 (or (= lt!446840 (MissingVacant!9578 i!1194)) (= lt!446840 (MissingZero!9578 i!1194))))))

(declare-datatypes ((array!63659 0))(
  ( (array!63660 (arr!30646 (Array (_ BitVec 32) (_ BitVec 64))) (size!31148 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63659)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63659 (_ BitVec 32)) SeekEntryResult!9578)

(assert (=> b!1010987 (= lt!446840 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010988 () Bool)

(declare-fun res!679172 () Bool)

(assert (=> b!1010988 (=> (not res!679172) (not e!568746))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010988 (= res!679172 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31148 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31148 a!3219))))))

(declare-fun e!568750 () Bool)

(declare-fun b!1010989 () Bool)

(declare-fun lt!446844 () (_ BitVec 32))

(declare-fun lt!446843 () array!63659)

(declare-fun lt!446842 () SeekEntryResult!9578)

(declare-fun lt!446837 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63659 (_ BitVec 32)) SeekEntryResult!9578)

(assert (=> b!1010989 (= e!568750 (= lt!446842 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446844 lt!446837 lt!446843 mask!3464)))))

(declare-fun res!679182 () Bool)

(assert (=> start!87198 (=> (not res!679182) (not e!568744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87198 (= res!679182 (validMask!0 mask!3464))))

(assert (=> start!87198 e!568744))

(declare-fun array_inv!23770 (array!63659) Bool)

(assert (=> start!87198 (array_inv!23770 a!3219)))

(assert (=> start!87198 true))

(declare-fun b!1010990 () Bool)

(declare-fun res!679177 () Bool)

(declare-fun e!568749 () Bool)

(assert (=> b!1010990 (=> (not res!679177) (not e!568749))))

(assert (=> b!1010990 (= res!679177 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010991 () Bool)

(declare-fun res!679167 () Bool)

(assert (=> b!1010991 (=> (not res!679167) (not e!568746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63659 (_ BitVec 32)) Bool)

(assert (=> b!1010991 (= res!679167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010992 () Bool)

(declare-fun res!679175 () Bool)

(assert (=> b!1010992 (=> (not res!679175) (not e!568744))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010992 (= res!679175 (validKeyInArray!0 (select (arr!30646 a!3219) j!170)))))

(declare-fun b!1010993 () Bool)

(declare-fun res!679178 () Bool)

(assert (=> b!1010993 (=> (not res!679178) (not e!568744))))

(assert (=> b!1010993 (= res!679178 (validKeyInArray!0 k!2224))))

(declare-fun b!1010994 () Bool)

(declare-fun e!568745 () Bool)

(declare-fun e!568747 () Bool)

(assert (=> b!1010994 (= e!568745 e!568747)))

(declare-fun res!679179 () Bool)

(assert (=> b!1010994 (=> (not res!679179) (not e!568747))))

(declare-fun lt!446841 () SeekEntryResult!9578)

(declare-fun lt!446839 () SeekEntryResult!9578)

(assert (=> b!1010994 (= res!679179 (= lt!446841 lt!446839))))

(assert (=> b!1010994 (= lt!446841 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30646 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010995 () Bool)

(assert (=> b!1010995 (= e!568747 e!568749)))

(declare-fun res!679174 () Bool)

(assert (=> b!1010995 (=> (not res!679174) (not e!568749))))

(declare-fun lt!446838 () SeekEntryResult!9578)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010995 (= res!679174 (not (= lt!446838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446837 mask!3464) lt!446837 lt!446843 mask!3464))))))

(assert (=> b!1010995 (= lt!446837 (select (store (arr!30646 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010995 (= lt!446843 (array!63660 (store (arr!30646 a!3219) i!1194 k!2224) (size!31148 a!3219)))))

(declare-fun b!1010996 () Bool)

(declare-fun res!679169 () Bool)

(assert (=> b!1010996 (=> (not res!679169) (not e!568749))))

(assert (=> b!1010996 (= res!679169 (not (= lt!446841 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446837 lt!446843 mask!3464))))))

(declare-fun b!1010997 () Bool)

(declare-fun res!679168 () Bool)

(assert (=> b!1010997 (=> (not res!679168) (not e!568746))))

(declare-datatypes ((List!21322 0))(
  ( (Nil!21319) (Cons!21318 (h!22513 (_ BitVec 64)) (t!30323 List!21322)) )
))
(declare-fun arrayNoDuplicates!0 (array!63659 (_ BitVec 32) List!21322) Bool)

(assert (=> b!1010997 (= res!679168 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21319))))

(declare-fun b!1010998 () Bool)

(declare-fun res!679170 () Bool)

(assert (=> b!1010998 (=> (not res!679170) (not e!568744))))

(declare-fun arrayContainsKey!0 (array!63659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010998 (= res!679170 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010999 () Bool)

(assert (=> b!1010999 (= e!568746 e!568745)))

(declare-fun res!679181 () Bool)

(assert (=> b!1010999 (=> (not res!679181) (not e!568745))))

(assert (=> b!1010999 (= res!679181 (= lt!446838 lt!446839))))

(assert (=> b!1010999 (= lt!446839 (Intermediate!9578 false resIndex!38 resX!38))))

(assert (=> b!1010999 (= lt!446838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30646 a!3219) j!170) mask!3464) (select (arr!30646 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011000 () Bool)

(declare-fun res!679171 () Bool)

(assert (=> b!1011000 (=> (not res!679171) (not e!568744))))

(assert (=> b!1011000 (= res!679171 (and (= (size!31148 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31148 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31148 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011001 () Bool)

(declare-fun e!568748 () Bool)

(assert (=> b!1011001 (= e!568749 e!568748)))

(declare-fun res!679173 () Bool)

(assert (=> b!1011001 (=> (not res!679173) (not e!568748))))

(assert (=> b!1011001 (= res!679173 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446844 #b00000000000000000000000000000000) (bvslt lt!446844 (size!31148 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011001 (= lt!446844 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011002 () Bool)

(assert (=> b!1011002 (= e!568748 e!568750)))

(declare-fun res!679180 () Bool)

(assert (=> b!1011002 (=> (not res!679180) (not e!568750))))

(assert (=> b!1011002 (= res!679180 (= lt!446842 lt!446839))))

(assert (=> b!1011002 (= lt!446842 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446844 (select (arr!30646 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87198 res!679182) b!1011000))

(assert (= (and b!1011000 res!679171) b!1010992))

(assert (= (and b!1010992 res!679175) b!1010993))

(assert (= (and b!1010993 res!679178) b!1010998))

(assert (= (and b!1010998 res!679170) b!1010987))

(assert (= (and b!1010987 res!679176) b!1010991))

(assert (= (and b!1010991 res!679167) b!1010997))

(assert (= (and b!1010997 res!679168) b!1010988))

(assert (= (and b!1010988 res!679172) b!1010999))

(assert (= (and b!1010999 res!679181) b!1010994))

(assert (= (and b!1010994 res!679179) b!1010995))

(assert (= (and b!1010995 res!679174) b!1010996))

(assert (= (and b!1010996 res!679169) b!1010990))

(assert (= (and b!1010990 res!679177) b!1011001))

(assert (= (and b!1011001 res!679173) b!1011002))

(assert (= (and b!1011002 res!679180) b!1010989))

(declare-fun m!935145 () Bool)

(assert (=> b!1010995 m!935145))

(assert (=> b!1010995 m!935145))

(declare-fun m!935147 () Bool)

(assert (=> b!1010995 m!935147))

(declare-fun m!935149 () Bool)

(assert (=> b!1010995 m!935149))

(declare-fun m!935151 () Bool)

(assert (=> b!1010995 m!935151))

(declare-fun m!935153 () Bool)

(assert (=> b!1011001 m!935153))

(declare-fun m!935155 () Bool)

(assert (=> b!1010996 m!935155))

(declare-fun m!935157 () Bool)

(assert (=> b!1010997 m!935157))

(declare-fun m!935159 () Bool)

(assert (=> b!1010999 m!935159))

(assert (=> b!1010999 m!935159))

(declare-fun m!935161 () Bool)

(assert (=> b!1010999 m!935161))

(assert (=> b!1010999 m!935161))

(assert (=> b!1010999 m!935159))

(declare-fun m!935163 () Bool)

(assert (=> b!1010999 m!935163))

(declare-fun m!935165 () Bool)

(assert (=> b!1010991 m!935165))

(declare-fun m!935167 () Bool)

(assert (=> b!1010998 m!935167))

(declare-fun m!935169 () Bool)

(assert (=> b!1010993 m!935169))

(declare-fun m!935171 () Bool)

(assert (=> b!1010987 m!935171))

(assert (=> b!1010992 m!935159))

(assert (=> b!1010992 m!935159))

(declare-fun m!935173 () Bool)

(assert (=> b!1010992 m!935173))

(declare-fun m!935175 () Bool)

(assert (=> start!87198 m!935175))

(declare-fun m!935177 () Bool)

(assert (=> start!87198 m!935177))

(assert (=> b!1010994 m!935159))

(assert (=> b!1010994 m!935159))

(declare-fun m!935179 () Bool)

(assert (=> b!1010994 m!935179))

(assert (=> b!1011002 m!935159))

(assert (=> b!1011002 m!935159))

(declare-fun m!935181 () Bool)

(assert (=> b!1011002 m!935181))

(declare-fun m!935183 () Bool)

(assert (=> b!1010989 m!935183))

(push 1)

(assert (not b!1011001))

(assert (not b!1010987))

(assert (not b!1010995))

(assert (not b!1010997))

(assert (not b!1010996))

(assert (not b!1010992))

(assert (not b!1010989))

(assert (not b!1010991))

(assert (not b!1010999))

(assert (not start!87198))

(assert (not b!1010998))

(assert (not b!1010993))

(assert (not b!1011002))

(assert (not b!1010994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120095 () Bool)

(assert (=> d!120095 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010993 d!120095))

(declare-fun b!1011228 () Bool)

(declare-fun lt!446926 () SeekEntryResult!9578)

(assert (=> b!1011228 (and (bvsge (index!40685 lt!446926) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446926) (size!31148 lt!446843)))))

(declare-fun e!568877 () Bool)

(assert (=> b!1011228 (= e!568877 (= (select (arr!30646 lt!446843) (index!40685 lt!446926)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011229 () Bool)

(declare-fun e!568876 () SeekEntryResult!9578)

(assert (=> b!1011229 (= e!568876 (Intermediate!9578 true (toIndex!0 lt!446837 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011230 () Bool)

(declare-fun e!568879 () SeekEntryResult!9578)

(assert (=> b!1011230 (= e!568879 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446837 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446837 lt!446843 mask!3464))))

(declare-fun b!1011231 () Bool)

(assert (=> b!1011231 (= e!568879 (Intermediate!9578 false (toIndex!0 lt!446837 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011232 () Bool)

(assert (=> b!1011232 (= e!568876 e!568879)))

(declare-fun c!102114 () Bool)

(declare-fun lt!446925 () (_ BitVec 64))

(assert (=> b!1011232 (= c!102114 (or (= lt!446925 lt!446837) (= (bvadd lt!446925 lt!446925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011233 () Bool)

(declare-fun e!568878 () Bool)

(declare-fun e!568880 () Bool)

(assert (=> b!1011233 (= e!568878 e!568880)))

(declare-fun res!679324 () Bool)

(assert (=> b!1011233 (= res!679324 (and (is-Intermediate!9578 lt!446926) (not (undefined!10390 lt!446926)) (bvslt (x!88095 lt!446926) #b01111111111111111111111111111110) (bvsge (x!88095 lt!446926) #b00000000000000000000000000000000) (bvsge (x!88095 lt!446926) #b00000000000000000000000000000000)))))

(assert (=> b!1011233 (=> (not res!679324) (not e!568880))))

(declare-fun b!1011234 () Bool)

(assert (=> b!1011234 (and (bvsge (index!40685 lt!446926) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446926) (size!31148 lt!446843)))))

(declare-fun res!679326 () Bool)

(assert (=> b!1011234 (= res!679326 (= (select (arr!30646 lt!446843) (index!40685 lt!446926)) lt!446837))))

(assert (=> b!1011234 (=> res!679326 e!568877)))

(assert (=> b!1011234 (= e!568880 e!568877)))

(declare-fun d!120101 () Bool)

(assert (=> d!120101 e!568878))

(declare-fun c!102112 () Bool)

(assert (=> d!120101 (= c!102112 (and (is-Intermediate!9578 lt!446926) (undefined!10390 lt!446926)))))

(assert (=> d!120101 (= lt!446926 e!568876)))

(declare-fun c!102113 () Bool)

(assert (=> d!120101 (= c!102113 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120101 (= lt!446925 (select (arr!30646 lt!446843) (toIndex!0 lt!446837 mask!3464)))))

(assert (=> d!120101 (validMask!0 mask!3464)))

(assert (=> d!120101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446837 mask!3464) lt!446837 lt!446843 mask!3464) lt!446926)))

(declare-fun b!1011235 () Bool)

(assert (=> b!1011235 (= e!568878 (bvsge (x!88095 lt!446926) #b01111111111111111111111111111110))))

(declare-fun b!1011236 () Bool)

(assert (=> b!1011236 (and (bvsge (index!40685 lt!446926) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446926) (size!31148 lt!446843)))))

(declare-fun res!679325 () Bool)

(assert (=> b!1011236 (= res!679325 (= (select (arr!30646 lt!446843) (index!40685 lt!446926)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011236 (=> res!679325 e!568877)))

(assert (= (and d!120101 c!102113) b!1011229))

(assert (= (and d!120101 (not c!102113)) b!1011232))

(assert (= (and b!1011232 c!102114) b!1011231))

(assert (= (and b!1011232 (not c!102114)) b!1011230))

(assert (= (and d!120101 c!102112) b!1011235))

(assert (= (and d!120101 (not c!102112)) b!1011233))

(assert (= (and b!1011233 res!679324) b!1011234))

(assert (= (and b!1011234 (not res!679326)) b!1011236))

(assert (= (and b!1011236 (not res!679325)) b!1011228))

(declare-fun m!935319 () Bool)

(assert (=> b!1011228 m!935319))

(assert (=> b!1011236 m!935319))

(assert (=> b!1011230 m!935145))

(declare-fun m!935321 () Bool)

(assert (=> b!1011230 m!935321))

(assert (=> b!1011230 m!935321))

(declare-fun m!935325 () Bool)

(assert (=> b!1011230 m!935325))

(assert (=> d!120101 m!935145))

(declare-fun m!935329 () Bool)

(assert (=> d!120101 m!935329))

(assert (=> d!120101 m!935175))

(assert (=> b!1011234 m!935319))

(assert (=> b!1010995 d!120101))

(declare-fun d!120117 () Bool)

(declare-fun lt!446946 () (_ BitVec 32))

(declare-fun lt!446945 () (_ BitVec 32))

(assert (=> d!120117 (= lt!446946 (bvmul (bvxor lt!446945 (bvlshr lt!446945 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120117 (= lt!446945 ((_ extract 31 0) (bvand (bvxor lt!446837 (bvlshr lt!446837 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120117 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679331 (let ((h!22517 ((_ extract 31 0) (bvand (bvxor lt!446837 (bvlshr lt!446837 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88103 (bvmul (bvxor h!22517 (bvlshr h!22517 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88103 (bvlshr x!88103 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679331 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679331 #b00000000000000000000000000000000))))))

(assert (=> d!120117 (= (toIndex!0 lt!446837 mask!3464) (bvand (bvxor lt!446946 (bvlshr lt!446946 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010995 d!120117))

(declare-fun b!1011255 () Bool)

(declare-fun lt!446950 () SeekEntryResult!9578)

(assert (=> b!1011255 (and (bvsge (index!40685 lt!446950) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446950) (size!31148 a!3219)))))

(declare-fun e!568892 () Bool)

(assert (=> b!1011255 (= e!568892 (= (select (arr!30646 a!3219) (index!40685 lt!446950)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011256 () Bool)

(declare-fun e!568891 () SeekEntryResult!9578)

(assert (=> b!1011256 (= e!568891 (Intermediate!9578 true index!1507 x!1245))))

(declare-fun b!1011257 () Bool)

(declare-fun e!568894 () SeekEntryResult!9578)

(assert (=> b!1011257 (= e!568894 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30646 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011258 () Bool)

(assert (=> b!1011258 (= e!568894 (Intermediate!9578 false index!1507 x!1245))))

(declare-fun b!1011259 () Bool)

(assert (=> b!1011259 (= e!568891 e!568894)))

(declare-fun c!102123 () Bool)

(declare-fun lt!446949 () (_ BitVec 64))

(assert (=> b!1011259 (= c!102123 (or (= lt!446949 (select (arr!30646 a!3219) j!170)) (= (bvadd lt!446949 lt!446949) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011260 () Bool)

(declare-fun e!568893 () Bool)

(declare-fun e!568895 () Bool)

(assert (=> b!1011260 (= e!568893 e!568895)))

(declare-fun res!679336 () Bool)

(assert (=> b!1011260 (= res!679336 (and (is-Intermediate!9578 lt!446950) (not (undefined!10390 lt!446950)) (bvslt (x!88095 lt!446950) #b01111111111111111111111111111110) (bvsge (x!88095 lt!446950) #b00000000000000000000000000000000) (bvsge (x!88095 lt!446950) x!1245)))))

(assert (=> b!1011260 (=> (not res!679336) (not e!568895))))

(declare-fun b!1011261 () Bool)

(assert (=> b!1011261 (and (bvsge (index!40685 lt!446950) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446950) (size!31148 a!3219)))))

(declare-fun res!679338 () Bool)

(assert (=> b!1011261 (= res!679338 (= (select (arr!30646 a!3219) (index!40685 lt!446950)) (select (arr!30646 a!3219) j!170)))))

(assert (=> b!1011261 (=> res!679338 e!568892)))

(assert (=> b!1011261 (= e!568895 e!568892)))

(declare-fun d!120123 () Bool)

(assert (=> d!120123 e!568893))

(declare-fun c!102121 () Bool)

(assert (=> d!120123 (= c!102121 (and (is-Intermediate!9578 lt!446950) (undefined!10390 lt!446950)))))

(assert (=> d!120123 (= lt!446950 e!568891)))

(declare-fun c!102122 () Bool)

(assert (=> d!120123 (= c!102122 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120123 (= lt!446949 (select (arr!30646 a!3219) index!1507))))

(assert (=> d!120123 (validMask!0 mask!3464)))

(assert (=> d!120123 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30646 a!3219) j!170) a!3219 mask!3464) lt!446950)))

(declare-fun b!1011262 () Bool)

(assert (=> b!1011262 (= e!568893 (bvsge (x!88095 lt!446950) #b01111111111111111111111111111110))))

(declare-fun b!1011263 () Bool)

(assert (=> b!1011263 (and (bvsge (index!40685 lt!446950) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446950) (size!31148 a!3219)))))

(declare-fun res!679337 () Bool)

(assert (=> b!1011263 (= res!679337 (= (select (arr!30646 a!3219) (index!40685 lt!446950)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011263 (=> res!679337 e!568892)))

(assert (= (and d!120123 c!102122) b!1011256))

(assert (= (and d!120123 (not c!102122)) b!1011259))

(assert (= (and b!1011259 c!102123) b!1011258))

(assert (= (and b!1011259 (not c!102123)) b!1011257))

(assert (= (and d!120123 c!102121) b!1011262))

(assert (= (and d!120123 (not c!102121)) b!1011260))

(assert (= (and b!1011260 res!679336) b!1011261))

(assert (= (and b!1011261 (not res!679338)) b!1011263))

(assert (= (and b!1011263 (not res!679337)) b!1011255))

(declare-fun m!935341 () Bool)

(assert (=> b!1011255 m!935341))

(assert (=> b!1011263 m!935341))

(assert (=> b!1011257 m!935153))

(assert (=> b!1011257 m!935153))

(assert (=> b!1011257 m!935159))

(declare-fun m!935343 () Bool)

(assert (=> b!1011257 m!935343))

(declare-fun m!935347 () Bool)

(assert (=> d!120123 m!935347))

(assert (=> d!120123 m!935175))

(assert (=> b!1011261 m!935341))

(assert (=> b!1010994 d!120123))

(declare-fun b!1011273 () Bool)

(declare-fun lt!446954 () SeekEntryResult!9578)

(assert (=> b!1011273 (and (bvsge (index!40685 lt!446954) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446954) (size!31148 lt!446843)))))

(declare-fun e!568902 () Bool)

(assert (=> b!1011273 (= e!568902 (= (select (arr!30646 lt!446843) (index!40685 lt!446954)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011274 () Bool)

(declare-fun e!568901 () SeekEntryResult!9578)

(assert (=> b!1011274 (= e!568901 (Intermediate!9578 true index!1507 x!1245))))

(declare-fun e!568904 () SeekEntryResult!9578)

(declare-fun b!1011275 () Bool)

(assert (=> b!1011275 (= e!568904 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446837 lt!446843 mask!3464))))

(declare-fun b!1011276 () Bool)

(assert (=> b!1011276 (= e!568904 (Intermediate!9578 false index!1507 x!1245))))

(declare-fun b!1011277 () Bool)

(assert (=> b!1011277 (= e!568901 e!568904)))

(declare-fun c!102129 () Bool)

(declare-fun lt!446953 () (_ BitVec 64))

(assert (=> b!1011277 (= c!102129 (or (= lt!446953 lt!446837) (= (bvadd lt!446953 lt!446953) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011278 () Bool)

(declare-fun e!568903 () Bool)

(declare-fun e!568905 () Bool)

(assert (=> b!1011278 (= e!568903 e!568905)))

(declare-fun res!679342 () Bool)

(assert (=> b!1011278 (= res!679342 (and (is-Intermediate!9578 lt!446954) (not (undefined!10390 lt!446954)) (bvslt (x!88095 lt!446954) #b01111111111111111111111111111110) (bvsge (x!88095 lt!446954) #b00000000000000000000000000000000) (bvsge (x!88095 lt!446954) x!1245)))))

(assert (=> b!1011278 (=> (not res!679342) (not e!568905))))

(declare-fun b!1011279 () Bool)

(assert (=> b!1011279 (and (bvsge (index!40685 lt!446954) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446954) (size!31148 lt!446843)))))

(declare-fun res!679344 () Bool)

(assert (=> b!1011279 (= res!679344 (= (select (arr!30646 lt!446843) (index!40685 lt!446954)) lt!446837))))

(assert (=> b!1011279 (=> res!679344 e!568902)))

(assert (=> b!1011279 (= e!568905 e!568902)))

(declare-fun d!120129 () Bool)

(assert (=> d!120129 e!568903))

(declare-fun c!102127 () Bool)

(assert (=> d!120129 (= c!102127 (and (is-Intermediate!9578 lt!446954) (undefined!10390 lt!446954)))))

(assert (=> d!120129 (= lt!446954 e!568901)))

(declare-fun c!102128 () Bool)

(assert (=> d!120129 (= c!102128 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120129 (= lt!446953 (select (arr!30646 lt!446843) index!1507))))

(assert (=> d!120129 (validMask!0 mask!3464)))

(assert (=> d!120129 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446837 lt!446843 mask!3464) lt!446954)))

(declare-fun b!1011280 () Bool)

(assert (=> b!1011280 (= e!568903 (bvsge (x!88095 lt!446954) #b01111111111111111111111111111110))))

(declare-fun b!1011281 () Bool)

(assert (=> b!1011281 (and (bvsge (index!40685 lt!446954) #b00000000000000000000000000000000) (bvslt (index!40685 lt!446954) (size!31148 lt!446843)))))

(declare-fun res!679343 () Bool)

(assert (=> b!1011281 (= res!679343 (= (select (arr!30646 lt!446843) (index!40685 lt!446954)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011281 (=> res!679343 e!568902)))

(assert (= (and d!120129 c!102128) b!1011274))

(assert (= (and d!120129 (not c!102128)) b!1011277))

(assert (= (and b!1011277 c!102129) b!1011276))

(assert (= (and b!1011277 (not c!102129)) b!1011275))

(assert (= (and d!120129 c!102127) b!1011280))

(assert (= (and d!120129 (not c!102127)) b!1011278))

(assert (= (and b!1011278 res!679342) b!1011279))

(assert (= (and b!1011279 (not res!679344)) b!1011281))

(assert (= (and b!1011281 (not res!679343)) b!1011273))

(declare-fun m!935353 () Bool)

(assert (=> b!1011273 m!935353))

(assert (=> b!1011281 m!935353))

(assert (=> b!1011275 m!935153))

(assert (=> b!1011275 m!935153))

(declare-fun m!935355 () Bool)

(assert (=> b!1011275 m!935355))

(declare-fun m!935357 () Bool)

(assert (=> d!120129 m!935357))

(assert (=> d!120129 m!935175))

(assert (=> b!1011279 m!935353))

(assert (=> b!1010996 d!120129))

(declare-fun b!1011336 () Bool)

(declare-fun e!568942 () SeekEntryResult!9578)

(declare-fun lt!446984 () SeekEntryResult!9578)

(assert (=> b!1011336 (= e!568942 (Found!9578 (index!40685 lt!446984)))))

(declare-fun b!1011337 () Bool)

(declare-fun e!568941 () SeekEntryResult!9578)

(assert (=> b!1011337 (= e!568941 (MissingZero!9578 (index!40685 lt!446984)))))

(declare-fun b!1011338 () Bool)

(declare-fun e!568940 () SeekEntryResult!9578)

(assert (=> b!1011338 (= e!568940 Undefined!9578)))

(declare-fun b!1011339 () Bool)

(assert (=> b!1011339 (= e!568940 e!568942)))

(declare-fun lt!446985 () (_ BitVec 64))

(assert (=> b!1011339 (= lt!446985 (select (arr!30646 a!3219) (index!40685 lt!446984)))))

(declare-fun c!102149 () Bool)

(assert (=> b!1011339 (= c!102149 (= lt!446985 k!2224))))

(declare-fun b!1011340 () Bool)

(declare-fun c!102150 () Bool)

(assert (=> b!1011340 (= c!102150 (= lt!446985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011340 (= e!568942 e!568941)))

(declare-fun d!120133 () Bool)

(declare-fun lt!446983 () SeekEntryResult!9578)

(assert (=> d!120133 (and (or (is-Undefined!9578 lt!446983) (not (is-Found!9578 lt!446983)) (and (bvsge (index!40684 lt!446983) #b00000000000000000000000000000000) (bvslt (index!40684 lt!446983) (size!31148 a!3219)))) (or (is-Undefined!9578 lt!446983) (is-Found!9578 lt!446983) (not (is-MissingZero!9578 lt!446983)) (and (bvsge (index!40683 lt!446983) #b00000000000000000000000000000000) (bvslt (index!40683 lt!446983) (size!31148 a!3219)))) (or (is-Undefined!9578 lt!446983) (is-Found!9578 lt!446983) (is-MissingZero!9578 lt!446983) (not (is-MissingVacant!9578 lt!446983)) (and (bvsge (index!40686 lt!446983) #b00000000000000000000000000000000) (bvslt (index!40686 lt!446983) (size!31148 a!3219)))) (or (is-Undefined!9578 lt!446983) (ite (is-Found!9578 lt!446983) (= (select (arr!30646 a!3219) (index!40684 lt!446983)) k!2224) (ite (is-MissingZero!9578 lt!446983) (= (select (arr!30646 a!3219) (index!40683 lt!446983)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9578 lt!446983) (= (select (arr!30646 a!3219) (index!40686 lt!446983)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!120133 (= lt!446983 e!568940)))

(declare-fun c!102148 () Bool)

(assert (=> d!120133 (= c!102148 (and (is-Intermediate!9578 lt!446984) (undefined!10390 lt!446984)))))

(assert (=> d!120133 (= lt!446984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!120133 (validMask!0 mask!3464)))

(assert (=> d!120133 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!446983)))

(declare-fun b!1011341 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63659 (_ BitVec 32)) SeekEntryResult!9578)

(assert (=> b!1011341 (= e!568941 (seekKeyOrZeroReturnVacant!0 (x!88095 lt!446984) (index!40685 lt!446984) (index!40685 lt!446984) k!2224 a!3219 mask!3464))))

(assert (= (and d!120133 c!102148) b!1011338))

(assert (= (and d!120133 (not c!102148)) b!1011339))

(assert (= (and b!1011339 c!102149) b!1011336))

(assert (= (and b!1011339 (not c!102149)) b!1011340))

(assert (= (and b!1011340 c!102150) b!1011337))

(assert (= (and b!1011340 (not c!102150)) b!1011341))

(declare-fun m!935395 () Bool)

(assert (=> b!1011339 m!935395))

(declare-fun m!935397 () Bool)

(assert (=> d!120133 m!935397))

(declare-fun m!935399 () Bool)

(assert (=> d!120133 m!935399))

(declare-fun m!935401 () Bool)

(assert (=> d!120133 m!935401))

(assert (=> d!120133 m!935399))

(assert (=> d!120133 m!935175))

(declare-fun m!935403 () Bool)

(assert (=> d!120133 m!935403))

(declare-fun m!935405 () Bool)

(assert (=> d!120133 m!935405))

(declare-fun m!935407 () Bool)

(assert (=> b!1011341 m!935407))

(assert (=> b!1010987 d!120133))

(declare-fun d!120151 () Bool)

(assert (=> d!120151 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87198 d!120151))

(declare-fun d!120165 () Bool)

(assert (=> d!120165 (= (array_inv!23770 a!3219) (bvsge (size!31148 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87198 d!120165))

(declare-fun bm!42435 () Bool)

(declare-fun call!42438 () Bool)

(declare-fun c!102165 () Bool)

(assert (=> bm!42435 (= call!42438 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102165 (Cons!21318 (select (arr!30646 a!3219) #b00000000000000000000000000000000) Nil!21319) Nil!21319)))))

(declare-fun b!1011401 () Bool)

(declare-fun e!568984 () Bool)

(declare-fun e!568985 () Bool)

(assert (=> b!1011401 (= e!568984 e!568985)))

(declare-fun res!679394 () Bool)

(assert (=> b!1011401 (=> (not res!679394) (not e!568985))))

(declare-fun e!568986 () Bool)

(assert (=> b!1011401 (= res!679394 (not e!568986))))

(declare-fun res!679395 () Bool)

(assert (=> b!1011401 (=> (not res!679395) (not e!568986))))

(assert (=> b!1011401 (= res!679395 (validKeyInArray!0 (select (arr!30646 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011402 () Bool)

(declare-fun e!568987 () Bool)

(assert (=> b!1011402 (= e!568987 call!42438)))

(declare-fun b!1011403 () Bool)

(assert (=> b!1011403 (= e!568987 call!42438)))

(declare-fun b!1011404 () Bool)

(declare-fun contains!5898 (List!21322 (_ BitVec 64)) Bool)

(assert (=> b!1011404 (= e!568986 (contains!5898 Nil!21319 (select (arr!30646 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011400 () Bool)

(assert (=> b!1011400 (= e!568985 e!568987)))

(assert (=> b!1011400 (= c!102165 (validKeyInArray!0 (select (arr!30646 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!120167 () Bool)

(declare-fun res!679393 () Bool)

(assert (=> d!120167 (=> res!679393 e!568984)))

(assert (=> d!120167 (= res!679393 (bvsge #b00000000000000000000000000000000 (size!31148 a!3219)))))

(assert (=> d!120167 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21319) e!568984)))

(assert (= (and d!120167 (not res!679393)) b!1011401))

(assert (= (and b!1011401 res!679395) b!1011404))

(assert (= (and b!1011401 res!679394) b!1011400))

(assert (= (and b!1011400 c!102165) b!1011402))

(assert (= (and b!1011400 (not c!102165)) b!1011403))

(assert (= (or b!1011402 b!1011403) bm!42435))

(declare-fun m!935437 () Bool)

(assert (=> bm!42435 m!935437))

(declare-fun m!935439 () Bool)

(assert (=> bm!42435 m!935439))

(assert (=> b!1011401 m!935437))

(assert (=> b!1011401 m!935437))

(declare-fun m!935441 () Bool)

(assert (=> b!1011401 m!935441))

(assert (=> b!1011404 m!935437))

(assert (=> b!1011404 m!935437))

(declare-fun m!935443 () Bool)

(assert (=> b!1011404 m!935443))

(assert (=> b!1011400 m!935437))

(assert (=> b!1011400 m!935437))

(assert (=> b!1011400 m!935441))

(assert (=> b!1010997 d!120167))

(declare-fun b!1011405 () Bool)

(declare-fun lt!447000 () SeekEntryResult!9578)

(assert (=> b!1011405 (and (bvsge (index!40685 lt!447000) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447000) (size!31148 a!3219)))))

(declare-fun e!568989 () Bool)

(assert (=> b!1011405 (= e!568989 (= (select (arr!30646 a!3219) (index!40685 lt!447000)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568988 () SeekEntryResult!9578)

(declare-fun b!1011406 () Bool)

(assert (=> b!1011406 (= e!568988 (Intermediate!9578 true (toIndex!0 (select (arr!30646 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011407 () Bool)

(declare-fun e!568991 () SeekEntryResult!9578)

(assert (=> b!1011407 (= e!568991 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30646 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30646 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011408 () Bool)

(assert (=> b!1011408 (= e!568991 (Intermediate!9578 false (toIndex!0 (select (arr!30646 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011409 () Bool)

(assert (=> b!1011409 (= e!568988 e!568991)))

(declare-fun lt!446999 () (_ BitVec 64))

(declare-fun c!102168 () Bool)

(assert (=> b!1011409 (= c!102168 (or (= lt!446999 (select (arr!30646 a!3219) j!170)) (= (bvadd lt!446999 lt!446999) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011410 () Bool)

(declare-fun e!568990 () Bool)

(declare-fun e!568992 () Bool)

(assert (=> b!1011410 (= e!568990 e!568992)))

(declare-fun res!679396 () Bool)

(assert (=> b!1011410 (= res!679396 (and (is-Intermediate!9578 lt!447000) (not (undefined!10390 lt!447000)) (bvslt (x!88095 lt!447000) #b01111111111111111111111111111110) (bvsge (x!88095 lt!447000) #b00000000000000000000000000000000) (bvsge (x!88095 lt!447000) #b00000000000000000000000000000000)))))

(assert (=> b!1011410 (=> (not res!679396) (not e!568992))))

(declare-fun b!1011411 () Bool)

(assert (=> b!1011411 (and (bvsge (index!40685 lt!447000) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447000) (size!31148 a!3219)))))

(declare-fun res!679398 () Bool)

(assert (=> b!1011411 (= res!679398 (= (select (arr!30646 a!3219) (index!40685 lt!447000)) (select (arr!30646 a!3219) j!170)))))

(assert (=> b!1011411 (=> res!679398 e!568989)))

(assert (=> b!1011411 (= e!568992 e!568989)))

(declare-fun d!120171 () Bool)

(assert (=> d!120171 e!568990))

(declare-fun c!102166 () Bool)

(assert (=> d!120171 (= c!102166 (and (is-Intermediate!9578 lt!447000) (undefined!10390 lt!447000)))))

(assert (=> d!120171 (= lt!447000 e!568988)))

(declare-fun c!102167 () Bool)

(assert (=> d!120171 (= c!102167 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120171 (= lt!446999 (select (arr!30646 a!3219) (toIndex!0 (select (arr!30646 a!3219) j!170) mask!3464)))))

(assert (=> d!120171 (validMask!0 mask!3464)))

(assert (=> d!120171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30646 a!3219) j!170) mask!3464) (select (arr!30646 a!3219) j!170) a!3219 mask!3464) lt!447000)))

(declare-fun b!1011412 () Bool)

(assert (=> b!1011412 (= e!568990 (bvsge (x!88095 lt!447000) #b01111111111111111111111111111110))))

(declare-fun b!1011413 () Bool)

(assert (=> b!1011413 (and (bvsge (index!40685 lt!447000) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447000) (size!31148 a!3219)))))

(declare-fun res!679397 () Bool)

(assert (=> b!1011413 (= res!679397 (= (select (arr!30646 a!3219) (index!40685 lt!447000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011413 (=> res!679397 e!568989)))

(assert (= (and d!120171 c!102167) b!1011406))

(assert (= (and d!120171 (not c!102167)) b!1011409))

(assert (= (and b!1011409 c!102168) b!1011408))

(assert (= (and b!1011409 (not c!102168)) b!1011407))

(assert (= (and d!120171 c!102166) b!1011412))

(assert (= (and d!120171 (not c!102166)) b!1011410))

(assert (= (and b!1011410 res!679396) b!1011411))

(assert (= (and b!1011411 (not res!679398)) b!1011413))

(assert (= (and b!1011413 (not res!679397)) b!1011405))

(declare-fun m!935445 () Bool)

(assert (=> b!1011405 m!935445))

(assert (=> b!1011413 m!935445))

(assert (=> b!1011407 m!935161))

(declare-fun m!935447 () Bool)

(assert (=> b!1011407 m!935447))

(assert (=> b!1011407 m!935447))

(assert (=> b!1011407 m!935159))

(declare-fun m!935449 () Bool)

(assert (=> b!1011407 m!935449))

(assert (=> d!120171 m!935161))

(declare-fun m!935451 () Bool)

(assert (=> d!120171 m!935451))

(assert (=> d!120171 m!935175))

(assert (=> b!1011411 m!935445))

(assert (=> b!1010999 d!120171))

(declare-fun d!120173 () Bool)

(declare-fun lt!447002 () (_ BitVec 32))

(declare-fun lt!447001 () (_ BitVec 32))

(assert (=> d!120173 (= lt!447002 (bvmul (bvxor lt!447001 (bvlshr lt!447001 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120173 (= lt!447001 ((_ extract 31 0) (bvand (bvxor (select (arr!30646 a!3219) j!170) (bvlshr (select (arr!30646 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120173 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679331 (let ((h!22517 ((_ extract 31 0) (bvand (bvxor (select (arr!30646 a!3219) j!170) (bvlshr (select (arr!30646 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88103 (bvmul (bvxor h!22517 (bvlshr h!22517 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88103 (bvlshr x!88103 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679331 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679331 #b00000000000000000000000000000000))))))

(assert (=> d!120173 (= (toIndex!0 (select (arr!30646 a!3219) j!170) mask!3464) (bvand (bvxor lt!447002 (bvlshr lt!447002 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010999 d!120173))

(declare-fun d!120175 () Bool)

(declare-fun res!679403 () Bool)

(declare-fun e!568997 () Bool)

(assert (=> d!120175 (=> res!679403 e!568997)))

(assert (=> d!120175 (= res!679403 (= (select (arr!30646 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!120175 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!568997)))

(declare-fun b!1011418 () Bool)

(declare-fun e!568998 () Bool)

(assert (=> b!1011418 (= e!568997 e!568998)))

(declare-fun res!679404 () Bool)

(assert (=> b!1011418 (=> (not res!679404) (not e!568998))))

(assert (=> b!1011418 (= res!679404 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31148 a!3219)))))

(declare-fun b!1011419 () Bool)

(assert (=> b!1011419 (= e!568998 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120175 (not res!679403)) b!1011418))

(assert (= (and b!1011418 res!679404) b!1011419))

(assert (=> d!120175 m!935437))

(declare-fun m!935453 () Bool)

(assert (=> b!1011419 m!935453))

(assert (=> b!1010998 d!120175))

(declare-fun b!1011420 () Bool)

(declare-fun lt!447004 () SeekEntryResult!9578)

(assert (=> b!1011420 (and (bvsge (index!40685 lt!447004) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447004) (size!31148 lt!446843)))))

(declare-fun e!569000 () Bool)

(assert (=> b!1011420 (= e!569000 (= (select (arr!30646 lt!446843) (index!40685 lt!447004)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011421 () Bool)

(declare-fun e!568999 () SeekEntryResult!9578)

(assert (=> b!1011421 (= e!568999 (Intermediate!9578 true lt!446844 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011422 () Bool)

(declare-fun e!569002 () SeekEntryResult!9578)

(assert (=> b!1011422 (= e!569002 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446844 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) lt!446837 lt!446843 mask!3464))))

(declare-fun b!1011423 () Bool)

(assert (=> b!1011423 (= e!569002 (Intermediate!9578 false lt!446844 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011424 () Bool)

(assert (=> b!1011424 (= e!568999 e!569002)))

(declare-fun c!102171 () Bool)

(declare-fun lt!447003 () (_ BitVec 64))

(assert (=> b!1011424 (= c!102171 (or (= lt!447003 lt!446837) (= (bvadd lt!447003 lt!447003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011425 () Bool)

(declare-fun e!569001 () Bool)

(declare-fun e!569003 () Bool)

(assert (=> b!1011425 (= e!569001 e!569003)))

(declare-fun res!679405 () Bool)

(assert (=> b!1011425 (= res!679405 (and (is-Intermediate!9578 lt!447004) (not (undefined!10390 lt!447004)) (bvslt (x!88095 lt!447004) #b01111111111111111111111111111110) (bvsge (x!88095 lt!447004) #b00000000000000000000000000000000) (bvsge (x!88095 lt!447004) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1011425 (=> (not res!679405) (not e!569003))))

(declare-fun b!1011426 () Bool)

(assert (=> b!1011426 (and (bvsge (index!40685 lt!447004) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447004) (size!31148 lt!446843)))))

(declare-fun res!679407 () Bool)

(assert (=> b!1011426 (= res!679407 (= (select (arr!30646 lt!446843) (index!40685 lt!447004)) lt!446837))))

(assert (=> b!1011426 (=> res!679407 e!569000)))

(assert (=> b!1011426 (= e!569003 e!569000)))

(declare-fun d!120177 () Bool)

(assert (=> d!120177 e!569001))

(declare-fun c!102169 () Bool)

(assert (=> d!120177 (= c!102169 (and (is-Intermediate!9578 lt!447004) (undefined!10390 lt!447004)))))

(assert (=> d!120177 (= lt!447004 e!568999)))

(declare-fun c!102170 () Bool)

(assert (=> d!120177 (= c!102170 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120177 (= lt!447003 (select (arr!30646 lt!446843) lt!446844))))

(assert (=> d!120177 (validMask!0 mask!3464)))

(assert (=> d!120177 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446844 lt!446837 lt!446843 mask!3464) lt!447004)))

(declare-fun b!1011427 () Bool)

(assert (=> b!1011427 (= e!569001 (bvsge (x!88095 lt!447004) #b01111111111111111111111111111110))))

(declare-fun b!1011428 () Bool)

(assert (=> b!1011428 (and (bvsge (index!40685 lt!447004) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447004) (size!31148 lt!446843)))))

(declare-fun res!679406 () Bool)

(assert (=> b!1011428 (= res!679406 (= (select (arr!30646 lt!446843) (index!40685 lt!447004)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011428 (=> res!679406 e!569000)))

(assert (= (and d!120177 c!102170) b!1011421))

(assert (= (and d!120177 (not c!102170)) b!1011424))

(assert (= (and b!1011424 c!102171) b!1011423))

(assert (= (and b!1011424 (not c!102171)) b!1011422))

(assert (= (and d!120177 c!102169) b!1011427))

(assert (= (and d!120177 (not c!102169)) b!1011425))

(assert (= (and b!1011425 res!679405) b!1011426))

(assert (= (and b!1011426 (not res!679407)) b!1011428))

(assert (= (and b!1011428 (not res!679406)) b!1011420))

(declare-fun m!935455 () Bool)

(assert (=> b!1011420 m!935455))

(assert (=> b!1011428 m!935455))

(declare-fun m!935457 () Bool)

(assert (=> b!1011422 m!935457))

(assert (=> b!1011422 m!935457))

(declare-fun m!935459 () Bool)

(assert (=> b!1011422 m!935459))

(declare-fun m!935461 () Bool)

(assert (=> d!120177 m!935461))

(assert (=> d!120177 m!935175))

(assert (=> b!1011426 m!935455))

(assert (=> b!1010989 d!120177))

(declare-fun d!120179 () Bool)

(declare-fun res!679412 () Bool)

(declare-fun e!569016 () Bool)

(assert (=> d!120179 (=> res!679412 e!569016)))

(assert (=> d!120179 (= res!679412 (bvsge #b00000000000000000000000000000000 (size!31148 a!3219)))))

(assert (=> d!120179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!569016)))

(declare-fun b!1011445 () Bool)

(declare-fun e!569014 () Bool)

(declare-fun call!42441 () Bool)

(assert (=> b!1011445 (= e!569014 call!42441)))

(declare-fun bm!42438 () Bool)

(assert (=> bm!42438 (= call!42441 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1011446 () Bool)

(declare-fun e!569015 () Bool)

(assert (=> b!1011446 (= e!569015 call!42441)))

(declare-fun b!1011447 () Bool)

(assert (=> b!1011447 (= e!569016 e!569015)))

(declare-fun c!102178 () Bool)

(assert (=> b!1011447 (= c!102178 (validKeyInArray!0 (select (arr!30646 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011448 () Bool)

(assert (=> b!1011448 (= e!569015 e!569014)))

(declare-fun lt!447018 () (_ BitVec 64))

(assert (=> b!1011448 (= lt!447018 (select (arr!30646 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33032 0))(
  ( (Unit!33033) )
))
(declare-fun lt!447019 () Unit!33032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63659 (_ BitVec 64) (_ BitVec 32)) Unit!33032)

(assert (=> b!1011448 (= lt!447019 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!447018 #b00000000000000000000000000000000))))

(assert (=> b!1011448 (arrayContainsKey!0 a!3219 lt!447018 #b00000000000000000000000000000000)))

(declare-fun lt!447017 () Unit!33032)

(assert (=> b!1011448 (= lt!447017 lt!447019)))

(declare-fun res!679413 () Bool)

(assert (=> b!1011448 (= res!679413 (= (seekEntryOrOpen!0 (select (arr!30646 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9578 #b00000000000000000000000000000000)))))

(assert (=> b!1011448 (=> (not res!679413) (not e!569014))))

(assert (= (and d!120179 (not res!679412)) b!1011447))

(assert (= (and b!1011447 c!102178) b!1011448))

(assert (= (and b!1011447 (not c!102178)) b!1011446))

(assert (= (and b!1011448 res!679413) b!1011445))

(assert (= (or b!1011445 b!1011446) bm!42438))

(declare-fun m!935463 () Bool)

(assert (=> bm!42438 m!935463))

(assert (=> b!1011447 m!935437))

(assert (=> b!1011447 m!935437))

(assert (=> b!1011447 m!935441))

(assert (=> b!1011448 m!935437))

(declare-fun m!935465 () Bool)

(assert (=> b!1011448 m!935465))

(declare-fun m!935467 () Bool)

(assert (=> b!1011448 m!935467))

(assert (=> b!1011448 m!935437))

(declare-fun m!935469 () Bool)

(assert (=> b!1011448 m!935469))

(assert (=> b!1010991 d!120179))

(declare-fun d!120181 () Bool)

(declare-fun lt!447022 () (_ BitVec 32))

(assert (=> d!120181 (and (bvsge lt!447022 #b00000000000000000000000000000000) (bvslt lt!447022 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120181 (= lt!447022 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!120181 (validMask!0 mask!3464)))

(assert (=> d!120181 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!447022)))

(declare-fun bs!28736 () Bool)

(assert (= bs!28736 d!120181))

(declare-fun m!935471 () Bool)

(assert (=> bs!28736 m!935471))

(assert (=> bs!28736 m!935175))

(assert (=> b!1011001 d!120181))

(declare-fun d!120183 () Bool)

(assert (=> d!120183 (= (validKeyInArray!0 (select (arr!30646 a!3219) j!170)) (and (not (= (select (arr!30646 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30646 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010992 d!120183))

(declare-fun b!1011453 () Bool)

(declare-fun lt!447024 () SeekEntryResult!9578)

(assert (=> b!1011453 (and (bvsge (index!40685 lt!447024) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447024) (size!31148 a!3219)))))

(declare-fun e!569020 () Bool)

(assert (=> b!1011453 (= e!569020 (= (select (arr!30646 a!3219) (index!40685 lt!447024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011454 () Bool)

(declare-fun e!569019 () SeekEntryResult!9578)

(assert (=> b!1011454 (= e!569019 (Intermediate!9578 true lt!446844 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun e!569022 () SeekEntryResult!9578)

(declare-fun b!1011455 () Bool)

(assert (=> b!1011455 (= e!569022 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446844 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) (select (arr!30646 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011456 () Bool)

(assert (=> b!1011456 (= e!569022 (Intermediate!9578 false lt!446844 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011457 () Bool)

(assert (=> b!1011457 (= e!569019 e!569022)))

(declare-fun c!102183 () Bool)

(declare-fun lt!447023 () (_ BitVec 64))

(assert (=> b!1011457 (= c!102183 (or (= lt!447023 (select (arr!30646 a!3219) j!170)) (= (bvadd lt!447023 lt!447023) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011458 () Bool)

(declare-fun e!569021 () Bool)

(declare-fun e!569023 () Bool)

(assert (=> b!1011458 (= e!569021 e!569023)))

(declare-fun res!679414 () Bool)

(assert (=> b!1011458 (= res!679414 (and (is-Intermediate!9578 lt!447024) (not (undefined!10390 lt!447024)) (bvslt (x!88095 lt!447024) #b01111111111111111111111111111110) (bvsge (x!88095 lt!447024) #b00000000000000000000000000000000) (bvsge (x!88095 lt!447024) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1011458 (=> (not res!679414) (not e!569023))))

(declare-fun b!1011459 () Bool)

(assert (=> b!1011459 (and (bvsge (index!40685 lt!447024) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447024) (size!31148 a!3219)))))

(declare-fun res!679416 () Bool)

(assert (=> b!1011459 (= res!679416 (= (select (arr!30646 a!3219) (index!40685 lt!447024)) (select (arr!30646 a!3219) j!170)))))

(assert (=> b!1011459 (=> res!679416 e!569020)))

(assert (=> b!1011459 (= e!569023 e!569020)))

(declare-fun d!120185 () Bool)

(assert (=> d!120185 e!569021))

(declare-fun c!102181 () Bool)

(assert (=> d!120185 (= c!102181 (and (is-Intermediate!9578 lt!447024) (undefined!10390 lt!447024)))))

(assert (=> d!120185 (= lt!447024 e!569019)))

(declare-fun c!102182 () Bool)

(assert (=> d!120185 (= c!102182 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120185 (= lt!447023 (select (arr!30646 a!3219) lt!446844))))

(assert (=> d!120185 (validMask!0 mask!3464)))

(assert (=> d!120185 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446844 (select (arr!30646 a!3219) j!170) a!3219 mask!3464) lt!447024)))

(declare-fun b!1011460 () Bool)

(assert (=> b!1011460 (= e!569021 (bvsge (x!88095 lt!447024) #b01111111111111111111111111111110))))

(declare-fun b!1011461 () Bool)

(assert (=> b!1011461 (and (bvsge (index!40685 lt!447024) #b00000000000000000000000000000000) (bvslt (index!40685 lt!447024) (size!31148 a!3219)))))

(declare-fun res!679415 () Bool)

(assert (=> b!1011461 (= res!679415 (= (select (arr!30646 a!3219) (index!40685 lt!447024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011461 (=> res!679415 e!569020)))

(assert (= (and d!120185 c!102182) b!1011454))

(assert (= (and d!120185 (not c!102182)) b!1011457))

(assert (= (and b!1011457 c!102183) b!1011456))

(assert (= (and b!1011457 (not c!102183)) b!1011455))

(assert (= (and d!120185 c!102181) b!1011460))

(assert (= (and d!120185 (not c!102181)) b!1011458))

(assert (= (and b!1011458 res!679414) b!1011459))

(assert (= (and b!1011459 (not res!679416)) b!1011461))

(assert (= (and b!1011461 (not res!679415)) b!1011453))

(declare-fun m!935473 () Bool)

(assert (=> b!1011453 m!935473))

(assert (=> b!1011461 m!935473))

(assert (=> b!1011455 m!935457))

(assert (=> b!1011455 m!935457))

(assert (=> b!1011455 m!935159))

(declare-fun m!935475 () Bool)

(assert (=> b!1011455 m!935475))

(declare-fun m!935477 () Bool)

(assert (=> d!120185 m!935477))

(assert (=> d!120185 m!935175))

(assert (=> b!1011459 m!935473))

(assert (=> b!1011002 d!120185))

(push 1)

