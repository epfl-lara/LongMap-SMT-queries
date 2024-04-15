; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27104 () Bool)

(assert start!27104)

(declare-fun b!279956 () Bool)

(declare-fun res!143088 () Bool)

(declare-fun e!178360 () Bool)

(assert (=> b!279956 (=> (not res!143088) (not e!178360))))

(declare-datatypes ((List!4378 0))(
  ( (Nil!4375) (Cons!4374 (h!5044 (_ BitVec 64)) (t!9451 List!4378)) )
))
(declare-fun contains!1957 (List!4378 (_ BitVec 64)) Bool)

(assert (=> b!279956 (= res!143088 (not (contains!1957 Nil!4375 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279957 () Bool)

(declare-fun res!143082 () Bool)

(declare-fun e!178361 () Bool)

(assert (=> b!279957 (=> (not res!143082) (not e!178361))))

(declare-datatypes ((array!13911 0))(
  ( (array!13912 (arr!6597 (Array (_ BitVec 32) (_ BitVec 64))) (size!6950 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13911)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279957 (= res!143082 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279958 () Bool)

(declare-fun res!143080 () Bool)

(assert (=> b!279958 (=> (not res!143080) (not e!178360))))

(assert (=> b!279958 (= res!143080 (not (contains!1957 Nil!4375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279959 () Bool)

(declare-fun res!143077 () Bool)

(assert (=> b!279959 (=> (not res!143077) (not e!178361))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!279959 (= res!143077 (and (= (size!6950 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6950 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6950 a!3325))))))

(declare-fun b!279960 () Bool)

(declare-fun res!143083 () Bool)

(assert (=> b!279960 (=> (not res!143083) (not e!178360))))

(declare-fun noDuplicate!166 (List!4378) Bool)

(assert (=> b!279960 (= res!143083 (noDuplicate!166 Nil!4375))))

(declare-fun b!279961 () Bool)

(assert (=> b!279961 (= e!178361 e!178360)))

(declare-fun res!143089 () Bool)

(assert (=> b!279961 (=> (not res!143089) (not e!178360))))

(declare-datatypes ((SeekEntryResult!1754 0))(
  ( (MissingZero!1754 (index!9186 (_ BitVec 32))) (Found!1754 (index!9187 (_ BitVec 32))) (Intermediate!1754 (undefined!2566 Bool) (index!9188 (_ BitVec 32)) (x!27447 (_ BitVec 32))) (Undefined!1754) (MissingVacant!1754 (index!9189 (_ BitVec 32))) )
))
(declare-fun lt!138594 () SeekEntryResult!1754)

(assert (=> b!279961 (= res!143089 (or (= lt!138594 (MissingZero!1754 i!1267)) (= lt!138594 (MissingVacant!1754 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13911 (_ BitVec 32)) SeekEntryResult!1754)

(assert (=> b!279961 (= lt!138594 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279962 () Bool)

(declare-fun res!143081 () Bool)

(assert (=> b!279962 (=> (not res!143081) (not e!178361))))

(declare-fun arrayNoDuplicates!0 (array!13911 (_ BitVec 32) List!4378) Bool)

(assert (=> b!279962 (= res!143081 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4375))))

(declare-fun res!143086 () Bool)

(assert (=> start!27104 (=> (not res!143086) (not e!178361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27104 (= res!143086 (validMask!0 mask!3868))))

(assert (=> start!27104 e!178361))

(declare-fun array_inv!4569 (array!13911) Bool)

(assert (=> start!27104 (array_inv!4569 a!3325)))

(assert (=> start!27104 true))

(declare-fun b!279963 () Bool)

(declare-fun res!143084 () Bool)

(assert (=> b!279963 (=> (not res!143084) (not e!178360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13911 (_ BitVec 32)) Bool)

(assert (=> b!279963 (= res!143084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279964 () Bool)

(declare-fun res!143087 () Bool)

(assert (=> b!279964 (=> (not res!143087) (not e!178360))))

(assert (=> b!279964 (= res!143087 (and (bvslt (size!6950 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6950 a!3325))))))

(declare-fun b!279965 () Bool)

(assert (=> b!279965 (= e!178360 false)))

(declare-fun lt!138593 () Bool)

(assert (=> b!279965 (= lt!138593 (contains!1957 Nil!4375 k0!2581))))

(declare-fun b!279966 () Bool)

(declare-fun res!143085 () Bool)

(assert (=> b!279966 (=> (not res!143085) (not e!178360))))

(assert (=> b!279966 (= res!143085 (not (= startIndex!26 i!1267)))))

(declare-fun b!279967 () Bool)

(declare-fun res!143079 () Bool)

(assert (=> b!279967 (=> (not res!143079) (not e!178360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279967 (= res!143079 (validKeyInArray!0 (select (arr!6597 a!3325) startIndex!26)))))

(declare-fun b!279968 () Bool)

(declare-fun res!143078 () Bool)

(assert (=> b!279968 (=> (not res!143078) (not e!178361))))

(assert (=> b!279968 (= res!143078 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27104 res!143086) b!279959))

(assert (= (and b!279959 res!143077) b!279968))

(assert (= (and b!279968 res!143078) b!279962))

(assert (= (and b!279962 res!143081) b!279957))

(assert (= (and b!279957 res!143082) b!279961))

(assert (= (and b!279961 res!143089) b!279963))

(assert (= (and b!279963 res!143084) b!279966))

(assert (= (and b!279966 res!143085) b!279967))

(assert (= (and b!279967 res!143079) b!279964))

(assert (= (and b!279964 res!143087) b!279960))

(assert (= (and b!279960 res!143083) b!279958))

(assert (= (and b!279958 res!143080) b!279956))

(assert (= (and b!279956 res!143088) b!279965))

(declare-fun m!294053 () Bool)

(assert (=> b!279968 m!294053))

(declare-fun m!294055 () Bool)

(assert (=> b!279960 m!294055))

(declare-fun m!294057 () Bool)

(assert (=> b!279962 m!294057))

(declare-fun m!294059 () Bool)

(assert (=> b!279963 m!294059))

(declare-fun m!294061 () Bool)

(assert (=> start!27104 m!294061))

(declare-fun m!294063 () Bool)

(assert (=> start!27104 m!294063))

(declare-fun m!294065 () Bool)

(assert (=> b!279965 m!294065))

(declare-fun m!294067 () Bool)

(assert (=> b!279967 m!294067))

(assert (=> b!279967 m!294067))

(declare-fun m!294069 () Bool)

(assert (=> b!279967 m!294069))

(declare-fun m!294071 () Bool)

(assert (=> b!279961 m!294071))

(declare-fun m!294073 () Bool)

(assert (=> b!279958 m!294073))

(declare-fun m!294075 () Bool)

(assert (=> b!279956 m!294075))

(declare-fun m!294077 () Bool)

(assert (=> b!279957 m!294077))

(check-sat (not b!279956) (not start!27104) (not b!279967) (not b!279961) (not b!279958) (not b!279968) (not b!279957) (not b!279962) (not b!279963) (not b!279965) (not b!279960))
(check-sat)
