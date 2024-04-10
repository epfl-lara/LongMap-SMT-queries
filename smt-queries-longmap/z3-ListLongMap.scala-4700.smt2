; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65262 () Bool)

(assert start!65262)

(declare-fun b!740217 () Bool)

(declare-datatypes ((Unit!25320 0))(
  ( (Unit!25321) )
))
(declare-fun e!413865 () Unit!25320)

(declare-fun Unit!25322 () Unit!25320)

(assert (=> b!740217 (= e!413865 Unit!25322)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41435 0))(
  ( (array!41436 (arr!19831 (Array (_ BitVec 32) (_ BitVec 64))) (size!20252 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41435)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7431 0))(
  ( (MissingZero!7431 (index!32092 (_ BitVec 32))) (Found!7431 (index!32093 (_ BitVec 32))) (Intermediate!7431 (undefined!8243 Bool) (index!32094 (_ BitVec 32)) (x!63077 (_ BitVec 32))) (Undefined!7431) (MissingVacant!7431 (index!32095 (_ BitVec 32))) )
))
(declare-fun lt!328804 () SeekEntryResult!7431)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41435 (_ BitVec 32)) SeekEntryResult!7431)

(assert (=> b!740217 (= lt!328804 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328801 () SeekEntryResult!7431)

(declare-fun lt!328799 () (_ BitVec 32))

(assert (=> b!740217 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328799 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!328801)))

(declare-fun b!740218 () Bool)

(declare-fun res!497769 () Bool)

(declare-fun e!413863 () Bool)

(assert (=> b!740218 (=> (not res!497769) (not e!413863))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740218 (= res!497769 (and (= (size!20252 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20252 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20252 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!413869 () Bool)

(declare-fun b!740219 () Bool)

(assert (=> b!740219 (= e!413869 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328799 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!328801)))))

(declare-fun b!740220 () Bool)

(declare-fun res!497775 () Bool)

(declare-fun e!413864 () Bool)

(assert (=> b!740220 (=> (not res!497775) (not e!413864))))

(declare-datatypes ((List!13833 0))(
  ( (Nil!13830) (Cons!13829 (h!14901 (_ BitVec 64)) (t!20148 List!13833)) )
))
(declare-fun arrayNoDuplicates!0 (array!41435 (_ BitVec 32) List!13833) Bool)

(assert (=> b!740220 (= res!497775 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13830))))

(declare-fun b!740221 () Bool)

(declare-fun res!497772 () Bool)

(assert (=> b!740221 (=> (not res!497772) (not e!413863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740221 (= res!497772 (validKeyInArray!0 (select (arr!19831 a!3186) j!159)))))

(declare-fun b!740223 () Bool)

(declare-fun e!413870 () Bool)

(declare-fun e!413862 () Bool)

(assert (=> b!740223 (= e!413870 e!413862)))

(declare-fun res!497763 () Bool)

(assert (=> b!740223 (=> (not res!497763) (not e!413862))))

(declare-fun lt!328805 () SeekEntryResult!7431)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41435 (_ BitVec 32)) SeekEntryResult!7431)

(assert (=> b!740223 (= res!497763 (= (seekEntryOrOpen!0 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!328805))))

(assert (=> b!740223 (= lt!328805 (Found!7431 j!159))))

(declare-fun b!740224 () Bool)

(declare-fun e!413868 () Bool)

(declare-fun e!413866 () Bool)

(assert (=> b!740224 (= e!413868 e!413866)))

(declare-fun res!497766 () Bool)

(assert (=> b!740224 (=> (not res!497766) (not e!413866))))

(declare-fun lt!328800 () SeekEntryResult!7431)

(declare-fun lt!328802 () SeekEntryResult!7431)

(assert (=> b!740224 (= res!497766 (= lt!328800 lt!328802))))

(declare-fun lt!328811 () array!41435)

(declare-fun lt!328803 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41435 (_ BitVec 32)) SeekEntryResult!7431)

(assert (=> b!740224 (= lt!328802 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328803 lt!328811 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740224 (= lt!328800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328803 mask!3328) lt!328803 lt!328811 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!740224 (= lt!328803 (select (store (arr!19831 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740224 (= lt!328811 (array!41436 (store (arr!19831 a!3186) i!1173 k0!2102) (size!20252 a!3186)))))

(declare-fun b!740225 () Bool)

(declare-fun res!497774 () Bool)

(assert (=> b!740225 (=> (not res!497774) (not e!413864))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740225 (= res!497774 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20252 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20252 a!3186))))))

(declare-fun b!740226 () Bool)

(declare-fun res!497777 () Bool)

(declare-fun e!413860 () Bool)

(assert (=> b!740226 (=> res!497777 e!413860)))

(assert (=> b!740226 (= res!497777 e!413869)))

(declare-fun c!81608 () Bool)

(declare-fun lt!328809 () Bool)

(assert (=> b!740226 (= c!81608 lt!328809)))

(declare-fun b!740227 () Bool)

(declare-fun e!413867 () Bool)

(assert (=> b!740227 (= e!413867 e!413860)))

(declare-fun res!497767 () Bool)

(assert (=> b!740227 (=> res!497767 e!413860)))

(assert (=> b!740227 (= res!497767 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328799 #b00000000000000000000000000000000) (bvsge lt!328799 (size!20252 a!3186))))))

(declare-fun lt!328807 () Unit!25320)

(assert (=> b!740227 (= lt!328807 e!413865)))

(declare-fun c!81609 () Bool)

(assert (=> b!740227 (= c!81609 lt!328809)))

(assert (=> b!740227 (= lt!328809 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740227 (= lt!328799 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740228 () Bool)

(declare-fun e!413859 () Bool)

(declare-fun lt!328808 () SeekEntryResult!7431)

(assert (=> b!740228 (= e!413859 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!328808))))

(declare-fun b!740229 () Bool)

(declare-fun res!497780 () Bool)

(assert (=> b!740229 (=> (not res!497780) (not e!413863))))

(assert (=> b!740229 (= res!497780 (validKeyInArray!0 k0!2102))))

(declare-fun b!740230 () Bool)

(assert (=> b!740230 (= e!413864 e!413868)))

(declare-fun res!497779 () Bool)

(assert (=> b!740230 (=> (not res!497779) (not e!413868))))

(assert (=> b!740230 (= res!497779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19831 a!3186) j!159) mask!3328) (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!328808))))

(assert (=> b!740230 (= lt!328808 (Intermediate!7431 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740231 () Bool)

(assert (=> b!740231 (= e!413869 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328799 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!328808)))))

(declare-fun b!740232 () Bool)

(assert (=> b!740232 (= e!413859 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) (Found!7431 j!159)))))

(declare-fun b!740233 () Bool)

(assert (=> b!740233 (= e!413863 e!413864)))

(declare-fun res!497768 () Bool)

(assert (=> b!740233 (=> (not res!497768) (not e!413864))))

(declare-fun lt!328810 () SeekEntryResult!7431)

(assert (=> b!740233 (= res!497768 (or (= lt!328810 (MissingZero!7431 i!1173)) (= lt!328810 (MissingVacant!7431 i!1173))))))

(assert (=> b!740233 (= lt!328810 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740234 () Bool)

(declare-fun Unit!25323 () Unit!25320)

(assert (=> b!740234 (= e!413865 Unit!25323)))

(assert (=> b!740234 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328799 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!328808)))

(declare-fun b!740235 () Bool)

(assert (=> b!740235 (= e!413866 (not e!413867))))

(declare-fun res!497773 () Bool)

(assert (=> b!740235 (=> res!497773 e!413867)))

(get-info :version)

(assert (=> b!740235 (= res!497773 (or (not ((_ is Intermediate!7431) lt!328802)) (bvsge x!1131 (x!63077 lt!328802))))))

(assert (=> b!740235 (= lt!328801 (Found!7431 j!159))))

(assert (=> b!740235 e!413870))

(declare-fun res!497765 () Bool)

(assert (=> b!740235 (=> (not res!497765) (not e!413870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41435 (_ BitVec 32)) Bool)

(assert (=> b!740235 (= res!497765 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328798 () Unit!25320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25320)

(assert (=> b!740235 (= lt!328798 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740236 () Bool)

(declare-fun res!497771 () Bool)

(assert (=> b!740236 (=> res!497771 e!413860)))

(assert (=> b!740236 (= res!497771 (not (= lt!328800 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328799 lt!328803 lt!328811 mask!3328))))))

(declare-fun b!740237 () Bool)

(assert (=> b!740237 (= e!413860 true)))

(assert (=> b!740237 (= (seekEntryOrOpen!0 lt!328803 lt!328811 mask!3328) lt!328801)))

(declare-fun lt!328806 () Unit!25320)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25320)

(assert (=> b!740237 (= lt!328806 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!328799 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740238 () Bool)

(declare-fun res!497770 () Bool)

(assert (=> b!740238 (=> (not res!497770) (not e!413863))))

(declare-fun arrayContainsKey!0 (array!41435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740238 (= res!497770 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740239 () Bool)

(declare-fun res!497762 () Bool)

(assert (=> b!740239 (=> (not res!497762) (not e!413864))))

(assert (=> b!740239 (= res!497762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740222 () Bool)

(declare-fun res!497778 () Bool)

(assert (=> b!740222 (=> (not res!497778) (not e!413868))))

(assert (=> b!740222 (= res!497778 e!413859)))

(declare-fun c!81610 () Bool)

(assert (=> b!740222 (= c!81610 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!497776 () Bool)

(assert (=> start!65262 (=> (not res!497776) (not e!413863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65262 (= res!497776 (validMask!0 mask!3328))))

(assert (=> start!65262 e!413863))

(assert (=> start!65262 true))

(declare-fun array_inv!15627 (array!41435) Bool)

(assert (=> start!65262 (array_inv!15627 a!3186)))

(declare-fun b!740240 () Bool)

(declare-fun res!497764 () Bool)

(assert (=> b!740240 (=> (not res!497764) (not e!413868))))

(assert (=> b!740240 (= res!497764 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19831 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740241 () Bool)

(assert (=> b!740241 (= e!413862 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!328805))))

(assert (= (and start!65262 res!497776) b!740218))

(assert (= (and b!740218 res!497769) b!740221))

(assert (= (and b!740221 res!497772) b!740229))

(assert (= (and b!740229 res!497780) b!740238))

(assert (= (and b!740238 res!497770) b!740233))

(assert (= (and b!740233 res!497768) b!740239))

(assert (= (and b!740239 res!497762) b!740220))

(assert (= (and b!740220 res!497775) b!740225))

(assert (= (and b!740225 res!497774) b!740230))

(assert (= (and b!740230 res!497779) b!740240))

(assert (= (and b!740240 res!497764) b!740222))

(assert (= (and b!740222 c!81610) b!740228))

(assert (= (and b!740222 (not c!81610)) b!740232))

(assert (= (and b!740222 res!497778) b!740224))

(assert (= (and b!740224 res!497766) b!740235))

(assert (= (and b!740235 res!497765) b!740223))

(assert (= (and b!740223 res!497763) b!740241))

(assert (= (and b!740235 (not res!497773)) b!740227))

(assert (= (and b!740227 c!81609) b!740234))

(assert (= (and b!740227 (not c!81609)) b!740217))

(assert (= (and b!740227 (not res!497767)) b!740226))

(assert (= (and b!740226 c!81608) b!740231))

(assert (= (and b!740226 (not c!81608)) b!740219))

(assert (= (and b!740226 (not res!497777)) b!740236))

(assert (= (and b!740236 (not res!497771)) b!740237))

(declare-fun m!691403 () Bool)

(assert (=> b!740224 m!691403))

(declare-fun m!691405 () Bool)

(assert (=> b!740224 m!691405))

(assert (=> b!740224 m!691403))

(declare-fun m!691407 () Bool)

(assert (=> b!740224 m!691407))

(declare-fun m!691409 () Bool)

(assert (=> b!740224 m!691409))

(declare-fun m!691411 () Bool)

(assert (=> b!740224 m!691411))

(declare-fun m!691413 () Bool)

(assert (=> b!740241 m!691413))

(assert (=> b!740241 m!691413))

(declare-fun m!691415 () Bool)

(assert (=> b!740241 m!691415))

(declare-fun m!691417 () Bool)

(assert (=> b!740220 m!691417))

(declare-fun m!691419 () Bool)

(assert (=> b!740237 m!691419))

(declare-fun m!691421 () Bool)

(assert (=> b!740237 m!691421))

(assert (=> b!740231 m!691413))

(assert (=> b!740231 m!691413))

(declare-fun m!691423 () Bool)

(assert (=> b!740231 m!691423))

(assert (=> b!740219 m!691413))

(assert (=> b!740219 m!691413))

(declare-fun m!691425 () Bool)

(assert (=> b!740219 m!691425))

(assert (=> b!740223 m!691413))

(assert (=> b!740223 m!691413))

(declare-fun m!691427 () Bool)

(assert (=> b!740223 m!691427))

(declare-fun m!691429 () Bool)

(assert (=> b!740227 m!691429))

(declare-fun m!691431 () Bool)

(assert (=> start!65262 m!691431))

(declare-fun m!691433 () Bool)

(assert (=> start!65262 m!691433))

(assert (=> b!740230 m!691413))

(assert (=> b!740230 m!691413))

(declare-fun m!691435 () Bool)

(assert (=> b!740230 m!691435))

(assert (=> b!740230 m!691435))

(assert (=> b!740230 m!691413))

(declare-fun m!691437 () Bool)

(assert (=> b!740230 m!691437))

(declare-fun m!691439 () Bool)

(assert (=> b!740233 m!691439))

(declare-fun m!691441 () Bool)

(assert (=> b!740239 m!691441))

(declare-fun m!691443 () Bool)

(assert (=> b!740236 m!691443))

(declare-fun m!691445 () Bool)

(assert (=> b!740229 m!691445))

(assert (=> b!740234 m!691413))

(assert (=> b!740234 m!691413))

(assert (=> b!740234 m!691423))

(assert (=> b!740228 m!691413))

(assert (=> b!740228 m!691413))

(declare-fun m!691447 () Bool)

(assert (=> b!740228 m!691447))

(declare-fun m!691449 () Bool)

(assert (=> b!740240 m!691449))

(assert (=> b!740221 m!691413))

(assert (=> b!740221 m!691413))

(declare-fun m!691451 () Bool)

(assert (=> b!740221 m!691451))

(assert (=> b!740217 m!691413))

(assert (=> b!740217 m!691413))

(declare-fun m!691453 () Bool)

(assert (=> b!740217 m!691453))

(assert (=> b!740217 m!691413))

(assert (=> b!740217 m!691425))

(declare-fun m!691455 () Bool)

(assert (=> b!740235 m!691455))

(declare-fun m!691457 () Bool)

(assert (=> b!740235 m!691457))

(declare-fun m!691459 () Bool)

(assert (=> b!740238 m!691459))

(assert (=> b!740232 m!691413))

(assert (=> b!740232 m!691413))

(assert (=> b!740232 m!691453))

(check-sat (not b!740238) (not b!740219) (not b!740231) (not b!740223) (not b!740227) (not b!740236) (not b!740234) (not b!740224) (not b!740239) (not b!740220) (not b!740241) (not start!65262) (not b!740228) (not b!740217) (not b!740221) (not b!740230) (not b!740235) (not b!740232) (not b!740237) (not b!740233) (not b!740229))
(check-sat)
