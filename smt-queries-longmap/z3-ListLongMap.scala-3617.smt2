; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49774 () Bool)

(assert start!49774)

(declare-fun b!547007 () Bool)

(declare-fun e!316081 () Bool)

(declare-fun e!316083 () Bool)

(assert (=> b!547007 (= e!316081 e!316083)))

(declare-fun res!340727 () Bool)

(assert (=> b!547007 (=> (not res!340727) (not e!316083))))

(declare-datatypes ((SeekEntryResult!5031 0))(
  ( (MissingZero!5031 (index!22351 (_ BitVec 32))) (Found!5031 (index!22352 (_ BitVec 32))) (Intermediate!5031 (undefined!5843 Bool) (index!22353 (_ BitVec 32)) (x!51299 (_ BitVec 32))) (Undefined!5031) (MissingVacant!5031 (index!22354 (_ BitVec 32))) )
))
(declare-fun lt!249406 () SeekEntryResult!5031)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547007 (= res!340727 (or (= lt!249406 (MissingZero!5031 i!1132)) (= lt!249406 (MissingVacant!5031 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34512 0))(
  ( (array!34513 (arr!16582 (Array (_ BitVec 32) (_ BitVec 64))) (size!16946 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34512)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34512 (_ BitVec 32)) SeekEntryResult!5031)

(assert (=> b!547007 (= lt!249406 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547008 () Bool)

(declare-fun res!340721 () Bool)

(assert (=> b!547008 (=> (not res!340721) (not e!316081))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!547008 (= res!340721 (and (= (size!16946 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16946 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16946 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547009 () Bool)

(declare-fun res!340725 () Bool)

(assert (=> b!547009 (=> (not res!340725) (not e!316081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547009 (= res!340725 (validKeyInArray!0 k0!1914))))

(declare-fun b!547010 () Bool)

(declare-fun res!340724 () Bool)

(assert (=> b!547010 (=> (not res!340724) (not e!316081))))

(declare-fun arrayContainsKey!0 (array!34512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547010 (= res!340724 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547011 () Bool)

(declare-fun res!340726 () Bool)

(assert (=> b!547011 (=> (not res!340726) (not e!316081))))

(assert (=> b!547011 (= res!340726 (validKeyInArray!0 (select (arr!16582 a!3118) j!142)))))

(declare-fun res!340722 () Bool)

(assert (=> start!49774 (=> (not res!340722) (not e!316081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49774 (= res!340722 (validMask!0 mask!3119))))

(assert (=> start!49774 e!316081))

(assert (=> start!49774 true))

(declare-fun array_inv!12378 (array!34512) Bool)

(assert (=> start!49774 (array_inv!12378 a!3118)))

(declare-fun b!547012 () Bool)

(declare-fun res!340723 () Bool)

(assert (=> b!547012 (=> (not res!340723) (not e!316083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34512 (_ BitVec 32)) Bool)

(assert (=> b!547012 (= res!340723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547013 () Bool)

(assert (=> b!547013 (= e!316083 (bvsgt #b00000000000000000000000000000000 (size!16946 a!3118)))))

(assert (= (and start!49774 res!340722) b!547008))

(assert (= (and b!547008 res!340721) b!547011))

(assert (= (and b!547011 res!340726) b!547009))

(assert (= (and b!547009 res!340725) b!547010))

(assert (= (and b!547010 res!340724) b!547007))

(assert (= (and b!547007 res!340727) b!547012))

(assert (= (and b!547012 res!340723) b!547013))

(declare-fun m!524377 () Bool)

(assert (=> start!49774 m!524377))

(declare-fun m!524379 () Bool)

(assert (=> start!49774 m!524379))

(declare-fun m!524381 () Bool)

(assert (=> b!547007 m!524381))

(declare-fun m!524383 () Bool)

(assert (=> b!547011 m!524383))

(assert (=> b!547011 m!524383))

(declare-fun m!524385 () Bool)

(assert (=> b!547011 m!524385))

(declare-fun m!524387 () Bool)

(assert (=> b!547009 m!524387))

(declare-fun m!524389 () Bool)

(assert (=> b!547012 m!524389))

(declare-fun m!524391 () Bool)

(assert (=> b!547010 m!524391))

(check-sat (not b!547010) (not b!547007) (not b!547011) (not start!49774) (not b!547009) (not b!547012))
(check-sat)
