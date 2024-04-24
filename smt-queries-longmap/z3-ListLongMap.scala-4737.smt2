; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65610 () Bool)

(assert start!65610)

(declare-fun b!747218 () Bool)

(declare-fun res!503551 () Bool)

(declare-fun e!417344 () Bool)

(assert (=> b!747218 (=> (not res!503551) (not e!417344))))

(declare-datatypes ((array!41653 0))(
  ( (array!41654 (arr!19936 (Array (_ BitVec 32) (_ BitVec 64))) (size!20356 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41653)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747218 (= res!503551 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747219 () Bool)

(declare-fun e!417340 () Bool)

(assert (=> b!747219 (= e!417344 e!417340)))

(declare-fun res!503543 () Bool)

(assert (=> b!747219 (=> (not res!503543) (not e!417340))))

(declare-datatypes ((SeekEntryResult!7492 0))(
  ( (MissingZero!7492 (index!32336 (_ BitVec 32))) (Found!7492 (index!32337 (_ BitVec 32))) (Intermediate!7492 (undefined!8304 Bool) (index!32338 (_ BitVec 32)) (x!63446 (_ BitVec 32))) (Undefined!7492) (MissingVacant!7492 (index!32339 (_ BitVec 32))) )
))
(declare-fun lt!332052 () SeekEntryResult!7492)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747219 (= res!503543 (or (= lt!332052 (MissingZero!7492 i!1173)) (= lt!332052 (MissingVacant!7492 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41653 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!747219 (= lt!332052 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747220 () Bool)

(declare-fun res!503546 () Bool)

(declare-fun e!417339 () Bool)

(assert (=> b!747220 (=> (not res!503546) (not e!417339))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!747220 (= res!503546 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19936 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!503544 () Bool)

(assert (=> start!65610 (=> (not res!503544) (not e!417344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65610 (= res!503544 (validMask!0 mask!3328))))

(assert (=> start!65610 e!417344))

(assert (=> start!65610 true))

(declare-fun array_inv!15795 (array!41653) Bool)

(assert (=> start!65610 (array_inv!15795 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!747221 () Bool)

(declare-fun lt!332049 () SeekEntryResult!7492)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!417341 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41653 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!747221 (= e!417341 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19936 a!3186) j!159) a!3186 mask!3328) lt!332049))))

(declare-fun b!747222 () Bool)

(declare-fun e!417342 () Bool)

(declare-fun e!417338 () Bool)

(assert (=> b!747222 (= e!417342 e!417338)))

(declare-fun res!503548 () Bool)

(assert (=> b!747222 (=> res!503548 e!417338)))

(declare-fun lt!332054 () SeekEntryResult!7492)

(declare-fun lt!332058 () SeekEntryResult!7492)

(declare-fun lt!332056 () (_ BitVec 64))

(assert (=> b!747222 (= res!503548 (or (not (= lt!332054 lt!332058)) (= (select (store (arr!19936 a!3186) i!1173 k0!2102) index!1321) lt!332056) (not (= (select (store (arr!19936 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41653 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!747222 (= lt!332054 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19936 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!747223 () Bool)

(declare-fun res!503549 () Bool)

(assert (=> b!747223 (=> (not res!503549) (not e!417340))))

(declare-datatypes ((List!13845 0))(
  ( (Nil!13842) (Cons!13841 (h!14919 (_ BitVec 64)) (t!20152 List!13845)) )
))
(declare-fun arrayNoDuplicates!0 (array!41653 (_ BitVec 32) List!13845) Bool)

(assert (=> b!747223 (= res!503549 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13842))))

(declare-fun b!747224 () Bool)

(declare-fun res!503554 () Bool)

(assert (=> b!747224 (=> (not res!503554) (not e!417344))))

(assert (=> b!747224 (= res!503554 (and (= (size!20356 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20356 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20356 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747225 () Bool)

(assert (=> b!747225 (= e!417338 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!332055 () SeekEntryResult!7492)

(assert (=> b!747225 (= lt!332055 lt!332054)))

(declare-fun b!747226 () Bool)

(declare-fun res!503539 () Bool)

(assert (=> b!747226 (=> (not res!503539) (not e!417344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747226 (= res!503539 (validKeyInArray!0 k0!2102))))

(declare-fun b!747227 () Bool)

(declare-fun e!417345 () Bool)

(assert (=> b!747227 (= e!417345 (not e!417342))))

(declare-fun res!503540 () Bool)

(assert (=> b!747227 (=> res!503540 e!417342)))

(declare-fun lt!332057 () SeekEntryResult!7492)

(get-info :version)

(assert (=> b!747227 (= res!503540 (or (not ((_ is Intermediate!7492) lt!332057)) (bvslt x!1131 (x!63446 lt!332057)) (not (= x!1131 (x!63446 lt!332057))) (not (= index!1321 (index!32338 lt!332057)))))))

(declare-fun e!417337 () Bool)

(assert (=> b!747227 e!417337))

(declare-fun res!503547 () Bool)

(assert (=> b!747227 (=> (not res!503547) (not e!417337))))

(assert (=> b!747227 (= res!503547 (= lt!332055 lt!332058))))

(assert (=> b!747227 (= lt!332058 (Found!7492 j!159))))

(assert (=> b!747227 (= lt!332055 (seekEntryOrOpen!0 (select (arr!19936 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41653 (_ BitVec 32)) Bool)

(assert (=> b!747227 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25543 0))(
  ( (Unit!25544) )
))
(declare-fun lt!332051 () Unit!25543)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25543)

(assert (=> b!747227 (= lt!332051 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747228 () Bool)

(declare-fun res!503545 () Bool)

(assert (=> b!747228 (=> (not res!503545) (not e!417340))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747228 (= res!503545 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20356 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20356 a!3186))))))

(declare-fun b!747229 () Bool)

(declare-fun res!503542 () Bool)

(assert (=> b!747229 (=> (not res!503542) (not e!417340))))

(assert (=> b!747229 (= res!503542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747230 () Bool)

(assert (=> b!747230 (= e!417340 e!417339)))

(declare-fun res!503541 () Bool)

(assert (=> b!747230 (=> (not res!503541) (not e!417339))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747230 (= res!503541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19936 a!3186) j!159) mask!3328) (select (arr!19936 a!3186) j!159) a!3186 mask!3328) lt!332049))))

(assert (=> b!747230 (= lt!332049 (Intermediate!7492 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747231 () Bool)

(declare-fun res!503550 () Bool)

(assert (=> b!747231 (=> (not res!503550) (not e!417339))))

(assert (=> b!747231 (= res!503550 e!417341)))

(declare-fun c!82223 () Bool)

(assert (=> b!747231 (= c!82223 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747232 () Bool)

(assert (=> b!747232 (= e!417339 e!417345)))

(declare-fun res!503552 () Bool)

(assert (=> b!747232 (=> (not res!503552) (not e!417345))))

(declare-fun lt!332053 () SeekEntryResult!7492)

(assert (=> b!747232 (= res!503552 (= lt!332053 lt!332057))))

(declare-fun lt!332050 () array!41653)

(assert (=> b!747232 (= lt!332057 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332056 lt!332050 mask!3328))))

(assert (=> b!747232 (= lt!332053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332056 mask!3328) lt!332056 lt!332050 mask!3328))))

(assert (=> b!747232 (= lt!332056 (select (store (arr!19936 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747232 (= lt!332050 (array!41654 (store (arr!19936 a!3186) i!1173 k0!2102) (size!20356 a!3186)))))

(declare-fun b!747233 () Bool)

(assert (=> b!747233 (= e!417337 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19936 a!3186) j!159) a!3186 mask!3328) lt!332058))))

(declare-fun b!747234 () Bool)

(assert (=> b!747234 (= e!417341 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19936 a!3186) j!159) a!3186 mask!3328) (Found!7492 j!159)))))

(declare-fun b!747235 () Bool)

(declare-fun res!503553 () Bool)

(assert (=> b!747235 (=> (not res!503553) (not e!417344))))

(assert (=> b!747235 (= res!503553 (validKeyInArray!0 (select (arr!19936 a!3186) j!159)))))

(assert (= (and start!65610 res!503544) b!747224))

(assert (= (and b!747224 res!503554) b!747235))

(assert (= (and b!747235 res!503553) b!747226))

(assert (= (and b!747226 res!503539) b!747218))

(assert (= (and b!747218 res!503551) b!747219))

(assert (= (and b!747219 res!503543) b!747229))

(assert (= (and b!747229 res!503542) b!747223))

(assert (= (and b!747223 res!503549) b!747228))

(assert (= (and b!747228 res!503545) b!747230))

(assert (= (and b!747230 res!503541) b!747220))

(assert (= (and b!747220 res!503546) b!747231))

(assert (= (and b!747231 c!82223) b!747221))

(assert (= (and b!747231 (not c!82223)) b!747234))

(assert (= (and b!747231 res!503550) b!747232))

(assert (= (and b!747232 res!503552) b!747227))

(assert (= (and b!747227 res!503547) b!747233))

(assert (= (and b!747227 (not res!503540)) b!747222))

(assert (= (and b!747222 (not res!503548)) b!747225))

(declare-fun m!697887 () Bool)

(assert (=> b!747230 m!697887))

(assert (=> b!747230 m!697887))

(declare-fun m!697889 () Bool)

(assert (=> b!747230 m!697889))

(assert (=> b!747230 m!697889))

(assert (=> b!747230 m!697887))

(declare-fun m!697891 () Bool)

(assert (=> b!747230 m!697891))

(declare-fun m!697893 () Bool)

(assert (=> b!747220 m!697893))

(declare-fun m!697895 () Bool)

(assert (=> b!747226 m!697895))

(declare-fun m!697897 () Bool)

(assert (=> b!747222 m!697897))

(declare-fun m!697899 () Bool)

(assert (=> b!747222 m!697899))

(assert (=> b!747222 m!697887))

(assert (=> b!747222 m!697887))

(declare-fun m!697901 () Bool)

(assert (=> b!747222 m!697901))

(declare-fun m!697903 () Bool)

(assert (=> b!747223 m!697903))

(assert (=> b!747233 m!697887))

(assert (=> b!747233 m!697887))

(declare-fun m!697905 () Bool)

(assert (=> b!747233 m!697905))

(declare-fun m!697907 () Bool)

(assert (=> b!747229 m!697907))

(declare-fun m!697909 () Bool)

(assert (=> b!747218 m!697909))

(declare-fun m!697911 () Bool)

(assert (=> b!747232 m!697911))

(assert (=> b!747232 m!697911))

(declare-fun m!697913 () Bool)

(assert (=> b!747232 m!697913))

(assert (=> b!747232 m!697897))

(declare-fun m!697915 () Bool)

(assert (=> b!747232 m!697915))

(declare-fun m!697917 () Bool)

(assert (=> b!747232 m!697917))

(declare-fun m!697919 () Bool)

(assert (=> b!747219 m!697919))

(assert (=> b!747221 m!697887))

(assert (=> b!747221 m!697887))

(declare-fun m!697921 () Bool)

(assert (=> b!747221 m!697921))

(assert (=> b!747234 m!697887))

(assert (=> b!747234 m!697887))

(assert (=> b!747234 m!697901))

(assert (=> b!747235 m!697887))

(assert (=> b!747235 m!697887))

(declare-fun m!697923 () Bool)

(assert (=> b!747235 m!697923))

(declare-fun m!697925 () Bool)

(assert (=> start!65610 m!697925))

(declare-fun m!697927 () Bool)

(assert (=> start!65610 m!697927))

(assert (=> b!747227 m!697887))

(assert (=> b!747227 m!697887))

(declare-fun m!697929 () Bool)

(assert (=> b!747227 m!697929))

(declare-fun m!697931 () Bool)

(assert (=> b!747227 m!697931))

(declare-fun m!697933 () Bool)

(assert (=> b!747227 m!697933))

(check-sat (not start!65610) (not b!747222) (not b!747235) (not b!747226) (not b!747218) (not b!747223) (not b!747219) (not b!747230) (not b!747229) (not b!747234) (not b!747233) (not b!747232) (not b!747221) (not b!747227))
(check-sat)
