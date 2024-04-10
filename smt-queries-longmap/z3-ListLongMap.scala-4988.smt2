; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68440 () Bool)

(assert start!68440)

(declare-fun res!540022 () Bool)

(declare-fun e!441527 () Bool)

(assert (=> start!68440 (=> (not res!540022) (not e!441527))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68440 (= res!540022 (validMask!0 mask!3266))))

(assert (=> start!68440 e!441527))

(assert (=> start!68440 true))

(declare-datatypes ((array!43230 0))(
  ( (array!43231 (arr!20695 (Array (_ BitVec 32) (_ BitVec 64))) (size!21116 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43230)

(declare-fun array_inv!16491 (array!43230) Bool)

(assert (=> start!68440 (array_inv!16491 a!3170)))

(declare-fun b!795495 () Bool)

(declare-fun res!540019 () Bool)

(assert (=> b!795495 (=> (not res!540019) (not e!441527))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795495 (= res!540019 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795496 () Bool)

(declare-fun res!540017 () Bool)

(declare-fun e!441526 () Bool)

(assert (=> b!795496 (=> (not res!540017) (not e!441526))))

(declare-datatypes ((List!14658 0))(
  ( (Nil!14655) (Cons!14654 (h!15783 (_ BitVec 64)) (t!20973 List!14658)) )
))
(declare-fun arrayNoDuplicates!0 (array!43230 (_ BitVec 32) List!14658) Bool)

(assert (=> b!795496 (= res!540017 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14655))))

(declare-fun b!795497 () Bool)

(declare-fun res!540014 () Bool)

(assert (=> b!795497 (=> (not res!540014) (not e!441527))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795497 (= res!540014 (and (= (size!21116 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21116 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21116 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795498 () Bool)

(declare-fun e!441525 () Bool)

(assert (=> b!795498 (= e!441525 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8286 0))(
  ( (MissingZero!8286 (index!35512 (_ BitVec 32))) (Found!8286 (index!35513 (_ BitVec 32))) (Intermediate!8286 (undefined!9098 Bool) (index!35514 (_ BitVec 32)) (x!66428 (_ BitVec 32))) (Undefined!8286) (MissingVacant!8286 (index!35515 (_ BitVec 32))) )
))
(declare-fun lt!354604 () SeekEntryResult!8286)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43230 (_ BitVec 32)) SeekEntryResult!8286)

(assert (=> b!795498 (= lt!354604 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20695 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354603 () SeekEntryResult!8286)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43230 (_ BitVec 32)) SeekEntryResult!8286)

(assert (=> b!795498 (= lt!354603 (seekEntryOrOpen!0 (select (arr!20695 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795499 () Bool)

(declare-fun res!540021 () Bool)

(assert (=> b!795499 (=> (not res!540021) (not e!441526))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!795499 (= res!540021 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21116 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20695 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21116 a!3170)) (= (select (arr!20695 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795500 () Bool)

(assert (=> b!795500 (= e!441526 e!441525)))

(declare-fun res!540015 () Bool)

(assert (=> b!795500 (=> (not res!540015) (not e!441525))))

(declare-fun lt!354601 () (_ BitVec 64))

(declare-fun lt!354602 () array!43230)

(assert (=> b!795500 (= res!540015 (= (seekEntryOrOpen!0 lt!354601 lt!354602 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354601 lt!354602 mask!3266)))))

(assert (=> b!795500 (= lt!354601 (select (store (arr!20695 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795500 (= lt!354602 (array!43231 (store (arr!20695 a!3170) i!1163 k0!2044) (size!21116 a!3170)))))

(declare-fun b!795501 () Bool)

(declare-fun res!540023 () Bool)

(assert (=> b!795501 (=> (not res!540023) (not e!441527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795501 (= res!540023 (validKeyInArray!0 k0!2044))))

(declare-fun b!795502 () Bool)

(declare-fun res!540018 () Bool)

(assert (=> b!795502 (=> (not res!540018) (not e!441527))))

(assert (=> b!795502 (= res!540018 (validKeyInArray!0 (select (arr!20695 a!3170) j!153)))))

(declare-fun b!795503 () Bool)

(assert (=> b!795503 (= e!441527 e!441526)))

(declare-fun res!540016 () Bool)

(assert (=> b!795503 (=> (not res!540016) (not e!441526))))

(declare-fun lt!354605 () SeekEntryResult!8286)

(assert (=> b!795503 (= res!540016 (or (= lt!354605 (MissingZero!8286 i!1163)) (= lt!354605 (MissingVacant!8286 i!1163))))))

(assert (=> b!795503 (= lt!354605 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795504 () Bool)

(declare-fun res!540020 () Bool)

(assert (=> b!795504 (=> (not res!540020) (not e!441526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43230 (_ BitVec 32)) Bool)

(assert (=> b!795504 (= res!540020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68440 res!540022) b!795497))

(assert (= (and b!795497 res!540014) b!795502))

(assert (= (and b!795502 res!540018) b!795501))

(assert (= (and b!795501 res!540023) b!795495))

(assert (= (and b!795495 res!540019) b!795503))

(assert (= (and b!795503 res!540016) b!795504))

(assert (= (and b!795504 res!540020) b!795496))

(assert (= (and b!795496 res!540017) b!795499))

(assert (= (and b!795499 res!540021) b!795500))

(assert (= (and b!795500 res!540015) b!795498))

(declare-fun m!736143 () Bool)

(assert (=> b!795495 m!736143))

(declare-fun m!736145 () Bool)

(assert (=> b!795504 m!736145))

(declare-fun m!736147 () Bool)

(assert (=> b!795502 m!736147))

(assert (=> b!795502 m!736147))

(declare-fun m!736149 () Bool)

(assert (=> b!795502 m!736149))

(declare-fun m!736151 () Bool)

(assert (=> b!795499 m!736151))

(declare-fun m!736153 () Bool)

(assert (=> b!795499 m!736153))

(declare-fun m!736155 () Bool)

(assert (=> b!795503 m!736155))

(declare-fun m!736157 () Bool)

(assert (=> b!795496 m!736157))

(declare-fun m!736159 () Bool)

(assert (=> start!68440 m!736159))

(declare-fun m!736161 () Bool)

(assert (=> start!68440 m!736161))

(assert (=> b!795498 m!736147))

(assert (=> b!795498 m!736147))

(declare-fun m!736163 () Bool)

(assert (=> b!795498 m!736163))

(assert (=> b!795498 m!736147))

(declare-fun m!736165 () Bool)

(assert (=> b!795498 m!736165))

(declare-fun m!736167 () Bool)

(assert (=> b!795500 m!736167))

(declare-fun m!736169 () Bool)

(assert (=> b!795500 m!736169))

(declare-fun m!736171 () Bool)

(assert (=> b!795500 m!736171))

(declare-fun m!736173 () Bool)

(assert (=> b!795500 m!736173))

(declare-fun m!736175 () Bool)

(assert (=> b!795501 m!736175))

(check-sat (not start!68440) (not b!795504) (not b!795502) (not b!795496) (not b!795500) (not b!795498) (not b!795495) (not b!795501) (not b!795503))
(check-sat)
