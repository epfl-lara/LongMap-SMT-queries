; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50222 () Bool)

(assert start!50222)

(declare-fun b!549721 () Bool)

(declare-fun e!317447 () Bool)

(assert (=> b!549721 (= e!317447 false)))

(declare-datatypes ((SeekEntryResult!5102 0))(
  ( (MissingZero!5102 (index!22635 (_ BitVec 32))) (Found!5102 (index!22636 (_ BitVec 32))) (Intermediate!5102 (undefined!5914 Bool) (index!22637 (_ BitVec 32)) (x!51568 (_ BitVec 32))) (Undefined!5102) (MissingVacant!5102 (index!22638 (_ BitVec 32))) )
))
(declare-fun lt!250305 () SeekEntryResult!5102)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!250309 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34675 0))(
  ( (array!34676 (arr!16653 (Array (_ BitVec 32) (_ BitVec 64))) (size!17017 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34675 (_ BitVec 32)) SeekEntryResult!5102)

(assert (=> b!549721 (= lt!250305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250309 (select (store (arr!16653 a!3118) i!1132 k!1914) j!142) (array!34676 (store (arr!16653 a!3118) i!1132 k!1914) (size!17017 a!3118)) mask!3119))))

(declare-fun lt!250307 () (_ BitVec 32))

(declare-fun lt!250306 () SeekEntryResult!5102)

(assert (=> b!549721 (= lt!250306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250307 (select (arr!16653 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549721 (= lt!250309 (toIndex!0 (select (store (arr!16653 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549721 (= lt!250307 (toIndex!0 (select (arr!16653 a!3118) j!142) mask!3119))))

(declare-fun b!549722 () Bool)

(declare-fun res!342872 () Bool)

(declare-fun e!317446 () Bool)

(assert (=> b!549722 (=> (not res!342872) (not e!317446))))

(assert (=> b!549722 (= res!342872 (and (= (size!17017 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17017 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17017 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549723 () Bool)

(declare-fun res!342871 () Bool)

(assert (=> b!549723 (=> (not res!342871) (not e!317446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549723 (= res!342871 (validKeyInArray!0 (select (arr!16653 a!3118) j!142)))))

(declare-fun b!549724 () Bool)

(declare-fun res!342870 () Bool)

(assert (=> b!549724 (=> (not res!342870) (not e!317446))))

(assert (=> b!549724 (= res!342870 (validKeyInArray!0 k!1914))))

(declare-fun res!342868 () Bool)

(assert (=> start!50222 (=> (not res!342868) (not e!317446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50222 (= res!342868 (validMask!0 mask!3119))))

(assert (=> start!50222 e!317446))

(assert (=> start!50222 true))

(declare-fun array_inv!12449 (array!34675) Bool)

(assert (=> start!50222 (array_inv!12449 a!3118)))

(declare-fun b!549725 () Bool)

(declare-fun res!342869 () Bool)

(assert (=> b!549725 (=> (not res!342869) (not e!317447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34675 (_ BitVec 32)) Bool)

(assert (=> b!549725 (= res!342869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549726 () Bool)

(assert (=> b!549726 (= e!317446 e!317447)))

(declare-fun res!342865 () Bool)

(assert (=> b!549726 (=> (not res!342865) (not e!317447))))

(declare-fun lt!250308 () SeekEntryResult!5102)

(assert (=> b!549726 (= res!342865 (or (= lt!250308 (MissingZero!5102 i!1132)) (= lt!250308 (MissingVacant!5102 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34675 (_ BitVec 32)) SeekEntryResult!5102)

(assert (=> b!549726 (= lt!250308 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549727 () Bool)

(declare-fun res!342866 () Bool)

(assert (=> b!549727 (=> (not res!342866) (not e!317447))))

(declare-datatypes ((List!10733 0))(
  ( (Nil!10730) (Cons!10729 (h!11702 (_ BitVec 64)) (t!16961 List!10733)) )
))
(declare-fun arrayNoDuplicates!0 (array!34675 (_ BitVec 32) List!10733) Bool)

(assert (=> b!549727 (= res!342866 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10730))))

(declare-fun b!549728 () Bool)

(declare-fun res!342867 () Bool)

(assert (=> b!549728 (=> (not res!342867) (not e!317446))))

(declare-fun arrayContainsKey!0 (array!34675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549728 (= res!342867 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50222 res!342868) b!549722))

(assert (= (and b!549722 res!342872) b!549723))

(assert (= (and b!549723 res!342871) b!549724))

(assert (= (and b!549724 res!342870) b!549728))

(assert (= (and b!549728 res!342867) b!549726))

(assert (= (and b!549726 res!342865) b!549725))

(assert (= (and b!549725 res!342869) b!549727))

(assert (= (and b!549727 res!342866) b!549721))

(declare-fun m!526641 () Bool)

(assert (=> b!549721 m!526641))

(declare-fun m!526643 () Bool)

(assert (=> b!549721 m!526643))

(assert (=> b!549721 m!526641))

(declare-fun m!526645 () Bool)

(assert (=> b!549721 m!526645))

(assert (=> b!549721 m!526645))

(declare-fun m!526647 () Bool)

(assert (=> b!549721 m!526647))

(declare-fun m!526649 () Bool)

(assert (=> b!549721 m!526649))

(assert (=> b!549721 m!526641))

(declare-fun m!526651 () Bool)

(assert (=> b!549721 m!526651))

(assert (=> b!549721 m!526645))

(declare-fun m!526653 () Bool)

(assert (=> b!549721 m!526653))

(declare-fun m!526655 () Bool)

(assert (=> b!549725 m!526655))

(declare-fun m!526657 () Bool)

(assert (=> b!549727 m!526657))

(declare-fun m!526659 () Bool)

(assert (=> b!549724 m!526659))

(declare-fun m!526661 () Bool)

(assert (=> b!549728 m!526661))

(assert (=> b!549723 m!526641))

(assert (=> b!549723 m!526641))

(declare-fun m!526663 () Bool)

(assert (=> b!549723 m!526663))

(declare-fun m!526665 () Bool)

(assert (=> b!549726 m!526665))

(declare-fun m!526667 () Bool)

(assert (=> start!50222 m!526667))

(declare-fun m!526669 () Bool)

(assert (=> start!50222 m!526669))

(push 1)

