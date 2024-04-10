; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30546 () Bool)

(assert start!30546)

(declare-fun b!305830 () Bool)

(declare-datatypes ((Unit!9441 0))(
  ( (Unit!9442) )
))
(declare-fun e!191962 () Unit!9441)

(declare-fun e!191963 () Unit!9441)

(assert (=> b!305830 (= e!191962 e!191963)))

(declare-fun c!49062 () Bool)

(declare-datatypes ((array!15550 0))(
  ( (array!15551 (arr!7360 (Array (_ BitVec 32) (_ BitVec 64))) (size!7712 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15550)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305830 (= c!49062 (or (= (select (arr!7360 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7360 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!162920 () Bool)

(declare-fun e!191965 () Bool)

(assert (=> start!30546 (=> (not res!162920) (not e!191965))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30546 (= res!162920 (validMask!0 mask!3709))))

(assert (=> start!30546 e!191965))

(declare-fun array_inv!5323 (array!15550) Bool)

(assert (=> start!30546 (array_inv!5323 a!3293)))

(assert (=> start!30546 true))

(declare-fun b!305831 () Bool)

(declare-fun res!162914 () Bool)

(assert (=> b!305831 (=> (not res!162914) (not e!191965))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305831 (= res!162914 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305832 () Bool)

(declare-fun Unit!9443 () Unit!9441)

(assert (=> b!305832 (= e!191962 Unit!9443)))

(declare-fun b!305833 () Bool)

(declare-fun res!162918 () Bool)

(declare-fun e!191961 () Bool)

(assert (=> b!305833 (=> (not res!162918) (not e!191961))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305833 (= res!162918 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7360 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!305834 () Bool)

(declare-fun res!162921 () Bool)

(assert (=> b!305834 (=> (not res!162921) (not e!191961))))

(declare-datatypes ((SeekEntryResult!2500 0))(
  ( (MissingZero!2500 (index!12176 (_ BitVec 32))) (Found!2500 (index!12177 (_ BitVec 32))) (Intermediate!2500 (undefined!3312 Bool) (index!12178 (_ BitVec 32)) (x!30431 (_ BitVec 32))) (Undefined!2500) (MissingVacant!2500 (index!12179 (_ BitVec 32))) )
))
(declare-fun lt!150834 () SeekEntryResult!2500)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15550 (_ BitVec 32)) SeekEntryResult!2500)

(assert (=> b!305834 (= res!162921 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150834))))

(declare-fun b!305835 () Bool)

(assert (=> b!305835 false))

(declare-fun lt!150832 () SeekEntryResult!2500)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305835 (= lt!150832 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9444 () Unit!9441)

(assert (=> b!305835 (= e!191963 Unit!9444)))

(declare-fun b!305836 () Bool)

(assert (=> b!305836 (= e!191961 (not true))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305836 (= index!1781 resIndex!52)))

(declare-fun lt!150833 () Unit!9441)

(assert (=> b!305836 (= lt!150833 e!191962)))

(declare-fun c!49061 () Bool)

(assert (=> b!305836 (= c!49061 (not (= resIndex!52 index!1781)))))

(declare-fun b!305837 () Bool)

(declare-fun res!162919 () Bool)

(assert (=> b!305837 (=> (not res!162919) (not e!191965))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15550 (_ BitVec 32)) SeekEntryResult!2500)

(assert (=> b!305837 (= res!162919 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2500 i!1240)))))

(declare-fun b!305838 () Bool)

(declare-fun res!162916 () Bool)

(assert (=> b!305838 (=> (not res!162916) (not e!191965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15550 (_ BitVec 32)) Bool)

(assert (=> b!305838 (= res!162916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305839 () Bool)

(declare-fun res!162913 () Bool)

(assert (=> b!305839 (=> (not res!162913) (not e!191965))))

(assert (=> b!305839 (= res!162913 (and (= (size!7712 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7712 a!3293))))))

(declare-fun b!305840 () Bool)

(assert (=> b!305840 false))

(declare-fun Unit!9445 () Unit!9441)

(assert (=> b!305840 (= e!191963 Unit!9445)))

(declare-fun b!305841 () Bool)

(assert (=> b!305841 (= e!191965 e!191961)))

(declare-fun res!162912 () Bool)

(assert (=> b!305841 (=> (not res!162912) (not e!191961))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305841 (= res!162912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150834))))

(assert (=> b!305841 (= lt!150834 (Intermediate!2500 false resIndex!52 resX!52))))

(declare-fun b!305842 () Bool)

(declare-fun res!162915 () Bool)

(assert (=> b!305842 (=> (not res!162915) (not e!191965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305842 (= res!162915 (validKeyInArray!0 k!2441))))

(declare-fun b!305843 () Bool)

(declare-fun res!162917 () Bool)

(assert (=> b!305843 (=> (not res!162917) (not e!191961))))

(assert (=> b!305843 (= res!162917 (and (= (select (arr!7360 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7712 a!3293))))))

(assert (= (and start!30546 res!162920) b!305839))

(assert (= (and b!305839 res!162913) b!305842))

(assert (= (and b!305842 res!162915) b!305831))

(assert (= (and b!305831 res!162914) b!305837))

(assert (= (and b!305837 res!162919) b!305838))

(assert (= (and b!305838 res!162916) b!305841))

(assert (= (and b!305841 res!162912) b!305843))

(assert (= (and b!305843 res!162917) b!305834))

(assert (= (and b!305834 res!162921) b!305833))

(assert (= (and b!305833 res!162918) b!305836))

(assert (= (and b!305836 c!49061) b!305830))

(assert (= (and b!305836 (not c!49061)) b!305832))

(assert (= (and b!305830 c!49062) b!305840))

(assert (= (and b!305830 (not c!49062)) b!305835))

(declare-fun m!316653 () Bool)

(assert (=> b!305838 m!316653))

(declare-fun m!316655 () Bool)

(assert (=> start!30546 m!316655))

(declare-fun m!316657 () Bool)

(assert (=> start!30546 m!316657))

(declare-fun m!316659 () Bool)

(assert (=> b!305843 m!316659))

(declare-fun m!316661 () Bool)

(assert (=> b!305831 m!316661))

(declare-fun m!316663 () Bool)

(assert (=> b!305830 m!316663))

(declare-fun m!316665 () Bool)

(assert (=> b!305842 m!316665))

(declare-fun m!316667 () Bool)

(assert (=> b!305834 m!316667))

(declare-fun m!316669 () Bool)

(assert (=> b!305841 m!316669))

(assert (=> b!305841 m!316669))

(declare-fun m!316671 () Bool)

(assert (=> b!305841 m!316671))

(assert (=> b!305833 m!316663))

(declare-fun m!316673 () Bool)

(assert (=> b!305837 m!316673))

(declare-fun m!316675 () Bool)

(assert (=> b!305835 m!316675))

(assert (=> b!305835 m!316675))

(declare-fun m!316677 () Bool)

(assert (=> b!305835 m!316677))

(push 1)

