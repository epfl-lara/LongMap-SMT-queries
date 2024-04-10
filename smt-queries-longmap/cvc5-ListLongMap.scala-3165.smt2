; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44616 () Bool)

(assert start!44616)

(declare-fun res!292351 () Bool)

(declare-fun e!287847 () Bool)

(assert (=> start!44616 (=> (not res!292351) (not e!287847))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44616 (= res!292351 (validMask!0 mask!3524))))

(assert (=> start!44616 e!287847))

(assert (=> start!44616 true))

(declare-datatypes ((array!31675 0))(
  ( (array!31676 (arr!15225 (Array (_ BitVec 32) (_ BitVec 64))) (size!15589 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31675)

(declare-fun array_inv!11021 (array!31675) Bool)

(assert (=> start!44616 (array_inv!11021 a!3235)))

(declare-fun b!489408 () Bool)

(declare-fun res!292346 () Bool)

(assert (=> b!489408 (=> (not res!292346) (not e!287847))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489408 (= res!292346 (and (= (size!15589 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15589 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15589 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489409 () Bool)

(declare-fun e!287850 () Bool)

(assert (=> b!489409 (= e!287850 (not true))))

(declare-datatypes ((SeekEntryResult!3692 0))(
  ( (MissingZero!3692 (index!16947 (_ BitVec 32))) (Found!3692 (index!16948 (_ BitVec 32))) (Intermediate!3692 (undefined!4504 Bool) (index!16949 (_ BitVec 32)) (x!46062 (_ BitVec 32))) (Undefined!3692) (MissingVacant!3692 (index!16950 (_ BitVec 32))) )
))
(declare-fun lt!220809 () SeekEntryResult!3692)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!220805 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31675 (_ BitVec 32)) SeekEntryResult!3692)

(assert (=> b!489409 (= lt!220809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220805 (select (store (arr!15225 a!3235) i!1204 k!2280) j!176) (array!31676 (store (arr!15225 a!3235) i!1204 k!2280) (size!15589 a!3235)) mask!3524))))

(declare-fun lt!220808 () SeekEntryResult!3692)

(declare-fun lt!220810 () (_ BitVec 32))

(assert (=> b!489409 (= lt!220808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220810 (select (arr!15225 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489409 (= lt!220805 (toIndex!0 (select (store (arr!15225 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489409 (= lt!220810 (toIndex!0 (select (arr!15225 a!3235) j!176) mask!3524))))

(declare-fun e!287848 () Bool)

(assert (=> b!489409 e!287848))

(declare-fun res!292348 () Bool)

(assert (=> b!489409 (=> (not res!292348) (not e!287848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31675 (_ BitVec 32)) Bool)

(assert (=> b!489409 (= res!292348 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14330 0))(
  ( (Unit!14331) )
))
(declare-fun lt!220806 () Unit!14330)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14330)

(assert (=> b!489409 (= lt!220806 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489410 () Bool)

(assert (=> b!489410 (= e!287847 e!287850)))

(declare-fun res!292352 () Bool)

(assert (=> b!489410 (=> (not res!292352) (not e!287850))))

(declare-fun lt!220807 () SeekEntryResult!3692)

(assert (=> b!489410 (= res!292352 (or (= lt!220807 (MissingZero!3692 i!1204)) (= lt!220807 (MissingVacant!3692 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31675 (_ BitVec 32)) SeekEntryResult!3692)

(assert (=> b!489410 (= lt!220807 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489411 () Bool)

(declare-fun res!292345 () Bool)

(assert (=> b!489411 (=> (not res!292345) (not e!287847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489411 (= res!292345 (validKeyInArray!0 k!2280))))

(declare-fun b!489412 () Bool)

(declare-fun res!292347 () Bool)

(assert (=> b!489412 (=> (not res!292347) (not e!287847))))

(declare-fun arrayContainsKey!0 (array!31675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489412 (= res!292347 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489413 () Bool)

(declare-fun res!292350 () Bool)

(assert (=> b!489413 (=> (not res!292350) (not e!287847))))

(assert (=> b!489413 (= res!292350 (validKeyInArray!0 (select (arr!15225 a!3235) j!176)))))

(declare-fun b!489414 () Bool)

(declare-fun res!292344 () Bool)

(assert (=> b!489414 (=> (not res!292344) (not e!287850))))

(assert (=> b!489414 (= res!292344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489415 () Bool)

(assert (=> b!489415 (= e!287848 (= (seekEntryOrOpen!0 (select (arr!15225 a!3235) j!176) a!3235 mask!3524) (Found!3692 j!176)))))

(declare-fun b!489416 () Bool)

(declare-fun res!292349 () Bool)

(assert (=> b!489416 (=> (not res!292349) (not e!287850))))

(declare-datatypes ((List!9383 0))(
  ( (Nil!9380) (Cons!9379 (h!10241 (_ BitVec 64)) (t!15611 List!9383)) )
))
(declare-fun arrayNoDuplicates!0 (array!31675 (_ BitVec 32) List!9383) Bool)

(assert (=> b!489416 (= res!292349 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9380))))

(assert (= (and start!44616 res!292351) b!489408))

(assert (= (and b!489408 res!292346) b!489413))

(assert (= (and b!489413 res!292350) b!489411))

(assert (= (and b!489411 res!292345) b!489412))

(assert (= (and b!489412 res!292347) b!489410))

(assert (= (and b!489410 res!292352) b!489414))

(assert (= (and b!489414 res!292344) b!489416))

(assert (= (and b!489416 res!292349) b!489409))

(assert (= (and b!489409 res!292348) b!489415))

(declare-fun m!469173 () Bool)

(assert (=> b!489416 m!469173))

(declare-fun m!469175 () Bool)

(assert (=> b!489415 m!469175))

(assert (=> b!489415 m!469175))

(declare-fun m!469177 () Bool)

(assert (=> b!489415 m!469177))

(declare-fun m!469179 () Bool)

(assert (=> b!489410 m!469179))

(declare-fun m!469181 () Bool)

(assert (=> start!44616 m!469181))

(declare-fun m!469183 () Bool)

(assert (=> start!44616 m!469183))

(declare-fun m!469185 () Bool)

(assert (=> b!489409 m!469185))

(declare-fun m!469187 () Bool)

(assert (=> b!489409 m!469187))

(declare-fun m!469189 () Bool)

(assert (=> b!489409 m!469189))

(assert (=> b!489409 m!469175))

(declare-fun m!469191 () Bool)

(assert (=> b!489409 m!469191))

(assert (=> b!489409 m!469175))

(assert (=> b!489409 m!469189))

(declare-fun m!469193 () Bool)

(assert (=> b!489409 m!469193))

(declare-fun m!469195 () Bool)

(assert (=> b!489409 m!469195))

(assert (=> b!489409 m!469189))

(declare-fun m!469197 () Bool)

(assert (=> b!489409 m!469197))

(assert (=> b!489409 m!469175))

(declare-fun m!469199 () Bool)

(assert (=> b!489409 m!469199))

(declare-fun m!469201 () Bool)

(assert (=> b!489414 m!469201))

(declare-fun m!469203 () Bool)

(assert (=> b!489412 m!469203))

(assert (=> b!489413 m!469175))

(assert (=> b!489413 m!469175))

(declare-fun m!469205 () Bool)

(assert (=> b!489413 m!469205))

(declare-fun m!469207 () Bool)

(assert (=> b!489411 m!469207))

(push 1)

