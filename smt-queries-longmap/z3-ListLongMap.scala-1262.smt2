; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26132 () Bool)

(assert start!26132)

(declare-fun b!269552 () Bool)

(declare-fun res!133758 () Bool)

(declare-fun e!173849 () Bool)

(assert (=> b!269552 (=> (not res!133758) (not e!173849))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269552 (= res!133758 (= startIndex!26 i!1267))))

(declare-fun b!269553 () Bool)

(declare-datatypes ((Unit!8322 0))(
  ( (Unit!8323) )
))
(declare-fun e!173850 () Unit!8322)

(declare-fun lt!135095 () Unit!8322)

(assert (=> b!269553 (= e!173850 lt!135095)))

(declare-datatypes ((array!13218 0))(
  ( (array!13219 (arr!6258 (Array (_ BitVec 32) (_ BitVec 64))) (size!6611 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13218)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13218 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8322)

(assert (=> b!269553 (= lt!135095 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13218 (_ BitVec 32)) Bool)

(assert (=> b!269553 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13219 (store (arr!6258 a!3325) i!1267 k0!2581) (size!6611 a!3325)) mask!3868)))

(declare-fun b!269554 () Bool)

(declare-fun Unit!8324 () Unit!8322)

(assert (=> b!269554 (= e!173850 Unit!8324)))

(declare-fun b!269555 () Bool)

(declare-fun res!133753 () Bool)

(declare-fun e!173848 () Bool)

(assert (=> b!269555 (=> (not res!133753) (not e!173848))))

(assert (=> b!269555 (= res!133753 (and (= (size!6611 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6611 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6611 a!3325))))))

(declare-fun res!133757 () Bool)

(assert (=> start!26132 (=> (not res!133757) (not e!173848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26132 (= res!133757 (validMask!0 mask!3868))))

(assert (=> start!26132 e!173848))

(declare-fun array_inv!4230 (array!13218) Bool)

(assert (=> start!26132 (array_inv!4230 a!3325)))

(assert (=> start!26132 true))

(declare-fun b!269556 () Bool)

(assert (=> b!269556 (= e!173849 false)))

(declare-fun lt!135094 () Unit!8322)

(assert (=> b!269556 (= lt!135094 e!173850)))

(declare-fun c!45451 () Bool)

(assert (=> b!269556 (= c!45451 (bvslt startIndex!26 (bvsub (size!6611 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269557 () Bool)

(declare-fun res!133752 () Bool)

(assert (=> b!269557 (=> (not res!133752) (not e!173849))))

(assert (=> b!269557 (= res!133752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269558 () Bool)

(declare-fun res!133756 () Bool)

(assert (=> b!269558 (=> (not res!133756) (not e!173848))))

(declare-fun arrayContainsKey!0 (array!13218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269558 (= res!133756 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269559 () Bool)

(declare-fun res!133755 () Bool)

(assert (=> b!269559 (=> (not res!133755) (not e!173848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269559 (= res!133755 (validKeyInArray!0 k0!2581))))

(declare-fun b!269560 () Bool)

(declare-fun res!133754 () Bool)

(assert (=> b!269560 (=> (not res!133754) (not e!173848))))

(declare-datatypes ((List!4039 0))(
  ( (Nil!4036) (Cons!4035 (h!4702 (_ BitVec 64)) (t!9112 List!4039)) )
))
(declare-fun arrayNoDuplicates!0 (array!13218 (_ BitVec 32) List!4039) Bool)

(assert (=> b!269560 (= res!133754 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4036))))

(declare-fun b!269561 () Bool)

(assert (=> b!269561 (= e!173848 e!173849)))

(declare-fun res!133759 () Bool)

(assert (=> b!269561 (=> (not res!133759) (not e!173849))))

(declare-datatypes ((SeekEntryResult!1415 0))(
  ( (MissingZero!1415 (index!7830 (_ BitVec 32))) (Found!1415 (index!7831 (_ BitVec 32))) (Intermediate!1415 (undefined!2227 Bool) (index!7832 (_ BitVec 32)) (x!26195 (_ BitVec 32))) (Undefined!1415) (MissingVacant!1415 (index!7833 (_ BitVec 32))) )
))
(declare-fun lt!135096 () SeekEntryResult!1415)

(assert (=> b!269561 (= res!133759 (or (= lt!135096 (MissingZero!1415 i!1267)) (= lt!135096 (MissingVacant!1415 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13218 (_ BitVec 32)) SeekEntryResult!1415)

(assert (=> b!269561 (= lt!135096 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26132 res!133757) b!269555))

(assert (= (and b!269555 res!133753) b!269559))

(assert (= (and b!269559 res!133755) b!269560))

(assert (= (and b!269560 res!133754) b!269558))

(assert (= (and b!269558 res!133756) b!269561))

(assert (= (and b!269561 res!133759) b!269557))

(assert (= (and b!269557 res!133752) b!269552))

(assert (= (and b!269552 res!133758) b!269556))

(assert (= (and b!269556 c!45451) b!269553))

(assert (= (and b!269556 (not c!45451)) b!269554))

(declare-fun m!284879 () Bool)

(assert (=> b!269561 m!284879))

(declare-fun m!284881 () Bool)

(assert (=> b!269557 m!284881))

(declare-fun m!284883 () Bool)

(assert (=> b!269560 m!284883))

(declare-fun m!284885 () Bool)

(assert (=> b!269553 m!284885))

(declare-fun m!284887 () Bool)

(assert (=> b!269553 m!284887))

(declare-fun m!284889 () Bool)

(assert (=> b!269553 m!284889))

(declare-fun m!284891 () Bool)

(assert (=> b!269558 m!284891))

(declare-fun m!284893 () Bool)

(assert (=> start!26132 m!284893))

(declare-fun m!284895 () Bool)

(assert (=> start!26132 m!284895))

(declare-fun m!284897 () Bool)

(assert (=> b!269559 m!284897))

(check-sat (not b!269558) (not b!269553) (not start!26132) (not b!269559) (not b!269557) (not b!269561) (not b!269560))
(check-sat)
