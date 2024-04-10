; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45198 () Bool)

(assert start!45198)

(declare-fun b!496090 () Bool)

(declare-fun e!290967 () Bool)

(declare-fun e!290963 () Bool)

(assert (=> b!496090 (= e!290967 (not e!290963))))

(declare-fun res!298483 () Bool)

(assert (=> b!496090 (=> res!298483 e!290963)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!224584 () (_ BitVec 32))

(declare-datatypes ((array!32086 0))(
  ( (array!32087 (arr!15426 (Array (_ BitVec 32) (_ BitVec 64))) (size!15790 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32086)

(declare-datatypes ((SeekEntryResult!3893 0))(
  ( (MissingZero!3893 (index!17751 (_ BitVec 32))) (Found!3893 (index!17752 (_ BitVec 32))) (Intermediate!3893 (undefined!4705 Bool) (index!17753 (_ BitVec 32)) (x!46817 (_ BitVec 32))) (Undefined!3893) (MissingVacant!3893 (index!17754 (_ BitVec 32))) )
))
(declare-fun lt!224586 () SeekEntryResult!3893)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32086 (_ BitVec 32)) SeekEntryResult!3893)

(assert (=> b!496090 (= res!298483 (= lt!224586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224584 (select (store (arr!15426 a!3235) i!1204 k!2280) j!176) (array!32087 (store (arr!15426 a!3235) i!1204 k!2280) (size!15790 a!3235)) mask!3524)))))

(declare-fun lt!224585 () (_ BitVec 32))

(assert (=> b!496090 (= lt!224586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224585 (select (arr!15426 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496090 (= lt!224584 (toIndex!0 (select (store (arr!15426 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496090 (= lt!224585 (toIndex!0 (select (arr!15426 a!3235) j!176) mask!3524))))

(declare-fun e!290966 () Bool)

(assert (=> b!496090 e!290966))

(declare-fun res!298480 () Bool)

(assert (=> b!496090 (=> (not res!298480) (not e!290966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32086 (_ BitVec 32)) Bool)

(assert (=> b!496090 (= res!298480 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14732 0))(
  ( (Unit!14733) )
))
(declare-fun lt!224587 () Unit!14732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14732)

(assert (=> b!496090 (= lt!224587 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496091 () Bool)

(declare-fun e!290964 () Bool)

(assert (=> b!496091 (= e!290964 e!290967)))

(declare-fun res!298479 () Bool)

(assert (=> b!496091 (=> (not res!298479) (not e!290967))))

(declare-fun lt!224583 () SeekEntryResult!3893)

(assert (=> b!496091 (= res!298479 (or (= lt!224583 (MissingZero!3893 i!1204)) (= lt!224583 (MissingVacant!3893 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32086 (_ BitVec 32)) SeekEntryResult!3893)

(assert (=> b!496091 (= lt!224583 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496092 () Bool)

(declare-fun res!298487 () Bool)

(assert (=> b!496092 (=> (not res!298487) (not e!290967))))

(assert (=> b!496092 (= res!298487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496093 () Bool)

(declare-fun res!298486 () Bool)

(assert (=> b!496093 (=> (not res!298486) (not e!290964))))

(assert (=> b!496093 (= res!298486 (and (= (size!15790 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15790 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15790 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496094 () Bool)

(declare-fun res!298477 () Bool)

(assert (=> b!496094 (=> (not res!298477) (not e!290964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496094 (= res!298477 (validKeyInArray!0 (select (arr!15426 a!3235) j!176)))))

(declare-fun b!496095 () Bool)

(declare-fun res!298481 () Bool)

(assert (=> b!496095 (=> (not res!298481) (not e!290964))))

(assert (=> b!496095 (= res!298481 (validKeyInArray!0 k!2280))))

(declare-fun b!496096 () Bool)

(assert (=> b!496096 (= e!290966 (= (seekEntryOrOpen!0 (select (arr!15426 a!3235) j!176) a!3235 mask!3524) (Found!3893 j!176)))))

(declare-fun b!496097 () Bool)

(declare-fun res!298485 () Bool)

(assert (=> b!496097 (=> res!298485 e!290963)))

(assert (=> b!496097 (= res!298485 (or (undefined!4705 lt!224586) (not (is-Intermediate!3893 lt!224586))))))

(declare-fun b!496099 () Bool)

(declare-fun res!298482 () Bool)

(assert (=> b!496099 (=> (not res!298482) (not e!290964))))

(declare-fun arrayContainsKey!0 (array!32086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496099 (= res!298482 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496100 () Bool)

(assert (=> b!496100 (= e!290963 true)))

(assert (=> b!496100 (and (bvslt (x!46817 lt!224586) #b01111111111111111111111111111110) (or (= (select (arr!15426 a!3235) (index!17753 lt!224586)) (select (arr!15426 a!3235) j!176)) (= (select (arr!15426 a!3235) (index!17753 lt!224586)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15426 a!3235) (index!17753 lt!224586)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!298478 () Bool)

(assert (=> start!45198 (=> (not res!298478) (not e!290964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45198 (= res!298478 (validMask!0 mask!3524))))

(assert (=> start!45198 e!290964))

(assert (=> start!45198 true))

(declare-fun array_inv!11222 (array!32086) Bool)

(assert (=> start!45198 (array_inv!11222 a!3235)))

(declare-fun b!496098 () Bool)

(declare-fun res!298484 () Bool)

(assert (=> b!496098 (=> (not res!298484) (not e!290967))))

(declare-datatypes ((List!9584 0))(
  ( (Nil!9581) (Cons!9580 (h!10451 (_ BitVec 64)) (t!15812 List!9584)) )
))
(declare-fun arrayNoDuplicates!0 (array!32086 (_ BitVec 32) List!9584) Bool)

(assert (=> b!496098 (= res!298484 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9581))))

(assert (= (and start!45198 res!298478) b!496093))

(assert (= (and b!496093 res!298486) b!496094))

(assert (= (and b!496094 res!298477) b!496095))

(assert (= (and b!496095 res!298481) b!496099))

(assert (= (and b!496099 res!298482) b!496091))

(assert (= (and b!496091 res!298479) b!496092))

(assert (= (and b!496092 res!298487) b!496098))

(assert (= (and b!496098 res!298484) b!496090))

(assert (= (and b!496090 res!298480) b!496096))

(assert (= (and b!496090 (not res!298483)) b!496097))

(assert (= (and b!496097 (not res!298485)) b!496100))

(declare-fun m!477273 () Bool)

(assert (=> b!496090 m!477273))

(declare-fun m!477275 () Bool)

(assert (=> b!496090 m!477275))

(declare-fun m!477277 () Bool)

(assert (=> b!496090 m!477277))

(declare-fun m!477279 () Bool)

(assert (=> b!496090 m!477279))

(declare-fun m!477281 () Bool)

(assert (=> b!496090 m!477281))

(assert (=> b!496090 m!477279))

(declare-fun m!477283 () Bool)

(assert (=> b!496090 m!477283))

(assert (=> b!496090 m!477277))

(declare-fun m!477285 () Bool)

(assert (=> b!496090 m!477285))

(assert (=> b!496090 m!477279))

(declare-fun m!477287 () Bool)

(assert (=> b!496090 m!477287))

(assert (=> b!496090 m!477277))

(declare-fun m!477289 () Bool)

(assert (=> b!496090 m!477289))

(declare-fun m!477291 () Bool)

(assert (=> b!496092 m!477291))

(declare-fun m!477293 () Bool)

(assert (=> b!496098 m!477293))

(declare-fun m!477295 () Bool)

(assert (=> b!496091 m!477295))

(declare-fun m!477297 () Bool)

(assert (=> b!496095 m!477297))

(assert (=> b!496096 m!477279))

(assert (=> b!496096 m!477279))

(declare-fun m!477299 () Bool)

(assert (=> b!496096 m!477299))

(declare-fun m!477301 () Bool)

(assert (=> b!496099 m!477301))

(assert (=> b!496094 m!477279))

(assert (=> b!496094 m!477279))

(declare-fun m!477303 () Bool)

(assert (=> b!496094 m!477303))

(declare-fun m!477305 () Bool)

(assert (=> b!496100 m!477305))

(assert (=> b!496100 m!477279))

(declare-fun m!477307 () Bool)

(assert (=> start!45198 m!477307))

(declare-fun m!477309 () Bool)

(assert (=> start!45198 m!477309))

(push 1)

