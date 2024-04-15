; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121796 () Bool)

(assert start!121796)

(declare-datatypes ((array!96561 0))(
  ( (array!96562 (arr!46615 (Array (_ BitVec 32) (_ BitVec 64))) (size!47167 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96561)

(declare-fun e!800372 () Bool)

(declare-fun lt!623298 () (_ BitVec 32))

(declare-fun b!1414209 () Bool)

(declare-datatypes ((SeekEntryResult!10952 0))(
  ( (MissingZero!10952 (index!46194 (_ BitVec 32))) (Found!10952 (index!46195 (_ BitVec 32))) (Intermediate!10952 (undefined!11764 Bool) (index!46196 (_ BitVec 32)) (x!127788 (_ BitVec 32))) (Undefined!10952) (MissingVacant!10952 (index!46197 (_ BitVec 32))) )
))
(declare-fun lt!623294 () SeekEntryResult!10952)

(declare-fun lt!623299 () SeekEntryResult!10952)

(assert (=> b!1414209 (= e!800372 (or (bvslt (x!127788 lt!623294) #b00000000000000000000000000000000) (bvsgt (x!127788 lt!623294) #b01111111111111111111111111111110) (bvslt (x!127788 lt!623299) #b00000000000000000000000000000000) (bvsgt (x!127788 lt!623299) #b01111111111111111111111111111110) (and (bvsge lt!623298 #b00000000000000000000000000000000) (bvslt lt!623298 (size!47167 a!2901)))))))

(declare-fun e!800371 () Bool)

(assert (=> b!1414209 e!800371))

(declare-fun res!950781 () Bool)

(assert (=> b!1414209 (=> (not res!950781) (not e!800371))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1414209 (= res!950781 (and (not (undefined!11764 lt!623299)) (= (index!46196 lt!623299) i!1037) (bvslt (x!127788 lt!623299) (x!127788 lt!623294)) (= (select (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46196 lt!623299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47721 0))(
  ( (Unit!47722) )
))
(declare-fun lt!623300 () Unit!47721)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47721)

(assert (=> b!1414209 (= lt!623300 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623298 (x!127788 lt!623294) (index!46196 lt!623294) (x!127788 lt!623299) (index!46196 lt!623299) (undefined!11764 lt!623299) mask!2840))))

(declare-fun b!1414210 () Bool)

(declare-fun res!950783 () Bool)

(declare-fun e!800374 () Bool)

(assert (=> b!1414210 (=> (not res!950783) (not e!800374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414210 (= res!950783 (validKeyInArray!0 (select (arr!46615 a!2901) i!1037)))))

(declare-fun res!950782 () Bool)

(assert (=> start!121796 (=> (not res!950782) (not e!800374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121796 (= res!950782 (validMask!0 mask!2840))))

(assert (=> start!121796 e!800374))

(assert (=> start!121796 true))

(declare-fun array_inv!35848 (array!96561) Bool)

(assert (=> start!121796 (array_inv!35848 a!2901)))

(declare-fun e!800375 () Bool)

(declare-fun b!1414211 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96561 (_ BitVec 32)) SeekEntryResult!10952)

(assert (=> b!1414211 (= e!800375 (= (seekEntryOrOpen!0 (select (arr!46615 a!2901) j!112) a!2901 mask!2840) (Found!10952 j!112)))))

(declare-fun b!1414212 () Bool)

(declare-fun e!800370 () Bool)

(assert (=> b!1414212 (= e!800374 (not e!800370))))

(declare-fun res!950779 () Bool)

(assert (=> b!1414212 (=> res!950779 e!800370)))

(get-info :version)

(assert (=> b!1414212 (= res!950779 (or (not ((_ is Intermediate!10952) lt!623294)) (undefined!11764 lt!623294)))))

(assert (=> b!1414212 e!800375))

(declare-fun res!950785 () Bool)

(assert (=> b!1414212 (=> (not res!950785) (not e!800375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96561 (_ BitVec 32)) Bool)

(assert (=> b!1414212 (= res!950785 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623296 () Unit!47721)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47721)

(assert (=> b!1414212 (= lt!623296 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96561 (_ BitVec 32)) SeekEntryResult!10952)

(assert (=> b!1414212 (= lt!623294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623298 (select (arr!46615 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414212 (= lt!623298 (toIndex!0 (select (arr!46615 a!2901) j!112) mask!2840))))

(declare-fun b!1414213 () Bool)

(declare-fun lt!623297 () array!96561)

(declare-fun lt!623295 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96561 (_ BitVec 32)) SeekEntryResult!10952)

(assert (=> b!1414213 (= e!800371 (= (seekEntryOrOpen!0 lt!623295 lt!623297 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127788 lt!623299) (index!46196 lt!623299) (index!46196 lt!623299) (select (arr!46615 a!2901) j!112) lt!623297 mask!2840)))))

(declare-fun b!1414214 () Bool)

(declare-fun res!950784 () Bool)

(assert (=> b!1414214 (=> (not res!950784) (not e!800374))))

(declare-datatypes ((List!33212 0))(
  ( (Nil!33209) (Cons!33208 (h!34489 (_ BitVec 64)) (t!47898 List!33212)) )
))
(declare-fun arrayNoDuplicates!0 (array!96561 (_ BitVec 32) List!33212) Bool)

(assert (=> b!1414214 (= res!950784 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33209))))

(declare-fun b!1414215 () Bool)

(declare-fun res!950778 () Bool)

(assert (=> b!1414215 (=> (not res!950778) (not e!800374))))

(assert (=> b!1414215 (= res!950778 (and (= (size!47167 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47167 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47167 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414216 () Bool)

(assert (=> b!1414216 (= e!800370 e!800372)))

(declare-fun res!950777 () Bool)

(assert (=> b!1414216 (=> res!950777 e!800372)))

(assert (=> b!1414216 (= res!950777 (or (= lt!623294 lt!623299) (not ((_ is Intermediate!10952) lt!623299))))))

(assert (=> b!1414216 (= lt!623299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623295 mask!2840) lt!623295 lt!623297 mask!2840))))

(assert (=> b!1414216 (= lt!623295 (select (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414216 (= lt!623297 (array!96562 (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47167 a!2901)))))

(declare-fun b!1414217 () Bool)

(declare-fun res!950780 () Bool)

(assert (=> b!1414217 (=> (not res!950780) (not e!800374))))

(assert (=> b!1414217 (= res!950780 (validKeyInArray!0 (select (arr!46615 a!2901) j!112)))))

(declare-fun b!1414218 () Bool)

(declare-fun res!950776 () Bool)

(assert (=> b!1414218 (=> (not res!950776) (not e!800374))))

(assert (=> b!1414218 (= res!950776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121796 res!950782) b!1414215))

(assert (= (and b!1414215 res!950778) b!1414210))

(assert (= (and b!1414210 res!950783) b!1414217))

(assert (= (and b!1414217 res!950780) b!1414218))

(assert (= (and b!1414218 res!950776) b!1414214))

(assert (= (and b!1414214 res!950784) b!1414212))

(assert (= (and b!1414212 res!950785) b!1414211))

(assert (= (and b!1414212 (not res!950779)) b!1414216))

(assert (= (and b!1414216 (not res!950777)) b!1414209))

(assert (= (and b!1414209 res!950781) b!1414213))

(declare-fun m!1304047 () Bool)

(assert (=> b!1414211 m!1304047))

(assert (=> b!1414211 m!1304047))

(declare-fun m!1304049 () Bool)

(assert (=> b!1414211 m!1304049))

(declare-fun m!1304051 () Bool)

(assert (=> b!1414218 m!1304051))

(declare-fun m!1304053 () Bool)

(assert (=> b!1414216 m!1304053))

(assert (=> b!1414216 m!1304053))

(declare-fun m!1304055 () Bool)

(assert (=> b!1414216 m!1304055))

(declare-fun m!1304057 () Bool)

(assert (=> b!1414216 m!1304057))

(declare-fun m!1304059 () Bool)

(assert (=> b!1414216 m!1304059))

(assert (=> b!1414217 m!1304047))

(assert (=> b!1414217 m!1304047))

(declare-fun m!1304061 () Bool)

(assert (=> b!1414217 m!1304061))

(declare-fun m!1304063 () Bool)

(assert (=> b!1414214 m!1304063))

(assert (=> b!1414212 m!1304047))

(declare-fun m!1304065 () Bool)

(assert (=> b!1414212 m!1304065))

(assert (=> b!1414212 m!1304047))

(assert (=> b!1414212 m!1304047))

(declare-fun m!1304067 () Bool)

(assert (=> b!1414212 m!1304067))

(declare-fun m!1304069 () Bool)

(assert (=> b!1414212 m!1304069))

(declare-fun m!1304071 () Bool)

(assert (=> b!1414212 m!1304071))

(assert (=> b!1414209 m!1304057))

(declare-fun m!1304073 () Bool)

(assert (=> b!1414209 m!1304073))

(declare-fun m!1304075 () Bool)

(assert (=> b!1414209 m!1304075))

(declare-fun m!1304077 () Bool)

(assert (=> b!1414210 m!1304077))

(assert (=> b!1414210 m!1304077))

(declare-fun m!1304079 () Bool)

(assert (=> b!1414210 m!1304079))

(declare-fun m!1304081 () Bool)

(assert (=> b!1414213 m!1304081))

(assert (=> b!1414213 m!1304047))

(assert (=> b!1414213 m!1304047))

(declare-fun m!1304083 () Bool)

(assert (=> b!1414213 m!1304083))

(declare-fun m!1304085 () Bool)

(assert (=> start!121796 m!1304085))

(declare-fun m!1304087 () Bool)

(assert (=> start!121796 m!1304087))

(check-sat (not b!1414217) (not b!1414218) (not b!1414214) (not b!1414213) (not b!1414210) (not b!1414209) (not b!1414211) (not start!121796) (not b!1414216) (not b!1414212))
(check-sat)
(get-model)

(declare-fun d!152191 () Bool)

(assert (=> d!152191 (= (validKeyInArray!0 (select (arr!46615 a!2901) i!1037)) (and (not (= (select (arr!46615 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46615 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414210 d!152191))

(declare-fun d!152193 () Bool)

(assert (=> d!152193 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121796 d!152193))

(declare-fun d!152195 () Bool)

(assert (=> d!152195 (= (array_inv!35848 a!2901) (bvsge (size!47167 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121796 d!152195))

(declare-fun d!152197 () Bool)

(assert (=> d!152197 (= (validKeyInArray!0 (select (arr!46615 a!2901) j!112)) (and (not (= (select (arr!46615 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46615 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414217 d!152197))

(declare-fun b!1414297 () Bool)

(declare-fun e!800423 () SeekEntryResult!10952)

(assert (=> b!1414297 (= e!800423 (Intermediate!10952 false (toIndex!0 lt!623295 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414298 () Bool)

(declare-fun lt!623347 () SeekEntryResult!10952)

(assert (=> b!1414298 (and (bvsge (index!46196 lt!623347) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623347) (size!47167 lt!623297)))))

(declare-fun e!800426 () Bool)

(assert (=> b!1414298 (= e!800426 (= (select (arr!46615 lt!623297) (index!46196 lt!623347)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414299 () Bool)

(declare-fun e!800422 () Bool)

(assert (=> b!1414299 (= e!800422 (bvsge (x!127788 lt!623347) #b01111111111111111111111111111110))))

(declare-fun b!1414300 () Bool)

(declare-fun e!800424 () SeekEntryResult!10952)

(assert (=> b!1414300 (= e!800424 e!800423)))

(declare-fun c!131203 () Bool)

(declare-fun lt!623348 () (_ BitVec 64))

(assert (=> b!1414300 (= c!131203 (or (= lt!623348 lt!623295) (= (bvadd lt!623348 lt!623348) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414301 () Bool)

(declare-fun e!800425 () Bool)

(assert (=> b!1414301 (= e!800422 e!800425)))

(declare-fun res!950853 () Bool)

(assert (=> b!1414301 (= res!950853 (and ((_ is Intermediate!10952) lt!623347) (not (undefined!11764 lt!623347)) (bvslt (x!127788 lt!623347) #b01111111111111111111111111111110) (bvsge (x!127788 lt!623347) #b00000000000000000000000000000000) (bvsge (x!127788 lt!623347) #b00000000000000000000000000000000)))))

(assert (=> b!1414301 (=> (not res!950853) (not e!800425))))

(declare-fun b!1414302 () Bool)

(assert (=> b!1414302 (and (bvsge (index!46196 lt!623347) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623347) (size!47167 lt!623297)))))

(declare-fun res!950854 () Bool)

(assert (=> b!1414302 (= res!950854 (= (select (arr!46615 lt!623297) (index!46196 lt!623347)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414302 (=> res!950854 e!800426)))

(declare-fun d!152199 () Bool)

(assert (=> d!152199 e!800422))

(declare-fun c!131201 () Bool)

(assert (=> d!152199 (= c!131201 (and ((_ is Intermediate!10952) lt!623347) (undefined!11764 lt!623347)))))

(assert (=> d!152199 (= lt!623347 e!800424)))

(declare-fun c!131202 () Bool)

(assert (=> d!152199 (= c!131202 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152199 (= lt!623348 (select (arr!46615 lt!623297) (toIndex!0 lt!623295 mask!2840)))))

(assert (=> d!152199 (validMask!0 mask!2840)))

(assert (=> d!152199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623295 mask!2840) lt!623295 lt!623297 mask!2840) lt!623347)))

(declare-fun b!1414303 () Bool)

(assert (=> b!1414303 (= e!800424 (Intermediate!10952 true (toIndex!0 lt!623295 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414304 () Bool)

(assert (=> b!1414304 (and (bvsge (index!46196 lt!623347) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623347) (size!47167 lt!623297)))))

(declare-fun res!950852 () Bool)

(assert (=> b!1414304 (= res!950852 (= (select (arr!46615 lt!623297) (index!46196 lt!623347)) lt!623295))))

(assert (=> b!1414304 (=> res!950852 e!800426)))

(assert (=> b!1414304 (= e!800425 e!800426)))

(declare-fun b!1414305 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414305 (= e!800423 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623295 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623295 lt!623297 mask!2840))))

(assert (= (and d!152199 c!131202) b!1414303))

(assert (= (and d!152199 (not c!131202)) b!1414300))

(assert (= (and b!1414300 c!131203) b!1414297))

(assert (= (and b!1414300 (not c!131203)) b!1414305))

(assert (= (and d!152199 c!131201) b!1414299))

(assert (= (and d!152199 (not c!131201)) b!1414301))

(assert (= (and b!1414301 res!950853) b!1414304))

(assert (= (and b!1414304 (not res!950852)) b!1414302))

(assert (= (and b!1414302 (not res!950854)) b!1414298))

(assert (=> b!1414305 m!1304053))

(declare-fun m!1304173 () Bool)

(assert (=> b!1414305 m!1304173))

(assert (=> b!1414305 m!1304173))

(declare-fun m!1304175 () Bool)

(assert (=> b!1414305 m!1304175))

(assert (=> d!152199 m!1304053))

(declare-fun m!1304177 () Bool)

(assert (=> d!152199 m!1304177))

(assert (=> d!152199 m!1304085))

(declare-fun m!1304179 () Bool)

(assert (=> b!1414302 m!1304179))

(assert (=> b!1414304 m!1304179))

(assert (=> b!1414298 m!1304179))

(assert (=> b!1414216 d!152199))

(declare-fun d!152201 () Bool)

(declare-fun lt!623354 () (_ BitVec 32))

(declare-fun lt!623353 () (_ BitVec 32))

(assert (=> d!152201 (= lt!623354 (bvmul (bvxor lt!623353 (bvlshr lt!623353 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152201 (= lt!623353 ((_ extract 31 0) (bvand (bvxor lt!623295 (bvlshr lt!623295 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152201 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950855 (let ((h!34492 ((_ extract 31 0) (bvand (bvxor lt!623295 (bvlshr lt!623295 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127792 (bvmul (bvxor h!34492 (bvlshr h!34492 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127792 (bvlshr x!127792 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950855 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950855 #b00000000000000000000000000000000))))))

(assert (=> d!152201 (= (toIndex!0 lt!623295 mask!2840) (bvand (bvxor lt!623354 (bvlshr lt!623354 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414216 d!152201))

(declare-fun b!1414318 () Bool)

(declare-fun e!800434 () SeekEntryResult!10952)

(declare-fun lt!623364 () SeekEntryResult!10952)

(assert (=> b!1414318 (= e!800434 (Found!10952 (index!46196 lt!623364)))))

(declare-fun b!1414319 () Bool)

(declare-fun e!800435 () SeekEntryResult!10952)

(assert (=> b!1414319 (= e!800435 Undefined!10952)))

(declare-fun e!800433 () SeekEntryResult!10952)

(declare-fun b!1414320 () Bool)

(assert (=> b!1414320 (= e!800433 (seekKeyOrZeroReturnVacant!0 (x!127788 lt!623364) (index!46196 lt!623364) (index!46196 lt!623364) (select (arr!46615 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414321 () Bool)

(declare-fun c!131212 () Bool)

(declare-fun lt!623365 () (_ BitVec 64))

(assert (=> b!1414321 (= c!131212 (= lt!623365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414321 (= e!800434 e!800433)))

(declare-fun b!1414322 () Bool)

(assert (=> b!1414322 (= e!800433 (MissingZero!10952 (index!46196 lt!623364)))))

(declare-fun d!152203 () Bool)

(declare-fun lt!623366 () SeekEntryResult!10952)

(assert (=> d!152203 (and (or ((_ is Undefined!10952) lt!623366) (not ((_ is Found!10952) lt!623366)) (and (bvsge (index!46195 lt!623366) #b00000000000000000000000000000000) (bvslt (index!46195 lt!623366) (size!47167 a!2901)))) (or ((_ is Undefined!10952) lt!623366) ((_ is Found!10952) lt!623366) (not ((_ is MissingZero!10952) lt!623366)) (and (bvsge (index!46194 lt!623366) #b00000000000000000000000000000000) (bvslt (index!46194 lt!623366) (size!47167 a!2901)))) (or ((_ is Undefined!10952) lt!623366) ((_ is Found!10952) lt!623366) ((_ is MissingZero!10952) lt!623366) (not ((_ is MissingVacant!10952) lt!623366)) (and (bvsge (index!46197 lt!623366) #b00000000000000000000000000000000) (bvslt (index!46197 lt!623366) (size!47167 a!2901)))) (or ((_ is Undefined!10952) lt!623366) (ite ((_ is Found!10952) lt!623366) (= (select (arr!46615 a!2901) (index!46195 lt!623366)) (select (arr!46615 a!2901) j!112)) (ite ((_ is MissingZero!10952) lt!623366) (= (select (arr!46615 a!2901) (index!46194 lt!623366)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10952) lt!623366) (= (select (arr!46615 a!2901) (index!46197 lt!623366)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152203 (= lt!623366 e!800435)))

(declare-fun c!131211 () Bool)

(assert (=> d!152203 (= c!131211 (and ((_ is Intermediate!10952) lt!623364) (undefined!11764 lt!623364)))))

(assert (=> d!152203 (= lt!623364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46615 a!2901) j!112) mask!2840) (select (arr!46615 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152203 (validMask!0 mask!2840)))

(assert (=> d!152203 (= (seekEntryOrOpen!0 (select (arr!46615 a!2901) j!112) a!2901 mask!2840) lt!623366)))

(declare-fun b!1414323 () Bool)

(assert (=> b!1414323 (= e!800435 e!800434)))

(assert (=> b!1414323 (= lt!623365 (select (arr!46615 a!2901) (index!46196 lt!623364)))))

(declare-fun c!131210 () Bool)

(assert (=> b!1414323 (= c!131210 (= lt!623365 (select (arr!46615 a!2901) j!112)))))

(assert (= (and d!152203 c!131211) b!1414319))

(assert (= (and d!152203 (not c!131211)) b!1414323))

(assert (= (and b!1414323 c!131210) b!1414318))

(assert (= (and b!1414323 (not c!131210)) b!1414321))

(assert (= (and b!1414321 c!131212) b!1414322))

(assert (= (and b!1414321 (not c!131212)) b!1414320))

(assert (=> b!1414320 m!1304047))

(declare-fun m!1304183 () Bool)

(assert (=> b!1414320 m!1304183))

(declare-fun m!1304185 () Bool)

(assert (=> d!152203 m!1304185))

(declare-fun m!1304187 () Bool)

(assert (=> d!152203 m!1304187))

(declare-fun m!1304189 () Bool)

(assert (=> d!152203 m!1304189))

(assert (=> d!152203 m!1304085))

(assert (=> d!152203 m!1304047))

(assert (=> d!152203 m!1304065))

(assert (=> d!152203 m!1304065))

(assert (=> d!152203 m!1304047))

(declare-fun m!1304191 () Bool)

(assert (=> d!152203 m!1304191))

(declare-fun m!1304193 () Bool)

(assert (=> b!1414323 m!1304193))

(assert (=> b!1414211 d!152203))

(declare-fun d!152211 () Bool)

(declare-fun res!950868 () Bool)

(declare-fun e!800464 () Bool)

(assert (=> d!152211 (=> res!950868 e!800464)))

(assert (=> d!152211 (= res!950868 (bvsge #b00000000000000000000000000000000 (size!47167 a!2901)))))

(assert (=> d!152211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800464)))

(declare-fun b!1414366 () Bool)

(declare-fun e!800463 () Bool)

(assert (=> b!1414366 (= e!800464 e!800463)))

(declare-fun c!131228 () Bool)

(assert (=> b!1414366 (= c!131228 (validKeyInArray!0 (select (arr!46615 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67122 () Bool)

(declare-fun call!67125 () Bool)

(assert (=> bm!67122 (= call!67125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414367 () Bool)

(assert (=> b!1414367 (= e!800463 call!67125)))

(declare-fun b!1414368 () Bool)

(declare-fun e!800465 () Bool)

(assert (=> b!1414368 (= e!800463 e!800465)))

(declare-fun lt!623398 () (_ BitVec 64))

(assert (=> b!1414368 (= lt!623398 (select (arr!46615 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623399 () Unit!47721)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96561 (_ BitVec 64) (_ BitVec 32)) Unit!47721)

(assert (=> b!1414368 (= lt!623399 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623398 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414368 (arrayContainsKey!0 a!2901 lt!623398 #b00000000000000000000000000000000)))

(declare-fun lt!623397 () Unit!47721)

(assert (=> b!1414368 (= lt!623397 lt!623399)))

(declare-fun res!950869 () Bool)

(assert (=> b!1414368 (= res!950869 (= (seekEntryOrOpen!0 (select (arr!46615 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10952 #b00000000000000000000000000000000)))))

(assert (=> b!1414368 (=> (not res!950869) (not e!800465))))

(declare-fun b!1414369 () Bool)

(assert (=> b!1414369 (= e!800465 call!67125)))

(assert (= (and d!152211 (not res!950868)) b!1414366))

(assert (= (and b!1414366 c!131228) b!1414368))

(assert (= (and b!1414366 (not c!131228)) b!1414367))

(assert (= (and b!1414368 res!950869) b!1414369))

(assert (= (or b!1414369 b!1414367) bm!67122))

(declare-fun m!1304227 () Bool)

(assert (=> b!1414366 m!1304227))

(assert (=> b!1414366 m!1304227))

(declare-fun m!1304229 () Bool)

(assert (=> b!1414366 m!1304229))

(declare-fun m!1304231 () Bool)

(assert (=> bm!67122 m!1304231))

(assert (=> b!1414368 m!1304227))

(declare-fun m!1304233 () Bool)

(assert (=> b!1414368 m!1304233))

(declare-fun m!1304235 () Bool)

(assert (=> b!1414368 m!1304235))

(assert (=> b!1414368 m!1304227))

(declare-fun m!1304237 () Bool)

(assert (=> b!1414368 m!1304237))

(assert (=> b!1414218 d!152211))

(declare-fun b!1414376 () Bool)

(declare-fun e!800470 () SeekEntryResult!10952)

(declare-fun lt!623403 () SeekEntryResult!10952)

(assert (=> b!1414376 (= e!800470 (Found!10952 (index!46196 lt!623403)))))

(declare-fun b!1414377 () Bool)

(declare-fun e!800471 () SeekEntryResult!10952)

(assert (=> b!1414377 (= e!800471 Undefined!10952)))

(declare-fun b!1414378 () Bool)

(declare-fun e!800469 () SeekEntryResult!10952)

(assert (=> b!1414378 (= e!800469 (seekKeyOrZeroReturnVacant!0 (x!127788 lt!623403) (index!46196 lt!623403) (index!46196 lt!623403) lt!623295 lt!623297 mask!2840))))

(declare-fun b!1414379 () Bool)

(declare-fun c!131234 () Bool)

(declare-fun lt!623404 () (_ BitVec 64))

(assert (=> b!1414379 (= c!131234 (= lt!623404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414379 (= e!800470 e!800469)))

(declare-fun b!1414380 () Bool)

(assert (=> b!1414380 (= e!800469 (MissingZero!10952 (index!46196 lt!623403)))))

(declare-fun d!152221 () Bool)

(declare-fun lt!623405 () SeekEntryResult!10952)

(assert (=> d!152221 (and (or ((_ is Undefined!10952) lt!623405) (not ((_ is Found!10952) lt!623405)) (and (bvsge (index!46195 lt!623405) #b00000000000000000000000000000000) (bvslt (index!46195 lt!623405) (size!47167 lt!623297)))) (or ((_ is Undefined!10952) lt!623405) ((_ is Found!10952) lt!623405) (not ((_ is MissingZero!10952) lt!623405)) (and (bvsge (index!46194 lt!623405) #b00000000000000000000000000000000) (bvslt (index!46194 lt!623405) (size!47167 lt!623297)))) (or ((_ is Undefined!10952) lt!623405) ((_ is Found!10952) lt!623405) ((_ is MissingZero!10952) lt!623405) (not ((_ is MissingVacant!10952) lt!623405)) (and (bvsge (index!46197 lt!623405) #b00000000000000000000000000000000) (bvslt (index!46197 lt!623405) (size!47167 lt!623297)))) (or ((_ is Undefined!10952) lt!623405) (ite ((_ is Found!10952) lt!623405) (= (select (arr!46615 lt!623297) (index!46195 lt!623405)) lt!623295) (ite ((_ is MissingZero!10952) lt!623405) (= (select (arr!46615 lt!623297) (index!46194 lt!623405)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10952) lt!623405) (= (select (arr!46615 lt!623297) (index!46197 lt!623405)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152221 (= lt!623405 e!800471)))

(declare-fun c!131233 () Bool)

(assert (=> d!152221 (= c!131233 (and ((_ is Intermediate!10952) lt!623403) (undefined!11764 lt!623403)))))

(assert (=> d!152221 (= lt!623403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623295 mask!2840) lt!623295 lt!623297 mask!2840))))

(assert (=> d!152221 (validMask!0 mask!2840)))

(assert (=> d!152221 (= (seekEntryOrOpen!0 lt!623295 lt!623297 mask!2840) lt!623405)))

(declare-fun b!1414381 () Bool)

(assert (=> b!1414381 (= e!800471 e!800470)))

(assert (=> b!1414381 (= lt!623404 (select (arr!46615 lt!623297) (index!46196 lt!623403)))))

(declare-fun c!131232 () Bool)

(assert (=> b!1414381 (= c!131232 (= lt!623404 lt!623295))))

(assert (= (and d!152221 c!131233) b!1414377))

(assert (= (and d!152221 (not c!131233)) b!1414381))

(assert (= (and b!1414381 c!131232) b!1414376))

(assert (= (and b!1414381 (not c!131232)) b!1414379))

(assert (= (and b!1414379 c!131234) b!1414380))

(assert (= (and b!1414379 (not c!131234)) b!1414378))

(declare-fun m!1304249 () Bool)

(assert (=> b!1414378 m!1304249))

(declare-fun m!1304251 () Bool)

(assert (=> d!152221 m!1304251))

(declare-fun m!1304253 () Bool)

(assert (=> d!152221 m!1304253))

(declare-fun m!1304255 () Bool)

(assert (=> d!152221 m!1304255))

(assert (=> d!152221 m!1304085))

(assert (=> d!152221 m!1304053))

(assert (=> d!152221 m!1304053))

(assert (=> d!152221 m!1304055))

(declare-fun m!1304257 () Bool)

(assert (=> b!1414381 m!1304257))

(assert (=> b!1414213 d!152221))

(declare-fun b!1414439 () Bool)

(declare-fun e!800504 () SeekEntryResult!10952)

(assert (=> b!1414439 (= e!800504 Undefined!10952)))

(declare-fun b!1414440 () Bool)

(declare-fun c!131260 () Bool)

(declare-fun lt!623422 () (_ BitVec 64))

(assert (=> b!1414440 (= c!131260 (= lt!623422 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800502 () SeekEntryResult!10952)

(declare-fun e!800503 () SeekEntryResult!10952)

(assert (=> b!1414440 (= e!800502 e!800503)))

(declare-fun b!1414441 () Bool)

(assert (=> b!1414441 (= e!800503 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127788 lt!623299) #b00000000000000000000000000000001) (nextIndex!0 (index!46196 lt!623299) (x!127788 lt!623299) mask!2840) (index!46196 lt!623299) (select (arr!46615 a!2901) j!112) lt!623297 mask!2840))))

(declare-fun b!1414442 () Bool)

(assert (=> b!1414442 (= e!800502 (Found!10952 (index!46196 lt!623299)))))

(declare-fun b!1414443 () Bool)

(assert (=> b!1414443 (= e!800503 (MissingVacant!10952 (index!46196 lt!623299)))))

(declare-fun d!152225 () Bool)

(declare-fun lt!623423 () SeekEntryResult!10952)

(assert (=> d!152225 (and (or ((_ is Undefined!10952) lt!623423) (not ((_ is Found!10952) lt!623423)) (and (bvsge (index!46195 lt!623423) #b00000000000000000000000000000000) (bvslt (index!46195 lt!623423) (size!47167 lt!623297)))) (or ((_ is Undefined!10952) lt!623423) ((_ is Found!10952) lt!623423) (not ((_ is MissingVacant!10952) lt!623423)) (not (= (index!46197 lt!623423) (index!46196 lt!623299))) (and (bvsge (index!46197 lt!623423) #b00000000000000000000000000000000) (bvslt (index!46197 lt!623423) (size!47167 lt!623297)))) (or ((_ is Undefined!10952) lt!623423) (ite ((_ is Found!10952) lt!623423) (= (select (arr!46615 lt!623297) (index!46195 lt!623423)) (select (arr!46615 a!2901) j!112)) (and ((_ is MissingVacant!10952) lt!623423) (= (index!46197 lt!623423) (index!46196 lt!623299)) (= (select (arr!46615 lt!623297) (index!46197 lt!623423)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152225 (= lt!623423 e!800504)))

(declare-fun c!131259 () Bool)

(assert (=> d!152225 (= c!131259 (bvsge (x!127788 lt!623299) #b01111111111111111111111111111110))))

(assert (=> d!152225 (= lt!623422 (select (arr!46615 lt!623297) (index!46196 lt!623299)))))

(assert (=> d!152225 (validMask!0 mask!2840)))

(assert (=> d!152225 (= (seekKeyOrZeroReturnVacant!0 (x!127788 lt!623299) (index!46196 lt!623299) (index!46196 lt!623299) (select (arr!46615 a!2901) j!112) lt!623297 mask!2840) lt!623423)))

(declare-fun b!1414444 () Bool)

(assert (=> b!1414444 (= e!800504 e!800502)))

(declare-fun c!131261 () Bool)

(assert (=> b!1414444 (= c!131261 (= lt!623422 (select (arr!46615 a!2901) j!112)))))

(assert (= (and d!152225 c!131259) b!1414439))

(assert (= (and d!152225 (not c!131259)) b!1414444))

(assert (= (and b!1414444 c!131261) b!1414442))

(assert (= (and b!1414444 (not c!131261)) b!1414440))

(assert (= (and b!1414440 c!131260) b!1414443))

(assert (= (and b!1414440 (not c!131260)) b!1414441))

(declare-fun m!1304277 () Bool)

(assert (=> b!1414441 m!1304277))

(assert (=> b!1414441 m!1304277))

(assert (=> b!1414441 m!1304047))

(declare-fun m!1304279 () Bool)

(assert (=> b!1414441 m!1304279))

(declare-fun m!1304281 () Bool)

(assert (=> d!152225 m!1304281))

(declare-fun m!1304283 () Bool)

(assert (=> d!152225 m!1304283))

(declare-fun m!1304285 () Bool)

(assert (=> d!152225 m!1304285))

(assert (=> d!152225 m!1304085))

(assert (=> b!1414213 d!152225))

(declare-fun d!152235 () Bool)

(declare-fun res!950880 () Bool)

(declare-fun e!800506 () Bool)

(assert (=> d!152235 (=> res!950880 e!800506)))

(assert (=> d!152235 (= res!950880 (bvsge j!112 (size!47167 a!2901)))))

(assert (=> d!152235 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800506)))

(declare-fun b!1414445 () Bool)

(declare-fun e!800505 () Bool)

(assert (=> b!1414445 (= e!800506 e!800505)))

(declare-fun c!131262 () Bool)

(assert (=> b!1414445 (= c!131262 (validKeyInArray!0 (select (arr!46615 a!2901) j!112)))))

(declare-fun bm!67123 () Bool)

(declare-fun call!67126 () Bool)

(assert (=> bm!67123 (= call!67126 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414446 () Bool)

(assert (=> b!1414446 (= e!800505 call!67126)))

(declare-fun b!1414447 () Bool)

(declare-fun e!800507 () Bool)

(assert (=> b!1414447 (= e!800505 e!800507)))

(declare-fun lt!623425 () (_ BitVec 64))

(assert (=> b!1414447 (= lt!623425 (select (arr!46615 a!2901) j!112))))

(declare-fun lt!623426 () Unit!47721)

(assert (=> b!1414447 (= lt!623426 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623425 j!112))))

(assert (=> b!1414447 (arrayContainsKey!0 a!2901 lt!623425 #b00000000000000000000000000000000)))

(declare-fun lt!623424 () Unit!47721)

(assert (=> b!1414447 (= lt!623424 lt!623426)))

(declare-fun res!950881 () Bool)

(assert (=> b!1414447 (= res!950881 (= (seekEntryOrOpen!0 (select (arr!46615 a!2901) j!112) a!2901 mask!2840) (Found!10952 j!112)))))

(assert (=> b!1414447 (=> (not res!950881) (not e!800507))))

(declare-fun b!1414448 () Bool)

(assert (=> b!1414448 (= e!800507 call!67126)))

(assert (= (and d!152235 (not res!950880)) b!1414445))

(assert (= (and b!1414445 c!131262) b!1414447))

(assert (= (and b!1414445 (not c!131262)) b!1414446))

(assert (= (and b!1414447 res!950881) b!1414448))

(assert (= (or b!1414448 b!1414446) bm!67123))

(assert (=> b!1414445 m!1304047))

(assert (=> b!1414445 m!1304047))

(assert (=> b!1414445 m!1304061))

(declare-fun m!1304287 () Bool)

(assert (=> bm!67123 m!1304287))

(assert (=> b!1414447 m!1304047))

(declare-fun m!1304289 () Bool)

(assert (=> b!1414447 m!1304289))

(declare-fun m!1304291 () Bool)

(assert (=> b!1414447 m!1304291))

(assert (=> b!1414447 m!1304047))

(assert (=> b!1414447 m!1304049))

(assert (=> b!1414212 d!152235))

(declare-fun d!152237 () Bool)

(assert (=> d!152237 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623444 () Unit!47721)

(declare-fun choose!38 (array!96561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47721)

(assert (=> d!152237 (= lt!623444 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152237 (validMask!0 mask!2840)))

(assert (=> d!152237 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623444)))

(declare-fun bs!41208 () Bool)

(assert (= bs!41208 d!152237))

(assert (=> bs!41208 m!1304071))

(declare-fun m!1304299 () Bool)

(assert (=> bs!41208 m!1304299))

(assert (=> bs!41208 m!1304085))

(assert (=> b!1414212 d!152237))

(declare-fun b!1414461 () Bool)

(declare-fun e!800518 () SeekEntryResult!10952)

(assert (=> b!1414461 (= e!800518 (Intermediate!10952 false lt!623298 #b00000000000000000000000000000000))))

(declare-fun b!1414462 () Bool)

(declare-fun lt!623445 () SeekEntryResult!10952)

(assert (=> b!1414462 (and (bvsge (index!46196 lt!623445) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623445) (size!47167 a!2901)))))

(declare-fun e!800521 () Bool)

(assert (=> b!1414462 (= e!800521 (= (select (arr!46615 a!2901) (index!46196 lt!623445)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414463 () Bool)

(declare-fun e!800517 () Bool)

(assert (=> b!1414463 (= e!800517 (bvsge (x!127788 lt!623445) #b01111111111111111111111111111110))))

(declare-fun b!1414464 () Bool)

(declare-fun e!800519 () SeekEntryResult!10952)

(assert (=> b!1414464 (= e!800519 e!800518)))

(declare-fun lt!623446 () (_ BitVec 64))

(declare-fun c!131268 () Bool)

(assert (=> b!1414464 (= c!131268 (or (= lt!623446 (select (arr!46615 a!2901) j!112)) (= (bvadd lt!623446 lt!623446) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414465 () Bool)

(declare-fun e!800520 () Bool)

(assert (=> b!1414465 (= e!800517 e!800520)))

(declare-fun res!950889 () Bool)

(assert (=> b!1414465 (= res!950889 (and ((_ is Intermediate!10952) lt!623445) (not (undefined!11764 lt!623445)) (bvslt (x!127788 lt!623445) #b01111111111111111111111111111110) (bvsge (x!127788 lt!623445) #b00000000000000000000000000000000) (bvsge (x!127788 lt!623445) #b00000000000000000000000000000000)))))

(assert (=> b!1414465 (=> (not res!950889) (not e!800520))))

(declare-fun b!1414466 () Bool)

(assert (=> b!1414466 (and (bvsge (index!46196 lt!623445) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623445) (size!47167 a!2901)))))

(declare-fun res!950890 () Bool)

(assert (=> b!1414466 (= res!950890 (= (select (arr!46615 a!2901) (index!46196 lt!623445)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414466 (=> res!950890 e!800521)))

(declare-fun d!152243 () Bool)

(assert (=> d!152243 e!800517))

(declare-fun c!131266 () Bool)

(assert (=> d!152243 (= c!131266 (and ((_ is Intermediate!10952) lt!623445) (undefined!11764 lt!623445)))))

(assert (=> d!152243 (= lt!623445 e!800519)))

(declare-fun c!131267 () Bool)

(assert (=> d!152243 (= c!131267 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152243 (= lt!623446 (select (arr!46615 a!2901) lt!623298))))

(assert (=> d!152243 (validMask!0 mask!2840)))

(assert (=> d!152243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623298 (select (arr!46615 a!2901) j!112) a!2901 mask!2840) lt!623445)))

(declare-fun b!1414467 () Bool)

(assert (=> b!1414467 (= e!800519 (Intermediate!10952 true lt!623298 #b00000000000000000000000000000000))))

(declare-fun b!1414468 () Bool)

(assert (=> b!1414468 (and (bvsge (index!46196 lt!623445) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623445) (size!47167 a!2901)))))

(declare-fun res!950888 () Bool)

(assert (=> b!1414468 (= res!950888 (= (select (arr!46615 a!2901) (index!46196 lt!623445)) (select (arr!46615 a!2901) j!112)))))

(assert (=> b!1414468 (=> res!950888 e!800521)))

(assert (=> b!1414468 (= e!800520 e!800521)))

(declare-fun b!1414469 () Bool)

(assert (=> b!1414469 (= e!800518 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623298 #b00000000000000000000000000000000 mask!2840) (select (arr!46615 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152243 c!131267) b!1414467))

(assert (= (and d!152243 (not c!131267)) b!1414464))

(assert (= (and b!1414464 c!131268) b!1414461))

(assert (= (and b!1414464 (not c!131268)) b!1414469))

(assert (= (and d!152243 c!131266) b!1414463))

(assert (= (and d!152243 (not c!131266)) b!1414465))

(assert (= (and b!1414465 res!950889) b!1414468))

(assert (= (and b!1414468 (not res!950888)) b!1414466))

(assert (= (and b!1414466 (not res!950890)) b!1414462))

(declare-fun m!1304301 () Bool)

(assert (=> b!1414469 m!1304301))

(assert (=> b!1414469 m!1304301))

(assert (=> b!1414469 m!1304047))

(declare-fun m!1304303 () Bool)

(assert (=> b!1414469 m!1304303))

(declare-fun m!1304305 () Bool)

(assert (=> d!152243 m!1304305))

(assert (=> d!152243 m!1304085))

(declare-fun m!1304307 () Bool)

(assert (=> b!1414466 m!1304307))

(assert (=> b!1414468 m!1304307))

(assert (=> b!1414462 m!1304307))

(assert (=> b!1414212 d!152243))

(declare-fun d!152245 () Bool)

(declare-fun lt!623448 () (_ BitVec 32))

(declare-fun lt!623447 () (_ BitVec 32))

(assert (=> d!152245 (= lt!623448 (bvmul (bvxor lt!623447 (bvlshr lt!623447 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152245 (= lt!623447 ((_ extract 31 0) (bvand (bvxor (select (arr!46615 a!2901) j!112) (bvlshr (select (arr!46615 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152245 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950855 (let ((h!34492 ((_ extract 31 0) (bvand (bvxor (select (arr!46615 a!2901) j!112) (bvlshr (select (arr!46615 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127792 (bvmul (bvxor h!34492 (bvlshr h!34492 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127792 (bvlshr x!127792 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950855 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950855 #b00000000000000000000000000000000))))))

(assert (=> d!152245 (= (toIndex!0 (select (arr!46615 a!2901) j!112) mask!2840) (bvand (bvxor lt!623448 (bvlshr lt!623448 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414212 d!152245))

(declare-fun b!1414484 () Bool)

(declare-fun e!800536 () Bool)

(declare-fun call!67132 () Bool)

(assert (=> b!1414484 (= e!800536 call!67132)))

(declare-fun b!1414485 () Bool)

(declare-fun e!800537 () Bool)

(declare-fun contains!9783 (List!33212 (_ BitVec 64)) Bool)

(assert (=> b!1414485 (= e!800537 (contains!9783 Nil!33209 (select (arr!46615 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414486 () Bool)

(assert (=> b!1414486 (= e!800536 call!67132)))

(declare-fun b!1414487 () Bool)

(declare-fun e!800538 () Bool)

(assert (=> b!1414487 (= e!800538 e!800536)))

(declare-fun c!131271 () Bool)

(assert (=> b!1414487 (= c!131271 (validKeyInArray!0 (select (arr!46615 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67129 () Bool)

(assert (=> bm!67129 (= call!67132 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131271 (Cons!33208 (select (arr!46615 a!2901) #b00000000000000000000000000000000) Nil!33209) Nil!33209)))))

(declare-fun b!1414488 () Bool)

(declare-fun e!800539 () Bool)

(assert (=> b!1414488 (= e!800539 e!800538)))

(declare-fun res!950903 () Bool)

(assert (=> b!1414488 (=> (not res!950903) (not e!800538))))

(assert (=> b!1414488 (= res!950903 (not e!800537))))

(declare-fun res!950905 () Bool)

(assert (=> b!1414488 (=> (not res!950905) (not e!800537))))

(assert (=> b!1414488 (= res!950905 (validKeyInArray!0 (select (arr!46615 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152247 () Bool)

(declare-fun res!950904 () Bool)

(assert (=> d!152247 (=> res!950904 e!800539)))

(assert (=> d!152247 (= res!950904 (bvsge #b00000000000000000000000000000000 (size!47167 a!2901)))))

(assert (=> d!152247 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33209) e!800539)))

(assert (= (and d!152247 (not res!950904)) b!1414488))

(assert (= (and b!1414488 res!950905) b!1414485))

(assert (= (and b!1414488 res!950903) b!1414487))

(assert (= (and b!1414487 c!131271) b!1414484))

(assert (= (and b!1414487 (not c!131271)) b!1414486))

(assert (= (or b!1414484 b!1414486) bm!67129))

(assert (=> b!1414485 m!1304227))

(assert (=> b!1414485 m!1304227))

(declare-fun m!1304311 () Bool)

(assert (=> b!1414485 m!1304311))

(assert (=> b!1414487 m!1304227))

(assert (=> b!1414487 m!1304227))

(assert (=> b!1414487 m!1304229))

(assert (=> bm!67129 m!1304227))

(declare-fun m!1304313 () Bool)

(assert (=> bm!67129 m!1304313))

(assert (=> b!1414488 m!1304227))

(assert (=> b!1414488 m!1304227))

(assert (=> b!1414488 m!1304229))

(assert (=> b!1414214 d!152247))

(declare-fun d!152255 () Bool)

(assert (=> d!152255 (and (not (undefined!11764 lt!623299)) (= (index!46196 lt!623299) i!1037) (bvslt (x!127788 lt!623299) (x!127788 lt!623294)))))

(declare-fun lt!623458 () Unit!47721)

(declare-fun choose!62 (array!96561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47721)

(assert (=> d!152255 (= lt!623458 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623298 (x!127788 lt!623294) (index!46196 lt!623294) (x!127788 lt!623299) (index!46196 lt!623299) (undefined!11764 lt!623299) mask!2840))))

(assert (=> d!152255 (validMask!0 mask!2840)))

(assert (=> d!152255 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623298 (x!127788 lt!623294) (index!46196 lt!623294) (x!127788 lt!623299) (index!46196 lt!623299) (undefined!11764 lt!623299) mask!2840) lt!623458)))

(declare-fun bs!41210 () Bool)

(assert (= bs!41210 d!152255))

(declare-fun m!1304327 () Bool)

(assert (=> bs!41210 m!1304327))

(assert (=> bs!41210 m!1304085))

(assert (=> b!1414209 d!152255))

(check-sat (not b!1414445) (not bm!67129) (not b!1414378) (not d!152221) (not bm!67123) (not d!152237) (not d!152255) (not b!1414488) (not b!1414447) (not b!1414305) (not b!1414320) (not b!1414368) (not bm!67122) (not b!1414485) (not d!152243) (not b!1414469) (not b!1414366) (not b!1414487) (not b!1414441) (not d!152203) (not d!152199) (not d!152225))
(check-sat)
