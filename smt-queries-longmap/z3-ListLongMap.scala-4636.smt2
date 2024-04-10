; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64518 () Bool)

(assert start!64518)

(declare-fun b!726293 () Bool)

(declare-fun res!487293 () Bool)

(declare-fun e!406664 () Bool)

(assert (=> b!726293 (=> (not res!487293) (not e!406664))))

(declare-datatypes ((array!41036 0))(
  ( (array!41037 (arr!19639 (Array (_ BitVec 32) (_ BitVec 64))) (size!20060 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41036)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!726293 (= res!487293 (and (= (size!20060 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20060 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20060 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726294 () Bool)

(declare-fun res!487298 () Bool)

(declare-fun e!406659 () Bool)

(assert (=> b!726294 (=> (not res!487298) (not e!406659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41036 (_ BitVec 32)) Bool)

(assert (=> b!726294 (= res!487298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726295 () Bool)

(declare-fun e!406661 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7239 0))(
  ( (MissingZero!7239 (index!31324 (_ BitVec 32))) (Found!7239 (index!31325 (_ BitVec 32))) (Intermediate!7239 (undefined!8051 Bool) (index!31326 (_ BitVec 32)) (x!62313 (_ BitVec 32))) (Undefined!7239) (MissingVacant!7239 (index!31327 (_ BitVec 32))) )
))
(declare-fun lt!321654 () SeekEntryResult!7239)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41036 (_ BitVec 32)) SeekEntryResult!7239)

(assert (=> b!726295 (= e!406661 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19639 a!3186) j!159) a!3186 mask!3328) lt!321654))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!406663 () Bool)

(declare-fun lt!321652 () SeekEntryResult!7239)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!726296 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41036 (_ BitVec 32)) SeekEntryResult!7239)

(assert (=> b!726296 (= e!406663 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19639 a!3186) j!159) a!3186 mask!3328) lt!321652))))

(declare-fun b!726297 () Bool)

(assert (=> b!726297 (= e!406661 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19639 a!3186) j!159) a!3186 mask!3328) (Found!7239 j!159)))))

(declare-fun b!726298 () Bool)

(declare-fun res!487304 () Bool)

(declare-fun e!406657 () Bool)

(assert (=> b!726298 (=> (not res!487304) (not e!406657))))

(assert (=> b!726298 (= res!487304 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19639 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726299 () Bool)

(declare-fun res!487307 () Bool)

(assert (=> b!726299 (=> (not res!487307) (not e!406664))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726299 (= res!487307 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726300 () Bool)

(declare-fun res!487299 () Bool)

(assert (=> b!726300 (=> (not res!487299) (not e!406657))))

(assert (=> b!726300 (= res!487299 e!406661)))

(declare-fun c!79873 () Bool)

(assert (=> b!726300 (= c!79873 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726301 () Bool)

(declare-fun res!487305 () Bool)

(assert (=> b!726301 (=> (not res!487305) (not e!406659))))

(declare-datatypes ((List!13641 0))(
  ( (Nil!13638) (Cons!13637 (h!14694 (_ BitVec 64)) (t!19956 List!13641)) )
))
(declare-fun arrayNoDuplicates!0 (array!41036 (_ BitVec 32) List!13641) Bool)

(assert (=> b!726301 (= res!487305 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13638))))

(declare-fun b!726302 () Bool)

(declare-fun e!406662 () Bool)

(assert (=> b!726302 (= e!406657 e!406662)))

(declare-fun res!487303 () Bool)

(assert (=> b!726302 (=> (not res!487303) (not e!406662))))

(declare-fun lt!321655 () SeekEntryResult!7239)

(declare-fun lt!321657 () SeekEntryResult!7239)

(assert (=> b!726302 (= res!487303 (= lt!321655 lt!321657))))

(declare-fun lt!321659 () (_ BitVec 64))

(declare-fun lt!321658 () array!41036)

(assert (=> b!726302 (= lt!321657 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321659 lt!321658 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726302 (= lt!321655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321659 mask!3328) lt!321659 lt!321658 mask!3328))))

(assert (=> b!726302 (= lt!321659 (select (store (arr!19639 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726302 (= lt!321658 (array!41037 (store (arr!19639 a!3186) i!1173 k0!2102) (size!20060 a!3186)))))

(declare-fun b!726303 () Bool)

(assert (=> b!726303 (= e!406664 e!406659)))

(declare-fun res!487294 () Bool)

(assert (=> b!726303 (=> (not res!487294) (not e!406659))))

(declare-fun lt!321656 () SeekEntryResult!7239)

(assert (=> b!726303 (= res!487294 (or (= lt!321656 (MissingZero!7239 i!1173)) (= lt!321656 (MissingVacant!7239 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41036 (_ BitVec 32)) SeekEntryResult!7239)

(assert (=> b!726303 (= lt!321656 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!487300 () Bool)

(assert (=> start!64518 (=> (not res!487300) (not e!406664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64518 (= res!487300 (validMask!0 mask!3328))))

(assert (=> start!64518 e!406664))

(assert (=> start!64518 true))

(declare-fun array_inv!15435 (array!41036) Bool)

(assert (=> start!64518 (array_inv!15435 a!3186)))

(declare-fun b!726304 () Bool)

(declare-fun res!487297 () Bool)

(assert (=> b!726304 (=> (not res!487297) (not e!406659))))

(assert (=> b!726304 (= res!487297 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20060 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20060 a!3186))))))

(declare-fun b!726305 () Bool)

(declare-fun res!487295 () Bool)

(assert (=> b!726305 (=> (not res!487295) (not e!406664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726305 (= res!487295 (validKeyInArray!0 k0!2102))))

(declare-fun b!726306 () Bool)

(declare-fun e!406660 () Bool)

(assert (=> b!726306 (= e!406660 e!406663)))

(declare-fun res!487296 () Bool)

(assert (=> b!726306 (=> (not res!487296) (not e!406663))))

(assert (=> b!726306 (= res!487296 (= (seekEntryOrOpen!0 (select (arr!19639 a!3186) j!159) a!3186 mask!3328) lt!321652))))

(assert (=> b!726306 (= lt!321652 (Found!7239 j!159))))

(declare-fun b!726307 () Bool)

(assert (=> b!726307 (= e!406659 e!406657)))

(declare-fun res!487306 () Bool)

(assert (=> b!726307 (=> (not res!487306) (not e!406657))))

(assert (=> b!726307 (= res!487306 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19639 a!3186) j!159) mask!3328) (select (arr!19639 a!3186) j!159) a!3186 mask!3328) lt!321654))))

(assert (=> b!726307 (= lt!321654 (Intermediate!7239 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726308 () Bool)

(get-info :version)

(assert (=> b!726308 (= e!406662 (not (or (not ((_ is Intermediate!7239) lt!321657)) (bvsge x!1131 (x!62313 lt!321657)) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(assert (=> b!726308 e!406660))

(declare-fun res!487301 () Bool)

(assert (=> b!726308 (=> (not res!487301) (not e!406660))))

(assert (=> b!726308 (= res!487301 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24796 0))(
  ( (Unit!24797) )
))
(declare-fun lt!321653 () Unit!24796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24796)

(assert (=> b!726308 (= lt!321653 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726309 () Bool)

(declare-fun res!487302 () Bool)

(assert (=> b!726309 (=> (not res!487302) (not e!406664))))

(assert (=> b!726309 (= res!487302 (validKeyInArray!0 (select (arr!19639 a!3186) j!159)))))

(assert (= (and start!64518 res!487300) b!726293))

(assert (= (and b!726293 res!487293) b!726309))

(assert (= (and b!726309 res!487302) b!726305))

(assert (= (and b!726305 res!487295) b!726299))

(assert (= (and b!726299 res!487307) b!726303))

(assert (= (and b!726303 res!487294) b!726294))

(assert (= (and b!726294 res!487298) b!726301))

(assert (= (and b!726301 res!487305) b!726304))

(assert (= (and b!726304 res!487297) b!726307))

(assert (= (and b!726307 res!487306) b!726298))

(assert (= (and b!726298 res!487304) b!726300))

(assert (= (and b!726300 c!79873) b!726295))

(assert (= (and b!726300 (not c!79873)) b!726297))

(assert (= (and b!726300 res!487299) b!726302))

(assert (= (and b!726302 res!487303) b!726308))

(assert (= (and b!726308 res!487301) b!726306))

(assert (= (and b!726306 res!487296) b!726296))

(declare-fun m!680369 () Bool)

(assert (=> b!726294 m!680369))

(declare-fun m!680371 () Bool)

(assert (=> b!726295 m!680371))

(assert (=> b!726295 m!680371))

(declare-fun m!680373 () Bool)

(assert (=> b!726295 m!680373))

(assert (=> b!726309 m!680371))

(assert (=> b!726309 m!680371))

(declare-fun m!680375 () Bool)

(assert (=> b!726309 m!680375))

(declare-fun m!680377 () Bool)

(assert (=> b!726299 m!680377))

(declare-fun m!680379 () Bool)

(assert (=> b!726301 m!680379))

(assert (=> b!726306 m!680371))

(assert (=> b!726306 m!680371))

(declare-fun m!680381 () Bool)

(assert (=> b!726306 m!680381))

(declare-fun m!680383 () Bool)

(assert (=> b!726302 m!680383))

(declare-fun m!680385 () Bool)

(assert (=> b!726302 m!680385))

(declare-fun m!680387 () Bool)

(assert (=> b!726302 m!680387))

(declare-fun m!680389 () Bool)

(assert (=> b!726302 m!680389))

(assert (=> b!726302 m!680383))

(declare-fun m!680391 () Bool)

(assert (=> b!726302 m!680391))

(declare-fun m!680393 () Bool)

(assert (=> start!64518 m!680393))

(declare-fun m!680395 () Bool)

(assert (=> start!64518 m!680395))

(declare-fun m!680397 () Bool)

(assert (=> b!726308 m!680397))

(declare-fun m!680399 () Bool)

(assert (=> b!726308 m!680399))

(declare-fun m!680401 () Bool)

(assert (=> b!726305 m!680401))

(declare-fun m!680403 () Bool)

(assert (=> b!726303 m!680403))

(assert (=> b!726297 m!680371))

(assert (=> b!726297 m!680371))

(declare-fun m!680405 () Bool)

(assert (=> b!726297 m!680405))

(assert (=> b!726296 m!680371))

(assert (=> b!726296 m!680371))

(declare-fun m!680407 () Bool)

(assert (=> b!726296 m!680407))

(assert (=> b!726307 m!680371))

(assert (=> b!726307 m!680371))

(declare-fun m!680409 () Bool)

(assert (=> b!726307 m!680409))

(assert (=> b!726307 m!680409))

(assert (=> b!726307 m!680371))

(declare-fun m!680411 () Bool)

(assert (=> b!726307 m!680411))

(declare-fun m!680413 () Bool)

(assert (=> b!726298 m!680413))

(check-sat (not b!726302) (not b!726303) (not b!726297) (not b!726301) (not b!726299) (not b!726294) (not b!726308) (not b!726295) (not start!64518) (not b!726296) (not b!726306) (not b!726307) (not b!726305) (not b!726309))
(check-sat)
