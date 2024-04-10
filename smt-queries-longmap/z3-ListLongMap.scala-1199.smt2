; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25662 () Bool)

(assert start!25662)

(declare-fun b!266112 () Bool)

(declare-fun res!130413 () Bool)

(declare-fun e!172258 () Bool)

(assert (=> b!266112 (=> (not res!130413) (not e!172258))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266112 (= res!130413 (validKeyInArray!0 k0!2698))))

(declare-fun b!266113 () Bool)

(declare-fun res!130410 () Bool)

(declare-fun e!172257 () Bool)

(assert (=> b!266113 (=> (not res!130410) (not e!172257))))

(declare-datatypes ((array!12841 0))(
  ( (array!12842 (arr!6075 (Array (_ BitVec 32) (_ BitVec 64))) (size!6427 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12841)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12841 (_ BitVec 32)) Bool)

(assert (=> b!266113 (= res!130410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266114 () Bool)

(declare-fun res!130411 () Bool)

(assert (=> b!266114 (=> (not res!130411) (not e!172258))))

(declare-fun arrayContainsKey!0 (array!12841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266114 (= res!130411 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130412 () Bool)

(assert (=> start!25662 (=> (not res!130412) (not e!172258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25662 (= res!130412 (validMask!0 mask!4002))))

(assert (=> start!25662 e!172258))

(assert (=> start!25662 true))

(declare-fun array_inv!4038 (array!12841) Bool)

(assert (=> start!25662 (array_inv!4038 a!3436)))

(declare-fun b!266115 () Bool)

(assert (=> b!266115 (= e!172258 e!172257)))

(declare-fun res!130408 () Bool)

(assert (=> b!266115 (=> (not res!130408) (not e!172257))))

(declare-datatypes ((SeekEntryResult!1266 0))(
  ( (MissingZero!1266 (index!7234 (_ BitVec 32))) (Found!1266 (index!7235 (_ BitVec 32))) (Intermediate!1266 (undefined!2078 Bool) (index!7236 (_ BitVec 32)) (x!25543 (_ BitVec 32))) (Undefined!1266) (MissingVacant!1266 (index!7237 (_ BitVec 32))) )
))
(declare-fun lt!134331 () SeekEntryResult!1266)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266115 (= res!130408 (or (= lt!134331 (MissingZero!1266 i!1355)) (= lt!134331 (MissingVacant!1266 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12841 (_ BitVec 32)) SeekEntryResult!1266)

(assert (=> b!266115 (= lt!134331 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266116 () Bool)

(assert (=> b!266116 (= e!172257 false)))

(declare-fun lt!134332 () Bool)

(declare-datatypes ((List!3889 0))(
  ( (Nil!3886) (Cons!3885 (h!4552 (_ BitVec 64)) (t!8971 List!3889)) )
))
(declare-fun arrayNoDuplicates!0 (array!12841 (_ BitVec 32) List!3889) Bool)

(assert (=> b!266116 (= lt!134332 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3886))))

(declare-fun b!266117 () Bool)

(declare-fun res!130409 () Bool)

(assert (=> b!266117 (=> (not res!130409) (not e!172258))))

(assert (=> b!266117 (= res!130409 (and (= (size!6427 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6427 a!3436))))))

(assert (= (and start!25662 res!130412) b!266117))

(assert (= (and b!266117 res!130409) b!266112))

(assert (= (and b!266112 res!130413) b!266114))

(assert (= (and b!266114 res!130411) b!266115))

(assert (= (and b!266115 res!130408) b!266113))

(assert (= (and b!266113 res!130410) b!266116))

(declare-fun m!282767 () Bool)

(assert (=> b!266115 m!282767))

(declare-fun m!282769 () Bool)

(assert (=> b!266114 m!282769))

(declare-fun m!282771 () Bool)

(assert (=> b!266112 m!282771))

(declare-fun m!282773 () Bool)

(assert (=> start!25662 m!282773))

(declare-fun m!282775 () Bool)

(assert (=> start!25662 m!282775))

(declare-fun m!282777 () Bool)

(assert (=> b!266113 m!282777))

(declare-fun m!282779 () Bool)

(assert (=> b!266116 m!282779))

(check-sat (not b!266112) (not b!266115) (not b!266116) (not b!266113) (not b!266114) (not start!25662))
