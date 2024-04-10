; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27144 () Bool)

(assert start!27144)

(declare-fun b!280770 () Bool)

(declare-fun e!178652 () Bool)

(assert (=> b!280770 (= e!178652 (not true))))

(declare-datatypes ((array!13962 0))(
  ( (array!13963 (arr!6623 (Array (_ BitVec 32) (_ BitVec 64))) (size!6975 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13962)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4431 0))(
  ( (Nil!4428) (Cons!4427 (h!5097 (_ BitVec 64)) (t!9513 List!4431)) )
))
(declare-fun arrayNoDuplicates!0 (array!13962 (_ BitVec 32) List!4431) Bool)

(assert (=> b!280770 (arrayNoDuplicates!0 (array!13963 (store (arr!6623 a!3325) i!1267 k!2581) (size!6975 a!3325)) #b00000000000000000000000000000000 Nil!4428)))

(declare-datatypes ((Unit!8846 0))(
  ( (Unit!8847) )
))
(declare-fun lt!138901 () Unit!8846)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13962 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4431) Unit!8846)

(assert (=> b!280770 (= lt!138901 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4428))))

(declare-fun b!280771 () Bool)

(declare-fun res!143839 () Bool)

(assert (=> b!280771 (=> (not res!143839) (not e!178652))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280771 (= res!143839 (not (= startIndex!26 i!1267)))))

(declare-fun b!280772 () Bool)

(declare-fun res!143846 () Bool)

(declare-fun e!178650 () Bool)

(assert (=> b!280772 (=> (not res!143846) (not e!178650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280772 (= res!143846 (validKeyInArray!0 k!2581))))

(declare-fun b!280773 () Bool)

(declare-fun res!143843 () Bool)

(assert (=> b!280773 (=> (not res!143843) (not e!178652))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13962 (_ BitVec 32)) Bool)

(assert (=> b!280773 (= res!143843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280774 () Bool)

(assert (=> b!280774 (= e!178650 e!178652)))

(declare-fun res!143841 () Bool)

(assert (=> b!280774 (=> (not res!143841) (not e!178652))))

(declare-datatypes ((SeekEntryResult!1781 0))(
  ( (MissingZero!1781 (index!9294 (_ BitVec 32))) (Found!1781 (index!9295 (_ BitVec 32))) (Intermediate!1781 (undefined!2593 Bool) (index!9296 (_ BitVec 32)) (x!27531 (_ BitVec 32))) (Undefined!1781) (MissingVacant!1781 (index!9297 (_ BitVec 32))) )
))
(declare-fun lt!138900 () SeekEntryResult!1781)

(assert (=> b!280774 (= res!143841 (or (= lt!138900 (MissingZero!1781 i!1267)) (= lt!138900 (MissingVacant!1781 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13962 (_ BitVec 32)) SeekEntryResult!1781)

(assert (=> b!280774 (= lt!138900 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280775 () Bool)

(declare-fun res!143847 () Bool)

(assert (=> b!280775 (=> (not res!143847) (not e!178650))))

(assert (=> b!280775 (= res!143847 (and (= (size!6975 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6975 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6975 a!3325))))))

(declare-fun b!280776 () Bool)

(declare-fun res!143840 () Bool)

(assert (=> b!280776 (=> (not res!143840) (not e!178652))))

(assert (=> b!280776 (= res!143840 (validKeyInArray!0 (select (arr!6623 a!3325) startIndex!26)))))

(declare-fun res!143844 () Bool)

(assert (=> start!27144 (=> (not res!143844) (not e!178650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27144 (= res!143844 (validMask!0 mask!3868))))

(assert (=> start!27144 e!178650))

(declare-fun array_inv!4586 (array!13962) Bool)

(assert (=> start!27144 (array_inv!4586 a!3325)))

(assert (=> start!27144 true))

(declare-fun b!280777 () Bool)

(declare-fun res!143845 () Bool)

(assert (=> b!280777 (=> (not res!143845) (not e!178650))))

(assert (=> b!280777 (= res!143845 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4428))))

(declare-fun b!280778 () Bool)

(declare-fun res!143842 () Bool)

(assert (=> b!280778 (=> (not res!143842) (not e!178650))))

(declare-fun arrayContainsKey!0 (array!13962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280778 (= res!143842 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27144 res!143844) b!280775))

(assert (= (and b!280775 res!143847) b!280772))

(assert (= (and b!280772 res!143846) b!280777))

(assert (= (and b!280777 res!143845) b!280778))

(assert (= (and b!280778 res!143842) b!280774))

(assert (= (and b!280774 res!143841) b!280773))

(assert (= (and b!280773 res!143843) b!280771))

(assert (= (and b!280771 res!143839) b!280776))

(assert (= (and b!280776 res!143840) b!280770))

(declare-fun m!295167 () Bool)

(assert (=> b!280770 m!295167))

(declare-fun m!295169 () Bool)

(assert (=> b!280770 m!295169))

(declare-fun m!295171 () Bool)

(assert (=> b!280770 m!295171))

(declare-fun m!295173 () Bool)

(assert (=> b!280776 m!295173))

(assert (=> b!280776 m!295173))

(declare-fun m!295175 () Bool)

(assert (=> b!280776 m!295175))

(declare-fun m!295177 () Bool)

(assert (=> b!280772 m!295177))

(declare-fun m!295179 () Bool)

(assert (=> b!280773 m!295179))

(declare-fun m!295181 () Bool)

(assert (=> start!27144 m!295181))

(declare-fun m!295183 () Bool)

(assert (=> start!27144 m!295183))

(declare-fun m!295185 () Bool)

(assert (=> b!280777 m!295185))

(declare-fun m!295187 () Bool)

(assert (=> b!280778 m!295187))

(declare-fun m!295189 () Bool)

(assert (=> b!280774 m!295189))

(push 1)

