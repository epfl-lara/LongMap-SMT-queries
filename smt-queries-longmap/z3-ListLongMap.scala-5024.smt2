; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68656 () Bool)

(assert start!68656)

(declare-fun b!799119 () Bool)

(declare-fun e!443185 () Bool)

(declare-fun e!443182 () Bool)

(assert (=> b!799119 (= e!443185 e!443182)))

(declare-fun res!543648 () Bool)

(assert (=> b!799119 (=> (not res!543648) (not e!443182))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43446 0))(
  ( (array!43447 (arr!20803 (Array (_ BitVec 32) (_ BitVec 64))) (size!21224 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43446)

(declare-fun lt!356796 () (_ BitVec 32))

(assert (=> b!799119 (= res!543648 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356796 #b00000000000000000000000000000000) (bvslt lt!356796 (size!21224 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799119 (= lt!356796 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799120 () Bool)

(declare-fun e!443181 () Bool)

(declare-fun e!443186 () Bool)

(assert (=> b!799120 (= e!443181 e!443186)))

(declare-fun res!543645 () Bool)

(assert (=> b!799120 (=> (not res!543645) (not e!443186))))

(declare-datatypes ((SeekEntryResult!8394 0))(
  ( (MissingZero!8394 (index!35944 (_ BitVec 32))) (Found!8394 (index!35945 (_ BitVec 32))) (Intermediate!8394 (undefined!9206 Bool) (index!35946 (_ BitVec 32)) (x!66824 (_ BitVec 32))) (Undefined!8394) (MissingVacant!8394 (index!35947 (_ BitVec 32))) )
))
(declare-fun lt!356799 () SeekEntryResult!8394)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799120 (= res!543645 (or (= lt!356799 (MissingZero!8394 i!1163)) (= lt!356799 (MissingVacant!8394 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43446 (_ BitVec 32)) SeekEntryResult!8394)

(assert (=> b!799120 (= lt!356799 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799121 () Bool)

(declare-fun res!543650 () Bool)

(assert (=> b!799121 (=> (not res!543650) (not e!443186))))

(declare-datatypes ((List!14766 0))(
  ( (Nil!14763) (Cons!14762 (h!15891 (_ BitVec 64)) (t!21081 List!14766)) )
))
(declare-fun arrayNoDuplicates!0 (array!43446 (_ BitVec 32) List!14766) Bool)

(assert (=> b!799121 (= res!543650 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14763))))

(declare-fun b!799122 () Bool)

(declare-fun res!543646 () Bool)

(assert (=> b!799122 (=> (not res!543646) (not e!443181))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799122 (= res!543646 (validKeyInArray!0 (select (arr!20803 a!3170) j!153)))))

(declare-fun b!799123 () Bool)

(declare-fun res!543639 () Bool)

(assert (=> b!799123 (=> (not res!543639) (not e!443186))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799123 (= res!543639 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21224 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20803 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21224 a!3170)) (= (select (arr!20803 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!543642 () Bool)

(assert (=> start!68656 (=> (not res!543642) (not e!443181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68656 (= res!543642 (validMask!0 mask!3266))))

(assert (=> start!68656 e!443181))

(assert (=> start!68656 true))

(declare-fun array_inv!16599 (array!43446) Bool)

(assert (=> start!68656 (array_inv!16599 a!3170)))

(declare-fun b!799124 () Bool)

(declare-fun e!443183 () Bool)

(assert (=> b!799124 (= e!443186 e!443183)))

(declare-fun res!543644 () Bool)

(assert (=> b!799124 (=> (not res!543644) (not e!443183))))

(declare-fun lt!356797 () (_ BitVec 64))

(declare-fun lt!356798 () array!43446)

(declare-fun lt!356794 () SeekEntryResult!8394)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43446 (_ BitVec 32)) SeekEntryResult!8394)

(assert (=> b!799124 (= res!543644 (= lt!356794 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356797 lt!356798 mask!3266)))))

(assert (=> b!799124 (= lt!356794 (seekEntryOrOpen!0 lt!356797 lt!356798 mask!3266))))

(assert (=> b!799124 (= lt!356797 (select (store (arr!20803 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799124 (= lt!356798 (array!43447 (store (arr!20803 a!3170) i!1163 k0!2044) (size!21224 a!3170)))))

(declare-fun b!799125 () Bool)

(assert (=> b!799125 (= e!443183 e!443185)))

(declare-fun res!543640 () Bool)

(assert (=> b!799125 (=> (not res!543640) (not e!443185))))

(declare-fun lt!356795 () SeekEntryResult!8394)

(declare-fun lt!356800 () SeekEntryResult!8394)

(assert (=> b!799125 (= res!543640 (and (= lt!356800 lt!356795) (= lt!356795 (Found!8394 j!153)) (not (= (select (arr!20803 a!3170) index!1236) (select (arr!20803 a!3170) j!153)))))))

(assert (=> b!799125 (= lt!356795 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20803 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799125 (= lt!356800 (seekEntryOrOpen!0 (select (arr!20803 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799126 () Bool)

(declare-fun res!543649 () Bool)

(assert (=> b!799126 (=> (not res!543649) (not e!443186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43446 (_ BitVec 32)) Bool)

(assert (=> b!799126 (= res!543649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799127 () Bool)

(declare-fun res!543641 () Bool)

(assert (=> b!799127 (=> (not res!543641) (not e!443181))))

(assert (=> b!799127 (= res!543641 (validKeyInArray!0 k0!2044))))

(declare-fun b!799128 () Bool)

(declare-fun res!543647 () Bool)

(assert (=> b!799128 (=> (not res!543647) (not e!443182))))

(assert (=> b!799128 (= res!543647 (= lt!356794 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356796 vacantAfter!23 lt!356797 lt!356798 mask!3266)))))

(declare-fun b!799129 () Bool)

(assert (=> b!799129 (= e!443182 false)))

(declare-fun lt!356801 () SeekEntryResult!8394)

(assert (=> b!799129 (= lt!356801 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356796 vacantBefore!23 (select (arr!20803 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799130 () Bool)

(declare-fun res!543643 () Bool)

(assert (=> b!799130 (=> (not res!543643) (not e!443181))))

(assert (=> b!799130 (= res!543643 (and (= (size!21224 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21224 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21224 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799131 () Bool)

(declare-fun res!543638 () Bool)

(assert (=> b!799131 (=> (not res!543638) (not e!443181))))

(declare-fun arrayContainsKey!0 (array!43446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799131 (= res!543638 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68656 res!543642) b!799130))

(assert (= (and b!799130 res!543643) b!799122))

(assert (= (and b!799122 res!543646) b!799127))

(assert (= (and b!799127 res!543641) b!799131))

(assert (= (and b!799131 res!543638) b!799120))

(assert (= (and b!799120 res!543645) b!799126))

(assert (= (and b!799126 res!543649) b!799121))

(assert (= (and b!799121 res!543650) b!799123))

(assert (= (and b!799123 res!543639) b!799124))

(assert (= (and b!799124 res!543644) b!799125))

(assert (= (and b!799125 res!543640) b!799119))

(assert (= (and b!799119 res!543648) b!799128))

(assert (= (and b!799128 res!543647) b!799129))

(declare-fun m!740105 () Bool)

(assert (=> b!799122 m!740105))

(assert (=> b!799122 m!740105))

(declare-fun m!740107 () Bool)

(assert (=> b!799122 m!740107))

(declare-fun m!740109 () Bool)

(assert (=> b!799119 m!740109))

(declare-fun m!740111 () Bool)

(assert (=> start!68656 m!740111))

(declare-fun m!740113 () Bool)

(assert (=> start!68656 m!740113))

(declare-fun m!740115 () Bool)

(assert (=> b!799125 m!740115))

(assert (=> b!799125 m!740105))

(assert (=> b!799125 m!740105))

(declare-fun m!740117 () Bool)

(assert (=> b!799125 m!740117))

(assert (=> b!799125 m!740105))

(declare-fun m!740119 () Bool)

(assert (=> b!799125 m!740119))

(declare-fun m!740121 () Bool)

(assert (=> b!799131 m!740121))

(declare-fun m!740123 () Bool)

(assert (=> b!799126 m!740123))

(declare-fun m!740125 () Bool)

(assert (=> b!799127 m!740125))

(declare-fun m!740127 () Bool)

(assert (=> b!799128 m!740127))

(declare-fun m!740129 () Bool)

(assert (=> b!799121 m!740129))

(assert (=> b!799129 m!740105))

(assert (=> b!799129 m!740105))

(declare-fun m!740131 () Bool)

(assert (=> b!799129 m!740131))

(declare-fun m!740133 () Bool)

(assert (=> b!799120 m!740133))

(declare-fun m!740135 () Bool)

(assert (=> b!799123 m!740135))

(declare-fun m!740137 () Bool)

(assert (=> b!799123 m!740137))

(declare-fun m!740139 () Bool)

(assert (=> b!799124 m!740139))

(declare-fun m!740141 () Bool)

(assert (=> b!799124 m!740141))

(declare-fun m!740143 () Bool)

(assert (=> b!799124 m!740143))

(declare-fun m!740145 () Bool)

(assert (=> b!799124 m!740145))

(check-sat (not b!799131) (not b!799127) (not b!799119) (not b!799121) (not b!799128) (not b!799126) (not start!68656) (not b!799124) (not b!799129) (not b!799120) (not b!799125) (not b!799122))
(check-sat)
