; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68356 () Bool)

(assert start!68356)

(declare-fun b!794230 () Bool)

(declare-fun e!441042 () Bool)

(assert (=> b!794230 (= e!441042 false)))

(declare-datatypes ((array!43146 0))(
  ( (array!43147 (arr!20653 (Array (_ BitVec 32) (_ BitVec 64))) (size!21074 (_ BitVec 32))) )
))
(declare-fun lt!354044 () array!43146)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354043 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8244 0))(
  ( (MissingZero!8244 (index!35344 (_ BitVec 32))) (Found!8244 (index!35345 (_ BitVec 32))) (Intermediate!8244 (undefined!9056 Bool) (index!35346 (_ BitVec 32)) (x!66274 (_ BitVec 32))) (Undefined!8244) (MissingVacant!8244 (index!35347 (_ BitVec 32))) )
))
(declare-fun lt!354046 () SeekEntryResult!8244)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43146 (_ BitVec 32)) SeekEntryResult!8244)

(assert (=> b!794230 (= lt!354046 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354043 lt!354044 mask!3266))))

(declare-fun lt!354045 () SeekEntryResult!8244)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43146 (_ BitVec 32)) SeekEntryResult!8244)

(assert (=> b!794230 (= lt!354045 (seekEntryOrOpen!0 lt!354043 lt!354044 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43146)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794230 (= lt!354043 (select (store (arr!20653 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794230 (= lt!354044 (array!43147 (store (arr!20653 a!3170) i!1163 k0!2044) (size!21074 a!3170)))))

(declare-fun b!794231 () Bool)

(declare-fun res!538751 () Bool)

(assert (=> b!794231 (=> (not res!538751) (not e!441042))))

(declare-datatypes ((List!14616 0))(
  ( (Nil!14613) (Cons!14612 (h!15741 (_ BitVec 64)) (t!20931 List!14616)) )
))
(declare-fun arrayNoDuplicates!0 (array!43146 (_ BitVec 32) List!14616) Bool)

(assert (=> b!794231 (= res!538751 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14613))))

(declare-fun b!794232 () Bool)

(declare-fun res!538750 () Bool)

(declare-fun e!441043 () Bool)

(assert (=> b!794232 (=> (not res!538750) (not e!441043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794232 (= res!538750 (validKeyInArray!0 k0!2044))))

(declare-fun b!794233 () Bool)

(declare-fun res!538756 () Bool)

(assert (=> b!794233 (=> (not res!538756) (not e!441043))))

(assert (=> b!794233 (= res!538756 (and (= (size!21074 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21074 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21074 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794234 () Bool)

(declare-fun res!538749 () Bool)

(assert (=> b!794234 (=> (not res!538749) (not e!441042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43146 (_ BitVec 32)) Bool)

(assert (=> b!794234 (= res!538749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794235 () Bool)

(declare-fun res!538752 () Bool)

(assert (=> b!794235 (=> (not res!538752) (not e!441042))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794235 (= res!538752 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21074 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20653 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21074 a!3170)) (= (select (arr!20653 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!538753 () Bool)

(assert (=> start!68356 (=> (not res!538753) (not e!441043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68356 (= res!538753 (validMask!0 mask!3266))))

(assert (=> start!68356 e!441043))

(assert (=> start!68356 true))

(declare-fun array_inv!16449 (array!43146) Bool)

(assert (=> start!68356 (array_inv!16449 a!3170)))

(declare-fun b!794236 () Bool)

(assert (=> b!794236 (= e!441043 e!441042)))

(declare-fun res!538754 () Bool)

(assert (=> b!794236 (=> (not res!538754) (not e!441042))))

(declare-fun lt!354047 () SeekEntryResult!8244)

(assert (=> b!794236 (= res!538754 (or (= lt!354047 (MissingZero!8244 i!1163)) (= lt!354047 (MissingVacant!8244 i!1163))))))

(assert (=> b!794236 (= lt!354047 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794237 () Bool)

(declare-fun res!538757 () Bool)

(assert (=> b!794237 (=> (not res!538757) (not e!441043))))

(assert (=> b!794237 (= res!538757 (validKeyInArray!0 (select (arr!20653 a!3170) j!153)))))

(declare-fun b!794238 () Bool)

(declare-fun res!538755 () Bool)

(assert (=> b!794238 (=> (not res!538755) (not e!441043))))

(declare-fun arrayContainsKey!0 (array!43146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794238 (= res!538755 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68356 res!538753) b!794233))

(assert (= (and b!794233 res!538756) b!794237))

(assert (= (and b!794237 res!538757) b!794232))

(assert (= (and b!794232 res!538750) b!794238))

(assert (= (and b!794238 res!538755) b!794236))

(assert (= (and b!794236 res!538754) b!794234))

(assert (= (and b!794234 res!538749) b!794231))

(assert (= (and b!794231 res!538751) b!794235))

(assert (= (and b!794235 res!538752) b!794230))

(declare-fun m!734753 () Bool)

(assert (=> b!794232 m!734753))

(declare-fun m!734755 () Bool)

(assert (=> b!794230 m!734755))

(declare-fun m!734757 () Bool)

(assert (=> b!794230 m!734757))

(declare-fun m!734759 () Bool)

(assert (=> b!794230 m!734759))

(declare-fun m!734761 () Bool)

(assert (=> b!794230 m!734761))

(declare-fun m!734763 () Bool)

(assert (=> b!794235 m!734763))

(declare-fun m!734765 () Bool)

(assert (=> b!794235 m!734765))

(declare-fun m!734767 () Bool)

(assert (=> b!794231 m!734767))

(declare-fun m!734769 () Bool)

(assert (=> b!794237 m!734769))

(assert (=> b!794237 m!734769))

(declare-fun m!734771 () Bool)

(assert (=> b!794237 m!734771))

(declare-fun m!734773 () Bool)

(assert (=> b!794236 m!734773))

(declare-fun m!734775 () Bool)

(assert (=> b!794234 m!734775))

(declare-fun m!734777 () Bool)

(assert (=> start!68356 m!734777))

(declare-fun m!734779 () Bool)

(assert (=> start!68356 m!734779))

(declare-fun m!734781 () Bool)

(assert (=> b!794238 m!734781))

(check-sat (not b!794234) (not b!794230) (not start!68356) (not b!794236) (not b!794231) (not b!794237) (not b!794238) (not b!794232))
(check-sat)
