; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46538 () Bool)

(assert start!46538)

(declare-fun b!514242 () Bool)

(declare-fun res!314227 () Bool)

(declare-fun e!300284 () Bool)

(assert (=> b!514242 (=> res!314227 e!300284)))

(declare-datatypes ((SeekEntryResult!4276 0))(
  ( (MissingZero!4276 (index!19292 (_ BitVec 32))) (Found!4276 (index!19293 (_ BitVec 32))) (Intermediate!4276 (undefined!5088 Bool) (index!19294 (_ BitVec 32)) (x!48400 (_ BitVec 32))) (Undefined!4276) (MissingVacant!4276 (index!19295 (_ BitVec 32))) )
))
(declare-fun lt!235465 () SeekEntryResult!4276)

(get-info :version)

(assert (=> b!514242 (= res!314227 (or (undefined!5088 lt!235465) (not ((_ is Intermediate!4276) lt!235465))))))

(declare-fun b!514243 () Bool)

(declare-fun e!300288 () Bool)

(assert (=> b!514243 (= e!300288 (not e!300284))))

(declare-fun res!314229 () Bool)

(assert (=> b!514243 (=> res!314229 e!300284)))

(declare-fun lt!235467 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32965 0))(
  ( (array!32966 (arr!15853 (Array (_ BitVec 32) (_ BitVec 64))) (size!16217 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32965)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32965 (_ BitVec 32)) SeekEntryResult!4276)

(assert (=> b!514243 (= res!314229 (= lt!235465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235467 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)) mask!3524)))))

(declare-fun lt!235464 () (_ BitVec 32))

(assert (=> b!514243 (= lt!235465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235464 (select (arr!15853 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514243 (= lt!235467 (toIndex!0 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!514243 (= lt!235464 (toIndex!0 (select (arr!15853 a!3235) j!176) mask!3524))))

(declare-fun e!300285 () Bool)

(assert (=> b!514243 e!300285))

(declare-fun res!314235 () Bool)

(assert (=> b!514243 (=> (not res!314235) (not e!300285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32965 (_ BitVec 32)) Bool)

(assert (=> b!514243 (= res!314235 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15871 0))(
  ( (Unit!15872) )
))
(declare-fun lt!235466 () Unit!15871)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15871)

(assert (=> b!514243 (= lt!235466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!314233 () Bool)

(declare-fun e!300287 () Bool)

(assert (=> start!46538 (=> (not res!314233) (not e!300287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46538 (= res!314233 (validMask!0 mask!3524))))

(assert (=> start!46538 e!300287))

(assert (=> start!46538 true))

(declare-fun array_inv!11712 (array!32965) Bool)

(assert (=> start!46538 (array_inv!11712 a!3235)))

(declare-fun b!514244 () Bool)

(declare-fun res!314228 () Bool)

(assert (=> b!514244 (=> (not res!314228) (not e!300287))))

(assert (=> b!514244 (= res!314228 (and (= (size!16217 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16217 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16217 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514245 () Bool)

(assert (=> b!514245 (= e!300287 e!300288)))

(declare-fun res!314234 () Bool)

(assert (=> b!514245 (=> (not res!314234) (not e!300288))))

(declare-fun lt!235468 () SeekEntryResult!4276)

(assert (=> b!514245 (= res!314234 (or (= lt!235468 (MissingZero!4276 i!1204)) (= lt!235468 (MissingVacant!4276 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32965 (_ BitVec 32)) SeekEntryResult!4276)

(assert (=> b!514245 (= lt!235468 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!514246 () Bool)

(declare-fun res!314226 () Bool)

(assert (=> b!514246 (=> (not res!314226) (not e!300287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514246 (= res!314226 (validKeyInArray!0 (select (arr!15853 a!3235) j!176)))))

(declare-fun b!514247 () Bool)

(assert (=> b!514247 (= e!300284 (or (= (select (arr!15853 a!3235) (index!19294 lt!235465)) (select (arr!15853 a!3235) j!176)) (= (select (arr!15853 a!3235) (index!19294 lt!235465)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15853 a!3235) (index!19294 lt!235465)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!514247 (bvslt (x!48400 lt!235465) #b01111111111111111111111111111110)))

(declare-fun b!514248 () Bool)

(declare-fun res!314230 () Bool)

(assert (=> b!514248 (=> (not res!314230) (not e!300287))))

(assert (=> b!514248 (= res!314230 (validKeyInArray!0 k0!2280))))

(declare-fun b!514249 () Bool)

(assert (=> b!514249 (= e!300285 (= (seekEntryOrOpen!0 (select (arr!15853 a!3235) j!176) a!3235 mask!3524) (Found!4276 j!176)))))

(declare-fun b!514250 () Bool)

(declare-fun res!314236 () Bool)

(assert (=> b!514250 (=> (not res!314236) (not e!300288))))

(declare-datatypes ((List!9918 0))(
  ( (Nil!9915) (Cons!9914 (h!10806 (_ BitVec 64)) (t!16138 List!9918)) )
))
(declare-fun arrayNoDuplicates!0 (array!32965 (_ BitVec 32) List!9918) Bool)

(assert (=> b!514250 (= res!314236 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9915))))

(declare-fun b!514251 () Bool)

(declare-fun res!314231 () Bool)

(assert (=> b!514251 (=> (not res!314231) (not e!300287))))

(declare-fun arrayContainsKey!0 (array!32965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514251 (= res!314231 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514252 () Bool)

(declare-fun res!314232 () Bool)

(assert (=> b!514252 (=> (not res!314232) (not e!300288))))

(assert (=> b!514252 (= res!314232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46538 res!314233) b!514244))

(assert (= (and b!514244 res!314228) b!514246))

(assert (= (and b!514246 res!314226) b!514248))

(assert (= (and b!514248 res!314230) b!514251))

(assert (= (and b!514251 res!314231) b!514245))

(assert (= (and b!514245 res!314234) b!514252))

(assert (= (and b!514252 res!314232) b!514250))

(assert (= (and b!514250 res!314236) b!514243))

(assert (= (and b!514243 res!314235) b!514249))

(assert (= (and b!514243 (not res!314229)) b!514242))

(assert (= (and b!514242 (not res!314227)) b!514247))

(declare-fun m!495913 () Bool)

(assert (=> b!514245 m!495913))

(declare-fun m!495915 () Bool)

(assert (=> b!514252 m!495915))

(declare-fun m!495917 () Bool)

(assert (=> b!514250 m!495917))

(declare-fun m!495919 () Bool)

(assert (=> b!514248 m!495919))

(declare-fun m!495921 () Bool)

(assert (=> b!514243 m!495921))

(declare-fun m!495923 () Bool)

(assert (=> b!514243 m!495923))

(declare-fun m!495925 () Bool)

(assert (=> b!514243 m!495925))

(declare-fun m!495927 () Bool)

(assert (=> b!514243 m!495927))

(assert (=> b!514243 m!495921))

(declare-fun m!495929 () Bool)

(assert (=> b!514243 m!495929))

(declare-fun m!495931 () Bool)

(assert (=> b!514243 m!495931))

(assert (=> b!514243 m!495929))

(declare-fun m!495933 () Bool)

(assert (=> b!514243 m!495933))

(assert (=> b!514243 m!495929))

(declare-fun m!495935 () Bool)

(assert (=> b!514243 m!495935))

(assert (=> b!514243 m!495921))

(declare-fun m!495937 () Bool)

(assert (=> b!514243 m!495937))

(assert (=> b!514246 m!495929))

(assert (=> b!514246 m!495929))

(declare-fun m!495939 () Bool)

(assert (=> b!514246 m!495939))

(declare-fun m!495941 () Bool)

(assert (=> start!46538 m!495941))

(declare-fun m!495943 () Bool)

(assert (=> start!46538 m!495943))

(declare-fun m!495945 () Bool)

(assert (=> b!514251 m!495945))

(declare-fun m!495947 () Bool)

(assert (=> b!514247 m!495947))

(assert (=> b!514247 m!495929))

(assert (=> b!514249 m!495929))

(assert (=> b!514249 m!495929))

(declare-fun m!495949 () Bool)

(assert (=> b!514249 m!495949))

(check-sat (not b!514248) (not b!514246) (not b!514252) (not start!46538) (not b!514250) (not b!514245) (not b!514243) (not b!514249) (not b!514251))
(check-sat)
(get-model)

(declare-fun b!514331 () Bool)

(declare-fun c!60300 () Bool)

(declare-fun lt!235507 () (_ BitVec 64))

(assert (=> b!514331 (= c!60300 (= lt!235507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300327 () SeekEntryResult!4276)

(declare-fun e!300326 () SeekEntryResult!4276)

(assert (=> b!514331 (= e!300327 e!300326)))

(declare-fun b!514332 () Bool)

(declare-fun lt!235506 () SeekEntryResult!4276)

(assert (=> b!514332 (= e!300327 (Found!4276 (index!19294 lt!235506)))))

(declare-fun b!514333 () Bool)

(declare-fun e!300325 () SeekEntryResult!4276)

(assert (=> b!514333 (= e!300325 e!300327)))

(assert (=> b!514333 (= lt!235507 (select (arr!15853 a!3235) (index!19294 lt!235506)))))

(declare-fun c!60301 () Bool)

(assert (=> b!514333 (= c!60301 (= lt!235507 (select (arr!15853 a!3235) j!176)))))

(declare-fun d!79393 () Bool)

(declare-fun lt!235505 () SeekEntryResult!4276)

(assert (=> d!79393 (and (or ((_ is Undefined!4276) lt!235505) (not ((_ is Found!4276) lt!235505)) (and (bvsge (index!19293 lt!235505) #b00000000000000000000000000000000) (bvslt (index!19293 lt!235505) (size!16217 a!3235)))) (or ((_ is Undefined!4276) lt!235505) ((_ is Found!4276) lt!235505) (not ((_ is MissingZero!4276) lt!235505)) (and (bvsge (index!19292 lt!235505) #b00000000000000000000000000000000) (bvslt (index!19292 lt!235505) (size!16217 a!3235)))) (or ((_ is Undefined!4276) lt!235505) ((_ is Found!4276) lt!235505) ((_ is MissingZero!4276) lt!235505) (not ((_ is MissingVacant!4276) lt!235505)) (and (bvsge (index!19295 lt!235505) #b00000000000000000000000000000000) (bvslt (index!19295 lt!235505) (size!16217 a!3235)))) (or ((_ is Undefined!4276) lt!235505) (ite ((_ is Found!4276) lt!235505) (= (select (arr!15853 a!3235) (index!19293 lt!235505)) (select (arr!15853 a!3235) j!176)) (ite ((_ is MissingZero!4276) lt!235505) (= (select (arr!15853 a!3235) (index!19292 lt!235505)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4276) lt!235505) (= (select (arr!15853 a!3235) (index!19295 lt!235505)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79393 (= lt!235505 e!300325)))

(declare-fun c!60302 () Bool)

(assert (=> d!79393 (= c!60302 (and ((_ is Intermediate!4276) lt!235506) (undefined!5088 lt!235506)))))

(assert (=> d!79393 (= lt!235506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15853 a!3235) j!176) mask!3524) (select (arr!15853 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79393 (validMask!0 mask!3524)))

(assert (=> d!79393 (= (seekEntryOrOpen!0 (select (arr!15853 a!3235) j!176) a!3235 mask!3524) lt!235505)))

(declare-fun b!514334 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32965 (_ BitVec 32)) SeekEntryResult!4276)

(assert (=> b!514334 (= e!300326 (seekKeyOrZeroReturnVacant!0 (x!48400 lt!235506) (index!19294 lt!235506) (index!19294 lt!235506) (select (arr!15853 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514335 () Bool)

(assert (=> b!514335 (= e!300326 (MissingZero!4276 (index!19294 lt!235506)))))

(declare-fun b!514336 () Bool)

(assert (=> b!514336 (= e!300325 Undefined!4276)))

(assert (= (and d!79393 c!60302) b!514336))

(assert (= (and d!79393 (not c!60302)) b!514333))

(assert (= (and b!514333 c!60301) b!514332))

(assert (= (and b!514333 (not c!60301)) b!514331))

(assert (= (and b!514331 c!60300) b!514335))

(assert (= (and b!514331 (not c!60300)) b!514334))

(declare-fun m!496027 () Bool)

(assert (=> b!514333 m!496027))

(declare-fun m!496029 () Bool)

(assert (=> d!79393 m!496029))

(assert (=> d!79393 m!495941))

(declare-fun m!496031 () Bool)

(assert (=> d!79393 m!496031))

(assert (=> d!79393 m!495929))

(assert (=> d!79393 m!495931))

(assert (=> d!79393 m!495931))

(assert (=> d!79393 m!495929))

(declare-fun m!496033 () Bool)

(assert (=> d!79393 m!496033))

(declare-fun m!496035 () Bool)

(assert (=> d!79393 m!496035))

(assert (=> b!514334 m!495929))

(declare-fun m!496037 () Bool)

(assert (=> b!514334 m!496037))

(assert (=> b!514249 d!79393))

(declare-fun lt!235513 () SeekEntryResult!4276)

(declare-fun b!514361 () Bool)

(assert (=> b!514361 (and (bvsge (index!19294 lt!235513) #b00000000000000000000000000000000) (bvslt (index!19294 lt!235513) (size!16217 (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)))))))

(declare-fun res!314318 () Bool)

(assert (=> b!514361 (= res!314318 (= (select (arr!15853 (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235))) (index!19294 lt!235513)) (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!300347 () Bool)

(assert (=> b!514361 (=> res!314318 e!300347)))

(declare-fun e!300345 () Bool)

(assert (=> b!514361 (= e!300345 e!300347)))

(declare-fun b!514362 () Bool)

(declare-fun e!300346 () Bool)

(assert (=> b!514362 (= e!300346 e!300345)))

(declare-fun res!314317 () Bool)

(assert (=> b!514362 (= res!314317 (and ((_ is Intermediate!4276) lt!235513) (not (undefined!5088 lt!235513)) (bvslt (x!48400 lt!235513) #b01111111111111111111111111111110) (bvsge (x!48400 lt!235513) #b00000000000000000000000000000000) (bvsge (x!48400 lt!235513) #b00000000000000000000000000000000)))))

(assert (=> b!514362 (=> (not res!314317) (not e!300345))))

(declare-fun b!514363 () Bool)

(assert (=> b!514363 (and (bvsge (index!19294 lt!235513) #b00000000000000000000000000000000) (bvslt (index!19294 lt!235513) (size!16217 (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)))))))

(declare-fun res!314316 () Bool)

(assert (=> b!514363 (= res!314316 (= (select (arr!15853 (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235))) (index!19294 lt!235513)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514363 (=> res!314316 e!300347)))

(declare-fun b!514364 () Bool)

(assert (=> b!514364 (and (bvsge (index!19294 lt!235513) #b00000000000000000000000000000000) (bvslt (index!19294 lt!235513) (size!16217 (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)))))))

(assert (=> b!514364 (= e!300347 (= (select (arr!15853 (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235))) (index!19294 lt!235513)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514366 () Bool)

(declare-fun e!300348 () SeekEntryResult!4276)

(assert (=> b!514366 (= e!300348 (Intermediate!4276 true lt!235467 #b00000000000000000000000000000000))))

(declare-fun b!514367 () Bool)

(declare-fun e!300344 () SeekEntryResult!4276)

(assert (=> b!514367 (= e!300348 e!300344)))

(declare-fun lt!235512 () (_ BitVec 64))

(declare-fun c!60310 () Bool)

(assert (=> b!514367 (= c!60310 (or (= lt!235512 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235512 lt!235512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514368 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514368 (= e!300344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235467 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)) mask!3524))))

(declare-fun b!514369 () Bool)

(assert (=> b!514369 (= e!300344 (Intermediate!4276 false lt!235467 #b00000000000000000000000000000000))))

(declare-fun b!514365 () Bool)

(assert (=> b!514365 (= e!300346 (bvsge (x!48400 lt!235513) #b01111111111111111111111111111110))))

(declare-fun d!79395 () Bool)

(assert (=> d!79395 e!300346))

(declare-fun c!60311 () Bool)

(assert (=> d!79395 (= c!60311 (and ((_ is Intermediate!4276) lt!235513) (undefined!5088 lt!235513)))))

(assert (=> d!79395 (= lt!235513 e!300348)))

(declare-fun c!60309 () Bool)

(assert (=> d!79395 (= c!60309 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79395 (= lt!235512 (select (arr!15853 (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235))) lt!235467))))

(assert (=> d!79395 (validMask!0 mask!3524)))

(assert (=> d!79395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235467 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (array!32966 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)) mask!3524) lt!235513)))

(assert (= (and d!79395 c!60309) b!514366))

(assert (= (and d!79395 (not c!60309)) b!514367))

(assert (= (and b!514367 c!60310) b!514369))

(assert (= (and b!514367 (not c!60310)) b!514368))

(assert (= (and d!79395 c!60311) b!514365))

(assert (= (and d!79395 (not c!60311)) b!514362))

(assert (= (and b!514362 res!314317) b!514361))

(assert (= (and b!514361 (not res!314318)) b!514363))

(assert (= (and b!514363 (not res!314316)) b!514364))

(declare-fun m!496043 () Bool)

(assert (=> b!514368 m!496043))

(assert (=> b!514368 m!496043))

(assert (=> b!514368 m!495921))

(declare-fun m!496045 () Bool)

(assert (=> b!514368 m!496045))

(declare-fun m!496047 () Bool)

(assert (=> d!79395 m!496047))

(assert (=> d!79395 m!495941))

(declare-fun m!496049 () Bool)

(assert (=> b!514363 m!496049))

(assert (=> b!514364 m!496049))

(assert (=> b!514361 m!496049))

(assert (=> b!514243 d!79395))

(declare-fun d!79405 () Bool)

(declare-fun lt!235525 () (_ BitVec 32))

(declare-fun lt!235524 () (_ BitVec 32))

(assert (=> d!79405 (= lt!235525 (bvmul (bvxor lt!235524 (bvlshr lt!235524 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79405 (= lt!235524 ((_ extract 31 0) (bvand (bvxor (select (arr!15853 a!3235) j!176) (bvlshr (select (arr!15853 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79405 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314319 (let ((h!10810 ((_ extract 31 0) (bvand (bvxor (select (arr!15853 a!3235) j!176) (bvlshr (select (arr!15853 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48405 (bvmul (bvxor h!10810 (bvlshr h!10810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48405 (bvlshr x!48405 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314319 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314319 #b00000000000000000000000000000000))))))

(assert (=> d!79405 (= (toIndex!0 (select (arr!15853 a!3235) j!176) mask!3524) (bvand (bvxor lt!235525 (bvlshr lt!235525 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514243 d!79405))

(declare-fun b!514370 () Bool)

(declare-fun lt!235527 () SeekEntryResult!4276)

(assert (=> b!514370 (and (bvsge (index!19294 lt!235527) #b00000000000000000000000000000000) (bvslt (index!19294 lt!235527) (size!16217 a!3235)))))

(declare-fun res!314322 () Bool)

(assert (=> b!514370 (= res!314322 (= (select (arr!15853 a!3235) (index!19294 lt!235527)) (select (arr!15853 a!3235) j!176)))))

(declare-fun e!300352 () Bool)

(assert (=> b!514370 (=> res!314322 e!300352)))

(declare-fun e!300350 () Bool)

(assert (=> b!514370 (= e!300350 e!300352)))

(declare-fun b!514371 () Bool)

(declare-fun e!300351 () Bool)

(assert (=> b!514371 (= e!300351 e!300350)))

(declare-fun res!314321 () Bool)

(assert (=> b!514371 (= res!314321 (and ((_ is Intermediate!4276) lt!235527) (not (undefined!5088 lt!235527)) (bvslt (x!48400 lt!235527) #b01111111111111111111111111111110) (bvsge (x!48400 lt!235527) #b00000000000000000000000000000000) (bvsge (x!48400 lt!235527) #b00000000000000000000000000000000)))))

(assert (=> b!514371 (=> (not res!314321) (not e!300350))))

(declare-fun b!514372 () Bool)

(assert (=> b!514372 (and (bvsge (index!19294 lt!235527) #b00000000000000000000000000000000) (bvslt (index!19294 lt!235527) (size!16217 a!3235)))))

(declare-fun res!314320 () Bool)

(assert (=> b!514372 (= res!314320 (= (select (arr!15853 a!3235) (index!19294 lt!235527)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514372 (=> res!314320 e!300352)))

(declare-fun b!514373 () Bool)

(assert (=> b!514373 (and (bvsge (index!19294 lt!235527) #b00000000000000000000000000000000) (bvslt (index!19294 lt!235527) (size!16217 a!3235)))))

(assert (=> b!514373 (= e!300352 (= (select (arr!15853 a!3235) (index!19294 lt!235527)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514375 () Bool)

(declare-fun e!300353 () SeekEntryResult!4276)

(assert (=> b!514375 (= e!300353 (Intermediate!4276 true lt!235464 #b00000000000000000000000000000000))))

(declare-fun b!514376 () Bool)

(declare-fun e!300349 () SeekEntryResult!4276)

(assert (=> b!514376 (= e!300353 e!300349)))

(declare-fun c!60313 () Bool)

(declare-fun lt!235526 () (_ BitVec 64))

(assert (=> b!514376 (= c!60313 (or (= lt!235526 (select (arr!15853 a!3235) j!176)) (= (bvadd lt!235526 lt!235526) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514377 () Bool)

(assert (=> b!514377 (= e!300349 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235464 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15853 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514378 () Bool)

(assert (=> b!514378 (= e!300349 (Intermediate!4276 false lt!235464 #b00000000000000000000000000000000))))

(declare-fun b!514374 () Bool)

(assert (=> b!514374 (= e!300351 (bvsge (x!48400 lt!235527) #b01111111111111111111111111111110))))

(declare-fun d!79409 () Bool)

(assert (=> d!79409 e!300351))

(declare-fun c!60314 () Bool)

(assert (=> d!79409 (= c!60314 (and ((_ is Intermediate!4276) lt!235527) (undefined!5088 lt!235527)))))

(assert (=> d!79409 (= lt!235527 e!300353)))

(declare-fun c!60312 () Bool)

(assert (=> d!79409 (= c!60312 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79409 (= lt!235526 (select (arr!15853 a!3235) lt!235464))))

(assert (=> d!79409 (validMask!0 mask!3524)))

(assert (=> d!79409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235464 (select (arr!15853 a!3235) j!176) a!3235 mask!3524) lt!235527)))

(assert (= (and d!79409 c!60312) b!514375))

(assert (= (and d!79409 (not c!60312)) b!514376))

(assert (= (and b!514376 c!60313) b!514378))

(assert (= (and b!514376 (not c!60313)) b!514377))

(assert (= (and d!79409 c!60314) b!514374))

(assert (= (and d!79409 (not c!60314)) b!514371))

(assert (= (and b!514371 res!314321) b!514370))

(assert (= (and b!514370 (not res!314322)) b!514372))

(assert (= (and b!514372 (not res!314320)) b!514373))

(declare-fun m!496051 () Bool)

(assert (=> b!514377 m!496051))

(assert (=> b!514377 m!496051))

(assert (=> b!514377 m!495929))

(declare-fun m!496053 () Bool)

(assert (=> b!514377 m!496053))

(declare-fun m!496055 () Bool)

(assert (=> d!79409 m!496055))

(assert (=> d!79409 m!495941))

(declare-fun m!496057 () Bool)

(assert (=> b!514372 m!496057))

(assert (=> b!514373 m!496057))

(assert (=> b!514370 m!496057))

(assert (=> b!514243 d!79409))

(declare-fun bm!31584 () Bool)

(declare-fun call!31587 () Bool)

(assert (=> bm!31584 (= call!31587 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514406 () Bool)

(declare-fun e!300369 () Bool)

(declare-fun e!300370 () Bool)

(assert (=> b!514406 (= e!300369 e!300370)))

(declare-fun lt!235543 () (_ BitVec 64))

(assert (=> b!514406 (= lt!235543 (select (arr!15853 a!3235) j!176))))

(declare-fun lt!235544 () Unit!15871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32965 (_ BitVec 64) (_ BitVec 32)) Unit!15871)

(assert (=> b!514406 (= lt!235544 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235543 j!176))))

(assert (=> b!514406 (arrayContainsKey!0 a!3235 lt!235543 #b00000000000000000000000000000000)))

(declare-fun lt!235545 () Unit!15871)

(assert (=> b!514406 (= lt!235545 lt!235544)))

(declare-fun res!314328 () Bool)

(assert (=> b!514406 (= res!314328 (= (seekEntryOrOpen!0 (select (arr!15853 a!3235) j!176) a!3235 mask!3524) (Found!4276 j!176)))))

(assert (=> b!514406 (=> (not res!314328) (not e!300370))))

(declare-fun b!514407 () Bool)

(assert (=> b!514407 (= e!300370 call!31587)))

(declare-fun b!514408 () Bool)

(assert (=> b!514408 (= e!300369 call!31587)))

(declare-fun d!79411 () Bool)

(declare-fun res!314327 () Bool)

(declare-fun e!300371 () Bool)

(assert (=> d!79411 (=> res!314327 e!300371)))

(assert (=> d!79411 (= res!314327 (bvsge j!176 (size!16217 a!3235)))))

(assert (=> d!79411 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300371)))

(declare-fun b!514405 () Bool)

(assert (=> b!514405 (= e!300371 e!300369)))

(declare-fun c!60326 () Bool)

(assert (=> b!514405 (= c!60326 (validKeyInArray!0 (select (arr!15853 a!3235) j!176)))))

(assert (= (and d!79411 (not res!314327)) b!514405))

(assert (= (and b!514405 c!60326) b!514406))

(assert (= (and b!514405 (not c!60326)) b!514408))

(assert (= (and b!514406 res!314328) b!514407))

(assert (= (or b!514407 b!514408) bm!31584))

(declare-fun m!496071 () Bool)

(assert (=> bm!31584 m!496071))

(assert (=> b!514406 m!495929))

(declare-fun m!496073 () Bool)

(assert (=> b!514406 m!496073))

(declare-fun m!496075 () Bool)

(assert (=> b!514406 m!496075))

(assert (=> b!514406 m!495929))

(assert (=> b!514406 m!495949))

(assert (=> b!514405 m!495929))

(assert (=> b!514405 m!495929))

(assert (=> b!514405 m!495939))

(assert (=> b!514243 d!79411))

(declare-fun d!79417 () Bool)

(assert (=> d!79417 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235552 () Unit!15871)

(declare-fun choose!38 (array!32965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15871)

(assert (=> d!79417 (= lt!235552 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79417 (validMask!0 mask!3524)))

(assert (=> d!79417 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235552)))

(declare-fun bs!16283 () Bool)

(assert (= bs!16283 d!79417))

(assert (=> bs!16283 m!495933))

(declare-fun m!496077 () Bool)

(assert (=> bs!16283 m!496077))

(assert (=> bs!16283 m!495941))

(assert (=> b!514243 d!79417))

(declare-fun d!79419 () Bool)

(declare-fun lt!235554 () (_ BitVec 32))

(declare-fun lt!235553 () (_ BitVec 32))

(assert (=> d!79419 (= lt!235554 (bvmul (bvxor lt!235553 (bvlshr lt!235553 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79419 (= lt!235553 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79419 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314319 (let ((h!10810 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48405 (bvmul (bvxor h!10810 (bvlshr h!10810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48405 (bvlshr x!48405 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314319 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314319 #b00000000000000000000000000000000))))))

(assert (=> d!79419 (= (toIndex!0 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235554 (bvlshr lt!235554 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514243 d!79419))

(declare-fun b!514427 () Bool)

(declare-fun c!60333 () Bool)

(declare-fun lt!235557 () (_ BitVec 64))

(assert (=> b!514427 (= c!60333 (= lt!235557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300384 () SeekEntryResult!4276)

(declare-fun e!300383 () SeekEntryResult!4276)

(assert (=> b!514427 (= e!300384 e!300383)))

(declare-fun b!514428 () Bool)

(declare-fun lt!235556 () SeekEntryResult!4276)

(assert (=> b!514428 (= e!300384 (Found!4276 (index!19294 lt!235556)))))

(declare-fun b!514429 () Bool)

(declare-fun e!300382 () SeekEntryResult!4276)

(assert (=> b!514429 (= e!300382 e!300384)))

(assert (=> b!514429 (= lt!235557 (select (arr!15853 a!3235) (index!19294 lt!235556)))))

(declare-fun c!60334 () Bool)

(assert (=> b!514429 (= c!60334 (= lt!235557 k0!2280))))

(declare-fun d!79421 () Bool)

(declare-fun lt!235555 () SeekEntryResult!4276)

(assert (=> d!79421 (and (or ((_ is Undefined!4276) lt!235555) (not ((_ is Found!4276) lt!235555)) (and (bvsge (index!19293 lt!235555) #b00000000000000000000000000000000) (bvslt (index!19293 lt!235555) (size!16217 a!3235)))) (or ((_ is Undefined!4276) lt!235555) ((_ is Found!4276) lt!235555) (not ((_ is MissingZero!4276) lt!235555)) (and (bvsge (index!19292 lt!235555) #b00000000000000000000000000000000) (bvslt (index!19292 lt!235555) (size!16217 a!3235)))) (or ((_ is Undefined!4276) lt!235555) ((_ is Found!4276) lt!235555) ((_ is MissingZero!4276) lt!235555) (not ((_ is MissingVacant!4276) lt!235555)) (and (bvsge (index!19295 lt!235555) #b00000000000000000000000000000000) (bvslt (index!19295 lt!235555) (size!16217 a!3235)))) (or ((_ is Undefined!4276) lt!235555) (ite ((_ is Found!4276) lt!235555) (= (select (arr!15853 a!3235) (index!19293 lt!235555)) k0!2280) (ite ((_ is MissingZero!4276) lt!235555) (= (select (arr!15853 a!3235) (index!19292 lt!235555)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4276) lt!235555) (= (select (arr!15853 a!3235) (index!19295 lt!235555)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79421 (= lt!235555 e!300382)))

(declare-fun c!60335 () Bool)

(assert (=> d!79421 (= c!60335 (and ((_ is Intermediate!4276) lt!235556) (undefined!5088 lt!235556)))))

(assert (=> d!79421 (= lt!235556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79421 (validMask!0 mask!3524)))

(assert (=> d!79421 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235555)))

(declare-fun b!514430 () Bool)

(assert (=> b!514430 (= e!300383 (seekKeyOrZeroReturnVacant!0 (x!48400 lt!235556) (index!19294 lt!235556) (index!19294 lt!235556) k0!2280 a!3235 mask!3524))))

(declare-fun b!514431 () Bool)

(assert (=> b!514431 (= e!300383 (MissingZero!4276 (index!19294 lt!235556)))))

(declare-fun b!514432 () Bool)

(assert (=> b!514432 (= e!300382 Undefined!4276)))

(assert (= (and d!79421 c!60335) b!514432))

(assert (= (and d!79421 (not c!60335)) b!514429))

(assert (= (and b!514429 c!60334) b!514428))

(assert (= (and b!514429 (not c!60334)) b!514427))

(assert (= (and b!514427 c!60333) b!514431))

(assert (= (and b!514427 (not c!60333)) b!514430))

(declare-fun m!496079 () Bool)

(assert (=> b!514429 m!496079))

(declare-fun m!496081 () Bool)

(assert (=> d!79421 m!496081))

(assert (=> d!79421 m!495941))

(declare-fun m!496083 () Bool)

(assert (=> d!79421 m!496083))

(declare-fun m!496085 () Bool)

(assert (=> d!79421 m!496085))

(assert (=> d!79421 m!496085))

(declare-fun m!496087 () Bool)

(assert (=> d!79421 m!496087))

(declare-fun m!496089 () Bool)

(assert (=> d!79421 m!496089))

(declare-fun m!496091 () Bool)

(assert (=> b!514430 m!496091))

(assert (=> b!514245 d!79421))

(declare-fun b!514452 () Bool)

(declare-fun e!300403 () Bool)

(declare-fun call!31590 () Bool)

(assert (=> b!514452 (= e!300403 call!31590)))

(declare-fun b!514453 () Bool)

(declare-fun e!300400 () Bool)

(declare-fun e!300401 () Bool)

(assert (=> b!514453 (= e!300400 e!300401)))

(declare-fun res!314348 () Bool)

(assert (=> b!514453 (=> (not res!314348) (not e!300401))))

(declare-fun e!300402 () Bool)

(assert (=> b!514453 (= res!314348 (not e!300402))))

(declare-fun res!314346 () Bool)

(assert (=> b!514453 (=> (not res!314346) (not e!300402))))

(assert (=> b!514453 (= res!314346 (validKeyInArray!0 (select (arr!15853 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31587 () Bool)

(declare-fun c!60341 () Bool)

(assert (=> bm!31587 (= call!31590 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60341 (Cons!9914 (select (arr!15853 a!3235) #b00000000000000000000000000000000) Nil!9915) Nil!9915)))))

(declare-fun b!514454 () Bool)

(assert (=> b!514454 (= e!300401 e!300403)))

(assert (=> b!514454 (= c!60341 (validKeyInArray!0 (select (arr!15853 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79423 () Bool)

(declare-fun res!314347 () Bool)

(assert (=> d!79423 (=> res!314347 e!300400)))

(assert (=> d!79423 (= res!314347 (bvsge #b00000000000000000000000000000000 (size!16217 a!3235)))))

(assert (=> d!79423 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9915) e!300400)))

(declare-fun b!514455 () Bool)

(assert (=> b!514455 (= e!300403 call!31590)))

(declare-fun b!514456 () Bool)

(declare-fun contains!2715 (List!9918 (_ BitVec 64)) Bool)

(assert (=> b!514456 (= e!300402 (contains!2715 Nil!9915 (select (arr!15853 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79423 (not res!314347)) b!514453))

(assert (= (and b!514453 res!314346) b!514456))

(assert (= (and b!514453 res!314348) b!514454))

(assert (= (and b!514454 c!60341) b!514452))

(assert (= (and b!514454 (not c!60341)) b!514455))

(assert (= (or b!514452 b!514455) bm!31587))

(declare-fun m!496101 () Bool)

(assert (=> b!514453 m!496101))

(assert (=> b!514453 m!496101))

(declare-fun m!496103 () Bool)

(assert (=> b!514453 m!496103))

(assert (=> bm!31587 m!496101))

(declare-fun m!496105 () Bool)

(assert (=> bm!31587 m!496105))

(assert (=> b!514454 m!496101))

(assert (=> b!514454 m!496101))

(assert (=> b!514454 m!496103))

(assert (=> b!514456 m!496101))

(assert (=> b!514456 m!496101))

(declare-fun m!496107 () Bool)

(assert (=> b!514456 m!496107))

(assert (=> b!514250 d!79423))

(declare-fun bm!31592 () Bool)

(declare-fun call!31595 () Bool)

(assert (=> bm!31592 (= call!31595 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514476 () Bool)

(declare-fun e!300416 () Bool)

(declare-fun e!300417 () Bool)

(assert (=> b!514476 (= e!300416 e!300417)))

(declare-fun lt!235566 () (_ BitVec 64))

(assert (=> b!514476 (= lt!235566 (select (arr!15853 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235567 () Unit!15871)

(assert (=> b!514476 (= lt!235567 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235566 #b00000000000000000000000000000000))))

(assert (=> b!514476 (arrayContainsKey!0 a!3235 lt!235566 #b00000000000000000000000000000000)))

(declare-fun lt!235568 () Unit!15871)

(assert (=> b!514476 (= lt!235568 lt!235567)))

(declare-fun res!314358 () Bool)

(assert (=> b!514476 (= res!314358 (= (seekEntryOrOpen!0 (select (arr!15853 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4276 #b00000000000000000000000000000000)))))

(assert (=> b!514476 (=> (not res!314358) (not e!300417))))

(declare-fun b!514477 () Bool)

(assert (=> b!514477 (= e!300417 call!31595)))

(declare-fun b!514478 () Bool)

(assert (=> b!514478 (= e!300416 call!31595)))

(declare-fun d!79431 () Bool)

(declare-fun res!314357 () Bool)

(declare-fun e!300418 () Bool)

(assert (=> d!79431 (=> res!314357 e!300418)))

(assert (=> d!79431 (= res!314357 (bvsge #b00000000000000000000000000000000 (size!16217 a!3235)))))

(assert (=> d!79431 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300418)))

(declare-fun b!514475 () Bool)

(assert (=> b!514475 (= e!300418 e!300416)))

(declare-fun c!60346 () Bool)

(assert (=> b!514475 (= c!60346 (validKeyInArray!0 (select (arr!15853 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79431 (not res!314357)) b!514475))

(assert (= (and b!514475 c!60346) b!514476))

(assert (= (and b!514475 (not c!60346)) b!514478))

(assert (= (and b!514476 res!314358) b!514477))

(assert (= (or b!514477 b!514478) bm!31592))

(declare-fun m!496109 () Bool)

(assert (=> bm!31592 m!496109))

(assert (=> b!514476 m!496101))

(declare-fun m!496111 () Bool)

(assert (=> b!514476 m!496111))

(declare-fun m!496113 () Bool)

(assert (=> b!514476 m!496113))

(assert (=> b!514476 m!496101))

(declare-fun m!496115 () Bool)

(assert (=> b!514476 m!496115))

(assert (=> b!514475 m!496101))

(assert (=> b!514475 m!496101))

(assert (=> b!514475 m!496103))

(assert (=> b!514252 d!79431))

(declare-fun d!79433 () Bool)

(assert (=> d!79433 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46538 d!79433))

(declare-fun d!79449 () Bool)

(assert (=> d!79449 (= (array_inv!11712 a!3235) (bvsge (size!16217 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46538 d!79449))

(declare-fun d!79451 () Bool)

(declare-fun res!314377 () Bool)

(declare-fun e!300447 () Bool)

(assert (=> d!79451 (=> res!314377 e!300447)))

(assert (=> d!79451 (= res!314377 (= (select (arr!15853 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79451 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300447)))

(declare-fun b!514519 () Bool)

(declare-fun e!300448 () Bool)

(assert (=> b!514519 (= e!300447 e!300448)))

(declare-fun res!314378 () Bool)

(assert (=> b!514519 (=> (not res!314378) (not e!300448))))

(assert (=> b!514519 (= res!314378 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16217 a!3235)))))

(declare-fun b!514520 () Bool)

(assert (=> b!514520 (= e!300448 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79451 (not res!314377)) b!514519))

(assert (= (and b!514519 res!314378) b!514520))

(assert (=> d!79451 m!496101))

(declare-fun m!496161 () Bool)

(assert (=> b!514520 m!496161))

(assert (=> b!514251 d!79451))

(declare-fun d!79457 () Bool)

(assert (=> d!79457 (= (validKeyInArray!0 (select (arr!15853 a!3235) j!176)) (and (not (= (select (arr!15853 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15853 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514246 d!79457))

(declare-fun d!79459 () Bool)

(assert (=> d!79459 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514248 d!79459))

(check-sat (not b!514334) (not b!514520) (not d!79417) (not b!514476) (not b!514453) (not d!79395) (not b!514454) (not b!514368) (not b!514456) (not bm!31584) (not d!79393) (not bm!31587) (not b!514430) (not b!514475) (not b!514406) (not d!79409) (not b!514405) (not b!514377) (not d!79421) (not bm!31592))
(check-sat)
