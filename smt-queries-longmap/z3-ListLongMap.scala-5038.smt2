; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68718 () Bool)

(assert start!68718)

(declare-fun b!800468 () Bool)

(declare-fun e!443766 () Bool)

(declare-fun e!443765 () Bool)

(assert (=> b!800468 (= e!443766 e!443765)))

(declare-fun res!545130 () Bool)

(assert (=> b!800468 (=> (not res!545130) (not e!443765))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43525 0))(
  ( (array!43526 (arr!20843 (Array (_ BitVec 32) (_ BitVec 64))) (size!21264 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43525)

(declare-fun lt!357544 () (_ BitVec 32))

(assert (=> b!800468 (= res!545130 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357544 #b00000000000000000000000000000000) (bvslt lt!357544 (size!21264 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800468 (= lt!357544 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800469 () Bool)

(declare-fun e!443769 () Bool)

(declare-fun e!443768 () Bool)

(assert (=> b!800469 (= e!443769 e!443768)))

(declare-fun res!545136 () Bool)

(assert (=> b!800469 (=> (not res!545136) (not e!443768))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8431 0))(
  ( (MissingZero!8431 (index!36092 (_ BitVec 32))) (Found!8431 (index!36093 (_ BitVec 32))) (Intermediate!8431 (undefined!9243 Bool) (index!36094 (_ BitVec 32)) (x!66968 (_ BitVec 32))) (Undefined!8431) (MissingVacant!8431 (index!36095 (_ BitVec 32))) )
))
(declare-fun lt!357542 () SeekEntryResult!8431)

(declare-fun lt!357543 () array!43525)

(declare-fun lt!357545 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43525 (_ BitVec 32)) SeekEntryResult!8431)

(assert (=> b!800469 (= res!545136 (= lt!357542 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357545 lt!357543 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43525 (_ BitVec 32)) SeekEntryResult!8431)

(assert (=> b!800469 (= lt!357542 (seekEntryOrOpen!0 lt!357545 lt!357543 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800469 (= lt!357545 (select (store (arr!20843 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800469 (= lt!357543 (array!43526 (store (arr!20843 a!3170) i!1163 k0!2044) (size!21264 a!3170)))))

(declare-fun b!800471 () Bool)

(declare-fun res!545137 () Bool)

(declare-fun e!443770 () Bool)

(assert (=> b!800471 (=> (not res!545137) (not e!443770))))

(assert (=> b!800471 (= res!545137 (and (= (size!21264 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21264 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21264 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800472 () Bool)

(declare-fun res!545134 () Bool)

(assert (=> b!800472 (=> (not res!545134) (not e!443770))))

(declare-fun arrayContainsKey!0 (array!43525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800472 (= res!545134 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800473 () Bool)

(declare-fun res!545139 () Bool)

(assert (=> b!800473 (=> (not res!545139) (not e!443770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800473 (= res!545139 (validKeyInArray!0 (select (arr!20843 a!3170) j!153)))))

(declare-fun b!800474 () Bool)

(declare-fun res!545132 () Bool)

(assert (=> b!800474 (=> (not res!545132) (not e!443765))))

(assert (=> b!800474 (= res!545132 (= lt!357542 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357544 vacantAfter!23 lt!357545 lt!357543 mask!3266)))))

(declare-fun b!800475 () Bool)

(declare-fun res!545127 () Bool)

(assert (=> b!800475 (=> (not res!545127) (not e!443769))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800475 (= res!545127 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21264 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20843 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21264 a!3170)) (= (select (arr!20843 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!545131 () Bool)

(assert (=> start!68718 (=> (not res!545131) (not e!443770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68718 (= res!545131 (validMask!0 mask!3266))))

(assert (=> start!68718 e!443770))

(assert (=> start!68718 true))

(declare-fun array_inv!16726 (array!43525) Bool)

(assert (=> start!68718 (array_inv!16726 a!3170)))

(declare-fun b!800470 () Bool)

(declare-fun res!545138 () Bool)

(assert (=> b!800470 (=> (not res!545138) (not e!443769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43525 (_ BitVec 32)) Bool)

(assert (=> b!800470 (= res!545138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800476 () Bool)

(assert (=> b!800476 (= e!443765 false)))

(declare-fun lt!357541 () SeekEntryResult!8431)

(assert (=> b!800476 (= lt!357541 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357544 vacantBefore!23 (select (arr!20843 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800477 () Bool)

(declare-fun res!545133 () Bool)

(assert (=> b!800477 (=> (not res!545133) (not e!443770))))

(assert (=> b!800477 (= res!545133 (validKeyInArray!0 k0!2044))))

(declare-fun b!800478 () Bool)

(assert (=> b!800478 (= e!443770 e!443769)))

(declare-fun res!545128 () Bool)

(assert (=> b!800478 (=> (not res!545128) (not e!443769))))

(declare-fun lt!357540 () SeekEntryResult!8431)

(assert (=> b!800478 (= res!545128 (or (= lt!357540 (MissingZero!8431 i!1163)) (= lt!357540 (MissingVacant!8431 i!1163))))))

(assert (=> b!800478 (= lt!357540 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800479 () Bool)

(declare-fun res!545135 () Bool)

(assert (=> b!800479 (=> (not res!545135) (not e!443769))))

(declare-datatypes ((List!14845 0))(
  ( (Nil!14842) (Cons!14841 (h!15970 (_ BitVec 64)) (t!21151 List!14845)) )
))
(declare-fun arrayNoDuplicates!0 (array!43525 (_ BitVec 32) List!14845) Bool)

(assert (=> b!800479 (= res!545135 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14842))))

(declare-fun b!800480 () Bool)

(assert (=> b!800480 (= e!443768 e!443766)))

(declare-fun res!545129 () Bool)

(assert (=> b!800480 (=> (not res!545129) (not e!443766))))

(declare-fun lt!357538 () SeekEntryResult!8431)

(declare-fun lt!357539 () SeekEntryResult!8431)

(assert (=> b!800480 (= res!545129 (and (= lt!357538 lt!357539) (= lt!357539 (Found!8431 j!153)) (not (= (select (arr!20843 a!3170) index!1236) (select (arr!20843 a!3170) j!153)))))))

(assert (=> b!800480 (= lt!357539 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20843 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800480 (= lt!357538 (seekEntryOrOpen!0 (select (arr!20843 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68718 res!545131) b!800471))

(assert (= (and b!800471 res!545137) b!800473))

(assert (= (and b!800473 res!545139) b!800477))

(assert (= (and b!800477 res!545133) b!800472))

(assert (= (and b!800472 res!545134) b!800478))

(assert (= (and b!800478 res!545128) b!800470))

(assert (= (and b!800470 res!545138) b!800479))

(assert (= (and b!800479 res!545135) b!800475))

(assert (= (and b!800475 res!545127) b!800469))

(assert (= (and b!800469 res!545136) b!800480))

(assert (= (and b!800480 res!545129) b!800468))

(assert (= (and b!800468 res!545130) b!800474))

(assert (= (and b!800474 res!545132) b!800476))

(declare-fun m!741085 () Bool)

(assert (=> start!68718 m!741085))

(declare-fun m!741087 () Bool)

(assert (=> start!68718 m!741087))

(declare-fun m!741089 () Bool)

(assert (=> b!800473 m!741089))

(assert (=> b!800473 m!741089))

(declare-fun m!741091 () Bool)

(assert (=> b!800473 m!741091))

(declare-fun m!741093 () Bool)

(assert (=> b!800478 m!741093))

(declare-fun m!741095 () Bool)

(assert (=> b!800468 m!741095))

(declare-fun m!741097 () Bool)

(assert (=> b!800474 m!741097))

(declare-fun m!741099 () Bool)

(assert (=> b!800470 m!741099))

(declare-fun m!741101 () Bool)

(assert (=> b!800480 m!741101))

(assert (=> b!800480 m!741089))

(assert (=> b!800480 m!741089))

(declare-fun m!741103 () Bool)

(assert (=> b!800480 m!741103))

(assert (=> b!800480 m!741089))

(declare-fun m!741105 () Bool)

(assert (=> b!800480 m!741105))

(declare-fun m!741107 () Bool)

(assert (=> b!800477 m!741107))

(declare-fun m!741109 () Bool)

(assert (=> b!800469 m!741109))

(declare-fun m!741111 () Bool)

(assert (=> b!800469 m!741111))

(declare-fun m!741113 () Bool)

(assert (=> b!800469 m!741113))

(declare-fun m!741115 () Bool)

(assert (=> b!800469 m!741115))

(declare-fun m!741117 () Bool)

(assert (=> b!800475 m!741117))

(declare-fun m!741119 () Bool)

(assert (=> b!800475 m!741119))

(declare-fun m!741121 () Bool)

(assert (=> b!800479 m!741121))

(declare-fun m!741123 () Bool)

(assert (=> b!800472 m!741123))

(assert (=> b!800476 m!741089))

(assert (=> b!800476 m!741089))

(declare-fun m!741125 () Bool)

(assert (=> b!800476 m!741125))

(check-sat (not b!800477) (not b!800470) (not b!800468) (not b!800478) (not b!800479) (not b!800480) (not b!800472) (not b!800473) (not start!68718) (not b!800474) (not b!800469) (not b!800476))
(check-sat)
