; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64634 () Bool)

(assert start!64634)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41100 0))(
  ( (array!41101 (arr!19670 (Array (_ BitVec 32) (_ BitVec 64))) (size!20091 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41100)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!407598 () Bool)

(declare-fun b!728166 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7267 0))(
  ( (MissingZero!7267 (index!31436 (_ BitVec 32))) (Found!7267 (index!31437 (_ BitVec 32))) (Intermediate!7267 (undefined!8079 Bool) (index!31438 (_ BitVec 32)) (x!62436 (_ BitVec 32))) (Undefined!7267) (MissingVacant!7267 (index!31439 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41100 (_ BitVec 32)) SeekEntryResult!7267)

(assert (=> b!728166 (= e!407598 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19670 a!3186) j!159) a!3186 mask!3328) (Found!7267 j!159)))))

(declare-fun b!728167 () Bool)

(declare-fun res!488832 () Bool)

(declare-fun e!407599 () Bool)

(assert (=> b!728167 (=> (not res!488832) (not e!407599))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728167 (= res!488832 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728168 () Bool)

(declare-fun e!407602 () Bool)

(declare-fun e!407601 () Bool)

(assert (=> b!728168 (= e!407602 e!407601)))

(declare-fun res!488830 () Bool)

(assert (=> b!728168 (=> (not res!488830) (not e!407601))))

(declare-fun lt!322413 () SeekEntryResult!7267)

(declare-fun lt!322411 () SeekEntryResult!7267)

(assert (=> b!728168 (= res!488830 (= lt!322413 lt!322411))))

(declare-fun lt!322410 () array!41100)

(declare-fun lt!322418 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41100 (_ BitVec 32)) SeekEntryResult!7267)

(assert (=> b!728168 (= lt!322411 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322418 lt!322410 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728168 (= lt!322413 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322418 mask!3328) lt!322418 lt!322410 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728168 (= lt!322418 (select (store (arr!19670 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728168 (= lt!322410 (array!41101 (store (arr!19670 a!3186) i!1173 k0!2102) (size!20091 a!3186)))))

(declare-fun b!728169 () Bool)

(declare-fun res!488837 () Bool)

(assert (=> b!728169 (=> (not res!488837) (not e!407602))))

(assert (=> b!728169 (= res!488837 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19670 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728170 () Bool)

(declare-fun e!407605 () Bool)

(declare-fun e!407603 () Bool)

(assert (=> b!728170 (= e!407605 e!407603)))

(declare-fun res!488835 () Bool)

(assert (=> b!728170 (=> (not res!488835) (not e!407603))))

(declare-fun lt!322412 () SeekEntryResult!7267)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41100 (_ BitVec 32)) SeekEntryResult!7267)

(assert (=> b!728170 (= res!488835 (= (seekEntryOrOpen!0 (select (arr!19670 a!3186) j!159) a!3186 mask!3328) lt!322412))))

(assert (=> b!728170 (= lt!322412 (Found!7267 j!159))))

(declare-fun b!728171 () Bool)

(declare-fun lt!322417 () SeekEntryResult!7267)

(assert (=> b!728171 (= e!407598 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19670 a!3186) j!159) a!3186 mask!3328) lt!322417))))

(declare-fun res!488824 () Bool)

(assert (=> start!64634 (=> (not res!488824) (not e!407599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64634 (= res!488824 (validMask!0 mask!3328))))

(assert (=> start!64634 e!407599))

(assert (=> start!64634 true))

(declare-fun array_inv!15553 (array!41100) Bool)

(assert (=> start!64634 (array_inv!15553 a!3186)))

(declare-fun b!728172 () Bool)

(declare-fun res!488827 () Bool)

(assert (=> b!728172 (=> (not res!488827) (not e!407602))))

(assert (=> b!728172 (= res!488827 e!407598)))

(declare-fun c!80046 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728172 (= c!80046 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728173 () Bool)

(declare-fun res!488828 () Bool)

(assert (=> b!728173 (=> (not res!488828) (not e!407599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728173 (= res!488828 (validKeyInArray!0 k0!2102))))

(declare-fun b!728174 () Bool)

(declare-fun e!407604 () Bool)

(assert (=> b!728174 (= e!407599 e!407604)))

(declare-fun res!488831 () Bool)

(assert (=> b!728174 (=> (not res!488831) (not e!407604))))

(declare-fun lt!322414 () SeekEntryResult!7267)

(assert (=> b!728174 (= res!488831 (or (= lt!322414 (MissingZero!7267 i!1173)) (= lt!322414 (MissingVacant!7267 i!1173))))))

(assert (=> b!728174 (= lt!322414 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728175 () Bool)

(declare-fun e!407600 () Bool)

(assert (=> b!728175 (= e!407600 true)))

(declare-fun lt!322415 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728175 (= lt!322415 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728176 () Bool)

(assert (=> b!728176 (= e!407601 (not e!407600))))

(declare-fun res!488833 () Bool)

(assert (=> b!728176 (=> res!488833 e!407600)))

(get-info :version)

(assert (=> b!728176 (= res!488833 (or (not ((_ is Intermediate!7267) lt!322411)) (bvsge x!1131 (x!62436 lt!322411))))))

(assert (=> b!728176 e!407605))

(declare-fun res!488836 () Bool)

(assert (=> b!728176 (=> (not res!488836) (not e!407605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41100 (_ BitVec 32)) Bool)

(assert (=> b!728176 (= res!488836 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24824 0))(
  ( (Unit!24825) )
))
(declare-fun lt!322416 () Unit!24824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24824)

(assert (=> b!728176 (= lt!322416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728177 () Bool)

(declare-fun res!488823 () Bool)

(assert (=> b!728177 (=> (not res!488823) (not e!407604))))

(assert (=> b!728177 (= res!488823 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20091 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20091 a!3186))))))

(declare-fun b!728178 () Bool)

(declare-fun res!488834 () Bool)

(assert (=> b!728178 (=> (not res!488834) (not e!407599))))

(assert (=> b!728178 (= res!488834 (validKeyInArray!0 (select (arr!19670 a!3186) j!159)))))

(declare-fun b!728179 () Bool)

(declare-fun res!488838 () Bool)

(assert (=> b!728179 (=> (not res!488838) (not e!407604))))

(declare-datatypes ((List!13711 0))(
  ( (Nil!13708) (Cons!13707 (h!14767 (_ BitVec 64)) (t!20017 List!13711)) )
))
(declare-fun arrayNoDuplicates!0 (array!41100 (_ BitVec 32) List!13711) Bool)

(assert (=> b!728179 (= res!488838 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13708))))

(declare-fun b!728180 () Bool)

(assert (=> b!728180 (= e!407604 e!407602)))

(declare-fun res!488825 () Bool)

(assert (=> b!728180 (=> (not res!488825) (not e!407602))))

(assert (=> b!728180 (= res!488825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19670 a!3186) j!159) mask!3328) (select (arr!19670 a!3186) j!159) a!3186 mask!3328) lt!322417))))

(assert (=> b!728180 (= lt!322417 (Intermediate!7267 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728181 () Bool)

(declare-fun res!488826 () Bool)

(assert (=> b!728181 (=> (not res!488826) (not e!407604))))

(assert (=> b!728181 (= res!488826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728182 () Bool)

(declare-fun res!488829 () Bool)

(assert (=> b!728182 (=> (not res!488829) (not e!407599))))

(assert (=> b!728182 (= res!488829 (and (= (size!20091 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20091 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20091 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728183 () Bool)

(assert (=> b!728183 (= e!407603 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19670 a!3186) j!159) a!3186 mask!3328) lt!322412))))

(assert (= (and start!64634 res!488824) b!728182))

(assert (= (and b!728182 res!488829) b!728178))

(assert (= (and b!728178 res!488834) b!728173))

(assert (= (and b!728173 res!488828) b!728167))

(assert (= (and b!728167 res!488832) b!728174))

(assert (= (and b!728174 res!488831) b!728181))

(assert (= (and b!728181 res!488826) b!728179))

(assert (= (and b!728179 res!488838) b!728177))

(assert (= (and b!728177 res!488823) b!728180))

(assert (= (and b!728180 res!488825) b!728169))

(assert (= (and b!728169 res!488837) b!728172))

(assert (= (and b!728172 c!80046) b!728171))

(assert (= (and b!728172 (not c!80046)) b!728166))

(assert (= (and b!728172 res!488827) b!728168))

(assert (= (and b!728168 res!488830) b!728176))

(assert (= (and b!728176 res!488836) b!728170))

(assert (= (and b!728170 res!488835) b!728183))

(assert (= (and b!728176 (not res!488833)) b!728175))

(declare-fun m!681413 () Bool)

(assert (=> b!728183 m!681413))

(assert (=> b!728183 m!681413))

(declare-fun m!681415 () Bool)

(assert (=> b!728183 m!681415))

(declare-fun m!681417 () Bool)

(assert (=> b!728169 m!681417))

(declare-fun m!681419 () Bool)

(assert (=> b!728167 m!681419))

(declare-fun m!681421 () Bool)

(assert (=> b!728179 m!681421))

(declare-fun m!681423 () Bool)

(assert (=> b!728175 m!681423))

(assert (=> b!728178 m!681413))

(assert (=> b!728178 m!681413))

(declare-fun m!681425 () Bool)

(assert (=> b!728178 m!681425))

(declare-fun m!681427 () Bool)

(assert (=> b!728181 m!681427))

(declare-fun m!681429 () Bool)

(assert (=> b!728173 m!681429))

(declare-fun m!681431 () Bool)

(assert (=> b!728168 m!681431))

(declare-fun m!681433 () Bool)

(assert (=> b!728168 m!681433))

(declare-fun m!681435 () Bool)

(assert (=> b!728168 m!681435))

(declare-fun m!681437 () Bool)

(assert (=> b!728168 m!681437))

(assert (=> b!728168 m!681437))

(declare-fun m!681439 () Bool)

(assert (=> b!728168 m!681439))

(declare-fun m!681441 () Bool)

(assert (=> start!64634 m!681441))

(declare-fun m!681443 () Bool)

(assert (=> start!64634 m!681443))

(assert (=> b!728171 m!681413))

(assert (=> b!728171 m!681413))

(declare-fun m!681445 () Bool)

(assert (=> b!728171 m!681445))

(declare-fun m!681447 () Bool)

(assert (=> b!728174 m!681447))

(assert (=> b!728180 m!681413))

(assert (=> b!728180 m!681413))

(declare-fun m!681449 () Bool)

(assert (=> b!728180 m!681449))

(assert (=> b!728180 m!681449))

(assert (=> b!728180 m!681413))

(declare-fun m!681451 () Bool)

(assert (=> b!728180 m!681451))

(assert (=> b!728166 m!681413))

(assert (=> b!728166 m!681413))

(declare-fun m!681453 () Bool)

(assert (=> b!728166 m!681453))

(declare-fun m!681455 () Bool)

(assert (=> b!728176 m!681455))

(declare-fun m!681457 () Bool)

(assert (=> b!728176 m!681457))

(assert (=> b!728170 m!681413))

(assert (=> b!728170 m!681413))

(declare-fun m!681459 () Bool)

(assert (=> b!728170 m!681459))

(check-sat (not b!728170) (not b!728180) (not b!728183) (not b!728175) (not b!728174) (not b!728178) (not b!728171) (not b!728167) (not start!64634) (not b!728176) (not b!728168) (not b!728181) (not b!728173) (not b!728166) (not b!728179))
(check-sat)
