; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32232 () Bool)

(assert start!32232)

(declare-fun b!321128 () Bool)

(declare-fun e!199061 () Bool)

(assert (=> b!321128 (= e!199061 false)))

(declare-datatypes ((array!16435 0))(
  ( (array!16436 (arr!7776 (Array (_ BitVec 32) (_ BitVec 64))) (size!8128 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16435)

(declare-datatypes ((SeekEntryResult!2872 0))(
  ( (MissingZero!2872 (index!13664 (_ BitVec 32))) (Found!2872 (index!13665 (_ BitVec 32))) (Intermediate!2872 (undefined!3684 Bool) (index!13666 (_ BitVec 32)) (x!32032 (_ BitVec 32))) (Undefined!2872) (MissingVacant!2872 (index!13667 (_ BitVec 32))) )
))
(declare-fun lt!156183 () SeekEntryResult!2872)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16435 (_ BitVec 32)) SeekEntryResult!2872)

(assert (=> b!321128 (= lt!156183 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun res!175300 () Bool)

(assert (=> start!32232 (=> (not res!175300) (not e!199061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32232 (= res!175300 (validMask!0 mask!3777))))

(assert (=> start!32232 e!199061))

(declare-fun array_inv!5726 (array!16435) Bool)

(assert (=> start!32232 (array_inv!5726 a!3305)))

(assert (=> start!32232 true))

(declare-fun b!321129 () Bool)

(declare-fun res!175301 () Bool)

(assert (=> b!321129 (=> (not res!175301) (not e!199061))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16435 (_ BitVec 32)) SeekEntryResult!2872)

(assert (=> b!321129 (= res!175301 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2872 i!1250)))))

(declare-fun b!321130 () Bool)

(declare-fun res!175304 () Bool)

(assert (=> b!321130 (=> (not res!175304) (not e!199061))))

(assert (=> b!321130 (= res!175304 (and (= (size!8128 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8128 a!3305))))))

(declare-fun b!321131 () Bool)

(declare-fun res!175303 () Bool)

(assert (=> b!321131 (=> (not res!175303) (not e!199061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16435 (_ BitVec 32)) Bool)

(assert (=> b!321131 (= res!175303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321132 () Bool)

(declare-fun res!175298 () Bool)

(assert (=> b!321132 (=> (not res!175298) (not e!199061))))

(declare-fun arrayContainsKey!0 (array!16435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321132 (= res!175298 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321133 () Bool)

(declare-fun res!175302 () Bool)

(assert (=> b!321133 (=> (not res!175302) (not e!199061))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321133 (= res!175302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2872 false resIndex!58 resX!58)))))

(declare-fun b!321134 () Bool)

(declare-fun res!175299 () Bool)

(assert (=> b!321134 (=> (not res!175299) (not e!199061))))

(assert (=> b!321134 (= res!175299 (and (= (select (arr!7776 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8128 a!3305))))))

(declare-fun b!321135 () Bool)

(declare-fun res!175305 () Bool)

(assert (=> b!321135 (=> (not res!175305) (not e!199061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321135 (= res!175305 (validKeyInArray!0 k!2497))))

(assert (= (and start!32232 res!175300) b!321130))

(assert (= (and b!321130 res!175304) b!321135))

(assert (= (and b!321135 res!175305) b!321132))

(assert (= (and b!321132 res!175298) b!321129))

(assert (= (and b!321129 res!175301) b!321131))

(assert (= (and b!321131 res!175303) b!321133))

(assert (= (and b!321133 res!175302) b!321134))

(assert (= (and b!321134 res!175299) b!321128))

(declare-fun m!329549 () Bool)

(assert (=> b!321133 m!329549))

(assert (=> b!321133 m!329549))

(declare-fun m!329551 () Bool)

(assert (=> b!321133 m!329551))

(declare-fun m!329553 () Bool)

(assert (=> b!321128 m!329553))

(declare-fun m!329555 () Bool)

(assert (=> b!321132 m!329555))

(declare-fun m!329557 () Bool)

(assert (=> b!321135 m!329557))

(declare-fun m!329559 () Bool)

(assert (=> b!321129 m!329559))

(declare-fun m!329561 () Bool)

(assert (=> b!321134 m!329561))

(declare-fun m!329563 () Bool)

(assert (=> b!321131 m!329563))

(declare-fun m!329565 () Bool)

(assert (=> start!32232 m!329565))

(declare-fun m!329567 () Bool)

(assert (=> start!32232 m!329567))

(push 1)

(assert (not start!32232))

(assert (not b!321132))

(assert (not b!321135))

(assert (not b!321133))

(assert (not b!321131))

(assert (not b!321129))

(assert (not b!321128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

