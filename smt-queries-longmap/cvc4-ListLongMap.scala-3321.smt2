; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45874 () Bool)

(assert start!45874)

(declare-fun b!508108 () Bool)

(declare-fun res!309071 () Bool)

(declare-fun e!297301 () Bool)

(assert (=> b!508108 (=> (not res!309071) (not e!297301))))

(declare-datatypes ((array!32630 0))(
  ( (array!32631 (arr!15695 (Array (_ BitVec 32) (_ BitVec 64))) (size!16059 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32630)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32630 (_ BitVec 32)) Bool)

(assert (=> b!508108 (= res!309071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!309067 () Bool)

(declare-fun e!297303 () Bool)

(assert (=> start!45874 (=> (not res!309067) (not e!297303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45874 (= res!309067 (validMask!0 mask!3524))))

(assert (=> start!45874 e!297303))

(assert (=> start!45874 true))

(declare-fun array_inv!11491 (array!32630) Bool)

(assert (=> start!45874 (array_inv!11491 a!3235)))

(declare-fun b!508109 () Bool)

(declare-fun res!309068 () Bool)

(assert (=> b!508109 (=> (not res!309068) (not e!297303))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508109 (= res!309068 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508110 () Bool)

(assert (=> b!508110 (= e!297301 (bvsgt #b00000000000000000000000000000000 (size!16059 a!3235)))))

(declare-fun b!508111 () Bool)

(declare-fun res!309070 () Bool)

(assert (=> b!508111 (=> (not res!309070) (not e!297303))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508111 (= res!309070 (and (= (size!16059 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16059 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16059 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508112 () Bool)

(declare-fun res!309074 () Bool)

(assert (=> b!508112 (=> (not res!309074) (not e!297303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508112 (= res!309074 (validKeyInArray!0 (select (arr!15695 a!3235) j!176)))))

(declare-fun b!508113 () Bool)

(assert (=> b!508113 (= e!297303 e!297301)))

(declare-fun res!309072 () Bool)

(assert (=> b!508113 (=> (not res!309072) (not e!297301))))

(declare-datatypes ((SeekEntryResult!4162 0))(
  ( (MissingZero!4162 (index!18836 (_ BitVec 32))) (Found!4162 (index!18837 (_ BitVec 32))) (Intermediate!4162 (undefined!4974 Bool) (index!18838 (_ BitVec 32)) (x!47819 (_ BitVec 32))) (Undefined!4162) (MissingVacant!4162 (index!18839 (_ BitVec 32))) )
))
(declare-fun lt!232159 () SeekEntryResult!4162)

(assert (=> b!508113 (= res!309072 (or (= lt!232159 (MissingZero!4162 i!1204)) (= lt!232159 (MissingVacant!4162 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32630 (_ BitVec 32)) SeekEntryResult!4162)

(assert (=> b!508113 (= lt!232159 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508114 () Bool)

(declare-fun res!309069 () Bool)

(assert (=> b!508114 (=> (not res!309069) (not e!297303))))

(assert (=> b!508114 (= res!309069 (validKeyInArray!0 k!2280))))

(declare-fun b!508115 () Bool)

(declare-fun res!309073 () Bool)

(assert (=> b!508115 (=> (not res!309073) (not e!297301))))

(declare-datatypes ((List!9853 0))(
  ( (Nil!9850) (Cons!9849 (h!10726 (_ BitVec 64)) (t!16081 List!9853)) )
))
(declare-fun arrayNoDuplicates!0 (array!32630 (_ BitVec 32) List!9853) Bool)

(assert (=> b!508115 (= res!309073 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9850))))

(assert (= (and start!45874 res!309067) b!508111))

(assert (= (and b!508111 res!309070) b!508112))

(assert (= (and b!508112 res!309074) b!508114))

(assert (= (and b!508114 res!309069) b!508109))

(assert (= (and b!508109 res!309068) b!508113))

(assert (= (and b!508113 res!309072) b!508108))

(assert (= (and b!508108 res!309071) b!508115))

(assert (= (and b!508115 res!309073) b!508110))

(declare-fun m!488931 () Bool)

(assert (=> b!508115 m!488931))

(declare-fun m!488933 () Bool)

(assert (=> b!508109 m!488933))

(declare-fun m!488935 () Bool)

(assert (=> b!508108 m!488935))

(declare-fun m!488937 () Bool)

(assert (=> b!508114 m!488937))

(declare-fun m!488939 () Bool)

(assert (=> b!508113 m!488939))

(declare-fun m!488941 () Bool)

(assert (=> start!45874 m!488941))

(declare-fun m!488943 () Bool)

(assert (=> start!45874 m!488943))

(declare-fun m!488945 () Bool)

(assert (=> b!508112 m!488945))

(assert (=> b!508112 m!488945))

(declare-fun m!488947 () Bool)

(assert (=> b!508112 m!488947))

(push 1)

(assert (not b!508114))

(assert (not b!508115))

(assert (not b!508112))

(assert (not b!508109))

(assert (not start!45874))

(assert (not b!508113))

