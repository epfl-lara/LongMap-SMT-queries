; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27212 () Bool)

(assert start!27212)

(declare-fun res!144763 () Bool)

(declare-fun e!178980 () Bool)

(assert (=> start!27212 (=> (not res!144763) (not e!178980))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27212 (= res!144763 (validMask!0 mask!3868))))

(assert (=> start!27212 e!178980))

(declare-datatypes ((array!14030 0))(
  ( (array!14031 (arr!6657 (Array (_ BitVec 32) (_ BitVec 64))) (size!7009 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14030)

(declare-fun array_inv!4620 (array!14030) Bool)

(assert (=> start!27212 (array_inv!4620 a!3325)))

(assert (=> start!27212 true))

(declare-fun b!281688 () Bool)

(declare-fun e!178982 () Bool)

(assert (=> b!281688 (= e!178982 (not (bvsle #b00000000000000000000000000000000 (size!7009 a!3325))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!139152 () array!14030)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1815 0))(
  ( (MissingZero!1815 (index!9430 (_ BitVec 32))) (Found!1815 (index!9431 (_ BitVec 32))) (Intermediate!1815 (undefined!2627 Bool) (index!9432 (_ BitVec 32)) (x!27653 (_ BitVec 32))) (Undefined!1815) (MissingVacant!1815 (index!9433 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14030 (_ BitVec 32)) SeekEntryResult!1815)

(assert (=> b!281688 (= (seekEntryOrOpen!0 (select (arr!6657 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6657 a!3325) i!1267 k0!2581) startIndex!26) lt!139152 mask!3868))))

(declare-datatypes ((Unit!8914 0))(
  ( (Unit!8915) )
))
(declare-fun lt!139151 () Unit!8914)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14030 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8914)

(assert (=> b!281688 (= lt!139151 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4465 0))(
  ( (Nil!4462) (Cons!4461 (h!5131 (_ BitVec 64)) (t!9547 List!4465)) )
))
(declare-fun arrayNoDuplicates!0 (array!14030 (_ BitVec 32) List!4465) Bool)

(assert (=> b!281688 (arrayNoDuplicates!0 lt!139152 #b00000000000000000000000000000000 Nil!4462)))

(declare-fun lt!139153 () Unit!8914)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14030 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4465) Unit!8914)

(assert (=> b!281688 (= lt!139153 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4462))))

(declare-fun b!281689 () Bool)

(declare-fun e!178979 () Bool)

(assert (=> b!281689 (= e!178980 e!178979)))

(declare-fun res!144764 () Bool)

(assert (=> b!281689 (=> (not res!144764) (not e!178979))))

(declare-fun lt!139150 () SeekEntryResult!1815)

(assert (=> b!281689 (= res!144764 (or (= lt!139150 (MissingZero!1815 i!1267)) (= lt!139150 (MissingVacant!1815 i!1267))))))

(assert (=> b!281689 (= lt!139150 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281690 () Bool)

(declare-fun res!144759 () Bool)

(assert (=> b!281690 (=> (not res!144759) (not e!178980))))

(assert (=> b!281690 (= res!144759 (and (= (size!7009 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7009 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7009 a!3325))))))

(declare-fun b!281691 () Bool)

(assert (=> b!281691 (= e!178979 e!178982)))

(declare-fun res!144758 () Bool)

(assert (=> b!281691 (=> (not res!144758) (not e!178982))))

(assert (=> b!281691 (= res!144758 (not (= startIndex!26 i!1267)))))

(assert (=> b!281691 (= lt!139152 (array!14031 (store (arr!6657 a!3325) i!1267 k0!2581) (size!7009 a!3325)))))

(declare-fun b!281692 () Bool)

(declare-fun res!144760 () Bool)

(assert (=> b!281692 (=> (not res!144760) (not e!178980))))

(assert (=> b!281692 (= res!144760 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4462))))

(declare-fun b!281693 () Bool)

(declare-fun res!144762 () Bool)

(assert (=> b!281693 (=> (not res!144762) (not e!178982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281693 (= res!144762 (validKeyInArray!0 (select (arr!6657 a!3325) startIndex!26)))))

(declare-fun b!281694 () Bool)

(declare-fun res!144765 () Bool)

(assert (=> b!281694 (=> (not res!144765) (not e!178980))))

(assert (=> b!281694 (= res!144765 (validKeyInArray!0 k0!2581))))

(declare-fun b!281695 () Bool)

(declare-fun res!144761 () Bool)

(assert (=> b!281695 (=> (not res!144761) (not e!178980))))

(declare-fun arrayContainsKey!0 (array!14030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281695 (= res!144761 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281696 () Bool)

(declare-fun res!144757 () Bool)

(assert (=> b!281696 (=> (not res!144757) (not e!178979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14030 (_ BitVec 32)) Bool)

(assert (=> b!281696 (= res!144757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27212 res!144763) b!281690))

(assert (= (and b!281690 res!144759) b!281694))

(assert (= (and b!281694 res!144765) b!281692))

(assert (= (and b!281692 res!144760) b!281695))

(assert (= (and b!281695 res!144761) b!281689))

(assert (= (and b!281689 res!144764) b!281696))

(assert (= (and b!281696 res!144757) b!281691))

(assert (= (and b!281691 res!144758) b!281693))

(assert (= (and b!281693 res!144762) b!281688))

(declare-fun m!296039 () Bool)

(assert (=> start!27212 m!296039))

(declare-fun m!296041 () Bool)

(assert (=> start!27212 m!296041))

(declare-fun m!296043 () Bool)

(assert (=> b!281688 m!296043))

(declare-fun m!296045 () Bool)

(assert (=> b!281688 m!296045))

(declare-fun m!296047 () Bool)

(assert (=> b!281688 m!296047))

(declare-fun m!296049 () Bool)

(assert (=> b!281688 m!296049))

(declare-fun m!296051 () Bool)

(assert (=> b!281688 m!296051))

(assert (=> b!281688 m!296047))

(declare-fun m!296053 () Bool)

(assert (=> b!281688 m!296053))

(declare-fun m!296055 () Bool)

(assert (=> b!281688 m!296055))

(declare-fun m!296057 () Bool)

(assert (=> b!281688 m!296057))

(assert (=> b!281688 m!296055))

(declare-fun m!296059 () Bool)

(assert (=> b!281694 m!296059))

(declare-fun m!296061 () Bool)

(assert (=> b!281695 m!296061))

(assert (=> b!281691 m!296045))

(declare-fun m!296063 () Bool)

(assert (=> b!281689 m!296063))

(declare-fun m!296065 () Bool)

(assert (=> b!281696 m!296065))

(declare-fun m!296067 () Bool)

(assert (=> b!281692 m!296067))

(assert (=> b!281693 m!296047))

(assert (=> b!281693 m!296047))

(declare-fun m!296069 () Bool)

(assert (=> b!281693 m!296069))

(check-sat (not b!281694) (not b!281693) (not b!281692) (not b!281689) (not b!281695) (not start!27212) (not b!281696) (not b!281688))
(check-sat)
