; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69188 () Bool)

(assert start!69188)

(declare-fun b!806127 () Bool)

(declare-fun e!446540 () Bool)

(declare-fun e!446541 () Bool)

(assert (=> b!806127 (= e!446540 e!446541)))

(declare-fun res!550107 () Bool)

(assert (=> b!806127 (=> (not res!550107) (not e!446541))))

(declare-datatypes ((SeekEntryResult!8527 0))(
  ( (MissingZero!8527 (index!36476 (_ BitVec 32))) (Found!8527 (index!36477 (_ BitVec 32))) (Intermediate!8527 (undefined!9339 Bool) (index!36478 (_ BitVec 32)) (x!67459 (_ BitVec 32))) (Undefined!8527) (MissingVacant!8527 (index!36479 (_ BitVec 32))) )
))
(declare-fun lt!360886 () SeekEntryResult!8527)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806127 (= res!550107 (or (= lt!360886 (MissingZero!8527 i!1163)) (= lt!360886 (MissingVacant!8527 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43810 0))(
  ( (array!43811 (arr!20980 (Array (_ BitVec 32) (_ BitVec 64))) (size!21400 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43810)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43810 (_ BitVec 32)) SeekEntryResult!8527)

(assert (=> b!806127 (= lt!360886 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!550102 () Bool)

(assert (=> start!69188 (=> (not res!550102) (not e!446540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69188 (= res!550102 (validMask!0 mask!3266))))

(assert (=> start!69188 e!446540))

(assert (=> start!69188 true))

(declare-fun array_inv!16839 (array!43810) Bool)

(assert (=> start!69188 (array_inv!16839 a!3170)))

(declare-fun b!806128 () Bool)

(declare-fun res!550103 () Bool)

(assert (=> b!806128 (=> (not res!550103) (not e!446541))))

(declare-datatypes ((List!14850 0))(
  ( (Nil!14847) (Cons!14846 (h!15981 (_ BitVec 64)) (t!21157 List!14850)) )
))
(declare-fun arrayNoDuplicates!0 (array!43810 (_ BitVec 32) List!14850) Bool)

(assert (=> b!806128 (= res!550103 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14847))))

(declare-fun b!806129 () Bool)

(declare-fun e!446542 () Bool)

(assert (=> b!806129 (= e!446541 e!446542)))

(declare-fun res!550106 () Bool)

(assert (=> b!806129 (=> (not res!550106) (not e!446542))))

(declare-fun lt!360883 () array!43810)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360885 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43810 (_ BitVec 32)) SeekEntryResult!8527)

(assert (=> b!806129 (= res!550106 (= (seekEntryOrOpen!0 lt!360885 lt!360883 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360885 lt!360883 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806129 (= lt!360885 (select (store (arr!20980 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806129 (= lt!360883 (array!43811 (store (arr!20980 a!3170) i!1163 k0!2044) (size!21400 a!3170)))))

(declare-fun b!806130 () Bool)

(declare-fun res!550101 () Bool)

(assert (=> b!806130 (=> (not res!550101) (not e!446540))))

(assert (=> b!806130 (= res!550101 (and (= (size!21400 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21400 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21400 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806131 () Bool)

(declare-fun res!550098 () Bool)

(assert (=> b!806131 (=> (not res!550098) (not e!446540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806131 (= res!550098 (validKeyInArray!0 (select (arr!20980 a!3170) j!153)))))

(declare-fun b!806132 () Bool)

(declare-fun res!550104 () Bool)

(assert (=> b!806132 (=> (not res!550104) (not e!446540))))

(declare-fun arrayContainsKey!0 (array!43810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806132 (= res!550104 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806133 () Bool)

(declare-fun res!550105 () Bool)

(assert (=> b!806133 (=> (not res!550105) (not e!446541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43810 (_ BitVec 32)) Bool)

(assert (=> b!806133 (= res!550105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806134 () Bool)

(assert (=> b!806134 (= e!446542 false)))

(declare-fun lt!360887 () SeekEntryResult!8527)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806134 (= lt!360887 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20980 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360884 () SeekEntryResult!8527)

(assert (=> b!806134 (= lt!360884 (seekEntryOrOpen!0 (select (arr!20980 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806135 () Bool)

(declare-fun res!550100 () Bool)

(assert (=> b!806135 (=> (not res!550100) (not e!446541))))

(assert (=> b!806135 (= res!550100 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21400 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20980 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21400 a!3170)) (= (select (arr!20980 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806136 () Bool)

(declare-fun res!550099 () Bool)

(assert (=> b!806136 (=> (not res!550099) (not e!446540))))

(assert (=> b!806136 (= res!550099 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69188 res!550102) b!806130))

(assert (= (and b!806130 res!550101) b!806131))

(assert (= (and b!806131 res!550098) b!806136))

(assert (= (and b!806136 res!550099) b!806132))

(assert (= (and b!806132 res!550104) b!806127))

(assert (= (and b!806127 res!550107) b!806133))

(assert (= (and b!806133 res!550105) b!806128))

(assert (= (and b!806128 res!550103) b!806135))

(assert (= (and b!806135 res!550100) b!806129))

(assert (= (and b!806129 res!550106) b!806134))

(declare-fun m!748417 () Bool)

(assert (=> start!69188 m!748417))

(declare-fun m!748419 () Bool)

(assert (=> start!69188 m!748419))

(declare-fun m!748421 () Bool)

(assert (=> b!806135 m!748421))

(declare-fun m!748423 () Bool)

(assert (=> b!806135 m!748423))

(declare-fun m!748425 () Bool)

(assert (=> b!806132 m!748425))

(declare-fun m!748427 () Bool)

(assert (=> b!806127 m!748427))

(declare-fun m!748429 () Bool)

(assert (=> b!806128 m!748429))

(declare-fun m!748431 () Bool)

(assert (=> b!806133 m!748431))

(declare-fun m!748433 () Bool)

(assert (=> b!806136 m!748433))

(declare-fun m!748435 () Bool)

(assert (=> b!806134 m!748435))

(assert (=> b!806134 m!748435))

(declare-fun m!748437 () Bool)

(assert (=> b!806134 m!748437))

(assert (=> b!806134 m!748435))

(declare-fun m!748439 () Bool)

(assert (=> b!806134 m!748439))

(declare-fun m!748441 () Bool)

(assert (=> b!806129 m!748441))

(declare-fun m!748443 () Bool)

(assert (=> b!806129 m!748443))

(declare-fun m!748445 () Bool)

(assert (=> b!806129 m!748445))

(declare-fun m!748447 () Bool)

(assert (=> b!806129 m!748447))

(assert (=> b!806131 m!748435))

(assert (=> b!806131 m!748435))

(declare-fun m!748449 () Bool)

(assert (=> b!806131 m!748449))

(check-sat (not b!806131) (not b!806133) (not b!806128) (not b!806127) (not b!806134) (not b!806132) (not b!806136) (not b!806129) (not start!69188))
(check-sat)
