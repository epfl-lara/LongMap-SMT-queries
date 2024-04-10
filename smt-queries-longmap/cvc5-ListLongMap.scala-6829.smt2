; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85964 () Bool)

(assert start!85964)

(declare-fun b!996082 () Bool)

(declare-fun res!666288 () Bool)

(declare-fun e!562027 () Bool)

(assert (=> b!996082 (=> (not res!666288) (not e!562027))))

(declare-datatypes ((array!63014 0))(
  ( (array!63015 (arr!30340 (Array (_ BitVec 32) (_ BitVec 64))) (size!30842 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63014)

(declare-datatypes ((List!21016 0))(
  ( (Nil!21013) (Cons!21012 (h!22174 (_ BitVec 64)) (t!30017 List!21016)) )
))
(declare-fun arrayNoDuplicates!0 (array!63014 (_ BitVec 32) List!21016) Bool)

(assert (=> b!996082 (= res!666288 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21013))))

(declare-fun b!996083 () Bool)

(declare-fun res!666284 () Bool)

(assert (=> b!996083 (=> (not res!666284) (not e!562027))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996083 (= res!666284 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30842 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30842 a!3219))))))

(declare-fun b!996084 () Bool)

(declare-fun res!666289 () Bool)

(declare-fun e!562026 () Bool)

(assert (=> b!996084 (=> (not res!666289) (not e!562026))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996084 (= res!666289 (validKeyInArray!0 k!2224))))

(declare-fun b!996085 () Bool)

(declare-fun res!666286 () Bool)

(assert (=> b!996085 (=> (not res!666286) (not e!562027))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63014 (_ BitVec 32)) Bool)

(assert (=> b!996085 (= res!666286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996086 () Bool)

(assert (=> b!996086 (= e!562026 e!562027)))

(declare-fun res!666291 () Bool)

(assert (=> b!996086 (=> (not res!666291) (not e!562027))))

(declare-datatypes ((SeekEntryResult!9272 0))(
  ( (MissingZero!9272 (index!39459 (_ BitVec 32))) (Found!9272 (index!39460 (_ BitVec 32))) (Intermediate!9272 (undefined!10084 Bool) (index!39461 (_ BitVec 32)) (x!86897 (_ BitVec 32))) (Undefined!9272) (MissingVacant!9272 (index!39462 (_ BitVec 32))) )
))
(declare-fun lt!441119 () SeekEntryResult!9272)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996086 (= res!666291 (or (= lt!441119 (MissingVacant!9272 i!1194)) (= lt!441119 (MissingZero!9272 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63014 (_ BitVec 32)) SeekEntryResult!9272)

(assert (=> b!996086 (= lt!441119 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!666285 () Bool)

(assert (=> start!85964 (=> (not res!666285) (not e!562026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85964 (= res!666285 (validMask!0 mask!3464))))

(assert (=> start!85964 e!562026))

(declare-fun array_inv!23464 (array!63014) Bool)

(assert (=> start!85964 (array_inv!23464 a!3219)))

(assert (=> start!85964 true))

(declare-fun b!996087 () Bool)

(declare-fun res!666283 () Bool)

(assert (=> b!996087 (=> (not res!666283) (not e!562026))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996087 (= res!666283 (validKeyInArray!0 (select (arr!30340 a!3219) j!170)))))

(declare-fun b!996088 () Bool)

(declare-fun lt!441118 () (_ BitVec 32))

(assert (=> b!996088 (= e!562027 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441118 #b00000000000000000000000000000000) (bvsge lt!441118 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996088 (= lt!441118 (toIndex!0 (select (arr!30340 a!3219) j!170) mask!3464))))

(declare-fun b!996089 () Bool)

(declare-fun res!666290 () Bool)

(assert (=> b!996089 (=> (not res!666290) (not e!562026))))

(assert (=> b!996089 (= res!666290 (and (= (size!30842 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30842 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30842 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996090 () Bool)

(declare-fun res!666287 () Bool)

(assert (=> b!996090 (=> (not res!666287) (not e!562026))))

(declare-fun arrayContainsKey!0 (array!63014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996090 (= res!666287 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85964 res!666285) b!996089))

(assert (= (and b!996089 res!666290) b!996087))

(assert (= (and b!996087 res!666283) b!996084))

(assert (= (and b!996084 res!666289) b!996090))

(assert (= (and b!996090 res!666287) b!996086))

(assert (= (and b!996086 res!666291) b!996085))

(assert (= (and b!996085 res!666286) b!996082))

(assert (= (and b!996082 res!666288) b!996083))

(assert (= (and b!996083 res!666284) b!996088))

(declare-fun m!923309 () Bool)

(assert (=> b!996087 m!923309))

(assert (=> b!996087 m!923309))

(declare-fun m!923311 () Bool)

(assert (=> b!996087 m!923311))

(declare-fun m!923313 () Bool)

(assert (=> b!996082 m!923313))

(declare-fun m!923315 () Bool)

(assert (=> start!85964 m!923315))

(declare-fun m!923317 () Bool)

(assert (=> start!85964 m!923317))

(declare-fun m!923319 () Bool)

(assert (=> b!996085 m!923319))

(declare-fun m!923321 () Bool)

(assert (=> b!996090 m!923321))

(assert (=> b!996088 m!923309))

(assert (=> b!996088 m!923309))

(declare-fun m!923323 () Bool)

(assert (=> b!996088 m!923323))

(declare-fun m!923325 () Bool)

(assert (=> b!996084 m!923325))

(declare-fun m!923327 () Bool)

(assert (=> b!996086 m!923327))

(push 1)

(assert (not b!996085))

(assert (not b!996086))

(assert (not b!996084))

(assert (not b!996082))

(assert (not b!996088))

(assert (not b!996090))

(assert (not start!85964))

(assert (not b!996087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!996186 () Bool)

(declare-fun e!562077 () Bool)

(declare-fun call!42227 () Bool)

(assert (=> b!996186 (= e!562077 call!42227)))

(declare-fun d!118961 () Bool)

(declare-fun res!666365 () Bool)

(declare-fun e!562076 () Bool)

(assert (=> d!118961 (=> res!666365 e!562076)))

(assert (=> d!118961 (= res!666365 (bvsge #b00000000000000000000000000000000 (size!30842 a!3219)))))

(assert (=> d!118961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562076)))

(declare-fun b!996187 () Bool)

(declare-fun e!562078 () Bool)

(assert (=> b!996187 (= e!562076 e!562078)))

(declare-fun c!101051 () Bool)

(assert (=> b!996187 (= c!101051 (validKeyInArray!0 (select (arr!30340 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996188 () Bool)

(assert (=> b!996188 (= e!562078 call!42227)))

(declare-fun b!996189 () Bool)

(assert (=> b!996189 (= e!562078 e!562077)))

(declare-fun lt!441145 () (_ BitVec 64))

(assert (=> b!996189 (= lt!441145 (select (arr!30340 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32968 0))(
  ( (Unit!32969) )
))
(declare-fun lt!441146 () Unit!32968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63014 (_ BitVec 64) (_ BitVec 32)) Unit!32968)

(assert (=> b!996189 (= lt!441146 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441145 #b00000000000000000000000000000000))))

(assert (=> b!996189 (arrayContainsKey!0 a!3219 lt!441145 #b00000000000000000000000000000000)))

(declare-fun lt!441144 () Unit!32968)

(assert (=> b!996189 (= lt!441144 lt!441146)))

(declare-fun res!666366 () Bool)

(assert (=> b!996189 (= res!666366 (= (seekEntryOrOpen!0 (select (arr!30340 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9272 #b00000000000000000000000000000000)))))

(assert (=> b!996189 (=> (not res!666366) (not e!562077))))

(declare-fun bm!42224 () Bool)

(assert (=> bm!42224 (= call!42227 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!118961 (not res!666365)) b!996187))

(assert (= (and b!996187 c!101051) b!996189))

(assert (= (and b!996187 (not c!101051)) b!996188))

(assert (= (and b!996189 res!666366) b!996186))

(assert (= (or b!996186 b!996188) bm!42224))

(declare-fun m!923381 () Bool)

(assert (=> b!996187 m!923381))

(assert (=> b!996187 m!923381))

(declare-fun m!923383 () Bool)

(assert (=> b!996187 m!923383))

(assert (=> b!996189 m!923381))

(declare-fun m!923385 () Bool)

(assert (=> b!996189 m!923385))

(declare-fun m!923387 () Bool)

(assert (=> b!996189 m!923387))

(assert (=> b!996189 m!923381))

(declare-fun m!923389 () Bool)

(assert (=> b!996189 m!923389))

(declare-fun m!923391 () Bool)

(assert (=> bm!42224 m!923391))

(assert (=> b!996085 d!118961))

(declare-fun d!118971 () Bool)

(assert (=> d!118971 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85964 d!118971))

(declare-fun d!118975 () Bool)

(assert (=> d!118975 (= (array_inv!23464 a!3219) (bvsge (size!30842 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85964 d!118975))

(declare-fun d!118977 () Bool)

(declare-fun res!666371 () Bool)

(declare-fun e!562086 () Bool)

(assert (=> d!118977 (=> res!666371 e!562086)))

(assert (=> d!118977 (= res!666371 (= (select (arr!30340 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!118977 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!562086)))

(declare-fun b!996200 () Bool)

(declare-fun e!562087 () Bool)

(assert (=> b!996200 (= e!562086 e!562087)))

(declare-fun res!666372 () Bool)

(assert (=> b!996200 (=> (not res!666372) (not e!562087))))

(assert (=> b!996200 (= res!666372 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30842 a!3219)))))

(declare-fun b!996201 () Bool)

(assert (=> b!996201 (= e!562087 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118977 (not res!666371)) b!996200))

(assert (= (and b!996200 res!666372) b!996201))

(assert (=> d!118977 m!923381))

(declare-fun m!923407 () Bool)

(assert (=> b!996201 m!923407))

(assert (=> b!996090 d!118977))

(declare-fun b!996258 () Bool)

(declare-fun e!562124 () SeekEntryResult!9272)

(declare-fun lt!441194 () SeekEntryResult!9272)

(assert (=> b!996258 (= e!562124 (MissingZero!9272 (index!39461 lt!441194)))))

(declare-fun b!996259 () Bool)

(declare-fun e!562126 () SeekEntryResult!9272)

(assert (=> b!996259 (= e!562126 (Found!9272 (index!39461 lt!441194)))))

(declare-fun d!118979 () Bool)

(declare-fun lt!441192 () SeekEntryResult!9272)

(assert (=> d!118979 (and (or (is-Undefined!9272 lt!441192) (not (is-Found!9272 lt!441192)) (and (bvsge (index!39460 lt!441192) #b00000000000000000000000000000000) (bvslt (index!39460 lt!441192) (size!30842 a!3219)))) (or (is-Undefined!9272 lt!441192) (is-Found!9272 lt!441192) (not (is-MissingZero!9272 lt!441192)) (and (bvsge (index!39459 lt!441192) #b00000000000000000000000000000000) (bvslt (index!39459 lt!441192) (size!30842 a!3219)))) (or (is-Undefined!9272 lt!441192) (is-Found!9272 lt!441192) (is-MissingZero!9272 lt!441192) (not (is-MissingVacant!9272 lt!441192)) (and (bvsge (index!39462 lt!441192) #b00000000000000000000000000000000) (bvslt (index!39462 lt!441192) (size!30842 a!3219)))) (or (is-Undefined!9272 lt!441192) (ite (is-Found!9272 lt!441192) (= (select (arr!30340 a!3219) (index!39460 lt!441192)) k!2224) (ite (is-MissingZero!9272 lt!441192) (= (select (arr!30340 a!3219) (index!39459 lt!441192)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9272 lt!441192) (= (select (arr!30340 a!3219) (index!39462 lt!441192)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!562125 () SeekEntryResult!9272)

(assert (=> d!118979 (= lt!441192 e!562125)))

(declare-fun c!101075 () Bool)

(assert (=> d!118979 (= c!101075 (and (is-Intermediate!9272 lt!441194) (undefined!10084 lt!441194)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63014 (_ BitVec 32)) SeekEntryResult!9272)

(assert (=> d!118979 (= lt!441194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!118979 (validMask!0 mask!3464)))

(assert (=> d!118979 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441192)))

(declare-fun b!996260 () Bool)

(declare-fun c!101076 () Bool)

(declare-fun lt!441193 () (_ BitVec 64))

(assert (=> b!996260 (= c!101076 (= lt!441193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!996260 (= e!562126 e!562124)))

(declare-fun b!996261 () Bool)

(assert (=> b!996261 (= e!562125 Undefined!9272)))

(declare-fun b!996262 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63014 (_ BitVec 32)) SeekEntryResult!9272)

(assert (=> b!996262 (= e!562124 (seekKeyOrZeroReturnVacant!0 (x!86897 lt!441194) (index!39461 lt!441194) (index!39461 lt!441194) k!2224 a!3219 mask!3464))))

(declare-fun b!996263 () Bool)

(assert (=> b!996263 (= e!562125 e!562126)))

(assert (=> b!996263 (= lt!441193 (select (arr!30340 a!3219) (index!39461 lt!441194)))))

(declare-fun c!101077 () Bool)

(assert (=> b!996263 (= c!101077 (= lt!441193 k!2224))))

(assert (= (and d!118979 c!101075) b!996261))

(assert (= (and d!118979 (not c!101075)) b!996263))

(assert (= (and b!996263 c!101077) b!996259))

(assert (= (and b!996263 (not c!101077)) b!996260))

(assert (= (and b!996260 c!101076) b!996258))

(assert (= (and b!996260 (not c!101076)) b!996262))

(declare-fun m!923439 () Bool)

(assert (=> d!118979 m!923439))

(assert (=> d!118979 m!923439))

(declare-fun m!923443 () Bool)

(assert (=> d!118979 m!923443))

(declare-fun m!923447 () Bool)

(assert (=> d!118979 m!923447))

(declare-fun m!923449 () Bool)

(assert (=> d!118979 m!923449))

(declare-fun m!923451 () Bool)

(assert (=> d!118979 m!923451))

(assert (=> d!118979 m!923315))

(declare-fun m!923453 () Bool)

(assert (=> b!996262 m!923453))

(declare-fun m!923455 () Bool)

(assert (=> b!996263 m!923455))

(assert (=> b!996086 d!118979))

(declare-fun d!118999 () Bool)

(declare-fun lt!441203 () (_ BitVec 32))

(declare-fun lt!441202 () (_ BitVec 32))

(assert (=> d!118999 (= lt!441203 (bvmul (bvxor lt!441202 (bvlshr lt!441202 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!118999 (= lt!441202 ((_ extract 31 0) (bvand (bvxor (select (arr!30340 a!3219) j!170) (bvlshr (select (arr!30340 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!118999 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!666393 (let ((h!22179 ((_ extract 31 0) (bvand (bvxor (select (arr!30340 a!3219) j!170) (bvlshr (select (arr!30340 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!86902 (bvmul (bvxor h!22179 (bvlshr h!22179 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!86902 (bvlshr x!86902 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!666393 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!666393 #b00000000000000000000000000000000))))))

(assert (=> d!118999 (= (toIndex!0 (select (arr!30340 a!3219) j!170) mask!3464) (bvand (bvxor lt!441203 (bvlshr lt!441203 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!996088 d!118999))

(declare-fun b!996278 () Bool)

(declare-fun e!562138 () Bool)

(declare-fun call!42236 () Bool)

(assert (=> b!996278 (= e!562138 call!42236)))

(declare-fun bm!42233 () Bool)

(declare-fun c!101081 () Bool)

(assert (=> bm!42233 (= call!42236 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101081 (Cons!21012 (select (arr!30340 a!3219) #b00000000000000000000000000000000) Nil!21013) Nil!21013)))))

(declare-fun b!996279 () Bool)

(declare-fun e!562141 () Bool)

(assert (=> b!996279 (= e!562141 e!562138)))

(assert (=> b!996279 (= c!101081 (validKeyInArray!0 (select (arr!30340 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996280 () Bool)

(declare-fun e!562139 () Bool)

(assert (=> b!996280 (= e!562139 e!562141)))

(declare-fun res!666402 () Bool)

(assert (=> b!996280 (=> (not res!666402) (not e!562141))))

(declare-fun e!562140 () Bool)

(assert (=> b!996280 (= res!666402 (not e!562140))))

(declare-fun res!666401 () Bool)

(assert (=> b!996280 (=> (not res!666401) (not e!562140))))

(assert (=> b!996280 (= res!666401 (validKeyInArray!0 (select (arr!30340 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119001 () Bool)

(declare-fun res!666400 () Bool)

(assert (=> d!119001 (=> res!666400 e!562139)))

(assert (=> d!119001 (= res!666400 (bvsge #b00000000000000000000000000000000 (size!30842 a!3219)))))

(assert (=> d!119001 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21013) e!562139)))

(declare-fun b!996281 () Bool)

(declare-fun contains!5866 (List!21016 (_ BitVec 64)) Bool)

(assert (=> b!996281 (= e!562140 (contains!5866 Nil!21013 (select (arr!30340 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996282 () Bool)

(assert (=> b!996282 (= e!562138 call!42236)))

(assert (= (and d!119001 (not res!666400)) b!996280))

(assert (= (and b!996280 res!666401) b!996281))

(assert (= (and b!996280 res!666402) b!996279))

(assert (= (and b!996279 c!101081) b!996278))

(assert (= (and b!996279 (not c!101081)) b!996282))

(assert (= (or b!996278 b!996282) bm!42233))

(assert (=> bm!42233 m!923381))

(declare-fun m!923457 () Bool)

(assert (=> bm!42233 m!923457))

(assert (=> b!996279 m!923381))

(assert (=> b!996279 m!923381))

(assert (=> b!996279 m!923383))

(assert (=> b!996280 m!923381))

(assert (=> b!996280 m!923381))

(assert (=> b!996280 m!923383))

(assert (=> b!996281 m!923381))

(assert (=> b!996281 m!923381))

(declare-fun m!923459 () Bool)

(assert (=> b!996281 m!923459))

(assert (=> b!996082 d!119001))

(declare-fun d!119007 () Bool)

(assert (=> d!119007 (= (validKeyInArray!0 (select (arr!30340 a!3219) j!170)) (and (not (= (select (arr!30340 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30340 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996087 d!119007))

(declare-fun d!119009 () Bool)

(assert (=> d!119009 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996084 d!119009))

(push 1)

(assert (not b!996279))

(assert (not b!996201))

(assert (not b!996189))

(assert (not b!996187))

(assert (not bm!42233))

(assert (not d!118979))

(assert (not bm!42224))

(assert (not b!996281))

(assert (not b!996280))

(assert (not b!996262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

