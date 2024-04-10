; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27174 () Bool)

(assert start!27174)

(declare-fun b!281175 () Bool)

(declare-fun res!144250 () Bool)

(declare-fun e!178785 () Bool)

(assert (=> b!281175 (=> (not res!144250) (not e!178785))))

(declare-datatypes ((array!13992 0))(
  ( (array!13993 (arr!6638 (Array (_ BitVec 32) (_ BitVec 64))) (size!6990 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13992)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281175 (= res!144250 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!144251 () Bool)

(assert (=> start!27174 (=> (not res!144251) (not e!178785))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27174 (= res!144251 (validMask!0 mask!3868))))

(assert (=> start!27174 e!178785))

(declare-fun array_inv!4601 (array!13992) Bool)

(assert (=> start!27174 (array_inv!4601 a!3325)))

(assert (=> start!27174 true))

(declare-fun b!281176 () Bool)

(declare-fun res!144248 () Bool)

(assert (=> b!281176 (=> (not res!144248) (not e!178785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281176 (= res!144248 (validKeyInArray!0 k!2581))))

(declare-fun b!281177 () Bool)

(declare-fun e!178786 () Bool)

(assert (=> b!281177 (= e!178785 e!178786)))

(declare-fun res!144249 () Bool)

(assert (=> b!281177 (=> (not res!144249) (not e!178786))))

(declare-datatypes ((SeekEntryResult!1796 0))(
  ( (MissingZero!1796 (index!9354 (_ BitVec 32))) (Found!1796 (index!9355 (_ BitVec 32))) (Intermediate!1796 (undefined!2608 Bool) (index!9356 (_ BitVec 32)) (x!27586 (_ BitVec 32))) (Undefined!1796) (MissingVacant!1796 (index!9357 (_ BitVec 32))) )
))
(declare-fun lt!138990 () SeekEntryResult!1796)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281177 (= res!144249 (or (= lt!138990 (MissingZero!1796 i!1267)) (= lt!138990 (MissingVacant!1796 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13992 (_ BitVec 32)) SeekEntryResult!1796)

(assert (=> b!281177 (= lt!138990 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281178 () Bool)

(declare-fun res!144246 () Bool)

(assert (=> b!281178 (=> (not res!144246) (not e!178786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13992 (_ BitVec 32)) Bool)

(assert (=> b!281178 (= res!144246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281179 () Bool)

(declare-fun res!144247 () Bool)

(assert (=> b!281179 (=> (not res!144247) (not e!178785))))

(declare-datatypes ((List!4446 0))(
  ( (Nil!4443) (Cons!4442 (h!5112 (_ BitVec 64)) (t!9528 List!4446)) )
))
(declare-fun arrayNoDuplicates!0 (array!13992 (_ BitVec 32) List!4446) Bool)

(assert (=> b!281179 (= res!144247 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4443))))

(declare-fun b!281180 () Bool)

(declare-fun res!144244 () Bool)

(assert (=> b!281180 (=> (not res!144244) (not e!178785))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281180 (= res!144244 (and (= (size!6990 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6990 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6990 a!3325))))))

(declare-fun b!281181 () Bool)

(declare-fun res!144252 () Bool)

(assert (=> b!281181 (=> (not res!144252) (not e!178786))))

(assert (=> b!281181 (= res!144252 (validKeyInArray!0 (select (arr!6638 a!3325) startIndex!26)))))

(declare-fun b!281182 () Bool)

(assert (=> b!281182 (= e!178786 (not true))))

(assert (=> b!281182 (arrayNoDuplicates!0 (array!13993 (store (arr!6638 a!3325) i!1267 k!2581) (size!6990 a!3325)) #b00000000000000000000000000000000 Nil!4443)))

(declare-datatypes ((Unit!8876 0))(
  ( (Unit!8877) )
))
(declare-fun lt!138991 () Unit!8876)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13992 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4446) Unit!8876)

(assert (=> b!281182 (= lt!138991 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4443))))

(declare-fun b!281183 () Bool)

(declare-fun res!144245 () Bool)

(assert (=> b!281183 (=> (not res!144245) (not e!178786))))

(assert (=> b!281183 (= res!144245 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27174 res!144251) b!281180))

(assert (= (and b!281180 res!144244) b!281176))

(assert (= (and b!281176 res!144248) b!281179))

(assert (= (and b!281179 res!144247) b!281175))

(assert (= (and b!281175 res!144250) b!281177))

(assert (= (and b!281177 res!144249) b!281178))

(assert (= (and b!281178 res!144246) b!281183))

(assert (= (and b!281183 res!144245) b!281181))

(assert (= (and b!281181 res!144252) b!281182))

(declare-fun m!295527 () Bool)

(assert (=> b!281178 m!295527))

(declare-fun m!295529 () Bool)

(assert (=> b!281177 m!295529))

(declare-fun m!295531 () Bool)

(assert (=> b!281179 m!295531))

(declare-fun m!295533 () Bool)

(assert (=> b!281182 m!295533))

(declare-fun m!295535 () Bool)

(assert (=> b!281182 m!295535))

(declare-fun m!295537 () Bool)

(assert (=> b!281182 m!295537))

(declare-fun m!295539 () Bool)

(assert (=> start!27174 m!295539))

(declare-fun m!295541 () Bool)

(assert (=> start!27174 m!295541))

(declare-fun m!295543 () Bool)

(assert (=> b!281181 m!295543))

(assert (=> b!281181 m!295543))

(declare-fun m!295545 () Bool)

(assert (=> b!281181 m!295545))

(declare-fun m!295547 () Bool)

(assert (=> b!281176 m!295547))

(declare-fun m!295549 () Bool)

(assert (=> b!281175 m!295549))

(push 1)

