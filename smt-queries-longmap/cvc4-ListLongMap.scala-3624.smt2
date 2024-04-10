; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49986 () Bool)

(assert start!49986)

(declare-fun b!548078 () Bool)

(declare-fun res!341488 () Bool)

(declare-fun e!316673 () Bool)

(assert (=> b!548078 (=> (not res!341488) (not e!316673))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34568 0))(
  ( (array!34569 (arr!16604 (Array (_ BitVec 32) (_ BitVec 64))) (size!16968 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34568)

(assert (=> b!548078 (= res!341488 (and (= (size!16968 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16968 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16968 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548079 () Bool)

(declare-fun e!316672 () Bool)

(assert (=> b!548079 (= e!316672 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!249718 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548079 (= lt!249718 (toIndex!0 (select (arr!16604 a!3118) j!142) mask!3119))))

(declare-fun b!548080 () Bool)

(declare-fun res!341490 () Bool)

(assert (=> b!548080 (=> (not res!341490) (not e!316673))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548080 (= res!341490 (validKeyInArray!0 k!1914))))

(declare-fun b!548081 () Bool)

(declare-fun res!341487 () Bool)

(assert (=> b!548081 (=> (not res!341487) (not e!316673))))

(declare-fun arrayContainsKey!0 (array!34568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548081 (= res!341487 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548082 () Bool)

(declare-fun res!341485 () Bool)

(assert (=> b!548082 (=> (not res!341485) (not e!316672))))

(declare-datatypes ((List!10684 0))(
  ( (Nil!10681) (Cons!10680 (h!11647 (_ BitVec 64)) (t!16912 List!10684)) )
))
(declare-fun arrayNoDuplicates!0 (array!34568 (_ BitVec 32) List!10684) Bool)

(assert (=> b!548082 (= res!341485 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10681))))

(declare-fun b!548077 () Bool)

(declare-fun res!341492 () Bool)

(assert (=> b!548077 (=> (not res!341492) (not e!316673))))

(assert (=> b!548077 (= res!341492 (validKeyInArray!0 (select (arr!16604 a!3118) j!142)))))

(declare-fun res!341489 () Bool)

(assert (=> start!49986 (=> (not res!341489) (not e!316673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49986 (= res!341489 (validMask!0 mask!3119))))

(assert (=> start!49986 e!316673))

(assert (=> start!49986 true))

(declare-fun array_inv!12400 (array!34568) Bool)

(assert (=> start!49986 (array_inv!12400 a!3118)))

(declare-fun b!548083 () Bool)

(assert (=> b!548083 (= e!316673 e!316672)))

(declare-fun res!341486 () Bool)

(assert (=> b!548083 (=> (not res!341486) (not e!316672))))

(declare-datatypes ((SeekEntryResult!5053 0))(
  ( (MissingZero!5053 (index!22439 (_ BitVec 32))) (Found!5053 (index!22440 (_ BitVec 32))) (Intermediate!5053 (undefined!5865 Bool) (index!22441 (_ BitVec 32)) (x!51377 (_ BitVec 32))) (Undefined!5053) (MissingVacant!5053 (index!22442 (_ BitVec 32))) )
))
(declare-fun lt!249717 () SeekEntryResult!5053)

(assert (=> b!548083 (= res!341486 (or (= lt!249717 (MissingZero!5053 i!1132)) (= lt!249717 (MissingVacant!5053 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34568 (_ BitVec 32)) SeekEntryResult!5053)

(assert (=> b!548083 (= lt!249717 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548084 () Bool)

(declare-fun res!341491 () Bool)

(assert (=> b!548084 (=> (not res!341491) (not e!316672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34568 (_ BitVec 32)) Bool)

(assert (=> b!548084 (= res!341491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!49986 res!341489) b!548078))

(assert (= (and b!548078 res!341488) b!548077))

(assert (= (and b!548077 res!341492) b!548080))

(assert (= (and b!548080 res!341490) b!548081))

(assert (= (and b!548081 res!341487) b!548083))

(assert (= (and b!548083 res!341486) b!548084))

(assert (= (and b!548084 res!341491) b!548082))

(assert (= (and b!548082 res!341485) b!548079))

(declare-fun m!525187 () Bool)

(assert (=> b!548081 m!525187))

(declare-fun m!525189 () Bool)

(assert (=> b!548084 m!525189))

(declare-fun m!525191 () Bool)

(assert (=> b!548079 m!525191))

(assert (=> b!548079 m!525191))

(declare-fun m!525193 () Bool)

(assert (=> b!548079 m!525193))

(declare-fun m!525195 () Bool)

(assert (=> start!49986 m!525195))

(declare-fun m!525197 () Bool)

(assert (=> start!49986 m!525197))

(declare-fun m!525199 () Bool)

(assert (=> b!548082 m!525199))

(declare-fun m!525201 () Bool)

(assert (=> b!548083 m!525201))

(assert (=> b!548077 m!525191))

(assert (=> b!548077 m!525191))

(declare-fun m!525203 () Bool)

(assert (=> b!548077 m!525203))

(declare-fun m!525205 () Bool)

(assert (=> b!548080 m!525205))

(push 1)

(assert (not b!548077))

(assert (not b!548083))

(assert (not b!548082))

(assert (not b!548084))

(assert (not b!548080))

(assert (not b!548079))

(assert (not b!548081))

(assert (not start!49986))

(check-sat)

