; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31806 () Bool)

(assert start!31806)

(declare-fun b!317889 () Bool)

(declare-fun res!172527 () Bool)

(declare-fun e!197586 () Bool)

(assert (=> b!317889 (=> (not res!172527) (not e!197586))))

(declare-datatypes ((array!16190 0))(
  ( (array!16191 (arr!7660 (Array (_ BitVec 32) (_ BitVec 64))) (size!8012 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16190)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317889 (= res!172527 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317890 () Bool)

(declare-fun e!197584 () Bool)

(assert (=> b!317890 (= e!197584 (not true))))

(declare-fun e!197583 () Bool)

(assert (=> b!317890 e!197583))

(declare-fun res!172526 () Bool)

(assert (=> b!317890 (=> (not res!172526) (not e!197583))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2765 0))(
  ( (MissingZero!2765 (index!13236 (_ BitVec 32))) (Found!2765 (index!13237 (_ BitVec 32))) (Intermediate!2765 (undefined!3577 Bool) (index!13238 (_ BitVec 32)) (x!31603 (_ BitVec 32))) (Undefined!2765) (MissingVacant!2765 (index!13239 (_ BitVec 32))) )
))
(declare-fun lt!155169 () SeekEntryResult!2765)

(declare-fun lt!155170 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16190 (_ BitVec 32)) SeekEntryResult!2765)

(assert (=> b!317890 (= res!172526 (= lt!155169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155170 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317890 (= lt!155170 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!317891 () Bool)

(declare-fun e!197585 () Bool)

(assert (=> b!317891 (= e!197585 e!197584)))

(declare-fun res!172519 () Bool)

(assert (=> b!317891 (=> (not res!172519) (not e!197584))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!155171 () SeekEntryResult!2765)

(assert (=> b!317891 (= res!172519 (and (= lt!155169 lt!155171) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7660 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317891 (= lt!155169 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317892 () Bool)

(assert (=> b!317892 (= e!197586 e!197585)))

(declare-fun res!172523 () Bool)

(assert (=> b!317892 (=> (not res!172523) (not e!197585))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317892 (= res!172523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155171))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317892 (= lt!155171 (Intermediate!2765 false resIndex!52 resX!52))))

(declare-fun lt!155172 () array!16190)

(declare-fun b!317893 () Bool)

(assert (=> b!317893 (= e!197583 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155172 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155170 k0!2441 lt!155172 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317893 (= lt!155172 (array!16191 (store (arr!7660 a!3293) i!1240 k0!2441) (size!8012 a!3293)))))

(declare-fun b!317894 () Bool)

(declare-fun res!172520 () Bool)

(assert (=> b!317894 (=> (not res!172520) (not e!197585))))

(assert (=> b!317894 (= res!172520 (and (= (select (arr!7660 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8012 a!3293))))))

(declare-fun b!317895 () Bool)

(declare-fun res!172525 () Bool)

(assert (=> b!317895 (=> (not res!172525) (not e!197586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16190 (_ BitVec 32)) Bool)

(assert (=> b!317895 (= res!172525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317896 () Bool)

(declare-fun res!172518 () Bool)

(assert (=> b!317896 (=> (not res!172518) (not e!197586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317896 (= res!172518 (validKeyInArray!0 k0!2441))))

(declare-fun b!317897 () Bool)

(declare-fun res!172522 () Bool)

(assert (=> b!317897 (=> (not res!172522) (not e!197586))))

(assert (=> b!317897 (= res!172522 (and (= (size!8012 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8012 a!3293))))))

(declare-fun res!172521 () Bool)

(assert (=> start!31806 (=> (not res!172521) (not e!197586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31806 (= res!172521 (validMask!0 mask!3709))))

(assert (=> start!31806 e!197586))

(declare-fun array_inv!5610 (array!16190) Bool)

(assert (=> start!31806 (array_inv!5610 a!3293)))

(assert (=> start!31806 true))

(declare-fun b!317898 () Bool)

(declare-fun res!172524 () Bool)

(assert (=> b!317898 (=> (not res!172524) (not e!197586))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16190 (_ BitVec 32)) SeekEntryResult!2765)

(assert (=> b!317898 (= res!172524 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2765 i!1240)))))

(assert (= (and start!31806 res!172521) b!317897))

(assert (= (and b!317897 res!172522) b!317896))

(assert (= (and b!317896 res!172518) b!317889))

(assert (= (and b!317889 res!172527) b!317898))

(assert (= (and b!317898 res!172524) b!317895))

(assert (= (and b!317895 res!172525) b!317892))

(assert (= (and b!317892 res!172523) b!317894))

(assert (= (and b!317894 res!172520) b!317891))

(assert (= (and b!317891 res!172519) b!317890))

(assert (= (and b!317890 res!172526) b!317893))

(declare-fun m!326779 () Bool)

(assert (=> start!31806 m!326779))

(declare-fun m!326781 () Bool)

(assert (=> start!31806 m!326781))

(declare-fun m!326783 () Bool)

(assert (=> b!317898 m!326783))

(declare-fun m!326785 () Bool)

(assert (=> b!317890 m!326785))

(declare-fun m!326787 () Bool)

(assert (=> b!317890 m!326787))

(declare-fun m!326789 () Bool)

(assert (=> b!317894 m!326789))

(declare-fun m!326791 () Bool)

(assert (=> b!317892 m!326791))

(assert (=> b!317892 m!326791))

(declare-fun m!326793 () Bool)

(assert (=> b!317892 m!326793))

(declare-fun m!326795 () Bool)

(assert (=> b!317893 m!326795))

(declare-fun m!326797 () Bool)

(assert (=> b!317893 m!326797))

(declare-fun m!326799 () Bool)

(assert (=> b!317893 m!326799))

(declare-fun m!326801 () Bool)

(assert (=> b!317889 m!326801))

(declare-fun m!326803 () Bool)

(assert (=> b!317895 m!326803))

(declare-fun m!326805 () Bool)

(assert (=> b!317896 m!326805))

(declare-fun m!326807 () Bool)

(assert (=> b!317891 m!326807))

(declare-fun m!326809 () Bool)

(assert (=> b!317891 m!326809))

(check-sat (not b!317890) (not b!317892) (not b!317898) (not b!317891) (not start!31806) (not b!317895) (not b!317889) (not b!317896) (not b!317893))
(check-sat)
