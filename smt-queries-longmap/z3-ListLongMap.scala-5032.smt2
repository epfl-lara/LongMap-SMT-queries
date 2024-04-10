; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68704 () Bool)

(assert start!68704)

(declare-fun b!800055 () Bool)

(declare-fun res!544584 () Bool)

(declare-fun e!443614 () Bool)

(assert (=> b!800055 (=> (not res!544584) (not e!443614))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357371 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357375 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43494 0))(
  ( (array!43495 (arr!20827 (Array (_ BitVec 32) (_ BitVec 64))) (size!21248 (_ BitVec 32))) )
))
(declare-fun lt!357376 () array!43494)

(declare-datatypes ((SeekEntryResult!8418 0))(
  ( (MissingZero!8418 (index!36040 (_ BitVec 32))) (Found!8418 (index!36041 (_ BitVec 32))) (Intermediate!8418 (undefined!9230 Bool) (index!36042 (_ BitVec 32)) (x!66912 (_ BitVec 32))) (Undefined!8418) (MissingVacant!8418 (index!36043 (_ BitVec 32))) )
))
(declare-fun lt!357374 () SeekEntryResult!8418)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43494 (_ BitVec 32)) SeekEntryResult!8418)

(assert (=> b!800055 (= res!544584 (= lt!357374 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357375 vacantAfter!23 lt!357371 lt!357376 mask!3266)))))

(declare-fun b!800056 () Bool)

(declare-fun e!443616 () Bool)

(declare-fun e!443615 () Bool)

(assert (=> b!800056 (= e!443616 e!443615)))

(declare-fun res!544586 () Bool)

(assert (=> b!800056 (=> (not res!544586) (not e!443615))))

(declare-fun lt!357373 () SeekEntryResult!8418)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800056 (= res!544586 (or (= lt!357373 (MissingZero!8418 i!1163)) (= lt!357373 (MissingVacant!8418 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun a!3170 () array!43494)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43494 (_ BitVec 32)) SeekEntryResult!8418)

(assert (=> b!800056 (= lt!357373 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800057 () Bool)

(declare-fun res!544577 () Bool)

(assert (=> b!800057 (=> (not res!544577) (not e!443615))))

(declare-datatypes ((List!14790 0))(
  ( (Nil!14787) (Cons!14786 (h!15915 (_ BitVec 64)) (t!21105 List!14790)) )
))
(declare-fun arrayNoDuplicates!0 (array!43494 (_ BitVec 32) List!14790) Bool)

(assert (=> b!800057 (= res!544577 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14787))))

(declare-fun b!800058 () Bool)

(declare-fun res!544581 () Bool)

(assert (=> b!800058 (=> (not res!544581) (not e!443615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43494 (_ BitVec 32)) Bool)

(assert (=> b!800058 (= res!544581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800059 () Bool)

(declare-fun e!443618 () Bool)

(assert (=> b!800059 (= e!443618 e!443614)))

(declare-fun res!544585 () Bool)

(assert (=> b!800059 (=> (not res!544585) (not e!443614))))

(assert (=> b!800059 (= res!544585 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357375 #b00000000000000000000000000000000) (bvslt lt!357375 (size!21248 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800059 (= lt!357375 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800060 () Bool)

(declare-fun res!544574 () Bool)

(assert (=> b!800060 (=> (not res!544574) (not e!443615))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800060 (= res!544574 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21248 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20827 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21248 a!3170)) (= (select (arr!20827 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800061 () Bool)

(declare-fun res!544583 () Bool)

(assert (=> b!800061 (=> (not res!544583) (not e!443616))))

(declare-fun arrayContainsKey!0 (array!43494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800061 (= res!544583 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800062 () Bool)

(assert (=> b!800062 (= e!443614 false)))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357370 () SeekEntryResult!8418)

(assert (=> b!800062 (= lt!357370 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357375 vacantBefore!23 (select (arr!20827 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800063 () Bool)

(declare-fun e!443613 () Bool)

(assert (=> b!800063 (= e!443615 e!443613)))

(declare-fun res!544578 () Bool)

(assert (=> b!800063 (=> (not res!544578) (not e!443613))))

(assert (=> b!800063 (= res!544578 (= lt!357374 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357371 lt!357376 mask!3266)))))

(assert (=> b!800063 (= lt!357374 (seekEntryOrOpen!0 lt!357371 lt!357376 mask!3266))))

(assert (=> b!800063 (= lt!357371 (select (store (arr!20827 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800063 (= lt!357376 (array!43495 (store (arr!20827 a!3170) i!1163 k0!2044) (size!21248 a!3170)))))

(declare-fun res!544582 () Bool)

(assert (=> start!68704 (=> (not res!544582) (not e!443616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68704 (= res!544582 (validMask!0 mask!3266))))

(assert (=> start!68704 e!443616))

(assert (=> start!68704 true))

(declare-fun array_inv!16623 (array!43494) Bool)

(assert (=> start!68704 (array_inv!16623 a!3170)))

(declare-fun b!800064 () Bool)

(assert (=> b!800064 (= e!443613 e!443618)))

(declare-fun res!544579 () Bool)

(assert (=> b!800064 (=> (not res!544579) (not e!443618))))

(declare-fun lt!357377 () SeekEntryResult!8418)

(declare-fun lt!357372 () SeekEntryResult!8418)

(assert (=> b!800064 (= res!544579 (and (= lt!357377 lt!357372) (= lt!357372 (Found!8418 j!153)) (not (= (select (arr!20827 a!3170) index!1236) (select (arr!20827 a!3170) j!153)))))))

(assert (=> b!800064 (= lt!357372 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20827 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800064 (= lt!357377 (seekEntryOrOpen!0 (select (arr!20827 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800065 () Bool)

(declare-fun res!544580 () Bool)

(assert (=> b!800065 (=> (not res!544580) (not e!443616))))

(assert (=> b!800065 (= res!544580 (and (= (size!21248 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21248 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21248 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800066 () Bool)

(declare-fun res!544576 () Bool)

(assert (=> b!800066 (=> (not res!544576) (not e!443616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800066 (= res!544576 (validKeyInArray!0 (select (arr!20827 a!3170) j!153)))))

(declare-fun b!800067 () Bool)

(declare-fun res!544575 () Bool)

(assert (=> b!800067 (=> (not res!544575) (not e!443616))))

(assert (=> b!800067 (= res!544575 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68704 res!544582) b!800065))

(assert (= (and b!800065 res!544580) b!800066))

(assert (= (and b!800066 res!544576) b!800067))

(assert (= (and b!800067 res!544575) b!800061))

(assert (= (and b!800061 res!544583) b!800056))

(assert (= (and b!800056 res!544586) b!800058))

(assert (= (and b!800058 res!544581) b!800057))

(assert (= (and b!800057 res!544577) b!800060))

(assert (= (and b!800060 res!544574) b!800063))

(assert (= (and b!800063 res!544578) b!800064))

(assert (= (and b!800064 res!544579) b!800059))

(assert (= (and b!800059 res!544585) b!800055))

(assert (= (and b!800055 res!544584) b!800062))

(declare-fun m!741113 () Bool)

(assert (=> b!800061 m!741113))

(declare-fun m!741115 () Bool)

(assert (=> b!800062 m!741115))

(assert (=> b!800062 m!741115))

(declare-fun m!741117 () Bool)

(assert (=> b!800062 m!741117))

(declare-fun m!741119 () Bool)

(assert (=> b!800059 m!741119))

(declare-fun m!741121 () Bool)

(assert (=> b!800057 m!741121))

(declare-fun m!741123 () Bool)

(assert (=> b!800067 m!741123))

(declare-fun m!741125 () Bool)

(assert (=> b!800064 m!741125))

(assert (=> b!800064 m!741115))

(assert (=> b!800064 m!741115))

(declare-fun m!741127 () Bool)

(assert (=> b!800064 m!741127))

(assert (=> b!800064 m!741115))

(declare-fun m!741129 () Bool)

(assert (=> b!800064 m!741129))

(declare-fun m!741131 () Bool)

(assert (=> b!800055 m!741131))

(declare-fun m!741133 () Bool)

(assert (=> start!68704 m!741133))

(declare-fun m!741135 () Bool)

(assert (=> start!68704 m!741135))

(assert (=> b!800066 m!741115))

(assert (=> b!800066 m!741115))

(declare-fun m!741137 () Bool)

(assert (=> b!800066 m!741137))

(declare-fun m!741139 () Bool)

(assert (=> b!800063 m!741139))

(declare-fun m!741141 () Bool)

(assert (=> b!800063 m!741141))

(declare-fun m!741143 () Bool)

(assert (=> b!800063 m!741143))

(declare-fun m!741145 () Bool)

(assert (=> b!800063 m!741145))

(declare-fun m!741147 () Bool)

(assert (=> b!800060 m!741147))

(declare-fun m!741149 () Bool)

(assert (=> b!800060 m!741149))

(declare-fun m!741151 () Bool)

(assert (=> b!800058 m!741151))

(declare-fun m!741153 () Bool)

(assert (=> b!800056 m!741153))

(check-sat (not b!800055) (not b!800062) (not b!800064) (not b!800056) (not b!800061) (not b!800059) (not b!800057) (not b!800063) (not b!800066) (not b!800067) (not start!68704) (not b!800058))
(check-sat)
