; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27570 () Bool)

(assert start!27570)

(declare-fun res!147357 () Bool)

(declare-fun e!180635 () Bool)

(assert (=> start!27570 (=> (not res!147357) (not e!180635))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27570 (= res!147357 (validMask!0 mask!3868))))

(assert (=> start!27570 e!180635))

(declare-datatypes ((array!14220 0))(
  ( (array!14221 (arr!6749 (Array (_ BitVec 32) (_ BitVec 64))) (size!7101 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14220)

(declare-fun array_inv!4712 (array!14220) Bool)

(assert (=> start!27570 (array_inv!4712 a!3325)))

(assert (=> start!27570 true))

(declare-fun b!284844 () Bool)

(declare-fun e!180634 () Bool)

(assert (=> b!284844 (= e!180634 false)))

(declare-fun lt!140637 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14220 (_ BitVec 32)) Bool)

(assert (=> b!284844 (= lt!140637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284845 () Bool)

(declare-fun res!147356 () Bool)

(assert (=> b!284845 (=> (not res!147356) (not e!180635))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284845 (= res!147356 (and (= (size!7101 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7101 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7101 a!3325))))))

(declare-fun b!284846 () Bool)

(assert (=> b!284846 (= e!180635 e!180634)))

(declare-fun res!147354 () Bool)

(assert (=> b!284846 (=> (not res!147354) (not e!180634))))

(declare-datatypes ((SeekEntryResult!1907 0))(
  ( (MissingZero!1907 (index!9798 (_ BitVec 32))) (Found!1907 (index!9799 (_ BitVec 32))) (Intermediate!1907 (undefined!2719 Bool) (index!9800 (_ BitVec 32)) (x!28002 (_ BitVec 32))) (Undefined!1907) (MissingVacant!1907 (index!9801 (_ BitVec 32))) )
))
(declare-fun lt!140638 () SeekEntryResult!1907)

(assert (=> b!284846 (= res!147354 (or (= lt!140638 (MissingZero!1907 i!1267)) (= lt!140638 (MissingVacant!1907 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14220 (_ BitVec 32)) SeekEntryResult!1907)

(assert (=> b!284846 (= lt!140638 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284847 () Bool)

(declare-fun res!147352 () Bool)

(assert (=> b!284847 (=> (not res!147352) (not e!180635))))

(declare-datatypes ((List!4557 0))(
  ( (Nil!4554) (Cons!4553 (h!5226 (_ BitVec 64)) (t!9639 List!4557)) )
))
(declare-fun arrayNoDuplicates!0 (array!14220 (_ BitVec 32) List!4557) Bool)

(assert (=> b!284847 (= res!147352 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4554))))

(declare-fun b!284848 () Bool)

(declare-fun res!147353 () Bool)

(assert (=> b!284848 (=> (not res!147353) (not e!180635))))

(declare-fun arrayContainsKey!0 (array!14220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284848 (= res!147353 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284849 () Bool)

(declare-fun res!147355 () Bool)

(assert (=> b!284849 (=> (not res!147355) (not e!180635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284849 (= res!147355 (validKeyInArray!0 k!2581))))

(assert (= (and start!27570 res!147357) b!284845))

(assert (= (and b!284845 res!147356) b!284849))

(assert (= (and b!284849 res!147355) b!284847))

(assert (= (and b!284847 res!147352) b!284848))

(assert (= (and b!284848 res!147353) b!284846))

(assert (= (and b!284846 res!147354) b!284844))

(declare-fun m!299769 () Bool)

(assert (=> b!284848 m!299769))

(declare-fun m!299771 () Bool)

(assert (=> b!284844 m!299771))

(declare-fun m!299773 () Bool)

(assert (=> start!27570 m!299773))

(declare-fun m!299775 () Bool)

(assert (=> start!27570 m!299775))

(declare-fun m!299777 () Bool)

(assert (=> b!284849 m!299777))

(declare-fun m!299779 () Bool)

(assert (=> b!284846 m!299779))

(declare-fun m!299781 () Bool)

(assert (=> b!284847 m!299781))

(push 1)

