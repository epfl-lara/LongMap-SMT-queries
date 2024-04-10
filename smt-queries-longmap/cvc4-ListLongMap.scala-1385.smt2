; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27166 () Bool)

(assert start!27166)

(declare-fun b!281067 () Bool)

(declare-fun e!178750 () Bool)

(assert (=> b!281067 (= e!178750 (not true))))

(declare-datatypes ((array!13984 0))(
  ( (array!13985 (arr!6634 (Array (_ BitVec 32) (_ BitVec 64))) (size!6986 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13984)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4442 0))(
  ( (Nil!4439) (Cons!4438 (h!5108 (_ BitVec 64)) (t!9524 List!4442)) )
))
(declare-fun arrayNoDuplicates!0 (array!13984 (_ BitVec 32) List!4442) Bool)

(assert (=> b!281067 (arrayNoDuplicates!0 (array!13985 (store (arr!6634 a!3325) i!1267 k!2581) (size!6986 a!3325)) #b00000000000000000000000000000000 Nil!4439)))

(declare-datatypes ((Unit!8868 0))(
  ( (Unit!8869) )
))
(declare-fun lt!138967 () Unit!8868)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13984 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4442) Unit!8868)

(assert (=> b!281067 (= lt!138967 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4439))))

(declare-fun b!281068 () Bool)

(declare-fun res!144142 () Bool)

(declare-fun e!178751 () Bool)

(assert (=> b!281068 (=> (not res!144142) (not e!178751))))

(assert (=> b!281068 (= res!144142 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4439))))

(declare-fun b!281069 () Bool)

(declare-fun res!144140 () Bool)

(assert (=> b!281069 (=> (not res!144140) (not e!178750))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281069 (= res!144140 (not (= startIndex!26 i!1267)))))

(declare-fun b!281071 () Bool)

(declare-fun res!144136 () Bool)

(assert (=> b!281071 (=> (not res!144136) (not e!178751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281071 (= res!144136 (validKeyInArray!0 k!2581))))

(declare-fun b!281072 () Bool)

(declare-fun res!144141 () Bool)

(assert (=> b!281072 (=> (not res!144141) (not e!178750))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13984 (_ BitVec 32)) Bool)

(assert (=> b!281072 (= res!144141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281073 () Bool)

(declare-fun res!144139 () Bool)

(assert (=> b!281073 (=> (not res!144139) (not e!178750))))

(assert (=> b!281073 (= res!144139 (validKeyInArray!0 (select (arr!6634 a!3325) startIndex!26)))))

(declare-fun b!281074 () Bool)

(declare-fun res!144137 () Bool)

(assert (=> b!281074 (=> (not res!144137) (not e!178751))))

(assert (=> b!281074 (= res!144137 (and (= (size!6986 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6986 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6986 a!3325))))))

(declare-fun b!281075 () Bool)

(declare-fun res!144138 () Bool)

(assert (=> b!281075 (=> (not res!144138) (not e!178751))))

(declare-fun arrayContainsKey!0 (array!13984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281075 (= res!144138 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281070 () Bool)

(assert (=> b!281070 (= e!178751 e!178750)))

(declare-fun res!144144 () Bool)

(assert (=> b!281070 (=> (not res!144144) (not e!178750))))

(declare-datatypes ((SeekEntryResult!1792 0))(
  ( (MissingZero!1792 (index!9338 (_ BitVec 32))) (Found!1792 (index!9339 (_ BitVec 32))) (Intermediate!1792 (undefined!2604 Bool) (index!9340 (_ BitVec 32)) (x!27566 (_ BitVec 32))) (Undefined!1792) (MissingVacant!1792 (index!9341 (_ BitVec 32))) )
))
(declare-fun lt!138966 () SeekEntryResult!1792)

(assert (=> b!281070 (= res!144144 (or (= lt!138966 (MissingZero!1792 i!1267)) (= lt!138966 (MissingVacant!1792 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13984 (_ BitVec 32)) SeekEntryResult!1792)

(assert (=> b!281070 (= lt!138966 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!144143 () Bool)

(assert (=> start!27166 (=> (not res!144143) (not e!178751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27166 (= res!144143 (validMask!0 mask!3868))))

(assert (=> start!27166 e!178751))

(declare-fun array_inv!4597 (array!13984) Bool)

(assert (=> start!27166 (array_inv!4597 a!3325)))

(assert (=> start!27166 true))

(assert (= (and start!27166 res!144143) b!281074))

(assert (= (and b!281074 res!144137) b!281071))

(assert (= (and b!281071 res!144136) b!281068))

(assert (= (and b!281068 res!144142) b!281075))

(assert (= (and b!281075 res!144138) b!281070))

(assert (= (and b!281070 res!144144) b!281072))

(assert (= (and b!281072 res!144141) b!281069))

(assert (= (and b!281069 res!144140) b!281073))

(assert (= (and b!281073 res!144139) b!281067))

(declare-fun m!295431 () Bool)

(assert (=> b!281073 m!295431))

(assert (=> b!281073 m!295431))

(declare-fun m!295433 () Bool)

(assert (=> b!281073 m!295433))

(declare-fun m!295435 () Bool)

(assert (=> b!281071 m!295435))

(declare-fun m!295437 () Bool)

(assert (=> b!281075 m!295437))

(declare-fun m!295439 () Bool)

(assert (=> b!281068 m!295439))

(declare-fun m!295441 () Bool)

(assert (=> b!281070 m!295441))

(declare-fun m!295443 () Bool)

(assert (=> b!281067 m!295443))

(declare-fun m!295445 () Bool)

(assert (=> b!281067 m!295445))

(declare-fun m!295447 () Bool)

(assert (=> b!281067 m!295447))

(declare-fun m!295449 () Bool)

(assert (=> b!281072 m!295449))

(declare-fun m!295451 () Bool)

(assert (=> start!27166 m!295451))

(declare-fun m!295453 () Bool)

(assert (=> start!27166 m!295453))

(push 1)

(assert (not b!281073))

(assert (not b!281072))

(assert (not b!281068))

(assert (not b!281071))

(assert (not b!281075))

(assert (not start!27166))

(assert (not b!281067))

(assert (not b!281070))

(check-sat)

(pop 1)

