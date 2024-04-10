; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25638 () Bool)

(assert start!25638)

(declare-fun b!265896 () Bool)

(declare-fun res!130195 () Bool)

(declare-fun e!172150 () Bool)

(assert (=> b!265896 (=> (not res!130195) (not e!172150))))

(declare-datatypes ((array!12817 0))(
  ( (array!12818 (arr!6063 (Array (_ BitVec 32) (_ BitVec 64))) (size!6415 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12817)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265896 (= res!130195 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265898 () Bool)

(declare-fun res!130193 () Bool)

(assert (=> b!265898 (=> (not res!130193) (not e!172150))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265898 (= res!130193 (and (= (size!6415 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6415 a!3436))))))

(declare-fun b!265899 () Bool)

(declare-fun e!172151 () Bool)

(assert (=> b!265899 (= e!172150 e!172151)))

(declare-fun res!130194 () Bool)

(assert (=> b!265899 (=> (not res!130194) (not e!172151))))

(declare-datatypes ((SeekEntryResult!1254 0))(
  ( (MissingZero!1254 (index!7186 (_ BitVec 32))) (Found!1254 (index!7187 (_ BitVec 32))) (Intermediate!1254 (undefined!2066 Bool) (index!7188 (_ BitVec 32)) (x!25499 (_ BitVec 32))) (Undefined!1254) (MissingVacant!1254 (index!7189 (_ BitVec 32))) )
))
(declare-fun lt!134260 () SeekEntryResult!1254)

(assert (=> b!265899 (= res!130194 (or (= lt!134260 (MissingZero!1254 i!1355)) (= lt!134260 (MissingVacant!1254 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12817 (_ BitVec 32)) SeekEntryResult!1254)

(assert (=> b!265899 (= lt!134260 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265900 () Bool)

(declare-fun res!130196 () Bool)

(assert (=> b!265900 (=> (not res!130196) (not e!172150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265900 (= res!130196 (validKeyInArray!0 k0!2698))))

(declare-fun b!265901 () Bool)

(declare-fun res!130197 () Bool)

(assert (=> b!265901 (=> (not res!130197) (not e!172151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12817 (_ BitVec 32)) Bool)

(assert (=> b!265901 (= res!130197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265897 () Bool)

(assert (=> b!265897 (= e!172151 false)))

(declare-fun lt!134259 () Bool)

(declare-datatypes ((List!3877 0))(
  ( (Nil!3874) (Cons!3873 (h!4540 (_ BitVec 64)) (t!8959 List!3877)) )
))
(declare-fun arrayNoDuplicates!0 (array!12817 (_ BitVec 32) List!3877) Bool)

(assert (=> b!265897 (= lt!134259 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3874))))

(declare-fun res!130192 () Bool)

(assert (=> start!25638 (=> (not res!130192) (not e!172150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25638 (= res!130192 (validMask!0 mask!4002))))

(assert (=> start!25638 e!172150))

(assert (=> start!25638 true))

(declare-fun array_inv!4026 (array!12817) Bool)

(assert (=> start!25638 (array_inv!4026 a!3436)))

(assert (= (and start!25638 res!130192) b!265898))

(assert (= (and b!265898 res!130193) b!265900))

(assert (= (and b!265900 res!130196) b!265896))

(assert (= (and b!265896 res!130195) b!265899))

(assert (= (and b!265899 res!130194) b!265901))

(assert (= (and b!265901 res!130197) b!265897))

(declare-fun m!282599 () Bool)

(assert (=> b!265899 m!282599))

(declare-fun m!282601 () Bool)

(assert (=> b!265897 m!282601))

(declare-fun m!282603 () Bool)

(assert (=> start!25638 m!282603))

(declare-fun m!282605 () Bool)

(assert (=> start!25638 m!282605))

(declare-fun m!282607 () Bool)

(assert (=> b!265896 m!282607))

(declare-fun m!282609 () Bool)

(assert (=> b!265901 m!282609))

(declare-fun m!282611 () Bool)

(assert (=> b!265900 m!282611))

(check-sat (not b!265901) (not b!265896) (not b!265900) (not b!265897) (not start!25638) (not b!265899))
(check-sat)
