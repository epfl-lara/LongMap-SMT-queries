; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26208 () Bool)

(assert start!26208)

(declare-fun b!270983 () Bool)

(declare-fun res!134973 () Bool)

(declare-fun e!174450 () Bool)

(assert (=> b!270983 (=> (not res!134973) (not e!174450))))

(declare-datatypes ((array!13305 0))(
  ( (array!13306 (arr!6302 (Array (_ BitVec 32) (_ BitVec 64))) (size!6654 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13305)

(assert (=> b!270983 (= res!134973 (and (bvslt (size!6654 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6654 a!3325))))))

(declare-fun b!270984 () Bool)

(assert (=> b!270984 (= e!174450 false)))

(declare-fun lt!135732 () Bool)

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4110 0))(
  ( (Nil!4107) (Cons!4106 (h!4773 (_ BitVec 64)) (t!9192 List!4110)) )
))
(declare-fun contains!1940 (List!4110 (_ BitVec 64)) Bool)

(assert (=> b!270984 (= lt!135732 (contains!1940 Nil!4107 k!2581))))

(declare-fun b!270985 () Bool)

(declare-fun res!134976 () Bool)

(assert (=> b!270985 (=> (not res!134976) (not e!174450))))

(assert (=> b!270985 (= res!134976 (not (contains!1940 Nil!4107 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!134981 () Bool)

(declare-fun e!174452 () Bool)

(assert (=> start!26208 (=> (not res!134981) (not e!174452))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26208 (= res!134981 (validMask!0 mask!3868))))

(assert (=> start!26208 e!174452))

(declare-fun array_inv!4265 (array!13305) Bool)

(assert (=> start!26208 (array_inv!4265 a!3325)))

(assert (=> start!26208 true))

(declare-fun b!270986 () Bool)

(declare-fun res!134983 () Bool)

(assert (=> b!270986 (=> (not res!134983) (not e!174450))))

(assert (=> b!270986 (= res!134983 (not (contains!1940 Nil!4107 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270987 () Bool)

(declare-fun res!134975 () Bool)

(assert (=> b!270987 (=> (not res!134975) (not e!174452))))

(declare-fun arrayContainsKey!0 (array!13305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270987 (= res!134975 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270988 () Bool)

(assert (=> b!270988 (= e!174452 e!174450)))

(declare-fun res!134980 () Bool)

(assert (=> b!270988 (=> (not res!134980) (not e!174450))))

(declare-datatypes ((SeekEntryResult!1460 0))(
  ( (MissingZero!1460 (index!8010 (_ BitVec 32))) (Found!1460 (index!8011 (_ BitVec 32))) (Intermediate!1460 (undefined!2272 Bool) (index!8012 (_ BitVec 32)) (x!26345 (_ BitVec 32))) (Undefined!1460) (MissingVacant!1460 (index!8013 (_ BitVec 32))) )
))
(declare-fun lt!135733 () SeekEntryResult!1460)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270988 (= res!134980 (or (= lt!135733 (MissingZero!1460 i!1267)) (= lt!135733 (MissingVacant!1460 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13305 (_ BitVec 32)) SeekEntryResult!1460)

(assert (=> b!270988 (= lt!135733 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270989 () Bool)

(declare-fun res!134984 () Bool)

(assert (=> b!270989 (=> (not res!134984) (not e!174450))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270989 (= res!134984 (not (= startIndex!26 i!1267)))))

(declare-fun b!270990 () Bool)

(declare-fun res!134985 () Bool)

(assert (=> b!270990 (=> (not res!134985) (not e!174452))))

(assert (=> b!270990 (= res!134985 (and (= (size!6654 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6654 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6654 a!3325))))))

(declare-fun b!270991 () Bool)

(declare-fun res!134979 () Bool)

(assert (=> b!270991 (=> (not res!134979) (not e!174452))))

(declare-fun arrayNoDuplicates!0 (array!13305 (_ BitVec 32) List!4110) Bool)

(assert (=> b!270991 (= res!134979 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4107))))

(declare-fun b!270992 () Bool)

(declare-fun res!134982 () Bool)

(assert (=> b!270992 (=> (not res!134982) (not e!174450))))

(declare-fun noDuplicate!128 (List!4110) Bool)

(assert (=> b!270992 (= res!134982 (noDuplicate!128 Nil!4107))))

(declare-fun b!270993 () Bool)

(declare-fun res!134974 () Bool)

(assert (=> b!270993 (=> (not res!134974) (not e!174452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270993 (= res!134974 (validKeyInArray!0 k!2581))))

(declare-fun b!270994 () Bool)

(declare-fun res!134977 () Bool)

(assert (=> b!270994 (=> (not res!134977) (not e!174450))))

(assert (=> b!270994 (= res!134977 (validKeyInArray!0 (select (arr!6302 a!3325) startIndex!26)))))

(declare-fun b!270995 () Bool)

(declare-fun res!134978 () Bool)

(assert (=> b!270995 (=> (not res!134978) (not e!174450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13305 (_ BitVec 32)) Bool)

(assert (=> b!270995 (= res!134978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26208 res!134981) b!270990))

(assert (= (and b!270990 res!134985) b!270993))

(assert (= (and b!270993 res!134974) b!270991))

(assert (= (and b!270991 res!134979) b!270987))

(assert (= (and b!270987 res!134975) b!270988))

(assert (= (and b!270988 res!134980) b!270995))

(assert (= (and b!270995 res!134978) b!270989))

(assert (= (and b!270989 res!134984) b!270994))

(assert (= (and b!270994 res!134977) b!270983))

(assert (= (and b!270983 res!134973) b!270992))

(assert (= (and b!270992 res!134982) b!270986))

(assert (= (and b!270986 res!134983) b!270985))

(assert (= (and b!270985 res!134976) b!270984))

(declare-fun m!286419 () Bool)

(assert (=> b!270988 m!286419))

(declare-fun m!286421 () Bool)

(assert (=> b!270993 m!286421))

(declare-fun m!286423 () Bool)

(assert (=> b!270985 m!286423))

(declare-fun m!286425 () Bool)

(assert (=> b!270991 m!286425))

(declare-fun m!286427 () Bool)

(assert (=> b!270994 m!286427))

(assert (=> b!270994 m!286427))

(declare-fun m!286429 () Bool)

(assert (=> b!270994 m!286429))

(declare-fun m!286431 () Bool)

(assert (=> b!270984 m!286431))

(declare-fun m!286433 () Bool)

(assert (=> b!270987 m!286433))

(declare-fun m!286435 () Bool)

(assert (=> b!270986 m!286435))

(declare-fun m!286437 () Bool)

(assert (=> b!270992 m!286437))

(declare-fun m!286439 () Bool)

(assert (=> b!270995 m!286439))

(declare-fun m!286441 () Bool)

(assert (=> start!26208 m!286441))

(declare-fun m!286443 () Bool)

(assert (=> start!26208 m!286443))

(push 1)

