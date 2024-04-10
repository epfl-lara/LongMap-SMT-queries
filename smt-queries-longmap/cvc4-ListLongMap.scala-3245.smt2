; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45280 () Bool)

(assert start!45280)

(declare-fun b!497443 () Bool)

(declare-fun e!291581 () Bool)

(declare-fun e!291579 () Bool)

(assert (=> b!497443 (= e!291581 (not e!291579))))

(declare-fun res!299830 () Bool)

(assert (=> b!497443 (=> res!299830 e!291579)))

(declare-datatypes ((SeekEntryResult!3934 0))(
  ( (MissingZero!3934 (index!17915 (_ BitVec 32))) (Found!3934 (index!17916 (_ BitVec 32))) (Intermediate!3934 (undefined!4746 Bool) (index!17917 (_ BitVec 32)) (x!46962 (_ BitVec 32))) (Undefined!3934) (MissingVacant!3934 (index!17918 (_ BitVec 32))) )
))
(declare-fun lt!225199 () SeekEntryResult!3934)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225201 () (_ BitVec 32))

(declare-datatypes ((array!32168 0))(
  ( (array!32169 (arr!15467 (Array (_ BitVec 32) (_ BitVec 64))) (size!15831 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32168)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32168 (_ BitVec 32)) SeekEntryResult!3934)

(assert (=> b!497443 (= res!299830 (= lt!225199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225201 (select (store (arr!15467 a!3235) i!1204 k!2280) j!176) (array!32169 (store (arr!15467 a!3235) i!1204 k!2280) (size!15831 a!3235)) mask!3524)))))

(declare-fun lt!225202 () (_ BitVec 32))

(assert (=> b!497443 (= lt!225199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225202 (select (arr!15467 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497443 (= lt!225201 (toIndex!0 (select (store (arr!15467 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497443 (= lt!225202 (toIndex!0 (select (arr!15467 a!3235) j!176) mask!3524))))

(declare-fun e!291580 () Bool)

(assert (=> b!497443 e!291580))

(declare-fun res!299837 () Bool)

(assert (=> b!497443 (=> (not res!299837) (not e!291580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32168 (_ BitVec 32)) Bool)

(assert (=> b!497443 (= res!299837 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14814 0))(
  ( (Unit!14815) )
))
(declare-fun lt!225200 () Unit!14814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14814)

(assert (=> b!497443 (= lt!225200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497444 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32168 (_ BitVec 32)) SeekEntryResult!3934)

(assert (=> b!497444 (= e!291580 (= (seekEntryOrOpen!0 (select (arr!15467 a!3235) j!176) a!3235 mask!3524) (Found!3934 j!176)))))

(declare-fun b!497445 () Bool)

(declare-fun res!299834 () Bool)

(assert (=> b!497445 (=> (not res!299834) (not e!291581))))

(assert (=> b!497445 (= res!299834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497447 () Bool)

(declare-fun res!299835 () Bool)

(declare-fun e!291582 () Bool)

(assert (=> b!497447 (=> (not res!299835) (not e!291582))))

(assert (=> b!497447 (= res!299835 (and (= (size!15831 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15831 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15831 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497448 () Bool)

(declare-fun res!299840 () Bool)

(assert (=> b!497448 (=> res!299840 e!291579)))

(assert (=> b!497448 (= res!299840 (or (undefined!4746 lt!225199) (not (is-Intermediate!3934 lt!225199))))))

(declare-fun b!497449 () Bool)

(declare-fun res!299839 () Bool)

(assert (=> b!497449 (=> (not res!299839) (not e!291582))))

(declare-fun arrayContainsKey!0 (array!32168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497449 (= res!299839 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497450 () Bool)

(assert (=> b!497450 (= e!291582 e!291581)))

(declare-fun res!299836 () Bool)

(assert (=> b!497450 (=> (not res!299836) (not e!291581))))

(declare-fun lt!225198 () SeekEntryResult!3934)

(assert (=> b!497450 (= res!299836 (or (= lt!225198 (MissingZero!3934 i!1204)) (= lt!225198 (MissingVacant!3934 i!1204))))))

(assert (=> b!497450 (= lt!225198 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497451 () Bool)

(declare-fun res!299833 () Bool)

(assert (=> b!497451 (=> (not res!299833) (not e!291581))))

(declare-datatypes ((List!9625 0))(
  ( (Nil!9622) (Cons!9621 (h!10492 (_ BitVec 64)) (t!15853 List!9625)) )
))
(declare-fun arrayNoDuplicates!0 (array!32168 (_ BitVec 32) List!9625) Bool)

(assert (=> b!497451 (= res!299833 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9622))))

(declare-fun b!497452 () Bool)

(declare-fun res!299838 () Bool)

(assert (=> b!497452 (=> (not res!299838) (not e!291582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497452 (= res!299838 (validKeyInArray!0 k!2280))))

(declare-fun b!497453 () Bool)

(declare-fun res!299832 () Bool)

(assert (=> b!497453 (=> (not res!299832) (not e!291582))))

(assert (=> b!497453 (= res!299832 (validKeyInArray!0 (select (arr!15467 a!3235) j!176)))))

(declare-fun b!497446 () Bool)

(assert (=> b!497446 (= e!291579 true)))

(assert (=> b!497446 (and (bvslt (x!46962 lt!225199) #b01111111111111111111111111111110) (or (= (select (arr!15467 a!3235) (index!17917 lt!225199)) (select (arr!15467 a!3235) j!176)) (= (select (arr!15467 a!3235) (index!17917 lt!225199)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15467 a!3235) (index!17917 lt!225199)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!299831 () Bool)

(assert (=> start!45280 (=> (not res!299831) (not e!291582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45280 (= res!299831 (validMask!0 mask!3524))))

(assert (=> start!45280 e!291582))

(assert (=> start!45280 true))

(declare-fun array_inv!11263 (array!32168) Bool)

(assert (=> start!45280 (array_inv!11263 a!3235)))

(assert (= (and start!45280 res!299831) b!497447))

(assert (= (and b!497447 res!299835) b!497453))

(assert (= (and b!497453 res!299832) b!497452))

(assert (= (and b!497452 res!299838) b!497449))

(assert (= (and b!497449 res!299839) b!497450))

(assert (= (and b!497450 res!299836) b!497445))

(assert (= (and b!497445 res!299834) b!497451))

(assert (= (and b!497451 res!299833) b!497443))

(assert (= (and b!497443 res!299837) b!497444))

(assert (= (and b!497443 (not res!299830)) b!497448))

(assert (= (and b!497448 (not res!299840)) b!497446))

(declare-fun m!478831 () Bool)

(assert (=> b!497443 m!478831))

(declare-fun m!478833 () Bool)

(assert (=> b!497443 m!478833))

(declare-fun m!478835 () Bool)

(assert (=> b!497443 m!478835))

(declare-fun m!478837 () Bool)

(assert (=> b!497443 m!478837))

(declare-fun m!478839 () Bool)

(assert (=> b!497443 m!478839))

(assert (=> b!497443 m!478839))

(declare-fun m!478841 () Bool)

(assert (=> b!497443 m!478841))

(assert (=> b!497443 m!478833))

(declare-fun m!478843 () Bool)

(assert (=> b!497443 m!478843))

(assert (=> b!497443 m!478833))

(declare-fun m!478845 () Bool)

(assert (=> b!497443 m!478845))

(assert (=> b!497443 m!478839))

(declare-fun m!478847 () Bool)

(assert (=> b!497443 m!478847))

(declare-fun m!478849 () Bool)

(assert (=> b!497449 m!478849))

(declare-fun m!478851 () Bool)

(assert (=> b!497445 m!478851))

(declare-fun m!478853 () Bool)

(assert (=> b!497452 m!478853))

(declare-fun m!478855 () Bool)

(assert (=> b!497451 m!478855))

(assert (=> b!497444 m!478833))

(assert (=> b!497444 m!478833))

(declare-fun m!478857 () Bool)

(assert (=> b!497444 m!478857))

(declare-fun m!478859 () Bool)

(assert (=> start!45280 m!478859))

(declare-fun m!478861 () Bool)

(assert (=> start!45280 m!478861))

(assert (=> b!497453 m!478833))

(assert (=> b!497453 m!478833))

(declare-fun m!478863 () Bool)

(assert (=> b!497453 m!478863))

(declare-fun m!478865 () Bool)

(assert (=> b!497450 m!478865))

(declare-fun m!478867 () Bool)

(assert (=> b!497446 m!478867))

(assert (=> b!497446 m!478833))

(push 1)

(assert (not b!497453))

(assert (not b!497444))

(assert (not b!497449))

(assert (not b!497443))

(assert (not start!45280))

(assert (not b!497452))

(assert (not b!497451))

(assert (not b!497445))

(assert (not b!497450))

(check-sat)

