; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68438 () Bool)

(assert start!68438)

(declare-fun b!795465 () Bool)

(declare-fun res!539992 () Bool)

(declare-fun e!441512 () Bool)

(assert (=> b!795465 (=> (not res!539992) (not e!441512))))

(declare-datatypes ((array!43228 0))(
  ( (array!43229 (arr!20694 (Array (_ BitVec 32) (_ BitVec 64))) (size!21115 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43228)

(declare-datatypes ((List!14657 0))(
  ( (Nil!14654) (Cons!14653 (h!15782 (_ BitVec 64)) (t!20972 List!14657)) )
))
(declare-fun arrayNoDuplicates!0 (array!43228 (_ BitVec 32) List!14657) Bool)

(assert (=> b!795465 (= res!539992 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14654))))

(declare-fun b!795466 () Bool)

(declare-fun e!441513 () Bool)

(assert (=> b!795466 (= e!441513 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8285 0))(
  ( (MissingZero!8285 (index!35508 (_ BitVec 32))) (Found!8285 (index!35509 (_ BitVec 32))) (Intermediate!8285 (undefined!9097 Bool) (index!35510 (_ BitVec 32)) (x!66427 (_ BitVec 32))) (Undefined!8285) (MissingVacant!8285 (index!35511 (_ BitVec 32))) )
))
(declare-fun lt!354590 () SeekEntryResult!8285)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43228 (_ BitVec 32)) SeekEntryResult!8285)

(assert (=> b!795466 (= lt!354590 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20694 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354588 () SeekEntryResult!8285)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43228 (_ BitVec 32)) SeekEntryResult!8285)

(assert (=> b!795466 (= lt!354588 (seekEntryOrOpen!0 (select (arr!20694 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795467 () Bool)

(declare-fun e!441514 () Bool)

(assert (=> b!795467 (= e!441514 e!441512)))

(declare-fun res!539985 () Bool)

(assert (=> b!795467 (=> (not res!539985) (not e!441512))))

(declare-fun lt!354586 () SeekEntryResult!8285)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795467 (= res!539985 (or (= lt!354586 (MissingZero!8285 i!1163)) (= lt!354586 (MissingVacant!8285 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!795467 (= lt!354586 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795468 () Bool)

(declare-fun res!539993 () Bool)

(assert (=> b!795468 (=> (not res!539993) (not e!441514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795468 (= res!539993 (validKeyInArray!0 k!2044))))

(declare-fun b!795469 () Bool)

(declare-fun res!539986 () Bool)

(assert (=> b!795469 (=> (not res!539986) (not e!441512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43228 (_ BitVec 32)) Bool)

(assert (=> b!795469 (= res!539986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!539991 () Bool)

(assert (=> start!68438 (=> (not res!539991) (not e!441514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68438 (= res!539991 (validMask!0 mask!3266))))

(assert (=> start!68438 e!441514))

(assert (=> start!68438 true))

(declare-fun array_inv!16490 (array!43228) Bool)

(assert (=> start!68438 (array_inv!16490 a!3170)))

(declare-fun b!795470 () Bool)

(declare-fun res!539989 () Bool)

(assert (=> b!795470 (=> (not res!539989) (not e!441514))))

(assert (=> b!795470 (= res!539989 (and (= (size!21115 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21115 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21115 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795471 () Bool)

(assert (=> b!795471 (= e!441512 e!441513)))

(declare-fun res!539987 () Bool)

(assert (=> b!795471 (=> (not res!539987) (not e!441513))))

(declare-fun lt!354589 () array!43228)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354587 () (_ BitVec 64))

(assert (=> b!795471 (= res!539987 (= (seekEntryOrOpen!0 lt!354587 lt!354589 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354587 lt!354589 mask!3266)))))

(assert (=> b!795471 (= lt!354587 (select (store (arr!20694 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795471 (= lt!354589 (array!43229 (store (arr!20694 a!3170) i!1163 k!2044) (size!21115 a!3170)))))

(declare-fun b!795472 () Bool)

(declare-fun res!539990 () Bool)

(assert (=> b!795472 (=> (not res!539990) (not e!441514))))

(declare-fun arrayContainsKey!0 (array!43228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795472 (= res!539990 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795473 () Bool)

(declare-fun res!539984 () Bool)

(assert (=> b!795473 (=> (not res!539984) (not e!441512))))

(assert (=> b!795473 (= res!539984 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21115 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20694 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21115 a!3170)) (= (select (arr!20694 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795474 () Bool)

(declare-fun res!539988 () Bool)

(assert (=> b!795474 (=> (not res!539988) (not e!441514))))

(assert (=> b!795474 (= res!539988 (validKeyInArray!0 (select (arr!20694 a!3170) j!153)))))

(assert (= (and start!68438 res!539991) b!795470))

(assert (= (and b!795470 res!539989) b!795474))

(assert (= (and b!795474 res!539988) b!795468))

(assert (= (and b!795468 res!539993) b!795472))

(assert (= (and b!795472 res!539990) b!795467))

(assert (= (and b!795467 res!539985) b!795469))

(assert (= (and b!795469 res!539986) b!795465))

(assert (= (and b!795465 res!539992) b!795473))

(assert (= (and b!795473 res!539984) b!795471))

(assert (= (and b!795471 res!539987) b!795466))

(declare-fun m!736109 () Bool)

(assert (=> b!795468 m!736109))

(declare-fun m!736111 () Bool)

(assert (=> start!68438 m!736111))

(declare-fun m!736113 () Bool)

(assert (=> start!68438 m!736113))

(declare-fun m!736115 () Bool)

(assert (=> b!795472 m!736115))

(declare-fun m!736117 () Bool)

(assert (=> b!795471 m!736117))

(declare-fun m!736119 () Bool)

(assert (=> b!795471 m!736119))

(declare-fun m!736121 () Bool)

(assert (=> b!795471 m!736121))

(declare-fun m!736123 () Bool)

(assert (=> b!795471 m!736123))

(declare-fun m!736125 () Bool)

(assert (=> b!795469 m!736125))

(declare-fun m!736127 () Bool)

(assert (=> b!795465 m!736127))

(declare-fun m!736129 () Bool)

(assert (=> b!795466 m!736129))

(assert (=> b!795466 m!736129))

(declare-fun m!736131 () Bool)

(assert (=> b!795466 m!736131))

(assert (=> b!795466 m!736129))

(declare-fun m!736133 () Bool)

(assert (=> b!795466 m!736133))

(declare-fun m!736135 () Bool)

(assert (=> b!795467 m!736135))

(assert (=> b!795474 m!736129))

(assert (=> b!795474 m!736129))

(declare-fun m!736137 () Bool)

(assert (=> b!795474 m!736137))

(declare-fun m!736139 () Bool)

(assert (=> b!795473 m!736139))

(declare-fun m!736141 () Bool)

(assert (=> b!795473 m!736141))

(push 1)

