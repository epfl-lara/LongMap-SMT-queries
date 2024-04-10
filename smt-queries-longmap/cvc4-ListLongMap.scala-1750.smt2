; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32060 () Bool)

(assert start!32060)

(declare-fun b!319860 () Bool)

(declare-fun res!174177 () Bool)

(declare-fun e!198591 () Bool)

(assert (=> b!319860 (=> (not res!174177) (not e!198591))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319860 (= res!174177 (validKeyInArray!0 k!2497))))

(declare-fun b!319861 () Bool)

(declare-fun res!174172 () Bool)

(assert (=> b!319861 (=> (not res!174172) (not e!198591))))

(declare-datatypes ((array!16334 0))(
  ( (array!16335 (arr!7729 (Array (_ BitVec 32) (_ BitVec 64))) (size!8081 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16334)

(declare-fun arrayContainsKey!0 (array!16334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319861 (= res!174172 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319862 () Bool)

(declare-fun res!174176 () Bool)

(assert (=> b!319862 (=> (not res!174176) (not e!198591))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16334 (_ BitVec 32)) Bool)

(assert (=> b!319862 (= res!174176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174175 () Bool)

(assert (=> start!32060 (=> (not res!174175) (not e!198591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32060 (= res!174175 (validMask!0 mask!3777))))

(assert (=> start!32060 e!198591))

(assert (=> start!32060 true))

(declare-fun array_inv!5692 (array!16334) Bool)

(assert (=> start!32060 (array_inv!5692 a!3305)))

(declare-fun b!319863 () Bool)

(assert (=> b!319863 (= e!198591 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!155886 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319863 (= lt!155886 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!319864 () Bool)

(declare-fun res!174174 () Bool)

(assert (=> b!319864 (=> (not res!174174) (not e!198591))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2860 0))(
  ( (MissingZero!2860 (index!13616 (_ BitVec 32))) (Found!2860 (index!13617 (_ BitVec 32))) (Intermediate!2860 (undefined!3672 Bool) (index!13618 (_ BitVec 32)) (x!31886 (_ BitVec 32))) (Undefined!2860) (MissingVacant!2860 (index!13619 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16334 (_ BitVec 32)) SeekEntryResult!2860)

(assert (=> b!319864 (= res!174174 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2860 i!1250)))))

(declare-fun b!319865 () Bool)

(declare-fun res!174173 () Bool)

(assert (=> b!319865 (=> (not res!174173) (not e!198591))))

(assert (=> b!319865 (= res!174173 (and (= (size!8081 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8081 a!3305))))))

(assert (= (and start!32060 res!174175) b!319865))

(assert (= (and b!319865 res!174173) b!319860))

(assert (= (and b!319860 res!174177) b!319861))

(assert (= (and b!319861 res!174172) b!319864))

(assert (= (and b!319864 res!174174) b!319862))

(assert (= (and b!319862 res!174176) b!319863))

(declare-fun m!328353 () Bool)

(assert (=> b!319861 m!328353))

(declare-fun m!328355 () Bool)

(assert (=> b!319864 m!328355))

(declare-fun m!328357 () Bool)

(assert (=> b!319863 m!328357))

(declare-fun m!328359 () Bool)

(assert (=> b!319862 m!328359))

(declare-fun m!328361 () Bool)

(assert (=> b!319860 m!328361))

(declare-fun m!328363 () Bool)

(assert (=> start!32060 m!328363))

(declare-fun m!328365 () Bool)

(assert (=> start!32060 m!328365))

(push 1)

(assert (not b!319861))

(assert (not b!319860))

(assert (not b!319863))

(assert (not start!32060))

(assert (not b!319864))

(assert (not b!319862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

