; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45818 () Bool)

(assert start!45818)

(declare-fun b!507384 () Bool)

(declare-fun res!308407 () Bool)

(declare-fun e!296928 () Bool)

(assert (=> b!507384 (=> (not res!308407) (not e!296928))))

(declare-datatypes ((array!32575 0))(
  ( (array!32576 (arr!15667 (Array (_ BitVec 32) (_ BitVec 64))) (size!16031 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32575)

(declare-datatypes ((List!9732 0))(
  ( (Nil!9729) (Cons!9728 (h!10605 (_ BitVec 64)) (t!15952 List!9732)) )
))
(declare-fun arrayNoDuplicates!0 (array!32575 (_ BitVec 32) List!9732) Bool)

(assert (=> b!507384 (= res!308407 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9729))))

(declare-fun b!507385 () Bool)

(declare-fun e!296930 () Bool)

(assert (=> b!507385 (= e!296930 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!231745 () array!32575)

(declare-fun lt!231742 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4090 0))(
  ( (MissingZero!4090 (index!18548 (_ BitVec 32))) (Found!4090 (index!18549 (_ BitVec 32))) (Intermediate!4090 (undefined!4902 Bool) (index!18550 (_ BitVec 32)) (x!47688 (_ BitVec 32))) (Undefined!4090) (MissingVacant!4090 (index!18551 (_ BitVec 32))) )
))
(declare-fun lt!231743 () SeekEntryResult!4090)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32575 (_ BitVec 32)) SeekEntryResult!4090)

(assert (=> b!507385 (= lt!231743 (seekEntryOrOpen!0 lt!231742 lt!231745 mask!3524))))

(assert (=> b!507385 false))

(declare-fun b!507386 () Bool)

(declare-fun res!308402 () Bool)

(declare-fun e!296931 () Bool)

(assert (=> b!507386 (=> (not res!308402) (not e!296931))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507386 (= res!308402 (validKeyInArray!0 k0!2280))))

(declare-fun b!507387 () Bool)

(declare-fun e!296926 () Bool)

(assert (=> b!507387 (= e!296928 (not e!296926))))

(declare-fun res!308401 () Bool)

(assert (=> b!507387 (=> res!308401 e!296926)))

(declare-fun lt!231744 () (_ BitVec 32))

(declare-fun lt!231746 () SeekEntryResult!4090)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32575 (_ BitVec 32)) SeekEntryResult!4090)

(assert (=> b!507387 (= res!308401 (= lt!231746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231744 lt!231742 lt!231745 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!231740 () (_ BitVec 32))

(assert (=> b!507387 (= lt!231746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231740 (select (arr!15667 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507387 (= lt!231744 (toIndex!0 lt!231742 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507387 (= lt!231742 (select (store (arr!15667 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507387 (= lt!231740 (toIndex!0 (select (arr!15667 a!3235) j!176) mask!3524))))

(assert (=> b!507387 (= lt!231745 (array!32576 (store (arr!15667 a!3235) i!1204 k0!2280) (size!16031 a!3235)))))

(declare-fun e!296929 () Bool)

(assert (=> b!507387 e!296929))

(declare-fun res!308403 () Bool)

(assert (=> b!507387 (=> (not res!308403) (not e!296929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32575 (_ BitVec 32)) Bool)

(assert (=> b!507387 (= res!308403 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15529 0))(
  ( (Unit!15530) )
))
(declare-fun lt!231747 () Unit!15529)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15529)

(assert (=> b!507387 (= lt!231747 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507388 () Bool)

(declare-fun res!308398 () Bool)

(assert (=> b!507388 (=> (not res!308398) (not e!296931))))

(assert (=> b!507388 (= res!308398 (validKeyInArray!0 (select (arr!15667 a!3235) j!176)))))

(declare-fun b!507389 () Bool)

(assert (=> b!507389 (= e!296929 (= (seekEntryOrOpen!0 (select (arr!15667 a!3235) j!176) a!3235 mask!3524) (Found!4090 j!176)))))

(declare-fun res!308399 () Bool)

(assert (=> start!45818 (=> (not res!308399) (not e!296931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45818 (= res!308399 (validMask!0 mask!3524))))

(assert (=> start!45818 e!296931))

(assert (=> start!45818 true))

(declare-fun array_inv!11526 (array!32575) Bool)

(assert (=> start!45818 (array_inv!11526 a!3235)))

(declare-fun b!507390 () Bool)

(assert (=> b!507390 (= e!296931 e!296928)))

(declare-fun res!308406 () Bool)

(assert (=> b!507390 (=> (not res!308406) (not e!296928))))

(declare-fun lt!231748 () SeekEntryResult!4090)

(assert (=> b!507390 (= res!308406 (or (= lt!231748 (MissingZero!4090 i!1204)) (= lt!231748 (MissingVacant!4090 i!1204))))))

(assert (=> b!507390 (= lt!231748 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507391 () Bool)

(declare-fun res!308405 () Bool)

(assert (=> b!507391 (=> (not res!308405) (not e!296928))))

(assert (=> b!507391 (= res!308405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507392 () Bool)

(declare-fun res!308397 () Bool)

(assert (=> b!507392 (=> (not res!308397) (not e!296931))))

(declare-fun arrayContainsKey!0 (array!32575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507392 (= res!308397 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507393 () Bool)

(declare-fun res!308404 () Bool)

(assert (=> b!507393 (=> (not res!308404) (not e!296931))))

(assert (=> b!507393 (= res!308404 (and (= (size!16031 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16031 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16031 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507394 () Bool)

(assert (=> b!507394 (= e!296926 e!296930)))

(declare-fun res!308400 () Bool)

(assert (=> b!507394 (=> res!308400 e!296930)))

(declare-fun lt!231741 () Bool)

(assert (=> b!507394 (= res!308400 (or (and (not lt!231741) (undefined!4902 lt!231746)) (and (not lt!231741) (not (undefined!4902 lt!231746)))))))

(get-info :version)

(assert (=> b!507394 (= lt!231741 (not ((_ is Intermediate!4090) lt!231746)))))

(assert (= (and start!45818 res!308399) b!507393))

(assert (= (and b!507393 res!308404) b!507388))

(assert (= (and b!507388 res!308398) b!507386))

(assert (= (and b!507386 res!308402) b!507392))

(assert (= (and b!507392 res!308397) b!507390))

(assert (= (and b!507390 res!308406) b!507391))

(assert (= (and b!507391 res!308405) b!507384))

(assert (= (and b!507384 res!308407) b!507387))

(assert (= (and b!507387 res!308403) b!507389))

(assert (= (and b!507387 (not res!308401)) b!507394))

(assert (= (and b!507394 (not res!308400)) b!507385))

(declare-fun m!488401 () Bool)

(assert (=> b!507385 m!488401))

(declare-fun m!488403 () Bool)

(assert (=> b!507386 m!488403))

(declare-fun m!488405 () Bool)

(assert (=> b!507392 m!488405))

(declare-fun m!488407 () Bool)

(assert (=> b!507390 m!488407))

(declare-fun m!488409 () Bool)

(assert (=> b!507384 m!488409))

(declare-fun m!488411 () Bool)

(assert (=> b!507391 m!488411))

(declare-fun m!488413 () Bool)

(assert (=> b!507388 m!488413))

(assert (=> b!507388 m!488413))

(declare-fun m!488415 () Bool)

(assert (=> b!507388 m!488415))

(declare-fun m!488417 () Bool)

(assert (=> start!45818 m!488417))

(declare-fun m!488419 () Bool)

(assert (=> start!45818 m!488419))

(assert (=> b!507389 m!488413))

(assert (=> b!507389 m!488413))

(declare-fun m!488421 () Bool)

(assert (=> b!507389 m!488421))

(declare-fun m!488423 () Bool)

(assert (=> b!507387 m!488423))

(declare-fun m!488425 () Bool)

(assert (=> b!507387 m!488425))

(assert (=> b!507387 m!488413))

(declare-fun m!488427 () Bool)

(assert (=> b!507387 m!488427))

(assert (=> b!507387 m!488413))

(declare-fun m!488429 () Bool)

(assert (=> b!507387 m!488429))

(assert (=> b!507387 m!488413))

(declare-fun m!488431 () Bool)

(assert (=> b!507387 m!488431))

(declare-fun m!488433 () Bool)

(assert (=> b!507387 m!488433))

(declare-fun m!488435 () Bool)

(assert (=> b!507387 m!488435))

(declare-fun m!488437 () Bool)

(assert (=> b!507387 m!488437))

(check-sat (not start!45818) (not b!507387) (not b!507391) (not b!507392) (not b!507386) (not b!507389) (not b!507385) (not b!507384) (not b!507388) (not b!507390))
(check-sat)
