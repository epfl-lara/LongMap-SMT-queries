; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32528 () Bool)

(assert start!32528)

(declare-fun b!325373 () Bool)

(declare-fun res!178708 () Bool)

(declare-fun e!200558 () Bool)

(assert (=> b!325373 (=> (not res!178708) (not e!200558))))

(declare-datatypes ((array!16667 0))(
  ( (array!16668 (arr!7891 (Array (_ BitVec 32) (_ BitVec 64))) (size!8243 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16667)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!325373 (= res!178708 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7891 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325374 () Bool)

(declare-fun res!178707 () Bool)

(declare-fun e!200560 () Bool)

(assert (=> b!325374 (=> (not res!178707) (not e!200560))))

(declare-fun arrayContainsKey!0 (array!16667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325374 (= res!178707 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!178710 () Bool)

(assert (=> start!32528 (=> (not res!178710) (not e!200560))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32528 (= res!178710 (validMask!0 mask!3777))))

(assert (=> start!32528 e!200560))

(declare-fun array_inv!5854 (array!16667) Bool)

(assert (=> start!32528 (array_inv!5854 a!3305)))

(assert (=> start!32528 true))

(declare-fun b!325375 () Bool)

(declare-fun res!178713 () Bool)

(assert (=> b!325375 (=> (not res!178713) (not e!200560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325375 (= res!178713 (validKeyInArray!0 k!2497))))

(declare-fun b!325376 () Bool)

(assert (=> b!325376 (= e!200560 e!200558)))

(declare-fun res!178711 () Bool)

(assert (=> b!325376 (=> (not res!178711) (not e!200558))))

(declare-datatypes ((SeekEntryResult!3022 0))(
  ( (MissingZero!3022 (index!14264 (_ BitVec 32))) (Found!3022 (index!14265 (_ BitVec 32))) (Intermediate!3022 (undefined!3834 Bool) (index!14266 (_ BitVec 32)) (x!32498 (_ BitVec 32))) (Undefined!3022) (MissingVacant!3022 (index!14267 (_ BitVec 32))) )
))
(declare-fun lt!156990 () SeekEntryResult!3022)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16667 (_ BitVec 32)) SeekEntryResult!3022)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325376 (= res!178711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156990))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325376 (= lt!156990 (Intermediate!3022 false resIndex!58 resX!58))))

(declare-fun b!325377 () Bool)

(declare-fun res!178709 () Bool)

(assert (=> b!325377 (=> (not res!178709) (not e!200560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16667 (_ BitVec 32)) Bool)

(assert (=> b!325377 (= res!178709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325378 () Bool)

(declare-fun res!178704 () Bool)

(assert (=> b!325378 (=> (not res!178704) (not e!200560))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16667 (_ BitVec 32)) SeekEntryResult!3022)

(assert (=> b!325378 (= res!178704 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3022 i!1250)))))

(declare-fun b!325379 () Bool)

(declare-fun res!178706 () Bool)

(assert (=> b!325379 (=> (not res!178706) (not e!200558))))

(assert (=> b!325379 (= res!178706 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156990))))

(declare-fun b!325380 () Bool)

(assert (=> b!325380 (= e!200558 (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(declare-fun lt!156989 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325380 (= lt!156989 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325381 () Bool)

(declare-fun res!178705 () Bool)

(assert (=> b!325381 (=> (not res!178705) (not e!200560))))

(assert (=> b!325381 (= res!178705 (and (= (size!8243 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8243 a!3305))))))

(declare-fun b!325382 () Bool)

(declare-fun res!178712 () Bool)

(assert (=> b!325382 (=> (not res!178712) (not e!200558))))

(assert (=> b!325382 (= res!178712 (and (= (select (arr!7891 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8243 a!3305))))))

(assert (= (and start!32528 res!178710) b!325381))

(assert (= (and b!325381 res!178705) b!325375))

(assert (= (and b!325375 res!178713) b!325374))

(assert (= (and b!325374 res!178707) b!325378))

(assert (= (and b!325378 res!178704) b!325377))

(assert (= (and b!325377 res!178709) b!325376))

(assert (= (and b!325376 res!178711) b!325382))

(assert (= (and b!325382 res!178712) b!325379))

(assert (= (and b!325379 res!178706) b!325373))

(assert (= (and b!325373 res!178708) b!325380))

(declare-fun m!332231 () Bool)

(assert (=> b!325374 m!332231))

(declare-fun m!332233 () Bool)

(assert (=> b!325376 m!332233))

(assert (=> b!325376 m!332233))

(declare-fun m!332235 () Bool)

(assert (=> b!325376 m!332235))

(declare-fun m!332237 () Bool)

(assert (=> b!325378 m!332237))

(declare-fun m!332239 () Bool)

(assert (=> b!325377 m!332239))

(declare-fun m!332241 () Bool)

(assert (=> b!325379 m!332241))

(declare-fun m!332243 () Bool)

(assert (=> b!325380 m!332243))

(declare-fun m!332245 () Bool)

(assert (=> b!325375 m!332245))

(declare-fun m!332247 () Bool)

(assert (=> b!325373 m!332247))

(declare-fun m!332249 () Bool)

(assert (=> b!325382 m!332249))

(declare-fun m!332251 () Bool)

(assert (=> start!32528 m!332251))

(declare-fun m!332253 () Bool)

(assert (=> start!32528 m!332253))

(push 1)

(assert (not b!325379))

(assert (not start!32528))

(assert (not b!325375))

(assert (not b!325376))

(assert (not b!325374))

(assert (not b!325378))

(assert (not b!325377))

(assert (not b!325380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

