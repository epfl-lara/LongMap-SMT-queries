; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25460 () Bool)

(assert start!25460)

(declare-fun b!265019 () Bool)

(declare-fun e!171638 () Bool)

(declare-fun e!171636 () Bool)

(assert (=> b!265019 (= e!171638 e!171636)))

(declare-fun res!129510 () Bool)

(assert (=> b!265019 (=> (not res!129510) (not e!171636))))

(declare-datatypes ((SeekEntryResult!1190 0))(
  ( (MissingZero!1190 (index!6930 (_ BitVec 32))) (Found!1190 (index!6931 (_ BitVec 32))) (Intermediate!1190 (undefined!2002 Bool) (index!6932 (_ BitVec 32)) (x!25363 (_ BitVec 32))) (Undefined!1190) (MissingVacant!1190 (index!6933 (_ BitVec 32))) )
))
(declare-fun lt!134010 () SeekEntryResult!1190)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265019 (= res!129510 (or (= lt!134010 (MissingZero!1190 i!1355)) (= lt!134010 (MissingVacant!1190 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12751 0))(
  ( (array!12752 (arr!6034 (Array (_ BitVec 32) (_ BitVec 64))) (size!6386 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12751)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12751 (_ BitVec 32)) SeekEntryResult!1190)

(assert (=> b!265019 (= lt!134010 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265020 () Bool)

(assert (=> b!265020 (= e!171636 (bvsgt #b00000000000000000000000000000000 (size!6386 a!3436)))))

(declare-fun b!265021 () Bool)

(declare-fun res!129507 () Bool)

(assert (=> b!265021 (=> (not res!129507) (not e!171638))))

(assert (=> b!265021 (= res!129507 (and (= (size!6386 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6386 a!3436))))))

(declare-fun b!265022 () Bool)

(declare-fun res!129505 () Bool)

(assert (=> b!265022 (=> (not res!129505) (not e!171638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265022 (= res!129505 (validKeyInArray!0 k0!2698))))

(declare-fun b!265023 () Bool)

(declare-fun res!129509 () Bool)

(assert (=> b!265023 (=> (not res!129509) (not e!171638))))

(declare-fun arrayContainsKey!0 (array!12751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265023 (= res!129509 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129508 () Bool)

(assert (=> start!25460 (=> (not res!129508) (not e!171638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25460 (= res!129508 (validMask!0 mask!4002))))

(assert (=> start!25460 e!171638))

(assert (=> start!25460 true))

(declare-fun array_inv!3984 (array!12751) Bool)

(assert (=> start!25460 (array_inv!3984 a!3436)))

(declare-fun b!265024 () Bool)

(declare-fun res!129506 () Bool)

(assert (=> b!265024 (=> (not res!129506) (not e!171636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12751 (_ BitVec 32)) Bool)

(assert (=> b!265024 (= res!129506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25460 res!129508) b!265021))

(assert (= (and b!265021 res!129507) b!265022))

(assert (= (and b!265022 res!129505) b!265023))

(assert (= (and b!265023 res!129509) b!265019))

(assert (= (and b!265019 res!129510) b!265024))

(assert (= (and b!265024 res!129506) b!265020))

(declare-fun m!282107 () Bool)

(assert (=> b!265024 m!282107))

(declare-fun m!282109 () Bool)

(assert (=> start!25460 m!282109))

(declare-fun m!282111 () Bool)

(assert (=> start!25460 m!282111))

(declare-fun m!282113 () Bool)

(assert (=> b!265023 m!282113))

(declare-fun m!282115 () Bool)

(assert (=> b!265022 m!282115))

(declare-fun m!282117 () Bool)

(assert (=> b!265019 m!282117))

(check-sat (not b!265024) (not b!265023) (not b!265022) (not b!265019) (not start!25460))
(check-sat)
