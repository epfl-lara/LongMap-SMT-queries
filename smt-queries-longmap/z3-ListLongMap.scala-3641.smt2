; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50210 () Bool)

(assert start!50210)

(declare-fun b!549450 () Bool)

(declare-fun res!342743 () Bool)

(declare-fun e!317273 () Bool)

(assert (=> b!549450 (=> (not res!342743) (not e!317273))))

(declare-datatypes ((array!34672 0))(
  ( (array!34673 (arr!16652 (Array (_ BitVec 32) (_ BitVec 64))) (size!17017 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34672)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549450 (= res!342743 (validKeyInArray!0 (select (arr!16652 a!3118) j!142)))))

(declare-fun b!549451 () Bool)

(declare-fun e!317274 () Bool)

(assert (=> b!549451 (= e!317274 false)))

(declare-fun lt!250072 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5098 0))(
  ( (MissingZero!5098 (index!22619 (_ BitVec 32))) (Found!5098 (index!22620 (_ BitVec 32))) (Intermediate!5098 (undefined!5910 Bool) (index!22621 (_ BitVec 32)) (x!51559 (_ BitVec 32))) (Undefined!5098) (MissingVacant!5098 (index!22622 (_ BitVec 32))) )
))
(declare-fun lt!250075 () SeekEntryResult!5098)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34672 (_ BitVec 32)) SeekEntryResult!5098)

(assert (=> b!549451 (= lt!250075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250072 (select (store (arr!16652 a!3118) i!1132 k0!1914) j!142) (array!34673 (store (arr!16652 a!3118) i!1132 k0!1914) (size!17017 a!3118)) mask!3119))))

(declare-fun lt!250074 () SeekEntryResult!5098)

(declare-fun lt!250071 () (_ BitVec 32))

(assert (=> b!549451 (= lt!250074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250071 (select (arr!16652 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549451 (= lt!250072 (toIndex!0 (select (store (arr!16652 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549451 (= lt!250071 (toIndex!0 (select (arr!16652 a!3118) j!142) mask!3119))))

(declare-fun b!549452 () Bool)

(declare-fun res!342739 () Bool)

(assert (=> b!549452 (=> (not res!342739) (not e!317273))))

(assert (=> b!549452 (= res!342739 (and (= (size!17017 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17017 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17017 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549453 () Bool)

(declare-fun res!342738 () Bool)

(assert (=> b!549453 (=> (not res!342738) (not e!317273))))

(declare-fun arrayContainsKey!0 (array!34672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549453 (= res!342738 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549454 () Bool)

(assert (=> b!549454 (= e!317273 e!317274)))

(declare-fun res!342742 () Bool)

(assert (=> b!549454 (=> (not res!342742) (not e!317274))))

(declare-fun lt!250073 () SeekEntryResult!5098)

(assert (=> b!549454 (= res!342742 (or (= lt!250073 (MissingZero!5098 i!1132)) (= lt!250073 (MissingVacant!5098 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34672 (_ BitVec 32)) SeekEntryResult!5098)

(assert (=> b!549454 (= lt!250073 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549455 () Bool)

(declare-fun res!342736 () Bool)

(assert (=> b!549455 (=> (not res!342736) (not e!317274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34672 (_ BitVec 32)) Bool)

(assert (=> b!549455 (= res!342736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549457 () Bool)

(declare-fun res!342741 () Bool)

(assert (=> b!549457 (=> (not res!342741) (not e!317273))))

(assert (=> b!549457 (= res!342741 (validKeyInArray!0 k0!1914))))

(declare-fun res!342737 () Bool)

(assert (=> start!50210 (=> (not res!342737) (not e!317273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50210 (= res!342737 (validMask!0 mask!3119))))

(assert (=> start!50210 e!317273))

(assert (=> start!50210 true))

(declare-fun array_inv!12535 (array!34672) Bool)

(assert (=> start!50210 (array_inv!12535 a!3118)))

(declare-fun b!549456 () Bool)

(declare-fun res!342740 () Bool)

(assert (=> b!549456 (=> (not res!342740) (not e!317274))))

(declare-datatypes ((List!10771 0))(
  ( (Nil!10768) (Cons!10767 (h!11740 (_ BitVec 64)) (t!16990 List!10771)) )
))
(declare-fun arrayNoDuplicates!0 (array!34672 (_ BitVec 32) List!10771) Bool)

(assert (=> b!549456 (= res!342740 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10768))))

(assert (= (and start!50210 res!342737) b!549452))

(assert (= (and b!549452 res!342739) b!549450))

(assert (= (and b!549450 res!342743) b!549457))

(assert (= (and b!549457 res!342741) b!549453))

(assert (= (and b!549453 res!342738) b!549454))

(assert (= (and b!549454 res!342742) b!549455))

(assert (= (and b!549455 res!342736) b!549456))

(assert (= (and b!549456 res!342740) b!549451))

(declare-fun m!525869 () Bool)

(assert (=> start!50210 m!525869))

(declare-fun m!525871 () Bool)

(assert (=> start!50210 m!525871))

(declare-fun m!525873 () Bool)

(assert (=> b!549455 m!525873))

(declare-fun m!525875 () Bool)

(assert (=> b!549450 m!525875))

(assert (=> b!549450 m!525875))

(declare-fun m!525877 () Bool)

(assert (=> b!549450 m!525877))

(declare-fun m!525879 () Bool)

(assert (=> b!549453 m!525879))

(declare-fun m!525881 () Bool)

(assert (=> b!549457 m!525881))

(declare-fun m!525883 () Bool)

(assert (=> b!549454 m!525883))

(assert (=> b!549451 m!525875))

(declare-fun m!525885 () Bool)

(assert (=> b!549451 m!525885))

(assert (=> b!549451 m!525875))

(declare-fun m!525887 () Bool)

(assert (=> b!549451 m!525887))

(assert (=> b!549451 m!525875))

(declare-fun m!525889 () Bool)

(assert (=> b!549451 m!525889))

(assert (=> b!549451 m!525887))

(declare-fun m!525891 () Bool)

(assert (=> b!549451 m!525891))

(assert (=> b!549451 m!525887))

(declare-fun m!525893 () Bool)

(assert (=> b!549451 m!525893))

(declare-fun m!525895 () Bool)

(assert (=> b!549451 m!525895))

(declare-fun m!525897 () Bool)

(assert (=> b!549456 m!525897))

(check-sat (not b!549456) (not b!549450) (not b!549453) (not b!549451) (not b!549454) (not start!50210) (not b!549455) (not b!549457))
(check-sat)
