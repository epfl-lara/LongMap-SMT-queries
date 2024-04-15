; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32406 () Bool)

(assert start!32406)

(declare-fun b!323409 () Bool)

(assert (=> b!323409 false))

(declare-datatypes ((Unit!10003 0))(
  ( (Unit!10004) )
))
(declare-fun e!199853 () Unit!10003)

(declare-fun Unit!10005 () Unit!10003)

(assert (=> b!323409 (= e!199853 Unit!10005)))

(declare-fun res!177005 () Bool)

(declare-fun e!199850 () Bool)

(assert (=> start!32406 (=> (not res!177005) (not e!199850))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32406 (= res!177005 (validMask!0 mask!3777))))

(assert (=> start!32406 e!199850))

(declare-datatypes ((array!16549 0))(
  ( (array!16550 (arr!7832 (Array (_ BitVec 32) (_ BitVec 64))) (size!8185 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16549)

(declare-fun array_inv!5804 (array!16549) Bool)

(assert (=> start!32406 (array_inv!5804 a!3305)))

(assert (=> start!32406 true))

(declare-fun b!323410 () Bool)

(declare-fun res!177003 () Bool)

(declare-fun e!199849 () Bool)

(assert (=> b!323410 (=> (not res!177003) (not e!199849))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323410 (= res!177003 (and (= (select (arr!7832 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8185 a!3305))))))

(declare-fun b!323411 () Bool)

(declare-fun e!199852 () Unit!10003)

(declare-fun Unit!10006 () Unit!10003)

(assert (=> b!323411 (= e!199852 Unit!10006)))

(declare-fun b!323412 () Bool)

(declare-fun res!177008 () Bool)

(assert (=> b!323412 (=> (not res!177008) (not e!199850))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323412 (= res!177008 (validKeyInArray!0 k!2497))))

(declare-fun b!323413 () Bool)

(declare-fun res!177000 () Bool)

(assert (=> b!323413 (=> (not res!177000) (not e!199849))))

(assert (=> b!323413 (= res!177000 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7832 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323414 () Bool)

(assert (=> b!323414 false))

(declare-fun lt!156447 () Unit!10003)

(assert (=> b!323414 (= lt!156447 e!199852)))

(declare-fun c!50832 () Bool)

(declare-datatypes ((SeekEntryResult!2962 0))(
  ( (MissingZero!2962 (index!14024 (_ BitVec 32))) (Found!2962 (index!14025 (_ BitVec 32))) (Intermediate!2962 (undefined!3774 Bool) (index!14026 (_ BitVec 32)) (x!32289 (_ BitVec 32))) (Undefined!2962) (MissingVacant!2962 (index!14027 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16549 (_ BitVec 32)) SeekEntryResult!2962)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323414 (= c!50832 (is-Intermediate!2962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10007 () Unit!10003)

(assert (=> b!323414 (= e!199853 Unit!10007)))

(declare-fun b!323415 () Bool)

(declare-fun res!177007 () Bool)

(assert (=> b!323415 (=> (not res!177007) (not e!199850))))

(declare-fun arrayContainsKey!0 (array!16549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323415 (= res!177007 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323416 () Bool)

(assert (=> b!323416 (= e!199850 e!199849)))

(declare-fun res!177001 () Bool)

(assert (=> b!323416 (=> (not res!177001) (not e!199849))))

(declare-fun lt!156448 () SeekEntryResult!2962)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323416 (= res!177001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156448))))

(assert (=> b!323416 (= lt!156448 (Intermediate!2962 false resIndex!58 resX!58))))

(declare-fun b!323417 () Bool)

(declare-fun res!177009 () Bool)

(assert (=> b!323417 (=> (not res!177009) (not e!199850))))

(assert (=> b!323417 (= res!177009 (and (= (size!8185 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8185 a!3305))))))

(declare-fun b!323418 () Bool)

(declare-fun e!199848 () Unit!10003)

(declare-fun Unit!10008 () Unit!10003)

(assert (=> b!323418 (= e!199848 Unit!10008)))

(declare-fun b!323419 () Bool)

(assert (=> b!323419 (= e!199848 e!199853)))

(declare-fun c!50834 () Bool)

(assert (=> b!323419 (= c!50834 (or (= (select (arr!7832 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7832 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323420 () Bool)

(declare-fun Unit!10009 () Unit!10003)

(assert (=> b!323420 (= e!199852 Unit!10009)))

(assert (=> b!323420 false))

(declare-fun b!323421 () Bool)

(declare-fun res!177002 () Bool)

(assert (=> b!323421 (=> (not res!177002) (not e!199850))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16549 (_ BitVec 32)) SeekEntryResult!2962)

(assert (=> b!323421 (= res!177002 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2962 i!1250)))))

(declare-fun b!323422 () Bool)

(declare-fun res!177006 () Bool)

(assert (=> b!323422 (=> (not res!177006) (not e!199850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16549 (_ BitVec 32)) Bool)

(assert (=> b!323422 (= res!177006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323423 () Bool)

(assert (=> b!323423 (= e!199849 (not (or (not (= (select (arr!7832 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(assert (=> b!323423 (= index!1840 resIndex!58)))

(declare-fun lt!156449 () Unit!10003)

(assert (=> b!323423 (= lt!156449 e!199848)))

(declare-fun c!50833 () Bool)

(assert (=> b!323423 (= c!50833 (not (= resIndex!58 index!1840)))))

(declare-fun b!323424 () Bool)

(declare-fun res!177004 () Bool)

(assert (=> b!323424 (=> (not res!177004) (not e!199849))))

(assert (=> b!323424 (= res!177004 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156448))))

(assert (= (and start!32406 res!177005) b!323417))

(assert (= (and b!323417 res!177009) b!323412))

(assert (= (and b!323412 res!177008) b!323415))

(assert (= (and b!323415 res!177007) b!323421))

(assert (= (and b!323421 res!177002) b!323422))

(assert (= (and b!323422 res!177006) b!323416))

(assert (= (and b!323416 res!177001) b!323410))

(assert (= (and b!323410 res!177003) b!323424))

(assert (= (and b!323424 res!177004) b!323413))

(assert (= (and b!323413 res!177000) b!323423))

(assert (= (and b!323423 c!50833) b!323419))

(assert (= (and b!323423 (not c!50833)) b!323418))

(assert (= (and b!323419 c!50834) b!323409))

(assert (= (and b!323419 (not c!50834)) b!323414))

(assert (= (and b!323414 c!50832) b!323411))

(assert (= (and b!323414 (not c!50832)) b!323420))

(declare-fun m!330221 () Bool)

(assert (=> b!323419 m!330221))

(declare-fun m!330223 () Bool)

(assert (=> b!323412 m!330223))

(declare-fun m!330225 () Bool)

(assert (=> b!323414 m!330225))

(assert (=> b!323414 m!330225))

(declare-fun m!330227 () Bool)

(assert (=> b!323414 m!330227))

(declare-fun m!330229 () Bool)

(assert (=> b!323416 m!330229))

(assert (=> b!323416 m!330229))

(declare-fun m!330231 () Bool)

(assert (=> b!323416 m!330231))

(assert (=> b!323423 m!330221))

(declare-fun m!330233 () Bool)

(assert (=> b!323424 m!330233))

(declare-fun m!330235 () Bool)

(assert (=> b!323410 m!330235))

(declare-fun m!330237 () Bool)

(assert (=> b!323415 m!330237))

(declare-fun m!330239 () Bool)

(assert (=> b!323422 m!330239))

(declare-fun m!330241 () Bool)

(assert (=> b!323421 m!330241))

(assert (=> b!323413 m!330221))

(declare-fun m!330243 () Bool)

(assert (=> start!32406 m!330243))

(declare-fun m!330245 () Bool)

(assert (=> start!32406 m!330245))

(push 1)

(assert (not b!323416))

(assert (not b!323415))

(assert (not start!32406))

(assert (not b!323412))

(assert (not b!323421))

(assert (not b!323422))

(assert (not b!323424))

(assert (not b!323414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

