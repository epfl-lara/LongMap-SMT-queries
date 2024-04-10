; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26062 () Bool)

(assert start!26062)

(declare-fun b!268827 () Bool)

(declare-fun res!133110 () Bool)

(declare-fun e!173579 () Bool)

(assert (=> b!268827 (=> (not res!133110) (not e!173579))))

(declare-datatypes ((array!13159 0))(
  ( (array!13160 (arr!6229 (Array (_ BitVec 32) (_ BitVec 64))) (size!6581 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13159)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268827 (= res!133110 (and (= (size!6581 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6581 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6581 a!3325))))))

(declare-fun b!268829 () Bool)

(declare-fun res!133109 () Bool)

(assert (=> b!268829 (=> (not res!133109) (not e!173579))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268829 (= res!133109 (validKeyInArray!0 k!2581))))

(declare-fun b!268830 () Bool)

(declare-fun res!133108 () Bool)

(assert (=> b!268830 (=> (not res!133108) (not e!173579))))

(declare-datatypes ((List!4037 0))(
  ( (Nil!4034) (Cons!4033 (h!4700 (_ BitVec 64)) (t!9119 List!4037)) )
))
(declare-fun arrayNoDuplicates!0 (array!13159 (_ BitVec 32) List!4037) Bool)

(assert (=> b!268830 (= res!133108 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4034))))

(declare-fun b!268828 () Bool)

(declare-fun e!173578 () Bool)

(assert (=> b!268828 (= e!173579 e!173578)))

(declare-fun res!133106 () Bool)

(assert (=> b!268828 (=> (not res!133106) (not e!173578))))

(declare-datatypes ((SeekEntryResult!1387 0))(
  ( (MissingZero!1387 (index!7718 (_ BitVec 32))) (Found!1387 (index!7719 (_ BitVec 32))) (Intermediate!1387 (undefined!2199 Bool) (index!7720 (_ BitVec 32)) (x!26072 (_ BitVec 32))) (Undefined!1387) (MissingVacant!1387 (index!7721 (_ BitVec 32))) )
))
(declare-fun lt!135006 () SeekEntryResult!1387)

(assert (=> b!268828 (= res!133106 (or (= lt!135006 (MissingZero!1387 i!1267)) (= lt!135006 (MissingVacant!1387 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13159 (_ BitVec 32)) SeekEntryResult!1387)

(assert (=> b!268828 (= lt!135006 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!133105 () Bool)

(assert (=> start!26062 (=> (not res!133105) (not e!173579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26062 (= res!133105 (validMask!0 mask!3868))))

(assert (=> start!26062 e!173579))

(declare-fun array_inv!4192 (array!13159) Bool)

(assert (=> start!26062 (array_inv!4192 a!3325)))

(assert (=> start!26062 true))

(declare-fun b!268831 () Bool)

(assert (=> b!268831 (= e!173578 false)))

(declare-fun lt!135007 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13159 (_ BitVec 32)) Bool)

(assert (=> b!268831 (= lt!135007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268832 () Bool)

(declare-fun res!133107 () Bool)

(assert (=> b!268832 (=> (not res!133107) (not e!173579))))

(declare-fun arrayContainsKey!0 (array!13159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268832 (= res!133107 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26062 res!133105) b!268827))

(assert (= (and b!268827 res!133110) b!268829))

(assert (= (and b!268829 res!133109) b!268830))

(assert (= (and b!268830 res!133108) b!268832))

(assert (= (and b!268832 res!133107) b!268828))

(assert (= (and b!268828 res!133106) b!268831))

(declare-fun m!284869 () Bool)

(assert (=> b!268831 m!284869))

(declare-fun m!284871 () Bool)

(assert (=> b!268829 m!284871))

(declare-fun m!284873 () Bool)

(assert (=> b!268828 m!284873))

(declare-fun m!284875 () Bool)

(assert (=> b!268832 m!284875))

(declare-fun m!284877 () Bool)

(assert (=> b!268830 m!284877))

(declare-fun m!284879 () Bool)

(assert (=> start!26062 m!284879))

(declare-fun m!284881 () Bool)

(assert (=> start!26062 m!284881))

(push 1)

(assert (not b!268831))

(assert (not start!26062))

(assert (not b!268829))

