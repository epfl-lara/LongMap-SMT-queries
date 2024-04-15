; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64472 () Bool)

(assert start!64472)

(declare-fun b!725371 () Bool)

(declare-fun e!406187 () Bool)

(declare-fun e!406188 () Bool)

(assert (=> b!725371 (= e!406187 e!406188)))

(declare-fun res!486592 () Bool)

(assert (=> b!725371 (=> (not res!486592) (not e!406188))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321170 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41007 0))(
  ( (array!41008 (arr!19625 (Array (_ BitVec 32) (_ BitVec 64))) (size!20046 (_ BitVec 32))) )
))
(declare-fun lt!321168 () array!41007)

(declare-datatypes ((SeekEntryResult!7222 0))(
  ( (MissingZero!7222 (index!31256 (_ BitVec 32))) (Found!7222 (index!31257 (_ BitVec 32))) (Intermediate!7222 (undefined!8034 Bool) (index!31258 (_ BitVec 32)) (x!62259 (_ BitVec 32))) (Undefined!7222) (MissingVacant!7222 (index!31259 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41007 (_ BitVec 32)) SeekEntryResult!7222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725371 (= res!486592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321170 mask!3328) lt!321170 lt!321168 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321170 lt!321168 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!41007)

(assert (=> b!725371 (= lt!321170 (select (store (arr!19625 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725371 (= lt!321168 (array!41008 (store (arr!19625 a!3186) i!1173 k0!2102) (size!20046 a!3186)))))

(declare-fun b!725372 () Bool)

(assert (=> b!725372 (= e!406188 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!406183 () Bool)

(assert (=> b!725372 e!406183))

(declare-fun res!486600 () Bool)

(assert (=> b!725372 (=> (not res!486600) (not e!406183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41007 (_ BitVec 32)) Bool)

(assert (=> b!725372 (= res!486600 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24734 0))(
  ( (Unit!24735) )
))
(declare-fun lt!321169 () Unit!24734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24734)

(assert (=> b!725372 (= lt!321169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725374 () Bool)

(declare-fun e!406182 () Bool)

(declare-fun e!406185 () Bool)

(assert (=> b!725374 (= e!406182 e!406185)))

(declare-fun res!486591 () Bool)

(assert (=> b!725374 (=> (not res!486591) (not e!406185))))

(declare-fun lt!321173 () SeekEntryResult!7222)

(assert (=> b!725374 (= res!486591 (or (= lt!321173 (MissingZero!7222 i!1173)) (= lt!321173 (MissingVacant!7222 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41007 (_ BitVec 32)) SeekEntryResult!7222)

(assert (=> b!725374 (= lt!321173 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725375 () Bool)

(declare-fun res!486599 () Bool)

(assert (=> b!725375 (=> (not res!486599) (not e!406187))))

(declare-fun e!406189 () Bool)

(assert (=> b!725375 (= res!486599 e!406189)))

(declare-fun c!79764 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725375 (= c!79764 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725376 () Bool)

(declare-fun e!406184 () Bool)

(assert (=> b!725376 (= e!406183 e!406184)))

(declare-fun res!486601 () Bool)

(assert (=> b!725376 (=> (not res!486601) (not e!406184))))

(declare-fun lt!321171 () SeekEntryResult!7222)

(assert (=> b!725376 (= res!486601 (= (seekEntryOrOpen!0 (select (arr!19625 a!3186) j!159) a!3186 mask!3328) lt!321171))))

(assert (=> b!725376 (= lt!321171 (Found!7222 j!159))))

(declare-fun b!725377 () Bool)

(declare-fun res!486597 () Bool)

(assert (=> b!725377 (=> (not res!486597) (not e!406185))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725377 (= res!486597 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20046 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20046 a!3186))))))

(declare-fun b!725378 () Bool)

(declare-fun res!486602 () Bool)

(assert (=> b!725378 (=> (not res!486602) (not e!406182))))

(assert (=> b!725378 (= res!486602 (and (= (size!20046 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20046 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20046 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725379 () Bool)

(assert (=> b!725379 (= e!406185 e!406187)))

(declare-fun res!486594 () Bool)

(assert (=> b!725379 (=> (not res!486594) (not e!406187))))

(declare-fun lt!321172 () SeekEntryResult!7222)

(assert (=> b!725379 (= res!486594 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19625 a!3186) j!159) mask!3328) (select (arr!19625 a!3186) j!159) a!3186 mask!3328) lt!321172))))

(assert (=> b!725379 (= lt!321172 (Intermediate!7222 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725380 () Bool)

(declare-fun res!486595 () Bool)

(assert (=> b!725380 (=> (not res!486595) (not e!406182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725380 (= res!486595 (validKeyInArray!0 (select (arr!19625 a!3186) j!159)))))

(declare-fun b!725381 () Bool)

(declare-fun res!486596 () Bool)

(assert (=> b!725381 (=> (not res!486596) (not e!406182))))

(declare-fun arrayContainsKey!0 (array!41007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725381 (= res!486596 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725382 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41007 (_ BitVec 32)) SeekEntryResult!7222)

(assert (=> b!725382 (= e!406189 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19625 a!3186) j!159) a!3186 mask!3328) (Found!7222 j!159)))))

(declare-fun b!725373 () Bool)

(declare-fun res!486593 () Bool)

(assert (=> b!725373 (=> (not res!486593) (not e!406185))))

(declare-datatypes ((List!13666 0))(
  ( (Nil!13663) (Cons!13662 (h!14719 (_ BitVec 64)) (t!19972 List!13666)) )
))
(declare-fun arrayNoDuplicates!0 (array!41007 (_ BitVec 32) List!13666) Bool)

(assert (=> b!725373 (= res!486593 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13663))))

(declare-fun res!486589 () Bool)

(assert (=> start!64472 (=> (not res!486589) (not e!406182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64472 (= res!486589 (validMask!0 mask!3328))))

(assert (=> start!64472 e!406182))

(assert (=> start!64472 true))

(declare-fun array_inv!15508 (array!41007) Bool)

(assert (=> start!64472 (array_inv!15508 a!3186)))

(declare-fun b!725383 () Bool)

(declare-fun res!486603 () Bool)

(assert (=> b!725383 (=> (not res!486603) (not e!406185))))

(assert (=> b!725383 (= res!486603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725384 () Bool)

(assert (=> b!725384 (= e!406184 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19625 a!3186) j!159) a!3186 mask!3328) lt!321171))))

(declare-fun b!725385 () Bool)

(declare-fun res!486598 () Bool)

(assert (=> b!725385 (=> (not res!486598) (not e!406182))))

(assert (=> b!725385 (= res!486598 (validKeyInArray!0 k0!2102))))

(declare-fun b!725386 () Bool)

(assert (=> b!725386 (= e!406189 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19625 a!3186) j!159) a!3186 mask!3328) lt!321172))))

(declare-fun b!725387 () Bool)

(declare-fun res!486590 () Bool)

(assert (=> b!725387 (=> (not res!486590) (not e!406187))))

(assert (=> b!725387 (= res!486590 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19625 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64472 res!486589) b!725378))

(assert (= (and b!725378 res!486602) b!725380))

(assert (= (and b!725380 res!486595) b!725385))

(assert (= (and b!725385 res!486598) b!725381))

(assert (= (and b!725381 res!486596) b!725374))

(assert (= (and b!725374 res!486591) b!725383))

(assert (= (and b!725383 res!486603) b!725373))

(assert (= (and b!725373 res!486593) b!725377))

(assert (= (and b!725377 res!486597) b!725379))

(assert (= (and b!725379 res!486594) b!725387))

(assert (= (and b!725387 res!486590) b!725375))

(assert (= (and b!725375 c!79764) b!725386))

(assert (= (and b!725375 (not c!79764)) b!725382))

(assert (= (and b!725375 res!486599) b!725371))

(assert (= (and b!725371 res!486592) b!725372))

(assert (= (and b!725372 res!486600) b!725376))

(assert (= (and b!725376 res!486601) b!725384))

(declare-fun m!679007 () Bool)

(assert (=> b!725381 m!679007))

(declare-fun m!679009 () Bool)

(assert (=> b!725382 m!679009))

(assert (=> b!725382 m!679009))

(declare-fun m!679011 () Bool)

(assert (=> b!725382 m!679011))

(declare-fun m!679013 () Bool)

(assert (=> b!725374 m!679013))

(declare-fun m!679015 () Bool)

(assert (=> b!725373 m!679015))

(declare-fun m!679017 () Bool)

(assert (=> b!725385 m!679017))

(declare-fun m!679019 () Bool)

(assert (=> start!64472 m!679019))

(declare-fun m!679021 () Bool)

(assert (=> start!64472 m!679021))

(assert (=> b!725386 m!679009))

(assert (=> b!725386 m!679009))

(declare-fun m!679023 () Bool)

(assert (=> b!725386 m!679023))

(declare-fun m!679025 () Bool)

(assert (=> b!725387 m!679025))

(assert (=> b!725384 m!679009))

(assert (=> b!725384 m!679009))

(declare-fun m!679027 () Bool)

(assert (=> b!725384 m!679027))

(assert (=> b!725379 m!679009))

(assert (=> b!725379 m!679009))

(declare-fun m!679029 () Bool)

(assert (=> b!725379 m!679029))

(assert (=> b!725379 m!679029))

(assert (=> b!725379 m!679009))

(declare-fun m!679031 () Bool)

(assert (=> b!725379 m!679031))

(declare-fun m!679033 () Bool)

(assert (=> b!725371 m!679033))

(declare-fun m!679035 () Bool)

(assert (=> b!725371 m!679035))

(declare-fun m!679037 () Bool)

(assert (=> b!725371 m!679037))

(declare-fun m!679039 () Bool)

(assert (=> b!725371 m!679039))

(assert (=> b!725371 m!679033))

(declare-fun m!679041 () Bool)

(assert (=> b!725371 m!679041))

(declare-fun m!679043 () Bool)

(assert (=> b!725372 m!679043))

(declare-fun m!679045 () Bool)

(assert (=> b!725372 m!679045))

(declare-fun m!679047 () Bool)

(assert (=> b!725383 m!679047))

(assert (=> b!725376 m!679009))

(assert (=> b!725376 m!679009))

(declare-fun m!679049 () Bool)

(assert (=> b!725376 m!679049))

(assert (=> b!725380 m!679009))

(assert (=> b!725380 m!679009))

(declare-fun m!679051 () Bool)

(assert (=> b!725380 m!679051))

(check-sat (not b!725382) (not b!725380) (not b!725384) (not start!64472) (not b!725385) (not b!725383) (not b!725376) (not b!725372) (not b!725381) (not b!725374) (not b!725373) (not b!725386) (not b!725371) (not b!725379))
(check-sat)
