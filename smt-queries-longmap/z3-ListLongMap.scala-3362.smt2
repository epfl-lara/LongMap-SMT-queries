; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46226 () Bool)

(assert start!46226)

(declare-fun b!511880 () Bool)

(declare-fun e!299042 () Bool)

(assert (=> b!511880 (= e!299042 true)))

(declare-datatypes ((SeekEntryResult!4284 0))(
  ( (MissingZero!4284 (index!19324 (_ BitVec 32))) (Found!4284 (index!19325 (_ BitVec 32))) (Intermediate!4284 (undefined!5096 Bool) (index!19326 (_ BitVec 32)) (x!48275 (_ BitVec 32))) (Undefined!4284) (MissingVacant!4284 (index!19327 (_ BitVec 32))) )
))
(declare-fun lt!234250 () SeekEntryResult!4284)

(assert (=> b!511880 (= lt!234250 Undefined!4284)))

(declare-fun b!511881 () Bool)

(declare-fun res!312547 () Bool)

(assert (=> b!511881 (=> res!312547 e!299042)))

(declare-fun lt!234249 () SeekEntryResult!4284)

(get-info :version)

(assert (=> b!511881 (= res!312547 (or (not ((_ is Intermediate!4284) lt!234249)) (not (undefined!5096 lt!234249))))))

(declare-fun res!312546 () Bool)

(declare-fun e!299041 () Bool)

(assert (=> start!46226 (=> (not res!312546) (not e!299041))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46226 (= res!312546 (validMask!0 mask!3524))))

(assert (=> start!46226 e!299041))

(assert (=> start!46226 true))

(declare-datatypes ((array!32880 0))(
  ( (array!32881 (arr!15817 (Array (_ BitVec 32) (_ BitVec 64))) (size!16181 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32880)

(declare-fun array_inv!11613 (array!32880) Bool)

(assert (=> start!46226 (array_inv!11613 a!3235)))

(declare-fun b!511882 () Bool)

(declare-fun e!299043 () Bool)

(assert (=> b!511882 (= e!299041 e!299043)))

(declare-fun res!312545 () Bool)

(assert (=> b!511882 (=> (not res!312545) (not e!299043))))

(declare-fun lt!234248 () SeekEntryResult!4284)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511882 (= res!312545 (or (= lt!234248 (MissingZero!4284 i!1204)) (= lt!234248 (MissingVacant!4284 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32880 (_ BitVec 32)) SeekEntryResult!4284)

(assert (=> b!511882 (= lt!234248 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511883 () Bool)

(declare-fun res!312544 () Bool)

(assert (=> b!511883 (=> (not res!312544) (not e!299043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32880 (_ BitVec 32)) Bool)

(assert (=> b!511883 (= res!312544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511884 () Bool)

(declare-fun res!312551 () Bool)

(assert (=> b!511884 (=> (not res!312551) (not e!299043))))

(declare-datatypes ((List!9975 0))(
  ( (Nil!9972) (Cons!9971 (h!10851 (_ BitVec 64)) (t!16203 List!9975)) )
))
(declare-fun arrayNoDuplicates!0 (array!32880 (_ BitVec 32) List!9975) Bool)

(assert (=> b!511884 (= res!312551 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9972))))

(declare-fun b!511885 () Bool)

(declare-fun res!312542 () Bool)

(assert (=> b!511885 (=> (not res!312542) (not e!299041))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511885 (= res!312542 (and (= (size!16181 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16181 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16181 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511886 () Bool)

(assert (=> b!511886 (= e!299043 (not e!299042))))

(declare-fun res!312549 () Bool)

(assert (=> b!511886 (=> res!312549 e!299042)))

(declare-fun lt!234246 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32880 (_ BitVec 32)) SeekEntryResult!4284)

(assert (=> b!511886 (= res!312549 (= lt!234249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234246 (select (store (arr!15817 a!3235) i!1204 k0!2280) j!176) (array!32881 (store (arr!15817 a!3235) i!1204 k0!2280) (size!16181 a!3235)) mask!3524)))))

(declare-fun lt!234245 () (_ BitVec 32))

(assert (=> b!511886 (= lt!234249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234245 (select (arr!15817 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511886 (= lt!234246 (toIndex!0 (select (store (arr!15817 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511886 (= lt!234245 (toIndex!0 (select (arr!15817 a!3235) j!176) mask!3524))))

(assert (=> b!511886 (= lt!234250 (Found!4284 j!176))))

(assert (=> b!511886 (= lt!234250 (seekEntryOrOpen!0 (select (arr!15817 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511886 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15826 0))(
  ( (Unit!15827) )
))
(declare-fun lt!234247 () Unit!15826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15826)

(assert (=> b!511886 (= lt!234247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511887 () Bool)

(declare-fun res!312548 () Bool)

(assert (=> b!511887 (=> (not res!312548) (not e!299041))))

(declare-fun arrayContainsKey!0 (array!32880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511887 (= res!312548 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511888 () Bool)

(declare-fun res!312543 () Bool)

(assert (=> b!511888 (=> (not res!312543) (not e!299041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511888 (= res!312543 (validKeyInArray!0 (select (arr!15817 a!3235) j!176)))))

(declare-fun b!511889 () Bool)

(declare-fun res!312550 () Bool)

(assert (=> b!511889 (=> (not res!312550) (not e!299041))))

(assert (=> b!511889 (= res!312550 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46226 res!312546) b!511885))

(assert (= (and b!511885 res!312542) b!511888))

(assert (= (and b!511888 res!312543) b!511889))

(assert (= (and b!511889 res!312550) b!511887))

(assert (= (and b!511887 res!312548) b!511882))

(assert (= (and b!511882 res!312545) b!511883))

(assert (= (and b!511883 res!312544) b!511884))

(assert (= (and b!511884 res!312551) b!511886))

(assert (= (and b!511886 (not res!312549)) b!511881))

(assert (= (and b!511881 (not res!312547)) b!511880))

(declare-fun m!493425 () Bool)

(assert (=> b!511884 m!493425))

(declare-fun m!493427 () Bool)

(assert (=> b!511882 m!493427))

(declare-fun m!493429 () Bool)

(assert (=> b!511887 m!493429))

(declare-fun m!493431 () Bool)

(assert (=> b!511886 m!493431))

(declare-fun m!493433 () Bool)

(assert (=> b!511886 m!493433))

(declare-fun m!493435 () Bool)

(assert (=> b!511886 m!493435))

(declare-fun m!493437 () Bool)

(assert (=> b!511886 m!493437))

(declare-fun m!493439 () Bool)

(assert (=> b!511886 m!493439))

(assert (=> b!511886 m!493437))

(assert (=> b!511886 m!493437))

(declare-fun m!493441 () Bool)

(assert (=> b!511886 m!493441))

(assert (=> b!511886 m!493435))

(declare-fun m!493443 () Bool)

(assert (=> b!511886 m!493443))

(assert (=> b!511886 m!493435))

(declare-fun m!493445 () Bool)

(assert (=> b!511886 m!493445))

(assert (=> b!511886 m!493437))

(declare-fun m!493447 () Bool)

(assert (=> b!511886 m!493447))

(declare-fun m!493449 () Bool)

(assert (=> b!511886 m!493449))

(assert (=> b!511888 m!493437))

(assert (=> b!511888 m!493437))

(declare-fun m!493451 () Bool)

(assert (=> b!511888 m!493451))

(declare-fun m!493453 () Bool)

(assert (=> b!511883 m!493453))

(declare-fun m!493455 () Bool)

(assert (=> b!511889 m!493455))

(declare-fun m!493457 () Bool)

(assert (=> start!46226 m!493457))

(declare-fun m!493459 () Bool)

(assert (=> start!46226 m!493459))

(check-sat (not b!511888) (not b!511884) (not b!511887) (not b!511889) (not b!511886) (not b!511882) (not start!46226) (not b!511883))
(check-sat)
