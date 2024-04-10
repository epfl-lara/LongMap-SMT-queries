; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25698 () Bool)

(assert start!25698)

(declare-fun b!266500 () Bool)

(declare-fun res!130797 () Bool)

(declare-fun e!172419 () Bool)

(assert (=> b!266500 (=> (not res!130797) (not e!172419))))

(declare-datatypes ((array!12877 0))(
  ( (array!12878 (arr!6093 (Array (_ BitVec 32) (_ BitVec 64))) (size!6445 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12877)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266500 (= res!130797 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266501 () Bool)

(declare-fun res!130802 () Bool)

(declare-fun e!172421 () Bool)

(assert (=> b!266501 (=> (not res!130802) (not e!172421))))

(assert (=> b!266501 (= res!130802 (bvslt #b00000000000000000000000000000000 (size!6445 a!3436)))))

(declare-fun b!266502 () Bool)

(assert (=> b!266502 (= e!172419 e!172421)))

(declare-fun res!130803 () Bool)

(assert (=> b!266502 (=> (not res!130803) (not e!172421))))

(declare-datatypes ((SeekEntryResult!1284 0))(
  ( (MissingZero!1284 (index!7306 (_ BitVec 32))) (Found!1284 (index!7307 (_ BitVec 32))) (Intermediate!1284 (undefined!2096 Bool) (index!7308 (_ BitVec 32)) (x!25609 (_ BitVec 32))) (Undefined!1284) (MissingVacant!1284 (index!7309 (_ BitVec 32))) )
))
(declare-fun lt!134440 () SeekEntryResult!1284)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266502 (= res!130803 (or (= lt!134440 (MissingZero!1284 i!1355)) (= lt!134440 (MissingVacant!1284 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12877 (_ BitVec 32)) SeekEntryResult!1284)

(assert (=> b!266502 (= lt!134440 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266503 () Bool)

(declare-fun res!130798 () Bool)

(assert (=> b!266503 (=> (not res!130798) (not e!172419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266503 (= res!130798 (validKeyInArray!0 k0!2698))))

(declare-fun res!130796 () Bool)

(assert (=> start!25698 (=> (not res!130796) (not e!172419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25698 (= res!130796 (validMask!0 mask!4002))))

(assert (=> start!25698 e!172419))

(assert (=> start!25698 true))

(declare-fun array_inv!4056 (array!12877) Bool)

(assert (=> start!25698 (array_inv!4056 a!3436)))

(declare-fun b!266504 () Bool)

(declare-fun res!130799 () Bool)

(assert (=> b!266504 (=> (not res!130799) (not e!172421))))

(declare-datatypes ((List!3907 0))(
  ( (Nil!3904) (Cons!3903 (h!4570 (_ BitVec 64)) (t!8989 List!3907)) )
))
(declare-fun arrayNoDuplicates!0 (array!12877 (_ BitVec 32) List!3907) Bool)

(assert (=> b!266504 (= res!130799 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3904))))

(declare-fun b!266505 () Bool)

(declare-fun res!130800 () Bool)

(assert (=> b!266505 (=> (not res!130800) (not e!172419))))

(assert (=> b!266505 (= res!130800 (and (= (size!6445 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6445 a!3436))))))

(declare-fun b!266506 () Bool)

(declare-fun res!130801 () Bool)

(assert (=> b!266506 (=> (not res!130801) (not e!172421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12877 (_ BitVec 32)) Bool)

(assert (=> b!266506 (= res!130801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266507 () Bool)

(assert (=> b!266507 (= e!172421 (not (bvsle #b00000000000000000000000000000000 (size!6445 a!3436))))))

(assert (=> b!266507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12878 (store (arr!6093 a!3436) i!1355 k0!2698) (size!6445 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8289 0))(
  ( (Unit!8290) )
))
(declare-fun lt!134439 () Unit!8289)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12877 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8289)

(assert (=> b!266507 (= lt!134439 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(assert (= (and start!25698 res!130796) b!266505))

(assert (= (and b!266505 res!130800) b!266503))

(assert (= (and b!266503 res!130798) b!266500))

(assert (= (and b!266500 res!130797) b!266502))

(assert (= (and b!266502 res!130803) b!266506))

(assert (= (and b!266506 res!130801) b!266504))

(assert (= (and b!266504 res!130799) b!266501))

(assert (= (and b!266501 res!130802) b!266507))

(declare-fun m!283079 () Bool)

(assert (=> b!266502 m!283079))

(declare-fun m!283081 () Bool)

(assert (=> b!266500 m!283081))

(declare-fun m!283083 () Bool)

(assert (=> start!25698 m!283083))

(declare-fun m!283085 () Bool)

(assert (=> start!25698 m!283085))

(declare-fun m!283087 () Bool)

(assert (=> b!266506 m!283087))

(declare-fun m!283089 () Bool)

(assert (=> b!266503 m!283089))

(declare-fun m!283091 () Bool)

(assert (=> b!266504 m!283091))

(declare-fun m!283093 () Bool)

(assert (=> b!266507 m!283093))

(declare-fun m!283095 () Bool)

(assert (=> b!266507 m!283095))

(declare-fun m!283097 () Bool)

(assert (=> b!266507 m!283097))

(check-sat (not b!266500) (not b!266506) (not b!266507) (not start!25698) (not b!266504) (not b!266503) (not b!266502))
(check-sat)
