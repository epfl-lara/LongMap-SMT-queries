; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28676 () Bool)

(assert start!28676)

(declare-fun b!292998 () Bool)

(declare-fun res!154111 () Bool)

(declare-fun e!185275 () Bool)

(assert (=> b!292998 (=> (not res!154111) (not e!185275))))

(declare-datatypes ((array!14848 0))(
  ( (array!14849 (arr!7047 (Array (_ BitVec 32) (_ BitVec 64))) (size!7400 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14848)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292998 (= res!154111 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292999 () Bool)

(declare-fun res!154109 () Bool)

(assert (=> b!292999 (=> (not res!154109) (not e!185275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292999 (= res!154109 (validKeyInArray!0 k0!2524))))

(declare-fun b!293000 () Bool)

(declare-fun e!185277 () Bool)

(assert (=> b!293000 (= e!185275 e!185277)))

(declare-fun res!154108 () Bool)

(assert (=> b!293000 (=> (not res!154108) (not e!185277))))

(declare-fun lt!145117 () Bool)

(declare-datatypes ((SeekEntryResult!2195 0))(
  ( (MissingZero!2195 (index!10950 (_ BitVec 32))) (Found!2195 (index!10951 (_ BitVec 32))) (Intermediate!2195 (undefined!3007 Bool) (index!10952 (_ BitVec 32)) (x!29145 (_ BitVec 32))) (Undefined!2195) (MissingVacant!2195 (index!10953 (_ BitVec 32))) )
))
(declare-fun lt!145115 () SeekEntryResult!2195)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293000 (= res!154108 (or lt!145117 (= lt!145115 (MissingVacant!2195 i!1256))))))

(assert (=> b!293000 (= lt!145117 (= lt!145115 (MissingZero!2195 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14848 (_ BitVec 32)) SeekEntryResult!2195)

(assert (=> b!293000 (= lt!145115 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293001 () Bool)

(declare-fun res!154110 () Bool)

(assert (=> b!293001 (=> (not res!154110) (not e!185277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14848 (_ BitVec 32)) Bool)

(assert (=> b!293001 (= res!154110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293002 () Bool)

(declare-fun lt!145116 () SeekEntryResult!2195)

(get-info :version)

(assert (=> b!293002 (= e!185277 (and lt!145117 ((_ is Intermediate!2195) lt!145116) (undefined!3007 lt!145116)))))

(declare-fun lt!145119 () SeekEntryResult!2195)

(declare-fun lt!145118 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14848 (_ BitVec 32)) SeekEntryResult!2195)

(assert (=> b!293002 (= lt!145119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145118 k0!2524 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312)) mask!3809))))

(assert (=> b!293002 (= lt!145116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145118 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293002 (= lt!145118 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!154107 () Bool)

(assert (=> start!28676 (=> (not res!154107) (not e!185275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28676 (= res!154107 (validMask!0 mask!3809))))

(assert (=> start!28676 e!185275))

(assert (=> start!28676 true))

(declare-fun array_inv!5019 (array!14848) Bool)

(assert (=> start!28676 (array_inv!5019 a!3312)))

(declare-fun b!293003 () Bool)

(declare-fun res!154106 () Bool)

(assert (=> b!293003 (=> (not res!154106) (not e!185275))))

(assert (=> b!293003 (= res!154106 (and (= (size!7400 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7400 a!3312))))))

(assert (= (and start!28676 res!154107) b!293003))

(assert (= (and b!293003 res!154106) b!292999))

(assert (= (and b!292999 res!154109) b!292998))

(assert (= (and b!292998 res!154111) b!293000))

(assert (= (and b!293000 res!154108) b!293001))

(assert (= (and b!293001 res!154110) b!293002))

(declare-fun m!306353 () Bool)

(assert (=> b!293001 m!306353))

(declare-fun m!306355 () Bool)

(assert (=> start!28676 m!306355))

(declare-fun m!306357 () Bool)

(assert (=> start!28676 m!306357))

(declare-fun m!306359 () Bool)

(assert (=> b!293002 m!306359))

(declare-fun m!306361 () Bool)

(assert (=> b!293002 m!306361))

(declare-fun m!306363 () Bool)

(assert (=> b!293002 m!306363))

(declare-fun m!306365 () Bool)

(assert (=> b!293002 m!306365))

(declare-fun m!306367 () Bool)

(assert (=> b!292999 m!306367))

(declare-fun m!306369 () Bool)

(assert (=> b!292998 m!306369))

(declare-fun m!306371 () Bool)

(assert (=> b!293000 m!306371))

(check-sat (not b!292999) (not b!292998) (not b!293001) (not start!28676) (not b!293002) (not b!293000))
(check-sat)
(get-model)

(declare-fun lt!145164 () SeekEntryResult!2195)

(declare-fun b!293070 () Bool)

(assert (=> b!293070 (and (bvsge (index!10952 lt!145164) #b00000000000000000000000000000000) (bvslt (index!10952 lt!145164) (size!7400 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312)))))))

(declare-fun res!154161 () Bool)

(assert (=> b!293070 (= res!154161 (= (select (arr!7047 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312))) (index!10952 lt!145164)) k0!2524))))

(declare-fun e!185316 () Bool)

(assert (=> b!293070 (=> res!154161 e!185316)))

(declare-fun e!185315 () Bool)

(assert (=> b!293070 (= e!185315 e!185316)))

(declare-fun b!293071 () Bool)

(assert (=> b!293071 (and (bvsge (index!10952 lt!145164) #b00000000000000000000000000000000) (bvslt (index!10952 lt!145164) (size!7400 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312)))))))

(assert (=> b!293071 (= e!185316 (= (select (arr!7047 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312))) (index!10952 lt!145164)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66355 () Bool)

(declare-fun e!185317 () Bool)

(assert (=> d!66355 e!185317))

(declare-fun c!47023 () Bool)

(assert (=> d!66355 (= c!47023 (and ((_ is Intermediate!2195) lt!145164) (undefined!3007 lt!145164)))))

(declare-fun e!185318 () SeekEntryResult!2195)

(assert (=> d!66355 (= lt!145164 e!185318)))

(declare-fun c!47021 () Bool)

(assert (=> d!66355 (= c!47021 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145163 () (_ BitVec 64))

(assert (=> d!66355 (= lt!145163 (select (arr!7047 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312))) lt!145118))))

(assert (=> d!66355 (validMask!0 mask!3809)))

(assert (=> d!66355 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145118 k0!2524 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312)) mask!3809) lt!145164)))

(declare-fun b!293072 () Bool)

(assert (=> b!293072 (= e!185317 (bvsge (x!29145 lt!145164) #b01111111111111111111111111111110))))

(declare-fun b!293073 () Bool)

(assert (=> b!293073 (= e!185317 e!185315)))

(declare-fun res!154162 () Bool)

(assert (=> b!293073 (= res!154162 (and ((_ is Intermediate!2195) lt!145164) (not (undefined!3007 lt!145164)) (bvslt (x!29145 lt!145164) #b01111111111111111111111111111110) (bvsge (x!29145 lt!145164) #b00000000000000000000000000000000) (bvsge (x!29145 lt!145164) #b00000000000000000000000000000000)))))

(assert (=> b!293073 (=> (not res!154162) (not e!185315))))

(declare-fun b!293074 () Bool)

(assert (=> b!293074 (= e!185318 (Intermediate!2195 true lt!145118 #b00000000000000000000000000000000))))

(declare-fun b!293075 () Bool)

(assert (=> b!293075 (and (bvsge (index!10952 lt!145164) #b00000000000000000000000000000000) (bvslt (index!10952 lt!145164) (size!7400 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312)))))))

(declare-fun res!154160 () Bool)

(assert (=> b!293075 (= res!154160 (= (select (arr!7047 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312))) (index!10952 lt!145164)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293075 (=> res!154160 e!185316)))

(declare-fun b!293076 () Bool)

(declare-fun e!185319 () SeekEntryResult!2195)

(assert (=> b!293076 (= e!185318 e!185319)))

(declare-fun c!47022 () Bool)

(assert (=> b!293076 (= c!47022 (or (= lt!145163 k0!2524) (= (bvadd lt!145163 lt!145163) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293077 () Bool)

(assert (=> b!293077 (= e!185319 (Intermediate!2195 false lt!145118 #b00000000000000000000000000000000))))

(declare-fun b!293078 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293078 (= e!185319 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145118 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14849 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7400 a!3312)) mask!3809))))

(assert (= (and d!66355 c!47021) b!293074))

(assert (= (and d!66355 (not c!47021)) b!293076))

(assert (= (and b!293076 c!47022) b!293077))

(assert (= (and b!293076 (not c!47022)) b!293078))

(assert (= (and d!66355 c!47023) b!293072))

(assert (= (and d!66355 (not c!47023)) b!293073))

(assert (= (and b!293073 res!154162) b!293070))

(assert (= (and b!293070 (not res!154161)) b!293075))

(assert (= (and b!293075 (not res!154160)) b!293071))

(declare-fun m!306425 () Bool)

(assert (=> b!293070 m!306425))

(declare-fun m!306427 () Bool)

(assert (=> b!293078 m!306427))

(assert (=> b!293078 m!306427))

(declare-fun m!306429 () Bool)

(assert (=> b!293078 m!306429))

(assert (=> b!293075 m!306425))

(assert (=> b!293071 m!306425))

(declare-fun m!306431 () Bool)

(assert (=> d!66355 m!306431))

(assert (=> d!66355 m!306355))

(assert (=> b!293002 d!66355))

(declare-fun b!293079 () Bool)

(declare-fun lt!145166 () SeekEntryResult!2195)

(assert (=> b!293079 (and (bvsge (index!10952 lt!145166) #b00000000000000000000000000000000) (bvslt (index!10952 lt!145166) (size!7400 a!3312)))))

(declare-fun res!154164 () Bool)

(assert (=> b!293079 (= res!154164 (= (select (arr!7047 a!3312) (index!10952 lt!145166)) k0!2524))))

(declare-fun e!185321 () Bool)

(assert (=> b!293079 (=> res!154164 e!185321)))

(declare-fun e!185320 () Bool)

(assert (=> b!293079 (= e!185320 e!185321)))

(declare-fun b!293080 () Bool)

(assert (=> b!293080 (and (bvsge (index!10952 lt!145166) #b00000000000000000000000000000000) (bvslt (index!10952 lt!145166) (size!7400 a!3312)))))

(assert (=> b!293080 (= e!185321 (= (select (arr!7047 a!3312) (index!10952 lt!145166)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66369 () Bool)

(declare-fun e!185322 () Bool)

(assert (=> d!66369 e!185322))

(declare-fun c!47026 () Bool)

(assert (=> d!66369 (= c!47026 (and ((_ is Intermediate!2195) lt!145166) (undefined!3007 lt!145166)))))

(declare-fun e!185323 () SeekEntryResult!2195)

(assert (=> d!66369 (= lt!145166 e!185323)))

(declare-fun c!47024 () Bool)

(assert (=> d!66369 (= c!47024 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145165 () (_ BitVec 64))

(assert (=> d!66369 (= lt!145165 (select (arr!7047 a!3312) lt!145118))))

(assert (=> d!66369 (validMask!0 mask!3809)))

(assert (=> d!66369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145118 k0!2524 a!3312 mask!3809) lt!145166)))

(declare-fun b!293081 () Bool)

(assert (=> b!293081 (= e!185322 (bvsge (x!29145 lt!145166) #b01111111111111111111111111111110))))

(declare-fun b!293082 () Bool)

(assert (=> b!293082 (= e!185322 e!185320)))

(declare-fun res!154165 () Bool)

(assert (=> b!293082 (= res!154165 (and ((_ is Intermediate!2195) lt!145166) (not (undefined!3007 lt!145166)) (bvslt (x!29145 lt!145166) #b01111111111111111111111111111110) (bvsge (x!29145 lt!145166) #b00000000000000000000000000000000) (bvsge (x!29145 lt!145166) #b00000000000000000000000000000000)))))

(assert (=> b!293082 (=> (not res!154165) (not e!185320))))

(declare-fun b!293083 () Bool)

(assert (=> b!293083 (= e!185323 (Intermediate!2195 true lt!145118 #b00000000000000000000000000000000))))

(declare-fun b!293084 () Bool)

(assert (=> b!293084 (and (bvsge (index!10952 lt!145166) #b00000000000000000000000000000000) (bvslt (index!10952 lt!145166) (size!7400 a!3312)))))

(declare-fun res!154163 () Bool)

(assert (=> b!293084 (= res!154163 (= (select (arr!7047 a!3312) (index!10952 lt!145166)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293084 (=> res!154163 e!185321)))

(declare-fun b!293085 () Bool)

(declare-fun e!185324 () SeekEntryResult!2195)

(assert (=> b!293085 (= e!185323 e!185324)))

(declare-fun c!47025 () Bool)

(assert (=> b!293085 (= c!47025 (or (= lt!145165 k0!2524) (= (bvadd lt!145165 lt!145165) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293086 () Bool)

(assert (=> b!293086 (= e!185324 (Intermediate!2195 false lt!145118 #b00000000000000000000000000000000))))

(declare-fun b!293087 () Bool)

(assert (=> b!293087 (= e!185324 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145118 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66369 c!47024) b!293083))

(assert (= (and d!66369 (not c!47024)) b!293085))

(assert (= (and b!293085 c!47025) b!293086))

(assert (= (and b!293085 (not c!47025)) b!293087))

(assert (= (and d!66369 c!47026) b!293081))

(assert (= (and d!66369 (not c!47026)) b!293082))

(assert (= (and b!293082 res!154165) b!293079))

(assert (= (and b!293079 (not res!154164)) b!293084))

(assert (= (and b!293084 (not res!154163)) b!293080))

(declare-fun m!306433 () Bool)

(assert (=> b!293079 m!306433))

(assert (=> b!293087 m!306427))

(assert (=> b!293087 m!306427))

(declare-fun m!306435 () Bool)

(assert (=> b!293087 m!306435))

(assert (=> b!293084 m!306433))

(assert (=> b!293080 m!306433))

(declare-fun m!306437 () Bool)

(assert (=> d!66369 m!306437))

(assert (=> d!66369 m!306355))

(assert (=> b!293002 d!66369))

(declare-fun d!66371 () Bool)

(declare-fun lt!145172 () (_ BitVec 32))

(declare-fun lt!145171 () (_ BitVec 32))

(assert (=> d!66371 (= lt!145172 (bvmul (bvxor lt!145171 (bvlshr lt!145171 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66371 (= lt!145171 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66371 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154166 (let ((h!5236 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29149 (bvmul (bvxor h!5236 (bvlshr h!5236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29149 (bvlshr x!29149 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154166 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154166 #b00000000000000000000000000000000))))))

(assert (=> d!66371 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145172 (bvlshr lt!145172 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293002 d!66371))

(declare-fun d!66373 () Bool)

(assert (=> d!66373 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28676 d!66373))

(declare-fun d!66381 () Bool)

(assert (=> d!66381 (= (array_inv!5019 a!3312) (bvsge (size!7400 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28676 d!66381))

(declare-fun b!293146 () Bool)

(declare-fun e!185363 () Bool)

(declare-fun e!185362 () Bool)

(assert (=> b!293146 (= e!185363 e!185362)))

(declare-fun c!47047 () Bool)

(assert (=> b!293146 (= c!47047 (validKeyInArray!0 (select (arr!7047 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!293147 () Bool)

(declare-fun call!25642 () Bool)

(assert (=> b!293147 (= e!185362 call!25642)))

(declare-fun b!293148 () Bool)

(declare-fun e!185361 () Bool)

(assert (=> b!293148 (= e!185361 call!25642)))

(declare-fun d!66385 () Bool)

(declare-fun res!154188 () Bool)

(assert (=> d!66385 (=> res!154188 e!185363)))

(assert (=> d!66385 (= res!154188 (bvsge #b00000000000000000000000000000000 (size!7400 a!3312)))))

(assert (=> d!66385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185363)))

(declare-fun b!293149 () Bool)

(assert (=> b!293149 (= e!185362 e!185361)))

(declare-fun lt!145198 () (_ BitVec 64))

(assert (=> b!293149 (= lt!145198 (select (arr!7047 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9132 0))(
  ( (Unit!9133) )
))
(declare-fun lt!145199 () Unit!9132)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14848 (_ BitVec 64) (_ BitVec 32)) Unit!9132)

(assert (=> b!293149 (= lt!145199 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145198 #b00000000000000000000000000000000))))

(assert (=> b!293149 (arrayContainsKey!0 a!3312 lt!145198 #b00000000000000000000000000000000)))

(declare-fun lt!145197 () Unit!9132)

(assert (=> b!293149 (= lt!145197 lt!145199)))

(declare-fun res!154189 () Bool)

(assert (=> b!293149 (= res!154189 (= (seekEntryOrOpen!0 (select (arr!7047 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2195 #b00000000000000000000000000000000)))))

(assert (=> b!293149 (=> (not res!154189) (not e!185361))))

(declare-fun bm!25639 () Bool)

(assert (=> bm!25639 (= call!25642 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66385 (not res!154188)) b!293146))

(assert (= (and b!293146 c!47047) b!293149))

(assert (= (and b!293146 (not c!47047)) b!293147))

(assert (= (and b!293149 res!154189) b!293148))

(assert (= (or b!293148 b!293147) bm!25639))

(declare-fun m!306453 () Bool)

(assert (=> b!293146 m!306453))

(assert (=> b!293146 m!306453))

(declare-fun m!306455 () Bool)

(assert (=> b!293146 m!306455))

(assert (=> b!293149 m!306453))

(declare-fun m!306457 () Bool)

(assert (=> b!293149 m!306457))

(declare-fun m!306459 () Bool)

(assert (=> b!293149 m!306459))

(assert (=> b!293149 m!306453))

(declare-fun m!306461 () Bool)

(assert (=> b!293149 m!306461))

(declare-fun m!306463 () Bool)

(assert (=> bm!25639 m!306463))

(assert (=> b!293001 d!66385))

(declare-fun b!293202 () Bool)

(declare-fun e!185390 () SeekEntryResult!2195)

(assert (=> b!293202 (= e!185390 Undefined!2195)))

(declare-fun d!66389 () Bool)

(declare-fun lt!145225 () SeekEntryResult!2195)

(assert (=> d!66389 (and (or ((_ is Undefined!2195) lt!145225) (not ((_ is Found!2195) lt!145225)) (and (bvsge (index!10951 lt!145225) #b00000000000000000000000000000000) (bvslt (index!10951 lt!145225) (size!7400 a!3312)))) (or ((_ is Undefined!2195) lt!145225) ((_ is Found!2195) lt!145225) (not ((_ is MissingZero!2195) lt!145225)) (and (bvsge (index!10950 lt!145225) #b00000000000000000000000000000000) (bvslt (index!10950 lt!145225) (size!7400 a!3312)))) (or ((_ is Undefined!2195) lt!145225) ((_ is Found!2195) lt!145225) ((_ is MissingZero!2195) lt!145225) (not ((_ is MissingVacant!2195) lt!145225)) (and (bvsge (index!10953 lt!145225) #b00000000000000000000000000000000) (bvslt (index!10953 lt!145225) (size!7400 a!3312)))) (or ((_ is Undefined!2195) lt!145225) (ite ((_ is Found!2195) lt!145225) (= (select (arr!7047 a!3312) (index!10951 lt!145225)) k0!2524) (ite ((_ is MissingZero!2195) lt!145225) (= (select (arr!7047 a!3312) (index!10950 lt!145225)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2195) lt!145225) (= (select (arr!7047 a!3312) (index!10953 lt!145225)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66389 (= lt!145225 e!185390)))

(declare-fun c!47071 () Bool)

(declare-fun lt!145227 () SeekEntryResult!2195)

(assert (=> d!66389 (= c!47071 (and ((_ is Intermediate!2195) lt!145227) (undefined!3007 lt!145227)))))

(assert (=> d!66389 (= lt!145227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66389 (validMask!0 mask!3809)))

(assert (=> d!66389 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145225)))

(declare-fun b!293203 () Bool)

(declare-fun e!185391 () SeekEntryResult!2195)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14848 (_ BitVec 32)) SeekEntryResult!2195)

(assert (=> b!293203 (= e!185391 (seekKeyOrZeroReturnVacant!0 (x!29145 lt!145227) (index!10952 lt!145227) (index!10952 lt!145227) k0!2524 a!3312 mask!3809))))

(declare-fun b!293204 () Bool)

(declare-fun c!47069 () Bool)

(declare-fun lt!145226 () (_ BitVec 64))

(assert (=> b!293204 (= c!47069 (= lt!145226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185389 () SeekEntryResult!2195)

(assert (=> b!293204 (= e!185389 e!185391)))

(declare-fun b!293205 () Bool)

(assert (=> b!293205 (= e!185390 e!185389)))

(assert (=> b!293205 (= lt!145226 (select (arr!7047 a!3312) (index!10952 lt!145227)))))

(declare-fun c!47070 () Bool)

(assert (=> b!293205 (= c!47070 (= lt!145226 k0!2524))))

(declare-fun b!293206 () Bool)

(assert (=> b!293206 (= e!185391 (MissingZero!2195 (index!10952 lt!145227)))))

(declare-fun b!293207 () Bool)

(assert (=> b!293207 (= e!185389 (Found!2195 (index!10952 lt!145227)))))

(assert (= (and d!66389 c!47071) b!293202))

(assert (= (and d!66389 (not c!47071)) b!293205))

(assert (= (and b!293205 c!47070) b!293207))

(assert (= (and b!293205 (not c!47070)) b!293204))

(assert (= (and b!293204 c!47069) b!293206))

(assert (= (and b!293204 (not c!47069)) b!293203))

(assert (=> d!66389 m!306355))

(assert (=> d!66389 m!306365))

(declare-fun m!306491 () Bool)

(assert (=> d!66389 m!306491))

(assert (=> d!66389 m!306365))

(declare-fun m!306493 () Bool)

(assert (=> d!66389 m!306493))

(declare-fun m!306495 () Bool)

(assert (=> d!66389 m!306495))

(declare-fun m!306497 () Bool)

(assert (=> d!66389 m!306497))

(declare-fun m!306499 () Bool)

(assert (=> b!293203 m!306499))

(declare-fun m!306501 () Bool)

(assert (=> b!293205 m!306501))

(assert (=> b!293000 d!66389))

(declare-fun d!66399 () Bool)

(assert (=> d!66399 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!292999 d!66399))

(declare-fun d!66401 () Bool)

(declare-fun res!154207 () Bool)

(declare-fun e!185402 () Bool)

(assert (=> d!66401 (=> res!154207 e!185402)))

(assert (=> d!66401 (= res!154207 (= (select (arr!7047 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66401 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185402)))

(declare-fun b!293220 () Bool)

(declare-fun e!185403 () Bool)

(assert (=> b!293220 (= e!185402 e!185403)))

(declare-fun res!154208 () Bool)

(assert (=> b!293220 (=> (not res!154208) (not e!185403))))

(assert (=> b!293220 (= res!154208 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7400 a!3312)))))

(declare-fun b!293221 () Bool)

(assert (=> b!293221 (= e!185403 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66401 (not res!154207)) b!293220))

(assert (= (and b!293220 res!154208) b!293221))

(assert (=> d!66401 m!306453))

(declare-fun m!306503 () Bool)

(assert (=> b!293221 m!306503))

(assert (=> b!292998 d!66401))

(check-sat (not d!66355) (not b!293087) (not b!293078) (not d!66389) (not b!293149) (not b!293203) (not b!293221) (not b!293146) (not bm!25639) (not d!66369))
(check-sat)
