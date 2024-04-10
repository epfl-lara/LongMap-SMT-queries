; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46684 () Bool)

(assert start!46684)

(declare-fun b!515149 () Bool)

(declare-fun res!314714 () Bool)

(declare-fun e!300819 () Bool)

(assert (=> b!515149 (=> (not res!314714) (not e!300819))))

(declare-datatypes ((array!32996 0))(
  ( (array!32997 (arr!15866 (Array (_ BitVec 32) (_ BitVec 64))) (size!16230 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32996)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515149 (= res!314714 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!314716 () Bool)

(assert (=> start!46684 (=> (not res!314716) (not e!300819))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46684 (= res!314716 (validMask!0 mask!3524))))

(assert (=> start!46684 e!300819))

(assert (=> start!46684 true))

(declare-fun array_inv!11662 (array!32996) Bool)

(assert (=> start!46684 (array_inv!11662 a!3235)))

(declare-fun b!515150 () Bool)

(declare-fun res!314717 () Bool)

(declare-fun e!300817 () Bool)

(assert (=> b!515150 (=> (not res!314717) (not e!300817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32996 (_ BitVec 32)) Bool)

(assert (=> b!515150 (= res!314717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515151 () Bool)

(assert (=> b!515151 (= e!300819 e!300817)))

(declare-fun res!314722 () Bool)

(assert (=> b!515151 (=> (not res!314722) (not e!300817))))

(declare-datatypes ((SeekEntryResult!4333 0))(
  ( (MissingZero!4333 (index!19520 (_ BitVec 32))) (Found!4333 (index!19521 (_ BitVec 32))) (Intermediate!4333 (undefined!5145 Bool) (index!19522 (_ BitVec 32)) (x!48488 (_ BitVec 32))) (Undefined!4333) (MissingVacant!4333 (index!19523 (_ BitVec 32))) )
))
(declare-fun lt!235833 () SeekEntryResult!4333)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515151 (= res!314722 (or (= lt!235833 (MissingZero!4333 i!1204)) (= lt!235833 (MissingVacant!4333 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32996 (_ BitVec 32)) SeekEntryResult!4333)

(assert (=> b!515151 (= lt!235833 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!300818 () Bool)

(declare-fun b!515152 () Bool)

(assert (=> b!515152 (= e!300818 (= (seekEntryOrOpen!0 (select (arr!15866 a!3235) j!176) a!3235 mask!3524) (Found!4333 j!176)))))

(declare-fun b!515153 () Bool)

(declare-fun res!314720 () Bool)

(assert (=> b!515153 (=> (not res!314720) (not e!300819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515153 (= res!314720 (validKeyInArray!0 k!2280))))

(declare-fun b!515154 () Bool)

(declare-fun res!314713 () Bool)

(assert (=> b!515154 (=> (not res!314713) (not e!300819))))

(assert (=> b!515154 (= res!314713 (and (= (size!16230 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16230 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16230 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515155 () Bool)

(declare-fun e!300816 () Bool)

(assert (=> b!515155 (= e!300816 true)))

(declare-fun lt!235832 () SeekEntryResult!4333)

(assert (=> b!515155 (and (bvslt (x!48488 lt!235832) #b01111111111111111111111111111110) (or (= (select (arr!15866 a!3235) (index!19522 lt!235832)) (select (arr!15866 a!3235) j!176)) (= (select (arr!15866 a!3235) (index!19522 lt!235832)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15866 a!3235) (index!19522 lt!235832)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515156 () Bool)

(declare-fun res!314721 () Bool)

(assert (=> b!515156 (=> (not res!314721) (not e!300817))))

(declare-datatypes ((List!10024 0))(
  ( (Nil!10021) (Cons!10020 (h!10918 (_ BitVec 64)) (t!16252 List!10024)) )
))
(declare-fun arrayNoDuplicates!0 (array!32996 (_ BitVec 32) List!10024) Bool)

(assert (=> b!515156 (= res!314721 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10021))))

(declare-fun b!515157 () Bool)

(declare-fun res!314715 () Bool)

(assert (=> b!515157 (=> res!314715 e!300816)))

(assert (=> b!515157 (= res!314715 (or (undefined!5145 lt!235832) (not (is-Intermediate!4333 lt!235832))))))

(declare-fun b!515158 () Bool)

(assert (=> b!515158 (= e!300817 (not e!300816))))

(declare-fun res!314723 () Bool)

(assert (=> b!515158 (=> res!314723 e!300816)))

(declare-fun lt!235830 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32996 (_ BitVec 32)) SeekEntryResult!4333)

(assert (=> b!515158 (= res!314723 (= lt!235832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235830 (select (store (arr!15866 a!3235) i!1204 k!2280) j!176) (array!32997 (store (arr!15866 a!3235) i!1204 k!2280) (size!16230 a!3235)) mask!3524)))))

(declare-fun lt!235831 () (_ BitVec 32))

(assert (=> b!515158 (= lt!235832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235831 (select (arr!15866 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515158 (= lt!235830 (toIndex!0 (select (store (arr!15866 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515158 (= lt!235831 (toIndex!0 (select (arr!15866 a!3235) j!176) mask!3524))))

(assert (=> b!515158 e!300818))

(declare-fun res!314719 () Bool)

(assert (=> b!515158 (=> (not res!314719) (not e!300818))))

(assert (=> b!515158 (= res!314719 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15924 0))(
  ( (Unit!15925) )
))
(declare-fun lt!235834 () Unit!15924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15924)

(assert (=> b!515158 (= lt!235834 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515159 () Bool)

(declare-fun res!314718 () Bool)

(assert (=> b!515159 (=> (not res!314718) (not e!300819))))

(assert (=> b!515159 (= res!314718 (validKeyInArray!0 (select (arr!15866 a!3235) j!176)))))

(assert (= (and start!46684 res!314716) b!515154))

(assert (= (and b!515154 res!314713) b!515159))

(assert (= (and b!515159 res!314718) b!515153))

(assert (= (and b!515153 res!314720) b!515149))

(assert (= (and b!515149 res!314714) b!515151))

(assert (= (and b!515151 res!314722) b!515150))

(assert (= (and b!515150 res!314717) b!515156))

(assert (= (and b!515156 res!314721) b!515158))

(assert (= (and b!515158 res!314719) b!515152))

(assert (= (and b!515158 (not res!314723)) b!515157))

(assert (= (and b!515157 (not res!314715)) b!515155))

(declare-fun m!496441 () Bool)

(assert (=> b!515152 m!496441))

(assert (=> b!515152 m!496441))

(declare-fun m!496443 () Bool)

(assert (=> b!515152 m!496443))

(assert (=> b!515159 m!496441))

(assert (=> b!515159 m!496441))

(declare-fun m!496445 () Bool)

(assert (=> b!515159 m!496445))

(declare-fun m!496447 () Bool)

(assert (=> b!515150 m!496447))

(declare-fun m!496449 () Bool)

(assert (=> b!515156 m!496449))

(declare-fun m!496451 () Bool)

(assert (=> b!515151 m!496451))

(declare-fun m!496453 () Bool)

(assert (=> b!515158 m!496453))

(declare-fun m!496455 () Bool)

(assert (=> b!515158 m!496455))

(declare-fun m!496457 () Bool)

(assert (=> b!515158 m!496457))

(assert (=> b!515158 m!496441))

(declare-fun m!496459 () Bool)

(assert (=> b!515158 m!496459))

(assert (=> b!515158 m!496441))

(declare-fun m!496461 () Bool)

(assert (=> b!515158 m!496461))

(assert (=> b!515158 m!496441))

(declare-fun m!496463 () Bool)

(assert (=> b!515158 m!496463))

(assert (=> b!515158 m!496457))

(declare-fun m!496465 () Bool)

(assert (=> b!515158 m!496465))

(assert (=> b!515158 m!496457))

(declare-fun m!496467 () Bool)

(assert (=> b!515158 m!496467))

(declare-fun m!496469 () Bool)

(assert (=> start!46684 m!496469))

(declare-fun m!496471 () Bool)

(assert (=> start!46684 m!496471))

(declare-fun m!496473 () Bool)

(assert (=> b!515153 m!496473))

(declare-fun m!496475 () Bool)

(assert (=> b!515149 m!496475))

(declare-fun m!496477 () Bool)

(assert (=> b!515155 m!496477))

(assert (=> b!515155 m!496441))

(push 1)

