; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50192 () Bool)

(assert start!50192)

(declare-fun b!549234 () Bool)

(declare-fun res!342525 () Bool)

(declare-fun e!317191 () Bool)

(assert (=> b!549234 (=> (not res!342525) (not e!317191))))

(declare-datatypes ((array!34654 0))(
  ( (array!34655 (arr!16643 (Array (_ BitVec 32) (_ BitVec 64))) (size!17008 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34654)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549234 (= res!342525 (validKeyInArray!0 (select (arr!16643 a!3118) j!142)))))

(declare-fun b!549235 () Bool)

(declare-fun res!342522 () Bool)

(declare-fun e!317192 () Bool)

(assert (=> b!549235 (=> (not res!342522) (not e!317192))))

(declare-datatypes ((List!10762 0))(
  ( (Nil!10759) (Cons!10758 (h!11731 (_ BitVec 64)) (t!16981 List!10762)) )
))
(declare-fun arrayNoDuplicates!0 (array!34654 (_ BitVec 32) List!10762) Bool)

(assert (=> b!549235 (= res!342522 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10759))))

(declare-fun b!549237 () Bool)

(declare-fun res!342520 () Bool)

(assert (=> b!549237 (=> (not res!342520) (not e!317191))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549237 (= res!342520 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549238 () Bool)

(assert (=> b!549238 (= e!317191 e!317192)))

(declare-fun res!342523 () Bool)

(assert (=> b!549238 (=> (not res!342523) (not e!317192))))

(declare-datatypes ((SeekEntryResult!5089 0))(
  ( (MissingZero!5089 (index!22583 (_ BitVec 32))) (Found!5089 (index!22584 (_ BitVec 32))) (Intermediate!5089 (undefined!5901 Bool) (index!22585 (_ BitVec 32)) (x!51526 (_ BitVec 32))) (Undefined!5089) (MissingVacant!5089 (index!22586 (_ BitVec 32))) )
))
(declare-fun lt!249939 () SeekEntryResult!5089)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549238 (= res!342523 (or (= lt!249939 (MissingZero!5089 i!1132)) (= lt!249939 (MissingVacant!5089 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34654 (_ BitVec 32)) SeekEntryResult!5089)

(assert (=> b!549238 (= lt!249939 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549239 () Bool)

(declare-fun res!342524 () Bool)

(assert (=> b!549239 (=> (not res!342524) (not e!317191))))

(assert (=> b!549239 (= res!342524 (and (= (size!17008 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17008 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17008 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549240 () Bool)

(declare-fun res!342521 () Bool)

(assert (=> b!549240 (=> (not res!342521) (not e!317192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34654 (_ BitVec 32)) Bool)

(assert (=> b!549240 (= res!342521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549241 () Bool)

(assert (=> b!549241 (= e!317192 false)))

(declare-fun lt!249937 () SeekEntryResult!5089)

(declare-fun lt!249938 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34654 (_ BitVec 32)) SeekEntryResult!5089)

(assert (=> b!549241 (= lt!249937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!249938 (select (store (arr!16643 a!3118) i!1132 k0!1914) j!142) (array!34655 (store (arr!16643 a!3118) i!1132 k0!1914) (size!17008 a!3118)) mask!3119))))

(declare-fun lt!249940 () (_ BitVec 32))

(declare-fun lt!249936 () SeekEntryResult!5089)

(assert (=> b!549241 (= lt!249936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!249940 (select (arr!16643 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549241 (= lt!249938 (toIndex!0 (select (store (arr!16643 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549241 (= lt!249940 (toIndex!0 (select (arr!16643 a!3118) j!142) mask!3119))))

(declare-fun res!342527 () Bool)

(assert (=> start!50192 (=> (not res!342527) (not e!317191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50192 (= res!342527 (validMask!0 mask!3119))))

(assert (=> start!50192 e!317191))

(assert (=> start!50192 true))

(declare-fun array_inv!12526 (array!34654) Bool)

(assert (=> start!50192 (array_inv!12526 a!3118)))

(declare-fun b!549236 () Bool)

(declare-fun res!342526 () Bool)

(assert (=> b!549236 (=> (not res!342526) (not e!317191))))

(assert (=> b!549236 (= res!342526 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50192 res!342527) b!549239))

(assert (= (and b!549239 res!342524) b!549234))

(assert (= (and b!549234 res!342525) b!549236))

(assert (= (and b!549236 res!342526) b!549237))

(assert (= (and b!549237 res!342520) b!549238))

(assert (= (and b!549238 res!342523) b!549240))

(assert (= (and b!549240 res!342521) b!549235))

(assert (= (and b!549235 res!342522) b!549241))

(declare-fun m!525599 () Bool)

(assert (=> b!549240 m!525599))

(declare-fun m!525601 () Bool)

(assert (=> b!549237 m!525601))

(declare-fun m!525603 () Bool)

(assert (=> start!50192 m!525603))

(declare-fun m!525605 () Bool)

(assert (=> start!50192 m!525605))

(declare-fun m!525607 () Bool)

(assert (=> b!549235 m!525607))

(declare-fun m!525609 () Bool)

(assert (=> b!549241 m!525609))

(declare-fun m!525611 () Bool)

(assert (=> b!549241 m!525611))

(assert (=> b!549241 m!525609))

(declare-fun m!525613 () Bool)

(assert (=> b!549241 m!525613))

(declare-fun m!525615 () Bool)

(assert (=> b!549241 m!525615))

(assert (=> b!549241 m!525613))

(assert (=> b!549241 m!525609))

(declare-fun m!525617 () Bool)

(assert (=> b!549241 m!525617))

(declare-fun m!525619 () Bool)

(assert (=> b!549241 m!525619))

(assert (=> b!549241 m!525613))

(declare-fun m!525621 () Bool)

(assert (=> b!549241 m!525621))

(declare-fun m!525623 () Bool)

(assert (=> b!549236 m!525623))

(declare-fun m!525625 () Bool)

(assert (=> b!549238 m!525625))

(assert (=> b!549234 m!525609))

(assert (=> b!549234 m!525609))

(declare-fun m!525627 () Bool)

(assert (=> b!549234 m!525627))

(check-sat (not b!549241) (not b!549236) (not b!549237) (not b!549235) (not start!50192) (not b!549234) (not b!549238) (not b!549240))
(check-sat)
