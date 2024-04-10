; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27102 () Bool)

(assert start!27102)

(declare-fun b!280103 () Bool)

(declare-fun res!143173 () Bool)

(declare-fun e!178462 () Bool)

(assert (=> b!280103 (=> (not res!143173) (not e!178462))))

(declare-datatypes ((array!13920 0))(
  ( (array!13921 (arr!6602 (Array (_ BitVec 32) (_ BitVec 64))) (size!6954 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13920)

(declare-datatypes ((List!4410 0))(
  ( (Nil!4407) (Cons!4406 (h!5076 (_ BitVec 64)) (t!9492 List!4410)) )
))
(declare-fun arrayNoDuplicates!0 (array!13920 (_ BitVec 32) List!4410) Bool)

(assert (=> b!280103 (= res!143173 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4407))))

(declare-fun b!280104 () Bool)

(declare-fun res!143182 () Bool)

(declare-fun e!178463 () Bool)

(assert (=> b!280104 (=> (not res!143182) (not e!178463))))

(declare-fun contains!1982 (List!4410 (_ BitVec 64)) Bool)

(assert (=> b!280104 (= res!143182 (not (contains!1982 Nil!4407 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280105 () Bool)

(assert (=> b!280105 (= e!178463 false)))

(declare-fun lt!138775 () Bool)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!280105 (= lt!138775 (contains!1982 Nil!4407 k!2581))))

(declare-fun b!280106 () Bool)

(declare-fun res!143184 () Bool)

(assert (=> b!280106 (=> (not res!143184) (not e!178462))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280106 (= res!143184 (and (= (size!6954 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6954 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6954 a!3325))))))

(declare-fun b!280107 () Bool)

(declare-fun res!143174 () Bool)

(assert (=> b!280107 (=> (not res!143174) (not e!178463))))

(assert (=> b!280107 (= res!143174 (and (bvslt (size!6954 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6954 a!3325))))))

(declare-fun b!280108 () Bool)

(assert (=> b!280108 (= e!178462 e!178463)))

(declare-fun res!143177 () Bool)

(assert (=> b!280108 (=> (not res!143177) (not e!178463))))

(declare-datatypes ((SeekEntryResult!1760 0))(
  ( (MissingZero!1760 (index!9210 (_ BitVec 32))) (Found!1760 (index!9211 (_ BitVec 32))) (Intermediate!1760 (undefined!2572 Bool) (index!9212 (_ BitVec 32)) (x!27454 (_ BitVec 32))) (Undefined!1760) (MissingVacant!1760 (index!9213 (_ BitVec 32))) )
))
(declare-fun lt!138774 () SeekEntryResult!1760)

(assert (=> b!280108 (= res!143177 (or (= lt!138774 (MissingZero!1760 i!1267)) (= lt!138774 (MissingVacant!1760 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13920 (_ BitVec 32)) SeekEntryResult!1760)

(assert (=> b!280108 (= lt!138774 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!143175 () Bool)

(assert (=> start!27102 (=> (not res!143175) (not e!178462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27102 (= res!143175 (validMask!0 mask!3868))))

(assert (=> start!27102 e!178462))

(declare-fun array_inv!4565 (array!13920) Bool)

(assert (=> start!27102 (array_inv!4565 a!3325)))

(assert (=> start!27102 true))

(declare-fun b!280109 () Bool)

(declare-fun res!143179 () Bool)

(assert (=> b!280109 (=> (not res!143179) (not e!178462))))

(declare-fun arrayContainsKey!0 (array!13920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280109 (= res!143179 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280110 () Bool)

(declare-fun res!143178 () Bool)

(assert (=> b!280110 (=> (not res!143178) (not e!178463))))

(assert (=> b!280110 (= res!143178 (not (contains!1982 Nil!4407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280111 () Bool)

(declare-fun res!143172 () Bool)

(assert (=> b!280111 (=> (not res!143172) (not e!178463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280111 (= res!143172 (validKeyInArray!0 (select (arr!6602 a!3325) startIndex!26)))))

(declare-fun b!280112 () Bool)

(declare-fun res!143181 () Bool)

(assert (=> b!280112 (=> (not res!143181) (not e!178462))))

(assert (=> b!280112 (= res!143181 (validKeyInArray!0 k!2581))))

(declare-fun b!280113 () Bool)

(declare-fun res!143176 () Bool)

(assert (=> b!280113 (=> (not res!143176) (not e!178463))))

(declare-fun noDuplicate!164 (List!4410) Bool)

(assert (=> b!280113 (= res!143176 (noDuplicate!164 Nil!4407))))

(declare-fun b!280114 () Bool)

(declare-fun res!143183 () Bool)

(assert (=> b!280114 (=> (not res!143183) (not e!178463))))

(assert (=> b!280114 (= res!143183 (not (= startIndex!26 i!1267)))))

(declare-fun b!280115 () Bool)

(declare-fun res!143180 () Bool)

(assert (=> b!280115 (=> (not res!143180) (not e!178463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13920 (_ BitVec 32)) Bool)

(assert (=> b!280115 (= res!143180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27102 res!143175) b!280106))

(assert (= (and b!280106 res!143184) b!280112))

(assert (= (and b!280112 res!143181) b!280103))

(assert (= (and b!280103 res!143173) b!280109))

(assert (= (and b!280109 res!143179) b!280108))

(assert (= (and b!280108 res!143177) b!280115))

(assert (= (and b!280115 res!143180) b!280114))

(assert (= (and b!280114 res!143183) b!280111))

(assert (= (and b!280111 res!143172) b!280107))

(assert (= (and b!280107 res!143174) b!280113))

(assert (= (and b!280113 res!143176) b!280110))

(assert (= (and b!280110 res!143178) b!280104))

(assert (= (and b!280104 res!143182) b!280105))

(declare-fun m!294645 () Bool)

(assert (=> b!280103 m!294645))

(declare-fun m!294647 () Bool)

(assert (=> b!280109 m!294647))

(declare-fun m!294649 () Bool)

(assert (=> b!280113 m!294649))

(declare-fun m!294651 () Bool)

(assert (=> b!280111 m!294651))

(assert (=> b!280111 m!294651))

(declare-fun m!294653 () Bool)

(assert (=> b!280111 m!294653))

(declare-fun m!294655 () Bool)

(assert (=> b!280115 m!294655))

(declare-fun m!294657 () Bool)

(assert (=> start!27102 m!294657))

(declare-fun m!294659 () Bool)

(assert (=> start!27102 m!294659))

(declare-fun m!294661 () Bool)

(assert (=> b!280112 m!294661))

(declare-fun m!294663 () Bool)

(assert (=> b!280105 m!294663))

(declare-fun m!294665 () Bool)

(assert (=> b!280110 m!294665))

(declare-fun m!294667 () Bool)

(assert (=> b!280104 m!294667))

(declare-fun m!294669 () Bool)

(assert (=> b!280108 m!294669))

(push 1)

(assert (not b!280105))

(assert (not b!280109))

(assert (not b!280103))

(assert (not b!280110))

(assert (not b!280111))

(assert (not b!280104))

(assert (not b!280112))

(assert (not b!280108))

(assert (not b!280113))

(assert (not start!27102))

(assert (not b!280115))

(check-sat)

(pop 1)

