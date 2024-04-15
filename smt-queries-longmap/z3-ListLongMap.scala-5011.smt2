; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68556 () Bool)

(assert start!68556)

(declare-fun b!797514 () Bool)

(declare-fun e!442418 () Bool)

(declare-datatypes ((SeekEntryResult!8350 0))(
  ( (MissingZero!8350 (index!35768 (_ BitVec 32))) (Found!8350 (index!35769 (_ BitVec 32))) (Intermediate!8350 (undefined!9162 Bool) (index!35770 (_ BitVec 32)) (x!66671 (_ BitVec 32))) (Undefined!8350) (MissingVacant!8350 (index!35771 (_ BitVec 32))) )
))
(declare-fun lt!355744 () SeekEntryResult!8350)

(declare-fun lt!355743 () SeekEntryResult!8350)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!797514 (= e!442418 (not (or (not (= lt!355744 lt!355743)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797514 (= lt!355744 (Found!8350 index!1236))))

(declare-fun b!797515 () Bool)

(declare-fun res!542175 () Bool)

(declare-fun e!442419 () Bool)

(assert (=> b!797515 (=> (not res!542175) (not e!442419))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43363 0))(
  ( (array!43364 (arr!20762 (Array (_ BitVec 32) (_ BitVec 64))) (size!21183 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43363)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797515 (= res!542175 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21183 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20762 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21183 a!3170)) (= (select (arr!20762 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797516 () Bool)

(declare-fun e!442416 () Bool)

(assert (=> b!797516 (= e!442419 e!442416)))

(declare-fun res!542180 () Bool)

(assert (=> b!797516 (=> (not res!542180) (not e!442416))))

(declare-fun lt!355745 () SeekEntryResult!8350)

(assert (=> b!797516 (= res!542180 (= lt!355745 lt!355744))))

(declare-fun lt!355742 () (_ BitVec 64))

(declare-fun lt!355738 () array!43363)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43363 (_ BitVec 32)) SeekEntryResult!8350)

(assert (=> b!797516 (= lt!355744 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355742 lt!355738 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43363 (_ BitVec 32)) SeekEntryResult!8350)

(assert (=> b!797516 (= lt!355745 (seekEntryOrOpen!0 lt!355742 lt!355738 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797516 (= lt!355742 (select (store (arr!20762 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797516 (= lt!355738 (array!43364 (store (arr!20762 a!3170) i!1163 k0!2044) (size!21183 a!3170)))))

(declare-fun b!797517 () Bool)

(declare-fun res!542184 () Bool)

(assert (=> b!797517 (=> (not res!542184) (not e!442419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43363 (_ BitVec 32)) Bool)

(assert (=> b!797517 (= res!542184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!542174 () Bool)

(declare-fun e!442420 () Bool)

(assert (=> start!68556 (=> (not res!542174) (not e!442420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68556 (= res!542174 (validMask!0 mask!3266))))

(assert (=> start!68556 e!442420))

(assert (=> start!68556 true))

(declare-fun array_inv!16645 (array!43363) Bool)

(assert (=> start!68556 (array_inv!16645 a!3170)))

(declare-fun b!797518 () Bool)

(declare-fun res!542178 () Bool)

(assert (=> b!797518 (=> (not res!542178) (not e!442420))))

(declare-fun arrayContainsKey!0 (array!43363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797518 (= res!542178 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797519 () Bool)

(declare-fun res!542183 () Bool)

(assert (=> b!797519 (=> (not res!542183) (not e!442419))))

(declare-datatypes ((List!14764 0))(
  ( (Nil!14761) (Cons!14760 (h!15889 (_ BitVec 64)) (t!21070 List!14764)) )
))
(declare-fun arrayNoDuplicates!0 (array!43363 (_ BitVec 32) List!14764) Bool)

(assert (=> b!797519 (= res!542183 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14761))))

(declare-fun b!797520 () Bool)

(declare-fun res!542182 () Bool)

(assert (=> b!797520 (=> (not res!542182) (not e!442420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797520 (= res!542182 (validKeyInArray!0 (select (arr!20762 a!3170) j!153)))))

(declare-fun b!797521 () Bool)

(declare-fun e!442415 () Bool)

(assert (=> b!797521 (= e!442415 e!442418)))

(declare-fun res!542173 () Bool)

(assert (=> b!797521 (=> (not res!542173) (not e!442418))))

(declare-fun lt!355739 () SeekEntryResult!8350)

(assert (=> b!797521 (= res!542173 (and (= lt!355739 lt!355743) (= (select (arr!20762 a!3170) index!1236) (select (arr!20762 a!3170) j!153))))))

(assert (=> b!797521 (= lt!355743 (Found!8350 j!153))))

(declare-fun b!797522 () Bool)

(declare-fun res!542177 () Bool)

(assert (=> b!797522 (=> (not res!542177) (not e!442420))))

(assert (=> b!797522 (= res!542177 (validKeyInArray!0 k0!2044))))

(declare-fun b!797523 () Bool)

(declare-fun res!542181 () Bool)

(assert (=> b!797523 (=> (not res!542181) (not e!442420))))

(assert (=> b!797523 (= res!542181 (and (= (size!21183 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21183 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21183 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797524 () Bool)

(assert (=> b!797524 (= e!442416 e!442415)))

(declare-fun res!542176 () Bool)

(assert (=> b!797524 (=> (not res!542176) (not e!442415))))

(declare-fun lt!355740 () SeekEntryResult!8350)

(assert (=> b!797524 (= res!542176 (= lt!355740 lt!355739))))

(assert (=> b!797524 (= lt!355739 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20762 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797524 (= lt!355740 (seekEntryOrOpen!0 (select (arr!20762 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797525 () Bool)

(assert (=> b!797525 (= e!442420 e!442419)))

(declare-fun res!542179 () Bool)

(assert (=> b!797525 (=> (not res!542179) (not e!442419))))

(declare-fun lt!355741 () SeekEntryResult!8350)

(assert (=> b!797525 (= res!542179 (or (= lt!355741 (MissingZero!8350 i!1163)) (= lt!355741 (MissingVacant!8350 i!1163))))))

(assert (=> b!797525 (= lt!355741 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68556 res!542174) b!797523))

(assert (= (and b!797523 res!542181) b!797520))

(assert (= (and b!797520 res!542182) b!797522))

(assert (= (and b!797522 res!542177) b!797518))

(assert (= (and b!797518 res!542178) b!797525))

(assert (= (and b!797525 res!542179) b!797517))

(assert (= (and b!797517 res!542184) b!797519))

(assert (= (and b!797519 res!542183) b!797515))

(assert (= (and b!797515 res!542175) b!797516))

(assert (= (and b!797516 res!542180) b!797524))

(assert (= (and b!797524 res!542176) b!797521))

(assert (= (and b!797521 res!542173) b!797514))

(declare-fun m!737893 () Bool)

(assert (=> b!797524 m!737893))

(assert (=> b!797524 m!737893))

(declare-fun m!737895 () Bool)

(assert (=> b!797524 m!737895))

(assert (=> b!797524 m!737893))

(declare-fun m!737897 () Bool)

(assert (=> b!797524 m!737897))

(assert (=> b!797520 m!737893))

(assert (=> b!797520 m!737893))

(declare-fun m!737899 () Bool)

(assert (=> b!797520 m!737899))

(declare-fun m!737901 () Bool)

(assert (=> start!68556 m!737901))

(declare-fun m!737903 () Bool)

(assert (=> start!68556 m!737903))

(declare-fun m!737905 () Bool)

(assert (=> b!797517 m!737905))

(declare-fun m!737907 () Bool)

(assert (=> b!797525 m!737907))

(declare-fun m!737909 () Bool)

(assert (=> b!797518 m!737909))

(declare-fun m!737911 () Bool)

(assert (=> b!797516 m!737911))

(declare-fun m!737913 () Bool)

(assert (=> b!797516 m!737913))

(declare-fun m!737915 () Bool)

(assert (=> b!797516 m!737915))

(declare-fun m!737917 () Bool)

(assert (=> b!797516 m!737917))

(declare-fun m!737919 () Bool)

(assert (=> b!797521 m!737919))

(assert (=> b!797521 m!737893))

(declare-fun m!737921 () Bool)

(assert (=> b!797522 m!737921))

(declare-fun m!737923 () Bool)

(assert (=> b!797519 m!737923))

(declare-fun m!737925 () Bool)

(assert (=> b!797515 m!737925))

(declare-fun m!737927 () Bool)

(assert (=> b!797515 m!737927))

(check-sat (not b!797518) (not b!797516) (not b!797520) (not b!797524) (not b!797519) (not start!68556) (not b!797522) (not b!797525) (not b!797517))
(check-sat)
