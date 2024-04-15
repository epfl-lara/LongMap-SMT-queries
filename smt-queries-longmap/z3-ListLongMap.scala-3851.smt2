; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52974 () Bool)

(assert start!52974)

(declare-fun res!365002 () Bool)

(declare-fun e!331814 () Bool)

(assert (=> start!52974 (=> (not res!365002) (not e!331814))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52974 (= res!365002 (validMask!0 mask!3053))))

(assert (=> start!52974 e!331814))

(assert (=> start!52974 true))

(declare-datatypes ((array!36006 0))(
  ( (array!36007 (arr!17282 (Array (_ BitVec 32) (_ BitVec 64))) (size!17647 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36006)

(declare-fun array_inv!13165 (array!36006) Bool)

(assert (=> start!52974 (array_inv!13165 a!2986)))

(declare-fun b!576824 () Bool)

(declare-fun res!365001 () Bool)

(assert (=> b!576824 (=> (not res!365001) (not e!331814))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576824 (= res!365001 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!576825 () Bool)

(declare-fun res!365000 () Bool)

(assert (=> b!576825 (=> (not res!365000) (not e!331814))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5719 0))(
  ( (MissingZero!5719 (index!25103 (_ BitVec 32))) (Found!5719 (index!25104 (_ BitVec 32))) (Intermediate!5719 (undefined!6531 Bool) (index!25105 (_ BitVec 32)) (x!54031 (_ BitVec 32))) (Undefined!5719) (MissingVacant!5719 (index!25106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36006 (_ BitVec 32)) SeekEntryResult!5719)

(assert (=> b!576825 (= res!365000 (not (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) (MissingZero!5719 i!1108))))))

(declare-fun b!576826 () Bool)

(declare-fun res!364998 () Bool)

(assert (=> b!576826 (=> (not res!364998) (not e!331814))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!576826 (= res!364998 (and (= (size!17647 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17647 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17647 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!576827 () Bool)

(declare-fun res!365003 () Bool)

(assert (=> b!576827 (=> (not res!365003) (not e!331814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576827 (= res!365003 (validKeyInArray!0 (select (arr!17282 a!2986) j!136)))))

(declare-fun b!576828 () Bool)

(assert (=> b!576828 (= e!331814 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!576829 () Bool)

(declare-fun res!364999 () Bool)

(assert (=> b!576829 (=> (not res!364999) (not e!331814))))

(assert (=> b!576829 (= res!364999 (validKeyInArray!0 k0!1786))))

(assert (= (and start!52974 res!365002) b!576826))

(assert (= (and b!576826 res!364998) b!576827))

(assert (= (and b!576827 res!365003) b!576829))

(assert (= (and b!576829 res!364999) b!576824))

(assert (= (and b!576824 res!365001) b!576825))

(assert (= (and b!576825 res!365000) b!576828))

(declare-fun m!555245 () Bool)

(assert (=> b!576829 m!555245))

(declare-fun m!555247 () Bool)

(assert (=> start!52974 m!555247))

(declare-fun m!555249 () Bool)

(assert (=> start!52974 m!555249))

(declare-fun m!555251 () Bool)

(assert (=> b!576824 m!555251))

(declare-fun m!555253 () Bool)

(assert (=> b!576827 m!555253))

(assert (=> b!576827 m!555253))

(declare-fun m!555255 () Bool)

(assert (=> b!576827 m!555255))

(declare-fun m!555257 () Bool)

(assert (=> b!576825 m!555257))

(check-sat (not b!576827) (not b!576824) (not start!52974) (not b!576829) (not b!576825))
(check-sat)
