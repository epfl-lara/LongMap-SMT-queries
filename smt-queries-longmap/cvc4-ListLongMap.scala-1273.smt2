; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26200 () Bool)

(assert start!26200)

(declare-fun b!270827 () Bool)

(declare-fun res!134821 () Bool)

(declare-fun e!174416 () Bool)

(assert (=> b!270827 (=> (not res!134821) (not e!174416))))

(declare-datatypes ((array!13297 0))(
  ( (array!13298 (arr!6298 (Array (_ BitVec 32) (_ BitVec 64))) (size!6650 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13297)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270827 (= res!134821 (validKeyInArray!0 (select (arr!6298 a!3325) startIndex!26)))))

(declare-fun res!134825 () Bool)

(declare-fun e!174415 () Bool)

(assert (=> start!26200 (=> (not res!134825) (not e!174415))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26200 (= res!134825 (validMask!0 mask!3868))))

(assert (=> start!26200 e!174415))

(declare-fun array_inv!4261 (array!13297) Bool)

(assert (=> start!26200 (array_inv!4261 a!3325)))

(assert (=> start!26200 true))

(declare-fun b!270828 () Bool)

(declare-fun res!134828 () Bool)

(assert (=> b!270828 (=> (not res!134828) (not e!174416))))

(declare-datatypes ((List!4106 0))(
  ( (Nil!4103) (Cons!4102 (h!4769 (_ BitVec 64)) (t!9188 List!4106)) )
))
(declare-fun contains!1936 (List!4106 (_ BitVec 64)) Bool)

(assert (=> b!270828 (= res!134828 (not (contains!1936 Nil!4103 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270829 () Bool)

(declare-fun res!134827 () Bool)

(assert (=> b!270829 (=> (not res!134827) (not e!174416))))

(assert (=> b!270829 (= res!134827 (not (contains!1936 Nil!4103 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270830 () Bool)

(declare-fun res!134824 () Bool)

(assert (=> b!270830 (=> (not res!134824) (not e!174415))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270830 (= res!134824 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270831 () Bool)

(declare-fun res!134818 () Bool)

(assert (=> b!270831 (=> (not res!134818) (not e!174416))))

(assert (=> b!270831 (= res!134818 (and (bvslt (size!6650 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6650 a!3325))))))

(declare-fun b!270832 () Bool)

(declare-fun res!134819 () Bool)

(assert (=> b!270832 (=> (not res!134819) (not e!174416))))

(declare-fun noDuplicate!124 (List!4106) Bool)

(assert (=> b!270832 (= res!134819 (noDuplicate!124 Nil!4103))))

(declare-fun b!270833 () Bool)

(declare-fun res!134822 () Bool)

(assert (=> b!270833 (=> (not res!134822) (not e!174415))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270833 (= res!134822 (and (= (size!6650 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6650 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6650 a!3325))))))

(declare-fun b!270834 () Bool)

(declare-fun res!134820 () Bool)

(assert (=> b!270834 (=> (not res!134820) (not e!174415))))

(declare-fun arrayNoDuplicates!0 (array!13297 (_ BitVec 32) List!4106) Bool)

(assert (=> b!270834 (= res!134820 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4103))))

(declare-fun b!270835 () Bool)

(assert (=> b!270835 (= e!174415 e!174416)))

(declare-fun res!134829 () Bool)

(assert (=> b!270835 (=> (not res!134829) (not e!174416))))

(declare-datatypes ((SeekEntryResult!1456 0))(
  ( (MissingZero!1456 (index!7994 (_ BitVec 32))) (Found!1456 (index!7995 (_ BitVec 32))) (Intermediate!1456 (undefined!2268 Bool) (index!7996 (_ BitVec 32)) (x!26325 (_ BitVec 32))) (Undefined!1456) (MissingVacant!1456 (index!7997 (_ BitVec 32))) )
))
(declare-fun lt!135708 () SeekEntryResult!1456)

(assert (=> b!270835 (= res!134829 (or (= lt!135708 (MissingZero!1456 i!1267)) (= lt!135708 (MissingVacant!1456 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13297 (_ BitVec 32)) SeekEntryResult!1456)

(assert (=> b!270835 (= lt!135708 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270836 () Bool)

(declare-fun res!134817 () Bool)

(assert (=> b!270836 (=> (not res!134817) (not e!174415))))

(assert (=> b!270836 (= res!134817 (validKeyInArray!0 k!2581))))

(declare-fun b!270837 () Bool)

(declare-fun res!134823 () Bool)

(assert (=> b!270837 (=> (not res!134823) (not e!174416))))

(assert (=> b!270837 (= res!134823 (not (= startIndex!26 i!1267)))))

(declare-fun b!270838 () Bool)

(declare-fun res!134826 () Bool)

(assert (=> b!270838 (=> (not res!134826) (not e!174416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13297 (_ BitVec 32)) Bool)

(assert (=> b!270838 (= res!134826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270839 () Bool)

(assert (=> b!270839 (= e!174416 false)))

(declare-fun lt!135709 () Bool)

(assert (=> b!270839 (= lt!135709 (contains!1936 Nil!4103 k!2581))))

(assert (= (and start!26200 res!134825) b!270833))

(assert (= (and b!270833 res!134822) b!270836))

(assert (= (and b!270836 res!134817) b!270834))

(assert (= (and b!270834 res!134820) b!270830))

(assert (= (and b!270830 res!134824) b!270835))

(assert (= (and b!270835 res!134829) b!270838))

(assert (= (and b!270838 res!134826) b!270837))

(assert (= (and b!270837 res!134823) b!270827))

(assert (= (and b!270827 res!134821) b!270831))

(assert (= (and b!270831 res!134818) b!270832))

(assert (= (and b!270832 res!134819) b!270828))

(assert (= (and b!270828 res!134828) b!270829))

(assert (= (and b!270829 res!134827) b!270839))

(declare-fun m!286315 () Bool)

(assert (=> b!270835 m!286315))

(declare-fun m!286317 () Bool)

(assert (=> b!270832 m!286317))

(declare-fun m!286319 () Bool)

(assert (=> b!270834 m!286319))

(declare-fun m!286321 () Bool)

(assert (=> b!270828 m!286321))

(declare-fun m!286323 () Bool)

(assert (=> b!270830 m!286323))

(declare-fun m!286325 () Bool)

(assert (=> b!270836 m!286325))

(declare-fun m!286327 () Bool)

(assert (=> b!270829 m!286327))

(declare-fun m!286329 () Bool)

(assert (=> b!270839 m!286329))

(declare-fun m!286331 () Bool)

(assert (=> b!270838 m!286331))

(declare-fun m!286333 () Bool)

(assert (=> start!26200 m!286333))

(declare-fun m!286335 () Bool)

(assert (=> start!26200 m!286335))

(declare-fun m!286337 () Bool)

(assert (=> b!270827 m!286337))

(assert (=> b!270827 m!286337))

(declare-fun m!286339 () Bool)

(assert (=> b!270827 m!286339))

(push 1)

(assert (not b!270836))

