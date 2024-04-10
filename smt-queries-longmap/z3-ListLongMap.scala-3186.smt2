; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44744 () Bool)

(assert start!44744)

(declare-fun b!491145 () Bool)

(declare-fun res!294085 () Bool)

(declare-fun e!288626 () Bool)

(assert (=> b!491145 (=> (not res!294085) (not e!288626))))

(declare-datatypes ((array!31803 0))(
  ( (array!31804 (arr!15289 (Array (_ BitVec 32) (_ BitVec 64))) (size!15653 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31803)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31803 (_ BitVec 32)) Bool)

(assert (=> b!491145 (= res!294085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491146 () Bool)

(declare-fun e!288627 () Bool)

(assert (=> b!491146 (= e!288627 e!288626)))

(declare-fun res!294086 () Bool)

(assert (=> b!491146 (=> (not res!294086) (not e!288626))))

(declare-datatypes ((SeekEntryResult!3756 0))(
  ( (MissingZero!3756 (index!17203 (_ BitVec 32))) (Found!3756 (index!17204 (_ BitVec 32))) (Intermediate!3756 (undefined!4568 Bool) (index!17205 (_ BitVec 32)) (x!46294 (_ BitVec 32))) (Undefined!3756) (MissingVacant!3756 (index!17206 (_ BitVec 32))) )
))
(declare-fun lt!221957 () SeekEntryResult!3756)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491146 (= res!294086 (or (= lt!221957 (MissingZero!3756 i!1204)) (= lt!221957 (MissingVacant!3756 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31803 (_ BitVec 32)) SeekEntryResult!3756)

(assert (=> b!491146 (= lt!221957 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491147 () Bool)

(declare-fun e!288625 () Bool)

(assert (=> b!491147 (= e!288626 (not e!288625))))

(declare-fun res!294089 () Bool)

(assert (=> b!491147 (=> res!294089 e!288625)))

(declare-fun lt!221961 () array!31803)

(declare-fun lt!221962 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31803 (_ BitVec 32)) SeekEntryResult!3756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491147 (= res!294089 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15289 a!3235) j!176) mask!3524) (select (arr!15289 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221962 mask!3524) lt!221962 lt!221961 mask!3524))))))

(assert (=> b!491147 (= lt!221962 (select (store (arr!15289 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491147 (= lt!221961 (array!31804 (store (arr!15289 a!3235) i!1204 k0!2280) (size!15653 a!3235)))))

(declare-fun lt!221958 () SeekEntryResult!3756)

(assert (=> b!491147 (= lt!221958 (Found!3756 j!176))))

(assert (=> b!491147 (= lt!221958 (seekEntryOrOpen!0 (select (arr!15289 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491147 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14458 0))(
  ( (Unit!14459) )
))
(declare-fun lt!221959 () Unit!14458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14458)

(assert (=> b!491147 (= lt!221959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!294082 () Bool)

(assert (=> start!44744 (=> (not res!294082) (not e!288627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44744 (= res!294082 (validMask!0 mask!3524))))

(assert (=> start!44744 e!288627))

(assert (=> start!44744 true))

(declare-fun array_inv!11085 (array!31803) Bool)

(assert (=> start!44744 (array_inv!11085 a!3235)))

(declare-fun b!491148 () Bool)

(assert (=> b!491148 (= e!288625 true)))

(assert (=> b!491148 (= lt!221958 (seekEntryOrOpen!0 lt!221962 lt!221961 mask!3524))))

(declare-fun lt!221960 () Unit!14458)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31803 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14458)

(assert (=> b!491148 (= lt!221960 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491149 () Bool)

(declare-fun res!294088 () Bool)

(assert (=> b!491149 (=> (not res!294088) (not e!288627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491149 (= res!294088 (validKeyInArray!0 (select (arr!15289 a!3235) j!176)))))

(declare-fun b!491150 () Bool)

(declare-fun res!294081 () Bool)

(assert (=> b!491150 (=> (not res!294081) (not e!288627))))

(declare-fun arrayContainsKey!0 (array!31803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491150 (= res!294081 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491151 () Bool)

(declare-fun res!294087 () Bool)

(assert (=> b!491151 (=> (not res!294087) (not e!288627))))

(assert (=> b!491151 (= res!294087 (validKeyInArray!0 k0!2280))))

(declare-fun b!491152 () Bool)

(declare-fun res!294084 () Bool)

(assert (=> b!491152 (=> (not res!294084) (not e!288626))))

(declare-datatypes ((List!9447 0))(
  ( (Nil!9444) (Cons!9443 (h!10305 (_ BitVec 64)) (t!15675 List!9447)) )
))
(declare-fun arrayNoDuplicates!0 (array!31803 (_ BitVec 32) List!9447) Bool)

(assert (=> b!491152 (= res!294084 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9444))))

(declare-fun b!491153 () Bool)

(declare-fun res!294083 () Bool)

(assert (=> b!491153 (=> (not res!294083) (not e!288627))))

(assert (=> b!491153 (= res!294083 (and (= (size!15653 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15653 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15653 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44744 res!294082) b!491153))

(assert (= (and b!491153 res!294083) b!491149))

(assert (= (and b!491149 res!294088) b!491151))

(assert (= (and b!491151 res!294087) b!491150))

(assert (= (and b!491150 res!294081) b!491146))

(assert (= (and b!491146 res!294086) b!491145))

(assert (= (and b!491145 res!294085) b!491152))

(assert (= (and b!491152 res!294084) b!491147))

(assert (= (and b!491147 (not res!294089)) b!491148))

(declare-fun m!471583 () Bool)

(assert (=> b!491151 m!471583))

(declare-fun m!471585 () Bool)

(assert (=> b!491146 m!471585))

(declare-fun m!471587 () Bool)

(assert (=> start!44744 m!471587))

(declare-fun m!471589 () Bool)

(assert (=> start!44744 m!471589))

(declare-fun m!471591 () Bool)

(assert (=> b!491147 m!471591))

(declare-fun m!471593 () Bool)

(assert (=> b!491147 m!471593))

(declare-fun m!471595 () Bool)

(assert (=> b!491147 m!471595))

(declare-fun m!471597 () Bool)

(assert (=> b!491147 m!471597))

(declare-fun m!471599 () Bool)

(assert (=> b!491147 m!471599))

(declare-fun m!471601 () Bool)

(assert (=> b!491147 m!471601))

(declare-fun m!471603 () Bool)

(assert (=> b!491147 m!471603))

(declare-fun m!471605 () Bool)

(assert (=> b!491147 m!471605))

(assert (=> b!491147 m!471591))

(assert (=> b!491147 m!471603))

(assert (=> b!491147 m!471601))

(assert (=> b!491147 m!471603))

(declare-fun m!471607 () Bool)

(assert (=> b!491147 m!471607))

(assert (=> b!491147 m!471603))

(declare-fun m!471609 () Bool)

(assert (=> b!491147 m!471609))

(declare-fun m!471611 () Bool)

(assert (=> b!491152 m!471611))

(declare-fun m!471613 () Bool)

(assert (=> b!491148 m!471613))

(declare-fun m!471615 () Bool)

(assert (=> b!491148 m!471615))

(assert (=> b!491149 m!471603))

(assert (=> b!491149 m!471603))

(declare-fun m!471617 () Bool)

(assert (=> b!491149 m!471617))

(declare-fun m!471619 () Bool)

(assert (=> b!491150 m!471619))

(declare-fun m!471621 () Bool)

(assert (=> b!491145 m!471621))

(check-sat (not b!491149) (not b!491151) (not b!491148) (not b!491145) (not b!491147) (not b!491150) (not b!491152) (not start!44744) (not b!491146))
(check-sat)
