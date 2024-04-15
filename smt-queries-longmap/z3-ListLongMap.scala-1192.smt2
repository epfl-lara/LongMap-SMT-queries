; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25622 () Bool)

(assert start!25622)

(declare-fun b!265569 () Bool)

(declare-fun res!129918 () Bool)

(declare-fun e!171959 () Bool)

(assert (=> b!265569 (=> (not res!129918) (not e!171959))))

(declare-datatypes ((array!12789 0))(
  ( (array!12790 (arr!6048 (Array (_ BitVec 32) (_ BitVec 64))) (size!6401 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12789)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265569 (= res!129918 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265570 () Bool)

(declare-fun e!171958 () Bool)

(assert (=> b!265570 (= e!171959 e!171958)))

(declare-fun res!129922 () Bool)

(assert (=> b!265570 (=> (not res!129922) (not e!171958))))

(declare-datatypes ((SeekEntryResult!1238 0))(
  ( (MissingZero!1238 (index!7122 (_ BitVec 32))) (Found!1238 (index!7123 (_ BitVec 32))) (Intermediate!1238 (undefined!2050 Bool) (index!7124 (_ BitVec 32)) (x!25458 (_ BitVec 32))) (Undefined!1238) (MissingVacant!1238 (index!7125 (_ BitVec 32))) )
))
(declare-fun lt!134018 () SeekEntryResult!1238)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265570 (= res!129922 (or (= lt!134018 (MissingZero!1238 i!1355)) (= lt!134018 (MissingVacant!1238 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12789 (_ BitVec 32)) SeekEntryResult!1238)

(assert (=> b!265570 (= lt!134018 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265571 () Bool)

(declare-fun res!129921 () Bool)

(assert (=> b!265571 (=> (not res!129921) (not e!171959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265571 (= res!129921 (validKeyInArray!0 k0!2698))))

(declare-fun b!265572 () Bool)

(declare-fun res!129917 () Bool)

(assert (=> b!265572 (=> (not res!129917) (not e!171959))))

(assert (=> b!265572 (= res!129917 (and (= (size!6401 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6401 a!3436))))))

(declare-fun b!265573 () Bool)

(assert (=> b!265573 (= e!171958 false)))

(declare-fun lt!134019 () Bool)

(declare-datatypes ((List!3835 0))(
  ( (Nil!3832) (Cons!3831 (h!4498 (_ BitVec 64)) (t!8908 List!3835)) )
))
(declare-fun arrayNoDuplicates!0 (array!12789 (_ BitVec 32) List!3835) Bool)

(assert (=> b!265573 (= lt!134019 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3832))))

(declare-fun res!129919 () Bool)

(assert (=> start!25622 (=> (not res!129919) (not e!171959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25622 (= res!129919 (validMask!0 mask!4002))))

(assert (=> start!25622 e!171959))

(assert (=> start!25622 true))

(declare-fun array_inv!4020 (array!12789) Bool)

(assert (=> start!25622 (array_inv!4020 a!3436)))

(declare-fun b!265574 () Bool)

(declare-fun res!129920 () Bool)

(assert (=> b!265574 (=> (not res!129920) (not e!171958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12789 (_ BitVec 32)) Bool)

(assert (=> b!265574 (= res!129920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25622 res!129919) b!265572))

(assert (= (and b!265572 res!129917) b!265571))

(assert (= (and b!265571 res!129921) b!265569))

(assert (= (and b!265569 res!129918) b!265570))

(assert (= (and b!265570 res!129922) b!265574))

(assert (= (and b!265574 res!129920) b!265573))

(declare-fun m!281867 () Bool)

(assert (=> b!265570 m!281867))

(declare-fun m!281869 () Bool)

(assert (=> b!265573 m!281869))

(declare-fun m!281871 () Bool)

(assert (=> start!25622 m!281871))

(declare-fun m!281873 () Bool)

(assert (=> start!25622 m!281873))

(declare-fun m!281875 () Bool)

(assert (=> b!265569 m!281875))

(declare-fun m!281877 () Bool)

(assert (=> b!265574 m!281877))

(declare-fun m!281879 () Bool)

(assert (=> b!265571 m!281879))

(check-sat (not b!265571) (not b!265573) (not b!265570) (not b!265574) (not start!25622) (not b!265569))
(check-sat)
