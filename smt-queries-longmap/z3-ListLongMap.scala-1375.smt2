; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27104 () Bool)

(assert start!27104)

(declare-fun b!280142 () Bool)

(declare-fun e!178471 () Bool)

(assert (=> b!280142 (= e!178471 false)))

(declare-fun lt!138781 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4411 0))(
  ( (Nil!4408) (Cons!4407 (h!5077 (_ BitVec 64)) (t!9493 List!4411)) )
))
(declare-fun contains!1983 (List!4411 (_ BitVec 64)) Bool)

(assert (=> b!280142 (= lt!138781 (contains!1983 Nil!4408 k0!2581))))

(declare-fun b!280143 () Bool)

(declare-fun res!143216 () Bool)

(assert (=> b!280143 (=> (not res!143216) (not e!178471))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280143 (= res!143216 (not (= startIndex!26 i!1267)))))

(declare-fun b!280144 () Bool)

(declare-fun res!143218 () Bool)

(declare-fun e!178470 () Bool)

(assert (=> b!280144 (=> (not res!143218) (not e!178470))))

(declare-datatypes ((array!13922 0))(
  ( (array!13923 (arr!6603 (Array (_ BitVec 32) (_ BitVec 64))) (size!6955 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13922)

(declare-fun arrayContainsKey!0 (array!13922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280144 (= res!143218 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280145 () Bool)

(declare-fun res!143217 () Bool)

(assert (=> b!280145 (=> (not res!143217) (not e!178471))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13922 (_ BitVec 32)) Bool)

(assert (=> b!280145 (= res!143217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280147 () Bool)

(declare-fun res!143219 () Bool)

(assert (=> b!280147 (=> (not res!143219) (not e!178470))))

(declare-fun arrayNoDuplicates!0 (array!13922 (_ BitVec 32) List!4411) Bool)

(assert (=> b!280147 (= res!143219 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4408))))

(declare-fun b!280148 () Bool)

(declare-fun res!143213 () Bool)

(assert (=> b!280148 (=> (not res!143213) (not e!178471))))

(assert (=> b!280148 (= res!143213 (not (contains!1983 Nil!4408 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280149 () Bool)

(declare-fun res!143214 () Bool)

(assert (=> b!280149 (=> (not res!143214) (not e!178471))))

(assert (=> b!280149 (= res!143214 (and (bvslt (size!6955 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6955 a!3325))))))

(declare-fun b!280150 () Bool)

(declare-fun res!143211 () Bool)

(assert (=> b!280150 (=> (not res!143211) (not e!178471))))

(declare-fun noDuplicate!165 (List!4411) Bool)

(assert (=> b!280150 (= res!143211 (noDuplicate!165 Nil!4408))))

(declare-fun res!143223 () Bool)

(assert (=> start!27104 (=> (not res!143223) (not e!178470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27104 (= res!143223 (validMask!0 mask!3868))))

(assert (=> start!27104 e!178470))

(declare-fun array_inv!4566 (array!13922) Bool)

(assert (=> start!27104 (array_inv!4566 a!3325)))

(assert (=> start!27104 true))

(declare-fun b!280146 () Bool)

(assert (=> b!280146 (= e!178470 e!178471)))

(declare-fun res!143215 () Bool)

(assert (=> b!280146 (=> (not res!143215) (not e!178471))))

(declare-datatypes ((SeekEntryResult!1761 0))(
  ( (MissingZero!1761 (index!9214 (_ BitVec 32))) (Found!1761 (index!9215 (_ BitVec 32))) (Intermediate!1761 (undefined!2573 Bool) (index!9216 (_ BitVec 32)) (x!27455 (_ BitVec 32))) (Undefined!1761) (MissingVacant!1761 (index!9217 (_ BitVec 32))) )
))
(declare-fun lt!138780 () SeekEntryResult!1761)

(assert (=> b!280146 (= res!143215 (or (= lt!138780 (MissingZero!1761 i!1267)) (= lt!138780 (MissingVacant!1761 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13922 (_ BitVec 32)) SeekEntryResult!1761)

(assert (=> b!280146 (= lt!138780 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280151 () Bool)

(declare-fun res!143212 () Bool)

(assert (=> b!280151 (=> (not res!143212) (not e!178471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280151 (= res!143212 (validKeyInArray!0 (select (arr!6603 a!3325) startIndex!26)))))

(declare-fun b!280152 () Bool)

(declare-fun res!143220 () Bool)

(assert (=> b!280152 (=> (not res!143220) (not e!178470))))

(assert (=> b!280152 (= res!143220 (and (= (size!6955 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6955 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6955 a!3325))))))

(declare-fun b!280153 () Bool)

(declare-fun res!143221 () Bool)

(assert (=> b!280153 (=> (not res!143221) (not e!178470))))

(assert (=> b!280153 (= res!143221 (validKeyInArray!0 k0!2581))))

(declare-fun b!280154 () Bool)

(declare-fun res!143222 () Bool)

(assert (=> b!280154 (=> (not res!143222) (not e!178471))))

(assert (=> b!280154 (= res!143222 (not (contains!1983 Nil!4408 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!27104 res!143223) b!280152))

(assert (= (and b!280152 res!143220) b!280153))

(assert (= (and b!280153 res!143221) b!280147))

(assert (= (and b!280147 res!143219) b!280144))

(assert (= (and b!280144 res!143218) b!280146))

(assert (= (and b!280146 res!143215) b!280145))

(assert (= (and b!280145 res!143217) b!280143))

(assert (= (and b!280143 res!143216) b!280151))

(assert (= (and b!280151 res!143212) b!280149))

(assert (= (and b!280149 res!143214) b!280150))

(assert (= (and b!280150 res!143211) b!280148))

(assert (= (and b!280148 res!143213) b!280154))

(assert (= (and b!280154 res!143222) b!280142))

(declare-fun m!294671 () Bool)

(assert (=> b!280154 m!294671))

(declare-fun m!294673 () Bool)

(assert (=> b!280151 m!294673))

(assert (=> b!280151 m!294673))

(declare-fun m!294675 () Bool)

(assert (=> b!280151 m!294675))

(declare-fun m!294677 () Bool)

(assert (=> start!27104 m!294677))

(declare-fun m!294679 () Bool)

(assert (=> start!27104 m!294679))

(declare-fun m!294681 () Bool)

(assert (=> b!280153 m!294681))

(declare-fun m!294683 () Bool)

(assert (=> b!280147 m!294683))

(declare-fun m!294685 () Bool)

(assert (=> b!280146 m!294685))

(declare-fun m!294687 () Bool)

(assert (=> b!280142 m!294687))

(declare-fun m!294689 () Bool)

(assert (=> b!280150 m!294689))

(declare-fun m!294691 () Bool)

(assert (=> b!280148 m!294691))

(declare-fun m!294693 () Bool)

(assert (=> b!280145 m!294693))

(declare-fun m!294695 () Bool)

(assert (=> b!280144 m!294695))

(check-sat (not b!280148) (not b!280147) (not b!280145) (not b!280144) (not b!280151) (not b!280154) (not b!280146) (not start!27104) (not b!280150) (not b!280142) (not b!280153))
(check-sat)
