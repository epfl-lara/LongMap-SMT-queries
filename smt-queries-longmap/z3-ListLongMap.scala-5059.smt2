; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68844 () Bool)

(assert start!68844)

(declare-fun b!802716 () Bool)

(declare-fun res!547379 () Bool)

(declare-fun e!444814 () Bool)

(assert (=> b!802716 (=> (not res!547379) (not e!444814))))

(declare-datatypes ((array!43651 0))(
  ( (array!43652 (arr!20906 (Array (_ BitVec 32) (_ BitVec 64))) (size!21327 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43651)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802716 (= res!547379 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802717 () Bool)

(declare-fun res!547380 () Bool)

(assert (=> b!802717 (=> (not res!547380) (not e!444814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802717 (= res!547380 (validKeyInArray!0 k0!2044))))

(declare-datatypes ((SeekEntryResult!8494 0))(
  ( (MissingZero!8494 (index!36344 (_ BitVec 32))) (Found!8494 (index!36345 (_ BitVec 32))) (Intermediate!8494 (undefined!9306 Bool) (index!36346 (_ BitVec 32)) (x!67199 (_ BitVec 32))) (Undefined!8494) (MissingVacant!8494 (index!36347 (_ BitVec 32))) )
))
(declare-fun lt!358995 () SeekEntryResult!8494)

(declare-fun b!802718 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun e!444812 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!359000 () SeekEntryResult!8494)

(assert (=> b!802718 (= e!444812 (not (or (not (= lt!358995 lt!359000)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358992 () (_ BitVec 32))

(declare-fun lt!358993 () (_ BitVec 64))

(declare-fun lt!358998 () array!43651)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43651 (_ BitVec 32)) SeekEntryResult!8494)

(assert (=> b!802718 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358992 vacantAfter!23 lt!358993 lt!358998 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358992 vacantBefore!23 (select (arr!20906 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27502 0))(
  ( (Unit!27503) )
))
(declare-fun lt!358999 () Unit!27502)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27502)

(assert (=> b!802718 (= lt!358999 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358992 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802718 (= lt!358992 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802719 () Bool)

(declare-fun e!444813 () Bool)

(declare-fun e!444811 () Bool)

(assert (=> b!802719 (= e!444813 e!444811)))

(declare-fun res!547385 () Bool)

(assert (=> b!802719 (=> (not res!547385) (not e!444811))))

(declare-fun lt!358997 () SeekEntryResult!8494)

(assert (=> b!802719 (= res!547385 (= lt!358997 lt!358995))))

(assert (=> b!802719 (= lt!358995 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358993 lt!358998 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43651 (_ BitVec 32)) SeekEntryResult!8494)

(assert (=> b!802719 (= lt!358997 (seekEntryOrOpen!0 lt!358993 lt!358998 mask!3266))))

(assert (=> b!802719 (= lt!358993 (select (store (arr!20906 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802719 (= lt!358998 (array!43652 (store (arr!20906 a!3170) i!1163 k0!2044) (size!21327 a!3170)))))

(declare-fun b!802720 () Bool)

(declare-fun res!547382 () Bool)

(assert (=> b!802720 (=> (not res!547382) (not e!444814))))

(assert (=> b!802720 (= res!547382 (and (= (size!21327 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21327 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21327 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802721 () Bool)

(declare-fun e!444809 () Bool)

(assert (=> b!802721 (= e!444809 e!444812)))

(declare-fun res!547384 () Bool)

(assert (=> b!802721 (=> (not res!547384) (not e!444812))))

(declare-fun lt!358994 () SeekEntryResult!8494)

(assert (=> b!802721 (= res!547384 (and (= lt!358994 lt!359000) (not (= (select (arr!20906 a!3170) index!1236) (select (arr!20906 a!3170) j!153)))))))

(assert (=> b!802721 (= lt!359000 (Found!8494 j!153))))

(declare-fun b!802723 () Bool)

(assert (=> b!802723 (= e!444811 e!444809)))

(declare-fun res!547383 () Bool)

(assert (=> b!802723 (=> (not res!547383) (not e!444809))))

(declare-fun lt!358991 () SeekEntryResult!8494)

(assert (=> b!802723 (= res!547383 (= lt!358991 lt!358994))))

(assert (=> b!802723 (= lt!358994 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20906 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802723 (= lt!358991 (seekEntryOrOpen!0 (select (arr!20906 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802724 () Bool)

(declare-fun res!547378 () Bool)

(assert (=> b!802724 (=> (not res!547378) (not e!444813))))

(assert (=> b!802724 (= res!547378 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21327 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20906 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21327 a!3170)) (= (select (arr!20906 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802725 () Bool)

(declare-fun res!547386 () Bool)

(assert (=> b!802725 (=> (not res!547386) (not e!444813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43651 (_ BitVec 32)) Bool)

(assert (=> b!802725 (= res!547386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802722 () Bool)

(declare-fun res!547375 () Bool)

(assert (=> b!802722 (=> (not res!547375) (not e!444814))))

(assert (=> b!802722 (= res!547375 (validKeyInArray!0 (select (arr!20906 a!3170) j!153)))))

(declare-fun res!547381 () Bool)

(assert (=> start!68844 (=> (not res!547381) (not e!444814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68844 (= res!547381 (validMask!0 mask!3266))))

(assert (=> start!68844 e!444814))

(assert (=> start!68844 true))

(declare-fun array_inv!16789 (array!43651) Bool)

(assert (=> start!68844 (array_inv!16789 a!3170)))

(declare-fun b!802726 () Bool)

(assert (=> b!802726 (= e!444814 e!444813)))

(declare-fun res!547376 () Bool)

(assert (=> b!802726 (=> (not res!547376) (not e!444813))))

(declare-fun lt!358996 () SeekEntryResult!8494)

(assert (=> b!802726 (= res!547376 (or (= lt!358996 (MissingZero!8494 i!1163)) (= lt!358996 (MissingVacant!8494 i!1163))))))

(assert (=> b!802726 (= lt!358996 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802727 () Bool)

(declare-fun res!547377 () Bool)

(assert (=> b!802727 (=> (not res!547377) (not e!444813))))

(declare-datatypes ((List!14908 0))(
  ( (Nil!14905) (Cons!14904 (h!16033 (_ BitVec 64)) (t!21214 List!14908)) )
))
(declare-fun arrayNoDuplicates!0 (array!43651 (_ BitVec 32) List!14908) Bool)

(assert (=> b!802727 (= res!547377 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14905))))

(assert (= (and start!68844 res!547381) b!802720))

(assert (= (and b!802720 res!547382) b!802722))

(assert (= (and b!802722 res!547375) b!802717))

(assert (= (and b!802717 res!547380) b!802716))

(assert (= (and b!802716 res!547379) b!802726))

(assert (= (and b!802726 res!547376) b!802725))

(assert (= (and b!802725 res!547386) b!802727))

(assert (= (and b!802727 res!547377) b!802724))

(assert (= (and b!802724 res!547378) b!802719))

(assert (= (and b!802719 res!547385) b!802723))

(assert (= (and b!802723 res!547383) b!802721))

(assert (= (and b!802721 res!547384) b!802718))

(declare-fun m!743827 () Bool)

(assert (=> b!802723 m!743827))

(assert (=> b!802723 m!743827))

(declare-fun m!743829 () Bool)

(assert (=> b!802723 m!743829))

(assert (=> b!802723 m!743827))

(declare-fun m!743831 () Bool)

(assert (=> b!802723 m!743831))

(declare-fun m!743833 () Bool)

(assert (=> b!802725 m!743833))

(declare-fun m!743835 () Bool)

(assert (=> b!802726 m!743835))

(declare-fun m!743837 () Bool)

(assert (=> b!802718 m!743837))

(assert (=> b!802718 m!743827))

(declare-fun m!743839 () Bool)

(assert (=> b!802718 m!743839))

(declare-fun m!743841 () Bool)

(assert (=> b!802718 m!743841))

(assert (=> b!802718 m!743827))

(declare-fun m!743843 () Bool)

(assert (=> b!802718 m!743843))

(declare-fun m!743845 () Bool)

(assert (=> b!802724 m!743845))

(declare-fun m!743847 () Bool)

(assert (=> b!802724 m!743847))

(declare-fun m!743849 () Bool)

(assert (=> b!802719 m!743849))

(declare-fun m!743851 () Bool)

(assert (=> b!802719 m!743851))

(declare-fun m!743853 () Bool)

(assert (=> b!802719 m!743853))

(declare-fun m!743855 () Bool)

(assert (=> b!802719 m!743855))

(declare-fun m!743857 () Bool)

(assert (=> start!68844 m!743857))

(declare-fun m!743859 () Bool)

(assert (=> start!68844 m!743859))

(declare-fun m!743861 () Bool)

(assert (=> b!802721 m!743861))

(assert (=> b!802721 m!743827))

(declare-fun m!743863 () Bool)

(assert (=> b!802716 m!743863))

(declare-fun m!743865 () Bool)

(assert (=> b!802727 m!743865))

(declare-fun m!743867 () Bool)

(assert (=> b!802717 m!743867))

(assert (=> b!802722 m!743827))

(assert (=> b!802722 m!743827))

(declare-fun m!743869 () Bool)

(assert (=> b!802722 m!743869))

(check-sat (not b!802718) (not b!802726) (not b!802717) (not b!802719) (not b!802716) (not b!802722) (not b!802727) (not b!802723) (not b!802725) (not start!68844))
(check-sat)
