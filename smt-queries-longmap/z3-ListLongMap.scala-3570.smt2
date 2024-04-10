; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49100 () Bool)

(assert start!49100)

(declare-fun b!540836 () Bool)

(declare-fun res!335723 () Bool)

(declare-fun e!313283 () Bool)

(assert (=> b!540836 (=> (not res!335723) (not e!313283))))

(declare-datatypes ((array!34210 0))(
  ( (array!34211 (arr!16441 (Array (_ BitVec 32) (_ BitVec 64))) (size!16805 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34210)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540836 (= res!335723 (validKeyInArray!0 (select (arr!16441 a!3154) j!147)))))

(declare-fun b!540837 () Bool)

(declare-fun res!335724 () Bool)

(assert (=> b!540837 (=> (not res!335724) (not e!313283))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540837 (= res!335724 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540838 () Bool)

(declare-fun res!335728 () Bool)

(declare-fun e!313284 () Bool)

(assert (=> b!540838 (=> (not res!335728) (not e!313284))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!540838 (= res!335728 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16805 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16805 a!3154)) (= (select (arr!16441 a!3154) resIndex!32) (select (arr!16441 a!3154) j!147))))))

(declare-fun b!540839 () Bool)

(declare-fun res!335732 () Bool)

(assert (=> b!540839 (=> (not res!335732) (not e!313284))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34210 (_ BitVec 32)) Bool)

(assert (=> b!540839 (= res!335732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!335731 () Bool)

(assert (=> start!49100 (=> (not res!335731) (not e!313283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49100 (= res!335731 (validMask!0 mask!3216))))

(assert (=> start!49100 e!313283))

(assert (=> start!49100 true))

(declare-fun array_inv!12237 (array!34210) Bool)

(assert (=> start!49100 (array_inv!12237 a!3154)))

(declare-fun b!540840 () Bool)

(assert (=> b!540840 (= e!313283 e!313284)))

(declare-fun res!335726 () Bool)

(assert (=> b!540840 (=> (not res!335726) (not e!313284))))

(declare-datatypes ((SeekEntryResult!4899 0))(
  ( (MissingZero!4899 (index!21820 (_ BitVec 32))) (Found!4899 (index!21821 (_ BitVec 32))) (Intermediate!4899 (undefined!5711 Bool) (index!21822 (_ BitVec 32)) (x!50734 (_ BitVec 32))) (Undefined!4899) (MissingVacant!4899 (index!21823 (_ BitVec 32))) )
))
(declare-fun lt!247501 () SeekEntryResult!4899)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540840 (= res!335726 (or (= lt!247501 (MissingZero!4899 i!1153)) (= lt!247501 (MissingVacant!4899 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34210 (_ BitVec 32)) SeekEntryResult!4899)

(assert (=> b!540840 (= lt!247501 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540841 () Bool)

(declare-fun res!335725 () Bool)

(assert (=> b!540841 (=> (not res!335725) (not e!313283))))

(assert (=> b!540841 (= res!335725 (and (= (size!16805 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16805 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16805 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540842 () Bool)

(declare-fun res!335730 () Bool)

(assert (=> b!540842 (=> (not res!335730) (not e!313283))))

(assert (=> b!540842 (= res!335730 (validKeyInArray!0 k0!1998))))

(declare-fun b!540843 () Bool)

(declare-fun res!335729 () Bool)

(assert (=> b!540843 (=> (not res!335729) (not e!313284))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34210 (_ BitVec 32)) SeekEntryResult!4899)

(assert (=> b!540843 (= res!335729 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16441 a!3154) j!147) a!3154 mask!3216) (Intermediate!4899 false resIndex!32 resX!32)))))

(declare-fun b!540844 () Bool)

(declare-fun res!335727 () Bool)

(assert (=> b!540844 (=> (not res!335727) (not e!313284))))

(declare-datatypes ((List!10560 0))(
  ( (Nil!10557) (Cons!10556 (h!11505 (_ BitVec 64)) (t!16788 List!10560)) )
))
(declare-fun arrayNoDuplicates!0 (array!34210 (_ BitVec 32) List!10560) Bool)

(assert (=> b!540844 (= res!335727 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10557))))

(declare-fun b!540845 () Bool)

(assert (=> b!540845 (= e!313284 false)))

(declare-fun lt!247500 () SeekEntryResult!4899)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540845 (= lt!247500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16441 a!3154) j!147) mask!3216) (select (arr!16441 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49100 res!335731) b!540841))

(assert (= (and b!540841 res!335725) b!540836))

(assert (= (and b!540836 res!335723) b!540842))

(assert (= (and b!540842 res!335730) b!540837))

(assert (= (and b!540837 res!335724) b!540840))

(assert (= (and b!540840 res!335726) b!540839))

(assert (= (and b!540839 res!335732) b!540844))

(assert (= (and b!540844 res!335727) b!540838))

(assert (= (and b!540838 res!335728) b!540843))

(assert (= (and b!540843 res!335729) b!540845))

(declare-fun m!519491 () Bool)

(assert (=> b!540837 m!519491))

(declare-fun m!519493 () Bool)

(assert (=> b!540843 m!519493))

(assert (=> b!540843 m!519493))

(declare-fun m!519495 () Bool)

(assert (=> b!540843 m!519495))

(declare-fun m!519497 () Bool)

(assert (=> b!540840 m!519497))

(assert (=> b!540836 m!519493))

(assert (=> b!540836 m!519493))

(declare-fun m!519499 () Bool)

(assert (=> b!540836 m!519499))

(declare-fun m!519501 () Bool)

(assert (=> b!540839 m!519501))

(assert (=> b!540845 m!519493))

(assert (=> b!540845 m!519493))

(declare-fun m!519503 () Bool)

(assert (=> b!540845 m!519503))

(assert (=> b!540845 m!519503))

(assert (=> b!540845 m!519493))

(declare-fun m!519505 () Bool)

(assert (=> b!540845 m!519505))

(declare-fun m!519507 () Bool)

(assert (=> start!49100 m!519507))

(declare-fun m!519509 () Bool)

(assert (=> start!49100 m!519509))

(declare-fun m!519511 () Bool)

(assert (=> b!540844 m!519511))

(declare-fun m!519513 () Bool)

(assert (=> b!540842 m!519513))

(declare-fun m!519515 () Bool)

(assert (=> b!540838 m!519515))

(assert (=> b!540838 m!519493))

(check-sat (not start!49100) (not b!540842) (not b!540840) (not b!540843) (not b!540845) (not b!540836) (not b!540844) (not b!540837) (not b!540839))
(check-sat)
