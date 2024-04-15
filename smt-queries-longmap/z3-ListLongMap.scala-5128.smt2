; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69630 () Bool)

(assert start!69630)

(declare-fun b!811255 () Bool)

(declare-fun e!448995 () Bool)

(declare-fun e!448994 () Bool)

(assert (=> b!811255 (= e!448995 e!448994)))

(declare-fun res!554448 () Bool)

(assert (=> b!811255 (=> (not res!554448) (not e!448994))))

(declare-datatypes ((array!44086 0))(
  ( (array!44087 (arr!21113 (Array (_ BitVec 32) (_ BitVec 64))) (size!21534 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44086)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8701 0))(
  ( (MissingZero!8701 (index!37175 (_ BitVec 32))) (Found!8701 (index!37176 (_ BitVec 32))) (Intermediate!8701 (undefined!9513 Bool) (index!37177 (_ BitVec 32)) (x!67997 (_ BitVec 32))) (Undefined!8701) (MissingVacant!8701 (index!37178 (_ BitVec 32))) )
))
(declare-fun lt!363616 () SeekEntryResult!8701)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363612 () SeekEntryResult!8701)

(assert (=> b!811255 (= res!554448 (and (= lt!363616 lt!363612) (= lt!363612 (Found!8701 j!153)) (not (= (select (arr!21113 a!3170) index!1236) (select (arr!21113 a!3170) j!153)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44086 (_ BitVec 32)) SeekEntryResult!8701)

(assert (=> b!811255 (= lt!363612 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21113 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44086 (_ BitVec 32)) SeekEntryResult!8701)

(assert (=> b!811255 (= lt!363616 (seekEntryOrOpen!0 (select (arr!21113 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811256 () Bool)

(assert (=> b!811256 (= e!448994 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363615 () (_ BitVec 64))

(declare-fun lt!363614 () (_ BitVec 32))

(declare-fun lt!363613 () array!44086)

(assert (=> b!811256 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363614 vacantAfter!23 lt!363615 lt!363613 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363614 vacantBefore!23 (select (arr!21113 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27630 0))(
  ( (Unit!27631) )
))
(declare-fun lt!363611 () Unit!27630)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44086 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27630)

(assert (=> b!811256 (= lt!363611 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363614 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811256 (= lt!363614 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!554439 () Bool)

(declare-fun e!448996 () Bool)

(assert (=> start!69630 (=> (not res!554439) (not e!448996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69630 (= res!554439 (validMask!0 mask!3266))))

(assert (=> start!69630 e!448996))

(assert (=> start!69630 true))

(declare-fun array_inv!16996 (array!44086) Bool)

(assert (=> start!69630 (array_inv!16996 a!3170)))

(declare-fun b!811257 () Bool)

(declare-fun res!554440 () Bool)

(declare-fun e!448993 () Bool)

(assert (=> b!811257 (=> (not res!554440) (not e!448993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44086 (_ BitVec 32)) Bool)

(assert (=> b!811257 (= res!554440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811258 () Bool)

(assert (=> b!811258 (= e!448996 e!448993)))

(declare-fun res!554445 () Bool)

(assert (=> b!811258 (=> (not res!554445) (not e!448993))))

(declare-fun lt!363617 () SeekEntryResult!8701)

(assert (=> b!811258 (= res!554445 (or (= lt!363617 (MissingZero!8701 i!1163)) (= lt!363617 (MissingVacant!8701 i!1163))))))

(assert (=> b!811258 (= lt!363617 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811259 () Bool)

(declare-fun res!554442 () Bool)

(assert (=> b!811259 (=> (not res!554442) (not e!448996))))

(declare-fun arrayContainsKey!0 (array!44086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811259 (= res!554442 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811260 () Bool)

(declare-fun res!554447 () Bool)

(assert (=> b!811260 (=> (not res!554447) (not e!448993))))

(declare-datatypes ((List!15115 0))(
  ( (Nil!15112) (Cons!15111 (h!16240 (_ BitVec 64)) (t!21421 List!15115)) )
))
(declare-fun arrayNoDuplicates!0 (array!44086 (_ BitVec 32) List!15115) Bool)

(assert (=> b!811260 (= res!554447 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15112))))

(declare-fun b!811261 () Bool)

(declare-fun res!554443 () Bool)

(assert (=> b!811261 (=> (not res!554443) (not e!448996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811261 (= res!554443 (validKeyInArray!0 k0!2044))))

(declare-fun b!811262 () Bool)

(declare-fun res!554438 () Bool)

(assert (=> b!811262 (=> (not res!554438) (not e!448993))))

(assert (=> b!811262 (= res!554438 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21534 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21113 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21534 a!3170)) (= (select (arr!21113 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811263 () Bool)

(assert (=> b!811263 (= e!448993 e!448995)))

(declare-fun res!554446 () Bool)

(assert (=> b!811263 (=> (not res!554446) (not e!448995))))

(assert (=> b!811263 (= res!554446 (= (seekEntryOrOpen!0 lt!363615 lt!363613 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363615 lt!363613 mask!3266)))))

(assert (=> b!811263 (= lt!363615 (select (store (arr!21113 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811263 (= lt!363613 (array!44087 (store (arr!21113 a!3170) i!1163 k0!2044) (size!21534 a!3170)))))

(declare-fun b!811264 () Bool)

(declare-fun res!554441 () Bool)

(assert (=> b!811264 (=> (not res!554441) (not e!448996))))

(assert (=> b!811264 (= res!554441 (validKeyInArray!0 (select (arr!21113 a!3170) j!153)))))

(declare-fun b!811265 () Bool)

(declare-fun res!554444 () Bool)

(assert (=> b!811265 (=> (not res!554444) (not e!448996))))

(assert (=> b!811265 (= res!554444 (and (= (size!21534 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21534 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21534 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69630 res!554439) b!811265))

(assert (= (and b!811265 res!554444) b!811264))

(assert (= (and b!811264 res!554441) b!811261))

(assert (= (and b!811261 res!554443) b!811259))

(assert (= (and b!811259 res!554442) b!811258))

(assert (= (and b!811258 res!554445) b!811257))

(assert (= (and b!811257 res!554440) b!811260))

(assert (= (and b!811260 res!554447) b!811262))

(assert (= (and b!811262 res!554438) b!811263))

(assert (= (and b!811263 res!554446) b!811255))

(assert (= (and b!811255 res!554448) b!811256))

(declare-fun m!753133 () Bool)

(assert (=> b!811262 m!753133))

(declare-fun m!753135 () Bool)

(assert (=> b!811262 m!753135))

(declare-fun m!753137 () Bool)

(assert (=> start!69630 m!753137))

(declare-fun m!753139 () Bool)

(assert (=> start!69630 m!753139))

(declare-fun m!753141 () Bool)

(assert (=> b!811259 m!753141))

(declare-fun m!753143 () Bool)

(assert (=> b!811255 m!753143))

(declare-fun m!753145 () Bool)

(assert (=> b!811255 m!753145))

(assert (=> b!811255 m!753145))

(declare-fun m!753147 () Bool)

(assert (=> b!811255 m!753147))

(assert (=> b!811255 m!753145))

(declare-fun m!753149 () Bool)

(assert (=> b!811255 m!753149))

(declare-fun m!753151 () Bool)

(assert (=> b!811260 m!753151))

(declare-fun m!753153 () Bool)

(assert (=> b!811263 m!753153))

(declare-fun m!753155 () Bool)

(assert (=> b!811263 m!753155))

(declare-fun m!753157 () Bool)

(assert (=> b!811263 m!753157))

(declare-fun m!753159 () Bool)

(assert (=> b!811263 m!753159))

(declare-fun m!753161 () Bool)

(assert (=> b!811258 m!753161))

(declare-fun m!753163 () Bool)

(assert (=> b!811261 m!753163))

(assert (=> b!811256 m!753145))

(declare-fun m!753165 () Bool)

(assert (=> b!811256 m!753165))

(declare-fun m!753167 () Bool)

(assert (=> b!811256 m!753167))

(declare-fun m!753169 () Bool)

(assert (=> b!811256 m!753169))

(assert (=> b!811256 m!753145))

(declare-fun m!753171 () Bool)

(assert (=> b!811256 m!753171))

(declare-fun m!753173 () Bool)

(assert (=> b!811257 m!753173))

(assert (=> b!811264 m!753145))

(assert (=> b!811264 m!753145))

(declare-fun m!753175 () Bool)

(assert (=> b!811264 m!753175))

(check-sat (not b!811256) (not b!811257) (not b!811261) (not start!69630) (not b!811264) (not b!811258) (not b!811255) (not b!811263) (not b!811260) (not b!811259))
(check-sat)
