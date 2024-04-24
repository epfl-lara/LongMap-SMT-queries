; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25742 () Bool)

(assert start!25742)

(declare-fun b!266924 () Bool)

(declare-fun res!131195 () Bool)

(declare-fun e!172625 () Bool)

(assert (=> b!266924 (=> (not res!131195) (not e!172625))))

(declare-datatypes ((array!12916 0))(
  ( (array!12917 (arr!6112 (Array (_ BitVec 32) (_ BitVec 64))) (size!6464 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12916)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266924 (= res!131195 (and (= (size!6464 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6464 a!3436))))))

(declare-fun res!131198 () Bool)

(assert (=> start!25742 (=> (not res!131198) (not e!172625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25742 (= res!131198 (validMask!0 mask!4002))))

(assert (=> start!25742 e!172625))

(assert (=> start!25742 true))

(declare-fun array_inv!4062 (array!12916) Bool)

(assert (=> start!25742 (array_inv!4062 a!3436)))

(declare-fun b!266925 () Bool)

(declare-fun e!172624 () Bool)

(assert (=> b!266925 (= e!172625 e!172624)))

(declare-fun res!131199 () Bool)

(assert (=> b!266925 (=> (not res!131199) (not e!172624))))

(declare-datatypes ((SeekEntryResult!1268 0))(
  ( (MissingZero!1268 (index!7242 (_ BitVec 32))) (Found!1268 (index!7243 (_ BitVec 32))) (Intermediate!1268 (undefined!2080 Bool) (index!7244 (_ BitVec 32)) (x!25649 (_ BitVec 32))) (Undefined!1268) (MissingVacant!1268 (index!7245 (_ BitVec 32))) )
))
(declare-fun lt!134609 () SeekEntryResult!1268)

(assert (=> b!266925 (= res!131199 (or (= lt!134609 (MissingZero!1268 i!1355)) (= lt!134609 (MissingVacant!1268 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12916 (_ BitVec 32)) SeekEntryResult!1268)

(assert (=> b!266925 (= lt!134609 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266926 () Bool)

(declare-fun res!131194 () Bool)

(assert (=> b!266926 (=> (not res!131194) (not e!172625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266926 (= res!131194 (validKeyInArray!0 k0!2698))))

(declare-fun b!266927 () Bool)

(declare-fun res!131197 () Bool)

(assert (=> b!266927 (=> (not res!131197) (not e!172624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12916 (_ BitVec 32)) Bool)

(assert (=> b!266927 (= res!131197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266928 () Bool)

(declare-fun res!131196 () Bool)

(assert (=> b!266928 (=> (not res!131196) (not e!172625))))

(declare-fun arrayContainsKey!0 (array!12916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266928 (= res!131196 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266929 () Bool)

(assert (=> b!266929 (= e!172624 false)))

(declare-fun lt!134610 () Bool)

(declare-datatypes ((List!3839 0))(
  ( (Nil!3836) (Cons!3835 (h!4502 (_ BitVec 64)) (t!8913 List!3839)) )
))
(declare-fun arrayNoDuplicates!0 (array!12916 (_ BitVec 32) List!3839) Bool)

(assert (=> b!266929 (= lt!134610 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3836))))

(assert (= (and start!25742 res!131198) b!266924))

(assert (= (and b!266924 res!131195) b!266926))

(assert (= (and b!266926 res!131194) b!266928))

(assert (= (and b!266928 res!131196) b!266925))

(assert (= (and b!266925 res!131199) b!266927))

(assert (= (and b!266927 res!131197) b!266929))

(declare-fun m!283577 () Bool)

(assert (=> b!266928 m!283577))

(declare-fun m!283579 () Bool)

(assert (=> b!266929 m!283579))

(declare-fun m!283581 () Bool)

(assert (=> b!266927 m!283581))

(declare-fun m!283583 () Bool)

(assert (=> b!266926 m!283583))

(declare-fun m!283585 () Bool)

(assert (=> start!25742 m!283585))

(declare-fun m!283587 () Bool)

(assert (=> start!25742 m!283587))

(declare-fun m!283589 () Bool)

(assert (=> b!266925 m!283589))

(check-sat (not b!266926) (not b!266927) (not start!25742) (not b!266925) (not b!266929) (not b!266928))
(check-sat)
