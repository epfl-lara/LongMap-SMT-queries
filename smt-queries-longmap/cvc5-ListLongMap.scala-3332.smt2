; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45984 () Bool)

(assert start!45984)

(declare-fun b!509083 () Bool)

(declare-fun res!309929 () Bool)

(declare-fun e!297764 () Bool)

(assert (=> b!509083 (=> (not res!309929) (not e!297764))))

(declare-datatypes ((array!32695 0))(
  ( (array!32696 (arr!15726 (Array (_ BitVec 32) (_ BitVec 64))) (size!16090 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32695)

(declare-datatypes ((List!9884 0))(
  ( (Nil!9881) (Cons!9880 (h!10757 (_ BitVec 64)) (t!16112 List!9884)) )
))
(declare-fun arrayNoDuplicates!0 (array!32695 (_ BitVec 32) List!9884) Bool)

(assert (=> b!509083 (= res!309929 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9881))))

(declare-fun b!509084 () Bool)

(declare-fun res!309931 () Bool)

(declare-fun e!297765 () Bool)

(assert (=> b!509084 (=> (not res!309931) (not e!297765))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509084 (= res!309931 (validKeyInArray!0 k!2280))))

(declare-fun e!297763 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!509085 () Bool)

(declare-datatypes ((SeekEntryResult!4193 0))(
  ( (MissingZero!4193 (index!18960 (_ BitVec 32))) (Found!4193 (index!18961 (_ BitVec 32))) (Intermediate!4193 (undefined!5005 Bool) (index!18962 (_ BitVec 32)) (x!47938 (_ BitVec 32))) (Undefined!4193) (MissingVacant!4193 (index!18963 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32695 (_ BitVec 32)) SeekEntryResult!4193)

(assert (=> b!509085 (= e!297763 (= (seekEntryOrOpen!0 (select (arr!15726 a!3235) j!176) a!3235 mask!3524) (Found!4193 j!176)))))

(declare-fun b!509086 () Bool)

(declare-fun res!309930 () Bool)

(assert (=> b!509086 (=> (not res!309930) (not e!297765))))

(declare-fun arrayContainsKey!0 (array!32695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509086 (= res!309930 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509087 () Bool)

(assert (=> b!509087 (= e!297765 e!297764)))

(declare-fun res!309935 () Bool)

(assert (=> b!509087 (=> (not res!309935) (not e!297764))))

(declare-fun lt!232479 () SeekEntryResult!4193)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509087 (= res!309935 (or (= lt!232479 (MissingZero!4193 i!1204)) (= lt!232479 (MissingVacant!4193 i!1204))))))

(assert (=> b!509087 (= lt!232479 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509088 () Bool)

(assert (=> b!509088 (= e!297764 (not true))))

(declare-fun lt!232478 () SeekEntryResult!4193)

(declare-fun lt!232483 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32695 (_ BitVec 32)) SeekEntryResult!4193)

(assert (=> b!509088 (= lt!232478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232483 (select (store (arr!15726 a!3235) i!1204 k!2280) j!176) (array!32696 (store (arr!15726 a!3235) i!1204 k!2280) (size!16090 a!3235)) mask!3524))))

(declare-fun lt!232481 () SeekEntryResult!4193)

(declare-fun lt!232482 () (_ BitVec 32))

(assert (=> b!509088 (= lt!232481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232482 (select (arr!15726 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509088 (= lt!232483 (toIndex!0 (select (store (arr!15726 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509088 (= lt!232482 (toIndex!0 (select (arr!15726 a!3235) j!176) mask!3524))))

(assert (=> b!509088 e!297763))

(declare-fun res!309932 () Bool)

(assert (=> b!509088 (=> (not res!309932) (not e!297763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32695 (_ BitVec 32)) Bool)

(assert (=> b!509088 (= res!309932 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15644 0))(
  ( (Unit!15645) )
))
(declare-fun lt!232480 () Unit!15644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15644)

(assert (=> b!509088 (= lt!232480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!309928 () Bool)

(assert (=> start!45984 (=> (not res!309928) (not e!297765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45984 (= res!309928 (validMask!0 mask!3524))))

(assert (=> start!45984 e!297765))

(assert (=> start!45984 true))

(declare-fun array_inv!11522 (array!32695) Bool)

(assert (=> start!45984 (array_inv!11522 a!3235)))

(declare-fun b!509082 () Bool)

(declare-fun res!309934 () Bool)

(assert (=> b!509082 (=> (not res!309934) (not e!297765))))

(assert (=> b!509082 (= res!309934 (and (= (size!16090 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16090 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16090 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509089 () Bool)

(declare-fun res!309933 () Bool)

(assert (=> b!509089 (=> (not res!309933) (not e!297765))))

(assert (=> b!509089 (= res!309933 (validKeyInArray!0 (select (arr!15726 a!3235) j!176)))))

(declare-fun b!509090 () Bool)

(declare-fun res!309927 () Bool)

(assert (=> b!509090 (=> (not res!309927) (not e!297764))))

(assert (=> b!509090 (= res!309927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45984 res!309928) b!509082))

(assert (= (and b!509082 res!309934) b!509089))

(assert (= (and b!509089 res!309933) b!509084))

(assert (= (and b!509084 res!309931) b!509086))

(assert (= (and b!509086 res!309930) b!509087))

(assert (= (and b!509087 res!309935) b!509090))

(assert (= (and b!509090 res!309927) b!509083))

(assert (= (and b!509083 res!309929) b!509088))

(assert (= (and b!509088 res!309932) b!509085))

(declare-fun m!489849 () Bool)

(assert (=> b!509090 m!489849))

(declare-fun m!489851 () Bool)

(assert (=> b!509083 m!489851))

(declare-fun m!489853 () Bool)

(assert (=> b!509086 m!489853))

(declare-fun m!489855 () Bool)

(assert (=> b!509089 m!489855))

(assert (=> b!509089 m!489855))

(declare-fun m!489857 () Bool)

(assert (=> b!509089 m!489857))

(declare-fun m!489859 () Bool)

(assert (=> start!45984 m!489859))

(declare-fun m!489861 () Bool)

(assert (=> start!45984 m!489861))

(declare-fun m!489863 () Bool)

(assert (=> b!509088 m!489863))

(declare-fun m!489865 () Bool)

(assert (=> b!509088 m!489865))

(declare-fun m!489867 () Bool)

(assert (=> b!509088 m!489867))

(assert (=> b!509088 m!489855))

(declare-fun m!489869 () Bool)

(assert (=> b!509088 m!489869))

(assert (=> b!509088 m!489855))

(declare-fun m!489871 () Bool)

(assert (=> b!509088 m!489871))

(assert (=> b!509088 m!489855))

(declare-fun m!489873 () Bool)

(assert (=> b!509088 m!489873))

(assert (=> b!509088 m!489867))

(declare-fun m!489875 () Bool)

(assert (=> b!509088 m!489875))

(assert (=> b!509088 m!489867))

(declare-fun m!489877 () Bool)

(assert (=> b!509088 m!489877))

(declare-fun m!489879 () Bool)

(assert (=> b!509084 m!489879))

(declare-fun m!489881 () Bool)

(assert (=> b!509087 m!489881))

(assert (=> b!509085 m!489855))

(assert (=> b!509085 m!489855))

(declare-fun m!489883 () Bool)

(assert (=> b!509085 m!489883))

(push 1)

