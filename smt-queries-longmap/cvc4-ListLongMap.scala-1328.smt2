; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26530 () Bool)

(assert start!26530)

(declare-fun res!139365 () Bool)

(declare-fun e!176160 () Bool)

(assert (=> start!26530 (=> (not res!139365) (not e!176160))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26530 (= res!139365 (validMask!0 mask!3868))))

(assert (=> start!26530 e!176160))

(declare-datatypes ((array!13627 0))(
  ( (array!13628 (arr!6463 (Array (_ BitVec 32) (_ BitVec 64))) (size!6815 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13627)

(declare-fun array_inv!4426 (array!13627) Bool)

(assert (=> start!26530 (array_inv!4426 a!3325)))

(assert (=> start!26530 true))

(declare-fun b!275370 () Bool)

(declare-fun res!139360 () Bool)

(assert (=> b!275370 (=> (not res!139360) (not e!176160))))

(declare-datatypes ((List!4271 0))(
  ( (Nil!4268) (Cons!4267 (h!4934 (_ BitVec 64)) (t!9353 List!4271)) )
))
(declare-fun arrayNoDuplicates!0 (array!13627 (_ BitVec 32) List!4271) Bool)

(assert (=> b!275370 (= res!139360 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4268))))

(declare-fun b!275371 () Bool)

(declare-fun res!139363 () Bool)

(assert (=> b!275371 (=> (not res!139363) (not e!176160))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275371 (= res!139363 (validKeyInArray!0 k!2581))))

(declare-fun b!275372 () Bool)

(declare-fun e!176161 () Bool)

(assert (=> b!275372 (= e!176160 e!176161)))

(declare-fun res!139362 () Bool)

(assert (=> b!275372 (=> (not res!139362) (not e!176161))))

(declare-datatypes ((SeekEntryResult!1621 0))(
  ( (MissingZero!1621 (index!8654 (_ BitVec 32))) (Found!1621 (index!8655 (_ BitVec 32))) (Intermediate!1621 (undefined!2433 Bool) (index!8656 (_ BitVec 32)) (x!26930 (_ BitVec 32))) (Undefined!1621) (MissingVacant!1621 (index!8657 (_ BitVec 32))) )
))
(declare-fun lt!137365 () SeekEntryResult!1621)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275372 (= res!139362 (or (= lt!137365 (MissingZero!1621 i!1267)) (= lt!137365 (MissingVacant!1621 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13627 (_ BitVec 32)) SeekEntryResult!1621)

(assert (=> b!275372 (= lt!137365 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275373 () Bool)

(declare-fun res!139364 () Bool)

(assert (=> b!275373 (=> (not res!139364) (not e!176160))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275373 (= res!139364 (and (= (size!6815 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6815 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6815 a!3325))))))

(declare-fun b!275374 () Bool)

(assert (=> b!275374 (= e!176161 false)))

(declare-fun lt!137364 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13627 (_ BitVec 32)) Bool)

(assert (=> b!275374 (= lt!137364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275375 () Bool)

(declare-fun res!139361 () Bool)

(assert (=> b!275375 (=> (not res!139361) (not e!176160))))

(declare-fun arrayContainsKey!0 (array!13627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275375 (= res!139361 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26530 res!139365) b!275373))

(assert (= (and b!275373 res!139364) b!275371))

(assert (= (and b!275371 res!139363) b!275370))

(assert (= (and b!275370 res!139360) b!275375))

(assert (= (and b!275375 res!139361) b!275372))

(assert (= (and b!275372 res!139362) b!275374))

(declare-fun m!290953 () Bool)

(assert (=> b!275374 m!290953))

(declare-fun m!290955 () Bool)

(assert (=> b!275375 m!290955))

(declare-fun m!290957 () Bool)

(assert (=> b!275371 m!290957))

(declare-fun m!290959 () Bool)

(assert (=> start!26530 m!290959))

(declare-fun m!290961 () Bool)

(assert (=> start!26530 m!290961))

(declare-fun m!290963 () Bool)

(assert (=> b!275370 m!290963))

(declare-fun m!290965 () Bool)

(assert (=> b!275372 m!290965))

(push 1)

(assert (not start!26530))

(assert (not b!275375))

(assert (not b!275370))

(assert (not b!275372))

(assert (not b!275371))

(assert (not b!275374))

(check-sat)

(pop 1)

