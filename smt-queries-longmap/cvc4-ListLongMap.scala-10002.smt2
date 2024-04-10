; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118052 () Bool)

(assert start!118052)

(declare-fun b!1382379 () Bool)

(declare-fun e!783541 () Bool)

(assert (=> b!1382379 (= e!783541 false)))

(declare-fun lt!608412 () Bool)

(declare-datatypes ((array!94416 0))(
  ( (array!94417 (arr!45589 (Array (_ BitVec 32) (_ BitVec 64))) (size!46139 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94416)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94416 (_ BitVec 32)) Bool)

(assert (=> b!1382379 (= lt!608412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382376 () Bool)

(declare-fun res!923969 () Bool)

(assert (=> b!1382376 (=> (not res!923969) (not e!783541))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382376 (= res!923969 (and (= (size!46139 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46139 a!2971))))))

(declare-fun b!1382378 () Bool)

(declare-fun res!923970 () Bool)

(assert (=> b!1382378 (=> (not res!923970) (not e!783541))))

(declare-datatypes ((List!32123 0))(
  ( (Nil!32120) (Cons!32119 (h!33328 (_ BitVec 64)) (t!46817 List!32123)) )
))
(declare-fun arrayNoDuplicates!0 (array!94416 (_ BitVec 32) List!32123) Bool)

(assert (=> b!1382378 (= res!923970 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32120))))

(declare-fun b!1382377 () Bool)

(declare-fun res!923971 () Bool)

(assert (=> b!1382377 (=> (not res!923971) (not e!783541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382377 (= res!923971 (validKeyInArray!0 (select (arr!45589 a!2971) i!1094)))))

(declare-fun res!923968 () Bool)

(assert (=> start!118052 (=> (not res!923968) (not e!783541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118052 (= res!923968 (validMask!0 mask!3034))))

(assert (=> start!118052 e!783541))

(assert (=> start!118052 true))

(declare-fun array_inv!34617 (array!94416) Bool)

(assert (=> start!118052 (array_inv!34617 a!2971)))

(assert (= (and start!118052 res!923968) b!1382376))

(assert (= (and b!1382376 res!923969) b!1382377))

(assert (= (and b!1382377 res!923971) b!1382378))

(assert (= (and b!1382378 res!923970) b!1382379))

(declare-fun m!1267515 () Bool)

(assert (=> b!1382379 m!1267515))

(declare-fun m!1267517 () Bool)

(assert (=> b!1382378 m!1267517))

(declare-fun m!1267519 () Bool)

(assert (=> b!1382377 m!1267519))

(assert (=> b!1382377 m!1267519))

(declare-fun m!1267521 () Bool)

(assert (=> b!1382377 m!1267521))

(declare-fun m!1267523 () Bool)

(assert (=> start!118052 m!1267523))

(declare-fun m!1267525 () Bool)

(assert (=> start!118052 m!1267525))

(push 1)

(assert (not b!1382377))

(assert (not start!118052))

(assert (not b!1382378))

(assert (not b!1382379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

