; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44646 () Bool)

(assert start!44646)

(declare-fun b!489704 () Bool)

(declare-fun res!292788 () Bool)

(declare-fun e!287927 () Bool)

(assert (=> b!489704 (=> (not res!292788) (not e!287927))))

(declare-datatypes ((array!31715 0))(
  ( (array!31716 (arr!15245 (Array (_ BitVec 32) (_ BitVec 64))) (size!15610 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31715)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489704 (= res!292788 (validKeyInArray!0 (select (arr!15245 a!3235) j!176)))))

(declare-fun b!489705 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!287928 () Bool)

(declare-datatypes ((SeekEntryResult!3709 0))(
  ( (MissingZero!3709 (index!17015 (_ BitVec 32))) (Found!3709 (index!17016 (_ BitVec 32))) (Intermediate!3709 (undefined!4521 Bool) (index!17017 (_ BitVec 32)) (x!46130 (_ BitVec 32))) (Undefined!3709) (MissingVacant!3709 (index!17018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31715 (_ BitVec 32)) SeekEntryResult!3709)

(assert (=> b!489705 (= e!287928 (= (seekEntryOrOpen!0 (select (arr!15245 a!3235) j!176) a!3235 mask!3524) (Found!3709 j!176)))))

(declare-fun b!489706 () Bool)

(declare-fun res!292789 () Bool)

(assert (=> b!489706 (=> (not res!292789) (not e!287927))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!489706 (= res!292789 (validKeyInArray!0 k0!2280))))

(declare-fun b!489707 () Bool)

(declare-fun e!287926 () Bool)

(assert (=> b!489707 (= e!287927 e!287926)))

(declare-fun res!292783 () Bool)

(assert (=> b!489707 (=> (not res!292783) (not e!287926))))

(declare-fun lt!220949 () SeekEntryResult!3709)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489707 (= res!292783 (or (= lt!220949 (MissingZero!3709 i!1204)) (= lt!220949 (MissingVacant!3709 i!1204))))))

(assert (=> b!489707 (= lt!220949 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489708 () Bool)

(declare-fun res!292787 () Bool)

(assert (=> b!489708 (=> (not res!292787) (not e!287927))))

(declare-fun arrayContainsKey!0 (array!31715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489708 (= res!292787 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!292785 () Bool)

(assert (=> start!44646 (=> (not res!292785) (not e!287927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44646 (= res!292785 (validMask!0 mask!3524))))

(assert (=> start!44646 e!287927))

(assert (=> start!44646 true))

(declare-fun array_inv!11128 (array!31715) Bool)

(assert (=> start!44646 (array_inv!11128 a!3235)))

(declare-fun b!489709 () Bool)

(declare-fun res!292786 () Bool)

(assert (=> b!489709 (=> (not res!292786) (not e!287926))))

(declare-datatypes ((List!9442 0))(
  ( (Nil!9439) (Cons!9438 (h!10300 (_ BitVec 64)) (t!15661 List!9442)) )
))
(declare-fun arrayNoDuplicates!0 (array!31715 (_ BitVec 32) List!9442) Bool)

(assert (=> b!489709 (= res!292786 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9439))))

(declare-fun b!489710 () Bool)

(assert (=> b!489710 (= e!287926 (not true))))

(declare-fun lt!220950 () (_ BitVec 32))

(declare-fun lt!220954 () SeekEntryResult!3709)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31715 (_ BitVec 32)) SeekEntryResult!3709)

(assert (=> b!489710 (= lt!220954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220950 (select (store (arr!15245 a!3235) i!1204 k0!2280) j!176) (array!31716 (store (arr!15245 a!3235) i!1204 k0!2280) (size!15610 a!3235)) mask!3524))))

(declare-fun lt!220952 () SeekEntryResult!3709)

(declare-fun lt!220953 () (_ BitVec 32))

(assert (=> b!489710 (= lt!220952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220953 (select (arr!15245 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489710 (= lt!220950 (toIndex!0 (select (store (arr!15245 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489710 (= lt!220953 (toIndex!0 (select (arr!15245 a!3235) j!176) mask!3524))))

(assert (=> b!489710 e!287928))

(declare-fun res!292790 () Bool)

(assert (=> b!489710 (=> (not res!292790) (not e!287928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31715 (_ BitVec 32)) Bool)

(assert (=> b!489710 (= res!292790 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14350 0))(
  ( (Unit!14351) )
))
(declare-fun lt!220951 () Unit!14350)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14350)

(assert (=> b!489710 (= lt!220951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489711 () Bool)

(declare-fun res!292784 () Bool)

(assert (=> b!489711 (=> (not res!292784) (not e!287926))))

(assert (=> b!489711 (= res!292784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489712 () Bool)

(declare-fun res!292782 () Bool)

(assert (=> b!489712 (=> (not res!292782) (not e!287927))))

(assert (=> b!489712 (= res!292782 (and (= (size!15610 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15610 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15610 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44646 res!292785) b!489712))

(assert (= (and b!489712 res!292782) b!489704))

(assert (= (and b!489704 res!292788) b!489706))

(assert (= (and b!489706 res!292789) b!489708))

(assert (= (and b!489708 res!292787) b!489707))

(assert (= (and b!489707 res!292783) b!489711))

(assert (= (and b!489711 res!292784) b!489709))

(assert (= (and b!489709 res!292786) b!489710))

(assert (= (and b!489710 res!292790) b!489705))

(declare-fun m!469177 () Bool)

(assert (=> b!489704 m!469177))

(assert (=> b!489704 m!469177))

(declare-fun m!469179 () Bool)

(assert (=> b!489704 m!469179))

(declare-fun m!469181 () Bool)

(assert (=> start!44646 m!469181))

(declare-fun m!469183 () Bool)

(assert (=> start!44646 m!469183))

(declare-fun m!469185 () Bool)

(assert (=> b!489711 m!469185))

(declare-fun m!469187 () Bool)

(assert (=> b!489707 m!469187))

(declare-fun m!469189 () Bool)

(assert (=> b!489708 m!469189))

(assert (=> b!489705 m!469177))

(assert (=> b!489705 m!469177))

(declare-fun m!469191 () Bool)

(assert (=> b!489705 m!469191))

(declare-fun m!469193 () Bool)

(assert (=> b!489706 m!469193))

(declare-fun m!469195 () Bool)

(assert (=> b!489710 m!469195))

(declare-fun m!469197 () Bool)

(assert (=> b!489710 m!469197))

(declare-fun m!469199 () Bool)

(assert (=> b!489710 m!469199))

(assert (=> b!489710 m!469199))

(declare-fun m!469201 () Bool)

(assert (=> b!489710 m!469201))

(assert (=> b!489710 m!469177))

(declare-fun m!469203 () Bool)

(assert (=> b!489710 m!469203))

(assert (=> b!489710 m!469177))

(declare-fun m!469205 () Bool)

(assert (=> b!489710 m!469205))

(assert (=> b!489710 m!469199))

(declare-fun m!469207 () Bool)

(assert (=> b!489710 m!469207))

(assert (=> b!489710 m!469177))

(declare-fun m!469209 () Bool)

(assert (=> b!489710 m!469209))

(declare-fun m!469211 () Bool)

(assert (=> b!489709 m!469211))

(check-sat (not b!489704) (not b!489710) (not b!489705) (not b!489706) (not b!489707) (not b!489708) (not b!489711) (not start!44646) (not b!489709))
(check-sat)
