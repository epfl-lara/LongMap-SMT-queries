; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67244 () Bool)

(assert start!67244)

(declare-fun b!777649 () Bool)

(declare-fun res!526185 () Bool)

(declare-fun e!432658 () Bool)

(assert (=> b!777649 (=> (not res!526185) (not e!432658))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777649 (= res!526185 (validKeyInArray!0 k0!2102))))

(declare-fun b!777650 () Bool)

(declare-fun e!432657 () Bool)

(declare-fun e!432660 () Bool)

(assert (=> b!777650 (= e!432657 (not e!432660))))

(declare-fun res!526184 () Bool)

(assert (=> b!777650 (=> res!526184 e!432660)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7969 0))(
  ( (MissingZero!7969 (index!34244 (_ BitVec 32))) (Found!7969 (index!34245 (_ BitVec 32))) (Intermediate!7969 (undefined!8781 Bool) (index!34246 (_ BitVec 32)) (x!65196 (_ BitVec 32))) (Undefined!7969) (MissingVacant!7969 (index!34247 (_ BitVec 32))) )
))
(declare-fun lt!346332 () SeekEntryResult!7969)

(get-info :version)

(assert (=> b!777650 (= res!526184 (or (not ((_ is Intermediate!7969) lt!346332)) (bvslt x!1131 (x!65196 lt!346332)) (not (= x!1131 (x!65196 lt!346332))) (not (= index!1321 (index!34246 lt!346332)))))))

(declare-fun e!432656 () Bool)

(assert (=> b!777650 e!432656))

(declare-fun res!526176 () Bool)

(assert (=> b!777650 (=> (not res!526176) (not e!432656))))

(declare-datatypes ((array!42555 0))(
  ( (array!42556 (arr!20372 (Array (_ BitVec 32) (_ BitVec 64))) (size!20793 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42555)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42555 (_ BitVec 32)) Bool)

(assert (=> b!777650 (= res!526176 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26804 0))(
  ( (Unit!26805) )
))
(declare-fun lt!346331 () Unit!26804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26804)

(assert (=> b!777650 (= lt!346331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777651 () Bool)

(declare-fun res!526181 () Bool)

(declare-fun e!432659 () Bool)

(assert (=> b!777651 (=> (not res!526181) (not e!432659))))

(declare-datatypes ((List!14413 0))(
  ( (Nil!14410) (Cons!14409 (h!15520 (_ BitVec 64)) (t!20719 List!14413)) )
))
(declare-fun arrayNoDuplicates!0 (array!42555 (_ BitVec 32) List!14413) Bool)

(assert (=> b!777651 (= res!526181 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14410))))

(declare-fun b!777652 () Bool)

(declare-fun res!526188 () Bool)

(assert (=> b!777652 (=> (not res!526188) (not e!432658))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777652 (= res!526188 (and (= (size!20793 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20793 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20793 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777653 () Bool)

(declare-fun res!526174 () Bool)

(declare-fun e!432664 () Bool)

(assert (=> b!777653 (=> (not res!526174) (not e!432664))))

(declare-fun e!432663 () Bool)

(assert (=> b!777653 (= res!526174 e!432663)))

(declare-fun c!86139 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777653 (= c!86139 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777654 () Bool)

(assert (=> b!777654 (= e!432660 true)))

(declare-fun lt!346333 () array!42555)

(declare-fun lt!346336 () SeekEntryResult!7969)

(declare-fun lt!346337 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42555 (_ BitVec 32)) SeekEntryResult!7969)

(assert (=> b!777654 (= lt!346336 (seekEntryOrOpen!0 lt!346337 lt!346333 mask!3328))))

(declare-fun res!526183 () Bool)

(assert (=> start!67244 (=> (not res!526183) (not e!432658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67244 (= res!526183 (validMask!0 mask!3328))))

(assert (=> start!67244 e!432658))

(assert (=> start!67244 true))

(declare-fun array_inv!16255 (array!42555) Bool)

(assert (=> start!67244 (array_inv!16255 a!3186)))

(declare-fun b!777655 () Bool)

(declare-fun res!526179 () Bool)

(assert (=> b!777655 (=> res!526179 e!432660)))

(assert (=> b!777655 (= res!526179 (or (not (= (select (store (arr!20372 a!3186) i!1173 k0!2102) index!1321) lt!346337)) (undefined!8781 lt!346332)))))

(declare-fun b!777656 () Bool)

(declare-fun res!526175 () Bool)

(assert (=> b!777656 (=> (not res!526175) (not e!432664))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!777656 (= res!526175 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20372 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777657 () Bool)

(assert (=> b!777657 (= e!432659 e!432664)))

(declare-fun res!526187 () Bool)

(assert (=> b!777657 (=> (not res!526187) (not e!432664))))

(declare-fun lt!346335 () SeekEntryResult!7969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42555 (_ BitVec 32)) SeekEntryResult!7969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777657 (= res!526187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20372 a!3186) j!159) mask!3328) (select (arr!20372 a!3186) j!159) a!3186 mask!3328) lt!346335))))

(assert (=> b!777657 (= lt!346335 (Intermediate!7969 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777658 () Bool)

(declare-fun res!526190 () Bool)

(assert (=> b!777658 (=> res!526190 e!432660)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42555 (_ BitVec 32)) SeekEntryResult!7969)

(assert (=> b!777658 (= res!526190 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) (Found!7969 j!159))))))

(declare-fun b!777659 () Bool)

(declare-fun res!526191 () Bool)

(assert (=> b!777659 (=> (not res!526191) (not e!432659))))

(assert (=> b!777659 (= res!526191 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20793 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20793 a!3186))))))

(declare-fun b!777660 () Bool)

(declare-fun res!526182 () Bool)

(assert (=> b!777660 (=> (not res!526182) (not e!432658))))

(assert (=> b!777660 (= res!526182 (validKeyInArray!0 (select (arr!20372 a!3186) j!159)))))

(declare-fun e!432661 () Bool)

(declare-fun b!777661 () Bool)

(declare-fun lt!346334 () SeekEntryResult!7969)

(assert (=> b!777661 (= e!432661 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) lt!346334))))

(declare-fun b!777662 () Bool)

(assert (=> b!777662 (= e!432663 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) lt!346335))))

(declare-fun b!777663 () Bool)

(assert (=> b!777663 (= e!432663 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) (Found!7969 j!159)))))

(declare-fun b!777664 () Bool)

(assert (=> b!777664 (= e!432658 e!432659)))

(declare-fun res!526189 () Bool)

(assert (=> b!777664 (=> (not res!526189) (not e!432659))))

(declare-fun lt!346329 () SeekEntryResult!7969)

(assert (=> b!777664 (= res!526189 (or (= lt!346329 (MissingZero!7969 i!1173)) (= lt!346329 (MissingVacant!7969 i!1173))))))

(assert (=> b!777664 (= lt!346329 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777665 () Bool)

(assert (=> b!777665 (= e!432664 e!432657)))

(declare-fun res!526186 () Bool)

(assert (=> b!777665 (=> (not res!526186) (not e!432657))))

(declare-fun lt!346330 () SeekEntryResult!7969)

(assert (=> b!777665 (= res!526186 (= lt!346330 lt!346332))))

(assert (=> b!777665 (= lt!346332 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346337 lt!346333 mask!3328))))

(assert (=> b!777665 (= lt!346330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346337 mask!3328) lt!346337 lt!346333 mask!3328))))

(assert (=> b!777665 (= lt!346337 (select (store (arr!20372 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777665 (= lt!346333 (array!42556 (store (arr!20372 a!3186) i!1173 k0!2102) (size!20793 a!3186)))))

(declare-fun b!777666 () Bool)

(assert (=> b!777666 (= e!432656 e!432661)))

(declare-fun res!526180 () Bool)

(assert (=> b!777666 (=> (not res!526180) (not e!432661))))

(assert (=> b!777666 (= res!526180 (= (seekEntryOrOpen!0 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) lt!346334))))

(assert (=> b!777666 (= lt!346334 (Found!7969 j!159))))

(declare-fun b!777667 () Bool)

(declare-fun res!526178 () Bool)

(assert (=> b!777667 (=> (not res!526178) (not e!432658))))

(declare-fun arrayContainsKey!0 (array!42555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777667 (= res!526178 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777668 () Bool)

(declare-fun res!526177 () Bool)

(assert (=> b!777668 (=> (not res!526177) (not e!432659))))

(assert (=> b!777668 (= res!526177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67244 res!526183) b!777652))

(assert (= (and b!777652 res!526188) b!777660))

(assert (= (and b!777660 res!526182) b!777649))

(assert (= (and b!777649 res!526185) b!777667))

(assert (= (and b!777667 res!526178) b!777664))

(assert (= (and b!777664 res!526189) b!777668))

(assert (= (and b!777668 res!526177) b!777651))

(assert (= (and b!777651 res!526181) b!777659))

(assert (= (and b!777659 res!526191) b!777657))

(assert (= (and b!777657 res!526187) b!777656))

(assert (= (and b!777656 res!526175) b!777653))

(assert (= (and b!777653 c!86139) b!777662))

(assert (= (and b!777653 (not c!86139)) b!777663))

(assert (= (and b!777653 res!526174) b!777665))

(assert (= (and b!777665 res!526186) b!777650))

(assert (= (and b!777650 res!526176) b!777666))

(assert (= (and b!777666 res!526180) b!777661))

(assert (= (and b!777650 (not res!526184)) b!777658))

(assert (= (and b!777658 (not res!526190)) b!777655))

(assert (= (and b!777655 (not res!526179)) b!777654))

(declare-fun m!720933 () Bool)

(assert (=> b!777660 m!720933))

(assert (=> b!777660 m!720933))

(declare-fun m!720935 () Bool)

(assert (=> b!777660 m!720935))

(declare-fun m!720937 () Bool)

(assert (=> b!777665 m!720937))

(declare-fun m!720939 () Bool)

(assert (=> b!777665 m!720939))

(declare-fun m!720941 () Bool)

(assert (=> b!777665 m!720941))

(assert (=> b!777665 m!720937))

(declare-fun m!720943 () Bool)

(assert (=> b!777665 m!720943))

(declare-fun m!720945 () Bool)

(assert (=> b!777665 m!720945))

(declare-fun m!720947 () Bool)

(assert (=> start!67244 m!720947))

(declare-fun m!720949 () Bool)

(assert (=> start!67244 m!720949))

(declare-fun m!720951 () Bool)

(assert (=> b!777664 m!720951))

(declare-fun m!720953 () Bool)

(assert (=> b!777650 m!720953))

(declare-fun m!720955 () Bool)

(assert (=> b!777650 m!720955))

(assert (=> b!777661 m!720933))

(assert (=> b!777661 m!720933))

(declare-fun m!720957 () Bool)

(assert (=> b!777661 m!720957))

(declare-fun m!720959 () Bool)

(assert (=> b!777651 m!720959))

(declare-fun m!720961 () Bool)

(assert (=> b!777656 m!720961))

(assert (=> b!777663 m!720933))

(assert (=> b!777663 m!720933))

(declare-fun m!720963 () Bool)

(assert (=> b!777663 m!720963))

(declare-fun m!720965 () Bool)

(assert (=> b!777654 m!720965))

(assert (=> b!777662 m!720933))

(assert (=> b!777662 m!720933))

(declare-fun m!720967 () Bool)

(assert (=> b!777662 m!720967))

(assert (=> b!777666 m!720933))

(assert (=> b!777666 m!720933))

(declare-fun m!720969 () Bool)

(assert (=> b!777666 m!720969))

(assert (=> b!777655 m!720941))

(declare-fun m!720971 () Bool)

(assert (=> b!777655 m!720971))

(declare-fun m!720973 () Bool)

(assert (=> b!777668 m!720973))

(assert (=> b!777657 m!720933))

(assert (=> b!777657 m!720933))

(declare-fun m!720975 () Bool)

(assert (=> b!777657 m!720975))

(assert (=> b!777657 m!720975))

(assert (=> b!777657 m!720933))

(declare-fun m!720977 () Bool)

(assert (=> b!777657 m!720977))

(declare-fun m!720979 () Bool)

(assert (=> b!777667 m!720979))

(assert (=> b!777658 m!720933))

(assert (=> b!777658 m!720933))

(assert (=> b!777658 m!720963))

(declare-fun m!720981 () Bool)

(assert (=> b!777649 m!720981))

(check-sat (not b!777665) (not b!777651) (not b!777662) (not b!777667) (not b!777658) (not b!777664) (not b!777663) (not b!777661) (not b!777668) (not b!777654) (not b!777666) (not b!777650) (not b!777649) (not b!777657) (not start!67244) (not b!777660))
(check-sat)
