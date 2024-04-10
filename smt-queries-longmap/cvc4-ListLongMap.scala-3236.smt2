; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45226 () Bool)

(assert start!45226)

(declare-fun b!496552 () Bool)

(declare-fun res!298941 () Bool)

(declare-fun e!291176 () Bool)

(assert (=> b!496552 (=> (not res!298941) (not e!291176))))

(declare-datatypes ((array!32114 0))(
  ( (array!32115 (arr!15440 (Array (_ BitVec 32) (_ BitVec 64))) (size!15804 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32114)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496552 (= res!298941 (validKeyInArray!0 (select (arr!15440 a!3235) j!176)))))

(declare-fun b!496553 () Bool)

(declare-fun res!298949 () Bool)

(assert (=> b!496553 (=> (not res!298949) (not e!291176))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496553 (= res!298949 (and (= (size!15804 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15804 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15804 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!298944 () Bool)

(assert (=> start!45226 (=> (not res!298944) (not e!291176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45226 (= res!298944 (validMask!0 mask!3524))))

(assert (=> start!45226 e!291176))

(assert (=> start!45226 true))

(declare-fun array_inv!11236 (array!32114) Bool)

(assert (=> start!45226 (array_inv!11236 a!3235)))

(declare-fun b!496554 () Bool)

(declare-fun e!291175 () Bool)

(assert (=> b!496554 (= e!291175 true)))

(declare-datatypes ((SeekEntryResult!3907 0))(
  ( (MissingZero!3907 (index!17807 (_ BitVec 32))) (Found!3907 (index!17808 (_ BitVec 32))) (Intermediate!3907 (undefined!4719 Bool) (index!17809 (_ BitVec 32)) (x!46863 (_ BitVec 32))) (Undefined!3907) (MissingVacant!3907 (index!17810 (_ BitVec 32))) )
))
(declare-fun lt!224797 () SeekEntryResult!3907)

(assert (=> b!496554 (and (bvslt (x!46863 lt!224797) #b01111111111111111111111111111110) (or (= (select (arr!15440 a!3235) (index!17809 lt!224797)) (select (arr!15440 a!3235) j!176)) (= (select (arr!15440 a!3235) (index!17809 lt!224797)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15440 a!3235) (index!17809 lt!224797)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496555 () Bool)

(declare-fun res!298943 () Bool)

(assert (=> b!496555 (=> res!298943 e!291175)))

(assert (=> b!496555 (= res!298943 (or (undefined!4719 lt!224797) (not (is-Intermediate!3907 lt!224797))))))

(declare-fun b!496556 () Bool)

(declare-fun res!298948 () Bool)

(declare-fun e!291173 () Bool)

(assert (=> b!496556 (=> (not res!298948) (not e!291173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32114 (_ BitVec 32)) Bool)

(assert (=> b!496556 (= res!298948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496557 () Bool)

(declare-fun res!298946 () Bool)

(assert (=> b!496557 (=> (not res!298946) (not e!291176))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496557 (= res!298946 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496558 () Bool)

(assert (=> b!496558 (= e!291176 e!291173)))

(declare-fun res!298939 () Bool)

(assert (=> b!496558 (=> (not res!298939) (not e!291173))))

(declare-fun lt!224793 () SeekEntryResult!3907)

(assert (=> b!496558 (= res!298939 (or (= lt!224793 (MissingZero!3907 i!1204)) (= lt!224793 (MissingVacant!3907 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32114 (_ BitVec 32)) SeekEntryResult!3907)

(assert (=> b!496558 (= lt!224793 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496559 () Bool)

(declare-fun e!291174 () Bool)

(assert (=> b!496559 (= e!291174 (= (seekEntryOrOpen!0 (select (arr!15440 a!3235) j!176) a!3235 mask!3524) (Found!3907 j!176)))))

(declare-fun b!496560 () Bool)

(declare-fun res!298945 () Bool)

(assert (=> b!496560 (=> (not res!298945) (not e!291176))))

(assert (=> b!496560 (= res!298945 (validKeyInArray!0 k!2280))))

(declare-fun b!496561 () Bool)

(assert (=> b!496561 (= e!291173 (not e!291175))))

(declare-fun res!298940 () Bool)

(assert (=> b!496561 (=> res!298940 e!291175)))

(declare-fun lt!224794 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32114 (_ BitVec 32)) SeekEntryResult!3907)

(assert (=> b!496561 (= res!298940 (= lt!224797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224794 (select (store (arr!15440 a!3235) i!1204 k!2280) j!176) (array!32115 (store (arr!15440 a!3235) i!1204 k!2280) (size!15804 a!3235)) mask!3524)))))

(declare-fun lt!224796 () (_ BitVec 32))

(assert (=> b!496561 (= lt!224797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224796 (select (arr!15440 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496561 (= lt!224794 (toIndex!0 (select (store (arr!15440 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496561 (= lt!224796 (toIndex!0 (select (arr!15440 a!3235) j!176) mask!3524))))

(assert (=> b!496561 e!291174))

(declare-fun res!298947 () Bool)

(assert (=> b!496561 (=> (not res!298947) (not e!291174))))

(assert (=> b!496561 (= res!298947 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14760 0))(
  ( (Unit!14761) )
))
(declare-fun lt!224795 () Unit!14760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14760)

(assert (=> b!496561 (= lt!224795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496562 () Bool)

(declare-fun res!298942 () Bool)

(assert (=> b!496562 (=> (not res!298942) (not e!291173))))

(declare-datatypes ((List!9598 0))(
  ( (Nil!9595) (Cons!9594 (h!10465 (_ BitVec 64)) (t!15826 List!9598)) )
))
(declare-fun arrayNoDuplicates!0 (array!32114 (_ BitVec 32) List!9598) Bool)

(assert (=> b!496562 (= res!298942 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9595))))

(assert (= (and start!45226 res!298944) b!496553))

(assert (= (and b!496553 res!298949) b!496552))

(assert (= (and b!496552 res!298941) b!496560))

(assert (= (and b!496560 res!298945) b!496557))

(assert (= (and b!496557 res!298946) b!496558))

(assert (= (and b!496558 res!298939) b!496556))

(assert (= (and b!496556 res!298948) b!496562))

(assert (= (and b!496562 res!298942) b!496561))

(assert (= (and b!496561 res!298947) b!496559))

(assert (= (and b!496561 (not res!298940)) b!496555))

(assert (= (and b!496555 (not res!298943)) b!496554))

(declare-fun m!477805 () Bool)

(assert (=> b!496560 m!477805))

(declare-fun m!477807 () Bool)

(assert (=> b!496559 m!477807))

(assert (=> b!496559 m!477807))

(declare-fun m!477809 () Bool)

(assert (=> b!496559 m!477809))

(declare-fun m!477811 () Bool)

(assert (=> b!496554 m!477811))

(assert (=> b!496554 m!477807))

(declare-fun m!477813 () Bool)

(assert (=> b!496556 m!477813))

(declare-fun m!477815 () Bool)

(assert (=> start!45226 m!477815))

(declare-fun m!477817 () Bool)

(assert (=> start!45226 m!477817))

(assert (=> b!496552 m!477807))

(assert (=> b!496552 m!477807))

(declare-fun m!477819 () Bool)

(assert (=> b!496552 m!477819))

(declare-fun m!477821 () Bool)

(assert (=> b!496562 m!477821))

(declare-fun m!477823 () Bool)

(assert (=> b!496558 m!477823))

(declare-fun m!477825 () Bool)

(assert (=> b!496557 m!477825))

(declare-fun m!477827 () Bool)

(assert (=> b!496561 m!477827))

(declare-fun m!477829 () Bool)

(assert (=> b!496561 m!477829))

(declare-fun m!477831 () Bool)

(assert (=> b!496561 m!477831))

(assert (=> b!496561 m!477807))

(declare-fun m!477833 () Bool)

(assert (=> b!496561 m!477833))

(assert (=> b!496561 m!477807))

(declare-fun m!477835 () Bool)

(assert (=> b!496561 m!477835))

(assert (=> b!496561 m!477807))

(declare-fun m!477837 () Bool)

(assert (=> b!496561 m!477837))

(assert (=> b!496561 m!477831))

(declare-fun m!477839 () Bool)

(assert (=> b!496561 m!477839))

(assert (=> b!496561 m!477831))

(declare-fun m!477841 () Bool)

(assert (=> b!496561 m!477841))

(push 1)

(assert (not b!496561))

(assert (not b!496559))

(assert (not b!496556))

(assert (not start!45226))

(assert (not b!496558))

(assert (not b!496562))

(assert (not b!496560))

(assert (not b!496557))

(assert (not b!496552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

