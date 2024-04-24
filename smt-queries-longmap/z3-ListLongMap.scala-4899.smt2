; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67690 () Bool)

(assert start!67690)

(declare-fun b!782974 () Bool)

(declare-fun res!529637 () Bool)

(declare-fun e!435446 () Bool)

(assert (=> b!782974 (=> (not res!529637) (not e!435446))))

(declare-datatypes ((array!42673 0))(
  ( (array!42674 (arr!20422 (Array (_ BitVec 32) (_ BitVec 64))) (size!20842 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42673)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42673 (_ BitVec 32)) Bool)

(assert (=> b!782974 (= res!529637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782975 () Bool)

(declare-fun res!529632 () Bool)

(assert (=> b!782975 (=> (not res!529632) (not e!435446))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782975 (= res!529632 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20842 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20842 a!3186))))))

(declare-fun b!782976 () Bool)

(declare-fun e!435443 () Bool)

(assert (=> b!782976 (= e!435443 e!435446)))

(declare-fun res!529631 () Bool)

(assert (=> b!782976 (=> (not res!529631) (not e!435446))))

(declare-datatypes ((SeekEntryResult!7978 0))(
  ( (MissingZero!7978 (index!34280 (_ BitVec 32))) (Found!7978 (index!34281 (_ BitVec 32))) (Intermediate!7978 (undefined!8790 Bool) (index!34282 (_ BitVec 32)) (x!65392 (_ BitVec 32))) (Undefined!7978) (MissingVacant!7978 (index!34283 (_ BitVec 32))) )
))
(declare-fun lt!348927 () SeekEntryResult!7978)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782976 (= res!529631 (or (= lt!348927 (MissingZero!7978 i!1173)) (= lt!348927 (MissingVacant!7978 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42673 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!782976 (= lt!348927 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!435441 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!782977 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42673 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!782977 (= e!435441 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20422 a!3186) j!159) a!3186 mask!3328) (Found!7978 j!159)))))

(declare-fun b!782978 () Bool)

(declare-datatypes ((Unit!26977 0))(
  ( (Unit!26978) )
))
(declare-fun e!435448 () Unit!26977)

(declare-fun Unit!26979 () Unit!26977)

(assert (=> b!782978 (= e!435448 Unit!26979)))

(declare-fun b!782979 () Bool)

(declare-fun res!529629 () Bool)

(declare-fun e!435444 () Bool)

(assert (=> b!782979 (=> (not res!529629) (not e!435444))))

(assert (=> b!782979 (= res!529629 e!435441)))

(declare-fun c!87086 () Bool)

(assert (=> b!782979 (= c!87086 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782981 () Bool)

(declare-fun res!529636 () Bool)

(assert (=> b!782981 (=> (not res!529636) (not e!435443))))

(declare-fun arrayContainsKey!0 (array!42673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782981 (= res!529636 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782982 () Bool)

(declare-fun res!529624 () Bool)

(assert (=> b!782982 (=> (not res!529624) (not e!435443))))

(assert (=> b!782982 (= res!529624 (and (= (size!20842 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20842 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20842 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782983 () Bool)

(declare-fun e!435447 () Bool)

(assert (=> b!782983 (= e!435444 e!435447)))

(declare-fun res!529625 () Bool)

(assert (=> b!782983 (=> (not res!529625) (not e!435447))))

(declare-fun lt!348922 () SeekEntryResult!7978)

(declare-fun lt!348923 () SeekEntryResult!7978)

(assert (=> b!782983 (= res!529625 (= lt!348922 lt!348923))))

(declare-fun lt!348931 () (_ BitVec 64))

(declare-fun lt!348930 () array!42673)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42673 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!782983 (= lt!348923 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348931 lt!348930 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782983 (= lt!348922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348931 mask!3328) lt!348931 lt!348930 mask!3328))))

(assert (=> b!782983 (= lt!348931 (select (store (arr!20422 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782983 (= lt!348930 (array!42674 (store (arr!20422 a!3186) i!1173 k0!2102) (size!20842 a!3186)))))

(declare-fun b!782984 () Bool)

(declare-fun res!529634 () Bool)

(assert (=> b!782984 (=> (not res!529634) (not e!435443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782984 (= res!529634 (validKeyInArray!0 (select (arr!20422 a!3186) j!159)))))

(declare-fun b!782985 () Bool)

(declare-fun e!435440 () Bool)

(assert (=> b!782985 (= e!435440 true)))

(assert (=> b!782985 (= (select (store (arr!20422 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348928 () Unit!26977)

(assert (=> b!782985 (= lt!348928 e!435448)))

(declare-fun c!87085 () Bool)

(assert (=> b!782985 (= c!87085 (= (select (store (arr!20422 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782986 () Bool)

(declare-fun Unit!26980 () Unit!26977)

(assert (=> b!782986 (= e!435448 Unit!26980)))

(assert (=> b!782986 false))

(declare-fun b!782987 () Bool)

(declare-fun res!529635 () Bool)

(assert (=> b!782987 (=> (not res!529635) (not e!435446))))

(declare-datatypes ((List!14331 0))(
  ( (Nil!14328) (Cons!14327 (h!15453 (_ BitVec 64)) (t!20638 List!14331)) )
))
(declare-fun arrayNoDuplicates!0 (array!42673 (_ BitVec 32) List!14331) Bool)

(assert (=> b!782987 (= res!529635 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14328))))

(declare-fun b!782988 () Bool)

(declare-fun res!529630 () Bool)

(assert (=> b!782988 (=> (not res!529630) (not e!435444))))

(assert (=> b!782988 (= res!529630 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20422 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782989 () Bool)

(assert (=> b!782989 (= e!435446 e!435444)))

(declare-fun res!529638 () Bool)

(assert (=> b!782989 (=> (not res!529638) (not e!435444))))

(declare-fun lt!348925 () SeekEntryResult!7978)

(assert (=> b!782989 (= res!529638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20422 a!3186) j!159) mask!3328) (select (arr!20422 a!3186) j!159) a!3186 mask!3328) lt!348925))))

(assert (=> b!782989 (= lt!348925 (Intermediate!7978 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782990 () Bool)

(assert (=> b!782990 (= e!435441 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20422 a!3186) j!159) a!3186 mask!3328) lt!348925))))

(declare-fun lt!348924 () SeekEntryResult!7978)

(declare-fun e!435445 () Bool)

(declare-fun b!782980 () Bool)

(assert (=> b!782980 (= e!435445 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20422 a!3186) j!159) a!3186 mask!3328) lt!348924))))

(declare-fun res!529628 () Bool)

(assert (=> start!67690 (=> (not res!529628) (not e!435443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67690 (= res!529628 (validMask!0 mask!3328))))

(assert (=> start!67690 e!435443))

(assert (=> start!67690 true))

(declare-fun array_inv!16281 (array!42673) Bool)

(assert (=> start!67690 (array_inv!16281 a!3186)))

(declare-fun b!782991 () Bool)

(assert (=> b!782991 (= e!435447 (not e!435440))))

(declare-fun res!529626 () Bool)

(assert (=> b!782991 (=> res!529626 e!435440)))

(get-info :version)

(assert (=> b!782991 (= res!529626 (or (not ((_ is Intermediate!7978) lt!348923)) (bvslt x!1131 (x!65392 lt!348923)) (not (= x!1131 (x!65392 lt!348923))) (not (= index!1321 (index!34282 lt!348923)))))))

(assert (=> b!782991 e!435445))

(declare-fun res!529623 () Bool)

(assert (=> b!782991 (=> (not res!529623) (not e!435445))))

(declare-fun lt!348926 () SeekEntryResult!7978)

(assert (=> b!782991 (= res!529623 (= lt!348926 lt!348924))))

(assert (=> b!782991 (= lt!348924 (Found!7978 j!159))))

(assert (=> b!782991 (= lt!348926 (seekEntryOrOpen!0 (select (arr!20422 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782991 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348929 () Unit!26977)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26977)

(assert (=> b!782991 (= lt!348929 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782992 () Bool)

(declare-fun res!529627 () Bool)

(assert (=> b!782992 (=> res!529627 e!435440)))

(assert (=> b!782992 (= res!529627 (= (select (store (arr!20422 a!3186) i!1173 k0!2102) index!1321) lt!348931))))

(declare-fun b!782993 () Bool)

(declare-fun res!529633 () Bool)

(assert (=> b!782993 (=> (not res!529633) (not e!435443))))

(assert (=> b!782993 (= res!529633 (validKeyInArray!0 k0!2102))))

(declare-fun b!782994 () Bool)

(declare-fun res!529622 () Bool)

(assert (=> b!782994 (=> res!529622 e!435440)))

(assert (=> b!782994 (= res!529622 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20422 a!3186) j!159) a!3186 mask!3328) lt!348924)))))

(assert (= (and start!67690 res!529628) b!782982))

(assert (= (and b!782982 res!529624) b!782984))

(assert (= (and b!782984 res!529634) b!782993))

(assert (= (and b!782993 res!529633) b!782981))

(assert (= (and b!782981 res!529636) b!782976))

(assert (= (and b!782976 res!529631) b!782974))

(assert (= (and b!782974 res!529637) b!782987))

(assert (= (and b!782987 res!529635) b!782975))

(assert (= (and b!782975 res!529632) b!782989))

(assert (= (and b!782989 res!529638) b!782988))

(assert (= (and b!782988 res!529630) b!782979))

(assert (= (and b!782979 c!87086) b!782990))

(assert (= (and b!782979 (not c!87086)) b!782977))

(assert (= (and b!782979 res!529629) b!782983))

(assert (= (and b!782983 res!529625) b!782991))

(assert (= (and b!782991 res!529623) b!782980))

(assert (= (and b!782991 (not res!529626)) b!782994))

(assert (= (and b!782994 (not res!529622)) b!782992))

(assert (= (and b!782992 (not res!529627)) b!782985))

(assert (= (and b!782985 c!87085) b!782986))

(assert (= (and b!782985 (not c!87085)) b!782978))

(declare-fun m!726209 () Bool)

(assert (=> b!782989 m!726209))

(assert (=> b!782989 m!726209))

(declare-fun m!726211 () Bool)

(assert (=> b!782989 m!726211))

(assert (=> b!782989 m!726211))

(assert (=> b!782989 m!726209))

(declare-fun m!726213 () Bool)

(assert (=> b!782989 m!726213))

(declare-fun m!726215 () Bool)

(assert (=> b!782985 m!726215))

(declare-fun m!726217 () Bool)

(assert (=> b!782985 m!726217))

(declare-fun m!726219 () Bool)

(assert (=> b!782987 m!726219))

(assert (=> b!782991 m!726209))

(assert (=> b!782991 m!726209))

(declare-fun m!726221 () Bool)

(assert (=> b!782991 m!726221))

(declare-fun m!726223 () Bool)

(assert (=> b!782991 m!726223))

(declare-fun m!726225 () Bool)

(assert (=> b!782991 m!726225))

(declare-fun m!726227 () Bool)

(assert (=> b!782983 m!726227))

(declare-fun m!726229 () Bool)

(assert (=> b!782983 m!726229))

(assert (=> b!782983 m!726215))

(assert (=> b!782983 m!726227))

(declare-fun m!726231 () Bool)

(assert (=> b!782983 m!726231))

(declare-fun m!726233 () Bool)

(assert (=> b!782983 m!726233))

(declare-fun m!726235 () Bool)

(assert (=> b!782974 m!726235))

(declare-fun m!726237 () Bool)

(assert (=> b!782993 m!726237))

(assert (=> b!782980 m!726209))

(assert (=> b!782980 m!726209))

(declare-fun m!726239 () Bool)

(assert (=> b!782980 m!726239))

(declare-fun m!726241 () Bool)

(assert (=> b!782976 m!726241))

(declare-fun m!726243 () Bool)

(assert (=> b!782988 m!726243))

(assert (=> b!782984 m!726209))

(assert (=> b!782984 m!726209))

(declare-fun m!726245 () Bool)

(assert (=> b!782984 m!726245))

(assert (=> b!782990 m!726209))

(assert (=> b!782990 m!726209))

(declare-fun m!726247 () Bool)

(assert (=> b!782990 m!726247))

(declare-fun m!726249 () Bool)

(assert (=> start!67690 m!726249))

(declare-fun m!726251 () Bool)

(assert (=> start!67690 m!726251))

(assert (=> b!782992 m!726215))

(assert (=> b!782992 m!726217))

(declare-fun m!726253 () Bool)

(assert (=> b!782981 m!726253))

(assert (=> b!782977 m!726209))

(assert (=> b!782977 m!726209))

(declare-fun m!726255 () Bool)

(assert (=> b!782977 m!726255))

(assert (=> b!782994 m!726209))

(assert (=> b!782994 m!726209))

(assert (=> b!782994 m!726255))

(check-sat (not b!782983) (not b!782993) (not b!782989) (not b!782974) (not b!782984) (not b!782991) (not b!782976) (not b!782981) (not b!782977) (not b!782987) (not b!782994) (not start!67690) (not b!782980) (not b!782990))
(check-sat)
