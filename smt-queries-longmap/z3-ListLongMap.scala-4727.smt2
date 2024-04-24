; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65550 () Bool)

(assert start!65550)

(declare-fun b!745582 () Bool)

(declare-fun res!502086 () Bool)

(declare-fun e!416532 () Bool)

(assert (=> b!745582 (=> (not res!502086) (not e!416532))))

(declare-fun e!416528 () Bool)

(assert (=> b!745582 (= res!502086 e!416528)))

(declare-fun c!82133 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745582 (= c!82133 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745583 () Bool)

(declare-fun res!502093 () Bool)

(declare-fun e!416534 () Bool)

(assert (=> b!745583 (=> (not res!502093) (not e!416534))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41593 0))(
  ( (array!41594 (arr!19906 (Array (_ BitVec 32) (_ BitVec 64))) (size!20326 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41593)

(assert (=> b!745583 (= res!502093 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20326 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20326 a!3186))))))

(declare-fun b!745584 () Bool)

(declare-fun res!502095 () Bool)

(declare-fun e!416530 () Bool)

(assert (=> b!745584 (=> res!502095 e!416530)))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7462 0))(
  ( (MissingZero!7462 (index!32216 (_ BitVec 32))) (Found!7462 (index!32217 (_ BitVec 32))) (Intermediate!7462 (undefined!8274 Bool) (index!32218 (_ BitVec 32)) (x!63336 (_ BitVec 32))) (Undefined!7462) (MissingVacant!7462 (index!32219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41593 (_ BitVec 32)) SeekEntryResult!7462)

(assert (=> b!745584 (= res!502095 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) (Found!7462 j!159))))))

(declare-fun b!745586 () Bool)

(declare-fun e!416529 () Bool)

(assert (=> b!745586 (= e!416529 (not e!416530))))

(declare-fun res!502083 () Bool)

(assert (=> b!745586 (=> res!502083 e!416530)))

(declare-fun lt!331209 () SeekEntryResult!7462)

(get-info :version)

(assert (=> b!745586 (= res!502083 (or (not ((_ is Intermediate!7462) lt!331209)) (bvslt x!1131 (x!63336 lt!331209)) (not (= x!1131 (x!63336 lt!331209))) (not (= index!1321 (index!32218 lt!331209)))))))

(declare-fun e!416531 () Bool)

(assert (=> b!745586 e!416531))

(declare-fun res!502087 () Bool)

(assert (=> b!745586 (=> (not res!502087) (not e!416531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41593 (_ BitVec 32)) Bool)

(assert (=> b!745586 (= res!502087 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25483 0))(
  ( (Unit!25484) )
))
(declare-fun lt!331213 () Unit!25483)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25483)

(assert (=> b!745586 (= lt!331213 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745587 () Bool)

(assert (=> b!745587 (= e!416534 e!416532)))

(declare-fun res!502094 () Bool)

(assert (=> b!745587 (=> (not res!502094) (not e!416532))))

(declare-fun lt!331212 () SeekEntryResult!7462)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41593 (_ BitVec 32)) SeekEntryResult!7462)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745587 (= res!502094 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19906 a!3186) j!159) mask!3328) (select (arr!19906 a!3186) j!159) a!3186 mask!3328) lt!331212))))

(assert (=> b!745587 (= lt!331212 (Intermediate!7462 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun b!745588 () Bool)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!331210 () (_ BitVec 64))

(assert (=> b!745588 (= e!416530 (or (= (select (store (arr!19906 a!3186) i!1173 k0!2102) index!1321) lt!331210) (not (= (select (store (arr!19906 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!745589 () Bool)

(declare-fun res!502097 () Bool)

(assert (=> b!745589 (=> (not res!502097) (not e!416534))))

(declare-datatypes ((List!13815 0))(
  ( (Nil!13812) (Cons!13811 (h!14889 (_ BitVec 64)) (t!20122 List!13815)) )
))
(declare-fun arrayNoDuplicates!0 (array!41593 (_ BitVec 32) List!13815) Bool)

(assert (=> b!745589 (= res!502097 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13812))))

(declare-fun b!745590 () Bool)

(declare-fun e!416533 () Bool)

(assert (=> b!745590 (= e!416531 e!416533)))

(declare-fun res!502092 () Bool)

(assert (=> b!745590 (=> (not res!502092) (not e!416533))))

(declare-fun lt!331208 () SeekEntryResult!7462)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41593 (_ BitVec 32)) SeekEntryResult!7462)

(assert (=> b!745590 (= res!502092 (= (seekEntryOrOpen!0 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) lt!331208))))

(assert (=> b!745590 (= lt!331208 (Found!7462 j!159))))

(declare-fun b!745591 () Bool)

(declare-fun e!416527 () Bool)

(assert (=> b!745591 (= e!416527 e!416534)))

(declare-fun res!502098 () Bool)

(assert (=> b!745591 (=> (not res!502098) (not e!416534))))

(declare-fun lt!331215 () SeekEntryResult!7462)

(assert (=> b!745591 (= res!502098 (or (= lt!331215 (MissingZero!7462 i!1173)) (= lt!331215 (MissingVacant!7462 i!1173))))))

(assert (=> b!745591 (= lt!331215 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745592 () Bool)

(declare-fun res!502090 () Bool)

(assert (=> b!745592 (=> (not res!502090) (not e!416527))))

(assert (=> b!745592 (= res!502090 (and (= (size!20326 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20326 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20326 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745593 () Bool)

(declare-fun res!502088 () Bool)

(assert (=> b!745593 (=> (not res!502088) (not e!416534))))

(assert (=> b!745593 (= res!502088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745594 () Bool)

(declare-fun res!502084 () Bool)

(assert (=> b!745594 (=> (not res!502084) (not e!416532))))

(assert (=> b!745594 (= res!502084 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19906 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745595 () Bool)

(assert (=> b!745595 (= e!416533 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) lt!331208))))

(declare-fun b!745596 () Bool)

(declare-fun res!502085 () Bool)

(assert (=> b!745596 (=> (not res!502085) (not e!416527))))

(declare-fun arrayContainsKey!0 (array!41593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745596 (= res!502085 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745597 () Bool)

(assert (=> b!745597 (= e!416528 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) lt!331212))))

(declare-fun b!745598 () Bool)

(declare-fun res!502099 () Bool)

(assert (=> b!745598 (=> (not res!502099) (not e!416527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745598 (= res!502099 (validKeyInArray!0 k0!2102))))

(declare-fun b!745599 () Bool)

(assert (=> b!745599 (= e!416532 e!416529)))

(declare-fun res!502091 () Bool)

(assert (=> b!745599 (=> (not res!502091) (not e!416529))))

(declare-fun lt!331214 () SeekEntryResult!7462)

(assert (=> b!745599 (= res!502091 (= lt!331214 lt!331209))))

(declare-fun lt!331211 () array!41593)

(assert (=> b!745599 (= lt!331209 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331210 lt!331211 mask!3328))))

(assert (=> b!745599 (= lt!331214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331210 mask!3328) lt!331210 lt!331211 mask!3328))))

(assert (=> b!745599 (= lt!331210 (select (store (arr!19906 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745599 (= lt!331211 (array!41594 (store (arr!19906 a!3186) i!1173 k0!2102) (size!20326 a!3186)))))

(declare-fun b!745600 () Bool)

(assert (=> b!745600 (= e!416528 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) (Found!7462 j!159)))))

(declare-fun b!745585 () Bool)

(declare-fun res!502089 () Bool)

(assert (=> b!745585 (=> (not res!502089) (not e!416527))))

(assert (=> b!745585 (= res!502089 (validKeyInArray!0 (select (arr!19906 a!3186) j!159)))))

(declare-fun res!502096 () Bool)

(assert (=> start!65550 (=> (not res!502096) (not e!416527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65550 (= res!502096 (validMask!0 mask!3328))))

(assert (=> start!65550 e!416527))

(assert (=> start!65550 true))

(declare-fun array_inv!15765 (array!41593) Bool)

(assert (=> start!65550 (array_inv!15765 a!3186)))

(assert (= (and start!65550 res!502096) b!745592))

(assert (= (and b!745592 res!502090) b!745585))

(assert (= (and b!745585 res!502089) b!745598))

(assert (= (and b!745598 res!502099) b!745596))

(assert (= (and b!745596 res!502085) b!745591))

(assert (= (and b!745591 res!502098) b!745593))

(assert (= (and b!745593 res!502088) b!745589))

(assert (= (and b!745589 res!502097) b!745583))

(assert (= (and b!745583 res!502093) b!745587))

(assert (= (and b!745587 res!502094) b!745594))

(assert (= (and b!745594 res!502084) b!745582))

(assert (= (and b!745582 c!82133) b!745597))

(assert (= (and b!745582 (not c!82133)) b!745600))

(assert (= (and b!745582 res!502086) b!745599))

(assert (= (and b!745599 res!502091) b!745586))

(assert (= (and b!745586 res!502087) b!745590))

(assert (= (and b!745590 res!502092) b!745595))

(assert (= (and b!745586 (not res!502083)) b!745584))

(assert (= (and b!745584 (not res!502095)) b!745588))

(declare-fun m!696465 () Bool)

(assert (=> b!745599 m!696465))

(declare-fun m!696467 () Bool)

(assert (=> b!745599 m!696467))

(declare-fun m!696469 () Bool)

(assert (=> b!745599 m!696469))

(declare-fun m!696471 () Bool)

(assert (=> b!745599 m!696471))

(assert (=> b!745599 m!696465))

(declare-fun m!696473 () Bool)

(assert (=> b!745599 m!696473))

(declare-fun m!696475 () Bool)

(assert (=> b!745594 m!696475))

(declare-fun m!696477 () Bool)

(assert (=> b!745591 m!696477))

(assert (=> b!745588 m!696469))

(declare-fun m!696479 () Bool)

(assert (=> b!745588 m!696479))

(declare-fun m!696481 () Bool)

(assert (=> start!65550 m!696481))

(declare-fun m!696483 () Bool)

(assert (=> start!65550 m!696483))

(declare-fun m!696485 () Bool)

(assert (=> b!745598 m!696485))

(declare-fun m!696487 () Bool)

(assert (=> b!745597 m!696487))

(assert (=> b!745597 m!696487))

(declare-fun m!696489 () Bool)

(assert (=> b!745597 m!696489))

(declare-fun m!696491 () Bool)

(assert (=> b!745593 m!696491))

(declare-fun m!696493 () Bool)

(assert (=> b!745586 m!696493))

(declare-fun m!696495 () Bool)

(assert (=> b!745586 m!696495))

(assert (=> b!745587 m!696487))

(assert (=> b!745587 m!696487))

(declare-fun m!696497 () Bool)

(assert (=> b!745587 m!696497))

(assert (=> b!745587 m!696497))

(assert (=> b!745587 m!696487))

(declare-fun m!696499 () Bool)

(assert (=> b!745587 m!696499))

(assert (=> b!745590 m!696487))

(assert (=> b!745590 m!696487))

(declare-fun m!696501 () Bool)

(assert (=> b!745590 m!696501))

(assert (=> b!745600 m!696487))

(assert (=> b!745600 m!696487))

(declare-fun m!696503 () Bool)

(assert (=> b!745600 m!696503))

(declare-fun m!696505 () Bool)

(assert (=> b!745589 m!696505))

(assert (=> b!745585 m!696487))

(assert (=> b!745585 m!696487))

(declare-fun m!696507 () Bool)

(assert (=> b!745585 m!696507))

(assert (=> b!745584 m!696487))

(assert (=> b!745584 m!696487))

(assert (=> b!745584 m!696503))

(assert (=> b!745595 m!696487))

(assert (=> b!745595 m!696487))

(declare-fun m!696509 () Bool)

(assert (=> b!745595 m!696509))

(declare-fun m!696511 () Bool)

(assert (=> b!745596 m!696511))

(check-sat (not start!65550) (not b!745596) (not b!745585) (not b!745593) (not b!745600) (not b!745598) (not b!745587) (not b!745591) (not b!745584) (not b!745595) (not b!745590) (not b!745599) (not b!745597) (not b!745586) (not b!745589))
(check-sat)
