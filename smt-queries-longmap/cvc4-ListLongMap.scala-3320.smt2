; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45868 () Bool)

(assert start!45868)

(declare-fun b!508037 () Bool)

(declare-fun res!309001 () Bool)

(declare-fun e!297274 () Bool)

(assert (=> b!508037 (=> (not res!309001) (not e!297274))))

(declare-datatypes ((array!32624 0))(
  ( (array!32625 (arr!15692 (Array (_ BitVec 32) (_ BitVec 64))) (size!16056 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32624)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32624 (_ BitVec 32)) Bool)

(assert (=> b!508037 (= res!309001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508038 () Bool)

(declare-fun res!308999 () Bool)

(declare-fun e!297276 () Bool)

(assert (=> b!508038 (=> (not res!308999) (not e!297276))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508038 (= res!308999 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508039 () Bool)

(declare-fun res!308998 () Bool)

(assert (=> b!508039 (=> (not res!308998) (not e!297276))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508039 (= res!308998 (and (= (size!16056 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16056 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16056 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508040 () Bool)

(assert (=> b!508040 (= e!297274 false)))

(declare-fun lt!232150 () Bool)

(declare-datatypes ((List!9850 0))(
  ( (Nil!9847) (Cons!9846 (h!10723 (_ BitVec 64)) (t!16078 List!9850)) )
))
(declare-fun arrayNoDuplicates!0 (array!32624 (_ BitVec 32) List!9850) Bool)

(assert (=> b!508040 (= lt!232150 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9847))))

(declare-fun res!309002 () Bool)

(assert (=> start!45868 (=> (not res!309002) (not e!297276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45868 (= res!309002 (validMask!0 mask!3524))))

(assert (=> start!45868 e!297276))

(assert (=> start!45868 true))

(declare-fun array_inv!11488 (array!32624) Bool)

(assert (=> start!45868 (array_inv!11488 a!3235)))

(declare-fun b!508041 () Bool)

(declare-fun res!309000 () Bool)

(assert (=> b!508041 (=> (not res!309000) (not e!297276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508041 (= res!309000 (validKeyInArray!0 (select (arr!15692 a!3235) j!176)))))

(declare-fun b!508042 () Bool)

(assert (=> b!508042 (= e!297276 e!297274)))

(declare-fun res!308996 () Bool)

(assert (=> b!508042 (=> (not res!308996) (not e!297274))))

(declare-datatypes ((SeekEntryResult!4159 0))(
  ( (MissingZero!4159 (index!18824 (_ BitVec 32))) (Found!4159 (index!18825 (_ BitVec 32))) (Intermediate!4159 (undefined!4971 Bool) (index!18826 (_ BitVec 32)) (x!47808 (_ BitVec 32))) (Undefined!4159) (MissingVacant!4159 (index!18827 (_ BitVec 32))) )
))
(declare-fun lt!232149 () SeekEntryResult!4159)

(assert (=> b!508042 (= res!308996 (or (= lt!232149 (MissingZero!4159 i!1204)) (= lt!232149 (MissingVacant!4159 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32624 (_ BitVec 32)) SeekEntryResult!4159)

(assert (=> b!508042 (= lt!232149 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508043 () Bool)

(declare-fun res!308997 () Bool)

(assert (=> b!508043 (=> (not res!308997) (not e!297276))))

(assert (=> b!508043 (= res!308997 (validKeyInArray!0 k!2280))))

(assert (= (and start!45868 res!309002) b!508039))

(assert (= (and b!508039 res!308998) b!508041))

(assert (= (and b!508041 res!309000) b!508043))

(assert (= (and b!508043 res!308997) b!508038))

(assert (= (and b!508038 res!308999) b!508042))

(assert (= (and b!508042 res!308996) b!508037))

(assert (= (and b!508037 res!309001) b!508040))

(declare-fun m!488877 () Bool)

(assert (=> b!508041 m!488877))

(assert (=> b!508041 m!488877))

(declare-fun m!488879 () Bool)

(assert (=> b!508041 m!488879))

(declare-fun m!488881 () Bool)

(assert (=> b!508037 m!488881))

(declare-fun m!488883 () Bool)

(assert (=> b!508043 m!488883))

(declare-fun m!488885 () Bool)

(assert (=> b!508038 m!488885))

(declare-fun m!488887 () Bool)

(assert (=> b!508040 m!488887))

(declare-fun m!488889 () Bool)

(assert (=> b!508042 m!488889))

(declare-fun m!488891 () Bool)

(assert (=> start!45868 m!488891))

(declare-fun m!488893 () Bool)

(assert (=> start!45868 m!488893))

(push 1)

(assert (not start!45868))

(assert (not b!508038))

(assert (not b!508040))

(assert (not b!508037))

(assert (not b!508041))

(assert (not b!508042))

(assert (not b!508043))

(check-sat)

