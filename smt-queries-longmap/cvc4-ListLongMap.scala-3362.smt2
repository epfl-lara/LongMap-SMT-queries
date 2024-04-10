; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46228 () Bool)

(assert start!46228)

(declare-fun b!511910 () Bool)

(declare-fun res!312581 () Bool)

(declare-fun e!299055 () Bool)

(assert (=> b!511910 (=> (not res!312581) (not e!299055))))

(declare-datatypes ((array!32882 0))(
  ( (array!32883 (arr!15818 (Array (_ BitVec 32) (_ BitVec 64))) (size!16182 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32882)

(declare-datatypes ((List!9976 0))(
  ( (Nil!9973) (Cons!9972 (h!10852 (_ BitVec 64)) (t!16204 List!9976)) )
))
(declare-fun arrayNoDuplicates!0 (array!32882 (_ BitVec 32) List!9976) Bool)

(assert (=> b!511910 (= res!312581 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9973))))

(declare-fun b!511911 () Bool)

(declare-fun e!299054 () Bool)

(assert (=> b!511911 (= e!299054 e!299055)))

(declare-fun res!312579 () Bool)

(assert (=> b!511911 (=> (not res!312579) (not e!299055))))

(declare-datatypes ((SeekEntryResult!4285 0))(
  ( (MissingZero!4285 (index!19328 (_ BitVec 32))) (Found!4285 (index!19329 (_ BitVec 32))) (Intermediate!4285 (undefined!5097 Bool) (index!19330 (_ BitVec 32)) (x!48276 (_ BitVec 32))) (Undefined!4285) (MissingVacant!4285 (index!19331 (_ BitVec 32))) )
))
(declare-fun lt!234267 () SeekEntryResult!4285)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511911 (= res!312579 (or (= lt!234267 (MissingZero!4285 i!1204)) (= lt!234267 (MissingVacant!4285 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32882 (_ BitVec 32)) SeekEntryResult!4285)

(assert (=> b!511911 (= lt!234267 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511912 () Bool)

(declare-fun res!312578 () Bool)

(assert (=> b!511912 (=> (not res!312578) (not e!299054))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511912 (= res!312578 (validKeyInArray!0 (select (arr!15818 a!3235) j!176)))))

(declare-fun b!511913 () Bool)

(declare-fun res!312580 () Bool)

(assert (=> b!511913 (=> (not res!312580) (not e!299054))))

(assert (=> b!511913 (= res!312580 (validKeyInArray!0 k!2280))))

(declare-fun res!312574 () Bool)

(assert (=> start!46228 (=> (not res!312574) (not e!299054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46228 (= res!312574 (validMask!0 mask!3524))))

(assert (=> start!46228 e!299054))

(assert (=> start!46228 true))

(declare-fun array_inv!11614 (array!32882) Bool)

(assert (=> start!46228 (array_inv!11614 a!3235)))

(declare-fun b!511914 () Bool)

(declare-fun e!299052 () Bool)

(assert (=> b!511914 (= e!299052 true)))

(declare-fun lt!234263 () SeekEntryResult!4285)

(assert (=> b!511914 (= lt!234263 Undefined!4285)))

(declare-fun b!511915 () Bool)

(declare-fun res!312572 () Bool)

(assert (=> b!511915 (=> (not res!312572) (not e!299055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32882 (_ BitVec 32)) Bool)

(assert (=> b!511915 (= res!312572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511916 () Bool)

(declare-fun res!312577 () Bool)

(assert (=> b!511916 (=> (not res!312577) (not e!299054))))

(declare-fun arrayContainsKey!0 (array!32882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511916 (= res!312577 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511917 () Bool)

(assert (=> b!511917 (= e!299055 (not e!299052))))

(declare-fun res!312575 () Bool)

(assert (=> b!511917 (=> res!312575 e!299052)))

(declare-fun lt!234266 () (_ BitVec 32))

(declare-fun lt!234268 () SeekEntryResult!4285)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32882 (_ BitVec 32)) SeekEntryResult!4285)

(assert (=> b!511917 (= res!312575 (= lt!234268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234266 (select (store (arr!15818 a!3235) i!1204 k!2280) j!176) (array!32883 (store (arr!15818 a!3235) i!1204 k!2280) (size!16182 a!3235)) mask!3524)))))

(declare-fun lt!234265 () (_ BitVec 32))

(assert (=> b!511917 (= lt!234268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234265 (select (arr!15818 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511917 (= lt!234266 (toIndex!0 (select (store (arr!15818 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511917 (= lt!234265 (toIndex!0 (select (arr!15818 a!3235) j!176) mask!3524))))

(assert (=> b!511917 (= lt!234263 (Found!4285 j!176))))

(assert (=> b!511917 (= lt!234263 (seekEntryOrOpen!0 (select (arr!15818 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511917 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15828 0))(
  ( (Unit!15829) )
))
(declare-fun lt!234264 () Unit!15828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15828)

(assert (=> b!511917 (= lt!234264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511918 () Bool)

(declare-fun res!312576 () Bool)

(assert (=> b!511918 (=> res!312576 e!299052)))

(assert (=> b!511918 (= res!312576 (or (not (is-Intermediate!4285 lt!234268)) (not (undefined!5097 lt!234268))))))

(declare-fun b!511919 () Bool)

(declare-fun res!312573 () Bool)

(assert (=> b!511919 (=> (not res!312573) (not e!299054))))

(assert (=> b!511919 (= res!312573 (and (= (size!16182 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16182 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16182 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46228 res!312574) b!511919))

(assert (= (and b!511919 res!312573) b!511912))

(assert (= (and b!511912 res!312578) b!511913))

(assert (= (and b!511913 res!312580) b!511916))

(assert (= (and b!511916 res!312577) b!511911))

(assert (= (and b!511911 res!312579) b!511915))

(assert (= (and b!511915 res!312572) b!511910))

(assert (= (and b!511910 res!312581) b!511917))

(assert (= (and b!511917 (not res!312575)) b!511918))

(assert (= (and b!511918 (not res!312576)) b!511914))

(declare-fun m!493461 () Bool)

(assert (=> start!46228 m!493461))

(declare-fun m!493463 () Bool)

(assert (=> start!46228 m!493463))

(declare-fun m!493465 () Bool)

(assert (=> b!511916 m!493465))

(declare-fun m!493467 () Bool)

(assert (=> b!511910 m!493467))

(declare-fun m!493469 () Bool)

(assert (=> b!511911 m!493469))

(declare-fun m!493471 () Bool)

(assert (=> b!511912 m!493471))

(assert (=> b!511912 m!493471))

(declare-fun m!493473 () Bool)

(assert (=> b!511912 m!493473))

(declare-fun m!493475 () Bool)

(assert (=> b!511917 m!493475))

(declare-fun m!493477 () Bool)

(assert (=> b!511917 m!493477))

(declare-fun m!493479 () Bool)

(assert (=> b!511917 m!493479))

(assert (=> b!511917 m!493471))

(declare-fun m!493481 () Bool)

(assert (=> b!511917 m!493481))

(assert (=> b!511917 m!493471))

(declare-fun m!493483 () Bool)

(assert (=> b!511917 m!493483))

(assert (=> b!511917 m!493471))

(assert (=> b!511917 m!493479))

(declare-fun m!493485 () Bool)

(assert (=> b!511917 m!493485))

(declare-fun m!493487 () Bool)

(assert (=> b!511917 m!493487))

(assert (=> b!511917 m!493471))

(declare-fun m!493489 () Bool)

(assert (=> b!511917 m!493489))

(assert (=> b!511917 m!493479))

(declare-fun m!493491 () Bool)

(assert (=> b!511917 m!493491))

(declare-fun m!493493 () Bool)

(assert (=> b!511915 m!493493))

(declare-fun m!493495 () Bool)

(assert (=> b!511913 m!493495))

(push 1)

