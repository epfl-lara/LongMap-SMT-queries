; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31354 () Bool)

(assert start!31354)

(declare-fun b!314093 () Bool)

(declare-fun res!169995 () Bool)

(declare-fun e!195652 () Bool)

(assert (=> b!314093 (=> (not res!169995) (not e!195652))))

(declare-datatypes ((array!16029 0))(
  ( (array!16030 (arr!7589 (Array (_ BitVec 32) (_ BitVec 64))) (size!7942 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16029)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314093 (= res!169995 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314094 () Bool)

(declare-fun res!169992 () Bool)

(assert (=> b!314094 (=> (not res!169992) (not e!195652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314094 (= res!169992 (validKeyInArray!0 k!2441))))

(declare-fun b!314095 () Bool)

(declare-fun res!169993 () Bool)

(assert (=> b!314095 (=> (not res!169993) (not e!195652))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314095 (= res!169993 (and (= (select (arr!7589 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7942 a!3293))))))

(declare-fun b!314097 () Bool)

(declare-fun res!169990 () Bool)

(assert (=> b!314097 (=> (not res!169990) (not e!195652))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16029 (_ BitVec 32)) Bool)

(assert (=> b!314097 (= res!169990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314098 () Bool)

(assert (=> b!314098 (= e!195652 false)))

(declare-datatypes ((SeekEntryResult!2728 0))(
  ( (MissingZero!2728 (index!13088 (_ BitVec 32))) (Found!2728 (index!13089 (_ BitVec 32))) (Intermediate!2728 (undefined!3540 Bool) (index!13090 (_ BitVec 32)) (x!31329 (_ BitVec 32))) (Undefined!2728) (MissingVacant!2728 (index!13091 (_ BitVec 32))) )
))
(declare-fun lt!153662 () SeekEntryResult!2728)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16029 (_ BitVec 32)) SeekEntryResult!2728)

(assert (=> b!314098 (= lt!153662 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314099 () Bool)

(declare-fun res!169994 () Bool)

(assert (=> b!314099 (=> (not res!169994) (not e!195652))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16029 (_ BitVec 32)) SeekEntryResult!2728)

(assert (=> b!314099 (= res!169994 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2728 i!1240)))))

(declare-fun b!314100 () Bool)

(declare-fun res!169989 () Bool)

(assert (=> b!314100 (=> (not res!169989) (not e!195652))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314100 (= res!169989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2728 false resIndex!52 resX!52)))))

(declare-fun res!169991 () Bool)

(assert (=> start!31354 (=> (not res!169991) (not e!195652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31354 (= res!169991 (validMask!0 mask!3709))))

(assert (=> start!31354 e!195652))

(declare-fun array_inv!5561 (array!16029) Bool)

(assert (=> start!31354 (array_inv!5561 a!3293)))

(assert (=> start!31354 true))

(declare-fun b!314096 () Bool)

(declare-fun res!169988 () Bool)

(assert (=> b!314096 (=> (not res!169988) (not e!195652))))

(assert (=> b!314096 (= res!169988 (and (= (size!7942 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7942 a!3293))))))

(assert (= (and start!31354 res!169991) b!314096))

(assert (= (and b!314096 res!169988) b!314094))

(assert (= (and b!314094 res!169992) b!314093))

(assert (= (and b!314093 res!169995) b!314099))

(assert (= (and b!314099 res!169994) b!314097))

(assert (= (and b!314097 res!169990) b!314100))

(assert (= (and b!314100 res!169989) b!314095))

(assert (= (and b!314095 res!169993) b!314098))

(declare-fun m!323207 () Bool)

(assert (=> b!314093 m!323207))

(declare-fun m!323209 () Bool)

(assert (=> b!314095 m!323209))

(declare-fun m!323211 () Bool)

(assert (=> b!314100 m!323211))

(assert (=> b!314100 m!323211))

(declare-fun m!323213 () Bool)

(assert (=> b!314100 m!323213))

(declare-fun m!323215 () Bool)

(assert (=> b!314094 m!323215))

(declare-fun m!323217 () Bool)

(assert (=> b!314097 m!323217))

(declare-fun m!323219 () Bool)

(assert (=> start!31354 m!323219))

(declare-fun m!323221 () Bool)

(assert (=> start!31354 m!323221))

(declare-fun m!323223 () Bool)

(assert (=> b!314099 m!323223))

(declare-fun m!323225 () Bool)

(assert (=> b!314098 m!323225))

(push 1)

(assert (not start!31354))

(assert (not b!314094))

(assert (not b!314099))

(assert (not b!314093))

(assert (not b!314097))

(assert (not b!314100))

(assert (not b!314098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

