; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64658 () Bool)

(assert start!64658)

(declare-fun b!728524 () Bool)

(declare-fun e!407807 () Bool)

(declare-fun e!407812 () Bool)

(assert (=> b!728524 (= e!407807 e!407812)))

(declare-fun res!489031 () Bool)

(assert (=> b!728524 (=> (not res!489031) (not e!407812))))

(declare-datatypes ((array!41107 0))(
  ( (array!41108 (arr!19673 (Array (_ BitVec 32) (_ BitVec 64))) (size!20094 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41107)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7273 0))(
  ( (MissingZero!7273 (index!31460 (_ BitVec 32))) (Found!7273 (index!31461 (_ BitVec 32))) (Intermediate!7273 (undefined!8085 Bool) (index!31462 (_ BitVec 32)) (x!62447 (_ BitVec 32))) (Undefined!7273) (MissingVacant!7273 (index!31463 (_ BitVec 32))) )
))
(declare-fun lt!322707 () SeekEntryResult!7273)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41107 (_ BitVec 32)) SeekEntryResult!7273)

(assert (=> b!728524 (= res!489031 (= (seekEntryOrOpen!0 (select (arr!19673 a!3186) j!159) a!3186 mask!3328) lt!322707))))

(assert (=> b!728524 (= lt!322707 (Found!7273 j!159))))

(declare-fun b!728525 () Bool)

(declare-fun e!407810 () Bool)

(assert (=> b!728525 (= e!407810 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322704 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728525 (= lt!322704 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728526 () Bool)

(declare-fun e!407808 () Bool)

(declare-fun e!407813 () Bool)

(assert (=> b!728526 (= e!407808 e!407813)))

(declare-fun res!489030 () Bool)

(assert (=> b!728526 (=> (not res!489030) (not e!407813))))

(declare-fun lt!322710 () SeekEntryResult!7273)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728526 (= res!489030 (or (= lt!322710 (MissingZero!7273 i!1173)) (= lt!322710 (MissingVacant!7273 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!728526 (= lt!322710 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728527 () Bool)

(declare-fun res!489039 () Bool)

(assert (=> b!728527 (=> (not res!489039) (not e!407808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728527 (= res!489039 (validKeyInArray!0 k!2102))))

(declare-fun b!728528 () Bool)

(declare-fun res!489040 () Bool)

(assert (=> b!728528 (=> (not res!489040) (not e!407813))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728528 (= res!489040 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20094 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20094 a!3186))))))

(declare-fun b!728529 () Bool)

(declare-fun e!407805 () Bool)

(assert (=> b!728529 (= e!407813 e!407805)))

(declare-fun res!489036 () Bool)

(assert (=> b!728529 (=> (not res!489036) (not e!407805))))

(declare-fun lt!322708 () SeekEntryResult!7273)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41107 (_ BitVec 32)) SeekEntryResult!7273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728529 (= res!489036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19673 a!3186) j!159) mask!3328) (select (arr!19673 a!3186) j!159) a!3186 mask!3328) lt!322708))))

(assert (=> b!728529 (= lt!322708 (Intermediate!7273 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728530 () Bool)

(declare-fun e!407809 () Bool)

(assert (=> b!728530 (= e!407805 e!407809)))

(declare-fun res!489035 () Bool)

(assert (=> b!728530 (=> (not res!489035) (not e!407809))))

(declare-fun lt!322712 () SeekEntryResult!7273)

(declare-fun lt!322705 () SeekEntryResult!7273)

(assert (=> b!728530 (= res!489035 (= lt!322712 lt!322705))))

(declare-fun lt!322709 () array!41107)

(declare-fun lt!322711 () (_ BitVec 64))

(assert (=> b!728530 (= lt!322705 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322711 lt!322709 mask!3328))))

(assert (=> b!728530 (= lt!322712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322711 mask!3328) lt!322711 lt!322709 mask!3328))))

(assert (=> b!728530 (= lt!322711 (select (store (arr!19673 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728530 (= lt!322709 (array!41108 (store (arr!19673 a!3186) i!1173 k!2102) (size!20094 a!3186)))))

(declare-fun b!728531 () Bool)

(declare-fun res!489043 () Bool)

(assert (=> b!728531 (=> (not res!489043) (not e!407813))))

(declare-datatypes ((List!13675 0))(
  ( (Nil!13672) (Cons!13671 (h!14731 (_ BitVec 64)) (t!19990 List!13675)) )
))
(declare-fun arrayNoDuplicates!0 (array!41107 (_ BitVec 32) List!13675) Bool)

(assert (=> b!728531 (= res!489043 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13672))))

(declare-fun b!728532 () Bool)

(declare-fun res!489038 () Bool)

(assert (=> b!728532 (=> (not res!489038) (not e!407808))))

(declare-fun arrayContainsKey!0 (array!41107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728532 (= res!489038 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728533 () Bool)

(assert (=> b!728533 (= e!407809 (not e!407810))))

(declare-fun res!489044 () Bool)

(assert (=> b!728533 (=> res!489044 e!407810)))

(assert (=> b!728533 (= res!489044 (or (not (is-Intermediate!7273 lt!322705)) (bvsge x!1131 (x!62447 lt!322705))))))

(assert (=> b!728533 e!407807))

(declare-fun res!489032 () Bool)

(assert (=> b!728533 (=> (not res!489032) (not e!407807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41107 (_ BitVec 32)) Bool)

(assert (=> b!728533 (= res!489032 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24864 0))(
  ( (Unit!24865) )
))
(declare-fun lt!322706 () Unit!24864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24864)

(assert (=> b!728533 (= lt!322706 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728535 () Bool)

(declare-fun res!489037 () Bool)

(assert (=> b!728535 (=> (not res!489037) (not e!407805))))

(assert (=> b!728535 (= res!489037 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19673 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728536 () Bool)

(declare-fun res!489033 () Bool)

(assert (=> b!728536 (=> (not res!489033) (not e!407808))))

(assert (=> b!728536 (= res!489033 (and (= (size!20094 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20094 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20094 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728537 () Bool)

(declare-fun e!407811 () Bool)

(assert (=> b!728537 (= e!407811 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19673 a!3186) j!159) a!3186 mask!3328) lt!322708))))

(declare-fun b!728538 () Bool)

(declare-fun res!489041 () Bool)

(assert (=> b!728538 (=> (not res!489041) (not e!407808))))

(assert (=> b!728538 (= res!489041 (validKeyInArray!0 (select (arr!19673 a!3186) j!159)))))

(declare-fun b!728539 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41107 (_ BitVec 32)) SeekEntryResult!7273)

(assert (=> b!728539 (= e!407811 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19673 a!3186) j!159) a!3186 mask!3328) (Found!7273 j!159)))))

(declare-fun res!489034 () Bool)

(assert (=> start!64658 (=> (not res!489034) (not e!407808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64658 (= res!489034 (validMask!0 mask!3328))))

(assert (=> start!64658 e!407808))

(assert (=> start!64658 true))

(declare-fun array_inv!15469 (array!41107) Bool)

(assert (=> start!64658 (array_inv!15469 a!3186)))

(declare-fun b!728534 () Bool)

(declare-fun res!489029 () Bool)

(assert (=> b!728534 (=> (not res!489029) (not e!407805))))

(assert (=> b!728534 (= res!489029 e!407811)))

(declare-fun c!80122 () Bool)

(assert (=> b!728534 (= c!80122 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728540 () Bool)

(assert (=> b!728540 (= e!407812 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19673 a!3186) j!159) a!3186 mask!3328) lt!322707))))

(declare-fun b!728541 () Bool)

(declare-fun res!489042 () Bool)

(assert (=> b!728541 (=> (not res!489042) (not e!407813))))

(assert (=> b!728541 (= res!489042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64658 res!489034) b!728536))

(assert (= (and b!728536 res!489033) b!728538))

(assert (= (and b!728538 res!489041) b!728527))

(assert (= (and b!728527 res!489039) b!728532))

(assert (= (and b!728532 res!489038) b!728526))

(assert (= (and b!728526 res!489030) b!728541))

(assert (= (and b!728541 res!489042) b!728531))

(assert (= (and b!728531 res!489043) b!728528))

(assert (= (and b!728528 res!489040) b!728529))

(assert (= (and b!728529 res!489036) b!728535))

(assert (= (and b!728535 res!489037) b!728534))

(assert (= (and b!728534 c!80122) b!728537))

(assert (= (and b!728534 (not c!80122)) b!728539))

(assert (= (and b!728534 res!489029) b!728530))

(assert (= (and b!728530 res!489035) b!728533))

(assert (= (and b!728533 res!489032) b!728524))

(assert (= (and b!728524 res!489031) b!728540))

(assert (= (and b!728533 (not res!489044)) b!728525))

(declare-fun m!682267 () Bool)

(assert (=> b!728526 m!682267))

(declare-fun m!682269 () Bool)

(assert (=> b!728525 m!682269))

(declare-fun m!682271 () Bool)

(assert (=> b!728539 m!682271))

(assert (=> b!728539 m!682271))

(declare-fun m!682273 () Bool)

(assert (=> b!728539 m!682273))

(assert (=> b!728529 m!682271))

(assert (=> b!728529 m!682271))

(declare-fun m!682275 () Bool)

(assert (=> b!728529 m!682275))

(assert (=> b!728529 m!682275))

(assert (=> b!728529 m!682271))

(declare-fun m!682277 () Bool)

(assert (=> b!728529 m!682277))

(declare-fun m!682279 () Bool)

(assert (=> start!64658 m!682279))

(declare-fun m!682281 () Bool)

(assert (=> start!64658 m!682281))

(assert (=> b!728537 m!682271))

(assert (=> b!728537 m!682271))

(declare-fun m!682283 () Bool)

(assert (=> b!728537 m!682283))

(declare-fun m!682285 () Bool)

(assert (=> b!728530 m!682285))

(declare-fun m!682287 () Bool)

(assert (=> b!728530 m!682287))

(declare-fun m!682289 () Bool)

(assert (=> b!728530 m!682289))

(declare-fun m!682291 () Bool)

(assert (=> b!728530 m!682291))

(assert (=> b!728530 m!682289))

(declare-fun m!682293 () Bool)

(assert (=> b!728530 m!682293))

(declare-fun m!682295 () Bool)

(assert (=> b!728531 m!682295))

(assert (=> b!728524 m!682271))

(assert (=> b!728524 m!682271))

(declare-fun m!682297 () Bool)

(assert (=> b!728524 m!682297))

(assert (=> b!728538 m!682271))

(assert (=> b!728538 m!682271))

(declare-fun m!682299 () Bool)

(assert (=> b!728538 m!682299))

(declare-fun m!682301 () Bool)

(assert (=> b!728533 m!682301))

(declare-fun m!682303 () Bool)

(assert (=> b!728533 m!682303))

(declare-fun m!682305 () Bool)

(assert (=> b!728535 m!682305))

(assert (=> b!728540 m!682271))

(assert (=> b!728540 m!682271))

(declare-fun m!682307 () Bool)

(assert (=> b!728540 m!682307))

(declare-fun m!682309 () Bool)

(assert (=> b!728541 m!682309))

(declare-fun m!682311 () Bool)

(assert (=> b!728527 m!682311))

(declare-fun m!682313 () Bool)

(assert (=> b!728532 m!682313))

(push 1)

