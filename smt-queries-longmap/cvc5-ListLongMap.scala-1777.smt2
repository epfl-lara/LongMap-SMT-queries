; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32362 () Bool)

(assert start!32362)

(declare-fun b!322292 () Bool)

(declare-fun e!199504 () Bool)

(declare-fun e!199507 () Bool)

(assert (=> b!322292 (= e!199504 e!199507)))

(declare-fun res!176267 () Bool)

(assert (=> b!322292 (=> (not res!176267) (not e!199507))))

(declare-datatypes ((array!16501 0))(
  ( (array!16502 (arr!7808 (Array (_ BitVec 32) (_ BitVec 64))) (size!8160 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16501)

(declare-datatypes ((SeekEntryResult!2939 0))(
  ( (MissingZero!2939 (index!13932 (_ BitVec 32))) (Found!2939 (index!13933 (_ BitVec 32))) (Intermediate!2939 (undefined!3751 Bool) (index!13934 (_ BitVec 32)) (x!32199 (_ BitVec 32))) (Undefined!2939) (MissingVacant!2939 (index!13935 (_ BitVec 32))) )
))
(declare-fun lt!156422 () SeekEntryResult!2939)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16501 (_ BitVec 32)) SeekEntryResult!2939)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322292 (= res!176267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156422))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322292 (= lt!156422 (Intermediate!2939 false resIndex!58 resX!58))))

(declare-fun b!322293 () Bool)

(assert (=> b!322293 false))

(declare-datatypes ((Unit!9836 0))(
  ( (Unit!9837) )
))
(declare-fun lt!156421 () Unit!9836)

(declare-fun e!199503 () Unit!9836)

(assert (=> b!322293 (= lt!156421 e!199503)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun c!50644 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322293 (= c!50644 (is-Intermediate!2939 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199502 () Unit!9836)

(declare-fun Unit!9838 () Unit!9836)

(assert (=> b!322293 (= e!199502 Unit!9838)))

(declare-fun res!176261 () Bool)

(assert (=> start!32362 (=> (not res!176261) (not e!199504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32362 (= res!176261 (validMask!0 mask!3777))))

(assert (=> start!32362 e!199504))

(declare-fun array_inv!5771 (array!16501) Bool)

(assert (=> start!32362 (array_inv!5771 a!3305)))

(assert (=> start!32362 true))

(declare-fun b!322294 () Bool)

(declare-fun Unit!9839 () Unit!9836)

(assert (=> b!322294 (= e!199503 Unit!9839)))

(declare-fun b!322295 () Bool)

(declare-fun res!176266 () Bool)

(assert (=> b!322295 (=> (not res!176266) (not e!199504))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322295 (= res!176266 (and (= (size!8160 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8160 a!3305))))))

(declare-fun b!322296 () Bool)

(declare-fun e!199506 () Unit!9836)

(assert (=> b!322296 (= e!199506 e!199502)))

(declare-fun c!50646 () Bool)

(assert (=> b!322296 (= c!50646 (or (= (select (arr!7808 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7808 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322297 () Bool)

(declare-fun res!176265 () Bool)

(assert (=> b!322297 (=> (not res!176265) (not e!199504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16501 (_ BitVec 32)) Bool)

(assert (=> b!322297 (= res!176265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322298 () Bool)

(declare-fun Unit!9840 () Unit!9836)

(assert (=> b!322298 (= e!199503 Unit!9840)))

(assert (=> b!322298 false))

(declare-fun b!322299 () Bool)

(assert (=> b!322299 false))

(declare-fun Unit!9841 () Unit!9836)

(assert (=> b!322299 (= e!199502 Unit!9841)))

(declare-fun b!322300 () Bool)

(declare-fun res!176262 () Bool)

(assert (=> b!322300 (=> (not res!176262) (not e!199507))))

(assert (=> b!322300 (= res!176262 (and (= (select (arr!7808 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8160 a!3305))))))

(declare-fun b!322301 () Bool)

(declare-fun res!176268 () Bool)

(assert (=> b!322301 (=> (not res!176268) (not e!199504))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16501 (_ BitVec 32)) SeekEntryResult!2939)

(assert (=> b!322301 (= res!176268 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2939 i!1250)))))

(declare-fun b!322302 () Bool)

(declare-fun res!176263 () Bool)

(assert (=> b!322302 (=> (not res!176263) (not e!199507))))

(assert (=> b!322302 (= res!176263 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7808 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322303 () Bool)

(assert (=> b!322303 (= e!199507 (not true))))

(assert (=> b!322303 (= index!1840 resIndex!58)))

(declare-fun lt!156423 () Unit!9836)

(assert (=> b!322303 (= lt!156423 e!199506)))

(declare-fun c!50645 () Bool)

(assert (=> b!322303 (= c!50645 (not (= resIndex!58 index!1840)))))

(declare-fun b!322304 () Bool)

(declare-fun res!176260 () Bool)

(assert (=> b!322304 (=> (not res!176260) (not e!199504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322304 (= res!176260 (validKeyInArray!0 k!2497))))

(declare-fun b!322305 () Bool)

(declare-fun Unit!9842 () Unit!9836)

(assert (=> b!322305 (= e!199506 Unit!9842)))

(declare-fun b!322306 () Bool)

(declare-fun res!176259 () Bool)

(assert (=> b!322306 (=> (not res!176259) (not e!199507))))

(assert (=> b!322306 (= res!176259 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156422))))

(declare-fun b!322307 () Bool)

(declare-fun res!176264 () Bool)

(assert (=> b!322307 (=> (not res!176264) (not e!199504))))

(declare-fun arrayContainsKey!0 (array!16501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322307 (= res!176264 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32362 res!176261) b!322295))

(assert (= (and b!322295 res!176266) b!322304))

(assert (= (and b!322304 res!176260) b!322307))

(assert (= (and b!322307 res!176264) b!322301))

(assert (= (and b!322301 res!176268) b!322297))

(assert (= (and b!322297 res!176265) b!322292))

(assert (= (and b!322292 res!176267) b!322300))

(assert (= (and b!322300 res!176262) b!322306))

(assert (= (and b!322306 res!176259) b!322302))

(assert (= (and b!322302 res!176263) b!322303))

(assert (= (and b!322303 c!50645) b!322296))

(assert (= (and b!322303 (not c!50645)) b!322305))

(assert (= (and b!322296 c!50646) b!322299))

(assert (= (and b!322296 (not c!50646)) b!322293))

(assert (= (and b!322293 c!50644) b!322294))

(assert (= (and b!322293 (not c!50644)) b!322298))

(declare-fun m!330197 () Bool)

(assert (=> b!322302 m!330197))

(declare-fun m!330199 () Bool)

(assert (=> b!322304 m!330199))

(declare-fun m!330201 () Bool)

(assert (=> b!322306 m!330201))

(declare-fun m!330203 () Bool)

(assert (=> b!322293 m!330203))

(assert (=> b!322293 m!330203))

(declare-fun m!330205 () Bool)

(assert (=> b!322293 m!330205))

(declare-fun m!330207 () Bool)

(assert (=> b!322307 m!330207))

(declare-fun m!330209 () Bool)

(assert (=> b!322300 m!330209))

(declare-fun m!330211 () Bool)

(assert (=> start!32362 m!330211))

(declare-fun m!330213 () Bool)

(assert (=> start!32362 m!330213))

(declare-fun m!330215 () Bool)

(assert (=> b!322301 m!330215))

(declare-fun m!330217 () Bool)

(assert (=> b!322292 m!330217))

(assert (=> b!322292 m!330217))

(declare-fun m!330219 () Bool)

(assert (=> b!322292 m!330219))

(assert (=> b!322296 m!330197))

(declare-fun m!330221 () Bool)

(assert (=> b!322297 m!330221))

(push 1)

