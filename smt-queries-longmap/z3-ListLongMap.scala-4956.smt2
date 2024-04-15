; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68226 () Bool)

(assert start!68226)

(declare-fun res!537234 () Bool)

(declare-fun e!440368 () Bool)

(assert (=> start!68226 (=> (not res!537234) (not e!440368))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68226 (= res!537234 (validMask!0 mask!3266))))

(assert (=> start!68226 e!440368))

(assert (=> start!68226 true))

(declare-datatypes ((array!43033 0))(
  ( (array!43034 (arr!20597 (Array (_ BitVec 32) (_ BitVec 64))) (size!21018 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43033)

(declare-fun array_inv!16480 (array!43033) Bool)

(assert (=> start!68226 (array_inv!16480 a!3170)))

(declare-fun b!792572 () Bool)

(declare-fun res!537236 () Bool)

(assert (=> b!792572 (=> (not res!537236) (not e!440368))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792572 (= res!537236 (validKeyInArray!0 k0!2044))))

(declare-fun b!792573 () Bool)

(declare-fun e!440366 () Bool)

(assert (=> b!792573 (= e!440368 e!440366)))

(declare-fun res!537232 () Bool)

(assert (=> b!792573 (=> (not res!537232) (not e!440366))))

(declare-datatypes ((SeekEntryResult!8185 0))(
  ( (MissingZero!8185 (index!35108 (_ BitVec 32))) (Found!8185 (index!35109 (_ BitVec 32))) (Intermediate!8185 (undefined!8997 Bool) (index!35110 (_ BitVec 32)) (x!66066 (_ BitVec 32))) (Undefined!8185) (MissingVacant!8185 (index!35111 (_ BitVec 32))) )
))
(declare-fun lt!353350 () SeekEntryResult!8185)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792573 (= res!537232 (or (= lt!353350 (MissingZero!8185 i!1163)) (= lt!353350 (MissingVacant!8185 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43033 (_ BitVec 32)) SeekEntryResult!8185)

(assert (=> b!792573 (= lt!353350 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792574 () Bool)

(declare-fun res!537235 () Bool)

(assert (=> b!792574 (=> (not res!537235) (not e!440368))))

(declare-fun arrayContainsKey!0 (array!43033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792574 (= res!537235 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792575 () Bool)

(declare-fun res!537231 () Bool)

(assert (=> b!792575 (=> (not res!537231) (not e!440368))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792575 (= res!537231 (and (= (size!21018 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21018 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21018 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792576 () Bool)

(declare-fun res!537237 () Bool)

(assert (=> b!792576 (=> (not res!537237) (not e!440368))))

(assert (=> b!792576 (= res!537237 (validKeyInArray!0 (select (arr!20597 a!3170) j!153)))))

(declare-fun b!792577 () Bool)

(declare-fun res!537233 () Bool)

(assert (=> b!792577 (=> (not res!537233) (not e!440366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43033 (_ BitVec 32)) Bool)

(assert (=> b!792577 (= res!537233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792578 () Bool)

(assert (=> b!792578 (= e!440366 false)))

(declare-fun lt!353351 () Bool)

(declare-datatypes ((List!14599 0))(
  ( (Nil!14596) (Cons!14595 (h!15724 (_ BitVec 64)) (t!20905 List!14599)) )
))
(declare-fun arrayNoDuplicates!0 (array!43033 (_ BitVec 32) List!14599) Bool)

(assert (=> b!792578 (= lt!353351 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14596))))

(assert (= (and start!68226 res!537234) b!792575))

(assert (= (and b!792575 res!537231) b!792576))

(assert (= (and b!792576 res!537237) b!792572))

(assert (= (and b!792572 res!537236) b!792574))

(assert (= (and b!792574 res!537235) b!792573))

(assert (= (and b!792573 res!537232) b!792577))

(assert (= (and b!792577 res!537233) b!792578))

(declare-fun m!732595 () Bool)

(assert (=> b!792572 m!732595))

(declare-fun m!732597 () Bool)

(assert (=> b!792574 m!732597))

(declare-fun m!732599 () Bool)

(assert (=> start!68226 m!732599))

(declare-fun m!732601 () Bool)

(assert (=> start!68226 m!732601))

(declare-fun m!732603 () Bool)

(assert (=> b!792573 m!732603))

(declare-fun m!732605 () Bool)

(assert (=> b!792578 m!732605))

(declare-fun m!732607 () Bool)

(assert (=> b!792577 m!732607))

(declare-fun m!732609 () Bool)

(assert (=> b!792576 m!732609))

(assert (=> b!792576 m!732609))

(declare-fun m!732611 () Bool)

(assert (=> b!792576 m!732611))

(check-sat (not b!792572) (not start!68226) (not b!792577) (not b!792576) (not b!792574) (not b!792578) (not b!792573))
(check-sat)
