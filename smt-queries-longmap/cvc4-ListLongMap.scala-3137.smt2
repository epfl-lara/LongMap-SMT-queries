; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44158 () Bool)

(assert start!44158)

(declare-fun b!486295 () Bool)

(declare-fun res!289825 () Bool)

(declare-fun e!286228 () Bool)

(assert (=> b!486295 (=> (not res!289825) (not e!286228))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31493 0))(
  ( (array!31494 (arr!15143 (Array (_ BitVec 32) (_ BitVec 64))) (size!15507 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31493)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486295 (= res!289825 (and (= (size!15507 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15507 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15507 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486296 () Bool)

(declare-fun res!289830 () Bool)

(assert (=> b!486296 (=> (not res!289830) (not e!286228))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486296 (= res!289830 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486297 () Bool)

(declare-fun res!289826 () Bool)

(assert (=> b!486297 (=> (not res!289826) (not e!286228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486297 (= res!289826 (validKeyInArray!0 k!2280))))

(declare-fun b!486298 () Bool)

(declare-fun e!286230 () Bool)

(declare-datatypes ((List!9301 0))(
  ( (Nil!9298) (Cons!9297 (h!10153 (_ BitVec 64)) (t!15529 List!9301)) )
))
(declare-fun noDuplicate!209 (List!9301) Bool)

(assert (=> b!486298 (= e!286230 (not (noDuplicate!209 Nil!9298)))))

(declare-fun b!486299 () Bool)

(declare-fun res!289828 () Bool)

(assert (=> b!486299 (=> (not res!289828) (not e!286228))))

(assert (=> b!486299 (= res!289828 (validKeyInArray!0 (select (arr!15143 a!3235) j!176)))))

(declare-fun b!486300 () Bool)

(assert (=> b!486300 (= e!286228 e!286230)))

(declare-fun res!289832 () Bool)

(assert (=> b!486300 (=> (not res!289832) (not e!286230))))

(declare-datatypes ((SeekEntryResult!3610 0))(
  ( (MissingZero!3610 (index!16619 (_ BitVec 32))) (Found!3610 (index!16620 (_ BitVec 32))) (Intermediate!3610 (undefined!4422 Bool) (index!16621 (_ BitVec 32)) (x!45750 (_ BitVec 32))) (Undefined!3610) (MissingVacant!3610 (index!16622 (_ BitVec 32))) )
))
(declare-fun lt!219691 () SeekEntryResult!3610)

(assert (=> b!486300 (= res!289832 (or (= lt!219691 (MissingZero!3610 i!1204)) (= lt!219691 (MissingVacant!3610 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31493 (_ BitVec 32)) SeekEntryResult!3610)

(assert (=> b!486300 (= lt!219691 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289829 () Bool)

(assert (=> start!44158 (=> (not res!289829) (not e!286228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44158 (= res!289829 (validMask!0 mask!3524))))

(assert (=> start!44158 e!286228))

(assert (=> start!44158 true))

(declare-fun array_inv!10939 (array!31493) Bool)

(assert (=> start!44158 (array_inv!10939 a!3235)))

(declare-fun b!486301 () Bool)

(declare-fun res!289831 () Bool)

(assert (=> b!486301 (=> (not res!289831) (not e!286230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31493 (_ BitVec 32)) Bool)

(assert (=> b!486301 (= res!289831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486302 () Bool)

(declare-fun res!289827 () Bool)

(assert (=> b!486302 (=> (not res!289827) (not e!286230))))

(assert (=> b!486302 (= res!289827 (and (bvsle #b00000000000000000000000000000000 (size!15507 a!3235)) (bvslt (size!15507 a!3235) #b01111111111111111111111111111111)))))

(assert (= (and start!44158 res!289829) b!486295))

(assert (= (and b!486295 res!289825) b!486299))

(assert (= (and b!486299 res!289828) b!486297))

(assert (= (and b!486297 res!289826) b!486296))

(assert (= (and b!486296 res!289830) b!486300))

(assert (= (and b!486300 res!289832) b!486301))

(assert (= (and b!486301 res!289831) b!486302))

(assert (= (and b!486302 res!289827) b!486298))

(declare-fun m!466281 () Bool)

(assert (=> b!486297 m!466281))

(declare-fun m!466283 () Bool)

(assert (=> start!44158 m!466283))

(declare-fun m!466285 () Bool)

(assert (=> start!44158 m!466285))

(declare-fun m!466287 () Bool)

(assert (=> b!486301 m!466287))

(declare-fun m!466289 () Bool)

(assert (=> b!486298 m!466289))

(declare-fun m!466291 () Bool)

(assert (=> b!486296 m!466291))

(declare-fun m!466293 () Bool)

(assert (=> b!486300 m!466293))

(declare-fun m!466295 () Bool)

(assert (=> b!486299 m!466295))

(assert (=> b!486299 m!466295))

(declare-fun m!466297 () Bool)

(assert (=> b!486299 m!466297))

(push 1)

(assert (not b!486300))

(assert (not b!486301))

(assert (not b!486297))

(assert (not b!486296))

(assert (not b!486299))

(assert (not start!44158))

(assert (not b!486298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77507 () Bool)

(declare-fun res!289843 () Bool)

(declare-fun e!286244 () Bool)

(assert (=> d!77507 (=> res!289843 e!286244)))

(assert (=> d!77507 (= res!289843 (= (select (arr!15143 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77507 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!286244)))

(declare-fun b!486319 () Bool)

(declare-fun e!286245 () Bool)

(assert (=> b!486319 (= e!286244 e!286245)))

(declare-fun res!289844 () Bool)

(assert (=> b!486319 (=> (not res!289844) (not e!286245))))

(assert (=> b!486319 (= res!289844 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15507 a!3235)))))

(declare-fun b!486320 () Bool)

(assert (=> b!486320 (= e!286245 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77507 (not res!289843)) b!486319))

(assert (= (and b!486319 res!289844) b!486320))

(declare-fun m!466311 () Bool)

(assert (=> d!77507 m!466311))

(declare-fun m!466313 () Bool)

(assert (=> b!486320 m!466313))

(assert (=> b!486296 d!77507))

(declare-fun b!486341 () Bool)

(declare-fun e!286259 () Bool)

(declare-fun call!31271 () Bool)

(assert (=> b!486341 (= e!286259 call!31271)))

(declare-fun b!486342 () Bool)

(declare-fun e!286258 () Bool)

(assert (=> b!486342 (= e!286258 call!31271)))

(declare-fun b!486343 () Bool)

(declare-fun e!286260 () Bool)

(assert (=> b!486343 (= e!286260 e!286259)))

(declare-fun c!58514 () Bool)

(assert (=> b!486343 (= c!58514 (validKeyInArray!0 (select (arr!15143 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31268 () Bool)

(assert (=> bm!31268 (= call!31271 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!486344 () Bool)

(assert (=> b!486344 (= e!286259 e!286258)))

(declare-fun lt!219714 () (_ BitVec 64))

(assert (=> b!486344 (= lt!219714 (select (arr!15143 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14194 0))(
  ( (Unit!14195) )
))
(declare-fun lt!219713 () Unit!14194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31493 (_ BitVec 64) (_ BitVec 32)) Unit!14194)

(assert (=> b!486344 (= lt!219713 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219714 #b00000000000000000000000000000000))))

(assert (=> b!486344 (arrayContainsKey!0 a!3235 lt!219714 #b00000000000000000000000000000000)))

(declare-fun lt!219715 () Unit!14194)

(assert (=> b!486344 (= lt!219715 lt!219713)))

(declare-fun res!289850 () Bool)

(assert (=> b!486344 (= res!289850 (= (seekEntryOrOpen!0 (select (arr!15143 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3610 #b00000000000000000000000000000000)))))

(assert (=> b!486344 (=> (not res!289850) (not e!286258))))

(declare-fun d!77511 () Bool)

(declare-fun res!289849 () Bool)

(assert (=> d!77511 (=> res!289849 e!286260)))

(assert (=> d!77511 (= res!289849 (bvsge #b00000000000000000000000000000000 (size!15507 a!3235)))))

(assert (=> d!77511 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286260)))

(assert (= (and d!77511 (not res!289849)) b!486343))

(assert (= (and b!486343 c!58514) b!486344))

(assert (= (and b!486343 (not c!58514)) b!486341))

(assert (= (and b!486344 res!289850) b!486342))

(assert (= (or b!486342 b!486341) bm!31268))

(assert (=> b!486343 m!466311))

(assert (=> b!486343 m!466311))

(declare-fun m!466315 () Bool)

(assert (=> b!486343 m!466315))

(declare-fun m!466317 () Bool)

(assert (=> bm!31268 m!466317))

(assert (=> b!486344 m!466311))

(declare-fun m!466319 () Bool)

(assert (=> b!486344 m!466319))

(declare-fun m!466321 () Bool)

(assert (=> b!486344 m!466321))

(assert (=> b!486344 m!466311))

(declare-fun m!466323 () Bool)

(assert (=> b!486344 m!466323))

(assert (=> b!486301 d!77511))

(declare-fun d!77513 () Bool)

(assert (=> d!77513 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486297 d!77513))

(declare-fun d!77515 () Bool)

(declare-fun res!289855 () Bool)

(declare-fun e!286268 () Bool)

(assert (=> d!77515 (=> res!289855 e!286268)))

(assert (=> d!77515 (= res!289855 (is-Nil!9298 Nil!9298))))

(assert (=> d!77515 (= (noDuplicate!209 Nil!9298) e!286268)))

(declare-fun b!486355 () Bool)

(declare-fun e!286269 () Bool)

(assert (=> b!486355 (= e!286268 e!286269)))

(declare-fun res!289856 () Bool)

(assert (=> b!486355 (=> (not res!289856) (not e!286269))))

(declare-fun contains!2695 (List!9301 (_ BitVec 64)) Bool)

(assert (=> b!486355 (= res!289856 (not (contains!2695 (t!15529 Nil!9298) (h!10153 Nil!9298))))))

(declare-fun b!486356 () Bool)

(assert (=> b!486356 (= e!286269 (noDuplicate!209 (t!15529 Nil!9298)))))

(assert (= (and d!77515 (not res!289855)) b!486355))

(assert (= (and b!486355 res!289856) b!486356))

(declare-fun m!466339 () Bool)

(assert (=> b!486355 m!466339))

(declare-fun m!466341 () Bool)

(assert (=> b!486356 m!466341))

(assert (=> b!486298 d!77515))

(declare-fun d!77519 () Bool)

(assert (=> d!77519 (= (validKeyInArray!0 (select (arr!15143 a!3235) j!176)) (and (not (= (select (arr!15143 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15143 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486299 d!77519))

(declare-fun b!486399 () Bool)

(declare-fun lt!219735 () SeekEntryResult!3610)

(declare-fun e!286297 () SeekEntryResult!3610)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31493 (_ BitVec 32)) SeekEntryResult!3610)

(assert (=> b!486399 (= e!286297 (seekKeyOrZeroReturnVacant!0 (x!45750 lt!219735) (index!16621 lt!219735) (index!16621 lt!219735) k!2280 a!3235 mask!3524))))

(declare-fun b!486400 () Bool)

(declare-fun e!286299 () SeekEntryResult!3610)

(assert (=> b!486400 (= e!286299 (Found!3610 (index!16621 lt!219735)))))

(declare-fun b!486401 () Bool)

(declare-fun e!286298 () SeekEntryResult!3610)

(assert (=> b!486401 (= e!286298 e!286299)))

(declare-fun lt!219734 () (_ BitVec 64))

(assert (=> b!486401 (= lt!219734 (select (arr!15143 a!3235) (index!16621 lt!219735)))))

(declare-fun c!58534 () Bool)

(assert (=> b!486401 (= c!58534 (= lt!219734 k!2280))))

(declare-fun b!486402 () Bool)

(assert (=> b!486402 (= e!286298 Undefined!3610)))

(declare-fun d!77521 () Bool)

(declare-fun lt!219736 () SeekEntryResult!3610)

