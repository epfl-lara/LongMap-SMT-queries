; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87202 () Bool)

(assert start!87202)

(declare-fun b!1011083 () Bool)

(declare-fun e!568793 () Bool)

(declare-fun e!568798 () Bool)

(assert (=> b!1011083 (= e!568793 e!568798)))

(declare-fun res!679275 () Bool)

(assert (=> b!1011083 (=> (not res!679275) (not e!568798))))

(declare-datatypes ((SeekEntryResult!9580 0))(
  ( (MissingZero!9580 (index!40691 (_ BitVec 32))) (Found!9580 (index!40692 (_ BitVec 32))) (Intermediate!9580 (undefined!10392 Bool) (index!40693 (_ BitVec 32)) (x!88097 (_ BitVec 32))) (Undefined!9580) (MissingVacant!9580 (index!40694 (_ BitVec 32))) )
))
(declare-fun lt!446887 () SeekEntryResult!9580)

(declare-fun lt!446891 () SeekEntryResult!9580)

(assert (=> b!1011083 (= res!679275 (= lt!446887 lt!446891))))

(declare-datatypes ((array!63663 0))(
  ( (array!63664 (arr!30648 (Array (_ BitVec 32) (_ BitVec 64))) (size!31150 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63663)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63663 (_ BitVec 32)) SeekEntryResult!9580)

(assert (=> b!1011083 (= lt!446887 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30648 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011084 () Bool)

(declare-fun e!568791 () Bool)

(declare-fun e!568795 () Bool)

(assert (=> b!1011084 (= e!568791 e!568795)))

(declare-fun res!679264 () Bool)

(assert (=> b!1011084 (=> (not res!679264) (not e!568795))))

(declare-fun lt!446888 () SeekEntryResult!9580)

(assert (=> b!1011084 (= res!679264 (= lt!446888 lt!446891))))

(declare-fun lt!446885 () (_ BitVec 32))

(assert (=> b!1011084 (= lt!446888 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446885 (select (arr!30648 a!3219) j!170) a!3219 mask!3464))))

(declare-fun lt!446892 () array!63663)

(declare-fun lt!446889 () (_ BitVec 64))

(declare-fun b!1011085 () Bool)

(assert (=> b!1011085 (= e!568795 (= lt!446888 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446885 lt!446889 lt!446892 mask!3464)))))

(declare-fun b!1011086 () Bool)

(declare-fun res!679266 () Bool)

(declare-fun e!568794 () Bool)

(assert (=> b!1011086 (=> (not res!679266) (not e!568794))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011086 (= res!679266 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011088 () Bool)

(declare-fun res!679277 () Bool)

(declare-fun e!568796 () Bool)

(assert (=> b!1011088 (=> (not res!679277) (not e!568796))))

(declare-datatypes ((List!21324 0))(
  ( (Nil!21321) (Cons!21320 (h!22515 (_ BitVec 64)) (t!30325 List!21324)) )
))
(declare-fun arrayNoDuplicates!0 (array!63663 (_ BitVec 32) List!21324) Bool)

(assert (=> b!1011088 (= res!679277 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21321))))

(declare-fun b!1011089 () Bool)

(declare-fun res!679263 () Bool)

(declare-fun e!568792 () Bool)

(assert (=> b!1011089 (=> (not res!679263) (not e!568792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011089 (= res!679263 (validKeyInArray!0 (select (arr!30648 a!3219) j!170)))))

(declare-fun b!1011090 () Bool)

(declare-fun res!679274 () Bool)

(assert (=> b!1011090 (=> (not res!679274) (not e!568792))))

(assert (=> b!1011090 (= res!679274 (and (= (size!31150 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31150 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31150 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011091 () Bool)

(declare-fun res!679272 () Bool)

(assert (=> b!1011091 (=> (not res!679272) (not e!568792))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1011091 (= res!679272 (validKeyInArray!0 k!2224))))

(declare-fun b!1011092 () Bool)

(assert (=> b!1011092 (= e!568798 e!568794)))

(declare-fun res!679269 () Bool)

(assert (=> b!1011092 (=> (not res!679269) (not e!568794))))

(declare-fun lt!446886 () SeekEntryResult!9580)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011092 (= res!679269 (not (= lt!446886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446889 mask!3464) lt!446889 lt!446892 mask!3464))))))

(assert (=> b!1011092 (= lt!446889 (select (store (arr!30648 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1011092 (= lt!446892 (array!63664 (store (arr!30648 a!3219) i!1194 k!2224) (size!31150 a!3219)))))

(declare-fun b!1011093 () Bool)

(declare-fun res!679270 () Bool)

(assert (=> b!1011093 (=> (not res!679270) (not e!568796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63663 (_ BitVec 32)) Bool)

(assert (=> b!1011093 (= res!679270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!679267 () Bool)

(assert (=> start!87202 (=> (not res!679267) (not e!568792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87202 (= res!679267 (validMask!0 mask!3464))))

(assert (=> start!87202 e!568792))

(declare-fun array_inv!23772 (array!63663) Bool)

(assert (=> start!87202 (array_inv!23772 a!3219)))

(assert (=> start!87202 true))

(declare-fun b!1011087 () Bool)

(assert (=> b!1011087 (= e!568794 e!568791)))

(declare-fun res!679276 () Bool)

(assert (=> b!1011087 (=> (not res!679276) (not e!568791))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011087 (= res!679276 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446885 #b00000000000000000000000000000000) (bvslt lt!446885 (size!31150 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011087 (= lt!446885 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011094 () Bool)

(assert (=> b!1011094 (= e!568796 e!568793)))

(declare-fun res!679268 () Bool)

(assert (=> b!1011094 (=> (not res!679268) (not e!568793))))

(assert (=> b!1011094 (= res!679268 (= lt!446886 lt!446891))))

(assert (=> b!1011094 (= lt!446891 (Intermediate!9580 false resIndex!38 resX!38))))

(assert (=> b!1011094 (= lt!446886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30648 a!3219) j!170) mask!3464) (select (arr!30648 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011095 () Bool)

(declare-fun res!679265 () Bool)

(assert (=> b!1011095 (=> (not res!679265) (not e!568792))))

(declare-fun arrayContainsKey!0 (array!63663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011095 (= res!679265 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011096 () Bool)

(declare-fun res!679278 () Bool)

(assert (=> b!1011096 (=> (not res!679278) (not e!568794))))

(assert (=> b!1011096 (= res!679278 (not (= lt!446887 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446889 lt!446892 mask!3464))))))

(declare-fun b!1011097 () Bool)

(declare-fun res!679273 () Bool)

(assert (=> b!1011097 (=> (not res!679273) (not e!568796))))

(assert (=> b!1011097 (= res!679273 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31150 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31150 a!3219))))))

(declare-fun b!1011098 () Bool)

(assert (=> b!1011098 (= e!568792 e!568796)))

(declare-fun res!679271 () Bool)

(assert (=> b!1011098 (=> (not res!679271) (not e!568796))))

(declare-fun lt!446890 () SeekEntryResult!9580)

(assert (=> b!1011098 (= res!679271 (or (= lt!446890 (MissingVacant!9580 i!1194)) (= lt!446890 (MissingZero!9580 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63663 (_ BitVec 32)) SeekEntryResult!9580)

(assert (=> b!1011098 (= lt!446890 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!87202 res!679267) b!1011090))

(assert (= (and b!1011090 res!679274) b!1011089))

(assert (= (and b!1011089 res!679263) b!1011091))

(assert (= (and b!1011091 res!679272) b!1011095))

(assert (= (and b!1011095 res!679265) b!1011098))

(assert (= (and b!1011098 res!679271) b!1011093))

(assert (= (and b!1011093 res!679270) b!1011088))

(assert (= (and b!1011088 res!679277) b!1011097))

(assert (= (and b!1011097 res!679273) b!1011094))

(assert (= (and b!1011094 res!679268) b!1011083))

(assert (= (and b!1011083 res!679275) b!1011092))

(assert (= (and b!1011092 res!679269) b!1011096))

(assert (= (and b!1011096 res!679278) b!1011086))

(assert (= (and b!1011086 res!679266) b!1011087))

(assert (= (and b!1011087 res!679276) b!1011084))

(assert (= (and b!1011084 res!679264) b!1011085))

(declare-fun m!935225 () Bool)

(assert (=> b!1011098 m!935225))

(declare-fun m!935227 () Bool)

(assert (=> b!1011089 m!935227))

(assert (=> b!1011089 m!935227))

(declare-fun m!935229 () Bool)

(assert (=> b!1011089 m!935229))

(assert (=> b!1011094 m!935227))

(assert (=> b!1011094 m!935227))

(declare-fun m!935231 () Bool)

(assert (=> b!1011094 m!935231))

(assert (=> b!1011094 m!935231))

(assert (=> b!1011094 m!935227))

(declare-fun m!935233 () Bool)

(assert (=> b!1011094 m!935233))

(declare-fun m!935235 () Bool)

(assert (=> b!1011093 m!935235))

(declare-fun m!935237 () Bool)

(assert (=> b!1011091 m!935237))

(assert (=> b!1011084 m!935227))

(assert (=> b!1011084 m!935227))

(declare-fun m!935239 () Bool)

(assert (=> b!1011084 m!935239))

(declare-fun m!935241 () Bool)

(assert (=> b!1011087 m!935241))

(declare-fun m!935243 () Bool)

(assert (=> b!1011092 m!935243))

(assert (=> b!1011092 m!935243))

(declare-fun m!935245 () Bool)

(assert (=> b!1011092 m!935245))

(declare-fun m!935247 () Bool)

(assert (=> b!1011092 m!935247))

(declare-fun m!935249 () Bool)

(assert (=> b!1011092 m!935249))

(assert (=> b!1011083 m!935227))

(assert (=> b!1011083 m!935227))

(declare-fun m!935251 () Bool)

(assert (=> b!1011083 m!935251))

(declare-fun m!935253 () Bool)

(assert (=> start!87202 m!935253))

(declare-fun m!935255 () Bool)

(assert (=> start!87202 m!935255))

(declare-fun m!935257 () Bool)

(assert (=> b!1011088 m!935257))

(declare-fun m!935259 () Bool)

(assert (=> b!1011085 m!935259))

(declare-fun m!935261 () Bool)

(assert (=> b!1011096 m!935261))

(declare-fun m!935263 () Bool)

(assert (=> b!1011095 m!935263))

(push 1)

(assert (not b!1011087))

(assert (not b!1011089))

(assert (not b!1011094))

(assert (not b!1011098))

(assert (not b!1011096))

(assert (not b!1011092))

(assert (not start!87202))

(assert (not b!1011091))

(assert (not b!1011093))

(assert (not b!1011084))

(assert (not b!1011088))

(assert (not b!1011085))

(assert (not b!1011083))

(assert (not b!1011095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120093 () Bool)

(assert (=> d!120093 (= (validKeyInArray!0 (select (arr!30648 a!3219) j!170)) (and (not (= (select (arr!30648 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30648 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1011089 d!120093))

(declare-fun d!120097 () Bool)

(assert (=> d!120097 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1011091 d!120097))

(declare-fun d!120099 () Bool)

(declare-fun e!568882 () Bool)

(assert (=> d!120099 e!568882))

(declare-fun c!102116 () Bool)

(declare-fun lt!446928 () SeekEntryResult!9580)

(assert (=> d!120099 (= c!102116 (and (is-Intermediate!9580 lt!446928) (undefined!10392 lt!446928)))))

(declare-fun e!568884 () SeekEntryResult!9580)

(assert (=> d!120099 (= lt!446928 e!568884)))

(declare-fun c!102115 () Bool)

(assert (=> d!120099 (= c!102115 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446927 () (_ BitVec 64))

(assert (=> d!120099 (= lt!446927 (select (arr!30648 lt!446892) (toIndex!0 lt!446889 mask!3464)))))

(assert (=> d!120099 (validMask!0 mask!3464)))

(assert (=> d!120099 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446889 mask!3464) lt!446889 lt!446892 mask!3464) lt!446928)))

(declare-fun b!1011237 () Bool)

(assert (=> b!1011237 (and (bvsge (index!40693 lt!446928) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446928) (size!31150 lt!446892)))))

(declare-fun e!568883 () Bool)

(assert (=> b!1011237 (= e!568883 (= (select (arr!30648 lt!446892) (index!40693 lt!446928)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011238 () Bool)

(declare-fun e!568881 () SeekEntryResult!9580)

(assert (=> b!1011238 (= e!568881 (Intermediate!9580 false (toIndex!0 lt!446889 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011239 () Bool)

(assert (=> b!1011239 (= e!568884 e!568881)))

(declare-fun c!102117 () Bool)

(assert (=> b!1011239 (= c!102117 (or (= lt!446927 lt!446889) (= (bvadd lt!446927 lt!446927) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011240 () Bool)

(declare-fun e!568885 () Bool)

(assert (=> b!1011240 (= e!568882 e!568885)))

(declare-fun res!679328 () Bool)

(assert (=> b!1011240 (= res!679328 (and (is-Intermediate!9580 lt!446928) (not (undefined!10392 lt!446928)) (bvslt (x!88097 lt!446928) #b01111111111111111111111111111110) (bvsge (x!88097 lt!446928) #b00000000000000000000000000000000) (bvsge (x!88097 lt!446928) #b00000000000000000000000000000000)))))

(assert (=> b!1011240 (=> (not res!679328) (not e!568885))))

(declare-fun b!1011241 () Bool)

(assert (=> b!1011241 (and (bvsge (index!40693 lt!446928) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446928) (size!31150 lt!446892)))))

(declare-fun res!679329 () Bool)

(assert (=> b!1011241 (= res!679329 (= (select (arr!30648 lt!446892) (index!40693 lt!446928)) lt!446889))))

(assert (=> b!1011241 (=> res!679329 e!568883)))

(assert (=> b!1011241 (= e!568885 e!568883)))

(declare-fun b!1011242 () Bool)

(assert (=> b!1011242 (= e!568881 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446889 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446889 lt!446892 mask!3464))))

(declare-fun b!1011243 () Bool)

(assert (=> b!1011243 (= e!568884 (Intermediate!9580 true (toIndex!0 lt!446889 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011244 () Bool)

(assert (=> b!1011244 (and (bvsge (index!40693 lt!446928) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446928) (size!31150 lt!446892)))))

(declare-fun res!679327 () Bool)

(assert (=> b!1011244 (= res!679327 (= (select (arr!30648 lt!446892) (index!40693 lt!446928)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011244 (=> res!679327 e!568883)))

(declare-fun b!1011245 () Bool)

(assert (=> b!1011245 (= e!568882 (bvsge (x!88097 lt!446928) #b01111111111111111111111111111110))))

(assert (= (and d!120099 c!102115) b!1011243))

(assert (= (and d!120099 (not c!102115)) b!1011239))

(assert (= (and b!1011239 c!102117) b!1011238))

(assert (= (and b!1011239 (not c!102117)) b!1011242))

(assert (= (and d!120099 c!102116) b!1011245))

(assert (= (and d!120099 (not c!102116)) b!1011240))

(assert (= (and b!1011240 res!679328) b!1011241))

(assert (= (and b!1011241 (not res!679329)) b!1011244))

(assert (= (and b!1011244 (not res!679327)) b!1011237))

(assert (=> d!120099 m!935243))

(declare-fun m!935323 () Bool)

(assert (=> d!120099 m!935323))

(assert (=> d!120099 m!935253))

(declare-fun m!935327 () Bool)

(assert (=> b!1011244 m!935327))

(assert (=> b!1011242 m!935243))

(declare-fun m!935331 () Bool)

(assert (=> b!1011242 m!935331))

(assert (=> b!1011242 m!935331))

(declare-fun m!935333 () Bool)

(assert (=> b!1011242 m!935333))

(assert (=> b!1011237 m!935327))

(assert (=> b!1011241 m!935327))

(assert (=> b!1011092 d!120099))

(declare-fun d!120119 () Bool)

(declare-fun lt!446948 () (_ BitVec 32))

(declare-fun lt!446947 () (_ BitVec 32))

(assert (=> d!120119 (= lt!446948 (bvmul (bvxor lt!446947 (bvlshr lt!446947 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120119 (= lt!446947 ((_ extract 31 0) (bvand (bvxor lt!446889 (bvlshr lt!446889 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120119 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679332 (let ((h!22518 ((_ extract 31 0) (bvand (bvxor lt!446889 (bvlshr lt!446889 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88104 (bvmul (bvxor h!22518 (bvlshr h!22518 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88104 (bvlshr x!88104 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679332 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679332 #b00000000000000000000000000000000))))))

(assert (=> d!120119 (= (toIndex!0 lt!446889 mask!3464) (bvand (bvxor lt!446948 (bvlshr lt!446948 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1011092 d!120119))

(declare-fun d!120125 () Bool)

(declare-fun e!568897 () Bool)

(assert (=> d!120125 e!568897))

(declare-fun c!102125 () Bool)

(declare-fun lt!446952 () SeekEntryResult!9580)

(assert (=> d!120125 (= c!102125 (and (is-Intermediate!9580 lt!446952) (undefined!10392 lt!446952)))))

(declare-fun e!568899 () SeekEntryResult!9580)

(assert (=> d!120125 (= lt!446952 e!568899)))

(declare-fun c!102124 () Bool)

(assert (=> d!120125 (= c!102124 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446951 () (_ BitVec 64))

(assert (=> d!120125 (= lt!446951 (select (arr!30648 a!3219) index!1507))))

(assert (=> d!120125 (validMask!0 mask!3464)))

(assert (=> d!120125 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30648 a!3219) j!170) a!3219 mask!3464) lt!446952)))

(declare-fun b!1011264 () Bool)

(assert (=> b!1011264 (and (bvsge (index!40693 lt!446952) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446952) (size!31150 a!3219)))))

(declare-fun e!568898 () Bool)

(assert (=> b!1011264 (= e!568898 (= (select (arr!30648 a!3219) (index!40693 lt!446952)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011265 () Bool)

(declare-fun e!568896 () SeekEntryResult!9580)

(assert (=> b!1011265 (= e!568896 (Intermediate!9580 false index!1507 x!1245))))

(declare-fun b!1011266 () Bool)

(assert (=> b!1011266 (= e!568899 e!568896)))

(declare-fun c!102126 () Bool)

(assert (=> b!1011266 (= c!102126 (or (= lt!446951 (select (arr!30648 a!3219) j!170)) (= (bvadd lt!446951 lt!446951) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011267 () Bool)

(declare-fun e!568900 () Bool)

(assert (=> b!1011267 (= e!568897 e!568900)))

(declare-fun res!679340 () Bool)

(assert (=> b!1011267 (= res!679340 (and (is-Intermediate!9580 lt!446952) (not (undefined!10392 lt!446952)) (bvslt (x!88097 lt!446952) #b01111111111111111111111111111110) (bvsge (x!88097 lt!446952) #b00000000000000000000000000000000) (bvsge (x!88097 lt!446952) x!1245)))))

(assert (=> b!1011267 (=> (not res!679340) (not e!568900))))

(declare-fun b!1011268 () Bool)

(assert (=> b!1011268 (and (bvsge (index!40693 lt!446952) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446952) (size!31150 a!3219)))))

(declare-fun res!679341 () Bool)

(assert (=> b!1011268 (= res!679341 (= (select (arr!30648 a!3219) (index!40693 lt!446952)) (select (arr!30648 a!3219) j!170)))))

(assert (=> b!1011268 (=> res!679341 e!568898)))

(assert (=> b!1011268 (= e!568900 e!568898)))

(declare-fun b!1011269 () Bool)

(assert (=> b!1011269 (= e!568896 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30648 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011270 () Bool)

(assert (=> b!1011270 (= e!568899 (Intermediate!9580 true index!1507 x!1245))))

(declare-fun b!1011271 () Bool)

(assert (=> b!1011271 (and (bvsge (index!40693 lt!446952) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446952) (size!31150 a!3219)))))

(declare-fun res!679339 () Bool)

(assert (=> b!1011271 (= res!679339 (= (select (arr!30648 a!3219) (index!40693 lt!446952)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011271 (=> res!679339 e!568898)))

(declare-fun b!1011272 () Bool)

(assert (=> b!1011272 (= e!568897 (bvsge (x!88097 lt!446952) #b01111111111111111111111111111110))))

(assert (= (and d!120125 c!102124) b!1011270))

(assert (= (and d!120125 (not c!102124)) b!1011266))

(assert (= (and b!1011266 c!102126) b!1011265))

(assert (= (and b!1011266 (not c!102126)) b!1011269))

(assert (= (and d!120125 c!102125) b!1011272))

(assert (= (and d!120125 (not c!102125)) b!1011267))

(assert (= (and b!1011267 res!679340) b!1011268))

(assert (= (and b!1011268 (not res!679341)) b!1011271))

(assert (= (and b!1011271 (not res!679339)) b!1011264))

(declare-fun m!935345 () Bool)

(assert (=> d!120125 m!935345))

(assert (=> d!120125 m!935253))

(declare-fun m!935349 () Bool)

(assert (=> b!1011271 m!935349))

(assert (=> b!1011269 m!935241))

(assert (=> b!1011269 m!935241))

(assert (=> b!1011269 m!935227))

(declare-fun m!935351 () Bool)

(assert (=> b!1011269 m!935351))

(assert (=> b!1011264 m!935349))

(assert (=> b!1011268 m!935349))

(assert (=> b!1011083 d!120125))

(declare-fun d!120131 () Bool)

(assert (=> d!120131 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87202 d!120131))

(declare-fun d!120137 () Bool)

(assert (=> d!120137 (= (array_inv!23772 a!3219) (bvsge (size!31150 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87202 d!120137))

(declare-fun b!1011314 () Bool)

(declare-fun e!568929 () Bool)

(declare-fun call!42432 () Bool)

(assert (=> b!1011314 (= e!568929 call!42432)))

(declare-fun b!1011315 () Bool)

(declare-fun e!568928 () Bool)

(assert (=> b!1011315 (= e!568929 e!568928)))

(declare-fun lt!446977 () (_ BitVec 64))

(assert (=> b!1011315 (= lt!446977 (select (arr!30648 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33030 0))(
  ( (Unit!33031) )
))
(declare-fun lt!446976 () Unit!33030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63663 (_ BitVec 64) (_ BitVec 32)) Unit!33030)

(assert (=> b!1011315 (= lt!446976 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446977 #b00000000000000000000000000000000))))

(assert (=> b!1011315 (arrayContainsKey!0 a!3219 lt!446977 #b00000000000000000000000000000000)))

(declare-fun lt!446978 () Unit!33030)

(assert (=> b!1011315 (= lt!446978 lt!446976)))

(declare-fun res!679356 () Bool)

(assert (=> b!1011315 (= res!679356 (= (seekEntryOrOpen!0 (select (arr!30648 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9580 #b00000000000000000000000000000000)))))

(assert (=> b!1011315 (=> (not res!679356) (not e!568928))))

(declare-fun bm!42429 () Bool)

(assert (=> bm!42429 (= call!42432 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1011316 () Bool)

(assert (=> b!1011316 (= e!568928 call!42432)))

(declare-fun b!1011317 () Bool)

(declare-fun e!568927 () Bool)

(assert (=> b!1011317 (= e!568927 e!568929)))

(declare-fun c!102141 () Bool)

(assert (=> b!1011317 (= c!102141 (validKeyInArray!0 (select (arr!30648 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!120139 () Bool)

(declare-fun res!679355 () Bool)

(assert (=> d!120139 (=> res!679355 e!568927)))

(assert (=> d!120139 (= res!679355 (bvsge #b00000000000000000000000000000000 (size!31150 a!3219)))))

(assert (=> d!120139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568927)))

(assert (= (and d!120139 (not res!679355)) b!1011317))

(assert (= (and b!1011317 c!102141) b!1011315))

(assert (= (and b!1011317 (not c!102141)) b!1011314))

(assert (= (and b!1011315 res!679356) b!1011316))

(assert (= (or b!1011316 b!1011314) bm!42429))

(declare-fun m!935367 () Bool)

(assert (=> b!1011315 m!935367))

(declare-fun m!935369 () Bool)

(assert (=> b!1011315 m!935369))

(declare-fun m!935371 () Bool)

(assert (=> b!1011315 m!935371))

(assert (=> b!1011315 m!935367))

(declare-fun m!935373 () Bool)

(assert (=> b!1011315 m!935373))

(declare-fun m!935375 () Bool)

(assert (=> bm!42429 m!935375))

(assert (=> b!1011317 m!935367))

(assert (=> b!1011317 m!935367))

(declare-fun m!935377 () Bool)

(assert (=> b!1011317 m!935377))

(assert (=> b!1011093 d!120139))

(declare-fun d!120145 () Bool)

(declare-fun e!568936 () Bool)

(assert (=> d!120145 e!568936))

(declare-fun c!102146 () Bool)

(declare-fun lt!446982 () SeekEntryResult!9580)

(assert (=> d!120145 (= c!102146 (and (is-Intermediate!9580 lt!446982) (undefined!10392 lt!446982)))))

(declare-fun e!568938 () SeekEntryResult!9580)

(assert (=> d!120145 (= lt!446982 e!568938)))

(declare-fun c!102145 () Bool)

(assert (=> d!120145 (= c!102145 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(declare-fun lt!446981 () (_ BitVec 64))

(assert (=> d!120145 (= lt!446981 (select (arr!30648 a!3219) lt!446885))))

(assert (=> d!120145 (validMask!0 mask!3464)))

(assert (=> d!120145 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446885 (select (arr!30648 a!3219) j!170) a!3219 mask!3464) lt!446982)))

(declare-fun b!1011327 () Bool)

(assert (=> b!1011327 (and (bvsge (index!40693 lt!446982) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446982) (size!31150 a!3219)))))

(declare-fun e!568937 () Bool)

(assert (=> b!1011327 (= e!568937 (= (select (arr!30648 a!3219) (index!40693 lt!446982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011328 () Bool)

(declare-fun e!568935 () SeekEntryResult!9580)

(assert (=> b!1011328 (= e!568935 (Intermediate!9580 false lt!446885 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011329 () Bool)

(assert (=> b!1011329 (= e!568938 e!568935)))

(declare-fun c!102147 () Bool)

(assert (=> b!1011329 (= c!102147 (or (= lt!446981 (select (arr!30648 a!3219) j!170)) (= (bvadd lt!446981 lt!446981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011330 () Bool)

(declare-fun e!568939 () Bool)

(assert (=> b!1011330 (= e!568936 e!568939)))

(declare-fun res!679361 () Bool)

(assert (=> b!1011330 (= res!679361 (and (is-Intermediate!9580 lt!446982) (not (undefined!10392 lt!446982)) (bvslt (x!88097 lt!446982) #b01111111111111111111111111111110) (bvsge (x!88097 lt!446982) #b00000000000000000000000000000000) (bvsge (x!88097 lt!446982) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1011330 (=> (not res!679361) (not e!568939))))

(declare-fun b!1011331 () Bool)

(assert (=> b!1011331 (and (bvsge (index!40693 lt!446982) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446982) (size!31150 a!3219)))))

(declare-fun res!679362 () Bool)

(assert (=> b!1011331 (= res!679362 (= (select (arr!30648 a!3219) (index!40693 lt!446982)) (select (arr!30648 a!3219) j!170)))))

(assert (=> b!1011331 (=> res!679362 e!568937)))

(assert (=> b!1011331 (= e!568939 e!568937)))

(declare-fun b!1011332 () Bool)

(assert (=> b!1011332 (= e!568935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446885 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) (select (arr!30648 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011333 () Bool)

(assert (=> b!1011333 (= e!568938 (Intermediate!9580 true lt!446885 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011334 () Bool)

(assert (=> b!1011334 (and (bvsge (index!40693 lt!446982) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446982) (size!31150 a!3219)))))

(declare-fun res!679360 () Bool)

(assert (=> b!1011334 (= res!679360 (= (select (arr!30648 a!3219) (index!40693 lt!446982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011334 (=> res!679360 e!568937)))

(declare-fun b!1011335 () Bool)

(assert (=> b!1011335 (= e!568936 (bvsge (x!88097 lt!446982) #b01111111111111111111111111111110))))

(assert (= (and d!120145 c!102145) b!1011333))

(assert (= (and d!120145 (not c!102145)) b!1011329))

(assert (= (and b!1011329 c!102147) b!1011328))

(assert (= (and b!1011329 (not c!102147)) b!1011332))

(assert (= (and d!120145 c!102146) b!1011335))

(assert (= (and d!120145 (not c!102146)) b!1011330))

(assert (= (and b!1011330 res!679361) b!1011331))

(assert (= (and b!1011331 (not res!679362)) b!1011334))

(assert (= (and b!1011334 (not res!679360)) b!1011327))

(declare-fun m!935387 () Bool)

(assert (=> d!120145 m!935387))

(assert (=> d!120145 m!935253))

(declare-fun m!935389 () Bool)

(assert (=> b!1011334 m!935389))

(declare-fun m!935391 () Bool)

(assert (=> b!1011332 m!935391))

(assert (=> b!1011332 m!935391))

(assert (=> b!1011332 m!935227))

(declare-fun m!935393 () Bool)

(assert (=> b!1011332 m!935393))

(assert (=> b!1011327 m!935389))

(assert (=> b!1011331 m!935389))

(assert (=> b!1011084 d!120145))

(declare-fun d!120149 () Bool)

(declare-fun res!679367 () Bool)

(declare-fun e!568947 () Bool)

(assert (=> d!120149 (=> res!679367 e!568947)))

(assert (=> d!120149 (= res!679367 (= (select (arr!30648 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!120149 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!568947)))

(declare-fun b!1011346 () Bool)

(declare-fun e!568948 () Bool)

(assert (=> b!1011346 (= e!568947 e!568948)))

(declare-fun res!679368 () Bool)

(assert (=> b!1011346 (=> (not res!679368) (not e!568948))))

(assert (=> b!1011346 (= res!679368 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31150 a!3219)))))

(declare-fun b!1011347 () Bool)

(assert (=> b!1011347 (= e!568948 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120149 (not res!679367)) b!1011346))

(assert (= (and b!1011346 res!679368) b!1011347))

(assert (=> d!120149 m!935367))

(declare-fun m!935409 () Bool)

(assert (=> b!1011347 m!935409))

(assert (=> b!1011095 d!120149))

(declare-fun d!120153 () Bool)

(declare-fun e!568950 () Bool)

(assert (=> d!120153 e!568950))

(declare-fun c!102152 () Bool)

(declare-fun lt!446989 () SeekEntryResult!9580)

(assert (=> d!120153 (= c!102152 (and (is-Intermediate!9580 lt!446989) (undefined!10392 lt!446989)))))

(declare-fun e!568952 () SeekEntryResult!9580)

(assert (=> d!120153 (= lt!446989 e!568952)))

(declare-fun c!102151 () Bool)

(assert (=> d!120153 (= c!102151 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446988 () (_ BitVec 64))

(assert (=> d!120153 (= lt!446988 (select (arr!30648 a!3219) (toIndex!0 (select (arr!30648 a!3219) j!170) mask!3464)))))

(assert (=> d!120153 (validMask!0 mask!3464)))

(assert (=> d!120153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30648 a!3219) j!170) mask!3464) (select (arr!30648 a!3219) j!170) a!3219 mask!3464) lt!446989)))

(declare-fun b!1011348 () Bool)

(assert (=> b!1011348 (and (bvsge (index!40693 lt!446989) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446989) (size!31150 a!3219)))))

(declare-fun e!568951 () Bool)

(assert (=> b!1011348 (= e!568951 (= (select (arr!30648 a!3219) (index!40693 lt!446989)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011349 () Bool)

(declare-fun e!568949 () SeekEntryResult!9580)

(assert (=> b!1011349 (= e!568949 (Intermediate!9580 false (toIndex!0 (select (arr!30648 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011350 () Bool)

(assert (=> b!1011350 (= e!568952 e!568949)))

(declare-fun c!102153 () Bool)

(assert (=> b!1011350 (= c!102153 (or (= lt!446988 (select (arr!30648 a!3219) j!170)) (= (bvadd lt!446988 lt!446988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011351 () Bool)

(declare-fun e!568953 () Bool)

(assert (=> b!1011351 (= e!568950 e!568953)))

(declare-fun res!679370 () Bool)

(assert (=> b!1011351 (= res!679370 (and (is-Intermediate!9580 lt!446989) (not (undefined!10392 lt!446989)) (bvslt (x!88097 lt!446989) #b01111111111111111111111111111110) (bvsge (x!88097 lt!446989) #b00000000000000000000000000000000) (bvsge (x!88097 lt!446989) #b00000000000000000000000000000000)))))

(assert (=> b!1011351 (=> (not res!679370) (not e!568953))))

(declare-fun b!1011352 () Bool)

(assert (=> b!1011352 (and (bvsge (index!40693 lt!446989) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446989) (size!31150 a!3219)))))

(declare-fun res!679371 () Bool)

(assert (=> b!1011352 (= res!679371 (= (select (arr!30648 a!3219) (index!40693 lt!446989)) (select (arr!30648 a!3219) j!170)))))

(assert (=> b!1011352 (=> res!679371 e!568951)))

(assert (=> b!1011352 (= e!568953 e!568951)))

(declare-fun b!1011353 () Bool)

(assert (=> b!1011353 (= e!568949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30648 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30648 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011354 () Bool)

(assert (=> b!1011354 (= e!568952 (Intermediate!9580 true (toIndex!0 (select (arr!30648 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011355 () Bool)

(assert (=> b!1011355 (and (bvsge (index!40693 lt!446989) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446989) (size!31150 a!3219)))))

(declare-fun res!679369 () Bool)

(assert (=> b!1011355 (= res!679369 (= (select (arr!30648 a!3219) (index!40693 lt!446989)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011355 (=> res!679369 e!568951)))

(declare-fun b!1011356 () Bool)

(assert (=> b!1011356 (= e!568950 (bvsge (x!88097 lt!446989) #b01111111111111111111111111111110))))

(assert (= (and d!120153 c!102151) b!1011354))

(assert (= (and d!120153 (not c!102151)) b!1011350))

(assert (= (and b!1011350 c!102153) b!1011349))

(assert (= (and b!1011350 (not c!102153)) b!1011353))

(assert (= (and d!120153 c!102152) b!1011356))

(assert (= (and d!120153 (not c!102152)) b!1011351))

(assert (= (and b!1011351 res!679370) b!1011352))

(assert (= (and b!1011352 (not res!679371)) b!1011355))

(assert (= (and b!1011355 (not res!679369)) b!1011348))

(assert (=> d!120153 m!935231))

(declare-fun m!935411 () Bool)

(assert (=> d!120153 m!935411))

(assert (=> d!120153 m!935253))

(declare-fun m!935413 () Bool)

(assert (=> b!1011355 m!935413))

(assert (=> b!1011353 m!935231))

(declare-fun m!935415 () Bool)

(assert (=> b!1011353 m!935415))

(assert (=> b!1011353 m!935415))

(assert (=> b!1011353 m!935227))

(declare-fun m!935417 () Bool)

(assert (=> b!1011353 m!935417))

(assert (=> b!1011348 m!935413))

(assert (=> b!1011352 m!935413))

(assert (=> b!1011094 d!120153))

(declare-fun d!120155 () Bool)

(declare-fun lt!446991 () (_ BitVec 32))

(declare-fun lt!446990 () (_ BitVec 32))

(assert (=> d!120155 (= lt!446991 (bvmul (bvxor lt!446990 (bvlshr lt!446990 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120155 (= lt!446990 ((_ extract 31 0) (bvand (bvxor (select (arr!30648 a!3219) j!170) (bvlshr (select (arr!30648 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120155 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679332 (let ((h!22518 ((_ extract 31 0) (bvand (bvxor (select (arr!30648 a!3219) j!170) (bvlshr (select (arr!30648 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88104 (bvmul (bvxor h!22518 (bvlshr h!22518 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88104 (bvlshr x!88104 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679332 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679332 #b00000000000000000000000000000000))))))

(assert (=> d!120155 (= (toIndex!0 (select (arr!30648 a!3219) j!170) mask!3464) (bvand (bvxor lt!446991 (bvlshr lt!446991 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1011094 d!120155))

(declare-fun d!120157 () Bool)

(declare-fun e!568955 () Bool)

(assert (=> d!120157 e!568955))

(declare-fun c!102155 () Bool)

(declare-fun lt!446993 () SeekEntryResult!9580)

(assert (=> d!120157 (= c!102155 (and (is-Intermediate!9580 lt!446993) (undefined!10392 lt!446993)))))

(declare-fun e!568957 () SeekEntryResult!9580)

(assert (=> d!120157 (= lt!446993 e!568957)))

(declare-fun c!102154 () Bool)

(assert (=> d!120157 (= c!102154 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446992 () (_ BitVec 64))

(assert (=> d!120157 (= lt!446992 (select (arr!30648 lt!446892) index!1507))))

(assert (=> d!120157 (validMask!0 mask!3464)))

(assert (=> d!120157 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446889 lt!446892 mask!3464) lt!446993)))

(declare-fun b!1011357 () Bool)

(assert (=> b!1011357 (and (bvsge (index!40693 lt!446993) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446993) (size!31150 lt!446892)))))

(declare-fun e!568956 () Bool)

(assert (=> b!1011357 (= e!568956 (= (select (arr!30648 lt!446892) (index!40693 lt!446993)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011358 () Bool)

(declare-fun e!568954 () SeekEntryResult!9580)

(assert (=> b!1011358 (= e!568954 (Intermediate!9580 false index!1507 x!1245))))

(declare-fun b!1011359 () Bool)

(assert (=> b!1011359 (= e!568957 e!568954)))

(declare-fun c!102156 () Bool)

(assert (=> b!1011359 (= c!102156 (or (= lt!446992 lt!446889) (= (bvadd lt!446992 lt!446992) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011360 () Bool)

(declare-fun e!568958 () Bool)

(assert (=> b!1011360 (= e!568955 e!568958)))

(declare-fun res!679373 () Bool)

(assert (=> b!1011360 (= res!679373 (and (is-Intermediate!9580 lt!446993) (not (undefined!10392 lt!446993)) (bvslt (x!88097 lt!446993) #b01111111111111111111111111111110) (bvsge (x!88097 lt!446993) #b00000000000000000000000000000000) (bvsge (x!88097 lt!446993) x!1245)))))

(assert (=> b!1011360 (=> (not res!679373) (not e!568958))))

(declare-fun b!1011361 () Bool)

(assert (=> b!1011361 (and (bvsge (index!40693 lt!446993) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446993) (size!31150 lt!446892)))))

(declare-fun res!679374 () Bool)

(assert (=> b!1011361 (= res!679374 (= (select (arr!30648 lt!446892) (index!40693 lt!446993)) lt!446889))))

(assert (=> b!1011361 (=> res!679374 e!568956)))

(assert (=> b!1011361 (= e!568958 e!568956)))

(declare-fun b!1011362 () Bool)

(assert (=> b!1011362 (= e!568954 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446889 lt!446892 mask!3464))))

(declare-fun b!1011363 () Bool)

(assert (=> b!1011363 (= e!568957 (Intermediate!9580 true index!1507 x!1245))))

(declare-fun b!1011364 () Bool)

(assert (=> b!1011364 (and (bvsge (index!40693 lt!446993) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446993) (size!31150 lt!446892)))))

(declare-fun res!679372 () Bool)

(assert (=> b!1011364 (= res!679372 (= (select (arr!30648 lt!446892) (index!40693 lt!446993)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011364 (=> res!679372 e!568956)))

(declare-fun b!1011365 () Bool)

(assert (=> b!1011365 (= e!568955 (bvsge (x!88097 lt!446993) #b01111111111111111111111111111110))))

(assert (= (and d!120157 c!102154) b!1011363))

(assert (= (and d!120157 (not c!102154)) b!1011359))

(assert (= (and b!1011359 c!102156) b!1011358))

(assert (= (and b!1011359 (not c!102156)) b!1011362))

(assert (= (and d!120157 c!102155) b!1011365))

(assert (= (and d!120157 (not c!102155)) b!1011360))

(assert (= (and b!1011360 res!679373) b!1011361))

(assert (= (and b!1011361 (not res!679374)) b!1011364))

(assert (= (and b!1011364 (not res!679372)) b!1011357))

(declare-fun m!935419 () Bool)

(assert (=> d!120157 m!935419))

(assert (=> d!120157 m!935253))

(declare-fun m!935421 () Bool)

(assert (=> b!1011364 m!935421))

(assert (=> b!1011362 m!935241))

(assert (=> b!1011362 m!935241))

(declare-fun m!935423 () Bool)

(assert (=> b!1011362 m!935423))

(assert (=> b!1011357 m!935421))

(assert (=> b!1011361 m!935421))

(assert (=> b!1011096 d!120157))

(declare-fun d!120159 () Bool)

(declare-fun e!568960 () Bool)

(assert (=> d!120159 e!568960))

(declare-fun c!102158 () Bool)

(declare-fun lt!446995 () SeekEntryResult!9580)

(assert (=> d!120159 (= c!102158 (and (is-Intermediate!9580 lt!446995) (undefined!10392 lt!446995)))))

(declare-fun e!568962 () SeekEntryResult!9580)

(assert (=> d!120159 (= lt!446995 e!568962)))

(declare-fun c!102157 () Bool)

(assert (=> d!120159 (= c!102157 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(declare-fun lt!446994 () (_ BitVec 64))

(assert (=> d!120159 (= lt!446994 (select (arr!30648 lt!446892) lt!446885))))

(assert (=> d!120159 (validMask!0 mask!3464)))

(assert (=> d!120159 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446885 lt!446889 lt!446892 mask!3464) lt!446995)))

(declare-fun b!1011366 () Bool)

(assert (=> b!1011366 (and (bvsge (index!40693 lt!446995) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446995) (size!31150 lt!446892)))))

(declare-fun e!568961 () Bool)

(assert (=> b!1011366 (= e!568961 (= (select (arr!30648 lt!446892) (index!40693 lt!446995)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011367 () Bool)

(declare-fun e!568959 () SeekEntryResult!9580)

(assert (=> b!1011367 (= e!568959 (Intermediate!9580 false lt!446885 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011368 () Bool)

(assert (=> b!1011368 (= e!568962 e!568959)))

(declare-fun c!102159 () Bool)

(assert (=> b!1011368 (= c!102159 (or (= lt!446994 lt!446889) (= (bvadd lt!446994 lt!446994) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011369 () Bool)

(declare-fun e!568963 () Bool)

(assert (=> b!1011369 (= e!568960 e!568963)))

(declare-fun res!679376 () Bool)

(assert (=> b!1011369 (= res!679376 (and (is-Intermediate!9580 lt!446995) (not (undefined!10392 lt!446995)) (bvslt (x!88097 lt!446995) #b01111111111111111111111111111110) (bvsge (x!88097 lt!446995) #b00000000000000000000000000000000) (bvsge (x!88097 lt!446995) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1011369 (=> (not res!679376) (not e!568963))))

(declare-fun b!1011370 () Bool)

(assert (=> b!1011370 (and (bvsge (index!40693 lt!446995) #b00000000000000000000000000000000) (bvslt (index!40693 lt!446995) (size!31150 lt!446892)))))

(declare-fun res!679377 () Bool)

(assert (=> b!1011370 (= res!679377 (= (select (arr!30648 lt!446892) (index!40693 lt!446995)) lt!446889))))

