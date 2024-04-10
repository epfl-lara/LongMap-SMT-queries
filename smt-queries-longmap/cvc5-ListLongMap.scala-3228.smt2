; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45174 () Bool)

(assert start!45174)

(declare-fun e!290783 () Bool)

(declare-fun b!495694 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32062 0))(
  ( (array!32063 (arr!15414 (Array (_ BitVec 32) (_ BitVec 64))) (size!15778 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32062)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3881 0))(
  ( (MissingZero!3881 (index!17703 (_ BitVec 32))) (Found!3881 (index!17704 (_ BitVec 32))) (Intermediate!3881 (undefined!4693 Bool) (index!17705 (_ BitVec 32)) (x!46773 (_ BitVec 32))) (Undefined!3881) (MissingVacant!3881 (index!17706 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32062 (_ BitVec 32)) SeekEntryResult!3881)

(assert (=> b!495694 (= e!290783 (= (seekEntryOrOpen!0 (select (arr!15414 a!3235) j!176) a!3235 mask!3524) (Found!3881 j!176)))))

(declare-fun b!495695 () Bool)

(declare-fun res!298084 () Bool)

(declare-fun e!290785 () Bool)

(assert (=> b!495695 (=> (not res!298084) (not e!290785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495695 (= res!298084 (validKeyInArray!0 (select (arr!15414 a!3235) j!176)))))

(declare-fun b!495696 () Bool)

(declare-fun e!290787 () Bool)

(assert (=> b!495696 (= e!290787 true)))

(declare-fun lt!224403 () SeekEntryResult!3881)

(assert (=> b!495696 (and (bvslt (x!46773 lt!224403) #b01111111111111111111111111111110) (or (= (select (arr!15414 a!3235) (index!17705 lt!224403)) (select (arr!15414 a!3235) j!176)) (= (select (arr!15414 a!3235) (index!17705 lt!224403)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15414 a!3235) (index!17705 lt!224403)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495697 () Bool)

(declare-fun res!298089 () Bool)

(assert (=> b!495697 (=> (not res!298089) (not e!290785))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!495697 (= res!298089 (validKeyInArray!0 k!2280))))

(declare-fun b!495698 () Bool)

(declare-fun res!298087 () Bool)

(declare-fun e!290786 () Bool)

(assert (=> b!495698 (=> (not res!298087) (not e!290786))))

(declare-datatypes ((List!9572 0))(
  ( (Nil!9569) (Cons!9568 (h!10439 (_ BitVec 64)) (t!15800 List!9572)) )
))
(declare-fun arrayNoDuplicates!0 (array!32062 (_ BitVec 32) List!9572) Bool)

(assert (=> b!495698 (= res!298087 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9569))))

(declare-fun b!495699 () Bool)

(declare-fun res!298082 () Bool)

(assert (=> b!495699 (=> (not res!298082) (not e!290785))))

(declare-fun arrayContainsKey!0 (array!32062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495699 (= res!298082 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495700 () Bool)

(declare-fun res!298088 () Bool)

(assert (=> b!495700 (=> (not res!298088) (not e!290786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32062 (_ BitVec 32)) Bool)

(assert (=> b!495700 (= res!298088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495701 () Bool)

(declare-fun res!298090 () Bool)

(assert (=> b!495701 (=> res!298090 e!290787)))

(assert (=> b!495701 (= res!298090 (or (undefined!4693 lt!224403) (not (is-Intermediate!3881 lt!224403))))))

(declare-fun res!298091 () Bool)

(assert (=> start!45174 (=> (not res!298091) (not e!290785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45174 (= res!298091 (validMask!0 mask!3524))))

(assert (=> start!45174 e!290785))

(assert (=> start!45174 true))

(declare-fun array_inv!11210 (array!32062) Bool)

(assert (=> start!45174 (array_inv!11210 a!3235)))

(declare-fun b!495702 () Bool)

(assert (=> b!495702 (= e!290785 e!290786)))

(declare-fun res!298086 () Bool)

(assert (=> b!495702 (=> (not res!298086) (not e!290786))))

(declare-fun lt!224404 () SeekEntryResult!3881)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495702 (= res!298086 (or (= lt!224404 (MissingZero!3881 i!1204)) (= lt!224404 (MissingVacant!3881 i!1204))))))

(assert (=> b!495702 (= lt!224404 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495703 () Bool)

(assert (=> b!495703 (= e!290786 (not e!290787))))

(declare-fun res!298085 () Bool)

(assert (=> b!495703 (=> res!298085 e!290787)))

(declare-fun lt!224405 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32062 (_ BitVec 32)) SeekEntryResult!3881)

(assert (=> b!495703 (= res!298085 (= lt!224403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224405 (select (store (arr!15414 a!3235) i!1204 k!2280) j!176) (array!32063 (store (arr!15414 a!3235) i!1204 k!2280) (size!15778 a!3235)) mask!3524)))))

(declare-fun lt!224406 () (_ BitVec 32))

(assert (=> b!495703 (= lt!224403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224406 (select (arr!15414 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495703 (= lt!224405 (toIndex!0 (select (store (arr!15414 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495703 (= lt!224406 (toIndex!0 (select (arr!15414 a!3235) j!176) mask!3524))))

(assert (=> b!495703 e!290783))

(declare-fun res!298083 () Bool)

(assert (=> b!495703 (=> (not res!298083) (not e!290783))))

(assert (=> b!495703 (= res!298083 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14708 0))(
  ( (Unit!14709) )
))
(declare-fun lt!224407 () Unit!14708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14708)

(assert (=> b!495703 (= lt!224407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495704 () Bool)

(declare-fun res!298081 () Bool)

(assert (=> b!495704 (=> (not res!298081) (not e!290785))))

(assert (=> b!495704 (= res!298081 (and (= (size!15778 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15778 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15778 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45174 res!298091) b!495704))

(assert (= (and b!495704 res!298081) b!495695))

(assert (= (and b!495695 res!298084) b!495697))

(assert (= (and b!495697 res!298089) b!495699))

(assert (= (and b!495699 res!298082) b!495702))

(assert (= (and b!495702 res!298086) b!495700))

(assert (= (and b!495700 res!298088) b!495698))

(assert (= (and b!495698 res!298087) b!495703))

(assert (= (and b!495703 res!298083) b!495694))

(assert (= (and b!495703 (not res!298085)) b!495701))

(assert (= (and b!495701 (not res!298090)) b!495696))

(declare-fun m!476817 () Bool)

(assert (=> b!495702 m!476817))

(declare-fun m!476819 () Bool)

(assert (=> b!495698 m!476819))

(declare-fun m!476821 () Bool)

(assert (=> b!495700 m!476821))

(declare-fun m!476823 () Bool)

(assert (=> b!495695 m!476823))

(assert (=> b!495695 m!476823))

(declare-fun m!476825 () Bool)

(assert (=> b!495695 m!476825))

(declare-fun m!476827 () Bool)

(assert (=> b!495703 m!476827))

(declare-fun m!476829 () Bool)

(assert (=> b!495703 m!476829))

(declare-fun m!476831 () Bool)

(assert (=> b!495703 m!476831))

(assert (=> b!495703 m!476823))

(declare-fun m!476833 () Bool)

(assert (=> b!495703 m!476833))

(assert (=> b!495703 m!476823))

(declare-fun m!476835 () Bool)

(assert (=> b!495703 m!476835))

(assert (=> b!495703 m!476831))

(declare-fun m!476837 () Bool)

(assert (=> b!495703 m!476837))

(assert (=> b!495703 m!476831))

(declare-fun m!476839 () Bool)

(assert (=> b!495703 m!476839))

(assert (=> b!495703 m!476823))

(declare-fun m!476841 () Bool)

(assert (=> b!495703 m!476841))

(declare-fun m!476843 () Bool)

(assert (=> b!495696 m!476843))

(assert (=> b!495696 m!476823))

(declare-fun m!476845 () Bool)

(assert (=> b!495699 m!476845))

(declare-fun m!476847 () Bool)

(assert (=> start!45174 m!476847))

(declare-fun m!476849 () Bool)

(assert (=> start!45174 m!476849))

(assert (=> b!495694 m!476823))

(assert (=> b!495694 m!476823))

(declare-fun m!476851 () Bool)

(assert (=> b!495694 m!476851))

(declare-fun m!476853 () Bool)

(assert (=> b!495697 m!476853))

(push 1)

(assert (not b!495695))

(assert (not b!495700))

(assert (not b!495697))

(assert (not start!45174))

(assert (not b!495699))

(assert (not b!495694))

(assert (not b!495702))

(assert (not b!495698))

(assert (not b!495703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

