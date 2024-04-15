; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44628 () Bool)

(assert start!44628)

(declare-fun b!489461 () Bool)

(declare-fun res!292540 () Bool)

(declare-fun e!287818 () Bool)

(assert (=> b!489461 (=> (not res!292540) (not e!287818))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31697 0))(
  ( (array!31698 (arr!15236 (Array (_ BitVec 32) (_ BitVec 64))) (size!15601 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31697)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489461 (= res!292540 (and (= (size!15601 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15601 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15601 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489462 () Bool)

(declare-fun res!292546 () Bool)

(declare-fun e!287817 () Bool)

(assert (=> b!489462 (=> (not res!292546) (not e!287817))))

(declare-datatypes ((List!9433 0))(
  ( (Nil!9430) (Cons!9429 (h!10291 (_ BitVec 64)) (t!15652 List!9433)) )
))
(declare-fun arrayNoDuplicates!0 (array!31697 (_ BitVec 32) List!9433) Bool)

(assert (=> b!489462 (= res!292546 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9430))))

(declare-fun b!489463 () Bool)

(declare-fun res!292545 () Bool)

(assert (=> b!489463 (=> (not res!292545) (not e!287817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31697 (_ BitVec 32)) Bool)

(assert (=> b!489463 (= res!292545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489464 () Bool)

(declare-fun res!292544 () Bool)

(assert (=> b!489464 (=> (not res!292544) (not e!287818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489464 (= res!292544 (validKeyInArray!0 (select (arr!15236 a!3235) j!176)))))

(declare-fun b!489465 () Bool)

(assert (=> b!489465 (= e!287817 (not true))))

(declare-fun lt!220790 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3700 0))(
  ( (MissingZero!3700 (index!16979 (_ BitVec 32))) (Found!3700 (index!16980 (_ BitVec 32))) (Intermediate!3700 (undefined!4512 Bool) (index!16981 (_ BitVec 32)) (x!46097 (_ BitVec 32))) (Undefined!3700) (MissingVacant!3700 (index!16982 (_ BitVec 32))) )
))
(declare-fun lt!220792 () SeekEntryResult!3700)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31697 (_ BitVec 32)) SeekEntryResult!3700)

(assert (=> b!489465 (= lt!220792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220790 (select (store (arr!15236 a!3235) i!1204 k0!2280) j!176) (array!31698 (store (arr!15236 a!3235) i!1204 k0!2280) (size!15601 a!3235)) mask!3524))))

(declare-fun lt!220788 () (_ BitVec 32))

(declare-fun lt!220787 () SeekEntryResult!3700)

(assert (=> b!489465 (= lt!220787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220788 (select (arr!15236 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489465 (= lt!220790 (toIndex!0 (select (store (arr!15236 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489465 (= lt!220788 (toIndex!0 (select (arr!15236 a!3235) j!176) mask!3524))))

(declare-fun e!287819 () Bool)

(assert (=> b!489465 e!287819))

(declare-fun res!292541 () Bool)

(assert (=> b!489465 (=> (not res!292541) (not e!287819))))

(assert (=> b!489465 (= res!292541 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14332 0))(
  ( (Unit!14333) )
))
(declare-fun lt!220789 () Unit!14332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14332)

(assert (=> b!489465 (= lt!220789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489466 () Bool)

(assert (=> b!489466 (= e!287818 e!287817)))

(declare-fun res!292547 () Bool)

(assert (=> b!489466 (=> (not res!292547) (not e!287817))))

(declare-fun lt!220791 () SeekEntryResult!3700)

(assert (=> b!489466 (= res!292547 (or (= lt!220791 (MissingZero!3700 i!1204)) (= lt!220791 (MissingVacant!3700 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31697 (_ BitVec 32)) SeekEntryResult!3700)

(assert (=> b!489466 (= lt!220791 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!292539 () Bool)

(assert (=> start!44628 (=> (not res!292539) (not e!287818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44628 (= res!292539 (validMask!0 mask!3524))))

(assert (=> start!44628 e!287818))

(assert (=> start!44628 true))

(declare-fun array_inv!11119 (array!31697) Bool)

(assert (=> start!44628 (array_inv!11119 a!3235)))

(declare-fun b!489467 () Bool)

(assert (=> b!489467 (= e!287819 (= (seekEntryOrOpen!0 (select (arr!15236 a!3235) j!176) a!3235 mask!3524) (Found!3700 j!176)))))

(declare-fun b!489468 () Bool)

(declare-fun res!292543 () Bool)

(assert (=> b!489468 (=> (not res!292543) (not e!287818))))

(declare-fun arrayContainsKey!0 (array!31697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489468 (= res!292543 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489469 () Bool)

(declare-fun res!292542 () Bool)

(assert (=> b!489469 (=> (not res!292542) (not e!287818))))

(assert (=> b!489469 (= res!292542 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44628 res!292539) b!489461))

(assert (= (and b!489461 res!292540) b!489464))

(assert (= (and b!489464 res!292544) b!489469))

(assert (= (and b!489469 res!292542) b!489468))

(assert (= (and b!489468 res!292543) b!489466))

(assert (= (and b!489466 res!292547) b!489463))

(assert (= (and b!489463 res!292545) b!489462))

(assert (= (and b!489462 res!292546) b!489465))

(assert (= (and b!489465 res!292541) b!489467))

(declare-fun m!468853 () Bool)

(assert (=> b!489462 m!468853))

(declare-fun m!468855 () Bool)

(assert (=> start!44628 m!468855))

(declare-fun m!468857 () Bool)

(assert (=> start!44628 m!468857))

(declare-fun m!468859 () Bool)

(assert (=> b!489469 m!468859))

(declare-fun m!468861 () Bool)

(assert (=> b!489463 m!468861))

(declare-fun m!468863 () Bool)

(assert (=> b!489468 m!468863))

(declare-fun m!468865 () Bool)

(assert (=> b!489465 m!468865))

(declare-fun m!468867 () Bool)

(assert (=> b!489465 m!468867))

(declare-fun m!468869 () Bool)

(assert (=> b!489465 m!468869))

(declare-fun m!468871 () Bool)

(assert (=> b!489465 m!468871))

(assert (=> b!489465 m!468869))

(declare-fun m!468873 () Bool)

(assert (=> b!489465 m!468873))

(assert (=> b!489465 m!468869))

(declare-fun m!468875 () Bool)

(assert (=> b!489465 m!468875))

(assert (=> b!489465 m!468867))

(declare-fun m!468877 () Bool)

(assert (=> b!489465 m!468877))

(declare-fun m!468879 () Bool)

(assert (=> b!489465 m!468879))

(assert (=> b!489465 m!468867))

(declare-fun m!468881 () Bool)

(assert (=> b!489465 m!468881))

(assert (=> b!489464 m!468869))

(assert (=> b!489464 m!468869))

(declare-fun m!468883 () Bool)

(assert (=> b!489464 m!468883))

(assert (=> b!489467 m!468869))

(assert (=> b!489467 m!468869))

(declare-fun m!468885 () Bool)

(assert (=> b!489467 m!468885))

(declare-fun m!468887 () Bool)

(assert (=> b!489466 m!468887))

(check-sat (not b!489462) (not b!489464) (not b!489467) (not b!489465) (not b!489463) (not b!489469) (not start!44628) (not b!489466) (not b!489468))
(check-sat)
