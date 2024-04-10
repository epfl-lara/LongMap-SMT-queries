; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28506 () Bool)

(assert start!28506)

(declare-fun b!291673 () Bool)

(declare-fun e!184555 () Bool)

(declare-fun e!184556 () Bool)

(assert (=> b!291673 (= e!184555 e!184556)))

(declare-fun res!152876 () Bool)

(assert (=> b!291673 (=> (not res!152876) (not e!184556))))

(declare-fun lt!144304 () Bool)

(declare-datatypes ((SeekEntryResult!2138 0))(
  ( (MissingZero!2138 (index!10722 (_ BitVec 32))) (Found!2138 (index!10723 (_ BitVec 32))) (Intermediate!2138 (undefined!2950 Bool) (index!10724 (_ BitVec 32)) (x!28915 (_ BitVec 32))) (Undefined!2138) (MissingVacant!2138 (index!10725 (_ BitVec 32))) )
))
(declare-fun lt!144302 () SeekEntryResult!2138)

(declare-datatypes ((array!14730 0))(
  ( (array!14731 (arr!6989 (Array (_ BitVec 32) (_ BitVec 64))) (size!7341 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14730)

(assert (=> b!291673 (= res!152876 (and (or lt!144304 (not (undefined!2950 lt!144302))) (not lt!144304) (= (select (arr!6989 a!3312) (index!10724 lt!144302)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291673 (= lt!144304 (not (is-Intermediate!2138 lt!144302)))))

(declare-fun b!291674 () Bool)

(declare-fun e!184559 () Bool)

(declare-fun e!184558 () Bool)

(assert (=> b!291674 (= e!184559 e!184558)))

(declare-fun res!152871 () Bool)

(assert (=> b!291674 (=> (not res!152871) (not e!184558))))

(declare-fun lt!144307 () SeekEntryResult!2138)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144306 () Bool)

(assert (=> b!291674 (= res!152871 (or lt!144306 (= lt!144307 (MissingVacant!2138 i!1256))))))

(assert (=> b!291674 (= lt!144306 (= lt!144307 (MissingZero!2138 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14730 (_ BitVec 32)) SeekEntryResult!2138)

(assert (=> b!291674 (= lt!144307 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291675 () Bool)

(declare-fun res!152870 () Bool)

(assert (=> b!291675 (=> (not res!152870) (not e!184559))))

(assert (=> b!291675 (= res!152870 (and (= (size!7341 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7341 a!3312))))))

(declare-fun b!291676 () Bool)

(assert (=> b!291676 (= e!184556 (not true))))

(assert (=> b!291676 (= (index!10724 lt!144302) i!1256)))

(declare-fun b!291677 () Bool)

(declare-fun res!152875 () Bool)

(assert (=> b!291677 (=> (not res!152875) (not e!184559))))

(declare-fun arrayContainsKey!0 (array!14730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291677 (= res!152875 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152872 () Bool)

(assert (=> start!28506 (=> (not res!152872) (not e!184559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28506 (= res!152872 (validMask!0 mask!3809))))

(assert (=> start!28506 e!184559))

(assert (=> start!28506 true))

(declare-fun array_inv!4952 (array!14730) Bool)

(assert (=> start!28506 (array_inv!4952 a!3312)))

(declare-fun b!291678 () Bool)

(assert (=> b!291678 (= e!184558 e!184555)))

(declare-fun res!152877 () Bool)

(assert (=> b!291678 (=> (not res!152877) (not e!184555))))

(assert (=> b!291678 (= res!152877 (and (not lt!144306) (= lt!144307 (MissingVacant!2138 i!1256))))))

(declare-fun lt!144305 () SeekEntryResult!2138)

(declare-fun lt!144303 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14730 (_ BitVec 32)) SeekEntryResult!2138)

(assert (=> b!291678 (= lt!144305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144303 k!2524 (array!14731 (store (arr!6989 a!3312) i!1256 k!2524) (size!7341 a!3312)) mask!3809))))

(assert (=> b!291678 (= lt!144302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144303 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291678 (= lt!144303 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291679 () Bool)

(declare-fun res!152874 () Bool)

(assert (=> b!291679 (=> (not res!152874) (not e!184559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291679 (= res!152874 (validKeyInArray!0 k!2524))))

(declare-fun b!291680 () Bool)

(declare-fun res!152873 () Bool)

(assert (=> b!291680 (=> (not res!152873) (not e!184558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14730 (_ BitVec 32)) Bool)

(assert (=> b!291680 (= res!152873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28506 res!152872) b!291675))

(assert (= (and b!291675 res!152870) b!291679))

(assert (= (and b!291679 res!152874) b!291677))

(assert (= (and b!291677 res!152875) b!291674))

(assert (= (and b!291674 res!152871) b!291680))

(assert (= (and b!291680 res!152873) b!291678))

(assert (= (and b!291678 res!152877) b!291673))

(assert (= (and b!291673 res!152876) b!291676))

(declare-fun m!305511 () Bool)

(assert (=> b!291674 m!305511))

(declare-fun m!305513 () Bool)

(assert (=> b!291677 m!305513))

(declare-fun m!305515 () Bool)

(assert (=> b!291679 m!305515))

(declare-fun m!305517 () Bool)

(assert (=> b!291680 m!305517))

(declare-fun m!305519 () Bool)

(assert (=> b!291673 m!305519))

(declare-fun m!305521 () Bool)

(assert (=> start!28506 m!305521))

(declare-fun m!305523 () Bool)

(assert (=> start!28506 m!305523))

(declare-fun m!305525 () Bool)

(assert (=> b!291678 m!305525))

(declare-fun m!305527 () Bool)

(assert (=> b!291678 m!305527))

(declare-fun m!305529 () Bool)

(assert (=> b!291678 m!305529))

(declare-fun m!305531 () Bool)

(assert (=> b!291678 m!305531))

(push 1)

