; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45778 () Bool)

(assert start!45778)

(declare-fun b!506620 () Bool)

(declare-fun res!307587 () Bool)

(declare-fun e!296518 () Bool)

(assert (=> b!506620 (=> (not res!307587) (not e!296518))))

(declare-datatypes ((array!32534 0))(
  ( (array!32535 (arr!15647 (Array (_ BitVec 32) (_ BitVec 64))) (size!16011 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32534)

(declare-datatypes ((List!9805 0))(
  ( (Nil!9802) (Cons!9801 (h!10678 (_ BitVec 64)) (t!16033 List!9805)) )
))
(declare-fun arrayNoDuplicates!0 (array!32534 (_ BitVec 32) List!9805) Bool)

(assert (=> b!506620 (= res!307587 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9802))))

(declare-fun b!506621 () Bool)

(declare-fun res!307580 () Bool)

(declare-fun e!296516 () Bool)

(assert (=> b!506621 (=> (not res!307580) (not e!296516))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506621 (= res!307580 (validKeyInArray!0 (select (arr!15647 a!3235) j!176)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!506623 () Bool)

(declare-fun e!296515 () Bool)

(declare-datatypes ((SeekEntryResult!4114 0))(
  ( (MissingZero!4114 (index!18644 (_ BitVec 32))) (Found!4114 (index!18645 (_ BitVec 32))) (Intermediate!4114 (undefined!4926 Bool) (index!18646 (_ BitVec 32)) (x!47643 (_ BitVec 32))) (Undefined!4114) (MissingVacant!4114 (index!18647 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32534 (_ BitVec 32)) SeekEntryResult!4114)

(assert (=> b!506623 (= e!296515 (= (seekEntryOrOpen!0 (select (arr!15647 a!3235) j!176) a!3235 mask!3524) (Found!4114 j!176)))))

(declare-fun b!506624 () Bool)

(declare-fun res!307588 () Bool)

(assert (=> b!506624 (=> (not res!307588) (not e!296518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32534 (_ BitVec 32)) Bool)

(assert (=> b!506624 (= res!307588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506625 () Bool)

(declare-fun e!296517 () Bool)

(assert (=> b!506625 (= e!296518 (not e!296517))))

(declare-fun res!307583 () Bool)

(assert (=> b!506625 (=> res!307583 e!296517)))

(declare-fun lt!231193 () SeekEntryResult!4114)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!231195 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32534 (_ BitVec 32)) SeekEntryResult!4114)

(assert (=> b!506625 (= res!307583 (= lt!231193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231195 (select (store (arr!15647 a!3235) i!1204 k!2280) j!176) (array!32535 (store (arr!15647 a!3235) i!1204 k!2280) (size!16011 a!3235)) mask!3524)))))

(declare-fun lt!231191 () (_ BitVec 32))

(assert (=> b!506625 (= lt!231193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231191 (select (arr!15647 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506625 (= lt!231195 (toIndex!0 (select (store (arr!15647 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506625 (= lt!231191 (toIndex!0 (select (arr!15647 a!3235) j!176) mask!3524))))

(assert (=> b!506625 e!296515))

(declare-fun res!307581 () Bool)

(assert (=> b!506625 (=> (not res!307581) (not e!296515))))

(assert (=> b!506625 (= res!307581 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15516 0))(
  ( (Unit!15517) )
))
(declare-fun lt!231196 () Unit!15516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15516)

(assert (=> b!506625 (= lt!231196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506626 () Bool)

(declare-fun res!307582 () Bool)

(assert (=> b!506626 (=> (not res!307582) (not e!296516))))

(assert (=> b!506626 (= res!307582 (validKeyInArray!0 k!2280))))

(declare-fun b!506627 () Bool)

(declare-fun res!307585 () Bool)

(assert (=> b!506627 (=> (not res!307585) (not e!296516))))

(assert (=> b!506627 (= res!307585 (and (= (size!16011 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16011 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16011 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506628 () Bool)

(declare-fun res!307589 () Bool)

(assert (=> b!506628 (=> (not res!307589) (not e!296516))))

(declare-fun arrayContainsKey!0 (array!32534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506628 (= res!307589 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506629 () Bool)

(assert (=> b!506629 (= e!296516 e!296518)))

(declare-fun res!307586 () Bool)

(assert (=> b!506629 (=> (not res!307586) (not e!296518))))

(declare-fun lt!231194 () SeekEntryResult!4114)

(assert (=> b!506629 (= res!307586 (or (= lt!231194 (MissingZero!4114 i!1204)) (= lt!231194 (MissingVacant!4114 i!1204))))))

(assert (=> b!506629 (= lt!231194 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506630 () Bool)

(declare-fun e!296519 () Bool)

(assert (=> b!506630 (= e!296517 e!296519)))

(declare-fun res!307579 () Bool)

(assert (=> b!506630 (=> res!307579 e!296519)))

(declare-fun lt!231192 () Bool)

(assert (=> b!506630 (= res!307579 (or (and (not lt!231192) (undefined!4926 lt!231193)) (and (not lt!231192) (not (undefined!4926 lt!231193)))))))

(assert (=> b!506630 (= lt!231192 (not (is-Intermediate!4114 lt!231193)))))

(declare-fun b!506622 () Bool)

(assert (=> b!506622 (= e!296519 true)))

(assert (=> b!506622 false))

(declare-fun res!307584 () Bool)

(assert (=> start!45778 (=> (not res!307584) (not e!296516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45778 (= res!307584 (validMask!0 mask!3524))))

(assert (=> start!45778 e!296516))

(assert (=> start!45778 true))

(declare-fun array_inv!11443 (array!32534) Bool)

(assert (=> start!45778 (array_inv!11443 a!3235)))

(assert (= (and start!45778 res!307584) b!506627))

(assert (= (and b!506627 res!307585) b!506621))

(assert (= (and b!506621 res!307580) b!506626))

(assert (= (and b!506626 res!307582) b!506628))

(assert (= (and b!506628 res!307589) b!506629))

(assert (= (and b!506629 res!307586) b!506624))

(assert (= (and b!506624 res!307588) b!506620))

(assert (= (and b!506620 res!307587) b!506625))

(assert (= (and b!506625 res!307581) b!506623))

(assert (= (and b!506625 (not res!307583)) b!506630))

(assert (= (and b!506630 (not res!307579)) b!506622))

(declare-fun m!487299 () Bool)

(assert (=> b!506625 m!487299))

(declare-fun m!487301 () Bool)

(assert (=> b!506625 m!487301))

(declare-fun m!487303 () Bool)

(assert (=> b!506625 m!487303))

(declare-fun m!487305 () Bool)

(assert (=> b!506625 m!487305))

(assert (=> b!506625 m!487303))

(assert (=> b!506625 m!487301))

(declare-fun m!487307 () Bool)

(assert (=> b!506625 m!487307))

(declare-fun m!487309 () Bool)

(assert (=> b!506625 m!487309))

(assert (=> b!506625 m!487303))

(declare-fun m!487311 () Bool)

(assert (=> b!506625 m!487311))

(declare-fun m!487313 () Bool)

(assert (=> b!506625 m!487313))

(assert (=> b!506625 m!487301))

(declare-fun m!487315 () Bool)

(assert (=> b!506625 m!487315))

(declare-fun m!487317 () Bool)

(assert (=> b!506626 m!487317))

(declare-fun m!487319 () Bool)

(assert (=> b!506620 m!487319))

(declare-fun m!487321 () Bool)

(assert (=> start!45778 m!487321))

(declare-fun m!487323 () Bool)

(assert (=> start!45778 m!487323))

(assert (=> b!506623 m!487303))

(assert (=> b!506623 m!487303))

(declare-fun m!487325 () Bool)

(assert (=> b!506623 m!487325))

(declare-fun m!487327 () Bool)

(assert (=> b!506629 m!487327))

(assert (=> b!506621 m!487303))

(assert (=> b!506621 m!487303))

(declare-fun m!487329 () Bool)

(assert (=> b!506621 m!487329))

(declare-fun m!487331 () Bool)

(assert (=> b!506624 m!487331))

(declare-fun m!487333 () Bool)

(assert (=> b!506628 m!487333))

(push 1)

