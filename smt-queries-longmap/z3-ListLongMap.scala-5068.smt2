; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68898 () Bool)

(assert start!68898)

(declare-fun res!548330 () Bool)

(declare-fun e!445276 () Bool)

(assert (=> start!68898 (=> (not res!548330) (not e!445276))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68898 (= res!548330 (validMask!0 mask!3266))))

(assert (=> start!68898 e!445276))

(assert (=> start!68898 true))

(declare-datatypes ((array!43705 0))(
  ( (array!43706 (arr!20933 (Array (_ BitVec 32) (_ BitVec 64))) (size!21354 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43705)

(declare-fun array_inv!16816 (array!43705) Bool)

(assert (=> start!68898 (array_inv!16816 a!3170)))

(declare-fun b!803668 () Bool)

(declare-fun res!548329 () Bool)

(declare-fun e!445275 () Bool)

(assert (=> b!803668 (=> (not res!548329) (not e!445275))))

(declare-datatypes ((List!14935 0))(
  ( (Nil!14932) (Cons!14931 (h!16060 (_ BitVec 64)) (t!21241 List!14935)) )
))
(declare-fun arrayNoDuplicates!0 (array!43705 (_ BitVec 32) List!14935) Bool)

(assert (=> b!803668 (= res!548329 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14932))))

(declare-fun b!803669 () Bool)

(declare-fun res!548328 () Bool)

(assert (=> b!803669 (=> (not res!548328) (not e!445276))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803669 (= res!548328 (validKeyInArray!0 (select (arr!20933 a!3170) j!153)))))

(declare-fun b!803670 () Bool)

(declare-fun res!548331 () Bool)

(assert (=> b!803670 (=> (not res!548331) (not e!445276))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!803670 (= res!548331 (validKeyInArray!0 k0!2044))))

(declare-fun b!803671 () Bool)

(declare-fun res!548332 () Bool)

(assert (=> b!803671 (=> (not res!548332) (not e!445275))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803671 (= res!548332 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21354 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20933 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21354 a!3170)) (= (select (arr!20933 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803672 () Bool)

(declare-fun res!548335 () Bool)

(assert (=> b!803672 (=> (not res!548335) (not e!445276))))

(assert (=> b!803672 (= res!548335 (and (= (size!21354 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21354 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21354 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803673 () Bool)

(assert (=> b!803673 (= e!445276 e!445275)))

(declare-fun res!548336 () Bool)

(assert (=> b!803673 (=> (not res!548336) (not e!445275))))

(declare-datatypes ((SeekEntryResult!8521 0))(
  ( (MissingZero!8521 (index!36452 (_ BitVec 32))) (Found!8521 (index!36453 (_ BitVec 32))) (Intermediate!8521 (undefined!9333 Bool) (index!36454 (_ BitVec 32)) (x!67298 (_ BitVec 32))) (Undefined!8521) (MissingVacant!8521 (index!36455 (_ BitVec 32))) )
))
(declare-fun lt!359718 () SeekEntryResult!8521)

(assert (=> b!803673 (= res!548336 (or (= lt!359718 (MissingZero!8521 i!1163)) (= lt!359718 (MissingVacant!8521 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43705 (_ BitVec 32)) SeekEntryResult!8521)

(assert (=> b!803673 (= lt!359718 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803674 () Bool)

(declare-fun res!548333 () Bool)

(assert (=> b!803674 (=> (not res!548333) (not e!445276))))

(declare-fun arrayContainsKey!0 (array!43705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803674 (= res!548333 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803675 () Bool)

(declare-fun e!445277 () Bool)

(assert (=> b!803675 (= e!445275 e!445277)))

(declare-fun res!548337 () Bool)

(assert (=> b!803675 (=> (not res!548337) (not e!445277))))

(declare-fun lt!359720 () (_ BitVec 64))

(declare-fun lt!359714 () array!43705)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43705 (_ BitVec 32)) SeekEntryResult!8521)

(assert (=> b!803675 (= res!548337 (= (seekEntryOrOpen!0 lt!359720 lt!359714 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359720 lt!359714 mask!3266)))))

(assert (=> b!803675 (= lt!359720 (select (store (arr!20933 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803675 (= lt!359714 (array!43706 (store (arr!20933 a!3170) i!1163 k0!2044) (size!21354 a!3170)))))

(declare-fun b!803676 () Bool)

(declare-fun res!548327 () Bool)

(assert (=> b!803676 (=> (not res!548327) (not e!445275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43705 (_ BitVec 32)) Bool)

(assert (=> b!803676 (= res!548327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803677 () Bool)

(declare-fun e!445279 () Bool)

(assert (=> b!803677 (= e!445277 e!445279)))

(declare-fun res!548334 () Bool)

(assert (=> b!803677 (=> (not res!548334) (not e!445279))))

(declare-fun lt!359719 () SeekEntryResult!8521)

(declare-fun lt!359715 () SeekEntryResult!8521)

(assert (=> b!803677 (= res!548334 (and (= lt!359719 lt!359715) (= lt!359715 (Found!8521 j!153)) (not (= (select (arr!20933 a!3170) index!1236) (select (arr!20933 a!3170) j!153)))))))

(assert (=> b!803677 (= lt!359715 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20933 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803677 (= lt!359719 (seekEntryOrOpen!0 (select (arr!20933 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803678 () Bool)

(assert (=> b!803678 (= e!445279 (not true))))

(declare-fun lt!359716 () (_ BitVec 32))

(assert (=> b!803678 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359716 vacantAfter!23 lt!359720 lt!359714 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359716 vacantBefore!23 (select (arr!20933 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27556 0))(
  ( (Unit!27557) )
))
(declare-fun lt!359717 () Unit!27556)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27556)

(assert (=> b!803678 (= lt!359717 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359716 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803678 (= lt!359716 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68898 res!548330) b!803672))

(assert (= (and b!803672 res!548335) b!803669))

(assert (= (and b!803669 res!548328) b!803670))

(assert (= (and b!803670 res!548331) b!803674))

(assert (= (and b!803674 res!548333) b!803673))

(assert (= (and b!803673 res!548336) b!803676))

(assert (= (and b!803676 res!548327) b!803668))

(assert (= (and b!803668 res!548329) b!803671))

(assert (= (and b!803671 res!548332) b!803675))

(assert (= (and b!803675 res!548337) b!803677))

(assert (= (and b!803677 res!548334) b!803678))

(declare-fun m!745033 () Bool)

(assert (=> b!803669 m!745033))

(assert (=> b!803669 m!745033))

(declare-fun m!745035 () Bool)

(assert (=> b!803669 m!745035))

(declare-fun m!745037 () Bool)

(assert (=> b!803668 m!745037))

(declare-fun m!745039 () Bool)

(assert (=> b!803674 m!745039))

(declare-fun m!745041 () Bool)

(assert (=> b!803676 m!745041))

(declare-fun m!745043 () Bool)

(assert (=> b!803677 m!745043))

(assert (=> b!803677 m!745033))

(assert (=> b!803677 m!745033))

(declare-fun m!745045 () Bool)

(assert (=> b!803677 m!745045))

(assert (=> b!803677 m!745033))

(declare-fun m!745047 () Bool)

(assert (=> b!803677 m!745047))

(declare-fun m!745049 () Bool)

(assert (=> b!803671 m!745049))

(declare-fun m!745051 () Bool)

(assert (=> b!803671 m!745051))

(declare-fun m!745053 () Bool)

(assert (=> start!68898 m!745053))

(declare-fun m!745055 () Bool)

(assert (=> start!68898 m!745055))

(declare-fun m!745057 () Bool)

(assert (=> b!803670 m!745057))

(assert (=> b!803678 m!745033))

(declare-fun m!745059 () Bool)

(assert (=> b!803678 m!745059))

(assert (=> b!803678 m!745033))

(declare-fun m!745061 () Bool)

(assert (=> b!803678 m!745061))

(declare-fun m!745063 () Bool)

(assert (=> b!803678 m!745063))

(declare-fun m!745065 () Bool)

(assert (=> b!803678 m!745065))

(declare-fun m!745067 () Bool)

(assert (=> b!803675 m!745067))

(declare-fun m!745069 () Bool)

(assert (=> b!803675 m!745069))

(declare-fun m!745071 () Bool)

(assert (=> b!803675 m!745071))

(declare-fun m!745073 () Bool)

(assert (=> b!803675 m!745073))

(declare-fun m!745075 () Bool)

(assert (=> b!803673 m!745075))

(check-sat (not b!803674) (not b!803668) (not b!803675) (not start!68898) (not b!803678) (not b!803676) (not b!803670) (not b!803677) (not b!803673) (not b!803669))
(check-sat)
