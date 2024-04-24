; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46082 () Bool)

(assert start!46082)

(declare-fun b!510479 () Bool)

(declare-fun res!311378 () Bool)

(declare-fun e!298371 () Bool)

(assert (=> b!510479 (=> (not res!311378) (not e!298371))))

(declare-datatypes ((array!32794 0))(
  ( (array!32795 (arr!15775 (Array (_ BitVec 32) (_ BitVec 64))) (size!16139 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32794)

(declare-datatypes ((List!9840 0))(
  ( (Nil!9837) (Cons!9836 (h!10713 (_ BitVec 64)) (t!16060 List!9840)) )
))
(declare-fun arrayNoDuplicates!0 (array!32794 (_ BitVec 32) List!9840) Bool)

(assert (=> b!510479 (= res!311378 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9837))))

(declare-fun b!510480 () Bool)

(declare-fun e!298373 () Bool)

(assert (=> b!510480 (= e!298373 e!298371)))

(declare-fun res!311381 () Bool)

(assert (=> b!510480 (=> (not res!311381) (not e!298371))))

(declare-datatypes ((SeekEntryResult!4198 0))(
  ( (MissingZero!4198 (index!18980 (_ BitVec 32))) (Found!4198 (index!18981 (_ BitVec 32))) (Intermediate!4198 (undefined!5010 Bool) (index!18982 (_ BitVec 32)) (x!48084 (_ BitVec 32))) (Undefined!4198) (MissingVacant!4198 (index!18983 (_ BitVec 32))) )
))
(declare-fun lt!233462 () SeekEntryResult!4198)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510480 (= res!311381 (or (= lt!233462 (MissingZero!4198 i!1204)) (= lt!233462 (MissingVacant!4198 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32794 (_ BitVec 32)) SeekEntryResult!4198)

(assert (=> b!510480 (= lt!233462 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!311384 () Bool)

(assert (=> start!46082 (=> (not res!311384) (not e!298373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46082 (= res!311384 (validMask!0 mask!3524))))

(assert (=> start!46082 e!298373))

(assert (=> start!46082 true))

(declare-fun array_inv!11634 (array!32794) Bool)

(assert (=> start!46082 (array_inv!11634 a!3235)))

(declare-fun b!510481 () Bool)

(declare-fun res!311386 () Bool)

(assert (=> b!510481 (=> (not res!311386) (not e!298373))))

(declare-fun arrayContainsKey!0 (array!32794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510481 (= res!311386 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510482 () Bool)

(declare-fun e!298374 () Bool)

(assert (=> b!510482 (= e!298374 true)))

(declare-fun lt!233466 () array!32794)

(declare-fun lt!233464 () SeekEntryResult!4198)

(declare-fun lt!233463 () (_ BitVec 64))

(assert (=> b!510482 (= lt!233464 (seekEntryOrOpen!0 lt!233463 lt!233466 mask!3524))))

(declare-datatypes ((Unit!15715 0))(
  ( (Unit!15716) )
))
(declare-fun lt!233465 () Unit!15715)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32794 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15715)

(assert (=> b!510482 (= lt!233465 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510483 () Bool)

(declare-fun res!311383 () Bool)

(assert (=> b!510483 (=> (not res!311383) (not e!298373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510483 (= res!311383 (validKeyInArray!0 (select (arr!15775 a!3235) j!176)))))

(declare-fun b!510484 () Bool)

(declare-fun res!311379 () Bool)

(assert (=> b!510484 (=> (not res!311379) (not e!298373))))

(assert (=> b!510484 (= res!311379 (and (= (size!16139 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16139 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16139 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510485 () Bool)

(declare-fun res!311380 () Bool)

(assert (=> b!510485 (=> (not res!311380) (not e!298371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32794 (_ BitVec 32)) Bool)

(assert (=> b!510485 (= res!311380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510486 () Bool)

(declare-fun res!311382 () Bool)

(assert (=> b!510486 (=> (not res!311382) (not e!298373))))

(assert (=> b!510486 (= res!311382 (validKeyInArray!0 k0!2280))))

(declare-fun b!510487 () Bool)

(assert (=> b!510487 (= e!298371 (not e!298374))))

(declare-fun res!311385 () Bool)

(assert (=> b!510487 (=> res!311385 e!298374)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32794 (_ BitVec 32)) SeekEntryResult!4198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510487 (= res!311385 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15775 a!3235) j!176) mask!3524) (select (arr!15775 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233463 mask!3524) lt!233463 lt!233466 mask!3524))))))

(assert (=> b!510487 (= lt!233463 (select (store (arr!15775 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510487 (= lt!233466 (array!32795 (store (arr!15775 a!3235) i!1204 k0!2280) (size!16139 a!3235)))))

(assert (=> b!510487 (= lt!233464 (Found!4198 j!176))))

(assert (=> b!510487 (= lt!233464 (seekEntryOrOpen!0 (select (arr!15775 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510487 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233467 () Unit!15715)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15715)

(assert (=> b!510487 (= lt!233467 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46082 res!311384) b!510484))

(assert (= (and b!510484 res!311379) b!510483))

(assert (= (and b!510483 res!311383) b!510486))

(assert (= (and b!510486 res!311382) b!510481))

(assert (= (and b!510481 res!311386) b!510480))

(assert (= (and b!510480 res!311381) b!510485))

(assert (= (and b!510485 res!311380) b!510479))

(assert (= (and b!510479 res!311378) b!510487))

(assert (= (and b!510487 (not res!311385)) b!510482))

(declare-fun m!492037 () Bool)

(assert (=> b!510486 m!492037))

(declare-fun m!492039 () Bool)

(assert (=> b!510481 m!492039))

(declare-fun m!492041 () Bool)

(assert (=> b!510479 m!492041))

(declare-fun m!492043 () Bool)

(assert (=> b!510485 m!492043))

(declare-fun m!492045 () Bool)

(assert (=> b!510480 m!492045))

(declare-fun m!492047 () Bool)

(assert (=> b!510487 m!492047))

(declare-fun m!492049 () Bool)

(assert (=> b!510487 m!492049))

(declare-fun m!492051 () Bool)

(assert (=> b!510487 m!492051))

(declare-fun m!492053 () Bool)

(assert (=> b!510487 m!492053))

(assert (=> b!510487 m!492051))

(declare-fun m!492055 () Bool)

(assert (=> b!510487 m!492055))

(assert (=> b!510487 m!492051))

(declare-fun m!492057 () Bool)

(assert (=> b!510487 m!492057))

(declare-fun m!492059 () Bool)

(assert (=> b!510487 m!492059))

(declare-fun m!492061 () Bool)

(assert (=> b!510487 m!492061))

(declare-fun m!492063 () Bool)

(assert (=> b!510487 m!492063))

(assert (=> b!510487 m!492053))

(assert (=> b!510487 m!492051))

(declare-fun m!492065 () Bool)

(assert (=> b!510487 m!492065))

(assert (=> b!510487 m!492061))

(assert (=> b!510483 m!492051))

(assert (=> b!510483 m!492051))

(declare-fun m!492067 () Bool)

(assert (=> b!510483 m!492067))

(declare-fun m!492069 () Bool)

(assert (=> start!46082 m!492069))

(declare-fun m!492071 () Bool)

(assert (=> start!46082 m!492071))

(declare-fun m!492073 () Bool)

(assert (=> b!510482 m!492073))

(declare-fun m!492075 () Bool)

(assert (=> b!510482 m!492075))

(check-sat (not b!510487) (not b!510480) (not b!510481) (not b!510482) (not start!46082) (not b!510486) (not b!510479) (not b!510483) (not b!510485))
(check-sat)
