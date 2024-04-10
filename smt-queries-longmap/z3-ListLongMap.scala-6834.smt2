; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86044 () Bool)

(assert start!86044)

(declare-fun b!996676 () Bool)

(declare-fun e!562277 () Bool)

(declare-fun e!562278 () Bool)

(assert (=> b!996676 (= e!562277 e!562278)))

(declare-fun res!666793 () Bool)

(assert (=> b!996676 (=> (not res!666793) (not e!562278))))

(declare-datatypes ((SeekEntryResult!9288 0))(
  ( (MissingZero!9288 (index!39523 (_ BitVec 32))) (Found!9288 (index!39524 (_ BitVec 32))) (Intermediate!9288 (undefined!10100 Bool) (index!39525 (_ BitVec 32)) (x!86956 (_ BitVec 32))) (Undefined!9288) (MissingVacant!9288 (index!39526 (_ BitVec 32))) )
))
(declare-fun lt!441278 () SeekEntryResult!9288)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996676 (= res!666793 (or (= lt!441278 (MissingVacant!9288 i!1194)) (= lt!441278 (MissingZero!9288 i!1194))))))

(declare-datatypes ((array!63049 0))(
  ( (array!63050 (arr!30356 (Array (_ BitVec 32) (_ BitVec 64))) (size!30858 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63049)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63049 (_ BitVec 32)) SeekEntryResult!9288)

(assert (=> b!996676 (= lt!441278 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996677 () Bool)

(declare-fun res!666790 () Bool)

(assert (=> b!996677 (=> (not res!666790) (not e!562277))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996677 (= res!666790 (validKeyInArray!0 (select (arr!30356 a!3219) j!170)))))

(declare-fun res!666792 () Bool)

(assert (=> start!86044 (=> (not res!666792) (not e!562277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86044 (= res!666792 (validMask!0 mask!3464))))

(assert (=> start!86044 e!562277))

(declare-fun array_inv!23480 (array!63049) Bool)

(assert (=> start!86044 (array_inv!23480 a!3219)))

(assert (=> start!86044 true))

(declare-fun b!996678 () Bool)

(declare-fun res!666796 () Bool)

(assert (=> b!996678 (=> (not res!666796) (not e!562278))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996678 (= res!666796 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30858 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30858 a!3219))))))

(declare-fun b!996679 () Bool)

(declare-fun res!666798 () Bool)

(assert (=> b!996679 (=> (not res!666798) (not e!562277))))

(declare-fun arrayContainsKey!0 (array!63049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996679 (= res!666798 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996680 () Bool)

(declare-fun res!666795 () Bool)

(assert (=> b!996680 (=> (not res!666795) (not e!562277))))

(assert (=> b!996680 (= res!666795 (and (= (size!30858 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30858 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30858 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996681 () Bool)

(declare-fun res!666791 () Bool)

(assert (=> b!996681 (=> (not res!666791) (not e!562278))))

(declare-datatypes ((List!21032 0))(
  ( (Nil!21029) (Cons!21028 (h!22193 (_ BitVec 64)) (t!30033 List!21032)) )
))
(declare-fun arrayNoDuplicates!0 (array!63049 (_ BitVec 32) List!21032) Bool)

(assert (=> b!996681 (= res!666791 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21029))))

(declare-fun b!996682 () Bool)

(declare-fun res!666797 () Bool)

(assert (=> b!996682 (=> (not res!666797) (not e!562278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63049 (_ BitVec 32)) Bool)

(assert (=> b!996682 (= res!666797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996683 () Bool)

(assert (=> b!996683 (= e!562278 false)))

(declare-fun lt!441277 () SeekEntryResult!9288)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63049 (_ BitVec 32)) SeekEntryResult!9288)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996683 (= lt!441277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30356 a!3219) j!170) mask!3464) (select (arr!30356 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996684 () Bool)

(declare-fun res!666794 () Bool)

(assert (=> b!996684 (=> (not res!666794) (not e!562277))))

(assert (=> b!996684 (= res!666794 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86044 res!666792) b!996680))

(assert (= (and b!996680 res!666795) b!996677))

(assert (= (and b!996677 res!666790) b!996684))

(assert (= (and b!996684 res!666794) b!996679))

(assert (= (and b!996679 res!666798) b!996676))

(assert (= (and b!996676 res!666793) b!996682))

(assert (= (and b!996682 res!666797) b!996681))

(assert (= (and b!996681 res!666791) b!996678))

(assert (= (and b!996678 res!666796) b!996683))

(declare-fun m!923739 () Bool)

(assert (=> start!86044 m!923739))

(declare-fun m!923741 () Bool)

(assert (=> start!86044 m!923741))

(declare-fun m!923743 () Bool)

(assert (=> b!996683 m!923743))

(assert (=> b!996683 m!923743))

(declare-fun m!923745 () Bool)

(assert (=> b!996683 m!923745))

(assert (=> b!996683 m!923745))

(assert (=> b!996683 m!923743))

(declare-fun m!923747 () Bool)

(assert (=> b!996683 m!923747))

(declare-fun m!923749 () Bool)

(assert (=> b!996684 m!923749))

(declare-fun m!923751 () Bool)

(assert (=> b!996679 m!923751))

(declare-fun m!923753 () Bool)

(assert (=> b!996676 m!923753))

(assert (=> b!996677 m!923743))

(assert (=> b!996677 m!923743))

(declare-fun m!923755 () Bool)

(assert (=> b!996677 m!923755))

(declare-fun m!923757 () Bool)

(assert (=> b!996682 m!923757))

(declare-fun m!923759 () Bool)

(assert (=> b!996681 m!923759))

(check-sat (not b!996681) (not b!996679) (not b!996683) (not b!996676) (not b!996684) (not b!996677) (not b!996682) (not start!86044))
