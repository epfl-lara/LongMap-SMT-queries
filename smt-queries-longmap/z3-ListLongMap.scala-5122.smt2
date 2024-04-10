; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69556 () Bool)

(assert start!69556)

(declare-fun b!810629 () Bool)

(declare-fun res!553913 () Bool)

(declare-fun e!448697 () Bool)

(assert (=> b!810629 (=> (not res!553913) (not e!448697))))

(declare-datatypes ((array!44052 0))(
  ( (array!44053 (arr!21097 (Array (_ BitVec 32) (_ BitVec 64))) (size!21518 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44052)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44052 (_ BitVec 32)) Bool)

(assert (=> b!810629 (= res!553913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!553908 () Bool)

(declare-fun e!448694 () Bool)

(assert (=> start!69556 (=> (not res!553908) (not e!448694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69556 (= res!553908 (validMask!0 mask!3266))))

(assert (=> start!69556 e!448694))

(assert (=> start!69556 true))

(declare-fun array_inv!16893 (array!44052) Bool)

(assert (=> start!69556 (array_inv!16893 a!3170)))

(declare-fun b!810630 () Bool)

(assert (=> b!810630 (= e!448694 e!448697)))

(declare-fun res!553906 () Bool)

(assert (=> b!810630 (=> (not res!553906) (not e!448697))))

(declare-datatypes ((SeekEntryResult!8688 0))(
  ( (MissingZero!8688 (index!37120 (_ BitVec 32))) (Found!8688 (index!37121 (_ BitVec 32))) (Intermediate!8688 (undefined!9500 Bool) (index!37122 (_ BitVec 32)) (x!67932 (_ BitVec 32))) (Undefined!8688) (MissingVacant!8688 (index!37123 (_ BitVec 32))) )
))
(declare-fun lt!363345 () SeekEntryResult!8688)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810630 (= res!553906 (or (= lt!363345 (MissingZero!8688 i!1163)) (= lt!363345 (MissingVacant!8688 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44052 (_ BitVec 32)) SeekEntryResult!8688)

(assert (=> b!810630 (= lt!363345 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810631 () Bool)

(declare-fun e!448696 () Bool)

(declare-fun e!448693 () Bool)

(assert (=> b!810631 (= e!448696 e!448693)))

(declare-fun res!553907 () Bool)

(assert (=> b!810631 (=> (not res!553907) (not e!448693))))

(declare-fun lt!363341 () SeekEntryResult!8688)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363343 () SeekEntryResult!8688)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810631 (= res!553907 (and (= lt!363343 lt!363341) (= lt!363341 (Found!8688 j!153)) (not (= (select (arr!21097 a!3170) index!1236) (select (arr!21097 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44052 (_ BitVec 32)) SeekEntryResult!8688)

(assert (=> b!810631 (= lt!363341 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21097 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810631 (= lt!363343 (seekEntryOrOpen!0 (select (arr!21097 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810632 () Bool)

(assert (=> b!810632 (= e!448697 e!448696)))

(declare-fun res!553912 () Bool)

(assert (=> b!810632 (=> (not res!553912) (not e!448696))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363346 () (_ BitVec 64))

(declare-fun lt!363347 () array!44052)

(assert (=> b!810632 (= res!553912 (= (seekEntryOrOpen!0 lt!363346 lt!363347 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363346 lt!363347 mask!3266)))))

(assert (=> b!810632 (= lt!363346 (select (store (arr!21097 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810632 (= lt!363347 (array!44053 (store (arr!21097 a!3170) i!1163 k0!2044) (size!21518 a!3170)))))

(declare-fun b!810633 () Bool)

(declare-fun res!553909 () Bool)

(assert (=> b!810633 (=> (not res!553909) (not e!448697))))

(assert (=> b!810633 (= res!553909 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21518 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21097 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21518 a!3170)) (= (select (arr!21097 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810634 () Bool)

(declare-fun res!553915 () Bool)

(assert (=> b!810634 (=> (not res!553915) (not e!448697))))

(declare-datatypes ((List!15060 0))(
  ( (Nil!15057) (Cons!15056 (h!16185 (_ BitVec 64)) (t!21375 List!15060)) )
))
(declare-fun arrayNoDuplicates!0 (array!44052 (_ BitVec 32) List!15060) Bool)

(assert (=> b!810634 (= res!553915 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15057))))

(declare-fun b!810635 () Bool)

(assert (=> b!810635 (= e!448693 (not true))))

(declare-fun lt!363344 () (_ BitVec 32))

(assert (=> b!810635 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363344 vacantAfter!23 lt!363346 lt!363347 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363344 vacantBefore!23 (select (arr!21097 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27638 0))(
  ( (Unit!27639) )
))
(declare-fun lt!363342 () Unit!27638)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44052 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27638)

(assert (=> b!810635 (= lt!363342 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363344 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810635 (= lt!363344 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810636 () Bool)

(declare-fun res!553914 () Bool)

(assert (=> b!810636 (=> (not res!553914) (not e!448694))))

(assert (=> b!810636 (= res!553914 (and (= (size!21518 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21518 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21518 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810637 () Bool)

(declare-fun res!553911 () Bool)

(assert (=> b!810637 (=> (not res!553911) (not e!448694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810637 (= res!553911 (validKeyInArray!0 k0!2044))))

(declare-fun b!810638 () Bool)

(declare-fun res!553910 () Bool)

(assert (=> b!810638 (=> (not res!553910) (not e!448694))))

(assert (=> b!810638 (= res!553910 (validKeyInArray!0 (select (arr!21097 a!3170) j!153)))))

(declare-fun b!810639 () Bool)

(declare-fun res!553916 () Bool)

(assert (=> b!810639 (=> (not res!553916) (not e!448694))))

(declare-fun arrayContainsKey!0 (array!44052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810639 (= res!553916 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69556 res!553908) b!810636))

(assert (= (and b!810636 res!553914) b!810638))

(assert (= (and b!810638 res!553910) b!810637))

(assert (= (and b!810637 res!553911) b!810639))

(assert (= (and b!810639 res!553916) b!810630))

(assert (= (and b!810630 res!553906) b!810629))

(assert (= (and b!810629 res!553913) b!810634))

(assert (= (and b!810634 res!553915) b!810633))

(assert (= (and b!810633 res!553909) b!810632))

(assert (= (and b!810632 res!553912) b!810631))

(assert (= (and b!810631 res!553907) b!810635))

(declare-fun m!752833 () Bool)

(assert (=> b!810639 m!752833))

(declare-fun m!752835 () Bool)

(assert (=> b!810629 m!752835))

(declare-fun m!752837 () Bool)

(assert (=> start!69556 m!752837))

(declare-fun m!752839 () Bool)

(assert (=> start!69556 m!752839))

(declare-fun m!752841 () Bool)

(assert (=> b!810637 m!752841))

(declare-fun m!752843 () Bool)

(assert (=> b!810634 m!752843))

(declare-fun m!752845 () Bool)

(assert (=> b!810635 m!752845))

(declare-fun m!752847 () Bool)

(assert (=> b!810635 m!752847))

(declare-fun m!752849 () Bool)

(assert (=> b!810635 m!752849))

(declare-fun m!752851 () Bool)

(assert (=> b!810635 m!752851))

(assert (=> b!810635 m!752845))

(declare-fun m!752853 () Bool)

(assert (=> b!810635 m!752853))

(declare-fun m!752855 () Bool)

(assert (=> b!810633 m!752855))

(declare-fun m!752857 () Bool)

(assert (=> b!810633 m!752857))

(declare-fun m!752859 () Bool)

(assert (=> b!810631 m!752859))

(assert (=> b!810631 m!752845))

(assert (=> b!810631 m!752845))

(declare-fun m!752861 () Bool)

(assert (=> b!810631 m!752861))

(assert (=> b!810631 m!752845))

(declare-fun m!752863 () Bool)

(assert (=> b!810631 m!752863))

(declare-fun m!752865 () Bool)

(assert (=> b!810632 m!752865))

(declare-fun m!752867 () Bool)

(assert (=> b!810632 m!752867))

(declare-fun m!752869 () Bool)

(assert (=> b!810632 m!752869))

(declare-fun m!752871 () Bool)

(assert (=> b!810632 m!752871))

(assert (=> b!810638 m!752845))

(assert (=> b!810638 m!752845))

(declare-fun m!752873 () Bool)

(assert (=> b!810638 m!752873))

(declare-fun m!752875 () Bool)

(assert (=> b!810630 m!752875))

(check-sat (not b!810639) (not start!69556) (not b!810630) (not b!810632) (not b!810637) (not b!810635) (not b!810634) (not b!810631) (not b!810629) (not b!810638))
(check-sat)
