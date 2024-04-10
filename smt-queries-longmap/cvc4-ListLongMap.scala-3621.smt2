; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49926 () Bool)

(assert start!49926)

(declare-fun b!547708 () Bool)

(declare-fun e!316484 () Bool)

(declare-fun e!316485 () Bool)

(assert (=> b!547708 (= e!316484 e!316485)))

(declare-fun res!341207 () Bool)

(assert (=> b!547708 (=> (not res!341207) (not e!316485))))

(declare-datatypes ((SeekEntryResult!5044 0))(
  ( (MissingZero!5044 (index!22403 (_ BitVec 32))) (Found!5044 (index!22404 (_ BitVec 32))) (Intermediate!5044 (undefined!5856 Bool) (index!22405 (_ BitVec 32)) (x!51344 (_ BitVec 32))) (Undefined!5044) (MissingVacant!5044 (index!22406 (_ BitVec 32))) )
))
(declare-fun lt!249619 () SeekEntryResult!5044)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547708 (= res!341207 (or (= lt!249619 (MissingZero!5044 i!1132)) (= lt!249619 (MissingVacant!5044 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34547 0))(
  ( (array!34548 (arr!16595 (Array (_ BitVec 32) (_ BitVec 64))) (size!16959 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34547)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34547 (_ BitVec 32)) SeekEntryResult!5044)

(assert (=> b!547708 (= lt!249619 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547709 () Bool)

(assert (=> b!547709 (= e!316485 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!547710 () Bool)

(declare-fun res!341211 () Bool)

(assert (=> b!547710 (=> (not res!341211) (not e!316484))))

(declare-fun arrayContainsKey!0 (array!34547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547710 (= res!341211 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547712 () Bool)

(declare-fun res!341209 () Bool)

(assert (=> b!547712 (=> (not res!341209) (not e!316484))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547712 (= res!341209 (validKeyInArray!0 (select (arr!16595 a!3118) j!142)))))

(declare-fun b!547713 () Bool)

(declare-fun res!341210 () Bool)

(assert (=> b!547713 (=> (not res!341210) (not e!316485))))

(declare-datatypes ((List!10675 0))(
  ( (Nil!10672) (Cons!10671 (h!11638 (_ BitVec 64)) (t!16903 List!10675)) )
))
(declare-fun arrayNoDuplicates!0 (array!34547 (_ BitVec 32) List!10675) Bool)

(assert (=> b!547713 (= res!341210 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10672))))

(declare-fun b!547711 () Bool)

(declare-fun res!341212 () Bool)

(assert (=> b!547711 (=> (not res!341212) (not e!316484))))

(assert (=> b!547711 (= res!341212 (validKeyInArray!0 k!1914))))

(declare-fun res!341213 () Bool)

(assert (=> start!49926 (=> (not res!341213) (not e!316484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49926 (= res!341213 (validMask!0 mask!3119))))

(assert (=> start!49926 e!316484))

(assert (=> start!49926 true))

(declare-fun array_inv!12391 (array!34547) Bool)

(assert (=> start!49926 (array_inv!12391 a!3118)))

(declare-fun b!547714 () Bool)

(declare-fun res!341206 () Bool)

(assert (=> b!547714 (=> (not res!341206) (not e!316484))))

(assert (=> b!547714 (= res!341206 (and (= (size!16959 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16959 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16959 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547715 () Bool)

(declare-fun res!341208 () Bool)

(assert (=> b!547715 (=> (not res!341208) (not e!316485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34547 (_ BitVec 32)) Bool)

(assert (=> b!547715 (= res!341208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!49926 res!341213) b!547714))

(assert (= (and b!547714 res!341206) b!547712))

(assert (= (and b!547712 res!341209) b!547711))

(assert (= (and b!547711 res!341212) b!547710))

(assert (= (and b!547710 res!341211) b!547708))

(assert (= (and b!547708 res!341207) b!547715))

(assert (= (and b!547715 res!341208) b!547713))

(assert (= (and b!547713 res!341210) b!547709))

(declare-fun m!524919 () Bool)

(assert (=> b!547712 m!524919))

(assert (=> b!547712 m!524919))

(declare-fun m!524921 () Bool)

(assert (=> b!547712 m!524921))

(declare-fun m!524923 () Bool)

(assert (=> b!547715 m!524923))

(declare-fun m!524925 () Bool)

(assert (=> start!49926 m!524925))

(declare-fun m!524927 () Bool)

(assert (=> start!49926 m!524927))

(declare-fun m!524929 () Bool)

(assert (=> b!547710 m!524929))

(declare-fun m!524931 () Bool)

(assert (=> b!547708 m!524931))

(declare-fun m!524933 () Bool)

(assert (=> b!547711 m!524933))

(declare-fun m!524935 () Bool)

(assert (=> b!547713 m!524935))

(push 1)

(assert (not b!547711))

(assert (not b!547710))

(assert (not start!49926))

(assert (not b!547715))

(assert (not b!547713))

(assert (not b!547708))

(assert (not b!547712))

(check-sat)

