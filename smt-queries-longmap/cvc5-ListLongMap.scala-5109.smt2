; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69260 () Bool)

(assert start!69260)

(declare-fun b!808130 () Bool)

(declare-fun res!552257 () Bool)

(declare-fun e!447367 () Bool)

(assert (=> b!808130 (=> (not res!552257) (not e!447367))))

(declare-datatypes ((array!43960 0))(
  ( (array!43961 (arr!21057 (Array (_ BitVec 32) (_ BitVec 64))) (size!21478 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43960)

(declare-datatypes ((List!15020 0))(
  ( (Nil!15017) (Cons!15016 (h!16145 (_ BitVec 64)) (t!21335 List!15020)) )
))
(declare-fun arrayNoDuplicates!0 (array!43960 (_ BitVec 32) List!15020) Bool)

(assert (=> b!808130 (= res!552257 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15017))))

(declare-fun b!808131 () Bool)

(declare-fun res!552258 () Bool)

(assert (=> b!808131 (=> (not res!552258) (not e!447367))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808131 (= res!552258 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21478 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21057 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21478 a!3170)) (= (select (arr!21057 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808132 () Bool)

(declare-fun res!552254 () Bool)

(declare-fun e!447364 () Bool)

(assert (=> b!808132 (=> (not res!552254) (not e!447364))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!808132 (= res!552254 (and (= (size!21478 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21478 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21478 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808133 () Bool)

(assert (=> b!808133 (= e!447364 e!447367)))

(declare-fun res!552259 () Bool)

(assert (=> b!808133 (=> (not res!552259) (not e!447367))))

(declare-datatypes ((SeekEntryResult!8648 0))(
  ( (MissingZero!8648 (index!36960 (_ BitVec 32))) (Found!8648 (index!36961 (_ BitVec 32))) (Intermediate!8648 (undefined!9460 Bool) (index!36962 (_ BitVec 32)) (x!67764 (_ BitVec 32))) (Undefined!8648) (MissingVacant!8648 (index!36963 (_ BitVec 32))) )
))
(declare-fun lt!362107 () SeekEntryResult!8648)

(assert (=> b!808133 (= res!552259 (or (= lt!362107 (MissingZero!8648 i!1163)) (= lt!362107 (MissingVacant!8648 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43960 (_ BitVec 32)) SeekEntryResult!8648)

(assert (=> b!808133 (= lt!362107 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808134 () Bool)

(declare-fun res!552262 () Bool)

(assert (=> b!808134 (=> (not res!552262) (not e!447364))))

(declare-fun arrayContainsKey!0 (array!43960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808134 (= res!552262 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808135 () Bool)

(declare-fun res!552261 () Bool)

(assert (=> b!808135 (=> (not res!552261) (not e!447364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808135 (= res!552261 (validKeyInArray!0 (select (arr!21057 a!3170) j!153)))))

(declare-fun res!552263 () Bool)

(assert (=> start!69260 (=> (not res!552263) (not e!447364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69260 (= res!552263 (validMask!0 mask!3266))))

(assert (=> start!69260 e!447364))

(assert (=> start!69260 true))

(declare-fun array_inv!16853 (array!43960) Bool)

(assert (=> start!69260 (array_inv!16853 a!3170)))

(declare-fun b!808136 () Bool)

(declare-fun res!552260 () Bool)

(assert (=> b!808136 (=> (not res!552260) (not e!447364))))

(assert (=> b!808136 (= res!552260 (validKeyInArray!0 k!2044))))

(declare-fun b!808137 () Bool)

(declare-fun e!447366 () Bool)

(assert (=> b!808137 (= e!447366 false)))

(declare-fun lt!362110 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808137 (= lt!362110 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808138 () Bool)

(declare-fun e!447368 () Bool)

(assert (=> b!808138 (= e!447368 e!447366)))

(declare-fun res!552255 () Bool)

(assert (=> b!808138 (=> (not res!552255) (not e!447366))))

(declare-fun lt!362106 () SeekEntryResult!8648)

(declare-fun lt!362108 () SeekEntryResult!8648)

(assert (=> b!808138 (= res!552255 (and (= lt!362108 lt!362106) (= lt!362106 (Found!8648 j!153)) (not (= (select (arr!21057 a!3170) index!1236) (select (arr!21057 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43960 (_ BitVec 32)) SeekEntryResult!8648)

(assert (=> b!808138 (= lt!362106 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21057 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808138 (= lt!362108 (seekEntryOrOpen!0 (select (arr!21057 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808139 () Bool)

(assert (=> b!808139 (= e!447367 e!447368)))

(declare-fun res!552253 () Bool)

(assert (=> b!808139 (=> (not res!552253) (not e!447368))))

(declare-fun lt!362111 () (_ BitVec 64))

(declare-fun lt!362109 () array!43960)

(assert (=> b!808139 (= res!552253 (= (seekEntryOrOpen!0 lt!362111 lt!362109 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362111 lt!362109 mask!3266)))))

(assert (=> b!808139 (= lt!362111 (select (store (arr!21057 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808139 (= lt!362109 (array!43961 (store (arr!21057 a!3170) i!1163 k!2044) (size!21478 a!3170)))))

(declare-fun b!808140 () Bool)

(declare-fun res!552256 () Bool)

(assert (=> b!808140 (=> (not res!552256) (not e!447367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43960 (_ BitVec 32)) Bool)

(assert (=> b!808140 (= res!552256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69260 res!552263) b!808132))

(assert (= (and b!808132 res!552254) b!808135))

(assert (= (and b!808135 res!552261) b!808136))

(assert (= (and b!808136 res!552260) b!808134))

(assert (= (and b!808134 res!552262) b!808133))

(assert (= (and b!808133 res!552259) b!808140))

(assert (= (and b!808140 res!552256) b!808130))

(assert (= (and b!808130 res!552257) b!808131))

(assert (= (and b!808131 res!552258) b!808139))

(assert (= (and b!808139 res!552253) b!808138))

(assert (= (and b!808138 res!552255) b!808137))

(declare-fun m!750269 () Bool)

(assert (=> b!808137 m!750269))

(declare-fun m!750271 () Bool)

(assert (=> b!808139 m!750271))

(declare-fun m!750273 () Bool)

(assert (=> b!808139 m!750273))

(declare-fun m!750275 () Bool)

(assert (=> b!808139 m!750275))

(declare-fun m!750277 () Bool)

(assert (=> b!808139 m!750277))

(declare-fun m!750279 () Bool)

(assert (=> b!808135 m!750279))

(assert (=> b!808135 m!750279))

(declare-fun m!750281 () Bool)

(assert (=> b!808135 m!750281))

(declare-fun m!750283 () Bool)

(assert (=> b!808131 m!750283))

(declare-fun m!750285 () Bool)

(assert (=> b!808131 m!750285))

(declare-fun m!750287 () Bool)

(assert (=> b!808138 m!750287))

(assert (=> b!808138 m!750279))

(assert (=> b!808138 m!750279))

(declare-fun m!750289 () Bool)

(assert (=> b!808138 m!750289))

(assert (=> b!808138 m!750279))

(declare-fun m!750291 () Bool)

(assert (=> b!808138 m!750291))

(declare-fun m!750293 () Bool)

(assert (=> b!808136 m!750293))

(declare-fun m!750295 () Bool)

(assert (=> start!69260 m!750295))

(declare-fun m!750297 () Bool)

(assert (=> start!69260 m!750297))

(declare-fun m!750299 () Bool)

(assert (=> b!808140 m!750299))

(declare-fun m!750301 () Bool)

(assert (=> b!808134 m!750301))

(declare-fun m!750303 () Bool)

(assert (=> b!808130 m!750303))

(declare-fun m!750305 () Bool)

(assert (=> b!808133 m!750305))

(push 1)

