; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25708 () Bool)

(assert start!25708)

(declare-fun b!266598 () Bool)

(declare-fun e!172466 () Bool)

(declare-fun e!172464 () Bool)

(assert (=> b!266598 (= e!172466 e!172464)))

(declare-fun res!130897 () Bool)

(assert (=> b!266598 (=> (not res!130897) (not e!172464))))

(declare-datatypes ((SeekEntryResult!1289 0))(
  ( (MissingZero!1289 (index!7326 (_ BitVec 32))) (Found!1289 (index!7327 (_ BitVec 32))) (Intermediate!1289 (undefined!2101 Bool) (index!7328 (_ BitVec 32)) (x!25630 (_ BitVec 32))) (Undefined!1289) (MissingVacant!1289 (index!7329 (_ BitVec 32))) )
))
(declare-fun lt!134469 () SeekEntryResult!1289)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266598 (= res!130897 (or (= lt!134469 (MissingZero!1289 i!1355)) (= lt!134469 (MissingVacant!1289 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12887 0))(
  ( (array!12888 (arr!6098 (Array (_ BitVec 32) (_ BitVec 64))) (size!6450 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12887)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12887 (_ BitVec 32)) SeekEntryResult!1289)

(assert (=> b!266598 (= lt!134469 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266599 () Bool)

(declare-fun res!130896 () Bool)

(assert (=> b!266599 (=> (not res!130896) (not e!172466))))

(declare-fun arrayContainsKey!0 (array!12887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266599 (= res!130896 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266600 () Bool)

(declare-fun res!130895 () Bool)

(assert (=> b!266600 (=> (not res!130895) (not e!172464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12887 (_ BitVec 32)) Bool)

(assert (=> b!266600 (= res!130895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266601 () Bool)

(declare-fun res!130899 () Bool)

(assert (=> b!266601 (=> (not res!130899) (not e!172466))))

(assert (=> b!266601 (= res!130899 (and (= (size!6450 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6450 a!3436))))))

(declare-fun b!266602 () Bool)

(declare-fun res!130894 () Bool)

(assert (=> b!266602 (=> (not res!130894) (not e!172466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266602 (= res!130894 (validKeyInArray!0 k!2698))))

(declare-fun res!130898 () Bool)

(assert (=> start!25708 (=> (not res!130898) (not e!172466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25708 (= res!130898 (validMask!0 mask!4002))))

(assert (=> start!25708 e!172466))

(assert (=> start!25708 true))

(declare-fun array_inv!4061 (array!12887) Bool)

(assert (=> start!25708 (array_inv!4061 a!3436)))

(declare-fun b!266603 () Bool)

(assert (=> b!266603 (= e!172464 false)))

(declare-fun lt!134470 () Bool)

(declare-datatypes ((List!3912 0))(
  ( (Nil!3909) (Cons!3908 (h!4575 (_ BitVec 64)) (t!8994 List!3912)) )
))
(declare-fun arrayNoDuplicates!0 (array!12887 (_ BitVec 32) List!3912) Bool)

(assert (=> b!266603 (= lt!134470 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3909))))

(assert (= (and start!25708 res!130898) b!266601))

(assert (= (and b!266601 res!130899) b!266602))

(assert (= (and b!266602 res!130894) b!266599))

(assert (= (and b!266599 res!130896) b!266598))

(assert (= (and b!266598 res!130897) b!266600))

(assert (= (and b!266600 res!130895) b!266603))

(declare-fun m!283161 () Bool)

(assert (=> b!266603 m!283161))

(declare-fun m!283163 () Bool)

(assert (=> b!266599 m!283163))

(declare-fun m!283165 () Bool)

(assert (=> start!25708 m!283165))

(declare-fun m!283167 () Bool)

(assert (=> start!25708 m!283167))

(declare-fun m!283169 () Bool)

(assert (=> b!266598 m!283169))

(declare-fun m!283171 () Bool)

(assert (=> b!266602 m!283171))

(declare-fun m!283173 () Bool)

(assert (=> b!266600 m!283173))

(push 1)

