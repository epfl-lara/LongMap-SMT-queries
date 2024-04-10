; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53182 () Bool)

(assert start!53182)

(declare-fun b!578093 () Bool)

(declare-fun e!332509 () Bool)

(declare-fun e!332510 () Bool)

(assert (=> b!578093 (= e!332509 e!332510)))

(declare-fun res!365913 () Bool)

(assert (=> b!578093 (=> (not res!365913) (not e!332510))))

(declare-datatypes ((SeekEntryResult!5756 0))(
  ( (MissingZero!5756 (index!25251 (_ BitVec 32))) (Found!5756 (index!25252 (_ BitVec 32))) (Intermediate!5756 (undefined!6568 Bool) (index!25253 (_ BitVec 32)) (x!54161 (_ BitVec 32))) (Undefined!5756) (MissingVacant!5756 (index!25254 (_ BitVec 32))) )
))
(declare-fun lt!264175 () SeekEntryResult!5756)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578093 (= res!365913 (or (= lt!264175 (MissingZero!5756 i!1108)) (= lt!264175 (MissingVacant!5756 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36083 0))(
  ( (array!36084 (arr!17316 (Array (_ BitVec 32) (_ BitVec 64))) (size!17680 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36083)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36083 (_ BitVec 32)) SeekEntryResult!5756)

(assert (=> b!578093 (= lt!264175 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578094 () Bool)

(declare-fun res!365911 () Bool)

(assert (=> b!578094 (=> (not res!365911) (not e!332509))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578094 (= res!365911 (and (= (size!17680 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17680 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17680 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578095 () Bool)

(declare-fun res!365912 () Bool)

(assert (=> b!578095 (=> (not res!365912) (not e!332509))))

(declare-fun arrayContainsKey!0 (array!36083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578095 (= res!365912 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578096 () Bool)

(declare-fun res!365909 () Bool)

(assert (=> b!578096 (=> (not res!365909) (not e!332510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36083 (_ BitVec 32)) Bool)

(assert (=> b!578096 (= res!365909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!365914 () Bool)

(assert (=> start!53182 (=> (not res!365914) (not e!332509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53182 (= res!365914 (validMask!0 mask!3053))))

(assert (=> start!53182 e!332509))

(assert (=> start!53182 true))

(declare-fun array_inv!13112 (array!36083) Bool)

(assert (=> start!53182 (array_inv!13112 a!2986)))

(declare-fun b!578097 () Bool)

(declare-fun res!365915 () Bool)

(assert (=> b!578097 (=> (not res!365915) (not e!332509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578097 (= res!365915 (validKeyInArray!0 (select (arr!17316 a!2986) j!136)))))

(declare-fun b!578098 () Bool)

(assert (=> b!578098 (= e!332510 false)))

(declare-fun lt!264174 () Bool)

(declare-datatypes ((List!11357 0))(
  ( (Nil!11354) (Cons!11353 (h!12398 (_ BitVec 64)) (t!17585 List!11357)) )
))
(declare-fun arrayNoDuplicates!0 (array!36083 (_ BitVec 32) List!11357) Bool)

(assert (=> b!578098 (= lt!264174 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11354))))

(declare-fun b!578099 () Bool)

(declare-fun res!365910 () Bool)

(assert (=> b!578099 (=> (not res!365910) (not e!332509))))

(assert (=> b!578099 (= res!365910 (validKeyInArray!0 k!1786))))

(assert (= (and start!53182 res!365914) b!578094))

(assert (= (and b!578094 res!365911) b!578097))

(assert (= (and b!578097 res!365915) b!578099))

(assert (= (and b!578099 res!365910) b!578095))

(assert (= (and b!578095 res!365912) b!578093))

(assert (= (and b!578093 res!365913) b!578096))

(assert (= (and b!578096 res!365909) b!578098))

(declare-fun m!556819 () Bool)

(assert (=> b!578096 m!556819))

(declare-fun m!556821 () Bool)

(assert (=> b!578095 m!556821))

(declare-fun m!556823 () Bool)

(assert (=> b!578098 m!556823))

(declare-fun m!556825 () Bool)

(assert (=> b!578097 m!556825))

(assert (=> b!578097 m!556825))

(declare-fun m!556827 () Bool)

(assert (=> b!578097 m!556827))

(declare-fun m!556829 () Bool)

(assert (=> start!53182 m!556829))

(declare-fun m!556831 () Bool)

(assert (=> start!53182 m!556831))

(declare-fun m!556833 () Bool)

(assert (=> b!578099 m!556833))

(declare-fun m!556835 () Bool)

(assert (=> b!578093 m!556835))

(push 1)

