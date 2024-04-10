; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32218 () Bool)

(assert start!32218)

(declare-fun res!174941 () Bool)

(declare-fun e!198988 () Bool)

(assert (=> start!32218 (=> (not res!174941) (not e!198988))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32218 (= res!174941 (validMask!0 mask!3777))))

(assert (=> start!32218 e!198988))

(declare-datatypes ((array!16408 0))(
  ( (array!16409 (arr!7763 (Array (_ BitVec 32) (_ BitVec 64))) (size!8115 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16408)

(declare-fun array_inv!5726 (array!16408) Bool)

(assert (=> start!32218 (array_inv!5726 a!3305)))

(assert (=> start!32218 true))

(declare-fun b!320820 () Bool)

(declare-fun e!198986 () Bool)

(assert (=> b!320820 (= e!198988 e!198986)))

(declare-fun res!174943 () Bool)

(assert (=> b!320820 (=> (not res!174943) (not e!198986))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2894 0))(
  ( (MissingZero!2894 (index!13752 (_ BitVec 32))) (Found!2894 (index!13753 (_ BitVec 32))) (Intermediate!2894 (undefined!3706 Bool) (index!13754 (_ BitVec 32)) (x!32025 (_ BitVec 32))) (Undefined!2894) (MissingVacant!2894 (index!13755 (_ BitVec 32))) )
))
(declare-fun lt!156123 () SeekEntryResult!2894)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16408 (_ BitVec 32)) SeekEntryResult!2894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320820 (= res!174943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156123))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320820 (= lt!156123 (Intermediate!2894 false resIndex!58 resX!58))))

(declare-fun b!320821 () Bool)

(declare-fun res!174945 () Bool)

(assert (=> b!320821 (=> (not res!174945) (not e!198988))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16408 (_ BitVec 32)) SeekEntryResult!2894)

(assert (=> b!320821 (= res!174945 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2894 i!1250)))))

(declare-fun b!320822 () Bool)

(declare-fun res!174948 () Bool)

(assert (=> b!320822 (=> (not res!174948) (not e!198988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16408 (_ BitVec 32)) Bool)

(assert (=> b!320822 (= res!174948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320823 () Bool)

(declare-fun res!174942 () Bool)

(assert (=> b!320823 (=> (not res!174942) (not e!198988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320823 (= res!174942 (validKeyInArray!0 k!2497))))

(declare-fun b!320824 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!320824 (= e!198986 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7763 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7763 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7763 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!320825 () Bool)

(declare-fun res!174946 () Bool)

(assert (=> b!320825 (=> (not res!174946) (not e!198988))))

(assert (=> b!320825 (= res!174946 (and (= (size!8115 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8115 a!3305))))))

(declare-fun b!320826 () Bool)

(declare-fun res!174947 () Bool)

(assert (=> b!320826 (=> (not res!174947) (not e!198986))))

(assert (=> b!320826 (= res!174947 (and (= (select (arr!7763 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8115 a!3305))))))

(declare-fun b!320827 () Bool)

(declare-fun res!174940 () Bool)

(assert (=> b!320827 (=> (not res!174940) (not e!198988))))

(declare-fun arrayContainsKey!0 (array!16408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320827 (= res!174940 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320828 () Bool)

(declare-fun res!174944 () Bool)

(assert (=> b!320828 (=> (not res!174944) (not e!198986))))

(assert (=> b!320828 (= res!174944 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156123))))

(assert (= (and start!32218 res!174941) b!320825))

(assert (= (and b!320825 res!174946) b!320823))

(assert (= (and b!320823 res!174942) b!320827))

(assert (= (and b!320827 res!174940) b!320821))

(assert (= (and b!320821 res!174945) b!320822))

(assert (= (and b!320822 res!174948) b!320820))

(assert (= (and b!320820 res!174943) b!320826))

(assert (= (and b!320826 res!174947) b!320828))

(assert (= (and b!320828 res!174944) b!320824))

(declare-fun m!329075 () Bool)

(assert (=> b!320822 m!329075))

(declare-fun m!329077 () Bool)

(assert (=> b!320828 m!329077))

(declare-fun m!329079 () Bool)

(assert (=> b!320826 m!329079))

(declare-fun m!329081 () Bool)

(assert (=> b!320820 m!329081))

(assert (=> b!320820 m!329081))

(declare-fun m!329083 () Bool)

(assert (=> b!320820 m!329083))

(declare-fun m!329085 () Bool)

(assert (=> b!320823 m!329085))

(declare-fun m!329087 () Bool)

(assert (=> b!320824 m!329087))

(declare-fun m!329089 () Bool)

(assert (=> b!320821 m!329089))

(declare-fun m!329091 () Bool)

(assert (=> b!320827 m!329091))

(declare-fun m!329093 () Bool)

(assert (=> start!32218 m!329093))

(declare-fun m!329095 () Bool)

(assert (=> start!32218 m!329095))

(push 1)

(assert (not b!320820))

(assert (not start!32218))

(assert (not b!320823))

(assert (not b!320821))

(assert (not b!320828))

(assert (not b!320827))

(assert (not b!320822))

