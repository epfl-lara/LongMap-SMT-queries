; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86470 () Bool)

(assert start!86470)

(declare-fun b!999762 () Bool)

(declare-fun res!668842 () Bool)

(declare-fun e!563849 () Bool)

(assert (=> b!999762 (=> (not res!668842) (not e!563849))))

(declare-datatypes ((array!63192 0))(
  ( (array!63193 (arr!30418 (Array (_ BitVec 32) (_ BitVec 64))) (size!30921 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63192)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63192 (_ BitVec 32)) Bool)

(assert (=> b!999762 (= res!668842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999763 () Bool)

(declare-fun res!668835 () Bool)

(assert (=> b!999763 (=> (not res!668835) (not e!563849))))

(declare-datatypes ((List!21065 0))(
  ( (Nil!21062) (Cons!21061 (h!22241 (_ BitVec 64)) (t!30058 List!21065)) )
))
(declare-fun arrayNoDuplicates!0 (array!63192 (_ BitVec 32) List!21065) Bool)

(assert (=> b!999763 (= res!668835 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21062))))

(declare-fun b!999764 () Bool)

(declare-fun res!668841 () Bool)

(assert (=> b!999764 (=> (not res!668841) (not e!563849))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999764 (= res!668841 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30921 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30921 a!3219))))))

(declare-fun res!668833 () Bool)

(declare-fun e!563847 () Bool)

(assert (=> start!86470 (=> (not res!668833) (not e!563847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86470 (= res!668833 (validMask!0 mask!3464))))

(assert (=> start!86470 e!563847))

(declare-fun array_inv!23554 (array!63192) Bool)

(assert (=> start!86470 (array_inv!23554 a!3219)))

(assert (=> start!86470 true))

(declare-fun b!999765 () Bool)

(declare-fun e!563850 () Bool)

(assert (=> b!999765 (= e!563850 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun lt!442197 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999765 (= lt!442197 (toIndex!0 (select (store (arr!30418 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!999766 () Bool)

(declare-fun res!668839 () Bool)

(assert (=> b!999766 (=> (not res!668839) (not e!563847))))

(assert (=> b!999766 (= res!668839 (and (= (size!30921 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30921 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30921 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999767 () Bool)

(declare-fun res!668837 () Bool)

(assert (=> b!999767 (=> (not res!668837) (not e!563847))))

(declare-fun arrayContainsKey!0 (array!63192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999767 (= res!668837 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999768 () Bool)

(declare-fun res!668836 () Bool)

(assert (=> b!999768 (=> (not res!668836) (not e!563847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999768 (= res!668836 (validKeyInArray!0 k0!2224))))

(declare-fun b!999769 () Bool)

(declare-fun res!668843 () Bool)

(assert (=> b!999769 (=> (not res!668843) (not e!563850))))

(declare-datatypes ((SeekEntryResult!9286 0))(
  ( (MissingZero!9286 (index!39515 (_ BitVec 32))) (Found!9286 (index!39516 (_ BitVec 32))) (Intermediate!9286 (undefined!10098 Bool) (index!39517 (_ BitVec 32)) (x!87106 (_ BitVec 32))) (Undefined!9286) (MissingVacant!9286 (index!39518 (_ BitVec 32))) )
))
(declare-fun lt!442199 () SeekEntryResult!9286)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63192 (_ BitVec 32)) SeekEntryResult!9286)

(assert (=> b!999769 (= res!668843 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30418 a!3219) j!170) a!3219 mask!3464) lt!442199))))

(declare-fun b!999770 () Bool)

(assert (=> b!999770 (= e!563847 e!563849)))

(declare-fun res!668840 () Bool)

(assert (=> b!999770 (=> (not res!668840) (not e!563849))))

(declare-fun lt!442198 () SeekEntryResult!9286)

(assert (=> b!999770 (= res!668840 (or (= lt!442198 (MissingVacant!9286 i!1194)) (= lt!442198 (MissingZero!9286 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63192 (_ BitVec 32)) SeekEntryResult!9286)

(assert (=> b!999770 (= lt!442198 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999771 () Bool)

(declare-fun res!668834 () Bool)

(assert (=> b!999771 (=> (not res!668834) (not e!563847))))

(assert (=> b!999771 (= res!668834 (validKeyInArray!0 (select (arr!30418 a!3219) j!170)))))

(declare-fun b!999772 () Bool)

(assert (=> b!999772 (= e!563849 e!563850)))

(declare-fun res!668838 () Bool)

(assert (=> b!999772 (=> (not res!668838) (not e!563850))))

(assert (=> b!999772 (= res!668838 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30418 a!3219) j!170) mask!3464) (select (arr!30418 a!3219) j!170) a!3219 mask!3464) lt!442199))))

(assert (=> b!999772 (= lt!442199 (Intermediate!9286 false resIndex!38 resX!38))))

(assert (= (and start!86470 res!668833) b!999766))

(assert (= (and b!999766 res!668839) b!999771))

(assert (= (and b!999771 res!668834) b!999768))

(assert (= (and b!999768 res!668836) b!999767))

(assert (= (and b!999767 res!668837) b!999770))

(assert (= (and b!999770 res!668840) b!999762))

(assert (= (and b!999762 res!668842) b!999763))

(assert (= (and b!999763 res!668835) b!999764))

(assert (= (and b!999764 res!668841) b!999772))

(assert (= (and b!999772 res!668838) b!999769))

(assert (= (and b!999769 res!668843) b!999765))

(declare-fun m!926561 () Bool)

(assert (=> start!86470 m!926561))

(declare-fun m!926563 () Bool)

(assert (=> start!86470 m!926563))

(declare-fun m!926565 () Bool)

(assert (=> b!999767 m!926565))

(declare-fun m!926567 () Bool)

(assert (=> b!999763 m!926567))

(declare-fun m!926569 () Bool)

(assert (=> b!999765 m!926569))

(declare-fun m!926571 () Bool)

(assert (=> b!999765 m!926571))

(assert (=> b!999765 m!926571))

(declare-fun m!926573 () Bool)

(assert (=> b!999765 m!926573))

(declare-fun m!926575 () Bool)

(assert (=> b!999768 m!926575))

(declare-fun m!926577 () Bool)

(assert (=> b!999762 m!926577))

(declare-fun m!926579 () Bool)

(assert (=> b!999770 m!926579))

(declare-fun m!926581 () Bool)

(assert (=> b!999772 m!926581))

(assert (=> b!999772 m!926581))

(declare-fun m!926583 () Bool)

(assert (=> b!999772 m!926583))

(assert (=> b!999772 m!926583))

(assert (=> b!999772 m!926581))

(declare-fun m!926585 () Bool)

(assert (=> b!999772 m!926585))

(assert (=> b!999769 m!926581))

(assert (=> b!999769 m!926581))

(declare-fun m!926587 () Bool)

(assert (=> b!999769 m!926587))

(assert (=> b!999771 m!926581))

(assert (=> b!999771 m!926581))

(declare-fun m!926589 () Bool)

(assert (=> b!999771 m!926589))

(check-sat (not b!999763) (not b!999765) (not b!999769) (not b!999768) (not b!999771) (not start!86470) (not b!999772) (not b!999767) (not b!999762) (not b!999770))
(check-sat)
