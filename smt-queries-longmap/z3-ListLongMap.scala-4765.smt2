; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65630 () Bool)

(assert start!65630)

(declare-fun b!751588 () Bool)

(declare-fun res!507541 () Bool)

(declare-fun e!419243 () Bool)

(assert (=> b!751588 (=> (not res!507541) (not e!419243))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41820 0))(
  ( (array!41821 (arr!20024 (Array (_ BitVec 32) (_ BitVec 64))) (size!20445 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41820)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!751588 (= res!507541 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20445 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20445 a!3186))))))

(declare-fun b!751589 () Bool)

(declare-fun e!419244 () Bool)

(declare-fun e!419240 () Bool)

(assert (=> b!751589 (= e!419244 e!419240)))

(declare-fun res!507540 () Bool)

(assert (=> b!751589 (=> res!507540 e!419240)))

(declare-fun lt!334146 () (_ BitVec 64))

(declare-fun lt!334148 () (_ BitVec 64))

(assert (=> b!751589 (= res!507540 (= lt!334146 lt!334148))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!751589 (= lt!334146 (select (store (arr!20024 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751590 () Bool)

(declare-fun res!507532 () Bool)

(declare-fun e!419251 () Bool)

(assert (=> b!751590 (=> (not res!507532) (not e!419251))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751590 (= res!507532 (validKeyInArray!0 (select (arr!20024 a!3186) j!159)))))

(declare-fun b!751591 () Bool)

(declare-fun res!507535 () Bool)

(assert (=> b!751591 (=> (not res!507535) (not e!419243))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41820 (_ BitVec 32)) Bool)

(assert (=> b!751591 (= res!507535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751592 () Bool)

(declare-datatypes ((Unit!25844 0))(
  ( (Unit!25845) )
))
(declare-fun e!419248 () Unit!25844)

(declare-fun Unit!25846 () Unit!25844)

(assert (=> b!751592 (= e!419248 Unit!25846)))

(declare-fun b!751593 () Bool)

(declare-fun e!419249 () Bool)

(declare-datatypes ((SeekEntryResult!7621 0))(
  ( (MissingZero!7621 (index!32852 (_ BitVec 32))) (Found!7621 (index!32853 (_ BitVec 32))) (Intermediate!7621 (undefined!8433 Bool) (index!32854 (_ BitVec 32)) (x!63782 (_ BitVec 32))) (Undefined!7621) (MissingVacant!7621 (index!32855 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41820 (_ BitVec 32)) SeekEntryResult!7621)

(assert (=> b!751593 (= e!419249 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20024 a!3186) j!159) a!3186 mask!3328) (Found!7621 j!159)))))

(declare-fun lt!334151 () SeekEntryResult!7621)

(declare-fun b!751595 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41820 (_ BitVec 32)) SeekEntryResult!7621)

(assert (=> b!751595 (= e!419249 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20024 a!3186) j!159) a!3186 mask!3328) lt!334151))))

(declare-fun b!751596 () Bool)

(declare-fun res!507534 () Bool)

(assert (=> b!751596 (=> (not res!507534) (not e!419243))))

(declare-datatypes ((List!14065 0))(
  ( (Nil!14062) (Cons!14061 (h!15133 (_ BitVec 64)) (t!20371 List!14065)) )
))
(declare-fun arrayNoDuplicates!0 (array!41820 (_ BitVec 32) List!14065) Bool)

(assert (=> b!751596 (= res!507534 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14062))))

(declare-fun e!419242 () Bool)

(declare-fun b!751597 () Bool)

(declare-fun lt!334156 () SeekEntryResult!7621)

(assert (=> b!751597 (= e!419242 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20024 a!3186) j!159) a!3186 mask!3328) lt!334156))))

(declare-fun b!751598 () Bool)

(assert (=> b!751598 (= e!419251 e!419243)))

(declare-fun res!507544 () Bool)

(assert (=> b!751598 (=> (not res!507544) (not e!419243))))

(declare-fun lt!334155 () SeekEntryResult!7621)

(assert (=> b!751598 (= res!507544 (or (= lt!334155 (MissingZero!7621 i!1173)) (= lt!334155 (MissingVacant!7621 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41820 (_ BitVec 32)) SeekEntryResult!7621)

(assert (=> b!751598 (= lt!334155 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751599 () Bool)

(declare-fun res!507545 () Bool)

(assert (=> b!751599 (=> (not res!507545) (not e!419251))))

(assert (=> b!751599 (= res!507545 (validKeyInArray!0 k0!2102))))

(declare-fun res!507539 () Bool)

(assert (=> start!65630 (=> (not res!507539) (not e!419251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65630 (= res!507539 (validMask!0 mask!3328))))

(assert (=> start!65630 e!419251))

(assert (=> start!65630 true))

(declare-fun array_inv!15907 (array!41820) Bool)

(assert (=> start!65630 (array_inv!15907 a!3186)))

(declare-fun b!751594 () Bool)

(declare-fun res!507542 () Bool)

(assert (=> b!751594 (=> (not res!507542) (not e!419251))))

(declare-fun arrayContainsKey!0 (array!41820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751594 (= res!507542 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751600 () Bool)

(declare-fun e!419241 () Bool)

(declare-fun lt!334154 () SeekEntryResult!7621)

(declare-fun lt!334153 () SeekEntryResult!7621)

(assert (=> b!751600 (= e!419241 (= lt!334154 lt!334153))))

(declare-fun b!751601 () Bool)

(declare-fun res!507538 () Bool)

(declare-fun e!419245 () Bool)

(assert (=> b!751601 (=> (not res!507538) (not e!419245))))

(assert (=> b!751601 (= res!507538 e!419249)))

(declare-fun c!82409 () Bool)

(assert (=> b!751601 (= c!82409 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751602 () Bool)

(declare-fun e!419246 () Bool)

(declare-fun e!419250 () Bool)

(assert (=> b!751602 (= e!419246 (not e!419250))))

(declare-fun res!507547 () Bool)

(assert (=> b!751602 (=> res!507547 e!419250)))

(declare-fun lt!334147 () SeekEntryResult!7621)

(get-info :version)

(assert (=> b!751602 (= res!507547 (or (not ((_ is Intermediate!7621) lt!334147)) (bvslt x!1131 (x!63782 lt!334147)) (not (= x!1131 (x!63782 lt!334147))) (not (= index!1321 (index!32854 lt!334147)))))))

(assert (=> b!751602 e!419242))

(declare-fun res!507549 () Bool)

(assert (=> b!751602 (=> (not res!507549) (not e!419242))))

(assert (=> b!751602 (= res!507549 (= lt!334154 lt!334156))))

(assert (=> b!751602 (= lt!334156 (Found!7621 j!159))))

(assert (=> b!751602 (= lt!334154 (seekEntryOrOpen!0 (select (arr!20024 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751602 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334157 () Unit!25844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25844)

(assert (=> b!751602 (= lt!334157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751603 () Bool)

(assert (=> b!751603 (= e!419240 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!751603 e!419241))

(declare-fun res!507533 () Bool)

(assert (=> b!751603 (=> (not res!507533) (not e!419241))))

(assert (=> b!751603 (= res!507533 (= lt!334146 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334152 () Unit!25844)

(assert (=> b!751603 (= lt!334152 e!419248)))

(declare-fun c!82410 () Bool)

(assert (=> b!751603 (= c!82410 (= lt!334146 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751604 () Bool)

(assert (=> b!751604 (= e!419245 e!419246)))

(declare-fun res!507531 () Bool)

(assert (=> b!751604 (=> (not res!507531) (not e!419246))))

(declare-fun lt!334149 () SeekEntryResult!7621)

(assert (=> b!751604 (= res!507531 (= lt!334149 lt!334147))))

(declare-fun lt!334150 () array!41820)

(assert (=> b!751604 (= lt!334147 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334148 lt!334150 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751604 (= lt!334149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334148 mask!3328) lt!334148 lt!334150 mask!3328))))

(assert (=> b!751604 (= lt!334148 (select (store (arr!20024 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751604 (= lt!334150 (array!41821 (store (arr!20024 a!3186) i!1173 k0!2102) (size!20445 a!3186)))))

(declare-fun b!751605 () Bool)

(assert (=> b!751605 (= e!419250 e!419244)))

(declare-fun res!507548 () Bool)

(assert (=> b!751605 (=> res!507548 e!419244)))

(assert (=> b!751605 (= res!507548 (not (= lt!334153 lt!334156)))))

(assert (=> b!751605 (= lt!334153 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20024 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751606 () Bool)

(declare-fun res!507536 () Bool)

(assert (=> b!751606 (=> (not res!507536) (not e!419241))))

(assert (=> b!751606 (= res!507536 (= (seekEntryOrOpen!0 lt!334148 lt!334150 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334148 lt!334150 mask!3328)))))

(declare-fun b!751607 () Bool)

(declare-fun res!507537 () Bool)

(assert (=> b!751607 (=> (not res!507537) (not e!419245))))

(assert (=> b!751607 (= res!507537 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20024 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751608 () Bool)

(assert (=> b!751608 (= e!419243 e!419245)))

(declare-fun res!507543 () Bool)

(assert (=> b!751608 (=> (not res!507543) (not e!419245))))

(assert (=> b!751608 (= res!507543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20024 a!3186) j!159) mask!3328) (select (arr!20024 a!3186) j!159) a!3186 mask!3328) lt!334151))))

(assert (=> b!751608 (= lt!334151 (Intermediate!7621 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751609 () Bool)

(declare-fun res!507546 () Bool)

(assert (=> b!751609 (=> (not res!507546) (not e!419251))))

(assert (=> b!751609 (= res!507546 (and (= (size!20445 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20445 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20445 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751610 () Bool)

(declare-fun Unit!25847 () Unit!25844)

(assert (=> b!751610 (= e!419248 Unit!25847)))

(assert (=> b!751610 false))

(assert (= (and start!65630 res!507539) b!751609))

(assert (= (and b!751609 res!507546) b!751590))

(assert (= (and b!751590 res!507532) b!751599))

(assert (= (and b!751599 res!507545) b!751594))

(assert (= (and b!751594 res!507542) b!751598))

(assert (= (and b!751598 res!507544) b!751591))

(assert (= (and b!751591 res!507535) b!751596))

(assert (= (and b!751596 res!507534) b!751588))

(assert (= (and b!751588 res!507541) b!751608))

(assert (= (and b!751608 res!507543) b!751607))

(assert (= (and b!751607 res!507537) b!751601))

(assert (= (and b!751601 c!82409) b!751595))

(assert (= (and b!751601 (not c!82409)) b!751593))

(assert (= (and b!751601 res!507538) b!751604))

(assert (= (and b!751604 res!507531) b!751602))

(assert (= (and b!751602 res!507549) b!751597))

(assert (= (and b!751602 (not res!507547)) b!751605))

(assert (= (and b!751605 (not res!507548)) b!751589))

(assert (= (and b!751589 (not res!507540)) b!751603))

(assert (= (and b!751603 c!82410) b!751610))

(assert (= (and b!751603 (not c!82410)) b!751592))

(assert (= (and b!751603 res!507533) b!751606))

(assert (= (and b!751606 res!507536) b!751600))

(declare-fun m!700169 () Bool)

(assert (=> b!751602 m!700169))

(assert (=> b!751602 m!700169))

(declare-fun m!700171 () Bool)

(assert (=> b!751602 m!700171))

(declare-fun m!700173 () Bool)

(assert (=> b!751602 m!700173))

(declare-fun m!700175 () Bool)

(assert (=> b!751602 m!700175))

(declare-fun m!700177 () Bool)

(assert (=> b!751591 m!700177))

(assert (=> b!751595 m!700169))

(assert (=> b!751595 m!700169))

(declare-fun m!700179 () Bool)

(assert (=> b!751595 m!700179))

(assert (=> b!751605 m!700169))

(assert (=> b!751605 m!700169))

(declare-fun m!700181 () Bool)

(assert (=> b!751605 m!700181))

(declare-fun m!700183 () Bool)

(assert (=> b!751606 m!700183))

(declare-fun m!700185 () Bool)

(assert (=> b!751606 m!700185))

(assert (=> b!751608 m!700169))

(assert (=> b!751608 m!700169))

(declare-fun m!700187 () Bool)

(assert (=> b!751608 m!700187))

(assert (=> b!751608 m!700187))

(assert (=> b!751608 m!700169))

(declare-fun m!700189 () Bool)

(assert (=> b!751608 m!700189))

(declare-fun m!700191 () Bool)

(assert (=> b!751596 m!700191))

(assert (=> b!751593 m!700169))

(assert (=> b!751593 m!700169))

(assert (=> b!751593 m!700181))

(declare-fun m!700193 () Bool)

(assert (=> b!751594 m!700193))

(assert (=> b!751597 m!700169))

(assert (=> b!751597 m!700169))

(declare-fun m!700195 () Bool)

(assert (=> b!751597 m!700195))

(declare-fun m!700197 () Bool)

(assert (=> b!751604 m!700197))

(declare-fun m!700199 () Bool)

(assert (=> b!751604 m!700199))

(declare-fun m!700201 () Bool)

(assert (=> b!751604 m!700201))

(assert (=> b!751604 m!700197))

(declare-fun m!700203 () Bool)

(assert (=> b!751604 m!700203))

(declare-fun m!700205 () Bool)

(assert (=> b!751604 m!700205))

(declare-fun m!700207 () Bool)

(assert (=> b!751598 m!700207))

(assert (=> b!751589 m!700199))

(declare-fun m!700209 () Bool)

(assert (=> b!751589 m!700209))

(declare-fun m!700211 () Bool)

(assert (=> b!751607 m!700211))

(declare-fun m!700213 () Bool)

(assert (=> b!751599 m!700213))

(assert (=> b!751590 m!700169))

(assert (=> b!751590 m!700169))

(declare-fun m!700215 () Bool)

(assert (=> b!751590 m!700215))

(declare-fun m!700217 () Bool)

(assert (=> start!65630 m!700217))

(declare-fun m!700219 () Bool)

(assert (=> start!65630 m!700219))

(check-sat (not b!751602) (not b!751595) (not b!751591) (not b!751593) (not b!751604) (not b!751598) (not b!751597) (not b!751590) (not b!751596) (not b!751606) (not b!751594) (not start!65630) (not b!751605) (not b!751599) (not b!751608))
(check-sat)
