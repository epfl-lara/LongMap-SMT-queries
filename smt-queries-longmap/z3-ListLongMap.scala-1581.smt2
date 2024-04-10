; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30070 () Bool)

(assert start!30070)

(declare-fun b!301482 () Bool)

(declare-fun res!159163 () Bool)

(declare-fun e!190267 () Bool)

(assert (=> b!301482 (=> (not res!159163) (not e!190267))))

(declare-datatypes ((array!15260 0))(
  ( (array!15261 (arr!7221 (Array (_ BitVec 32) (_ BitVec 64))) (size!7573 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15260)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301482 (= res!159163 (and (= (size!7573 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7573 a!3293))))))

(declare-fun b!301483 () Bool)

(assert (=> b!301483 (= e!190267 false)))

(declare-fun lt!149850 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301483 (= lt!149850 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301484 () Bool)

(declare-fun res!159164 () Bool)

(assert (=> b!301484 (=> (not res!159164) (not e!190267))))

(declare-fun arrayContainsKey!0 (array!15260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301484 (= res!159164 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301485 () Bool)

(declare-fun res!159162 () Bool)

(assert (=> b!301485 (=> (not res!159162) (not e!190267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301485 (= res!159162 (validKeyInArray!0 k0!2441))))

(declare-fun res!159160 () Bool)

(assert (=> start!30070 (=> (not res!159160) (not e!190267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30070 (= res!159160 (validMask!0 mask!3709))))

(assert (=> start!30070 e!190267))

(assert (=> start!30070 true))

(declare-fun array_inv!5184 (array!15260) Bool)

(assert (=> start!30070 (array_inv!5184 a!3293)))

(declare-fun b!301486 () Bool)

(declare-fun res!159161 () Bool)

(assert (=> b!301486 (=> (not res!159161) (not e!190267))))

(declare-datatypes ((SeekEntryResult!2361 0))(
  ( (MissingZero!2361 (index!11620 (_ BitVec 32))) (Found!2361 (index!11621 (_ BitVec 32))) (Intermediate!2361 (undefined!3173 Bool) (index!11622 (_ BitVec 32)) (x!29897 (_ BitVec 32))) (Undefined!2361) (MissingVacant!2361 (index!11623 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15260 (_ BitVec 32)) SeekEntryResult!2361)

(assert (=> b!301486 (= res!159161 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2361 i!1240)))))

(declare-fun b!301487 () Bool)

(declare-fun res!159165 () Bool)

(assert (=> b!301487 (=> (not res!159165) (not e!190267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15260 (_ BitVec 32)) Bool)

(assert (=> b!301487 (= res!159165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30070 res!159160) b!301482))

(assert (= (and b!301482 res!159163) b!301485))

(assert (= (and b!301485 res!159162) b!301484))

(assert (= (and b!301484 res!159164) b!301486))

(assert (= (and b!301486 res!159161) b!301487))

(assert (= (and b!301487 res!159165) b!301483))

(declare-fun m!313249 () Bool)

(assert (=> b!301483 m!313249))

(declare-fun m!313251 () Bool)

(assert (=> start!30070 m!313251))

(declare-fun m!313253 () Bool)

(assert (=> start!30070 m!313253))

(declare-fun m!313255 () Bool)

(assert (=> b!301487 m!313255))

(declare-fun m!313257 () Bool)

(assert (=> b!301485 m!313257))

(declare-fun m!313259 () Bool)

(assert (=> b!301484 m!313259))

(declare-fun m!313261 () Bool)

(assert (=> b!301486 m!313261))

(check-sat (not start!30070) (not b!301483) (not b!301485) (not b!301486) (not b!301487) (not b!301484))
