; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27582 () Bool)

(assert start!27582)

(declare-fun b!284987 () Bool)

(declare-fun res!147504 () Bool)

(declare-fun e!180689 () Bool)

(assert (=> b!284987 (=> (not res!147504) (not e!180689))))

(declare-datatypes ((array!14232 0))(
  ( (array!14233 (arr!6755 (Array (_ BitVec 32) (_ BitVec 64))) (size!7107 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14232)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284987 (= res!147504 (and (= (size!7107 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7107 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7107 a!3325))))))

(declare-fun res!147498 () Bool)

(assert (=> start!27582 (=> (not res!147498) (not e!180689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27582 (= res!147498 (validMask!0 mask!3868))))

(assert (=> start!27582 e!180689))

(declare-fun array_inv!4718 (array!14232) Bool)

(assert (=> start!27582 (array_inv!4718 a!3325)))

(assert (=> start!27582 true))

(declare-fun b!284988 () Bool)

(declare-fun res!147501 () Bool)

(assert (=> b!284988 (=> (not res!147501) (not e!180689))))

(declare-datatypes ((List!4563 0))(
  ( (Nil!4560) (Cons!4559 (h!5232 (_ BitVec 64)) (t!9645 List!4563)) )
))
(declare-fun arrayNoDuplicates!0 (array!14232 (_ BitVec 32) List!4563) Bool)

(assert (=> b!284988 (= res!147501 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4560))))

(declare-fun b!284989 () Bool)

(declare-fun res!147502 () Bool)

(assert (=> b!284989 (=> (not res!147502) (not e!180689))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284989 (= res!147502 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284990 () Bool)

(declare-fun res!147503 () Bool)

(declare-fun e!180687 () Bool)

(assert (=> b!284990 (=> (not res!147503) (not e!180687))))

(assert (=> b!284990 (= res!147503 (not (= startIndex!26 i!1267)))))

(declare-fun b!284991 () Bool)

(declare-fun res!147495 () Bool)

(assert (=> b!284991 (=> (not res!147495) (not e!180689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284991 (= res!147495 (validKeyInArray!0 k!2581))))

(declare-fun b!284992 () Bool)

(declare-fun res!147500 () Bool)

(assert (=> b!284992 (=> (not res!147500) (not e!180687))))

(assert (=> b!284992 (= res!147500 (not (validKeyInArray!0 (select (arr!6755 a!3325) startIndex!26))))))

(declare-fun b!284993 () Bool)

(assert (=> b!284993 (= e!180687 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14232 (_ BitVec 32)) Bool)

(assert (=> b!284993 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14233 (store (arr!6755 a!3325) i!1267 k!2581) (size!7107 a!3325)) mask!3868)))

(declare-datatypes ((Unit!9032 0))(
  ( (Unit!9033) )
))
(declare-fun lt!140665 () Unit!9032)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9032)

(assert (=> b!284993 (= lt!140665 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!284994 () Bool)

(declare-fun res!147499 () Bool)

(assert (=> b!284994 (=> (not res!147499) (not e!180687))))

(assert (=> b!284994 (= res!147499 (and (bvslt startIndex!26 (bvsub (size!7107 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!284995 () Bool)

(declare-fun res!147496 () Bool)

(assert (=> b!284995 (=> (not res!147496) (not e!180687))))

(assert (=> b!284995 (= res!147496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284996 () Bool)

(assert (=> b!284996 (= e!180689 e!180687)))

(declare-fun res!147497 () Bool)

(assert (=> b!284996 (=> (not res!147497) (not e!180687))))

(declare-datatypes ((SeekEntryResult!1913 0))(
  ( (MissingZero!1913 (index!9822 (_ BitVec 32))) (Found!1913 (index!9823 (_ BitVec 32))) (Intermediate!1913 (undefined!2725 Bool) (index!9824 (_ BitVec 32)) (x!28024 (_ BitVec 32))) (Undefined!1913) (MissingVacant!1913 (index!9825 (_ BitVec 32))) )
))
(declare-fun lt!140664 () SeekEntryResult!1913)

(assert (=> b!284996 (= res!147497 (or (= lt!140664 (MissingZero!1913 i!1267)) (= lt!140664 (MissingVacant!1913 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14232 (_ BitVec 32)) SeekEntryResult!1913)

(assert (=> b!284996 (= lt!140664 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27582 res!147498) b!284987))

(assert (= (and b!284987 res!147504) b!284991))

(assert (= (and b!284991 res!147495) b!284988))

(assert (= (and b!284988 res!147501) b!284989))

(assert (= (and b!284989 res!147502) b!284996))

(assert (= (and b!284996 res!147497) b!284995))

(assert (= (and b!284995 res!147496) b!284990))

(assert (= (and b!284990 res!147503) b!284992))

(assert (= (and b!284992 res!147500) b!284994))

(assert (= (and b!284994 res!147499) b!284993))

(declare-fun m!299865 () Bool)

(assert (=> start!27582 m!299865))

(declare-fun m!299867 () Bool)

(assert (=> start!27582 m!299867))

(declare-fun m!299869 () Bool)

(assert (=> b!284993 m!299869))

(declare-fun m!299871 () Bool)

(assert (=> b!284993 m!299871))

(declare-fun m!299873 () Bool)

(assert (=> b!284993 m!299873))

(declare-fun m!299875 () Bool)

(assert (=> b!284989 m!299875))

(declare-fun m!299877 () Bool)

(assert (=> b!284988 m!299877))

(declare-fun m!299879 () Bool)

(assert (=> b!284992 m!299879))

(assert (=> b!284992 m!299879))

(declare-fun m!299881 () Bool)

(assert (=> b!284992 m!299881))

(declare-fun m!299883 () Bool)

(assert (=> b!284996 m!299883))

(declare-fun m!299885 () Bool)

(assert (=> b!284991 m!299885))

(declare-fun m!299887 () Bool)

(assert (=> b!284995 m!299887))

(push 1)

