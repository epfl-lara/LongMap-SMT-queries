; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29998 () Bool)

(assert start!29998)

(declare-fun res!158935 () Bool)

(declare-fun e!190095 () Bool)

(assert (=> start!29998 (=> (not res!158935) (not e!190095))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29998 (= res!158935 (validMask!0 mask!3709))))

(assert (=> start!29998 e!190095))

(assert (=> start!29998 true))

(declare-datatypes ((array!15234 0))(
  ( (array!15235 (arr!7209 (Array (_ BitVec 32) (_ BitVec 64))) (size!7561 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15234)

(declare-fun array_inv!5159 (array!15234) Bool)

(assert (=> start!29998 (array_inv!5159 a!3293)))

(declare-fun b!301135 () Bool)

(declare-fun res!158934 () Bool)

(assert (=> b!301135 (=> (not res!158934) (not e!190095))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301135 (= res!158934 (validKeyInArray!0 k!2441))))

(declare-fun b!301137 () Bool)

(assert (=> b!301137 (= e!190095 false)))

(declare-datatypes ((SeekEntryResult!2314 0))(
  ( (MissingZero!2314 (index!11432 (_ BitVec 32))) (Found!2314 (index!11433 (_ BitVec 32))) (Intermediate!2314 (undefined!3126 Bool) (index!11434 (_ BitVec 32)) (x!29815 (_ BitVec 32))) (Undefined!2314) (MissingVacant!2314 (index!11435 (_ BitVec 32))) )
))
(declare-fun lt!149808 () SeekEntryResult!2314)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15234 (_ BitVec 32)) SeekEntryResult!2314)

(assert (=> b!301137 (= lt!149808 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun b!301136 () Bool)

(declare-fun res!158937 () Bool)

(assert (=> b!301136 (=> (not res!158937) (not e!190095))))

(declare-fun arrayContainsKey!0 (array!15234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301136 (= res!158937 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301134 () Bool)

(declare-fun res!158936 () Bool)

(assert (=> b!301134 (=> (not res!158936) (not e!190095))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301134 (= res!158936 (and (= (size!7561 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7561 a!3293))))))

(assert (= (and start!29998 res!158935) b!301134))

(assert (= (and b!301134 res!158936) b!301135))

(assert (= (and b!301135 res!158934) b!301136))

(assert (= (and b!301136 res!158937) b!301137))

(declare-fun m!313151 () Bool)

(assert (=> start!29998 m!313151))

(declare-fun m!313153 () Bool)

(assert (=> start!29998 m!313153))

(declare-fun m!313155 () Bool)

(assert (=> b!301135 m!313155))

(declare-fun m!313157 () Bool)

(assert (=> b!301137 m!313157))

(declare-fun m!313159 () Bool)

(assert (=> b!301136 m!313159))

(push 1)

(assert (not b!301135))

(assert (not b!301137))

(assert (not b!301136))

(assert (not start!29998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

