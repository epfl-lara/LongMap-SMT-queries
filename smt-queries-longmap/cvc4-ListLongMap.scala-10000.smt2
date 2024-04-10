; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118040 () Bool)

(assert start!118040)

(declare-fun res!923896 () Bool)

(declare-fun e!783505 () Bool)

(assert (=> start!118040 (=> (not res!923896) (not e!783505))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118040 (= res!923896 (validMask!0 mask!3034))))

(assert (=> start!118040 e!783505))

(assert (=> start!118040 true))

(declare-datatypes ((array!94404 0))(
  ( (array!94405 (arr!45583 (Array (_ BitVec 32) (_ BitVec 64))) (size!46133 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94404)

(declare-fun array_inv!34611 (array!94404) Bool)

(assert (=> start!118040 (array_inv!34611 a!2971)))

(declare-fun b!1382307 () Bool)

(assert (=> b!1382307 (= e!783505 false)))

(declare-fun lt!608394 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94404 (_ BitVec 32)) Bool)

(assert (=> b!1382307 (= lt!608394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382306 () Bool)

(declare-fun res!923898 () Bool)

(assert (=> b!1382306 (=> (not res!923898) (not e!783505))))

(declare-datatypes ((List!32117 0))(
  ( (Nil!32114) (Cons!32113 (h!33322 (_ BitVec 64)) (t!46811 List!32117)) )
))
(declare-fun arrayNoDuplicates!0 (array!94404 (_ BitVec 32) List!32117) Bool)

(assert (=> b!1382306 (= res!923898 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32114))))

(declare-fun b!1382305 () Bool)

(declare-fun res!923899 () Bool)

(assert (=> b!1382305 (=> (not res!923899) (not e!783505))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382305 (= res!923899 (validKeyInArray!0 (select (arr!45583 a!2971) i!1094)))))

(declare-fun b!1382304 () Bool)

(declare-fun res!923897 () Bool)

(assert (=> b!1382304 (=> (not res!923897) (not e!783505))))

(assert (=> b!1382304 (= res!923897 (and (= (size!46133 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46133 a!2971))))))

(assert (= (and start!118040 res!923896) b!1382304))

(assert (= (and b!1382304 res!923897) b!1382305))

(assert (= (and b!1382305 res!923899) b!1382306))

(assert (= (and b!1382306 res!923898) b!1382307))

(declare-fun m!1267443 () Bool)

(assert (=> start!118040 m!1267443))

(declare-fun m!1267445 () Bool)

(assert (=> start!118040 m!1267445))

(declare-fun m!1267447 () Bool)

(assert (=> b!1382307 m!1267447))

(declare-fun m!1267449 () Bool)

(assert (=> b!1382306 m!1267449))

(declare-fun m!1267451 () Bool)

(assert (=> b!1382305 m!1267451))

(assert (=> b!1382305 m!1267451))

(declare-fun m!1267453 () Bool)

(assert (=> b!1382305 m!1267453))

(push 1)

(assert (not start!118040))

(assert (not b!1382306))

(assert (not b!1382307))

(assert (not b!1382305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

