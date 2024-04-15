; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32450 () Bool)

(assert start!32450)

(declare-fun b!324138 () Bool)

(declare-fun e!200095 () Bool)

(assert (=> b!324138 (= e!200095 false)))

(declare-fun lt!156562 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324138 (= lt!156562 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324139 () Bool)

(declare-fun res!177618 () Bool)

(declare-fun e!200094 () Bool)

(assert (=> b!324139 (=> (not res!177618) (not e!200094))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324139 (= res!177618 (validKeyInArray!0 k0!2497))))

(declare-fun b!324140 () Bool)

(assert (=> b!324140 (= e!200094 e!200095)))

(declare-fun res!177619 () Bool)

(assert (=> b!324140 (=> (not res!177619) (not e!200095))))

(declare-datatypes ((array!16593 0))(
  ( (array!16594 (arr!7854 (Array (_ BitVec 32) (_ BitVec 64))) (size!8207 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16593)

(declare-datatypes ((SeekEntryResult!2984 0))(
  ( (MissingZero!2984 (index!14112 (_ BitVec 32))) (Found!2984 (index!14113 (_ BitVec 32))) (Intermediate!2984 (undefined!3796 Bool) (index!14114 (_ BitVec 32)) (x!32375 (_ BitVec 32))) (Undefined!2984) (MissingVacant!2984 (index!14115 (_ BitVec 32))) )
))
(declare-fun lt!156563 () SeekEntryResult!2984)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16593 (_ BitVec 32)) SeekEntryResult!2984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324140 (= res!177619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156563))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324140 (= lt!156563 (Intermediate!2984 false resIndex!58 resX!58))))

(declare-fun res!177616 () Bool)

(assert (=> start!32450 (=> (not res!177616) (not e!200094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32450 (= res!177616 (validMask!0 mask!3777))))

(assert (=> start!32450 e!200094))

(declare-fun array_inv!5826 (array!16593) Bool)

(assert (=> start!32450 (array_inv!5826 a!3305)))

(assert (=> start!32450 true))

(declare-fun b!324141 () Bool)

(declare-fun res!177621 () Bool)

(assert (=> b!324141 (=> (not res!177621) (not e!200094))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16593 (_ BitVec 32)) SeekEntryResult!2984)

(assert (=> b!324141 (= res!177621 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2984 i!1250)))))

(declare-fun b!324142 () Bool)

(declare-fun res!177624 () Bool)

(assert (=> b!324142 (=> (not res!177624) (not e!200095))))

(assert (=> b!324142 (= res!177624 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7854 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324143 () Bool)

(declare-fun res!177617 () Bool)

(assert (=> b!324143 (=> (not res!177617) (not e!200095))))

(assert (=> b!324143 (= res!177617 (and (= (select (arr!7854 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8207 a!3305))))))

(declare-fun b!324144 () Bool)

(declare-fun res!177620 () Bool)

(assert (=> b!324144 (=> (not res!177620) (not e!200094))))

(declare-fun arrayContainsKey!0 (array!16593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324144 (= res!177620 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324145 () Bool)

(declare-fun res!177623 () Bool)

(assert (=> b!324145 (=> (not res!177623) (not e!200094))))

(assert (=> b!324145 (= res!177623 (and (= (size!8207 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8207 a!3305))))))

(declare-fun b!324146 () Bool)

(declare-fun res!177615 () Bool)

(assert (=> b!324146 (=> (not res!177615) (not e!200094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16593 (_ BitVec 32)) Bool)

(assert (=> b!324146 (= res!177615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324147 () Bool)

(declare-fun res!177622 () Bool)

(assert (=> b!324147 (=> (not res!177622) (not e!200095))))

(assert (=> b!324147 (= res!177622 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156563))))

(assert (= (and start!32450 res!177616) b!324145))

(assert (= (and b!324145 res!177623) b!324139))

(assert (= (and b!324139 res!177618) b!324144))

(assert (= (and b!324144 res!177620) b!324141))

(assert (= (and b!324141 res!177621) b!324146))

(assert (= (and b!324146 res!177615) b!324140))

(assert (= (and b!324140 res!177619) b!324143))

(assert (= (and b!324143 res!177617) b!324147))

(assert (= (and b!324147 res!177622) b!324142))

(assert (= (and b!324142 res!177624) b!324138))

(declare-fun m!330733 () Bool)

(assert (=> b!324147 m!330733))

(declare-fun m!330735 () Bool)

(assert (=> b!324139 m!330735))

(declare-fun m!330737 () Bool)

(assert (=> b!324141 m!330737))

(declare-fun m!330739 () Bool)

(assert (=> b!324143 m!330739))

(declare-fun m!330741 () Bool)

(assert (=> b!324142 m!330741))

(declare-fun m!330743 () Bool)

(assert (=> b!324140 m!330743))

(assert (=> b!324140 m!330743))

(declare-fun m!330745 () Bool)

(assert (=> b!324140 m!330745))

(declare-fun m!330747 () Bool)

(assert (=> start!32450 m!330747))

(declare-fun m!330749 () Bool)

(assert (=> start!32450 m!330749))

(declare-fun m!330751 () Bool)

(assert (=> b!324144 m!330751))

(declare-fun m!330753 () Bool)

(assert (=> b!324146 m!330753))

(declare-fun m!330755 () Bool)

(assert (=> b!324138 m!330755))

(check-sat (not b!324147) (not b!324144) (not start!32450) (not b!324141) (not b!324139) (not b!324146) (not b!324140) (not b!324138))
(check-sat)
