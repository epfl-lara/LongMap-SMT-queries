; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49910 () Bool)

(assert start!49910)

(declare-fun res!341032 () Bool)

(declare-fun e!316291 () Bool)

(assert (=> start!49910 (=> (not res!341032) (not e!316291))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49910 (= res!341032 (validMask!0 mask!3119))))

(assert (=> start!49910 e!316291))

(assert (=> start!49910 true))

(declare-datatypes ((array!34540 0))(
  ( (array!34541 (arr!16592 (Array (_ BitVec 32) (_ BitVec 64))) (size!16957 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34540)

(declare-fun array_inv!12475 (array!34540) Bool)

(assert (=> start!49910 (array_inv!12475 a!3118)))

(declare-fun b!547389 () Bool)

(declare-fun e!316292 () Bool)

(assert (=> b!547389 (= e!316292 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!547390 () Bool)

(declare-fun res!341035 () Bool)

(assert (=> b!547390 (=> (not res!341035) (not e!316291))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547390 (= res!341035 (and (= (size!16957 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16957 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16957 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547391 () Bool)

(declare-fun res!341031 () Bool)

(assert (=> b!547391 (=> (not res!341031) (not e!316291))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547391 (= res!341031 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547392 () Bool)

(declare-fun res!341034 () Bool)

(assert (=> b!547392 (=> (not res!341034) (not e!316292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34540 (_ BitVec 32)) Bool)

(assert (=> b!547392 (= res!341034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547393 () Bool)

(assert (=> b!547393 (= e!316291 e!316292)))

(declare-fun res!341036 () Bool)

(assert (=> b!547393 (=> (not res!341036) (not e!316292))))

(declare-datatypes ((SeekEntryResult!5038 0))(
  ( (MissingZero!5038 (index!22379 (_ BitVec 32))) (Found!5038 (index!22380 (_ BitVec 32))) (Intermediate!5038 (undefined!5850 Bool) (index!22381 (_ BitVec 32)) (x!51333 (_ BitVec 32))) (Undefined!5038) (MissingVacant!5038 (index!22382 (_ BitVec 32))) )
))
(declare-fun lt!249379 () SeekEntryResult!5038)

(assert (=> b!547393 (= res!341036 (or (= lt!249379 (MissingZero!5038 i!1132)) (= lt!249379 (MissingVacant!5038 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34540 (_ BitVec 32)) SeekEntryResult!5038)

(assert (=> b!547393 (= lt!249379 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547394 () Bool)

(declare-fun res!341030 () Bool)

(assert (=> b!547394 (=> (not res!341030) (not e!316292))))

(declare-datatypes ((List!10711 0))(
  ( (Nil!10708) (Cons!10707 (h!11674 (_ BitVec 64)) (t!16930 List!10711)) )
))
(declare-fun arrayNoDuplicates!0 (array!34540 (_ BitVec 32) List!10711) Bool)

(assert (=> b!547394 (= res!341030 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10708))))

(declare-fun b!547395 () Bool)

(declare-fun res!341029 () Bool)

(assert (=> b!547395 (=> (not res!341029) (not e!316291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547395 (= res!341029 (validKeyInArray!0 k0!1914))))

(declare-fun b!547396 () Bool)

(declare-fun res!341033 () Bool)

(assert (=> b!547396 (=> (not res!341033) (not e!316291))))

(assert (=> b!547396 (= res!341033 (validKeyInArray!0 (select (arr!16592 a!3118) j!142)))))

(assert (= (and start!49910 res!341032) b!547390))

(assert (= (and b!547390 res!341035) b!547396))

(assert (= (and b!547396 res!341033) b!547395))

(assert (= (and b!547395 res!341029) b!547391))

(assert (= (and b!547391 res!341031) b!547393))

(assert (= (and b!547393 res!341036) b!547392))

(assert (= (and b!547392 res!341034) b!547394))

(assert (= (and b!547394 res!341030) b!547389))

(declare-fun m!524111 () Bool)

(assert (=> b!547395 m!524111))

(declare-fun m!524113 () Bool)

(assert (=> b!547394 m!524113))

(declare-fun m!524115 () Bool)

(assert (=> b!547392 m!524115))

(declare-fun m!524117 () Bool)

(assert (=> b!547396 m!524117))

(assert (=> b!547396 m!524117))

(declare-fun m!524119 () Bool)

(assert (=> b!547396 m!524119))

(declare-fun m!524121 () Bool)

(assert (=> b!547391 m!524121))

(declare-fun m!524123 () Bool)

(assert (=> start!49910 m!524123))

(declare-fun m!524125 () Bool)

(assert (=> start!49910 m!524125))

(declare-fun m!524127 () Bool)

(assert (=> b!547393 m!524127))

(check-sat (not b!547395) (not b!547391) (not b!547396) (not b!547394) (not b!547392) (not start!49910) (not b!547393))
(check-sat)
