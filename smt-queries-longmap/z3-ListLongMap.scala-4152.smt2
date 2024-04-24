; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56652 () Bool)

(assert start!56652)

(declare-fun b!627261 () Bool)

(declare-fun res!404856 () Bool)

(declare-fun e!359278 () Bool)

(assert (=> b!627261 (=> (not res!404856) (not e!359278))))

(declare-datatypes ((array!37887 0))(
  ( (array!37888 (arr!18181 (Array (_ BitVec 32) (_ BitVec 64))) (size!18545 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37887)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627261 (= res!404856 (validKeyInArray!0 (select (arr!18181 a!2986) j!136)))))

(declare-fun b!627262 () Bool)

(declare-fun res!404862 () Bool)

(declare-fun e!359279 () Bool)

(assert (=> b!627262 (=> (not res!404862) (not e!359279))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6577 0))(
  ( (MissingZero!6577 (index!28592 (_ BitVec 32))) (Found!6577 (index!28593 (_ BitVec 32))) (Intermediate!6577 (undefined!7389 Bool) (index!28594 (_ BitVec 32)) (x!57488 (_ BitVec 32))) (Undefined!6577) (MissingVacant!6577 (index!28595 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37887 (_ BitVec 32)) SeekEntryResult!6577)

(assert (=> b!627262 (= res!404862 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18181 a!2986) j!136) a!2986 mask!3053) (Found!6577 j!136)))))

(declare-fun res!404859 () Bool)

(assert (=> start!56652 (=> (not res!404859) (not e!359278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56652 (= res!404859 (validMask!0 mask!3053))))

(assert (=> start!56652 e!359278))

(assert (=> start!56652 true))

(declare-fun array_inv!14040 (array!37887) Bool)

(assert (=> start!56652 (array_inv!14040 a!2986)))

(declare-fun b!627263 () Bool)

(assert (=> b!627263 (= e!359278 e!359279)))

(declare-fun res!404861 () Bool)

(assert (=> b!627263 (=> (not res!404861) (not e!359279))))

(declare-fun lt!290311 () SeekEntryResult!6577)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627263 (= res!404861 (or (= lt!290311 (MissingZero!6577 i!1108)) (= lt!290311 (MissingVacant!6577 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37887 (_ BitVec 32)) SeekEntryResult!6577)

(assert (=> b!627263 (= lt!290311 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627264 () Bool)

(declare-fun res!404866 () Bool)

(assert (=> b!627264 (=> (not res!404866) (not e!359278))))

(assert (=> b!627264 (= res!404866 (validKeyInArray!0 k0!1786))))

(declare-fun b!627265 () Bool)

(declare-fun res!404857 () Bool)

(assert (=> b!627265 (=> (not res!404857) (not e!359279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37887 (_ BitVec 32)) Bool)

(assert (=> b!627265 (= res!404857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627266 () Bool)

(declare-fun res!404858 () Bool)

(assert (=> b!627266 (=> (not res!404858) (not e!359279))))

(assert (=> b!627266 (= res!404858 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18181 a!2986) index!984) (select (arr!18181 a!2986) j!136))) (not (= (select (arr!18181 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627267 () Bool)

(declare-fun res!404864 () Bool)

(assert (=> b!627267 (=> (not res!404864) (not e!359279))))

(declare-datatypes ((List!12129 0))(
  ( (Nil!12126) (Cons!12125 (h!13173 (_ BitVec 64)) (t!18349 List!12129)) )
))
(declare-fun arrayNoDuplicates!0 (array!37887 (_ BitVec 32) List!12129) Bool)

(assert (=> b!627267 (= res!404864 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12126))))

(declare-fun b!627268 () Bool)

(declare-fun res!404865 () Bool)

(assert (=> b!627268 (=> (not res!404865) (not e!359278))))

(declare-fun arrayContainsKey!0 (array!37887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627268 (= res!404865 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627269 () Bool)

(declare-fun res!404860 () Bool)

(assert (=> b!627269 (=> (not res!404860) (not e!359279))))

(assert (=> b!627269 (= res!404860 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18181 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18181 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627270 () Bool)

(declare-fun res!404863 () Bool)

(assert (=> b!627270 (=> (not res!404863) (not e!359278))))

(assert (=> b!627270 (= res!404863 (and (= (size!18545 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18545 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18545 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627271 () Bool)

(assert (=> b!627271 (= e!359279 false)))

(declare-fun lt!290310 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627271 (= lt!290310 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!56652 res!404859) b!627270))

(assert (= (and b!627270 res!404863) b!627261))

(assert (= (and b!627261 res!404856) b!627264))

(assert (= (and b!627264 res!404866) b!627268))

(assert (= (and b!627268 res!404865) b!627263))

(assert (= (and b!627263 res!404861) b!627265))

(assert (= (and b!627265 res!404857) b!627267))

(assert (= (and b!627267 res!404864) b!627269))

(assert (= (and b!627269 res!404860) b!627262))

(assert (= (and b!627262 res!404862) b!627266))

(assert (= (and b!627266 res!404858) b!627271))

(declare-fun m!602887 () Bool)

(assert (=> b!627268 m!602887))

(declare-fun m!602889 () Bool)

(assert (=> b!627267 m!602889))

(declare-fun m!602891 () Bool)

(assert (=> b!627271 m!602891))

(declare-fun m!602893 () Bool)

(assert (=> start!56652 m!602893))

(declare-fun m!602895 () Bool)

(assert (=> start!56652 m!602895))

(declare-fun m!602897 () Bool)

(assert (=> b!627266 m!602897))

(declare-fun m!602899 () Bool)

(assert (=> b!627266 m!602899))

(assert (=> b!627261 m!602899))

(assert (=> b!627261 m!602899))

(declare-fun m!602901 () Bool)

(assert (=> b!627261 m!602901))

(declare-fun m!602903 () Bool)

(assert (=> b!627269 m!602903))

(declare-fun m!602905 () Bool)

(assert (=> b!627269 m!602905))

(declare-fun m!602907 () Bool)

(assert (=> b!627269 m!602907))

(declare-fun m!602909 () Bool)

(assert (=> b!627263 m!602909))

(assert (=> b!627262 m!602899))

(assert (=> b!627262 m!602899))

(declare-fun m!602911 () Bool)

(assert (=> b!627262 m!602911))

(declare-fun m!602913 () Bool)

(assert (=> b!627265 m!602913))

(declare-fun m!602915 () Bool)

(assert (=> b!627264 m!602915))

(check-sat (not b!627268) (not b!627271) (not start!56652) (not b!627262) (not b!627267) (not b!627265) (not b!627264) (not b!627261) (not b!627263))
(check-sat)
