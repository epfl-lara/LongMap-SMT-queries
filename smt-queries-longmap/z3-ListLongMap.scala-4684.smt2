; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65292 () Bool)

(assert start!65292)

(declare-fun b!737429 () Bool)

(declare-fun res!495423 () Bool)

(declare-fun e!412575 () Bool)

(assert (=> b!737429 (=> (not res!495423) (not e!412575))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41335 0))(
  ( (array!41336 (arr!19777 (Array (_ BitVec 32) (_ BitVec 64))) (size!20197 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41335)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737429 (= res!495423 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19777 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!412584 () Bool)

(declare-fun b!737430 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!327066 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7333 0))(
  ( (MissingZero!7333 (index!31700 (_ BitVec 32))) (Found!7333 (index!31701 (_ BitVec 32))) (Intermediate!7333 (undefined!8145 Bool) (index!31702 (_ BitVec 32)) (x!62863 (_ BitVec 32))) (Undefined!7333) (MissingVacant!7333 (index!31703 (_ BitVec 32))) )
))
(declare-fun lt!327063 () SeekEntryResult!7333)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41335 (_ BitVec 32)) SeekEntryResult!7333)

(assert (=> b!737430 (= e!412584 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327066 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!327063)))))

(declare-fun b!737431 () Bool)

(declare-fun res!495416 () Bool)

(declare-fun e!412580 () Bool)

(assert (=> b!737431 (=> (not res!495416) (not e!412580))))

(declare-datatypes ((List!13686 0))(
  ( (Nil!13683) (Cons!13682 (h!14760 (_ BitVec 64)) (t!19993 List!13686)) )
))
(declare-fun arrayNoDuplicates!0 (array!41335 (_ BitVec 32) List!13686) Bool)

(assert (=> b!737431 (= res!495416 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13683))))

(declare-fun b!737432 () Bool)

(declare-fun res!495431 () Bool)

(declare-fun e!412576 () Bool)

(assert (=> b!737432 (=> res!495431 e!412576)))

(assert (=> b!737432 (= res!495431 e!412584)))

(declare-fun c!81392 () Bool)

(declare-fun lt!327054 () Bool)

(assert (=> b!737432 (= c!81392 lt!327054)))

(declare-fun b!737433 () Bool)

(declare-fun e!412573 () Bool)

(assert (=> b!737433 (= e!412573 e!412580)))

(declare-fun res!495432 () Bool)

(assert (=> b!737433 (=> (not res!495432) (not e!412580))))

(declare-fun lt!327055 () SeekEntryResult!7333)

(assert (=> b!737433 (= res!495432 (or (= lt!327055 (MissingZero!7333 i!1173)) (= lt!327055 (MissingVacant!7333 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41335 (_ BitVec 32)) SeekEntryResult!7333)

(assert (=> b!737433 (= lt!327055 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737434 () Bool)

(assert (=> b!737434 (= e!412576 true)))

(declare-fun lt!327057 () (_ BitVec 64))

(declare-fun lt!327058 () array!41335)

(declare-fun lt!327060 () SeekEntryResult!7333)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41335 (_ BitVec 32)) SeekEntryResult!7333)

(assert (=> b!737434 (= lt!327060 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327066 lt!327057 lt!327058 mask!3328))))

(declare-fun b!737435 () Bool)

(declare-fun res!495424 () Bool)

(assert (=> b!737435 (=> (not res!495424) (not e!412575))))

(declare-fun e!412583 () Bool)

(assert (=> b!737435 (= res!495424 e!412583)))

(declare-fun c!81391 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737435 (= c!81391 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737436 () Bool)

(declare-fun res!495422 () Bool)

(assert (=> b!737436 (=> (not res!495422) (not e!412580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41335 (_ BitVec 32)) Bool)

(assert (=> b!737436 (= res!495422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737437 () Bool)

(declare-fun res!495430 () Bool)

(assert (=> b!737437 (=> (not res!495430) (not e!412580))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!737437 (= res!495430 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20197 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20197 a!3186))))))

(declare-fun b!737438 () Bool)

(declare-fun res!495427 () Bool)

(assert (=> b!737438 (=> (not res!495427) (not e!412573))))

(declare-fun arrayContainsKey!0 (array!41335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737438 (= res!495427 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737439 () Bool)

(declare-fun e!412577 () Bool)

(declare-fun e!412581 () Bool)

(assert (=> b!737439 (= e!412577 (not e!412581))))

(declare-fun res!495429 () Bool)

(assert (=> b!737439 (=> res!495429 e!412581)))

(declare-fun lt!327062 () SeekEntryResult!7333)

(get-info :version)

(assert (=> b!737439 (= res!495429 (or (not ((_ is Intermediate!7333) lt!327062)) (bvsge x!1131 (x!62863 lt!327062))))))

(assert (=> b!737439 (= lt!327063 (Found!7333 j!159))))

(declare-fun e!412574 () Bool)

(assert (=> b!737439 e!412574))

(declare-fun res!495428 () Bool)

(assert (=> b!737439 (=> (not res!495428) (not e!412574))))

(assert (=> b!737439 (= res!495428 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25105 0))(
  ( (Unit!25106) )
))
(declare-fun lt!327056 () Unit!25105)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25105)

(assert (=> b!737439 (= lt!327056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737440 () Bool)

(declare-fun res!495425 () Bool)

(assert (=> b!737440 (=> (not res!495425) (not e!412573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737440 (= res!495425 (validKeyInArray!0 k0!2102))))

(declare-fun res!495419 () Bool)

(assert (=> start!65292 (=> (not res!495419) (not e!412573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65292 (= res!495419 (validMask!0 mask!3328))))

(assert (=> start!65292 e!412573))

(assert (=> start!65292 true))

(declare-fun array_inv!15636 (array!41335) Bool)

(assert (=> start!65292 (array_inv!15636 a!3186)))

(declare-fun b!737441 () Bool)

(assert (=> b!737441 (= e!412581 e!412576)))

(declare-fun res!495417 () Bool)

(assert (=> b!737441 (=> res!495417 e!412576)))

(assert (=> b!737441 (= res!495417 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327066 #b00000000000000000000000000000000) (bvsge lt!327066 (size!20197 a!3186))))))

(declare-fun lt!327059 () Unit!25105)

(declare-fun e!412579 () Unit!25105)

(assert (=> b!737441 (= lt!327059 e!412579)))

(declare-fun c!81390 () Bool)

(assert (=> b!737441 (= c!81390 lt!327054)))

(assert (=> b!737441 (= lt!327054 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737441 (= lt!327066 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!737442 () Bool)

(declare-fun Unit!25107 () Unit!25105)

(assert (=> b!737442 (= e!412579 Unit!25107)))

(declare-fun lt!327053 () SeekEntryResult!7333)

(assert (=> b!737442 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327066 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!327053)))

(declare-fun b!737443 () Bool)

(assert (=> b!737443 (= e!412583 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) (Found!7333 j!159)))))

(declare-fun b!737444 () Bool)

(assert (=> b!737444 (= e!412583 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!327053))))

(declare-fun b!737445 () Bool)

(assert (=> b!737445 (= e!412584 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327066 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!327053)))))

(declare-fun b!737446 () Bool)

(assert (=> b!737446 (= e!412575 e!412577)))

(declare-fun res!495426 () Bool)

(assert (=> b!737446 (=> (not res!495426) (not e!412577))))

(declare-fun lt!327061 () SeekEntryResult!7333)

(assert (=> b!737446 (= res!495426 (= lt!327061 lt!327062))))

(assert (=> b!737446 (= lt!327062 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327057 lt!327058 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737446 (= lt!327061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327057 mask!3328) lt!327057 lt!327058 mask!3328))))

(assert (=> b!737446 (= lt!327057 (select (store (arr!19777 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737446 (= lt!327058 (array!41336 (store (arr!19777 a!3186) i!1173 k0!2102) (size!20197 a!3186)))))

(declare-fun b!737447 () Bool)

(declare-fun res!495420 () Bool)

(assert (=> b!737447 (=> (not res!495420) (not e!412573))))

(assert (=> b!737447 (= res!495420 (and (= (size!20197 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20197 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20197 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737448 () Bool)

(assert (=> b!737448 (= e!412580 e!412575)))

(declare-fun res!495433 () Bool)

(assert (=> b!737448 (=> (not res!495433) (not e!412575))))

(assert (=> b!737448 (= res!495433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19777 a!3186) j!159) mask!3328) (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!327053))))

(assert (=> b!737448 (= lt!327053 (Intermediate!7333 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737449 () Bool)

(declare-fun res!495421 () Bool)

(assert (=> b!737449 (=> (not res!495421) (not e!412573))))

(assert (=> b!737449 (= res!495421 (validKeyInArray!0 (select (arr!19777 a!3186) j!159)))))

(declare-fun e!412578 () Bool)

(declare-fun b!737450 () Bool)

(declare-fun lt!327065 () SeekEntryResult!7333)

(assert (=> b!737450 (= e!412578 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!327065))))

(declare-fun b!737451 () Bool)

(declare-fun Unit!25108 () Unit!25105)

(assert (=> b!737451 (= e!412579 Unit!25108)))

(declare-fun lt!327064 () SeekEntryResult!7333)

(assert (=> b!737451 (= lt!327064 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737451 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327066 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!327063)))

(declare-fun b!737452 () Bool)

(assert (=> b!737452 (= e!412574 e!412578)))

(declare-fun res!495418 () Bool)

(assert (=> b!737452 (=> (not res!495418) (not e!412578))))

(assert (=> b!737452 (= res!495418 (= (seekEntryOrOpen!0 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!327065))))

(assert (=> b!737452 (= lt!327065 (Found!7333 j!159))))

(assert (= (and start!65292 res!495419) b!737447))

(assert (= (and b!737447 res!495420) b!737449))

(assert (= (and b!737449 res!495421) b!737440))

(assert (= (and b!737440 res!495425) b!737438))

(assert (= (and b!737438 res!495427) b!737433))

(assert (= (and b!737433 res!495432) b!737436))

(assert (= (and b!737436 res!495422) b!737431))

(assert (= (and b!737431 res!495416) b!737437))

(assert (= (and b!737437 res!495430) b!737448))

(assert (= (and b!737448 res!495433) b!737429))

(assert (= (and b!737429 res!495423) b!737435))

(assert (= (and b!737435 c!81391) b!737444))

(assert (= (and b!737435 (not c!81391)) b!737443))

(assert (= (and b!737435 res!495424) b!737446))

(assert (= (and b!737446 res!495426) b!737439))

(assert (= (and b!737439 res!495428) b!737452))

(assert (= (and b!737452 res!495418) b!737450))

(assert (= (and b!737439 (not res!495429)) b!737441))

(assert (= (and b!737441 c!81390) b!737442))

(assert (= (and b!737441 (not c!81390)) b!737451))

(assert (= (and b!737441 (not res!495417)) b!737432))

(assert (= (and b!737432 c!81392) b!737445))

(assert (= (and b!737432 (not c!81392)) b!737430))

(assert (= (and b!737432 (not res!495431)) b!737434))

(declare-fun m!689913 () Bool)

(assert (=> b!737433 m!689913))

(declare-fun m!689915 () Bool)

(assert (=> b!737440 m!689915))

(declare-fun m!689917 () Bool)

(assert (=> b!737452 m!689917))

(assert (=> b!737452 m!689917))

(declare-fun m!689919 () Bool)

(assert (=> b!737452 m!689919))

(assert (=> b!737445 m!689917))

(assert (=> b!737445 m!689917))

(declare-fun m!689921 () Bool)

(assert (=> b!737445 m!689921))

(assert (=> b!737442 m!689917))

(assert (=> b!737442 m!689917))

(assert (=> b!737442 m!689921))

(declare-fun m!689923 () Bool)

(assert (=> b!737434 m!689923))

(declare-fun m!689925 () Bool)

(assert (=> b!737446 m!689925))

(declare-fun m!689927 () Bool)

(assert (=> b!737446 m!689927))

(declare-fun m!689929 () Bool)

(assert (=> b!737446 m!689929))

(declare-fun m!689931 () Bool)

(assert (=> b!737446 m!689931))

(assert (=> b!737446 m!689929))

(declare-fun m!689933 () Bool)

(assert (=> b!737446 m!689933))

(declare-fun m!689935 () Bool)

(assert (=> b!737436 m!689935))

(declare-fun m!689937 () Bool)

(assert (=> b!737438 m!689937))

(declare-fun m!689939 () Bool)

(assert (=> b!737439 m!689939))

(declare-fun m!689941 () Bool)

(assert (=> b!737439 m!689941))

(declare-fun m!689943 () Bool)

(assert (=> b!737431 m!689943))

(assert (=> b!737451 m!689917))

(assert (=> b!737451 m!689917))

(declare-fun m!689945 () Bool)

(assert (=> b!737451 m!689945))

(assert (=> b!737451 m!689917))

(declare-fun m!689947 () Bool)

(assert (=> b!737451 m!689947))

(assert (=> b!737450 m!689917))

(assert (=> b!737450 m!689917))

(declare-fun m!689949 () Bool)

(assert (=> b!737450 m!689949))

(declare-fun m!689951 () Bool)

(assert (=> b!737429 m!689951))

(assert (=> b!737443 m!689917))

(assert (=> b!737443 m!689917))

(assert (=> b!737443 m!689945))

(declare-fun m!689953 () Bool)

(assert (=> b!737441 m!689953))

(assert (=> b!737449 m!689917))

(assert (=> b!737449 m!689917))

(declare-fun m!689955 () Bool)

(assert (=> b!737449 m!689955))

(assert (=> b!737448 m!689917))

(assert (=> b!737448 m!689917))

(declare-fun m!689957 () Bool)

(assert (=> b!737448 m!689957))

(assert (=> b!737448 m!689957))

(assert (=> b!737448 m!689917))

(declare-fun m!689959 () Bool)

(assert (=> b!737448 m!689959))

(declare-fun m!689961 () Bool)

(assert (=> start!65292 m!689961))

(declare-fun m!689963 () Bool)

(assert (=> start!65292 m!689963))

(assert (=> b!737430 m!689917))

(assert (=> b!737430 m!689917))

(assert (=> b!737430 m!689947))

(assert (=> b!737444 m!689917))

(assert (=> b!737444 m!689917))

(declare-fun m!689965 () Bool)

(assert (=> b!737444 m!689965))

(check-sat (not b!737445) (not b!737441) (not b!737451) (not b!737449) (not b!737450) (not start!65292) (not b!737431) (not b!737438) (not b!737442) (not b!737443) (not b!737436) (not b!737448) (not b!737444) (not b!737452) (not b!737440) (not b!737430) (not b!737433) (not b!737446) (not b!737434) (not b!737439))
(check-sat)
