; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45990 () Bool)

(assert start!45990)

(declare-fun b!509163 () Bool)

(declare-fun res!310008 () Bool)

(declare-fun e!297801 () Bool)

(assert (=> b!509163 (=> (not res!310008) (not e!297801))))

(declare-datatypes ((array!32701 0))(
  ( (array!32702 (arr!15729 (Array (_ BitVec 32) (_ BitVec 64))) (size!16093 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32701)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32701 (_ BitVec 32)) Bool)

(assert (=> b!509163 (= res!310008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509164 () Bool)

(declare-fun res!310014 () Bool)

(declare-fun e!297800 () Bool)

(assert (=> b!509164 (=> (not res!310014) (not e!297800))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509164 (= res!310014 (and (= (size!16093 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16093 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16093 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!310011 () Bool)

(assert (=> start!45990 (=> (not res!310011) (not e!297800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45990 (= res!310011 (validMask!0 mask!3524))))

(assert (=> start!45990 e!297800))

(assert (=> start!45990 true))

(declare-fun array_inv!11525 (array!32701) Bool)

(assert (=> start!45990 (array_inv!11525 a!3235)))

(declare-fun b!509165 () Bool)

(declare-fun res!310010 () Bool)

(assert (=> b!509165 (=> (not res!310010) (not e!297800))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509165 (= res!310010 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509166 () Bool)

(declare-fun res!310013 () Bool)

(assert (=> b!509166 (=> (not res!310013) (not e!297801))))

(declare-datatypes ((List!9887 0))(
  ( (Nil!9884) (Cons!9883 (h!10760 (_ BitVec 64)) (t!16115 List!9887)) )
))
(declare-fun arrayNoDuplicates!0 (array!32701 (_ BitVec 32) List!9887) Bool)

(assert (=> b!509166 (= res!310013 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9884))))

(declare-fun e!297798 () Bool)

(declare-fun b!509167 () Bool)

(declare-datatypes ((SeekEntryResult!4196 0))(
  ( (MissingZero!4196 (index!18972 (_ BitVec 32))) (Found!4196 (index!18973 (_ BitVec 32))) (Intermediate!4196 (undefined!5008 Bool) (index!18974 (_ BitVec 32)) (x!47949 (_ BitVec 32))) (Undefined!4196) (MissingVacant!4196 (index!18975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32701 (_ BitVec 32)) SeekEntryResult!4196)

(assert (=> b!509167 (= e!297798 (= (seekEntryOrOpen!0 (select (arr!15729 a!3235) j!176) a!3235 mask!3524) (Found!4196 j!176)))))

(declare-fun b!509168 () Bool)

(declare-fun res!310009 () Bool)

(assert (=> b!509168 (=> (not res!310009) (not e!297800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509168 (= res!310009 (validKeyInArray!0 k!2280))))

(declare-fun b!509169 () Bool)

(assert (=> b!509169 (= e!297801 (not true))))

(declare-fun lt!232536 () (_ BitVec 32))

(declare-fun lt!232532 () SeekEntryResult!4196)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32701 (_ BitVec 32)) SeekEntryResult!4196)

(assert (=> b!509169 (= lt!232532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232536 (select (store (arr!15729 a!3235) i!1204 k!2280) j!176) (array!32702 (store (arr!15729 a!3235) i!1204 k!2280) (size!16093 a!3235)) mask!3524))))

(declare-fun lt!232533 () (_ BitVec 32))

(declare-fun lt!232537 () SeekEntryResult!4196)

(assert (=> b!509169 (= lt!232537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232533 (select (arr!15729 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509169 (= lt!232536 (toIndex!0 (select (store (arr!15729 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509169 (= lt!232533 (toIndex!0 (select (arr!15729 a!3235) j!176) mask!3524))))

(assert (=> b!509169 e!297798))

(declare-fun res!310016 () Bool)

(assert (=> b!509169 (=> (not res!310016) (not e!297798))))

(assert (=> b!509169 (= res!310016 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15650 0))(
  ( (Unit!15651) )
))
(declare-fun lt!232534 () Unit!15650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15650)

(assert (=> b!509169 (= lt!232534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509170 () Bool)

(declare-fun res!310015 () Bool)

(assert (=> b!509170 (=> (not res!310015) (not e!297800))))

(assert (=> b!509170 (= res!310015 (validKeyInArray!0 (select (arr!15729 a!3235) j!176)))))

(declare-fun b!509171 () Bool)

(assert (=> b!509171 (= e!297800 e!297801)))

(declare-fun res!310012 () Bool)

(assert (=> b!509171 (=> (not res!310012) (not e!297801))))

(declare-fun lt!232535 () SeekEntryResult!4196)

(assert (=> b!509171 (= res!310012 (or (= lt!232535 (MissingZero!4196 i!1204)) (= lt!232535 (MissingVacant!4196 i!1204))))))

(assert (=> b!509171 (= lt!232535 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45990 res!310011) b!509164))

(assert (= (and b!509164 res!310014) b!509170))

(assert (= (and b!509170 res!310015) b!509168))

(assert (= (and b!509168 res!310009) b!509165))

(assert (= (and b!509165 res!310010) b!509171))

(assert (= (and b!509171 res!310012) b!509163))

(assert (= (and b!509163 res!310008) b!509166))

(assert (= (and b!509166 res!310013) b!509169))

(assert (= (and b!509169 res!310016) b!509167))

(declare-fun m!489957 () Bool)

(assert (=> b!509163 m!489957))

(declare-fun m!489959 () Bool)

(assert (=> b!509165 m!489959))

(declare-fun m!489961 () Bool)

(assert (=> b!509169 m!489961))

(declare-fun m!489963 () Bool)

(assert (=> b!509169 m!489963))

(declare-fun m!489965 () Bool)

(assert (=> b!509169 m!489965))

(declare-fun m!489967 () Bool)

(assert (=> b!509169 m!489967))

(declare-fun m!489969 () Bool)

(assert (=> b!509169 m!489969))

(assert (=> b!509169 m!489965))

(declare-fun m!489971 () Bool)

(assert (=> b!509169 m!489971))

(assert (=> b!509169 m!489967))

(declare-fun m!489973 () Bool)

(assert (=> b!509169 m!489973))

(assert (=> b!509169 m!489967))

(declare-fun m!489975 () Bool)

(assert (=> b!509169 m!489975))

(assert (=> b!509169 m!489965))

(declare-fun m!489977 () Bool)

(assert (=> b!509169 m!489977))

(assert (=> b!509167 m!489967))

(assert (=> b!509167 m!489967))

(declare-fun m!489979 () Bool)

(assert (=> b!509167 m!489979))

(declare-fun m!489981 () Bool)

(assert (=> b!509171 m!489981))

(declare-fun m!489983 () Bool)

(assert (=> b!509168 m!489983))

(assert (=> b!509170 m!489967))

(assert (=> b!509170 m!489967))

(declare-fun m!489985 () Bool)

(assert (=> b!509170 m!489985))

(declare-fun m!489987 () Bool)

(assert (=> start!45990 m!489987))

(declare-fun m!489989 () Bool)

(assert (=> start!45990 m!489989))

(declare-fun m!489991 () Bool)

(assert (=> b!509166 m!489991))

(push 1)

