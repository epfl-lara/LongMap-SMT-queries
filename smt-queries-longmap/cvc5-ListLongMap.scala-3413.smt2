; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47400 () Bool)

(assert start!47400)

(declare-fun b!521368 () Bool)

(declare-fun e!304184 () Bool)

(assert (=> b!521368 (= e!304184 true)))

(declare-datatypes ((array!33226 0))(
  ( (array!33227 (arr!15969 (Array (_ BitVec 32) (_ BitVec 64))) (size!16333 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33226)

(declare-datatypes ((SeekEntryResult!4436 0))(
  ( (MissingZero!4436 (index!19947 (_ BitVec 32))) (Found!4436 (index!19948 (_ BitVec 32))) (Intermediate!4436 (undefined!5248 Bool) (index!19949 (_ BitVec 32)) (x!48934 (_ BitVec 32))) (Undefined!4436) (MissingVacant!4436 (index!19950 (_ BitVec 32))) )
))
(declare-fun lt!238916 () SeekEntryResult!4436)

(assert (=> b!521368 (and (or (= (select (arr!15969 a!3235) (index!19949 lt!238916)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15969 a!3235) (index!19949 lt!238916)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15969 a!3235) (index!19949 lt!238916)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15969 a!3235) (index!19949 lt!238916)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16196 0))(
  ( (Unit!16197) )
))
(declare-fun lt!238917 () Unit!16196)

(declare-fun e!304185 () Unit!16196)

(assert (=> b!521368 (= lt!238917 e!304185)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61397 () Bool)

(assert (=> b!521368 (= c!61397 (= (select (arr!15969 a!3235) (index!19949 lt!238916)) (select (arr!15969 a!3235) j!176)))))

(assert (=> b!521368 (and (bvslt (x!48934 lt!238916) #b01111111111111111111111111111110) (or (= (select (arr!15969 a!3235) (index!19949 lt!238916)) (select (arr!15969 a!3235) j!176)) (= (select (arr!15969 a!3235) (index!19949 lt!238916)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15969 a!3235) (index!19949 lt!238916)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521369 () Bool)

(declare-fun e!304182 () Bool)

(declare-fun e!304181 () Bool)

(assert (=> b!521369 (= e!304182 e!304181)))

(declare-fun res!319177 () Bool)

(assert (=> b!521369 (=> (not res!319177) (not e!304181))))

(declare-fun lt!238920 () SeekEntryResult!4436)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521369 (= res!319177 (or (= lt!238920 (MissingZero!4436 i!1204)) (= lt!238920 (MissingVacant!4436 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33226 (_ BitVec 32)) SeekEntryResult!4436)

(assert (=> b!521369 (= lt!238920 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!319178 () Bool)

(assert (=> start!47400 (=> (not res!319178) (not e!304182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47400 (= res!319178 (validMask!0 mask!3524))))

(assert (=> start!47400 e!304182))

(assert (=> start!47400 true))

(declare-fun array_inv!11765 (array!33226) Bool)

(assert (=> start!47400 (array_inv!11765 a!3235)))

(declare-fun b!521370 () Bool)

(declare-fun e!304179 () Bool)

(assert (=> b!521370 (= e!304179 false)))

(declare-fun b!521371 () Bool)

(declare-fun res!319187 () Bool)

(assert (=> b!521371 (=> res!319187 e!304184)))

(assert (=> b!521371 (= res!319187 (or (undefined!5248 lt!238916) (not (is-Intermediate!4436 lt!238916))))))

(declare-fun b!521372 () Bool)

(declare-fun res!319182 () Bool)

(assert (=> b!521372 (=> (not res!319182) (not e!304182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521372 (= res!319182 (validKeyInArray!0 k!2280))))

(declare-fun e!304180 () Bool)

(declare-fun b!521373 () Bool)

(assert (=> b!521373 (= e!304180 (= (seekEntryOrOpen!0 (select (arr!15969 a!3235) j!176) a!3235 mask!3524) (Found!4436 j!176)))))

(declare-fun b!521374 () Bool)

(declare-fun res!319184 () Bool)

(assert (=> b!521374 (=> (not res!319184) (not e!304182))))

(assert (=> b!521374 (= res!319184 (and (= (size!16333 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16333 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16333 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521375 () Bool)

(declare-fun res!319179 () Bool)

(assert (=> b!521375 (=> (not res!319179) (not e!304181))))

(declare-datatypes ((List!10127 0))(
  ( (Nil!10124) (Cons!10123 (h!11045 (_ BitVec 64)) (t!16355 List!10127)) )
))
(declare-fun arrayNoDuplicates!0 (array!33226 (_ BitVec 32) List!10127) Bool)

(assert (=> b!521375 (= res!319179 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10124))))

(declare-fun b!521376 () Bool)

(declare-fun res!319180 () Bool)

(assert (=> b!521376 (=> (not res!319180) (not e!304182))))

(declare-fun arrayContainsKey!0 (array!33226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521376 (= res!319180 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521377 () Bool)

(declare-fun res!319185 () Bool)

(assert (=> b!521377 (=> (not res!319185) (not e!304181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33226 (_ BitVec 32)) Bool)

(assert (=> b!521377 (= res!319185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521378 () Bool)

(declare-fun Unit!16198 () Unit!16196)

(assert (=> b!521378 (= e!304185 Unit!16198)))

(declare-fun lt!238921 () Unit!16196)

(declare-fun lt!238914 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33226 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16196)

(assert (=> b!521378 (= lt!238921 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238914 #b00000000000000000000000000000000 (index!19949 lt!238916) (x!48934 lt!238916) mask!3524))))

(declare-fun lt!238919 () array!33226)

(declare-fun res!319183 () Bool)

(declare-fun lt!238915 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33226 (_ BitVec 32)) SeekEntryResult!4436)

(assert (=> b!521378 (= res!319183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238914 lt!238915 lt!238919 mask!3524) (Intermediate!4436 false (index!19949 lt!238916) (x!48934 lt!238916))))))

(assert (=> b!521378 (=> (not res!319183) (not e!304179))))

(assert (=> b!521378 e!304179))

(declare-fun b!521379 () Bool)

(declare-fun Unit!16199 () Unit!16196)

(assert (=> b!521379 (= e!304185 Unit!16199)))

(declare-fun b!521380 () Bool)

(assert (=> b!521380 (= e!304181 (not e!304184))))

(declare-fun res!319181 () Bool)

(assert (=> b!521380 (=> res!319181 e!304184)))

(declare-fun lt!238918 () (_ BitVec 32))

(assert (=> b!521380 (= res!319181 (= lt!238916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238918 lt!238915 lt!238919 mask!3524)))))

(assert (=> b!521380 (= lt!238916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238914 (select (arr!15969 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521380 (= lt!238918 (toIndex!0 lt!238915 mask!3524))))

(assert (=> b!521380 (= lt!238915 (select (store (arr!15969 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521380 (= lt!238914 (toIndex!0 (select (arr!15969 a!3235) j!176) mask!3524))))

(assert (=> b!521380 (= lt!238919 (array!33227 (store (arr!15969 a!3235) i!1204 k!2280) (size!16333 a!3235)))))

(assert (=> b!521380 e!304180))

(declare-fun res!319186 () Bool)

(assert (=> b!521380 (=> (not res!319186) (not e!304180))))

(assert (=> b!521380 (= res!319186 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238913 () Unit!16196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16196)

(assert (=> b!521380 (= lt!238913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521381 () Bool)

(declare-fun res!319176 () Bool)

(assert (=> b!521381 (=> (not res!319176) (not e!304182))))

(assert (=> b!521381 (= res!319176 (validKeyInArray!0 (select (arr!15969 a!3235) j!176)))))

(assert (= (and start!47400 res!319178) b!521374))

(assert (= (and b!521374 res!319184) b!521381))

(assert (= (and b!521381 res!319176) b!521372))

(assert (= (and b!521372 res!319182) b!521376))

(assert (= (and b!521376 res!319180) b!521369))

(assert (= (and b!521369 res!319177) b!521377))

(assert (= (and b!521377 res!319185) b!521375))

(assert (= (and b!521375 res!319179) b!521380))

(assert (= (and b!521380 res!319186) b!521373))

(assert (= (and b!521380 (not res!319181)) b!521371))

(assert (= (and b!521371 (not res!319187)) b!521368))

(assert (= (and b!521368 c!61397) b!521378))

(assert (= (and b!521368 (not c!61397)) b!521379))

(assert (= (and b!521378 res!319183) b!521370))

(declare-fun m!502281 () Bool)

(assert (=> b!521377 m!502281))

(declare-fun m!502283 () Bool)

(assert (=> b!521372 m!502283))

(declare-fun m!502285 () Bool)

(assert (=> start!47400 m!502285))

(declare-fun m!502287 () Bool)

(assert (=> start!47400 m!502287))

(declare-fun m!502289 () Bool)

(assert (=> b!521376 m!502289))

(declare-fun m!502291 () Bool)

(assert (=> b!521375 m!502291))

(declare-fun m!502293 () Bool)

(assert (=> b!521368 m!502293))

(declare-fun m!502295 () Bool)

(assert (=> b!521368 m!502295))

(assert (=> b!521381 m!502295))

(assert (=> b!521381 m!502295))

(declare-fun m!502297 () Bool)

(assert (=> b!521381 m!502297))

(declare-fun m!502299 () Bool)

(assert (=> b!521378 m!502299))

(declare-fun m!502301 () Bool)

(assert (=> b!521378 m!502301))

(assert (=> b!521373 m!502295))

(assert (=> b!521373 m!502295))

(declare-fun m!502303 () Bool)

(assert (=> b!521373 m!502303))

(declare-fun m!502305 () Bool)

(assert (=> b!521380 m!502305))

(declare-fun m!502307 () Bool)

(assert (=> b!521380 m!502307))

(declare-fun m!502309 () Bool)

(assert (=> b!521380 m!502309))

(declare-fun m!502311 () Bool)

(assert (=> b!521380 m!502311))

(assert (=> b!521380 m!502295))

(declare-fun m!502313 () Bool)

(assert (=> b!521380 m!502313))

(assert (=> b!521380 m!502295))

(declare-fun m!502315 () Bool)

(assert (=> b!521380 m!502315))

(assert (=> b!521380 m!502295))

(declare-fun m!502317 () Bool)

(assert (=> b!521380 m!502317))

(declare-fun m!502319 () Bool)

(assert (=> b!521380 m!502319))

(declare-fun m!502321 () Bool)

(assert (=> b!521369 m!502321))

(push 1)

