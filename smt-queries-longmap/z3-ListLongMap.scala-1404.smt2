; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27278 () Bool)

(assert start!27278)

(declare-fun b!282579 () Bool)

(declare-fun res!145655 () Bool)

(declare-fun e!179378 () Bool)

(assert (=> b!282579 (=> (not res!145655) (not e!179378))))

(declare-datatypes ((array!14096 0))(
  ( (array!14097 (arr!6690 (Array (_ BitVec 32) (_ BitVec 64))) (size!7042 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14096)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282579 (= res!145655 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282581 () Bool)

(declare-fun res!145648 () Bool)

(assert (=> b!282581 (=> (not res!145648) (not e!179378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282581 (= res!145648 (validKeyInArray!0 k0!2581))))

(declare-fun b!282582 () Bool)

(declare-fun e!179376 () Bool)

(assert (=> b!282582 (= e!179376 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14096 (_ BitVec 32)) Bool)

(assert (=> b!282582 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8980 0))(
  ( (Unit!8981) )
))
(declare-fun lt!139623 () Unit!8980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8980)

(assert (=> b!282582 (= lt!139623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!139624 () array!14096)

(declare-datatypes ((SeekEntryResult!1848 0))(
  ( (MissingZero!1848 (index!9562 (_ BitVec 32))) (Found!1848 (index!9563 (_ BitVec 32))) (Intermediate!1848 (undefined!2660 Bool) (index!9564 (_ BitVec 32)) (x!27774 (_ BitVec 32))) (Undefined!1848) (MissingVacant!1848 (index!9565 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14096 (_ BitVec 32)) SeekEntryResult!1848)

(assert (=> b!282582 (= (seekEntryOrOpen!0 (select (arr!6690 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6690 a!3325) i!1267 k0!2581) startIndex!26) lt!139624 mask!3868))))

(declare-fun lt!139625 () Unit!8980)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14096 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8980)

(assert (=> b!282582 (= lt!139625 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4498 0))(
  ( (Nil!4495) (Cons!4494 (h!5164 (_ BitVec 64)) (t!9580 List!4498)) )
))
(declare-fun arrayNoDuplicates!0 (array!14096 (_ BitVec 32) List!4498) Bool)

(assert (=> b!282582 (arrayNoDuplicates!0 lt!139624 #b00000000000000000000000000000000 Nil!4495)))

(declare-fun lt!139626 () Unit!8980)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14096 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4498) Unit!8980)

(assert (=> b!282582 (= lt!139626 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4495))))

(declare-fun b!282583 () Bool)

(declare-fun res!145651 () Bool)

(declare-fun e!179377 () Bool)

(assert (=> b!282583 (=> (not res!145651) (not e!179377))))

(assert (=> b!282583 (= res!145651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282584 () Bool)

(assert (=> b!282584 (= e!179378 e!179377)))

(declare-fun res!145656 () Bool)

(assert (=> b!282584 (=> (not res!145656) (not e!179377))))

(declare-fun lt!139627 () SeekEntryResult!1848)

(assert (=> b!282584 (= res!145656 (or (= lt!139627 (MissingZero!1848 i!1267)) (= lt!139627 (MissingVacant!1848 i!1267))))))

(assert (=> b!282584 (= lt!139627 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282585 () Bool)

(declare-fun res!145652 () Bool)

(assert (=> b!282585 (=> (not res!145652) (not e!179376))))

(assert (=> b!282585 (= res!145652 (validKeyInArray!0 (select (arr!6690 a!3325) startIndex!26)))))

(declare-fun res!145653 () Bool)

(assert (=> start!27278 (=> (not res!145653) (not e!179378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27278 (= res!145653 (validMask!0 mask!3868))))

(assert (=> start!27278 e!179378))

(declare-fun array_inv!4653 (array!14096) Bool)

(assert (=> start!27278 (array_inv!4653 a!3325)))

(assert (=> start!27278 true))

(declare-fun b!282580 () Bool)

(assert (=> b!282580 (= e!179377 e!179376)))

(declare-fun res!145654 () Bool)

(assert (=> b!282580 (=> (not res!145654) (not e!179376))))

(assert (=> b!282580 (= res!145654 (not (= startIndex!26 i!1267)))))

(assert (=> b!282580 (= lt!139624 (array!14097 (store (arr!6690 a!3325) i!1267 k0!2581) (size!7042 a!3325)))))

(declare-fun b!282586 () Bool)

(declare-fun res!145650 () Bool)

(assert (=> b!282586 (=> (not res!145650) (not e!179378))))

(assert (=> b!282586 (= res!145650 (and (= (size!7042 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7042 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7042 a!3325))))))

(declare-fun b!282587 () Bool)

(declare-fun res!145649 () Bool)

(assert (=> b!282587 (=> (not res!145649) (not e!179378))))

(assert (=> b!282587 (= res!145649 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4495))))

(assert (= (and start!27278 res!145653) b!282586))

(assert (= (and b!282586 res!145650) b!282581))

(assert (= (and b!282581 res!145648) b!282587))

(assert (= (and b!282587 res!145649) b!282579))

(assert (= (and b!282579 res!145655) b!282584))

(assert (= (and b!282584 res!145656) b!282583))

(assert (= (and b!282583 res!145651) b!282580))

(assert (= (and b!282580 res!145654) b!282585))

(assert (= (and b!282585 res!145652) b!282582))

(declare-fun m!297195 () Bool)

(assert (=> b!282579 m!297195))

(declare-fun m!297197 () Bool)

(assert (=> b!282580 m!297197))

(declare-fun m!297199 () Bool)

(assert (=> b!282583 m!297199))

(declare-fun m!297201 () Bool)

(assert (=> b!282582 m!297201))

(declare-fun m!297203 () Bool)

(assert (=> b!282582 m!297203))

(declare-fun m!297205 () Bool)

(assert (=> b!282582 m!297205))

(assert (=> b!282582 m!297203))

(declare-fun m!297207 () Bool)

(assert (=> b!282582 m!297207))

(assert (=> b!282582 m!297197))

(declare-fun m!297209 () Bool)

(assert (=> b!282582 m!297209))

(declare-fun m!297211 () Bool)

(assert (=> b!282582 m!297211))

(declare-fun m!297213 () Bool)

(assert (=> b!282582 m!297213))

(declare-fun m!297215 () Bool)

(assert (=> b!282582 m!297215))

(assert (=> b!282582 m!297211))

(declare-fun m!297217 () Bool)

(assert (=> b!282582 m!297217))

(assert (=> b!282585 m!297211))

(assert (=> b!282585 m!297211))

(declare-fun m!297219 () Bool)

(assert (=> b!282585 m!297219))

(declare-fun m!297221 () Bool)

(assert (=> b!282584 m!297221))

(declare-fun m!297223 () Bool)

(assert (=> start!27278 m!297223))

(declare-fun m!297225 () Bool)

(assert (=> start!27278 m!297225))

(declare-fun m!297227 () Bool)

(assert (=> b!282587 m!297227))

(declare-fun m!297229 () Bool)

(assert (=> b!282581 m!297229))

(check-sat (not b!282585) (not b!282583) (not b!282582) (not b!282587) (not b!282581) (not b!282584) (not b!282579) (not start!27278))
(check-sat)
