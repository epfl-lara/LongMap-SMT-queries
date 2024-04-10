; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68848 () Bool)

(assert start!68848)

(declare-fun b!802691 () Bool)

(declare-fun res!547219 () Bool)

(declare-fun e!444833 () Bool)

(assert (=> b!802691 (=> (not res!547219) (not e!444833))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43638 0))(
  ( (array!43639 (arr!20899 (Array (_ BitVec 32) (_ BitVec 64))) (size!21320 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43638)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802691 (= res!547219 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21320 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20899 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21320 a!3170)) (= (select (arr!20899 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802692 () Bool)

(declare-fun res!547210 () Bool)

(declare-fun e!444835 () Bool)

(assert (=> b!802692 (=> (not res!547210) (not e!444835))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!802692 (= res!547210 (and (= (size!21320 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21320 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21320 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802693 () Bool)

(assert (=> b!802693 (= e!444835 e!444833)))

(declare-fun res!547218 () Bool)

(assert (=> b!802693 (=> (not res!547218) (not e!444833))))

(declare-datatypes ((SeekEntryResult!8490 0))(
  ( (MissingZero!8490 (index!36328 (_ BitVec 32))) (Found!8490 (index!36329 (_ BitVec 32))) (Intermediate!8490 (undefined!9302 Bool) (index!36330 (_ BitVec 32)) (x!67176 (_ BitVec 32))) (Undefined!8490) (MissingVacant!8490 (index!36331 (_ BitVec 32))) )
))
(declare-fun lt!359031 () SeekEntryResult!8490)

(assert (=> b!802693 (= res!547218 (or (= lt!359031 (MissingZero!8490 i!1163)) (= lt!359031 (MissingVacant!8490 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43638 (_ BitVec 32)) SeekEntryResult!8490)

(assert (=> b!802693 (= lt!359031 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802694 () Bool)

(declare-fun res!547216 () Bool)

(assert (=> b!802694 (=> (not res!547216) (not e!444835))))

(declare-fun arrayContainsKey!0 (array!43638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802694 (= res!547216 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802695 () Bool)

(declare-fun res!547215 () Bool)

(assert (=> b!802695 (=> (not res!547215) (not e!444835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802695 (= res!547215 (validKeyInArray!0 (select (arr!20899 a!3170) j!153)))))

(declare-fun res!547213 () Bool)

(assert (=> start!68848 (=> (not res!547213) (not e!444835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68848 (= res!547213 (validMask!0 mask!3266))))

(assert (=> start!68848 e!444835))

(assert (=> start!68848 true))

(declare-fun array_inv!16695 (array!43638) Bool)

(assert (=> start!68848 (array_inv!16695 a!3170)))

(declare-fun b!802696 () Bool)

(declare-fun res!547217 () Bool)

(assert (=> b!802696 (=> (not res!547217) (not e!444833))))

(declare-datatypes ((List!14862 0))(
  ( (Nil!14859) (Cons!14858 (h!15987 (_ BitVec 64)) (t!21177 List!14862)) )
))
(declare-fun arrayNoDuplicates!0 (array!43638 (_ BitVec 32) List!14862) Bool)

(assert (=> b!802696 (= res!547217 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14859))))

(declare-fun b!802697 () Bool)

(declare-fun e!444836 () Bool)

(assert (=> b!802697 (= e!444836 (not true))))

(declare-fun lt!359034 () (_ BitVec 32))

(declare-fun lt!359030 () array!43638)

(declare-fun lt!359036 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43638 (_ BitVec 32)) SeekEntryResult!8490)

(assert (=> b!802697 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359034 vacantAfter!23 lt!359036 lt!359030 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359034 vacantBefore!23 (select (arr!20899 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27520 0))(
  ( (Unit!27521) )
))
(declare-fun lt!359032 () Unit!27520)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43638 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27520)

(assert (=> b!802697 (= lt!359032 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359034 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802697 (= lt!359034 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802698 () Bool)

(declare-fun e!444832 () Bool)

(assert (=> b!802698 (= e!444832 e!444836)))

(declare-fun res!547212 () Bool)

(assert (=> b!802698 (=> (not res!547212) (not e!444836))))

(declare-fun lt!359033 () SeekEntryResult!8490)

(declare-fun lt!359035 () SeekEntryResult!8490)

(assert (=> b!802698 (= res!547212 (and (= lt!359035 lt!359033) (= lt!359033 (Found!8490 j!153)) (not (= (select (arr!20899 a!3170) index!1236) (select (arr!20899 a!3170) j!153)))))))

(assert (=> b!802698 (= lt!359033 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20899 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802698 (= lt!359035 (seekEntryOrOpen!0 (select (arr!20899 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802699 () Bool)

(declare-fun res!547211 () Bool)

(assert (=> b!802699 (=> (not res!547211) (not e!444835))))

(assert (=> b!802699 (= res!547211 (validKeyInArray!0 k0!2044))))

(declare-fun b!802700 () Bool)

(assert (=> b!802700 (= e!444833 e!444832)))

(declare-fun res!547220 () Bool)

(assert (=> b!802700 (=> (not res!547220) (not e!444832))))

(assert (=> b!802700 (= res!547220 (= (seekEntryOrOpen!0 lt!359036 lt!359030 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359036 lt!359030 mask!3266)))))

(assert (=> b!802700 (= lt!359036 (select (store (arr!20899 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802700 (= lt!359030 (array!43639 (store (arr!20899 a!3170) i!1163 k0!2044) (size!21320 a!3170)))))

(declare-fun b!802701 () Bool)

(declare-fun res!547214 () Bool)

(assert (=> b!802701 (=> (not res!547214) (not e!444833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43638 (_ BitVec 32)) Bool)

(assert (=> b!802701 (= res!547214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68848 res!547213) b!802692))

(assert (= (and b!802692 res!547210) b!802695))

(assert (= (and b!802695 res!547215) b!802699))

(assert (= (and b!802699 res!547211) b!802694))

(assert (= (and b!802694 res!547216) b!802693))

(assert (= (and b!802693 res!547218) b!802701))

(assert (= (and b!802701 res!547214) b!802696))

(assert (= (and b!802696 res!547217) b!802691))

(assert (= (and b!802691 res!547219) b!802700))

(assert (= (and b!802700 res!547220) b!802698))

(assert (= (and b!802698 res!547212) b!802697))

(declare-fun m!744217 () Bool)

(assert (=> b!802698 m!744217))

(declare-fun m!744219 () Bool)

(assert (=> b!802698 m!744219))

(assert (=> b!802698 m!744219))

(declare-fun m!744221 () Bool)

(assert (=> b!802698 m!744221))

(assert (=> b!802698 m!744219))

(declare-fun m!744223 () Bool)

(assert (=> b!802698 m!744223))

(declare-fun m!744225 () Bool)

(assert (=> b!802699 m!744225))

(declare-fun m!744227 () Bool)

(assert (=> b!802694 m!744227))

(declare-fun m!744229 () Bool)

(assert (=> b!802696 m!744229))

(declare-fun m!744231 () Bool)

(assert (=> b!802701 m!744231))

(declare-fun m!744233 () Bool)

(assert (=> b!802693 m!744233))

(assert (=> b!802697 m!744219))

(assert (=> b!802697 m!744219))

(declare-fun m!744235 () Bool)

(assert (=> b!802697 m!744235))

(declare-fun m!744237 () Bool)

(assert (=> b!802697 m!744237))

(declare-fun m!744239 () Bool)

(assert (=> b!802697 m!744239))

(declare-fun m!744241 () Bool)

(assert (=> b!802697 m!744241))

(declare-fun m!744243 () Bool)

(assert (=> b!802700 m!744243))

(declare-fun m!744245 () Bool)

(assert (=> b!802700 m!744245))

(declare-fun m!744247 () Bool)

(assert (=> b!802700 m!744247))

(declare-fun m!744249 () Bool)

(assert (=> b!802700 m!744249))

(assert (=> b!802695 m!744219))

(assert (=> b!802695 m!744219))

(declare-fun m!744251 () Bool)

(assert (=> b!802695 m!744251))

(declare-fun m!744253 () Bool)

(assert (=> start!68848 m!744253))

(declare-fun m!744255 () Bool)

(assert (=> start!68848 m!744255))

(declare-fun m!744257 () Bool)

(assert (=> b!802691 m!744257))

(declare-fun m!744259 () Bool)

(assert (=> b!802691 m!744259))

(check-sat (not b!802698) (not b!802697) (not b!802701) (not b!802700) (not b!802695) (not b!802699) (not start!68848) (not b!802696) (not b!802694) (not b!802693))
(check-sat)
