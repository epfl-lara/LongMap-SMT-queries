; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86906 () Bool)

(assert start!86906)

(declare-fun b!1007801 () Bool)

(declare-fun e!567144 () Bool)

(declare-fun e!567145 () Bool)

(assert (=> b!1007801 (= e!567144 e!567145)))

(declare-fun res!676702 () Bool)

(assert (=> b!1007801 (=> (not res!676702) (not e!567145))))

(declare-datatypes ((SeekEntryResult!9530 0))(
  ( (MissingZero!9530 (index!40491 (_ BitVec 32))) (Found!9530 (index!40492 (_ BitVec 32))) (Intermediate!9530 (undefined!10342 Bool) (index!40493 (_ BitVec 32)) (x!87888 (_ BitVec 32))) (Undefined!9530) (MissingVacant!9530 (index!40494 (_ BitVec 32))) )
))
(declare-fun lt!445385 () SeekEntryResult!9530)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007801 (= res!676702 (or (= lt!445385 (MissingVacant!9530 i!1194)) (= lt!445385 (MissingZero!9530 i!1194))))))

(declare-datatypes ((array!63554 0))(
  ( (array!63555 (arr!30598 (Array (_ BitVec 32) (_ BitVec 64))) (size!31100 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63554)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63554 (_ BitVec 32)) SeekEntryResult!9530)

(assert (=> b!1007801 (= lt!445385 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007802 () Bool)

(declare-fun e!567140 () Bool)

(declare-fun e!567141 () Bool)

(assert (=> b!1007802 (= e!567140 e!567141)))

(declare-fun res!676694 () Bool)

(assert (=> b!1007802 (=> (not res!676694) (not e!567141))))

(declare-fun lt!445382 () SeekEntryResult!9530)

(declare-fun lt!445380 () SeekEntryResult!9530)

(assert (=> b!1007802 (= res!676694 (= lt!445382 lt!445380))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63554 (_ BitVec 32)) SeekEntryResult!9530)

(assert (=> b!1007802 (= lt!445382 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30598 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007803 () Bool)

(declare-fun res!676696 () Bool)

(assert (=> b!1007803 (=> (not res!676696) (not e!567145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63554 (_ BitVec 32)) Bool)

(assert (=> b!1007803 (= res!676696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!676704 () Bool)

(assert (=> start!86906 (=> (not res!676704) (not e!567144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86906 (= res!676704 (validMask!0 mask!3464))))

(assert (=> start!86906 e!567144))

(declare-fun array_inv!23722 (array!63554) Bool)

(assert (=> start!86906 (array_inv!23722 a!3219)))

(assert (=> start!86906 true))

(declare-fun b!1007804 () Bool)

(declare-fun res!676703 () Bool)

(declare-fun e!567143 () Bool)

(assert (=> b!1007804 (=> (not res!676703) (not e!567143))))

(declare-fun lt!445381 () array!63554)

(declare-fun lt!445383 () (_ BitVec 64))

(assert (=> b!1007804 (= res!676703 (not (= lt!445382 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445383 lt!445381 mask!3464))))))

(declare-fun b!1007805 () Bool)

(declare-fun res!676701 () Bool)

(assert (=> b!1007805 (=> (not res!676701) (not e!567145))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007805 (= res!676701 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31100 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31100 a!3219))))))

(declare-fun b!1007806 () Bool)

(declare-fun res!676695 () Bool)

(assert (=> b!1007806 (=> (not res!676695) (not e!567144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007806 (= res!676695 (validKeyInArray!0 k!2224))))

(declare-fun b!1007807 () Bool)

(assert (=> b!1007807 (= e!567141 e!567143)))

(declare-fun res!676706 () Bool)

(assert (=> b!1007807 (=> (not res!676706) (not e!567143))))

(declare-fun lt!445379 () SeekEntryResult!9530)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007807 (= res!676706 (not (= lt!445379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445383 mask!3464) lt!445383 lt!445381 mask!3464))))))

(assert (=> b!1007807 (= lt!445383 (select (store (arr!30598 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007807 (= lt!445381 (array!63555 (store (arr!30598 a!3219) i!1194 k!2224) (size!31100 a!3219)))))

(declare-fun b!1007808 () Bool)

(declare-fun res!676699 () Bool)

(assert (=> b!1007808 (=> (not res!676699) (not e!567143))))

(assert (=> b!1007808 (= res!676699 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007809 () Bool)

(assert (=> b!1007809 (= e!567145 e!567140)))

(declare-fun res!676705 () Bool)

(assert (=> b!1007809 (=> (not res!676705) (not e!567140))))

(assert (=> b!1007809 (= res!676705 (= lt!445379 lt!445380))))

(assert (=> b!1007809 (= lt!445380 (Intermediate!9530 false resIndex!38 resX!38))))

(assert (=> b!1007809 (= lt!445379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30598 a!3219) j!170) mask!3464) (select (arr!30598 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007810 () Bool)

(declare-fun res!676700 () Bool)

(assert (=> b!1007810 (=> (not res!676700) (not e!567144))))

(assert (=> b!1007810 (= res!676700 (validKeyInArray!0 (select (arr!30598 a!3219) j!170)))))

(declare-fun b!1007811 () Bool)

(assert (=> b!1007811 (= e!567143 false)))

(declare-fun lt!445384 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007811 (= lt!445384 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007812 () Bool)

(declare-fun res!676698 () Bool)

(assert (=> b!1007812 (=> (not res!676698) (not e!567145))))

(declare-datatypes ((List!21274 0))(
  ( (Nil!21271) (Cons!21270 (h!22456 (_ BitVec 64)) (t!30275 List!21274)) )
))
(declare-fun arrayNoDuplicates!0 (array!63554 (_ BitVec 32) List!21274) Bool)

(assert (=> b!1007812 (= res!676698 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21271))))

(declare-fun b!1007813 () Bool)

(declare-fun res!676697 () Bool)

(assert (=> b!1007813 (=> (not res!676697) (not e!567144))))

(assert (=> b!1007813 (= res!676697 (and (= (size!31100 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31100 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31100 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007814 () Bool)

(declare-fun res!676707 () Bool)

(assert (=> b!1007814 (=> (not res!676707) (not e!567144))))

(declare-fun arrayContainsKey!0 (array!63554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007814 (= res!676707 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86906 res!676704) b!1007813))

(assert (= (and b!1007813 res!676697) b!1007810))

(assert (= (and b!1007810 res!676700) b!1007806))

(assert (= (and b!1007806 res!676695) b!1007814))

(assert (= (and b!1007814 res!676707) b!1007801))

(assert (= (and b!1007801 res!676702) b!1007803))

(assert (= (and b!1007803 res!676696) b!1007812))

(assert (= (and b!1007812 res!676698) b!1007805))

(assert (= (and b!1007805 res!676701) b!1007809))

(assert (= (and b!1007809 res!676705) b!1007802))

(assert (= (and b!1007802 res!676694) b!1007807))

(assert (= (and b!1007807 res!676706) b!1007804))

(assert (= (and b!1007804 res!676703) b!1007808))

(assert (= (and b!1007808 res!676699) b!1007811))

(declare-fun m!932639 () Bool)

(assert (=> b!1007814 m!932639))

(declare-fun m!932641 () Bool)

(assert (=> b!1007810 m!932641))

(assert (=> b!1007810 m!932641))

(declare-fun m!932643 () Bool)

(assert (=> b!1007810 m!932643))

(declare-fun m!932645 () Bool)

(assert (=> b!1007812 m!932645))

(declare-fun m!932647 () Bool)

(assert (=> b!1007803 m!932647))

(declare-fun m!932649 () Bool)

(assert (=> b!1007801 m!932649))

(declare-fun m!932651 () Bool)

(assert (=> b!1007811 m!932651))

(declare-fun m!932653 () Bool)

(assert (=> b!1007807 m!932653))

(assert (=> b!1007807 m!932653))

(declare-fun m!932655 () Bool)

(assert (=> b!1007807 m!932655))

(declare-fun m!932657 () Bool)

(assert (=> b!1007807 m!932657))

(declare-fun m!932659 () Bool)

(assert (=> b!1007807 m!932659))

(declare-fun m!932661 () Bool)

(assert (=> b!1007804 m!932661))

(assert (=> b!1007809 m!932641))

(assert (=> b!1007809 m!932641))

(declare-fun m!932663 () Bool)

(assert (=> b!1007809 m!932663))

(assert (=> b!1007809 m!932663))

(assert (=> b!1007809 m!932641))

(declare-fun m!932665 () Bool)

(assert (=> b!1007809 m!932665))

(assert (=> b!1007802 m!932641))

(assert (=> b!1007802 m!932641))

(declare-fun m!932667 () Bool)

(assert (=> b!1007802 m!932667))

(declare-fun m!932669 () Bool)

(assert (=> b!1007806 m!932669))

(declare-fun m!932671 () Bool)

(assert (=> start!86906 m!932671))

(declare-fun m!932673 () Bool)

(assert (=> start!86906 m!932673))

(push 1)

