; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32668 () Bool)

(assert start!32668)

(declare-fun b!326321 () Bool)

(declare-fun e!200990 () Bool)

(assert (=> b!326321 (= e!200990 false)))

(declare-datatypes ((array!16705 0))(
  ( (array!16706 (arr!7907 (Array (_ BitVec 32) (_ BitVec 64))) (size!8259 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16705)

(declare-datatypes ((Unit!10110 0))(
  ( (Unit!10111) )
))
(declare-fun lt!157301 () Unit!10110)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10110)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326321 (= lt!157301 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326322 () Bool)

(declare-fun res!179353 () Bool)

(declare-fun e!200991 () Bool)

(assert (=> b!326322 (=> (not res!179353) (not e!200991))))

(assert (=> b!326322 (= res!179353 (and (= (size!8259 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8259 a!3305))))))

(declare-fun b!326323 () Bool)

(declare-fun res!179354 () Bool)

(assert (=> b!326323 (=> (not res!179354) (not e!200991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16705 (_ BitVec 32)) Bool)

(assert (=> b!326323 (= res!179354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326324 () Bool)

(declare-fun res!179355 () Bool)

(assert (=> b!326324 (=> (not res!179355) (not e!200990))))

(declare-datatypes ((SeekEntryResult!3038 0))(
  ( (MissingZero!3038 (index!14328 (_ BitVec 32))) (Found!3038 (index!14329 (_ BitVec 32))) (Intermediate!3038 (undefined!3850 Bool) (index!14330 (_ BitVec 32)) (x!32580 (_ BitVec 32))) (Undefined!3038) (MissingVacant!3038 (index!14331 (_ BitVec 32))) )
))
(declare-fun lt!157302 () SeekEntryResult!3038)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16705 (_ BitVec 32)) SeekEntryResult!3038)

(assert (=> b!326324 (= res!179355 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157302))))

(declare-fun res!179357 () Bool)

(assert (=> start!32668 (=> (not res!179357) (not e!200991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32668 (= res!179357 (validMask!0 mask!3777))))

(assert (=> start!32668 e!200991))

(declare-fun array_inv!5870 (array!16705) Bool)

(assert (=> start!32668 (array_inv!5870 a!3305)))

(assert (=> start!32668 true))

(declare-fun b!326325 () Bool)

(assert (=> b!326325 (= e!200991 e!200990)))

(declare-fun res!179358 () Bool)

(assert (=> b!326325 (=> (not res!179358) (not e!200990))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326325 (= res!179358 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157302))))

(assert (=> b!326325 (= lt!157302 (Intermediate!3038 false resIndex!58 resX!58))))

(declare-fun b!326326 () Bool)

(declare-fun res!179359 () Bool)

(assert (=> b!326326 (=> (not res!179359) (not e!200990))))

(assert (=> b!326326 (= res!179359 (and (= (select (arr!7907 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8259 a!3305))))))

(declare-fun b!326327 () Bool)

(declare-fun res!179360 () Bool)

(assert (=> b!326327 (=> (not res!179360) (not e!200990))))

(assert (=> b!326327 (= res!179360 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7907 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326328 () Bool)

(declare-fun res!179352 () Bool)

(assert (=> b!326328 (=> (not res!179352) (not e!200991))))

(declare-fun arrayContainsKey!0 (array!16705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326328 (= res!179352 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326329 () Bool)

(declare-fun res!179356 () Bool)

(assert (=> b!326329 (=> (not res!179356) (not e!200991))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16705 (_ BitVec 32)) SeekEntryResult!3038)

(assert (=> b!326329 (= res!179356 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3038 i!1250)))))

(declare-fun b!326330 () Bool)

(declare-fun res!179361 () Bool)

(assert (=> b!326330 (=> (not res!179361) (not e!200991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326330 (= res!179361 (validKeyInArray!0 k!2497))))

(assert (= (and start!32668 res!179357) b!326322))

(assert (= (and b!326322 res!179353) b!326330))

(assert (= (and b!326330 res!179361) b!326328))

(assert (= (and b!326328 res!179352) b!326329))

(assert (= (and b!326329 res!179356) b!326323))

(assert (= (and b!326323 res!179354) b!326325))

(assert (= (and b!326325 res!179358) b!326326))

(assert (= (and b!326326 res!179359) b!326324))

(assert (= (and b!326324 res!179355) b!326327))

(assert (= (and b!326327 res!179360) b!326321))

(declare-fun m!332885 () Bool)

(assert (=> b!326321 m!332885))

(assert (=> b!326321 m!332885))

(declare-fun m!332887 () Bool)

(assert (=> b!326321 m!332887))

(declare-fun m!332889 () Bool)

(assert (=> b!326324 m!332889))

(declare-fun m!332891 () Bool)

(assert (=> b!326326 m!332891))

(declare-fun m!332893 () Bool)

(assert (=> b!326327 m!332893))

(declare-fun m!332895 () Bool)

(assert (=> b!326328 m!332895))

(declare-fun m!332897 () Bool)

(assert (=> b!326330 m!332897))

(declare-fun m!332899 () Bool)

(assert (=> b!326323 m!332899))

(declare-fun m!332901 () Bool)

(assert (=> start!32668 m!332901))

(declare-fun m!332903 () Bool)

(assert (=> start!32668 m!332903))

(declare-fun m!332905 () Bool)

(assert (=> b!326325 m!332905))

(assert (=> b!326325 m!332905))

(declare-fun m!332907 () Bool)

(assert (=> b!326325 m!332907))

(declare-fun m!332909 () Bool)

(assert (=> b!326329 m!332909))

(push 1)

