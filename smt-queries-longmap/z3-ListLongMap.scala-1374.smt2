; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27096 () Bool)

(assert start!27096)

(declare-fun b!280033 () Bool)

(declare-fun res!143087 () Bool)

(declare-fun e!178459 () Bool)

(assert (=> b!280033 (=> (not res!143087) (not e!178459))))

(declare-datatypes ((List!4319 0))(
  ( (Nil!4316) (Cons!4315 (h!4985 (_ BitVec 64)) (t!9393 List!4319)) )
))
(declare-fun noDuplicate!164 (List!4319) Bool)

(assert (=> b!280033 (= res!143087 (noDuplicate!164 Nil!4316))))

(declare-fun b!280034 () Bool)

(declare-fun res!143084 () Bool)

(assert (=> b!280034 (=> (not res!143084) (not e!178459))))

(declare-datatypes ((array!13913 0))(
  ( (array!13914 (arr!6598 (Array (_ BitVec 32) (_ BitVec 64))) (size!6950 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13913)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13913 (_ BitVec 32)) Bool)

(assert (=> b!280034 (= res!143084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280035 () Bool)

(declare-fun res!143088 () Bool)

(assert (=> b!280035 (=> (not res!143088) (not e!178459))))

(assert (=> b!280035 (= res!143088 (and (bvslt (size!6950 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6950 a!3325))))))

(declare-fun b!280036 () Bool)

(declare-fun res!143076 () Bool)

(declare-fun e!178460 () Bool)

(assert (=> b!280036 (=> (not res!143076) (not e!178460))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280036 (= res!143076 (validKeyInArray!0 k0!2581))))

(declare-fun b!280037 () Bool)

(assert (=> b!280037 (= e!178460 e!178459)))

(declare-fun res!143078 () Bool)

(assert (=> b!280037 (=> (not res!143078) (not e!178459))))

(declare-datatypes ((SeekEntryResult!1721 0))(
  ( (MissingZero!1721 (index!9054 (_ BitVec 32))) (Found!1721 (index!9055 (_ BitVec 32))) (Intermediate!1721 (undefined!2533 Bool) (index!9056 (_ BitVec 32)) (x!27407 (_ BitVec 32))) (Undefined!1721) (MissingVacant!1721 (index!9057 (_ BitVec 32))) )
))
(declare-fun lt!138815 () SeekEntryResult!1721)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280037 (= res!143078 (or (= lt!138815 (MissingZero!1721 i!1267)) (= lt!138815 (MissingVacant!1721 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13913 (_ BitVec 32)) SeekEntryResult!1721)

(assert (=> b!280037 (= lt!138815 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280038 () Bool)

(declare-fun res!143085 () Bool)

(assert (=> b!280038 (=> (not res!143085) (not e!178459))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280038 (= res!143085 (not (= startIndex!26 i!1267)))))

(declare-fun b!280039 () Bool)

(declare-fun res!143081 () Bool)

(assert (=> b!280039 (=> (not res!143081) (not e!178459))))

(assert (=> b!280039 (= res!143081 (validKeyInArray!0 (select (arr!6598 a!3325) startIndex!26)))))

(declare-fun b!280040 () Bool)

(declare-fun res!143083 () Bool)

(assert (=> b!280040 (=> (not res!143083) (not e!178460))))

(declare-fun arrayContainsKey!0 (array!13913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280040 (= res!143083 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280041 () Bool)

(declare-fun res!143077 () Bool)

(assert (=> b!280041 (=> (not res!143077) (not e!178460))))

(assert (=> b!280041 (= res!143077 (and (= (size!6950 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6950 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6950 a!3325))))))

(declare-fun b!280042 () Bool)

(declare-fun res!143082 () Bool)

(assert (=> b!280042 (=> (not res!143082) (not e!178459))))

(declare-fun contains!1953 (List!4319 (_ BitVec 64)) Bool)

(assert (=> b!280042 (= res!143082 (not (contains!1953 Nil!4316 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280043 () Bool)

(declare-fun res!143086 () Bool)

(assert (=> b!280043 (=> (not res!143086) (not e!178459))))

(assert (=> b!280043 (= res!143086 (not (contains!1953 Nil!4316 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!143079 () Bool)

(assert (=> start!27096 (=> (not res!143079) (not e!178460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27096 (= res!143079 (validMask!0 mask!3868))))

(assert (=> start!27096 e!178460))

(declare-fun array_inv!4548 (array!13913) Bool)

(assert (=> start!27096 (array_inv!4548 a!3325)))

(assert (=> start!27096 true))

(declare-fun b!280044 () Bool)

(assert (=> b!280044 (= e!178459 false)))

(declare-fun lt!138816 () Bool)

(assert (=> b!280044 (= lt!138816 (contains!1953 Nil!4316 k0!2581))))

(declare-fun b!280045 () Bool)

(declare-fun res!143080 () Bool)

(assert (=> b!280045 (=> (not res!143080) (not e!178460))))

(declare-fun arrayNoDuplicates!0 (array!13913 (_ BitVec 32) List!4319) Bool)

(assert (=> b!280045 (= res!143080 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4316))))

(assert (= (and start!27096 res!143079) b!280041))

(assert (= (and b!280041 res!143077) b!280036))

(assert (= (and b!280036 res!143076) b!280045))

(assert (= (and b!280045 res!143080) b!280040))

(assert (= (and b!280040 res!143083) b!280037))

(assert (= (and b!280037 res!143078) b!280034))

(assert (= (and b!280034 res!143084) b!280038))

(assert (= (and b!280038 res!143085) b!280039))

(assert (= (and b!280039 res!143081) b!280035))

(assert (= (and b!280035 res!143088) b!280033))

(assert (= (and b!280033 res!143087) b!280042))

(assert (= (and b!280042 res!143082) b!280043))

(assert (= (and b!280043 res!143086) b!280044))

(declare-fun m!294773 () Bool)

(assert (=> b!280037 m!294773))

(declare-fun m!294775 () Bool)

(assert (=> b!280042 m!294775))

(declare-fun m!294777 () Bool)

(assert (=> start!27096 m!294777))

(declare-fun m!294779 () Bool)

(assert (=> start!27096 m!294779))

(declare-fun m!294781 () Bool)

(assert (=> b!280033 m!294781))

(declare-fun m!294783 () Bool)

(assert (=> b!280036 m!294783))

(declare-fun m!294785 () Bool)

(assert (=> b!280034 m!294785))

(declare-fun m!294787 () Bool)

(assert (=> b!280043 m!294787))

(declare-fun m!294789 () Bool)

(assert (=> b!280045 m!294789))

(declare-fun m!294791 () Bool)

(assert (=> b!280044 m!294791))

(declare-fun m!294793 () Bool)

(assert (=> b!280039 m!294793))

(assert (=> b!280039 m!294793))

(declare-fun m!294795 () Bool)

(assert (=> b!280039 m!294795))

(declare-fun m!294797 () Bool)

(assert (=> b!280040 m!294797))

(check-sat (not b!280037) (not b!280033) (not b!280034) (not b!280042) (not b!280039) (not b!280043) (not b!280040) (not b!280036) (not start!27096) (not b!280044) (not b!280045))
(check-sat)
