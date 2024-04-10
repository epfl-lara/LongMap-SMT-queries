; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25624 () Bool)

(assert start!25624)

(declare-fun b!265770 () Bool)

(declare-fun res!130070 () Bool)

(declare-fun e!172087 () Bool)

(assert (=> b!265770 (=> (not res!130070) (not e!172087))))

(declare-datatypes ((array!12803 0))(
  ( (array!12804 (arr!6056 (Array (_ BitVec 32) (_ BitVec 64))) (size!6408 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12803)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265770 (= res!130070 (and (= (size!6408 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6408 a!3436))))))

(declare-fun res!130068 () Bool)

(assert (=> start!25624 (=> (not res!130068) (not e!172087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25624 (= res!130068 (validMask!0 mask!4002))))

(assert (=> start!25624 e!172087))

(assert (=> start!25624 true))

(declare-fun array_inv!4019 (array!12803) Bool)

(assert (=> start!25624 (array_inv!4019 a!3436)))

(declare-fun b!265771 () Bool)

(declare-fun e!172088 () Bool)

(assert (=> b!265771 (= e!172087 e!172088)))

(declare-fun res!130071 () Bool)

(assert (=> b!265771 (=> (not res!130071) (not e!172088))))

(declare-datatypes ((SeekEntryResult!1247 0))(
  ( (MissingZero!1247 (index!7158 (_ BitVec 32))) (Found!1247 (index!7159 (_ BitVec 32))) (Intermediate!1247 (undefined!2059 Bool) (index!7160 (_ BitVec 32)) (x!25476 (_ BitVec 32))) (Undefined!1247) (MissingVacant!1247 (index!7161 (_ BitVec 32))) )
))
(declare-fun lt!134218 () SeekEntryResult!1247)

(assert (=> b!265771 (= res!130071 (or (= lt!134218 (MissingZero!1247 i!1355)) (= lt!134218 (MissingVacant!1247 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12803 (_ BitVec 32)) SeekEntryResult!1247)

(assert (=> b!265771 (= lt!134218 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265772 () Bool)

(declare-fun res!130066 () Bool)

(assert (=> b!265772 (=> (not res!130066) (not e!172087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265772 (= res!130066 (validKeyInArray!0 k!2698))))

(declare-fun b!265773 () Bool)

(assert (=> b!265773 (= e!172088 false)))

(declare-fun lt!134217 () Bool)

(declare-datatypes ((List!3870 0))(
  ( (Nil!3867) (Cons!3866 (h!4533 (_ BitVec 64)) (t!8952 List!3870)) )
))
(declare-fun arrayNoDuplicates!0 (array!12803 (_ BitVec 32) List!3870) Bool)

(assert (=> b!265773 (= lt!134217 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3867))))

(declare-fun b!265774 () Bool)

(declare-fun res!130069 () Bool)

(assert (=> b!265774 (=> (not res!130069) (not e!172087))))

(declare-fun arrayContainsKey!0 (array!12803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265774 (= res!130069 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265775 () Bool)

(declare-fun res!130067 () Bool)

(assert (=> b!265775 (=> (not res!130067) (not e!172088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12803 (_ BitVec 32)) Bool)

(assert (=> b!265775 (= res!130067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25624 res!130068) b!265770))

(assert (= (and b!265770 res!130070) b!265772))

(assert (= (and b!265772 res!130066) b!265774))

(assert (= (and b!265774 res!130069) b!265771))

(assert (= (and b!265771 res!130071) b!265775))

(assert (= (and b!265775 res!130067) b!265773))

(declare-fun m!282501 () Bool)

(assert (=> start!25624 m!282501))

(declare-fun m!282503 () Bool)

(assert (=> start!25624 m!282503))

(declare-fun m!282505 () Bool)

(assert (=> b!265774 m!282505))

(declare-fun m!282507 () Bool)

(assert (=> b!265775 m!282507))

(declare-fun m!282509 () Bool)

(assert (=> b!265773 m!282509))

(declare-fun m!282511 () Bool)

(assert (=> b!265772 m!282511))

(declare-fun m!282513 () Bool)

(assert (=> b!265771 m!282513))

(push 1)

(assert (not b!265771))

(assert (not b!265772))

(assert (not start!25624))

(assert (not b!265774))

(assert (not b!265775))

(assert (not b!265773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

