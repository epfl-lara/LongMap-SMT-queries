; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117980 () Bool)

(assert start!117980)

(declare-fun b!1382014 () Bool)

(declare-fun res!923646 () Bool)

(declare-fun e!783353 () Bool)

(assert (=> b!1382014 (=> (not res!923646) (not e!783353))))

(declare-datatypes ((array!94371 0))(
  ( (array!94372 (arr!45568 (Array (_ BitVec 32) (_ BitVec 64))) (size!46118 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94371)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94371 (_ BitVec 32)) Bool)

(assert (=> b!1382014 (= res!923646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382015 () Bool)

(declare-fun res!923642 () Bool)

(assert (=> b!1382015 (=> (not res!923642) (not e!783353))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382015 (= res!923642 (and (= (size!46118 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46118 a!2971))))))

(declare-fun b!1382016 () Bool)

(declare-fun res!923647 () Bool)

(assert (=> b!1382016 (=> (not res!923647) (not e!783353))))

(declare-datatypes ((List!32102 0))(
  ( (Nil!32099) (Cons!32098 (h!33307 (_ BitVec 64)) (t!46796 List!32102)) )
))
(declare-fun arrayNoDuplicates!0 (array!94371 (_ BitVec 32) List!32102) Bool)

(assert (=> b!1382016 (= res!923647 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32099))))

(declare-fun b!1382017 () Bool)

(assert (=> b!1382017 (= e!783353 (not true))))

(assert (=> b!1382017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94372 (store (arr!45568 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46118 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46039 0))(
  ( (Unit!46040) )
))
(declare-fun lt!608331 () Unit!46039)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46039)

(assert (=> b!1382017 (= lt!608331 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun res!923643 () Bool)

(assert (=> start!117980 (=> (not res!923643) (not e!783353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117980 (= res!923643 (validMask!0 mask!3034))))

(assert (=> start!117980 e!783353))

(assert (=> start!117980 true))

(declare-fun array_inv!34596 (array!94371) Bool)

(assert (=> start!117980 (array_inv!34596 a!2971)))

(declare-fun b!1382018 () Bool)

(declare-fun res!923645 () Bool)

(assert (=> b!1382018 (=> (not res!923645) (not e!783353))))

(assert (=> b!1382018 (= res!923645 (and (not (= (select (arr!45568 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45568 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46118 a!2971))))))

(declare-fun b!1382019 () Bool)

(declare-fun res!923644 () Bool)

(assert (=> b!1382019 (=> (not res!923644) (not e!783353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382019 (= res!923644 (validKeyInArray!0 (select (arr!45568 a!2971) i!1094)))))

(assert (= (and start!117980 res!923643) b!1382015))

(assert (= (and b!1382015 res!923642) b!1382019))

(assert (= (and b!1382019 res!923644) b!1382016))

(assert (= (and b!1382016 res!923647) b!1382014))

(assert (= (and b!1382014 res!923646) b!1382018))

(assert (= (and b!1382018 res!923645) b!1382017))

(declare-fun m!1267191 () Bool)

(assert (=> b!1382019 m!1267191))

(assert (=> b!1382019 m!1267191))

(declare-fun m!1267193 () Bool)

(assert (=> b!1382019 m!1267193))

(declare-fun m!1267195 () Bool)

(assert (=> start!117980 m!1267195))

(declare-fun m!1267197 () Bool)

(assert (=> start!117980 m!1267197))

(declare-fun m!1267199 () Bool)

(assert (=> b!1382017 m!1267199))

(declare-fun m!1267201 () Bool)

(assert (=> b!1382017 m!1267201))

(declare-fun m!1267203 () Bool)

(assert (=> b!1382017 m!1267203))

(assert (=> b!1382018 m!1267191))

(declare-fun m!1267205 () Bool)

(assert (=> b!1382014 m!1267205))

(declare-fun m!1267207 () Bool)

(assert (=> b!1382016 m!1267207))

(push 1)

(assert (not b!1382016))

(assert (not start!117980))

(assert (not b!1382014))

(assert (not b!1382017))

(assert (not b!1382019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

