; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130954 () Bool)

(assert start!130954)

(declare-fun b!1536166 () Bool)

(declare-fun res!1053254 () Bool)

(declare-fun e!855054 () Bool)

(assert (=> b!1536166 (=> (not res!1053254) (not e!855054))))

(declare-datatypes ((array!102052 0))(
  ( (array!102053 (arr!49242 (Array (_ BitVec 32) (_ BitVec 64))) (size!49792 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102052)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536166 (= res!1053254 (validKeyInArray!0 (select (arr!49242 a!2792) j!64)))))

(declare-fun b!1536167 () Bool)

(declare-fun e!855056 () Bool)

(declare-fun e!855057 () Bool)

(assert (=> b!1536167 (= e!855056 e!855057)))

(declare-fun res!1053262 () Bool)

(assert (=> b!1536167 (=> (not res!1053262) (not e!855057))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664249 () (_ BitVec 32))

(assert (=> b!1536167 (= res!1053262 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664249 #b00000000000000000000000000000000) (bvslt lt!664249 (size!49792 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536167 (= lt!664249 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536168 () Bool)

(declare-fun res!1053261 () Bool)

(assert (=> b!1536168 (=> (not res!1053261) (not e!855054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102052 (_ BitVec 32)) Bool)

(assert (=> b!1536168 (= res!1053261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536169 () Bool)

(declare-fun res!1053260 () Bool)

(assert (=> b!1536169 (=> (not res!1053260) (not e!855056))))

(assert (=> b!1536169 (= res!1053260 (not (= (select (arr!49242 a!2792) index!463) (select (arr!49242 a!2792) j!64))))))

(declare-fun b!1536170 () Bool)

(declare-fun res!1053259 () Bool)

(assert (=> b!1536170 (=> (not res!1053259) (not e!855054))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536170 (= res!1053259 (validKeyInArray!0 (select (arr!49242 a!2792) i!951)))))

(declare-fun b!1536171 () Bool)

(declare-fun res!1053255 () Bool)

(assert (=> b!1536171 (=> (not res!1053255) (not e!855054))))

(assert (=> b!1536171 (= res!1053255 (and (= (size!49792 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49792 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49792 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536173 () Bool)

(declare-fun e!855055 () Bool)

(assert (=> b!1536173 (= e!855057 e!855055)))

(declare-fun res!1053253 () Bool)

(assert (=> b!1536173 (=> (not res!1053253) (not e!855055))))

(declare-datatypes ((SeekEntryResult!13374 0))(
  ( (MissingZero!13374 (index!55891 (_ BitVec 32))) (Found!13374 (index!55892 (_ BitVec 32))) (Intermediate!13374 (undefined!14186 Bool) (index!55893 (_ BitVec 32)) (x!137632 (_ BitVec 32))) (Undefined!13374) (MissingVacant!13374 (index!55894 (_ BitVec 32))) )
))
(declare-fun lt!664247 () SeekEntryResult!13374)

(declare-fun lt!664246 () SeekEntryResult!13374)

(assert (=> b!1536173 (= res!1053253 (= lt!664247 lt!664246))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102052 (_ BitVec 32)) SeekEntryResult!13374)

(assert (=> b!1536173 (= lt!664247 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664249 vacantIndex!5 (select (arr!49242 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536174 () Bool)

(assert (=> b!1536174 (= e!855054 e!855056)))

(declare-fun res!1053252 () Bool)

(assert (=> b!1536174 (=> (not res!1053252) (not e!855056))))

(assert (=> b!1536174 (= res!1053252 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49242 a!2792) j!64) a!2792 mask!2480) lt!664246))))

(assert (=> b!1536174 (= lt!664246 (Found!13374 j!64))))

(declare-fun res!1053257 () Bool)

(assert (=> start!130954 (=> (not res!1053257) (not e!855054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130954 (= res!1053257 (validMask!0 mask!2480))))

(assert (=> start!130954 e!855054))

(assert (=> start!130954 true))

(declare-fun array_inv!38270 (array!102052) Bool)

(assert (=> start!130954 (array_inv!38270 a!2792)))

(declare-fun b!1536172 () Bool)

(declare-fun res!1053256 () Bool)

(assert (=> b!1536172 (=> (not res!1053256) (not e!855054))))

(declare-datatypes ((List!35716 0))(
  ( (Nil!35713) (Cons!35712 (h!37157 (_ BitVec 64)) (t!50410 List!35716)) )
))
(declare-fun arrayNoDuplicates!0 (array!102052 (_ BitVec 32) List!35716) Bool)

(assert (=> b!1536172 (= res!1053256 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35713))))

(declare-fun b!1536175 () Bool)

(assert (=> b!1536175 (= e!855055 (not true))))

(assert (=> b!1536175 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664249 vacantIndex!5 (select (store (arr!49242 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102053 (store (arr!49242 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49792 a!2792)) mask!2480) lt!664247)))

(declare-datatypes ((Unit!51320 0))(
  ( (Unit!51321) )
))
(declare-fun lt!664248 () Unit!51320)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51320)

(assert (=> b!1536175 (= lt!664248 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664249 vacantIndex!5 mask!2480))))

(declare-fun b!1536176 () Bool)

(declare-fun res!1053258 () Bool)

(assert (=> b!1536176 (=> (not res!1053258) (not e!855054))))

(assert (=> b!1536176 (= res!1053258 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49792 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49792 a!2792)) (= (select (arr!49242 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130954 res!1053257) b!1536171))

(assert (= (and b!1536171 res!1053255) b!1536170))

(assert (= (and b!1536170 res!1053259) b!1536166))

(assert (= (and b!1536166 res!1053254) b!1536168))

(assert (= (and b!1536168 res!1053261) b!1536172))

(assert (= (and b!1536172 res!1053256) b!1536176))

(assert (= (and b!1536176 res!1053258) b!1536174))

(assert (= (and b!1536174 res!1053252) b!1536169))

(assert (= (and b!1536169 res!1053260) b!1536167))

(assert (= (and b!1536167 res!1053262) b!1536173))

(assert (= (and b!1536173 res!1053253) b!1536175))

(declare-fun m!1418623 () Bool)

(assert (=> b!1536172 m!1418623))

(declare-fun m!1418625 () Bool)

(assert (=> b!1536173 m!1418625))

(assert (=> b!1536173 m!1418625))

(declare-fun m!1418627 () Bool)

(assert (=> b!1536173 m!1418627))

(assert (=> b!1536174 m!1418625))

(assert (=> b!1536174 m!1418625))

(declare-fun m!1418629 () Bool)

(assert (=> b!1536174 m!1418629))

(declare-fun m!1418631 () Bool)

(assert (=> b!1536167 m!1418631))

(declare-fun m!1418633 () Bool)

(assert (=> b!1536176 m!1418633))

(declare-fun m!1418635 () Bool)

(assert (=> b!1536168 m!1418635))

(declare-fun m!1418637 () Bool)

(assert (=> b!1536169 m!1418637))

(assert (=> b!1536169 m!1418625))

(assert (=> b!1536166 m!1418625))

(assert (=> b!1536166 m!1418625))

(declare-fun m!1418639 () Bool)

(assert (=> b!1536166 m!1418639))

(declare-fun m!1418641 () Bool)

(assert (=> b!1536175 m!1418641))

(declare-fun m!1418643 () Bool)

(assert (=> b!1536175 m!1418643))

(assert (=> b!1536175 m!1418643))

(declare-fun m!1418645 () Bool)

(assert (=> b!1536175 m!1418645))

(declare-fun m!1418647 () Bool)

(assert (=> b!1536175 m!1418647))

(declare-fun m!1418649 () Bool)

(assert (=> b!1536170 m!1418649))

(assert (=> b!1536170 m!1418649))

(declare-fun m!1418651 () Bool)

(assert (=> b!1536170 m!1418651))

(declare-fun m!1418653 () Bool)

(assert (=> start!130954 m!1418653))

(declare-fun m!1418655 () Bool)

(assert (=> start!130954 m!1418655))

(check-sat (not b!1536168) (not b!1536167) (not b!1536170) (not b!1536166) (not b!1536172) (not b!1536175) (not b!1536174) (not start!130954) (not b!1536173))
(check-sat)
