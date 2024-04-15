; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50048 () Bool)

(assert start!50048)

(declare-fun res!341740 () Bool)

(declare-fun e!316724 () Bool)

(assert (=> start!50048 (=> (not res!341740) (not e!316724))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50048 (= res!341740 (validMask!0 mask!3119))))

(assert (=> start!50048 e!316724))

(assert (=> start!50048 true))

(declare-datatypes ((array!34594 0))(
  ( (array!34595 (arr!16616 (Array (_ BitVec 32) (_ BitVec 64))) (size!16981 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34594)

(declare-fun array_inv!12499 (array!34594) Bool)

(assert (=> start!50048 (array_inv!12499 a!3118)))

(declare-fun b!548271 () Bool)

(declare-fun res!341737 () Bool)

(declare-fun e!316723 () Bool)

(assert (=> b!548271 (=> (not res!341737) (not e!316723))))

(declare-datatypes ((List!10735 0))(
  ( (Nil!10732) (Cons!10731 (h!11701 (_ BitVec 64)) (t!16954 List!10735)) )
))
(declare-fun arrayNoDuplicates!0 (array!34594 (_ BitVec 32) List!10735) Bool)

(assert (=> b!548271 (= res!341737 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10732))))

(declare-fun b!548272 () Bool)

(declare-fun res!341734 () Bool)

(assert (=> b!548272 (=> (not res!341734) (not e!316724))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548272 (= res!341734 (validKeyInArray!0 k0!1914))))

(declare-fun b!548273 () Bool)

(assert (=> b!548273 (= e!316723 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!548274 () Bool)

(declare-fun res!341739 () Bool)

(assert (=> b!548274 (=> (not res!341739) (not e!316724))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548274 (= res!341739 (validKeyInArray!0 (select (arr!16616 a!3118) j!142)))))

(declare-fun b!548275 () Bool)

(assert (=> b!548275 (= e!316724 e!316723)))

(declare-fun res!341738 () Bool)

(assert (=> b!548275 (=> (not res!341738) (not e!316723))))

(declare-datatypes ((SeekEntryResult!5062 0))(
  ( (MissingZero!5062 (index!22475 (_ BitVec 32))) (Found!5062 (index!22476 (_ BitVec 32))) (Intermediate!5062 (undefined!5874 Bool) (index!22477 (_ BitVec 32)) (x!51424 (_ BitVec 32))) (Undefined!5062) (MissingVacant!5062 (index!22478 (_ BitVec 32))) )
))
(declare-fun lt!249631 () SeekEntryResult!5062)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548275 (= res!341738 (or (= lt!249631 (MissingZero!5062 i!1132)) (= lt!249631 (MissingVacant!5062 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34594 (_ BitVec 32)) SeekEntryResult!5062)

(assert (=> b!548275 (= lt!249631 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548276 () Bool)

(declare-fun res!341741 () Bool)

(assert (=> b!548276 (=> (not res!341741) (not e!316724))))

(declare-fun arrayContainsKey!0 (array!34594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548276 (= res!341741 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548277 () Bool)

(declare-fun res!341736 () Bool)

(assert (=> b!548277 (=> (not res!341736) (not e!316723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34594 (_ BitVec 32)) Bool)

(assert (=> b!548277 (= res!341736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548278 () Bool)

(declare-fun res!341735 () Bool)

(assert (=> b!548278 (=> (not res!341735) (not e!316724))))

(assert (=> b!548278 (= res!341735 (and (= (size!16981 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16981 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16981 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50048 res!341740) b!548278))

(assert (= (and b!548278 res!341735) b!548274))

(assert (= (and b!548274 res!341739) b!548272))

(assert (= (and b!548272 res!341734) b!548276))

(assert (= (and b!548276 res!341741) b!548275))

(assert (= (and b!548275 res!341738) b!548277))

(assert (= (and b!548277 res!341736) b!548271))

(assert (= (and b!548271 res!341737) b!548273))

(declare-fun m!524771 () Bool)

(assert (=> start!50048 m!524771))

(declare-fun m!524773 () Bool)

(assert (=> start!50048 m!524773))

(declare-fun m!524775 () Bool)

(assert (=> b!548271 m!524775))

(declare-fun m!524777 () Bool)

(assert (=> b!548274 m!524777))

(assert (=> b!548274 m!524777))

(declare-fun m!524779 () Bool)

(assert (=> b!548274 m!524779))

(declare-fun m!524781 () Bool)

(assert (=> b!548276 m!524781))

(declare-fun m!524783 () Bool)

(assert (=> b!548277 m!524783))

(declare-fun m!524785 () Bool)

(assert (=> b!548275 m!524785))

(declare-fun m!524787 () Bool)

(assert (=> b!548272 m!524787))

(check-sat (not b!548272) (not b!548274) (not b!548275) (not b!548277) (not b!548271) (not b!548276) (not start!50048))
(check-sat)
