; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46040 () Bool)

(assert start!46040)

(declare-fun b!509912 () Bool)

(declare-fun res!310813 () Bool)

(declare-fun e!298120 () Bool)

(assert (=> b!509912 (=> (not res!310813) (not e!298120))))

(declare-datatypes ((array!32752 0))(
  ( (array!32753 (arr!15754 (Array (_ BitVec 32) (_ BitVec 64))) (size!16118 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32752)

(declare-datatypes ((List!9819 0))(
  ( (Nil!9816) (Cons!9815 (h!10692 (_ BitVec 64)) (t!16039 List!9819)) )
))
(declare-fun arrayNoDuplicates!0 (array!32752 (_ BitVec 32) List!9819) Bool)

(assert (=> b!509912 (= res!310813 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9816))))

(declare-fun b!509913 () Bool)

(declare-fun res!310815 () Bool)

(assert (=> b!509913 (=> (not res!310815) (not e!298120))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32752 (_ BitVec 32)) Bool)

(assert (=> b!509913 (= res!310815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509914 () Bool)

(declare-fun e!298122 () Bool)

(assert (=> b!509914 (= e!298122 e!298120)))

(declare-fun res!310817 () Bool)

(assert (=> b!509914 (=> (not res!310817) (not e!298120))))

(declare-datatypes ((SeekEntryResult!4177 0))(
  ( (MissingZero!4177 (index!18896 (_ BitVec 32))) (Found!4177 (index!18897 (_ BitVec 32))) (Intermediate!4177 (undefined!4989 Bool) (index!18898 (_ BitVec 32)) (x!48007 (_ BitVec 32))) (Undefined!4177) (MissingVacant!4177 (index!18899 (_ BitVec 32))) )
))
(declare-fun lt!233089 () SeekEntryResult!4177)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509914 (= res!310817 (or (= lt!233089 (MissingZero!4177 i!1204)) (= lt!233089 (MissingVacant!4177 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32752 (_ BitVec 32)) SeekEntryResult!4177)

(assert (=> b!509914 (= lt!233089 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509916 () Bool)

(declare-fun res!310812 () Bool)

(assert (=> b!509916 (=> (not res!310812) (not e!298122))))

(declare-fun arrayContainsKey!0 (array!32752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509916 (= res!310812 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509917 () Bool)

(declare-fun res!310819 () Bool)

(assert (=> b!509917 (=> (not res!310819) (not e!298122))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509917 (= res!310819 (validKeyInArray!0 (select (arr!15754 a!3235) j!176)))))

(declare-fun b!509918 () Bool)

(declare-fun res!310818 () Bool)

(assert (=> b!509918 (=> (not res!310818) (not e!298122))))

(assert (=> b!509918 (= res!310818 (and (= (size!16118 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16118 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16118 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509919 () Bool)

(declare-fun res!310816 () Bool)

(assert (=> b!509919 (=> (not res!310816) (not e!298122))))

(assert (=> b!509919 (= res!310816 (validKeyInArray!0 k0!2280))))

(declare-fun b!509920 () Bool)

(assert (=> b!509920 (= e!298120 (not true))))

(declare-fun lt!233087 () (_ BitVec 32))

(declare-fun lt!233084 () SeekEntryResult!4177)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32752 (_ BitVec 32)) SeekEntryResult!4177)

(assert (=> b!509920 (= lt!233084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233087 (select (store (arr!15754 a!3235) i!1204 k0!2280) j!176) (array!32753 (store (arr!15754 a!3235) i!1204 k0!2280) (size!16118 a!3235)) mask!3524))))

(declare-fun lt!233088 () (_ BitVec 32))

(declare-fun lt!233085 () SeekEntryResult!4177)

(assert (=> b!509920 (= lt!233085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233088 (select (arr!15754 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509920 (= lt!233087 (toIndex!0 (select (store (arr!15754 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509920 (= lt!233088 (toIndex!0 (select (arr!15754 a!3235) j!176) mask!3524))))

(declare-fun e!298119 () Bool)

(assert (=> b!509920 e!298119))

(declare-fun res!310811 () Bool)

(assert (=> b!509920 (=> (not res!310811) (not e!298119))))

(assert (=> b!509920 (= res!310811 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15673 0))(
  ( (Unit!15674) )
))
(declare-fun lt!233086 () Unit!15673)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15673)

(assert (=> b!509920 (= lt!233086 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!310814 () Bool)

(assert (=> start!46040 (=> (not res!310814) (not e!298122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46040 (= res!310814 (validMask!0 mask!3524))))

(assert (=> start!46040 e!298122))

(assert (=> start!46040 true))

(declare-fun array_inv!11613 (array!32752) Bool)

(assert (=> start!46040 (array_inv!11613 a!3235)))

(declare-fun b!509915 () Bool)

(assert (=> b!509915 (= e!298119 (= (seekEntryOrOpen!0 (select (arr!15754 a!3235) j!176) a!3235 mask!3524) (Found!4177 j!176)))))

(assert (= (and start!46040 res!310814) b!509918))

(assert (= (and b!509918 res!310818) b!509917))

(assert (= (and b!509917 res!310819) b!509919))

(assert (= (and b!509919 res!310816) b!509916))

(assert (= (and b!509916 res!310812) b!509914))

(assert (= (and b!509914 res!310817) b!509913))

(assert (= (and b!509913 res!310815) b!509912))

(assert (= (and b!509912 res!310813) b!509920))

(assert (= (and b!509920 res!310811) b!509915))

(declare-fun m!491221 () Bool)

(assert (=> b!509914 m!491221))

(declare-fun m!491223 () Bool)

(assert (=> b!509919 m!491223))

(declare-fun m!491225 () Bool)

(assert (=> b!509913 m!491225))

(declare-fun m!491227 () Bool)

(assert (=> b!509912 m!491227))

(declare-fun m!491229 () Bool)

(assert (=> b!509915 m!491229))

(assert (=> b!509915 m!491229))

(declare-fun m!491231 () Bool)

(assert (=> b!509915 m!491231))

(declare-fun m!491233 () Bool)

(assert (=> b!509920 m!491233))

(declare-fun m!491235 () Bool)

(assert (=> b!509920 m!491235))

(declare-fun m!491237 () Bool)

(assert (=> b!509920 m!491237))

(assert (=> b!509920 m!491229))

(declare-fun m!491239 () Bool)

(assert (=> b!509920 m!491239))

(assert (=> b!509920 m!491229))

(declare-fun m!491241 () Bool)

(assert (=> b!509920 m!491241))

(assert (=> b!509920 m!491229))

(declare-fun m!491243 () Bool)

(assert (=> b!509920 m!491243))

(assert (=> b!509920 m!491237))

(declare-fun m!491245 () Bool)

(assert (=> b!509920 m!491245))

(assert (=> b!509920 m!491237))

(declare-fun m!491247 () Bool)

(assert (=> b!509920 m!491247))

(assert (=> b!509917 m!491229))

(assert (=> b!509917 m!491229))

(declare-fun m!491249 () Bool)

(assert (=> b!509917 m!491249))

(declare-fun m!491251 () Bool)

(assert (=> b!509916 m!491251))

(declare-fun m!491253 () Bool)

(assert (=> start!46040 m!491253))

(declare-fun m!491255 () Bool)

(assert (=> start!46040 m!491255))

(check-sat (not b!509916) (not b!509912) (not b!509919) (not b!509913) (not b!509915) (not b!509917) (not start!46040) (not b!509914) (not b!509920))
(check-sat)
