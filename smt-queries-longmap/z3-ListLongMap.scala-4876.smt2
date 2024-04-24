; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67288 () Bool)

(assert start!67288)

(declare-fun b!777241 () Bool)

(declare-fun e!432566 () Bool)

(assert (=> b!777241 (= e!432566 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42523 0))(
  ( (array!42524 (arr!20353 (Array (_ BitVec 32) (_ BitVec 64))) (size!20773 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42523)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7909 0))(
  ( (MissingZero!7909 (index!34004 (_ BitVec 32))) (Found!7909 (index!34005 (_ BitVec 32))) (Intermediate!7909 (undefined!8721 Bool) (index!34006 (_ BitVec 32)) (x!65103 (_ BitVec 32))) (Undefined!7909) (MissingVacant!7909 (index!34007 (_ BitVec 32))) )
))
(declare-fun lt!346272 () SeekEntryResult!7909)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42523 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!777241 (= lt!346272 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20353 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777242 () Bool)

(declare-fun res!525666 () Bool)

(declare-fun e!432564 () Bool)

(assert (=> b!777242 (=> (not res!525666) (not e!432564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777242 (= res!525666 (validKeyInArray!0 (select (arr!20353 a!3186) j!159)))))

(declare-fun b!777243 () Bool)

(declare-fun e!432568 () Bool)

(assert (=> b!777243 (= e!432568 (not e!432566))))

(declare-fun res!525665 () Bool)

(assert (=> b!777243 (=> res!525665 e!432566)))

(declare-fun lt!346273 () SeekEntryResult!7909)

(get-info :version)

(assert (=> b!777243 (= res!525665 (or (not ((_ is Intermediate!7909) lt!346273)) (bvslt x!1131 (x!65103 lt!346273)) (not (= x!1131 (x!65103 lt!346273))) (not (= index!1321 (index!34006 lt!346273)))))))

(declare-fun e!432565 () Bool)

(assert (=> b!777243 e!432565))

(declare-fun res!525654 () Bool)

(assert (=> b!777243 (=> (not res!525654) (not e!432565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42523 (_ BitVec 32)) Bool)

(assert (=> b!777243 (= res!525654 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26791 0))(
  ( (Unit!26792) )
))
(declare-fun lt!346279 () Unit!26791)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26791)

(assert (=> b!777243 (= lt!346279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777245 () Bool)

(declare-fun e!432560 () Bool)

(assert (=> b!777245 (= e!432560 e!432568)))

(declare-fun res!525655 () Bool)

(assert (=> b!777245 (=> (not res!525655) (not e!432568))))

(declare-fun lt!346275 () SeekEntryResult!7909)

(assert (=> b!777245 (= res!525655 (= lt!346275 lt!346273))))

(declare-fun lt!346276 () (_ BitVec 64))

(declare-fun lt!346278 () array!42523)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42523 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!777245 (= lt!346273 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346276 lt!346278 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777245 (= lt!346275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346276 mask!3328) lt!346276 lt!346278 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!777245 (= lt!346276 (select (store (arr!20353 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777245 (= lt!346278 (array!42524 (store (arr!20353 a!3186) i!1173 k0!2102) (size!20773 a!3186)))))

(declare-fun b!777246 () Bool)

(declare-fun res!525651 () Bool)

(declare-fun e!432567 () Bool)

(assert (=> b!777246 (=> (not res!525651) (not e!432567))))

(assert (=> b!777246 (= res!525651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!432561 () Bool)

(declare-fun b!777247 () Bool)

(assert (=> b!777247 (= e!432561 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20353 a!3186) j!159) a!3186 mask!3328) (Found!7909 j!159)))))

(declare-fun b!777248 () Bool)

(declare-fun res!525664 () Bool)

(assert (=> b!777248 (=> (not res!525664) (not e!432564))))

(assert (=> b!777248 (= res!525664 (and (= (size!20773 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20773 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20773 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777249 () Bool)

(declare-fun res!525657 () Bool)

(assert (=> b!777249 (=> (not res!525657) (not e!432560))))

(assert (=> b!777249 (= res!525657 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20353 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!346271 () SeekEntryResult!7909)

(declare-fun b!777250 () Bool)

(assert (=> b!777250 (= e!432561 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20353 a!3186) j!159) a!3186 mask!3328) lt!346271))))

(declare-fun b!777251 () Bool)

(assert (=> b!777251 (= e!432567 e!432560)))

(declare-fun res!525659 () Bool)

(assert (=> b!777251 (=> (not res!525659) (not e!432560))))

(assert (=> b!777251 (= res!525659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20353 a!3186) j!159) mask!3328) (select (arr!20353 a!3186) j!159) a!3186 mask!3328) lt!346271))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777251 (= lt!346271 (Intermediate!7909 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777252 () Bool)

(declare-fun res!525652 () Bool)

(assert (=> b!777252 (=> (not res!525652) (not e!432567))))

(assert (=> b!777252 (= res!525652 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20773 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20773 a!3186))))))

(declare-fun b!777244 () Bool)

(declare-fun res!525656 () Bool)

(assert (=> b!777244 (=> (not res!525656) (not e!432560))))

(assert (=> b!777244 (= res!525656 e!432561)))

(declare-fun c!86198 () Bool)

(assert (=> b!777244 (= c!86198 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!525663 () Bool)

(assert (=> start!67288 (=> (not res!525663) (not e!432564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67288 (= res!525663 (validMask!0 mask!3328))))

(assert (=> start!67288 e!432564))

(assert (=> start!67288 true))

(declare-fun array_inv!16212 (array!42523) Bool)

(assert (=> start!67288 (array_inv!16212 a!3186)))

(declare-fun b!777253 () Bool)

(assert (=> b!777253 (= e!432564 e!432567)))

(declare-fun res!525660 () Bool)

(assert (=> b!777253 (=> (not res!525660) (not e!432567))))

(declare-fun lt!346274 () SeekEntryResult!7909)

(assert (=> b!777253 (= res!525660 (or (= lt!346274 (MissingZero!7909 i!1173)) (= lt!346274 (MissingVacant!7909 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42523 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!777253 (= lt!346274 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777254 () Bool)

(declare-fun e!432563 () Bool)

(assert (=> b!777254 (= e!432565 e!432563)))

(declare-fun res!525662 () Bool)

(assert (=> b!777254 (=> (not res!525662) (not e!432563))))

(declare-fun lt!346277 () SeekEntryResult!7909)

(assert (=> b!777254 (= res!525662 (= (seekEntryOrOpen!0 (select (arr!20353 a!3186) j!159) a!3186 mask!3328) lt!346277))))

(assert (=> b!777254 (= lt!346277 (Found!7909 j!159))))

(declare-fun b!777255 () Bool)

(declare-fun res!525661 () Bool)

(assert (=> b!777255 (=> (not res!525661) (not e!432564))))

(declare-fun arrayContainsKey!0 (array!42523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777255 (= res!525661 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777256 () Bool)

(assert (=> b!777256 (= e!432563 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20353 a!3186) j!159) a!3186 mask!3328) lt!346277))))

(declare-fun b!777257 () Bool)

(declare-fun res!525653 () Bool)

(assert (=> b!777257 (=> (not res!525653) (not e!432567))))

(declare-datatypes ((List!14262 0))(
  ( (Nil!14259) (Cons!14258 (h!15372 (_ BitVec 64)) (t!20569 List!14262)) )
))
(declare-fun arrayNoDuplicates!0 (array!42523 (_ BitVec 32) List!14262) Bool)

(assert (=> b!777257 (= res!525653 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14259))))

(declare-fun b!777258 () Bool)

(declare-fun res!525658 () Bool)

(assert (=> b!777258 (=> (not res!525658) (not e!432564))))

(assert (=> b!777258 (= res!525658 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67288 res!525663) b!777248))

(assert (= (and b!777248 res!525664) b!777242))

(assert (= (and b!777242 res!525666) b!777258))

(assert (= (and b!777258 res!525658) b!777255))

(assert (= (and b!777255 res!525661) b!777253))

(assert (= (and b!777253 res!525660) b!777246))

(assert (= (and b!777246 res!525651) b!777257))

(assert (= (and b!777257 res!525653) b!777252))

(assert (= (and b!777252 res!525652) b!777251))

(assert (= (and b!777251 res!525659) b!777249))

(assert (= (and b!777249 res!525657) b!777244))

(assert (= (and b!777244 c!86198) b!777250))

(assert (= (and b!777244 (not c!86198)) b!777247))

(assert (= (and b!777244 res!525656) b!777245))

(assert (= (and b!777245 res!525655) b!777243))

(assert (= (and b!777243 res!525654) b!777254))

(assert (= (and b!777254 res!525662) b!777256))

(assert (= (and b!777243 (not res!525665)) b!777241))

(declare-fun m!721715 () Bool)

(assert (=> b!777241 m!721715))

(assert (=> b!777241 m!721715))

(declare-fun m!721717 () Bool)

(assert (=> b!777241 m!721717))

(declare-fun m!721719 () Bool)

(assert (=> b!777245 m!721719))

(assert (=> b!777245 m!721719))

(declare-fun m!721721 () Bool)

(assert (=> b!777245 m!721721))

(declare-fun m!721723 () Bool)

(assert (=> b!777245 m!721723))

(declare-fun m!721725 () Bool)

(assert (=> b!777245 m!721725))

(declare-fun m!721727 () Bool)

(assert (=> b!777245 m!721727))

(declare-fun m!721729 () Bool)

(assert (=> b!777258 m!721729))

(assert (=> b!777254 m!721715))

(assert (=> b!777254 m!721715))

(declare-fun m!721731 () Bool)

(assert (=> b!777254 m!721731))

(assert (=> b!777251 m!721715))

(assert (=> b!777251 m!721715))

(declare-fun m!721733 () Bool)

(assert (=> b!777251 m!721733))

(assert (=> b!777251 m!721733))

(assert (=> b!777251 m!721715))

(declare-fun m!721735 () Bool)

(assert (=> b!777251 m!721735))

(assert (=> b!777256 m!721715))

(assert (=> b!777256 m!721715))

(declare-fun m!721737 () Bool)

(assert (=> b!777256 m!721737))

(assert (=> b!777247 m!721715))

(assert (=> b!777247 m!721715))

(assert (=> b!777247 m!721717))

(assert (=> b!777242 m!721715))

(assert (=> b!777242 m!721715))

(declare-fun m!721739 () Bool)

(assert (=> b!777242 m!721739))

(declare-fun m!721741 () Bool)

(assert (=> b!777249 m!721741))

(declare-fun m!721743 () Bool)

(assert (=> start!67288 m!721743))

(declare-fun m!721745 () Bool)

(assert (=> start!67288 m!721745))

(declare-fun m!721747 () Bool)

(assert (=> b!777253 m!721747))

(declare-fun m!721749 () Bool)

(assert (=> b!777246 m!721749))

(declare-fun m!721751 () Bool)

(assert (=> b!777255 m!721751))

(assert (=> b!777250 m!721715))

(assert (=> b!777250 m!721715))

(declare-fun m!721753 () Bool)

(assert (=> b!777250 m!721753))

(declare-fun m!721755 () Bool)

(assert (=> b!777257 m!721755))

(declare-fun m!721757 () Bool)

(assert (=> b!777243 m!721757))

(declare-fun m!721759 () Bool)

(assert (=> b!777243 m!721759))

(check-sat (not b!777241) (not b!777242) (not b!777243) (not b!777253) (not b!777254) (not b!777246) (not b!777258) (not b!777255) (not b!777247) (not b!777257) (not b!777256) (not b!777245) (not start!67288) (not b!777250) (not b!777251))
(check-sat)
