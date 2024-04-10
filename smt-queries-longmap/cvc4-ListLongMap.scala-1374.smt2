; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27100 () Bool)

(assert start!27100)

(declare-fun b!280064 () Bool)

(declare-fun res!143137 () Bool)

(declare-fun e!178452 () Bool)

(assert (=> b!280064 (=> (not res!143137) (not e!178452))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280064 (= res!143137 (not (= startIndex!26 i!1267)))))

(declare-fun b!280065 () Bool)

(declare-fun res!143143 () Bool)

(assert (=> b!280065 (=> (not res!143143) (not e!178452))))

(declare-datatypes ((array!13918 0))(
  ( (array!13919 (arr!6601 (Array (_ BitVec 32) (_ BitVec 64))) (size!6953 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13918)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280065 (= res!143143 (validKeyInArray!0 (select (arr!6601 a!3325) startIndex!26)))))

(declare-fun b!280066 () Bool)

(declare-fun res!143134 () Bool)

(declare-fun e!178454 () Bool)

(assert (=> b!280066 (=> (not res!143134) (not e!178454))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280066 (= res!143134 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280067 () Bool)

(declare-fun res!143145 () Bool)

(assert (=> b!280067 (=> (not res!143145) (not e!178454))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280067 (= res!143145 (and (= (size!6953 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6953 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6953 a!3325))))))

(declare-fun b!280068 () Bool)

(declare-fun res!143139 () Bool)

(assert (=> b!280068 (=> (not res!143139) (not e!178452))))

(assert (=> b!280068 (= res!143139 (and (bvslt (size!6953 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6953 a!3325))))))

(declare-fun res!143133 () Bool)

(assert (=> start!27100 (=> (not res!143133) (not e!178454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27100 (= res!143133 (validMask!0 mask!3868))))

(assert (=> start!27100 e!178454))

(declare-fun array_inv!4564 (array!13918) Bool)

(assert (=> start!27100 (array_inv!4564 a!3325)))

(assert (=> start!27100 true))

(declare-fun b!280069 () Bool)

(declare-fun res!143141 () Bool)

(assert (=> b!280069 (=> (not res!143141) (not e!178454))))

(assert (=> b!280069 (= res!143141 (validKeyInArray!0 k!2581))))

(declare-fun b!280070 () Bool)

(declare-fun res!143140 () Bool)

(assert (=> b!280070 (=> (not res!143140) (not e!178452))))

(declare-datatypes ((List!4409 0))(
  ( (Nil!4406) (Cons!4405 (h!5075 (_ BitVec 64)) (t!9491 List!4409)) )
))
(declare-fun noDuplicate!163 (List!4409) Bool)

(assert (=> b!280070 (= res!143140 (noDuplicate!163 Nil!4406))))

(declare-fun b!280071 () Bool)

(declare-fun res!143144 () Bool)

(assert (=> b!280071 (=> (not res!143144) (not e!178452))))

(declare-fun contains!1981 (List!4409 (_ BitVec 64)) Bool)

(assert (=> b!280071 (= res!143144 (not (contains!1981 Nil!4406 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280072 () Bool)

(assert (=> b!280072 (= e!178454 e!178452)))

(declare-fun res!143138 () Bool)

(assert (=> b!280072 (=> (not res!143138) (not e!178452))))

(declare-datatypes ((SeekEntryResult!1759 0))(
  ( (MissingZero!1759 (index!9206 (_ BitVec 32))) (Found!1759 (index!9207 (_ BitVec 32))) (Intermediate!1759 (undefined!2571 Bool) (index!9208 (_ BitVec 32)) (x!27445 (_ BitVec 32))) (Undefined!1759) (MissingVacant!1759 (index!9209 (_ BitVec 32))) )
))
(declare-fun lt!138768 () SeekEntryResult!1759)

(assert (=> b!280072 (= res!143138 (or (= lt!138768 (MissingZero!1759 i!1267)) (= lt!138768 (MissingVacant!1759 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13918 (_ BitVec 32)) SeekEntryResult!1759)

(assert (=> b!280072 (= lt!138768 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280073 () Bool)

(declare-fun res!143142 () Bool)

(assert (=> b!280073 (=> (not res!143142) (not e!178452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13918 (_ BitVec 32)) Bool)

(assert (=> b!280073 (= res!143142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280074 () Bool)

(assert (=> b!280074 (= e!178452 false)))

(declare-fun lt!138769 () Bool)

(assert (=> b!280074 (= lt!138769 (contains!1981 Nil!4406 k!2581))))

(declare-fun b!280075 () Bool)

(declare-fun res!143136 () Bool)

(assert (=> b!280075 (=> (not res!143136) (not e!178452))))

(assert (=> b!280075 (= res!143136 (not (contains!1981 Nil!4406 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280076 () Bool)

(declare-fun res!143135 () Bool)

(assert (=> b!280076 (=> (not res!143135) (not e!178454))))

(declare-fun arrayNoDuplicates!0 (array!13918 (_ BitVec 32) List!4409) Bool)

(assert (=> b!280076 (= res!143135 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4406))))

(assert (= (and start!27100 res!143133) b!280067))

(assert (= (and b!280067 res!143145) b!280069))

(assert (= (and b!280069 res!143141) b!280076))

(assert (= (and b!280076 res!143135) b!280066))

(assert (= (and b!280066 res!143134) b!280072))

(assert (= (and b!280072 res!143138) b!280073))

(assert (= (and b!280073 res!143142) b!280064))

(assert (= (and b!280064 res!143137) b!280065))

(assert (= (and b!280065 res!143143) b!280068))

(assert (= (and b!280068 res!143139) b!280070))

(assert (= (and b!280070 res!143140) b!280071))

(assert (= (and b!280071 res!143144) b!280075))

(assert (= (and b!280075 res!143136) b!280074))

(declare-fun m!294619 () Bool)

(assert (=> b!280065 m!294619))

(assert (=> b!280065 m!294619))

(declare-fun m!294621 () Bool)

(assert (=> b!280065 m!294621))

(declare-fun m!294623 () Bool)

(assert (=> b!280066 m!294623))

(declare-fun m!294625 () Bool)

(assert (=> b!280075 m!294625))

(declare-fun m!294627 () Bool)

(assert (=> b!280070 m!294627))

(declare-fun m!294629 () Bool)

(assert (=> b!280076 m!294629))

(declare-fun m!294631 () Bool)

(assert (=> start!27100 m!294631))

(declare-fun m!294633 () Bool)

(assert (=> start!27100 m!294633))

(declare-fun m!294635 () Bool)

(assert (=> b!280073 m!294635))

(declare-fun m!294637 () Bool)

(assert (=> b!280072 m!294637))

(declare-fun m!294639 () Bool)

(assert (=> b!280069 m!294639))

(declare-fun m!294641 () Bool)

(assert (=> b!280074 m!294641))

(declare-fun m!294643 () Bool)

(assert (=> b!280071 m!294643))

(push 1)

(assert (not b!280072))

