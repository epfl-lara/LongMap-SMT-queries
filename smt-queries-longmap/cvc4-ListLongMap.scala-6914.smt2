; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86904 () Bool)

(assert start!86904)

(declare-fun b!1007759 () Bool)

(declare-fun e!567124 () Bool)

(assert (=> b!1007759 (= e!567124 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!445361 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007759 (= lt!445361 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007760 () Bool)

(declare-fun e!567122 () Bool)

(declare-fun e!567126 () Bool)

(assert (=> b!1007760 (= e!567122 e!567126)))

(declare-fun res!676664 () Bool)

(assert (=> b!1007760 (=> (not res!676664) (not e!567126))))

(declare-datatypes ((SeekEntryResult!9529 0))(
  ( (MissingZero!9529 (index!40487 (_ BitVec 32))) (Found!9529 (index!40488 (_ BitVec 32))) (Intermediate!9529 (undefined!10341 Bool) (index!40489 (_ BitVec 32)) (x!87879 (_ BitVec 32))) (Undefined!9529) (MissingVacant!9529 (index!40490 (_ BitVec 32))) )
))
(declare-fun lt!445358 () SeekEntryResult!9529)

(declare-fun lt!445359 () SeekEntryResult!9529)

(assert (=> b!1007760 (= res!676664 (= lt!445358 lt!445359))))

(declare-datatypes ((array!63552 0))(
  ( (array!63553 (arr!30597 (Array (_ BitVec 32) (_ BitVec 64))) (size!31099 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63552)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63552 (_ BitVec 32)) SeekEntryResult!9529)

(assert (=> b!1007760 (= lt!445358 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30597 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007761 () Bool)

(assert (=> b!1007761 (= e!567126 e!567124)))

(declare-fun res!676658 () Bool)

(assert (=> b!1007761 (=> (not res!676658) (not e!567124))))

(declare-fun lt!445364 () SeekEntryResult!9529)

(declare-fun lt!445360 () (_ BitVec 64))

(declare-fun lt!445363 () array!63552)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007761 (= res!676658 (not (= lt!445364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445360 mask!3464) lt!445360 lt!445363 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1007761 (= lt!445360 (select (store (arr!30597 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007761 (= lt!445363 (array!63553 (store (arr!30597 a!3219) i!1194 k!2224) (size!31099 a!3219)))))

(declare-fun b!1007762 () Bool)

(declare-fun e!567125 () Bool)

(assert (=> b!1007762 (= e!567125 e!567122)))

(declare-fun res!676656 () Bool)

(assert (=> b!1007762 (=> (not res!676656) (not e!567122))))

(assert (=> b!1007762 (= res!676656 (= lt!445364 lt!445359))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007762 (= lt!445359 (Intermediate!9529 false resIndex!38 resX!38))))

(assert (=> b!1007762 (= lt!445364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30597 a!3219) j!170) mask!3464) (select (arr!30597 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007763 () Bool)

(declare-fun res!676652 () Bool)

(assert (=> b!1007763 (=> (not res!676652) (not e!567124))))

(assert (=> b!1007763 (= res!676652 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007764 () Bool)

(declare-fun res!676663 () Bool)

(assert (=> b!1007764 (=> (not res!676663) (not e!567124))))

(assert (=> b!1007764 (= res!676663 (not (= lt!445358 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445360 lt!445363 mask!3464))))))

(declare-fun res!676661 () Bool)

(declare-fun e!567123 () Bool)

(assert (=> start!86904 (=> (not res!676661) (not e!567123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86904 (= res!676661 (validMask!0 mask!3464))))

(assert (=> start!86904 e!567123))

(declare-fun array_inv!23721 (array!63552) Bool)

(assert (=> start!86904 (array_inv!23721 a!3219)))

(assert (=> start!86904 true))

(declare-fun b!1007765 () Bool)

(declare-fun res!676665 () Bool)

(assert (=> b!1007765 (=> (not res!676665) (not e!567123))))

(assert (=> b!1007765 (= res!676665 (and (= (size!31099 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31099 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31099 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007766 () Bool)

(declare-fun res!676655 () Bool)

(assert (=> b!1007766 (=> (not res!676655) (not e!567125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63552 (_ BitVec 32)) Bool)

(assert (=> b!1007766 (= res!676655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007767 () Bool)

(declare-fun res!676653 () Bool)

(assert (=> b!1007767 (=> (not res!676653) (not e!567123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007767 (= res!676653 (validKeyInArray!0 (select (arr!30597 a!3219) j!170)))))

(declare-fun b!1007768 () Bool)

(assert (=> b!1007768 (= e!567123 e!567125)))

(declare-fun res!676662 () Bool)

(assert (=> b!1007768 (=> (not res!676662) (not e!567125))))

(declare-fun lt!445362 () SeekEntryResult!9529)

(assert (=> b!1007768 (= res!676662 (or (= lt!445362 (MissingVacant!9529 i!1194)) (= lt!445362 (MissingZero!9529 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63552 (_ BitVec 32)) SeekEntryResult!9529)

(assert (=> b!1007768 (= lt!445362 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007769 () Bool)

(declare-fun res!676660 () Bool)

(assert (=> b!1007769 (=> (not res!676660) (not e!567125))))

(declare-datatypes ((List!21273 0))(
  ( (Nil!21270) (Cons!21269 (h!22455 (_ BitVec 64)) (t!30274 List!21273)) )
))
(declare-fun arrayNoDuplicates!0 (array!63552 (_ BitVec 32) List!21273) Bool)

(assert (=> b!1007769 (= res!676660 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21270))))

(declare-fun b!1007770 () Bool)

(declare-fun res!676659 () Bool)

(assert (=> b!1007770 (=> (not res!676659) (not e!567123))))

(declare-fun arrayContainsKey!0 (array!63552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007770 (= res!676659 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007771 () Bool)

(declare-fun res!676657 () Bool)

(assert (=> b!1007771 (=> (not res!676657) (not e!567125))))

(assert (=> b!1007771 (= res!676657 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31099 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31099 a!3219))))))

(declare-fun b!1007772 () Bool)

(declare-fun res!676654 () Bool)

(assert (=> b!1007772 (=> (not res!676654) (not e!567123))))

(assert (=> b!1007772 (= res!676654 (validKeyInArray!0 k!2224))))

(assert (= (and start!86904 res!676661) b!1007765))

(assert (= (and b!1007765 res!676665) b!1007767))

(assert (= (and b!1007767 res!676653) b!1007772))

(assert (= (and b!1007772 res!676654) b!1007770))

(assert (= (and b!1007770 res!676659) b!1007768))

(assert (= (and b!1007768 res!676662) b!1007766))

(assert (= (and b!1007766 res!676655) b!1007769))

(assert (= (and b!1007769 res!676660) b!1007771))

(assert (= (and b!1007771 res!676657) b!1007762))

(assert (= (and b!1007762 res!676656) b!1007760))

(assert (= (and b!1007760 res!676664) b!1007761))

(assert (= (and b!1007761 res!676658) b!1007764))

(assert (= (and b!1007764 res!676663) b!1007763))

(assert (= (and b!1007763 res!676652) b!1007759))

(declare-fun m!932603 () Bool)

(assert (=> b!1007766 m!932603))

(declare-fun m!932605 () Bool)

(assert (=> b!1007760 m!932605))

(assert (=> b!1007760 m!932605))

(declare-fun m!932607 () Bool)

(assert (=> b!1007760 m!932607))

(declare-fun m!932609 () Bool)

(assert (=> b!1007768 m!932609))

(declare-fun m!932611 () Bool)

(assert (=> b!1007769 m!932611))

(declare-fun m!932613 () Bool)

(assert (=> b!1007770 m!932613))

(declare-fun m!932615 () Bool)

(assert (=> start!86904 m!932615))

(declare-fun m!932617 () Bool)

(assert (=> start!86904 m!932617))

(declare-fun m!932619 () Bool)

(assert (=> b!1007761 m!932619))

(assert (=> b!1007761 m!932619))

(declare-fun m!932621 () Bool)

(assert (=> b!1007761 m!932621))

(declare-fun m!932623 () Bool)

(assert (=> b!1007761 m!932623))

(declare-fun m!932625 () Bool)

(assert (=> b!1007761 m!932625))

(assert (=> b!1007767 m!932605))

(assert (=> b!1007767 m!932605))

(declare-fun m!932627 () Bool)

(assert (=> b!1007767 m!932627))

(declare-fun m!932629 () Bool)

(assert (=> b!1007759 m!932629))

(declare-fun m!932631 () Bool)

(assert (=> b!1007772 m!932631))

(assert (=> b!1007762 m!932605))

(assert (=> b!1007762 m!932605))

(declare-fun m!932633 () Bool)

(assert (=> b!1007762 m!932633))

(assert (=> b!1007762 m!932633))

(assert (=> b!1007762 m!932605))

(declare-fun m!932635 () Bool)

(assert (=> b!1007762 m!932635))

(declare-fun m!932637 () Bool)

(assert (=> b!1007764 m!932637))

(push 1)

