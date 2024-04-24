; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86794 () Bool)

(assert start!86794)

(declare-fun b!1004731 () Bool)

(declare-fun res!673449 () Bool)

(declare-fun e!565995 () Bool)

(assert (=> b!1004731 (=> (not res!673449) (not e!565995))))

(declare-datatypes ((array!63414 0))(
  ( (array!63415 (arr!30526 (Array (_ BitVec 32) (_ BitVec 64))) (size!31029 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63414)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004731 (= res!673449 (and (= (size!31029 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31029 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31029 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004732 () Bool)

(declare-fun e!565997 () Bool)

(declare-fun e!565996 () Bool)

(assert (=> b!1004732 (= e!565997 e!565996)))

(declare-fun res!673448 () Bool)

(assert (=> b!1004732 (=> (not res!673448) (not e!565996))))

(declare-datatypes ((SeekEntryResult!9394 0))(
  ( (MissingZero!9394 (index!39947 (_ BitVec 32))) (Found!9394 (index!39948 (_ BitVec 32))) (Intermediate!9394 (undefined!10206 Bool) (index!39949 (_ BitVec 32)) (x!87514 (_ BitVec 32))) (Undefined!9394) (MissingVacant!9394 (index!39950 (_ BitVec 32))) )
))
(declare-fun lt!444183 () SeekEntryResult!9394)

(declare-fun lt!444185 () SeekEntryResult!9394)

(assert (=> b!1004732 (= res!673448 (= lt!444183 lt!444185))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63414 (_ BitVec 32)) SeekEntryResult!9394)

(assert (=> b!1004732 (= lt!444183 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30526 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004733 () Bool)

(declare-fun res!673457 () Bool)

(assert (=> b!1004733 (=> (not res!673457) (not e!565995))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004733 (= res!673457 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004734 () Bool)

(declare-fun res!673461 () Bool)

(assert (=> b!1004734 (=> (not res!673461) (not e!565995))))

(declare-fun arrayContainsKey!0 (array!63414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004734 (= res!673461 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!673453 () Bool)

(assert (=> start!86794 (=> (not res!673453) (not e!565995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86794 (= res!673453 (validMask!0 mask!3464))))

(assert (=> start!86794 e!565995))

(declare-fun array_inv!23662 (array!63414) Bool)

(assert (=> start!86794 (array_inv!23662 a!3219)))

(assert (=> start!86794 true))

(declare-fun b!1004735 () Bool)

(declare-fun res!673454 () Bool)

(declare-fun e!565992 () Bool)

(assert (=> b!1004735 (=> (not res!673454) (not e!565992))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004735 (= res!673454 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31029 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31029 a!3219))))))

(declare-fun b!1004736 () Bool)

(declare-fun res!673459 () Bool)

(declare-fun e!565993 () Bool)

(assert (=> b!1004736 (=> (not res!673459) (not e!565993))))

(declare-fun lt!444180 () array!63414)

(declare-fun lt!444184 () (_ BitVec 64))

(assert (=> b!1004736 (= res!673459 (not (= lt!444183 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444184 lt!444180 mask!3464))))))

(declare-fun b!1004737 () Bool)

(declare-fun res!673462 () Bool)

(assert (=> b!1004737 (=> (not res!673462) (not e!565993))))

(assert (=> b!1004737 (= res!673462 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004738 () Bool)

(assert (=> b!1004738 (= e!565995 e!565992)))

(declare-fun res!673451 () Bool)

(assert (=> b!1004738 (=> (not res!673451) (not e!565992))))

(declare-fun lt!444179 () SeekEntryResult!9394)

(assert (=> b!1004738 (= res!673451 (or (= lt!444179 (MissingVacant!9394 i!1194)) (= lt!444179 (MissingZero!9394 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63414 (_ BitVec 32)) SeekEntryResult!9394)

(assert (=> b!1004738 (= lt!444179 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1004739 () Bool)

(assert (=> b!1004739 (= e!565996 e!565993)))

(declare-fun res!673463 () Bool)

(assert (=> b!1004739 (=> (not res!673463) (not e!565993))))

(declare-fun lt!444181 () SeekEntryResult!9394)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004739 (= res!673463 (not (= lt!444181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444184 mask!3464) lt!444184 lt!444180 mask!3464))))))

(assert (=> b!1004739 (= lt!444184 (select (store (arr!30526 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004739 (= lt!444180 (array!63415 (store (arr!30526 a!3219) i!1194 k0!2224) (size!31029 a!3219)))))

(declare-fun b!1004740 () Bool)

(declare-fun res!673456 () Bool)

(assert (=> b!1004740 (=> (not res!673456) (not e!565995))))

(assert (=> b!1004740 (= res!673456 (validKeyInArray!0 (select (arr!30526 a!3219) j!170)))))

(declare-fun b!1004741 () Bool)

(declare-fun res!673460 () Bool)

(assert (=> b!1004741 (=> (not res!673460) (not e!565992))))

(declare-datatypes ((List!21173 0))(
  ( (Nil!21170) (Cons!21169 (h!22355 (_ BitVec 64)) (t!30166 List!21173)) )
))
(declare-fun arrayNoDuplicates!0 (array!63414 (_ BitVec 32) List!21173) Bool)

(assert (=> b!1004741 (= res!673460 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21170))))

(declare-fun b!1004742 () Bool)

(assert (=> b!1004742 (= e!565992 e!565997)))

(declare-fun res!673458 () Bool)

(assert (=> b!1004742 (=> (not res!673458) (not e!565997))))

(assert (=> b!1004742 (= res!673458 (= lt!444181 lt!444185))))

(assert (=> b!1004742 (= lt!444185 (Intermediate!9394 false resIndex!38 resX!38))))

(assert (=> b!1004742 (= lt!444181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30526 a!3219) j!170) mask!3464) (select (arr!30526 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004743 () Bool)

(declare-fun e!565994 () Bool)

(assert (=> b!1004743 (= e!565994 false)))

(declare-fun lt!444182 () SeekEntryResult!9394)

(declare-fun lt!444178 () (_ BitVec 32))

(assert (=> b!1004743 (= lt!444182 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444178 lt!444184 lt!444180 mask!3464))))

(declare-fun b!1004744 () Bool)

(assert (=> b!1004744 (= e!565993 e!565994)))

(declare-fun res!673450 () Bool)

(assert (=> b!1004744 (=> (not res!673450) (not e!565994))))

(assert (=> b!1004744 (= res!673450 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444178 #b00000000000000000000000000000000) (bvslt lt!444178 (size!31029 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004744 (= lt!444178 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1004745 () Bool)

(declare-fun res!673455 () Bool)

(assert (=> b!1004745 (=> (not res!673455) (not e!565992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63414 (_ BitVec 32)) Bool)

(assert (=> b!1004745 (= res!673455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004746 () Bool)

(declare-fun res!673452 () Bool)

(assert (=> b!1004746 (=> (not res!673452) (not e!565994))))

(assert (=> b!1004746 (= res!673452 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444178 (select (arr!30526 a!3219) j!170) a!3219 mask!3464) lt!444185))))

(assert (= (and start!86794 res!673453) b!1004731))

(assert (= (and b!1004731 res!673449) b!1004740))

(assert (= (and b!1004740 res!673456) b!1004733))

(assert (= (and b!1004733 res!673457) b!1004734))

(assert (= (and b!1004734 res!673461) b!1004738))

(assert (= (and b!1004738 res!673451) b!1004745))

(assert (= (and b!1004745 res!673455) b!1004741))

(assert (= (and b!1004741 res!673460) b!1004735))

(assert (= (and b!1004735 res!673454) b!1004742))

(assert (= (and b!1004742 res!673458) b!1004732))

(assert (= (and b!1004732 res!673448) b!1004739))

(assert (= (and b!1004739 res!673463) b!1004736))

(assert (= (and b!1004736 res!673459) b!1004737))

(assert (= (and b!1004737 res!673462) b!1004744))

(assert (= (and b!1004744 res!673450) b!1004746))

(assert (= (and b!1004746 res!673452) b!1004743))

(declare-fun m!930713 () Bool)

(assert (=> b!1004732 m!930713))

(assert (=> b!1004732 m!930713))

(declare-fun m!930715 () Bool)

(assert (=> b!1004732 m!930715))

(declare-fun m!930717 () Bool)

(assert (=> b!1004738 m!930717))

(declare-fun m!930719 () Bool)

(assert (=> start!86794 m!930719))

(declare-fun m!930721 () Bool)

(assert (=> start!86794 m!930721))

(assert (=> b!1004740 m!930713))

(assert (=> b!1004740 m!930713))

(declare-fun m!930723 () Bool)

(assert (=> b!1004740 m!930723))

(declare-fun m!930725 () Bool)

(assert (=> b!1004736 m!930725))

(declare-fun m!930727 () Bool)

(assert (=> b!1004739 m!930727))

(assert (=> b!1004739 m!930727))

(declare-fun m!930729 () Bool)

(assert (=> b!1004739 m!930729))

(declare-fun m!930731 () Bool)

(assert (=> b!1004739 m!930731))

(declare-fun m!930733 () Bool)

(assert (=> b!1004739 m!930733))

(declare-fun m!930735 () Bool)

(assert (=> b!1004733 m!930735))

(assert (=> b!1004742 m!930713))

(assert (=> b!1004742 m!930713))

(declare-fun m!930737 () Bool)

(assert (=> b!1004742 m!930737))

(assert (=> b!1004742 m!930737))

(assert (=> b!1004742 m!930713))

(declare-fun m!930739 () Bool)

(assert (=> b!1004742 m!930739))

(declare-fun m!930741 () Bool)

(assert (=> b!1004734 m!930741))

(declare-fun m!930743 () Bool)

(assert (=> b!1004743 m!930743))

(declare-fun m!930745 () Bool)

(assert (=> b!1004741 m!930745))

(declare-fun m!930747 () Bool)

(assert (=> b!1004744 m!930747))

(declare-fun m!930749 () Bool)

(assert (=> b!1004745 m!930749))

(assert (=> b!1004746 m!930713))

(assert (=> b!1004746 m!930713))

(declare-fun m!930751 () Bool)

(assert (=> b!1004746 m!930751))

(check-sat (not b!1004746) (not b!1004745) (not start!86794) (not b!1004743) (not b!1004733) (not b!1004736) (not b!1004742) (not b!1004734) (not b!1004740) (not b!1004738) (not b!1004741) (not b!1004739) (not b!1004744) (not b!1004732))
(check-sat)
