; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26316 () Bool)

(assert start!26316)

(declare-fun b!272685 () Bool)

(declare-fun e!174936 () Bool)

(declare-fun e!174938 () Bool)

(assert (=> b!272685 (= e!174936 e!174938)))

(declare-fun res!136680 () Bool)

(assert (=> b!272685 (=> (not res!136680) (not e!174938))))

(declare-datatypes ((SeekEntryResult!1514 0))(
  ( (MissingZero!1514 (index!8226 (_ BitVec 32))) (Found!1514 (index!8227 (_ BitVec 32))) (Intermediate!1514 (undefined!2326 Bool) (index!8228 (_ BitVec 32)) (x!26543 (_ BitVec 32))) (Undefined!1514) (MissingVacant!1514 (index!8229 (_ BitVec 32))) )
))
(declare-fun lt!136056 () SeekEntryResult!1514)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272685 (= res!136680 (or (= lt!136056 (MissingZero!1514 i!1267)) (= lt!136056 (MissingVacant!1514 i!1267))))))

(declare-datatypes ((array!13413 0))(
  ( (array!13414 (arr!6356 (Array (_ BitVec 32) (_ BitVec 64))) (size!6708 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13413)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13413 (_ BitVec 32)) SeekEntryResult!1514)

(assert (=> b!272685 (= lt!136056 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272686 () Bool)

(declare-fun res!136681 () Bool)

(assert (=> b!272686 (=> (not res!136681) (not e!174938))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272686 (= res!136681 (validKeyInArray!0 (select (arr!6356 a!3325) startIndex!26)))))

(declare-fun res!136683 () Bool)

(assert (=> start!26316 (=> (not res!136683) (not e!174936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26316 (= res!136683 (validMask!0 mask!3868))))

(assert (=> start!26316 e!174936))

(declare-fun array_inv!4319 (array!13413) Bool)

(assert (=> start!26316 (array_inv!4319 a!3325)))

(assert (=> start!26316 true))

(declare-fun b!272687 () Bool)

(declare-fun res!136677 () Bool)

(assert (=> b!272687 (=> (not res!136677) (not e!174938))))

(assert (=> b!272687 (= res!136677 (not (= startIndex!26 i!1267)))))

(declare-fun b!272688 () Bool)

(declare-fun res!136678 () Bool)

(assert (=> b!272688 (=> (not res!136678) (not e!174938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13413 (_ BitVec 32)) Bool)

(assert (=> b!272688 (= res!136678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272689 () Bool)

(declare-fun res!136676 () Bool)

(assert (=> b!272689 (=> (not res!136676) (not e!174936))))

(declare-datatypes ((List!4164 0))(
  ( (Nil!4161) (Cons!4160 (h!4827 (_ BitVec 64)) (t!9246 List!4164)) )
))
(declare-fun arrayNoDuplicates!0 (array!13413 (_ BitVec 32) List!4164) Bool)

(assert (=> b!272689 (= res!136676 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4161))))

(declare-fun b!272690 () Bool)

(declare-fun res!136682 () Bool)

(assert (=> b!272690 (=> (not res!136682) (not e!174936))))

(assert (=> b!272690 (= res!136682 (and (= (size!6708 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6708 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6708 a!3325))))))

(declare-fun b!272691 () Bool)

(declare-fun res!136679 () Bool)

(assert (=> b!272691 (=> (not res!136679) (not e!174936))))

(assert (=> b!272691 (= res!136679 (validKeyInArray!0 k!2581))))

(declare-fun b!272692 () Bool)

(assert (=> b!272692 (= e!174938 (not true))))

(assert (=> b!272692 (arrayNoDuplicates!0 (array!13414 (store (arr!6356 a!3325) i!1267 k!2581) (size!6708 a!3325)) #b00000000000000000000000000000000 Nil!4161)))

(declare-datatypes ((Unit!8515 0))(
  ( (Unit!8516) )
))
(declare-fun lt!136057 () Unit!8515)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4164) Unit!8515)

(assert (=> b!272692 (= lt!136057 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4161))))

(declare-fun b!272693 () Bool)

(declare-fun res!136675 () Bool)

(assert (=> b!272693 (=> (not res!136675) (not e!174936))))

(declare-fun arrayContainsKey!0 (array!13413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272693 (= res!136675 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26316 res!136683) b!272690))

(assert (= (and b!272690 res!136682) b!272691))

(assert (= (and b!272691 res!136679) b!272689))

(assert (= (and b!272689 res!136676) b!272693))

(assert (= (and b!272693 res!136675) b!272685))

(assert (= (and b!272685 res!136680) b!272688))

(assert (= (and b!272688 res!136678) b!272687))

(assert (= (and b!272687 res!136677) b!272686))

(assert (= (and b!272686 res!136681) b!272692))

(declare-fun m!287757 () Bool)

(assert (=> start!26316 m!287757))

(declare-fun m!287759 () Bool)

(assert (=> start!26316 m!287759))

(declare-fun m!287761 () Bool)

(assert (=> b!272692 m!287761))

(declare-fun m!287763 () Bool)

(assert (=> b!272692 m!287763))

(declare-fun m!287765 () Bool)

(assert (=> b!272692 m!287765))

(declare-fun m!287767 () Bool)

(assert (=> b!272688 m!287767))

(declare-fun m!287769 () Bool)

(assert (=> b!272693 m!287769))

(declare-fun m!287771 () Bool)

(assert (=> b!272689 m!287771))

(declare-fun m!287773 () Bool)

(assert (=> b!272691 m!287773))

(declare-fun m!287775 () Bool)

(assert (=> b!272685 m!287775))

(declare-fun m!287777 () Bool)

(assert (=> b!272686 m!287777))

(assert (=> b!272686 m!287777))

(declare-fun m!287779 () Bool)

(assert (=> b!272686 m!287779))

(push 1)

