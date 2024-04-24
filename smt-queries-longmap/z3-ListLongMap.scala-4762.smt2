; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65760 () Bool)

(assert start!65760)

(declare-fun b!751979 () Bool)

(declare-fun res!507466 () Bool)

(declare-fun e!419568 () Bool)

(assert (=> b!751979 (=> (not res!507466) (not e!419568))))

(declare-fun e!419571 () Bool)

(assert (=> b!751979 (= res!507466 e!419571)))

(declare-fun c!82648 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751979 (= c!82648 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751980 () Bool)

(declare-fun e!419570 () Bool)

(assert (=> b!751980 (= e!419570 true)))

(declare-fun e!419567 () Bool)

(assert (=> b!751980 e!419567))

(declare-fun res!507465 () Bool)

(assert (=> b!751980 (=> (not res!507465) (not e!419567))))

(declare-fun lt!334398 () (_ BitVec 64))

(assert (=> b!751980 (= res!507465 (= lt!334398 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25825 0))(
  ( (Unit!25826) )
))
(declare-fun lt!334391 () Unit!25825)

(declare-fun e!419574 () Unit!25825)

(assert (=> b!751980 (= lt!334391 e!419574)))

(declare-fun c!82649 () Bool)

(assert (=> b!751980 (= c!82649 (= lt!334398 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751981 () Bool)

(declare-fun res!507458 () Bool)

(declare-fun e!419564 () Bool)

(assert (=> b!751981 (=> (not res!507458) (not e!419564))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41803 0))(
  ( (array!41804 (arr!20011 (Array (_ BitVec 32) (_ BitVec 64))) (size!20431 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41803)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!751981 (= res!507458 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20431 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20431 a!3186))))))

(declare-fun b!751982 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7567 0))(
  ( (MissingZero!7567 (index!32636 (_ BitVec 32))) (Found!7567 (index!32637 (_ BitVec 32))) (Intermediate!7567 (undefined!8379 Bool) (index!32638 (_ BitVec 32)) (x!63721 (_ BitVec 32))) (Undefined!7567) (MissingVacant!7567 (index!32639 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41803 (_ BitVec 32)) SeekEntryResult!7567)

(assert (=> b!751982 (= e!419571 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20011 a!3186) j!159) a!3186 mask!3328) (Found!7567 j!159)))))

(declare-fun b!751983 () Bool)

(declare-fun e!419566 () Bool)

(declare-fun e!419572 () Bool)

(assert (=> b!751983 (= e!419566 (not e!419572))))

(declare-fun res!507460 () Bool)

(assert (=> b!751983 (=> res!507460 e!419572)))

(declare-fun lt!334394 () SeekEntryResult!7567)

(get-info :version)

(assert (=> b!751983 (= res!507460 (or (not ((_ is Intermediate!7567) lt!334394)) (bvslt x!1131 (x!63721 lt!334394)) (not (= x!1131 (x!63721 lt!334394))) (not (= index!1321 (index!32638 lt!334394)))))))

(declare-fun e!419569 () Bool)

(assert (=> b!751983 e!419569))

(declare-fun res!507463 () Bool)

(assert (=> b!751983 (=> (not res!507463) (not e!419569))))

(declare-fun lt!334399 () SeekEntryResult!7567)

(declare-fun lt!334400 () SeekEntryResult!7567)

(assert (=> b!751983 (= res!507463 (= lt!334399 lt!334400))))

(assert (=> b!751983 (= lt!334400 (Found!7567 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41803 (_ BitVec 32)) SeekEntryResult!7567)

(assert (=> b!751983 (= lt!334399 (seekEntryOrOpen!0 (select (arr!20011 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41803 (_ BitVec 32)) Bool)

(assert (=> b!751983 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334397 () Unit!25825)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25825)

(assert (=> b!751983 (= lt!334397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751984 () Bool)

(declare-fun res!507456 () Bool)

(declare-fun e!419573 () Bool)

(assert (=> b!751984 (=> (not res!507456) (not e!419573))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751984 (= res!507456 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751985 () Bool)

(assert (=> b!751985 (= e!419569 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20011 a!3186) j!159) a!3186 mask!3328) lt!334400))))

(declare-fun b!751986 () Bool)

(declare-fun lt!334392 () SeekEntryResult!7567)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41803 (_ BitVec 32)) SeekEntryResult!7567)

(assert (=> b!751986 (= e!419571 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20011 a!3186) j!159) a!3186 mask!3328) lt!334392))))

(declare-fun b!751987 () Bool)

(declare-fun res!507457 () Bool)

(assert (=> b!751987 (=> (not res!507457) (not e!419568))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751987 (= res!507457 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20011 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751988 () Bool)

(declare-fun res!507451 () Bool)

(assert (=> b!751988 (=> (not res!507451) (not e!419564))))

(assert (=> b!751988 (= res!507451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751989 () Bool)

(assert (=> b!751989 (= e!419564 e!419568)))

(declare-fun res!507462 () Bool)

(assert (=> b!751989 (=> (not res!507462) (not e!419568))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751989 (= res!507462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20011 a!3186) j!159) mask!3328) (select (arr!20011 a!3186) j!159) a!3186 mask!3328) lt!334392))))

(assert (=> b!751989 (= lt!334392 (Intermediate!7567 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751990 () Bool)

(declare-fun res!507464 () Bool)

(assert (=> b!751990 (=> (not res!507464) (not e!419573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751990 (= res!507464 (validKeyInArray!0 k0!2102))))

(declare-fun b!751978 () Bool)

(assert (=> b!751978 (= e!419572 e!419570)))

(declare-fun res!507453 () Bool)

(assert (=> b!751978 (=> res!507453 e!419570)))

(declare-fun lt!334401 () (_ BitVec 64))

(assert (=> b!751978 (= res!507453 (= lt!334398 lt!334401))))

(assert (=> b!751978 (= lt!334398 (select (store (arr!20011 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!507450 () Bool)

(assert (=> start!65760 (=> (not res!507450) (not e!419573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65760 (= res!507450 (validMask!0 mask!3328))))

(assert (=> start!65760 e!419573))

(assert (=> start!65760 true))

(declare-fun array_inv!15870 (array!41803) Bool)

(assert (=> start!65760 (array_inv!15870 a!3186)))

(declare-fun b!751991 () Bool)

(assert (=> b!751991 (= e!419573 e!419564)))

(declare-fun res!507461 () Bool)

(assert (=> b!751991 (=> (not res!507461) (not e!419564))))

(declare-fun lt!334393 () SeekEntryResult!7567)

(assert (=> b!751991 (= res!507461 (or (= lt!334393 (MissingZero!7567 i!1173)) (= lt!334393 (MissingVacant!7567 i!1173))))))

(assert (=> b!751991 (= lt!334393 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!334395 () array!41803)

(declare-fun b!751992 () Bool)

(assert (=> b!751992 (= e!419567 (= (seekEntryOrOpen!0 lt!334401 lt!334395 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334401 lt!334395 mask!3328)))))

(declare-fun b!751993 () Bool)

(declare-fun Unit!25827 () Unit!25825)

(assert (=> b!751993 (= e!419574 Unit!25827)))

(declare-fun b!751994 () Bool)

(assert (=> b!751994 (= e!419568 e!419566)))

(declare-fun res!507459 () Bool)

(assert (=> b!751994 (=> (not res!507459) (not e!419566))))

(declare-fun lt!334396 () SeekEntryResult!7567)

(assert (=> b!751994 (= res!507459 (= lt!334396 lt!334394))))

(assert (=> b!751994 (= lt!334394 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334401 lt!334395 mask!3328))))

(assert (=> b!751994 (= lt!334396 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334401 mask!3328) lt!334401 lt!334395 mask!3328))))

(assert (=> b!751994 (= lt!334401 (select (store (arr!20011 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751994 (= lt!334395 (array!41804 (store (arr!20011 a!3186) i!1173 k0!2102) (size!20431 a!3186)))))

(declare-fun b!751995 () Bool)

(declare-fun res!507449 () Bool)

(assert (=> b!751995 (=> (not res!507449) (not e!419564))))

(declare-datatypes ((List!13920 0))(
  ( (Nil!13917) (Cons!13916 (h!14994 (_ BitVec 64)) (t!20227 List!13920)) )
))
(declare-fun arrayNoDuplicates!0 (array!41803 (_ BitVec 32) List!13920) Bool)

(assert (=> b!751995 (= res!507449 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13917))))

(declare-fun b!751996 () Bool)

(declare-fun Unit!25828 () Unit!25825)

(assert (=> b!751996 (= e!419574 Unit!25828)))

(assert (=> b!751996 false))

(declare-fun b!751997 () Bool)

(declare-fun res!507455 () Bool)

(assert (=> b!751997 (=> (not res!507455) (not e!419573))))

(assert (=> b!751997 (= res!507455 (and (= (size!20431 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20431 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20431 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751998 () Bool)

(declare-fun res!507454 () Bool)

(assert (=> b!751998 (=> (not res!507454) (not e!419573))))

(assert (=> b!751998 (= res!507454 (validKeyInArray!0 (select (arr!20011 a!3186) j!159)))))

(declare-fun b!751999 () Bool)

(declare-fun res!507452 () Bool)

(assert (=> b!751999 (=> res!507452 e!419572)))

(assert (=> b!751999 (= res!507452 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20011 a!3186) j!159) a!3186 mask!3328) lt!334400)))))

(assert (= (and start!65760 res!507450) b!751997))

(assert (= (and b!751997 res!507455) b!751998))

(assert (= (and b!751998 res!507454) b!751990))

(assert (= (and b!751990 res!507464) b!751984))

(assert (= (and b!751984 res!507456) b!751991))

(assert (= (and b!751991 res!507461) b!751988))

(assert (= (and b!751988 res!507451) b!751995))

(assert (= (and b!751995 res!507449) b!751981))

(assert (= (and b!751981 res!507458) b!751989))

(assert (= (and b!751989 res!507462) b!751987))

(assert (= (and b!751987 res!507457) b!751979))

(assert (= (and b!751979 c!82648) b!751986))

(assert (= (and b!751979 (not c!82648)) b!751982))

(assert (= (and b!751979 res!507466) b!751994))

(assert (= (and b!751994 res!507459) b!751983))

(assert (= (and b!751983 res!507463) b!751985))

(assert (= (and b!751983 (not res!507460)) b!751999))

(assert (= (and b!751999 (not res!507452)) b!751978))

(assert (= (and b!751978 (not res!507453)) b!751980))

(assert (= (and b!751980 c!82649) b!751996))

(assert (= (and b!751980 (not c!82649)) b!751993))

(assert (= (and b!751980 res!507465) b!751992))

(declare-fun m!701619 () Bool)

(assert (=> b!751994 m!701619))

(declare-fun m!701621 () Bool)

(assert (=> b!751994 m!701621))

(declare-fun m!701623 () Bool)

(assert (=> b!751994 m!701623))

(declare-fun m!701625 () Bool)

(assert (=> b!751994 m!701625))

(declare-fun m!701627 () Bool)

(assert (=> b!751994 m!701627))

(assert (=> b!751994 m!701623))

(declare-fun m!701629 () Bool)

(assert (=> b!751999 m!701629))

(assert (=> b!751999 m!701629))

(declare-fun m!701631 () Bool)

(assert (=> b!751999 m!701631))

(declare-fun m!701633 () Bool)

(assert (=> b!751992 m!701633))

(declare-fun m!701635 () Bool)

(assert (=> b!751992 m!701635))

(assert (=> b!751986 m!701629))

(assert (=> b!751986 m!701629))

(declare-fun m!701637 () Bool)

(assert (=> b!751986 m!701637))

(assert (=> b!751989 m!701629))

(assert (=> b!751989 m!701629))

(declare-fun m!701639 () Bool)

(assert (=> b!751989 m!701639))

(assert (=> b!751989 m!701639))

(assert (=> b!751989 m!701629))

(declare-fun m!701641 () Bool)

(assert (=> b!751989 m!701641))

(declare-fun m!701643 () Bool)

(assert (=> start!65760 m!701643))

(declare-fun m!701645 () Bool)

(assert (=> start!65760 m!701645))

(assert (=> b!751998 m!701629))

(assert (=> b!751998 m!701629))

(declare-fun m!701647 () Bool)

(assert (=> b!751998 m!701647))

(assert (=> b!751985 m!701629))

(assert (=> b!751985 m!701629))

(declare-fun m!701649 () Bool)

(assert (=> b!751985 m!701649))

(declare-fun m!701651 () Bool)

(assert (=> b!751991 m!701651))

(declare-fun m!701653 () Bool)

(assert (=> b!751984 m!701653))

(declare-fun m!701655 () Bool)

(assert (=> b!751987 m!701655))

(assert (=> b!751982 m!701629))

(assert (=> b!751982 m!701629))

(assert (=> b!751982 m!701631))

(assert (=> b!751983 m!701629))

(assert (=> b!751983 m!701629))

(declare-fun m!701657 () Bool)

(assert (=> b!751983 m!701657))

(declare-fun m!701659 () Bool)

(assert (=> b!751983 m!701659))

(declare-fun m!701661 () Bool)

(assert (=> b!751983 m!701661))

(declare-fun m!701663 () Bool)

(assert (=> b!751995 m!701663))

(declare-fun m!701665 () Bool)

(assert (=> b!751990 m!701665))

(declare-fun m!701667 () Bool)

(assert (=> b!751988 m!701667))

(assert (=> b!751978 m!701621))

(declare-fun m!701669 () Bool)

(assert (=> b!751978 m!701669))

(check-sat (not b!751994) (not b!751990) (not b!751982) (not b!751986) (not b!751992) (not b!751999) (not b!751984) (not b!751989) (not b!751991) (not b!751983) (not b!751988) (not start!65760) (not b!751985) (not b!751998) (not b!751995))
(check-sat)
