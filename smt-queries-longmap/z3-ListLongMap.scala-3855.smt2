; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53016 () Bool)

(assert start!53016)

(declare-fun res!365332 () Bool)

(declare-fun e!332067 () Bool)

(assert (=> start!53016 (=> (not res!365332) (not e!332067))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53016 (= res!365332 (validMask!0 mask!3053))))

(assert (=> start!53016 e!332067))

(assert (=> start!53016 true))

(declare-datatypes ((array!36034 0))(
  ( (array!36035 (arr!17296 (Array (_ BitVec 32) (_ BitVec 64))) (size!17660 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36034)

(declare-fun array_inv!13092 (array!36034) Bool)

(assert (=> start!53016 (array_inv!13092 a!2986)))

(declare-fun b!577297 () Bool)

(declare-fun res!365333 () Bool)

(assert (=> b!577297 (=> (not res!365333) (not e!332067))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577297 (= res!365333 (validKeyInArray!0 (select (arr!17296 a!2986) j!136)))))

(declare-fun b!577298 () Bool)

(declare-fun res!365331 () Bool)

(assert (=> b!577298 (=> (not res!365331) (not e!332067))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577298 (= res!365331 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577299 () Bool)

(assert (=> b!577299 (= e!332067 false)))

(declare-datatypes ((SeekEntryResult!5736 0))(
  ( (MissingZero!5736 (index!25171 (_ BitVec 32))) (Found!5736 (index!25172 (_ BitVec 32))) (Intermediate!5736 (undefined!6548 Bool) (index!25173 (_ BitVec 32)) (x!54085 (_ BitVec 32))) (Undefined!5736) (MissingVacant!5736 (index!25174 (_ BitVec 32))) )
))
(declare-fun lt!263938 () SeekEntryResult!5736)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36034 (_ BitVec 32)) SeekEntryResult!5736)

(assert (=> b!577299 (= lt!263938 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577300 () Bool)

(declare-fun res!365329 () Bool)

(assert (=> b!577300 (=> (not res!365329) (not e!332067))))

(assert (=> b!577300 (= res!365329 (validKeyInArray!0 k0!1786))))

(declare-fun b!577301 () Bool)

(declare-fun res!365330 () Bool)

(assert (=> b!577301 (=> (not res!365330) (not e!332067))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577301 (= res!365330 (and (= (size!17660 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17660 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17660 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53016 res!365332) b!577301))

(assert (= (and b!577301 res!365330) b!577297))

(assert (= (and b!577297 res!365333) b!577300))

(assert (= (and b!577300 res!365329) b!577298))

(assert (= (and b!577298 res!365331) b!577299))

(declare-fun m!556199 () Bool)

(assert (=> b!577297 m!556199))

(assert (=> b!577297 m!556199))

(declare-fun m!556201 () Bool)

(assert (=> b!577297 m!556201))

(declare-fun m!556203 () Bool)

(assert (=> start!53016 m!556203))

(declare-fun m!556205 () Bool)

(assert (=> start!53016 m!556205))

(declare-fun m!556207 () Bool)

(assert (=> b!577298 m!556207))

(declare-fun m!556209 () Bool)

(assert (=> b!577299 m!556209))

(declare-fun m!556211 () Bool)

(assert (=> b!577300 m!556211))

(check-sat (not b!577299) (not start!53016) (not b!577300) (not b!577297) (not b!577298))
