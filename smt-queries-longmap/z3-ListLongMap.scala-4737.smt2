; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65462 () Bool)

(assert start!65462)

(declare-fun b!746223 () Bool)

(declare-fun res!503125 () Bool)

(declare-fun e!416706 () Bool)

(assert (=> b!746223 (=> (not res!503125) (not e!416706))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((array!41652 0))(
  ( (array!41653 (arr!19940 (Array (_ BitVec 32) (_ BitVec 64))) (size!20361 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41652)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!746223 (= res!503125 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20361 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20361 a!3186))))))

(declare-fun b!746224 () Bool)

(declare-fun e!416712 () Bool)

(assert (=> b!746224 (= e!416712 e!416706)))

(declare-fun res!503133 () Bool)

(assert (=> b!746224 (=> (not res!503133) (not e!416706))))

(declare-datatypes ((SeekEntryResult!7537 0))(
  ( (MissingZero!7537 (index!32516 (_ BitVec 32))) (Found!7537 (index!32517 (_ BitVec 32))) (Intermediate!7537 (undefined!8349 Bool) (index!32518 (_ BitVec 32)) (x!63474 (_ BitVec 32))) (Undefined!7537) (MissingVacant!7537 (index!32519 (_ BitVec 32))) )
))
(declare-fun lt!331500 () SeekEntryResult!7537)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746224 (= res!503133 (or (= lt!331500 (MissingZero!7537 i!1173)) (= lt!331500 (MissingVacant!7537 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41652 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!746224 (= lt!331500 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746225 () Bool)

(declare-fun res!503135 () Bool)

(assert (=> b!746225 (=> (not res!503135) (not e!416712))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!746225 (= res!503135 (and (= (size!20361 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20361 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20361 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!503138 () Bool)

(assert (=> start!65462 (=> (not res!503138) (not e!416712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65462 (= res!503138 (validMask!0 mask!3328))))

(assert (=> start!65462 e!416712))

(assert (=> start!65462 true))

(declare-fun array_inv!15823 (array!41652) Bool)

(assert (=> start!65462 (array_inv!15823 a!3186)))

(declare-fun b!746226 () Bool)

(declare-fun res!503137 () Bool)

(assert (=> b!746226 (=> (not res!503137) (not e!416712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746226 (= res!503137 (validKeyInArray!0 (select (arr!19940 a!3186) j!159)))))

(declare-fun b!746227 () Bool)

(declare-fun res!503126 () Bool)

(assert (=> b!746227 (=> (not res!503126) (not e!416706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41652 (_ BitVec 32)) Bool)

(assert (=> b!746227 (= res!503126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!416709 () Bool)

(declare-fun b!746228 () Bool)

(assert (=> b!746228 (= e!416709 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!331504 () SeekEntryResult!7537)

(declare-fun lt!331497 () SeekEntryResult!7537)

(assert (=> b!746228 (= lt!331504 lt!331497)))

(declare-fun b!746229 () Bool)

(declare-fun e!416705 () Bool)

(declare-fun e!416707 () Bool)

(assert (=> b!746229 (= e!416705 e!416707)))

(declare-fun res!503134 () Bool)

(assert (=> b!746229 (=> (not res!503134) (not e!416707))))

(declare-fun lt!331502 () SeekEntryResult!7537)

(declare-fun lt!331499 () SeekEntryResult!7537)

(assert (=> b!746229 (= res!503134 (= lt!331502 lt!331499))))

(declare-fun lt!331496 () array!41652)

(declare-fun lt!331505 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41652 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!746229 (= lt!331499 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331505 lt!331496 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746229 (= lt!331502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331505 mask!3328) lt!331505 lt!331496 mask!3328))))

(assert (=> b!746229 (= lt!331505 (select (store (arr!19940 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746229 (= lt!331496 (array!41653 (store (arr!19940 a!3186) i!1173 k0!2102) (size!20361 a!3186)))))

(declare-fun b!746230 () Bool)

(assert (=> b!746230 (= e!416706 e!416705)))

(declare-fun res!503139 () Bool)

(assert (=> b!746230 (=> (not res!503139) (not e!416705))))

(declare-fun lt!331498 () SeekEntryResult!7537)

(assert (=> b!746230 (= res!503139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19940 a!3186) j!159) mask!3328) (select (arr!19940 a!3186) j!159) a!3186 mask!3328) lt!331498))))

(assert (=> b!746230 (= lt!331498 (Intermediate!7537 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!416711 () Bool)

(declare-fun b!746231 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41652 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!746231 (= e!416711 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19940 a!3186) j!159) a!3186 mask!3328) (Found!7537 j!159)))))

(declare-fun b!746232 () Bool)

(declare-fun e!416708 () Bool)

(assert (=> b!746232 (= e!416708 e!416709)))

(declare-fun res!503130 () Bool)

(assert (=> b!746232 (=> res!503130 e!416709)))

(declare-fun lt!331503 () SeekEntryResult!7537)

(assert (=> b!746232 (= res!503130 (or (not (= lt!331497 lt!331503)) (= (select (store (arr!19940 a!3186) i!1173 k0!2102) index!1321) lt!331505) (not (= (select (store (arr!19940 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746232 (= lt!331497 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19940 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746233 () Bool)

(declare-fun res!503124 () Bool)

(assert (=> b!746233 (=> (not res!503124) (not e!416706))))

(declare-datatypes ((List!13981 0))(
  ( (Nil!13978) (Cons!13977 (h!15049 (_ BitVec 64)) (t!20287 List!13981)) )
))
(declare-fun arrayNoDuplicates!0 (array!41652 (_ BitVec 32) List!13981) Bool)

(assert (=> b!746233 (= res!503124 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13978))))

(declare-fun e!416713 () Bool)

(declare-fun b!746234 () Bool)

(assert (=> b!746234 (= e!416713 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19940 a!3186) j!159) a!3186 mask!3328) lt!331503))))

(declare-fun b!746235 () Bool)

(declare-fun res!503128 () Bool)

(assert (=> b!746235 (=> (not res!503128) (not e!416712))))

(assert (=> b!746235 (= res!503128 (validKeyInArray!0 k0!2102))))

(declare-fun b!746236 () Bool)

(assert (=> b!746236 (= e!416707 (not e!416708))))

(declare-fun res!503136 () Bool)

(assert (=> b!746236 (=> res!503136 e!416708)))

(get-info :version)

(assert (=> b!746236 (= res!503136 (or (not ((_ is Intermediate!7537) lt!331499)) (bvslt x!1131 (x!63474 lt!331499)) (not (= x!1131 (x!63474 lt!331499))) (not (= index!1321 (index!32518 lt!331499)))))))

(assert (=> b!746236 e!416713))

(declare-fun res!503131 () Bool)

(assert (=> b!746236 (=> (not res!503131) (not e!416713))))

(assert (=> b!746236 (= res!503131 (= lt!331504 lt!331503))))

(assert (=> b!746236 (= lt!331503 (Found!7537 j!159))))

(assert (=> b!746236 (= lt!331504 (seekEntryOrOpen!0 (select (arr!19940 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746236 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25526 0))(
  ( (Unit!25527) )
))
(declare-fun lt!331501 () Unit!25526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25526)

(assert (=> b!746236 (= lt!331501 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746237 () Bool)

(declare-fun res!503129 () Bool)

(assert (=> b!746237 (=> (not res!503129) (not e!416712))))

(declare-fun arrayContainsKey!0 (array!41652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746237 (= res!503129 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746238 () Bool)

(declare-fun res!503132 () Bool)

(assert (=> b!746238 (=> (not res!503132) (not e!416705))))

(assert (=> b!746238 (= res!503132 e!416711)))

(declare-fun c!81930 () Bool)

(assert (=> b!746238 (= c!81930 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746239 () Bool)

(declare-fun res!503127 () Bool)

(assert (=> b!746239 (=> (not res!503127) (not e!416705))))

(assert (=> b!746239 (= res!503127 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19940 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746240 () Bool)

(assert (=> b!746240 (= e!416711 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19940 a!3186) j!159) a!3186 mask!3328) lt!331498))))

(assert (= (and start!65462 res!503138) b!746225))

(assert (= (and b!746225 res!503135) b!746226))

(assert (= (and b!746226 res!503137) b!746235))

(assert (= (and b!746235 res!503128) b!746237))

(assert (= (and b!746237 res!503129) b!746224))

(assert (= (and b!746224 res!503133) b!746227))

(assert (= (and b!746227 res!503126) b!746233))

(assert (= (and b!746233 res!503124) b!746223))

(assert (= (and b!746223 res!503125) b!746230))

(assert (= (and b!746230 res!503139) b!746239))

(assert (= (and b!746239 res!503127) b!746238))

(assert (= (and b!746238 c!81930) b!746240))

(assert (= (and b!746238 (not c!81930)) b!746231))

(assert (= (and b!746238 res!503132) b!746229))

(assert (= (and b!746229 res!503134) b!746236))

(assert (= (and b!746236 res!503131) b!746234))

(assert (= (and b!746236 (not res!503136)) b!746232))

(assert (= (and b!746232 (not res!503130)) b!746228))

(declare-fun m!695969 () Bool)

(assert (=> b!746227 m!695969))

(declare-fun m!695971 () Bool)

(assert (=> b!746235 m!695971))

(declare-fun m!695973 () Bool)

(assert (=> b!746237 m!695973))

(declare-fun m!695975 () Bool)

(assert (=> b!746240 m!695975))

(assert (=> b!746240 m!695975))

(declare-fun m!695977 () Bool)

(assert (=> b!746240 m!695977))

(declare-fun m!695979 () Bool)

(assert (=> b!746233 m!695979))

(assert (=> b!746231 m!695975))

(assert (=> b!746231 m!695975))

(declare-fun m!695981 () Bool)

(assert (=> b!746231 m!695981))

(assert (=> b!746236 m!695975))

(assert (=> b!746236 m!695975))

(declare-fun m!695983 () Bool)

(assert (=> b!746236 m!695983))

(declare-fun m!695985 () Bool)

(assert (=> b!746236 m!695985))

(declare-fun m!695987 () Bool)

(assert (=> b!746236 m!695987))

(declare-fun m!695989 () Bool)

(assert (=> b!746239 m!695989))

(assert (=> b!746226 m!695975))

(assert (=> b!746226 m!695975))

(declare-fun m!695991 () Bool)

(assert (=> b!746226 m!695991))

(declare-fun m!695993 () Bool)

(assert (=> b!746224 m!695993))

(declare-fun m!695995 () Bool)

(assert (=> b!746232 m!695995))

(declare-fun m!695997 () Bool)

(assert (=> b!746232 m!695997))

(assert (=> b!746232 m!695975))

(assert (=> b!746232 m!695975))

(assert (=> b!746232 m!695981))

(assert (=> b!746229 m!695995))

(declare-fun m!695999 () Bool)

(assert (=> b!746229 m!695999))

(declare-fun m!696001 () Bool)

(assert (=> b!746229 m!696001))

(declare-fun m!696003 () Bool)

(assert (=> b!746229 m!696003))

(assert (=> b!746229 m!696003))

(declare-fun m!696005 () Bool)

(assert (=> b!746229 m!696005))

(assert (=> b!746234 m!695975))

(assert (=> b!746234 m!695975))

(declare-fun m!696007 () Bool)

(assert (=> b!746234 m!696007))

(assert (=> b!746230 m!695975))

(assert (=> b!746230 m!695975))

(declare-fun m!696009 () Bool)

(assert (=> b!746230 m!696009))

(assert (=> b!746230 m!696009))

(assert (=> b!746230 m!695975))

(declare-fun m!696011 () Bool)

(assert (=> b!746230 m!696011))

(declare-fun m!696013 () Bool)

(assert (=> start!65462 m!696013))

(declare-fun m!696015 () Bool)

(assert (=> start!65462 m!696015))

(check-sat (not b!746240) (not b!746226) (not b!746235) (not start!65462) (not b!746231) (not b!746229) (not b!746227) (not b!746233) (not b!746232) (not b!746237) (not b!746236) (not b!746234) (not b!746224) (not b!746230))
(check-sat)
