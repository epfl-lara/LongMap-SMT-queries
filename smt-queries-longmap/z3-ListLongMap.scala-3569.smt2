; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49138 () Bool)

(assert start!49138)

(declare-fun b!540916 () Bool)

(declare-fun res!335699 () Bool)

(declare-fun e!313375 () Bool)

(assert (=> b!540916 (=> (not res!335699) (not e!313375))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540916 (= res!335699 (validKeyInArray!0 k0!1998))))

(declare-fun b!540917 () Bool)

(declare-fun res!335702 () Bool)

(declare-fun e!313376 () Bool)

(assert (=> b!540917 (=> (not res!335702) (not e!313376))))

(declare-datatypes ((array!34196 0))(
  ( (array!34197 (arr!16432 (Array (_ BitVec 32) (_ BitVec 64))) (size!16796 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34196)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34196 (_ BitVec 32)) Bool)

(assert (=> b!540917 (= res!335702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540918 () Bool)

(assert (=> b!540918 (= e!313376 false)))

(declare-datatypes ((SeekEntryResult!4846 0))(
  ( (MissingZero!4846 (index!21608 (_ BitVec 32))) (Found!4846 (index!21609 (_ BitVec 32))) (Intermediate!4846 (undefined!5658 Bool) (index!21610 (_ BitVec 32)) (x!50676 (_ BitVec 32))) (Undefined!4846) (MissingVacant!4846 (index!21611 (_ BitVec 32))) )
))
(declare-fun lt!247585 () SeekEntryResult!4846)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34196 (_ BitVec 32)) SeekEntryResult!4846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540918 (= lt!247585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16432 a!3154) j!147) mask!3216) (select (arr!16432 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540919 () Bool)

(declare-fun res!335700 () Bool)

(assert (=> b!540919 (=> (not res!335700) (not e!313375))))

(assert (=> b!540919 (= res!335700 (validKeyInArray!0 (select (arr!16432 a!3154) j!147)))))

(declare-fun b!540920 () Bool)

(declare-fun res!335706 () Bool)

(assert (=> b!540920 (=> (not res!335706) (not e!313375))))

(declare-fun arrayContainsKey!0 (array!34196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540920 (= res!335706 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540921 () Bool)

(declare-fun res!335707 () Bool)

(assert (=> b!540921 (=> (not res!335707) (not e!313376))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!540921 (= res!335707 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16796 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16796 a!3154)) (= (select (arr!16432 a!3154) resIndex!32) (select (arr!16432 a!3154) j!147))))))

(declare-fun res!335704 () Bool)

(assert (=> start!49138 (=> (not res!335704) (not e!313375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49138 (= res!335704 (validMask!0 mask!3216))))

(assert (=> start!49138 e!313375))

(assert (=> start!49138 true))

(declare-fun array_inv!12291 (array!34196) Bool)

(assert (=> start!49138 (array_inv!12291 a!3154)))

(declare-fun b!540922 () Bool)

(declare-fun res!335701 () Bool)

(assert (=> b!540922 (=> (not res!335701) (not e!313376))))

(declare-datatypes ((List!10458 0))(
  ( (Nil!10455) (Cons!10454 (h!11406 (_ BitVec 64)) (t!16678 List!10458)) )
))
(declare-fun arrayNoDuplicates!0 (array!34196 (_ BitVec 32) List!10458) Bool)

(assert (=> b!540922 (= res!335701 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10455))))

(declare-fun b!540923 () Bool)

(assert (=> b!540923 (= e!313375 e!313376)))

(declare-fun res!335698 () Bool)

(assert (=> b!540923 (=> (not res!335698) (not e!313376))))

(declare-fun lt!247584 () SeekEntryResult!4846)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540923 (= res!335698 (or (= lt!247584 (MissingZero!4846 i!1153)) (= lt!247584 (MissingVacant!4846 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34196 (_ BitVec 32)) SeekEntryResult!4846)

(assert (=> b!540923 (= lt!247584 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540924 () Bool)

(declare-fun res!335705 () Bool)

(assert (=> b!540924 (=> (not res!335705) (not e!313375))))

(assert (=> b!540924 (= res!335705 (and (= (size!16796 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16796 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16796 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540925 () Bool)

(declare-fun res!335703 () Bool)

(assert (=> b!540925 (=> (not res!335703) (not e!313376))))

(assert (=> b!540925 (= res!335703 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16432 a!3154) j!147) a!3154 mask!3216) (Intermediate!4846 false resIndex!32 resX!32)))))

(assert (= (and start!49138 res!335704) b!540924))

(assert (= (and b!540924 res!335705) b!540919))

(assert (= (and b!540919 res!335700) b!540916))

(assert (= (and b!540916 res!335699) b!540920))

(assert (= (and b!540920 res!335706) b!540923))

(assert (= (and b!540923 res!335698) b!540917))

(assert (= (and b!540917 res!335702) b!540922))

(assert (= (and b!540922 res!335701) b!540921))

(assert (= (and b!540921 res!335707) b!540925))

(assert (= (and b!540925 res!335703) b!540918))

(declare-fun m!519709 () Bool)

(assert (=> b!540919 m!519709))

(assert (=> b!540919 m!519709))

(declare-fun m!519711 () Bool)

(assert (=> b!540919 m!519711))

(assert (=> b!540925 m!519709))

(assert (=> b!540925 m!519709))

(declare-fun m!519713 () Bool)

(assert (=> b!540925 m!519713))

(declare-fun m!519715 () Bool)

(assert (=> b!540922 m!519715))

(declare-fun m!519717 () Bool)

(assert (=> b!540923 m!519717))

(declare-fun m!519719 () Bool)

(assert (=> b!540917 m!519719))

(declare-fun m!519721 () Bool)

(assert (=> b!540916 m!519721))

(assert (=> b!540918 m!519709))

(assert (=> b!540918 m!519709))

(declare-fun m!519723 () Bool)

(assert (=> b!540918 m!519723))

(assert (=> b!540918 m!519723))

(assert (=> b!540918 m!519709))

(declare-fun m!519725 () Bool)

(assert (=> b!540918 m!519725))

(declare-fun m!519727 () Bool)

(assert (=> b!540920 m!519727))

(declare-fun m!519729 () Bool)

(assert (=> start!49138 m!519729))

(declare-fun m!519731 () Bool)

(assert (=> start!49138 m!519731))

(declare-fun m!519733 () Bool)

(assert (=> b!540921 m!519733))

(assert (=> b!540921 m!519709))

(check-sat (not b!540922) (not b!540923) (not b!540916) (not b!540918) (not b!540917) (not b!540925) (not b!540919) (not b!540920) (not start!49138))
(check-sat)
