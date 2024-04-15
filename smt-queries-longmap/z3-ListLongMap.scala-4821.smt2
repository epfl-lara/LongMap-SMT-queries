; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66246 () Bool)

(assert start!66246)

(declare-fun b!763248 () Bool)

(declare-fun res!516361 () Bool)

(declare-fun e!425240 () Bool)

(assert (=> b!763248 (=> (not res!516361) (not e!425240))))

(declare-fun e!425238 () Bool)

(assert (=> b!763248 (= res!516361 e!425238)))

(declare-fun c!83835 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763248 (= c!83835 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763249 () Bool)

(assert (=> b!763249 (= e!425240 false)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!339578 () (_ BitVec 64))

(declare-datatypes ((array!42168 0))(
  ( (array!42169 (arr!20192 (Array (_ BitVec 32) (_ BitVec 64))) (size!20613 (_ BitVec 32))) )
))
(declare-fun lt!339576 () array!42168)

(declare-datatypes ((SeekEntryResult!7789 0))(
  ( (MissingZero!7789 (index!33524 (_ BitVec 32))) (Found!7789 (index!33525 (_ BitVec 32))) (Intermediate!7789 (undefined!8601 Bool) (index!33526 (_ BitVec 32)) (x!64436 (_ BitVec 32))) (Undefined!7789) (MissingVacant!7789 (index!33527 (_ BitVec 32))) )
))
(declare-fun lt!339579 () SeekEntryResult!7789)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42168 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!763249 (= lt!339579 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339578 lt!339576 mask!3328))))

(declare-fun lt!339580 () SeekEntryResult!7789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763249 (= lt!339580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339578 mask!3328) lt!339578 lt!339576 mask!3328))))

(declare-fun a!3186 () array!42168)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!763249 (= lt!339578 (select (store (arr!20192 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763249 (= lt!339576 (array!42169 (store (arr!20192 a!3186) i!1173 k0!2102) (size!20613 a!3186)))))

(declare-fun b!763250 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42168 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!763250 (= e!425238 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20192 a!3186) j!159) a!3186 mask!3328) (Found!7789 j!159)))))

(declare-fun b!763251 () Bool)

(declare-fun res!516356 () Bool)

(declare-fun e!425237 () Bool)

(assert (=> b!763251 (=> (not res!516356) (not e!425237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763251 (= res!516356 (validKeyInArray!0 k0!2102))))

(declare-fun b!763252 () Bool)

(declare-fun res!516357 () Bool)

(declare-fun e!425236 () Bool)

(assert (=> b!763252 (=> (not res!516357) (not e!425236))))

(declare-datatypes ((List!14233 0))(
  ( (Nil!14230) (Cons!14229 (h!15313 (_ BitVec 64)) (t!20539 List!14233)) )
))
(declare-fun arrayNoDuplicates!0 (array!42168 (_ BitVec 32) List!14233) Bool)

(assert (=> b!763252 (= res!516357 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14230))))

(declare-fun b!763253 () Bool)

(assert (=> b!763253 (= e!425237 e!425236)))

(declare-fun res!516359 () Bool)

(assert (=> b!763253 (=> (not res!516359) (not e!425236))))

(declare-fun lt!339581 () SeekEntryResult!7789)

(assert (=> b!763253 (= res!516359 (or (= lt!339581 (MissingZero!7789 i!1173)) (= lt!339581 (MissingVacant!7789 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42168 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!763253 (= lt!339581 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763254 () Bool)

(declare-fun res!516351 () Bool)

(assert (=> b!763254 (=> (not res!516351) (not e!425237))))

(assert (=> b!763254 (= res!516351 (validKeyInArray!0 (select (arr!20192 a!3186) j!159)))))

(declare-fun b!763255 () Bool)

(declare-fun res!516358 () Bool)

(assert (=> b!763255 (=> (not res!516358) (not e!425237))))

(assert (=> b!763255 (= res!516358 (and (= (size!20613 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20613 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20613 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763256 () Bool)

(declare-fun res!516352 () Bool)

(assert (=> b!763256 (=> (not res!516352) (not e!425236))))

(assert (=> b!763256 (= res!516352 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20613 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20613 a!3186))))))

(declare-fun res!516354 () Bool)

(assert (=> start!66246 (=> (not res!516354) (not e!425237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66246 (= res!516354 (validMask!0 mask!3328))))

(assert (=> start!66246 e!425237))

(assert (=> start!66246 true))

(declare-fun array_inv!16075 (array!42168) Bool)

(assert (=> start!66246 (array_inv!16075 a!3186)))

(declare-fun b!763257 () Bool)

(declare-fun res!516362 () Bool)

(assert (=> b!763257 (=> (not res!516362) (not e!425237))))

(declare-fun arrayContainsKey!0 (array!42168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763257 (= res!516362 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763258 () Bool)

(assert (=> b!763258 (= e!425236 e!425240)))

(declare-fun res!516353 () Bool)

(assert (=> b!763258 (=> (not res!516353) (not e!425240))))

(declare-fun lt!339577 () SeekEntryResult!7789)

(assert (=> b!763258 (= res!516353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20192 a!3186) j!159) mask!3328) (select (arr!20192 a!3186) j!159) a!3186 mask!3328) lt!339577))))

(assert (=> b!763258 (= lt!339577 (Intermediate!7789 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763259 () Bool)

(declare-fun res!516355 () Bool)

(assert (=> b!763259 (=> (not res!516355) (not e!425240))))

(assert (=> b!763259 (= res!516355 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20192 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763260 () Bool)

(declare-fun res!516360 () Bool)

(assert (=> b!763260 (=> (not res!516360) (not e!425236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42168 (_ BitVec 32)) Bool)

(assert (=> b!763260 (= res!516360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763261 () Bool)

(assert (=> b!763261 (= e!425238 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20192 a!3186) j!159) a!3186 mask!3328) lt!339577))))

(assert (= (and start!66246 res!516354) b!763255))

(assert (= (and b!763255 res!516358) b!763254))

(assert (= (and b!763254 res!516351) b!763251))

(assert (= (and b!763251 res!516356) b!763257))

(assert (= (and b!763257 res!516362) b!763253))

(assert (= (and b!763253 res!516359) b!763260))

(assert (= (and b!763260 res!516360) b!763252))

(assert (= (and b!763252 res!516357) b!763256))

(assert (= (and b!763256 res!516352) b!763258))

(assert (= (and b!763258 res!516353) b!763259))

(assert (= (and b!763259 res!516355) b!763248))

(assert (= (and b!763248 c!83835) b!763261))

(assert (= (and b!763248 (not c!83835)) b!763250))

(assert (= (and b!763248 res!516361) b!763249))

(declare-fun m!709213 () Bool)

(assert (=> b!763252 m!709213))

(declare-fun m!709215 () Bool)

(assert (=> b!763250 m!709215))

(assert (=> b!763250 m!709215))

(declare-fun m!709217 () Bool)

(assert (=> b!763250 m!709217))

(declare-fun m!709219 () Bool)

(assert (=> b!763259 m!709219))

(assert (=> b!763258 m!709215))

(assert (=> b!763258 m!709215))

(declare-fun m!709221 () Bool)

(assert (=> b!763258 m!709221))

(assert (=> b!763258 m!709221))

(assert (=> b!763258 m!709215))

(declare-fun m!709223 () Bool)

(assert (=> b!763258 m!709223))

(assert (=> b!763254 m!709215))

(assert (=> b!763254 m!709215))

(declare-fun m!709225 () Bool)

(assert (=> b!763254 m!709225))

(assert (=> b!763261 m!709215))

(assert (=> b!763261 m!709215))

(declare-fun m!709227 () Bool)

(assert (=> b!763261 m!709227))

(declare-fun m!709229 () Bool)

(assert (=> b!763257 m!709229))

(declare-fun m!709231 () Bool)

(assert (=> start!66246 m!709231))

(declare-fun m!709233 () Bool)

(assert (=> start!66246 m!709233))

(declare-fun m!709235 () Bool)

(assert (=> b!763253 m!709235))

(declare-fun m!709237 () Bool)

(assert (=> b!763251 m!709237))

(declare-fun m!709239 () Bool)

(assert (=> b!763249 m!709239))

(declare-fun m!709241 () Bool)

(assert (=> b!763249 m!709241))

(declare-fun m!709243 () Bool)

(assert (=> b!763249 m!709243))

(declare-fun m!709245 () Bool)

(assert (=> b!763249 m!709245))

(assert (=> b!763249 m!709239))

(declare-fun m!709247 () Bool)

(assert (=> b!763249 m!709247))

(declare-fun m!709249 () Bool)

(assert (=> b!763260 m!709249))

(check-sat (not b!763257) (not start!66246) (not b!763261) (not b!763254) (not b!763260) (not b!763251) (not b!763249) (not b!763253) (not b!763252) (not b!763258) (not b!763250))
(check-sat)
