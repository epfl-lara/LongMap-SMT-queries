; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30034 () Bool)

(assert start!30034)

(declare-fun b!301338 () Bool)

(declare-fun res!159092 () Bool)

(declare-fun e!190182 () Bool)

(assert (=> b!301338 (=> (not res!159092) (not e!190182))))

(declare-datatypes ((array!15254 0))(
  ( (array!15255 (arr!7219 (Array (_ BitVec 32) (_ BitVec 64))) (size!7571 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15254)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301338 (= res!159092 (and (= (size!7571 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7571 a!3293))))))

(declare-fun b!301339 () Bool)

(declare-fun res!159093 () Bool)

(assert (=> b!301339 (=> (not res!159093) (not e!190182))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301339 (= res!159093 (validKeyInArray!0 k!2441))))

(declare-fun b!301340 () Bool)

(declare-fun res!159091 () Bool)

(assert (=> b!301340 (=> (not res!159091) (not e!190182))))

(declare-datatypes ((SeekEntryResult!2359 0))(
  ( (MissingZero!2359 (index!11612 (_ BitVec 32))) (Found!2359 (index!11613 (_ BitVec 32))) (Intermediate!2359 (undefined!3171 Bool) (index!11614 (_ BitVec 32)) (x!29887 (_ BitVec 32))) (Undefined!2359) (MissingVacant!2359 (index!11615 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15254 (_ BitVec 32)) SeekEntryResult!2359)

(assert (=> b!301340 (= res!159091 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2359 i!1240)))))

(declare-fun b!301341 () Bool)

(declare-fun res!159088 () Bool)

(assert (=> b!301341 (=> (not res!159088) (not e!190182))))

(declare-fun arrayContainsKey!0 (array!15254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301341 (= res!159088 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159090 () Bool)

(assert (=> start!30034 (=> (not res!159090) (not e!190182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30034 (= res!159090 (validMask!0 mask!3709))))

(assert (=> start!30034 e!190182))

(assert (=> start!30034 true))

(declare-fun array_inv!5182 (array!15254) Bool)

(assert (=> start!30034 (array_inv!5182 a!3293)))

(declare-fun b!301342 () Bool)

(declare-fun res!159089 () Bool)

(assert (=> b!301342 (=> (not res!159089) (not e!190182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15254 (_ BitVec 32)) Bool)

(assert (=> b!301342 (= res!159089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301343 () Bool)

(assert (=> b!301343 (= e!190182 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsgt mask!3709 #b00111111111111111111111111111111)))))

(assert (= (and start!30034 res!159090) b!301338))

(assert (= (and b!301338 res!159092) b!301339))

(assert (= (and b!301339 res!159093) b!301341))

(assert (= (and b!301341 res!159088) b!301340))

(assert (= (and b!301340 res!159091) b!301342))

(assert (= (and b!301342 res!159089) b!301343))

(declare-fun m!313149 () Bool)

(assert (=> b!301342 m!313149))

(declare-fun m!313151 () Bool)

(assert (=> start!30034 m!313151))

(declare-fun m!313153 () Bool)

(assert (=> start!30034 m!313153))

(declare-fun m!313155 () Bool)

(assert (=> b!301340 m!313155))

(declare-fun m!313157 () Bool)

(assert (=> b!301339 m!313157))

(declare-fun m!313159 () Bool)

(assert (=> b!301341 m!313159))

(push 1)

(assert (not start!30034))

(assert (not b!301339))

(assert (not b!301341))

(assert (not b!301340))

(assert (not b!301342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

