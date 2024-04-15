; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25652 () Bool)

(assert start!25652)

(declare-fun b!265839 () Bool)

(declare-fun res!130188 () Bool)

(declare-fun e!172095 () Bool)

(assert (=> b!265839 (=> (not res!130188) (not e!172095))))

(declare-datatypes ((array!12819 0))(
  ( (array!12820 (arr!6063 (Array (_ BitVec 32) (_ BitVec 64))) (size!6416 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12819)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265839 (= res!130188 (and (= (size!6416 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6416 a!3436))))))

(declare-fun b!265840 () Bool)

(declare-fun res!130190 () Bool)

(declare-fun e!172093 () Bool)

(assert (=> b!265840 (=> (not res!130190) (not e!172093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12819 (_ BitVec 32)) Bool)

(assert (=> b!265840 (= res!130190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130192 () Bool)

(assert (=> start!25652 (=> (not res!130192) (not e!172095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25652 (= res!130192 (validMask!0 mask!4002))))

(assert (=> start!25652 e!172095))

(assert (=> start!25652 true))

(declare-fun array_inv!4035 (array!12819) Bool)

(assert (=> start!25652 (array_inv!4035 a!3436)))

(declare-fun b!265841 () Bool)

(assert (=> b!265841 (= e!172095 e!172093)))

(declare-fun res!130187 () Bool)

(assert (=> b!265841 (=> (not res!130187) (not e!172093))))

(declare-datatypes ((SeekEntryResult!1253 0))(
  ( (MissingZero!1253 (index!7182 (_ BitVec 32))) (Found!1253 (index!7183 (_ BitVec 32))) (Intermediate!1253 (undefined!2065 Bool) (index!7184 (_ BitVec 32)) (x!25513 (_ BitVec 32))) (Undefined!1253) (MissingVacant!1253 (index!7185 (_ BitVec 32))) )
))
(declare-fun lt!134109 () SeekEntryResult!1253)

(assert (=> b!265841 (= res!130187 (or (= lt!134109 (MissingZero!1253 i!1355)) (= lt!134109 (MissingVacant!1253 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12819 (_ BitVec 32)) SeekEntryResult!1253)

(assert (=> b!265841 (= lt!134109 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265842 () Bool)

(declare-fun res!130189 () Bool)

(assert (=> b!265842 (=> (not res!130189) (not e!172095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265842 (= res!130189 (validKeyInArray!0 k0!2698))))

(declare-fun b!265843 () Bool)

(declare-fun res!130191 () Bool)

(assert (=> b!265843 (=> (not res!130191) (not e!172095))))

(declare-fun arrayContainsKey!0 (array!12819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265843 (= res!130191 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265844 () Bool)

(assert (=> b!265844 (= e!172093 false)))

(declare-fun lt!134108 () Bool)

(declare-datatypes ((List!3850 0))(
  ( (Nil!3847) (Cons!3846 (h!4513 (_ BitVec 64)) (t!8923 List!3850)) )
))
(declare-fun arrayNoDuplicates!0 (array!12819 (_ BitVec 32) List!3850) Bool)

(assert (=> b!265844 (= lt!134108 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3847))))

(assert (= (and start!25652 res!130192) b!265839))

(assert (= (and b!265839 res!130188) b!265842))

(assert (= (and b!265842 res!130189) b!265843))

(assert (= (and b!265843 res!130191) b!265841))

(assert (= (and b!265841 res!130187) b!265840))

(assert (= (and b!265840 res!130190) b!265844))

(declare-fun m!282077 () Bool)

(assert (=> b!265842 m!282077))

(declare-fun m!282079 () Bool)

(assert (=> start!25652 m!282079))

(declare-fun m!282081 () Bool)

(assert (=> start!25652 m!282081))

(declare-fun m!282083 () Bool)

(assert (=> b!265841 m!282083))

(declare-fun m!282085 () Bool)

(assert (=> b!265843 m!282085))

(declare-fun m!282087 () Bool)

(assert (=> b!265844 m!282087))

(declare-fun m!282089 () Bool)

(assert (=> b!265840 m!282089))

(check-sat (not b!265841) (not b!265843) (not b!265842) (not b!265840) (not b!265844) (not start!25652))
(check-sat)
