; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56408 () Bool)

(assert start!56408)

(declare-fun b!625239 () Bool)

(declare-fun res!403250 () Bool)

(declare-fun e!358420 () Bool)

(assert (=> b!625239 (=> (not res!403250) (not e!358420))))

(declare-datatypes ((array!37788 0))(
  ( (array!37789 (arr!18137 (Array (_ BitVec 32) (_ BitVec 64))) (size!18501 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37788)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625239 (= res!403250 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625240 () Bool)

(declare-fun e!358421 () Bool)

(assert (=> b!625240 (= e!358421 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6577 0))(
  ( (MissingZero!6577 (index!28592 (_ BitVec 32))) (Found!6577 (index!28593 (_ BitVec 32))) (Intermediate!6577 (undefined!7389 Bool) (index!28594 (_ BitVec 32)) (x!57343 (_ BitVec 32))) (Undefined!6577) (MissingVacant!6577 (index!28595 (_ BitVec 32))) )
))
(declare-fun lt!289792 () SeekEntryResult!6577)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37788 (_ BitVec 32)) SeekEntryResult!6577)

(assert (=> b!625240 (= lt!289792 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18137 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625241 () Bool)

(declare-fun res!403245 () Bool)

(assert (=> b!625241 (=> (not res!403245) (not e!358421))))

(declare-datatypes ((List!12178 0))(
  ( (Nil!12175) (Cons!12174 (h!13219 (_ BitVec 64)) (t!18406 List!12178)) )
))
(declare-fun arrayNoDuplicates!0 (array!37788 (_ BitVec 32) List!12178) Bool)

(assert (=> b!625241 (= res!403245 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12175))))

(declare-fun b!625242 () Bool)

(declare-fun res!403249 () Bool)

(assert (=> b!625242 (=> (not res!403249) (not e!358421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37788 (_ BitVec 32)) Bool)

(assert (=> b!625242 (= res!403249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625243 () Bool)

(declare-fun res!403246 () Bool)

(assert (=> b!625243 (=> (not res!403246) (not e!358420))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625243 (= res!403246 (and (= (size!18501 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18501 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18501 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625244 () Bool)

(declare-fun res!403247 () Bool)

(assert (=> b!625244 (=> (not res!403247) (not e!358420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625244 (= res!403247 (validKeyInArray!0 (select (arr!18137 a!2986) j!136)))))

(declare-fun b!625245 () Bool)

(declare-fun res!403251 () Bool)

(assert (=> b!625245 (=> (not res!403251) (not e!358420))))

(assert (=> b!625245 (= res!403251 (validKeyInArray!0 k!1786))))

(declare-fun b!625246 () Bool)

(declare-fun res!403252 () Bool)

(assert (=> b!625246 (=> (not res!403252) (not e!358421))))

(assert (=> b!625246 (= res!403252 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18137 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18137 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403253 () Bool)

(assert (=> start!56408 (=> (not res!403253) (not e!358420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56408 (= res!403253 (validMask!0 mask!3053))))

(assert (=> start!56408 e!358420))

(assert (=> start!56408 true))

(declare-fun array_inv!13933 (array!37788) Bool)

(assert (=> start!56408 (array_inv!13933 a!2986)))

(declare-fun b!625247 () Bool)

(assert (=> b!625247 (= e!358420 e!358421)))

(declare-fun res!403248 () Bool)

(assert (=> b!625247 (=> (not res!403248) (not e!358421))))

(declare-fun lt!289791 () SeekEntryResult!6577)

(assert (=> b!625247 (= res!403248 (or (= lt!289791 (MissingZero!6577 i!1108)) (= lt!289791 (MissingVacant!6577 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37788 (_ BitVec 32)) SeekEntryResult!6577)

(assert (=> b!625247 (= lt!289791 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56408 res!403253) b!625243))

(assert (= (and b!625243 res!403246) b!625244))

(assert (= (and b!625244 res!403247) b!625245))

(assert (= (and b!625245 res!403251) b!625239))

(assert (= (and b!625239 res!403250) b!625247))

(assert (= (and b!625247 res!403248) b!625242))

(assert (= (and b!625242 res!403249) b!625241))

(assert (= (and b!625241 res!403245) b!625246))

(assert (= (and b!625246 res!403252) b!625240))

(declare-fun m!600825 () Bool)

(assert (=> b!625245 m!600825))

(declare-fun m!600827 () Bool)

(assert (=> b!625240 m!600827))

(assert (=> b!625240 m!600827))

(declare-fun m!600829 () Bool)

(assert (=> b!625240 m!600829))

(declare-fun m!600831 () Bool)

(assert (=> b!625239 m!600831))

(declare-fun m!600833 () Bool)

(assert (=> b!625241 m!600833))

(declare-fun m!600835 () Bool)

(assert (=> start!56408 m!600835))

(declare-fun m!600837 () Bool)

(assert (=> start!56408 m!600837))

(declare-fun m!600839 () Bool)

(assert (=> b!625246 m!600839))

(declare-fun m!600841 () Bool)

(assert (=> b!625246 m!600841))

(declare-fun m!600843 () Bool)

(assert (=> b!625246 m!600843))

(assert (=> b!625244 m!600827))

(assert (=> b!625244 m!600827))

(declare-fun m!600845 () Bool)

(assert (=> b!625244 m!600845))

(declare-fun m!600847 () Bool)

(assert (=> b!625247 m!600847))

(declare-fun m!600849 () Bool)

(assert (=> b!625242 m!600849))

(push 1)

(assert (not b!625247))

(assert (not b!625242))

(assert (not b!625245))

(assert (not b!625239))

(assert (not start!56408))

(assert (not b!625244))

(assert (not b!625241))

(assert (not b!625240))

(check-sat)

