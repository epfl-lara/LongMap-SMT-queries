; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48190 () Bool)

(assert start!48190)

(declare-fun b!530622 () Bool)

(declare-fun res!326328 () Bool)

(declare-fun e!309135 () Bool)

(assert (=> b!530622 (=> (not res!326328) (not e!309135))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530622 (= res!326328 (validKeyInArray!0 k!1998))))

(declare-fun b!530623 () Bool)

(declare-fun res!326333 () Bool)

(assert (=> b!530623 (=> (not res!326333) (not e!309135))))

(declare-datatypes ((array!33615 0))(
  ( (array!33616 (arr!16154 (Array (_ BitVec 32) (_ BitVec 64))) (size!16518 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33615)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4612 0))(
  ( (MissingZero!4612 (index!20672 (_ BitVec 32))) (Found!4612 (index!20673 (_ BitVec 32))) (Intermediate!4612 (undefined!5424 Bool) (index!20674 (_ BitVec 32)) (x!49658 (_ BitVec 32))) (Undefined!4612) (MissingVacant!4612 (index!20675 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33615 (_ BitVec 32)) SeekEntryResult!4612)

(assert (=> b!530623 (= res!326333 (not (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) (MissingZero!4612 i!1153))))))

(declare-fun res!326332 () Bool)

(assert (=> start!48190 (=> (not res!326332) (not e!309135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48190 (= res!326332 (validMask!0 mask!3216))))

(assert (=> start!48190 e!309135))

(assert (=> start!48190 true))

(declare-fun array_inv!11950 (array!33615) Bool)

(assert (=> start!48190 (array_inv!11950 a!3154)))

(declare-fun b!530624 () Bool)

(declare-fun res!326329 () Bool)

(assert (=> b!530624 (=> (not res!326329) (not e!309135))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530624 (= res!326329 (validKeyInArray!0 (select (arr!16154 a!3154) j!147)))))

(declare-fun b!530625 () Bool)

(declare-fun res!326331 () Bool)

(assert (=> b!530625 (=> (not res!326331) (not e!309135))))

(assert (=> b!530625 (= res!326331 (and (= (size!16518 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16518 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16518 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530626 () Bool)

(declare-fun res!326330 () Bool)

(assert (=> b!530626 (=> (not res!326330) (not e!309135))))

(declare-fun arrayContainsKey!0 (array!33615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530626 (= res!326330 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530627 () Bool)

(assert (=> b!530627 (= e!309135 (bvslt mask!3216 #b00000000000000000000000000000000))))

(assert (= (and start!48190 res!326332) b!530625))

(assert (= (and b!530625 res!326331) b!530624))

(assert (= (and b!530624 res!326329) b!530622))

(assert (= (and b!530622 res!326328) b!530626))

(assert (= (and b!530626 res!326330) b!530623))

(assert (= (and b!530623 res!326333) b!530627))

(declare-fun m!511183 () Bool)

(assert (=> b!530626 m!511183))

(declare-fun m!511185 () Bool)

(assert (=> b!530623 m!511185))

(declare-fun m!511187 () Bool)

(assert (=> b!530622 m!511187))

(declare-fun m!511189 () Bool)

(assert (=> b!530624 m!511189))

(assert (=> b!530624 m!511189))

(declare-fun m!511191 () Bool)

(assert (=> b!530624 m!511191))

(declare-fun m!511193 () Bool)

(assert (=> start!48190 m!511193))

(declare-fun m!511195 () Bool)

(assert (=> start!48190 m!511195))

(push 1)

(assert (not b!530622))

(assert (not b!530626))

(assert (not b!530623))

(assert (not start!48190))

(assert (not b!530624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

