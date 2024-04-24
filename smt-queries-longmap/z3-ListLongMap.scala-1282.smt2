; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26250 () Bool)

(assert start!26250)

(declare-fun b!271841 () Bool)

(declare-fun res!135812 () Bool)

(declare-fun e!174665 () Bool)

(assert (=> b!271841 (=> (not res!135812) (not e!174665))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271841 (= res!135812 (validKeyInArray!0 k0!2581))))

(declare-fun b!271842 () Bool)

(declare-fun res!135806 () Bool)

(declare-fun e!174663 () Bool)

(assert (=> b!271842 (=> (not res!135806) (not e!174663))))

(declare-datatypes ((array!13346 0))(
  ( (array!13347 (arr!6322 (Array (_ BitVec 32) (_ BitVec 64))) (size!6674 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13346)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271842 (= res!135806 (validKeyInArray!0 (select (arr!6322 a!3325) startIndex!26)))))

(declare-fun b!271843 () Bool)

(declare-fun res!135808 () Bool)

(assert (=> b!271843 (=> (not res!135808) (not e!174663))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13346 (_ BitVec 32)) Bool)

(assert (=> b!271843 (= res!135808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271844 () Bool)

(declare-fun res!135809 () Bool)

(assert (=> b!271844 (=> (not res!135809) (not e!174665))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271844 (= res!135809 (and (= (size!6674 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6674 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6674 a!3325))))))

(declare-fun b!271845 () Bool)

(declare-fun res!135810 () Bool)

(assert (=> b!271845 (=> (not res!135810) (not e!174665))))

(declare-datatypes ((List!4043 0))(
  ( (Nil!4040) (Cons!4039 (h!4706 (_ BitVec 64)) (t!9117 List!4043)) )
))
(declare-fun arrayNoDuplicates!0 (array!13346 (_ BitVec 32) List!4043) Bool)

(assert (=> b!271845 (= res!135810 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4040))))

(declare-fun res!135807 () Bool)

(assert (=> start!26250 (=> (not res!135807) (not e!174665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26250 (= res!135807 (validMask!0 mask!3868))))

(assert (=> start!26250 e!174665))

(declare-fun array_inv!4272 (array!13346) Bool)

(assert (=> start!26250 (array_inv!4272 a!3325)))

(assert (=> start!26250 true))

(declare-fun b!271846 () Bool)

(assert (=> b!271846 (= e!174663 (not true))))

(assert (=> b!271846 (arrayNoDuplicates!0 (array!13347 (store (arr!6322 a!3325) i!1267 k0!2581) (size!6674 a!3325)) #b00000000000000000000000000000000 Nil!4040)))

(declare-datatypes ((Unit!8429 0))(
  ( (Unit!8430) )
))
(declare-fun lt!135918 () Unit!8429)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13346 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4043) Unit!8429)

(assert (=> b!271846 (= lt!135918 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4040))))

(declare-fun b!271847 () Bool)

(declare-fun res!135805 () Bool)

(assert (=> b!271847 (=> (not res!135805) (not e!174663))))

(assert (=> b!271847 (= res!135805 (not (= startIndex!26 i!1267)))))

(declare-fun b!271848 () Bool)

(declare-fun res!135811 () Bool)

(assert (=> b!271848 (=> (not res!135811) (not e!174665))))

(declare-fun arrayContainsKey!0 (array!13346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271848 (= res!135811 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271849 () Bool)

(assert (=> b!271849 (= e!174665 e!174663)))

(declare-fun res!135813 () Bool)

(assert (=> b!271849 (=> (not res!135813) (not e!174663))))

(declare-datatypes ((SeekEntryResult!1445 0))(
  ( (MissingZero!1445 (index!7950 (_ BitVec 32))) (Found!1445 (index!7951 (_ BitVec 32))) (Intermediate!1445 (undefined!2257 Bool) (index!7952 (_ BitVec 32)) (x!26386 (_ BitVec 32))) (Undefined!1445) (MissingVacant!1445 (index!7953 (_ BitVec 32))) )
))
(declare-fun lt!135917 () SeekEntryResult!1445)

(assert (=> b!271849 (= res!135813 (or (= lt!135917 (MissingZero!1445 i!1267)) (= lt!135917 (MissingVacant!1445 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13346 (_ BitVec 32)) SeekEntryResult!1445)

(assert (=> b!271849 (= lt!135917 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26250 res!135807) b!271844))

(assert (= (and b!271844 res!135809) b!271841))

(assert (= (and b!271841 res!135812) b!271845))

(assert (= (and b!271845 res!135810) b!271848))

(assert (= (and b!271848 res!135811) b!271849))

(assert (= (and b!271849 res!135813) b!271843))

(assert (= (and b!271843 res!135808) b!271847))

(assert (= (and b!271847 res!135805) b!271842))

(assert (= (and b!271842 res!135806) b!271846))

(declare-fun m!287171 () Bool)

(assert (=> b!271843 m!287171))

(declare-fun m!287173 () Bool)

(assert (=> start!26250 m!287173))

(declare-fun m!287175 () Bool)

(assert (=> start!26250 m!287175))

(declare-fun m!287177 () Bool)

(assert (=> b!271842 m!287177))

(assert (=> b!271842 m!287177))

(declare-fun m!287179 () Bool)

(assert (=> b!271842 m!287179))

(declare-fun m!287181 () Bool)

(assert (=> b!271848 m!287181))

(declare-fun m!287183 () Bool)

(assert (=> b!271845 m!287183))

(declare-fun m!287185 () Bool)

(assert (=> b!271841 m!287185))

(declare-fun m!287187 () Bool)

(assert (=> b!271846 m!287187))

(declare-fun m!287189 () Bool)

(assert (=> b!271846 m!287189))

(declare-fun m!287191 () Bool)

(assert (=> b!271846 m!287191))

(declare-fun m!287193 () Bool)

(assert (=> b!271849 m!287193))

(check-sat (not b!271845) (not b!271842) (not b!271841) (not b!271846) (not b!271849) (not b!271848) (not b!271843) (not start!26250))
(check-sat)
