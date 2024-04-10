; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44652 () Bool)

(assert start!44652)

(declare-fun res!292833 () Bool)

(declare-fun e!288063 () Bool)

(assert (=> start!44652 (=> (not res!292833) (not e!288063))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44652 (= res!292833 (validMask!0 mask!3524))))

(assert (=> start!44652 e!288063))

(assert (=> start!44652 true))

(declare-datatypes ((array!31711 0))(
  ( (array!31712 (arr!15243 (Array (_ BitVec 32) (_ BitVec 64))) (size!15607 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31711)

(declare-fun array_inv!11039 (array!31711) Bool)

(assert (=> start!44652 (array_inv!11039 a!3235)))

(declare-fun b!489894 () Bool)

(declare-fun e!288066 () Bool)

(assert (=> b!489894 (= e!288066 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3710 0))(
  ( (MissingZero!3710 (index!17019 (_ BitVec 32))) (Found!3710 (index!17020 (_ BitVec 32))) (Intermediate!3710 (undefined!4522 Bool) (index!17021 (_ BitVec 32)) (x!46128 (_ BitVec 32))) (Undefined!3710) (MissingVacant!3710 (index!17022 (_ BitVec 32))) )
))
(declare-fun lt!221131 () SeekEntryResult!3710)

(declare-fun lt!221133 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31711 (_ BitVec 32)) SeekEntryResult!3710)

(assert (=> b!489894 (= lt!221131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221133 (select (store (arr!15243 a!3235) i!1204 k!2280) j!176) (array!31712 (store (arr!15243 a!3235) i!1204 k!2280) (size!15607 a!3235)) mask!3524))))

(declare-fun lt!221130 () SeekEntryResult!3710)

(declare-fun lt!221129 () (_ BitVec 32))

(assert (=> b!489894 (= lt!221130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221129 (select (arr!15243 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489894 (= lt!221133 (toIndex!0 (select (store (arr!15243 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489894 (= lt!221129 (toIndex!0 (select (arr!15243 a!3235) j!176) mask!3524))))

(declare-fun e!288064 () Bool)

(assert (=> b!489894 e!288064))

(declare-fun res!292834 () Bool)

(assert (=> b!489894 (=> (not res!292834) (not e!288064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31711 (_ BitVec 32)) Bool)

(assert (=> b!489894 (= res!292834 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14366 0))(
  ( (Unit!14367) )
))
(declare-fun lt!221134 () Unit!14366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14366)

(assert (=> b!489894 (= lt!221134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489895 () Bool)

(declare-fun res!292835 () Bool)

(assert (=> b!489895 (=> (not res!292835) (not e!288066))))

(declare-datatypes ((List!9401 0))(
  ( (Nil!9398) (Cons!9397 (h!10259 (_ BitVec 64)) (t!15629 List!9401)) )
))
(declare-fun arrayNoDuplicates!0 (array!31711 (_ BitVec 32) List!9401) Bool)

(assert (=> b!489895 (= res!292835 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9398))))

(declare-fun b!489896 () Bool)

(declare-fun res!292838 () Bool)

(assert (=> b!489896 (=> (not res!292838) (not e!288066))))

(assert (=> b!489896 (= res!292838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489897 () Bool)

(declare-fun res!292836 () Bool)

(assert (=> b!489897 (=> (not res!292836) (not e!288063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489897 (= res!292836 (validKeyInArray!0 k!2280))))

(declare-fun b!489898 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31711 (_ BitVec 32)) SeekEntryResult!3710)

(assert (=> b!489898 (= e!288064 (= (seekEntryOrOpen!0 (select (arr!15243 a!3235) j!176) a!3235 mask!3524) (Found!3710 j!176)))))

(declare-fun b!489899 () Bool)

(declare-fun res!292837 () Bool)

(assert (=> b!489899 (=> (not res!292837) (not e!288063))))

(declare-fun arrayContainsKey!0 (array!31711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489899 (= res!292837 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489900 () Bool)

(assert (=> b!489900 (= e!288063 e!288066)))

(declare-fun res!292832 () Bool)

(assert (=> b!489900 (=> (not res!292832) (not e!288066))))

(declare-fun lt!221132 () SeekEntryResult!3710)

(assert (=> b!489900 (= res!292832 (or (= lt!221132 (MissingZero!3710 i!1204)) (= lt!221132 (MissingVacant!3710 i!1204))))))

(assert (=> b!489900 (= lt!221132 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489901 () Bool)

(declare-fun res!292830 () Bool)

(assert (=> b!489901 (=> (not res!292830) (not e!288063))))

(assert (=> b!489901 (= res!292830 (and (= (size!15607 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15607 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15607 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489902 () Bool)

(declare-fun res!292831 () Bool)

(assert (=> b!489902 (=> (not res!292831) (not e!288063))))

(assert (=> b!489902 (= res!292831 (validKeyInArray!0 (select (arr!15243 a!3235) j!176)))))

(assert (= (and start!44652 res!292833) b!489901))

(assert (= (and b!489901 res!292830) b!489902))

(assert (= (and b!489902 res!292831) b!489897))

(assert (= (and b!489897 res!292836) b!489899))

(assert (= (and b!489899 res!292837) b!489900))

(assert (= (and b!489900 res!292832) b!489896))

(assert (= (and b!489896 res!292838) b!489895))

(assert (= (and b!489895 res!292835) b!489894))

(assert (= (and b!489894 res!292834) b!489898))

(declare-fun m!469821 () Bool)

(assert (=> b!489898 m!469821))

(assert (=> b!489898 m!469821))

(declare-fun m!469823 () Bool)

(assert (=> b!489898 m!469823))

(declare-fun m!469825 () Bool)

(assert (=> b!489899 m!469825))

(declare-fun m!469827 () Bool)

(assert (=> b!489896 m!469827))

(assert (=> b!489902 m!469821))

(assert (=> b!489902 m!469821))

(declare-fun m!469829 () Bool)

(assert (=> b!489902 m!469829))

(declare-fun m!469831 () Bool)

(assert (=> b!489897 m!469831))

(declare-fun m!469833 () Bool)

(assert (=> b!489900 m!469833))

(declare-fun m!469835 () Bool)

(assert (=> b!489895 m!469835))

(assert (=> b!489894 m!469821))

(declare-fun m!469837 () Bool)

(assert (=> b!489894 m!469837))

(declare-fun m!469839 () Bool)

(assert (=> b!489894 m!469839))

(declare-fun m!469841 () Bool)

(assert (=> b!489894 m!469841))

(declare-fun m!469843 () Bool)

(assert (=> b!489894 m!469843))

(assert (=> b!489894 m!469821))

(declare-fun m!469845 () Bool)

(assert (=> b!489894 m!469845))

(assert (=> b!489894 m!469821))

(declare-fun m!469847 () Bool)

(assert (=> b!489894 m!469847))

(assert (=> b!489894 m!469843))

(declare-fun m!469849 () Bool)

(assert (=> b!489894 m!469849))

(assert (=> b!489894 m!469843))

(declare-fun m!469851 () Bool)

(assert (=> b!489894 m!469851))

(declare-fun m!469853 () Bool)

(assert (=> start!44652 m!469853))

(declare-fun m!469855 () Bool)

(assert (=> start!44652 m!469855))

(push 1)

