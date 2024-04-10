; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53672 () Bool)

(assert start!53672)

(declare-fun b!585006 () Bool)

(declare-fun res!372823 () Bool)

(declare-fun e!334841 () Bool)

(assert (=> b!585006 (=> (not res!372823) (not e!334841))))

(declare-datatypes ((array!36573 0))(
  ( (array!36574 (arr!17561 (Array (_ BitVec 32) (_ BitVec 64))) (size!17925 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36573)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585006 (= res!372823 (validKeyInArray!0 (select (arr!17561 a!2986) j!136)))))

(declare-fun b!585007 () Bool)

(declare-fun res!372828 () Bool)

(assert (=> b!585007 (=> (not res!372828) (not e!334841))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585007 (= res!372828 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585008 () Bool)

(declare-fun res!372826 () Bool)

(declare-fun e!334839 () Bool)

(assert (=> b!585008 (=> (not res!372826) (not e!334839))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6001 0))(
  ( (MissingZero!6001 (index!26231 (_ BitVec 32))) (Found!6001 (index!26232 (_ BitVec 32))) (Intermediate!6001 (undefined!6813 Bool) (index!26233 (_ BitVec 32)) (x!55054 (_ BitVec 32))) (Undefined!6001) (MissingVacant!6001 (index!26234 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36573 (_ BitVec 32)) SeekEntryResult!6001)

(assert (=> b!585008 (= res!372826 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17561 a!2986) j!136) a!2986 mask!3053) (Found!6001 j!136)))))

(declare-fun b!585009 () Bool)

(declare-fun e!334842 () Bool)

(assert (=> b!585009 (= e!334842 false)))

(declare-fun lt!265715 () SeekEntryResult!6001)

(declare-fun lt!265717 () (_ BitVec 32))

(assert (=> b!585009 (= lt!265715 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265717 vacantSpotIndex!68 (select (arr!17561 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585010 () Bool)

(declare-fun res!372833 () Bool)

(assert (=> b!585010 (=> (not res!372833) (not e!334839))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585010 (= res!372833 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17561 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17561 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585011 () Bool)

(declare-fun res!372831 () Bool)

(assert (=> b!585011 (=> (not res!372831) (not e!334841))))

(assert (=> b!585011 (= res!372831 (and (= (size!17925 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17925 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17925 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!372822 () Bool)

(assert (=> start!53672 (=> (not res!372822) (not e!334841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53672 (= res!372822 (validMask!0 mask!3053))))

(assert (=> start!53672 e!334841))

(assert (=> start!53672 true))

(declare-fun array_inv!13357 (array!36573) Bool)

(assert (=> start!53672 (array_inv!13357 a!2986)))

(declare-fun b!585012 () Bool)

(declare-fun res!372829 () Bool)

(assert (=> b!585012 (=> (not res!372829) (not e!334839))))

(assert (=> b!585012 (= res!372829 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17561 a!2986) index!984) (select (arr!17561 a!2986) j!136))) (not (= (select (arr!17561 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585013 () Bool)

(declare-fun res!372827 () Bool)

(assert (=> b!585013 (=> (not res!372827) (not e!334839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36573 (_ BitVec 32)) Bool)

(assert (=> b!585013 (= res!372827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585014 () Bool)

(assert (=> b!585014 (= e!334839 e!334842)))

(declare-fun res!372832 () Bool)

(assert (=> b!585014 (=> (not res!372832) (not e!334842))))

(assert (=> b!585014 (= res!372832 (and (bvsge lt!265717 #b00000000000000000000000000000000) (bvslt lt!265717 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585014 (= lt!265717 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585015 () Bool)

(declare-fun res!372824 () Bool)

(assert (=> b!585015 (=> (not res!372824) (not e!334839))))

(declare-datatypes ((List!11602 0))(
  ( (Nil!11599) (Cons!11598 (h!12643 (_ BitVec 64)) (t!17830 List!11602)) )
))
(declare-fun arrayNoDuplicates!0 (array!36573 (_ BitVec 32) List!11602) Bool)

(assert (=> b!585015 (= res!372824 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11599))))

(declare-fun b!585016 () Bool)

(assert (=> b!585016 (= e!334841 e!334839)))

(declare-fun res!372830 () Bool)

(assert (=> b!585016 (=> (not res!372830) (not e!334839))))

(declare-fun lt!265716 () SeekEntryResult!6001)

(assert (=> b!585016 (= res!372830 (or (= lt!265716 (MissingZero!6001 i!1108)) (= lt!265716 (MissingVacant!6001 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36573 (_ BitVec 32)) SeekEntryResult!6001)

(assert (=> b!585016 (= lt!265716 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585017 () Bool)

(declare-fun res!372825 () Bool)

(assert (=> b!585017 (=> (not res!372825) (not e!334841))))

(assert (=> b!585017 (= res!372825 (validKeyInArray!0 k!1786))))

(assert (= (and start!53672 res!372822) b!585011))

(assert (= (and b!585011 res!372831) b!585006))

(assert (= (and b!585006 res!372823) b!585017))

(assert (= (and b!585017 res!372825) b!585007))

(assert (= (and b!585007 res!372828) b!585016))

(assert (= (and b!585016 res!372830) b!585013))

(assert (= (and b!585013 res!372827) b!585015))

(assert (= (and b!585015 res!372824) b!585010))

(assert (= (and b!585010 res!372833) b!585008))

(assert (= (and b!585008 res!372826) b!585012))

(assert (= (and b!585012 res!372829) b!585014))

(assert (= (and b!585014 res!372832) b!585009))

(declare-fun m!563297 () Bool)

(assert (=> b!585010 m!563297))

(declare-fun m!563299 () Bool)

(assert (=> b!585010 m!563299))

(declare-fun m!563301 () Bool)

(assert (=> b!585010 m!563301))

(declare-fun m!563303 () Bool)

(assert (=> b!585017 m!563303))

(declare-fun m!563305 () Bool)

(assert (=> b!585014 m!563305))

(declare-fun m!563307 () Bool)

(assert (=> b!585007 m!563307))

(declare-fun m!563309 () Bool)

(assert (=> b!585012 m!563309))

(declare-fun m!563311 () Bool)

(assert (=> b!585012 m!563311))

(declare-fun m!563313 () Bool)

(assert (=> b!585013 m!563313))

(assert (=> b!585006 m!563311))

(assert (=> b!585006 m!563311))

(declare-fun m!563315 () Bool)

(assert (=> b!585006 m!563315))

(assert (=> b!585008 m!563311))

(assert (=> b!585008 m!563311))

(declare-fun m!563317 () Bool)

(assert (=> b!585008 m!563317))

(declare-fun m!563319 () Bool)

(assert (=> start!53672 m!563319))

(declare-fun m!563321 () Bool)

(assert (=> start!53672 m!563321))

(declare-fun m!563323 () Bool)

(assert (=> b!585015 m!563323))

(declare-fun m!563325 () Bool)

(assert (=> b!585016 m!563325))

(assert (=> b!585009 m!563311))

(assert (=> b!585009 m!563311))

(declare-fun m!563327 () Bool)

(assert (=> b!585009 m!563327))

(push 1)

(assert (not start!53672))

(assert (not b!585016))

(assert (not b!585007))

(assert (not b!585006))

(assert (not b!585014))

(assert (not b!585013))

(assert (not b!585009))

(assert (not b!585015))

(assert (not b!585017))

(assert (not b!585008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

