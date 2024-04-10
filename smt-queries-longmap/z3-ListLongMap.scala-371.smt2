; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7080 () Bool)

(assert start!7080)

(declare-fun res!26667 () Bool)

(declare-fun e!28936 () Bool)

(assert (=> start!7080 (=> (not res!26667) (not e!28936))))

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(declare-datatypes ((array!3057 0))(
  ( (array!3058 (arr!1468 (Array (_ BitVec 32) (_ BitVec 64))) (size!1690 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3057)

(assert (=> start!7080 (= res!26667 (and (bvslt (size!1690 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1690 a!4401)) (= (select (arr!1468 a!4401) i!1488) k0!2989)))))

(assert (=> start!7080 e!28936))

(declare-fun array_inv!880 (array!3057) Bool)

(assert (=> start!7080 (array_inv!880 a!4401)))

(assert (=> start!7080 true))

(declare-fun b!45467 () Bool)

(declare-fun res!26666 () Bool)

(assert (=> b!45467 (=> (not res!26666) (not e!28936))))

(declare-fun arrayContainsKey!0 (array!3057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45467 (= res!26666 (arrayContainsKey!0 a!4401 k0!2989 i!1488))))

(declare-fun b!45468 () Bool)

(assert (=> b!45468 (= e!28936 (not true))))

(assert (=> b!45468 (arrayContainsKey!0 a!4401 k0!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1293 0))(
  ( (Unit!1294) )
))
(declare-fun lt!20158 () Unit!1293)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3057 (_ BitVec 64) (_ BitVec 32)) Unit!1293)

(assert (=> b!45468 (= lt!20158 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k0!2989 i!1488))))

(assert (= (and start!7080 res!26667) b!45467))

(assert (= (and b!45467 res!26666) b!45468))

(declare-fun m!40021 () Bool)

(assert (=> start!7080 m!40021))

(declare-fun m!40023 () Bool)

(assert (=> start!7080 m!40023))

(declare-fun m!40025 () Bool)

(assert (=> b!45467 m!40025))

(declare-fun m!40027 () Bool)

(assert (=> b!45468 m!40027))

(declare-fun m!40029 () Bool)

(assert (=> b!45468 m!40029))

(check-sat (not b!45467) (not b!45468) (not start!7080))
(check-sat)
