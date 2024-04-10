; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47448 () Bool)

(assert start!47448)

(declare-fun b!522376 () Bool)

(declare-fun res!320050 () Bool)

(declare-fun e!304689 () Bool)

(assert (=> b!522376 (=> (not res!320050) (not e!304689))))

(declare-datatypes ((array!33274 0))(
  ( (array!33275 (arr!15993 (Array (_ BitVec 32) (_ BitVec 64))) (size!16357 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33274)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522376 (= res!320050 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522377 () Bool)

(declare-fun res!320049 () Bool)

(assert (=> b!522377 (=> (not res!320049) (not e!304689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522377 (= res!320049 (validKeyInArray!0 k!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!522378 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!304683 () Bool)

(declare-datatypes ((SeekEntryResult!4460 0))(
  ( (MissingZero!4460 (index!20043 (_ BitVec 32))) (Found!4460 (index!20044 (_ BitVec 32))) (Intermediate!4460 (undefined!5272 Bool) (index!20045 (_ BitVec 32)) (x!49022 (_ BitVec 32))) (Undefined!4460) (MissingVacant!4460 (index!20046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33274 (_ BitVec 32)) SeekEntryResult!4460)

(assert (=> b!522378 (= e!304683 (= (seekEntryOrOpen!0 (select (arr!15993 a!3235) j!176) a!3235 mask!3524) (Found!4460 j!176)))))

(declare-fun b!522379 () Bool)

(declare-fun res!320045 () Bool)

(declare-fun e!304687 () Bool)

(assert (=> b!522379 (=> (not res!320045) (not e!304687))))

(declare-datatypes ((List!10151 0))(
  ( (Nil!10148) (Cons!10147 (h!11069 (_ BitVec 64)) (t!16379 List!10151)) )
))
(declare-fun arrayNoDuplicates!0 (array!33274 (_ BitVec 32) List!10151) Bool)

(assert (=> b!522379 (= res!320045 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10148))))

(declare-fun b!522381 () Bool)

(declare-fun e!304686 () Bool)

(assert (=> b!522381 (= e!304686 true)))

(declare-fun lt!239569 () SeekEntryResult!4460)

(assert (=> b!522381 (and (or (= (select (arr!15993 a!3235) (index!20045 lt!239569)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15993 a!3235) (index!20045 lt!239569)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15993 a!3235) (index!20045 lt!239569)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15993 a!3235) (index!20045 lt!239569)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16292 0))(
  ( (Unit!16293) )
))
(declare-fun lt!239562 () Unit!16292)

(declare-fun e!304685 () Unit!16292)

(assert (=> b!522381 (= lt!239562 e!304685)))

(declare-fun c!61469 () Bool)

(assert (=> b!522381 (= c!61469 (= (select (arr!15993 a!3235) (index!20045 lt!239569)) (select (arr!15993 a!3235) j!176)))))

(assert (=> b!522381 (and (bvslt (x!49022 lt!239569) #b01111111111111111111111111111110) (or (= (select (arr!15993 a!3235) (index!20045 lt!239569)) (select (arr!15993 a!3235) j!176)) (= (select (arr!15993 a!3235) (index!20045 lt!239569)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15993 a!3235) (index!20045 lt!239569)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522382 () Bool)

(assert (=> b!522382 (= e!304687 (not e!304686))))

(declare-fun res!320046 () Bool)

(assert (=> b!522382 (=> res!320046 e!304686)))

(declare-fun lt!239564 () (_ BitVec 32))

(declare-fun lt!239568 () (_ BitVec 64))

(declare-fun lt!239567 () array!33274)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33274 (_ BitVec 32)) SeekEntryResult!4460)

(assert (=> b!522382 (= res!320046 (= lt!239569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239564 lt!239568 lt!239567 mask!3524)))))

(declare-fun lt!239565 () (_ BitVec 32))

(assert (=> b!522382 (= lt!239569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239565 (select (arr!15993 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522382 (= lt!239564 (toIndex!0 lt!239568 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522382 (= lt!239568 (select (store (arr!15993 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522382 (= lt!239565 (toIndex!0 (select (arr!15993 a!3235) j!176) mask!3524))))

(assert (=> b!522382 (= lt!239567 (array!33275 (store (arr!15993 a!3235) i!1204 k!2280) (size!16357 a!3235)))))

(assert (=> b!522382 e!304683))

(declare-fun res!320043 () Bool)

(assert (=> b!522382 (=> (not res!320043) (not e!304683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33274 (_ BitVec 32)) Bool)

(assert (=> b!522382 (= res!320043 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239566 () Unit!16292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16292)

(assert (=> b!522382 (= lt!239566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522383 () Bool)

(declare-fun res!320051 () Bool)

(assert (=> b!522383 (=> (not res!320051) (not e!304689))))

(assert (=> b!522383 (= res!320051 (and (= (size!16357 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16357 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16357 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522384 () Bool)

(declare-fun res!320048 () Bool)

(assert (=> b!522384 (=> res!320048 e!304686)))

(assert (=> b!522384 (= res!320048 (or (undefined!5272 lt!239569) (not (is-Intermediate!4460 lt!239569))))))

(declare-fun b!522385 () Bool)

(declare-fun res!320044 () Bool)

(assert (=> b!522385 (=> (not res!320044) (not e!304689))))

(assert (=> b!522385 (= res!320044 (validKeyInArray!0 (select (arr!15993 a!3235) j!176)))))

(declare-fun b!522386 () Bool)

(declare-fun e!304688 () Bool)

(assert (=> b!522386 (= e!304688 false)))

(declare-fun b!522380 () Bool)

(assert (=> b!522380 (= e!304689 e!304687)))

(declare-fun res!320041 () Bool)

(assert (=> b!522380 (=> (not res!320041) (not e!304687))))

(declare-fun lt!239563 () SeekEntryResult!4460)

(assert (=> b!522380 (= res!320041 (or (= lt!239563 (MissingZero!4460 i!1204)) (= lt!239563 (MissingVacant!4460 i!1204))))))

(assert (=> b!522380 (= lt!239563 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!320047 () Bool)

(assert (=> start!47448 (=> (not res!320047) (not e!304689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47448 (= res!320047 (validMask!0 mask!3524))))

(assert (=> start!47448 e!304689))

(assert (=> start!47448 true))

(declare-fun array_inv!11789 (array!33274) Bool)

(assert (=> start!47448 (array_inv!11789 a!3235)))

(declare-fun b!522387 () Bool)

(declare-fun Unit!16294 () Unit!16292)

(assert (=> b!522387 (= e!304685 Unit!16294)))

(declare-fun lt!239561 () Unit!16292)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33274 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16292)

(assert (=> b!522387 (= lt!239561 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239565 #b00000000000000000000000000000000 (index!20045 lt!239569) (x!49022 lt!239569) mask!3524))))

(declare-fun res!320042 () Bool)

(assert (=> b!522387 (= res!320042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239565 lt!239568 lt!239567 mask!3524) (Intermediate!4460 false (index!20045 lt!239569) (x!49022 lt!239569))))))

(assert (=> b!522387 (=> (not res!320042) (not e!304688))))

(assert (=> b!522387 e!304688))

(declare-fun b!522388 () Bool)

(declare-fun res!320040 () Bool)

(assert (=> b!522388 (=> (not res!320040) (not e!304687))))

(assert (=> b!522388 (= res!320040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522389 () Bool)

(declare-fun Unit!16295 () Unit!16292)

(assert (=> b!522389 (= e!304685 Unit!16295)))

(assert (= (and start!47448 res!320047) b!522383))

(assert (= (and b!522383 res!320051) b!522385))

(assert (= (and b!522385 res!320044) b!522377))

(assert (= (and b!522377 res!320049) b!522376))

(assert (= (and b!522376 res!320050) b!522380))

(assert (= (and b!522380 res!320041) b!522388))

(assert (= (and b!522388 res!320040) b!522379))

(assert (= (and b!522379 res!320045) b!522382))

(assert (= (and b!522382 res!320043) b!522378))

(assert (= (and b!522382 (not res!320046)) b!522384))

(assert (= (and b!522384 (not res!320048)) b!522381))

(assert (= (and b!522381 c!61469) b!522387))

(assert (= (and b!522381 (not c!61469)) b!522389))

(assert (= (and b!522387 res!320042) b!522386))

(declare-fun m!503289 () Bool)

(assert (=> start!47448 m!503289))

(declare-fun m!503291 () Bool)

(assert (=> start!47448 m!503291))

(declare-fun m!503293 () Bool)

(assert (=> b!522382 m!503293))

(declare-fun m!503295 () Bool)

(assert (=> b!522382 m!503295))

(declare-fun m!503297 () Bool)

(assert (=> b!522382 m!503297))

(declare-fun m!503299 () Bool)

(assert (=> b!522382 m!503299))

(declare-fun m!503301 () Bool)

(assert (=> b!522382 m!503301))

(declare-fun m!503303 () Bool)

(assert (=> b!522382 m!503303))

(assert (=> b!522382 m!503301))

(declare-fun m!503305 () Bool)

(assert (=> b!522382 m!503305))

(assert (=> b!522382 m!503301))

(declare-fun m!503307 () Bool)

(assert (=> b!522382 m!503307))

(declare-fun m!503309 () Bool)

(assert (=> b!522382 m!503309))

(declare-fun m!503311 () Bool)

(assert (=> b!522388 m!503311))

(declare-fun m!503313 () Bool)

(assert (=> b!522376 m!503313))

(declare-fun m!503315 () Bool)

(assert (=> b!522381 m!503315))

(assert (=> b!522381 m!503301))

(declare-fun m!503317 () Bool)

(assert (=> b!522387 m!503317))

(declare-fun m!503319 () Bool)

(assert (=> b!522387 m!503319))

(assert (=> b!522385 m!503301))

(assert (=> b!522385 m!503301))

(declare-fun m!503321 () Bool)

(assert (=> b!522385 m!503321))

(assert (=> b!522378 m!503301))

(assert (=> b!522378 m!503301))

(declare-fun m!503323 () Bool)

(assert (=> b!522378 m!503323))

(declare-fun m!503325 () Bool)

(assert (=> b!522379 m!503325))

(declare-fun m!503327 () Bool)

(assert (=> b!522377 m!503327))

(declare-fun m!503329 () Bool)

(assert (=> b!522380 m!503329))

(push 1)

