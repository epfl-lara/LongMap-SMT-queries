; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52986 () Bool)

(assert start!52986)

(declare-fun b!577063 () Bool)

(declare-fun res!365098 () Bool)

(declare-fun e!331976 () Bool)

(assert (=> b!577063 (=> (not res!365098) (not e!331976))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577063 (= res!365098 (validKeyInArray!0 k0!1786))))

(declare-fun b!577064 () Bool)

(declare-fun res!365095 () Bool)

(assert (=> b!577064 (=> (not res!365095) (not e!331976))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36004 0))(
  ( (array!36005 (arr!17281 (Array (_ BitVec 32) (_ BitVec 64))) (size!17645 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36004)

(assert (=> b!577064 (= res!365095 (and (= (size!17645 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17645 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17645 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577065 () Bool)

(assert (=> b!577065 (= e!331976 false)))

(declare-datatypes ((SeekEntryResult!5721 0))(
  ( (MissingZero!5721 (index!25111 (_ BitVec 32))) (Found!5721 (index!25112 (_ BitVec 32))) (Intermediate!5721 (undefined!6533 Bool) (index!25113 (_ BitVec 32)) (x!54030 (_ BitVec 32))) (Undefined!5721) (MissingVacant!5721 (index!25114 (_ BitVec 32))) )
))
(declare-fun lt!263902 () SeekEntryResult!5721)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36004 (_ BitVec 32)) SeekEntryResult!5721)

(assert (=> b!577065 (= lt!263902 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!365097 () Bool)

(assert (=> start!52986 (=> (not res!365097) (not e!331976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52986 (= res!365097 (validMask!0 mask!3053))))

(assert (=> start!52986 e!331976))

(assert (=> start!52986 true))

(declare-fun array_inv!13077 (array!36004) Bool)

(assert (=> start!52986 (array_inv!13077 a!2986)))

(declare-fun b!577066 () Bool)

(declare-fun res!365099 () Bool)

(assert (=> b!577066 (=> (not res!365099) (not e!331976))))

(assert (=> b!577066 (= res!365099 (validKeyInArray!0 (select (arr!17281 a!2986) j!136)))))

(declare-fun b!577067 () Bool)

(declare-fun res!365096 () Bool)

(assert (=> b!577067 (=> (not res!365096) (not e!331976))))

(declare-fun arrayContainsKey!0 (array!36004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577067 (= res!365096 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!52986 res!365097) b!577064))

(assert (= (and b!577064 res!365095) b!577066))

(assert (= (and b!577066 res!365099) b!577063))

(assert (= (and b!577063 res!365098) b!577067))

(assert (= (and b!577067 res!365096) b!577065))

(declare-fun m!555989 () Bool)

(assert (=> b!577066 m!555989))

(assert (=> b!577066 m!555989))

(declare-fun m!555991 () Bool)

(assert (=> b!577066 m!555991))

(declare-fun m!555993 () Bool)

(assert (=> start!52986 m!555993))

(declare-fun m!555995 () Bool)

(assert (=> start!52986 m!555995))

(declare-fun m!555997 () Bool)

(assert (=> b!577065 m!555997))

(declare-fun m!555999 () Bool)

(assert (=> b!577067 m!555999))

(declare-fun m!556001 () Bool)

(assert (=> b!577063 m!556001))

(check-sat (not b!577066) (not b!577065) (not b!577063) (not start!52986) (not b!577067))
(check-sat)
