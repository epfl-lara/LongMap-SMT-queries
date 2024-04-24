; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25748 () Bool)

(assert start!25748)

(declare-fun b!266978 () Bool)

(declare-fun e!172651 () Bool)

(declare-fun e!172650 () Bool)

(assert (=> b!266978 (= e!172651 e!172650)))

(declare-fun res!131250 () Bool)

(assert (=> b!266978 (=> (not res!131250) (not e!172650))))

(declare-datatypes ((SeekEntryResult!1271 0))(
  ( (MissingZero!1271 (index!7254 (_ BitVec 32))) (Found!1271 (index!7255 (_ BitVec 32))) (Intermediate!1271 (undefined!2083 Bool) (index!7256 (_ BitVec 32)) (x!25660 (_ BitVec 32))) (Undefined!1271) (MissingVacant!1271 (index!7257 (_ BitVec 32))) )
))
(declare-fun lt!134627 () SeekEntryResult!1271)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266978 (= res!131250 (or (= lt!134627 (MissingZero!1271 i!1355)) (= lt!134627 (MissingVacant!1271 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12922 0))(
  ( (array!12923 (arr!6115 (Array (_ BitVec 32) (_ BitVec 64))) (size!6467 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12922)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12922 (_ BitVec 32)) SeekEntryResult!1271)

(assert (=> b!266978 (= lt!134627 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!131251 () Bool)

(assert (=> start!25748 (=> (not res!131251) (not e!172651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25748 (= res!131251 (validMask!0 mask!4002))))

(assert (=> start!25748 e!172651))

(assert (=> start!25748 true))

(declare-fun array_inv!4065 (array!12922) Bool)

(assert (=> start!25748 (array_inv!4065 a!3436)))

(declare-fun b!266979 () Bool)

(declare-fun res!131252 () Bool)

(assert (=> b!266979 (=> (not res!131252) (not e!172651))))

(assert (=> b!266979 (= res!131252 (and (= (size!6467 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6467 a!3436))))))

(declare-fun b!266980 () Bool)

(assert (=> b!266980 (= e!172650 false)))

(declare-fun lt!134628 () Bool)

(declare-datatypes ((List!3842 0))(
  ( (Nil!3839) (Cons!3838 (h!4505 (_ BitVec 64)) (t!8916 List!3842)) )
))
(declare-fun arrayNoDuplicates!0 (array!12922 (_ BitVec 32) List!3842) Bool)

(assert (=> b!266980 (= lt!134628 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3839))))

(declare-fun b!266981 () Bool)

(declare-fun res!131253 () Bool)

(assert (=> b!266981 (=> (not res!131253) (not e!172651))))

(declare-fun arrayContainsKey!0 (array!12922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266981 (= res!131253 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266982 () Bool)

(declare-fun res!131249 () Bool)

(assert (=> b!266982 (=> (not res!131249) (not e!172651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266982 (= res!131249 (validKeyInArray!0 k0!2698))))

(declare-fun b!266983 () Bool)

(declare-fun res!131248 () Bool)

(assert (=> b!266983 (=> (not res!131248) (not e!172650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12922 (_ BitVec 32)) Bool)

(assert (=> b!266983 (= res!131248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25748 res!131251) b!266979))

(assert (= (and b!266979 res!131252) b!266982))

(assert (= (and b!266982 res!131249) b!266981))

(assert (= (and b!266981 res!131253) b!266978))

(assert (= (and b!266978 res!131250) b!266983))

(assert (= (and b!266983 res!131248) b!266980))

(declare-fun m!283619 () Bool)

(assert (=> b!266980 m!283619))

(declare-fun m!283621 () Bool)

(assert (=> b!266982 m!283621))

(declare-fun m!283623 () Bool)

(assert (=> b!266978 m!283623))

(declare-fun m!283625 () Bool)

(assert (=> b!266981 m!283625))

(declare-fun m!283627 () Bool)

(assert (=> start!25748 m!283627))

(declare-fun m!283629 () Bool)

(assert (=> start!25748 m!283629))

(declare-fun m!283631 () Bool)

(assert (=> b!266983 m!283631))

(check-sat (not b!266981) (not b!266983) (not b!266978) (not b!266980) (not b!266982) (not start!25748))
(check-sat)
