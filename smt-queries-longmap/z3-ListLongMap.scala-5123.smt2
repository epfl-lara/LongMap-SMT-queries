; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69540 () Bool)

(assert start!69540)

(declare-fun b!810445 () Bool)

(declare-fun res!553867 () Bool)

(declare-fun e!448573 () Bool)

(assert (=> b!810445 (=> (not res!553867) (not e!448573))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44053 0))(
  ( (array!44054 (arr!21098 (Array (_ BitVec 32) (_ BitVec 64))) (size!21519 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44053)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810445 (= res!553867 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21519 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21098 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21519 a!3170)) (= (select (arr!21098 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810447 () Bool)

(declare-fun e!448570 () Bool)

(declare-fun e!448571 () Bool)

(assert (=> b!810447 (= e!448570 e!448571)))

(declare-fun res!553863 () Bool)

(assert (=> b!810447 (=> (not res!553863) (not e!448571))))

(declare-datatypes ((SeekEntryResult!8686 0))(
  ( (MissingZero!8686 (index!37112 (_ BitVec 32))) (Found!8686 (index!37113 (_ BitVec 32))) (Intermediate!8686 (undefined!9498 Bool) (index!37114 (_ BitVec 32)) (x!67933 (_ BitVec 32))) (Undefined!8686) (MissingVacant!8686 (index!37115 (_ BitVec 32))) )
))
(declare-fun lt!363145 () SeekEntryResult!8686)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363148 () SeekEntryResult!8686)

(assert (=> b!810447 (= res!553863 (and (= lt!363148 lt!363145) (= lt!363145 (Found!8686 j!153)) (not (= (select (arr!21098 a!3170) index!1236) (select (arr!21098 a!3170) j!153)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44053 (_ BitVec 32)) SeekEntryResult!8686)

(assert (=> b!810447 (= lt!363145 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21098 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44053 (_ BitVec 32)) SeekEntryResult!8686)

(assert (=> b!810447 (= lt!363148 (seekEntryOrOpen!0 (select (arr!21098 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810448 () Bool)

(declare-fun e!448572 () Bool)

(assert (=> b!810448 (= e!448572 e!448573)))

(declare-fun res!553864 () Bool)

(assert (=> b!810448 (=> (not res!553864) (not e!448573))))

(declare-fun lt!363147 () SeekEntryResult!8686)

(assert (=> b!810448 (= res!553864 (or (= lt!363147 (MissingZero!8686 i!1163)) (= lt!363147 (MissingVacant!8686 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!810448 (= lt!363147 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810449 () Bool)

(declare-fun res!553869 () Bool)

(assert (=> b!810449 (=> (not res!553869) (not e!448572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810449 (= res!553869 (validKeyInArray!0 k0!2044))))

(declare-fun b!810450 () Bool)

(declare-fun res!553862 () Bool)

(assert (=> b!810450 (=> (not res!553862) (not e!448573))))

(declare-datatypes ((List!15100 0))(
  ( (Nil!15097) (Cons!15096 (h!16225 (_ BitVec 64)) (t!21406 List!15100)) )
))
(declare-fun arrayNoDuplicates!0 (array!44053 (_ BitVec 32) List!15100) Bool)

(assert (=> b!810450 (= res!553862 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15097))))

(declare-fun b!810451 () Bool)

(declare-fun res!553870 () Bool)

(assert (=> b!810451 (=> (not res!553870) (not e!448572))))

(assert (=> b!810451 (= res!553870 (validKeyInArray!0 (select (arr!21098 a!3170) j!153)))))

(declare-fun b!810452 () Bool)

(assert (=> b!810452 (= e!448571 (not true))))

(declare-fun lt!363146 () (_ BitVec 64))

(declare-fun lt!363144 () array!44053)

(declare-fun lt!363149 () (_ BitVec 32))

(assert (=> b!810452 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363149 vacantAfter!23 lt!363146 lt!363144 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363149 vacantBefore!23 (select (arr!21098 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27600 0))(
  ( (Unit!27601) )
))
(declare-fun lt!363143 () Unit!27600)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44053 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27600)

(assert (=> b!810452 (= lt!363143 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363149 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810452 (= lt!363149 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810453 () Bool)

(declare-fun res!553865 () Bool)

(assert (=> b!810453 (=> (not res!553865) (not e!448572))))

(assert (=> b!810453 (= res!553865 (and (= (size!21519 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21519 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21519 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!553868 () Bool)

(assert (=> start!69540 (=> (not res!553868) (not e!448572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69540 (= res!553868 (validMask!0 mask!3266))))

(assert (=> start!69540 e!448572))

(assert (=> start!69540 true))

(declare-fun array_inv!16981 (array!44053) Bool)

(assert (=> start!69540 (array_inv!16981 a!3170)))

(declare-fun b!810446 () Bool)

(assert (=> b!810446 (= e!448573 e!448570)))

(declare-fun res!553871 () Bool)

(assert (=> b!810446 (=> (not res!553871) (not e!448570))))

(assert (=> b!810446 (= res!553871 (= (seekEntryOrOpen!0 lt!363146 lt!363144 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363146 lt!363144 mask!3266)))))

(assert (=> b!810446 (= lt!363146 (select (store (arr!21098 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810446 (= lt!363144 (array!44054 (store (arr!21098 a!3170) i!1163 k0!2044) (size!21519 a!3170)))))

(declare-fun b!810454 () Bool)

(declare-fun res!553866 () Bool)

(assert (=> b!810454 (=> (not res!553866) (not e!448572))))

(declare-fun arrayContainsKey!0 (array!44053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810454 (= res!553866 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810455 () Bool)

(declare-fun res!553872 () Bool)

(assert (=> b!810455 (=> (not res!553872) (not e!448573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44053 (_ BitVec 32)) Bool)

(assert (=> b!810455 (= res!553872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69540 res!553868) b!810453))

(assert (= (and b!810453 res!553865) b!810451))

(assert (= (and b!810451 res!553870) b!810449))

(assert (= (and b!810449 res!553869) b!810454))

(assert (= (and b!810454 res!553866) b!810448))

(assert (= (and b!810448 res!553864) b!810455))

(assert (= (and b!810455 res!553872) b!810450))

(assert (= (and b!810450 res!553862) b!810445))

(assert (= (and b!810445 res!553867) b!810446))

(assert (= (and b!810446 res!553871) b!810447))

(assert (= (and b!810447 res!553863) b!810452))

(declare-fun m!752179 () Bool)

(assert (=> start!69540 m!752179))

(declare-fun m!752181 () Bool)

(assert (=> start!69540 m!752181))

(declare-fun m!752183 () Bool)

(assert (=> b!810450 m!752183))

(declare-fun m!752185 () Bool)

(assert (=> b!810447 m!752185))

(declare-fun m!752187 () Bool)

(assert (=> b!810447 m!752187))

(assert (=> b!810447 m!752187))

(declare-fun m!752189 () Bool)

(assert (=> b!810447 m!752189))

(assert (=> b!810447 m!752187))

(declare-fun m!752191 () Bool)

(assert (=> b!810447 m!752191))

(declare-fun m!752193 () Bool)

(assert (=> b!810449 m!752193))

(declare-fun m!752195 () Bool)

(assert (=> b!810448 m!752195))

(declare-fun m!752197 () Bool)

(assert (=> b!810455 m!752197))

(declare-fun m!752199 () Bool)

(assert (=> b!810446 m!752199))

(declare-fun m!752201 () Bool)

(assert (=> b!810446 m!752201))

(declare-fun m!752203 () Bool)

(assert (=> b!810446 m!752203))

(declare-fun m!752205 () Bool)

(assert (=> b!810446 m!752205))

(declare-fun m!752207 () Bool)

(assert (=> b!810445 m!752207))

(declare-fun m!752209 () Bool)

(assert (=> b!810445 m!752209))

(assert (=> b!810451 m!752187))

(assert (=> b!810451 m!752187))

(declare-fun m!752211 () Bool)

(assert (=> b!810451 m!752211))

(declare-fun m!752213 () Bool)

(assert (=> b!810452 m!752213))

(assert (=> b!810452 m!752187))

(declare-fun m!752215 () Bool)

(assert (=> b!810452 m!752215))

(declare-fun m!752217 () Bool)

(assert (=> b!810452 m!752217))

(assert (=> b!810452 m!752187))

(declare-fun m!752219 () Bool)

(assert (=> b!810452 m!752219))

(declare-fun m!752221 () Bool)

(assert (=> b!810454 m!752221))

(check-sat (not b!810448) (not b!810449) (not b!810452) (not b!810454) (not b!810450) (not b!810451) (not b!810455) (not b!810447) (not start!69540) (not b!810446))
(check-sat)
