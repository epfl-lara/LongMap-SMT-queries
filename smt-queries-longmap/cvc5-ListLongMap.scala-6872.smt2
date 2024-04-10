; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86486 () Bool)

(assert start!86486)

(declare-fun b!1001613 () Bool)

(declare-fun e!564376 () Bool)

(declare-fun e!564374 () Bool)

(assert (=> b!1001613 (= e!564376 e!564374)))

(declare-fun res!671099 () Bool)

(assert (=> b!1001613 (=> (not res!671099) (not e!564374))))

(declare-datatypes ((array!63287 0))(
  ( (array!63288 (arr!30469 (Array (_ BitVec 32) (_ BitVec 64))) (size!30971 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63287)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!442766 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001613 (= res!671099 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442766 #b00000000000000000000000000000000) (bvslt lt!442766 (size!30971 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001613 (= lt!442766 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001614 () Bool)

(declare-fun res!671096 () Bool)

(declare-fun e!564370 () Bool)

(assert (=> b!1001614 (=> (not res!671096) (not e!564370))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001614 (= res!671096 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30971 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30971 a!3219))))))

(declare-fun b!1001615 () Bool)

(declare-fun e!564371 () Bool)

(assert (=> b!1001615 (= e!564371 e!564376)))

(declare-fun res!671104 () Bool)

(assert (=> b!1001615 (=> (not res!671104) (not e!564376))))

(declare-fun lt!442763 () array!63287)

(declare-datatypes ((SeekEntryResult!9401 0))(
  ( (MissingZero!9401 (index!39975 (_ BitVec 32))) (Found!9401 (index!39976 (_ BitVec 32))) (Intermediate!9401 (undefined!10213 Bool) (index!39977 (_ BitVec 32)) (x!87397 (_ BitVec 32))) (Undefined!9401) (MissingVacant!9401 (index!39978 (_ BitVec 32))) )
))
(declare-fun lt!442768 () SeekEntryResult!9401)

(declare-fun lt!442769 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63287 (_ BitVec 32)) SeekEntryResult!9401)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001615 (= res!671104 (not (= lt!442768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442769 mask!3464) lt!442769 lt!442763 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1001615 (= lt!442769 (select (store (arr!30469 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001615 (= lt!442763 (array!63288 (store (arr!30469 a!3219) i!1194 k!2224) (size!30971 a!3219)))))

(declare-fun res!671102 () Bool)

(declare-fun e!564372 () Bool)

(assert (=> start!86486 (=> (not res!671102) (not e!564372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86486 (= res!671102 (validMask!0 mask!3464))))

(assert (=> start!86486 e!564372))

(declare-fun array_inv!23593 (array!63287) Bool)

(assert (=> start!86486 (array_inv!23593 a!3219)))

(assert (=> start!86486 true))

(declare-fun b!1001616 () Bool)

(declare-fun res!671092 () Bool)

(assert (=> b!1001616 (=> (not res!671092) (not e!564372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001616 (= res!671092 (validKeyInArray!0 k!2224))))

(declare-fun b!1001617 () Bool)

(declare-fun res!671097 () Bool)

(assert (=> b!1001617 (=> (not res!671097) (not e!564376))))

(declare-fun lt!442762 () SeekEntryResult!9401)

(assert (=> b!1001617 (= res!671097 (not (= lt!442762 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442769 lt!442763 mask!3464))))))

(declare-fun b!1001618 () Bool)

(declare-fun e!564373 () Bool)

(assert (=> b!1001618 (= e!564373 e!564371)))

(declare-fun res!671100 () Bool)

(assert (=> b!1001618 (=> (not res!671100) (not e!564371))))

(declare-fun lt!442767 () SeekEntryResult!9401)

(assert (=> b!1001618 (= res!671100 (= lt!442762 lt!442767))))

(assert (=> b!1001618 (= lt!442762 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30469 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001619 () Bool)

(declare-fun res!671105 () Bool)

(assert (=> b!1001619 (=> (not res!671105) (not e!564372))))

(assert (=> b!1001619 (= res!671105 (validKeyInArray!0 (select (arr!30469 a!3219) j!170)))))

(declare-fun b!1001620 () Bool)

(declare-fun res!671093 () Bool)

(assert (=> b!1001620 (=> (not res!671093) (not e!564372))))

(declare-fun arrayContainsKey!0 (array!63287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001620 (= res!671093 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001621 () Bool)

(declare-fun res!671106 () Bool)

(assert (=> b!1001621 (=> (not res!671106) (not e!564370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63287 (_ BitVec 32)) Bool)

(assert (=> b!1001621 (= res!671106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001622 () Bool)

(declare-fun res!671098 () Bool)

(assert (=> b!1001622 (=> (not res!671098) (not e!564372))))

(assert (=> b!1001622 (= res!671098 (and (= (size!30971 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30971 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30971 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001623 () Bool)

(assert (=> b!1001623 (= e!564374 false)))

(declare-fun lt!442764 () SeekEntryResult!9401)

(assert (=> b!1001623 (= lt!442764 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442766 lt!442769 lt!442763 mask!3464))))

(declare-fun b!1001624 () Bool)

(assert (=> b!1001624 (= e!564372 e!564370)))

(declare-fun res!671101 () Bool)

(assert (=> b!1001624 (=> (not res!671101) (not e!564370))))

(declare-fun lt!442765 () SeekEntryResult!9401)

(assert (=> b!1001624 (= res!671101 (or (= lt!442765 (MissingVacant!9401 i!1194)) (= lt!442765 (MissingZero!9401 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63287 (_ BitVec 32)) SeekEntryResult!9401)

(assert (=> b!1001624 (= lt!442765 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001625 () Bool)

(assert (=> b!1001625 (= e!564370 e!564373)))

(declare-fun res!671094 () Bool)

(assert (=> b!1001625 (=> (not res!671094) (not e!564373))))

(assert (=> b!1001625 (= res!671094 (= lt!442768 lt!442767))))

(assert (=> b!1001625 (= lt!442767 (Intermediate!9401 false resIndex!38 resX!38))))

(assert (=> b!1001625 (= lt!442768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30469 a!3219) j!170) mask!3464) (select (arr!30469 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001626 () Bool)

(declare-fun res!671095 () Bool)

(assert (=> b!1001626 (=> (not res!671095) (not e!564370))))

(declare-datatypes ((List!21145 0))(
  ( (Nil!21142) (Cons!21141 (h!22318 (_ BitVec 64)) (t!30146 List!21145)) )
))
(declare-fun arrayNoDuplicates!0 (array!63287 (_ BitVec 32) List!21145) Bool)

(assert (=> b!1001626 (= res!671095 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21142))))

(declare-fun b!1001627 () Bool)

(declare-fun res!671103 () Bool)

(assert (=> b!1001627 (=> (not res!671103) (not e!564376))))

(assert (=> b!1001627 (= res!671103 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001628 () Bool)

(declare-fun res!671091 () Bool)

(assert (=> b!1001628 (=> (not res!671091) (not e!564374))))

(assert (=> b!1001628 (= res!671091 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442766 (select (arr!30469 a!3219) j!170) a!3219 mask!3464) lt!442767))))

(assert (= (and start!86486 res!671102) b!1001622))

(assert (= (and b!1001622 res!671098) b!1001619))

(assert (= (and b!1001619 res!671105) b!1001616))

(assert (= (and b!1001616 res!671092) b!1001620))

(assert (= (and b!1001620 res!671093) b!1001624))

(assert (= (and b!1001624 res!671101) b!1001621))

(assert (= (and b!1001621 res!671106) b!1001626))

(assert (= (and b!1001626 res!671095) b!1001614))

(assert (= (and b!1001614 res!671096) b!1001625))

(assert (= (and b!1001625 res!671094) b!1001618))

(assert (= (and b!1001618 res!671100) b!1001615))

(assert (= (and b!1001615 res!671104) b!1001617))

(assert (= (and b!1001617 res!671097) b!1001627))

(assert (= (and b!1001627 res!671103) b!1001613))

(assert (= (and b!1001613 res!671099) b!1001628))

(assert (= (and b!1001628 res!671091) b!1001623))

(declare-fun m!927629 () Bool)

(assert (=> b!1001623 m!927629))

(declare-fun m!927631 () Bool)

(assert (=> b!1001621 m!927631))

(declare-fun m!927633 () Bool)

(assert (=> b!1001618 m!927633))

(assert (=> b!1001618 m!927633))

(declare-fun m!927635 () Bool)

(assert (=> b!1001618 m!927635))

(declare-fun m!927637 () Bool)

(assert (=> b!1001615 m!927637))

(assert (=> b!1001615 m!927637))

(declare-fun m!927639 () Bool)

(assert (=> b!1001615 m!927639))

(declare-fun m!927641 () Bool)

(assert (=> b!1001615 m!927641))

(declare-fun m!927643 () Bool)

(assert (=> b!1001615 m!927643))

(assert (=> b!1001625 m!927633))

(assert (=> b!1001625 m!927633))

(declare-fun m!927645 () Bool)

(assert (=> b!1001625 m!927645))

(assert (=> b!1001625 m!927645))

(assert (=> b!1001625 m!927633))

(declare-fun m!927647 () Bool)

(assert (=> b!1001625 m!927647))

(declare-fun m!927649 () Bool)

(assert (=> b!1001613 m!927649))

(declare-fun m!927651 () Bool)

(assert (=> b!1001624 m!927651))

(assert (=> b!1001619 m!927633))

(assert (=> b!1001619 m!927633))

(declare-fun m!927653 () Bool)

(assert (=> b!1001619 m!927653))

(assert (=> b!1001628 m!927633))

(assert (=> b!1001628 m!927633))

(declare-fun m!927655 () Bool)

(assert (=> b!1001628 m!927655))

(declare-fun m!927657 () Bool)

(assert (=> b!1001620 m!927657))

(declare-fun m!927659 () Bool)

(assert (=> b!1001616 m!927659))

(declare-fun m!927661 () Bool)

(assert (=> b!1001626 m!927661))

(declare-fun m!927663 () Bool)

(assert (=> start!86486 m!927663))

(declare-fun m!927665 () Bool)

(assert (=> start!86486 m!927665))

(declare-fun m!927667 () Bool)

(assert (=> b!1001617 m!927667))

(push 1)

