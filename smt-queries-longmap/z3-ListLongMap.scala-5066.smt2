; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69074 () Bool)

(assert start!69074)

(declare-fun b!804599 () Bool)

(declare-fun e!445906 () Bool)

(assert (=> b!804599 (= e!445906 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360159 () (_ BitVec 32))

(declare-datatypes ((array!43696 0))(
  ( (array!43697 (arr!20923 (Array (_ BitVec 32) (_ BitVec 64))) (size!21343 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43696)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!360163 () array!43696)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360164 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8470 0))(
  ( (MissingZero!8470 (index!36248 (_ BitVec 32))) (Found!8470 (index!36249 (_ BitVec 32))) (Intermediate!8470 (undefined!9282 Bool) (index!36250 (_ BitVec 32)) (x!67250 (_ BitVec 32))) (Undefined!8470) (MissingVacant!8470 (index!36251 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43696 (_ BitVec 32)) SeekEntryResult!8470)

(assert (=> b!804599 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360159 vacantAfter!23 lt!360164 lt!360163 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360159 vacantBefore!23 (select (arr!20923 a!3170) j!153) a!3170 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27565 0))(
  ( (Unit!27566) )
))
(declare-fun lt!360160 () Unit!27565)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43696 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27565)

(assert (=> b!804599 (= lt!360160 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!360159 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804599 (= lt!360159 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804600 () Bool)

(declare-fun res!548571 () Bool)

(declare-fun e!445902 () Bool)

(assert (=> b!804600 (=> (not res!548571) (not e!445902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804600 (= res!548571 (validKeyInArray!0 k0!2044))))

(declare-fun b!804601 () Bool)

(declare-fun res!548573 () Bool)

(assert (=> b!804601 (=> (not res!548573) (not e!445902))))

(assert (=> b!804601 (= res!548573 (validKeyInArray!0 (select (arr!20923 a!3170) j!153)))))

(declare-fun b!804602 () Bool)

(declare-fun e!445903 () Bool)

(declare-fun e!445905 () Bool)

(assert (=> b!804602 (= e!445903 e!445905)))

(declare-fun res!548572 () Bool)

(assert (=> b!804602 (=> (not res!548572) (not e!445905))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43696 (_ BitVec 32)) SeekEntryResult!8470)

(assert (=> b!804602 (= res!548572 (= (seekEntryOrOpen!0 lt!360164 lt!360163 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360164 lt!360163 mask!3266)))))

(assert (=> b!804602 (= lt!360164 (select (store (arr!20923 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804602 (= lt!360163 (array!43697 (store (arr!20923 a!3170) i!1163 k0!2044) (size!21343 a!3170)))))

(declare-fun b!804603 () Bool)

(assert (=> b!804603 (= e!445902 e!445903)))

(declare-fun res!548574 () Bool)

(assert (=> b!804603 (=> (not res!548574) (not e!445903))))

(declare-fun lt!360162 () SeekEntryResult!8470)

(assert (=> b!804603 (= res!548574 (or (= lt!360162 (MissingZero!8470 i!1163)) (= lt!360162 (MissingVacant!8470 i!1163))))))

(assert (=> b!804603 (= lt!360162 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!548575 () Bool)

(assert (=> start!69074 (=> (not res!548575) (not e!445902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69074 (= res!548575 (validMask!0 mask!3266))))

(assert (=> start!69074 e!445902))

(assert (=> start!69074 true))

(declare-fun array_inv!16782 (array!43696) Bool)

(assert (=> start!69074 (array_inv!16782 a!3170)))

(declare-fun b!804604 () Bool)

(assert (=> b!804604 (= e!445905 e!445906)))

(declare-fun res!548570 () Bool)

(assert (=> b!804604 (=> (not res!548570) (not e!445906))))

(declare-fun lt!360161 () SeekEntryResult!8470)

(declare-fun lt!360158 () SeekEntryResult!8470)

(assert (=> b!804604 (= res!548570 (and (= lt!360161 lt!360158) (= lt!360158 (Found!8470 j!153)) (not (= (select (arr!20923 a!3170) index!1236) (select (arr!20923 a!3170) j!153)))))))

(assert (=> b!804604 (= lt!360158 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20923 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!804604 (= lt!360161 (seekEntryOrOpen!0 (select (arr!20923 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804605 () Bool)

(declare-fun res!548579 () Bool)

(assert (=> b!804605 (=> (not res!548579) (not e!445902))))

(assert (=> b!804605 (= res!548579 (and (= (size!21343 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21343 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21343 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804606 () Bool)

(declare-fun res!548580 () Bool)

(assert (=> b!804606 (=> (not res!548580) (not e!445903))))

(declare-datatypes ((List!14793 0))(
  ( (Nil!14790) (Cons!14789 (h!15924 (_ BitVec 64)) (t!21100 List!14793)) )
))
(declare-fun arrayNoDuplicates!0 (array!43696 (_ BitVec 32) List!14793) Bool)

(assert (=> b!804606 (= res!548580 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14790))))

(declare-fun b!804607 () Bool)

(declare-fun res!548578 () Bool)

(assert (=> b!804607 (=> (not res!548578) (not e!445903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43696 (_ BitVec 32)) Bool)

(assert (=> b!804607 (= res!548578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804608 () Bool)

(declare-fun res!548577 () Bool)

(assert (=> b!804608 (=> (not res!548577) (not e!445903))))

(assert (=> b!804608 (= res!548577 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21343 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20923 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21343 a!3170)) (= (select (arr!20923 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804609 () Bool)

(declare-fun res!548576 () Bool)

(assert (=> b!804609 (=> (not res!548576) (not e!445902))))

(declare-fun arrayContainsKey!0 (array!43696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804609 (= res!548576 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69074 res!548575) b!804605))

(assert (= (and b!804605 res!548579) b!804601))

(assert (= (and b!804601 res!548573) b!804600))

(assert (= (and b!804600 res!548571) b!804609))

(assert (= (and b!804609 res!548576) b!804603))

(assert (= (and b!804603 res!548574) b!804607))

(assert (= (and b!804607 res!548578) b!804606))

(assert (= (and b!804606 res!548580) b!804608))

(assert (= (and b!804608 res!548577) b!804602))

(assert (= (and b!804602 res!548572) b!804604))

(assert (= (and b!804604 res!548570) b!804599))

(declare-fun m!746767 () Bool)

(assert (=> b!804604 m!746767))

(declare-fun m!746769 () Bool)

(assert (=> b!804604 m!746769))

(assert (=> b!804604 m!746769))

(declare-fun m!746771 () Bool)

(assert (=> b!804604 m!746771))

(assert (=> b!804604 m!746769))

(declare-fun m!746773 () Bool)

(assert (=> b!804604 m!746773))

(declare-fun m!746775 () Bool)

(assert (=> b!804608 m!746775))

(declare-fun m!746777 () Bool)

(assert (=> b!804608 m!746777))

(declare-fun m!746779 () Bool)

(assert (=> b!804603 m!746779))

(declare-fun m!746781 () Bool)

(assert (=> b!804600 m!746781))

(declare-fun m!746783 () Bool)

(assert (=> b!804602 m!746783))

(declare-fun m!746785 () Bool)

(assert (=> b!804602 m!746785))

(declare-fun m!746787 () Bool)

(assert (=> b!804602 m!746787))

(declare-fun m!746789 () Bool)

(assert (=> b!804602 m!746789))

(declare-fun m!746791 () Bool)

(assert (=> b!804609 m!746791))

(assert (=> b!804601 m!746769))

(assert (=> b!804601 m!746769))

(declare-fun m!746793 () Bool)

(assert (=> b!804601 m!746793))

(declare-fun m!746795 () Bool)

(assert (=> b!804606 m!746795))

(declare-fun m!746797 () Bool)

(assert (=> b!804607 m!746797))

(assert (=> b!804599 m!746769))

(declare-fun m!746799 () Bool)

(assert (=> b!804599 m!746799))

(assert (=> b!804599 m!746769))

(declare-fun m!746801 () Bool)

(assert (=> b!804599 m!746801))

(declare-fun m!746803 () Bool)

(assert (=> b!804599 m!746803))

(declare-fun m!746805 () Bool)

(assert (=> b!804599 m!746805))

(declare-fun m!746807 () Bool)

(assert (=> start!69074 m!746807))

(declare-fun m!746809 () Bool)

(assert (=> start!69074 m!746809))

(check-sat (not b!804606) (not b!804600) (not b!804607) (not b!804603) (not b!804609) (not b!804599) (not start!69074) (not b!804604) (not b!804602) (not b!804601))
(check-sat)
