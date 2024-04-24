; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65316 () Bool)

(assert start!65316)

(declare-fun b!738293 () Bool)

(declare-fun res!496065 () Bool)

(declare-fun e!413011 () Bool)

(assert (=> b!738293 (=> (not res!496065) (not e!413011))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41359 0))(
  ( (array!41360 (arr!19789 (Array (_ BitVec 32) (_ BitVec 64))) (size!20209 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41359)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738293 (= res!496065 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20209 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20209 a!3186))))))

(declare-fun b!738294 () Bool)

(declare-fun e!413014 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7345 0))(
  ( (MissingZero!7345 (index!31748 (_ BitVec 32))) (Found!7345 (index!31749 (_ BitVec 32))) (Intermediate!7345 (undefined!8157 Bool) (index!31750 (_ BitVec 32)) (x!62907 (_ BitVec 32))) (Undefined!7345) (MissingVacant!7345 (index!31751 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41359 (_ BitVec 32)) SeekEntryResult!7345)

(assert (=> b!738294 (= e!413014 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) (Found!7345 j!159)))))

(declare-fun b!738295 () Bool)

(declare-datatypes ((Unit!25153 0))(
  ( (Unit!25154) )
))
(declare-fun e!413010 () Unit!25153)

(declare-fun Unit!25155 () Unit!25153)

(assert (=> b!738295 (= e!413010 Unit!25155)))

(declare-fun lt!327566 () SeekEntryResult!7345)

(assert (=> b!738295 (= lt!327566 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327567 () (_ BitVec 32))

(declare-fun lt!327561 () SeekEntryResult!7345)

(assert (=> b!738295 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327567 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327561)))

(declare-fun b!738296 () Bool)

(declare-fun res!496072 () Bool)

(declare-fun e!413008 () Bool)

(assert (=> b!738296 (=> (not res!496072) (not e!413008))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738296 (= res!496072 (validKeyInArray!0 k0!2102))))

(declare-fun b!738297 () Bool)

(declare-fun e!413009 () Bool)

(assert (=> b!738297 (= e!413011 e!413009)))

(declare-fun res!496067 () Bool)

(assert (=> b!738297 (=> (not res!496067) (not e!413009))))

(declare-fun lt!327564 () SeekEntryResult!7345)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41359 (_ BitVec 32)) SeekEntryResult!7345)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738297 (= res!496067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19789 a!3186) j!159) mask!3328) (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327564))))

(assert (=> b!738297 (= lt!327564 (Intermediate!7345 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738298 () Bool)

(declare-fun res!496078 () Bool)

(declare-fun e!413012 () Bool)

(assert (=> b!738298 (=> res!496078 e!413012)))

(declare-fun e!413016 () Bool)

(assert (=> b!738298 (= res!496078 e!413016)))

(declare-fun c!81498 () Bool)

(declare-fun lt!327569 () Bool)

(assert (=> b!738298 (= c!81498 lt!327569)))

(declare-fun b!738299 () Bool)

(assert (=> b!738299 (= e!413016 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327567 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327561)))))

(declare-fun b!738300 () Bool)

(declare-fun res!496076 () Bool)

(assert (=> b!738300 (=> (not res!496076) (not e!413008))))

(declare-fun arrayContainsKey!0 (array!41359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738300 (= res!496076 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738301 () Bool)

(assert (=> b!738301 (= e!413016 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327567 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327564)))))

(declare-fun b!738302 () Bool)

(assert (=> b!738302 (= e!413012 true)))

(declare-fun lt!327563 () SeekEntryResult!7345)

(declare-fun lt!327565 () array!41359)

(declare-fun lt!327568 () (_ BitVec 64))

(assert (=> b!738302 (= lt!327563 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327567 lt!327568 lt!327565 mask!3328))))

(declare-fun b!738303 () Bool)

(declare-fun e!413013 () Bool)

(declare-fun e!413006 () Bool)

(assert (=> b!738303 (= e!413013 (not e!413006))))

(declare-fun res!496074 () Bool)

(assert (=> b!738303 (=> res!496074 e!413006)))

(declare-fun lt!327559 () SeekEntryResult!7345)

(get-info :version)

(assert (=> b!738303 (= res!496074 (or (not ((_ is Intermediate!7345) lt!327559)) (bvsge x!1131 (x!62907 lt!327559))))))

(assert (=> b!738303 (= lt!327561 (Found!7345 j!159))))

(declare-fun e!413015 () Bool)

(assert (=> b!738303 e!413015))

(declare-fun res!496064 () Bool)

(assert (=> b!738303 (=> (not res!496064) (not e!413015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41359 (_ BitVec 32)) Bool)

(assert (=> b!738303 (= res!496064 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327560 () Unit!25153)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25153)

(assert (=> b!738303 (= lt!327560 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738304 () Bool)

(declare-fun res!496070 () Bool)

(assert (=> b!738304 (=> (not res!496070) (not e!413011))))

(assert (=> b!738304 (= res!496070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738305 () Bool)

(assert (=> b!738305 (= e!413008 e!413011)))

(declare-fun res!496081 () Bool)

(assert (=> b!738305 (=> (not res!496081) (not e!413011))))

(declare-fun lt!327558 () SeekEntryResult!7345)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738305 (= res!496081 (or (= lt!327558 (MissingZero!7345 i!1173)) (= lt!327558 (MissingVacant!7345 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41359 (_ BitVec 32)) SeekEntryResult!7345)

(assert (=> b!738305 (= lt!327558 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!413005 () Bool)

(declare-fun lt!327557 () SeekEntryResult!7345)

(declare-fun b!738306 () Bool)

(assert (=> b!738306 (= e!413005 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327557))))

(declare-fun b!738307 () Bool)

(assert (=> b!738307 (= e!413006 e!413012)))

(declare-fun res!496079 () Bool)

(assert (=> b!738307 (=> res!496079 e!413012)))

(assert (=> b!738307 (= res!496079 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327567 #b00000000000000000000000000000000) (bvsge lt!327567 (size!20209 a!3186))))))

(declare-fun lt!327570 () Unit!25153)

(assert (=> b!738307 (= lt!327570 e!413010)))

(declare-fun c!81500 () Bool)

(assert (=> b!738307 (= c!81500 lt!327569)))

(assert (=> b!738307 (= lt!327569 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738307 (= lt!327567 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun res!496066 () Bool)

(assert (=> start!65316 (=> (not res!496066) (not e!413008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65316 (= res!496066 (validMask!0 mask!3328))))

(assert (=> start!65316 e!413008))

(assert (=> start!65316 true))

(declare-fun array_inv!15648 (array!41359) Bool)

(assert (=> start!65316 (array_inv!15648 a!3186)))

(declare-fun b!738308 () Bool)

(declare-fun res!496080 () Bool)

(assert (=> b!738308 (=> (not res!496080) (not e!413009))))

(assert (=> b!738308 (= res!496080 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19789 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738309 () Bool)

(declare-fun res!496075 () Bool)

(assert (=> b!738309 (=> (not res!496075) (not e!413011))))

(declare-datatypes ((List!13698 0))(
  ( (Nil!13695) (Cons!13694 (h!14772 (_ BitVec 64)) (t!20005 List!13698)) )
))
(declare-fun arrayNoDuplicates!0 (array!41359 (_ BitVec 32) List!13698) Bool)

(assert (=> b!738309 (= res!496075 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13695))))

(declare-fun b!738310 () Bool)

(assert (=> b!738310 (= e!413015 e!413005)))

(declare-fun res!496068 () Bool)

(assert (=> b!738310 (=> (not res!496068) (not e!413005))))

(assert (=> b!738310 (= res!496068 (= (seekEntryOrOpen!0 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327557))))

(assert (=> b!738310 (= lt!327557 (Found!7345 j!159))))

(declare-fun b!738311 () Bool)

(declare-fun res!496069 () Bool)

(assert (=> b!738311 (=> (not res!496069) (not e!413009))))

(assert (=> b!738311 (= res!496069 e!413014)))

(declare-fun c!81499 () Bool)

(assert (=> b!738311 (= c!81499 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738312 () Bool)

(declare-fun res!496073 () Bool)

(assert (=> b!738312 (=> (not res!496073) (not e!413008))))

(assert (=> b!738312 (= res!496073 (and (= (size!20209 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20209 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20209 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738313 () Bool)

(assert (=> b!738313 (= e!413014 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327564))))

(declare-fun b!738314 () Bool)

(declare-fun res!496077 () Bool)

(assert (=> b!738314 (=> (not res!496077) (not e!413008))))

(assert (=> b!738314 (= res!496077 (validKeyInArray!0 (select (arr!19789 a!3186) j!159)))))

(declare-fun b!738315 () Bool)

(assert (=> b!738315 (= e!413009 e!413013)))

(declare-fun res!496071 () Bool)

(assert (=> b!738315 (=> (not res!496071) (not e!413013))))

(declare-fun lt!327562 () SeekEntryResult!7345)

(assert (=> b!738315 (= res!496071 (= lt!327562 lt!327559))))

(assert (=> b!738315 (= lt!327559 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327568 lt!327565 mask!3328))))

(assert (=> b!738315 (= lt!327562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327568 mask!3328) lt!327568 lt!327565 mask!3328))))

(assert (=> b!738315 (= lt!327568 (select (store (arr!19789 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738315 (= lt!327565 (array!41360 (store (arr!19789 a!3186) i!1173 k0!2102) (size!20209 a!3186)))))

(declare-fun b!738316 () Bool)

(declare-fun Unit!25156 () Unit!25153)

(assert (=> b!738316 (= e!413010 Unit!25156)))

(assert (=> b!738316 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327567 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327564)))

(assert (= (and start!65316 res!496066) b!738312))

(assert (= (and b!738312 res!496073) b!738314))

(assert (= (and b!738314 res!496077) b!738296))

(assert (= (and b!738296 res!496072) b!738300))

(assert (= (and b!738300 res!496076) b!738305))

(assert (= (and b!738305 res!496081) b!738304))

(assert (= (and b!738304 res!496070) b!738309))

(assert (= (and b!738309 res!496075) b!738293))

(assert (= (and b!738293 res!496065) b!738297))

(assert (= (and b!738297 res!496067) b!738308))

(assert (= (and b!738308 res!496080) b!738311))

(assert (= (and b!738311 c!81499) b!738313))

(assert (= (and b!738311 (not c!81499)) b!738294))

(assert (= (and b!738311 res!496069) b!738315))

(assert (= (and b!738315 res!496071) b!738303))

(assert (= (and b!738303 res!496064) b!738310))

(assert (= (and b!738310 res!496068) b!738306))

(assert (= (and b!738303 (not res!496074)) b!738307))

(assert (= (and b!738307 c!81500) b!738316))

(assert (= (and b!738307 (not c!81500)) b!738295))

(assert (= (and b!738307 (not res!496079)) b!738298))

(assert (= (and b!738298 c!81498) b!738301))

(assert (= (and b!738298 (not c!81498)) b!738299))

(assert (= (and b!738298 (not res!496078)) b!738302))

(declare-fun m!690561 () Bool)

(assert (=> b!738315 m!690561))

(declare-fun m!690563 () Bool)

(assert (=> b!738315 m!690563))

(declare-fun m!690565 () Bool)

(assert (=> b!738315 m!690565))

(declare-fun m!690567 () Bool)

(assert (=> b!738315 m!690567))

(assert (=> b!738315 m!690565))

(declare-fun m!690569 () Bool)

(assert (=> b!738315 m!690569))

(declare-fun m!690571 () Bool)

(assert (=> b!738304 m!690571))

(declare-fun m!690573 () Bool)

(assert (=> b!738309 m!690573))

(declare-fun m!690575 () Bool)

(assert (=> b!738307 m!690575))

(declare-fun m!690577 () Bool)

(assert (=> b!738313 m!690577))

(assert (=> b!738313 m!690577))

(declare-fun m!690579 () Bool)

(assert (=> b!738313 m!690579))

(declare-fun m!690581 () Bool)

(assert (=> b!738308 m!690581))

(assert (=> b!738310 m!690577))

(assert (=> b!738310 m!690577))

(declare-fun m!690583 () Bool)

(assert (=> b!738310 m!690583))

(declare-fun m!690585 () Bool)

(assert (=> b!738302 m!690585))

(declare-fun m!690587 () Bool)

(assert (=> b!738300 m!690587))

(assert (=> b!738306 m!690577))

(assert (=> b!738306 m!690577))

(declare-fun m!690589 () Bool)

(assert (=> b!738306 m!690589))

(declare-fun m!690591 () Bool)

(assert (=> b!738303 m!690591))

(declare-fun m!690593 () Bool)

(assert (=> b!738303 m!690593))

(declare-fun m!690595 () Bool)

(assert (=> b!738296 m!690595))

(assert (=> b!738295 m!690577))

(assert (=> b!738295 m!690577))

(declare-fun m!690597 () Bool)

(assert (=> b!738295 m!690597))

(assert (=> b!738295 m!690577))

(declare-fun m!690599 () Bool)

(assert (=> b!738295 m!690599))

(declare-fun m!690601 () Bool)

(assert (=> start!65316 m!690601))

(declare-fun m!690603 () Bool)

(assert (=> start!65316 m!690603))

(assert (=> b!738316 m!690577))

(assert (=> b!738316 m!690577))

(declare-fun m!690605 () Bool)

(assert (=> b!738316 m!690605))

(declare-fun m!690607 () Bool)

(assert (=> b!738305 m!690607))

(assert (=> b!738297 m!690577))

(assert (=> b!738297 m!690577))

(declare-fun m!690609 () Bool)

(assert (=> b!738297 m!690609))

(assert (=> b!738297 m!690609))

(assert (=> b!738297 m!690577))

(declare-fun m!690611 () Bool)

(assert (=> b!738297 m!690611))

(assert (=> b!738301 m!690577))

(assert (=> b!738301 m!690577))

(assert (=> b!738301 m!690605))

(assert (=> b!738299 m!690577))

(assert (=> b!738299 m!690577))

(assert (=> b!738299 m!690599))

(assert (=> b!738314 m!690577))

(assert (=> b!738314 m!690577))

(declare-fun m!690613 () Bool)

(assert (=> b!738314 m!690613))

(assert (=> b!738294 m!690577))

(assert (=> b!738294 m!690577))

(assert (=> b!738294 m!690597))

(check-sat (not b!738294) (not b!738310) (not start!65316) (not b!738315) (not b!738309) (not b!738296) (not b!738304) (not b!738300) (not b!738316) (not b!738307) (not b!738295) (not b!738297) (not b!738306) (not b!738313) (not b!738299) (not b!738303) (not b!738301) (not b!738302) (not b!738314) (not b!738305))
(check-sat)
