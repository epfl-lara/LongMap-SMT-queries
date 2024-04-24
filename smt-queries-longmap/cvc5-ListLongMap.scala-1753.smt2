; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32106 () Bool)

(assert start!32106)

(declare-fun b!320077 () Bool)

(declare-fun res!174375 () Bool)

(declare-fun e!198683 () Bool)

(assert (=> b!320077 (=> (not res!174375) (not e!198683))))

(declare-datatypes ((array!16354 0))(
  ( (array!16355 (arr!7737 (Array (_ BitVec 32) (_ BitVec 64))) (size!8089 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16354)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320077 (= res!174375 (and (= (size!8089 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8089 a!3305))))))

(declare-fun b!320078 () Bool)

(assert (=> b!320078 (= e!198683 false)))

(declare-fun lt!156003 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320078 (= lt!156003 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!320079 () Bool)

(declare-fun res!174373 () Bool)

(assert (=> b!320079 (=> (not res!174373) (not e!198683))))

(declare-datatypes ((SeekEntryResult!2833 0))(
  ( (MissingZero!2833 (index!13508 (_ BitVec 32))) (Found!2833 (index!13509 (_ BitVec 32))) (Intermediate!2833 (undefined!3645 Bool) (index!13510 (_ BitVec 32)) (x!31883 (_ BitVec 32))) (Undefined!2833) (MissingVacant!2833 (index!13511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16354 (_ BitVec 32)) SeekEntryResult!2833)

(assert (=> b!320079 (= res!174373 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2833 i!1250)))))

(declare-fun res!174374 () Bool)

(assert (=> start!32106 (=> (not res!174374) (not e!198683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32106 (= res!174374 (validMask!0 mask!3777))))

(assert (=> start!32106 e!198683))

(assert (=> start!32106 true))

(declare-fun array_inv!5687 (array!16354) Bool)

(assert (=> start!32106 (array_inv!5687 a!3305)))

(declare-fun b!320080 () Bool)

(declare-fun res!174370 () Bool)

(assert (=> b!320080 (=> (not res!174370) (not e!198683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16354 (_ BitVec 32)) Bool)

(assert (=> b!320080 (= res!174370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320081 () Bool)

(declare-fun res!174371 () Bool)

(assert (=> b!320081 (=> (not res!174371) (not e!198683))))

(declare-fun arrayContainsKey!0 (array!16354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320081 (= res!174371 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320082 () Bool)

(declare-fun res!174372 () Bool)

(assert (=> b!320082 (=> (not res!174372) (not e!198683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320082 (= res!174372 (validKeyInArray!0 k!2497))))

(assert (= (and start!32106 res!174374) b!320077))

(assert (= (and b!320077 res!174375) b!320082))

(assert (= (and b!320082 res!174372) b!320081))

(assert (= (and b!320081 res!174371) b!320079))

(assert (= (and b!320079 res!174373) b!320080))

(assert (= (and b!320080 res!174370) b!320078))

(declare-fun m!328733 () Bool)

(assert (=> b!320079 m!328733))

(declare-fun m!328735 () Bool)

(assert (=> b!320081 m!328735))

(declare-fun m!328737 () Bool)

(assert (=> start!32106 m!328737))

(declare-fun m!328739 () Bool)

(assert (=> start!32106 m!328739))

(declare-fun m!328741 () Bool)

(assert (=> b!320078 m!328741))

(declare-fun m!328743 () Bool)

(assert (=> b!320082 m!328743))

(declare-fun m!328745 () Bool)

(assert (=> b!320080 m!328745))

(push 1)

(assert (not start!32106))

(assert (not b!320080))

(assert (not b!320079))

(assert (not b!320082))

(assert (not b!320078))

(assert (not b!320081))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

