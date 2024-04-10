; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86748 () Bool)

(assert start!86748)

(declare-fun b!1005630 () Bool)

(declare-fun res!674721 () Bool)

(declare-fun e!566226 () Bool)

(assert (=> b!1005630 (=> (not res!674721) (not e!566226))))

(declare-datatypes ((array!63447 0))(
  ( (array!63448 (arr!30546 (Array (_ BitVec 32) (_ BitVec 64))) (size!31048 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63447)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005630 (= res!674721 (validKeyInArray!0 (select (arr!30546 a!3219) j!170)))))

(declare-fun b!1005631 () Bool)

(declare-fun res!674725 () Bool)

(assert (=> b!1005631 (=> (not res!674725) (not e!566226))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1005631 (= res!674725 (validKeyInArray!0 k!2224))))

(declare-fun b!1005632 () Bool)

(declare-fun e!566227 () Bool)

(assert (=> b!1005632 (= e!566226 e!566227)))

(declare-fun res!674726 () Bool)

(assert (=> b!1005632 (=> (not res!674726) (not e!566227))))

(declare-datatypes ((SeekEntryResult!9478 0))(
  ( (MissingZero!9478 (index!40283 (_ BitVec 32))) (Found!9478 (index!40284 (_ BitVec 32))) (Intermediate!9478 (undefined!10290 Bool) (index!40285 (_ BitVec 32)) (x!87686 (_ BitVec 32))) (Undefined!9478) (MissingVacant!9478 (index!40286 (_ BitVec 32))) )
))
(declare-fun lt!444593 () SeekEntryResult!9478)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005632 (= res!674726 (or (= lt!444593 (MissingVacant!9478 i!1194)) (= lt!444593 (MissingZero!9478 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63447 (_ BitVec 32)) SeekEntryResult!9478)

(assert (=> b!1005632 (= lt!444593 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005633 () Bool)

(declare-fun res!674723 () Bool)

(assert (=> b!1005633 (=> (not res!674723) (not e!566227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63447 (_ BitVec 32)) Bool)

(assert (=> b!1005633 (= res!674723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005634 () Bool)

(declare-fun res!674727 () Bool)

(assert (=> b!1005634 (=> (not res!674727) (not e!566227))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63447 (_ BitVec 32)) SeekEntryResult!9478)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005634 (= res!674727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30546 a!3219) j!170) mask!3464) (select (arr!30546 a!3219) j!170) a!3219 mask!3464) (Intermediate!9478 false resIndex!38 resX!38)))))

(declare-fun b!1005635 () Bool)

(declare-fun res!674722 () Bool)

(assert (=> b!1005635 (=> (not res!674722) (not e!566226))))

(assert (=> b!1005635 (= res!674722 (and (= (size!31048 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31048 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31048 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!674719 () Bool)

(assert (=> start!86748 (=> (not res!674719) (not e!566226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86748 (= res!674719 (validMask!0 mask!3464))))

(assert (=> start!86748 e!566226))

(declare-fun array_inv!23670 (array!63447) Bool)

(assert (=> start!86748 (array_inv!23670 a!3219)))

(assert (=> start!86748 true))

(declare-fun b!1005636 () Bool)

(assert (=> b!1005636 (= e!566227 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444592 () SeekEntryResult!9478)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1005636 (= lt!444592 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30546 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005637 () Bool)

(declare-fun res!674724 () Bool)

(assert (=> b!1005637 (=> (not res!674724) (not e!566226))))

(declare-fun arrayContainsKey!0 (array!63447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005637 (= res!674724 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005638 () Bool)

(declare-fun res!674718 () Bool)

(assert (=> b!1005638 (=> (not res!674718) (not e!566227))))

(assert (=> b!1005638 (= res!674718 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31048 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31048 a!3219))))))

(declare-fun b!1005639 () Bool)

(declare-fun res!674720 () Bool)

(assert (=> b!1005639 (=> (not res!674720) (not e!566227))))

(declare-datatypes ((List!21222 0))(
  ( (Nil!21219) (Cons!21218 (h!22401 (_ BitVec 64)) (t!30223 List!21222)) )
))
(declare-fun arrayNoDuplicates!0 (array!63447 (_ BitVec 32) List!21222) Bool)

(assert (=> b!1005639 (= res!674720 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21219))))

(assert (= (and start!86748 res!674719) b!1005635))

(assert (= (and b!1005635 res!674722) b!1005630))

(assert (= (and b!1005630 res!674721) b!1005631))

(assert (= (and b!1005631 res!674725) b!1005637))

(assert (= (and b!1005637 res!674724) b!1005632))

(assert (= (and b!1005632 res!674726) b!1005633))

(assert (= (and b!1005633 res!674723) b!1005639))

(assert (= (and b!1005639 res!674720) b!1005638))

(assert (= (and b!1005638 res!674718) b!1005634))

(assert (= (and b!1005634 res!674727) b!1005636))

(declare-fun m!930833 () Bool)

(assert (=> b!1005634 m!930833))

(assert (=> b!1005634 m!930833))

(declare-fun m!930835 () Bool)

(assert (=> b!1005634 m!930835))

(assert (=> b!1005634 m!930835))

(assert (=> b!1005634 m!930833))

(declare-fun m!930837 () Bool)

(assert (=> b!1005634 m!930837))

(declare-fun m!930839 () Bool)

(assert (=> b!1005639 m!930839))

(declare-fun m!930841 () Bool)

(assert (=> b!1005632 m!930841))

(declare-fun m!930843 () Bool)

(assert (=> b!1005637 m!930843))

(declare-fun m!930845 () Bool)

(assert (=> b!1005631 m!930845))

(assert (=> b!1005636 m!930833))

(assert (=> b!1005636 m!930833))

(declare-fun m!930847 () Bool)

(assert (=> b!1005636 m!930847))

(declare-fun m!930849 () Bool)

(assert (=> start!86748 m!930849))

(declare-fun m!930851 () Bool)

(assert (=> start!86748 m!930851))

(assert (=> b!1005630 m!930833))

(assert (=> b!1005630 m!930833))

(declare-fun m!930853 () Bool)

(assert (=> b!1005630 m!930853))

(declare-fun m!930855 () Bool)

(assert (=> b!1005633 m!930855))

(push 1)

(assert (not b!1005633))

(assert (not b!1005639))

(assert (not b!1005636))

(assert (not b!1005632))

(assert (not b!1005630))

(assert (not b!1005634))

(assert (not b!1005631))

(assert (not start!86748))

