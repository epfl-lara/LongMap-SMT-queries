; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44640 () Bool)

(assert start!44640)

(declare-fun b!489623 () Bool)

(declare-fun e!287892 () Bool)

(assert (=> b!489623 (= e!287892 (not true))))

(declare-datatypes ((SeekEntryResult!3706 0))(
  ( (MissingZero!3706 (index!17003 (_ BitVec 32))) (Found!3706 (index!17004 (_ BitVec 32))) (Intermediate!3706 (undefined!4518 Bool) (index!17005 (_ BitVec 32)) (x!46119 (_ BitVec 32))) (Undefined!3706) (MissingVacant!3706 (index!17006 (_ BitVec 32))) )
))
(declare-fun lt!220898 () SeekEntryResult!3706)

(declare-fun lt!220895 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31709 0))(
  ( (array!31710 (arr!15242 (Array (_ BitVec 32) (_ BitVec 64))) (size!15607 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31709)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31709 (_ BitVec 32)) SeekEntryResult!3706)

(assert (=> b!489623 (= lt!220898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220895 (select (store (arr!15242 a!3235) i!1204 k0!2280) j!176) (array!31710 (store (arr!15242 a!3235) i!1204 k0!2280) (size!15607 a!3235)) mask!3524))))

(declare-fun lt!220899 () (_ BitVec 32))

(declare-fun lt!220896 () SeekEntryResult!3706)

(assert (=> b!489623 (= lt!220896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220899 (select (arr!15242 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489623 (= lt!220895 (toIndex!0 (select (store (arr!15242 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489623 (= lt!220899 (toIndex!0 (select (arr!15242 a!3235) j!176) mask!3524))))

(declare-fun e!287891 () Bool)

(assert (=> b!489623 e!287891))

(declare-fun res!292704 () Bool)

(assert (=> b!489623 (=> (not res!292704) (not e!287891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31709 (_ BitVec 32)) Bool)

(assert (=> b!489623 (= res!292704 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14344 0))(
  ( (Unit!14345) )
))
(declare-fun lt!220897 () Unit!14344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14344)

(assert (=> b!489623 (= lt!220897 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489624 () Bool)

(declare-fun res!292701 () Bool)

(assert (=> b!489624 (=> (not res!292701) (not e!287892))))

(assert (=> b!489624 (= res!292701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489625 () Bool)

(declare-fun res!292709 () Bool)

(declare-fun e!287889 () Bool)

(assert (=> b!489625 (=> (not res!292709) (not e!287889))))

(declare-fun arrayContainsKey!0 (array!31709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489625 (= res!292709 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489626 () Bool)

(declare-fun res!292707 () Bool)

(assert (=> b!489626 (=> (not res!292707) (not e!287889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489626 (= res!292707 (validKeyInArray!0 k0!2280))))

(declare-fun b!489627 () Bool)

(assert (=> b!489627 (= e!287889 e!287892)))

(declare-fun res!292702 () Bool)

(assert (=> b!489627 (=> (not res!292702) (not e!287892))))

(declare-fun lt!220900 () SeekEntryResult!3706)

(assert (=> b!489627 (= res!292702 (or (= lt!220900 (MissingZero!3706 i!1204)) (= lt!220900 (MissingVacant!3706 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31709 (_ BitVec 32)) SeekEntryResult!3706)

(assert (=> b!489627 (= lt!220900 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!292705 () Bool)

(assert (=> start!44640 (=> (not res!292705) (not e!287889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44640 (= res!292705 (validMask!0 mask!3524))))

(assert (=> start!44640 e!287889))

(assert (=> start!44640 true))

(declare-fun array_inv!11125 (array!31709) Bool)

(assert (=> start!44640 (array_inv!11125 a!3235)))

(declare-fun b!489628 () Bool)

(declare-fun res!292706 () Bool)

(assert (=> b!489628 (=> (not res!292706) (not e!287892))))

(declare-datatypes ((List!9439 0))(
  ( (Nil!9436) (Cons!9435 (h!10297 (_ BitVec 64)) (t!15658 List!9439)) )
))
(declare-fun arrayNoDuplicates!0 (array!31709 (_ BitVec 32) List!9439) Bool)

(assert (=> b!489628 (= res!292706 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9436))))

(declare-fun b!489629 () Bool)

(assert (=> b!489629 (= e!287891 (= (seekEntryOrOpen!0 (select (arr!15242 a!3235) j!176) a!3235 mask!3524) (Found!3706 j!176)))))

(declare-fun b!489630 () Bool)

(declare-fun res!292708 () Bool)

(assert (=> b!489630 (=> (not res!292708) (not e!287889))))

(assert (=> b!489630 (= res!292708 (and (= (size!15607 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15607 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15607 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489631 () Bool)

(declare-fun res!292703 () Bool)

(assert (=> b!489631 (=> (not res!292703) (not e!287889))))

(assert (=> b!489631 (= res!292703 (validKeyInArray!0 (select (arr!15242 a!3235) j!176)))))

(assert (= (and start!44640 res!292705) b!489630))

(assert (= (and b!489630 res!292708) b!489631))

(assert (= (and b!489631 res!292703) b!489626))

(assert (= (and b!489626 res!292707) b!489625))

(assert (= (and b!489625 res!292709) b!489627))

(assert (= (and b!489627 res!292702) b!489624))

(assert (= (and b!489624 res!292701) b!489628))

(assert (= (and b!489628 res!292706) b!489623))

(assert (= (and b!489623 res!292704) b!489629))

(declare-fun m!469069 () Bool)

(assert (=> b!489628 m!469069))

(declare-fun m!469071 () Bool)

(assert (=> b!489627 m!469071))

(declare-fun m!469073 () Bool)

(assert (=> b!489625 m!469073))

(declare-fun m!469075 () Bool)

(assert (=> b!489631 m!469075))

(assert (=> b!489631 m!469075))

(declare-fun m!469077 () Bool)

(assert (=> b!489631 m!469077))

(declare-fun m!469079 () Bool)

(assert (=> start!44640 m!469079))

(declare-fun m!469081 () Bool)

(assert (=> start!44640 m!469081))

(declare-fun m!469083 () Bool)

(assert (=> b!489626 m!469083))

(declare-fun m!469085 () Bool)

(assert (=> b!489624 m!469085))

(assert (=> b!489629 m!469075))

(assert (=> b!489629 m!469075))

(declare-fun m!469087 () Bool)

(assert (=> b!489629 m!469087))

(assert (=> b!489623 m!469075))

(declare-fun m!469089 () Bool)

(assert (=> b!489623 m!469089))

(declare-fun m!469091 () Bool)

(assert (=> b!489623 m!469091))

(declare-fun m!469093 () Bool)

(assert (=> b!489623 m!469093))

(declare-fun m!469095 () Bool)

(assert (=> b!489623 m!469095))

(assert (=> b!489623 m!469095))

(declare-fun m!469097 () Bool)

(assert (=> b!489623 m!469097))

(assert (=> b!489623 m!469075))

(declare-fun m!469099 () Bool)

(assert (=> b!489623 m!469099))

(assert (=> b!489623 m!469075))

(declare-fun m!469101 () Bool)

(assert (=> b!489623 m!469101))

(assert (=> b!489623 m!469095))

(declare-fun m!469103 () Bool)

(assert (=> b!489623 m!469103))

(check-sat (not b!489624) (not b!489623) (not b!489631) (not b!489629) (not b!489628) (not b!489626) (not b!489627) (not start!44640) (not b!489625))
(check-sat)
