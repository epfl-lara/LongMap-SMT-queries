; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46048 () Bool)

(assert start!46048)

(declare-fun b!509946 () Bool)

(declare-fun res!310794 () Bool)

(declare-fun e!298146 () Bool)

(assert (=> b!509946 (=> (not res!310794) (not e!298146))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509946 (= res!310794 (validKeyInArray!0 k!2280))))

(declare-fun b!509947 () Bool)

(declare-fun res!310796 () Bool)

(assert (=> b!509947 (=> (not res!310796) (not e!298146))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32759 0))(
  ( (array!32760 (arr!15758 (Array (_ BitVec 32) (_ BitVec 64))) (size!16122 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32759)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509947 (= res!310796 (and (= (size!16122 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16122 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16122 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509948 () Bool)

(declare-fun e!298149 () Bool)

(assert (=> b!509948 (= e!298149 (not true))))

(declare-datatypes ((SeekEntryResult!4225 0))(
  ( (MissingZero!4225 (index!19088 (_ BitVec 32))) (Found!4225 (index!19089 (_ BitVec 32))) (Intermediate!4225 (undefined!5037 Bool) (index!19090 (_ BitVec 32)) (x!48050 (_ BitVec 32))) (Undefined!4225) (MissingVacant!4225 (index!19091 (_ BitVec 32))) )
))
(declare-fun lt!233058 () SeekEntryResult!4225)

(declare-fun lt!233059 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32759 (_ BitVec 32)) SeekEntryResult!4225)

(assert (=> b!509948 (= lt!233058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233059 (select (store (arr!15758 a!3235) i!1204 k!2280) j!176) (array!32760 (store (arr!15758 a!3235) i!1204 k!2280) (size!16122 a!3235)) mask!3524))))

(declare-fun lt!233056 () SeekEntryResult!4225)

(declare-fun lt!233055 () (_ BitVec 32))

(assert (=> b!509948 (= lt!233056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233055 (select (arr!15758 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509948 (= lt!233059 (toIndex!0 (select (store (arr!15758 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509948 (= lt!233055 (toIndex!0 (select (arr!15758 a!3235) j!176) mask!3524))))

(declare-fun e!298148 () Bool)

(assert (=> b!509948 e!298148))

(declare-fun res!310797 () Bool)

(assert (=> b!509948 (=> (not res!310797) (not e!298148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32759 (_ BitVec 32)) Bool)

(assert (=> b!509948 (= res!310797 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15708 0))(
  ( (Unit!15709) )
))
(declare-fun lt!233057 () Unit!15708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15708)

(assert (=> b!509948 (= lt!233057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!310798 () Bool)

(assert (=> start!46048 (=> (not res!310798) (not e!298146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46048 (= res!310798 (validMask!0 mask!3524))))

(assert (=> start!46048 e!298146))

(assert (=> start!46048 true))

(declare-fun array_inv!11554 (array!32759) Bool)

(assert (=> start!46048 (array_inv!11554 a!3235)))

(declare-fun b!509949 () Bool)

(declare-fun res!310792 () Bool)

(assert (=> b!509949 (=> (not res!310792) (not e!298146))))

(declare-fun arrayContainsKey!0 (array!32759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509949 (= res!310792 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509950 () Bool)

(declare-fun res!310795 () Bool)

(assert (=> b!509950 (=> (not res!310795) (not e!298146))))

(assert (=> b!509950 (= res!310795 (validKeyInArray!0 (select (arr!15758 a!3235) j!176)))))

(declare-fun b!509951 () Bool)

(declare-fun res!310791 () Bool)

(assert (=> b!509951 (=> (not res!310791) (not e!298149))))

(assert (=> b!509951 (= res!310791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509952 () Bool)

(declare-fun res!310793 () Bool)

(assert (=> b!509952 (=> (not res!310793) (not e!298149))))

(declare-datatypes ((List!9916 0))(
  ( (Nil!9913) (Cons!9912 (h!10789 (_ BitVec 64)) (t!16144 List!9916)) )
))
(declare-fun arrayNoDuplicates!0 (array!32759 (_ BitVec 32) List!9916) Bool)

(assert (=> b!509952 (= res!310793 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9913))))

(declare-fun b!509953 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32759 (_ BitVec 32)) SeekEntryResult!4225)

(assert (=> b!509953 (= e!298148 (= (seekEntryOrOpen!0 (select (arr!15758 a!3235) j!176) a!3235 mask!3524) (Found!4225 j!176)))))

(declare-fun b!509954 () Bool)

(assert (=> b!509954 (= e!298146 e!298149)))

(declare-fun res!310799 () Bool)

(assert (=> b!509954 (=> (not res!310799) (not e!298149))))

(declare-fun lt!233054 () SeekEntryResult!4225)

(assert (=> b!509954 (= res!310799 (or (= lt!233054 (MissingZero!4225 i!1204)) (= lt!233054 (MissingVacant!4225 i!1204))))))

(assert (=> b!509954 (= lt!233054 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!46048 res!310798) b!509947))

(assert (= (and b!509947 res!310796) b!509950))

(assert (= (and b!509950 res!310795) b!509946))

(assert (= (and b!509946 res!310794) b!509949))

(assert (= (and b!509949 res!310792) b!509954))

(assert (= (and b!509954 res!310799) b!509951))

(assert (= (and b!509951 res!310791) b!509952))

(assert (= (and b!509952 res!310793) b!509948))

(assert (= (and b!509948 res!310797) b!509953))

(declare-fun m!491001 () Bool)

(assert (=> b!509946 m!491001))

(declare-fun m!491003 () Bool)

(assert (=> b!509948 m!491003))

(declare-fun m!491005 () Bool)

(assert (=> b!509948 m!491005))

(declare-fun m!491007 () Bool)

(assert (=> b!509948 m!491007))

(assert (=> b!509948 m!491007))

(declare-fun m!491009 () Bool)

(assert (=> b!509948 m!491009))

(declare-fun m!491011 () Bool)

(assert (=> b!509948 m!491011))

(declare-fun m!491013 () Bool)

(assert (=> b!509948 m!491013))

(assert (=> b!509948 m!491011))

(declare-fun m!491015 () Bool)

(assert (=> b!509948 m!491015))

(assert (=> b!509948 m!491007))

(declare-fun m!491017 () Bool)

(assert (=> b!509948 m!491017))

(assert (=> b!509948 m!491011))

(declare-fun m!491019 () Bool)

(assert (=> b!509948 m!491019))

(assert (=> b!509953 m!491011))

(assert (=> b!509953 m!491011))

(declare-fun m!491021 () Bool)

(assert (=> b!509953 m!491021))

(declare-fun m!491023 () Bool)

(assert (=> b!509949 m!491023))

(assert (=> b!509950 m!491011))

(assert (=> b!509950 m!491011))

(declare-fun m!491025 () Bool)

(assert (=> b!509950 m!491025))

(declare-fun m!491027 () Bool)

(assert (=> start!46048 m!491027))

(declare-fun m!491029 () Bool)

(assert (=> start!46048 m!491029))

(declare-fun m!491031 () Bool)

(assert (=> b!509951 m!491031))

(declare-fun m!491033 () Bool)

(assert (=> b!509952 m!491033))

(declare-fun m!491035 () Bool)

(assert (=> b!509954 m!491035))

(push 1)

