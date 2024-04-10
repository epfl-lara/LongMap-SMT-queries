; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86910 () Bool)

(assert start!86910)

(declare-fun res!676787 () Bool)

(declare-fun e!567178 () Bool)

(assert (=> start!86910 (=> (not res!676787) (not e!567178))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86910 (= res!676787 (validMask!0 mask!3464))))

(assert (=> start!86910 e!567178))

(declare-datatypes ((array!63558 0))(
  ( (array!63559 (arr!30600 (Array (_ BitVec 32) (_ BitVec 64))) (size!31102 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63558)

(declare-fun array_inv!23724 (array!63558) Bool)

(assert (=> start!86910 (array_inv!23724 a!3219)))

(assert (=> start!86910 true))

(declare-fun b!1007885 () Bool)

(declare-fun e!567180 () Bool)

(declare-fun e!567177 () Bool)

(assert (=> b!1007885 (= e!567180 e!567177)))

(declare-fun res!676785 () Bool)

(assert (=> b!1007885 (=> (not res!676785) (not e!567177))))

(declare-fun lt!445425 () array!63558)

(declare-fun lt!445423 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9532 0))(
  ( (MissingZero!9532 (index!40499 (_ BitVec 32))) (Found!9532 (index!40500 (_ BitVec 32))) (Intermediate!9532 (undefined!10344 Bool) (index!40501 (_ BitVec 32)) (x!87890 (_ BitVec 32))) (Undefined!9532) (MissingVacant!9532 (index!40502 (_ BitVec 32))) )
))
(declare-fun lt!445424 () SeekEntryResult!9532)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63558 (_ BitVec 32)) SeekEntryResult!9532)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007885 (= res!676785 (not (= lt!445424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445423 mask!3464) lt!445423 lt!445425 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1007885 (= lt!445423 (select (store (arr!30600 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007885 (= lt!445425 (array!63559 (store (arr!30600 a!3219) i!1194 k!2224) (size!31102 a!3219)))))

(declare-fun b!1007886 () Bool)

(declare-fun res!676790 () Bool)

(assert (=> b!1007886 (=> (not res!676790) (not e!567177))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1007886 (= res!676790 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007887 () Bool)

(declare-fun res!676780 () Bool)

(declare-fun e!567176 () Bool)

(assert (=> b!1007887 (=> (not res!676780) (not e!567176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63558 (_ BitVec 32)) Bool)

(assert (=> b!1007887 (= res!676780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007888 () Bool)

(assert (=> b!1007888 (= e!567177 false)))

(declare-fun lt!445427 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007888 (= lt!445427 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007889 () Bool)

(declare-fun res!676782 () Bool)

(assert (=> b!1007889 (=> (not res!676782) (not e!567178))))

(assert (=> b!1007889 (= res!676782 (and (= (size!31102 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31102 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31102 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007890 () Bool)

(declare-fun res!676779 () Bool)

(assert (=> b!1007890 (=> (not res!676779) (not e!567176))))

(declare-datatypes ((List!21276 0))(
  ( (Nil!21273) (Cons!21272 (h!22458 (_ BitVec 64)) (t!30277 List!21276)) )
))
(declare-fun arrayNoDuplicates!0 (array!63558 (_ BitVec 32) List!21276) Bool)

(assert (=> b!1007890 (= res!676779 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21273))))

(declare-fun b!1007891 () Bool)

(declare-fun res!676789 () Bool)

(assert (=> b!1007891 (=> (not res!676789) (not e!567178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007891 (= res!676789 (validKeyInArray!0 k!2224))))

(declare-fun b!1007892 () Bool)

(declare-fun res!676786 () Bool)

(assert (=> b!1007892 (=> (not res!676786) (not e!567178))))

(assert (=> b!1007892 (= res!676786 (validKeyInArray!0 (select (arr!30600 a!3219) j!170)))))

(declare-fun b!1007893 () Bool)

(declare-fun e!567179 () Bool)

(assert (=> b!1007893 (= e!567176 e!567179)))

(declare-fun res!676783 () Bool)

(assert (=> b!1007893 (=> (not res!676783) (not e!567179))))

(declare-fun lt!445426 () SeekEntryResult!9532)

(assert (=> b!1007893 (= res!676783 (= lt!445424 lt!445426))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007893 (= lt!445426 (Intermediate!9532 false resIndex!38 resX!38))))

(assert (=> b!1007893 (= lt!445424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30600 a!3219) j!170) mask!3464) (select (arr!30600 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007894 () Bool)

(declare-fun res!676778 () Bool)

(assert (=> b!1007894 (=> (not res!676778) (not e!567178))))

(declare-fun arrayContainsKey!0 (array!63558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007894 (= res!676778 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007895 () Bool)

(assert (=> b!1007895 (= e!567178 e!567176)))

(declare-fun res!676784 () Bool)

(assert (=> b!1007895 (=> (not res!676784) (not e!567176))))

(declare-fun lt!445421 () SeekEntryResult!9532)

(assert (=> b!1007895 (= res!676784 (or (= lt!445421 (MissingVacant!9532 i!1194)) (= lt!445421 (MissingZero!9532 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63558 (_ BitVec 32)) SeekEntryResult!9532)

(assert (=> b!1007895 (= lt!445421 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007896 () Bool)

(assert (=> b!1007896 (= e!567179 e!567180)))

(declare-fun res!676781 () Bool)

(assert (=> b!1007896 (=> (not res!676781) (not e!567180))))

(declare-fun lt!445422 () SeekEntryResult!9532)

(assert (=> b!1007896 (= res!676781 (= lt!445422 lt!445426))))

(assert (=> b!1007896 (= lt!445422 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30600 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007897 () Bool)

(declare-fun res!676791 () Bool)

(assert (=> b!1007897 (=> (not res!676791) (not e!567177))))

(assert (=> b!1007897 (= res!676791 (not (= lt!445422 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445423 lt!445425 mask!3464))))))

(declare-fun b!1007898 () Bool)

(declare-fun res!676788 () Bool)

(assert (=> b!1007898 (=> (not res!676788) (not e!567176))))

(assert (=> b!1007898 (= res!676788 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31102 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31102 a!3219))))))

(assert (= (and start!86910 res!676787) b!1007889))

(assert (= (and b!1007889 res!676782) b!1007892))

(assert (= (and b!1007892 res!676786) b!1007891))

(assert (= (and b!1007891 res!676789) b!1007894))

(assert (= (and b!1007894 res!676778) b!1007895))

(assert (= (and b!1007895 res!676784) b!1007887))

(assert (= (and b!1007887 res!676780) b!1007890))

(assert (= (and b!1007890 res!676779) b!1007898))

(assert (= (and b!1007898 res!676788) b!1007893))

(assert (= (and b!1007893 res!676783) b!1007896))

(assert (= (and b!1007896 res!676781) b!1007885))

(assert (= (and b!1007885 res!676785) b!1007897))

(assert (= (and b!1007897 res!676791) b!1007886))

(assert (= (and b!1007886 res!676790) b!1007888))

(declare-fun m!932711 () Bool)

(assert (=> b!1007893 m!932711))

(assert (=> b!1007893 m!932711))

(declare-fun m!932713 () Bool)

(assert (=> b!1007893 m!932713))

(assert (=> b!1007893 m!932713))

(assert (=> b!1007893 m!932711))

(declare-fun m!932715 () Bool)

(assert (=> b!1007893 m!932715))

(assert (=> b!1007896 m!932711))

(assert (=> b!1007896 m!932711))

(declare-fun m!932717 () Bool)

(assert (=> b!1007896 m!932717))

(declare-fun m!932719 () Bool)

(assert (=> b!1007891 m!932719))

(declare-fun m!932721 () Bool)

(assert (=> b!1007894 m!932721))

(declare-fun m!932723 () Bool)

(assert (=> b!1007897 m!932723))

(declare-fun m!932725 () Bool)

(assert (=> start!86910 m!932725))

(declare-fun m!932727 () Bool)

(assert (=> start!86910 m!932727))

(declare-fun m!932729 () Bool)

(assert (=> b!1007890 m!932729))

(declare-fun m!932731 () Bool)

(assert (=> b!1007895 m!932731))

(declare-fun m!932733 () Bool)

(assert (=> b!1007888 m!932733))

(assert (=> b!1007892 m!932711))

(assert (=> b!1007892 m!932711))

(declare-fun m!932735 () Bool)

(assert (=> b!1007892 m!932735))

(declare-fun m!932737 () Bool)

(assert (=> b!1007887 m!932737))

(declare-fun m!932739 () Bool)

(assert (=> b!1007885 m!932739))

(assert (=> b!1007885 m!932739))

(declare-fun m!932741 () Bool)

(assert (=> b!1007885 m!932741))

(declare-fun m!932743 () Bool)

(assert (=> b!1007885 m!932743))

(declare-fun m!932745 () Bool)

(assert (=> b!1007885 m!932745))

(push 1)

(assert (not b!1007890))

