; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56604 () Bool)

(assert start!56604)

(declare-fun b!627078 () Bool)

(declare-fun e!359058 () Bool)

(assert (=> b!627078 (= e!359058 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!290029 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627078 (= lt!290029 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627079 () Bool)

(declare-fun res!404922 () Bool)

(declare-fun e!359056 () Bool)

(assert (=> b!627079 (=> (not res!404922) (not e!359056))))

(declare-datatypes ((array!37908 0))(
  ( (array!37909 (arr!18194 (Array (_ BitVec 32) (_ BitVec 64))) (size!18559 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37908)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627079 (= res!404922 (validKeyInArray!0 (select (arr!18194 a!2986) j!136)))))

(declare-fun b!627080 () Bool)

(assert (=> b!627080 (= e!359056 e!359058)))

(declare-fun res!404923 () Bool)

(assert (=> b!627080 (=> (not res!404923) (not e!359058))))

(declare-datatypes ((SeekEntryResult!6631 0))(
  ( (MissingZero!6631 (index!28808 (_ BitVec 32))) (Found!6631 (index!28809 (_ BitVec 32))) (Intermediate!6631 (undefined!7443 Bool) (index!28810 (_ BitVec 32)) (x!57558 (_ BitVec 32))) (Undefined!6631) (MissingVacant!6631 (index!28811 (_ BitVec 32))) )
))
(declare-fun lt!290028 () SeekEntryResult!6631)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627080 (= res!404923 (or (= lt!290028 (MissingZero!6631 i!1108)) (= lt!290028 (MissingVacant!6631 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37908 (_ BitVec 32)) SeekEntryResult!6631)

(assert (=> b!627080 (= lt!290028 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!404929 () Bool)

(assert (=> start!56604 (=> (not res!404929) (not e!359056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56604 (= res!404929 (validMask!0 mask!3053))))

(assert (=> start!56604 e!359056))

(assert (=> start!56604 true))

(declare-fun array_inv!14077 (array!37908) Bool)

(assert (=> start!56604 (array_inv!14077 a!2986)))

(declare-fun b!627081 () Bool)

(declare-fun res!404924 () Bool)

(assert (=> b!627081 (=> (not res!404924) (not e!359056))))

(assert (=> b!627081 (= res!404924 (and (= (size!18559 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18559 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18559 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627082 () Bool)

(declare-fun res!404921 () Bool)

(assert (=> b!627082 (=> (not res!404921) (not e!359058))))

(assert (=> b!627082 (= res!404921 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18194 a!2986) index!984) (select (arr!18194 a!2986) j!136))) (not (= (select (arr!18194 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627083 () Bool)

(declare-fun res!404926 () Bool)

(assert (=> b!627083 (=> (not res!404926) (not e!359056))))

(declare-fun arrayContainsKey!0 (array!37908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627083 (= res!404926 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627084 () Bool)

(declare-fun res!404927 () Bool)

(assert (=> b!627084 (=> (not res!404927) (not e!359058))))

(declare-datatypes ((List!12274 0))(
  ( (Nil!12271) (Cons!12270 (h!13315 (_ BitVec 64)) (t!18493 List!12274)) )
))
(declare-fun arrayNoDuplicates!0 (array!37908 (_ BitVec 32) List!12274) Bool)

(assert (=> b!627084 (= res!404927 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12271))))

(declare-fun b!627085 () Bool)

(declare-fun res!404930 () Bool)

(assert (=> b!627085 (=> (not res!404930) (not e!359058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37908 (_ BitVec 32)) Bool)

(assert (=> b!627085 (= res!404930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627086 () Bool)

(declare-fun res!404928 () Bool)

(assert (=> b!627086 (=> (not res!404928) (not e!359058))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37908 (_ BitVec 32)) SeekEntryResult!6631)

(assert (=> b!627086 (= res!404928 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18194 a!2986) j!136) a!2986 mask!3053) (Found!6631 j!136)))))

(declare-fun b!627087 () Bool)

(declare-fun res!404925 () Bool)

(assert (=> b!627087 (=> (not res!404925) (not e!359056))))

(assert (=> b!627087 (= res!404925 (validKeyInArray!0 k0!1786))))

(declare-fun b!627088 () Bool)

(declare-fun res!404920 () Bool)

(assert (=> b!627088 (=> (not res!404920) (not e!359058))))

(assert (=> b!627088 (= res!404920 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18194 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18194 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56604 res!404929) b!627081))

(assert (= (and b!627081 res!404924) b!627079))

(assert (= (and b!627079 res!404922) b!627087))

(assert (= (and b!627087 res!404925) b!627083))

(assert (= (and b!627083 res!404926) b!627080))

(assert (= (and b!627080 res!404923) b!627085))

(assert (= (and b!627085 res!404930) b!627084))

(assert (= (and b!627084 res!404927) b!627088))

(assert (= (and b!627088 res!404920) b!627086))

(assert (= (and b!627086 res!404928) b!627082))

(assert (= (and b!627082 res!404921) b!627078))

(declare-fun m!601903 () Bool)

(assert (=> b!627084 m!601903))

(declare-fun m!601905 () Bool)

(assert (=> b!627087 m!601905))

(declare-fun m!601907 () Bool)

(assert (=> b!627085 m!601907))

(declare-fun m!601909 () Bool)

(assert (=> b!627080 m!601909))

(declare-fun m!601911 () Bool)

(assert (=> b!627078 m!601911))

(declare-fun m!601913 () Bool)

(assert (=> b!627088 m!601913))

(declare-fun m!601915 () Bool)

(assert (=> b!627088 m!601915))

(declare-fun m!601917 () Bool)

(assert (=> b!627088 m!601917))

(declare-fun m!601919 () Bool)

(assert (=> start!56604 m!601919))

(declare-fun m!601921 () Bool)

(assert (=> start!56604 m!601921))

(declare-fun m!601923 () Bool)

(assert (=> b!627083 m!601923))

(declare-fun m!601925 () Bool)

(assert (=> b!627086 m!601925))

(assert (=> b!627086 m!601925))

(declare-fun m!601927 () Bool)

(assert (=> b!627086 m!601927))

(assert (=> b!627079 m!601925))

(assert (=> b!627079 m!601925))

(declare-fun m!601929 () Bool)

(assert (=> b!627079 m!601929))

(declare-fun m!601931 () Bool)

(assert (=> b!627082 m!601931))

(assert (=> b!627082 m!601925))

(check-sat (not b!627086) (not b!627078) (not b!627087) (not b!627084) (not b!627083) (not b!627085) (not start!56604) (not b!627079) (not b!627080))
(check-sat)
