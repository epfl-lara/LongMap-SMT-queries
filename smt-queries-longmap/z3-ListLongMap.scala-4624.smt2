; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64380 () Bool)

(assert start!64380)

(declare-fun b!724089 () Bool)

(declare-fun e!405587 () Bool)

(declare-fun e!405586 () Bool)

(assert (=> b!724089 (= e!405587 e!405586)))

(declare-fun res!485585 () Bool)

(assert (=> b!724089 (=> (not res!485585) (not e!405586))))

(declare-datatypes ((array!40961 0))(
  ( (array!40962 (arr!19603 (Array (_ BitVec 32) (_ BitVec 64))) (size!20024 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40961)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7203 0))(
  ( (MissingZero!7203 (index!31180 (_ BitVec 32))) (Found!7203 (index!31181 (_ BitVec 32))) (Intermediate!7203 (undefined!8015 Bool) (index!31182 (_ BitVec 32)) (x!62172 (_ BitVec 32))) (Undefined!7203) (MissingVacant!7203 (index!31183 (_ BitVec 32))) )
))
(declare-fun lt!320877 () SeekEntryResult!7203)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40961 (_ BitVec 32)) SeekEntryResult!7203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724089 (= res!485585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19603 a!3186) j!159) mask!3328) (select (arr!19603 a!3186) j!159) a!3186 mask!3328) lt!320877))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724089 (= lt!320877 (Intermediate!7203 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724090 () Bool)

(declare-fun e!405581 () Bool)

(assert (=> b!724090 (= e!405586 e!405581)))

(declare-fun res!485588 () Bool)

(assert (=> b!724090 (=> (not res!485588) (not e!405581))))

(declare-fun lt!320878 () array!40961)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!320876 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!724090 (= res!485588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320876 mask!3328) lt!320876 lt!320878 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320876 lt!320878 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!724090 (= lt!320876 (select (store (arr!19603 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724090 (= lt!320878 (array!40962 (store (arr!19603 a!3186) i!1173 k0!2102) (size!20024 a!3186)))))

(declare-fun b!724091 () Bool)

(declare-fun e!405583 () Bool)

(assert (=> b!724091 (= e!405583 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19603 a!3186) j!159) a!3186 mask!3328) lt!320877))))

(declare-fun b!724092 () Bool)

(declare-fun res!485591 () Bool)

(declare-fun e!405582 () Bool)

(assert (=> b!724092 (=> (not res!485591) (not e!405582))))

(assert (=> b!724092 (= res!485591 (and (= (size!20024 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20024 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20024 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!485581 () Bool)

(assert (=> start!64380 (=> (not res!485581) (not e!405582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64380 (= res!485581 (validMask!0 mask!3328))))

(assert (=> start!64380 e!405582))

(assert (=> start!64380 true))

(declare-fun array_inv!15399 (array!40961) Bool)

(assert (=> start!64380 (array_inv!15399 a!3186)))

(declare-fun b!724093 () Bool)

(assert (=> b!724093 (= e!405581 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!405585 () Bool)

(assert (=> b!724093 e!405585))

(declare-fun res!485578 () Bool)

(assert (=> b!724093 (=> (not res!485578) (not e!405585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40961 (_ BitVec 32)) Bool)

(assert (=> b!724093 (= res!485578 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24724 0))(
  ( (Unit!24725) )
))
(declare-fun lt!320879 () Unit!24724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24724)

(assert (=> b!724093 (= lt!320879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724094 () Bool)

(assert (=> b!724094 (= e!405582 e!405587)))

(declare-fun res!485590 () Bool)

(assert (=> b!724094 (=> (not res!485590) (not e!405587))))

(declare-fun lt!320875 () SeekEntryResult!7203)

(assert (=> b!724094 (= res!485590 (or (= lt!320875 (MissingZero!7203 i!1173)) (= lt!320875 (MissingVacant!7203 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40961 (_ BitVec 32)) SeekEntryResult!7203)

(assert (=> b!724094 (= lt!320875 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!724095 () Bool)

(declare-fun res!485579 () Bool)

(assert (=> b!724095 (=> (not res!485579) (not e!405586))))

(assert (=> b!724095 (= res!485579 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19603 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724096 () Bool)

(declare-fun res!485582 () Bool)

(assert (=> b!724096 (=> (not res!485582) (not e!405586))))

(assert (=> b!724096 (= res!485582 e!405583)))

(declare-fun c!79627 () Bool)

(assert (=> b!724096 (= c!79627 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724097 () Bool)

(declare-fun res!485586 () Bool)

(assert (=> b!724097 (=> (not res!485586) (not e!405587))))

(declare-datatypes ((List!13605 0))(
  ( (Nil!13602) (Cons!13601 (h!14655 (_ BitVec 64)) (t!19920 List!13605)) )
))
(declare-fun arrayNoDuplicates!0 (array!40961 (_ BitVec 32) List!13605) Bool)

(assert (=> b!724097 (= res!485586 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13602))))

(declare-fun b!724098 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40961 (_ BitVec 32)) SeekEntryResult!7203)

(assert (=> b!724098 (= e!405583 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19603 a!3186) j!159) a!3186 mask!3328) (Found!7203 j!159)))))

(declare-fun b!724099 () Bool)

(declare-fun res!485589 () Bool)

(assert (=> b!724099 (=> (not res!485589) (not e!405587))))

(assert (=> b!724099 (= res!485589 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20024 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20024 a!3186))))))

(declare-fun b!724100 () Bool)

(declare-fun res!485587 () Bool)

(assert (=> b!724100 (=> (not res!485587) (not e!405582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724100 (= res!485587 (validKeyInArray!0 (select (arr!19603 a!3186) j!159)))))

(declare-fun b!724101 () Bool)

(assert (=> b!724101 (= e!405585 (= (seekEntryOrOpen!0 (select (arr!19603 a!3186) j!159) a!3186 mask!3328) (Found!7203 j!159)))))

(declare-fun b!724102 () Bool)

(declare-fun res!485583 () Bool)

(assert (=> b!724102 (=> (not res!485583) (not e!405582))))

(assert (=> b!724102 (= res!485583 (validKeyInArray!0 k0!2102))))

(declare-fun b!724103 () Bool)

(declare-fun res!485584 () Bool)

(assert (=> b!724103 (=> (not res!485584) (not e!405582))))

(declare-fun arrayContainsKey!0 (array!40961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724103 (= res!485584 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724104 () Bool)

(declare-fun res!485580 () Bool)

(assert (=> b!724104 (=> (not res!485580) (not e!405587))))

(assert (=> b!724104 (= res!485580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64380 res!485581) b!724092))

(assert (= (and b!724092 res!485591) b!724100))

(assert (= (and b!724100 res!485587) b!724102))

(assert (= (and b!724102 res!485583) b!724103))

(assert (= (and b!724103 res!485584) b!724094))

(assert (= (and b!724094 res!485590) b!724104))

(assert (= (and b!724104 res!485580) b!724097))

(assert (= (and b!724097 res!485586) b!724099))

(assert (= (and b!724099 res!485589) b!724089))

(assert (= (and b!724089 res!485585) b!724095))

(assert (= (and b!724095 res!485579) b!724096))

(assert (= (and b!724096 c!79627) b!724091))

(assert (= (and b!724096 (not c!79627)) b!724098))

(assert (= (and b!724096 res!485582) b!724090))

(assert (= (and b!724090 res!485588) b!724093))

(assert (= (and b!724093 res!485578) b!724101))

(declare-fun m!678477 () Bool)

(assert (=> b!724090 m!678477))

(declare-fun m!678479 () Bool)

(assert (=> b!724090 m!678479))

(declare-fun m!678481 () Bool)

(assert (=> b!724090 m!678481))

(declare-fun m!678483 () Bool)

(assert (=> b!724090 m!678483))

(declare-fun m!678485 () Bool)

(assert (=> b!724090 m!678485))

(assert (=> b!724090 m!678477))

(declare-fun m!678487 () Bool)

(assert (=> b!724097 m!678487))

(declare-fun m!678489 () Bool)

(assert (=> start!64380 m!678489))

(declare-fun m!678491 () Bool)

(assert (=> start!64380 m!678491))

(declare-fun m!678493 () Bool)

(assert (=> b!724102 m!678493))

(declare-fun m!678495 () Bool)

(assert (=> b!724098 m!678495))

(assert (=> b!724098 m!678495))

(declare-fun m!678497 () Bool)

(assert (=> b!724098 m!678497))

(declare-fun m!678499 () Bool)

(assert (=> b!724104 m!678499))

(declare-fun m!678501 () Bool)

(assert (=> b!724093 m!678501))

(declare-fun m!678503 () Bool)

(assert (=> b!724093 m!678503))

(assert (=> b!724091 m!678495))

(assert (=> b!724091 m!678495))

(declare-fun m!678505 () Bool)

(assert (=> b!724091 m!678505))

(assert (=> b!724101 m!678495))

(assert (=> b!724101 m!678495))

(declare-fun m!678507 () Bool)

(assert (=> b!724101 m!678507))

(declare-fun m!678509 () Bool)

(assert (=> b!724095 m!678509))

(assert (=> b!724089 m!678495))

(assert (=> b!724089 m!678495))

(declare-fun m!678511 () Bool)

(assert (=> b!724089 m!678511))

(assert (=> b!724089 m!678511))

(assert (=> b!724089 m!678495))

(declare-fun m!678513 () Bool)

(assert (=> b!724089 m!678513))

(declare-fun m!678515 () Bool)

(assert (=> b!724103 m!678515))

(declare-fun m!678517 () Bool)

(assert (=> b!724094 m!678517))

(assert (=> b!724100 m!678495))

(assert (=> b!724100 m!678495))

(declare-fun m!678519 () Bool)

(assert (=> b!724100 m!678519))

(check-sat (not b!724103) (not b!724094) (not b!724104) (not b!724102) (not b!724101) (not b!724093) (not start!64380) (not b!724089) (not b!724097) (not b!724100) (not b!724098) (not b!724091) (not b!724090))
(check-sat)
