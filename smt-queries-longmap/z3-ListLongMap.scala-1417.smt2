; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27528 () Bool)

(assert start!27528)

(declare-fun b!284492 () Bool)

(declare-fun res!146977 () Bool)

(declare-fun e!180470 () Bool)

(assert (=> b!284492 (=> (not res!146977) (not e!180470))))

(declare-datatypes ((array!14177 0))(
  ( (array!14178 (arr!6727 (Array (_ BitVec 32) (_ BitVec 64))) (size!7079 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14177)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14177 (_ BitVec 32)) Bool)

(assert (=> b!284492 (= res!146977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284493 () Bool)

(declare-fun res!146982 () Bool)

(declare-fun e!180469 () Bool)

(assert (=> b!284493 (=> (not res!146982) (not e!180469))))

(declare-datatypes ((List!4448 0))(
  ( (Nil!4445) (Cons!4444 (h!5117 (_ BitVec 64)) (t!9522 List!4448)) )
))
(declare-fun arrayNoDuplicates!0 (array!14177 (_ BitVec 32) List!4448) Bool)

(assert (=> b!284493 (= res!146982 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4445))))

(declare-fun b!284494 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284494 (= e!180470 (and (bvslt startIndex!26 (bvsub (size!7079 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!284495 () Bool)

(assert (=> b!284495 (= e!180469 e!180470)))

(declare-fun res!146980 () Bool)

(assert (=> b!284495 (=> (not res!146980) (not e!180470))))

(declare-datatypes ((SeekEntryResult!1850 0))(
  ( (MissingZero!1850 (index!9570 (_ BitVec 32))) (Found!1850 (index!9571 (_ BitVec 32))) (Intermediate!1850 (undefined!2662 Bool) (index!9572 (_ BitVec 32)) (x!27889 (_ BitVec 32))) (Undefined!1850) (MissingVacant!1850 (index!9573 (_ BitVec 32))) )
))
(declare-fun lt!140577 () SeekEntryResult!1850)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284495 (= res!146980 (or (= lt!140577 (MissingZero!1850 i!1267)) (= lt!140577 (MissingVacant!1850 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14177 (_ BitVec 32)) SeekEntryResult!1850)

(assert (=> b!284495 (= lt!140577 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!146975 () Bool)

(assert (=> start!27528 (=> (not res!146975) (not e!180469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27528 (= res!146975 (validMask!0 mask!3868))))

(assert (=> start!27528 e!180469))

(declare-fun array_inv!4677 (array!14177) Bool)

(assert (=> start!27528 (array_inv!4677 a!3325)))

(assert (=> start!27528 true))

(declare-fun b!284496 () Bool)

(declare-fun res!146978 () Bool)

(assert (=> b!284496 (=> (not res!146978) (not e!180469))))

(assert (=> b!284496 (= res!146978 (and (= (size!7079 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7079 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7079 a!3325))))))

(declare-fun b!284497 () Bool)

(declare-fun res!146976 () Bool)

(assert (=> b!284497 (=> (not res!146976) (not e!180469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284497 (= res!146976 (validKeyInArray!0 k0!2581))))

(declare-fun b!284498 () Bool)

(declare-fun res!146981 () Bool)

(assert (=> b!284498 (=> (not res!146981) (not e!180469))))

(declare-fun arrayContainsKey!0 (array!14177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284498 (= res!146981 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284499 () Bool)

(declare-fun res!146979 () Bool)

(assert (=> b!284499 (=> (not res!146979) (not e!180470))))

(assert (=> b!284499 (= res!146979 (not (= startIndex!26 i!1267)))))

(declare-fun b!284500 () Bool)

(declare-fun res!146974 () Bool)

(assert (=> b!284500 (=> (not res!146974) (not e!180470))))

(assert (=> b!284500 (= res!146974 (not (validKeyInArray!0 (select (arr!6727 a!3325) startIndex!26))))))

(assert (= (and start!27528 res!146975) b!284496))

(assert (= (and b!284496 res!146978) b!284497))

(assert (= (and b!284497 res!146976) b!284493))

(assert (= (and b!284493 res!146982) b!284498))

(assert (= (and b!284498 res!146981) b!284495))

(assert (= (and b!284495 res!146980) b!284492))

(assert (= (and b!284492 res!146977) b!284499))

(assert (= (and b!284499 res!146979) b!284500))

(assert (= (and b!284500 res!146974) b!284494))

(declare-fun m!299669 () Bool)

(assert (=> b!284495 m!299669))

(declare-fun m!299671 () Bool)

(assert (=> b!284498 m!299671))

(declare-fun m!299673 () Bool)

(assert (=> b!284492 m!299673))

(declare-fun m!299675 () Bool)

(assert (=> b!284500 m!299675))

(assert (=> b!284500 m!299675))

(declare-fun m!299677 () Bool)

(assert (=> b!284500 m!299677))

(declare-fun m!299679 () Bool)

(assert (=> start!27528 m!299679))

(declare-fun m!299681 () Bool)

(assert (=> start!27528 m!299681))

(declare-fun m!299683 () Bool)

(assert (=> b!284497 m!299683))

(declare-fun m!299685 () Bool)

(assert (=> b!284493 m!299685))

(check-sat (not b!284497) (not b!284493) (not b!284500) (not start!27528) (not b!284492) (not b!284498) (not b!284495))
(check-sat)
