; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26202 () Bool)

(assert start!26202)

(declare-fun b!270866 () Bool)

(declare-fun res!134868 () Bool)

(declare-fun e!174423 () Bool)

(assert (=> b!270866 (=> (not res!134868) (not e!174423))))

(declare-datatypes ((List!4107 0))(
  ( (Nil!4104) (Cons!4103 (h!4770 (_ BitVec 64)) (t!9189 List!4107)) )
))
(declare-fun noDuplicate!125 (List!4107) Bool)

(assert (=> b!270866 (= res!134868 (noDuplicate!125 Nil!4104))))

(declare-fun b!270867 () Bool)

(declare-fun res!134863 () Bool)

(assert (=> b!270867 (=> (not res!134863) (not e!174423))))

(declare-fun contains!1937 (List!4107 (_ BitVec 64)) Bool)

(assert (=> b!270867 (= res!134863 (not (contains!1937 Nil!4104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270868 () Bool)

(declare-fun res!134861 () Bool)

(assert (=> b!270868 (=> (not res!134861) (not e!174423))))

(declare-datatypes ((array!13299 0))(
  ( (array!13300 (arr!6299 (Array (_ BitVec 32) (_ BitVec 64))) (size!6651 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13299)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270868 (= res!134861 (validKeyInArray!0 (select (arr!6299 a!3325) startIndex!26)))))

(declare-fun b!270869 () Bool)

(declare-fun res!134865 () Bool)

(declare-fun e!174425 () Bool)

(assert (=> b!270869 (=> (not res!134865) (not e!174425))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!270869 (= res!134865 (validKeyInArray!0 k!2581))))

(declare-fun b!270870 () Bool)

(assert (=> b!270870 (= e!174423 false)))

(declare-fun lt!135715 () Bool)

(assert (=> b!270870 (= lt!135715 (contains!1937 Nil!4104 k!2581))))

(declare-fun res!134867 () Bool)

(assert (=> start!26202 (=> (not res!134867) (not e!174425))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26202 (= res!134867 (validMask!0 mask!3868))))

(assert (=> start!26202 e!174425))

(declare-fun array_inv!4262 (array!13299) Bool)

(assert (=> start!26202 (array_inv!4262 a!3325)))

(assert (=> start!26202 true))

(declare-fun b!270871 () Bool)

(declare-fun res!134864 () Bool)

(assert (=> b!270871 (=> (not res!134864) (not e!174423))))

(assert (=> b!270871 (= res!134864 (not (contains!1937 Nil!4104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270872 () Bool)

(declare-fun res!134862 () Bool)

(assert (=> b!270872 (=> (not res!134862) (not e!174423))))

(assert (=> b!270872 (= res!134862 (and (bvslt (size!6651 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6651 a!3325))))))

(declare-fun b!270873 () Bool)

(declare-fun res!134857 () Bool)

(assert (=> b!270873 (=> (not res!134857) (not e!174425))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270873 (= res!134857 (and (= (size!6651 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6651 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6651 a!3325))))))

(declare-fun b!270874 () Bool)

(declare-fun res!134860 () Bool)

(assert (=> b!270874 (=> (not res!134860) (not e!174423))))

(assert (=> b!270874 (= res!134860 (not (= startIndex!26 i!1267)))))

(declare-fun b!270875 () Bool)

(declare-fun res!134866 () Bool)

(assert (=> b!270875 (=> (not res!134866) (not e!174425))))

(declare-fun arrayContainsKey!0 (array!13299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270875 (= res!134866 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270876 () Bool)

(assert (=> b!270876 (= e!174425 e!174423)))

(declare-fun res!134859 () Bool)

(assert (=> b!270876 (=> (not res!134859) (not e!174423))))

(declare-datatypes ((SeekEntryResult!1457 0))(
  ( (MissingZero!1457 (index!7998 (_ BitVec 32))) (Found!1457 (index!7999 (_ BitVec 32))) (Intermediate!1457 (undefined!2269 Bool) (index!8000 (_ BitVec 32)) (x!26334 (_ BitVec 32))) (Undefined!1457) (MissingVacant!1457 (index!8001 (_ BitVec 32))) )
))
(declare-fun lt!135714 () SeekEntryResult!1457)

(assert (=> b!270876 (= res!134859 (or (= lt!135714 (MissingZero!1457 i!1267)) (= lt!135714 (MissingVacant!1457 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13299 (_ BitVec 32)) SeekEntryResult!1457)

(assert (=> b!270876 (= lt!135714 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270877 () Bool)

(declare-fun res!134856 () Bool)

(assert (=> b!270877 (=> (not res!134856) (not e!174423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13299 (_ BitVec 32)) Bool)

(assert (=> b!270877 (= res!134856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270878 () Bool)

(declare-fun res!134858 () Bool)

(assert (=> b!270878 (=> (not res!134858) (not e!174425))))

(declare-fun arrayNoDuplicates!0 (array!13299 (_ BitVec 32) List!4107) Bool)

(assert (=> b!270878 (= res!134858 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4104))))

(assert (= (and start!26202 res!134867) b!270873))

(assert (= (and b!270873 res!134857) b!270869))

(assert (= (and b!270869 res!134865) b!270878))

(assert (= (and b!270878 res!134858) b!270875))

(assert (= (and b!270875 res!134866) b!270876))

(assert (= (and b!270876 res!134859) b!270877))

(assert (= (and b!270877 res!134856) b!270874))

(assert (= (and b!270874 res!134860) b!270868))

(assert (= (and b!270868 res!134861) b!270872))

(assert (= (and b!270872 res!134862) b!270866))

(assert (= (and b!270866 res!134868) b!270867))

(assert (= (and b!270867 res!134863) b!270871))

(assert (= (and b!270871 res!134864) b!270870))

(declare-fun m!286341 () Bool)

(assert (=> b!270866 m!286341))

(declare-fun m!286343 () Bool)

(assert (=> b!270877 m!286343))

(declare-fun m!286345 () Bool)

(assert (=> b!270878 m!286345))

(declare-fun m!286347 () Bool)

(assert (=> b!270869 m!286347))

(declare-fun m!286349 () Bool)

(assert (=> b!270870 m!286349))

(declare-fun m!286351 () Bool)

(assert (=> b!270868 m!286351))

(assert (=> b!270868 m!286351))

(declare-fun m!286353 () Bool)

(assert (=> b!270868 m!286353))

(declare-fun m!286355 () Bool)

(assert (=> start!26202 m!286355))

(declare-fun m!286357 () Bool)

(assert (=> start!26202 m!286357))

(declare-fun m!286359 () Bool)

(assert (=> b!270875 m!286359))

(declare-fun m!286361 () Bool)

(assert (=> b!270867 m!286361))

(declare-fun m!286363 () Bool)

(assert (=> b!270871 m!286363))

(declare-fun m!286365 () Bool)

(assert (=> b!270876 m!286365))

(push 1)

