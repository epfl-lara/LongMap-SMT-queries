; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86380 () Bool)

(assert start!86380)

(declare-fun b!999629 () Bool)

(declare-fun res!669109 () Bool)

(declare-fun e!563614 () Bool)

(assert (=> b!999629 (=> (not res!669109) (not e!563614))))

(declare-datatypes ((array!63181 0))(
  ( (array!63182 (arr!30416 (Array (_ BitVec 32) (_ BitVec 64))) (size!30918 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63181)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9348 0))(
  ( (MissingZero!9348 (index!39763 (_ BitVec 32))) (Found!9348 (index!39764 (_ BitVec 32))) (Intermediate!9348 (undefined!10160 Bool) (index!39765 (_ BitVec 32)) (x!87200 (_ BitVec 32))) (Undefined!9348) (MissingVacant!9348 (index!39766 (_ BitVec 32))) )
))
(declare-fun lt!442078 () SeekEntryResult!9348)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63181 (_ BitVec 32)) SeekEntryResult!9348)

(assert (=> b!999629 (= res!669109 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30416 a!3219) j!170) a!3219 mask!3464) lt!442078))))

(declare-fun b!999630 () Bool)

(declare-fun e!563611 () Bool)

(assert (=> b!999630 (= e!563611 e!563614)))

(declare-fun res!669112 () Bool)

(assert (=> b!999630 (=> (not res!669112) (not e!563614))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999630 (= res!669112 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30416 a!3219) j!170) mask!3464) (select (arr!30416 a!3219) j!170) a!3219 mask!3464) lt!442078))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999630 (= lt!442078 (Intermediate!9348 false resIndex!38 resX!38))))

(declare-fun res!669115 () Bool)

(declare-fun e!563613 () Bool)

(assert (=> start!86380 (=> (not res!669115) (not e!563613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86380 (= res!669115 (validMask!0 mask!3464))))

(assert (=> start!86380 e!563613))

(declare-fun array_inv!23540 (array!63181) Bool)

(assert (=> start!86380 (array_inv!23540 a!3219)))

(assert (=> start!86380 true))

(declare-fun b!999631 () Bool)

(declare-fun res!669110 () Bool)

(assert (=> b!999631 (=> (not res!669110) (not e!563611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63181 (_ BitVec 32)) Bool)

(assert (=> b!999631 (= res!669110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999632 () Bool)

(declare-fun res!669117 () Bool)

(assert (=> b!999632 (=> (not res!669117) (not e!563611))))

(assert (=> b!999632 (= res!669117 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30918 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30918 a!3219))))))

(declare-fun b!999633 () Bool)

(declare-fun res!669113 () Bool)

(assert (=> b!999633 (=> (not res!669113) (not e!563613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999633 (= res!669113 (validKeyInArray!0 (select (arr!30416 a!3219) j!170)))))

(declare-fun b!999634 () Bool)

(declare-fun res!669107 () Bool)

(assert (=> b!999634 (=> (not res!669107) (not e!563613))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999634 (= res!669107 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999635 () Bool)

(declare-fun res!669114 () Bool)

(assert (=> b!999635 (=> (not res!669114) (not e!563613))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999635 (= res!669114 (and (= (size!30918 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30918 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30918 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999636 () Bool)

(assert (=> b!999636 (= e!563613 e!563611)))

(declare-fun res!669108 () Bool)

(assert (=> b!999636 (=> (not res!669108) (not e!563611))))

(declare-fun lt!442079 () SeekEntryResult!9348)

(assert (=> b!999636 (= res!669108 (or (= lt!442079 (MissingVacant!9348 i!1194)) (= lt!442079 (MissingZero!9348 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63181 (_ BitVec 32)) SeekEntryResult!9348)

(assert (=> b!999636 (= lt!442079 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999637 () Bool)

(declare-fun res!669116 () Bool)

(assert (=> b!999637 (=> (not res!669116) (not e!563611))))

(declare-datatypes ((List!21092 0))(
  ( (Nil!21089) (Cons!21088 (h!22265 (_ BitVec 64)) (t!30093 List!21092)) )
))
(declare-fun arrayNoDuplicates!0 (array!63181 (_ BitVec 32) List!21092) Bool)

(assert (=> b!999637 (= res!669116 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21089))))

(declare-fun b!999638 () Bool)

(declare-fun res!669111 () Bool)

(assert (=> b!999638 (=> (not res!669111) (not e!563613))))

(assert (=> b!999638 (= res!669111 (validKeyInArray!0 k0!2224))))

(declare-fun b!999639 () Bool)

(assert (=> b!999639 (= e!563614 false)))

(declare-fun lt!442077 () SeekEntryResult!9348)

(assert (=> b!999639 (= lt!442077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30416 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30416 a!3219) i!1194 k0!2224) j!170) (array!63182 (store (arr!30416 a!3219) i!1194 k0!2224) (size!30918 a!3219)) mask!3464))))

(assert (= (and start!86380 res!669115) b!999635))

(assert (= (and b!999635 res!669114) b!999633))

(assert (= (and b!999633 res!669113) b!999638))

(assert (= (and b!999638 res!669111) b!999634))

(assert (= (and b!999634 res!669107) b!999636))

(assert (= (and b!999636 res!669108) b!999631))

(assert (= (and b!999631 res!669110) b!999637))

(assert (= (and b!999637 res!669116) b!999632))

(assert (= (and b!999632 res!669117) b!999630))

(assert (= (and b!999630 res!669112) b!999629))

(assert (= (and b!999629 res!669109) b!999639))

(declare-fun m!925855 () Bool)

(assert (=> b!999639 m!925855))

(declare-fun m!925857 () Bool)

(assert (=> b!999639 m!925857))

(assert (=> b!999639 m!925857))

(declare-fun m!925859 () Bool)

(assert (=> b!999639 m!925859))

(assert (=> b!999639 m!925859))

(assert (=> b!999639 m!925857))

(declare-fun m!925861 () Bool)

(assert (=> b!999639 m!925861))

(declare-fun m!925863 () Bool)

(assert (=> b!999638 m!925863))

(declare-fun m!925865 () Bool)

(assert (=> b!999631 m!925865))

(declare-fun m!925867 () Bool)

(assert (=> start!86380 m!925867))

(declare-fun m!925869 () Bool)

(assert (=> start!86380 m!925869))

(declare-fun m!925871 () Bool)

(assert (=> b!999630 m!925871))

(assert (=> b!999630 m!925871))

(declare-fun m!925873 () Bool)

(assert (=> b!999630 m!925873))

(assert (=> b!999630 m!925873))

(assert (=> b!999630 m!925871))

(declare-fun m!925875 () Bool)

(assert (=> b!999630 m!925875))

(assert (=> b!999633 m!925871))

(assert (=> b!999633 m!925871))

(declare-fun m!925877 () Bool)

(assert (=> b!999633 m!925877))

(declare-fun m!925879 () Bool)

(assert (=> b!999637 m!925879))

(assert (=> b!999629 m!925871))

(assert (=> b!999629 m!925871))

(declare-fun m!925881 () Bool)

(assert (=> b!999629 m!925881))

(declare-fun m!925883 () Bool)

(assert (=> b!999634 m!925883))

(declare-fun m!925885 () Bool)

(assert (=> b!999636 m!925885))

(check-sat (not b!999630) (not b!999634) (not b!999631) (not b!999639) (not b!999633) (not start!86380) (not b!999636) (not b!999629) (not b!999637) (not b!999638))
(check-sat)
