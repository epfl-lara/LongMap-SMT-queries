; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45182 () Bool)

(assert start!45182)

(declare-fun b!495930 () Bool)

(declare-fun res!298377 () Bool)

(declare-fun e!290879 () Bool)

(assert (=> b!495930 (=> (not res!298377) (not e!290879))))

(declare-datatypes ((array!32071 0))(
  ( (array!32072 (arr!15418 (Array (_ BitVec 32) (_ BitVec 64))) (size!15782 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32071)

(declare-datatypes ((List!9483 0))(
  ( (Nil!9480) (Cons!9479 (h!10350 (_ BitVec 64)) (t!15703 List!9483)) )
))
(declare-fun arrayNoDuplicates!0 (array!32071 (_ BitVec 32) List!9483) Bool)

(assert (=> b!495930 (= res!298377 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9480))))

(declare-fun res!298379 () Bool)

(declare-fun e!290881 () Bool)

(assert (=> start!45182 (=> (not res!298379) (not e!290881))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45182 (= res!298379 (validMask!0 mask!3524))))

(assert (=> start!45182 e!290881))

(assert (=> start!45182 true))

(declare-fun array_inv!11277 (array!32071) Bool)

(assert (=> start!45182 (array_inv!11277 a!3235)))

(declare-fun b!495931 () Bool)

(declare-fun res!298381 () Bool)

(assert (=> b!495931 (=> (not res!298381) (not e!290881))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495931 (= res!298381 (validKeyInArray!0 (select (arr!15418 a!3235) j!176)))))

(declare-fun b!495932 () Bool)

(declare-fun res!298375 () Bool)

(assert (=> b!495932 (=> (not res!298375) (not e!290881))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495932 (= res!298375 (and (= (size!15782 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15782 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15782 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495933 () Bool)

(declare-fun res!298372 () Bool)

(assert (=> b!495933 (=> (not res!298372) (not e!290881))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!495933 (= res!298372 (validKeyInArray!0 k0!2280))))

(declare-fun b!495934 () Bool)

(declare-fun e!290883 () Bool)

(assert (=> b!495934 (= e!290879 (not e!290883))))

(declare-fun res!298378 () Bool)

(assert (=> b!495934 (=> res!298378 e!290883)))

(declare-fun lt!224550 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3841 0))(
  ( (MissingZero!3841 (index!17543 (_ BitVec 32))) (Found!3841 (index!17544 (_ BitVec 32))) (Intermediate!3841 (undefined!4653 Bool) (index!17545 (_ BitVec 32)) (x!46754 (_ BitVec 32))) (Undefined!3841) (MissingVacant!3841 (index!17546 (_ BitVec 32))) )
))
(declare-fun lt!224553 () SeekEntryResult!3841)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32071 (_ BitVec 32)) SeekEntryResult!3841)

(assert (=> b!495934 (= res!298378 (= lt!224553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224550 (select (store (arr!15418 a!3235) i!1204 k0!2280) j!176) (array!32072 (store (arr!15418 a!3235) i!1204 k0!2280) (size!15782 a!3235)) mask!3524)))))

(declare-fun lt!224552 () (_ BitVec 32))

(assert (=> b!495934 (= lt!224553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224552 (select (arr!15418 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495934 (= lt!224550 (toIndex!0 (select (store (arr!15418 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495934 (= lt!224552 (toIndex!0 (select (arr!15418 a!3235) j!176) mask!3524))))

(declare-fun e!290880 () Bool)

(assert (=> b!495934 e!290880))

(declare-fun res!298373 () Bool)

(assert (=> b!495934 (=> (not res!298373) (not e!290880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32071 (_ BitVec 32)) Bool)

(assert (=> b!495934 (= res!298373 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14689 0))(
  ( (Unit!14690) )
))
(declare-fun lt!224551 () Unit!14689)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14689)

(assert (=> b!495934 (= lt!224551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495935 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32071 (_ BitVec 32)) SeekEntryResult!3841)

(assert (=> b!495935 (= e!290880 (= (seekEntryOrOpen!0 (select (arr!15418 a!3235) j!176) a!3235 mask!3524) (Found!3841 j!176)))))

(declare-fun b!495936 () Bool)

(assert (=> b!495936 (= e!290881 e!290879)))

(declare-fun res!298374 () Bool)

(assert (=> b!495936 (=> (not res!298374) (not e!290879))))

(declare-fun lt!224554 () SeekEntryResult!3841)

(assert (=> b!495936 (= res!298374 (or (= lt!224554 (MissingZero!3841 i!1204)) (= lt!224554 (MissingVacant!3841 i!1204))))))

(assert (=> b!495936 (= lt!224554 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495937 () Bool)

(assert (=> b!495937 (= e!290883 true)))

(assert (=> b!495937 (and (bvslt (x!46754 lt!224553) #b01111111111111111111111111111110) (or (= (select (arr!15418 a!3235) (index!17545 lt!224553)) (select (arr!15418 a!3235) j!176)) (= (select (arr!15418 a!3235) (index!17545 lt!224553)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15418 a!3235) (index!17545 lt!224553)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495938 () Bool)

(declare-fun res!298371 () Bool)

(assert (=> b!495938 (=> (not res!298371) (not e!290881))))

(declare-fun arrayContainsKey!0 (array!32071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495938 (= res!298371 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495939 () Bool)

(declare-fun res!298376 () Bool)

(assert (=> b!495939 (=> (not res!298376) (not e!290879))))

(assert (=> b!495939 (= res!298376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495940 () Bool)

(declare-fun res!298380 () Bool)

(assert (=> b!495940 (=> res!298380 e!290883)))

(get-info :version)

(assert (=> b!495940 (= res!298380 (or (undefined!4653 lt!224553) (not ((_ is Intermediate!3841) lt!224553))))))

(assert (= (and start!45182 res!298379) b!495932))

(assert (= (and b!495932 res!298375) b!495931))

(assert (= (and b!495931 res!298381) b!495933))

(assert (= (and b!495933 res!298372) b!495938))

(assert (= (and b!495938 res!298371) b!495936))

(assert (= (and b!495936 res!298374) b!495939))

(assert (= (and b!495939 res!298376) b!495930))

(assert (= (and b!495930 res!298377) b!495934))

(assert (= (and b!495934 res!298373) b!495935))

(assert (= (and b!495934 (not res!298378)) b!495940))

(assert (= (and b!495940 (not res!298380)) b!495937))

(declare-fun m!477343 () Bool)

(assert (=> start!45182 m!477343))

(declare-fun m!477345 () Bool)

(assert (=> start!45182 m!477345))

(declare-fun m!477347 () Bool)

(assert (=> b!495935 m!477347))

(assert (=> b!495935 m!477347))

(declare-fun m!477349 () Bool)

(assert (=> b!495935 m!477349))

(declare-fun m!477351 () Bool)

(assert (=> b!495936 m!477351))

(declare-fun m!477353 () Bool)

(assert (=> b!495930 m!477353))

(declare-fun m!477355 () Bool)

(assert (=> b!495933 m!477355))

(declare-fun m!477357 () Bool)

(assert (=> b!495934 m!477357))

(declare-fun m!477359 () Bool)

(assert (=> b!495934 m!477359))

(assert (=> b!495934 m!477347))

(declare-fun m!477361 () Bool)

(assert (=> b!495934 m!477361))

(assert (=> b!495934 m!477347))

(declare-fun m!477363 () Bool)

(assert (=> b!495934 m!477363))

(assert (=> b!495934 m!477347))

(declare-fun m!477365 () Bool)

(assert (=> b!495934 m!477365))

(assert (=> b!495934 m!477359))

(declare-fun m!477367 () Bool)

(assert (=> b!495934 m!477367))

(declare-fun m!477369 () Bool)

(assert (=> b!495934 m!477369))

(assert (=> b!495934 m!477359))

(declare-fun m!477371 () Bool)

(assert (=> b!495934 m!477371))

(assert (=> b!495931 m!477347))

(assert (=> b!495931 m!477347))

(declare-fun m!477373 () Bool)

(assert (=> b!495931 m!477373))

(declare-fun m!477375 () Bool)

(assert (=> b!495937 m!477375))

(assert (=> b!495937 m!477347))

(declare-fun m!477377 () Bool)

(assert (=> b!495939 m!477377))

(declare-fun m!477379 () Bool)

(assert (=> b!495938 m!477379))

(check-sat (not b!495934) (not b!495933) (not b!495935) (not b!495939) (not b!495938) (not b!495931) (not b!495936) (not start!45182) (not b!495930))
(check-sat)
