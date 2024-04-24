; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131184 () Bool)

(assert start!131184)

(declare-fun b!1536313 () Bool)

(declare-fun res!1051920 () Bool)

(declare-fun e!855804 () Bool)

(assert (=> b!1536313 (=> (not res!1051920) (not e!855804))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-datatypes ((array!102019 0))(
  ( (array!102020 (arr!49219 (Array (_ BitVec 32) (_ BitVec 64))) (size!49770 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102019)

(assert (=> b!1536313 (= res!1051920 (and (= (size!49770 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49770 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49770 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536314 () Bool)

(declare-fun res!1051915 () Bool)

(assert (=> b!1536314 (=> (not res!1051915) (not e!855804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536314 (= res!1051915 (validKeyInArray!0 (select (arr!49219 a!2792) j!64)))))

(declare-fun b!1536315 () Bool)

(declare-fun res!1051918 () Bool)

(assert (=> b!1536315 (=> (not res!1051918) (not e!855804))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13246 0))(
  ( (MissingZero!13246 (index!55379 (_ BitVec 32))) (Found!13246 (index!55380 (_ BitVec 32))) (Intermediate!13246 (undefined!14058 Bool) (index!55381 (_ BitVec 32)) (x!137351 (_ BitVec 32))) (Undefined!13246) (MissingVacant!13246 (index!55382 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102019 (_ BitVec 32)) SeekEntryResult!13246)

(assert (=> b!1536315 (= res!1051918 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49219 a!2792) j!64) a!2792 mask!2480) (Found!13246 j!64)))))

(declare-fun b!1536316 () Bool)

(declare-fun res!1051919 () Bool)

(assert (=> b!1536316 (=> (not res!1051919) (not e!855804))))

(declare-datatypes ((List!35680 0))(
  ( (Nil!35677) (Cons!35676 (h!37139 (_ BitVec 64)) (t!50366 List!35680)) )
))
(declare-fun arrayNoDuplicates!0 (array!102019 (_ BitVec 32) List!35680) Bool)

(assert (=> b!1536316 (= res!1051919 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35677))))

(declare-fun b!1536317 () Bool)

(assert (=> b!1536317 (= e!855804 (and (= (select (arr!49219 a!2792) index!463) (select (arr!49219 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun res!1051914 () Bool)

(assert (=> start!131184 (=> (not res!1051914) (not e!855804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131184 (= res!1051914 (validMask!0 mask!2480))))

(assert (=> start!131184 e!855804))

(assert (=> start!131184 true))

(declare-fun array_inv!38500 (array!102019) Bool)

(assert (=> start!131184 (array_inv!38500 a!2792)))

(declare-fun b!1536318 () Bool)

(declare-fun res!1051913 () Bool)

(assert (=> b!1536318 (=> (not res!1051913) (not e!855804))))

(assert (=> b!1536318 (= res!1051913 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49770 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49770 a!2792)) (= (select (arr!49219 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536319 () Bool)

(declare-fun res!1051917 () Bool)

(assert (=> b!1536319 (=> (not res!1051917) (not e!855804))))

(assert (=> b!1536319 (= res!1051917 (validKeyInArray!0 (select (arr!49219 a!2792) i!951)))))

(declare-fun b!1536320 () Bool)

(declare-fun res!1051916 () Bool)

(assert (=> b!1536320 (=> (not res!1051916) (not e!855804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102019 (_ BitVec 32)) Bool)

(assert (=> b!1536320 (= res!1051916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131184 res!1051914) b!1536313))

(assert (= (and b!1536313 res!1051920) b!1536319))

(assert (= (and b!1536319 res!1051917) b!1536314))

(assert (= (and b!1536314 res!1051915) b!1536320))

(assert (= (and b!1536320 res!1051916) b!1536316))

(assert (= (and b!1536316 res!1051919) b!1536318))

(assert (= (and b!1536318 res!1051913) b!1536315))

(assert (= (and b!1536315 res!1051918) b!1536317))

(declare-fun m!1418857 () Bool)

(assert (=> b!1536315 m!1418857))

(assert (=> b!1536315 m!1418857))

(declare-fun m!1418859 () Bool)

(assert (=> b!1536315 m!1418859))

(declare-fun m!1418861 () Bool)

(assert (=> b!1536317 m!1418861))

(assert (=> b!1536317 m!1418857))

(declare-fun m!1418863 () Bool)

(assert (=> b!1536319 m!1418863))

(assert (=> b!1536319 m!1418863))

(declare-fun m!1418865 () Bool)

(assert (=> b!1536319 m!1418865))

(declare-fun m!1418867 () Bool)

(assert (=> b!1536320 m!1418867))

(assert (=> b!1536314 m!1418857))

(assert (=> b!1536314 m!1418857))

(declare-fun m!1418869 () Bool)

(assert (=> b!1536314 m!1418869))

(declare-fun m!1418871 () Bool)

(assert (=> b!1536316 m!1418871))

(declare-fun m!1418873 () Bool)

(assert (=> start!131184 m!1418873))

(declare-fun m!1418875 () Bool)

(assert (=> start!131184 m!1418875))

(declare-fun m!1418877 () Bool)

(assert (=> b!1536318 m!1418877))

(check-sat (not b!1536319) (not b!1536316) (not b!1536315) (not start!131184) (not b!1536320) (not b!1536314))
(check-sat)
