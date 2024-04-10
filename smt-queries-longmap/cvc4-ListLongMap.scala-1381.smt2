; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27142 () Bool)

(assert start!27142)

(declare-fun res!143815 () Bool)

(declare-fun e!178642 () Bool)

(assert (=> start!27142 (=> (not res!143815) (not e!178642))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27142 (= res!143815 (validMask!0 mask!3868))))

(assert (=> start!27142 e!178642))

(declare-datatypes ((array!13960 0))(
  ( (array!13961 (arr!6622 (Array (_ BitVec 32) (_ BitVec 64))) (size!6974 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13960)

(declare-fun array_inv!4585 (array!13960) Bool)

(assert (=> start!27142 (array_inv!4585 a!3325)))

(assert (=> start!27142 true))

(declare-fun b!280743 () Bool)

(declare-fun res!143820 () Bool)

(assert (=> b!280743 (=> (not res!143820) (not e!178642))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280743 (= res!143820 (validKeyInArray!0 k!2581))))

(declare-fun b!280744 () Bool)

(declare-fun res!143813 () Bool)

(assert (=> b!280744 (=> (not res!143813) (not e!178642))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280744 (= res!143813 (and (= (size!6974 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6974 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6974 a!3325))))))

(declare-fun b!280745 () Bool)

(declare-fun res!143816 () Bool)

(assert (=> b!280745 (=> (not res!143816) (not e!178642))))

(declare-datatypes ((List!4430 0))(
  ( (Nil!4427) (Cons!4426 (h!5096 (_ BitVec 64)) (t!9512 List!4430)) )
))
(declare-fun arrayNoDuplicates!0 (array!13960 (_ BitVec 32) List!4430) Bool)

(assert (=> b!280745 (= res!143816 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4427))))

(declare-fun b!280746 () Bool)

(declare-fun res!143814 () Bool)

(declare-fun e!178643 () Bool)

(assert (=> b!280746 (=> (not res!143814) (not e!178643))))

(assert (=> b!280746 (= res!143814 (not (= startIndex!26 i!1267)))))

(declare-fun b!280747 () Bool)

(declare-fun res!143819 () Bool)

(assert (=> b!280747 (=> (not res!143819) (not e!178643))))

(assert (=> b!280747 (= res!143819 (validKeyInArray!0 (select (arr!6622 a!3325) startIndex!26)))))

(declare-fun b!280748 () Bool)

(assert (=> b!280748 (= e!178642 e!178643)))

(declare-fun res!143812 () Bool)

(assert (=> b!280748 (=> (not res!143812) (not e!178643))))

(declare-datatypes ((SeekEntryResult!1780 0))(
  ( (MissingZero!1780 (index!9290 (_ BitVec 32))) (Found!1780 (index!9291 (_ BitVec 32))) (Intermediate!1780 (undefined!2592 Bool) (index!9292 (_ BitVec 32)) (x!27522 (_ BitVec 32))) (Undefined!1780) (MissingVacant!1780 (index!9293 (_ BitVec 32))) )
))
(declare-fun lt!138895 () SeekEntryResult!1780)

(assert (=> b!280748 (= res!143812 (or (= lt!138895 (MissingZero!1780 i!1267)) (= lt!138895 (MissingVacant!1780 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13960 (_ BitVec 32)) SeekEntryResult!1780)

(assert (=> b!280748 (= lt!138895 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280749 () Bool)

(assert (=> b!280749 (= e!178643 (not true))))

(assert (=> b!280749 (arrayNoDuplicates!0 (array!13961 (store (arr!6622 a!3325) i!1267 k!2581) (size!6974 a!3325)) #b00000000000000000000000000000000 Nil!4427)))

(declare-datatypes ((Unit!8844 0))(
  ( (Unit!8845) )
))
(declare-fun lt!138894 () Unit!8844)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13960 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4430) Unit!8844)

(assert (=> b!280749 (= lt!138894 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4427))))

(declare-fun b!280750 () Bool)

(declare-fun res!143818 () Bool)

(assert (=> b!280750 (=> (not res!143818) (not e!178642))))

(declare-fun arrayContainsKey!0 (array!13960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280750 (= res!143818 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280751 () Bool)

(declare-fun res!143817 () Bool)

(assert (=> b!280751 (=> (not res!143817) (not e!178643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13960 (_ BitVec 32)) Bool)

(assert (=> b!280751 (= res!143817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27142 res!143815) b!280744))

(assert (= (and b!280744 res!143813) b!280743))

(assert (= (and b!280743 res!143820) b!280745))

(assert (= (and b!280745 res!143816) b!280750))

(assert (= (and b!280750 res!143818) b!280748))

(assert (= (and b!280748 res!143812) b!280751))

(assert (= (and b!280751 res!143817) b!280746))

(assert (= (and b!280746 res!143814) b!280747))

(assert (= (and b!280747 res!143819) b!280749))

(declare-fun m!295143 () Bool)

(assert (=> b!280743 m!295143))

(declare-fun m!295145 () Bool)

(assert (=> start!27142 m!295145))

(declare-fun m!295147 () Bool)

(assert (=> start!27142 m!295147))

(declare-fun m!295149 () Bool)

(assert (=> b!280751 m!295149))

(declare-fun m!295151 () Bool)

(assert (=> b!280745 m!295151))

(declare-fun m!295153 () Bool)

(assert (=> b!280747 m!295153))

(assert (=> b!280747 m!295153))

(declare-fun m!295155 () Bool)

(assert (=> b!280747 m!295155))

(declare-fun m!295157 () Bool)

(assert (=> b!280748 m!295157))

(declare-fun m!295159 () Bool)

(assert (=> b!280749 m!295159))

(declare-fun m!295161 () Bool)

(assert (=> b!280749 m!295161))

(declare-fun m!295163 () Bool)

(assert (=> b!280749 m!295163))

(declare-fun m!295165 () Bool)

(assert (=> b!280750 m!295165))

(push 1)

(assert (not b!280750))

