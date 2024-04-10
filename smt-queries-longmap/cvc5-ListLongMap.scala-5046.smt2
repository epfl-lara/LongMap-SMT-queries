; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68786 () Bool)

(assert start!68786)

(declare-fun b!801650 () Bool)

(declare-fun res!546179 () Bool)

(declare-fun e!444353 () Bool)

(assert (=> b!801650 (=> (not res!546179) (not e!444353))))

(declare-datatypes ((array!43576 0))(
  ( (array!43577 (arr!20868 (Array (_ BitVec 32) (_ BitVec 64))) (size!21289 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43576)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801650 (= res!546179 (validKeyInArray!0 (select (arr!20868 a!3170) j!153)))))

(declare-fun b!801651 () Bool)

(declare-fun res!546172 () Bool)

(assert (=> b!801651 (=> (not res!546172) (not e!444353))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!801651 (= res!546172 (validKeyInArray!0 k!2044))))

(declare-fun b!801652 () Bool)

(declare-fun res!546176 () Bool)

(declare-fun e!444350 () Bool)

(assert (=> b!801652 (=> (not res!546176) (not e!444350))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801652 (= res!546176 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21289 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20868 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21289 a!3170)) (= (select (arr!20868 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801653 () Bool)

(declare-fun res!546177 () Bool)

(assert (=> b!801653 (=> (not res!546177) (not e!444350))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43576 (_ BitVec 32)) Bool)

(assert (=> b!801653 (= res!546177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801654 () Bool)

(declare-fun res!546173 () Bool)

(assert (=> b!801654 (=> (not res!546173) (not e!444353))))

(declare-fun arrayContainsKey!0 (array!43576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801654 (= res!546173 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801655 () Bool)

(declare-fun e!444349 () Bool)

(declare-fun e!444352 () Bool)

(assert (=> b!801655 (= e!444349 e!444352)))

(declare-fun res!546170 () Bool)

(assert (=> b!801655 (=> (not res!546170) (not e!444352))))

(declare-datatypes ((SeekEntryResult!8459 0))(
  ( (MissingZero!8459 (index!36204 (_ BitVec 32))) (Found!8459 (index!36205 (_ BitVec 32))) (Intermediate!8459 (undefined!9271 Bool) (index!36206 (_ BitVec 32)) (x!67065 (_ BitVec 32))) (Undefined!8459) (MissingVacant!8459 (index!36207 (_ BitVec 32))) )
))
(declare-fun lt!358353 () SeekEntryResult!8459)

(declare-fun lt!358356 () SeekEntryResult!8459)

(assert (=> b!801655 (= res!546170 (and (= lt!358353 lt!358356) (= lt!358356 (Found!8459 j!153)) (not (= (select (arr!20868 a!3170) index!1236) (select (arr!20868 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43576 (_ BitVec 32)) SeekEntryResult!8459)

(assert (=> b!801655 (= lt!358356 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20868 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43576 (_ BitVec 32)) SeekEntryResult!8459)

(assert (=> b!801655 (= lt!358353 (seekEntryOrOpen!0 (select (arr!20868 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801656 () Bool)

(assert (=> b!801656 (= e!444352 (not true))))

(declare-fun lt!358352 () (_ BitVec 64))

(declare-fun lt!358357 () (_ BitVec 32))

(declare-fun lt!358358 () array!43576)

(assert (=> b!801656 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358357 vacantAfter!23 lt!358352 lt!358358 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358357 vacantBefore!23 (select (arr!20868 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27458 0))(
  ( (Unit!27459) )
))
(declare-fun lt!358355 () Unit!27458)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43576 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27458)

(assert (=> b!801656 (= lt!358355 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358357 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801656 (= lt!358357 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801657 () Bool)

(assert (=> b!801657 (= e!444353 e!444350)))

(declare-fun res!546169 () Bool)

(assert (=> b!801657 (=> (not res!546169) (not e!444350))))

(declare-fun lt!358354 () SeekEntryResult!8459)

(assert (=> b!801657 (= res!546169 (or (= lt!358354 (MissingZero!8459 i!1163)) (= lt!358354 (MissingVacant!8459 i!1163))))))

(assert (=> b!801657 (= lt!358354 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801658 () Bool)

(declare-fun res!546171 () Bool)

(assert (=> b!801658 (=> (not res!546171) (not e!444353))))

(assert (=> b!801658 (= res!546171 (and (= (size!21289 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21289 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21289 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801659 () Bool)

(assert (=> b!801659 (= e!444350 e!444349)))

(declare-fun res!546175 () Bool)

(assert (=> b!801659 (=> (not res!546175) (not e!444349))))

(assert (=> b!801659 (= res!546175 (= (seekEntryOrOpen!0 lt!358352 lt!358358 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358352 lt!358358 mask!3266)))))

(assert (=> b!801659 (= lt!358352 (select (store (arr!20868 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801659 (= lt!358358 (array!43577 (store (arr!20868 a!3170) i!1163 k!2044) (size!21289 a!3170)))))

(declare-fun b!801660 () Bool)

(declare-fun res!546174 () Bool)

(assert (=> b!801660 (=> (not res!546174) (not e!444350))))

(declare-datatypes ((List!14831 0))(
  ( (Nil!14828) (Cons!14827 (h!15956 (_ BitVec 64)) (t!21146 List!14831)) )
))
(declare-fun arrayNoDuplicates!0 (array!43576 (_ BitVec 32) List!14831) Bool)

(assert (=> b!801660 (= res!546174 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14828))))

(declare-fun res!546178 () Bool)

(assert (=> start!68786 (=> (not res!546178) (not e!444353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68786 (= res!546178 (validMask!0 mask!3266))))

(assert (=> start!68786 e!444353))

(assert (=> start!68786 true))

(declare-fun array_inv!16664 (array!43576) Bool)

(assert (=> start!68786 (array_inv!16664 a!3170)))

(assert (= (and start!68786 res!546178) b!801658))

(assert (= (and b!801658 res!546171) b!801650))

(assert (= (and b!801650 res!546179) b!801651))

(assert (= (and b!801651 res!546172) b!801654))

(assert (= (and b!801654 res!546173) b!801657))

(assert (= (and b!801657 res!546169) b!801653))

(assert (= (and b!801653 res!546177) b!801660))

(assert (= (and b!801660 res!546174) b!801652))

(assert (= (and b!801652 res!546176) b!801659))

(assert (= (and b!801659 res!546175) b!801655))

(assert (= (and b!801655 res!546170) b!801656))

(declare-fun m!742835 () Bool)

(assert (=> b!801656 m!742835))

(declare-fun m!742837 () Bool)

(assert (=> b!801656 m!742837))

(declare-fun m!742839 () Bool)

(assert (=> b!801656 m!742839))

(assert (=> b!801656 m!742835))

(declare-fun m!742841 () Bool)

(assert (=> b!801656 m!742841))

(declare-fun m!742843 () Bool)

(assert (=> b!801656 m!742843))

(declare-fun m!742845 () Bool)

(assert (=> b!801654 m!742845))

(declare-fun m!742847 () Bool)

(assert (=> b!801660 m!742847))

(declare-fun m!742849 () Bool)

(assert (=> b!801659 m!742849))

(declare-fun m!742851 () Bool)

(assert (=> b!801659 m!742851))

(declare-fun m!742853 () Bool)

(assert (=> b!801659 m!742853))

(declare-fun m!742855 () Bool)

(assert (=> b!801659 m!742855))

(declare-fun m!742857 () Bool)

(assert (=> b!801653 m!742857))

(declare-fun m!742859 () Bool)

(assert (=> b!801657 m!742859))

(declare-fun m!742861 () Bool)

(assert (=> start!68786 m!742861))

(declare-fun m!742863 () Bool)

(assert (=> start!68786 m!742863))

(declare-fun m!742865 () Bool)

(assert (=> b!801655 m!742865))

(assert (=> b!801655 m!742835))

(assert (=> b!801655 m!742835))

(declare-fun m!742867 () Bool)

(assert (=> b!801655 m!742867))

(assert (=> b!801655 m!742835))

(declare-fun m!742869 () Bool)

(assert (=> b!801655 m!742869))

(declare-fun m!742871 () Bool)

(assert (=> b!801652 m!742871))

(declare-fun m!742873 () Bool)

(assert (=> b!801652 m!742873))

(declare-fun m!742875 () Bool)

(assert (=> b!801651 m!742875))

(assert (=> b!801650 m!742835))

(assert (=> b!801650 m!742835))

(declare-fun m!742877 () Bool)

(assert (=> b!801650 m!742877))

(push 1)

