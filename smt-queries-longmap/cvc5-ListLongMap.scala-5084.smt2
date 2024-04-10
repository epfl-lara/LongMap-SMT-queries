; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69014 () Bool)

(assert start!69014)

(declare-fun b!805149 () Bool)

(declare-fun res!549673 () Bool)

(declare-fun e!445932 () Bool)

(assert (=> b!805149 (=> (not res!549673) (not e!445932))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43804 0))(
  ( (array!43805 (arr!20982 (Array (_ BitVec 32) (_ BitVec 64))) (size!21403 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43804)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!805149 (= res!549673 (and (= (size!21403 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21403 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21403 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805150 () Bool)

(declare-fun res!549677 () Bool)

(assert (=> b!805150 (=> (not res!549677) (not e!445932))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805150 (= res!549677 (validKeyInArray!0 k!2044))))

(declare-fun b!805152 () Bool)

(declare-fun res!549670 () Bool)

(assert (=> b!805152 (=> (not res!549670) (not e!445932))))

(assert (=> b!805152 (= res!549670 (validKeyInArray!0 (select (arr!20982 a!3170) j!153)))))

(declare-fun b!805153 () Bool)

(declare-fun res!549668 () Bool)

(declare-fun e!445934 () Bool)

(assert (=> b!805153 (=> (not res!549668) (not e!445934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43804 (_ BitVec 32)) Bool)

(assert (=> b!805153 (= res!549668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805154 () Bool)

(declare-fun res!549674 () Bool)

(assert (=> b!805154 (=> (not res!549674) (not e!445934))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805154 (= res!549674 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21403 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20982 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21403 a!3170)) (= (select (arr!20982 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805155 () Bool)

(declare-fun res!549669 () Bool)

(assert (=> b!805155 (=> (not res!549669) (not e!445934))))

(declare-datatypes ((List!14945 0))(
  ( (Nil!14942) (Cons!14941 (h!16070 (_ BitVec 64)) (t!21260 List!14945)) )
))
(declare-fun arrayNoDuplicates!0 (array!43804 (_ BitVec 32) List!14945) Bool)

(assert (=> b!805155 (= res!549669 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14942))))

(declare-fun b!805156 () Bool)

(assert (=> b!805156 (= e!445932 e!445934)))

(declare-fun res!549672 () Bool)

(assert (=> b!805156 (=> (not res!549672) (not e!445934))))

(declare-datatypes ((SeekEntryResult!8573 0))(
  ( (MissingZero!8573 (index!36660 (_ BitVec 32))) (Found!8573 (index!36661 (_ BitVec 32))) (Intermediate!8573 (undefined!9385 Bool) (index!36662 (_ BitVec 32)) (x!67483 (_ BitVec 32))) (Undefined!8573) (MissingVacant!8573 (index!36663 (_ BitVec 32))) )
))
(declare-fun lt!360482 () SeekEntryResult!8573)

(assert (=> b!805156 (= res!549672 (or (= lt!360482 (MissingZero!8573 i!1163)) (= lt!360482 (MissingVacant!8573 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43804 (_ BitVec 32)) SeekEntryResult!8573)

(assert (=> b!805156 (= lt!360482 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!549676 () Bool)

(assert (=> start!69014 (=> (not res!549676) (not e!445932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69014 (= res!549676 (validMask!0 mask!3266))))

(assert (=> start!69014 e!445932))

(assert (=> start!69014 true))

(declare-fun array_inv!16778 (array!43804) Bool)

(assert (=> start!69014 (array_inv!16778 a!3170)))

(declare-fun b!805151 () Bool)

(declare-fun e!445931 () Bool)

(assert (=> b!805151 (= e!445931 false)))

(declare-fun lt!360485 () SeekEntryResult!8573)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43804 (_ BitVec 32)) SeekEntryResult!8573)

(assert (=> b!805151 (= lt!360485 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20982 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360483 () SeekEntryResult!8573)

(assert (=> b!805151 (= lt!360483 (seekEntryOrOpen!0 (select (arr!20982 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805157 () Bool)

(assert (=> b!805157 (= e!445934 e!445931)))

(declare-fun res!549671 () Bool)

(assert (=> b!805157 (=> (not res!549671) (not e!445931))))

(declare-fun lt!360484 () (_ BitVec 64))

(declare-fun lt!360481 () array!43804)

(assert (=> b!805157 (= res!549671 (= (seekEntryOrOpen!0 lt!360484 lt!360481 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360484 lt!360481 mask!3266)))))

(assert (=> b!805157 (= lt!360484 (select (store (arr!20982 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805157 (= lt!360481 (array!43805 (store (arr!20982 a!3170) i!1163 k!2044) (size!21403 a!3170)))))

(declare-fun b!805158 () Bool)

(declare-fun res!549675 () Bool)

(assert (=> b!805158 (=> (not res!549675) (not e!445932))))

(declare-fun arrayContainsKey!0 (array!43804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805158 (= res!549675 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69014 res!549676) b!805149))

(assert (= (and b!805149 res!549673) b!805152))

(assert (= (and b!805152 res!549670) b!805150))

(assert (= (and b!805150 res!549677) b!805158))

(assert (= (and b!805158 res!549675) b!805156))

(assert (= (and b!805156 res!549672) b!805153))

(assert (= (and b!805153 res!549668) b!805155))

(assert (= (and b!805155 res!549669) b!805154))

(assert (= (and b!805154 res!549674) b!805157))

(assert (= (and b!805157 res!549671) b!805151))

(declare-fun m!747059 () Bool)

(assert (=> b!805158 m!747059))

(declare-fun m!747061 () Bool)

(assert (=> b!805151 m!747061))

(assert (=> b!805151 m!747061))

(declare-fun m!747063 () Bool)

(assert (=> b!805151 m!747063))

(assert (=> b!805151 m!747061))

(declare-fun m!747065 () Bool)

(assert (=> b!805151 m!747065))

(declare-fun m!747067 () Bool)

(assert (=> b!805156 m!747067))

(declare-fun m!747069 () Bool)

(assert (=> b!805153 m!747069))

(assert (=> b!805152 m!747061))

(assert (=> b!805152 m!747061))

(declare-fun m!747071 () Bool)

(assert (=> b!805152 m!747071))

(declare-fun m!747073 () Bool)

(assert (=> b!805155 m!747073))

(declare-fun m!747075 () Bool)

(assert (=> b!805154 m!747075))

(declare-fun m!747077 () Bool)

(assert (=> b!805154 m!747077))

(declare-fun m!747079 () Bool)

(assert (=> b!805150 m!747079))

(declare-fun m!747081 () Bool)

(assert (=> start!69014 m!747081))

(declare-fun m!747083 () Bool)

(assert (=> start!69014 m!747083))

(declare-fun m!747085 () Bool)

(assert (=> b!805157 m!747085))

(declare-fun m!747087 () Bool)

(assert (=> b!805157 m!747087))

(declare-fun m!747089 () Bool)

(assert (=> b!805157 m!747089))

(declare-fun m!747091 () Bool)

(assert (=> b!805157 m!747091))

(push 1)

