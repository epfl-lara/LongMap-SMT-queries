; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32264 () Bool)

(assert start!32264)

(declare-fun b!321414 () Bool)

(declare-fun res!175542 () Bool)

(declare-fun e!199168 () Bool)

(assert (=> b!321414 (=> (not res!175542) (not e!199168))))

(declare-datatypes ((array!16454 0))(
  ( (array!16455 (arr!7786 (Array (_ BitVec 32) (_ BitVec 64))) (size!8138 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16454)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321414 (= res!175542 (and (= (select (arr!7786 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8138 a!3305))))))

(declare-fun b!321415 () Bool)

(declare-fun res!175537 () Bool)

(assert (=> b!321415 (=> (not res!175537) (not e!199168))))

(declare-datatypes ((SeekEntryResult!2917 0))(
  ( (MissingZero!2917 (index!13844 (_ BitVec 32))) (Found!2917 (index!13845 (_ BitVec 32))) (Intermediate!2917 (undefined!3729 Bool) (index!13846 (_ BitVec 32)) (x!32104 (_ BitVec 32))) (Undefined!2917) (MissingVacant!2917 (index!13847 (_ BitVec 32))) )
))
(declare-fun lt!156192 () SeekEntryResult!2917)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16454 (_ BitVec 32)) SeekEntryResult!2917)

(assert (=> b!321415 (= res!175537 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156192))))

(declare-fun b!321416 () Bool)

(declare-fun res!175541 () Bool)

(declare-fun e!199166 () Bool)

(assert (=> b!321416 (=> (not res!175541) (not e!199166))))

(declare-fun arrayContainsKey!0 (array!16454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321416 (= res!175541 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175535 () Bool)

(assert (=> start!32264 (=> (not res!175535) (not e!199166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32264 (= res!175535 (validMask!0 mask!3777))))

(assert (=> start!32264 e!199166))

(declare-fun array_inv!5749 (array!16454) Bool)

(assert (=> start!32264 (array_inv!5749 a!3305)))

(assert (=> start!32264 true))

(declare-fun b!321417 () Bool)

(declare-fun res!175540 () Bool)

(assert (=> b!321417 (=> (not res!175540) (not e!199166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16454 (_ BitVec 32)) Bool)

(assert (=> b!321417 (= res!175540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321418 () Bool)

(assert (=> b!321418 (= e!199166 e!199168)))

(declare-fun res!175536 () Bool)

(assert (=> b!321418 (=> (not res!175536) (not e!199168))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321418 (= res!175536 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156192))))

(assert (=> b!321418 (= lt!156192 (Intermediate!2917 false resIndex!58 resX!58))))

(declare-fun b!321419 () Bool)

(declare-fun res!175539 () Bool)

(assert (=> b!321419 (=> (not res!175539) (not e!199166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321419 (= res!175539 (validKeyInArray!0 k!2497))))

(declare-fun b!321420 () Bool)

(declare-fun res!175534 () Bool)

(assert (=> b!321420 (=> (not res!175534) (not e!199166))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16454 (_ BitVec 32)) SeekEntryResult!2917)

(assert (=> b!321420 (= res!175534 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2917 i!1250)))))

(declare-fun b!321421 () Bool)

(declare-fun res!175538 () Bool)

(assert (=> b!321421 (=> (not res!175538) (not e!199166))))

(assert (=> b!321421 (= res!175538 (and (= (size!8138 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8138 a!3305))))))

(declare-fun b!321422 () Bool)

(assert (=> b!321422 (= e!199168 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7786 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7786 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7786 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(assert (= (and start!32264 res!175535) b!321421))

(assert (= (and b!321421 res!175538) b!321419))

(assert (= (and b!321419 res!175539) b!321416))

(assert (= (and b!321416 res!175541) b!321420))

(assert (= (and b!321420 res!175534) b!321417))

(assert (= (and b!321417 res!175540) b!321418))

(assert (= (and b!321418 res!175536) b!321414))

(assert (= (and b!321414 res!175542) b!321415))

(assert (= (and b!321415 res!175537) b!321422))

(declare-fun m!329563 () Bool)

(assert (=> b!321417 m!329563))

(declare-fun m!329565 () Bool)

(assert (=> b!321418 m!329565))

(assert (=> b!321418 m!329565))

(declare-fun m!329567 () Bool)

(assert (=> b!321418 m!329567))

(declare-fun m!329569 () Bool)

(assert (=> b!321422 m!329569))

(declare-fun m!329571 () Bool)

(assert (=> b!321420 m!329571))

(declare-fun m!329573 () Bool)

(assert (=> b!321416 m!329573))

(declare-fun m!329575 () Bool)

(assert (=> start!32264 m!329575))

(declare-fun m!329577 () Bool)

(assert (=> start!32264 m!329577))

(declare-fun m!329579 () Bool)

(assert (=> b!321419 m!329579))

(declare-fun m!329581 () Bool)

(assert (=> b!321415 m!329581))

(declare-fun m!329583 () Bool)

(assert (=> b!321414 m!329583))

(push 1)

(assert (not b!321419))

(assert (not b!321418))

(assert (not start!32264))

(assert (not b!321420))

(assert (not b!321416))

(assert (not b!321417))

(assert (not b!321415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

