; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86758 () Bool)

(assert start!86758)

(declare-fun b!1005780 () Bool)

(declare-fun res!674875 () Bool)

(declare-fun e!566272 () Bool)

(assert (=> b!1005780 (=> (not res!674875) (not e!566272))))

(declare-datatypes ((array!63457 0))(
  ( (array!63458 (arr!30551 (Array (_ BitVec 32) (_ BitVec 64))) (size!31053 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63457)

(declare-datatypes ((List!21227 0))(
  ( (Nil!21224) (Cons!21223 (h!22406 (_ BitVec 64)) (t!30228 List!21227)) )
))
(declare-fun arrayNoDuplicates!0 (array!63457 (_ BitVec 32) List!21227) Bool)

(assert (=> b!1005780 (= res!674875 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21224))))

(declare-fun b!1005781 () Bool)

(declare-fun res!674871 () Bool)

(assert (=> b!1005781 (=> (not res!674871) (not e!566272))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9483 0))(
  ( (MissingZero!9483 (index!40303 (_ BitVec 32))) (Found!9483 (index!40304 (_ BitVec 32))) (Intermediate!9483 (undefined!10295 Bool) (index!40305 (_ BitVec 32)) (x!87707 (_ BitVec 32))) (Undefined!9483) (MissingVacant!9483 (index!40306 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63457 (_ BitVec 32)) SeekEntryResult!9483)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005781 (= res!674871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30551 a!3219) j!170) mask!3464) (select (arr!30551 a!3219) j!170) a!3219 mask!3464) (Intermediate!9483 false resIndex!38 resX!38)))))

(declare-fun b!1005782 () Bool)

(declare-fun res!674873 () Bool)

(declare-fun e!566270 () Bool)

(assert (=> b!1005782 (=> (not res!674873) (not e!566270))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005782 (= res!674873 (and (= (size!31053 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31053 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31053 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005783 () Bool)

(declare-fun res!674870 () Bool)

(assert (=> b!1005783 (=> (not res!674870) (not e!566272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63457 (_ BitVec 32)) Bool)

(assert (=> b!1005783 (= res!674870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005784 () Bool)

(assert (=> b!1005784 (= e!566270 e!566272)))

(declare-fun res!674868 () Bool)

(assert (=> b!1005784 (=> (not res!674868) (not e!566272))))

(declare-fun lt!444623 () SeekEntryResult!9483)

(assert (=> b!1005784 (= res!674868 (or (= lt!444623 (MissingVacant!9483 i!1194)) (= lt!444623 (MissingZero!9483 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63457 (_ BitVec 32)) SeekEntryResult!9483)

(assert (=> b!1005784 (= lt!444623 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005785 () Bool)

(assert (=> b!1005785 (= e!566272 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444622 () SeekEntryResult!9483)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1005785 (= lt!444622 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30551 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005786 () Bool)

(declare-fun res!674877 () Bool)

(assert (=> b!1005786 (=> (not res!674877) (not e!566270))))

(declare-fun arrayContainsKey!0 (array!63457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005786 (= res!674877 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005787 () Bool)

(declare-fun res!674872 () Bool)

(assert (=> b!1005787 (=> (not res!674872) (not e!566270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005787 (= res!674872 (validKeyInArray!0 (select (arr!30551 a!3219) j!170)))))

(declare-fun b!1005788 () Bool)

(declare-fun res!674869 () Bool)

(assert (=> b!1005788 (=> (not res!674869) (not e!566270))))

(assert (=> b!1005788 (= res!674869 (validKeyInArray!0 k0!2224))))

(declare-fun res!674874 () Bool)

(assert (=> start!86758 (=> (not res!674874) (not e!566270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86758 (= res!674874 (validMask!0 mask!3464))))

(assert (=> start!86758 e!566270))

(declare-fun array_inv!23675 (array!63457) Bool)

(assert (=> start!86758 (array_inv!23675 a!3219)))

(assert (=> start!86758 true))

(declare-fun b!1005789 () Bool)

(declare-fun res!674876 () Bool)

(assert (=> b!1005789 (=> (not res!674876) (not e!566272))))

(assert (=> b!1005789 (= res!674876 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31053 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31053 a!3219))))))

(assert (= (and start!86758 res!674874) b!1005782))

(assert (= (and b!1005782 res!674873) b!1005787))

(assert (= (and b!1005787 res!674872) b!1005788))

(assert (= (and b!1005788 res!674869) b!1005786))

(assert (= (and b!1005786 res!674877) b!1005784))

(assert (= (and b!1005784 res!674868) b!1005783))

(assert (= (and b!1005783 res!674870) b!1005780))

(assert (= (and b!1005780 res!674875) b!1005789))

(assert (= (and b!1005789 res!674876) b!1005781))

(assert (= (and b!1005781 res!674871) b!1005785))

(declare-fun m!930953 () Bool)

(assert (=> b!1005780 m!930953))

(declare-fun m!930955 () Bool)

(assert (=> b!1005785 m!930955))

(assert (=> b!1005785 m!930955))

(declare-fun m!930957 () Bool)

(assert (=> b!1005785 m!930957))

(assert (=> b!1005787 m!930955))

(assert (=> b!1005787 m!930955))

(declare-fun m!930959 () Bool)

(assert (=> b!1005787 m!930959))

(declare-fun m!930961 () Bool)

(assert (=> b!1005786 m!930961))

(declare-fun m!930963 () Bool)

(assert (=> b!1005784 m!930963))

(declare-fun m!930965 () Bool)

(assert (=> b!1005788 m!930965))

(declare-fun m!930967 () Bool)

(assert (=> start!86758 m!930967))

(declare-fun m!930969 () Bool)

(assert (=> start!86758 m!930969))

(declare-fun m!930971 () Bool)

(assert (=> b!1005783 m!930971))

(assert (=> b!1005781 m!930955))

(assert (=> b!1005781 m!930955))

(declare-fun m!930973 () Bool)

(assert (=> b!1005781 m!930973))

(assert (=> b!1005781 m!930973))

(assert (=> b!1005781 m!930955))

(declare-fun m!930975 () Bool)

(assert (=> b!1005781 m!930975))

(check-sat (not b!1005786) (not b!1005780) (not b!1005785) (not start!86758) (not b!1005787) (not b!1005781) (not b!1005788) (not b!1005784) (not b!1005783))
(check-sat)
