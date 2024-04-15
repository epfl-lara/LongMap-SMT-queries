; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63710 () Bool)

(assert start!63710)

(declare-fun b!716947 () Bool)

(declare-fun res!479875 () Bool)

(declare-fun e!402523 () Bool)

(assert (=> b!716947 (=> (not res!479875) (not e!402523))))

(declare-datatypes ((array!40616 0))(
  ( (array!40617 (arr!19441 (Array (_ BitVec 32) (_ BitVec 64))) (size!19862 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40616)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716947 (= res!479875 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716948 () Bool)

(declare-fun res!479874 () Bool)

(assert (=> b!716948 (=> (not res!479874) (not e!402523))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716948 (= res!479874 (and (= (size!19862 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19862 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19862 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716950 () Bool)

(declare-fun res!479876 () Bool)

(assert (=> b!716950 (=> (not res!479876) (not e!402523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716950 (= res!479876 (validKeyInArray!0 k!2102))))

(declare-fun b!716951 () Bool)

(declare-fun res!479877 () Bool)

(assert (=> b!716951 (=> (not res!479877) (not e!402523))))

(assert (=> b!716951 (= res!479877 (validKeyInArray!0 (select (arr!19441 a!3186) j!159)))))

(declare-fun b!716949 () Bool)

(assert (=> b!716949 (= e!402523 false)))

(declare-datatypes ((SeekEntryResult!7038 0))(
  ( (MissingZero!7038 (index!30520 (_ BitVec 32))) (Found!7038 (index!30521 (_ BitVec 32))) (Intermediate!7038 (undefined!7850 Bool) (index!30522 (_ BitVec 32)) (x!61549 (_ BitVec 32))) (Undefined!7038) (MissingVacant!7038 (index!30523 (_ BitVec 32))) )
))
(declare-fun lt!318779 () SeekEntryResult!7038)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40616 (_ BitVec 32)) SeekEntryResult!7038)

(assert (=> b!716949 (= lt!318779 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!479873 () Bool)

(assert (=> start!63710 (=> (not res!479873) (not e!402523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63710 (= res!479873 (validMask!0 mask!3328))))

(assert (=> start!63710 e!402523))

(declare-fun array_inv!15324 (array!40616) Bool)

(assert (=> start!63710 (array_inv!15324 a!3186)))

(assert (=> start!63710 true))

(assert (= (and start!63710 res!479873) b!716948))

(assert (= (and b!716948 res!479874) b!716951))

(assert (= (and b!716951 res!479877) b!716950))

(assert (= (and b!716950 res!479876) b!716947))

(assert (= (and b!716947 res!479875) b!716949))

(declare-fun m!672439 () Bool)

(assert (=> b!716950 m!672439))

(declare-fun m!672441 () Bool)

(assert (=> b!716949 m!672441))

(declare-fun m!672443 () Bool)

(assert (=> b!716947 m!672443))

(declare-fun m!672445 () Bool)

(assert (=> b!716951 m!672445))

(assert (=> b!716951 m!672445))

(declare-fun m!672447 () Bool)

(assert (=> b!716951 m!672447))

(declare-fun m!672449 () Bool)

(assert (=> start!63710 m!672449))

(declare-fun m!672451 () Bool)

(assert (=> start!63710 m!672451))

(push 1)

(assert (not b!716950))

(assert (not b!716951))

(assert (not start!63710))

(assert (not b!716947))

(assert (not b!716949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

