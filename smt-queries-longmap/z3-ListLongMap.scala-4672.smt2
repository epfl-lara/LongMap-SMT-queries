; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65076 () Bool)

(assert start!65076)

(declare-fun b!734193 () Bool)

(declare-fun res!493248 () Bool)

(declare-fun e!410868 () Bool)

(assert (=> b!734193 (=> (not res!493248) (not e!410868))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734193 (= res!493248 (validKeyInArray!0 k0!2102))))

(declare-fun b!734194 () Bool)

(declare-fun e!410859 () Bool)

(declare-fun e!410867 () Bool)

(assert (=> b!734194 (= e!410859 (not e!410867))))

(declare-fun res!493245 () Bool)

(assert (=> b!734194 (=> res!493245 e!410867)))

(declare-datatypes ((SeekEntryResult!7297 0))(
  ( (MissingZero!7297 (index!31556 (_ BitVec 32))) (Found!7297 (index!31557 (_ BitVec 32))) (Intermediate!7297 (undefined!8109 Bool) (index!31558 (_ BitVec 32)) (x!62707 (_ BitVec 32))) (Undefined!7297) (MissingVacant!7297 (index!31559 (_ BitVec 32))) )
))
(declare-fun lt!325394 () SeekEntryResult!7297)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!734194 (= res!493245 (or (not ((_ is Intermediate!7297) lt!325394)) (bvsge x!1131 (x!62707 lt!325394))))))

(declare-fun e!410861 () Bool)

(assert (=> b!734194 e!410861))

(declare-fun res!493244 () Bool)

(assert (=> b!734194 (=> (not res!493244) (not e!410861))))

(declare-datatypes ((array!41257 0))(
  ( (array!41258 (arr!19741 (Array (_ BitVec 32) (_ BitVec 64))) (size!20161 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41257)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41257 (_ BitVec 32)) Bool)

(assert (=> b!734194 (= res!493244 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24991 0))(
  ( (Unit!24992) )
))
(declare-fun lt!325390 () Unit!24991)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24991)

(assert (=> b!734194 (= lt!325390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734195 () Bool)

(declare-fun e!410866 () Bool)

(declare-fun e!410860 () Bool)

(assert (=> b!734195 (= e!410866 e!410860)))

(declare-fun res!493251 () Bool)

(assert (=> b!734195 (=> (not res!493251) (not e!410860))))

(declare-fun lt!325397 () SeekEntryResult!7297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41257 (_ BitVec 32)) SeekEntryResult!7297)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734195 (= res!493251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328) (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325397))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734195 (= lt!325397 (Intermediate!7297 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734196 () Bool)

(declare-fun res!493246 () Bool)

(assert (=> b!734196 (=> (not res!493246) (not e!410868))))

(declare-fun arrayContainsKey!0 (array!41257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734196 (= res!493246 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!734197 () Bool)

(declare-fun e!410865 () Bool)

(assert (=> b!734197 (= e!410865 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325397))))

(declare-fun b!734198 () Bool)

(assert (=> b!734198 (= e!410868 e!410866)))

(declare-fun res!493254 () Bool)

(assert (=> b!734198 (=> (not res!493254) (not e!410866))))

(declare-fun lt!325398 () SeekEntryResult!7297)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734198 (= res!493254 (or (= lt!325398 (MissingZero!7297 i!1173)) (= lt!325398 (MissingVacant!7297 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41257 (_ BitVec 32)) SeekEntryResult!7297)

(assert (=> b!734198 (= lt!325398 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734199 () Bool)

(declare-fun e!410864 () Bool)

(assert (=> b!734199 (= e!410861 e!410864)))

(declare-fun res!493239 () Bool)

(assert (=> b!734199 (=> (not res!493239) (not e!410864))))

(declare-fun lt!325393 () SeekEntryResult!7297)

(assert (=> b!734199 (= res!493239 (= (seekEntryOrOpen!0 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325393))))

(assert (=> b!734199 (= lt!325393 (Found!7297 j!159))))

(declare-fun b!734200 () Bool)

(assert (=> b!734200 (= e!410860 e!410859)))

(declare-fun res!493253 () Bool)

(assert (=> b!734200 (=> (not res!493253) (not e!410859))))

(declare-fun lt!325392 () SeekEntryResult!7297)

(assert (=> b!734200 (= res!493253 (= lt!325392 lt!325394))))

(declare-fun lt!325395 () (_ BitVec 64))

(declare-fun lt!325391 () array!41257)

(assert (=> b!734200 (= lt!325394 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325395 lt!325391 mask!3328))))

(assert (=> b!734200 (= lt!325392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325395 mask!3328) lt!325395 lt!325391 mask!3328))))

(assert (=> b!734200 (= lt!325395 (select (store (arr!19741 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734200 (= lt!325391 (array!41258 (store (arr!19741 a!3186) i!1173 k0!2102) (size!20161 a!3186)))))

(declare-fun b!734201 () Bool)

(declare-fun res!493247 () Bool)

(declare-fun e!410863 () Bool)

(assert (=> b!734201 (=> res!493247 e!410863)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41257 (_ BitVec 32)) SeekEntryResult!7297)

(assert (=> b!734201 (= res!493247 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) (Found!7297 j!159)))))

(declare-fun b!734202 () Bool)

(declare-fun res!493243 () Bool)

(assert (=> b!734202 (=> (not res!493243) (not e!410868))))

(assert (=> b!734202 (= res!493243 (validKeyInArray!0 (select (arr!19741 a!3186) j!159)))))

(declare-fun b!734203 () Bool)

(assert (=> b!734203 (= e!410865 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) (Found!7297 j!159)))))

(declare-fun b!734204 () Bool)

(declare-fun res!493242 () Bool)

(assert (=> b!734204 (=> (not res!493242) (not e!410866))))

(declare-datatypes ((List!13650 0))(
  ( (Nil!13647) (Cons!13646 (h!14718 (_ BitVec 64)) (t!19957 List!13650)) )
))
(declare-fun arrayNoDuplicates!0 (array!41257 (_ BitVec 32) List!13650) Bool)

(assert (=> b!734204 (= res!493242 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13647))))

(declare-fun res!493252 () Bool)

(assert (=> start!65076 (=> (not res!493252) (not e!410868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65076 (= res!493252 (validMask!0 mask!3328))))

(assert (=> start!65076 e!410868))

(assert (=> start!65076 true))

(declare-fun array_inv!15600 (array!41257) Bool)

(assert (=> start!65076 (array_inv!15600 a!3186)))

(declare-fun b!734205 () Bool)

(declare-fun res!493249 () Bool)

(assert (=> b!734205 (=> (not res!493249) (not e!410860))))

(assert (=> b!734205 (= res!493249 e!410865)))

(declare-fun c!80858 () Bool)

(assert (=> b!734205 (= c!80858 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734206 () Bool)

(assert (=> b!734206 (= e!410867 e!410863)))

(declare-fun res!493238 () Bool)

(assert (=> b!734206 (=> res!493238 e!410863)))

(assert (=> b!734206 (= res!493238 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325396 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734206 (= lt!325396 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!734207 () Bool)

(assert (=> b!734207 (= e!410864 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325393))))

(declare-fun b!734208 () Bool)

(declare-fun res!493241 () Bool)

(assert (=> b!734208 (=> (not res!493241) (not e!410866))))

(assert (=> b!734208 (= res!493241 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20161 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20161 a!3186))))))

(declare-fun b!734209 () Bool)

(declare-fun res!493250 () Bool)

(assert (=> b!734209 (=> (not res!493250) (not e!410860))))

(assert (=> b!734209 (= res!493250 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19741 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734210 () Bool)

(declare-fun res!493240 () Bool)

(assert (=> b!734210 (=> (not res!493240) (not e!410866))))

(assert (=> b!734210 (= res!493240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734211 () Bool)

(assert (=> b!734211 (= e!410863 (or (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!325396 #b00000000000000000000000000000000) (bvslt lt!325396 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun b!734212 () Bool)

(declare-fun res!493255 () Bool)

(assert (=> b!734212 (=> (not res!493255) (not e!410868))))

(assert (=> b!734212 (= res!493255 (and (= (size!20161 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20161 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20161 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65076 res!493252) b!734212))

(assert (= (and b!734212 res!493255) b!734202))

(assert (= (and b!734202 res!493243) b!734193))

(assert (= (and b!734193 res!493248) b!734196))

(assert (= (and b!734196 res!493246) b!734198))

(assert (= (and b!734198 res!493254) b!734210))

(assert (= (and b!734210 res!493240) b!734204))

(assert (= (and b!734204 res!493242) b!734208))

(assert (= (and b!734208 res!493241) b!734195))

(assert (= (and b!734195 res!493251) b!734209))

(assert (= (and b!734209 res!493250) b!734205))

(assert (= (and b!734205 c!80858) b!734197))

(assert (= (and b!734205 (not c!80858)) b!734203))

(assert (= (and b!734205 res!493249) b!734200))

(assert (= (and b!734200 res!493253) b!734194))

(assert (= (and b!734194 res!493244) b!734199))

(assert (= (and b!734199 res!493239) b!734207))

(assert (= (and b!734194 (not res!493245)) b!734206))

(assert (= (and b!734206 (not res!493238)) b!734201))

(assert (= (and b!734201 (not res!493247)) b!734211))

(declare-fun m!687483 () Bool)

(assert (=> b!734193 m!687483))

(declare-fun m!687485 () Bool)

(assert (=> b!734206 m!687485))

(declare-fun m!687487 () Bool)

(assert (=> b!734195 m!687487))

(assert (=> b!734195 m!687487))

(declare-fun m!687489 () Bool)

(assert (=> b!734195 m!687489))

(assert (=> b!734195 m!687489))

(assert (=> b!734195 m!687487))

(declare-fun m!687491 () Bool)

(assert (=> b!734195 m!687491))

(declare-fun m!687493 () Bool)

(assert (=> start!65076 m!687493))

(declare-fun m!687495 () Bool)

(assert (=> start!65076 m!687495))

(assert (=> b!734199 m!687487))

(assert (=> b!734199 m!687487))

(declare-fun m!687497 () Bool)

(assert (=> b!734199 m!687497))

(assert (=> b!734207 m!687487))

(assert (=> b!734207 m!687487))

(declare-fun m!687499 () Bool)

(assert (=> b!734207 m!687499))

(assert (=> b!734203 m!687487))

(assert (=> b!734203 m!687487))

(declare-fun m!687501 () Bool)

(assert (=> b!734203 m!687501))

(declare-fun m!687503 () Bool)

(assert (=> b!734210 m!687503))

(declare-fun m!687505 () Bool)

(assert (=> b!734194 m!687505))

(declare-fun m!687507 () Bool)

(assert (=> b!734194 m!687507))

(declare-fun m!687509 () Bool)

(assert (=> b!734196 m!687509))

(assert (=> b!734202 m!687487))

(assert (=> b!734202 m!687487))

(declare-fun m!687511 () Bool)

(assert (=> b!734202 m!687511))

(assert (=> b!734197 m!687487))

(assert (=> b!734197 m!687487))

(declare-fun m!687513 () Bool)

(assert (=> b!734197 m!687513))

(declare-fun m!687515 () Bool)

(assert (=> b!734200 m!687515))

(declare-fun m!687517 () Bool)

(assert (=> b!734200 m!687517))

(declare-fun m!687519 () Bool)

(assert (=> b!734200 m!687519))

(assert (=> b!734200 m!687517))

(declare-fun m!687521 () Bool)

(assert (=> b!734200 m!687521))

(declare-fun m!687523 () Bool)

(assert (=> b!734200 m!687523))

(declare-fun m!687525 () Bool)

(assert (=> b!734209 m!687525))

(declare-fun m!687527 () Bool)

(assert (=> b!734198 m!687527))

(declare-fun m!687529 () Bool)

(assert (=> b!734204 m!687529))

(assert (=> b!734201 m!687487))

(assert (=> b!734201 m!687487))

(assert (=> b!734201 m!687501))

(check-sat (not b!734210) (not b!734198) (not b!734200) (not b!734206) (not start!65076) (not b!734204) (not b!734202) (not b!734199) (not b!734194) (not b!734196) (not b!734195) (not b!734193) (not b!734197) (not b!734201) (not b!734203) (not b!734207))
(check-sat)
(get-model)

(declare-fun b!734345 () Bool)

(declare-fun e!410937 () SeekEntryResult!7297)

(declare-fun e!410935 () SeekEntryResult!7297)

(assert (=> b!734345 (= e!410937 e!410935)))

(declare-fun c!80871 () Bool)

(declare-fun lt!325458 () (_ BitVec 64))

(assert (=> b!734345 (= c!80871 (= lt!325458 (select (arr!19741 a!3186) j!159)))))

(declare-fun b!734346 () Bool)

(assert (=> b!734346 (= e!410935 (Found!7297 index!1321))))

(declare-fun e!410936 () SeekEntryResult!7297)

(declare-fun b!734347 () Bool)

(assert (=> b!734347 (= e!410936 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734348 () Bool)

(assert (=> b!734348 (= e!410936 (MissingVacant!7297 resIntermediateIndex!5))))

(declare-fun d!100173 () Bool)

(declare-fun lt!325457 () SeekEntryResult!7297)

(assert (=> d!100173 (and (or ((_ is Undefined!7297) lt!325457) (not ((_ is Found!7297) lt!325457)) (and (bvsge (index!31557 lt!325457) #b00000000000000000000000000000000) (bvslt (index!31557 lt!325457) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325457) ((_ is Found!7297) lt!325457) (not ((_ is MissingVacant!7297) lt!325457)) (not (= (index!31559 lt!325457) resIntermediateIndex!5)) (and (bvsge (index!31559 lt!325457) #b00000000000000000000000000000000) (bvslt (index!31559 lt!325457) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325457) (ite ((_ is Found!7297) lt!325457) (= (select (arr!19741 a!3186) (index!31557 lt!325457)) (select (arr!19741 a!3186) j!159)) (and ((_ is MissingVacant!7297) lt!325457) (= (index!31559 lt!325457) resIntermediateIndex!5) (= (select (arr!19741 a!3186) (index!31559 lt!325457)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100173 (= lt!325457 e!410937)))

(declare-fun c!80873 () Bool)

(assert (=> d!100173 (= c!80873 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100173 (= lt!325458 (select (arr!19741 a!3186) index!1321))))

(assert (=> d!100173 (validMask!0 mask!3328)))

(assert (=> d!100173 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325457)))

(declare-fun b!734349 () Bool)

(declare-fun c!80872 () Bool)

(assert (=> b!734349 (= c!80872 (= lt!325458 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734349 (= e!410935 e!410936)))

(declare-fun b!734350 () Bool)

(assert (=> b!734350 (= e!410937 Undefined!7297)))

(assert (= (and d!100173 c!80873) b!734350))

(assert (= (and d!100173 (not c!80873)) b!734345))

(assert (= (and b!734345 c!80871) b!734346))

(assert (= (and b!734345 (not c!80871)) b!734349))

(assert (= (and b!734349 c!80872) b!734348))

(assert (= (and b!734349 (not c!80872)) b!734347))

(declare-fun m!687627 () Bool)

(assert (=> b!734347 m!687627))

(assert (=> b!734347 m!687627))

(assert (=> b!734347 m!687487))

(declare-fun m!687629 () Bool)

(assert (=> b!734347 m!687629))

(declare-fun m!687631 () Bool)

(assert (=> d!100173 m!687631))

(declare-fun m!687633 () Bool)

(assert (=> d!100173 m!687633))

(declare-fun m!687635 () Bool)

(assert (=> d!100173 m!687635))

(assert (=> d!100173 m!687493))

(assert (=> b!734201 d!100173))

(declare-fun b!734369 () Bool)

(declare-fun e!410950 () SeekEntryResult!7297)

(declare-fun e!410949 () SeekEntryResult!7297)

(assert (=> b!734369 (= e!410950 e!410949)))

(declare-fun c!80882 () Bool)

(declare-fun lt!325463 () (_ BitVec 64))

(assert (=> b!734369 (= c!80882 (or (= lt!325463 lt!325395) (= (bvadd lt!325463 lt!325463) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734370 () Bool)

(declare-fun lt!325464 () SeekEntryResult!7297)

(assert (=> b!734370 (and (bvsge (index!31558 lt!325464) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325464) (size!20161 lt!325391)))))

(declare-fun res!493372 () Bool)

(assert (=> b!734370 (= res!493372 (= (select (arr!19741 lt!325391) (index!31558 lt!325464)) lt!325395))))

(declare-fun e!410951 () Bool)

(assert (=> b!734370 (=> res!493372 e!410951)))

(declare-fun e!410948 () Bool)

(assert (=> b!734370 (= e!410948 e!410951)))

(declare-fun b!734371 () Bool)

(assert (=> b!734371 (and (bvsge (index!31558 lt!325464) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325464) (size!20161 lt!325391)))))

(declare-fun res!493370 () Bool)

(assert (=> b!734371 (= res!493370 (= (select (arr!19741 lt!325391) (index!31558 lt!325464)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734371 (=> res!493370 e!410951)))

(declare-fun b!734372 () Bool)

(declare-fun e!410952 () Bool)

(assert (=> b!734372 (= e!410952 (bvsge (x!62707 lt!325464) #b01111111111111111111111111111110))))

(declare-fun b!734373 () Bool)

(assert (=> b!734373 (= e!410949 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!325395 lt!325391 mask!3328))))

(declare-fun d!100175 () Bool)

(assert (=> d!100175 e!410952))

(declare-fun c!80880 () Bool)

(assert (=> d!100175 (= c!80880 (and ((_ is Intermediate!7297) lt!325464) (undefined!8109 lt!325464)))))

(assert (=> d!100175 (= lt!325464 e!410950)))

(declare-fun c!80881 () Bool)

(assert (=> d!100175 (= c!80881 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100175 (= lt!325463 (select (arr!19741 lt!325391) index!1321))))

(assert (=> d!100175 (validMask!0 mask!3328)))

(assert (=> d!100175 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325395 lt!325391 mask!3328) lt!325464)))

(declare-fun b!734374 () Bool)

(assert (=> b!734374 (= e!410949 (Intermediate!7297 false index!1321 x!1131))))

(declare-fun b!734375 () Bool)

(assert (=> b!734375 (= e!410952 e!410948)))

(declare-fun res!493371 () Bool)

(assert (=> b!734375 (= res!493371 (and ((_ is Intermediate!7297) lt!325464) (not (undefined!8109 lt!325464)) (bvslt (x!62707 lt!325464) #b01111111111111111111111111111110) (bvsge (x!62707 lt!325464) #b00000000000000000000000000000000) (bvsge (x!62707 lt!325464) x!1131)))))

(assert (=> b!734375 (=> (not res!493371) (not e!410948))))

(declare-fun b!734376 () Bool)

(assert (=> b!734376 (= e!410950 (Intermediate!7297 true index!1321 x!1131))))

(declare-fun b!734377 () Bool)

(assert (=> b!734377 (and (bvsge (index!31558 lt!325464) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325464) (size!20161 lt!325391)))))

(assert (=> b!734377 (= e!410951 (= (select (arr!19741 lt!325391) (index!31558 lt!325464)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100175 c!80881) b!734376))

(assert (= (and d!100175 (not c!80881)) b!734369))

(assert (= (and b!734369 c!80882) b!734374))

(assert (= (and b!734369 (not c!80882)) b!734373))

(assert (= (and d!100175 c!80880) b!734372))

(assert (= (and d!100175 (not c!80880)) b!734375))

(assert (= (and b!734375 res!493371) b!734370))

(assert (= (and b!734370 (not res!493372)) b!734371))

(assert (= (and b!734371 (not res!493370)) b!734377))

(declare-fun m!687637 () Bool)

(assert (=> b!734371 m!687637))

(declare-fun m!687639 () Bool)

(assert (=> d!100175 m!687639))

(assert (=> d!100175 m!687493))

(assert (=> b!734377 m!687637))

(assert (=> b!734373 m!687627))

(assert (=> b!734373 m!687627))

(declare-fun m!687641 () Bool)

(assert (=> b!734373 m!687641))

(assert (=> b!734370 m!687637))

(assert (=> b!734200 d!100175))

(declare-fun b!734378 () Bool)

(declare-fun e!410955 () SeekEntryResult!7297)

(declare-fun e!410954 () SeekEntryResult!7297)

(assert (=> b!734378 (= e!410955 e!410954)))

(declare-fun c!80885 () Bool)

(declare-fun lt!325465 () (_ BitVec 64))

(assert (=> b!734378 (= c!80885 (or (= lt!325465 lt!325395) (= (bvadd lt!325465 lt!325465) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734379 () Bool)

(declare-fun lt!325466 () SeekEntryResult!7297)

(assert (=> b!734379 (and (bvsge (index!31558 lt!325466) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325466) (size!20161 lt!325391)))))

(declare-fun res!493375 () Bool)

(assert (=> b!734379 (= res!493375 (= (select (arr!19741 lt!325391) (index!31558 lt!325466)) lt!325395))))

(declare-fun e!410956 () Bool)

(assert (=> b!734379 (=> res!493375 e!410956)))

(declare-fun e!410953 () Bool)

(assert (=> b!734379 (= e!410953 e!410956)))

(declare-fun b!734380 () Bool)

(assert (=> b!734380 (and (bvsge (index!31558 lt!325466) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325466) (size!20161 lt!325391)))))

(declare-fun res!493373 () Bool)

(assert (=> b!734380 (= res!493373 (= (select (arr!19741 lt!325391) (index!31558 lt!325466)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734380 (=> res!493373 e!410956)))

(declare-fun b!734381 () Bool)

(declare-fun e!410957 () Bool)

(assert (=> b!734381 (= e!410957 (bvsge (x!62707 lt!325466) #b01111111111111111111111111111110))))

(declare-fun b!734382 () Bool)

(assert (=> b!734382 (= e!410954 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!325395 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!325395 lt!325391 mask!3328))))

(declare-fun d!100177 () Bool)

(assert (=> d!100177 e!410957))

(declare-fun c!80883 () Bool)

(assert (=> d!100177 (= c!80883 (and ((_ is Intermediate!7297) lt!325466) (undefined!8109 lt!325466)))))

(assert (=> d!100177 (= lt!325466 e!410955)))

(declare-fun c!80884 () Bool)

(assert (=> d!100177 (= c!80884 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100177 (= lt!325465 (select (arr!19741 lt!325391) (toIndex!0 lt!325395 mask!3328)))))

(assert (=> d!100177 (validMask!0 mask!3328)))

(assert (=> d!100177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325395 mask!3328) lt!325395 lt!325391 mask!3328) lt!325466)))

(declare-fun b!734383 () Bool)

(assert (=> b!734383 (= e!410954 (Intermediate!7297 false (toIndex!0 lt!325395 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734384 () Bool)

(assert (=> b!734384 (= e!410957 e!410953)))

(declare-fun res!493374 () Bool)

(assert (=> b!734384 (= res!493374 (and ((_ is Intermediate!7297) lt!325466) (not (undefined!8109 lt!325466)) (bvslt (x!62707 lt!325466) #b01111111111111111111111111111110) (bvsge (x!62707 lt!325466) #b00000000000000000000000000000000) (bvsge (x!62707 lt!325466) #b00000000000000000000000000000000)))))

(assert (=> b!734384 (=> (not res!493374) (not e!410953))))

(declare-fun b!734385 () Bool)

(assert (=> b!734385 (= e!410955 (Intermediate!7297 true (toIndex!0 lt!325395 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734386 () Bool)

(assert (=> b!734386 (and (bvsge (index!31558 lt!325466) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325466) (size!20161 lt!325391)))))

(assert (=> b!734386 (= e!410956 (= (select (arr!19741 lt!325391) (index!31558 lt!325466)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100177 c!80884) b!734385))

(assert (= (and d!100177 (not c!80884)) b!734378))

(assert (= (and b!734378 c!80885) b!734383))

(assert (= (and b!734378 (not c!80885)) b!734382))

(assert (= (and d!100177 c!80883) b!734381))

(assert (= (and d!100177 (not c!80883)) b!734384))

(assert (= (and b!734384 res!493374) b!734379))

(assert (= (and b!734379 (not res!493375)) b!734380))

(assert (= (and b!734380 (not res!493373)) b!734386))

(declare-fun m!687643 () Bool)

(assert (=> b!734380 m!687643))

(assert (=> d!100177 m!687517))

(declare-fun m!687645 () Bool)

(assert (=> d!100177 m!687645))

(assert (=> d!100177 m!687493))

(assert (=> b!734386 m!687643))

(assert (=> b!734382 m!687517))

(declare-fun m!687647 () Bool)

(assert (=> b!734382 m!687647))

(assert (=> b!734382 m!687647))

(declare-fun m!687649 () Bool)

(assert (=> b!734382 m!687649))

(assert (=> b!734379 m!687643))

(assert (=> b!734200 d!100177))

(declare-fun d!100179 () Bool)

(declare-fun lt!325472 () (_ BitVec 32))

(declare-fun lt!325471 () (_ BitVec 32))

(assert (=> d!100179 (= lt!325472 (bvmul (bvxor lt!325471 (bvlshr lt!325471 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100179 (= lt!325471 ((_ extract 31 0) (bvand (bvxor lt!325395 (bvlshr lt!325395 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100179 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493376 (let ((h!14721 ((_ extract 31 0) (bvand (bvxor lt!325395 (bvlshr lt!325395 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62712 (bvmul (bvxor h!14721 (bvlshr h!14721 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62712 (bvlshr x!62712 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493376 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493376 #b00000000000000000000000000000000))))))

(assert (=> d!100179 (= (toIndex!0 lt!325395 mask!3328) (bvand (bvxor lt!325472 (bvlshr lt!325472 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!734200 d!100179))

(declare-fun d!100181 () Bool)

(declare-fun res!493382 () Bool)

(declare-fun e!410965 () Bool)

(assert (=> d!100181 (=> res!493382 e!410965)))

(assert (=> d!100181 (= res!493382 (bvsge #b00000000000000000000000000000000 (size!20161 a!3186)))))

(assert (=> d!100181 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!410965)))

(declare-fun b!734395 () Bool)

(declare-fun e!410966 () Bool)

(assert (=> b!734395 (= e!410965 e!410966)))

(declare-fun c!80888 () Bool)

(assert (=> b!734395 (= c!80888 (validKeyInArray!0 (select (arr!19741 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734396 () Bool)

(declare-fun e!410964 () Bool)

(declare-fun call!34902 () Bool)

(assert (=> b!734396 (= e!410964 call!34902)))

(declare-fun bm!34899 () Bool)

(assert (=> bm!34899 (= call!34902 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!734397 () Bool)

(assert (=> b!734397 (= e!410966 e!410964)))

(declare-fun lt!325479 () (_ BitVec 64))

(assert (=> b!734397 (= lt!325479 (select (arr!19741 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!325481 () Unit!24991)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41257 (_ BitVec 64) (_ BitVec 32)) Unit!24991)

(assert (=> b!734397 (= lt!325481 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325479 #b00000000000000000000000000000000))))

(assert (=> b!734397 (arrayContainsKey!0 a!3186 lt!325479 #b00000000000000000000000000000000)))

(declare-fun lt!325480 () Unit!24991)

(assert (=> b!734397 (= lt!325480 lt!325481)))

(declare-fun res!493381 () Bool)

(assert (=> b!734397 (= res!493381 (= (seekEntryOrOpen!0 (select (arr!19741 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7297 #b00000000000000000000000000000000)))))

(assert (=> b!734397 (=> (not res!493381) (not e!410964))))

(declare-fun b!734398 () Bool)

(assert (=> b!734398 (= e!410966 call!34902)))

(assert (= (and d!100181 (not res!493382)) b!734395))

(assert (= (and b!734395 c!80888) b!734397))

(assert (= (and b!734395 (not c!80888)) b!734398))

(assert (= (and b!734397 res!493381) b!734396))

(assert (= (or b!734396 b!734398) bm!34899))

(declare-fun m!687651 () Bool)

(assert (=> b!734395 m!687651))

(assert (=> b!734395 m!687651))

(declare-fun m!687653 () Bool)

(assert (=> b!734395 m!687653))

(declare-fun m!687655 () Bool)

(assert (=> bm!34899 m!687655))

(assert (=> b!734397 m!687651))

(declare-fun m!687657 () Bool)

(assert (=> b!734397 m!687657))

(declare-fun m!687659 () Bool)

(assert (=> b!734397 m!687659))

(assert (=> b!734397 m!687651))

(declare-fun m!687661 () Bool)

(assert (=> b!734397 m!687661))

(assert (=> b!734210 d!100181))

(declare-fun b!734429 () Bool)

(declare-fun c!80905 () Bool)

(declare-fun lt!325499 () (_ BitVec 64))

(assert (=> b!734429 (= c!80905 (= lt!325499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410984 () SeekEntryResult!7297)

(declare-fun e!410983 () SeekEntryResult!7297)

(assert (=> b!734429 (= e!410984 e!410983)))

(declare-fun b!734430 () Bool)

(declare-fun lt!325498 () SeekEntryResult!7297)

(assert (=> b!734430 (= e!410984 (Found!7297 (index!31558 lt!325498)))))

(declare-fun b!734431 () Bool)

(assert (=> b!734431 (= e!410983 (MissingZero!7297 (index!31558 lt!325498)))))

(declare-fun b!734432 () Bool)

(declare-fun e!410982 () SeekEntryResult!7297)

(assert (=> b!734432 (= e!410982 e!410984)))

(assert (=> b!734432 (= lt!325499 (select (arr!19741 a!3186) (index!31558 lt!325498)))))

(declare-fun c!80904 () Bool)

(assert (=> b!734432 (= c!80904 (= lt!325499 (select (arr!19741 a!3186) j!159)))))

(declare-fun b!734434 () Bool)

(assert (=> b!734434 (= e!410983 (seekKeyOrZeroReturnVacant!0 (x!62707 lt!325498) (index!31558 lt!325498) (index!31558 lt!325498) (select (arr!19741 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100185 () Bool)

(declare-fun lt!325497 () SeekEntryResult!7297)

(assert (=> d!100185 (and (or ((_ is Undefined!7297) lt!325497) (not ((_ is Found!7297) lt!325497)) (and (bvsge (index!31557 lt!325497) #b00000000000000000000000000000000) (bvslt (index!31557 lt!325497) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325497) ((_ is Found!7297) lt!325497) (not ((_ is MissingZero!7297) lt!325497)) (and (bvsge (index!31556 lt!325497) #b00000000000000000000000000000000) (bvslt (index!31556 lt!325497) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325497) ((_ is Found!7297) lt!325497) ((_ is MissingZero!7297) lt!325497) (not ((_ is MissingVacant!7297) lt!325497)) (and (bvsge (index!31559 lt!325497) #b00000000000000000000000000000000) (bvslt (index!31559 lt!325497) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325497) (ite ((_ is Found!7297) lt!325497) (= (select (arr!19741 a!3186) (index!31557 lt!325497)) (select (arr!19741 a!3186) j!159)) (ite ((_ is MissingZero!7297) lt!325497) (= (select (arr!19741 a!3186) (index!31556 lt!325497)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7297) lt!325497) (= (select (arr!19741 a!3186) (index!31559 lt!325497)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100185 (= lt!325497 e!410982)))

(declare-fun c!80906 () Bool)

(assert (=> d!100185 (= c!80906 (and ((_ is Intermediate!7297) lt!325498) (undefined!8109 lt!325498)))))

(assert (=> d!100185 (= lt!325498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328) (select (arr!19741 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100185 (validMask!0 mask!3328)))

(assert (=> d!100185 (= (seekEntryOrOpen!0 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325497)))

(declare-fun b!734433 () Bool)

(assert (=> b!734433 (= e!410982 Undefined!7297)))

(assert (= (and d!100185 c!80906) b!734433))

(assert (= (and d!100185 (not c!80906)) b!734432))

(assert (= (and b!734432 c!80904) b!734430))

(assert (= (and b!734432 (not c!80904)) b!734429))

(assert (= (and b!734429 c!80905) b!734431))

(assert (= (and b!734429 (not c!80905)) b!734434))

(declare-fun m!687677 () Bool)

(assert (=> b!734432 m!687677))

(assert (=> b!734434 m!687487))

(declare-fun m!687679 () Bool)

(assert (=> b!734434 m!687679))

(declare-fun m!687681 () Bool)

(assert (=> d!100185 m!687681))

(assert (=> d!100185 m!687487))

(assert (=> d!100185 m!687489))

(declare-fun m!687683 () Bool)

(assert (=> d!100185 m!687683))

(assert (=> d!100185 m!687489))

(assert (=> d!100185 m!687487))

(assert (=> d!100185 m!687491))

(declare-fun m!687685 () Bool)

(assert (=> d!100185 m!687685))

(assert (=> d!100185 m!687493))

(assert (=> b!734199 d!100185))

(declare-fun b!734435 () Bool)

(declare-fun c!80908 () Bool)

(declare-fun lt!325502 () (_ BitVec 64))

(assert (=> b!734435 (= c!80908 (= lt!325502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410987 () SeekEntryResult!7297)

(declare-fun e!410986 () SeekEntryResult!7297)

(assert (=> b!734435 (= e!410987 e!410986)))

(declare-fun b!734436 () Bool)

(declare-fun lt!325501 () SeekEntryResult!7297)

(assert (=> b!734436 (= e!410987 (Found!7297 (index!31558 lt!325501)))))

(declare-fun b!734437 () Bool)

(assert (=> b!734437 (= e!410986 (MissingZero!7297 (index!31558 lt!325501)))))

(declare-fun b!734438 () Bool)

(declare-fun e!410985 () SeekEntryResult!7297)

(assert (=> b!734438 (= e!410985 e!410987)))

(assert (=> b!734438 (= lt!325502 (select (arr!19741 a!3186) (index!31558 lt!325501)))))

(declare-fun c!80907 () Bool)

(assert (=> b!734438 (= c!80907 (= lt!325502 k0!2102))))

(declare-fun b!734440 () Bool)

(assert (=> b!734440 (= e!410986 (seekKeyOrZeroReturnVacant!0 (x!62707 lt!325501) (index!31558 lt!325501) (index!31558 lt!325501) k0!2102 a!3186 mask!3328))))

(declare-fun d!100189 () Bool)

(declare-fun lt!325500 () SeekEntryResult!7297)

(assert (=> d!100189 (and (or ((_ is Undefined!7297) lt!325500) (not ((_ is Found!7297) lt!325500)) (and (bvsge (index!31557 lt!325500) #b00000000000000000000000000000000) (bvslt (index!31557 lt!325500) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325500) ((_ is Found!7297) lt!325500) (not ((_ is MissingZero!7297) lt!325500)) (and (bvsge (index!31556 lt!325500) #b00000000000000000000000000000000) (bvslt (index!31556 lt!325500) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325500) ((_ is Found!7297) lt!325500) ((_ is MissingZero!7297) lt!325500) (not ((_ is MissingVacant!7297) lt!325500)) (and (bvsge (index!31559 lt!325500) #b00000000000000000000000000000000) (bvslt (index!31559 lt!325500) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325500) (ite ((_ is Found!7297) lt!325500) (= (select (arr!19741 a!3186) (index!31557 lt!325500)) k0!2102) (ite ((_ is MissingZero!7297) lt!325500) (= (select (arr!19741 a!3186) (index!31556 lt!325500)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7297) lt!325500) (= (select (arr!19741 a!3186) (index!31559 lt!325500)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100189 (= lt!325500 e!410985)))

(declare-fun c!80909 () Bool)

(assert (=> d!100189 (= c!80909 (and ((_ is Intermediate!7297) lt!325501) (undefined!8109 lt!325501)))))

(assert (=> d!100189 (= lt!325501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100189 (validMask!0 mask!3328)))

(assert (=> d!100189 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!325500)))

(declare-fun b!734439 () Bool)

(assert (=> b!734439 (= e!410985 Undefined!7297)))

(assert (= (and d!100189 c!80909) b!734439))

(assert (= (and d!100189 (not c!80909)) b!734438))

(assert (= (and b!734438 c!80907) b!734436))

(assert (= (and b!734438 (not c!80907)) b!734435))

(assert (= (and b!734435 c!80908) b!734437))

(assert (= (and b!734435 (not c!80908)) b!734440))

(declare-fun m!687687 () Bool)

(assert (=> b!734438 m!687687))

(declare-fun m!687689 () Bool)

(assert (=> b!734440 m!687689))

(declare-fun m!687691 () Bool)

(assert (=> d!100189 m!687691))

(declare-fun m!687693 () Bool)

(assert (=> d!100189 m!687693))

(declare-fun m!687695 () Bool)

(assert (=> d!100189 m!687695))

(assert (=> d!100189 m!687693))

(declare-fun m!687697 () Bool)

(assert (=> d!100189 m!687697))

(declare-fun m!687699 () Bool)

(assert (=> d!100189 m!687699))

(assert (=> d!100189 m!687493))

(assert (=> b!734198 d!100189))

(declare-fun b!734441 () Bool)

(declare-fun e!410990 () SeekEntryResult!7297)

(declare-fun e!410989 () SeekEntryResult!7297)

(assert (=> b!734441 (= e!410990 e!410989)))

(declare-fun c!80912 () Bool)

(declare-fun lt!325503 () (_ BitVec 64))

(assert (=> b!734441 (= c!80912 (or (= lt!325503 (select (arr!19741 a!3186) j!159)) (= (bvadd lt!325503 lt!325503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734442 () Bool)

(declare-fun lt!325504 () SeekEntryResult!7297)

(assert (=> b!734442 (and (bvsge (index!31558 lt!325504) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325504) (size!20161 a!3186)))))

(declare-fun res!493385 () Bool)

(assert (=> b!734442 (= res!493385 (= (select (arr!19741 a!3186) (index!31558 lt!325504)) (select (arr!19741 a!3186) j!159)))))

(declare-fun e!410991 () Bool)

(assert (=> b!734442 (=> res!493385 e!410991)))

(declare-fun e!410988 () Bool)

(assert (=> b!734442 (= e!410988 e!410991)))

(declare-fun b!734443 () Bool)

(assert (=> b!734443 (and (bvsge (index!31558 lt!325504) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325504) (size!20161 a!3186)))))

(declare-fun res!493383 () Bool)

(assert (=> b!734443 (= res!493383 (= (select (arr!19741 a!3186) (index!31558 lt!325504)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734443 (=> res!493383 e!410991)))

(declare-fun b!734444 () Bool)

(declare-fun e!410992 () Bool)

(assert (=> b!734444 (= e!410992 (bvsge (x!62707 lt!325504) #b01111111111111111111111111111110))))

(declare-fun b!734445 () Bool)

(assert (=> b!734445 (= e!410989 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!19741 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100191 () Bool)

(assert (=> d!100191 e!410992))

(declare-fun c!80910 () Bool)

(assert (=> d!100191 (= c!80910 (and ((_ is Intermediate!7297) lt!325504) (undefined!8109 lt!325504)))))

(assert (=> d!100191 (= lt!325504 e!410990)))

(declare-fun c!80911 () Bool)

(assert (=> d!100191 (= c!80911 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100191 (= lt!325503 (select (arr!19741 a!3186) index!1321))))

(assert (=> d!100191 (validMask!0 mask!3328)))

(assert (=> d!100191 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325504)))

(declare-fun b!734446 () Bool)

(assert (=> b!734446 (= e!410989 (Intermediate!7297 false index!1321 x!1131))))

(declare-fun b!734447 () Bool)

(assert (=> b!734447 (= e!410992 e!410988)))

(declare-fun res!493384 () Bool)

(assert (=> b!734447 (= res!493384 (and ((_ is Intermediate!7297) lt!325504) (not (undefined!8109 lt!325504)) (bvslt (x!62707 lt!325504) #b01111111111111111111111111111110) (bvsge (x!62707 lt!325504) #b00000000000000000000000000000000) (bvsge (x!62707 lt!325504) x!1131)))))

(assert (=> b!734447 (=> (not res!493384) (not e!410988))))

(declare-fun b!734448 () Bool)

(assert (=> b!734448 (= e!410990 (Intermediate!7297 true index!1321 x!1131))))

(declare-fun b!734449 () Bool)

(assert (=> b!734449 (and (bvsge (index!31558 lt!325504) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325504) (size!20161 a!3186)))))

(assert (=> b!734449 (= e!410991 (= (select (arr!19741 a!3186) (index!31558 lt!325504)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100191 c!80911) b!734448))

(assert (= (and d!100191 (not c!80911)) b!734441))

(assert (= (and b!734441 c!80912) b!734446))

(assert (= (and b!734441 (not c!80912)) b!734445))

(assert (= (and d!100191 c!80910) b!734444))

(assert (= (and d!100191 (not c!80910)) b!734447))

(assert (= (and b!734447 res!493384) b!734442))

(assert (= (and b!734442 (not res!493385)) b!734443))

(assert (= (and b!734443 (not res!493383)) b!734449))

(declare-fun m!687701 () Bool)

(assert (=> b!734443 m!687701))

(assert (=> d!100191 m!687635))

(assert (=> d!100191 m!687493))

(assert (=> b!734449 m!687701))

(assert (=> b!734445 m!687627))

(assert (=> b!734445 m!687627))

(assert (=> b!734445 m!687487))

(declare-fun m!687703 () Bool)

(assert (=> b!734445 m!687703))

(assert (=> b!734442 m!687701))

(assert (=> b!734197 d!100191))

(declare-fun d!100193 () Bool)

(assert (=> d!100193 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65076 d!100193))

(declare-fun d!100199 () Bool)

(assert (=> d!100199 (= (array_inv!15600 a!3186) (bvsge (size!20161 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65076 d!100199))

(declare-fun d!100201 () Bool)

(declare-fun res!493390 () Bool)

(declare-fun e!410997 () Bool)

(assert (=> d!100201 (=> res!493390 e!410997)))

(assert (=> d!100201 (= res!493390 (= (select (arr!19741 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100201 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!410997)))

(declare-fun b!734454 () Bool)

(declare-fun e!410998 () Bool)

(assert (=> b!734454 (= e!410997 e!410998)))

(declare-fun res!493391 () Bool)

(assert (=> b!734454 (=> (not res!493391) (not e!410998))))

(assert (=> b!734454 (= res!493391 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20161 a!3186)))))

(declare-fun b!734455 () Bool)

(assert (=> b!734455 (= e!410998 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100201 (not res!493390)) b!734454))

(assert (= (and b!734454 res!493391) b!734455))

(assert (=> d!100201 m!687651))

(declare-fun m!687705 () Bool)

(assert (=> b!734455 m!687705))

(assert (=> b!734196 d!100201))

(declare-fun b!734456 () Bool)

(declare-fun e!411001 () SeekEntryResult!7297)

(declare-fun e!410999 () SeekEntryResult!7297)

(assert (=> b!734456 (= e!411001 e!410999)))

(declare-fun c!80913 () Bool)

(declare-fun lt!325506 () (_ BitVec 64))

(assert (=> b!734456 (= c!80913 (= lt!325506 (select (arr!19741 a!3186) j!159)))))

(declare-fun b!734457 () Bool)

(assert (=> b!734457 (= e!410999 (Found!7297 resIntermediateIndex!5))))

(declare-fun e!411000 () SeekEntryResult!7297)

(declare-fun b!734458 () Bool)

(assert (=> b!734458 (= e!411000 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734459 () Bool)

(assert (=> b!734459 (= e!411000 (MissingVacant!7297 resIntermediateIndex!5))))

(declare-fun lt!325505 () SeekEntryResult!7297)

(declare-fun d!100203 () Bool)

(assert (=> d!100203 (and (or ((_ is Undefined!7297) lt!325505) (not ((_ is Found!7297) lt!325505)) (and (bvsge (index!31557 lt!325505) #b00000000000000000000000000000000) (bvslt (index!31557 lt!325505) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325505) ((_ is Found!7297) lt!325505) (not ((_ is MissingVacant!7297) lt!325505)) (not (= (index!31559 lt!325505) resIntermediateIndex!5)) (and (bvsge (index!31559 lt!325505) #b00000000000000000000000000000000) (bvslt (index!31559 lt!325505) (size!20161 a!3186)))) (or ((_ is Undefined!7297) lt!325505) (ite ((_ is Found!7297) lt!325505) (= (select (arr!19741 a!3186) (index!31557 lt!325505)) (select (arr!19741 a!3186) j!159)) (and ((_ is MissingVacant!7297) lt!325505) (= (index!31559 lt!325505) resIntermediateIndex!5) (= (select (arr!19741 a!3186) (index!31559 lt!325505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100203 (= lt!325505 e!411001)))

(declare-fun c!80915 () Bool)

(assert (=> d!100203 (= c!80915 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100203 (= lt!325506 (select (arr!19741 a!3186) resIntermediateIndex!5))))

(assert (=> d!100203 (validMask!0 mask!3328)))

(assert (=> d!100203 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325505)))

(declare-fun b!734460 () Bool)

(declare-fun c!80914 () Bool)

(assert (=> b!734460 (= c!80914 (= lt!325506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734460 (= e!410999 e!411000)))

(declare-fun b!734461 () Bool)

(assert (=> b!734461 (= e!411001 Undefined!7297)))

(assert (= (and d!100203 c!80915) b!734461))

(assert (= (and d!100203 (not c!80915)) b!734456))

(assert (= (and b!734456 c!80913) b!734457))

(assert (= (and b!734456 (not c!80913)) b!734460))

(assert (= (and b!734460 c!80914) b!734459))

(assert (= (and b!734460 (not c!80914)) b!734458))

(declare-fun m!687707 () Bool)

(assert (=> b!734458 m!687707))

(assert (=> b!734458 m!687707))

(assert (=> b!734458 m!687487))

(declare-fun m!687709 () Bool)

(assert (=> b!734458 m!687709))

(declare-fun m!687711 () Bool)

(assert (=> d!100203 m!687711))

(declare-fun m!687713 () Bool)

(assert (=> d!100203 m!687713))

(assert (=> d!100203 m!687525))

(assert (=> d!100203 m!687493))

(assert (=> b!734207 d!100203))

(declare-fun d!100205 () Bool)

(declare-fun lt!325509 () (_ BitVec 32))

(assert (=> d!100205 (and (bvsge lt!325509 #b00000000000000000000000000000000) (bvslt lt!325509 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!100205 (= lt!325509 (choose!52 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!100205 (validMask!0 mask!3328)))

(assert (=> d!100205 (= (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!325509)))

(declare-fun bs!20993 () Bool)

(assert (= bs!20993 d!100205))

(declare-fun m!687715 () Bool)

(assert (=> bs!20993 m!687715))

(assert (=> bs!20993 m!687493))

(assert (=> b!734206 d!100205))

(declare-fun b!734462 () Bool)

(declare-fun e!411004 () SeekEntryResult!7297)

(declare-fun e!411003 () SeekEntryResult!7297)

(assert (=> b!734462 (= e!411004 e!411003)))

(declare-fun c!80918 () Bool)

(declare-fun lt!325510 () (_ BitVec 64))

(assert (=> b!734462 (= c!80918 (or (= lt!325510 (select (arr!19741 a!3186) j!159)) (= (bvadd lt!325510 lt!325510) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734463 () Bool)

(declare-fun lt!325511 () SeekEntryResult!7297)

(assert (=> b!734463 (and (bvsge (index!31558 lt!325511) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325511) (size!20161 a!3186)))))

(declare-fun res!493394 () Bool)

(assert (=> b!734463 (= res!493394 (= (select (arr!19741 a!3186) (index!31558 lt!325511)) (select (arr!19741 a!3186) j!159)))))

(declare-fun e!411005 () Bool)

(assert (=> b!734463 (=> res!493394 e!411005)))

(declare-fun e!411002 () Bool)

(assert (=> b!734463 (= e!411002 e!411005)))

(declare-fun b!734464 () Bool)

(assert (=> b!734464 (and (bvsge (index!31558 lt!325511) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325511) (size!20161 a!3186)))))

(declare-fun res!493392 () Bool)

(assert (=> b!734464 (= res!493392 (= (select (arr!19741 a!3186) (index!31558 lt!325511)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734464 (=> res!493392 e!411005)))

(declare-fun b!734465 () Bool)

(declare-fun e!411006 () Bool)

(assert (=> b!734465 (= e!411006 (bvsge (x!62707 lt!325511) #b01111111111111111111111111111110))))

(declare-fun b!734466 () Bool)

(assert (=> b!734466 (= e!411003 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!19741 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100207 () Bool)

(assert (=> d!100207 e!411006))

(declare-fun c!80916 () Bool)

(assert (=> d!100207 (= c!80916 (and ((_ is Intermediate!7297) lt!325511) (undefined!8109 lt!325511)))))

(assert (=> d!100207 (= lt!325511 e!411004)))

(declare-fun c!80917 () Bool)

(assert (=> d!100207 (= c!80917 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100207 (= lt!325510 (select (arr!19741 a!3186) (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328)))))

(assert (=> d!100207 (validMask!0 mask!3328)))

(assert (=> d!100207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328) (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!325511)))

(declare-fun b!734467 () Bool)

(assert (=> b!734467 (= e!411003 (Intermediate!7297 false (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734468 () Bool)

(assert (=> b!734468 (= e!411006 e!411002)))

(declare-fun res!493393 () Bool)

(assert (=> b!734468 (= res!493393 (and ((_ is Intermediate!7297) lt!325511) (not (undefined!8109 lt!325511)) (bvslt (x!62707 lt!325511) #b01111111111111111111111111111110) (bvsge (x!62707 lt!325511) #b00000000000000000000000000000000) (bvsge (x!62707 lt!325511) #b00000000000000000000000000000000)))))

(assert (=> b!734468 (=> (not res!493393) (not e!411002))))

(declare-fun b!734469 () Bool)

(assert (=> b!734469 (= e!411004 (Intermediate!7297 true (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734470 () Bool)

(assert (=> b!734470 (and (bvsge (index!31558 lt!325511) #b00000000000000000000000000000000) (bvslt (index!31558 lt!325511) (size!20161 a!3186)))))

(assert (=> b!734470 (= e!411005 (= (select (arr!19741 a!3186) (index!31558 lt!325511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100207 c!80917) b!734469))

(assert (= (and d!100207 (not c!80917)) b!734462))

(assert (= (and b!734462 c!80918) b!734467))

(assert (= (and b!734462 (not c!80918)) b!734466))

(assert (= (and d!100207 c!80916) b!734465))

(assert (= (and d!100207 (not c!80916)) b!734468))

(assert (= (and b!734468 res!493393) b!734463))

(assert (= (and b!734463 (not res!493394)) b!734464))

(assert (= (and b!734464 (not res!493392)) b!734470))

(declare-fun m!687717 () Bool)

(assert (=> b!734464 m!687717))

(assert (=> d!100207 m!687489))

(declare-fun m!687719 () Bool)

(assert (=> d!100207 m!687719))

(assert (=> d!100207 m!687493))

(assert (=> b!734470 m!687717))

(assert (=> b!734466 m!687489))

(declare-fun m!687721 () Bool)

(assert (=> b!734466 m!687721))

(assert (=> b!734466 m!687721))

(assert (=> b!734466 m!687487))

(declare-fun m!687723 () Bool)

(assert (=> b!734466 m!687723))

(assert (=> b!734463 m!687717))

(assert (=> b!734195 d!100207))

(declare-fun d!100209 () Bool)

(declare-fun lt!325517 () (_ BitVec 32))

(declare-fun lt!325516 () (_ BitVec 32))

(assert (=> d!100209 (= lt!325517 (bvmul (bvxor lt!325516 (bvlshr lt!325516 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100209 (= lt!325516 ((_ extract 31 0) (bvand (bvxor (select (arr!19741 a!3186) j!159) (bvlshr (select (arr!19741 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100209 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493376 (let ((h!14721 ((_ extract 31 0) (bvand (bvxor (select (arr!19741 a!3186) j!159) (bvlshr (select (arr!19741 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62712 (bvmul (bvxor h!14721 (bvlshr h!14721 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62712 (bvlshr x!62712 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493376 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493376 #b00000000000000000000000000000000))))))

(assert (=> d!100209 (= (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328) (bvand (bvxor lt!325517 (bvlshr lt!325517 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!734195 d!100209))

(declare-fun d!100211 () Bool)

(declare-fun res!493396 () Bool)

(declare-fun e!411014 () Bool)

(assert (=> d!100211 (=> res!493396 e!411014)))

(assert (=> d!100211 (= res!493396 (bvsge j!159 (size!20161 a!3186)))))

(assert (=> d!100211 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!411014)))

(declare-fun b!734483 () Bool)

(declare-fun e!411015 () Bool)

(assert (=> b!734483 (= e!411014 e!411015)))

(declare-fun c!80925 () Bool)

(assert (=> b!734483 (= c!80925 (validKeyInArray!0 (select (arr!19741 a!3186) j!159)))))

(declare-fun b!734484 () Bool)

(declare-fun e!411013 () Bool)

(declare-fun call!34903 () Bool)

(assert (=> b!734484 (= e!411013 call!34903)))

(declare-fun bm!34900 () Bool)

(assert (=> bm!34900 (= call!34903 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!734485 () Bool)

(assert (=> b!734485 (= e!411015 e!411013)))

(declare-fun lt!325518 () (_ BitVec 64))

(assert (=> b!734485 (= lt!325518 (select (arr!19741 a!3186) j!159))))

(declare-fun lt!325520 () Unit!24991)

(assert (=> b!734485 (= lt!325520 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325518 j!159))))

(assert (=> b!734485 (arrayContainsKey!0 a!3186 lt!325518 #b00000000000000000000000000000000)))

(declare-fun lt!325519 () Unit!24991)

(assert (=> b!734485 (= lt!325519 lt!325520)))

(declare-fun res!493395 () Bool)

(assert (=> b!734485 (= res!493395 (= (seekEntryOrOpen!0 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) (Found!7297 j!159)))))

(assert (=> b!734485 (=> (not res!493395) (not e!411013))))

(declare-fun b!734486 () Bool)

(assert (=> b!734486 (= e!411015 call!34903)))

(assert (= (and d!100211 (not res!493396)) b!734483))

(assert (= (and b!734483 c!80925) b!734485))

(assert (= (and b!734483 (not c!80925)) b!734486))

(assert (= (and b!734485 res!493395) b!734484))

(assert (= (or b!734484 b!734486) bm!34900))

(assert (=> b!734483 m!687487))

(assert (=> b!734483 m!687487))

(assert (=> b!734483 m!687511))

(declare-fun m!687725 () Bool)

(assert (=> bm!34900 m!687725))

(assert (=> b!734485 m!687487))

(declare-fun m!687727 () Bool)

(assert (=> b!734485 m!687727))

(declare-fun m!687729 () Bool)

(assert (=> b!734485 m!687729))

(assert (=> b!734485 m!687487))

(assert (=> b!734485 m!687497))

(assert (=> b!734194 d!100211))

(declare-fun d!100213 () Bool)

(assert (=> d!100213 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!325525 () Unit!24991)

(declare-fun choose!38 (array!41257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24991)

(assert (=> d!100213 (= lt!325525 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100213 (validMask!0 mask!3328)))

(assert (=> d!100213 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!325525)))

(declare-fun bs!20994 () Bool)

(assert (= bs!20994 d!100213))

(assert (=> bs!20994 m!687505))

(declare-fun m!687739 () Bool)

(assert (=> bs!20994 m!687739))

(assert (=> bs!20994 m!687493))

(assert (=> b!734194 d!100213))

(declare-fun d!100217 () Bool)

(declare-fun res!493405 () Bool)

(declare-fun e!411029 () Bool)

(assert (=> d!100217 (=> res!493405 e!411029)))

(assert (=> d!100217 (= res!493405 (bvsge #b00000000000000000000000000000000 (size!20161 a!3186)))))

(assert (=> d!100217 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13647) e!411029)))

(declare-fun b!734503 () Bool)

(declare-fun e!411030 () Bool)

(assert (=> b!734503 (= e!411029 e!411030)))

(declare-fun res!493404 () Bool)

(assert (=> b!734503 (=> (not res!493404) (not e!411030))))

(declare-fun e!411028 () Bool)

(assert (=> b!734503 (= res!493404 (not e!411028))))

(declare-fun res!493403 () Bool)

(assert (=> b!734503 (=> (not res!493403) (not e!411028))))

(assert (=> b!734503 (= res!493403 (validKeyInArray!0 (select (arr!19741 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734504 () Bool)

(declare-fun contains!4037 (List!13650 (_ BitVec 64)) Bool)

(assert (=> b!734504 (= e!411028 (contains!4037 Nil!13647 (select (arr!19741 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34903 () Bool)

(declare-fun call!34906 () Bool)

(declare-fun c!80931 () Bool)

(assert (=> bm!34903 (= call!34906 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80931 (Cons!13646 (select (arr!19741 a!3186) #b00000000000000000000000000000000) Nil!13647) Nil!13647)))))

(declare-fun b!734505 () Bool)

(declare-fun e!411027 () Bool)

(assert (=> b!734505 (= e!411027 call!34906)))

(declare-fun b!734506 () Bool)

(assert (=> b!734506 (= e!411027 call!34906)))

(declare-fun b!734507 () Bool)

(assert (=> b!734507 (= e!411030 e!411027)))

(assert (=> b!734507 (= c!80931 (validKeyInArray!0 (select (arr!19741 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100217 (not res!493405)) b!734503))

(assert (= (and b!734503 res!493403) b!734504))

(assert (= (and b!734503 res!493404) b!734507))

(assert (= (and b!734507 c!80931) b!734505))

(assert (= (and b!734507 (not c!80931)) b!734506))

(assert (= (or b!734505 b!734506) bm!34903))

(assert (=> b!734503 m!687651))

(assert (=> b!734503 m!687651))

(assert (=> b!734503 m!687653))

(assert (=> b!734504 m!687651))

(assert (=> b!734504 m!687651))

(declare-fun m!687741 () Bool)

(assert (=> b!734504 m!687741))

(assert (=> bm!34903 m!687651))

(declare-fun m!687743 () Bool)

(assert (=> bm!34903 m!687743))

(assert (=> b!734507 m!687651))

(assert (=> b!734507 m!687651))

(assert (=> b!734507 m!687653))

(assert (=> b!734204 d!100217))

(declare-fun d!100221 () Bool)

(assert (=> d!100221 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!734193 d!100221))

(assert (=> b!734203 d!100173))

(declare-fun d!100223 () Bool)

(assert (=> d!100223 (= (validKeyInArray!0 (select (arr!19741 a!3186) j!159)) (and (not (= (select (arr!19741 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19741 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!734202 d!100223))

(check-sat (not d!100175) (not d!100205) (not b!734397) (not b!734445) (not d!100203) (not b!734434) (not d!100185) (not b!734485) (not b!734507) (not bm!34903) (not b!734395) (not d!100207) (not d!100191) (not b!734466) (not d!100213) (not b!734440) (not b!734483) (not d!100177) (not d!100189) (not b!734503) (not d!100173) (not b!734504) (not b!734347) (not bm!34900) (not b!734373) (not bm!34899) (not b!734382) (not b!734458) (not b!734455))
(check-sat)
