; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26482 () Bool)

(assert start!26482)

(declare-fun b!274938 () Bool)

(declare-fun res!138933 () Bool)

(declare-fun e!175946 () Bool)

(assert (=> b!274938 (=> (not res!138933) (not e!175946))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274938 (= res!138933 (validKeyInArray!0 k!2581))))

(declare-fun res!138931 () Bool)

(assert (=> start!26482 (=> (not res!138931) (not e!175946))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26482 (= res!138931 (validMask!0 mask!3868))))

(assert (=> start!26482 e!175946))

(declare-datatypes ((array!13579 0))(
  ( (array!13580 (arr!6439 (Array (_ BitVec 32) (_ BitVec 64))) (size!6791 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13579)

(declare-fun array_inv!4402 (array!13579) Bool)

(assert (=> start!26482 (array_inv!4402 a!3325)))

(assert (=> start!26482 true))

(declare-fun b!274939 () Bool)

(declare-fun res!138929 () Bool)

(assert (=> b!274939 (=> (not res!138929) (not e!175946))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274939 (= res!138929 (and (= (size!6791 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6791 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6791 a!3325))))))

(declare-fun b!274940 () Bool)

(declare-fun res!138928 () Bool)

(assert (=> b!274940 (=> (not res!138928) (not e!175946))))

(declare-datatypes ((List!4247 0))(
  ( (Nil!4244) (Cons!4243 (h!4910 (_ BitVec 64)) (t!9329 List!4247)) )
))
(declare-fun arrayNoDuplicates!0 (array!13579 (_ BitVec 32) List!4247) Bool)

(assert (=> b!274940 (= res!138928 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4244))))

(declare-fun b!274941 () Bool)

(declare-fun e!175944 () Bool)

(assert (=> b!274941 (= e!175946 e!175944)))

(declare-fun res!138932 () Bool)

(assert (=> b!274941 (=> (not res!138932) (not e!175944))))

(declare-datatypes ((SeekEntryResult!1597 0))(
  ( (MissingZero!1597 (index!8558 (_ BitVec 32))) (Found!1597 (index!8559 (_ BitVec 32))) (Intermediate!1597 (undefined!2409 Bool) (index!8560 (_ BitVec 32)) (x!26842 (_ BitVec 32))) (Undefined!1597) (MissingVacant!1597 (index!8561 (_ BitVec 32))) )
))
(declare-fun lt!137221 () SeekEntryResult!1597)

(assert (=> b!274941 (= res!138932 (or (= lt!137221 (MissingZero!1597 i!1267)) (= lt!137221 (MissingVacant!1597 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13579 (_ BitVec 32)) SeekEntryResult!1597)

(assert (=> b!274941 (= lt!137221 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274942 () Bool)

(assert (=> b!274942 (= e!175944 false)))

(declare-fun lt!137220 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13579 (_ BitVec 32)) Bool)

(assert (=> b!274942 (= lt!137220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274943 () Bool)

(declare-fun res!138930 () Bool)

(assert (=> b!274943 (=> (not res!138930) (not e!175946))))

(declare-fun arrayContainsKey!0 (array!13579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274943 (= res!138930 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26482 res!138931) b!274939))

(assert (= (and b!274939 res!138929) b!274938))

(assert (= (and b!274938 res!138933) b!274940))

(assert (= (and b!274940 res!138928) b!274943))

(assert (= (and b!274943 res!138930) b!274941))

(assert (= (and b!274941 res!138932) b!274942))

(declare-fun m!290617 () Bool)

(assert (=> b!274940 m!290617))

(declare-fun m!290619 () Bool)

(assert (=> b!274941 m!290619))

(declare-fun m!290621 () Bool)

(assert (=> b!274938 m!290621))

(declare-fun m!290623 () Bool)

(assert (=> start!26482 m!290623))

(declare-fun m!290625 () Bool)

(assert (=> start!26482 m!290625))

(declare-fun m!290627 () Bool)

(assert (=> b!274943 m!290627))

(declare-fun m!290629 () Bool)

(assert (=> b!274942 m!290629))

(push 1)

(assert (not b!274943))

(assert (not b!274942))

(assert (not b!274941))

(assert (not start!26482))

(assert (not b!274938))

(assert (not b!274940))

