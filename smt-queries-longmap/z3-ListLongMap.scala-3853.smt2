; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52986 () Bool)

(assert start!52986)

(declare-fun b!576921 () Bool)

(declare-fun res!365095 () Bool)

(declare-fun e!331850 () Bool)

(assert (=> b!576921 (=> (not res!365095) (not e!331850))))

(declare-datatypes ((array!36018 0))(
  ( (array!36019 (arr!17288 (Array (_ BitVec 32) (_ BitVec 64))) (size!17653 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36018)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576921 (= res!365095 (validKeyInArray!0 (select (arr!17288 a!2986) j!136)))))

(declare-fun b!576922 () Bool)

(declare-fun res!365097 () Bool)

(assert (=> b!576922 (=> (not res!365097) (not e!331850))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576922 (= res!365097 (and (= (size!17653 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17653 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17653 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365099 () Bool)

(assert (=> start!52986 (=> (not res!365099) (not e!331850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52986 (= res!365099 (validMask!0 mask!3053))))

(assert (=> start!52986 e!331850))

(assert (=> start!52986 true))

(declare-fun array_inv!13171 (array!36018) Bool)

(assert (=> start!52986 (array_inv!13171 a!2986)))

(declare-fun b!576923 () Bool)

(assert (=> b!576923 (= e!331850 false)))

(declare-datatypes ((SeekEntryResult!5725 0))(
  ( (MissingZero!5725 (index!25127 (_ BitVec 32))) (Found!5725 (index!25128 (_ BitVec 32))) (Intermediate!5725 (undefined!6537 Bool) (index!25129 (_ BitVec 32)) (x!54053 (_ BitVec 32))) (Undefined!5725) (MissingVacant!5725 (index!25130 (_ BitVec 32))) )
))
(declare-fun lt!263683 () SeekEntryResult!5725)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36018 (_ BitVec 32)) SeekEntryResult!5725)

(assert (=> b!576923 (= lt!263683 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!576924 () Bool)

(declare-fun res!365098 () Bool)

(assert (=> b!576924 (=> (not res!365098) (not e!331850))))

(declare-fun arrayContainsKey!0 (array!36018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576924 (= res!365098 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!576925 () Bool)

(declare-fun res!365096 () Bool)

(assert (=> b!576925 (=> (not res!365096) (not e!331850))))

(assert (=> b!576925 (= res!365096 (validKeyInArray!0 k0!1786))))

(assert (= (and start!52986 res!365099) b!576922))

(assert (= (and b!576922 res!365097) b!576921))

(assert (= (and b!576921 res!365095) b!576925))

(assert (= (and b!576925 res!365096) b!576924))

(assert (= (and b!576924 res!365098) b!576923))

(declare-fun m!555329 () Bool)

(assert (=> b!576923 m!555329))

(declare-fun m!555331 () Bool)

(assert (=> b!576921 m!555331))

(assert (=> b!576921 m!555331))

(declare-fun m!555333 () Bool)

(assert (=> b!576921 m!555333))

(declare-fun m!555335 () Bool)

(assert (=> start!52986 m!555335))

(declare-fun m!555337 () Bool)

(assert (=> start!52986 m!555337))

(declare-fun m!555339 () Bool)

(assert (=> b!576925 m!555339))

(declare-fun m!555341 () Bool)

(assert (=> b!576924 m!555341))

(check-sat (not start!52986) (not b!576925) (not b!576921) (not b!576924) (not b!576923))
(check-sat)
