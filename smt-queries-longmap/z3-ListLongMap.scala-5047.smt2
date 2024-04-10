; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68794 () Bool)

(assert start!68794)

(declare-fun b!801782 () Bool)

(declare-fun res!546308 () Bool)

(declare-fun e!444411 () Bool)

(assert (=> b!801782 (=> (not res!546308) (not e!444411))))

(declare-datatypes ((array!43584 0))(
  ( (array!43585 (arr!20872 (Array (_ BitVec 32) (_ BitVec 64))) (size!21293 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43584)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801782 (= res!546308 (validKeyInArray!0 (select (arr!20872 a!3170) j!153)))))

(declare-fun res!546305 () Bool)

(assert (=> start!68794 (=> (not res!546305) (not e!444411))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68794 (= res!546305 (validMask!0 mask!3266))))

(assert (=> start!68794 e!444411))

(assert (=> start!68794 true))

(declare-fun array_inv!16668 (array!43584) Bool)

(assert (=> start!68794 (array_inv!16668 a!3170)))

(declare-fun b!801783 () Bool)

(declare-fun e!444409 () Bool)

(declare-fun e!444412 () Bool)

(assert (=> b!801783 (= e!444409 e!444412)))

(declare-fun res!546303 () Bool)

(assert (=> b!801783 (=> (not res!546303) (not e!444412))))

(declare-datatypes ((SeekEntryResult!8463 0))(
  ( (MissingZero!8463 (index!36220 (_ BitVec 32))) (Found!8463 (index!36221 (_ BitVec 32))) (Intermediate!8463 (undefined!9275 Bool) (index!36222 (_ BitVec 32)) (x!67077 (_ BitVec 32))) (Undefined!8463) (MissingVacant!8463 (index!36223 (_ BitVec 32))) )
))
(declare-fun lt!358440 () SeekEntryResult!8463)

(declare-fun lt!358437 () SeekEntryResult!8463)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801783 (= res!546303 (and (= lt!358440 lt!358437) (= lt!358437 (Found!8463 j!153)) (not (= (select (arr!20872 a!3170) index!1236) (select (arr!20872 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43584 (_ BitVec 32)) SeekEntryResult!8463)

(assert (=> b!801783 (= lt!358437 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20872 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43584 (_ BitVec 32)) SeekEntryResult!8463)

(assert (=> b!801783 (= lt!358440 (seekEntryOrOpen!0 (select (arr!20872 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801784 () Bool)

(declare-fun res!546306 () Bool)

(assert (=> b!801784 (=> (not res!546306) (not e!444411))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801784 (= res!546306 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801785 () Bool)

(declare-fun res!546310 () Bool)

(declare-fun e!444413 () Bool)

(assert (=> b!801785 (=> (not res!546310) (not e!444413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43584 (_ BitVec 32)) Bool)

(assert (=> b!801785 (= res!546310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801786 () Bool)

(assert (=> b!801786 (= e!444412 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun lt!358436 () (_ BitVec 64))

(declare-fun lt!358438 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358439 () array!43584)

(assert (=> b!801786 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358438 vacantAfter!23 lt!358436 lt!358439 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358438 vacantBefore!23 (select (arr!20872 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27466 0))(
  ( (Unit!27467) )
))
(declare-fun lt!358441 () Unit!27466)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43584 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27466)

(assert (=> b!801786 (= lt!358441 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358438 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801786 (= lt!358438 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801787 () Bool)

(declare-fun res!546304 () Bool)

(assert (=> b!801787 (=> (not res!546304) (not e!444413))))

(declare-datatypes ((List!14835 0))(
  ( (Nil!14832) (Cons!14831 (h!15960 (_ BitVec 64)) (t!21150 List!14835)) )
))
(declare-fun arrayNoDuplicates!0 (array!43584 (_ BitVec 32) List!14835) Bool)

(assert (=> b!801787 (= res!546304 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14832))))

(declare-fun b!801788 () Bool)

(declare-fun res!546302 () Bool)

(assert (=> b!801788 (=> (not res!546302) (not e!444413))))

(assert (=> b!801788 (= res!546302 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21293 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20872 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21293 a!3170)) (= (select (arr!20872 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801789 () Bool)

(assert (=> b!801789 (= e!444413 e!444409)))

(declare-fun res!546307 () Bool)

(assert (=> b!801789 (=> (not res!546307) (not e!444409))))

(assert (=> b!801789 (= res!546307 (= (seekEntryOrOpen!0 lt!358436 lt!358439 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358436 lt!358439 mask!3266)))))

(assert (=> b!801789 (= lt!358436 (select (store (arr!20872 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801789 (= lt!358439 (array!43585 (store (arr!20872 a!3170) i!1163 k0!2044) (size!21293 a!3170)))))

(declare-fun b!801790 () Bool)

(declare-fun res!546301 () Bool)

(assert (=> b!801790 (=> (not res!546301) (not e!444411))))

(assert (=> b!801790 (= res!546301 (validKeyInArray!0 k0!2044))))

(declare-fun b!801791 () Bool)

(assert (=> b!801791 (= e!444411 e!444413)))

(declare-fun res!546309 () Bool)

(assert (=> b!801791 (=> (not res!546309) (not e!444413))))

(declare-fun lt!358442 () SeekEntryResult!8463)

(assert (=> b!801791 (= res!546309 (or (= lt!358442 (MissingZero!8463 i!1163)) (= lt!358442 (MissingVacant!8463 i!1163))))))

(assert (=> b!801791 (= lt!358442 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801792 () Bool)

(declare-fun res!546311 () Bool)

(assert (=> b!801792 (=> (not res!546311) (not e!444411))))

(assert (=> b!801792 (= res!546311 (and (= (size!21293 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21293 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21293 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68794 res!546305) b!801792))

(assert (= (and b!801792 res!546311) b!801782))

(assert (= (and b!801782 res!546308) b!801790))

(assert (= (and b!801790 res!546301) b!801784))

(assert (= (and b!801784 res!546306) b!801791))

(assert (= (and b!801791 res!546309) b!801785))

(assert (= (and b!801785 res!546310) b!801787))

(assert (= (and b!801787 res!546304) b!801788))

(assert (= (and b!801788 res!546302) b!801789))

(assert (= (and b!801789 res!546307) b!801783))

(assert (= (and b!801783 res!546303) b!801786))

(declare-fun m!743011 () Bool)

(assert (=> b!801790 m!743011))

(declare-fun m!743013 () Bool)

(assert (=> start!68794 m!743013))

(declare-fun m!743015 () Bool)

(assert (=> start!68794 m!743015))

(declare-fun m!743017 () Bool)

(assert (=> b!801788 m!743017))

(declare-fun m!743019 () Bool)

(assert (=> b!801788 m!743019))

(declare-fun m!743021 () Bool)

(assert (=> b!801784 m!743021))

(declare-fun m!743023 () Bool)

(assert (=> b!801785 m!743023))

(declare-fun m!743025 () Bool)

(assert (=> b!801782 m!743025))

(assert (=> b!801782 m!743025))

(declare-fun m!743027 () Bool)

(assert (=> b!801782 m!743027))

(declare-fun m!743029 () Bool)

(assert (=> b!801783 m!743029))

(assert (=> b!801783 m!743025))

(assert (=> b!801783 m!743025))

(declare-fun m!743031 () Bool)

(assert (=> b!801783 m!743031))

(assert (=> b!801783 m!743025))

(declare-fun m!743033 () Bool)

(assert (=> b!801783 m!743033))

(declare-fun m!743035 () Bool)

(assert (=> b!801787 m!743035))

(declare-fun m!743037 () Bool)

(assert (=> b!801791 m!743037))

(assert (=> b!801786 m!743025))

(declare-fun m!743039 () Bool)

(assert (=> b!801786 m!743039))

(declare-fun m!743041 () Bool)

(assert (=> b!801786 m!743041))

(assert (=> b!801786 m!743025))

(declare-fun m!743043 () Bool)

(assert (=> b!801786 m!743043))

(declare-fun m!743045 () Bool)

(assert (=> b!801786 m!743045))

(declare-fun m!743047 () Bool)

(assert (=> b!801789 m!743047))

(declare-fun m!743049 () Bool)

(assert (=> b!801789 m!743049))

(declare-fun m!743051 () Bool)

(assert (=> b!801789 m!743051))

(declare-fun m!743053 () Bool)

(assert (=> b!801789 m!743053))

(check-sat (not b!801787) (not b!801790) (not start!68794) (not b!801786) (not b!801791) (not b!801785) (not b!801784) (not b!801783) (not b!801782) (not b!801789))
(check-sat)
