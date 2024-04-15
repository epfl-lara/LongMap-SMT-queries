; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25886 () Bool)

(assert start!25886)

(declare-fun b!267425 () Bool)

(declare-fun res!131775 () Bool)

(declare-fun e!172871 () Bool)

(assert (=> b!267425 (=> (not res!131775) (not e!172871))))

(declare-datatypes ((array!12993 0))(
  ( (array!12994 (arr!6147 (Array (_ BitVec 32) (_ BitVec 64))) (size!6500 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12993)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267425 (= res!131775 (and (= (size!6500 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6500 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6500 a!3325))))))

(declare-fun res!131774 () Bool)

(assert (=> start!25886 (=> (not res!131774) (not e!172871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25886 (= res!131774 (validMask!0 mask!3868))))

(assert (=> start!25886 e!172871))

(declare-fun array_inv!4119 (array!12993) Bool)

(assert (=> start!25886 (array_inv!4119 a!3325)))

(assert (=> start!25886 true))

(declare-fun b!267428 () Bool)

(assert (=> b!267428 (= e!172871 (bvsge #b00000000000000000000000000000000 (size!6500 a!3325)))))

(declare-fun b!267426 () Bool)

(declare-fun res!131773 () Bool)

(assert (=> b!267426 (=> (not res!131773) (not e!172871))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267426 (= res!131773 (validKeyInArray!0 k0!2581))))

(declare-fun b!267427 () Bool)

(declare-fun res!131776 () Bool)

(assert (=> b!267427 (=> (not res!131776) (not e!172871))))

(declare-datatypes ((List!3928 0))(
  ( (Nil!3925) (Cons!3924 (h!4591 (_ BitVec 64)) (t!9001 List!3928)) )
))
(declare-fun arrayNoDuplicates!0 (array!12993 (_ BitVec 32) List!3928) Bool)

(assert (=> b!267427 (= res!131776 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3925))))

(assert (= (and start!25886 res!131774) b!267425))

(assert (= (and b!267425 res!131775) b!267426))

(assert (= (and b!267426 res!131773) b!267427))

(assert (= (and b!267427 res!131776) b!267428))

(declare-fun m!283325 () Bool)

(assert (=> start!25886 m!283325))

(declare-fun m!283327 () Bool)

(assert (=> start!25886 m!283327))

(declare-fun m!283329 () Bool)

(assert (=> b!267426 m!283329))

(declare-fun m!283331 () Bool)

(assert (=> b!267427 m!283331))

(check-sat (not b!267427) (not b!267426) (not start!25886))
(check-sat)
