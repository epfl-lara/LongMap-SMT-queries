; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68910 () Bool)

(assert start!68910)

(declare-fun b!803777 () Bool)

(declare-fun res!548304 () Bool)

(declare-fun e!445364 () Bool)

(assert (=> b!803777 (=> (not res!548304) (not e!445364))))

(declare-datatypes ((array!43700 0))(
  ( (array!43701 (arr!20930 (Array (_ BitVec 32) (_ BitVec 64))) (size!21351 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43700)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803777 (= res!548304 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803778 () Bool)

(declare-fun res!548306 () Bool)

(assert (=> b!803778 (=> (not res!548306) (not e!445364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803778 (= res!548306 (validKeyInArray!0 k!2044))))

(declare-fun b!803779 () Bool)

(declare-fun res!548300 () Bool)

(assert (=> b!803779 (=> (not res!548300) (not e!445364))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!803779 (= res!548300 (and (= (size!21351 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21351 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21351 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803781 () Bool)

(declare-fun res!548299 () Bool)

(declare-fun e!445362 () Bool)

(assert (=> b!803781 (=> (not res!548299) (not e!445362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43700 (_ BitVec 32)) Bool)

(assert (=> b!803781 (= res!548299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803782 () Bool)

(declare-fun e!445360 () Bool)

(assert (=> b!803782 (= e!445362 e!445360)))

(declare-fun res!548296 () Bool)

(assert (=> b!803782 (=> (not res!548296) (not e!445360))))

(declare-fun lt!359846 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359847 () array!43700)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8521 0))(
  ( (MissingZero!8521 (index!36452 (_ BitVec 32))) (Found!8521 (index!36453 (_ BitVec 32))) (Intermediate!8521 (undefined!9333 Bool) (index!36454 (_ BitVec 32)) (x!67287 (_ BitVec 32))) (Undefined!8521) (MissingVacant!8521 (index!36455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43700 (_ BitVec 32)) SeekEntryResult!8521)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43700 (_ BitVec 32)) SeekEntryResult!8521)

(assert (=> b!803782 (= res!548296 (= (seekEntryOrOpen!0 lt!359846 lt!359847 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359846 lt!359847 mask!3266)))))

(assert (=> b!803782 (= lt!359846 (select (store (arr!20930 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803782 (= lt!359847 (array!43701 (store (arr!20930 a!3170) i!1163 k!2044) (size!21351 a!3170)))))

(declare-fun b!803783 () Bool)

(declare-fun res!548301 () Bool)

(assert (=> b!803783 (=> (not res!548301) (not e!445362))))

(declare-datatypes ((List!14893 0))(
  ( (Nil!14890) (Cons!14889 (h!16018 (_ BitVec 64)) (t!21208 List!14893)) )
))
(declare-fun arrayNoDuplicates!0 (array!43700 (_ BitVec 32) List!14893) Bool)

(assert (=> b!803783 (= res!548301 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14890))))

(declare-fun b!803784 () Bool)

(declare-fun res!548305 () Bool)

(assert (=> b!803784 (=> (not res!548305) (not e!445364))))

(assert (=> b!803784 (= res!548305 (validKeyInArray!0 (select (arr!20930 a!3170) j!153)))))

(declare-fun b!803785 () Bool)

(declare-fun e!445361 () Bool)

(assert (=> b!803785 (= e!445360 e!445361)))

(declare-fun res!548297 () Bool)

(assert (=> b!803785 (=> (not res!548297) (not e!445361))))

(declare-fun lt!359849 () SeekEntryResult!8521)

(declare-fun lt!359848 () SeekEntryResult!8521)

(assert (=> b!803785 (= res!548297 (and (= lt!359848 lt!359849) (= lt!359849 (Found!8521 j!153)) (not (= (select (arr!20930 a!3170) index!1236) (select (arr!20930 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803785 (= lt!359849 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20930 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803785 (= lt!359848 (seekEntryOrOpen!0 (select (arr!20930 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!548298 () Bool)

(assert (=> start!68910 (=> (not res!548298) (not e!445364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68910 (= res!548298 (validMask!0 mask!3266))))

(assert (=> start!68910 e!445364))

(assert (=> start!68910 true))

(declare-fun array_inv!16726 (array!43700) Bool)

(assert (=> start!68910 (array_inv!16726 a!3170)))

(declare-fun b!803780 () Bool)

(assert (=> b!803780 (= e!445364 e!445362)))

(declare-fun res!548302 () Bool)

(assert (=> b!803780 (=> (not res!548302) (not e!445362))))

(declare-fun lt!359843 () SeekEntryResult!8521)

(assert (=> b!803780 (= res!548302 (or (= lt!359843 (MissingZero!8521 i!1163)) (= lt!359843 (MissingVacant!8521 i!1163))))))

(assert (=> b!803780 (= lt!359843 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803786 () Bool)

(assert (=> b!803786 (= e!445361 (not true))))

(declare-fun lt!359845 () (_ BitVec 32))

(assert (=> b!803786 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359845 vacantAfter!23 lt!359846 lt!359847 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359845 vacantBefore!23 (select (arr!20930 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27582 0))(
  ( (Unit!27583) )
))
(declare-fun lt!359844 () Unit!27582)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43700 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27582)

(assert (=> b!803786 (= lt!359844 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359845 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803786 (= lt!359845 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803787 () Bool)

(declare-fun res!548303 () Bool)

(assert (=> b!803787 (=> (not res!548303) (not e!445362))))

(assert (=> b!803787 (= res!548303 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21351 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20930 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21351 a!3170)) (= (select (arr!20930 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68910 res!548298) b!803779))

(assert (= (and b!803779 res!548300) b!803784))

(assert (= (and b!803784 res!548305) b!803778))

(assert (= (and b!803778 res!548306) b!803777))

(assert (= (and b!803777 res!548304) b!803780))

(assert (= (and b!803780 res!548302) b!803781))

(assert (= (and b!803781 res!548299) b!803783))

(assert (= (and b!803783 res!548301) b!803787))

(assert (= (and b!803787 res!548303) b!803782))

(assert (= (and b!803782 res!548296) b!803785))

(assert (= (and b!803785 res!548297) b!803786))

(declare-fun m!745599 () Bool)

(assert (=> b!803787 m!745599))

(declare-fun m!745601 () Bool)

(assert (=> b!803787 m!745601))

(declare-fun m!745603 () Bool)

(assert (=> b!803781 m!745603))

(declare-fun m!745605 () Bool)

(assert (=> b!803778 m!745605))

(declare-fun m!745607 () Bool)

(assert (=> b!803780 m!745607))

(declare-fun m!745609 () Bool)

(assert (=> b!803785 m!745609))

(declare-fun m!745611 () Bool)

(assert (=> b!803785 m!745611))

(assert (=> b!803785 m!745611))

(declare-fun m!745613 () Bool)

(assert (=> b!803785 m!745613))

(assert (=> b!803785 m!745611))

(declare-fun m!745615 () Bool)

(assert (=> b!803785 m!745615))

(declare-fun m!745617 () Bool)

(assert (=> b!803782 m!745617))

(declare-fun m!745619 () Bool)

(assert (=> b!803782 m!745619))

(declare-fun m!745621 () Bool)

(assert (=> b!803782 m!745621))

(declare-fun m!745623 () Bool)

(assert (=> b!803782 m!745623))

(declare-fun m!745625 () Bool)

(assert (=> b!803783 m!745625))

(declare-fun m!745627 () Bool)

(assert (=> start!68910 m!745627))

(declare-fun m!745629 () Bool)

(assert (=> start!68910 m!745629))

(assert (=> b!803784 m!745611))

(assert (=> b!803784 m!745611))

(declare-fun m!745631 () Bool)

(assert (=> b!803784 m!745631))

(declare-fun m!745633 () Bool)

(assert (=> b!803777 m!745633))

(assert (=> b!803786 m!745611))

(declare-fun m!745635 () Bool)

(assert (=> b!803786 m!745635))

(declare-fun m!745637 () Bool)

(assert (=> b!803786 m!745637))

(declare-fun m!745639 () Bool)

(assert (=> b!803786 m!745639))

(assert (=> b!803786 m!745611))

(declare-fun m!745641 () Bool)

(assert (=> b!803786 m!745641))

(push 1)

(assert (not b!803782))

(assert (not b!803777))

(assert (not b!803785))

