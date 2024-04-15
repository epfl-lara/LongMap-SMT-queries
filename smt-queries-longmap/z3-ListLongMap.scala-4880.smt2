; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67238 () Bool)

(assert start!67238)

(declare-fun b!777470 () Bool)

(declare-fun e!432576 () Bool)

(declare-fun e!432578 () Bool)

(assert (=> b!777470 (= e!432576 e!432578)))

(declare-fun res!526027 () Bool)

(assert (=> b!777470 (=> (not res!526027) (not e!432578))))

(declare-datatypes ((array!42549 0))(
  ( (array!42550 (arr!20369 (Array (_ BitVec 32) (_ BitVec 64))) (size!20790 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42549)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7966 0))(
  ( (MissingZero!7966 (index!34232 (_ BitVec 32))) (Found!7966 (index!34233 (_ BitVec 32))) (Intermediate!7966 (undefined!8778 Bool) (index!34234 (_ BitVec 32)) (x!65185 (_ BitVec 32))) (Undefined!7966) (MissingVacant!7966 (index!34235 (_ BitVec 32))) )
))
(declare-fun lt!346255 () SeekEntryResult!7966)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42549 (_ BitVec 32)) SeekEntryResult!7966)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777470 (= res!526027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20369 a!3186) j!159) mask!3328) (select (arr!20369 a!3186) j!159) a!3186 mask!3328) lt!346255))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777470 (= lt!346255 (Intermediate!7966 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777471 () Bool)

(declare-fun res!526023 () Bool)

(declare-fun e!432582 () Bool)

(assert (=> b!777471 (=> res!526023 e!432582)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!346254 () (_ BitVec 64))

(declare-fun lt!346251 () SeekEntryResult!7966)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!777471 (= res!526023 (or (not (= (select (store (arr!20369 a!3186) i!1173 k0!2102) index!1321) lt!346254)) (undefined!8778 lt!346251)))))

(declare-fun b!777472 () Bool)

(declare-fun e!432579 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!777472 (= e!432579 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) lt!346255))))

(declare-fun b!777473 () Bool)

(declare-fun res!526029 () Bool)

(declare-fun e!432583 () Bool)

(assert (=> b!777473 (=> (not res!526029) (not e!432583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777473 (= res!526029 (validKeyInArray!0 k0!2102))))

(declare-fun b!777474 () Bool)

(declare-fun e!432580 () Bool)

(assert (=> b!777474 (= e!432580 (not e!432582))))

(declare-fun res!526012 () Bool)

(assert (=> b!777474 (=> res!526012 e!432582)))

(get-info :version)

(assert (=> b!777474 (= res!526012 (or (not ((_ is Intermediate!7966) lt!346251)) (bvslt x!1131 (x!65185 lt!346251)) (not (= x!1131 (x!65185 lt!346251))) (not (= index!1321 (index!34234 lt!346251)))))))

(declare-fun e!432577 () Bool)

(assert (=> b!777474 e!432577))

(declare-fun res!526028 () Bool)

(assert (=> b!777474 (=> (not res!526028) (not e!432577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42549 (_ BitVec 32)) Bool)

(assert (=> b!777474 (= res!526028 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26798 0))(
  ( (Unit!26799) )
))
(declare-fun lt!346256 () Unit!26798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26798)

(assert (=> b!777474 (= lt!346256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777475 () Bool)

(declare-fun res!526020 () Bool)

(assert (=> b!777475 (=> res!526020 e!432582)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42549 (_ BitVec 32)) SeekEntryResult!7966)

(assert (=> b!777475 (= res!526020 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) (Found!7966 j!159))))))

(declare-fun b!777476 () Bool)

(declare-fun res!526016 () Bool)

(assert (=> b!777476 (=> (not res!526016) (not e!432578))))

(assert (=> b!777476 (= res!526016 e!432579)))

(declare-fun c!86130 () Bool)

(assert (=> b!777476 (= c!86130 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777477 () Bool)

(declare-fun res!526021 () Bool)

(assert (=> b!777477 (=> (not res!526021) (not e!432578))))

(assert (=> b!777477 (= res!526021 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20369 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777478 () Bool)

(assert (=> b!777478 (= e!432578 e!432580)))

(declare-fun res!526025 () Bool)

(assert (=> b!777478 (=> (not res!526025) (not e!432580))))

(declare-fun lt!346253 () SeekEntryResult!7966)

(assert (=> b!777478 (= res!526025 (= lt!346253 lt!346251))))

(declare-fun lt!346250 () array!42549)

(assert (=> b!777478 (= lt!346251 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346254 lt!346250 mask!3328))))

(assert (=> b!777478 (= lt!346253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346254 mask!3328) lt!346254 lt!346250 mask!3328))))

(assert (=> b!777478 (= lt!346254 (select (store (arr!20369 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777478 (= lt!346250 (array!42550 (store (arr!20369 a!3186) i!1173 k0!2102) (size!20790 a!3186)))))

(declare-fun b!777479 () Bool)

(declare-fun res!526014 () Bool)

(assert (=> b!777479 (=> (not res!526014) (not e!432583))))

(assert (=> b!777479 (= res!526014 (and (= (size!20790 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20790 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20790 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777480 () Bool)

(declare-fun res!526017 () Bool)

(assert (=> b!777480 (=> (not res!526017) (not e!432583))))

(declare-fun arrayContainsKey!0 (array!42549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777480 (= res!526017 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777481 () Bool)

(assert (=> b!777481 (= e!432583 e!432576)))

(declare-fun res!526015 () Bool)

(assert (=> b!777481 (=> (not res!526015) (not e!432576))))

(declare-fun lt!346248 () SeekEntryResult!7966)

(assert (=> b!777481 (= res!526015 (or (= lt!346248 (MissingZero!7966 i!1173)) (= lt!346248 (MissingVacant!7966 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42549 (_ BitVec 32)) SeekEntryResult!7966)

(assert (=> b!777481 (= lt!346248 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777482 () Bool)

(assert (=> b!777482 (= e!432582 true)))

(declare-fun lt!346249 () SeekEntryResult!7966)

(assert (=> b!777482 (= lt!346249 (seekEntryOrOpen!0 lt!346254 lt!346250 mask!3328))))

(declare-fun b!777469 () Bool)

(declare-fun e!432575 () Bool)

(declare-fun lt!346252 () SeekEntryResult!7966)

(assert (=> b!777469 (= e!432575 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) lt!346252))))

(declare-fun res!526022 () Bool)

(assert (=> start!67238 (=> (not res!526022) (not e!432583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67238 (= res!526022 (validMask!0 mask!3328))))

(assert (=> start!67238 e!432583))

(assert (=> start!67238 true))

(declare-fun array_inv!16252 (array!42549) Bool)

(assert (=> start!67238 (array_inv!16252 a!3186)))

(declare-fun b!777483 () Bool)

(assert (=> b!777483 (= e!432577 e!432575)))

(declare-fun res!526019 () Bool)

(assert (=> b!777483 (=> (not res!526019) (not e!432575))))

(assert (=> b!777483 (= res!526019 (= (seekEntryOrOpen!0 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) lt!346252))))

(assert (=> b!777483 (= lt!346252 (Found!7966 j!159))))

(declare-fun b!777484 () Bool)

(declare-fun res!526018 () Bool)

(assert (=> b!777484 (=> (not res!526018) (not e!432576))))

(declare-datatypes ((List!14410 0))(
  ( (Nil!14407) (Cons!14406 (h!15517 (_ BitVec 64)) (t!20716 List!14410)) )
))
(declare-fun arrayNoDuplicates!0 (array!42549 (_ BitVec 32) List!14410) Bool)

(assert (=> b!777484 (= res!526018 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14407))))

(declare-fun b!777485 () Bool)

(declare-fun res!526024 () Bool)

(assert (=> b!777485 (=> (not res!526024) (not e!432576))))

(assert (=> b!777485 (= res!526024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777486 () Bool)

(assert (=> b!777486 (= e!432579 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) (Found!7966 j!159)))))

(declare-fun b!777487 () Bool)

(declare-fun res!526013 () Bool)

(assert (=> b!777487 (=> (not res!526013) (not e!432583))))

(assert (=> b!777487 (= res!526013 (validKeyInArray!0 (select (arr!20369 a!3186) j!159)))))

(declare-fun b!777488 () Bool)

(declare-fun res!526026 () Bool)

(assert (=> b!777488 (=> (not res!526026) (not e!432576))))

(assert (=> b!777488 (= res!526026 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20790 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20790 a!3186))))))

(assert (= (and start!67238 res!526022) b!777479))

(assert (= (and b!777479 res!526014) b!777487))

(assert (= (and b!777487 res!526013) b!777473))

(assert (= (and b!777473 res!526029) b!777480))

(assert (= (and b!777480 res!526017) b!777481))

(assert (= (and b!777481 res!526015) b!777485))

(assert (= (and b!777485 res!526024) b!777484))

(assert (= (and b!777484 res!526018) b!777488))

(assert (= (and b!777488 res!526026) b!777470))

(assert (= (and b!777470 res!526027) b!777477))

(assert (= (and b!777477 res!526021) b!777476))

(assert (= (and b!777476 c!86130) b!777472))

(assert (= (and b!777476 (not c!86130)) b!777486))

(assert (= (and b!777476 res!526016) b!777478))

(assert (= (and b!777478 res!526025) b!777474))

(assert (= (and b!777474 res!526028) b!777483))

(assert (= (and b!777483 res!526019) b!777469))

(assert (= (and b!777474 (not res!526012)) b!777475))

(assert (= (and b!777475 (not res!526020)) b!777471))

(assert (= (and b!777471 (not res!526023)) b!777482))

(declare-fun m!720783 () Bool)

(assert (=> b!777475 m!720783))

(assert (=> b!777475 m!720783))

(declare-fun m!720785 () Bool)

(assert (=> b!777475 m!720785))

(declare-fun m!720787 () Bool)

(assert (=> b!777481 m!720787))

(declare-fun m!720789 () Bool)

(assert (=> b!777473 m!720789))

(declare-fun m!720791 () Bool)

(assert (=> b!777478 m!720791))

(declare-fun m!720793 () Bool)

(assert (=> b!777478 m!720793))

(declare-fun m!720795 () Bool)

(assert (=> b!777478 m!720795))

(assert (=> b!777478 m!720791))

(declare-fun m!720797 () Bool)

(assert (=> b!777478 m!720797))

(declare-fun m!720799 () Bool)

(assert (=> b!777478 m!720799))

(declare-fun m!720801 () Bool)

(assert (=> b!777484 m!720801))

(assert (=> b!777487 m!720783))

(assert (=> b!777487 m!720783))

(declare-fun m!720803 () Bool)

(assert (=> b!777487 m!720803))

(declare-fun m!720805 () Bool)

(assert (=> b!777477 m!720805))

(declare-fun m!720807 () Bool)

(assert (=> b!777480 m!720807))

(declare-fun m!720809 () Bool)

(assert (=> start!67238 m!720809))

(declare-fun m!720811 () Bool)

(assert (=> start!67238 m!720811))

(assert (=> b!777486 m!720783))

(assert (=> b!777486 m!720783))

(assert (=> b!777486 m!720785))

(assert (=> b!777470 m!720783))

(assert (=> b!777470 m!720783))

(declare-fun m!720813 () Bool)

(assert (=> b!777470 m!720813))

(assert (=> b!777470 m!720813))

(assert (=> b!777470 m!720783))

(declare-fun m!720815 () Bool)

(assert (=> b!777470 m!720815))

(assert (=> b!777471 m!720795))

(declare-fun m!720817 () Bool)

(assert (=> b!777471 m!720817))

(assert (=> b!777469 m!720783))

(assert (=> b!777469 m!720783))

(declare-fun m!720819 () Bool)

(assert (=> b!777469 m!720819))

(assert (=> b!777483 m!720783))

(assert (=> b!777483 m!720783))

(declare-fun m!720821 () Bool)

(assert (=> b!777483 m!720821))

(declare-fun m!720823 () Bool)

(assert (=> b!777482 m!720823))

(assert (=> b!777472 m!720783))

(assert (=> b!777472 m!720783))

(declare-fun m!720825 () Bool)

(assert (=> b!777472 m!720825))

(declare-fun m!720827 () Bool)

(assert (=> b!777474 m!720827))

(declare-fun m!720829 () Bool)

(assert (=> b!777474 m!720829))

(declare-fun m!720831 () Bool)

(assert (=> b!777485 m!720831))

(check-sat (not b!777472) (not b!777485) (not b!777469) (not b!777487) (not b!777484) (not b!777475) (not b!777486) (not b!777474) (not start!67238) (not b!777483) (not b!777470) (not b!777480) (not b!777482) (not b!777473) (not b!777481) (not b!777478))
(check-sat)
