; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65558 () Bool)

(assert start!65558)

(declare-fun b!749201 () Bool)

(declare-fun res!505584 () Bool)

(declare-fun e!418051 () Bool)

(assert (=> b!749201 (=> (not res!505584) (not e!418051))))

(declare-datatypes ((array!41748 0))(
  ( (array!41749 (arr!19988 (Array (_ BitVec 32) (_ BitVec 64))) (size!20409 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41748)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749201 (= res!505584 (validKeyInArray!0 (select (arr!19988 a!3186) j!159)))))

(declare-fun b!749202 () Bool)

(declare-fun res!505577 () Bool)

(declare-fun e!418043 () Bool)

(assert (=> b!749202 (=> (not res!505577) (not e!418043))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41748 (_ BitVec 32)) Bool)

(assert (=> b!749202 (= res!505577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749203 () Bool)

(declare-fun res!505580 () Bool)

(assert (=> b!749203 (=> (not res!505580) (not e!418043))))

(declare-datatypes ((List!14029 0))(
  ( (Nil!14026) (Cons!14025 (h!15097 (_ BitVec 64)) (t!20335 List!14029)) )
))
(declare-fun arrayNoDuplicates!0 (array!41748 (_ BitVec 32) List!14029) Bool)

(assert (=> b!749203 (= res!505580 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14026))))

(declare-fun b!749204 () Bool)

(declare-fun res!505590 () Bool)

(assert (=> b!749204 (=> (not res!505590) (not e!418051))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749204 (= res!505590 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749205 () Bool)

(declare-fun res!505582 () Bool)

(assert (=> b!749205 (=> (not res!505582) (not e!418043))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!749205 (= res!505582 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20409 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20409 a!3186))))))

(declare-fun b!749206 () Bool)

(declare-fun res!505579 () Bool)

(assert (=> b!749206 (=> (not res!505579) (not e!418051))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749206 (= res!505579 (and (= (size!20409 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20409 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20409 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749207 () Bool)

(declare-fun res!505578 () Bool)

(declare-fun e!418050 () Bool)

(assert (=> b!749207 (=> (not res!505578) (not e!418050))))

(assert (=> b!749207 (= res!505578 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19988 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749208 () Bool)

(declare-fun e!418047 () Bool)

(assert (=> b!749208 (= e!418050 e!418047)))

(declare-fun res!505581 () Bool)

(assert (=> b!749208 (=> (not res!505581) (not e!418047))))

(declare-datatypes ((SeekEntryResult!7585 0))(
  ( (MissingZero!7585 (index!32708 (_ BitVec 32))) (Found!7585 (index!32709 (_ BitVec 32))) (Intermediate!7585 (undefined!8397 Bool) (index!32710 (_ BitVec 32)) (x!63650 (_ BitVec 32))) (Undefined!7585) (MissingVacant!7585 (index!32711 (_ BitVec 32))) )
))
(declare-fun lt!332956 () SeekEntryResult!7585)

(declare-fun lt!332951 () SeekEntryResult!7585)

(assert (=> b!749208 (= res!505581 (= lt!332956 lt!332951))))

(declare-fun lt!332948 () array!41748)

(declare-fun lt!332949 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41748 (_ BitVec 32)) SeekEntryResult!7585)

(assert (=> b!749208 (= lt!332951 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332949 lt!332948 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749208 (= lt!332956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332949 mask!3328) lt!332949 lt!332948 mask!3328))))

(assert (=> b!749208 (= lt!332949 (select (store (arr!19988 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749208 (= lt!332948 (array!41749 (store (arr!19988 a!3186) i!1173 k0!2102) (size!20409 a!3186)))))

(declare-fun b!749209 () Bool)

(declare-fun e!418048 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41748 (_ BitVec 32)) SeekEntryResult!7585)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41748 (_ BitVec 32)) SeekEntryResult!7585)

(assert (=> b!749209 (= e!418048 (= (seekEntryOrOpen!0 lt!332949 lt!332948 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!332949 lt!332948 mask!3328)))))

(declare-fun b!749210 () Bool)

(declare-fun res!505588 () Bool)

(declare-fun e!418042 () Bool)

(assert (=> b!749210 (=> res!505588 e!418042)))

(declare-fun lt!332952 () SeekEntryResult!7585)

(assert (=> b!749210 (= res!505588 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19988 a!3186) j!159) a!3186 mask!3328) lt!332952)))))

(declare-fun e!418044 () Bool)

(declare-fun b!749211 () Bool)

(assert (=> b!749211 (= e!418044 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19988 a!3186) j!159) a!3186 mask!3328) lt!332952))))

(declare-fun b!749212 () Bool)

(declare-fun e!418045 () Bool)

(assert (=> b!749212 (= e!418045 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!749212 e!418048))

(declare-fun res!505589 () Bool)

(assert (=> b!749212 (=> (not res!505589) (not e!418048))))

(declare-fun lt!332955 () (_ BitVec 64))

(assert (=> b!749212 (= res!505589 (= lt!332955 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25700 0))(
  ( (Unit!25701) )
))
(declare-fun lt!332953 () Unit!25700)

(declare-fun e!418049 () Unit!25700)

(assert (=> b!749212 (= lt!332953 e!418049)))

(declare-fun c!82193 () Bool)

(assert (=> b!749212 (= c!82193 (= lt!332955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!505593 () Bool)

(assert (=> start!65558 (=> (not res!505593) (not e!418051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65558 (= res!505593 (validMask!0 mask!3328))))

(assert (=> start!65558 e!418051))

(assert (=> start!65558 true))

(declare-fun array_inv!15871 (array!41748) Bool)

(assert (=> start!65558 (array_inv!15871 a!3186)))

(declare-fun e!418041 () Bool)

(declare-fun b!749213 () Bool)

(assert (=> b!749213 (= e!418041 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19988 a!3186) j!159) a!3186 mask!3328) (Found!7585 j!159)))))

(declare-fun b!749214 () Bool)

(assert (=> b!749214 (= e!418051 e!418043)))

(declare-fun res!505591 () Bool)

(assert (=> b!749214 (=> (not res!505591) (not e!418043))))

(declare-fun lt!332950 () SeekEntryResult!7585)

(assert (=> b!749214 (= res!505591 (or (= lt!332950 (MissingZero!7585 i!1173)) (= lt!332950 (MissingVacant!7585 i!1173))))))

(assert (=> b!749214 (= lt!332950 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749215 () Bool)

(declare-fun res!505576 () Bool)

(assert (=> b!749215 (=> (not res!505576) (not e!418050))))

(assert (=> b!749215 (= res!505576 e!418041)))

(declare-fun c!82194 () Bool)

(assert (=> b!749215 (= c!82194 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749216 () Bool)

(assert (=> b!749216 (= e!418042 e!418045)))

(declare-fun res!505592 () Bool)

(assert (=> b!749216 (=> res!505592 e!418045)))

(assert (=> b!749216 (= res!505592 (= lt!332955 lt!332949))))

(assert (=> b!749216 (= lt!332955 (select (store (arr!19988 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749217 () Bool)

(declare-fun Unit!25702 () Unit!25700)

(assert (=> b!749217 (= e!418049 Unit!25702)))

(declare-fun b!749218 () Bool)

(assert (=> b!749218 (= e!418043 e!418050)))

(declare-fun res!505583 () Bool)

(assert (=> b!749218 (=> (not res!505583) (not e!418050))))

(declare-fun lt!332954 () SeekEntryResult!7585)

(assert (=> b!749218 (= res!505583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19988 a!3186) j!159) mask!3328) (select (arr!19988 a!3186) j!159) a!3186 mask!3328) lt!332954))))

(assert (=> b!749218 (= lt!332954 (Intermediate!7585 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749219 () Bool)

(assert (=> b!749219 (= e!418041 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19988 a!3186) j!159) a!3186 mask!3328) lt!332954))))

(declare-fun b!749220 () Bool)

(declare-fun Unit!25703 () Unit!25700)

(assert (=> b!749220 (= e!418049 Unit!25703)))

(assert (=> b!749220 false))

(declare-fun b!749221 () Bool)

(declare-fun res!505585 () Bool)

(assert (=> b!749221 (=> (not res!505585) (not e!418051))))

(assert (=> b!749221 (= res!505585 (validKeyInArray!0 k0!2102))))

(declare-fun b!749222 () Bool)

(assert (=> b!749222 (= e!418047 (not e!418042))))

(declare-fun res!505586 () Bool)

(assert (=> b!749222 (=> res!505586 e!418042)))

(get-info :version)

(assert (=> b!749222 (= res!505586 (or (not ((_ is Intermediate!7585) lt!332951)) (bvslt x!1131 (x!63650 lt!332951)) (not (= x!1131 (x!63650 lt!332951))) (not (= index!1321 (index!32710 lt!332951)))))))

(assert (=> b!749222 e!418044))

(declare-fun res!505587 () Bool)

(assert (=> b!749222 (=> (not res!505587) (not e!418044))))

(declare-fun lt!332957 () SeekEntryResult!7585)

(assert (=> b!749222 (= res!505587 (= lt!332957 lt!332952))))

(assert (=> b!749222 (= lt!332952 (Found!7585 j!159))))

(assert (=> b!749222 (= lt!332957 (seekEntryOrOpen!0 (select (arr!19988 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749222 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332947 () Unit!25700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25700)

(assert (=> b!749222 (= lt!332947 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65558 res!505593) b!749206))

(assert (= (and b!749206 res!505579) b!749201))

(assert (= (and b!749201 res!505584) b!749221))

(assert (= (and b!749221 res!505585) b!749204))

(assert (= (and b!749204 res!505590) b!749214))

(assert (= (and b!749214 res!505591) b!749202))

(assert (= (and b!749202 res!505577) b!749203))

(assert (= (and b!749203 res!505580) b!749205))

(assert (= (and b!749205 res!505582) b!749218))

(assert (= (and b!749218 res!505583) b!749207))

(assert (= (and b!749207 res!505578) b!749215))

(assert (= (and b!749215 c!82194) b!749219))

(assert (= (and b!749215 (not c!82194)) b!749213))

(assert (= (and b!749215 res!505576) b!749208))

(assert (= (and b!749208 res!505581) b!749222))

(assert (= (and b!749222 res!505587) b!749211))

(assert (= (and b!749222 (not res!505586)) b!749210))

(assert (= (and b!749210 (not res!505588)) b!749216))

(assert (= (and b!749216 (not res!505592)) b!749212))

(assert (= (and b!749212 c!82193) b!749220))

(assert (= (and b!749212 (not c!82193)) b!749217))

(assert (= (and b!749212 res!505589) b!749209))

(declare-fun m!698297 () Bool)

(assert (=> b!749203 m!698297))

(declare-fun m!698299 () Bool)

(assert (=> b!749201 m!698299))

(assert (=> b!749201 m!698299))

(declare-fun m!698301 () Bool)

(assert (=> b!749201 m!698301))

(declare-fun m!698303 () Bool)

(assert (=> b!749208 m!698303))

(declare-fun m!698305 () Bool)

(assert (=> b!749208 m!698305))

(declare-fun m!698307 () Bool)

(assert (=> b!749208 m!698307))

(declare-fun m!698309 () Bool)

(assert (=> b!749208 m!698309))

(assert (=> b!749208 m!698303))

(declare-fun m!698311 () Bool)

(assert (=> b!749208 m!698311))

(declare-fun m!698313 () Bool)

(assert (=> b!749204 m!698313))

(assert (=> b!749210 m!698299))

(assert (=> b!749210 m!698299))

(declare-fun m!698315 () Bool)

(assert (=> b!749210 m!698315))

(assert (=> b!749222 m!698299))

(assert (=> b!749222 m!698299))

(declare-fun m!698317 () Bool)

(assert (=> b!749222 m!698317))

(declare-fun m!698319 () Bool)

(assert (=> b!749222 m!698319))

(declare-fun m!698321 () Bool)

(assert (=> b!749222 m!698321))

(assert (=> b!749211 m!698299))

(assert (=> b!749211 m!698299))

(declare-fun m!698323 () Bool)

(assert (=> b!749211 m!698323))

(declare-fun m!698325 () Bool)

(assert (=> b!749207 m!698325))

(declare-fun m!698327 () Bool)

(assert (=> start!65558 m!698327))

(declare-fun m!698329 () Bool)

(assert (=> start!65558 m!698329))

(assert (=> b!749219 m!698299))

(assert (=> b!749219 m!698299))

(declare-fun m!698331 () Bool)

(assert (=> b!749219 m!698331))

(declare-fun m!698333 () Bool)

(assert (=> b!749221 m!698333))

(assert (=> b!749218 m!698299))

(assert (=> b!749218 m!698299))

(declare-fun m!698335 () Bool)

(assert (=> b!749218 m!698335))

(assert (=> b!749218 m!698335))

(assert (=> b!749218 m!698299))

(declare-fun m!698337 () Bool)

(assert (=> b!749218 m!698337))

(declare-fun m!698339 () Bool)

(assert (=> b!749202 m!698339))

(declare-fun m!698341 () Bool)

(assert (=> b!749209 m!698341))

(declare-fun m!698343 () Bool)

(assert (=> b!749209 m!698343))

(assert (=> b!749216 m!698307))

(declare-fun m!698345 () Bool)

(assert (=> b!749216 m!698345))

(declare-fun m!698347 () Bool)

(assert (=> b!749214 m!698347))

(assert (=> b!749213 m!698299))

(assert (=> b!749213 m!698299))

(assert (=> b!749213 m!698315))

(check-sat (not b!749222) (not b!749201) (not b!749213) (not b!749211) (not b!749208) (not b!749214) (not b!749218) (not b!749210) (not b!749219) (not start!65558) (not b!749204) (not b!749209) (not b!749202) (not b!749203) (not b!749221))
(check-sat)
