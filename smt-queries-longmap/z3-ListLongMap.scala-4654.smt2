; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64698 () Bool)

(assert start!64698)

(declare-fun b!729604 () Bool)

(declare-fun res!489995 () Bool)

(declare-fun e!408348 () Bool)

(assert (=> b!729604 (=> (not res!489995) (not e!408348))))

(declare-datatypes ((array!41147 0))(
  ( (array!41148 (arr!19693 (Array (_ BitVec 32) (_ BitVec 64))) (size!20114 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41147)

(declare-datatypes ((List!13695 0))(
  ( (Nil!13692) (Cons!13691 (h!14751 (_ BitVec 64)) (t!20010 List!13695)) )
))
(declare-fun arrayNoDuplicates!0 (array!41147 (_ BitVec 32) List!13695) Bool)

(assert (=> b!729604 (= res!489995 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13692))))

(declare-fun b!729605 () Bool)

(declare-fun res!490002 () Bool)

(declare-fun e!408352 () Bool)

(assert (=> b!729605 (=> (not res!490002) (not e!408352))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!729605 (= res!490002 (and (= (size!20114 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20114 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20114 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729606 () Bool)

(declare-fun res!490000 () Bool)

(assert (=> b!729606 (=> (not res!490000) (not e!408348))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729606 (= res!490000 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20114 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20114 a!3186))))))

(declare-fun b!729607 () Bool)

(declare-fun res!489998 () Bool)

(assert (=> b!729607 (=> (not res!489998) (not e!408352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729607 (= res!489998 (validKeyInArray!0 (select (arr!19693 a!3186) j!159)))))

(declare-fun e!408349 () Bool)

(declare-fun b!729608 () Bool)

(assert (=> b!729608 (= e!408349 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!323244 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729608 (= lt!323244 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!489989 () Bool)

(assert (=> start!64698 (=> (not res!489989) (not e!408352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64698 (= res!489989 (validMask!0 mask!3328))))

(assert (=> start!64698 e!408352))

(assert (=> start!64698 true))

(declare-fun array_inv!15489 (array!41147) Bool)

(assert (=> start!64698 (array_inv!15489 a!3186)))

(declare-fun b!729609 () Bool)

(declare-fun e!408345 () Bool)

(declare-datatypes ((SeekEntryResult!7293 0))(
  ( (MissingZero!7293 (index!31540 (_ BitVec 32))) (Found!7293 (index!31541 (_ BitVec 32))) (Intermediate!7293 (undefined!8105 Bool) (index!31542 (_ BitVec 32)) (x!62523 (_ BitVec 32))) (Undefined!7293) (MissingVacant!7293 (index!31543 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41147 (_ BitVec 32)) SeekEntryResult!7293)

(assert (=> b!729609 (= e!408345 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19693 a!3186) j!159) a!3186 mask!3328) (Found!7293 j!159)))))

(declare-fun b!729610 () Bool)

(declare-fun e!408350 () Bool)

(declare-fun e!408353 () Bool)

(assert (=> b!729610 (= e!408350 e!408353)))

(declare-fun res!489990 () Bool)

(assert (=> b!729610 (=> (not res!489990) (not e!408353))))

(declare-fun lt!323251 () SeekEntryResult!7293)

(declare-fun lt!323252 () SeekEntryResult!7293)

(assert (=> b!729610 (= res!489990 (= lt!323251 lt!323252))))

(declare-fun lt!323250 () array!41147)

(declare-fun lt!323247 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41147 (_ BitVec 32)) SeekEntryResult!7293)

(assert (=> b!729610 (= lt!323252 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323247 lt!323250 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729610 (= lt!323251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323247 mask!3328) lt!323247 lt!323250 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!729610 (= lt!323247 (select (store (arr!19693 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729610 (= lt!323250 (array!41148 (store (arr!19693 a!3186) i!1173 k0!2102) (size!20114 a!3186)))))

(declare-fun b!729611 () Bool)

(declare-fun res!489999 () Bool)

(assert (=> b!729611 (=> (not res!489999) (not e!408352))))

(assert (=> b!729611 (= res!489999 (validKeyInArray!0 k0!2102))))

(declare-fun b!729612 () Bool)

(declare-fun res!489997 () Bool)

(assert (=> b!729612 (=> (not res!489997) (not e!408350))))

(assert (=> b!729612 (= res!489997 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19693 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729613 () Bool)

(assert (=> b!729613 (= e!408352 e!408348)))

(declare-fun res!489991 () Bool)

(assert (=> b!729613 (=> (not res!489991) (not e!408348))))

(declare-fun lt!323248 () SeekEntryResult!7293)

(assert (=> b!729613 (= res!489991 (or (= lt!323248 (MissingZero!7293 i!1173)) (= lt!323248 (MissingVacant!7293 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41147 (_ BitVec 32)) SeekEntryResult!7293)

(assert (=> b!729613 (= lt!323248 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!323246 () SeekEntryResult!7293)

(declare-fun b!729614 () Bool)

(assert (=> b!729614 (= e!408345 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19693 a!3186) j!159) a!3186 mask!3328) lt!323246))))

(declare-fun b!729615 () Bool)

(assert (=> b!729615 (= e!408353 (not e!408349))))

(declare-fun res!489993 () Bool)

(assert (=> b!729615 (=> res!489993 e!408349)))

(get-info :version)

(assert (=> b!729615 (= res!489993 (or (not ((_ is Intermediate!7293) lt!323252)) (bvsge x!1131 (x!62523 lt!323252))))))

(declare-fun e!408351 () Bool)

(assert (=> b!729615 e!408351))

(declare-fun res!489992 () Bool)

(assert (=> b!729615 (=> (not res!489992) (not e!408351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41147 (_ BitVec 32)) Bool)

(assert (=> b!729615 (= res!489992 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24904 0))(
  ( (Unit!24905) )
))
(declare-fun lt!323245 () Unit!24904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24904)

(assert (=> b!729615 (= lt!323245 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729616 () Bool)

(declare-fun res!490003 () Bool)

(assert (=> b!729616 (=> (not res!490003) (not e!408350))))

(assert (=> b!729616 (= res!490003 e!408345)))

(declare-fun c!80182 () Bool)

(assert (=> b!729616 (= c!80182 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!408347 () Bool)

(declare-fun b!729617 () Bool)

(declare-fun lt!323249 () SeekEntryResult!7293)

(assert (=> b!729617 (= e!408347 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19693 a!3186) j!159) a!3186 mask!3328) lt!323249))))

(declare-fun b!729618 () Bool)

(assert (=> b!729618 (= e!408351 e!408347)))

(declare-fun res!489996 () Bool)

(assert (=> b!729618 (=> (not res!489996) (not e!408347))))

(assert (=> b!729618 (= res!489996 (= (seekEntryOrOpen!0 (select (arr!19693 a!3186) j!159) a!3186 mask!3328) lt!323249))))

(assert (=> b!729618 (= lt!323249 (Found!7293 j!159))))

(declare-fun b!729619 () Bool)

(declare-fun res!489994 () Bool)

(assert (=> b!729619 (=> (not res!489994) (not e!408352))))

(declare-fun arrayContainsKey!0 (array!41147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729619 (= res!489994 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729620 () Bool)

(assert (=> b!729620 (= e!408348 e!408350)))

(declare-fun res!490001 () Bool)

(assert (=> b!729620 (=> (not res!490001) (not e!408350))))

(assert (=> b!729620 (= res!490001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19693 a!3186) j!159) mask!3328) (select (arr!19693 a!3186) j!159) a!3186 mask!3328) lt!323246))))

(assert (=> b!729620 (= lt!323246 (Intermediate!7293 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729621 () Bool)

(declare-fun res!490004 () Bool)

(assert (=> b!729621 (=> (not res!490004) (not e!408348))))

(assert (=> b!729621 (= res!490004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64698 res!489989) b!729605))

(assert (= (and b!729605 res!490002) b!729607))

(assert (= (and b!729607 res!489998) b!729611))

(assert (= (and b!729611 res!489999) b!729619))

(assert (= (and b!729619 res!489994) b!729613))

(assert (= (and b!729613 res!489991) b!729621))

(assert (= (and b!729621 res!490004) b!729604))

(assert (= (and b!729604 res!489995) b!729606))

(assert (= (and b!729606 res!490000) b!729620))

(assert (= (and b!729620 res!490001) b!729612))

(assert (= (and b!729612 res!489997) b!729616))

(assert (= (and b!729616 c!80182) b!729614))

(assert (= (and b!729616 (not c!80182)) b!729609))

(assert (= (and b!729616 res!490003) b!729610))

(assert (= (and b!729610 res!489990) b!729615))

(assert (= (and b!729615 res!489992) b!729618))

(assert (= (and b!729618 res!489996) b!729617))

(assert (= (and b!729615 (not res!489993)) b!729608))

(declare-fun m!683227 () Bool)

(assert (=> b!729617 m!683227))

(assert (=> b!729617 m!683227))

(declare-fun m!683229 () Bool)

(assert (=> b!729617 m!683229))

(declare-fun m!683231 () Bool)

(assert (=> b!729615 m!683231))

(declare-fun m!683233 () Bool)

(assert (=> b!729615 m!683233))

(assert (=> b!729614 m!683227))

(assert (=> b!729614 m!683227))

(declare-fun m!683235 () Bool)

(assert (=> b!729614 m!683235))

(declare-fun m!683237 () Bool)

(assert (=> b!729621 m!683237))

(declare-fun m!683239 () Bool)

(assert (=> b!729610 m!683239))

(declare-fun m!683241 () Bool)

(assert (=> b!729610 m!683241))

(declare-fun m!683243 () Bool)

(assert (=> b!729610 m!683243))

(declare-fun m!683245 () Bool)

(assert (=> b!729610 m!683245))

(assert (=> b!729610 m!683239))

(declare-fun m!683247 () Bool)

(assert (=> b!729610 m!683247))

(declare-fun m!683249 () Bool)

(assert (=> b!729611 m!683249))

(assert (=> b!729607 m!683227))

(assert (=> b!729607 m!683227))

(declare-fun m!683251 () Bool)

(assert (=> b!729607 m!683251))

(assert (=> b!729609 m!683227))

(assert (=> b!729609 m!683227))

(declare-fun m!683253 () Bool)

(assert (=> b!729609 m!683253))

(declare-fun m!683255 () Bool)

(assert (=> b!729612 m!683255))

(declare-fun m!683257 () Bool)

(assert (=> b!729608 m!683257))

(declare-fun m!683259 () Bool)

(assert (=> b!729613 m!683259))

(assert (=> b!729618 m!683227))

(assert (=> b!729618 m!683227))

(declare-fun m!683261 () Bool)

(assert (=> b!729618 m!683261))

(declare-fun m!683263 () Bool)

(assert (=> b!729619 m!683263))

(assert (=> b!729620 m!683227))

(assert (=> b!729620 m!683227))

(declare-fun m!683265 () Bool)

(assert (=> b!729620 m!683265))

(assert (=> b!729620 m!683265))

(assert (=> b!729620 m!683227))

(declare-fun m!683267 () Bool)

(assert (=> b!729620 m!683267))

(declare-fun m!683269 () Bool)

(assert (=> b!729604 m!683269))

(declare-fun m!683271 () Bool)

(assert (=> start!64698 m!683271))

(declare-fun m!683273 () Bool)

(assert (=> start!64698 m!683273))

(check-sat (not b!729620) (not b!729609) (not b!729608) (not b!729610) (not start!64698) (not b!729619) (not b!729611) (not b!729607) (not b!729613) (not b!729615) (not b!729604) (not b!729621) (not b!729618) (not b!729617) (not b!729614))
(check-sat)
