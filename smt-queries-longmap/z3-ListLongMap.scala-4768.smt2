; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65648 () Bool)

(assert start!65648)

(declare-fun b!752209 () Bool)

(declare-fun res!508050 () Bool)

(declare-fun e!419566 () Bool)

(assert (=> b!752209 (=> (not res!508050) (not e!419566))))

(declare-datatypes ((array!41838 0))(
  ( (array!41839 (arr!20033 (Array (_ BitVec 32) (_ BitVec 64))) (size!20454 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41838)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41838 (_ BitVec 32)) Bool)

(assert (=> b!752209 (= res!508050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752210 () Bool)

(declare-fun e!419575 () Bool)

(assert (=> b!752210 (= e!419575 e!419566)))

(declare-fun res!508056 () Bool)

(assert (=> b!752210 (=> (not res!508056) (not e!419566))))

(declare-datatypes ((SeekEntryResult!7630 0))(
  ( (MissingZero!7630 (index!32888 (_ BitVec 32))) (Found!7630 (index!32889 (_ BitVec 32))) (Intermediate!7630 (undefined!8442 Bool) (index!32890 (_ BitVec 32)) (x!63815 (_ BitVec 32))) (Undefined!7630) (MissingVacant!7630 (index!32891 (_ BitVec 32))) )
))
(declare-fun lt!334470 () SeekEntryResult!7630)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752210 (= res!508056 (or (= lt!334470 (MissingZero!7630 i!1173)) (= lt!334470 (MissingVacant!7630 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41838 (_ BitVec 32)) SeekEntryResult!7630)

(assert (=> b!752210 (= lt!334470 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752211 () Bool)

(declare-fun res!508047 () Bool)

(declare-fun e!419569 () Bool)

(assert (=> b!752211 (=> (not res!508047) (not e!419569))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!752211 (= res!508047 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20033 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752212 () Bool)

(declare-fun e!419565 () Bool)

(assert (=> b!752212 (= e!419569 e!419565)))

(declare-fun res!508046 () Bool)

(assert (=> b!752212 (=> (not res!508046) (not e!419565))))

(declare-fun lt!334473 () SeekEntryResult!7630)

(declare-fun lt!334475 () SeekEntryResult!7630)

(assert (=> b!752212 (= res!508046 (= lt!334473 lt!334475))))

(declare-fun lt!334481 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!334476 () array!41838)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41838 (_ BitVec 32)) SeekEntryResult!7630)

(assert (=> b!752212 (= lt!334475 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334481 lt!334476 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752212 (= lt!334473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334481 mask!3328) lt!334481 lt!334476 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!752212 (= lt!334481 (select (store (arr!20033 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752212 (= lt!334476 (array!41839 (store (arr!20033 a!3186) i!1173 k0!2102) (size!20454 a!3186)))))

(declare-fun b!752213 () Bool)

(declare-fun e!419567 () Bool)

(declare-fun e!419564 () Bool)

(assert (=> b!752213 (= e!419567 e!419564)))

(declare-fun res!508059 () Bool)

(assert (=> b!752213 (=> res!508059 e!419564)))

(declare-fun lt!334472 () (_ BitVec 64))

(assert (=> b!752213 (= res!508059 (= lt!334472 lt!334481))))

(assert (=> b!752213 (= lt!334472 (select (store (arr!20033 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752214 () Bool)

(declare-fun res!508055 () Bool)

(assert (=> b!752214 (=> (not res!508055) (not e!419566))))

(declare-datatypes ((List!14074 0))(
  ( (Nil!14071) (Cons!14070 (h!15142 (_ BitVec 64)) (t!20380 List!14074)) )
))
(declare-fun arrayNoDuplicates!0 (array!41838 (_ BitVec 32) List!14074) Bool)

(assert (=> b!752214 (= res!508055 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14071))))

(declare-fun res!508045 () Bool)

(assert (=> start!65648 (=> (not res!508045) (not e!419575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65648 (= res!508045 (validMask!0 mask!3328))))

(assert (=> start!65648 e!419575))

(assert (=> start!65648 true))

(declare-fun array_inv!15916 (array!41838) Bool)

(assert (=> start!65648 (array_inv!15916 a!3186)))

(declare-fun e!419573 () Bool)

(declare-fun lt!334477 () SeekEntryResult!7630)

(declare-fun b!752215 () Bool)

(assert (=> b!752215 (= e!419573 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20033 a!3186) j!159) a!3186 mask!3328) lt!334477))))

(declare-fun b!752216 () Bool)

(declare-fun res!508054 () Bool)

(declare-fun e!419568 () Bool)

(assert (=> b!752216 (=> (not res!508054) (not e!419568))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41838 (_ BitVec 32)) SeekEntryResult!7630)

(assert (=> b!752216 (= res!508054 (= (seekEntryOrOpen!0 lt!334481 lt!334476 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334481 lt!334476 mask!3328)))))

(declare-fun b!752217 () Bool)

(declare-fun res!508048 () Bool)

(assert (=> b!752217 (=> (not res!508048) (not e!419575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752217 (= res!508048 (validKeyInArray!0 (select (arr!20033 a!3186) j!159)))))

(declare-fun b!752218 () Bool)

(assert (=> b!752218 (= e!419566 e!419569)))

(declare-fun res!508049 () Bool)

(assert (=> b!752218 (=> (not res!508049) (not e!419569))))

(assert (=> b!752218 (= res!508049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20033 a!3186) j!159) mask!3328) (select (arr!20033 a!3186) j!159) a!3186 mask!3328) lt!334477))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752218 (= lt!334477 (Intermediate!7630 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752219 () Bool)

(assert (=> b!752219 (= e!419573 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20033 a!3186) j!159) a!3186 mask!3328) (Found!7630 j!159)))))

(declare-fun b!752220 () Bool)

(assert (=> b!752220 (= e!419564 true)))

(assert (=> b!752220 e!419568))

(declare-fun res!508051 () Bool)

(assert (=> b!752220 (=> (not res!508051) (not e!419568))))

(assert (=> b!752220 (= res!508051 (= lt!334472 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25880 0))(
  ( (Unit!25881) )
))
(declare-fun lt!334478 () Unit!25880)

(declare-fun e!419570 () Unit!25880)

(assert (=> b!752220 (= lt!334478 e!419570)))

(declare-fun c!82463 () Bool)

(assert (=> b!752220 (= c!82463 (= lt!334472 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752221 () Bool)

(declare-fun e!419571 () Bool)

(assert (=> b!752221 (= e!419565 (not e!419571))))

(declare-fun res!508061 () Bool)

(assert (=> b!752221 (=> res!508061 e!419571)))

(get-info :version)

(assert (=> b!752221 (= res!508061 (or (not ((_ is Intermediate!7630) lt!334475)) (bvslt x!1131 (x!63815 lt!334475)) (not (= x!1131 (x!63815 lt!334475))) (not (= index!1321 (index!32890 lt!334475)))))))

(declare-fun e!419572 () Bool)

(assert (=> b!752221 e!419572))

(declare-fun res!508060 () Bool)

(assert (=> b!752221 (=> (not res!508060) (not e!419572))))

(declare-fun lt!334480 () SeekEntryResult!7630)

(declare-fun lt!334474 () SeekEntryResult!7630)

(assert (=> b!752221 (= res!508060 (= lt!334480 lt!334474))))

(assert (=> b!752221 (= lt!334474 (Found!7630 j!159))))

(assert (=> b!752221 (= lt!334480 (seekEntryOrOpen!0 (select (arr!20033 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752221 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334471 () Unit!25880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25880)

(assert (=> b!752221 (= lt!334471 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752222 () Bool)

(declare-fun res!508062 () Bool)

(assert (=> b!752222 (=> (not res!508062) (not e!419575))))

(assert (=> b!752222 (= res!508062 (and (= (size!20454 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20454 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20454 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752223 () Bool)

(assert (=> b!752223 (= e!419572 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20033 a!3186) j!159) a!3186 mask!3328) lt!334474))))

(declare-fun b!752224 () Bool)

(assert (=> b!752224 (= e!419571 e!419567)))

(declare-fun res!508057 () Bool)

(assert (=> b!752224 (=> res!508057 e!419567)))

(declare-fun lt!334479 () SeekEntryResult!7630)

(assert (=> b!752224 (= res!508057 (not (= lt!334479 lt!334474)))))

(assert (=> b!752224 (= lt!334479 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20033 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752225 () Bool)

(declare-fun res!508052 () Bool)

(assert (=> b!752225 (=> (not res!508052) (not e!419566))))

(assert (=> b!752225 (= res!508052 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20454 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20454 a!3186))))))

(declare-fun b!752226 () Bool)

(assert (=> b!752226 (= e!419568 (= lt!334480 lt!334479))))

(declare-fun b!752227 () Bool)

(declare-fun Unit!25882 () Unit!25880)

(assert (=> b!752227 (= e!419570 Unit!25882)))

(assert (=> b!752227 false))

(declare-fun b!752228 () Bool)

(declare-fun res!508053 () Bool)

(assert (=> b!752228 (=> (not res!508053) (not e!419575))))

(assert (=> b!752228 (= res!508053 (validKeyInArray!0 k0!2102))))

(declare-fun b!752229 () Bool)

(declare-fun res!508058 () Bool)

(assert (=> b!752229 (=> (not res!508058) (not e!419569))))

(assert (=> b!752229 (= res!508058 e!419573)))

(declare-fun c!82464 () Bool)

(assert (=> b!752229 (= c!82464 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752230 () Bool)

(declare-fun res!508044 () Bool)

(assert (=> b!752230 (=> (not res!508044) (not e!419575))))

(declare-fun arrayContainsKey!0 (array!41838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752230 (= res!508044 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752231 () Bool)

(declare-fun Unit!25883 () Unit!25880)

(assert (=> b!752231 (= e!419570 Unit!25883)))

(assert (= (and start!65648 res!508045) b!752222))

(assert (= (and b!752222 res!508062) b!752217))

(assert (= (and b!752217 res!508048) b!752228))

(assert (= (and b!752228 res!508053) b!752230))

(assert (= (and b!752230 res!508044) b!752210))

(assert (= (and b!752210 res!508056) b!752209))

(assert (= (and b!752209 res!508050) b!752214))

(assert (= (and b!752214 res!508055) b!752225))

(assert (= (and b!752225 res!508052) b!752218))

(assert (= (and b!752218 res!508049) b!752211))

(assert (= (and b!752211 res!508047) b!752229))

(assert (= (and b!752229 c!82464) b!752215))

(assert (= (and b!752229 (not c!82464)) b!752219))

(assert (= (and b!752229 res!508058) b!752212))

(assert (= (and b!752212 res!508046) b!752221))

(assert (= (and b!752221 res!508060) b!752223))

(assert (= (and b!752221 (not res!508061)) b!752224))

(assert (= (and b!752224 (not res!508057)) b!752213))

(assert (= (and b!752213 (not res!508059)) b!752220))

(assert (= (and b!752220 c!82463) b!752227))

(assert (= (and b!752220 (not c!82463)) b!752231))

(assert (= (and b!752220 res!508051) b!752216))

(assert (= (and b!752216 res!508054) b!752226))

(declare-fun m!700637 () Bool)

(assert (=> b!752218 m!700637))

(assert (=> b!752218 m!700637))

(declare-fun m!700639 () Bool)

(assert (=> b!752218 m!700639))

(assert (=> b!752218 m!700639))

(assert (=> b!752218 m!700637))

(declare-fun m!700641 () Bool)

(assert (=> b!752218 m!700641))

(declare-fun m!700643 () Bool)

(assert (=> b!752209 m!700643))

(assert (=> b!752219 m!700637))

(assert (=> b!752219 m!700637))

(declare-fun m!700645 () Bool)

(assert (=> b!752219 m!700645))

(declare-fun m!700647 () Bool)

(assert (=> b!752213 m!700647))

(declare-fun m!700649 () Bool)

(assert (=> b!752213 m!700649))

(assert (=> b!752223 m!700637))

(assert (=> b!752223 m!700637))

(declare-fun m!700651 () Bool)

(assert (=> b!752223 m!700651))

(declare-fun m!700653 () Bool)

(assert (=> b!752211 m!700653))

(assert (=> b!752215 m!700637))

(assert (=> b!752215 m!700637))

(declare-fun m!700655 () Bool)

(assert (=> b!752215 m!700655))

(declare-fun m!700657 () Bool)

(assert (=> b!752214 m!700657))

(declare-fun m!700659 () Bool)

(assert (=> b!752230 m!700659))

(assert (=> b!752221 m!700637))

(assert (=> b!752221 m!700637))

(declare-fun m!700661 () Bool)

(assert (=> b!752221 m!700661))

(declare-fun m!700663 () Bool)

(assert (=> b!752221 m!700663))

(declare-fun m!700665 () Bool)

(assert (=> b!752221 m!700665))

(declare-fun m!700667 () Bool)

(assert (=> b!752216 m!700667))

(declare-fun m!700669 () Bool)

(assert (=> b!752216 m!700669))

(declare-fun m!700671 () Bool)

(assert (=> b!752210 m!700671))

(declare-fun m!700673 () Bool)

(assert (=> b!752228 m!700673))

(assert (=> b!752224 m!700637))

(assert (=> b!752224 m!700637))

(assert (=> b!752224 m!700645))

(declare-fun m!700675 () Bool)

(assert (=> start!65648 m!700675))

(declare-fun m!700677 () Bool)

(assert (=> start!65648 m!700677))

(declare-fun m!700679 () Bool)

(assert (=> b!752212 m!700679))

(declare-fun m!700681 () Bool)

(assert (=> b!752212 m!700681))

(declare-fun m!700683 () Bool)

(assert (=> b!752212 m!700683))

(assert (=> b!752212 m!700647))

(declare-fun m!700685 () Bool)

(assert (=> b!752212 m!700685))

(assert (=> b!752212 m!700679))

(assert (=> b!752217 m!700637))

(assert (=> b!752217 m!700637))

(declare-fun m!700687 () Bool)

(assert (=> b!752217 m!700687))

(check-sat (not b!752230) (not b!752217) (not b!752214) (not b!752212) (not b!752221) (not b!752216) (not b!752228) (not b!752218) (not b!752219) (not b!752215) (not b!752209) (not b!752224) (not b!752210) (not b!752223) (not start!65648))
(check-sat)
