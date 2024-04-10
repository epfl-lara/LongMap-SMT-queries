; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30024 () Bool)

(assert start!30024)

(declare-fun b!301248 () Bool)

(declare-fun res!158999 () Bool)

(declare-fun e!190153 () Bool)

(assert (=> b!301248 (=> (not res!158999) (not e!190153))))

(declare-datatypes ((array!15244 0))(
  ( (array!15245 (arr!7214 (Array (_ BitVec 32) (_ BitVec 64))) (size!7566 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15244)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15244 (_ BitVec 32)) Bool)

(assert (=> b!301248 (= res!158999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301249 () Bool)

(declare-fun res!159000 () Bool)

(assert (=> b!301249 (=> (not res!159000) (not e!190153))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301249 (= res!159000 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301250 () Bool)

(declare-fun res!159001 () Bool)

(assert (=> b!301250 (=> (not res!159001) (not e!190153))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301250 (= res!159001 (and (= (size!7566 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7566 a!3293))))))

(declare-fun b!301251 () Bool)

(declare-fun res!159003 () Bool)

(assert (=> b!301251 (=> (not res!159003) (not e!190153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301251 (= res!159003 (validKeyInArray!0 k!2441))))

(declare-fun b!301252 () Bool)

(declare-fun res!158998 () Bool)

(assert (=> b!301252 (=> (not res!158998) (not e!190153))))

(declare-datatypes ((SeekEntryResult!2354 0))(
  ( (MissingZero!2354 (index!11592 (_ BitVec 32))) (Found!2354 (index!11593 (_ BitVec 32))) (Intermediate!2354 (undefined!3166 Bool) (index!11594 (_ BitVec 32)) (x!29874 (_ BitVec 32))) (Undefined!2354) (MissingVacant!2354 (index!11595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15244 (_ BitVec 32)) SeekEntryResult!2354)

(assert (=> b!301252 (= res!158998 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2354 i!1240)))))

(declare-fun b!301253 () Bool)

(assert (=> b!301253 (= e!190153 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun res!159002 () Bool)

(assert (=> start!30024 (=> (not res!159002) (not e!190153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30024 (= res!159002 (validMask!0 mask!3709))))

(assert (=> start!30024 e!190153))

(assert (=> start!30024 true))

(declare-fun array_inv!5177 (array!15244) Bool)

(assert (=> start!30024 (array_inv!5177 a!3293)))

(assert (= (and start!30024 res!159002) b!301250))

(assert (= (and b!301250 res!159001) b!301251))

(assert (= (and b!301251 res!159003) b!301249))

(assert (= (and b!301249 res!159000) b!301252))

(assert (= (and b!301252 res!158998) b!301248))

(assert (= (and b!301248 res!158999) b!301253))

(declare-fun m!313089 () Bool)

(assert (=> b!301248 m!313089))

(declare-fun m!313091 () Bool)

(assert (=> b!301252 m!313091))

(declare-fun m!313093 () Bool)

(assert (=> b!301251 m!313093))

(declare-fun m!313095 () Bool)

(assert (=> b!301249 m!313095))

(declare-fun m!313097 () Bool)

(assert (=> start!30024 m!313097))

(declare-fun m!313099 () Bool)

(assert (=> start!30024 m!313099))

(push 1)

(assert (not start!30024))

(assert (not b!301249))

(assert (not b!301252))

(assert (not b!301248))

(assert (not b!301251))

