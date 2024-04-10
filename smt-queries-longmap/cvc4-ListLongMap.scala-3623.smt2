; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49980 () Bool)

(assert start!49980)

(declare-fun b!548005 () Bool)

(declare-fun res!341414 () Bool)

(declare-fun e!316647 () Bool)

(assert (=> b!548005 (=> (not res!341414) (not e!316647))))

(declare-datatypes ((array!34562 0))(
  ( (array!34563 (arr!16601 (Array (_ BitVec 32) (_ BitVec 64))) (size!16965 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34562)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548005 (= res!341414 (validKeyInArray!0 (select (arr!16601 a!3118) j!142)))))

(declare-fun b!548006 () Bool)

(declare-fun e!316646 () Bool)

(assert (=> b!548006 (= e!316646 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!249699 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548006 (= lt!249699 (toIndex!0 (select (arr!16601 a!3118) j!142) mask!3119))))

(declare-fun b!548007 () Bool)

(declare-fun res!341413 () Bool)

(assert (=> b!548007 (=> (not res!341413) (not e!316646))))

(declare-datatypes ((List!10681 0))(
  ( (Nil!10678) (Cons!10677 (h!11644 (_ BitVec 64)) (t!16909 List!10681)) )
))
(declare-fun arrayNoDuplicates!0 (array!34562 (_ BitVec 32) List!10681) Bool)

(assert (=> b!548007 (= res!341413 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10678))))

(declare-fun b!548008 () Bool)

(assert (=> b!548008 (= e!316647 e!316646)))

(declare-fun res!341420 () Bool)

(assert (=> b!548008 (=> (not res!341420) (not e!316646))))

(declare-datatypes ((SeekEntryResult!5050 0))(
  ( (MissingZero!5050 (index!22427 (_ BitVec 32))) (Found!5050 (index!22428 (_ BitVec 32))) (Intermediate!5050 (undefined!5862 Bool) (index!22429 (_ BitVec 32)) (x!51366 (_ BitVec 32))) (Undefined!5050) (MissingVacant!5050 (index!22430 (_ BitVec 32))) )
))
(declare-fun lt!249700 () SeekEntryResult!5050)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548008 (= res!341420 (or (= lt!249700 (MissingZero!5050 i!1132)) (= lt!249700 (MissingVacant!5050 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34562 (_ BitVec 32)) SeekEntryResult!5050)

(assert (=> b!548008 (= lt!249700 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548009 () Bool)

(declare-fun res!341416 () Bool)

(assert (=> b!548009 (=> (not res!341416) (not e!316646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34562 (_ BitVec 32)) Bool)

(assert (=> b!548009 (= res!341416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548011 () Bool)

(declare-fun res!341418 () Bool)

(assert (=> b!548011 (=> (not res!341418) (not e!316647))))

(assert (=> b!548011 (= res!341418 (and (= (size!16965 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16965 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16965 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548012 () Bool)

(declare-fun res!341415 () Bool)

(assert (=> b!548012 (=> (not res!341415) (not e!316647))))

(declare-fun arrayContainsKey!0 (array!34562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548012 (= res!341415 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548010 () Bool)

(declare-fun res!341419 () Bool)

(assert (=> b!548010 (=> (not res!341419) (not e!316647))))

(assert (=> b!548010 (= res!341419 (validKeyInArray!0 k!1914))))

(declare-fun res!341417 () Bool)

(assert (=> start!49980 (=> (not res!341417) (not e!316647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49980 (= res!341417 (validMask!0 mask!3119))))

(assert (=> start!49980 e!316647))

(assert (=> start!49980 true))

(declare-fun array_inv!12397 (array!34562) Bool)

(assert (=> start!49980 (array_inv!12397 a!3118)))

(assert (= (and start!49980 res!341417) b!548011))

(assert (= (and b!548011 res!341418) b!548005))

(assert (= (and b!548005 res!341414) b!548010))

(assert (= (and b!548010 res!341419) b!548012))

(assert (= (and b!548012 res!341415) b!548008))

(assert (= (and b!548008 res!341420) b!548009))

(assert (= (and b!548009 res!341416) b!548007))

(assert (= (and b!548007 res!341413) b!548006))

(declare-fun m!525127 () Bool)

(assert (=> b!548009 m!525127))

(declare-fun m!525129 () Bool)

(assert (=> b!548005 m!525129))

(assert (=> b!548005 m!525129))

(declare-fun m!525131 () Bool)

(assert (=> b!548005 m!525131))

(declare-fun m!525133 () Bool)

(assert (=> b!548010 m!525133))

(declare-fun m!525135 () Bool)

(assert (=> b!548008 m!525135))

(declare-fun m!525137 () Bool)

(assert (=> b!548012 m!525137))

(assert (=> b!548006 m!525129))

(assert (=> b!548006 m!525129))

(declare-fun m!525139 () Bool)

(assert (=> b!548006 m!525139))

(declare-fun m!525141 () Bool)

(assert (=> start!49980 m!525141))

(declare-fun m!525143 () Bool)

(assert (=> start!49980 m!525143))

(declare-fun m!525145 () Bool)

(assert (=> b!548007 m!525145))

(push 1)

(assert (not b!548005))

(assert (not start!49980))

(assert (not b!548006))

(assert (not b!548010))

(assert (not b!548008))

