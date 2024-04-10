; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27096 () Bool)

(assert start!27096)

(declare-fun b!279986 () Bool)

(declare-fun res!143065 () Bool)

(declare-fun e!178434 () Bool)

(assert (=> b!279986 (=> (not res!143065) (not e!178434))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279986 (= res!143065 (validKeyInArray!0 k!2581))))

(declare-fun b!279987 () Bool)

(declare-fun res!143067 () Bool)

(declare-fun e!178436 () Bool)

(assert (=> b!279987 (=> (not res!143067) (not e!178436))))

(declare-datatypes ((List!4407 0))(
  ( (Nil!4404) (Cons!4403 (h!5073 (_ BitVec 64)) (t!9489 List!4407)) )
))
(declare-fun noDuplicate!161 (List!4407) Bool)

(assert (=> b!279987 (= res!143067 (noDuplicate!161 Nil!4404))))

(declare-fun b!279988 () Bool)

(declare-fun res!143055 () Bool)

(assert (=> b!279988 (=> (not res!143055) (not e!178436))))

(declare-fun contains!1979 (List!4407 (_ BitVec 64)) Bool)

(assert (=> b!279988 (= res!143055 (not (contains!1979 Nil!4404 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279990 () Bool)

(declare-fun res!143061 () Bool)

(assert (=> b!279990 (=> (not res!143061) (not e!178436))))

(declare-datatypes ((array!13914 0))(
  ( (array!13915 (arr!6599 (Array (_ BitVec 32) (_ BitVec 64))) (size!6951 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13914)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!279990 (= res!143061 (validKeyInArray!0 (select (arr!6599 a!3325) startIndex!26)))))

(declare-fun b!279991 () Bool)

(declare-fun res!143063 () Bool)

(assert (=> b!279991 (=> (not res!143063) (not e!178436))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13914 (_ BitVec 32)) Bool)

(assert (=> b!279991 (= res!143063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279992 () Bool)

(declare-fun res!143062 () Bool)

(assert (=> b!279992 (=> (not res!143062) (not e!178434))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279992 (= res!143062 (and (= (size!6951 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6951 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6951 a!3325))))))

(declare-fun b!279993 () Bool)

(assert (=> b!279993 (= e!178434 e!178436)))

(declare-fun res!143059 () Bool)

(assert (=> b!279993 (=> (not res!143059) (not e!178436))))

(declare-datatypes ((SeekEntryResult!1757 0))(
  ( (MissingZero!1757 (index!9198 (_ BitVec 32))) (Found!1757 (index!9199 (_ BitVec 32))) (Intermediate!1757 (undefined!2569 Bool) (index!9200 (_ BitVec 32)) (x!27443 (_ BitVec 32))) (Undefined!1757) (MissingVacant!1757 (index!9201 (_ BitVec 32))) )
))
(declare-fun lt!138756 () SeekEntryResult!1757)

(assert (=> b!279993 (= res!143059 (or (= lt!138756 (MissingZero!1757 i!1267)) (= lt!138756 (MissingVacant!1757 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13914 (_ BitVec 32)) SeekEntryResult!1757)

(assert (=> b!279993 (= lt!138756 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279994 () Bool)

(declare-fun res!143060 () Bool)

(assert (=> b!279994 (=> (not res!143060) (not e!178434))))

(declare-fun arrayNoDuplicates!0 (array!13914 (_ BitVec 32) List!4407) Bool)

(assert (=> b!279994 (= res!143060 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4404))))

(declare-fun b!279995 () Bool)

(declare-fun res!143064 () Bool)

(assert (=> b!279995 (=> (not res!143064) (not e!178436))))

(assert (=> b!279995 (= res!143064 (not (contains!1979 Nil!4404 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279996 () Bool)

(declare-fun res!143057 () Bool)

(assert (=> b!279996 (=> (not res!143057) (not e!178434))))

(declare-fun arrayContainsKey!0 (array!13914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279996 (= res!143057 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279997 () Bool)

(declare-fun res!143056 () Bool)

(assert (=> b!279997 (=> (not res!143056) (not e!178436))))

(assert (=> b!279997 (= res!143056 (and (bvslt (size!6951 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6951 a!3325))))))

(declare-fun b!279998 () Bool)

(declare-fun res!143066 () Bool)

(assert (=> b!279998 (=> (not res!143066) (not e!178436))))

(assert (=> b!279998 (= res!143066 (not (= startIndex!26 i!1267)))))

(declare-fun res!143058 () Bool)

(assert (=> start!27096 (=> (not res!143058) (not e!178434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27096 (= res!143058 (validMask!0 mask!3868))))

(assert (=> start!27096 e!178434))

(declare-fun array_inv!4562 (array!13914) Bool)

(assert (=> start!27096 (array_inv!4562 a!3325)))

(assert (=> start!27096 true))

(declare-fun b!279989 () Bool)

(assert (=> b!279989 (= e!178436 false)))

(declare-fun lt!138757 () Bool)

(assert (=> b!279989 (= lt!138757 (contains!1979 Nil!4404 k!2581))))

(assert (= (and start!27096 res!143058) b!279992))

(assert (= (and b!279992 res!143062) b!279986))

(assert (= (and b!279986 res!143065) b!279994))

(assert (= (and b!279994 res!143060) b!279996))

(assert (= (and b!279996 res!143057) b!279993))

(assert (= (and b!279993 res!143059) b!279991))

(assert (= (and b!279991 res!143063) b!279998))

(assert (= (and b!279998 res!143066) b!279990))

(assert (= (and b!279990 res!143061) b!279997))

(assert (= (and b!279997 res!143056) b!279987))

(assert (= (and b!279987 res!143067) b!279995))

(assert (= (and b!279995 res!143064) b!279988))

(assert (= (and b!279988 res!143055) b!279989))

(declare-fun m!294567 () Bool)

(assert (=> b!279996 m!294567))

(declare-fun m!294569 () Bool)

(assert (=> b!279991 m!294569))

(declare-fun m!294571 () Bool)

(assert (=> b!279995 m!294571))

(declare-fun m!294573 () Bool)

(assert (=> b!279989 m!294573))

(declare-fun m!294575 () Bool)

(assert (=> b!279987 m!294575))

(declare-fun m!294577 () Bool)

(assert (=> b!279986 m!294577))

(declare-fun m!294579 () Bool)

(assert (=> b!279988 m!294579))

(declare-fun m!294581 () Bool)

(assert (=> start!27096 m!294581))

(declare-fun m!294583 () Bool)

(assert (=> start!27096 m!294583))

(declare-fun m!294585 () Bool)

(assert (=> b!279993 m!294585))

(declare-fun m!294587 () Bool)

(assert (=> b!279994 m!294587))

(declare-fun m!294589 () Bool)

(assert (=> b!279990 m!294589))

(assert (=> b!279990 m!294589))

(declare-fun m!294591 () Bool)

(assert (=> b!279990 m!294591))

(push 1)

