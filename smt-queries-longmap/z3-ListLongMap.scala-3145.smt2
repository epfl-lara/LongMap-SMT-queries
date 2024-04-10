; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44294 () Bool)

(assert start!44294)

(declare-fun b!487096 () Bool)

(declare-fun e!286649 () Bool)

(declare-fun e!286648 () Bool)

(assert (=> b!487096 (= e!286649 e!286648)))

(declare-fun res!290489 () Bool)

(assert (=> b!487096 (=> (not res!290489) (not e!286648))))

(declare-datatypes ((SeekEntryResult!3633 0))(
  ( (MissingZero!3633 (index!16711 (_ BitVec 32))) (Found!3633 (index!16712 (_ BitVec 32))) (Intermediate!3633 (undefined!4445 Bool) (index!16713 (_ BitVec 32)) (x!45837 (_ BitVec 32))) (Undefined!3633) (MissingVacant!3633 (index!16714 (_ BitVec 32))) )
))
(declare-fun lt!219939 () SeekEntryResult!3633)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487096 (= res!290489 (or (= lt!219939 (MissingZero!3633 i!1204)) (= lt!219939 (MissingVacant!3633 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31545 0))(
  ( (array!31546 (arr!15166 (Array (_ BitVec 32) (_ BitVec 64))) (size!15530 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31545)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31545 (_ BitVec 32)) SeekEntryResult!3633)

(assert (=> b!487096 (= lt!219939 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!290484 () Bool)

(assert (=> start!44294 (=> (not res!290484) (not e!286649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44294 (= res!290484 (validMask!0 mask!3524))))

(assert (=> start!44294 e!286649))

(assert (=> start!44294 true))

(declare-fun array_inv!10962 (array!31545) Bool)

(assert (=> start!44294 (array_inv!10962 a!3235)))

(declare-fun b!487097 () Bool)

(declare-fun res!290486 () Bool)

(assert (=> b!487097 (=> (not res!290486) (not e!286649))))

(declare-fun arrayContainsKey!0 (array!31545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487097 (= res!290486 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487098 () Bool)

(declare-fun res!290488 () Bool)

(assert (=> b!487098 (=> (not res!290488) (not e!286648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31545 (_ BitVec 32)) Bool)

(assert (=> b!487098 (= res!290488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487099 () Bool)

(declare-fun res!290487 () Bool)

(assert (=> b!487099 (=> (not res!290487) (not e!286649))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487099 (= res!290487 (and (= (size!15530 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15530 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15530 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487100 () Bool)

(assert (=> b!487100 (= e!286648 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!487100 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14212 0))(
  ( (Unit!14213) )
))
(declare-fun lt!219940 () Unit!14212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14212)

(assert (=> b!487100 (= lt!219940 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487101 () Bool)

(declare-fun res!290485 () Bool)

(assert (=> b!487101 (=> (not res!290485) (not e!286649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487101 (= res!290485 (validKeyInArray!0 (select (arr!15166 a!3235) j!176)))))

(declare-fun b!487102 () Bool)

(declare-fun res!290483 () Bool)

(assert (=> b!487102 (=> (not res!290483) (not e!286648))))

(declare-datatypes ((List!9324 0))(
  ( (Nil!9321) (Cons!9320 (h!10176 (_ BitVec 64)) (t!15552 List!9324)) )
))
(declare-fun arrayNoDuplicates!0 (array!31545 (_ BitVec 32) List!9324) Bool)

(assert (=> b!487102 (= res!290483 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9321))))

(declare-fun b!487103 () Bool)

(declare-fun res!290482 () Bool)

(assert (=> b!487103 (=> (not res!290482) (not e!286649))))

(assert (=> b!487103 (= res!290482 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44294 res!290484) b!487099))

(assert (= (and b!487099 res!290487) b!487101))

(assert (= (and b!487101 res!290485) b!487103))

(assert (= (and b!487103 res!290482) b!487097))

(assert (= (and b!487097 res!290486) b!487096))

(assert (= (and b!487096 res!290489) b!487098))

(assert (= (and b!487098 res!290488) b!487102))

(assert (= (and b!487102 res!290483) b!487100))

(declare-fun m!466945 () Bool)

(assert (=> start!44294 m!466945))

(declare-fun m!466947 () Bool)

(assert (=> start!44294 m!466947))

(declare-fun m!466949 () Bool)

(assert (=> b!487098 m!466949))

(declare-fun m!466951 () Bool)

(assert (=> b!487103 m!466951))

(declare-fun m!466953 () Bool)

(assert (=> b!487101 m!466953))

(assert (=> b!487101 m!466953))

(declare-fun m!466955 () Bool)

(assert (=> b!487101 m!466955))

(declare-fun m!466957 () Bool)

(assert (=> b!487096 m!466957))

(declare-fun m!466959 () Bool)

(assert (=> b!487102 m!466959))

(declare-fun m!466961 () Bool)

(assert (=> b!487100 m!466961))

(declare-fun m!466963 () Bool)

(assert (=> b!487100 m!466963))

(declare-fun m!466965 () Bool)

(assert (=> b!487097 m!466965))

(check-sat (not b!487103) (not start!44294) (not b!487100) (not b!487096) (not b!487102) (not b!487098) (not b!487101) (not b!487097))
(check-sat)
