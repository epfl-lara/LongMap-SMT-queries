; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67574 () Bool)

(assert start!67574)

(declare-fun b!782392 () Bool)

(declare-fun e!435057 () Bool)

(declare-fun e!435059 () Bool)

(assert (=> b!782392 (= e!435057 e!435059)))

(declare-fun res!529413 () Bool)

(assert (=> b!782392 (=> (not res!529413) (not e!435059))))

(declare-datatypes ((array!42677 0))(
  ( (array!42678 (arr!20428 (Array (_ BitVec 32) (_ BitVec 64))) (size!20849 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42677)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8028 0))(
  ( (MissingZero!8028 (index!34480 (_ BitVec 32))) (Found!8028 (index!34481 (_ BitVec 32))) (Intermediate!8028 (undefined!8840 Bool) (index!34482 (_ BitVec 32)) (x!65431 (_ BitVec 32))) (Undefined!8028) (MissingVacant!8028 (index!34483 (_ BitVec 32))) )
))
(declare-fun lt!348685 () SeekEntryResult!8028)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42677 (_ BitVec 32)) SeekEntryResult!8028)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782392 (= res!529413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20428 a!3186) j!159) mask!3328) (select (arr!20428 a!3186) j!159) a!3186 mask!3328) lt!348685))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782392 (= lt!348685 (Intermediate!8028 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782393 () Bool)

(declare-fun res!529402 () Bool)

(assert (=> b!782393 (=> (not res!529402) (not e!435057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42677 (_ BitVec 32)) Bool)

(assert (=> b!782393 (= res!529402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782394 () Bool)

(declare-fun e!435054 () Bool)

(assert (=> b!782394 (= e!435059 e!435054)))

(declare-fun res!529405 () Bool)

(assert (=> b!782394 (=> (not res!529405) (not e!435054))))

(declare-fun lt!348689 () SeekEntryResult!8028)

(declare-fun lt!348681 () SeekEntryResult!8028)

(assert (=> b!782394 (= res!529405 (= lt!348689 lt!348681))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!348687 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!348688 () array!42677)

(assert (=> b!782394 (= lt!348681 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348687 lt!348688 mask!3328))))

(assert (=> b!782394 (= lt!348689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348687 mask!3328) lt!348687 lt!348688 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782394 (= lt!348687 (select (store (arr!20428 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782394 (= lt!348688 (array!42678 (store (arr!20428 a!3186) i!1173 k0!2102) (size!20849 a!3186)))))

(declare-fun b!782395 () Bool)

(declare-fun res!529404 () Bool)

(declare-fun e!435056 () Bool)

(assert (=> b!782395 (=> res!529404 e!435056)))

(assert (=> b!782395 (= res!529404 (= (select (store (arr!20428 a!3186) i!1173 k0!2102) index!1321) lt!348687))))

(declare-fun b!782396 () Bool)

(declare-fun res!529416 () Bool)

(assert (=> b!782396 (=> res!529416 e!435056)))

(declare-fun lt!348683 () SeekEntryResult!8028)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42677 (_ BitVec 32)) SeekEntryResult!8028)

(assert (=> b!782396 (= res!529416 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20428 a!3186) j!159) a!3186 mask!3328) lt!348683)))))

(declare-fun b!782398 () Bool)

(declare-fun res!529415 () Bool)

(assert (=> b!782398 (=> (not res!529415) (not e!435059))))

(declare-fun e!435051 () Bool)

(assert (=> b!782398 (= res!529415 e!435051)))

(declare-fun c!86901 () Bool)

(assert (=> b!782398 (= c!86901 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782399 () Bool)

(assert (=> b!782399 (= e!435056 true)))

(assert (=> b!782399 (= (select (store (arr!20428 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!27000 0))(
  ( (Unit!27001) )
))
(declare-fun lt!348680 () Unit!27000)

(declare-fun e!435052 () Unit!27000)

(assert (=> b!782399 (= lt!348680 e!435052)))

(declare-fun c!86902 () Bool)

(assert (=> b!782399 (= c!86902 (= (select (store (arr!20428 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782400 () Bool)

(declare-fun res!529408 () Bool)

(declare-fun e!435053 () Bool)

(assert (=> b!782400 (=> (not res!529408) (not e!435053))))

(declare-fun arrayContainsKey!0 (array!42677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782400 (= res!529408 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!435055 () Bool)

(declare-fun b!782401 () Bool)

(assert (=> b!782401 (= e!435055 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20428 a!3186) j!159) a!3186 mask!3328) lt!348683))))

(declare-fun b!782402 () Bool)

(declare-fun res!529414 () Bool)

(assert (=> b!782402 (=> (not res!529414) (not e!435057))))

(declare-datatypes ((List!14430 0))(
  ( (Nil!14427) (Cons!14426 (h!15546 (_ BitVec 64)) (t!20745 List!14430)) )
))
(declare-fun arrayNoDuplicates!0 (array!42677 (_ BitVec 32) List!14430) Bool)

(assert (=> b!782402 (= res!529414 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14427))))

(declare-fun b!782403 () Bool)

(declare-fun Unit!27002 () Unit!27000)

(assert (=> b!782403 (= e!435052 Unit!27002)))

(assert (=> b!782403 false))

(declare-fun b!782404 () Bool)

(assert (=> b!782404 (= e!435051 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20428 a!3186) j!159) a!3186 mask!3328) (Found!8028 j!159)))))

(declare-fun b!782405 () Bool)

(declare-fun res!529409 () Bool)

(assert (=> b!782405 (=> (not res!529409) (not e!435059))))

(assert (=> b!782405 (= res!529409 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20428 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782406 () Bool)

(assert (=> b!782406 (= e!435053 e!435057)))

(declare-fun res!529417 () Bool)

(assert (=> b!782406 (=> (not res!529417) (not e!435057))))

(declare-fun lt!348684 () SeekEntryResult!8028)

(assert (=> b!782406 (= res!529417 (or (= lt!348684 (MissingZero!8028 i!1173)) (= lt!348684 (MissingVacant!8028 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42677 (_ BitVec 32)) SeekEntryResult!8028)

(assert (=> b!782406 (= lt!348684 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782407 () Bool)

(declare-fun res!529406 () Bool)

(assert (=> b!782407 (=> (not res!529406) (not e!435057))))

(assert (=> b!782407 (= res!529406 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20849 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20849 a!3186))))))

(declare-fun b!782408 () Bool)

(declare-fun Unit!27003 () Unit!27000)

(assert (=> b!782408 (= e!435052 Unit!27003)))

(declare-fun b!782397 () Bool)

(declare-fun res!529410 () Bool)

(assert (=> b!782397 (=> (not res!529410) (not e!435053))))

(assert (=> b!782397 (= res!529410 (and (= (size!20849 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20849 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20849 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!529412 () Bool)

(assert (=> start!67574 (=> (not res!529412) (not e!435053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67574 (= res!529412 (validMask!0 mask!3328))))

(assert (=> start!67574 e!435053))

(assert (=> start!67574 true))

(declare-fun array_inv!16224 (array!42677) Bool)

(assert (=> start!67574 (array_inv!16224 a!3186)))

(declare-fun b!782409 () Bool)

(assert (=> b!782409 (= e!435054 (not e!435056))))

(declare-fun res!529411 () Bool)

(assert (=> b!782409 (=> res!529411 e!435056)))

(get-info :version)

(assert (=> b!782409 (= res!529411 (or (not ((_ is Intermediate!8028) lt!348681)) (bvslt x!1131 (x!65431 lt!348681)) (not (= x!1131 (x!65431 lt!348681))) (not (= index!1321 (index!34482 lt!348681)))))))

(assert (=> b!782409 e!435055))

(declare-fun res!529407 () Bool)

(assert (=> b!782409 (=> (not res!529407) (not e!435055))))

(declare-fun lt!348686 () SeekEntryResult!8028)

(assert (=> b!782409 (= res!529407 (= lt!348686 lt!348683))))

(assert (=> b!782409 (= lt!348683 (Found!8028 j!159))))

(assert (=> b!782409 (= lt!348686 (seekEntryOrOpen!0 (select (arr!20428 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782409 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348682 () Unit!27000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27000)

(assert (=> b!782409 (= lt!348682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782410 () Bool)

(declare-fun res!529418 () Bool)

(assert (=> b!782410 (=> (not res!529418) (not e!435053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782410 (= res!529418 (validKeyInArray!0 k0!2102))))

(declare-fun b!782411 () Bool)

(assert (=> b!782411 (= e!435051 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20428 a!3186) j!159) a!3186 mask!3328) lt!348685))))

(declare-fun b!782412 () Bool)

(declare-fun res!529403 () Bool)

(assert (=> b!782412 (=> (not res!529403) (not e!435053))))

(assert (=> b!782412 (= res!529403 (validKeyInArray!0 (select (arr!20428 a!3186) j!159)))))

(assert (= (and start!67574 res!529412) b!782397))

(assert (= (and b!782397 res!529410) b!782412))

(assert (= (and b!782412 res!529403) b!782410))

(assert (= (and b!782410 res!529418) b!782400))

(assert (= (and b!782400 res!529408) b!782406))

(assert (= (and b!782406 res!529417) b!782393))

(assert (= (and b!782393 res!529402) b!782402))

(assert (= (and b!782402 res!529414) b!782407))

(assert (= (and b!782407 res!529406) b!782392))

(assert (= (and b!782392 res!529413) b!782405))

(assert (= (and b!782405 res!529409) b!782398))

(assert (= (and b!782398 c!86901) b!782411))

(assert (= (and b!782398 (not c!86901)) b!782404))

(assert (= (and b!782398 res!529415) b!782394))

(assert (= (and b!782394 res!529405) b!782409))

(assert (= (and b!782409 res!529407) b!782401))

(assert (= (and b!782409 (not res!529411)) b!782396))

(assert (= (and b!782396 (not res!529416)) b!782395))

(assert (= (and b!782395 (not res!529404)) b!782399))

(assert (= (and b!782399 c!86902) b!782403))

(assert (= (and b!782399 (not c!86902)) b!782408))

(declare-fun m!725195 () Bool)

(assert (=> b!782405 m!725195))

(declare-fun m!725197 () Bool)

(assert (=> b!782406 m!725197))

(declare-fun m!725199 () Bool)

(assert (=> b!782410 m!725199))

(declare-fun m!725201 () Bool)

(assert (=> b!782402 m!725201))

(declare-fun m!725203 () Bool)

(assert (=> start!67574 m!725203))

(declare-fun m!725205 () Bool)

(assert (=> start!67574 m!725205))

(declare-fun m!725207 () Bool)

(assert (=> b!782411 m!725207))

(assert (=> b!782411 m!725207))

(declare-fun m!725209 () Bool)

(assert (=> b!782411 m!725209))

(assert (=> b!782409 m!725207))

(assert (=> b!782409 m!725207))

(declare-fun m!725211 () Bool)

(assert (=> b!782409 m!725211))

(declare-fun m!725213 () Bool)

(assert (=> b!782409 m!725213))

(declare-fun m!725215 () Bool)

(assert (=> b!782409 m!725215))

(assert (=> b!782396 m!725207))

(assert (=> b!782396 m!725207))

(declare-fun m!725217 () Bool)

(assert (=> b!782396 m!725217))

(declare-fun m!725219 () Bool)

(assert (=> b!782393 m!725219))

(assert (=> b!782392 m!725207))

(assert (=> b!782392 m!725207))

(declare-fun m!725221 () Bool)

(assert (=> b!782392 m!725221))

(assert (=> b!782392 m!725221))

(assert (=> b!782392 m!725207))

(declare-fun m!725223 () Bool)

(assert (=> b!782392 m!725223))

(declare-fun m!725225 () Bool)

(assert (=> b!782395 m!725225))

(declare-fun m!725227 () Bool)

(assert (=> b!782395 m!725227))

(assert (=> b!782412 m!725207))

(assert (=> b!782412 m!725207))

(declare-fun m!725229 () Bool)

(assert (=> b!782412 m!725229))

(declare-fun m!725231 () Bool)

(assert (=> b!782400 m!725231))

(assert (=> b!782404 m!725207))

(assert (=> b!782404 m!725207))

(assert (=> b!782404 m!725217))

(assert (=> b!782401 m!725207))

(assert (=> b!782401 m!725207))

(declare-fun m!725233 () Bool)

(assert (=> b!782401 m!725233))

(declare-fun m!725235 () Bool)

(assert (=> b!782394 m!725235))

(declare-fun m!725237 () Bool)

(assert (=> b!782394 m!725237))

(declare-fun m!725239 () Bool)

(assert (=> b!782394 m!725239))

(assert (=> b!782394 m!725225))

(assert (=> b!782394 m!725235))

(declare-fun m!725241 () Bool)

(assert (=> b!782394 m!725241))

(assert (=> b!782399 m!725225))

(assert (=> b!782399 m!725227))

(check-sat (not start!67574) (not b!782392) (not b!782406) (not b!782394) (not b!782400) (not b!782409) (not b!782404) (not b!782402) (not b!782396) (not b!782412) (not b!782410) (not b!782411) (not b!782401) (not b!782393))
(check-sat)
