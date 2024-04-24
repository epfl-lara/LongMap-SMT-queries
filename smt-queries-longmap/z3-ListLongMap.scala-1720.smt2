; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31704 () Bool)

(assert start!31704)

(declare-fun res!171718 () Bool)

(declare-fun e!197062 () Bool)

(assert (=> start!31704 (=> (not res!171718) (not e!197062))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31704 (= res!171718 (validMask!0 mask!3709))))

(assert (=> start!31704 e!197062))

(declare-datatypes ((array!16139 0))(
  ( (array!16140 (arr!7636 (Array (_ BitVec 32) (_ BitVec 64))) (size!7988 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16139)

(declare-fun array_inv!5586 (array!16139) Bool)

(assert (=> start!31704 (array_inv!5586 a!3293)))

(assert (=> start!31704 true))

(declare-fun b!316888 () Bool)

(declare-fun res!171713 () Bool)

(assert (=> b!316888 (=> (not res!171713) (not e!197062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16139 (_ BitVec 32)) Bool)

(assert (=> b!316888 (= res!171713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316889 () Bool)

(declare-fun e!197063 () Bool)

(assert (=> b!316889 (= e!197063 (not true))))

(declare-datatypes ((SeekEntryResult!2741 0))(
  ( (MissingZero!2741 (index!13140 (_ BitVec 32))) (Found!2741 (index!13141 (_ BitVec 32))) (Intermediate!2741 (undefined!3553 Bool) (index!13142 (_ BitVec 32)) (x!31506 (_ BitVec 32))) (Undefined!2741) (MissingVacant!2741 (index!13143 (_ BitVec 32))) )
))
(declare-fun lt!154773 () SeekEntryResult!2741)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16139 (_ BitVec 32)) SeekEntryResult!2741)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316889 (= lt!154773 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316890 () Bool)

(declare-fun res!171714 () Bool)

(assert (=> b!316890 (=> (not res!171714) (not e!197062))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316890 (= res!171714 (and (= (size!7988 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7988 a!3293))))))

(declare-fun b!316891 () Bool)

(declare-fun res!171717 () Bool)

(assert (=> b!316891 (=> (not res!171717) (not e!197062))))

(declare-fun arrayContainsKey!0 (array!16139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316891 (= res!171717 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316892 () Bool)

(declare-fun e!197064 () Bool)

(assert (=> b!316892 (= e!197064 e!197063)))

(declare-fun res!171712 () Bool)

(assert (=> b!316892 (=> (not res!171712) (not e!197063))))

(declare-fun lt!154772 () SeekEntryResult!2741)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!316892 (= res!171712 (and (= lt!154773 lt!154772) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7636 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316892 (= lt!154773 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!316893 () Bool)

(declare-fun res!171720 () Bool)

(assert (=> b!316893 (=> (not res!171720) (not e!197062))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16139 (_ BitVec 32)) SeekEntryResult!2741)

(assert (=> b!316893 (= res!171720 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2741 i!1240)))))

(declare-fun b!316894 () Bool)

(assert (=> b!316894 (= e!197062 e!197064)))

(declare-fun res!171716 () Bool)

(assert (=> b!316894 (=> (not res!171716) (not e!197064))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316894 (= res!171716 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154772))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316894 (= lt!154772 (Intermediate!2741 false resIndex!52 resX!52))))

(declare-fun b!316895 () Bool)

(declare-fun res!171715 () Bool)

(assert (=> b!316895 (=> (not res!171715) (not e!197064))))

(assert (=> b!316895 (= res!171715 (and (= (select (arr!7636 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7988 a!3293))))))

(declare-fun b!316896 () Bool)

(declare-fun res!171719 () Bool)

(assert (=> b!316896 (=> (not res!171719) (not e!197062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316896 (= res!171719 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31704 res!171718) b!316890))

(assert (= (and b!316890 res!171714) b!316896))

(assert (= (and b!316896 res!171719) b!316891))

(assert (= (and b!316891 res!171717) b!316893))

(assert (= (and b!316893 res!171720) b!316888))

(assert (= (and b!316888 res!171713) b!316894))

(assert (= (and b!316894 res!171716) b!316895))

(assert (= (and b!316895 res!171715) b!316892))

(assert (= (and b!316892 res!171712) b!316889))

(declare-fun m!325849 () Bool)

(assert (=> b!316894 m!325849))

(assert (=> b!316894 m!325849))

(declare-fun m!325851 () Bool)

(assert (=> b!316894 m!325851))

(declare-fun m!325853 () Bool)

(assert (=> start!31704 m!325853))

(declare-fun m!325855 () Bool)

(assert (=> start!31704 m!325855))

(declare-fun m!325857 () Bool)

(assert (=> b!316895 m!325857))

(declare-fun m!325859 () Bool)

(assert (=> b!316893 m!325859))

(declare-fun m!325861 () Bool)

(assert (=> b!316892 m!325861))

(declare-fun m!325863 () Bool)

(assert (=> b!316892 m!325863))

(declare-fun m!325865 () Bool)

(assert (=> b!316888 m!325865))

(declare-fun m!325867 () Bool)

(assert (=> b!316889 m!325867))

(assert (=> b!316889 m!325867))

(declare-fun m!325869 () Bool)

(assert (=> b!316889 m!325869))

(declare-fun m!325871 () Bool)

(assert (=> b!316896 m!325871))

(declare-fun m!325873 () Bool)

(assert (=> b!316891 m!325873))

(check-sat (not b!316891) (not b!316893) (not b!316894) (not start!31704) (not b!316892) (not b!316896) (not b!316888) (not b!316889))
(check-sat)
