; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118094 () Bool)

(assert start!118094)

(declare-fun b!1382602 () Bool)

(declare-fun res!924238 () Bool)

(declare-fun e!783642 () Bool)

(assert (=> b!1382602 (=> (not res!924238) (not e!783642))))

(declare-datatypes ((array!94410 0))(
  ( (array!94411 (arr!45586 (Array (_ BitVec 32) (_ BitVec 64))) (size!46138 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94410)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94410 (_ BitVec 32)) Bool)

(assert (=> b!1382602 (= res!924238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382603 () Bool)

(declare-fun res!924240 () Bool)

(assert (=> b!1382603 (=> (not res!924240) (not e!783642))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382603 (= res!924240 (and (= (size!46138 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46138 a!2971))))))

(declare-fun b!1382604 () Bool)

(assert (=> b!1382604 (= e!783642 (not true))))

(assert (=> b!1382604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94411 (store (arr!45586 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46138 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45900 0))(
  ( (Unit!45901) )
))
(declare-fun lt!608285 () Unit!45900)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45900)

(assert (=> b!1382604 (= lt!608285 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1382605 () Bool)

(declare-fun res!924241 () Bool)

(assert (=> b!1382605 (=> (not res!924241) (not e!783642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382605 (= res!924241 (validKeyInArray!0 (select (arr!45586 a!2971) i!1094)))))

(declare-fun b!1382606 () Bool)

(declare-fun res!924242 () Bool)

(assert (=> b!1382606 (=> (not res!924242) (not e!783642))))

(declare-datatypes ((List!32198 0))(
  ( (Nil!32195) (Cons!32194 (h!33403 (_ BitVec 64)) (t!46884 List!32198)) )
))
(declare-fun arrayNoDuplicates!0 (array!94410 (_ BitVec 32) List!32198) Bool)

(assert (=> b!1382606 (= res!924242 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32195))))

(declare-fun res!924239 () Bool)

(assert (=> start!118094 (=> (not res!924239) (not e!783642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118094 (= res!924239 (validMask!0 mask!3034))))

(assert (=> start!118094 e!783642))

(assert (=> start!118094 true))

(declare-fun array_inv!34819 (array!94410) Bool)

(assert (=> start!118094 (array_inv!34819 a!2971)))

(declare-fun b!1382607 () Bool)

(declare-fun res!924237 () Bool)

(assert (=> b!1382607 (=> (not res!924237) (not e!783642))))

(assert (=> b!1382607 (= res!924237 (and (not (= (select (arr!45586 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45586 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46138 a!2971))))))

(assert (= (and start!118094 res!924239) b!1382603))

(assert (= (and b!1382603 res!924240) b!1382605))

(assert (= (and b!1382605 res!924241) b!1382606))

(assert (= (and b!1382606 res!924242) b!1382602))

(assert (= (and b!1382602 res!924238) b!1382607))

(assert (= (and b!1382607 res!924237) b!1382604))

(declare-fun m!1267293 () Bool)

(assert (=> b!1382607 m!1267293))

(declare-fun m!1267295 () Bool)

(assert (=> b!1382604 m!1267295))

(declare-fun m!1267297 () Bool)

(assert (=> b!1382604 m!1267297))

(declare-fun m!1267299 () Bool)

(assert (=> b!1382604 m!1267299))

(declare-fun m!1267301 () Bool)

(assert (=> start!118094 m!1267301))

(declare-fun m!1267303 () Bool)

(assert (=> start!118094 m!1267303))

(assert (=> b!1382605 m!1267293))

(assert (=> b!1382605 m!1267293))

(declare-fun m!1267305 () Bool)

(assert (=> b!1382605 m!1267305))

(declare-fun m!1267307 () Bool)

(assert (=> b!1382606 m!1267307))

(declare-fun m!1267309 () Bool)

(assert (=> b!1382602 m!1267309))

(check-sat (not b!1382604) (not start!118094) (not b!1382606) (not b!1382605) (not b!1382602))
(check-sat)
