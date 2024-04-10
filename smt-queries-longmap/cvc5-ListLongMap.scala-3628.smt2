; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50054 () Bool)

(assert start!50054)

(declare-fun res!341791 () Bool)

(declare-fun e!316871 () Bool)

(assert (=> start!50054 (=> (not res!341791) (not e!316871))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50054 (= res!341791 (validMask!0 mask!3119))))

(assert (=> start!50054 e!316871))

(assert (=> start!50054 true))

(declare-datatypes ((array!34591 0))(
  ( (array!34592 (arr!16614 (Array (_ BitVec 32) (_ BitVec 64))) (size!16978 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34591)

(declare-fun array_inv!12410 (array!34591) Bool)

(assert (=> start!50054 (array_inv!12410 a!3118)))

(declare-fun b!548470 () Bool)

(declare-fun res!341794 () Bool)

(assert (=> b!548470 (=> (not res!341794) (not e!316871))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548470 (= res!341794 (validKeyInArray!0 k!1914))))

(declare-fun b!548471 () Bool)

(declare-fun res!341798 () Bool)

(assert (=> b!548471 (=> (not res!341798) (not e!316871))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548471 (= res!341798 (validKeyInArray!0 (select (arr!16614 a!3118) j!142)))))

(declare-fun b!548472 () Bool)

(declare-fun res!341796 () Bool)

(declare-fun e!316872 () Bool)

(assert (=> b!548472 (=> (not res!341796) (not e!316872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34591 (_ BitVec 32)) Bool)

(assert (=> b!548472 (= res!341796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548473 () Bool)

(declare-fun res!341797 () Bool)

(assert (=> b!548473 (=> (not res!341797) (not e!316871))))

(declare-fun arrayContainsKey!0 (array!34591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548473 (= res!341797 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548474 () Bool)

(assert (=> b!548474 (= e!316872 false)))

(declare-fun lt!249850 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548474 (= lt!249850 (toIndex!0 (select (arr!16614 a!3118) j!142) mask!3119))))

(declare-fun b!548475 () Bool)

(declare-fun res!341795 () Bool)

(assert (=> b!548475 (=> (not res!341795) (not e!316872))))

(declare-datatypes ((List!10694 0))(
  ( (Nil!10691) (Cons!10690 (h!11660 (_ BitVec 64)) (t!16922 List!10694)) )
))
(declare-fun arrayNoDuplicates!0 (array!34591 (_ BitVec 32) List!10694) Bool)

(assert (=> b!548475 (= res!341795 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10691))))

(declare-fun b!548476 () Bool)

(declare-fun res!341792 () Bool)

(assert (=> b!548476 (=> (not res!341792) (not e!316871))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548476 (= res!341792 (and (= (size!16978 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16978 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16978 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548477 () Bool)

(assert (=> b!548477 (= e!316871 e!316872)))

(declare-fun res!341793 () Bool)

(assert (=> b!548477 (=> (not res!341793) (not e!316872))))

(declare-datatypes ((SeekEntryResult!5063 0))(
  ( (MissingZero!5063 (index!22479 (_ BitVec 32))) (Found!5063 (index!22480 (_ BitVec 32))) (Intermediate!5063 (undefined!5875 Bool) (index!22481 (_ BitVec 32)) (x!51422 (_ BitVec 32))) (Undefined!5063) (MissingVacant!5063 (index!22482 (_ BitVec 32))) )
))
(declare-fun lt!249849 () SeekEntryResult!5063)

(assert (=> b!548477 (= res!341793 (or (= lt!249849 (MissingZero!5063 i!1132)) (= lt!249849 (MissingVacant!5063 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34591 (_ BitVec 32)) SeekEntryResult!5063)

(assert (=> b!548477 (= lt!249849 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50054 res!341791) b!548476))

(assert (= (and b!548476 res!341792) b!548471))

(assert (= (and b!548471 res!341798) b!548470))

(assert (= (and b!548470 res!341794) b!548473))

(assert (= (and b!548473 res!341797) b!548477))

(assert (= (and b!548477 res!341793) b!548472))

(assert (= (and b!548472 res!341796) b!548475))

(assert (= (and b!548475 res!341795) b!548474))

(declare-fun m!525483 () Bool)

(assert (=> start!50054 m!525483))

(declare-fun m!525485 () Bool)

(assert (=> start!50054 m!525485))

(declare-fun m!525487 () Bool)

(assert (=> b!548475 m!525487))

(declare-fun m!525489 () Bool)

(assert (=> b!548473 m!525489))

(declare-fun m!525491 () Bool)

(assert (=> b!548470 m!525491))

(declare-fun m!525493 () Bool)

(assert (=> b!548471 m!525493))

(assert (=> b!548471 m!525493))

(declare-fun m!525495 () Bool)

(assert (=> b!548471 m!525495))

(declare-fun m!525497 () Bool)

(assert (=> b!548472 m!525497))

(declare-fun m!525499 () Bool)

(assert (=> b!548477 m!525499))

(assert (=> b!548474 m!525493))

(assert (=> b!548474 m!525493))

(declare-fun m!525501 () Bool)

(assert (=> b!548474 m!525501))

(push 1)

