; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68818 () Bool)

(assert start!68818)

(declare-fun b!802178 () Bool)

(declare-fun res!546700 () Bool)

(declare-fun e!444593 () Bool)

(assert (=> b!802178 (=> (not res!546700) (not e!444593))))

(declare-datatypes ((array!43608 0))(
  ( (array!43609 (arr!20884 (Array (_ BitVec 32) (_ BitVec 64))) (size!21305 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43608)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802178 (= res!546700 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802179 () Bool)

(declare-fun e!444591 () Bool)

(declare-fun e!444590 () Bool)

(assert (=> b!802179 (= e!444591 e!444590)))

(declare-fun res!546703 () Bool)

(assert (=> b!802179 (=> (not res!546703) (not e!444590))))

(declare-datatypes ((SeekEntryResult!8475 0))(
  ( (MissingZero!8475 (index!36268 (_ BitVec 32))) (Found!8475 (index!36269 (_ BitVec 32))) (Intermediate!8475 (undefined!9287 Bool) (index!36270 (_ BitVec 32)) (x!67121 (_ BitVec 32))) (Undefined!8475) (MissingVacant!8475 (index!36271 (_ BitVec 32))) )
))
(declare-fun lt!358689 () SeekEntryResult!8475)

(declare-fun lt!358688 () SeekEntryResult!8475)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802179 (= res!546703 (and (= lt!358689 lt!358688) (= lt!358688 (Found!8475 j!153)) (not (= (select (arr!20884 a!3170) index!1236) (select (arr!20884 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43608 (_ BitVec 32)) SeekEntryResult!8475)

(assert (=> b!802179 (= lt!358688 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20884 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43608 (_ BitVec 32)) SeekEntryResult!8475)

(assert (=> b!802179 (= lt!358689 (seekEntryOrOpen!0 (select (arr!20884 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802180 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!802180 (= e!444590 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!358690 () (_ BitVec 32))

(declare-fun lt!358691 () (_ BitVec 64))

(declare-fun lt!358694 () array!43608)

(assert (=> b!802180 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358690 vacantAfter!23 lt!358691 lt!358694 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358690 vacantBefore!23 (select (arr!20884 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27490 0))(
  ( (Unit!27491) )
))
(declare-fun lt!358692 () Unit!27490)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43608 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27490)

(assert (=> b!802180 (= lt!358692 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358690 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802180 (= lt!358690 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802181 () Bool)

(declare-fun res!546699 () Bool)

(assert (=> b!802181 (=> (not res!546699) (not e!444593))))

(assert (=> b!802181 (= res!546699 (and (= (size!21305 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21305 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21305 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802182 () Bool)

(declare-fun res!546707 () Bool)

(assert (=> b!802182 (=> (not res!546707) (not e!444593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802182 (= res!546707 (validKeyInArray!0 k0!2044))))

(declare-fun res!546697 () Bool)

(assert (=> start!68818 (=> (not res!546697) (not e!444593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68818 (= res!546697 (validMask!0 mask!3266))))

(assert (=> start!68818 e!444593))

(assert (=> start!68818 true))

(declare-fun array_inv!16680 (array!43608) Bool)

(assert (=> start!68818 (array_inv!16680 a!3170)))

(declare-fun b!802183 () Bool)

(declare-fun res!546705 () Bool)

(declare-fun e!444592 () Bool)

(assert (=> b!802183 (=> (not res!546705) (not e!444592))))

(assert (=> b!802183 (= res!546705 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21305 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20884 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21305 a!3170)) (= (select (arr!20884 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802184 () Bool)

(declare-fun res!546701 () Bool)

(assert (=> b!802184 (=> (not res!546701) (not e!444593))))

(assert (=> b!802184 (= res!546701 (validKeyInArray!0 (select (arr!20884 a!3170) j!153)))))

(declare-fun b!802185 () Bool)

(assert (=> b!802185 (= e!444593 e!444592)))

(declare-fun res!546704 () Bool)

(assert (=> b!802185 (=> (not res!546704) (not e!444592))))

(declare-fun lt!358693 () SeekEntryResult!8475)

(assert (=> b!802185 (= res!546704 (or (= lt!358693 (MissingZero!8475 i!1163)) (= lt!358693 (MissingVacant!8475 i!1163))))))

(assert (=> b!802185 (= lt!358693 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802186 () Bool)

(declare-fun res!546706 () Bool)

(assert (=> b!802186 (=> (not res!546706) (not e!444592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43608 (_ BitVec 32)) Bool)

(assert (=> b!802186 (= res!546706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802187 () Bool)

(declare-fun res!546702 () Bool)

(assert (=> b!802187 (=> (not res!546702) (not e!444592))))

(declare-datatypes ((List!14847 0))(
  ( (Nil!14844) (Cons!14843 (h!15972 (_ BitVec 64)) (t!21162 List!14847)) )
))
(declare-fun arrayNoDuplicates!0 (array!43608 (_ BitVec 32) List!14847) Bool)

(assert (=> b!802187 (= res!546702 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14844))))

(declare-fun b!802188 () Bool)

(assert (=> b!802188 (= e!444592 e!444591)))

(declare-fun res!546698 () Bool)

(assert (=> b!802188 (=> (not res!546698) (not e!444591))))

(assert (=> b!802188 (= res!546698 (= (seekEntryOrOpen!0 lt!358691 lt!358694 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358691 lt!358694 mask!3266)))))

(assert (=> b!802188 (= lt!358691 (select (store (arr!20884 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802188 (= lt!358694 (array!43609 (store (arr!20884 a!3170) i!1163 k0!2044) (size!21305 a!3170)))))

(assert (= (and start!68818 res!546697) b!802181))

(assert (= (and b!802181 res!546699) b!802184))

(assert (= (and b!802184 res!546701) b!802182))

(assert (= (and b!802182 res!546707) b!802178))

(assert (= (and b!802178 res!546700) b!802185))

(assert (= (and b!802185 res!546704) b!802186))

(assert (= (and b!802186 res!546706) b!802187))

(assert (= (and b!802187 res!546702) b!802183))

(assert (= (and b!802183 res!546705) b!802188))

(assert (= (and b!802188 res!546698) b!802179))

(assert (= (and b!802179 res!546703) b!802180))

(declare-fun m!743539 () Bool)

(assert (=> b!802188 m!743539))

(declare-fun m!743541 () Bool)

(assert (=> b!802188 m!743541))

(declare-fun m!743543 () Bool)

(assert (=> b!802188 m!743543))

(declare-fun m!743545 () Bool)

(assert (=> b!802188 m!743545))

(declare-fun m!743547 () Bool)

(assert (=> b!802179 m!743547))

(declare-fun m!743549 () Bool)

(assert (=> b!802179 m!743549))

(assert (=> b!802179 m!743549))

(declare-fun m!743551 () Bool)

(assert (=> b!802179 m!743551))

(assert (=> b!802179 m!743549))

(declare-fun m!743553 () Bool)

(assert (=> b!802179 m!743553))

(declare-fun m!743555 () Bool)

(assert (=> b!802182 m!743555))

(declare-fun m!743557 () Bool)

(assert (=> b!802186 m!743557))

(assert (=> b!802180 m!743549))

(declare-fun m!743559 () Bool)

(assert (=> b!802180 m!743559))

(declare-fun m!743561 () Bool)

(assert (=> b!802180 m!743561))

(declare-fun m!743563 () Bool)

(assert (=> b!802180 m!743563))

(assert (=> b!802180 m!743549))

(declare-fun m!743565 () Bool)

(assert (=> b!802180 m!743565))

(declare-fun m!743567 () Bool)

(assert (=> b!802185 m!743567))

(declare-fun m!743569 () Bool)

(assert (=> b!802187 m!743569))

(declare-fun m!743571 () Bool)

(assert (=> start!68818 m!743571))

(declare-fun m!743573 () Bool)

(assert (=> start!68818 m!743573))

(declare-fun m!743575 () Bool)

(assert (=> b!802183 m!743575))

(declare-fun m!743577 () Bool)

(assert (=> b!802183 m!743577))

(declare-fun m!743579 () Bool)

(assert (=> b!802178 m!743579))

(assert (=> b!802184 m!743549))

(assert (=> b!802184 m!743549))

(declare-fun m!743581 () Bool)

(assert (=> b!802184 m!743581))

(check-sat (not b!802182) (not start!68818) (not b!802185) (not b!802186) (not b!802187) (not b!802188) (not b!802178) (not b!802179) (not b!802180) (not b!802184))
(check-sat)
