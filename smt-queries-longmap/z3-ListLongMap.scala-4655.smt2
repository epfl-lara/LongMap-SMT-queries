; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64682 () Bool)

(assert start!64682)

(declare-fun b!729462 () Bool)

(declare-fun e!408250 () Bool)

(declare-fun e!408245 () Bool)

(assert (=> b!729462 (= e!408250 e!408245)))

(declare-fun res!489989 () Bool)

(assert (=> b!729462 (=> (not res!489989) (not e!408245))))

(declare-datatypes ((SeekEntryResult!7291 0))(
  ( (MissingZero!7291 (index!31532 (_ BitVec 32))) (Found!7291 (index!31533 (_ BitVec 32))) (Intermediate!7291 (undefined!8103 Bool) (index!31534 (_ BitVec 32)) (x!62524 (_ BitVec 32))) (Undefined!7291) (MissingVacant!7291 (index!31535 (_ BitVec 32))) )
))
(declare-fun lt!323066 () SeekEntryResult!7291)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729462 (= res!489989 (or (= lt!323066 (MissingZero!7291 i!1173)) (= lt!323066 (MissingVacant!7291 i!1173))))))

(declare-datatypes ((array!41148 0))(
  ( (array!41149 (arr!19694 (Array (_ BitVec 32) (_ BitVec 64))) (size!20115 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41148)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41148 (_ BitVec 32)) SeekEntryResult!7291)

(assert (=> b!729462 (= lt!323066 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729463 () Bool)

(declare-fun res!489979 () Bool)

(assert (=> b!729463 (=> (not res!489979) (not e!408250))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729463 (= res!489979 (validKeyInArray!0 (select (arr!19694 a!3186) j!159)))))

(declare-fun b!729464 () Bool)

(declare-fun e!408247 () Bool)

(assert (=> b!729464 (= e!408245 e!408247)))

(declare-fun res!489977 () Bool)

(assert (=> b!729464 (=> (not res!489977) (not e!408247))))

(declare-fun lt!323059 () SeekEntryResult!7291)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41148 (_ BitVec 32)) SeekEntryResult!7291)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729464 (= res!489977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19694 a!3186) j!159) mask!3328) (select (arr!19694 a!3186) j!159) a!3186 mask!3328) lt!323059))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729464 (= lt!323059 (Intermediate!7291 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729465 () Bool)

(declare-fun res!489980 () Bool)

(assert (=> b!729465 (=> (not res!489980) (not e!408250))))

(assert (=> b!729465 (= res!489980 (and (= (size!20115 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20115 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20115 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729466 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408252 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!729466 (= e!408252 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19694 a!3186) j!159) a!3186 mask!3328) lt!323059))))

(declare-fun b!729467 () Bool)

(declare-fun res!489988 () Bool)

(assert (=> b!729467 (=> (not res!489988) (not e!408250))))

(declare-fun arrayContainsKey!0 (array!41148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729467 (= res!489988 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729468 () Bool)

(declare-fun res!489976 () Bool)

(assert (=> b!729468 (=> (not res!489976) (not e!408245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41148 (_ BitVec 32)) Bool)

(assert (=> b!729468 (= res!489976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729469 () Bool)

(declare-fun e!408251 () Bool)

(assert (=> b!729469 (= e!408251 true)))

(declare-fun lt!323063 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729469 (= lt!323063 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!489984 () Bool)

(assert (=> start!64682 (=> (not res!489984) (not e!408250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64682 (= res!489984 (validMask!0 mask!3328))))

(assert (=> start!64682 e!408250))

(assert (=> start!64682 true))

(declare-fun array_inv!15577 (array!41148) Bool)

(assert (=> start!64682 (array_inv!15577 a!3186)))

(declare-fun b!729470 () Bool)

(declare-fun res!489990 () Bool)

(assert (=> b!729470 (=> (not res!489990) (not e!408247))))

(assert (=> b!729470 (= res!489990 e!408252)))

(declare-fun c!80118 () Bool)

(assert (=> b!729470 (= c!80118 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729471 () Bool)

(declare-fun e!408249 () Bool)

(assert (=> b!729471 (= e!408247 e!408249)))

(declare-fun res!489982 () Bool)

(assert (=> b!729471 (=> (not res!489982) (not e!408249))))

(declare-fun lt!323061 () SeekEntryResult!7291)

(declare-fun lt!323065 () SeekEntryResult!7291)

(assert (=> b!729471 (= res!489982 (= lt!323061 lt!323065))))

(declare-fun lt!323062 () array!41148)

(declare-fun lt!323058 () (_ BitVec 64))

(assert (=> b!729471 (= lt!323065 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323058 lt!323062 mask!3328))))

(assert (=> b!729471 (= lt!323061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323058 mask!3328) lt!323058 lt!323062 mask!3328))))

(assert (=> b!729471 (= lt!323058 (select (store (arr!19694 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729471 (= lt!323062 (array!41149 (store (arr!19694 a!3186) i!1173 k0!2102) (size!20115 a!3186)))))

(declare-fun b!729472 () Bool)

(assert (=> b!729472 (= e!408249 (not e!408251))))

(declare-fun res!489981 () Bool)

(assert (=> b!729472 (=> res!489981 e!408251)))

(get-info :version)

(assert (=> b!729472 (= res!489981 (or (not ((_ is Intermediate!7291) lt!323065)) (bvsge x!1131 (x!62524 lt!323065))))))

(declare-fun e!408253 () Bool)

(assert (=> b!729472 e!408253))

(declare-fun res!489986 () Bool)

(assert (=> b!729472 (=> (not res!489986) (not e!408253))))

(assert (=> b!729472 (= res!489986 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24872 0))(
  ( (Unit!24873) )
))
(declare-fun lt!323060 () Unit!24872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24872)

(assert (=> b!729472 (= lt!323060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729473 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41148 (_ BitVec 32)) SeekEntryResult!7291)

(assert (=> b!729473 (= e!408252 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19694 a!3186) j!159) a!3186 mask!3328) (Found!7291 j!159)))))

(declare-fun b!729474 () Bool)

(declare-fun res!489985 () Bool)

(assert (=> b!729474 (=> (not res!489985) (not e!408245))))

(declare-datatypes ((List!13735 0))(
  ( (Nil!13732) (Cons!13731 (h!14791 (_ BitVec 64)) (t!20041 List!13735)) )
))
(declare-fun arrayNoDuplicates!0 (array!41148 (_ BitVec 32) List!13735) Bool)

(assert (=> b!729474 (= res!489985 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13732))))

(declare-fun b!729475 () Bool)

(declare-fun e!408246 () Bool)

(assert (=> b!729475 (= e!408253 e!408246)))

(declare-fun res!489987 () Bool)

(assert (=> b!729475 (=> (not res!489987) (not e!408246))))

(declare-fun lt!323064 () SeekEntryResult!7291)

(assert (=> b!729475 (= res!489987 (= (seekEntryOrOpen!0 (select (arr!19694 a!3186) j!159) a!3186 mask!3328) lt!323064))))

(assert (=> b!729475 (= lt!323064 (Found!7291 j!159))))

(declare-fun b!729476 () Bool)

(declare-fun res!489975 () Bool)

(assert (=> b!729476 (=> (not res!489975) (not e!408247))))

(assert (=> b!729476 (= res!489975 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19694 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729477 () Bool)

(assert (=> b!729477 (= e!408246 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19694 a!3186) j!159) a!3186 mask!3328) lt!323064))))

(declare-fun b!729478 () Bool)

(declare-fun res!489983 () Bool)

(assert (=> b!729478 (=> (not res!489983) (not e!408245))))

(assert (=> b!729478 (= res!489983 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20115 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20115 a!3186))))))

(declare-fun b!729479 () Bool)

(declare-fun res!489978 () Bool)

(assert (=> b!729479 (=> (not res!489978) (not e!408250))))

(assert (=> b!729479 (= res!489978 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64682 res!489984) b!729465))

(assert (= (and b!729465 res!489980) b!729463))

(assert (= (and b!729463 res!489979) b!729479))

(assert (= (and b!729479 res!489978) b!729467))

(assert (= (and b!729467 res!489988) b!729462))

(assert (= (and b!729462 res!489989) b!729468))

(assert (= (and b!729468 res!489976) b!729474))

(assert (= (and b!729474 res!489985) b!729478))

(assert (= (and b!729478 res!489983) b!729464))

(assert (= (and b!729464 res!489977) b!729476))

(assert (= (and b!729476 res!489975) b!729470))

(assert (= (and b!729470 c!80118) b!729466))

(assert (= (and b!729470 (not c!80118)) b!729473))

(assert (= (and b!729470 res!489990) b!729471))

(assert (= (and b!729471 res!489982) b!729472))

(assert (= (and b!729472 res!489986) b!729475))

(assert (= (and b!729475 res!489987) b!729477))

(assert (= (and b!729472 (not res!489981)) b!729469))

(declare-fun m!682565 () Bool)

(assert (=> b!729471 m!682565))

(declare-fun m!682567 () Bool)

(assert (=> b!729471 m!682567))

(declare-fun m!682569 () Bool)

(assert (=> b!729471 m!682569))

(declare-fun m!682571 () Bool)

(assert (=> b!729471 m!682571))

(declare-fun m!682573 () Bool)

(assert (=> b!729471 m!682573))

(assert (=> b!729471 m!682571))

(declare-fun m!682575 () Bool)

(assert (=> b!729466 m!682575))

(assert (=> b!729466 m!682575))

(declare-fun m!682577 () Bool)

(assert (=> b!729466 m!682577))

(declare-fun m!682579 () Bool)

(assert (=> b!729468 m!682579))

(declare-fun m!682581 () Bool)

(assert (=> b!729474 m!682581))

(assert (=> b!729477 m!682575))

(assert (=> b!729477 m!682575))

(declare-fun m!682583 () Bool)

(assert (=> b!729477 m!682583))

(declare-fun m!682585 () Bool)

(assert (=> b!729462 m!682585))

(declare-fun m!682587 () Bool)

(assert (=> b!729469 m!682587))

(assert (=> b!729464 m!682575))

(assert (=> b!729464 m!682575))

(declare-fun m!682589 () Bool)

(assert (=> b!729464 m!682589))

(assert (=> b!729464 m!682589))

(assert (=> b!729464 m!682575))

(declare-fun m!682591 () Bool)

(assert (=> b!729464 m!682591))

(assert (=> b!729463 m!682575))

(assert (=> b!729463 m!682575))

(declare-fun m!682593 () Bool)

(assert (=> b!729463 m!682593))

(declare-fun m!682595 () Bool)

(assert (=> b!729467 m!682595))

(declare-fun m!682597 () Bool)

(assert (=> b!729476 m!682597))

(declare-fun m!682599 () Bool)

(assert (=> start!64682 m!682599))

(declare-fun m!682601 () Bool)

(assert (=> start!64682 m!682601))

(assert (=> b!729475 m!682575))

(assert (=> b!729475 m!682575))

(declare-fun m!682603 () Bool)

(assert (=> b!729475 m!682603))

(declare-fun m!682605 () Bool)

(assert (=> b!729479 m!682605))

(assert (=> b!729473 m!682575))

(assert (=> b!729473 m!682575))

(declare-fun m!682607 () Bool)

(assert (=> b!729473 m!682607))

(declare-fun m!682609 () Bool)

(assert (=> b!729472 m!682609))

(declare-fun m!682611 () Bool)

(assert (=> b!729472 m!682611))

(check-sat (not b!729477) (not b!729462) (not b!729468) (not b!729475) (not b!729469) (not b!729463) (not b!729472) (not b!729479) (not b!729474) (not start!64682) (not b!729471) (not b!729464) (not b!729467) (not b!729473) (not b!729466))
(check-sat)
