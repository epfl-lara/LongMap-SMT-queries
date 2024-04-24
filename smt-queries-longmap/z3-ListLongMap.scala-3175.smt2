; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44666 () Bool)

(assert start!44666)

(declare-fun b!490157 () Bool)

(declare-fun res!293152 () Bool)

(declare-fun e!288168 () Bool)

(assert (=> b!490157 (=> (not res!293152) (not e!288168))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490157 (= res!293152 (validKeyInArray!0 k0!2280))))

(declare-fun b!490158 () Bool)

(declare-fun res!293147 () Bool)

(declare-fun e!288169 () Bool)

(assert (=> b!490158 (=> (not res!293147) (not e!288169))))

(declare-datatypes ((array!31726 0))(
  ( (array!31727 (arr!15250 (Array (_ BitVec 32) (_ BitVec 64))) (size!15614 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31726)

(declare-datatypes ((List!9315 0))(
  ( (Nil!9312) (Cons!9311 (h!10173 (_ BitVec 64)) (t!15535 List!9315)) )
))
(declare-fun arrayNoDuplicates!0 (array!31726 (_ BitVec 32) List!9315) Bool)

(assert (=> b!490158 (= res!293147 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9312))))

(declare-fun b!490159 () Bool)

(assert (=> b!490159 (= e!288169 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!221361 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3673 0))(
  ( (MissingZero!3673 (index!16871 (_ BitVec 32))) (Found!3673 (index!16872 (_ BitVec 32))) (Intermediate!3673 (undefined!4485 Bool) (index!16873 (_ BitVec 32)) (x!46120 (_ BitVec 32))) (Undefined!3673) (MissingVacant!3673 (index!16874 (_ BitVec 32))) )
))
(declare-fun lt!221359 () SeekEntryResult!3673)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31726 (_ BitVec 32)) SeekEntryResult!3673)

(assert (=> b!490159 (= lt!221359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221361 (select (store (arr!15250 a!3235) i!1204 k0!2280) j!176) (array!31727 (store (arr!15250 a!3235) i!1204 k0!2280) (size!15614 a!3235)) mask!3524))))

(declare-fun lt!221358 () (_ BitVec 32))

(declare-fun lt!221360 () SeekEntryResult!3673)

(assert (=> b!490159 (= lt!221360 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221358 (select (arr!15250 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490159 (= lt!221361 (toIndex!0 (select (store (arr!15250 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490159 (= lt!221358 (toIndex!0 (select (arr!15250 a!3235) j!176) mask!3524))))

(declare-fun e!288170 () Bool)

(assert (=> b!490159 e!288170))

(declare-fun res!293153 () Bool)

(assert (=> b!490159 (=> (not res!293153) (not e!288170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31726 (_ BitVec 32)) Bool)

(assert (=> b!490159 (= res!293153 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14353 0))(
  ( (Unit!14354) )
))
(declare-fun lt!221362 () Unit!14353)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14353)

(assert (=> b!490159 (= lt!221362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490160 () Bool)

(declare-fun res!293155 () Bool)

(assert (=> b!490160 (=> (not res!293155) (not e!288169))))

(assert (=> b!490160 (= res!293155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490161 () Bool)

(declare-fun res!293150 () Bool)

(assert (=> b!490161 (=> (not res!293150) (not e!288168))))

(declare-fun arrayContainsKey!0 (array!31726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490161 (= res!293150 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490162 () Bool)

(assert (=> b!490162 (= e!288168 e!288169)))

(declare-fun res!293148 () Bool)

(assert (=> b!490162 (=> (not res!293148) (not e!288169))))

(declare-fun lt!221357 () SeekEntryResult!3673)

(assert (=> b!490162 (= res!293148 (or (= lt!221357 (MissingZero!3673 i!1204)) (= lt!221357 (MissingVacant!3673 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31726 (_ BitVec 32)) SeekEntryResult!3673)

(assert (=> b!490162 (= lt!221357 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490164 () Bool)

(assert (=> b!490164 (= e!288170 (= (seekEntryOrOpen!0 (select (arr!15250 a!3235) j!176) a!3235 mask!3524) (Found!3673 j!176)))))

(declare-fun b!490165 () Bool)

(declare-fun res!293151 () Bool)

(assert (=> b!490165 (=> (not res!293151) (not e!288168))))

(assert (=> b!490165 (= res!293151 (and (= (size!15614 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15614 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15614 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!293154 () Bool)

(assert (=> start!44666 (=> (not res!293154) (not e!288168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44666 (= res!293154 (validMask!0 mask!3524))))

(assert (=> start!44666 e!288168))

(assert (=> start!44666 true))

(declare-fun array_inv!11109 (array!31726) Bool)

(assert (=> start!44666 (array_inv!11109 a!3235)))

(declare-fun b!490163 () Bool)

(declare-fun res!293149 () Bool)

(assert (=> b!490163 (=> (not res!293149) (not e!288168))))

(assert (=> b!490163 (= res!293149 (validKeyInArray!0 (select (arr!15250 a!3235) j!176)))))

(assert (= (and start!44666 res!293154) b!490165))

(assert (= (and b!490165 res!293151) b!490163))

(assert (= (and b!490163 res!293149) b!490157))

(assert (= (and b!490157 res!293152) b!490161))

(assert (= (and b!490161 res!293150) b!490162))

(assert (= (and b!490162 res!293148) b!490160))

(assert (= (and b!490160 res!293155) b!490158))

(assert (= (and b!490158 res!293147) b!490159))

(assert (= (and b!490159 res!293153) b!490164))

(declare-fun m!470437 () Bool)

(assert (=> b!490162 m!470437))

(declare-fun m!470439 () Bool)

(assert (=> b!490159 m!470439))

(declare-fun m!470441 () Bool)

(assert (=> b!490159 m!470441))

(declare-fun m!470443 () Bool)

(assert (=> b!490159 m!470443))

(declare-fun m!470445 () Bool)

(assert (=> b!490159 m!470445))

(assert (=> b!490159 m!470439))

(declare-fun m!470447 () Bool)

(assert (=> b!490159 m!470447))

(declare-fun m!470449 () Bool)

(assert (=> b!490159 m!470449))

(assert (=> b!490159 m!470447))

(declare-fun m!470451 () Bool)

(assert (=> b!490159 m!470451))

(assert (=> b!490159 m!470439))

(declare-fun m!470453 () Bool)

(assert (=> b!490159 m!470453))

(assert (=> b!490159 m!470447))

(declare-fun m!470455 () Bool)

(assert (=> b!490159 m!470455))

(assert (=> b!490163 m!470447))

(assert (=> b!490163 m!470447))

(declare-fun m!470457 () Bool)

(assert (=> b!490163 m!470457))

(declare-fun m!470459 () Bool)

(assert (=> b!490161 m!470459))

(assert (=> b!490164 m!470447))

(assert (=> b!490164 m!470447))

(declare-fun m!470461 () Bool)

(assert (=> b!490164 m!470461))

(declare-fun m!470463 () Bool)

(assert (=> start!44666 m!470463))

(declare-fun m!470465 () Bool)

(assert (=> start!44666 m!470465))

(declare-fun m!470467 () Bool)

(assert (=> b!490158 m!470467))

(declare-fun m!470469 () Bool)

(assert (=> b!490160 m!470469))

(declare-fun m!470471 () Bool)

(assert (=> b!490157 m!470471))

(check-sat (not b!490158) (not start!44666) (not b!490157) (not b!490163) (not b!490161) (not b!490162) (not b!490159) (not b!490160) (not b!490164))
(check-sat)
