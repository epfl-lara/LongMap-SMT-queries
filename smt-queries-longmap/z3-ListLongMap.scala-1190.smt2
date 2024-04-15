; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25610 () Bool)

(assert start!25610)

(declare-fun b!265461 () Bool)

(declare-fun res!129812 () Bool)

(declare-fun e!171906 () Bool)

(assert (=> b!265461 (=> (not res!129812) (not e!171906))))

(declare-datatypes ((array!12777 0))(
  ( (array!12778 (arr!6042 (Array (_ BitVec 32) (_ BitVec 64))) (size!6395 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12777)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265461 (= res!129812 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265462 () Bool)

(declare-fun e!171904 () Bool)

(assert (=> b!265462 (= e!171904 false)))

(declare-fun lt!133983 () Bool)

(declare-datatypes ((List!3829 0))(
  ( (Nil!3826) (Cons!3825 (h!4492 (_ BitVec 64)) (t!8902 List!3829)) )
))
(declare-fun arrayNoDuplicates!0 (array!12777 (_ BitVec 32) List!3829) Bool)

(assert (=> b!265462 (= lt!133983 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3826))))

(declare-fun b!265463 () Bool)

(declare-fun res!129809 () Bool)

(assert (=> b!265463 (=> (not res!129809) (not e!171904))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12777 (_ BitVec 32)) Bool)

(assert (=> b!265463 (= res!129809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265464 () Bool)

(declare-fun res!129810 () Bool)

(assert (=> b!265464 (=> (not res!129810) (not e!171906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265464 (= res!129810 (validKeyInArray!0 k0!2698))))

(declare-fun b!265465 () Bool)

(declare-fun res!129811 () Bool)

(assert (=> b!265465 (=> (not res!129811) (not e!171906))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265465 (= res!129811 (and (= (size!6395 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6395 a!3436))))))

(declare-fun b!265466 () Bool)

(assert (=> b!265466 (= e!171906 e!171904)))

(declare-fun res!129814 () Bool)

(assert (=> b!265466 (=> (not res!129814) (not e!171904))))

(declare-datatypes ((SeekEntryResult!1232 0))(
  ( (MissingZero!1232 (index!7098 (_ BitVec 32))) (Found!1232 (index!7099 (_ BitVec 32))) (Intermediate!1232 (undefined!2044 Bool) (index!7100 (_ BitVec 32)) (x!25436 (_ BitVec 32))) (Undefined!1232) (MissingVacant!1232 (index!7101 (_ BitVec 32))) )
))
(declare-fun lt!133982 () SeekEntryResult!1232)

(assert (=> b!265466 (= res!129814 (or (= lt!133982 (MissingZero!1232 i!1355)) (= lt!133982 (MissingVacant!1232 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12777 (_ BitVec 32)) SeekEntryResult!1232)

(assert (=> b!265466 (= lt!133982 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!129813 () Bool)

(assert (=> start!25610 (=> (not res!129813) (not e!171906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25610 (= res!129813 (validMask!0 mask!4002))))

(assert (=> start!25610 e!171906))

(assert (=> start!25610 true))

(declare-fun array_inv!4014 (array!12777) Bool)

(assert (=> start!25610 (array_inv!4014 a!3436)))

(assert (= (and start!25610 res!129813) b!265465))

(assert (= (and b!265465 res!129811) b!265464))

(assert (= (and b!265464 res!129810) b!265461))

(assert (= (and b!265461 res!129812) b!265466))

(assert (= (and b!265466 res!129814) b!265463))

(assert (= (and b!265463 res!129809) b!265462))

(declare-fun m!281783 () Bool)

(assert (=> b!265462 m!281783))

(declare-fun m!281785 () Bool)

(assert (=> b!265466 m!281785))

(declare-fun m!281787 () Bool)

(assert (=> b!265463 m!281787))

(declare-fun m!281789 () Bool)

(assert (=> b!265464 m!281789))

(declare-fun m!281791 () Bool)

(assert (=> b!265461 m!281791))

(declare-fun m!281793 () Bool)

(assert (=> start!25610 m!281793))

(declare-fun m!281795 () Bool)

(assert (=> start!25610 m!281795))

(check-sat (not b!265466) (not start!25610) (not b!265461) (not b!265464) (not b!265463) (not b!265462))
(check-sat)
