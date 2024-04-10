; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44658 () Bool)

(assert start!44658)

(declare-fun b!489975 () Bool)

(declare-fun res!292915 () Bool)

(declare-fun e!288099 () Bool)

(assert (=> b!489975 (=> (not res!292915) (not e!288099))))

(declare-datatypes ((array!31717 0))(
  ( (array!31718 (arr!15246 (Array (_ BitVec 32) (_ BitVec 64))) (size!15610 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31717)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31717 (_ BitVec 32)) Bool)

(assert (=> b!489975 (= res!292915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489976 () Bool)

(declare-fun res!292919 () Bool)

(declare-fun e!288100 () Bool)

(assert (=> b!489976 (=> (not res!292919) (not e!288100))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489976 (= res!292919 (validKeyInArray!0 k!2280))))

(declare-fun b!489977 () Bool)

(declare-fun res!292914 () Bool)

(assert (=> b!489977 (=> (not res!292914) (not e!288100))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489977 (= res!292914 (and (= (size!15610 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15610 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15610 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!292912 () Bool)

(assert (=> start!44658 (=> (not res!292912) (not e!288100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44658 (= res!292912 (validMask!0 mask!3524))))

(assert (=> start!44658 e!288100))

(assert (=> start!44658 true))

(declare-fun array_inv!11042 (array!31717) Bool)

(assert (=> start!44658 (array_inv!11042 a!3235)))

(declare-fun b!489978 () Bool)

(assert (=> b!489978 (= e!288100 e!288099)))

(declare-fun res!292911 () Bool)

(assert (=> b!489978 (=> (not res!292911) (not e!288099))))

(declare-datatypes ((SeekEntryResult!3713 0))(
  ( (MissingZero!3713 (index!17031 (_ BitVec 32))) (Found!3713 (index!17032 (_ BitVec 32))) (Intermediate!3713 (undefined!4525 Bool) (index!17033 (_ BitVec 32)) (x!46139 (_ BitVec 32))) (Undefined!3713) (MissingVacant!3713 (index!17034 (_ BitVec 32))) )
))
(declare-fun lt!221184 () SeekEntryResult!3713)

(assert (=> b!489978 (= res!292911 (or (= lt!221184 (MissingZero!3713 i!1204)) (= lt!221184 (MissingVacant!3713 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31717 (_ BitVec 32)) SeekEntryResult!3713)

(assert (=> b!489978 (= lt!221184 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489979 () Bool)

(declare-fun res!292913 () Bool)

(assert (=> b!489979 (=> (not res!292913) (not e!288100))))

(declare-fun arrayContainsKey!0 (array!31717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489979 (= res!292913 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489980 () Bool)

(assert (=> b!489980 (= e!288099 (not true))))

(declare-fun lt!221187 () (_ BitVec 32))

(declare-fun lt!221185 () SeekEntryResult!3713)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31717 (_ BitVec 32)) SeekEntryResult!3713)

(assert (=> b!489980 (= lt!221185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221187 (select (store (arr!15246 a!3235) i!1204 k!2280) j!176) (array!31718 (store (arr!15246 a!3235) i!1204 k!2280) (size!15610 a!3235)) mask!3524))))

(declare-fun lt!221188 () (_ BitVec 32))

(declare-fun lt!221183 () SeekEntryResult!3713)

(assert (=> b!489980 (= lt!221183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221188 (select (arr!15246 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489980 (= lt!221187 (toIndex!0 (select (store (arr!15246 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489980 (= lt!221188 (toIndex!0 (select (arr!15246 a!3235) j!176) mask!3524))))

(declare-fun e!288102 () Bool)

(assert (=> b!489980 e!288102))

(declare-fun res!292918 () Bool)

(assert (=> b!489980 (=> (not res!292918) (not e!288102))))

(assert (=> b!489980 (= res!292918 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14372 0))(
  ( (Unit!14373) )
))
(declare-fun lt!221186 () Unit!14372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14372)

(assert (=> b!489980 (= lt!221186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489981 () Bool)

(declare-fun res!292916 () Bool)

(assert (=> b!489981 (=> (not res!292916) (not e!288100))))

(assert (=> b!489981 (= res!292916 (validKeyInArray!0 (select (arr!15246 a!3235) j!176)))))

(declare-fun b!489982 () Bool)

(assert (=> b!489982 (= e!288102 (= (seekEntryOrOpen!0 (select (arr!15246 a!3235) j!176) a!3235 mask!3524) (Found!3713 j!176)))))

(declare-fun b!489983 () Bool)

(declare-fun res!292917 () Bool)

(assert (=> b!489983 (=> (not res!292917) (not e!288099))))

(declare-datatypes ((List!9404 0))(
  ( (Nil!9401) (Cons!9400 (h!10262 (_ BitVec 64)) (t!15632 List!9404)) )
))
(declare-fun arrayNoDuplicates!0 (array!31717 (_ BitVec 32) List!9404) Bool)

(assert (=> b!489983 (= res!292917 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9401))))

(assert (= (and start!44658 res!292912) b!489977))

(assert (= (and b!489977 res!292914) b!489981))

(assert (= (and b!489981 res!292916) b!489976))

(assert (= (and b!489976 res!292919) b!489979))

(assert (= (and b!489979 res!292913) b!489978))

(assert (= (and b!489978 res!292911) b!489975))

(assert (= (and b!489975 res!292915) b!489983))

(assert (= (and b!489983 res!292917) b!489980))

(assert (= (and b!489980 res!292918) b!489982))

(declare-fun m!469929 () Bool)

(assert (=> b!489978 m!469929))

(declare-fun m!469931 () Bool)

(assert (=> start!44658 m!469931))

(declare-fun m!469933 () Bool)

(assert (=> start!44658 m!469933))

(declare-fun m!469935 () Bool)

(assert (=> b!489981 m!469935))

(assert (=> b!489981 m!469935))

(declare-fun m!469937 () Bool)

(assert (=> b!489981 m!469937))

(declare-fun m!469939 () Bool)

(assert (=> b!489983 m!469939))

(declare-fun m!469941 () Bool)

(assert (=> b!489980 m!469941))

(declare-fun m!469943 () Bool)

(assert (=> b!489980 m!469943))

(declare-fun m!469945 () Bool)

(assert (=> b!489980 m!469945))

(declare-fun m!469947 () Bool)

(assert (=> b!489980 m!469947))

(assert (=> b!489980 m!469943))

(assert (=> b!489980 m!469935))

(declare-fun m!469949 () Bool)

(assert (=> b!489980 m!469949))

(assert (=> b!489980 m!469935))

(declare-fun m!469951 () Bool)

(assert (=> b!489980 m!469951))

(assert (=> b!489980 m!469935))

(declare-fun m!469953 () Bool)

(assert (=> b!489980 m!469953))

(assert (=> b!489980 m!469943))

(declare-fun m!469955 () Bool)

(assert (=> b!489980 m!469955))

(assert (=> b!489982 m!469935))

(assert (=> b!489982 m!469935))

(declare-fun m!469957 () Bool)

(assert (=> b!489982 m!469957))

(declare-fun m!469959 () Bool)

(assert (=> b!489979 m!469959))

(declare-fun m!469961 () Bool)

(assert (=> b!489975 m!469961))

(declare-fun m!469963 () Bool)

(assert (=> b!489976 m!469963))

(push 1)

