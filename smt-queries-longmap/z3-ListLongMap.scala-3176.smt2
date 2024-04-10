; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44684 () Bool)

(assert start!44684)

(declare-fun res!293270 () Bool)

(declare-fun e!288256 () Bool)

(assert (=> start!44684 (=> (not res!293270) (not e!288256))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44684 (= res!293270 (validMask!0 mask!3524))))

(assert (=> start!44684 e!288256))

(assert (=> start!44684 true))

(declare-datatypes ((array!31743 0))(
  ( (array!31744 (arr!15259 (Array (_ BitVec 32) (_ BitVec 64))) (size!15623 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31743)

(declare-fun array_inv!11055 (array!31743) Bool)

(assert (=> start!44684 (array_inv!11055 a!3235)))

(declare-fun b!490326 () Bool)

(declare-fun res!293262 () Bool)

(assert (=> b!490326 (=> (not res!293262) (not e!288256))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490326 (= res!293262 (validKeyInArray!0 (select (arr!15259 a!3235) j!176)))))

(declare-fun e!288255 () Bool)

(declare-fun b!490327 () Bool)

(declare-datatypes ((SeekEntryResult!3726 0))(
  ( (MissingZero!3726 (index!17083 (_ BitVec 32))) (Found!3726 (index!17084 (_ BitVec 32))) (Intermediate!3726 (undefined!4538 Bool) (index!17085 (_ BitVec 32)) (x!46184 (_ BitVec 32))) (Undefined!3726) (MissingVacant!3726 (index!17086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31743 (_ BitVec 32)) SeekEntryResult!3726)

(assert (=> b!490327 (= e!288255 (= (seekEntryOrOpen!0 (select (arr!15259 a!3235) j!176) a!3235 mask!3524) (Found!3726 j!176)))))

(declare-fun b!490328 () Bool)

(declare-fun e!288258 () Bool)

(assert (=> b!490328 (= e!288258 (not true))))

(declare-fun lt!221422 () SeekEntryResult!3726)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221420 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31743 (_ BitVec 32)) SeekEntryResult!3726)

(assert (=> b!490328 (= lt!221422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221420 (select (store (arr!15259 a!3235) i!1204 k0!2280) j!176) (array!31744 (store (arr!15259 a!3235) i!1204 k0!2280) (size!15623 a!3235)) mask!3524))))

(declare-fun lt!221419 () SeekEntryResult!3726)

(declare-fun lt!221418 () (_ BitVec 32))

(assert (=> b!490328 (= lt!221419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221418 (select (arr!15259 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490328 (= lt!221420 (toIndex!0 (select (store (arr!15259 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490328 (= lt!221418 (toIndex!0 (select (arr!15259 a!3235) j!176) mask!3524))))

(assert (=> b!490328 e!288255))

(declare-fun res!293267 () Bool)

(assert (=> b!490328 (=> (not res!293267) (not e!288255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31743 (_ BitVec 32)) Bool)

(assert (=> b!490328 (= res!293267 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14398 0))(
  ( (Unit!14399) )
))
(declare-fun lt!221421 () Unit!14398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14398)

(assert (=> b!490328 (= lt!221421 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490329 () Bool)

(declare-fun res!293263 () Bool)

(assert (=> b!490329 (=> (not res!293263) (not e!288256))))

(assert (=> b!490329 (= res!293263 (and (= (size!15623 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15623 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15623 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490330 () Bool)

(declare-fun res!293264 () Bool)

(assert (=> b!490330 (=> (not res!293264) (not e!288256))))

(assert (=> b!490330 (= res!293264 (validKeyInArray!0 k0!2280))))

(declare-fun b!490331 () Bool)

(declare-fun res!293265 () Bool)

(assert (=> b!490331 (=> (not res!293265) (not e!288258))))

(declare-datatypes ((List!9417 0))(
  ( (Nil!9414) (Cons!9413 (h!10275 (_ BitVec 64)) (t!15645 List!9417)) )
))
(declare-fun arrayNoDuplicates!0 (array!31743 (_ BitVec 32) List!9417) Bool)

(assert (=> b!490331 (= res!293265 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9414))))

(declare-fun b!490332 () Bool)

(assert (=> b!490332 (= e!288256 e!288258)))

(declare-fun res!293268 () Bool)

(assert (=> b!490332 (=> (not res!293268) (not e!288258))))

(declare-fun lt!221417 () SeekEntryResult!3726)

(assert (=> b!490332 (= res!293268 (or (= lt!221417 (MissingZero!3726 i!1204)) (= lt!221417 (MissingVacant!3726 i!1204))))))

(assert (=> b!490332 (= lt!221417 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490333 () Bool)

(declare-fun res!293269 () Bool)

(assert (=> b!490333 (=> (not res!293269) (not e!288256))))

(declare-fun arrayContainsKey!0 (array!31743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490333 (= res!293269 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490334 () Bool)

(declare-fun res!293266 () Bool)

(assert (=> b!490334 (=> (not res!293266) (not e!288258))))

(assert (=> b!490334 (= res!293266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44684 res!293270) b!490329))

(assert (= (and b!490329 res!293263) b!490326))

(assert (= (and b!490326 res!293262) b!490330))

(assert (= (and b!490330 res!293264) b!490333))

(assert (= (and b!490333 res!293269) b!490332))

(assert (= (and b!490332 res!293268) b!490334))

(assert (= (and b!490334 res!293266) b!490331))

(assert (= (and b!490331 res!293265) b!490328))

(assert (= (and b!490328 res!293267) b!490327))

(declare-fun m!470397 () Bool)

(assert (=> b!490328 m!470397))

(declare-fun m!470399 () Bool)

(assert (=> b!490328 m!470399))

(declare-fun m!470401 () Bool)

(assert (=> b!490328 m!470401))

(declare-fun m!470403 () Bool)

(assert (=> b!490328 m!470403))

(declare-fun m!470405 () Bool)

(assert (=> b!490328 m!470405))

(assert (=> b!490328 m!470403))

(assert (=> b!490328 m!470401))

(declare-fun m!470407 () Bool)

(assert (=> b!490328 m!470407))

(assert (=> b!490328 m!470401))

(declare-fun m!470409 () Bool)

(assert (=> b!490328 m!470409))

(declare-fun m!470411 () Bool)

(assert (=> b!490328 m!470411))

(assert (=> b!490328 m!470403))

(declare-fun m!470413 () Bool)

(assert (=> b!490328 m!470413))

(declare-fun m!470415 () Bool)

(assert (=> b!490333 m!470415))

(declare-fun m!470417 () Bool)

(assert (=> b!490334 m!470417))

(assert (=> b!490327 m!470403))

(assert (=> b!490327 m!470403))

(declare-fun m!470419 () Bool)

(assert (=> b!490327 m!470419))

(declare-fun m!470421 () Bool)

(assert (=> start!44684 m!470421))

(declare-fun m!470423 () Bool)

(assert (=> start!44684 m!470423))

(assert (=> b!490326 m!470403))

(assert (=> b!490326 m!470403))

(declare-fun m!470425 () Bool)

(assert (=> b!490326 m!470425))

(declare-fun m!470427 () Bool)

(assert (=> b!490330 m!470427))

(declare-fun m!470429 () Bool)

(assert (=> b!490332 m!470429))

(declare-fun m!470431 () Bool)

(assert (=> b!490331 m!470431))

(check-sat (not b!490334) (not b!490331) (not b!490327) (not b!490328) (not b!490332) (not b!490333) (not b!490326) (not b!490330) (not start!44684))
(check-sat)
