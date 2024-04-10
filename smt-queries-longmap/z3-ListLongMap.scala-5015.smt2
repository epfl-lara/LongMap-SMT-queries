; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68602 () Bool)

(assert start!68602)

(declare-fun b!798214 () Bool)

(declare-fun res!542739 () Bool)

(declare-fun e!442788 () Bool)

(assert (=> b!798214 (=> (not res!542739) (not e!442788))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798214 (= res!542739 (validKeyInArray!0 k0!2044))))

(declare-fun b!798215 () Bool)

(declare-fun e!442787 () Bool)

(assert (=> b!798215 (= e!442788 e!442787)))

(declare-fun res!542742 () Bool)

(assert (=> b!798215 (=> (not res!542742) (not e!442787))))

(declare-datatypes ((SeekEntryResult!8367 0))(
  ( (MissingZero!8367 (index!35836 (_ BitVec 32))) (Found!8367 (index!35837 (_ BitVec 32))) (Intermediate!8367 (undefined!9179 Bool) (index!35838 (_ BitVec 32)) (x!66725 (_ BitVec 32))) (Undefined!8367) (MissingVacant!8367 (index!35839 (_ BitVec 32))) )
))
(declare-fun lt!356277 () SeekEntryResult!8367)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798215 (= res!542742 (or (= lt!356277 (MissingZero!8367 i!1163)) (= lt!356277 (MissingVacant!8367 i!1163))))))

(declare-datatypes ((array!43392 0))(
  ( (array!43393 (arr!20776 (Array (_ BitVec 32) (_ BitVec 64))) (size!21197 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43392)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43392 (_ BitVec 32)) SeekEntryResult!8367)

(assert (=> b!798215 (= lt!356277 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798216 () Bool)

(declare-fun res!542738 () Bool)

(assert (=> b!798216 (=> (not res!542738) (not e!442787))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798216 (= res!542738 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21197 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20776 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21197 a!3170)) (= (select (arr!20776 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798217 () Bool)

(declare-fun e!442786 () Bool)

(declare-fun e!442790 () Bool)

(assert (=> b!798217 (= e!442786 e!442790)))

(declare-fun res!542740 () Bool)

(assert (=> b!798217 (=> (not res!542740) (not e!442790))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!356278 () SeekEntryResult!8367)

(declare-fun lt!356272 () SeekEntryResult!8367)

(assert (=> b!798217 (= res!542740 (and (= lt!356272 lt!356278) (= (select (arr!20776 a!3170) index!1236) (select (arr!20776 a!3170) j!153))))))

(assert (=> b!798217 (= lt!356278 (Found!8367 j!153))))

(declare-fun b!798218 () Bool)

(declare-fun e!442785 () Bool)

(assert (=> b!798218 (= e!442787 e!442785)))

(declare-fun res!542736 () Bool)

(assert (=> b!798218 (=> (not res!542736) (not e!442785))))

(declare-fun lt!356274 () SeekEntryResult!8367)

(declare-fun lt!356279 () SeekEntryResult!8367)

(assert (=> b!798218 (= res!542736 (= lt!356274 lt!356279))))

(declare-fun lt!356273 () (_ BitVec 64))

(declare-fun lt!356275 () array!43392)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43392 (_ BitVec 32)) SeekEntryResult!8367)

(assert (=> b!798218 (= lt!356279 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356273 lt!356275 mask!3266))))

(assert (=> b!798218 (= lt!356274 (seekEntryOrOpen!0 lt!356273 lt!356275 mask!3266))))

(assert (=> b!798218 (= lt!356273 (select (store (arr!20776 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798218 (= lt!356275 (array!43393 (store (arr!20776 a!3170) i!1163 k0!2044) (size!21197 a!3170)))))

(declare-fun b!798220 () Bool)

(assert (=> b!798220 (= e!442785 e!442786)))

(declare-fun res!542744 () Bool)

(assert (=> b!798220 (=> (not res!542744) (not e!442786))))

(declare-fun lt!356276 () SeekEntryResult!8367)

(assert (=> b!798220 (= res!542744 (= lt!356276 lt!356272))))

(assert (=> b!798220 (= lt!356272 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20776 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798220 (= lt!356276 (seekEntryOrOpen!0 (select (arr!20776 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798221 () Bool)

(assert (=> b!798221 (= e!442790 (not (or (not (= lt!356279 lt!356278)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(assert (=> b!798221 (= lt!356279 (Found!8367 index!1236))))

(declare-fun b!798222 () Bool)

(declare-fun res!542733 () Bool)

(assert (=> b!798222 (=> (not res!542733) (not e!442787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43392 (_ BitVec 32)) Bool)

(assert (=> b!798222 (= res!542733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798223 () Bool)

(declare-fun res!542743 () Bool)

(assert (=> b!798223 (=> (not res!542743) (not e!442788))))

(assert (=> b!798223 (= res!542743 (validKeyInArray!0 (select (arr!20776 a!3170) j!153)))))

(declare-fun b!798224 () Bool)

(declare-fun res!542734 () Bool)

(assert (=> b!798224 (=> (not res!542734) (not e!442788))))

(declare-fun arrayContainsKey!0 (array!43392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798224 (= res!542734 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798225 () Bool)

(declare-fun res!542737 () Bool)

(assert (=> b!798225 (=> (not res!542737) (not e!442788))))

(assert (=> b!798225 (= res!542737 (and (= (size!21197 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21197 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21197 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798219 () Bool)

(declare-fun res!542741 () Bool)

(assert (=> b!798219 (=> (not res!542741) (not e!442787))))

(declare-datatypes ((List!14739 0))(
  ( (Nil!14736) (Cons!14735 (h!15864 (_ BitVec 64)) (t!21054 List!14739)) )
))
(declare-fun arrayNoDuplicates!0 (array!43392 (_ BitVec 32) List!14739) Bool)

(assert (=> b!798219 (= res!542741 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14736))))

(declare-fun res!542735 () Bool)

(assert (=> start!68602 (=> (not res!542735) (not e!442788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68602 (= res!542735 (validMask!0 mask!3266))))

(assert (=> start!68602 e!442788))

(assert (=> start!68602 true))

(declare-fun array_inv!16572 (array!43392) Bool)

(assert (=> start!68602 (array_inv!16572 a!3170)))

(assert (= (and start!68602 res!542735) b!798225))

(assert (= (and b!798225 res!542737) b!798223))

(assert (= (and b!798223 res!542743) b!798214))

(assert (= (and b!798214 res!542739) b!798224))

(assert (= (and b!798224 res!542734) b!798215))

(assert (= (and b!798215 res!542742) b!798222))

(assert (= (and b!798222 res!542733) b!798219))

(assert (= (and b!798219 res!542741) b!798216))

(assert (= (and b!798216 res!542738) b!798218))

(assert (= (and b!798218 res!542736) b!798220))

(assert (= (and b!798220 res!542744) b!798217))

(assert (= (and b!798217 res!542740) b!798221))

(declare-fun m!739103 () Bool)

(assert (=> b!798217 m!739103))

(declare-fun m!739105 () Bool)

(assert (=> b!798217 m!739105))

(declare-fun m!739107 () Bool)

(assert (=> b!798222 m!739107))

(declare-fun m!739109 () Bool)

(assert (=> b!798218 m!739109))

(declare-fun m!739111 () Bool)

(assert (=> b!798218 m!739111))

(declare-fun m!739113 () Bool)

(assert (=> b!798218 m!739113))

(declare-fun m!739115 () Bool)

(assert (=> b!798218 m!739115))

(declare-fun m!739117 () Bool)

(assert (=> b!798215 m!739117))

(declare-fun m!739119 () Bool)

(assert (=> b!798219 m!739119))

(declare-fun m!739121 () Bool)

(assert (=> b!798216 m!739121))

(declare-fun m!739123 () Bool)

(assert (=> b!798216 m!739123))

(declare-fun m!739125 () Bool)

(assert (=> b!798224 m!739125))

(assert (=> b!798220 m!739105))

(assert (=> b!798220 m!739105))

(declare-fun m!739127 () Bool)

(assert (=> b!798220 m!739127))

(assert (=> b!798220 m!739105))

(declare-fun m!739129 () Bool)

(assert (=> b!798220 m!739129))

(assert (=> b!798223 m!739105))

(assert (=> b!798223 m!739105))

(declare-fun m!739131 () Bool)

(assert (=> b!798223 m!739131))

(declare-fun m!739133 () Bool)

(assert (=> b!798214 m!739133))

(declare-fun m!739135 () Bool)

(assert (=> start!68602 m!739135))

(declare-fun m!739137 () Bool)

(assert (=> start!68602 m!739137))

(check-sat (not b!798224) (not b!798215) (not b!798219) (not start!68602) (not b!798220) (not b!798222) (not b!798223) (not b!798218) (not b!798214))
(check-sat)
