; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68830 () Bool)

(assert start!68830)

(declare-fun b!802381 () Bool)

(declare-fun e!444689 () Bool)

(declare-fun e!444687 () Bool)

(assert (=> b!802381 (= e!444689 e!444687)))

(declare-fun res!546903 () Bool)

(assert (=> b!802381 (=> (not res!546903) (not e!444687))))

(declare-datatypes ((SeekEntryResult!8481 0))(
  ( (MissingZero!8481 (index!36292 (_ BitVec 32))) (Found!8481 (index!36293 (_ BitVec 32))) (Intermediate!8481 (undefined!9293 Bool) (index!36294 (_ BitVec 32)) (x!67143 (_ BitVec 32))) (Undefined!8481) (MissingVacant!8481 (index!36295 (_ BitVec 32))) )
))
(declare-fun lt!358817 () SeekEntryResult!8481)

(declare-datatypes ((array!43620 0))(
  ( (array!43621 (arr!20890 (Array (_ BitVec 32) (_ BitVec 64))) (size!21311 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43620)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!358820 () SeekEntryResult!8481)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802381 (= res!546903 (and (= lt!358817 lt!358820) (= lt!358820 (Found!8481 j!153)) (not (= (select (arr!20890 a!3170) index!1236) (select (arr!20890 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43620 (_ BitVec 32)) SeekEntryResult!8481)

(assert (=> b!802381 (= lt!358820 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43620 (_ BitVec 32)) SeekEntryResult!8481)

(assert (=> b!802381 (= lt!358817 (seekEntryOrOpen!0 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802383 () Bool)

(declare-fun e!444684 () Bool)

(assert (=> b!802383 (= e!444687 (not e!444684))))

(declare-fun res!546907 () Bool)

(assert (=> b!802383 (=> res!546907 e!444684)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802383 (= res!546907 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20890 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!358814 () (_ BitVec 64))

(declare-fun lt!358818 () (_ BitVec 32))

(declare-fun lt!358815 () array!43620)

(assert (=> b!802383 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358818 vacantAfter!23 lt!358814 lt!358815 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358818 vacantBefore!23 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27502 0))(
  ( (Unit!27503) )
))
(declare-fun lt!358816 () Unit!27502)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43620 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27502)

(assert (=> b!802383 (= lt!358816 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358818 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802383 (= lt!358818 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802384 () Bool)

(declare-fun res!546906 () Bool)

(declare-fun e!444688 () Bool)

(assert (=> b!802384 (=> (not res!546906) (not e!444688))))

(declare-fun arrayContainsKey!0 (array!43620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802384 (= res!546906 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802385 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802385 (= e!444684 (validKeyInArray!0 lt!358814))))

(declare-fun b!802386 () Bool)

(declare-fun res!546900 () Bool)

(assert (=> b!802386 (=> (not res!546900) (not e!444688))))

(assert (=> b!802386 (= res!546900 (validKeyInArray!0 k0!2044))))

(declare-fun b!802387 () Bool)

(declare-fun res!546908 () Bool)

(assert (=> b!802387 (=> (not res!546908) (not e!444688))))

(assert (=> b!802387 (= res!546908 (and (= (size!21311 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21311 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21311 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802388 () Bool)

(declare-fun e!444686 () Bool)

(assert (=> b!802388 (= e!444688 e!444686)))

(declare-fun res!546905 () Bool)

(assert (=> b!802388 (=> (not res!546905) (not e!444686))))

(declare-fun lt!358819 () SeekEntryResult!8481)

(assert (=> b!802388 (= res!546905 (or (= lt!358819 (MissingZero!8481 i!1163)) (= lt!358819 (MissingVacant!8481 i!1163))))))

(assert (=> b!802388 (= lt!358819 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802389 () Bool)

(declare-fun res!546904 () Bool)

(assert (=> b!802389 (=> (not res!546904) (not e!444686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43620 (_ BitVec 32)) Bool)

(assert (=> b!802389 (= res!546904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802390 () Bool)

(assert (=> b!802390 (= e!444686 e!444689)))

(declare-fun res!546909 () Bool)

(assert (=> b!802390 (=> (not res!546909) (not e!444689))))

(assert (=> b!802390 (= res!546909 (= (seekEntryOrOpen!0 lt!358814 lt!358815 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358814 lt!358815 mask!3266)))))

(assert (=> b!802390 (= lt!358814 (select (store (arr!20890 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802390 (= lt!358815 (array!43621 (store (arr!20890 a!3170) i!1163 k0!2044) (size!21311 a!3170)))))

(declare-fun b!802382 () Bool)

(declare-fun res!546901 () Bool)

(assert (=> b!802382 (=> (not res!546901) (not e!444688))))

(assert (=> b!802382 (= res!546901 (validKeyInArray!0 (select (arr!20890 a!3170) j!153)))))

(declare-fun res!546910 () Bool)

(assert (=> start!68830 (=> (not res!546910) (not e!444688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68830 (= res!546910 (validMask!0 mask!3266))))

(assert (=> start!68830 e!444688))

(assert (=> start!68830 true))

(declare-fun array_inv!16686 (array!43620) Bool)

(assert (=> start!68830 (array_inv!16686 a!3170)))

(declare-fun b!802391 () Bool)

(declare-fun res!546911 () Bool)

(assert (=> b!802391 (=> (not res!546911) (not e!444686))))

(assert (=> b!802391 (= res!546911 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21311 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20890 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21311 a!3170)) (= (select (arr!20890 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802392 () Bool)

(declare-fun res!546902 () Bool)

(assert (=> b!802392 (=> (not res!546902) (not e!444686))))

(declare-datatypes ((List!14853 0))(
  ( (Nil!14850) (Cons!14849 (h!15978 (_ BitVec 64)) (t!21168 List!14853)) )
))
(declare-fun arrayNoDuplicates!0 (array!43620 (_ BitVec 32) List!14853) Bool)

(assert (=> b!802392 (= res!546902 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14850))))

(assert (= (and start!68830 res!546910) b!802387))

(assert (= (and b!802387 res!546908) b!802382))

(assert (= (and b!802382 res!546901) b!802386))

(assert (= (and b!802386 res!546900) b!802384))

(assert (= (and b!802384 res!546906) b!802388))

(assert (= (and b!802388 res!546905) b!802389))

(assert (= (and b!802389 res!546904) b!802392))

(assert (= (and b!802392 res!546902) b!802391))

(assert (= (and b!802391 res!546911) b!802390))

(assert (= (and b!802390 res!546909) b!802381))

(assert (= (and b!802381 res!546903) b!802383))

(assert (= (and b!802383 (not res!546907)) b!802385))

(declare-fun m!743813 () Bool)

(assert (=> start!68830 m!743813))

(declare-fun m!743815 () Bool)

(assert (=> start!68830 m!743815))

(declare-fun m!743817 () Bool)

(assert (=> b!802384 m!743817))

(declare-fun m!743819 () Bool)

(assert (=> b!802392 m!743819))

(declare-fun m!743821 () Bool)

(assert (=> b!802381 m!743821))

(declare-fun m!743823 () Bool)

(assert (=> b!802381 m!743823))

(assert (=> b!802381 m!743823))

(declare-fun m!743825 () Bool)

(assert (=> b!802381 m!743825))

(assert (=> b!802381 m!743823))

(declare-fun m!743827 () Bool)

(assert (=> b!802381 m!743827))

(declare-fun m!743829 () Bool)

(assert (=> b!802388 m!743829))

(assert (=> b!802382 m!743823))

(assert (=> b!802382 m!743823))

(declare-fun m!743831 () Bool)

(assert (=> b!802382 m!743831))

(declare-fun m!743833 () Bool)

(assert (=> b!802389 m!743833))

(declare-fun m!743835 () Bool)

(assert (=> b!802390 m!743835))

(declare-fun m!743837 () Bool)

(assert (=> b!802390 m!743837))

(declare-fun m!743839 () Bool)

(assert (=> b!802390 m!743839))

(declare-fun m!743841 () Bool)

(assert (=> b!802390 m!743841))

(assert (=> b!802383 m!743823))

(declare-fun m!743843 () Bool)

(assert (=> b!802383 m!743843))

(declare-fun m!743845 () Bool)

(assert (=> b!802383 m!743845))

(assert (=> b!802383 m!743823))

(declare-fun m!743847 () Bool)

(assert (=> b!802383 m!743847))

(declare-fun m!743849 () Bool)

(assert (=> b!802383 m!743849))

(declare-fun m!743851 () Bool)

(assert (=> b!802383 m!743851))

(assert (=> b!802383 m!743839))

(declare-fun m!743853 () Bool)

(assert (=> b!802386 m!743853))

(declare-fun m!743855 () Bool)

(assert (=> b!802391 m!743855))

(declare-fun m!743857 () Bool)

(assert (=> b!802391 m!743857))

(declare-fun m!743859 () Bool)

(assert (=> b!802385 m!743859))

(check-sat (not b!802385) (not b!802383) (not b!802392) (not b!802381) (not b!802386) (not b!802389) (not b!802388) (not start!68830) (not b!802390) (not b!802382) (not b!802384))
(check-sat)
