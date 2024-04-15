; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49314 () Bool)

(assert start!49314)

(declare-fun b!543095 () Bool)

(declare-fun e!314101 () Bool)

(declare-fun e!314103 () Bool)

(assert (=> b!543095 (= e!314101 e!314103)))

(declare-fun res!337793 () Bool)

(assert (=> b!543095 (=> (not res!337793) (not e!314103))))

(declare-datatypes ((SeekEntryResult!4954 0))(
  ( (MissingZero!4954 (index!22040 (_ BitVec 32))) (Found!4954 (index!22041 (_ BitVec 32))) (Intermediate!4954 (undefined!5766 Bool) (index!22042 (_ BitVec 32)) (x!50956 (_ BitVec 32))) (Undefined!4954) (MissingVacant!4954 (index!22043 (_ BitVec 32))) )
))
(declare-fun lt!247920 () SeekEntryResult!4954)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543095 (= res!337793 (or (= lt!247920 (MissingZero!4954 i!1153)) (= lt!247920 (MissingVacant!4954 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34332 0))(
  ( (array!34333 (arr!16499 (Array (_ BitVec 32) (_ BitVec 64))) (size!16864 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34332)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34332 (_ BitVec 32)) SeekEntryResult!4954)

(assert (=> b!543095 (= lt!247920 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543096 () Bool)

(declare-fun e!314100 () Bool)

(assert (=> b!543096 (= e!314100 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!247921 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543096 (= lt!247921 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543097 () Bool)

(assert (=> b!543097 (= e!314103 e!314100)))

(declare-fun res!337799 () Bool)

(assert (=> b!543097 (=> (not res!337799) (not e!314100))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!247919 () SeekEntryResult!4954)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!543097 (= res!337799 (= lt!247919 (Intermediate!4954 false resIndex!32 resX!32)))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34332 (_ BitVec 32)) SeekEntryResult!4954)

(assert (=> b!543097 (= lt!247919 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16499 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543098 () Bool)

(declare-fun res!337792 () Bool)

(assert (=> b!543098 (=> (not res!337792) (not e!314101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543098 (= res!337792 (validKeyInArray!0 k0!1998))))

(declare-fun b!543099 () Bool)

(declare-fun res!337798 () Bool)

(assert (=> b!543099 (=> (not res!337798) (not e!314103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34332 (_ BitVec 32)) Bool)

(assert (=> b!543099 (= res!337798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543100 () Bool)

(declare-fun res!337796 () Bool)

(assert (=> b!543100 (=> (not res!337796) (not e!314101))))

(assert (=> b!543100 (= res!337796 (validKeyInArray!0 (select (arr!16499 a!3154) j!147)))))

(declare-fun b!543101 () Bool)

(declare-fun res!337791 () Bool)

(assert (=> b!543101 (=> (not res!337791) (not e!314101))))

(assert (=> b!543101 (= res!337791 (and (= (size!16864 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16864 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16864 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543102 () Bool)

(declare-fun res!337794 () Bool)

(assert (=> b!543102 (=> (not res!337794) (not e!314100))))

(assert (=> b!543102 (= res!337794 (and (not (= (select (arr!16499 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16499 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16499 a!3154) index!1177) (select (arr!16499 a!3154) j!147)))))))

(declare-fun b!543103 () Bool)

(declare-fun res!337790 () Bool)

(assert (=> b!543103 (=> (not res!337790) (not e!314103))))

(assert (=> b!543103 (= res!337790 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16864 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16864 a!3154)) (= (select (arr!16499 a!3154) resIndex!32) (select (arr!16499 a!3154) j!147))))))

(declare-fun res!337789 () Bool)

(assert (=> start!49314 (=> (not res!337789) (not e!314101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49314 (= res!337789 (validMask!0 mask!3216))))

(assert (=> start!49314 e!314101))

(assert (=> start!49314 true))

(declare-fun array_inv!12382 (array!34332) Bool)

(assert (=> start!49314 (array_inv!12382 a!3154)))

(declare-fun b!543104 () Bool)

(declare-fun res!337797 () Bool)

(assert (=> b!543104 (=> (not res!337797) (not e!314100))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543104 (= res!337797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16499 a!3154) j!147) mask!3216) (select (arr!16499 a!3154) j!147) a!3154 mask!3216) lt!247919))))

(declare-fun b!543105 () Bool)

(declare-fun res!337788 () Bool)

(assert (=> b!543105 (=> (not res!337788) (not e!314103))))

(declare-datatypes ((List!10657 0))(
  ( (Nil!10654) (Cons!10653 (h!11608 (_ BitVec 64)) (t!16876 List!10657)) )
))
(declare-fun arrayNoDuplicates!0 (array!34332 (_ BitVec 32) List!10657) Bool)

(assert (=> b!543105 (= res!337788 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10654))))

(declare-fun b!543106 () Bool)

(declare-fun res!337795 () Bool)

(assert (=> b!543106 (=> (not res!337795) (not e!314101))))

(declare-fun arrayContainsKey!0 (array!34332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543106 (= res!337795 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49314 res!337789) b!543101))

(assert (= (and b!543101 res!337791) b!543100))

(assert (= (and b!543100 res!337796) b!543098))

(assert (= (and b!543098 res!337792) b!543106))

(assert (= (and b!543106 res!337795) b!543095))

(assert (= (and b!543095 res!337793) b!543099))

(assert (= (and b!543099 res!337798) b!543105))

(assert (= (and b!543105 res!337788) b!543103))

(assert (= (and b!543103 res!337790) b!543097))

(assert (= (and b!543097 res!337799) b!543104))

(assert (= (and b!543104 res!337797) b!543102))

(assert (= (and b!543102 res!337794) b!543096))

(declare-fun m!520717 () Bool)

(assert (=> b!543105 m!520717))

(declare-fun m!520719 () Bool)

(assert (=> b!543096 m!520719))

(declare-fun m!520721 () Bool)

(assert (=> b!543103 m!520721))

(declare-fun m!520723 () Bool)

(assert (=> b!543103 m!520723))

(declare-fun m!520725 () Bool)

(assert (=> b!543106 m!520725))

(declare-fun m!520727 () Bool)

(assert (=> b!543102 m!520727))

(assert (=> b!543102 m!520723))

(declare-fun m!520729 () Bool)

(assert (=> b!543095 m!520729))

(declare-fun m!520731 () Bool)

(assert (=> start!49314 m!520731))

(declare-fun m!520733 () Bool)

(assert (=> start!49314 m!520733))

(assert (=> b!543100 m!520723))

(assert (=> b!543100 m!520723))

(declare-fun m!520735 () Bool)

(assert (=> b!543100 m!520735))

(assert (=> b!543097 m!520723))

(assert (=> b!543097 m!520723))

(declare-fun m!520737 () Bool)

(assert (=> b!543097 m!520737))

(declare-fun m!520739 () Bool)

(assert (=> b!543098 m!520739))

(assert (=> b!543104 m!520723))

(assert (=> b!543104 m!520723))

(declare-fun m!520741 () Bool)

(assert (=> b!543104 m!520741))

(assert (=> b!543104 m!520741))

(assert (=> b!543104 m!520723))

(declare-fun m!520743 () Bool)

(assert (=> b!543104 m!520743))

(declare-fun m!520745 () Bool)

(assert (=> b!543099 m!520745))

(check-sat (not b!543098) (not start!49314) (not b!543105) (not b!543095) (not b!543097) (not b!543100) (not b!543096) (not b!543104) (not b!543106) (not b!543099))
(check-sat)
