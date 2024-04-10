; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25940 () Bool)

(assert start!25940)

(declare-fun res!132075 () Bool)

(declare-fun e!173105 () Bool)

(assert (=> start!25940 (=> (not res!132075) (not e!173105))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25940 (= res!132075 (validMask!0 mask!3868))))

(assert (=> start!25940 e!173105))

(declare-datatypes ((array!13037 0))(
  ( (array!13038 (arr!6168 (Array (_ BitVec 32) (_ BitVec 64))) (size!6520 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13037)

(declare-fun array_inv!4131 (array!13037) Bool)

(assert (=> start!25940 (array_inv!4131 a!3325)))

(assert (=> start!25940 true))

(declare-fun b!267795 () Bool)

(declare-fun res!132074 () Bool)

(assert (=> b!267795 (=> (not res!132074) (not e!173105))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267795 (= res!132074 (and (= (size!6520 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6520 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6520 a!3325))))))

(declare-fun b!267796 () Bool)

(declare-fun res!132073 () Bool)

(assert (=> b!267796 (=> (not res!132073) (not e!173105))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267796 (= res!132073 (validKeyInArray!0 k0!2581))))

(declare-fun b!267797 () Bool)

(assert (=> b!267797 (= e!173105 false)))

(declare-fun lt!134734 () Bool)

(declare-datatypes ((List!3976 0))(
  ( (Nil!3973) (Cons!3972 (h!4639 (_ BitVec 64)) (t!9058 List!3976)) )
))
(declare-fun arrayNoDuplicates!0 (array!13037 (_ BitVec 32) List!3976) Bool)

(assert (=> b!267797 (= lt!134734 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3973))))

(assert (= (and start!25940 res!132075) b!267795))

(assert (= (and b!267795 res!132074) b!267796))

(assert (= (and b!267796 res!132073) b!267797))

(declare-fun m!284075 () Bool)

(assert (=> start!25940 m!284075))

(declare-fun m!284077 () Bool)

(assert (=> start!25940 m!284077))

(declare-fun m!284079 () Bool)

(assert (=> b!267796 m!284079))

(declare-fun m!284081 () Bool)

(assert (=> b!267797 m!284081))

(check-sat (not start!25940) (not b!267796) (not b!267797))
