; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25612 () Bool)

(assert start!25612)

(declare-fun b!265662 () Bool)

(declare-fun res!129962 () Bool)

(declare-fun e!172034 () Bool)

(assert (=> b!265662 (=> (not res!129962) (not e!172034))))

(declare-datatypes ((array!12791 0))(
  ( (array!12792 (arr!6050 (Array (_ BitVec 32) (_ BitVec 64))) (size!6402 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12791)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12791 (_ BitVec 32)) Bool)

(assert (=> b!265662 (= res!129962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!129961 () Bool)

(declare-fun e!172032 () Bool)

(assert (=> start!25612 (=> (not res!129961) (not e!172032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25612 (= res!129961 (validMask!0 mask!4002))))

(assert (=> start!25612 e!172032))

(assert (=> start!25612 true))

(declare-fun array_inv!4013 (array!12791) Bool)

(assert (=> start!25612 (array_inv!4013 a!3436)))

(declare-fun b!265663 () Bool)

(assert (=> b!265663 (= e!172032 e!172034)))

(declare-fun res!129959 () Bool)

(assert (=> b!265663 (=> (not res!129959) (not e!172034))))

(declare-datatypes ((SeekEntryResult!1241 0))(
  ( (MissingZero!1241 (index!7134 (_ BitVec 32))) (Found!1241 (index!7135 (_ BitVec 32))) (Intermediate!1241 (undefined!2053 Bool) (index!7136 (_ BitVec 32)) (x!25454 (_ BitVec 32))) (Undefined!1241) (MissingVacant!1241 (index!7137 (_ BitVec 32))) )
))
(declare-fun lt!134181 () SeekEntryResult!1241)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265663 (= res!129959 (or (= lt!134181 (MissingZero!1241 i!1355)) (= lt!134181 (MissingVacant!1241 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12791 (_ BitVec 32)) SeekEntryResult!1241)

(assert (=> b!265663 (= lt!134181 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265664 () Bool)

(declare-fun res!129960 () Bool)

(assert (=> b!265664 (=> (not res!129960) (not e!172032))))

(declare-fun arrayContainsKey!0 (array!12791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265664 (= res!129960 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265665 () Bool)

(declare-fun res!129963 () Bool)

(assert (=> b!265665 (=> (not res!129963) (not e!172032))))

(assert (=> b!265665 (= res!129963 (and (= (size!6402 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6402 a!3436))))))

(declare-fun b!265666 () Bool)

(declare-fun res!129958 () Bool)

(assert (=> b!265666 (=> (not res!129958) (not e!172032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265666 (= res!129958 (validKeyInArray!0 k!2698))))

(declare-fun b!265667 () Bool)

(assert (=> b!265667 (= e!172034 false)))

(declare-fun lt!134182 () Bool)

(declare-datatypes ((List!3864 0))(
  ( (Nil!3861) (Cons!3860 (h!4527 (_ BitVec 64)) (t!8946 List!3864)) )
))
(declare-fun arrayNoDuplicates!0 (array!12791 (_ BitVec 32) List!3864) Bool)

(assert (=> b!265667 (= lt!134182 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3861))))

(assert (= (and start!25612 res!129961) b!265665))

(assert (= (and b!265665 res!129963) b!265666))

(assert (= (and b!265666 res!129958) b!265664))

(assert (= (and b!265664 res!129960) b!265663))

(assert (= (and b!265663 res!129959) b!265662))

(assert (= (and b!265662 res!129962) b!265667))

(declare-fun m!282417 () Bool)

(assert (=> b!265667 m!282417))

(declare-fun m!282419 () Bool)

(assert (=> b!265664 m!282419))

(declare-fun m!282421 () Bool)

(assert (=> start!25612 m!282421))

(declare-fun m!282423 () Bool)

(assert (=> start!25612 m!282423))

(declare-fun m!282425 () Bool)

(assert (=> b!265666 m!282425))

(declare-fun m!282427 () Bool)

(assert (=> b!265663 m!282427))

(declare-fun m!282429 () Bool)

(assert (=> b!265662 m!282429))

(push 1)

(assert (not start!25612))

(assert (not 