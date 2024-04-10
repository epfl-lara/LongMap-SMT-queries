; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31860 () Bool)

(assert start!31860)

(declare-fun b!318542 () Bool)

(declare-fun res!173130 () Bool)

(declare-fun e!197916 () Bool)

(assert (=> b!318542 (=> (not res!173130) (not e!197916))))

(declare-datatypes ((array!16231 0))(
  ( (array!16232 (arr!7681 (Array (_ BitVec 32) (_ BitVec 64))) (size!8033 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16231)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318542 (= res!173130 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318543 () Bool)

(declare-fun e!197919 () Bool)

(declare-fun e!197918 () Bool)

(assert (=> b!318543 (= e!197919 e!197918)))

(declare-fun res!173129 () Bool)

(assert (=> b!318543 (=> (not res!173129) (not e!197918))))

(declare-datatypes ((SeekEntryResult!2821 0))(
  ( (MissingZero!2821 (index!13460 (_ BitVec 32))) (Found!2821 (index!13461 (_ BitVec 32))) (Intermediate!2821 (undefined!3633 Bool) (index!13462 (_ BitVec 32)) (x!31710 (_ BitVec 32))) (Undefined!2821) (MissingVacant!2821 (index!13463 (_ BitVec 32))) )
))
(declare-fun lt!155393 () SeekEntryResult!2821)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155394 () SeekEntryResult!2821)

(assert (=> b!318543 (= res!173129 (and (= lt!155394 lt!155393) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7681 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16231 (_ BitVec 32)) SeekEntryResult!2821)

(assert (=> b!318543 (= lt!155394 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318544 () Bool)

(declare-fun res!173128 () Bool)

(assert (=> b!318544 (=> (not res!173128) (not e!197916))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318544 (= res!173128 (and (= (size!8033 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8033 a!3293))))))

(declare-fun b!318546 () Bool)

(assert (=> b!318546 (= e!197918 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun e!197920 () Bool)

(assert (=> b!318546 e!197920))

(declare-fun res!173122 () Bool)

(assert (=> b!318546 (=> (not res!173122) (not e!197920))))

(declare-fun lt!155391 () (_ BitVec 32))

(assert (=> b!318546 (= res!173122 (= lt!155394 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155391 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318546 (= lt!155391 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318547 () Bool)

(declare-fun res!173127 () Bool)

(assert (=> b!318547 (=> (not res!173127) (not e!197916))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16231 (_ BitVec 32)) SeekEntryResult!2821)

(assert (=> b!318547 (= res!173127 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2821 i!1240)))))

(declare-fun b!318548 () Bool)

(declare-fun res!173123 () Bool)

(assert (=> b!318548 (=> (not res!173123) (not e!197919))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318548 (= res!173123 (and (= (select (arr!7681 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8033 a!3293))))))

(declare-fun b!318549 () Bool)

(declare-fun lt!155392 () array!16231)

(assert (=> b!318549 (= e!197920 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155392 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155391 k!2441 lt!155392 mask!3709)))))

(assert (=> b!318549 (= lt!155392 (array!16232 (store (arr!7681 a!3293) i!1240 k!2441) (size!8033 a!3293)))))

(declare-fun b!318550 () Bool)

(declare-fun res!173125 () Bool)

(assert (=> b!318550 (=> (not res!173125) (not e!197916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318550 (= res!173125 (validKeyInArray!0 k!2441))))

(declare-fun b!318551 () Bool)

(declare-fun res!173126 () Bool)

(assert (=> b!318551 (=> (not res!173126) (not e!197916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16231 (_ BitVec 32)) Bool)

(assert (=> b!318551 (= res!173126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!173124 () Bool)

(assert (=> start!31860 (=> (not res!173124) (not e!197916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31860 (= res!173124 (validMask!0 mask!3709))))

(assert (=> start!31860 e!197916))

(declare-fun array_inv!5644 (array!16231) Bool)

(assert (=> start!31860 (array_inv!5644 a!3293)))

(assert (=> start!31860 true))

(declare-fun b!318545 () Bool)

(assert (=> b!318545 (= e!197916 e!197919)))

(declare-fun res!173121 () Bool)

(assert (=> b!318545 (=> (not res!173121) (not e!197919))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318545 (= res!173121 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155393))))

(assert (=> b!318545 (= lt!155393 (Intermediate!2821 false resIndex!52 resX!52))))

(assert (= (and start!31860 res!173124) b!318544))

(assert (= (and b!318544 res!173128) b!318550))

(assert (= (and b!318550 res!173125) b!318542))

(assert (= (and b!318542 res!173130) b!318547))

(assert (= (and b!318547 res!173127) b!318551))

(assert (= (and b!318551 res!173126) b!318545))

(assert (= (and b!318545 res!173121) b!318548))

(assert (= (and b!318548 res!173123) b!318543))

(assert (= (and b!318543 res!173129) b!318546))

(assert (= (and b!318546 res!173122) b!318549))

(declare-fun m!327249 () Bool)

(assert (=> b!318550 m!327249))

(declare-fun m!327251 () Bool)

(assert (=> b!318545 m!327251))

(assert (=> b!318545 m!327251))

(declare-fun m!327253 () Bool)

(assert (=> b!318545 m!327253))

(declare-fun m!327255 () Bool)

(assert (=> b!318546 m!327255))

(declare-fun m!327257 () Bool)

(assert (=> b!318546 m!327257))

(declare-fun m!327259 () Bool)

(assert (=> b!318549 m!327259))

(declare-fun m!327261 () Bool)

(assert (=> b!318549 m!327261))

(declare-fun m!327263 () Bool)

(assert (=> b!318549 m!327263))

(declare-fun m!327265 () Bool)

(assert (=> b!318551 m!327265))

(declare-fun m!327267 () Bool)

(assert (=> start!31860 m!327267))

(declare-fun m!327269 () Bool)

(assert (=> start!31860 m!327269))

(declare-fun m!327271 () Bool)

(assert (=> b!318548 m!327271))

(declare-fun m!327273 () Bool)

(assert (=> b!318542 m!327273))

(declare-fun m!327275 () Bool)

(assert (=> b!318543 m!327275))

(declare-fun m!327277 () Bool)

(assert (=> b!318543 m!327277))

(declare-fun m!327279 () Bool)

(assert (=> b!318547 m!327279))

(push 1)

(assert (not start!31860))

(assert (not b!318543))

(assert (not b!318550))

(assert (not b!318545))

