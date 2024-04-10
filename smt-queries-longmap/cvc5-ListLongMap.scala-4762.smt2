; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65632 () Bool)

(assert start!65632)

(declare-fun b!751233 () Bool)

(declare-fun e!419090 () Bool)

(declare-fun e!419086 () Bool)

(assert (=> b!751233 (= e!419090 e!419086)))

(declare-fun res!507153 () Bool)

(assert (=> b!751233 (=> (not res!507153) (not e!419086))))

(declare-datatypes ((SeekEntryResult!7616 0))(
  ( (MissingZero!7616 (index!32832 (_ BitVec 32))) (Found!7616 (index!32833 (_ BitVec 32))) (Intermediate!7616 (undefined!8428 Bool) (index!32834 (_ BitVec 32)) (x!63758 (_ BitVec 32))) (Undefined!7616) (MissingVacant!7616 (index!32835 (_ BitVec 32))) )
))
(declare-fun lt!334078 () SeekEntryResult!7616)

(declare-fun lt!334082 () SeekEntryResult!7616)

(assert (=> b!751233 (= res!507153 (= lt!334078 lt!334082))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41805 0))(
  ( (array!41806 (arr!20016 (Array (_ BitVec 32) (_ BitVec 64))) (size!20437 (_ BitVec 32))) )
))
(declare-fun lt!334087 () array!41805)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!334079 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41805 (_ BitVec 32)) SeekEntryResult!7616)

(assert (=> b!751233 (= lt!334082 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334079 lt!334087 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751233 (= lt!334078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334079 mask!3328) lt!334079 lt!334087 mask!3328))))

(declare-fun a!3186 () array!41805)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!751233 (= lt!334079 (select (store (arr!20016 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751233 (= lt!334087 (array!41806 (store (arr!20016 a!3186) i!1173 k!2102) (size!20437 a!3186)))))

(declare-fun b!751234 () Bool)

(declare-fun res!507144 () Bool)

(assert (=> b!751234 (=> (not res!507144) (not e!419090))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!751234 (= res!507144 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20016 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751235 () Bool)

(declare-fun e!419087 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41805 (_ BitVec 32)) SeekEntryResult!7616)

(assert (=> b!751235 (= e!419087 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20016 a!3186) j!159) a!3186 mask!3328) (Found!7616 j!159)))))

(declare-fun b!751236 () Bool)

(declare-fun e!419091 () Bool)

(declare-fun e!419094 () Bool)

(assert (=> b!751236 (= e!419091 e!419094)))

(declare-fun res!507152 () Bool)

(assert (=> b!751236 (=> (not res!507152) (not e!419094))))

(declare-fun lt!334081 () SeekEntryResult!7616)

(assert (=> b!751236 (= res!507152 (or (= lt!334081 (MissingZero!7616 i!1173)) (= lt!334081 (MissingVacant!7616 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41805 (_ BitVec 32)) SeekEntryResult!7616)

(assert (=> b!751236 (= lt!334081 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!419095 () Bool)

(declare-fun b!751237 () Bool)

(assert (=> b!751237 (= e!419095 (= (seekEntryOrOpen!0 lt!334079 lt!334087 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334079 lt!334087 mask!3328)))))

(declare-fun b!751238 () Bool)

(declare-fun res!507149 () Bool)

(assert (=> b!751238 (=> (not res!507149) (not e!419091))))

(declare-fun arrayContainsKey!0 (array!41805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751238 (= res!507149 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751239 () Bool)

(declare-fun e!419096 () Bool)

(assert (=> b!751239 (= e!419086 (not e!419096))))

(declare-fun res!507148 () Bool)

(assert (=> b!751239 (=> res!507148 e!419096)))

(assert (=> b!751239 (= res!507148 (or (not (is-Intermediate!7616 lt!334082)) (bvslt x!1131 (x!63758 lt!334082)) (not (= x!1131 (x!63758 lt!334082))) (not (= index!1321 (index!32834 lt!334082)))))))

(declare-fun e!419088 () Bool)

(assert (=> b!751239 e!419088))

(declare-fun res!507161 () Bool)

(assert (=> b!751239 (=> (not res!507161) (not e!419088))))

(declare-fun lt!334080 () SeekEntryResult!7616)

(declare-fun lt!334086 () SeekEntryResult!7616)

(assert (=> b!751239 (= res!507161 (= lt!334080 lt!334086))))

(assert (=> b!751239 (= lt!334086 (Found!7616 j!159))))

(assert (=> b!751239 (= lt!334080 (seekEntryOrOpen!0 (select (arr!20016 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41805 (_ BitVec 32)) Bool)

(assert (=> b!751239 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25844 0))(
  ( (Unit!25845) )
))
(declare-fun lt!334084 () Unit!25844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25844)

(assert (=> b!751239 (= lt!334084 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751240 () Bool)

(declare-fun e!419089 () Unit!25844)

(declare-fun Unit!25846 () Unit!25844)

(assert (=> b!751240 (= e!419089 Unit!25846)))

(declare-fun lt!334088 () SeekEntryResult!7616)

(declare-fun b!751241 () Bool)

(assert (=> b!751241 (= e!419087 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20016 a!3186) j!159) a!3186 mask!3328) lt!334088))))

(declare-fun b!751242 () Bool)

(assert (=> b!751242 (= e!419094 e!419090)))

(declare-fun res!507147 () Bool)

(assert (=> b!751242 (=> (not res!507147) (not e!419090))))

(assert (=> b!751242 (= res!507147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20016 a!3186) j!159) mask!3328) (select (arr!20016 a!3186) j!159) a!3186 mask!3328) lt!334088))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751242 (= lt!334088 (Intermediate!7616 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751243 () Bool)

(declare-fun e!419093 () Bool)

(assert (=> b!751243 (= e!419096 e!419093)))

(declare-fun res!507159 () Bool)

(assert (=> b!751243 (=> res!507159 e!419093)))

(declare-fun lt!334085 () (_ BitVec 64))

(assert (=> b!751243 (= res!507159 (= lt!334085 lt!334079))))

(assert (=> b!751243 (= lt!334085 (select (store (arr!20016 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751244 () Bool)

(declare-fun res!507154 () Bool)

(assert (=> b!751244 (=> (not res!507154) (not e!419094))))

(assert (=> b!751244 (= res!507154 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20437 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20437 a!3186))))))

(declare-fun b!751245 () Bool)

(declare-fun res!507151 () Bool)

(assert (=> b!751245 (=> (not res!507151) (not e!419091))))

(assert (=> b!751245 (= res!507151 (and (= (size!20437 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20437 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20437 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751246 () Bool)

(assert (=> b!751246 (= e!419093 true)))

(assert (=> b!751246 e!419095))

(declare-fun res!507155 () Bool)

(assert (=> b!751246 (=> (not res!507155) (not e!419095))))

(assert (=> b!751246 (= res!507155 (= lt!334085 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334083 () Unit!25844)

(assert (=> b!751246 (= lt!334083 e!419089)))

(declare-fun c!82425 () Bool)

(assert (=> b!751246 (= c!82425 (= lt!334085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751247 () Bool)

(declare-fun res!507157 () Bool)

(assert (=> b!751247 (=> (not res!507157) (not e!419094))))

(assert (=> b!751247 (= res!507157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751248 () Bool)

(declare-fun Unit!25847 () Unit!25844)

(assert (=> b!751248 (= e!419089 Unit!25847)))

(assert (=> b!751248 false))

(declare-fun b!751249 () Bool)

(declare-fun res!507160 () Bool)

(assert (=> b!751249 (=> (not res!507160) (not e!419090))))

(assert (=> b!751249 (= res!507160 e!419087)))

(declare-fun c!82426 () Bool)

(assert (=> b!751249 (= c!82426 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751250 () Bool)

(declare-fun res!507156 () Bool)

(assert (=> b!751250 (=> (not res!507156) (not e!419091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751250 (= res!507156 (validKeyInArray!0 (select (arr!20016 a!3186) j!159)))))

(declare-fun res!507145 () Bool)

(assert (=> start!65632 (=> (not res!507145) (not e!419091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65632 (= res!507145 (validMask!0 mask!3328))))

(assert (=> start!65632 e!419091))

(assert (=> start!65632 true))

(declare-fun array_inv!15812 (array!41805) Bool)

(assert (=> start!65632 (array_inv!15812 a!3186)))

(declare-fun b!751251 () Bool)

(declare-fun res!507146 () Bool)

(assert (=> b!751251 (=> res!507146 e!419096)))

(assert (=> b!751251 (= res!507146 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20016 a!3186) j!159) a!3186 mask!3328) lt!334086)))))

(declare-fun b!751252 () Bool)

(assert (=> b!751252 (= e!419088 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20016 a!3186) j!159) a!3186 mask!3328) lt!334086))))

(declare-fun b!751253 () Bool)

(declare-fun res!507158 () Bool)

(assert (=> b!751253 (=> (not res!507158) (not e!419091))))

(assert (=> b!751253 (= res!507158 (validKeyInArray!0 k!2102))))

(declare-fun b!751254 () Bool)

(declare-fun res!507150 () Bool)

(assert (=> b!751254 (=> (not res!507150) (not e!419094))))

(declare-datatypes ((List!14018 0))(
  ( (Nil!14015) (Cons!14014 (h!15086 (_ BitVec 64)) (t!20333 List!14018)) )
))
(declare-fun arrayNoDuplicates!0 (array!41805 (_ BitVec 32) List!14018) Bool)

(assert (=> b!751254 (= res!507150 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14015))))

(assert (= (and start!65632 res!507145) b!751245))

(assert (= (and b!751245 res!507151) b!751250))

(assert (= (and b!751250 res!507156) b!751253))

(assert (= (and b!751253 res!507158) b!751238))

(assert (= (and b!751238 res!507149) b!751236))

(assert (= (and b!751236 res!507152) b!751247))

(assert (= (and b!751247 res!507157) b!751254))

(assert (= (and b!751254 res!507150) b!751244))

(assert (= (and b!751244 res!507154) b!751242))

(assert (= (and b!751242 res!507147) b!751234))

(assert (= (and b!751234 res!507144) b!751249))

(assert (= (and b!751249 c!82426) b!751241))

(assert (= (and b!751249 (not c!82426)) b!751235))

(assert (= (and b!751249 res!507160) b!751233))

(assert (= (and b!751233 res!507153) b!751239))

(assert (= (and b!751239 res!507161) b!751252))

(assert (= (and b!751239 (not res!507148)) b!751251))

(assert (= (and b!751251 (not res!507146)) b!751243))

(assert (= (and b!751243 (not res!507159)) b!751246))

(assert (= (and b!751246 c!82425) b!751248))

(assert (= (and b!751246 (not c!82425)) b!751240))

(assert (= (and b!751246 res!507155) b!751237))

(declare-fun m!700459 () Bool)

(assert (=> b!751237 m!700459))

(declare-fun m!700461 () Bool)

(assert (=> b!751237 m!700461))

(declare-fun m!700463 () Bool)

(assert (=> b!751235 m!700463))

(assert (=> b!751235 m!700463))

(declare-fun m!700465 () Bool)

(assert (=> b!751235 m!700465))

(declare-fun m!700467 () Bool)

(assert (=> b!751243 m!700467))

(declare-fun m!700469 () Bool)

(assert (=> b!751243 m!700469))

(declare-fun m!700471 () Bool)

(assert (=> b!751238 m!700471))

(assert (=> b!751242 m!700463))

(assert (=> b!751242 m!700463))

(declare-fun m!700473 () Bool)

(assert (=> b!751242 m!700473))

(assert (=> b!751242 m!700473))

(assert (=> b!751242 m!700463))

(declare-fun m!700475 () Bool)

(assert (=> b!751242 m!700475))

(assert (=> b!751252 m!700463))

(assert (=> b!751252 m!700463))

(declare-fun m!700477 () Bool)

(assert (=> b!751252 m!700477))

(declare-fun m!700479 () Bool)

(assert (=> b!751253 m!700479))

(assert (=> b!751233 m!700467))

(declare-fun m!700481 () Bool)

(assert (=> b!751233 m!700481))

(declare-fun m!700483 () Bool)

(assert (=> b!751233 m!700483))

(declare-fun m!700485 () Bool)

(assert (=> b!751233 m!700485))

(assert (=> b!751233 m!700481))

(declare-fun m!700487 () Bool)

(assert (=> b!751233 m!700487))

(declare-fun m!700489 () Bool)

(assert (=> b!751234 m!700489))

(assert (=> b!751239 m!700463))

(assert (=> b!751239 m!700463))

(declare-fun m!700491 () Bool)

(assert (=> b!751239 m!700491))

(declare-fun m!700493 () Bool)

(assert (=> b!751239 m!700493))

(declare-fun m!700495 () Bool)

(assert (=> b!751239 m!700495))

(declare-fun m!700497 () Bool)

(assert (=> b!751236 m!700497))

(assert (=> b!751241 m!700463))

(assert (=> b!751241 m!700463))

(declare-fun m!700499 () Bool)

(assert (=> b!751241 m!700499))

(assert (=> b!751250 m!700463))

(assert (=> b!751250 m!700463))

(declare-fun m!700501 () Bool)

(assert (=> b!751250 m!700501))

(declare-fun m!700503 () Bool)

(assert (=> b!751254 m!700503))

(declare-fun m!700505 () Bool)

(assert (=> start!65632 m!700505))

(declare-fun m!700507 () Bool)

(assert (=> start!65632 m!700507))

(assert (=> b!751251 m!700463))

(assert (=> b!751251 m!700463))

(assert (=> b!751251 m!700465))

(declare-fun m!700509 () Bool)

(assert (=> b!751247 m!700509))

(push 1)

