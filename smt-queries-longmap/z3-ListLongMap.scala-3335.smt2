; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45990 () Bool)

(assert start!45990)

(declare-fun res!310046 () Bool)

(declare-fun e!297696 () Bool)

(assert (=> start!45990 (=> (not res!310046) (not e!297696))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45990 (= res!310046 (validMask!0 mask!3524))))

(assert (=> start!45990 e!297696))

(assert (=> start!45990 true))

(declare-datatypes ((array!32711 0))(
  ( (array!32712 (arr!15734 (Array (_ BitVec 32) (_ BitVec 64))) (size!16099 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32711)

(declare-fun array_inv!11617 (array!32711) Bool)

(assert (=> start!45990 (array_inv!11617 a!3235)))

(declare-fun b!509054 () Bool)

(declare-fun res!310045 () Bool)

(assert (=> b!509054 (=> (not res!310045) (not e!297696))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509054 (= res!310045 (and (= (size!16099 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16099 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16099 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509055 () Bool)

(declare-fun res!310044 () Bool)

(assert (=> b!509055 (=> (not res!310044) (not e!297696))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509055 (= res!310044 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509056 () Bool)

(declare-fun e!297699 () Bool)

(assert (=> b!509056 (= e!297696 e!297699)))

(declare-fun res!310043 () Bool)

(assert (=> b!509056 (=> (not res!310043) (not e!297699))))

(declare-datatypes ((SeekEntryResult!4198 0))(
  ( (MissingZero!4198 (index!18980 (_ BitVec 32))) (Found!4198 (index!18981 (_ BitVec 32))) (Intermediate!4198 (undefined!5010 Bool) (index!18982 (_ BitVec 32)) (x!47962 (_ BitVec 32))) (Undefined!4198) (MissingVacant!4198 (index!18983 (_ BitVec 32))) )
))
(declare-fun lt!232409 () SeekEntryResult!4198)

(assert (=> b!509056 (= res!310043 (or (= lt!232409 (MissingZero!4198 i!1204)) (= lt!232409 (MissingVacant!4198 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32711 (_ BitVec 32)) SeekEntryResult!4198)

(assert (=> b!509056 (= lt!232409 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509057 () Bool)

(declare-fun res!310042 () Bool)

(assert (=> b!509057 (=> (not res!310042) (not e!297699))))

(declare-datatypes ((List!9931 0))(
  ( (Nil!9928) (Cons!9927 (h!10804 (_ BitVec 64)) (t!16150 List!9931)) )
))
(declare-fun arrayNoDuplicates!0 (array!32711 (_ BitVec 32) List!9931) Bool)

(assert (=> b!509057 (= res!310042 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9928))))

(declare-fun b!509058 () Bool)

(declare-fun e!297698 () Bool)

(assert (=> b!509058 (= e!297698 (= (seekEntryOrOpen!0 (select (arr!15734 a!3235) j!176) a!3235 mask!3524) (Found!4198 j!176)))))

(declare-fun b!509059 () Bool)

(declare-fun res!310047 () Bool)

(assert (=> b!509059 (=> (not res!310047) (not e!297696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509059 (= res!310047 (validKeyInArray!0 (select (arr!15734 a!3235) j!176)))))

(declare-fun b!509060 () Bool)

(assert (=> b!509060 (= e!297699 (not true))))

(declare-fun lt!232408 () SeekEntryResult!4198)

(declare-fun lt!232406 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32711 (_ BitVec 32)) SeekEntryResult!4198)

(assert (=> b!509060 (= lt!232408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232406 (select (store (arr!15734 a!3235) i!1204 k0!2280) j!176) (array!32712 (store (arr!15734 a!3235) i!1204 k0!2280) (size!16099 a!3235)) mask!3524))))

(declare-fun lt!232411 () (_ BitVec 32))

(declare-fun lt!232410 () SeekEntryResult!4198)

(assert (=> b!509060 (= lt!232410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232411 (select (arr!15734 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509060 (= lt!232406 (toIndex!0 (select (store (arr!15734 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509060 (= lt!232411 (toIndex!0 (select (arr!15734 a!3235) j!176) mask!3524))))

(assert (=> b!509060 e!297698))

(declare-fun res!310048 () Bool)

(assert (=> b!509060 (=> (not res!310048) (not e!297698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32711 (_ BitVec 32)) Bool)

(assert (=> b!509060 (= res!310048 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15640 0))(
  ( (Unit!15641) )
))
(declare-fun lt!232407 () Unit!15640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15640)

(assert (=> b!509060 (= lt!232407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509061 () Bool)

(declare-fun res!310049 () Bool)

(assert (=> b!509061 (=> (not res!310049) (not e!297699))))

(assert (=> b!509061 (= res!310049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509062 () Bool)

(declare-fun res!310041 () Bool)

(assert (=> b!509062 (=> (not res!310041) (not e!297696))))

(assert (=> b!509062 (= res!310041 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45990 res!310046) b!509054))

(assert (= (and b!509054 res!310045) b!509059))

(assert (= (and b!509059 res!310047) b!509062))

(assert (= (and b!509062 res!310041) b!509055))

(assert (= (and b!509055 res!310044) b!509056))

(assert (= (and b!509056 res!310043) b!509061))

(assert (= (and b!509061 res!310049) b!509057))

(assert (= (and b!509057 res!310042) b!509060))

(assert (= (and b!509060 res!310048) b!509058))

(declare-fun m!489421 () Bool)

(assert (=> b!509055 m!489421))

(declare-fun m!489423 () Bool)

(assert (=> b!509061 m!489423))

(declare-fun m!489425 () Bool)

(assert (=> b!509060 m!489425))

(declare-fun m!489427 () Bool)

(assert (=> b!509060 m!489427))

(declare-fun m!489429 () Bool)

(assert (=> b!509060 m!489429))

(declare-fun m!489431 () Bool)

(assert (=> b!509060 m!489431))

(assert (=> b!509060 m!489425))

(declare-fun m!489433 () Bool)

(assert (=> b!509060 m!489433))

(declare-fun m!489435 () Bool)

(assert (=> b!509060 m!489435))

(assert (=> b!509060 m!489433))

(declare-fun m!489437 () Bool)

(assert (=> b!509060 m!489437))

(assert (=> b!509060 m!489433))

(declare-fun m!489439 () Bool)

(assert (=> b!509060 m!489439))

(assert (=> b!509060 m!489425))

(declare-fun m!489441 () Bool)

(assert (=> b!509060 m!489441))

(declare-fun m!489443 () Bool)

(assert (=> b!509056 m!489443))

(assert (=> b!509058 m!489433))

(assert (=> b!509058 m!489433))

(declare-fun m!489445 () Bool)

(assert (=> b!509058 m!489445))

(assert (=> b!509059 m!489433))

(assert (=> b!509059 m!489433))

(declare-fun m!489447 () Bool)

(assert (=> b!509059 m!489447))

(declare-fun m!489449 () Bool)

(assert (=> start!45990 m!489449))

(declare-fun m!489451 () Bool)

(assert (=> start!45990 m!489451))

(declare-fun m!489453 () Bool)

(assert (=> b!509057 m!489453))

(declare-fun m!489455 () Bool)

(assert (=> b!509062 m!489455))

(check-sat (not start!45990) (not b!509060) (not b!509061) (not b!509056) (not b!509055) (not b!509057) (not b!509058) (not b!509062) (not b!509059))
(check-sat)
