; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65184 () Bool)

(assert start!65184)

(declare-fun b!737404 () Bool)

(declare-fun res!495664 () Bool)

(declare-fun e!412465 () Bool)

(assert (=> b!737404 (=> res!495664 e!412465)))

(declare-fun e!412456 () Bool)

(assert (=> b!737404 (= res!495664 e!412456)))

(declare-fun c!81259 () Bool)

(declare-fun lt!327173 () Bool)

(assert (=> b!737404 (= c!81259 lt!327173)))

(declare-fun b!737405 () Bool)

(assert (=> b!737405 (= e!412465 true)))

(declare-fun lt!327166 () (_ BitVec 64))

(declare-fun lt!327163 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41357 0))(
  ( (array!41358 (arr!19792 (Array (_ BitVec 32) (_ BitVec 64))) (size!20213 (_ BitVec 32))) )
))
(declare-fun lt!327164 () array!41357)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7392 0))(
  ( (MissingZero!7392 (index!31936 (_ BitVec 32))) (Found!7392 (index!31937 (_ BitVec 32))) (Intermediate!7392 (undefined!8204 Bool) (index!31938 (_ BitVec 32)) (x!62934 (_ BitVec 32))) (Undefined!7392) (MissingVacant!7392 (index!31939 (_ BitVec 32))) )
))
(declare-fun lt!327162 () SeekEntryResult!7392)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41357 (_ BitVec 32)) SeekEntryResult!7392)

(assert (=> b!737405 (= lt!327162 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327163 lt!327166 lt!327164 mask!3328))))

(declare-fun b!737406 () Bool)

(declare-fun e!412464 () Bool)

(assert (=> b!737406 (= e!412464 e!412465)))

(declare-fun res!495665 () Bool)

(assert (=> b!737406 (=> res!495665 e!412465)))

(declare-fun a!3186 () array!41357)

(assert (=> b!737406 (= res!495665 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327163 #b00000000000000000000000000000000) (bvsge lt!327163 (size!20213 a!3186))))))

(declare-datatypes ((Unit!25164 0))(
  ( (Unit!25165) )
))
(declare-fun lt!327161 () Unit!25164)

(declare-fun e!412462 () Unit!25164)

(assert (=> b!737406 (= lt!327161 e!412462)))

(declare-fun c!81257 () Bool)

(assert (=> b!737406 (= c!81257 lt!327173)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737406 (= lt!327173 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737406 (= lt!327163 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737407 () Bool)

(declare-fun e!412455 () Bool)

(declare-fun e!412459 () Bool)

(assert (=> b!737407 (= e!412455 e!412459)))

(declare-fun res!495657 () Bool)

(assert (=> b!737407 (=> (not res!495657) (not e!412459))))

(declare-fun lt!327168 () SeekEntryResult!7392)

(declare-fun lt!327169 () SeekEntryResult!7392)

(assert (=> b!737407 (= res!495657 (= lt!327168 lt!327169))))

(assert (=> b!737407 (= lt!327169 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327166 lt!327164 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737407 (= lt!327168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327166 mask!3328) lt!327166 lt!327164 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!737407 (= lt!327166 (select (store (arr!19792 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737407 (= lt!327164 (array!41358 (store (arr!19792 a!3186) i!1173 k0!2102) (size!20213 a!3186)))))

(declare-fun b!737408 () Bool)

(declare-fun res!495666 () Bool)

(declare-fun e!412463 () Bool)

(assert (=> b!737408 (=> (not res!495666) (not e!412463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737408 (= res!495666 (validKeyInArray!0 k0!2102))))

(declare-fun b!737409 () Bool)

(declare-fun e!412457 () Bool)

(declare-fun e!412461 () Bool)

(assert (=> b!737409 (= e!412457 e!412461)))

(declare-fun res!495655 () Bool)

(assert (=> b!737409 (=> (not res!495655) (not e!412461))))

(declare-fun lt!327160 () SeekEntryResult!7392)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41357 (_ BitVec 32)) SeekEntryResult!7392)

(assert (=> b!737409 (= res!495655 (= (seekEntryOrOpen!0 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327160))))

(assert (=> b!737409 (= lt!327160 (Found!7392 j!159))))

(declare-fun b!737410 () Bool)

(declare-fun res!495652 () Bool)

(assert (=> b!737410 (=> (not res!495652) (not e!412463))))

(assert (=> b!737410 (= res!495652 (validKeyInArray!0 (select (arr!19792 a!3186) j!159)))))

(declare-fun b!737411 () Bool)

(declare-fun res!495654 () Bool)

(assert (=> b!737411 (=> (not res!495654) (not e!412463))))

(assert (=> b!737411 (= res!495654 (and (= (size!20213 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20213 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20213 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737412 () Bool)

(declare-fun res!495667 () Bool)

(declare-fun e!412460 () Bool)

(assert (=> b!737412 (=> (not res!495667) (not e!412460))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!737412 (= res!495667 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20213 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20213 a!3186))))))

(declare-fun b!737413 () Bool)

(declare-fun res!495668 () Bool)

(assert (=> b!737413 (=> (not res!495668) (not e!412460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41357 (_ BitVec 32)) Bool)

(assert (=> b!737413 (= res!495668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737414 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41357 (_ BitVec 32)) SeekEntryResult!7392)

(assert (=> b!737414 (= e!412461 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327160))))

(declare-fun b!737415 () Bool)

(assert (=> b!737415 (= e!412460 e!412455)))

(declare-fun res!495660 () Bool)

(assert (=> b!737415 (=> (not res!495660) (not e!412455))))

(declare-fun lt!327167 () SeekEntryResult!7392)

(assert (=> b!737415 (= res!495660 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19792 a!3186) j!159) mask!3328) (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327167))))

(assert (=> b!737415 (= lt!327167 (Intermediate!7392 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737416 () Bool)

(declare-fun Unit!25166 () Unit!25164)

(assert (=> b!737416 (= e!412462 Unit!25166)))

(assert (=> b!737416 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327163 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327167)))

(declare-fun b!737417 () Bool)

(declare-fun res!495662 () Bool)

(assert (=> b!737417 (=> (not res!495662) (not e!412455))))

(declare-fun e!412466 () Bool)

(assert (=> b!737417 (= res!495662 e!412466)))

(declare-fun c!81258 () Bool)

(assert (=> b!737417 (= c!81258 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!327171 () SeekEntryResult!7392)

(declare-fun b!737418 () Bool)

(assert (=> b!737418 (= e!412456 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327163 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327171)))))

(declare-fun b!737419 () Bool)

(assert (=> b!737419 (= e!412463 e!412460)))

(declare-fun res!495656 () Bool)

(assert (=> b!737419 (=> (not res!495656) (not e!412460))))

(declare-fun lt!327172 () SeekEntryResult!7392)

(assert (=> b!737419 (= res!495656 (or (= lt!327172 (MissingZero!7392 i!1173)) (= lt!327172 (MissingVacant!7392 i!1173))))))

(assert (=> b!737419 (= lt!327172 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!495663 () Bool)

(assert (=> start!65184 (=> (not res!495663) (not e!412463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65184 (= res!495663 (validMask!0 mask!3328))))

(assert (=> start!65184 e!412463))

(assert (=> start!65184 true))

(declare-fun array_inv!15588 (array!41357) Bool)

(assert (=> start!65184 (array_inv!15588 a!3186)))

(declare-fun b!737420 () Bool)

(assert (=> b!737420 (= e!412466 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327167))))

(declare-fun b!737421 () Bool)

(declare-fun res!495651 () Bool)

(assert (=> b!737421 (=> (not res!495651) (not e!412463))))

(declare-fun arrayContainsKey!0 (array!41357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737421 (= res!495651 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737422 () Bool)

(assert (=> b!737422 (= e!412466 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) (Found!7392 j!159)))))

(declare-fun b!737423 () Bool)

(declare-fun res!495659 () Bool)

(assert (=> b!737423 (=> (not res!495659) (not e!412455))))

(assert (=> b!737423 (= res!495659 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19792 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737424 () Bool)

(assert (=> b!737424 (= e!412459 (not e!412464))))

(declare-fun res!495658 () Bool)

(assert (=> b!737424 (=> res!495658 e!412464)))

(get-info :version)

(assert (=> b!737424 (= res!495658 (or (not ((_ is Intermediate!7392) lt!327169)) (bvsge x!1131 (x!62934 lt!327169))))))

(assert (=> b!737424 (= lt!327171 (Found!7392 j!159))))

(assert (=> b!737424 e!412457))

(declare-fun res!495661 () Bool)

(assert (=> b!737424 (=> (not res!495661) (not e!412457))))

(assert (=> b!737424 (= res!495661 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327170 () Unit!25164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25164)

(assert (=> b!737424 (= lt!327170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737425 () Bool)

(declare-fun Unit!25167 () Unit!25164)

(assert (=> b!737425 (= e!412462 Unit!25167)))

(declare-fun lt!327165 () SeekEntryResult!7392)

(assert (=> b!737425 (= lt!327165 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737425 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327163 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327171)))

(declare-fun b!737426 () Bool)

(assert (=> b!737426 (= e!412456 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327163 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327167)))))

(declare-fun b!737427 () Bool)

(declare-fun res!495653 () Bool)

(assert (=> b!737427 (=> (not res!495653) (not e!412460))))

(declare-datatypes ((List!13794 0))(
  ( (Nil!13791) (Cons!13790 (h!14862 (_ BitVec 64)) (t!20109 List!13794)) )
))
(declare-fun arrayNoDuplicates!0 (array!41357 (_ BitVec 32) List!13794) Bool)

(assert (=> b!737427 (= res!495653 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13791))))

(assert (= (and start!65184 res!495663) b!737411))

(assert (= (and b!737411 res!495654) b!737410))

(assert (= (and b!737410 res!495652) b!737408))

(assert (= (and b!737408 res!495666) b!737421))

(assert (= (and b!737421 res!495651) b!737419))

(assert (= (and b!737419 res!495656) b!737413))

(assert (= (and b!737413 res!495668) b!737427))

(assert (= (and b!737427 res!495653) b!737412))

(assert (= (and b!737412 res!495667) b!737415))

(assert (= (and b!737415 res!495660) b!737423))

(assert (= (and b!737423 res!495659) b!737417))

(assert (= (and b!737417 c!81258) b!737420))

(assert (= (and b!737417 (not c!81258)) b!737422))

(assert (= (and b!737417 res!495662) b!737407))

(assert (= (and b!737407 res!495657) b!737424))

(assert (= (and b!737424 res!495661) b!737409))

(assert (= (and b!737409 res!495655) b!737414))

(assert (= (and b!737424 (not res!495658)) b!737406))

(assert (= (and b!737406 c!81257) b!737416))

(assert (= (and b!737406 (not c!81257)) b!737425))

(assert (= (and b!737406 (not res!495665)) b!737404))

(assert (= (and b!737404 c!81259) b!737426))

(assert (= (and b!737404 (not c!81259)) b!737418))

(assert (= (and b!737404 (not res!495664)) b!737405))

(declare-fun m!689293 () Bool)

(assert (=> b!737409 m!689293))

(assert (=> b!737409 m!689293))

(declare-fun m!689295 () Bool)

(assert (=> b!737409 m!689295))

(declare-fun m!689297 () Bool)

(assert (=> b!737424 m!689297))

(declare-fun m!689299 () Bool)

(assert (=> b!737424 m!689299))

(declare-fun m!689301 () Bool)

(assert (=> b!737421 m!689301))

(assert (=> b!737410 m!689293))

(assert (=> b!737410 m!689293))

(declare-fun m!689303 () Bool)

(assert (=> b!737410 m!689303))

(assert (=> b!737414 m!689293))

(assert (=> b!737414 m!689293))

(declare-fun m!689305 () Bool)

(assert (=> b!737414 m!689305))

(declare-fun m!689307 () Bool)

(assert (=> b!737413 m!689307))

(declare-fun m!689309 () Bool)

(assert (=> b!737427 m!689309))

(assert (=> b!737425 m!689293))

(assert (=> b!737425 m!689293))

(declare-fun m!689311 () Bool)

(assert (=> b!737425 m!689311))

(assert (=> b!737425 m!689293))

(declare-fun m!689313 () Bool)

(assert (=> b!737425 m!689313))

(declare-fun m!689315 () Bool)

(assert (=> b!737408 m!689315))

(assert (=> b!737420 m!689293))

(assert (=> b!737420 m!689293))

(declare-fun m!689317 () Bool)

(assert (=> b!737420 m!689317))

(declare-fun m!689319 () Bool)

(assert (=> b!737406 m!689319))

(assert (=> b!737416 m!689293))

(assert (=> b!737416 m!689293))

(declare-fun m!689321 () Bool)

(assert (=> b!737416 m!689321))

(declare-fun m!689323 () Bool)

(assert (=> b!737407 m!689323))

(declare-fun m!689325 () Bool)

(assert (=> b!737407 m!689325))

(declare-fun m!689327 () Bool)

(assert (=> b!737407 m!689327))

(assert (=> b!737407 m!689327))

(declare-fun m!689329 () Bool)

(assert (=> b!737407 m!689329))

(declare-fun m!689331 () Bool)

(assert (=> b!737407 m!689331))

(declare-fun m!689333 () Bool)

(assert (=> b!737405 m!689333))

(declare-fun m!689335 () Bool)

(assert (=> b!737423 m!689335))

(declare-fun m!689337 () Bool)

(assert (=> b!737419 m!689337))

(declare-fun m!689339 () Bool)

(assert (=> start!65184 m!689339))

(declare-fun m!689341 () Bool)

(assert (=> start!65184 m!689341))

(assert (=> b!737422 m!689293))

(assert (=> b!737422 m!689293))

(assert (=> b!737422 m!689311))

(assert (=> b!737426 m!689293))

(assert (=> b!737426 m!689293))

(assert (=> b!737426 m!689321))

(assert (=> b!737418 m!689293))

(assert (=> b!737418 m!689293))

(assert (=> b!737418 m!689313))

(assert (=> b!737415 m!689293))

(assert (=> b!737415 m!689293))

(declare-fun m!689343 () Bool)

(assert (=> b!737415 m!689343))

(assert (=> b!737415 m!689343))

(assert (=> b!737415 m!689293))

(declare-fun m!689345 () Bool)

(assert (=> b!737415 m!689345))

(check-sat (not b!737426) (not b!737424) (not b!737418) (not b!737419) (not b!737409) (not start!65184) (not b!737405) (not b!737421) (not b!737408) (not b!737407) (not b!737410) (not b!737413) (not b!737415) (not b!737416) (not b!737425) (not b!737427) (not b!737406) (not b!737422) (not b!737420) (not b!737414))
(check-sat)
