; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27110 () Bool)

(assert start!27110)

(declare-fun b!280073 () Bool)

(declare-fun e!178389 () Bool)

(assert (=> b!280073 (= e!178389 false)))

(declare-fun lt!138611 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4381 0))(
  ( (Nil!4378) (Cons!4377 (h!5047 (_ BitVec 64)) (t!9454 List!4381)) )
))
(declare-fun contains!1960 (List!4381 (_ BitVec 64)) Bool)

(assert (=> b!280073 (= lt!138611 (contains!1960 Nil!4378 k0!2581))))

(declare-fun res!143205 () Bool)

(declare-fun e!178387 () Bool)

(assert (=> start!27110 (=> (not res!143205) (not e!178387))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27110 (= res!143205 (validMask!0 mask!3868))))

(assert (=> start!27110 e!178387))

(declare-datatypes ((array!13917 0))(
  ( (array!13918 (arr!6600 (Array (_ BitVec 32) (_ BitVec 64))) (size!6953 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13917)

(declare-fun array_inv!4572 (array!13917) Bool)

(assert (=> start!27110 (array_inv!4572 a!3325)))

(assert (=> start!27110 true))

(declare-fun b!280074 () Bool)

(declare-fun res!143195 () Bool)

(assert (=> b!280074 (=> (not res!143195) (not e!178389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13917 (_ BitVec 32)) Bool)

(assert (=> b!280074 (= res!143195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280075 () Bool)

(declare-fun res!143194 () Bool)

(assert (=> b!280075 (=> (not res!143194) (not e!178387))))

(declare-fun arrayNoDuplicates!0 (array!13917 (_ BitVec 32) List!4381) Bool)

(assert (=> b!280075 (= res!143194 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4378))))

(declare-fun b!280076 () Bool)

(declare-fun res!143204 () Bool)

(assert (=> b!280076 (=> (not res!143204) (not e!178389))))

(assert (=> b!280076 (= res!143204 (not (contains!1960 Nil!4378 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280077 () Bool)

(declare-fun res!143196 () Bool)

(assert (=> b!280077 (=> (not res!143196) (not e!178387))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280077 (= res!143196 (and (= (size!6953 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6953 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6953 a!3325))))))

(declare-fun b!280078 () Bool)

(declare-fun res!143198 () Bool)

(assert (=> b!280078 (=> (not res!143198) (not e!178387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280078 (= res!143198 (validKeyInArray!0 k0!2581))))

(declare-fun b!280079 () Bool)

(declare-fun res!143199 () Bool)

(assert (=> b!280079 (=> (not res!143199) (not e!178387))))

(declare-fun arrayContainsKey!0 (array!13917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280079 (= res!143199 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280080 () Bool)

(assert (=> b!280080 (= e!178387 e!178389)))

(declare-fun res!143201 () Bool)

(assert (=> b!280080 (=> (not res!143201) (not e!178389))))

(declare-datatypes ((SeekEntryResult!1757 0))(
  ( (MissingZero!1757 (index!9198 (_ BitVec 32))) (Found!1757 (index!9199 (_ BitVec 32))) (Intermediate!1757 (undefined!2569 Bool) (index!9200 (_ BitVec 32)) (x!27458 (_ BitVec 32))) (Undefined!1757) (MissingVacant!1757 (index!9201 (_ BitVec 32))) )
))
(declare-fun lt!138612 () SeekEntryResult!1757)

(assert (=> b!280080 (= res!143201 (or (= lt!138612 (MissingZero!1757 i!1267)) (= lt!138612 (MissingVacant!1757 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13917 (_ BitVec 32)) SeekEntryResult!1757)

(assert (=> b!280080 (= lt!138612 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280081 () Bool)

(declare-fun res!143200 () Bool)

(assert (=> b!280081 (=> (not res!143200) (not e!178389))))

(declare-fun noDuplicate!169 (List!4381) Bool)

(assert (=> b!280081 (= res!143200 (noDuplicate!169 Nil!4378))))

(declare-fun b!280082 () Bool)

(declare-fun res!143202 () Bool)

(assert (=> b!280082 (=> (not res!143202) (not e!178389))))

(assert (=> b!280082 (= res!143202 (validKeyInArray!0 (select (arr!6600 a!3325) startIndex!26)))))

(declare-fun b!280083 () Bool)

(declare-fun res!143197 () Bool)

(assert (=> b!280083 (=> (not res!143197) (not e!178389))))

(assert (=> b!280083 (= res!143197 (not (contains!1960 Nil!4378 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280084 () Bool)

(declare-fun res!143206 () Bool)

(assert (=> b!280084 (=> (not res!143206) (not e!178389))))

(assert (=> b!280084 (= res!143206 (not (= startIndex!26 i!1267)))))

(declare-fun b!280085 () Bool)

(declare-fun res!143203 () Bool)

(assert (=> b!280085 (=> (not res!143203) (not e!178389))))

(assert (=> b!280085 (= res!143203 (and (bvslt (size!6953 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6953 a!3325))))))

(assert (= (and start!27110 res!143205) b!280077))

(assert (= (and b!280077 res!143196) b!280078))

(assert (= (and b!280078 res!143198) b!280075))

(assert (= (and b!280075 res!143194) b!280079))

(assert (= (and b!280079 res!143199) b!280080))

(assert (= (and b!280080 res!143201) b!280074))

(assert (= (and b!280074 res!143195) b!280084))

(assert (= (and b!280084 res!143206) b!280082))

(assert (= (and b!280082 res!143202) b!280085))

(assert (= (and b!280085 res!143203) b!280081))

(assert (= (and b!280081 res!143200) b!280076))

(assert (= (and b!280076 res!143204) b!280083))

(assert (= (and b!280083 res!143197) b!280073))

(declare-fun m!294131 () Bool)

(assert (=> b!280080 m!294131))

(declare-fun m!294133 () Bool)

(assert (=> b!280073 m!294133))

(declare-fun m!294135 () Bool)

(assert (=> b!280074 m!294135))

(declare-fun m!294137 () Bool)

(assert (=> start!27110 m!294137))

(declare-fun m!294139 () Bool)

(assert (=> start!27110 m!294139))

(declare-fun m!294141 () Bool)

(assert (=> b!280075 m!294141))

(declare-fun m!294143 () Bool)

(assert (=> b!280078 m!294143))

(declare-fun m!294145 () Bool)

(assert (=> b!280079 m!294145))

(declare-fun m!294147 () Bool)

(assert (=> b!280081 m!294147))

(declare-fun m!294149 () Bool)

(assert (=> b!280082 m!294149))

(assert (=> b!280082 m!294149))

(declare-fun m!294151 () Bool)

(assert (=> b!280082 m!294151))

(declare-fun m!294153 () Bool)

(assert (=> b!280076 m!294153))

(declare-fun m!294155 () Bool)

(assert (=> b!280083 m!294155))

(check-sat (not b!280080) (not b!280083) (not b!280073) (not b!280078) (not b!280075) (not b!280074) (not b!280079) (not start!27110) (not b!280082) (not b!280076) (not b!280081))
(check-sat)
