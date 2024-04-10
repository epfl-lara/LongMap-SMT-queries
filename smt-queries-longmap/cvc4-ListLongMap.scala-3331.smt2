; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45982 () Bool)

(assert start!45982)

(declare-fun b!509055 () Bool)

(declare-fun res!309904 () Bool)

(declare-fun e!297751 () Bool)

(assert (=> b!509055 (=> (not res!309904) (not e!297751))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32693 0))(
  ( (array!32694 (arr!15725 (Array (_ BitVec 32) (_ BitVec 64))) (size!16089 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32693)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509055 (= res!309904 (and (= (size!16089 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16089 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16089 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509056 () Bool)

(declare-fun res!309902 () Bool)

(assert (=> b!509056 (=> (not res!309902) (not e!297751))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509056 (= res!309902 (validKeyInArray!0 k!2280))))

(declare-fun b!509057 () Bool)

(declare-fun res!309906 () Bool)

(assert (=> b!509057 (=> (not res!309906) (not e!297751))))

(assert (=> b!509057 (= res!309906 (validKeyInArray!0 (select (arr!15725 a!3235) j!176)))))

(declare-fun res!309905 () Bool)

(assert (=> start!45982 (=> (not res!309905) (not e!297751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45982 (= res!309905 (validMask!0 mask!3524))))

(assert (=> start!45982 e!297751))

(assert (=> start!45982 true))

(declare-fun array_inv!11521 (array!32693) Bool)

(assert (=> start!45982 (array_inv!11521 a!3235)))

(declare-fun b!509058 () Bool)

(declare-fun e!297750 () Bool)

(assert (=> b!509058 (= e!297751 e!297750)))

(declare-fun res!309901 () Bool)

(assert (=> b!509058 (=> (not res!309901) (not e!297750))))

(declare-datatypes ((SeekEntryResult!4192 0))(
  ( (MissingZero!4192 (index!18956 (_ BitVec 32))) (Found!4192 (index!18957 (_ BitVec 32))) (Intermediate!4192 (undefined!5004 Bool) (index!18958 (_ BitVec 32)) (x!47929 (_ BitVec 32))) (Undefined!4192) (MissingVacant!4192 (index!18959 (_ BitVec 32))) )
))
(declare-fun lt!232463 () SeekEntryResult!4192)

(assert (=> b!509058 (= res!309901 (or (= lt!232463 (MissingZero!4192 i!1204)) (= lt!232463 (MissingVacant!4192 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32693 (_ BitVec 32)) SeekEntryResult!4192)

(assert (=> b!509058 (= lt!232463 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509059 () Bool)

(declare-fun res!309900 () Bool)

(assert (=> b!509059 (=> (not res!309900) (not e!297751))))

(declare-fun arrayContainsKey!0 (array!32693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509059 (= res!309900 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509060 () Bool)

(declare-fun res!309908 () Bool)

(assert (=> b!509060 (=> (not res!309908) (not e!297750))))

(declare-datatypes ((List!9883 0))(
  ( (Nil!9880) (Cons!9879 (h!10756 (_ BitVec 64)) (t!16111 List!9883)) )
))
(declare-fun arrayNoDuplicates!0 (array!32693 (_ BitVec 32) List!9883) Bool)

(assert (=> b!509060 (= res!309908 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9880))))

(declare-fun e!297753 () Bool)

(declare-fun b!509061 () Bool)

(assert (=> b!509061 (= e!297753 (= (seekEntryOrOpen!0 (select (arr!15725 a!3235) j!176) a!3235 mask!3524) (Found!4192 j!176)))))

(declare-fun b!509062 () Bool)

(declare-fun res!309903 () Bool)

(assert (=> b!509062 (=> (not res!309903) (not e!297750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32693 (_ BitVec 32)) Bool)

(assert (=> b!509062 (= res!309903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509063 () Bool)

(assert (=> b!509063 (= e!297750 (not true))))

(declare-fun lt!232465 () SeekEntryResult!4192)

(declare-fun lt!232462 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32693 (_ BitVec 32)) SeekEntryResult!4192)

(assert (=> b!509063 (= lt!232465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232462 (select (store (arr!15725 a!3235) i!1204 k!2280) j!176) (array!32694 (store (arr!15725 a!3235) i!1204 k!2280) (size!16089 a!3235)) mask!3524))))

(declare-fun lt!232461 () (_ BitVec 32))

(declare-fun lt!232464 () SeekEntryResult!4192)

(assert (=> b!509063 (= lt!232464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232461 (select (arr!15725 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509063 (= lt!232462 (toIndex!0 (select (store (arr!15725 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509063 (= lt!232461 (toIndex!0 (select (arr!15725 a!3235) j!176) mask!3524))))

(assert (=> b!509063 e!297753))

(declare-fun res!309907 () Bool)

(assert (=> b!509063 (=> (not res!309907) (not e!297753))))

(assert (=> b!509063 (= res!309907 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15642 0))(
  ( (Unit!15643) )
))
(declare-fun lt!232460 () Unit!15642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15642)

(assert (=> b!509063 (= lt!232460 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45982 res!309905) b!509055))

(assert (= (and b!509055 res!309904) b!509057))

(assert (= (and b!509057 res!309906) b!509056))

(assert (= (and b!509056 res!309902) b!509059))

(assert (= (and b!509059 res!309900) b!509058))

(assert (= (and b!509058 res!309901) b!509062))

(assert (= (and b!509062 res!309903) b!509060))

(assert (= (and b!509060 res!309908) b!509063))

(assert (= (and b!509063 res!309907) b!509061))

(declare-fun m!489813 () Bool)

(assert (=> b!509057 m!489813))

(assert (=> b!509057 m!489813))

(declare-fun m!489815 () Bool)

(assert (=> b!509057 m!489815))

(declare-fun m!489817 () Bool)

(assert (=> b!509060 m!489817))

(declare-fun m!489819 () Bool)

(assert (=> b!509062 m!489819))

(declare-fun m!489821 () Bool)

(assert (=> b!509056 m!489821))

(declare-fun m!489823 () Bool)

(assert (=> b!509059 m!489823))

(declare-fun m!489825 () Bool)

(assert (=> b!509058 m!489825))

(declare-fun m!489827 () Bool)

(assert (=> b!509063 m!489827))

(declare-fun m!489829 () Bool)

(assert (=> b!509063 m!489829))

(declare-fun m!489831 () Bool)

(assert (=> b!509063 m!489831))

(assert (=> b!509063 m!489831))

(declare-fun m!489833 () Bool)

(assert (=> b!509063 m!489833))

(assert (=> b!509063 m!489813))

(declare-fun m!489835 () Bool)

(assert (=> b!509063 m!489835))

(declare-fun m!489837 () Bool)

(assert (=> b!509063 m!489837))

(assert (=> b!509063 m!489831))

(declare-fun m!489839 () Bool)

(assert (=> b!509063 m!489839))

(assert (=> b!509063 m!489813))

(declare-fun m!489841 () Bool)

(assert (=> b!509063 m!489841))

(assert (=> b!509063 m!489813))

(declare-fun m!489843 () Bool)

(assert (=> start!45982 m!489843))

(declare-fun m!489845 () Bool)

(assert (=> start!45982 m!489845))

(assert (=> b!509061 m!489813))

(assert (=> b!509061 m!489813))

(declare-fun m!489847 () Bool)

(assert (=> b!509061 m!489847))

(push 1)

