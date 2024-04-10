; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26478 () Bool)

(assert start!26478)

(declare-fun b!274902 () Bool)

(declare-fun e!175927 () Bool)

(declare-fun e!175926 () Bool)

(assert (=> b!274902 (= e!175927 e!175926)))

(declare-fun res!138894 () Bool)

(assert (=> b!274902 (=> (not res!138894) (not e!175926))))

(declare-datatypes ((SeekEntryResult!1595 0))(
  ( (MissingZero!1595 (index!8550 (_ BitVec 32))) (Found!1595 (index!8551 (_ BitVec 32))) (Intermediate!1595 (undefined!2407 Bool) (index!8552 (_ BitVec 32)) (x!26840 (_ BitVec 32))) (Undefined!1595) (MissingVacant!1595 (index!8553 (_ BitVec 32))) )
))
(declare-fun lt!137208 () SeekEntryResult!1595)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274902 (= res!138894 (or (= lt!137208 (MissingZero!1595 i!1267)) (= lt!137208 (MissingVacant!1595 i!1267))))))

(declare-datatypes ((array!13575 0))(
  ( (array!13576 (arr!6437 (Array (_ BitVec 32) (_ BitVec 64))) (size!6789 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13575)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13575 (_ BitVec 32)) SeekEntryResult!1595)

(assert (=> b!274902 (= lt!137208 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!138897 () Bool)

(assert (=> start!26478 (=> (not res!138897) (not e!175927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26478 (= res!138897 (validMask!0 mask!3868))))

(assert (=> start!26478 e!175927))

(declare-fun array_inv!4400 (array!13575) Bool)

(assert (=> start!26478 (array_inv!4400 a!3325)))

(assert (=> start!26478 true))

(declare-fun b!274903 () Bool)

(assert (=> b!274903 (= e!175926 false)))

(declare-fun lt!137209 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13575 (_ BitVec 32)) Bool)

(assert (=> b!274903 (= lt!137209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274904 () Bool)

(declare-fun res!138892 () Bool)

(assert (=> b!274904 (=> (not res!138892) (not e!175927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274904 (= res!138892 (validKeyInArray!0 k!2581))))

(declare-fun b!274905 () Bool)

(declare-fun res!138893 () Bool)

(assert (=> b!274905 (=> (not res!138893) (not e!175927))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274905 (= res!138893 (and (= (size!6789 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6789 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6789 a!3325))))))

(declare-fun b!274906 () Bool)

(declare-fun res!138896 () Bool)

(assert (=> b!274906 (=> (not res!138896) (not e!175927))))

(declare-datatypes ((List!4245 0))(
  ( (Nil!4242) (Cons!4241 (h!4908 (_ BitVec 64)) (t!9327 List!4245)) )
))
(declare-fun arrayNoDuplicates!0 (array!13575 (_ BitVec 32) List!4245) Bool)

(assert (=> b!274906 (= res!138896 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4242))))

(declare-fun b!274907 () Bool)

(declare-fun res!138895 () Bool)

(assert (=> b!274907 (=> (not res!138895) (not e!175927))))

(declare-fun arrayContainsKey!0 (array!13575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274907 (= res!138895 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26478 res!138897) b!274905))

(assert (= (and b!274905 res!138893) b!274904))

(assert (= (and b!274904 res!138892) b!274906))

(assert (= (and b!274906 res!138896) b!274907))

(assert (= (and b!274907 res!138895) b!274902))

(assert (= (and b!274902 res!138894) b!274903))

(declare-fun m!290589 () Bool)

(assert (=> b!274906 m!290589))

(declare-fun m!290591 () Bool)

(assert (=> start!26478 m!290591))

(declare-fun m!290593 () Bool)

(assert (=> start!26478 m!290593))

(declare-fun m!290595 () Bool)

(assert (=> b!274904 m!290595))

(declare-fun m!290597 () Bool)

(assert (=> b!274907 m!290597))

(declare-fun m!290599 () Bool)

(assert (=> b!274902 m!290599))

(declare-fun m!290601 () Bool)

(assert (=> b!274903 m!290601))

(push 1)

