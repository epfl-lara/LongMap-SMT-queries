; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26326 () Bool)

(assert start!26326)

(declare-fun b!272820 () Bool)

(declare-fun res!136815 () Bool)

(declare-fun e!174983 () Bool)

(assert (=> b!272820 (=> (not res!136815) (not e!174983))))

(declare-datatypes ((array!13423 0))(
  ( (array!13424 (arr!6361 (Array (_ BitVec 32) (_ BitVec 64))) (size!6713 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13423)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272820 (= res!136815 (validKeyInArray!0 (select (arr!6361 a!3325) startIndex!26)))))

(declare-fun b!272821 () Bool)

(declare-fun res!136811 () Bool)

(declare-fun e!174981 () Bool)

(assert (=> b!272821 (=> (not res!136811) (not e!174981))))

(declare-datatypes ((List!4169 0))(
  ( (Nil!4166) (Cons!4165 (h!4832 (_ BitVec 64)) (t!9251 List!4169)) )
))
(declare-fun arrayNoDuplicates!0 (array!13423 (_ BitVec 32) List!4169) Bool)

(assert (=> b!272821 (= res!136811 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4166))))

(declare-fun res!136817 () Bool)

(assert (=> start!26326 (=> (not res!136817) (not e!174981))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26326 (= res!136817 (validMask!0 mask!3868))))

(assert (=> start!26326 e!174981))

(declare-fun array_inv!4324 (array!13423) Bool)

(assert (=> start!26326 (array_inv!4324 a!3325)))

(assert (=> start!26326 true))

(declare-fun b!272822 () Bool)

(assert (=> b!272822 (= e!174983 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!272822 (arrayNoDuplicates!0 (array!13424 (store (arr!6361 a!3325) i!1267 k!2581) (size!6713 a!3325)) #b00000000000000000000000000000000 Nil!4166)))

(declare-datatypes ((Unit!8525 0))(
  ( (Unit!8526) )
))
(declare-fun lt!136087 () Unit!8525)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13423 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4169) Unit!8525)

(assert (=> b!272822 (= lt!136087 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4166))))

(declare-fun b!272823 () Bool)

(declare-fun res!136810 () Bool)

(assert (=> b!272823 (=> (not res!136810) (not e!174981))))

(assert (=> b!272823 (= res!136810 (and (= (size!6713 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6713 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6713 a!3325))))))

(declare-fun b!272824 () Bool)

(declare-fun res!136812 () Bool)

(assert (=> b!272824 (=> (not res!136812) (not e!174981))))

(assert (=> b!272824 (= res!136812 (validKeyInArray!0 k!2581))))

(declare-fun b!272825 () Bool)

(declare-fun res!136814 () Bool)

(assert (=> b!272825 (=> (not res!136814) (not e!174983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13423 (_ BitVec 32)) Bool)

(assert (=> b!272825 (= res!136814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272826 () Bool)

(declare-fun res!136816 () Bool)

(assert (=> b!272826 (=> (not res!136816) (not e!174983))))

(assert (=> b!272826 (= res!136816 (not (= startIndex!26 i!1267)))))

(declare-fun b!272827 () Bool)

(assert (=> b!272827 (= e!174981 e!174983)))

(declare-fun res!136818 () Bool)

(assert (=> b!272827 (=> (not res!136818) (not e!174983))))

(declare-datatypes ((SeekEntryResult!1519 0))(
  ( (MissingZero!1519 (index!8246 (_ BitVec 32))) (Found!1519 (index!8247 (_ BitVec 32))) (Intermediate!1519 (undefined!2331 Bool) (index!8248 (_ BitVec 32)) (x!26556 (_ BitVec 32))) (Undefined!1519) (MissingVacant!1519 (index!8249 (_ BitVec 32))) )
))
(declare-fun lt!136086 () SeekEntryResult!1519)

(assert (=> b!272827 (= res!136818 (or (= lt!136086 (MissingZero!1519 i!1267)) (= lt!136086 (MissingVacant!1519 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13423 (_ BitVec 32)) SeekEntryResult!1519)

(assert (=> b!272827 (= lt!136086 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272828 () Bool)

(declare-fun res!136813 () Bool)

(assert (=> b!272828 (=> (not res!136813) (not e!174981))))

(declare-fun arrayContainsKey!0 (array!13423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272828 (= res!136813 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26326 res!136817) b!272823))

(assert (= (and b!272823 res!136810) b!272824))

(assert (= (and b!272824 res!136812) b!272821))

(assert (= (and b!272821 res!136811) b!272828))

(assert (= (and b!272828 res!136813) b!272827))

(assert (= (and b!272827 res!136818) b!272825))

(assert (= (and b!272825 res!136814) b!272826))

(assert (= (and b!272826 res!136816) b!272820))

(assert (= (and b!272820 res!136815) b!272822))

(declare-fun m!287877 () Bool)

(assert (=> b!272824 m!287877))

(declare-fun m!287879 () Bool)

(assert (=> b!272828 m!287879))

(declare-fun m!287881 () Bool)

(assert (=> start!26326 m!287881))

(declare-fun m!287883 () Bool)

(assert (=> start!26326 m!287883))

(declare-fun m!287885 () Bool)

(assert (=> b!272827 m!287885))

(declare-fun m!287887 () Bool)

(assert (=> b!272822 m!287887))

(declare-fun m!287889 () Bool)

(assert (=> b!272822 m!287889))

(declare-fun m!287891 () Bool)

(assert (=> b!272822 m!287891))

(declare-fun m!287893 () Bool)

(assert (=> b!272825 m!287893))

(declare-fun m!287895 () Bool)

(assert (=> b!272821 m!287895))

(declare-fun m!287897 () Bool)

(assert (=> b!272820 m!287897))

(assert (=> b!272820 m!287897))

(declare-fun m!287899 () Bool)

(assert (=> b!272820 m!287899))

(push 1)

(assert (not b!272827))

(assert (not b!272822))

