; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50408 () Bool)

(assert start!50408)

(declare-fun b!551152 () Bool)

(declare-fun res!344081 () Bool)

(declare-fun e!318081 () Bool)

(assert (=> b!551152 (=> (not res!344081) (not e!318081))))

(declare-datatypes ((array!34756 0))(
  ( (array!34757 (arr!16691 (Array (_ BitVec 32) (_ BitVec 64))) (size!17056 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34756)

(declare-datatypes ((List!10810 0))(
  ( (Nil!10807) (Cons!10806 (h!11785 (_ BitVec 64)) (t!17029 List!10810)) )
))
(declare-fun arrayNoDuplicates!0 (array!34756 (_ BitVec 32) List!10810) Bool)

(assert (=> b!551152 (= res!344081 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10807))))

(declare-fun b!551153 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!318079 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5137 0))(
  ( (MissingZero!5137 (index!22775 (_ BitVec 32))) (Found!5137 (index!22776 (_ BitVec 32))) (Intermediate!5137 (undefined!5949 Bool) (index!22777 (_ BitVec 32)) (x!51714 (_ BitVec 32))) (Undefined!5137) (MissingVacant!5137 (index!22778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34756 (_ BitVec 32)) SeekEntryResult!5137)

(assert (=> b!551153 (= e!318079 (= (seekEntryOrOpen!0 (select (arr!16691 a!3118) j!142) a!3118 mask!3119) (Found!5137 j!142)))))

(declare-fun b!551154 () Bool)

(assert (=> b!551154 (= e!318081 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!551154 e!318079))

(declare-fun res!344079 () Bool)

(assert (=> b!551154 (=> (not res!344079) (not e!318079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34756 (_ BitVec 32)) Bool)

(assert (=> b!551154 (= res!344079 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17034 0))(
  ( (Unit!17035) )
))
(declare-fun lt!250594 () Unit!17034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17034)

(assert (=> b!551154 (= lt!250594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!344077 () Bool)

(declare-fun e!318080 () Bool)

(assert (=> start!50408 (=> (not res!344077) (not e!318080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50408 (= res!344077 (validMask!0 mask!3119))))

(assert (=> start!50408 e!318080))

(assert (=> start!50408 true))

(declare-fun array_inv!12574 (array!34756) Bool)

(assert (=> start!50408 (array_inv!12574 a!3118)))

(declare-fun b!551155 () Bool)

(declare-fun res!344078 () Bool)

(assert (=> b!551155 (=> (not res!344078) (not e!318081))))

(assert (=> b!551155 (= res!344078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551156 () Bool)

(declare-fun res!344072 () Bool)

(assert (=> b!551156 (=> (not res!344072) (not e!318080))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551156 (= res!344072 (and (= (size!17056 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17056 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17056 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551157 () Bool)

(declare-fun res!344076 () Bool)

(assert (=> b!551157 (=> (not res!344076) (not e!318081))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34756 (_ BitVec 32)) SeekEntryResult!5137)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551157 (= res!344076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16691 a!3118) j!142) mask!3119) (select (arr!16691 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16691 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16691 a!3118) i!1132 k0!1914) j!142) (array!34757 (store (arr!16691 a!3118) i!1132 k0!1914) (size!17056 a!3118)) mask!3119)))))

(declare-fun b!551158 () Bool)

(declare-fun res!344074 () Bool)

(assert (=> b!551158 (=> (not res!344074) (not e!318080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551158 (= res!344074 (validKeyInArray!0 (select (arr!16691 a!3118) j!142)))))

(declare-fun b!551159 () Bool)

(declare-fun res!344080 () Bool)

(assert (=> b!551159 (=> (not res!344080) (not e!318080))))

(assert (=> b!551159 (= res!344080 (validKeyInArray!0 k0!1914))))

(declare-fun b!551160 () Bool)

(declare-fun res!344073 () Bool)

(assert (=> b!551160 (=> (not res!344073) (not e!318080))))

(declare-fun arrayContainsKey!0 (array!34756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551160 (= res!344073 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551161 () Bool)

(assert (=> b!551161 (= e!318080 e!318081)))

(declare-fun res!344075 () Bool)

(assert (=> b!551161 (=> (not res!344075) (not e!318081))))

(declare-fun lt!250593 () SeekEntryResult!5137)

(assert (=> b!551161 (= res!344075 (or (= lt!250593 (MissingZero!5137 i!1132)) (= lt!250593 (MissingVacant!5137 i!1132))))))

(assert (=> b!551161 (= lt!250593 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50408 res!344077) b!551156))

(assert (= (and b!551156 res!344072) b!551158))

(assert (= (and b!551158 res!344074) b!551159))

(assert (= (and b!551159 res!344080) b!551160))

(assert (= (and b!551160 res!344073) b!551161))

(assert (= (and b!551161 res!344075) b!551155))

(assert (= (and b!551155 res!344078) b!551152))

(assert (= (and b!551152 res!344081) b!551157))

(assert (= (and b!551157 res!344076) b!551154))

(assert (= (and b!551154 res!344079) b!551153))

(declare-fun m!527633 () Bool)

(assert (=> b!551154 m!527633))

(declare-fun m!527635 () Bool)

(assert (=> b!551154 m!527635))

(declare-fun m!527637 () Bool)

(assert (=> start!50408 m!527637))

(declare-fun m!527639 () Bool)

(assert (=> start!50408 m!527639))

(declare-fun m!527641 () Bool)

(assert (=> b!551161 m!527641))

(declare-fun m!527643 () Bool)

(assert (=> b!551159 m!527643))

(declare-fun m!527645 () Bool)

(assert (=> b!551160 m!527645))

(declare-fun m!527647 () Bool)

(assert (=> b!551158 m!527647))

(assert (=> b!551158 m!527647))

(declare-fun m!527649 () Bool)

(assert (=> b!551158 m!527649))

(declare-fun m!527651 () Bool)

(assert (=> b!551155 m!527651))

(declare-fun m!527653 () Bool)

(assert (=> b!551152 m!527653))

(assert (=> b!551153 m!527647))

(assert (=> b!551153 m!527647))

(declare-fun m!527655 () Bool)

(assert (=> b!551153 m!527655))

(assert (=> b!551157 m!527647))

(declare-fun m!527657 () Bool)

(assert (=> b!551157 m!527657))

(assert (=> b!551157 m!527647))

(declare-fun m!527659 () Bool)

(assert (=> b!551157 m!527659))

(declare-fun m!527661 () Bool)

(assert (=> b!551157 m!527661))

(assert (=> b!551157 m!527659))

(declare-fun m!527663 () Bool)

(assert (=> b!551157 m!527663))

(assert (=> b!551157 m!527657))

(assert (=> b!551157 m!527647))

(declare-fun m!527665 () Bool)

(assert (=> b!551157 m!527665))

(declare-fun m!527667 () Bool)

(assert (=> b!551157 m!527667))

(assert (=> b!551157 m!527659))

(assert (=> b!551157 m!527661))

(check-sat (not b!551161) (not start!50408) (not b!551155) (not b!551154) (not b!551160) (not b!551152) (not b!551159) (not b!551153) (not b!551158) (not b!551157))
(check-sat)
