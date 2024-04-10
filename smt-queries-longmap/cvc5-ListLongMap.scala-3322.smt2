; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45876 () Bool)

(assert start!45876)

(declare-fun b!508132 () Bool)

(declare-fun res!309091 () Bool)

(declare-fun e!297312 () Bool)

(assert (=> b!508132 (=> (not res!309091) (not e!297312))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508132 (= res!309091 (validKeyInArray!0 k!2280))))

(declare-fun b!508133 () Bool)

(declare-fun e!297311 () Bool)

(assert (=> b!508133 (= e!297312 e!297311)))

(declare-fun res!309094 () Bool)

(assert (=> b!508133 (=> (not res!309094) (not e!297311))))

(declare-datatypes ((SeekEntryResult!4163 0))(
  ( (MissingZero!4163 (index!18840 (_ BitVec 32))) (Found!4163 (index!18841 (_ BitVec 32))) (Intermediate!4163 (undefined!4975 Bool) (index!18842 (_ BitVec 32)) (x!47828 (_ BitVec 32))) (Undefined!4163) (MissingVacant!4163 (index!18843 (_ BitVec 32))) )
))
(declare-fun lt!232162 () SeekEntryResult!4163)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508133 (= res!309094 (or (= lt!232162 (MissingZero!4163 i!1204)) (= lt!232162 (MissingVacant!4163 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32632 0))(
  ( (array!32633 (arr!15696 (Array (_ BitVec 32) (_ BitVec 64))) (size!16060 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32632)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32632 (_ BitVec 32)) SeekEntryResult!4163)

(assert (=> b!508133 (= lt!232162 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508135 () Bool)

(declare-fun res!309092 () Bool)

(assert (=> b!508135 (=> (not res!309092) (not e!297312))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508135 (= res!309092 (and (= (size!16060 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16060 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16060 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508136 () Bool)

(declare-fun res!309093 () Bool)

(assert (=> b!508136 (=> (not res!309093) (not e!297311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32632 (_ BitVec 32)) Bool)

(assert (=> b!508136 (= res!309093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508137 () Bool)

(declare-fun res!309096 () Bool)

(assert (=> b!508137 (=> (not res!309096) (not e!297312))))

(declare-fun arrayContainsKey!0 (array!32632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508137 (= res!309096 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508138 () Bool)

(assert (=> b!508138 (= e!297311 (and (bvsle #b00000000000000000000000000000000 (size!16060 a!3235)) (bvsgt j!176 (size!16060 a!3235))))))

(declare-fun b!508139 () Bool)

(declare-fun res!309098 () Bool)

(assert (=> b!508139 (=> (not res!309098) (not e!297312))))

(assert (=> b!508139 (= res!309098 (validKeyInArray!0 (select (arr!15696 a!3235) j!176)))))

(declare-fun res!309095 () Bool)

(assert (=> start!45876 (=> (not res!309095) (not e!297312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45876 (= res!309095 (validMask!0 mask!3524))))

(assert (=> start!45876 e!297312))

(assert (=> start!45876 true))

(declare-fun array_inv!11492 (array!32632) Bool)

(assert (=> start!45876 (array_inv!11492 a!3235)))

(declare-fun b!508134 () Bool)

(declare-fun res!309097 () Bool)

(assert (=> b!508134 (=> (not res!309097) (not e!297311))))

(declare-datatypes ((List!9854 0))(
  ( (Nil!9851) (Cons!9850 (h!10727 (_ BitVec 64)) (t!16082 List!9854)) )
))
(declare-fun arrayNoDuplicates!0 (array!32632 (_ BitVec 32) List!9854) Bool)

(assert (=> b!508134 (= res!309097 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9851))))

(assert (= (and start!45876 res!309095) b!508135))

(assert (= (and b!508135 res!309092) b!508139))

(assert (= (and b!508139 res!309098) b!508132))

(assert (= (and b!508132 res!309091) b!508137))

(assert (= (and b!508137 res!309096) b!508133))

(assert (= (and b!508133 res!309094) b!508136))

(assert (= (and b!508136 res!309093) b!508134))

(assert (= (and b!508134 res!309097) b!508138))

(declare-fun m!488949 () Bool)

(assert (=> b!508136 m!488949))

(declare-fun m!488951 () Bool)

(assert (=> b!508133 m!488951))

(declare-fun m!488953 () Bool)

(assert (=> b!508132 m!488953))

(declare-fun m!488955 () Bool)

(assert (=> b!508137 m!488955))

(declare-fun m!488957 () Bool)

(assert (=> b!508139 m!488957))

(assert (=> b!508139 m!488957))

(declare-fun m!488959 () Bool)

(assert (=> b!508139 m!488959))

(declare-fun m!488961 () Bool)

(assert (=> start!45876 m!488961))

(declare-fun m!488963 () Bool)

(assert (=> start!45876 m!488963))

(declare-fun m!488965 () Bool)

(assert (=> b!508134 m!488965))

(push 1)

(assert (not start!45876))

(assert (not b!508136))

(assert (not b!508134))

(assert (not b!508133))

(assert (not b!508139))

(assert (not b!508137))

(assert (not b!508132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

