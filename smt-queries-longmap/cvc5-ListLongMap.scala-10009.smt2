; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118092 () Bool)

(assert start!118092)

(declare-fun b!1382584 () Bool)

(declare-fun res!924221 () Bool)

(declare-fun e!783637 () Bool)

(assert (=> b!1382584 (=> (not res!924221) (not e!783637))))

(declare-datatypes ((array!94408 0))(
  ( (array!94409 (arr!45585 (Array (_ BitVec 32) (_ BitVec 64))) (size!46137 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94408)

(declare-datatypes ((List!32197 0))(
  ( (Nil!32194) (Cons!32193 (h!33402 (_ BitVec 64)) (t!46883 List!32197)) )
))
(declare-fun arrayNoDuplicates!0 (array!94408 (_ BitVec 32) List!32197) Bool)

(assert (=> b!1382584 (= res!924221 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32194))))

(declare-fun res!924220 () Bool)

(assert (=> start!118092 (=> (not res!924220) (not e!783637))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118092 (= res!924220 (validMask!0 mask!3034))))

(assert (=> start!118092 e!783637))

(assert (=> start!118092 true))

(declare-fun array_inv!34818 (array!94408) Bool)

(assert (=> start!118092 (array_inv!34818 a!2971)))

(declare-fun b!1382585 () Bool)

(declare-fun res!924219 () Bool)

(assert (=> b!1382585 (=> (not res!924219) (not e!783637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94408 (_ BitVec 32)) Bool)

(assert (=> b!1382585 (= res!924219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382586 () Bool)

(declare-fun res!924223 () Bool)

(assert (=> b!1382586 (=> (not res!924223) (not e!783637))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382586 (= res!924223 (validKeyInArray!0 (select (arr!45585 a!2971) i!1094)))))

(declare-fun b!1382587 () Bool)

(assert (=> b!1382587 (= e!783637 (not true))))

(assert (=> b!1382587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94409 (store (arr!45585 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46137 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45898 0))(
  ( (Unit!45899) )
))
(declare-fun lt!608282 () Unit!45898)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45898)

(assert (=> b!1382587 (= lt!608282 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1382588 () Bool)

(declare-fun res!924222 () Bool)

(assert (=> b!1382588 (=> (not res!924222) (not e!783637))))

(assert (=> b!1382588 (= res!924222 (and (= (size!46137 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46137 a!2971))))))

(declare-fun b!1382589 () Bool)

(declare-fun res!924224 () Bool)

(assert (=> b!1382589 (=> (not res!924224) (not e!783637))))

(assert (=> b!1382589 (= res!924224 (and (not (= (select (arr!45585 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45585 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46137 a!2971))))))

(assert (= (and start!118092 res!924220) b!1382588))

(assert (= (and b!1382588 res!924222) b!1382586))

(assert (= (and b!1382586 res!924223) b!1382584))

(assert (= (and b!1382584 res!924221) b!1382585))

(assert (= (and b!1382585 res!924219) b!1382589))

(assert (= (and b!1382589 res!924224) b!1382587))

(declare-fun m!1267275 () Bool)

(assert (=> start!118092 m!1267275))

(declare-fun m!1267277 () Bool)

(assert (=> start!118092 m!1267277))

(declare-fun m!1267279 () Bool)

(assert (=> b!1382586 m!1267279))

(assert (=> b!1382586 m!1267279))

(declare-fun m!1267281 () Bool)

(assert (=> b!1382586 m!1267281))

(declare-fun m!1267283 () Bool)

(assert (=> b!1382585 m!1267283))

(assert (=> b!1382589 m!1267279))

(declare-fun m!1267285 () Bool)

(assert (=> b!1382584 m!1267285))

(declare-fun m!1267287 () Bool)

(assert (=> b!1382587 m!1267287))

(declare-fun m!1267289 () Bool)

(assert (=> b!1382587 m!1267289))

(declare-fun m!1267291 () Bool)

(assert (=> b!1382587 m!1267291))

(push 1)

(assert (not start!118092))

(assert (not b!1382584))

(assert (not b!1382585))

(assert (not b!1382586))

(assert (not b!1382587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

