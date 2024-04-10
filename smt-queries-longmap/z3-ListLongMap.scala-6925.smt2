; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87044 () Bool)

(assert start!87044)

(declare-fun b!1009594 () Bool)

(declare-fun res!678194 () Bool)

(declare-fun e!568005 () Bool)

(assert (=> b!1009594 (=> (not res!678194) (not e!568005))))

(declare-datatypes ((array!63619 0))(
  ( (array!63620 (arr!30629 (Array (_ BitVec 32) (_ BitVec 64))) (size!31131 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63619)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63619 (_ BitVec 32)) Bool)

(assert (=> b!1009594 (= res!678194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009595 () Bool)

(declare-fun res!678191 () Bool)

(declare-fun e!568004 () Bool)

(assert (=> b!1009595 (=> (not res!678191) (not e!568004))))

(declare-fun lt!446220 () array!63619)

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9561 0))(
  ( (MissingZero!9561 (index!40615 (_ BitVec 32))) (Found!9561 (index!40616 (_ BitVec 32))) (Intermediate!9561 (undefined!10373 Bool) (index!40617 (_ BitVec 32)) (x!88012 (_ BitVec 32))) (Undefined!9561) (MissingVacant!9561 (index!40618 (_ BitVec 32))) )
))
(declare-fun lt!446221 () SeekEntryResult!9561)

(declare-fun lt!446217 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63619 (_ BitVec 32)) SeekEntryResult!9561)

(assert (=> b!1009595 (= res!678191 (not (= lt!446221 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446217 lt!446220 mask!3464))))))

(declare-fun b!1009596 () Bool)

(declare-fun res!678183 () Bool)

(assert (=> b!1009596 (=> (not res!678183) (not e!568004))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009596 (= res!678183 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009597 () Bool)

(declare-fun res!678188 () Bool)

(assert (=> b!1009597 (=> (not res!678188) (not e!568005))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009597 (= res!678188 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31131 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31131 a!3219))))))

(declare-fun res!678190 () Bool)

(declare-fun e!568008 () Bool)

(assert (=> start!87044 (=> (not res!678190) (not e!568008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87044 (= res!678190 (validMask!0 mask!3464))))

(assert (=> start!87044 e!568008))

(declare-fun array_inv!23753 (array!63619) Bool)

(assert (=> start!87044 (array_inv!23753 a!3219)))

(assert (=> start!87044 true))

(declare-fun b!1009598 () Bool)

(declare-fun e!568009 () Bool)

(assert (=> b!1009598 (= e!568009 e!568004)))

(declare-fun res!678187 () Bool)

(assert (=> b!1009598 (=> (not res!678187) (not e!568004))))

(declare-fun lt!446223 () SeekEntryResult!9561)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009598 (= res!678187 (not (= lt!446223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446217 mask!3464) lt!446217 lt!446220 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1009598 (= lt!446217 (select (store (arr!30629 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009598 (= lt!446220 (array!63620 (store (arr!30629 a!3219) i!1194 k0!2224) (size!31131 a!3219)))))

(declare-fun b!1009599 () Bool)

(declare-fun res!678182 () Bool)

(assert (=> b!1009599 (=> (not res!678182) (not e!568008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009599 (= res!678182 (validKeyInArray!0 (select (arr!30629 a!3219) j!170)))))

(declare-fun b!1009600 () Bool)

(declare-fun e!568006 () Bool)

(assert (=> b!1009600 (= e!568005 e!568006)))

(declare-fun res!678192 () Bool)

(assert (=> b!1009600 (=> (not res!678192) (not e!568006))))

(declare-fun lt!446222 () SeekEntryResult!9561)

(assert (=> b!1009600 (= res!678192 (= lt!446223 lt!446222))))

(assert (=> b!1009600 (= lt!446222 (Intermediate!9561 false resIndex!38 resX!38))))

(assert (=> b!1009600 (= lt!446223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30629 a!3219) j!170) mask!3464) (select (arr!30629 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009601 () Bool)

(declare-fun res!678186 () Bool)

(assert (=> b!1009601 (=> (not res!678186) (not e!568008))))

(assert (=> b!1009601 (= res!678186 (and (= (size!31131 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31131 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31131 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009602 () Bool)

(assert (=> b!1009602 (= e!568006 e!568009)))

(declare-fun res!678185 () Bool)

(assert (=> b!1009602 (=> (not res!678185) (not e!568009))))

(assert (=> b!1009602 (= res!678185 (= lt!446221 lt!446222))))

(assert (=> b!1009602 (= lt!446221 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30629 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009603 () Bool)

(declare-fun res!678195 () Bool)

(assert (=> b!1009603 (=> (not res!678195) (not e!568008))))

(declare-fun arrayContainsKey!0 (array!63619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009603 (= res!678195 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009604 () Bool)

(declare-fun res!678189 () Bool)

(assert (=> b!1009604 (=> (not res!678189) (not e!568005))))

(declare-datatypes ((List!21305 0))(
  ( (Nil!21302) (Cons!21301 (h!22490 (_ BitVec 64)) (t!30306 List!21305)) )
))
(declare-fun arrayNoDuplicates!0 (array!63619 (_ BitVec 32) List!21305) Bool)

(assert (=> b!1009604 (= res!678189 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21302))))

(declare-fun b!1009605 () Bool)

(assert (=> b!1009605 (= e!568004 false)))

(declare-fun lt!446219 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009605 (= lt!446219 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009606 () Bool)

(declare-fun res!678184 () Bool)

(assert (=> b!1009606 (=> (not res!678184) (not e!568008))))

(assert (=> b!1009606 (= res!678184 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009607 () Bool)

(assert (=> b!1009607 (= e!568008 e!568005)))

(declare-fun res!678193 () Bool)

(assert (=> b!1009607 (=> (not res!678193) (not e!568005))))

(declare-fun lt!446218 () SeekEntryResult!9561)

(assert (=> b!1009607 (= res!678193 (or (= lt!446218 (MissingVacant!9561 i!1194)) (= lt!446218 (MissingZero!9561 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63619 (_ BitVec 32)) SeekEntryResult!9561)

(assert (=> b!1009607 (= lt!446218 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!87044 res!678190) b!1009601))

(assert (= (and b!1009601 res!678186) b!1009599))

(assert (= (and b!1009599 res!678182) b!1009606))

(assert (= (and b!1009606 res!678184) b!1009603))

(assert (= (and b!1009603 res!678195) b!1009607))

(assert (= (and b!1009607 res!678193) b!1009594))

(assert (= (and b!1009594 res!678194) b!1009604))

(assert (= (and b!1009604 res!678189) b!1009597))

(assert (= (and b!1009597 res!678188) b!1009600))

(assert (= (and b!1009600 res!678192) b!1009602))

(assert (= (and b!1009602 res!678185) b!1009598))

(assert (= (and b!1009598 res!678187) b!1009595))

(assert (= (and b!1009595 res!678191) b!1009596))

(assert (= (and b!1009596 res!678183) b!1009605))

(declare-fun m!934125 () Bool)

(assert (=> b!1009605 m!934125))

(declare-fun m!934127 () Bool)

(assert (=> b!1009594 m!934127))

(declare-fun m!934129 () Bool)

(assert (=> b!1009603 m!934129))

(declare-fun m!934131 () Bool)

(assert (=> b!1009600 m!934131))

(assert (=> b!1009600 m!934131))

(declare-fun m!934133 () Bool)

(assert (=> b!1009600 m!934133))

(assert (=> b!1009600 m!934133))

(assert (=> b!1009600 m!934131))

(declare-fun m!934135 () Bool)

(assert (=> b!1009600 m!934135))

(declare-fun m!934137 () Bool)

(assert (=> b!1009595 m!934137))

(declare-fun m!934139 () Bool)

(assert (=> b!1009607 m!934139))

(declare-fun m!934141 () Bool)

(assert (=> b!1009606 m!934141))

(declare-fun m!934143 () Bool)

(assert (=> b!1009604 m!934143))

(assert (=> b!1009602 m!934131))

(assert (=> b!1009602 m!934131))

(declare-fun m!934145 () Bool)

(assert (=> b!1009602 m!934145))

(declare-fun m!934147 () Bool)

(assert (=> start!87044 m!934147))

(declare-fun m!934149 () Bool)

(assert (=> start!87044 m!934149))

(assert (=> b!1009599 m!934131))

(assert (=> b!1009599 m!934131))

(declare-fun m!934151 () Bool)

(assert (=> b!1009599 m!934151))

(declare-fun m!934153 () Bool)

(assert (=> b!1009598 m!934153))

(assert (=> b!1009598 m!934153))

(declare-fun m!934155 () Bool)

(assert (=> b!1009598 m!934155))

(declare-fun m!934157 () Bool)

(assert (=> b!1009598 m!934157))

(declare-fun m!934159 () Bool)

(assert (=> b!1009598 m!934159))

(check-sat (not b!1009607) (not b!1009598) (not b!1009605) (not b!1009604) (not b!1009600) (not start!87044) (not b!1009603) (not b!1009599) (not b!1009595) (not b!1009606) (not b!1009602) (not b!1009594))
(check-sat)
