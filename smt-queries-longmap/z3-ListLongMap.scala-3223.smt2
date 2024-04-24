; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45074 () Bool)

(assert start!45074)

(declare-fun b!494847 () Bool)

(declare-fun res!297474 () Bool)

(declare-fun e!290335 () Bool)

(assert (=> b!494847 (=> res!297474 e!290335)))

(declare-datatypes ((SeekEntryResult!3817 0))(
  ( (MissingZero!3817 (index!17447 (_ BitVec 32))) (Found!3817 (index!17448 (_ BitVec 32))) (Intermediate!3817 (undefined!4629 Bool) (index!17449 (_ BitVec 32)) (x!46660 (_ BitVec 32))) (Undefined!3817) (MissingVacant!3817 (index!17450 (_ BitVec 32))) )
))
(declare-fun lt!224061 () SeekEntryResult!3817)

(get-info :version)

(assert (=> b!494847 (= res!297474 (or (undefined!4629 lt!224061) (not ((_ is Intermediate!3817) lt!224061))))))

(declare-fun b!494848 () Bool)

(declare-fun res!297476 () Bool)

(declare-fun e!290334 () Bool)

(assert (=> b!494848 (=> (not res!297476) (not e!290334))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494848 (= res!297476 (validKeyInArray!0 k0!2280))))

(declare-fun b!494849 () Bool)

(declare-fun res!297475 () Bool)

(declare-fun e!290336 () Bool)

(assert (=> b!494849 (=> (not res!297475) (not e!290336))))

(declare-datatypes ((array!32020 0))(
  ( (array!32021 (arr!15394 (Array (_ BitVec 32) (_ BitVec 64))) (size!15758 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32020)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32020 (_ BitVec 32)) Bool)

(assert (=> b!494849 (= res!297475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494850 () Bool)

(assert (=> b!494850 (= e!290334 e!290336)))

(declare-fun res!297480 () Bool)

(assert (=> b!494850 (=> (not res!297480) (not e!290336))))

(declare-fun lt!224064 () SeekEntryResult!3817)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494850 (= res!297480 (or (= lt!224064 (MissingZero!3817 i!1204)) (= lt!224064 (MissingVacant!3817 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32020 (_ BitVec 32)) SeekEntryResult!3817)

(assert (=> b!494850 (= lt!224064 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494851 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494851 (= e!290335 (or (not (= (select (arr!15394 a!3235) (index!17449 lt!224061)) (select (arr!15394 a!3235) j!176))) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!494851 (and (bvslt (x!46660 lt!224061) #b01111111111111111111111111111110) (or (= (select (arr!15394 a!3235) (index!17449 lt!224061)) (select (arr!15394 a!3235) j!176)) (= (select (arr!15394 a!3235) (index!17449 lt!224061)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15394 a!3235) (index!17449 lt!224061)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!494852 () Bool)

(declare-fun res!297473 () Bool)

(assert (=> b!494852 (=> (not res!297473) (not e!290334))))

(assert (=> b!494852 (= res!297473 (validKeyInArray!0 (select (arr!15394 a!3235) j!176)))))

(declare-fun b!494853 () Bool)

(assert (=> b!494853 (= e!290336 (not e!290335))))

(declare-fun res!297477 () Bool)

(assert (=> b!494853 (=> res!297477 e!290335)))

(declare-fun lt!224062 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32020 (_ BitVec 32)) SeekEntryResult!3817)

(assert (=> b!494853 (= res!297477 (= lt!224061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224062 (select (store (arr!15394 a!3235) i!1204 k0!2280) j!176) (array!32021 (store (arr!15394 a!3235) i!1204 k0!2280) (size!15758 a!3235)) mask!3524)))))

(declare-fun lt!224063 () (_ BitVec 32))

(assert (=> b!494853 (= lt!224061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224063 (select (arr!15394 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494853 (= lt!224062 (toIndex!0 (select (store (arr!15394 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494853 (= lt!224063 (toIndex!0 (select (arr!15394 a!3235) j!176) mask!3524))))

(declare-fun e!290337 () Bool)

(assert (=> b!494853 e!290337))

(declare-fun res!297471 () Bool)

(assert (=> b!494853 (=> (not res!297471) (not e!290337))))

(assert (=> b!494853 (= res!297471 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14641 0))(
  ( (Unit!14642) )
))
(declare-fun lt!224065 () Unit!14641)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14641)

(assert (=> b!494853 (= lt!224065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494854 () Bool)

(declare-fun res!297481 () Bool)

(assert (=> b!494854 (=> (not res!297481) (not e!290336))))

(declare-datatypes ((List!9459 0))(
  ( (Nil!9456) (Cons!9455 (h!10323 (_ BitVec 64)) (t!15679 List!9459)) )
))
(declare-fun arrayNoDuplicates!0 (array!32020 (_ BitVec 32) List!9459) Bool)

(assert (=> b!494854 (= res!297481 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9456))))

(declare-fun b!494855 () Bool)

(declare-fun res!297479 () Bool)

(assert (=> b!494855 (=> (not res!297479) (not e!290334))))

(assert (=> b!494855 (= res!297479 (and (= (size!15758 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15758 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15758 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!297478 () Bool)

(assert (=> start!45074 (=> (not res!297478) (not e!290334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45074 (= res!297478 (validMask!0 mask!3524))))

(assert (=> start!45074 e!290334))

(assert (=> start!45074 true))

(declare-fun array_inv!11253 (array!32020) Bool)

(assert (=> start!45074 (array_inv!11253 a!3235)))

(declare-fun b!494856 () Bool)

(declare-fun res!297472 () Bool)

(assert (=> b!494856 (=> (not res!297472) (not e!290334))))

(declare-fun arrayContainsKey!0 (array!32020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494856 (= res!297472 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494857 () Bool)

(assert (=> b!494857 (= e!290337 (= (seekEntryOrOpen!0 (select (arr!15394 a!3235) j!176) a!3235 mask!3524) (Found!3817 j!176)))))

(assert (= (and start!45074 res!297478) b!494855))

(assert (= (and b!494855 res!297479) b!494852))

(assert (= (and b!494852 res!297473) b!494848))

(assert (= (and b!494848 res!297476) b!494856))

(assert (= (and b!494856 res!297472) b!494850))

(assert (= (and b!494850 res!297480) b!494849))

(assert (= (and b!494849 res!297475) b!494854))

(assert (= (and b!494854 res!297481) b!494853))

(assert (= (and b!494853 res!297471) b!494857))

(assert (= (and b!494853 (not res!297477)) b!494847))

(assert (= (and b!494847 (not res!297474)) b!494851))

(declare-fun m!476227 () Bool)

(assert (=> b!494848 m!476227))

(declare-fun m!476229 () Bool)

(assert (=> b!494857 m!476229))

(assert (=> b!494857 m!476229))

(declare-fun m!476231 () Bool)

(assert (=> b!494857 m!476231))

(declare-fun m!476233 () Bool)

(assert (=> b!494854 m!476233))

(declare-fun m!476235 () Bool)

(assert (=> b!494851 m!476235))

(assert (=> b!494851 m!476229))

(declare-fun m!476237 () Bool)

(assert (=> b!494853 m!476237))

(declare-fun m!476239 () Bool)

(assert (=> b!494853 m!476239))

(declare-fun m!476241 () Bool)

(assert (=> b!494853 m!476241))

(assert (=> b!494853 m!476229))

(declare-fun m!476243 () Bool)

(assert (=> b!494853 m!476243))

(assert (=> b!494853 m!476241))

(declare-fun m!476245 () Bool)

(assert (=> b!494853 m!476245))

(declare-fun m!476247 () Bool)

(assert (=> b!494853 m!476247))

(assert (=> b!494853 m!476241))

(declare-fun m!476249 () Bool)

(assert (=> b!494853 m!476249))

(assert (=> b!494853 m!476229))

(declare-fun m!476251 () Bool)

(assert (=> b!494853 m!476251))

(assert (=> b!494853 m!476229))

(declare-fun m!476253 () Bool)

(assert (=> start!45074 m!476253))

(declare-fun m!476255 () Bool)

(assert (=> start!45074 m!476255))

(assert (=> b!494852 m!476229))

(assert (=> b!494852 m!476229))

(declare-fun m!476257 () Bool)

(assert (=> b!494852 m!476257))

(declare-fun m!476259 () Bool)

(assert (=> b!494850 m!476259))

(declare-fun m!476261 () Bool)

(assert (=> b!494856 m!476261))

(declare-fun m!476263 () Bool)

(assert (=> b!494849 m!476263))

(check-sat (not start!45074) (not b!494856) (not b!494850) (not b!494849) (not b!494854) (not b!494857) (not b!494848) (not b!494853) (not b!494852))
(check-sat)
