; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27102 () Bool)

(assert start!27102)

(declare-fun b!280150 () Bool)

(declare-fun res!143202 () Bool)

(declare-fun e!178487 () Bool)

(assert (=> b!280150 (=> (not res!143202) (not e!178487))))

(declare-datatypes ((array!13919 0))(
  ( (array!13920 (arr!6601 (Array (_ BitVec 32) (_ BitVec 64))) (size!6953 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13919)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280150 (= res!143202 (and (= (size!6953 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6953 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6953 a!3325))))))

(declare-fun b!280151 () Bool)

(declare-fun res!143203 () Bool)

(declare-fun e!178485 () Bool)

(assert (=> b!280151 (=> (not res!143203) (not e!178485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280151 (= res!143203 (validKeyInArray!0 (select (arr!6601 a!3325) startIndex!26)))))

(declare-fun b!280152 () Bool)

(declare-fun res!143199 () Bool)

(assert (=> b!280152 (=> (not res!143199) (not e!178485))))

(declare-datatypes ((List!4322 0))(
  ( (Nil!4319) (Cons!4318 (h!4988 (_ BitVec 64)) (t!9396 List!4322)) )
))
(declare-fun contains!1956 (List!4322 (_ BitVec 64)) Bool)

(assert (=> b!280152 (= res!143199 (not (contains!1956 Nil!4319 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280153 () Bool)

(assert (=> b!280153 (= e!178485 false)))

(declare-fun lt!138834 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!280153 (= lt!138834 (contains!1956 Nil!4319 k0!2581))))

(declare-fun b!280154 () Bool)

(declare-fun res!143195 () Bool)

(assert (=> b!280154 (=> (not res!143195) (not e!178487))))

(assert (=> b!280154 (= res!143195 (validKeyInArray!0 k0!2581))))

(declare-fun b!280155 () Bool)

(declare-fun res!143193 () Bool)

(assert (=> b!280155 (=> (not res!143193) (not e!178485))))

(assert (=> b!280155 (= res!143193 (and (bvslt (size!6953 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6953 a!3325))))))

(declare-fun b!280156 () Bool)

(declare-fun res!143198 () Bool)

(assert (=> b!280156 (=> (not res!143198) (not e!178487))))

(declare-fun arrayContainsKey!0 (array!13919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280156 (= res!143198 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280157 () Bool)

(declare-fun res!143205 () Bool)

(assert (=> b!280157 (=> (not res!143205) (not e!178485))))

(assert (=> b!280157 (= res!143205 (not (= startIndex!26 i!1267)))))

(declare-fun b!280158 () Bool)

(declare-fun res!143196 () Bool)

(assert (=> b!280158 (=> (not res!143196) (not e!178485))))

(declare-fun noDuplicate!167 (List!4322) Bool)

(assert (=> b!280158 (= res!143196 (noDuplicate!167 Nil!4319))))

(declare-fun b!280159 () Bool)

(assert (=> b!280159 (= e!178487 e!178485)))

(declare-fun res!143200 () Bool)

(assert (=> b!280159 (=> (not res!143200) (not e!178485))))

(declare-datatypes ((SeekEntryResult!1724 0))(
  ( (MissingZero!1724 (index!9066 (_ BitVec 32))) (Found!1724 (index!9067 (_ BitVec 32))) (Intermediate!1724 (undefined!2536 Bool) (index!9068 (_ BitVec 32)) (x!27418 (_ BitVec 32))) (Undefined!1724) (MissingVacant!1724 (index!9069 (_ BitVec 32))) )
))
(declare-fun lt!138833 () SeekEntryResult!1724)

(assert (=> b!280159 (= res!143200 (or (= lt!138833 (MissingZero!1724 i!1267)) (= lt!138833 (MissingVacant!1724 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13919 (_ BitVec 32)) SeekEntryResult!1724)

(assert (=> b!280159 (= lt!138833 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!143204 () Bool)

(assert (=> start!27102 (=> (not res!143204) (not e!178487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27102 (= res!143204 (validMask!0 mask!3868))))

(assert (=> start!27102 e!178487))

(declare-fun array_inv!4551 (array!13919) Bool)

(assert (=> start!27102 (array_inv!4551 a!3325)))

(assert (=> start!27102 true))

(declare-fun b!280160 () Bool)

(declare-fun res!143194 () Bool)

(assert (=> b!280160 (=> (not res!143194) (not e!178485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13919 (_ BitVec 32)) Bool)

(assert (=> b!280160 (= res!143194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280161 () Bool)

(declare-fun res!143201 () Bool)

(assert (=> b!280161 (=> (not res!143201) (not e!178485))))

(assert (=> b!280161 (= res!143201 (not (contains!1956 Nil!4319 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280162 () Bool)

(declare-fun res!143197 () Bool)

(assert (=> b!280162 (=> (not res!143197) (not e!178487))))

(declare-fun arrayNoDuplicates!0 (array!13919 (_ BitVec 32) List!4322) Bool)

(assert (=> b!280162 (= res!143197 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4319))))

(assert (= (and start!27102 res!143204) b!280150))

(assert (= (and b!280150 res!143202) b!280154))

(assert (= (and b!280154 res!143195) b!280162))

(assert (= (and b!280162 res!143197) b!280156))

(assert (= (and b!280156 res!143198) b!280159))

(assert (= (and b!280159 res!143200) b!280160))

(assert (= (and b!280160 res!143194) b!280157))

(assert (= (and b!280157 res!143205) b!280151))

(assert (= (and b!280151 res!143203) b!280155))

(assert (= (and b!280155 res!143193) b!280158))

(assert (= (and b!280158 res!143196) b!280161))

(assert (= (and b!280161 res!143201) b!280152))

(assert (= (and b!280152 res!143199) b!280153))

(declare-fun m!294851 () Bool)

(assert (=> b!280158 m!294851))

(declare-fun m!294853 () Bool)

(assert (=> b!280153 m!294853))

(declare-fun m!294855 () Bool)

(assert (=> b!280156 m!294855))

(declare-fun m!294857 () Bool)

(assert (=> b!280154 m!294857))

(declare-fun m!294859 () Bool)

(assert (=> b!280152 m!294859))

(declare-fun m!294861 () Bool)

(assert (=> b!280159 m!294861))

(declare-fun m!294863 () Bool)

(assert (=> b!280151 m!294863))

(assert (=> b!280151 m!294863))

(declare-fun m!294865 () Bool)

(assert (=> b!280151 m!294865))

(declare-fun m!294867 () Bool)

(assert (=> b!280160 m!294867))

(declare-fun m!294869 () Bool)

(assert (=> b!280161 m!294869))

(declare-fun m!294871 () Bool)

(assert (=> b!280162 m!294871))

(declare-fun m!294873 () Bool)

(assert (=> start!27102 m!294873))

(declare-fun m!294875 () Bool)

(assert (=> start!27102 m!294875))

(check-sat (not b!280154) (not b!280156) (not b!280151) (not b!280153) (not b!280160) (not b!280152) (not b!280161) (not b!280158) (not b!280162) (not start!27102) (not b!280159))
(check-sat)
