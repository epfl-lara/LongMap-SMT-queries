; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27566 () Bool)

(assert start!27566)

(declare-fun b!284643 () Bool)

(declare-fun res!147207 () Bool)

(declare-fun e!180506 () Bool)

(assert (=> b!284643 (=> (not res!147207) (not e!180506))))

(declare-datatypes ((array!14205 0))(
  ( (array!14206 (arr!6741 (Array (_ BitVec 32) (_ BitVec 64))) (size!7094 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14205)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284643 (= res!147207 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284644 () Bool)

(declare-fun res!147208 () Bool)

(assert (=> b!284644 (=> (not res!147208) (not e!180506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284644 (= res!147208 (validKeyInArray!0 k0!2581))))

(declare-fun b!284645 () Bool)

(declare-fun res!147206 () Bool)

(assert (=> b!284645 (=> (not res!147206) (not e!180506))))

(declare-datatypes ((List!4522 0))(
  ( (Nil!4519) (Cons!4518 (h!5191 (_ BitVec 64)) (t!9595 List!4522)) )
))
(declare-fun arrayNoDuplicates!0 (array!14205 (_ BitVec 32) List!4522) Bool)

(assert (=> b!284645 (= res!147206 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4519))))

(declare-fun b!284647 () Bool)

(declare-fun res!147205 () Bool)

(assert (=> b!284647 (=> (not res!147205) (not e!180506))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284647 (= res!147205 (and (= (size!7094 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7094 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7094 a!3325))))))

(declare-fun b!284648 () Bool)

(declare-fun e!180507 () Bool)

(assert (=> b!284648 (= e!180507 false)))

(declare-fun lt!140439 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14205 (_ BitVec 32)) Bool)

(assert (=> b!284648 (= lt!140439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284646 () Bool)

(assert (=> b!284646 (= e!180506 e!180507)))

(declare-fun res!147203 () Bool)

(assert (=> b!284646 (=> (not res!147203) (not e!180507))))

(declare-datatypes ((SeekEntryResult!1898 0))(
  ( (MissingZero!1898 (index!9762 (_ BitVec 32))) (Found!1898 (index!9763 (_ BitVec 32))) (Intermediate!1898 (undefined!2710 Bool) (index!9764 (_ BitVec 32)) (x!27984 (_ BitVec 32))) (Undefined!1898) (MissingVacant!1898 (index!9765 (_ BitVec 32))) )
))
(declare-fun lt!140438 () SeekEntryResult!1898)

(assert (=> b!284646 (= res!147203 (or (= lt!140438 (MissingZero!1898 i!1267)) (= lt!140438 (MissingVacant!1898 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14205 (_ BitVec 32)) SeekEntryResult!1898)

(assert (=> b!284646 (= lt!140438 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!147204 () Bool)

(assert (=> start!27566 (=> (not res!147204) (not e!180506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27566 (= res!147204 (validMask!0 mask!3868))))

(assert (=> start!27566 e!180506))

(declare-fun array_inv!4713 (array!14205) Bool)

(assert (=> start!27566 (array_inv!4713 a!3325)))

(assert (=> start!27566 true))

(assert (= (and start!27566 res!147204) b!284647))

(assert (= (and b!284647 res!147205) b!284644))

(assert (= (and b!284644 res!147208) b!284645))

(assert (= (and b!284645 res!147206) b!284643))

(assert (= (and b!284643 res!147207) b!284646))

(assert (= (and b!284646 res!147203) b!284648))

(declare-fun m!299135 () Bool)

(assert (=> b!284643 m!299135))

(declare-fun m!299137 () Bool)

(assert (=> b!284648 m!299137))

(declare-fun m!299139 () Bool)

(assert (=> b!284644 m!299139))

(declare-fun m!299141 () Bool)

(assert (=> b!284645 m!299141))

(declare-fun m!299143 () Bool)

(assert (=> b!284646 m!299143))

(declare-fun m!299145 () Bool)

(assert (=> start!27566 m!299145))

(declare-fun m!299147 () Bool)

(assert (=> start!27566 m!299147))

(check-sat (not b!284646) (not start!27566) (not b!284644) (not b!284645) (not b!284643) (not b!284648))
(check-sat)
