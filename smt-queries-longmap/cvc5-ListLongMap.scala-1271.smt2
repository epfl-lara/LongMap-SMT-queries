; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26184 () Bool)

(assert start!26184)

(declare-fun b!270516 () Bool)

(declare-fun res!134507 () Bool)

(declare-fun e!174343 () Bool)

(assert (=> b!270516 (=> (not res!134507) (not e!174343))))

(declare-datatypes ((List!4098 0))(
  ( (Nil!4095) (Cons!4094 (h!4761 (_ BitVec 64)) (t!9180 List!4098)) )
))
(declare-fun contains!1928 (List!4098 (_ BitVec 64)) Bool)

(assert (=> b!270516 (= res!134507 (not (contains!1928 Nil!4095 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270517 () Bool)

(declare-fun res!134505 () Bool)

(assert (=> b!270517 (=> (not res!134505) (not e!174343))))

(assert (=> b!270517 (= res!134505 (not (contains!1928 Nil!4095 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270518 () Bool)

(declare-fun res!134516 () Bool)

(assert (=> b!270518 (=> (not res!134516) (not e!174343))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270518 (= res!134516 (not (= startIndex!26 i!1267)))))

(declare-fun b!270519 () Bool)

(declare-fun e!174344 () Bool)

(assert (=> b!270519 (= e!174344 e!174343)))

(declare-fun res!134513 () Bool)

(assert (=> b!270519 (=> (not res!134513) (not e!174343))))

(declare-datatypes ((SeekEntryResult!1448 0))(
  ( (MissingZero!1448 (index!7962 (_ BitVec 32))) (Found!1448 (index!7963 (_ BitVec 32))) (Intermediate!1448 (undefined!2260 Bool) (index!7964 (_ BitVec 32)) (x!26301 (_ BitVec 32))) (Undefined!1448) (MissingVacant!1448 (index!7965 (_ BitVec 32))) )
))
(declare-fun lt!135661 () SeekEntryResult!1448)

(assert (=> b!270519 (= res!134513 (or (= lt!135661 (MissingZero!1448 i!1267)) (= lt!135661 (MissingVacant!1448 i!1267))))))

(declare-datatypes ((array!13281 0))(
  ( (array!13282 (arr!6290 (Array (_ BitVec 32) (_ BitVec 64))) (size!6642 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13281)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13281 (_ BitVec 32)) SeekEntryResult!1448)

(assert (=> b!270519 (= lt!135661 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270520 () Bool)

(declare-fun res!134514 () Bool)

(assert (=> b!270520 (=> (not res!134514) (not e!174343))))

(assert (=> b!270520 (= res!134514 (and (bvslt (size!6642 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6642 a!3325))))))

(declare-fun b!270521 () Bool)

(declare-fun res!134510 () Bool)

(assert (=> b!270521 (=> (not res!134510) (not e!174344))))

(declare-fun arrayContainsKey!0 (array!13281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270521 (= res!134510 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270522 () Bool)

(declare-fun res!134506 () Bool)

(assert (=> b!270522 (=> (not res!134506) (not e!174344))))

(assert (=> b!270522 (= res!134506 (and (= (size!6642 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6642 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6642 a!3325))))))

(declare-fun b!270523 () Bool)

(declare-fun res!134517 () Bool)

(assert (=> b!270523 (=> (not res!134517) (not e!174344))))

(declare-fun arrayNoDuplicates!0 (array!13281 (_ BitVec 32) List!4098) Bool)

(assert (=> b!270523 (= res!134517 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4095))))

(declare-fun b!270524 () Bool)

(declare-fun res!134515 () Bool)

(assert (=> b!270524 (=> (not res!134515) (not e!174344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270524 (= res!134515 (validKeyInArray!0 k!2581))))

(declare-fun b!270525 () Bool)

(declare-fun res!134508 () Bool)

(assert (=> b!270525 (=> (not res!134508) (not e!174343))))

(declare-fun noDuplicate!116 (List!4098) Bool)

(assert (=> b!270525 (= res!134508 (noDuplicate!116 Nil!4095))))

(declare-fun res!134512 () Bool)

(assert (=> start!26184 (=> (not res!134512) (not e!174344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26184 (= res!134512 (validMask!0 mask!3868))))

(assert (=> start!26184 e!174344))

(declare-fun array_inv!4253 (array!13281) Bool)

(assert (=> start!26184 (array_inv!4253 a!3325)))

(assert (=> start!26184 true))

(declare-fun b!270515 () Bool)

(declare-fun res!134509 () Bool)

(assert (=> b!270515 (=> (not res!134509) (not e!174343))))

(assert (=> b!270515 (= res!134509 (validKeyInArray!0 (select (arr!6290 a!3325) startIndex!26)))))

(declare-fun b!270526 () Bool)

(assert (=> b!270526 (= e!174343 false)))

(declare-fun lt!135660 () Bool)

(assert (=> b!270526 (= lt!135660 (contains!1928 Nil!4095 k!2581))))

(declare-fun b!270527 () Bool)

(declare-fun res!134511 () Bool)

(assert (=> b!270527 (=> (not res!134511) (not e!174343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13281 (_ BitVec 32)) Bool)

(assert (=> b!270527 (= res!134511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26184 res!134512) b!270522))

(assert (= (and b!270522 res!134506) b!270524))

(assert (= (and b!270524 res!134515) b!270523))

(assert (= (and b!270523 res!134517) b!270521))

(assert (= (and b!270521 res!134510) b!270519))

(assert (= (and b!270519 res!134513) b!270527))

(assert (= (and b!270527 res!134511) b!270518))

(assert (= (and b!270518 res!134516) b!270515))

(assert (= (and b!270515 res!134509) b!270520))

(assert (= (and b!270520 res!134514) b!270525))

(assert (= (and b!270525 res!134508) b!270516))

(assert (= (and b!270516 res!134507) b!270517))

(assert (= (and b!270517 res!134505) b!270526))

(declare-fun m!286107 () Bool)

(assert (=> b!270525 m!286107))

(declare-fun m!286109 () Bool)

(assert (=> b!270526 m!286109))

(declare-fun m!286111 () Bool)

(assert (=> start!26184 m!286111))

(declare-fun m!286113 () Bool)

(assert (=> start!26184 m!286113))

(declare-fun m!286115 () Bool)

(assert (=> b!270524 m!286115))

(declare-fun m!286117 () Bool)

(assert (=> b!270516 m!286117))

(declare-fun m!286119 () Bool)

(assert (=> b!270517 m!286119))

(declare-fun m!286121 () Bool)

(assert (=> b!270527 m!286121))

(declare-fun m!286123 () Bool)

(assert (=> b!270515 m!286123))

(assert (=> b!270515 m!286123))

(declare-fun m!286125 () Bool)

(assert (=> b!270515 m!286125))

(declare-fun m!286127 () Bool)

(assert (=> b!270523 m!286127))

(declare-fun m!286129 () Bool)

(assert (=> b!270521 m!286129))

(declare-fun m!286131 () Bool)

(assert (=> b!270519 m!286131))

(push 1)

