; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86392 () Bool)

(assert start!86392)

(declare-fun b!999836 () Bool)

(declare-fun res!669315 () Bool)

(declare-fun e!563686 () Bool)

(assert (=> b!999836 (=> (not res!669315) (not e!563686))))

(declare-datatypes ((array!63193 0))(
  ( (array!63194 (arr!30422 (Array (_ BitVec 32) (_ BitVec 64))) (size!30924 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63193)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999836 (= res!669315 (and (= (size!30924 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30924 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30924 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999837 () Bool)

(declare-fun res!669324 () Bool)

(declare-fun e!563683 () Bool)

(assert (=> b!999837 (=> (not res!669324) (not e!563683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63193 (_ BitVec 32)) Bool)

(assert (=> b!999837 (= res!669324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999838 () Bool)

(declare-fun res!669322 () Bool)

(declare-fun e!563684 () Bool)

(assert (=> b!999838 (=> (not res!669322) (not e!563684))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9354 0))(
  ( (MissingZero!9354 (index!39787 (_ BitVec 32))) (Found!9354 (index!39788 (_ BitVec 32))) (Intermediate!9354 (undefined!10166 Bool) (index!39789 (_ BitVec 32)) (x!87222 (_ BitVec 32))) (Undefined!9354) (MissingVacant!9354 (index!39790 (_ BitVec 32))) )
))
(declare-fun lt!442132 () SeekEntryResult!9354)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63193 (_ BitVec 32)) SeekEntryResult!9354)

(assert (=> b!999838 (= res!669322 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30422 a!3219) j!170) a!3219 mask!3464) lt!442132))))

(declare-fun res!669314 () Bool)

(assert (=> start!86392 (=> (not res!669314) (not e!563686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86392 (= res!669314 (validMask!0 mask!3464))))

(assert (=> start!86392 e!563686))

(declare-fun array_inv!23546 (array!63193) Bool)

(assert (=> start!86392 (array_inv!23546 a!3219)))

(assert (=> start!86392 true))

(declare-fun b!999839 () Bool)

(declare-fun res!669318 () Bool)

(assert (=> b!999839 (=> (not res!669318) (not e!563686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999839 (= res!669318 (validKeyInArray!0 (select (arr!30422 a!3219) j!170)))))

(declare-fun b!999840 () Bool)

(declare-fun res!669319 () Bool)

(assert (=> b!999840 (=> (not res!669319) (not e!563683))))

(declare-datatypes ((List!21098 0))(
  ( (Nil!21095) (Cons!21094 (h!22271 (_ BitVec 64)) (t!30099 List!21098)) )
))
(declare-fun arrayNoDuplicates!0 (array!63193 (_ BitVec 32) List!21098) Bool)

(assert (=> b!999840 (= res!669319 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21095))))

(declare-fun b!999841 () Bool)

(declare-fun res!669320 () Bool)

(assert (=> b!999841 (=> (not res!669320) (not e!563686))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!999841 (= res!669320 (validKeyInArray!0 k0!2224))))

(declare-fun b!999842 () Bool)

(assert (=> b!999842 (= e!563683 e!563684)))

(declare-fun res!669317 () Bool)

(assert (=> b!999842 (=> (not res!669317) (not e!563684))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999842 (= res!669317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30422 a!3219) j!170) mask!3464) (select (arr!30422 a!3219) j!170) a!3219 mask!3464) lt!442132))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999842 (= lt!442132 (Intermediate!9354 false resIndex!38 resX!38))))

(declare-fun b!999843 () Bool)

(declare-fun res!669323 () Bool)

(assert (=> b!999843 (=> (not res!669323) (not e!563683))))

(assert (=> b!999843 (= res!669323 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30924 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30924 a!3219))))))

(declare-fun b!999844 () Bool)

(assert (=> b!999844 (= e!563684 false)))

(declare-fun lt!442131 () SeekEntryResult!9354)

(assert (=> b!999844 (= lt!442131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30422 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30422 a!3219) i!1194 k0!2224) j!170) (array!63194 (store (arr!30422 a!3219) i!1194 k0!2224) (size!30924 a!3219)) mask!3464))))

(declare-fun b!999845 () Bool)

(assert (=> b!999845 (= e!563686 e!563683)))

(declare-fun res!669321 () Bool)

(assert (=> b!999845 (=> (not res!669321) (not e!563683))))

(declare-fun lt!442133 () SeekEntryResult!9354)

(assert (=> b!999845 (= res!669321 (or (= lt!442133 (MissingVacant!9354 i!1194)) (= lt!442133 (MissingZero!9354 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63193 (_ BitVec 32)) SeekEntryResult!9354)

(assert (=> b!999845 (= lt!442133 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999846 () Bool)

(declare-fun res!669316 () Bool)

(assert (=> b!999846 (=> (not res!669316) (not e!563686))))

(declare-fun arrayContainsKey!0 (array!63193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999846 (= res!669316 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86392 res!669314) b!999836))

(assert (= (and b!999836 res!669315) b!999839))

(assert (= (and b!999839 res!669318) b!999841))

(assert (= (and b!999841 res!669320) b!999846))

(assert (= (and b!999846 res!669316) b!999845))

(assert (= (and b!999845 res!669321) b!999837))

(assert (= (and b!999837 res!669324) b!999840))

(assert (= (and b!999840 res!669319) b!999843))

(assert (= (and b!999843 res!669323) b!999842))

(assert (= (and b!999842 res!669317) b!999838))

(assert (= (and b!999838 res!669322) b!999844))

(declare-fun m!926047 () Bool)

(assert (=> b!999842 m!926047))

(assert (=> b!999842 m!926047))

(declare-fun m!926049 () Bool)

(assert (=> b!999842 m!926049))

(assert (=> b!999842 m!926049))

(assert (=> b!999842 m!926047))

(declare-fun m!926051 () Bool)

(assert (=> b!999842 m!926051))

(declare-fun m!926053 () Bool)

(assert (=> b!999845 m!926053))

(declare-fun m!926055 () Bool)

(assert (=> b!999837 m!926055))

(declare-fun m!926057 () Bool)

(assert (=> b!999841 m!926057))

(declare-fun m!926059 () Bool)

(assert (=> start!86392 m!926059))

(declare-fun m!926061 () Bool)

(assert (=> start!86392 m!926061))

(assert (=> b!999839 m!926047))

(assert (=> b!999839 m!926047))

(declare-fun m!926063 () Bool)

(assert (=> b!999839 m!926063))

(declare-fun m!926065 () Bool)

(assert (=> b!999844 m!926065))

(declare-fun m!926067 () Bool)

(assert (=> b!999844 m!926067))

(assert (=> b!999844 m!926067))

(declare-fun m!926069 () Bool)

(assert (=> b!999844 m!926069))

(assert (=> b!999844 m!926069))

(assert (=> b!999844 m!926067))

(declare-fun m!926071 () Bool)

(assert (=> b!999844 m!926071))

(assert (=> b!999838 m!926047))

(assert (=> b!999838 m!926047))

(declare-fun m!926073 () Bool)

(assert (=> b!999838 m!926073))

(declare-fun m!926075 () Bool)

(assert (=> b!999846 m!926075))

(declare-fun m!926077 () Bool)

(assert (=> b!999840 m!926077))

(check-sat (not b!999845) (not b!999844) (not start!86392) (not b!999842) (not b!999839) (not b!999838) (not b!999840) (not b!999846) (not b!999837) (not b!999841))
(check-sat)
