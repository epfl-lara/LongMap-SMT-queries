; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50060 () Bool)

(assert start!50060)

(declare-fun b!548542 () Bool)

(declare-fun res!341870 () Bool)

(declare-fun e!316898 () Bool)

(assert (=> b!548542 (=> (not res!341870) (not e!316898))))

(declare-datatypes ((array!34597 0))(
  ( (array!34598 (arr!16617 (Array (_ BitVec 32) (_ BitVec 64))) (size!16981 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34597)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34597 (_ BitVec 32)) Bool)

(assert (=> b!548542 (= res!341870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!341869 () Bool)

(declare-fun e!316897 () Bool)

(assert (=> start!50060 (=> (not res!341869) (not e!316897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50060 (= res!341869 (validMask!0 mask!3119))))

(assert (=> start!50060 e!316897))

(assert (=> start!50060 true))

(declare-fun array_inv!12413 (array!34597) Bool)

(assert (=> start!50060 (array_inv!12413 a!3118)))

(declare-fun b!548543 () Bool)

(declare-fun res!341866 () Bool)

(assert (=> b!548543 (=> (not res!341866) (not e!316898))))

(declare-datatypes ((List!10697 0))(
  ( (Nil!10694) (Cons!10693 (h!11663 (_ BitVec 64)) (t!16925 List!10697)) )
))
(declare-fun arrayNoDuplicates!0 (array!34597 (_ BitVec 32) List!10697) Bool)

(assert (=> b!548543 (= res!341866 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10694))))

(declare-fun b!548544 () Bool)

(declare-fun res!341867 () Bool)

(assert (=> b!548544 (=> (not res!341867) (not e!316897))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548544 (= res!341867 (and (= (size!16981 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16981 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16981 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548545 () Bool)

(declare-fun res!341863 () Bool)

(assert (=> b!548545 (=> (not res!341863) (not e!316897))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548545 (= res!341863 (validKeyInArray!0 k!1914))))

(declare-fun b!548546 () Bool)

(declare-fun res!341865 () Bool)

(assert (=> b!548546 (=> (not res!341865) (not e!316897))))

(declare-fun arrayContainsKey!0 (array!34597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548546 (= res!341865 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548547 () Bool)

(assert (=> b!548547 (= e!316897 e!316898)))

(declare-fun res!341864 () Bool)

(assert (=> b!548547 (=> (not res!341864) (not e!316898))))

(declare-datatypes ((SeekEntryResult!5066 0))(
  ( (MissingZero!5066 (index!22491 (_ BitVec 32))) (Found!5066 (index!22492 (_ BitVec 32))) (Intermediate!5066 (undefined!5878 Bool) (index!22493 (_ BitVec 32)) (x!51433 (_ BitVec 32))) (Undefined!5066) (MissingVacant!5066 (index!22494 (_ BitVec 32))) )
))
(declare-fun lt!249865 () SeekEntryResult!5066)

(assert (=> b!548547 (= res!341864 (or (= lt!249865 (MissingZero!5066 i!1132)) (= lt!249865 (MissingVacant!5066 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34597 (_ BitVec 32)) SeekEntryResult!5066)

(assert (=> b!548547 (= lt!249865 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548548 () Bool)

(assert (=> b!548548 (= e!316898 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!548549 () Bool)

(declare-fun res!341868 () Bool)

(assert (=> b!548549 (=> (not res!341868) (not e!316897))))

(assert (=> b!548549 (= res!341868 (validKeyInArray!0 (select (arr!16617 a!3118) j!142)))))

(assert (= (and start!50060 res!341869) b!548544))

(assert (= (and b!548544 res!341867) b!548549))

(assert (= (and b!548549 res!341868) b!548545))

(assert (= (and b!548545 res!341863) b!548546))

(assert (= (and b!548546 res!341865) b!548547))

(assert (= (and b!548547 res!341864) b!548542))

(assert (= (and b!548542 res!341870) b!548543))

(assert (= (and b!548543 res!341866) b!548548))

(declare-fun m!525543 () Bool)

(assert (=> b!548543 m!525543))

(declare-fun m!525545 () Bool)

(assert (=> b!548549 m!525545))

(assert (=> b!548549 m!525545))

(declare-fun m!525547 () Bool)

(assert (=> b!548549 m!525547))

(declare-fun m!525549 () Bool)

(assert (=> b!548546 m!525549))

(declare-fun m!525551 () Bool)

(assert (=> b!548545 m!525551))

(declare-fun m!525553 () Bool)

(assert (=> b!548542 m!525553))

(declare-fun m!525555 () Bool)

(assert (=> start!50060 m!525555))

(declare-fun m!525557 () Bool)

(assert (=> start!50060 m!525557))

(declare-fun m!525559 () Bool)

(assert (=> b!548547 m!525559))

(push 1)

(assert (not b!548543))

(assert (not b!548547))

(assert (not b!548546))

(assert (not b!548542))

(assert (not b!548545))

(assert (not start!50060))

