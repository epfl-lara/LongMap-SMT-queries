; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25880 () Bool)

(assert start!25880)

(declare-fun res!131848 () Bool)

(declare-fun e!172961 () Bool)

(assert (=> start!25880 (=> (not res!131848) (not e!172961))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25880 (= res!131848 (validMask!0 mask!3868))))

(assert (=> start!25880 e!172961))

(declare-datatypes ((array!12998 0))(
  ( (array!12999 (arr!6150 (Array (_ BitVec 32) (_ BitVec 64))) (size!6502 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12998)

(declare-fun array_inv!4113 (array!12998) Bool)

(assert (=> start!25880 (array_inv!4113 a!3325)))

(assert (=> start!25880 true))

(declare-fun b!267552 () Bool)

(declare-fun res!131850 () Bool)

(assert (=> b!267552 (=> (not res!131850) (not e!172961))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267552 (= res!131850 (and (= (size!6502 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6502 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6502 a!3325))))))

(declare-fun b!267553 () Bool)

(declare-fun res!131849 () Bool)

(assert (=> b!267553 (=> (not res!131849) (not e!172961))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267553 (= res!131849 (validKeyInArray!0 k0!2581))))

(declare-fun b!267554 () Bool)

(assert (=> b!267554 (= e!172961 false)))

(declare-fun lt!134707 () Bool)

(declare-datatypes ((List!3958 0))(
  ( (Nil!3955) (Cons!3954 (h!4621 (_ BitVec 64)) (t!9040 List!3958)) )
))
(declare-fun arrayNoDuplicates!0 (array!12998 (_ BitVec 32) List!3958) Bool)

(assert (=> b!267554 (= lt!134707 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3955))))

(assert (= (and start!25880 res!131848) b!267552))

(assert (= (and b!267552 res!131850) b!267553))

(assert (= (and b!267553 res!131849) b!267554))

(declare-fun m!283901 () Bool)

(assert (=> start!25880 m!283901))

(declare-fun m!283903 () Bool)

(assert (=> start!25880 m!283903))

(declare-fun m!283905 () Bool)

(assert (=> b!267553 m!283905))

(declare-fun m!283907 () Bool)

(assert (=> b!267554 m!283907))

(check-sat (not b!267553) (not b!267554) (not start!25880))
