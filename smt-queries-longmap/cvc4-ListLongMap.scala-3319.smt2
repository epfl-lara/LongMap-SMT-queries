; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45862 () Bool)

(assert start!45862)

(declare-fun b!507974 () Bool)

(declare-fun e!297248 () Bool)

(assert (=> b!507974 (= e!297248 false)))

(declare-fun lt!232132 () Bool)

(declare-datatypes ((array!32618 0))(
  ( (array!32619 (arr!15689 (Array (_ BitVec 32) (_ BitVec 64))) (size!16053 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32618)

(declare-datatypes ((List!9847 0))(
  ( (Nil!9844) (Cons!9843 (h!10720 (_ BitVec 64)) (t!16075 List!9847)) )
))
(declare-fun arrayNoDuplicates!0 (array!32618 (_ BitVec 32) List!9847) Bool)

(assert (=> b!507974 (= lt!232132 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9844))))

(declare-fun b!507975 () Bool)

(declare-fun e!297247 () Bool)

(assert (=> b!507975 (= e!297247 e!297248)))

(declare-fun res!308939 () Bool)

(assert (=> b!507975 (=> (not res!308939) (not e!297248))))

(declare-datatypes ((SeekEntryResult!4156 0))(
  ( (MissingZero!4156 (index!18812 (_ BitVec 32))) (Found!4156 (index!18813 (_ BitVec 32))) (Intermediate!4156 (undefined!4968 Bool) (index!18814 (_ BitVec 32)) (x!47797 (_ BitVec 32))) (Undefined!4156) (MissingVacant!4156 (index!18815 (_ BitVec 32))) )
))
(declare-fun lt!232131 () SeekEntryResult!4156)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507975 (= res!308939 (or (= lt!232131 (MissingZero!4156 i!1204)) (= lt!232131 (MissingVacant!4156 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32618 (_ BitVec 32)) SeekEntryResult!4156)

(assert (=> b!507975 (= lt!232131 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507976 () Bool)

(declare-fun res!308938 () Bool)

(assert (=> b!507976 (=> (not res!308938) (not e!297248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32618 (_ BitVec 32)) Bool)

(assert (=> b!507976 (= res!308938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507977 () Bool)

(declare-fun res!308936 () Bool)

(assert (=> b!507977 (=> (not res!308936) (not e!297247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507977 (= res!308936 (validKeyInArray!0 k!2280))))

(declare-fun res!308935 () Bool)

(assert (=> start!45862 (=> (not res!308935) (not e!297247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45862 (= res!308935 (validMask!0 mask!3524))))

(assert (=> start!45862 e!297247))

(assert (=> start!45862 true))

(declare-fun array_inv!11485 (array!32618) Bool)

(assert (=> start!45862 (array_inv!11485 a!3235)))

(declare-fun b!507978 () Bool)

(declare-fun res!308933 () Bool)

(assert (=> b!507978 (=> (not res!308933) (not e!297247))))

(declare-fun arrayContainsKey!0 (array!32618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507978 (= res!308933 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507979 () Bool)

(declare-fun res!308937 () Bool)

(assert (=> b!507979 (=> (not res!308937) (not e!297247))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507979 (= res!308937 (validKeyInArray!0 (select (arr!15689 a!3235) j!176)))))

(declare-fun b!507980 () Bool)

(declare-fun res!308934 () Bool)

(assert (=> b!507980 (=> (not res!308934) (not e!297247))))

(assert (=> b!507980 (= res!308934 (and (= (size!16053 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16053 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16053 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45862 res!308935) b!507980))

(assert (= (and b!507980 res!308934) b!507979))

(assert (= (and b!507979 res!308937) b!507977))

(assert (= (and b!507977 res!308936) b!507978))

(assert (= (and b!507978 res!308933) b!507975))

(assert (= (and b!507975 res!308939) b!507976))

(assert (= (and b!507976 res!308938) b!507974))

(declare-fun m!488823 () Bool)

(assert (=> b!507979 m!488823))

(assert (=> b!507979 m!488823))

(declare-fun m!488825 () Bool)

(assert (=> b!507979 m!488825))

(declare-fun m!488827 () Bool)

(assert (=> b!507974 m!488827))

(declare-fun m!488829 () Bool)

(assert (=> b!507977 m!488829))

(declare-fun m!488831 () Bool)

(assert (=> b!507978 m!488831))

(declare-fun m!488833 () Bool)

(assert (=> start!45862 m!488833))

(declare-fun m!488835 () Bool)

(assert (=> start!45862 m!488835))

(declare-fun m!488837 () Bool)

(assert (=> b!507976 m!488837))

(declare-fun m!488839 () Bool)

(assert (=> b!507975 m!488839))

(push 1)

(assert (not start!45862))

