; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29984 () Bool)

(assert start!29984)

(declare-fun b!301050 () Bool)

(declare-fun res!158852 () Bool)

(declare-fun e!190052 () Bool)

(assert (=> b!301050 (=> (not res!158852) (not e!190052))))

(declare-datatypes ((array!15220 0))(
  ( (array!15221 (arr!7202 (Array (_ BitVec 32) (_ BitVec 64))) (size!7554 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15220)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301050 (= res!158852 (and (= (size!7554 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7554 a!3293))))))

(declare-fun b!301053 () Bool)

(assert (=> b!301053 (= e!190052 false)))

(declare-datatypes ((SeekEntryResult!2307 0))(
  ( (MissingZero!2307 (index!11404 (_ BitVec 32))) (Found!2307 (index!11405 (_ BitVec 32))) (Intermediate!2307 (undefined!3119 Bool) (index!11406 (_ BitVec 32)) (x!29792 (_ BitVec 32))) (Undefined!2307) (MissingVacant!2307 (index!11407 (_ BitVec 32))) )
))
(declare-fun lt!149787 () SeekEntryResult!2307)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15220 (_ BitVec 32)) SeekEntryResult!2307)

(assert (=> b!301053 (= lt!149787 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun b!301052 () Bool)

(declare-fun res!158851 () Bool)

(assert (=> b!301052 (=> (not res!158851) (not e!190052))))

(declare-fun arrayContainsKey!0 (array!15220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301052 (= res!158851 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!158850 () Bool)

(assert (=> start!29984 (=> (not res!158850) (not e!190052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29984 (= res!158850 (validMask!0 mask!3709))))

(assert (=> start!29984 e!190052))

(assert (=> start!29984 true))

(declare-fun array_inv!5152 (array!15220) Bool)

(assert (=> start!29984 (array_inv!5152 a!3293)))

(declare-fun b!301051 () Bool)

(declare-fun res!158853 () Bool)

(assert (=> b!301051 (=> (not res!158853) (not e!190052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301051 (= res!158853 (validKeyInArray!0 k!2441))))

(assert (= (and start!29984 res!158850) b!301050))

(assert (= (and b!301050 res!158852) b!301051))

(assert (= (and b!301051 res!158853) b!301052))

(assert (= (and b!301052 res!158851) b!301053))

(declare-fun m!313081 () Bool)

(assert (=> b!301053 m!313081))

(declare-fun m!313083 () Bool)

(assert (=> b!301052 m!313083))

(declare-fun m!313085 () Bool)

(assert (=> start!29984 m!313085))

(declare-fun m!313087 () Bool)

(assert (=> start!29984 m!313087))

(declare-fun m!313089 () Bool)

(assert (=> b!301051 m!313089))

(push 1)

(assert (not b!301053))

(assert (not b!301052))

(assert (not start!29984))

(assert (not b!301051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

