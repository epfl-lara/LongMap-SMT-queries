; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25754 () Bool)

(assert start!25754)

(declare-fun b!266838 () Bool)

(declare-fun res!131189 () Bool)

(declare-fun e!172554 () Bool)

(assert (=> b!266838 (=> (not res!131189) (not e!172554))))

(declare-datatypes ((array!12921 0))(
  ( (array!12922 (arr!6114 (Array (_ BitVec 32) (_ BitVec 64))) (size!6467 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12921)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266838 (= res!131189 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266839 () Bool)

(declare-fun e!172552 () Bool)

(assert (=> b!266839 (= e!172552 false)))

(declare-fun lt!134405 () Bool)

(declare-datatypes ((List!3901 0))(
  ( (Nil!3898) (Cons!3897 (h!4564 (_ BitVec 64)) (t!8974 List!3901)) )
))
(declare-fun arrayNoDuplicates!0 (array!12921 (_ BitVec 32) List!3901) Bool)

(assert (=> b!266839 (= lt!134405 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3898))))

(declare-fun b!266840 () Bool)

(declare-fun res!131190 () Bool)

(assert (=> b!266840 (=> (not res!131190) (not e!172552))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12921 (_ BitVec 32)) Bool)

(assert (=> b!266840 (= res!131190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266841 () Bool)

(assert (=> b!266841 (= e!172554 e!172552)))

(declare-fun res!131187 () Bool)

(assert (=> b!266841 (=> (not res!131187) (not e!172552))))

(declare-datatypes ((SeekEntryResult!1304 0))(
  ( (MissingZero!1304 (index!7386 (_ BitVec 32))) (Found!1304 (index!7387 (_ BitVec 32))) (Intermediate!1304 (undefined!2116 Bool) (index!7388 (_ BitVec 32)) (x!25700 (_ BitVec 32))) (Undefined!1304) (MissingVacant!1304 (index!7389 (_ BitVec 32))) )
))
(declare-fun lt!134406 () SeekEntryResult!1304)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266841 (= res!131187 (or (= lt!134406 (MissingZero!1304 i!1355)) (= lt!134406 (MissingVacant!1304 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12921 (_ BitVec 32)) SeekEntryResult!1304)

(assert (=> b!266841 (= lt!134406 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266842 () Bool)

(declare-fun res!131188 () Bool)

(assert (=> b!266842 (=> (not res!131188) (not e!172554))))

(assert (=> b!266842 (= res!131188 (and (= (size!6467 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6467 a!3436))))))

(declare-fun b!266843 () Bool)

(declare-fun res!131186 () Bool)

(assert (=> b!266843 (=> (not res!131186) (not e!172554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266843 (= res!131186 (validKeyInArray!0 k0!2698))))

(declare-fun res!131191 () Bool)

(assert (=> start!25754 (=> (not res!131191) (not e!172554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25754 (= res!131191 (validMask!0 mask!4002))))

(assert (=> start!25754 e!172554))

(assert (=> start!25754 true))

(declare-fun array_inv!4086 (array!12921) Bool)

(assert (=> start!25754 (array_inv!4086 a!3436)))

(assert (= (and start!25754 res!131191) b!266842))

(assert (= (and b!266842 res!131188) b!266843))

(assert (= (and b!266843 res!131186) b!266838))

(assert (= (and b!266838 res!131189) b!266841))

(assert (= (and b!266841 res!131187) b!266840))

(assert (= (and b!266840 res!131190) b!266839))

(declare-fun m!282863 () Bool)

(assert (=> b!266840 m!282863))

(declare-fun m!282865 () Bool)

(assert (=> b!266838 m!282865))

(declare-fun m!282867 () Bool)

(assert (=> start!25754 m!282867))

(declare-fun m!282869 () Bool)

(assert (=> start!25754 m!282869))

(declare-fun m!282871 () Bool)

(assert (=> b!266841 m!282871))

(declare-fun m!282873 () Bool)

(assert (=> b!266843 m!282873))

(declare-fun m!282875 () Bool)

(assert (=> b!266839 m!282875))

(check-sat (not b!266838) (not b!266841) (not start!25754) (not b!266839) (not b!266843) (not b!266840))
(check-sat)
