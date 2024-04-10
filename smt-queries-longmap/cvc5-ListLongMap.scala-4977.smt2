; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68372 () Bool)

(assert start!68372)

(declare-fun b!794455 () Bool)

(declare-fun res!538980 () Bool)

(declare-fun e!441124 () Bool)

(assert (=> b!794455 (=> (not res!538980) (not e!441124))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794455 (= res!538980 (validKeyInArray!0 k!2044))))

(declare-fun b!794456 () Bool)

(declare-fun res!538976 () Bool)

(assert (=> b!794456 (=> (not res!538976) (not e!441124))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43162 0))(
  ( (array!43163 (arr!20661 (Array (_ BitVec 32) (_ BitVec 64))) (size!21082 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43162)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794456 (= res!538976 (and (= (size!21082 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21082 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21082 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794457 () Bool)

(declare-fun e!441125 () Bool)

(assert (=> b!794457 (= e!441125 false)))

(declare-datatypes ((SeekEntryResult!8252 0))(
  ( (MissingZero!8252 (index!35376 (_ BitVec 32))) (Found!8252 (index!35377 (_ BitVec 32))) (Intermediate!8252 (undefined!9064 Bool) (index!35378 (_ BitVec 32)) (x!66306 (_ BitVec 32))) (Undefined!8252) (MissingVacant!8252 (index!35379 (_ BitVec 32))) )
))
(declare-fun lt!354149 () SeekEntryResult!8252)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354147 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!354146 () array!43162)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43162 (_ BitVec 32)) SeekEntryResult!8252)

(assert (=> b!794457 (= lt!354149 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354147 lt!354146 mask!3266))))

(declare-fun lt!354148 () SeekEntryResult!8252)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43162 (_ BitVec 32)) SeekEntryResult!8252)

(assert (=> b!794457 (= lt!354148 (seekEntryOrOpen!0 lt!354147 lt!354146 mask!3266))))

(assert (=> b!794457 (= lt!354147 (select (store (arr!20661 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794457 (= lt!354146 (array!43163 (store (arr!20661 a!3170) i!1163 k!2044) (size!21082 a!3170)))))

(declare-fun b!794458 () Bool)

(declare-fun res!538981 () Bool)

(assert (=> b!794458 (=> (not res!538981) (not e!441124))))

(assert (=> b!794458 (= res!538981 (validKeyInArray!0 (select (arr!20661 a!3170) j!153)))))

(declare-fun b!794459 () Bool)

(declare-fun res!538977 () Bool)

(assert (=> b!794459 (=> (not res!538977) (not e!441125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43162 (_ BitVec 32)) Bool)

(assert (=> b!794459 (= res!538977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!538975 () Bool)

(assert (=> start!68372 (=> (not res!538975) (not e!441124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68372 (= res!538975 (validMask!0 mask!3266))))

(assert (=> start!68372 e!441124))

(assert (=> start!68372 true))

(declare-fun array_inv!16457 (array!43162) Bool)

(assert (=> start!68372 (array_inv!16457 a!3170)))

(declare-fun b!794460 () Bool)

(declare-fun res!538979 () Bool)

(assert (=> b!794460 (=> (not res!538979) (not e!441125))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794460 (= res!538979 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21082 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20661 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21082 a!3170)) (= (select (arr!20661 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794461 () Bool)

(declare-fun res!538978 () Bool)

(assert (=> b!794461 (=> (not res!538978) (not e!441124))))

(declare-fun arrayContainsKey!0 (array!43162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794461 (= res!538978 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794462 () Bool)

(declare-fun res!538974 () Bool)

(assert (=> b!794462 (=> (not res!538974) (not e!441125))))

(declare-datatypes ((List!14624 0))(
  ( (Nil!14621) (Cons!14620 (h!15749 (_ BitVec 64)) (t!20939 List!14624)) )
))
(declare-fun arrayNoDuplicates!0 (array!43162 (_ BitVec 32) List!14624) Bool)

(assert (=> b!794462 (= res!538974 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14621))))

(declare-fun b!794463 () Bool)

(assert (=> b!794463 (= e!441124 e!441125)))

(declare-fun res!538982 () Bool)

(assert (=> b!794463 (=> (not res!538982) (not e!441125))))

(declare-fun lt!354145 () SeekEntryResult!8252)

(assert (=> b!794463 (= res!538982 (or (= lt!354145 (MissingZero!8252 i!1163)) (= lt!354145 (MissingVacant!8252 i!1163))))))

(assert (=> b!794463 (= lt!354145 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68372 res!538975) b!794456))

(assert (= (and b!794456 res!538976) b!794458))

(assert (= (and b!794458 res!538981) b!794455))

(assert (= (and b!794455 res!538980) b!794461))

(assert (= (and b!794461 res!538978) b!794463))

(assert (= (and b!794463 res!538982) b!794459))

(assert (= (and b!794459 res!538977) b!794462))

(assert (= (and b!794462 res!538974) b!794460))

(assert (= (and b!794460 res!538979) b!794457))

(declare-fun m!734993 () Bool)

(assert (=> b!794458 m!734993))

(assert (=> b!794458 m!734993))

(declare-fun m!734995 () Bool)

(assert (=> b!794458 m!734995))

(declare-fun m!734997 () Bool)

(assert (=> b!794455 m!734997))

(declare-fun m!734999 () Bool)

(assert (=> b!794461 m!734999))

(declare-fun m!735001 () Bool)

(assert (=> start!68372 m!735001))

(declare-fun m!735003 () Bool)

(assert (=> start!68372 m!735003))

(declare-fun m!735005 () Bool)

(assert (=> b!794463 m!735005))

(declare-fun m!735007 () Bool)

(assert (=> b!794459 m!735007))

(declare-fun m!735009 () Bool)

(assert (=> b!794460 m!735009))

(declare-fun m!735011 () Bool)

(assert (=> b!794460 m!735011))

(declare-fun m!735013 () Bool)

(assert (=> b!794462 m!735013))

(declare-fun m!735015 () Bool)

(assert (=> b!794457 m!735015))

(declare-fun m!735017 () Bool)

(assert (=> b!794457 m!735017))

(declare-fun m!735019 () Bool)

(assert (=> b!794457 m!735019))

(declare-fun m!735021 () Bool)

(assert (=> b!794457 m!735021))

(push 1)

