; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33206 () Bool)

(assert start!33206)

(declare-fun b!330357 () Bool)

(declare-fun e!202789 () Bool)

(assert (=> b!330357 (= e!202789 (not true))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330357 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!10249 0))(
  ( (Unit!10250) )
))
(declare-fun lt!158526 () Unit!10249)

(declare-fun e!202790 () Unit!10249)

(assert (=> b!330357 (= lt!158526 e!202790)))

(declare-fun c!51781 () Bool)

(assert (=> b!330357 (= c!51781 (not (= resIndex!58 index!1840)))))

(declare-fun b!330358 () Bool)

(declare-fun Unit!10251 () Unit!10249)

(assert (=> b!330358 (= e!202790 Unit!10251)))

(declare-fun b!330359 () Bool)

(declare-fun e!202791 () Unit!10249)

(declare-fun Unit!10252 () Unit!10249)

(assert (=> b!330359 (= e!202791 Unit!10252)))

(declare-fun res!182085 () Bool)

(declare-fun e!202788 () Bool)

(assert (=> start!33206 (=> (not res!182085) (not e!202788))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33206 (= res!182085 (validMask!0 mask!3777))))

(assert (=> start!33206 e!202788))

(declare-datatypes ((array!16878 0))(
  ( (array!16879 (arr!7981 (Array (_ BitVec 32) (_ BitVec 64))) (size!8333 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16878)

(declare-fun array_inv!5931 (array!16878) Bool)

(assert (=> start!33206 (array_inv!5931 a!3305)))

(assert (=> start!33206 true))

(declare-fun b!330360 () Bool)

(declare-fun Unit!10253 () Unit!10249)

(assert (=> b!330360 (= e!202791 Unit!10253)))

(assert (=> b!330360 false))

(declare-fun b!330361 () Bool)

(declare-fun res!182088 () Bool)

(assert (=> b!330361 (=> (not res!182088) (not e!202788))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3077 0))(
  ( (MissingZero!3077 (index!14484 (_ BitVec 32))) (Found!3077 (index!14485 (_ BitVec 32))) (Intermediate!3077 (undefined!3889 Bool) (index!14486 (_ BitVec 32)) (x!32873 (_ BitVec 32))) (Undefined!3077) (MissingVacant!3077 (index!14487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16878 (_ BitVec 32)) SeekEntryResult!3077)

(assert (=> b!330361 (= res!182088 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3077 i!1250)))))

(declare-fun b!330362 () Bool)

(assert (=> b!330362 (= e!202788 e!202789)))

(declare-fun res!182082 () Bool)

(assert (=> b!330362 (=> (not res!182082) (not e!202789))))

(declare-fun lt!158525 () SeekEntryResult!3077)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16878 (_ BitVec 32)) SeekEntryResult!3077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330362 (= res!182082 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158525))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330362 (= lt!158525 (Intermediate!3077 false resIndex!58 resX!58))))

(declare-fun b!330363 () Bool)

(declare-fun res!182087 () Bool)

(assert (=> b!330363 (=> (not res!182087) (not e!202788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330363 (= res!182087 (validKeyInArray!0 k0!2497))))

(declare-fun b!330364 () Bool)

(declare-fun res!182084 () Bool)

(assert (=> b!330364 (=> (not res!182084) (not e!202789))))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330364 (= res!182084 (and (= (select (arr!7981 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8333 a!3305))))))

(declare-fun b!330365 () Bool)

(declare-fun res!182091 () Bool)

(assert (=> b!330365 (=> (not res!182091) (not e!202789))))

(assert (=> b!330365 (= res!182091 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158525))))

(declare-fun b!330366 () Bool)

(assert (=> b!330366 false))

(declare-fun e!202787 () Unit!10249)

(declare-fun Unit!10254 () Unit!10249)

(assert (=> b!330366 (= e!202787 Unit!10254)))

(declare-fun b!330367 () Bool)

(declare-fun res!182086 () Bool)

(assert (=> b!330367 (=> (not res!182086) (not e!202788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16878 (_ BitVec 32)) Bool)

(assert (=> b!330367 (= res!182086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330368 () Bool)

(declare-fun res!182083 () Bool)

(assert (=> b!330368 (=> (not res!182083) (not e!202788))))

(assert (=> b!330368 (= res!182083 (and (= (size!8333 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8333 a!3305))))))

(declare-fun b!330369 () Bool)

(declare-fun res!182089 () Bool)

(assert (=> b!330369 (=> (not res!182089) (not e!202789))))

(assert (=> b!330369 (= res!182089 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7981 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!330370 () Bool)

(assert (=> b!330370 false))

(declare-fun lt!158524 () Unit!10249)

(assert (=> b!330370 (= lt!158524 e!202791)))

(declare-fun c!51782 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330370 (= c!51782 ((_ is Intermediate!3077) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10255 () Unit!10249)

(assert (=> b!330370 (= e!202787 Unit!10255)))

(declare-fun b!330371 () Bool)

(assert (=> b!330371 (= e!202790 e!202787)))

(declare-fun c!51780 () Bool)

(assert (=> b!330371 (= c!51780 (or (= (select (arr!7981 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7981 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330372 () Bool)

(declare-fun res!182090 () Bool)

(assert (=> b!330372 (=> (not res!182090) (not e!202788))))

(declare-fun arrayContainsKey!0 (array!16878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330372 (= res!182090 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33206 res!182085) b!330368))

(assert (= (and b!330368 res!182083) b!330363))

(assert (= (and b!330363 res!182087) b!330372))

(assert (= (and b!330372 res!182090) b!330361))

(assert (= (and b!330361 res!182088) b!330367))

(assert (= (and b!330367 res!182086) b!330362))

(assert (= (and b!330362 res!182082) b!330364))

(assert (= (and b!330364 res!182084) b!330365))

(assert (= (and b!330365 res!182091) b!330369))

(assert (= (and b!330369 res!182089) b!330357))

(assert (= (and b!330357 c!51781) b!330371))

(assert (= (and b!330357 (not c!51781)) b!330358))

(assert (= (and b!330371 c!51780) b!330366))

(assert (= (and b!330371 (not c!51780)) b!330370))

(assert (= (and b!330370 c!51782) b!330359))

(assert (= (and b!330370 (not c!51782)) b!330360))

(declare-fun m!335869 () Bool)

(assert (=> b!330364 m!335869))

(declare-fun m!335871 () Bool)

(assert (=> b!330361 m!335871))

(declare-fun m!335873 () Bool)

(assert (=> b!330362 m!335873))

(assert (=> b!330362 m!335873))

(declare-fun m!335875 () Bool)

(assert (=> b!330362 m!335875))

(declare-fun m!335877 () Bool)

(assert (=> b!330369 m!335877))

(declare-fun m!335879 () Bool)

(assert (=> b!330367 m!335879))

(declare-fun m!335881 () Bool)

(assert (=> b!330372 m!335881))

(declare-fun m!335883 () Bool)

(assert (=> b!330363 m!335883))

(declare-fun m!335885 () Bool)

(assert (=> b!330370 m!335885))

(assert (=> b!330370 m!335885))

(declare-fun m!335887 () Bool)

(assert (=> b!330370 m!335887))

(declare-fun m!335889 () Bool)

(assert (=> start!33206 m!335889))

(declare-fun m!335891 () Bool)

(assert (=> start!33206 m!335891))

(assert (=> b!330371 m!335877))

(declare-fun m!335893 () Bool)

(assert (=> b!330365 m!335893))

(check-sat (not b!330365) (not b!330363) (not b!330370) (not b!330361) (not start!33206) (not b!330367) (not b!330362) (not b!330372))
(check-sat)
