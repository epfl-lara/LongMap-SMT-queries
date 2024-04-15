; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26252 () Bool)

(assert start!26252)

(declare-fun res!135695 () Bool)

(declare-fun e!174539 () Bool)

(assert (=> start!26252 (=> (not res!135695) (not e!174539))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26252 (= res!135695 (validMask!0 mask!3868))))

(assert (=> start!26252 e!174539))

(declare-datatypes ((array!13338 0))(
  ( (array!13339 (arr!6318 (Array (_ BitVec 32) (_ BitVec 64))) (size!6671 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13338)

(declare-fun array_inv!4290 (array!13338) Bool)

(assert (=> start!26252 (array_inv!4290 a!3325)))

(assert (=> start!26252 true))

(declare-fun b!271647 () Bool)

(declare-fun res!135690 () Bool)

(assert (=> b!271647 (=> (not res!135690) (not e!174539))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271647 (= res!135690 (validKeyInArray!0 k0!2581))))

(declare-fun b!271648 () Bool)

(declare-fun e!174540 () Bool)

(assert (=> b!271648 (= e!174540 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((List!4099 0))(
  ( (Nil!4096) (Cons!4095 (h!4762 (_ BitVec 64)) (t!9172 List!4099)) )
))
(declare-fun arrayNoDuplicates!0 (array!13338 (_ BitVec 32) List!4099) Bool)

(assert (=> b!271648 (arrayNoDuplicates!0 (array!13339 (store (arr!6318 a!3325) i!1267 k0!2581) (size!6671 a!3325)) #b00000000000000000000000000000000 Nil!4096)))

(declare-datatypes ((Unit!8403 0))(
  ( (Unit!8404) )
))
(declare-fun lt!135677 () Unit!8403)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4099) Unit!8403)

(assert (=> b!271648 (= lt!135677 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4096))))

(declare-fun b!271649 () Bool)

(assert (=> b!271649 (= e!174539 e!174540)))

(declare-fun res!135693 () Bool)

(assert (=> b!271649 (=> (not res!135693) (not e!174540))))

(declare-datatypes ((SeekEntryResult!1475 0))(
  ( (MissingZero!1475 (index!8070 (_ BitVec 32))) (Found!1475 (index!8071 (_ BitVec 32))) (Intermediate!1475 (undefined!2287 Bool) (index!8072 (_ BitVec 32)) (x!26415 (_ BitVec 32))) (Undefined!1475) (MissingVacant!1475 (index!8073 (_ BitVec 32))) )
))
(declare-fun lt!135678 () SeekEntryResult!1475)

(assert (=> b!271649 (= res!135693 (or (= lt!135678 (MissingZero!1475 i!1267)) (= lt!135678 (MissingVacant!1475 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13338 (_ BitVec 32)) SeekEntryResult!1475)

(assert (=> b!271649 (= lt!135678 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271650 () Bool)

(declare-fun res!135692 () Bool)

(assert (=> b!271650 (=> (not res!135692) (not e!174540))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271650 (= res!135692 (not (= startIndex!26 i!1267)))))

(declare-fun b!271651 () Bool)

(declare-fun res!135697 () Bool)

(assert (=> b!271651 (=> (not res!135697) (not e!174540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13338 (_ BitVec 32)) Bool)

(assert (=> b!271651 (= res!135697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271652 () Bool)

(declare-fun res!135691 () Bool)

(assert (=> b!271652 (=> (not res!135691) (not e!174539))))

(declare-fun arrayContainsKey!0 (array!13338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271652 (= res!135691 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271653 () Bool)

(declare-fun res!135689 () Bool)

(assert (=> b!271653 (=> (not res!135689) (not e!174539))))

(assert (=> b!271653 (= res!135689 (and (= (size!6671 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6671 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6671 a!3325))))))

(declare-fun b!271654 () Bool)

(declare-fun res!135694 () Bool)

(assert (=> b!271654 (=> (not res!135694) (not e!174539))))

(assert (=> b!271654 (= res!135694 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4096))))

(declare-fun b!271655 () Bool)

(declare-fun res!135696 () Bool)

(assert (=> b!271655 (=> (not res!135696) (not e!174540))))

(assert (=> b!271655 (= res!135696 (validKeyInArray!0 (select (arr!6318 a!3325) startIndex!26)))))

(assert (= (and start!26252 res!135695) b!271653))

(assert (= (and b!271653 res!135689) b!271647))

(assert (= (and b!271647 res!135690) b!271654))

(assert (= (and b!271654 res!135694) b!271652))

(assert (= (and b!271652 res!135691) b!271649))

(assert (= (and b!271649 res!135693) b!271651))

(assert (= (and b!271651 res!135697) b!271650))

(assert (= (and b!271650 res!135692) b!271655))

(assert (= (and b!271655 res!135696) b!271648))

(declare-fun m!286373 () Bool)

(assert (=> b!271649 m!286373))

(declare-fun m!286375 () Bool)

(assert (=> b!271655 m!286375))

(assert (=> b!271655 m!286375))

(declare-fun m!286377 () Bool)

(assert (=> b!271655 m!286377))

(declare-fun m!286379 () Bool)

(assert (=> b!271651 m!286379))

(declare-fun m!286381 () Bool)

(assert (=> b!271648 m!286381))

(declare-fun m!286383 () Bool)

(assert (=> b!271648 m!286383))

(declare-fun m!286385 () Bool)

(assert (=> b!271648 m!286385))

(declare-fun m!286387 () Bool)

(assert (=> start!26252 m!286387))

(declare-fun m!286389 () Bool)

(assert (=> start!26252 m!286389))

(declare-fun m!286391 () Bool)

(assert (=> b!271647 m!286391))

(declare-fun m!286393 () Bool)

(assert (=> b!271652 m!286393))

(declare-fun m!286395 () Bool)

(assert (=> b!271654 m!286395))

(check-sat (not b!271649) (not b!271647) (not b!271654) (not b!271651) (not b!271655) (not start!26252) (not b!271648) (not b!271652))
(check-sat)
