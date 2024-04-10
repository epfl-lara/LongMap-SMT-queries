; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66796 () Bool)

(assert start!66796)

(declare-fun b!770276 () Bool)

(declare-fun e!428872 () Bool)

(declare-fun e!428878 () Bool)

(assert (=> b!770276 (= e!428872 e!428878)))

(declare-fun res!521030 () Bool)

(assert (=> b!770276 (=> (not res!521030) (not e!428878))))

(declare-datatypes ((array!42358 0))(
  ( (array!42359 (arr!20279 (Array (_ BitVec 32) (_ BitVec 64))) (size!20700 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42358)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7879 0))(
  ( (MissingZero!7879 (index!33884 (_ BitVec 32))) (Found!7879 (index!33885 (_ BitVec 32))) (Intermediate!7879 (undefined!8691 Bool) (index!33886 (_ BitVec 32)) (x!64810 (_ BitVec 32))) (Undefined!7879) (MissingVacant!7879 (index!33887 (_ BitVec 32))) )
))
(declare-fun lt!342807 () SeekEntryResult!7879)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42358 (_ BitVec 32)) SeekEntryResult!7879)

(assert (=> b!770276 (= res!521030 (= (seekEntryOrOpen!0 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342807))))

(assert (=> b!770276 (= lt!342807 (Found!7879 j!159))))

(declare-fun b!770277 () Bool)

(declare-fun res!521034 () Bool)

(declare-fun e!428874 () Bool)

(assert (=> b!770277 (=> (not res!521034) (not e!428874))))

(declare-datatypes ((List!14281 0))(
  ( (Nil!14278) (Cons!14277 (h!15376 (_ BitVec 64)) (t!20596 List!14281)) )
))
(declare-fun arrayNoDuplicates!0 (array!42358 (_ BitVec 32) List!14281) Bool)

(assert (=> b!770277 (= res!521034 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14278))))

(declare-fun lt!342810 () SeekEntryResult!7879)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!428871 () Bool)

(declare-fun b!770278 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42358 (_ BitVec 32)) SeekEntryResult!7879)

(assert (=> b!770278 (= e!428871 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342810))))

(declare-fun b!770279 () Bool)

(declare-fun res!521023 () Bool)

(declare-fun e!428877 () Bool)

(assert (=> b!770279 (=> (not res!521023) (not e!428877))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770279 (= res!521023 (validKeyInArray!0 k!2102))))

(declare-fun b!770280 () Bool)

(declare-fun res!521025 () Bool)

(assert (=> b!770280 (=> (not res!521025) (not e!428877))))

(declare-fun arrayContainsKey!0 (array!42358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770280 (= res!521025 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770281 () Bool)

(declare-fun e!428876 () Bool)

(declare-fun e!428870 () Bool)

(assert (=> b!770281 (= e!428876 e!428870)))

(declare-fun res!521024 () Bool)

(assert (=> b!770281 (=> (not res!521024) (not e!428870))))

(declare-fun lt!342808 () SeekEntryResult!7879)

(declare-fun lt!342809 () SeekEntryResult!7879)

(assert (=> b!770281 (= res!521024 (= lt!342808 lt!342809))))

(declare-fun lt!342813 () array!42358)

(declare-fun lt!342814 () (_ BitVec 64))

(assert (=> b!770281 (= lt!342809 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342814 lt!342813 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770281 (= lt!342808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342814 mask!3328) lt!342814 lt!342813 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770281 (= lt!342814 (select (store (arr!20279 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770281 (= lt!342813 (array!42359 (store (arr!20279 a!3186) i!1173 k!2102) (size!20700 a!3186)))))

(declare-fun b!770282 () Bool)

(declare-fun res!521026 () Bool)

(assert (=> b!770282 (=> (not res!521026) (not e!428874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42358 (_ BitVec 32)) Bool)

(assert (=> b!770282 (= res!521026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!521021 () Bool)

(assert (=> start!66796 (=> (not res!521021) (not e!428877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66796 (= res!521021 (validMask!0 mask!3328))))

(assert (=> start!66796 e!428877))

(assert (=> start!66796 true))

(declare-fun array_inv!16075 (array!42358) Bool)

(assert (=> start!66796 (array_inv!16075 a!3186)))

(declare-fun b!770283 () Bool)

(declare-datatypes ((Unit!26530 0))(
  ( (Unit!26531) )
))
(declare-fun e!428873 () Unit!26530)

(declare-fun Unit!26532 () Unit!26530)

(assert (=> b!770283 (= e!428873 Unit!26532)))

(declare-fun lt!342811 () (_ BitVec 32))

(assert (=> b!770283 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342811 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342810)))

(declare-fun b!770284 () Bool)

(declare-fun res!521031 () Bool)

(assert (=> b!770284 (=> (not res!521031) (not e!428877))))

(assert (=> b!770284 (= res!521031 (and (= (size!20700 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20700 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20700 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!770285 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42358 (_ BitVec 32)) SeekEntryResult!7879)

(assert (=> b!770285 (= e!428871 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) (Found!7879 j!159)))))

(declare-fun b!770286 () Bool)

(declare-fun res!521033 () Bool)

(assert (=> b!770286 (=> (not res!521033) (not e!428877))))

(assert (=> b!770286 (= res!521033 (validKeyInArray!0 (select (arr!20279 a!3186) j!159)))))

(declare-fun b!770287 () Bool)

(declare-fun Unit!26533 () Unit!26530)

(assert (=> b!770287 (= e!428873 Unit!26533)))

(declare-fun lt!342805 () SeekEntryResult!7879)

(assert (=> b!770287 (= lt!342805 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20279 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770287 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342811 resIntermediateIndex!5 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) (Found!7879 j!159))))

(declare-fun b!770288 () Bool)

(declare-fun e!428875 () Bool)

(assert (=> b!770288 (= e!428870 (not e!428875))))

(declare-fun res!521029 () Bool)

(assert (=> b!770288 (=> res!521029 e!428875)))

(assert (=> b!770288 (= res!521029 (or (not (is-Intermediate!7879 lt!342809)) (bvsge x!1131 (x!64810 lt!342809))))))

(assert (=> b!770288 e!428872))

(declare-fun res!521022 () Bool)

(assert (=> b!770288 (=> (not res!521022) (not e!428872))))

(assert (=> b!770288 (= res!521022 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342815 () Unit!26530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26530)

(assert (=> b!770288 (= lt!342815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770289 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770289 (= e!428878 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342807))))

(declare-fun b!770290 () Bool)

(assert (=> b!770290 (= e!428874 e!428876)))

(declare-fun res!521036 () Bool)

(assert (=> b!770290 (=> (not res!521036) (not e!428876))))

(assert (=> b!770290 (= res!521036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20279 a!3186) j!159) mask!3328) (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342810))))

(assert (=> b!770290 (= lt!342810 (Intermediate!7879 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770291 () Bool)

(assert (=> b!770291 (= e!428877 e!428874)))

(declare-fun res!521028 () Bool)

(assert (=> b!770291 (=> (not res!521028) (not e!428874))))

(declare-fun lt!342806 () SeekEntryResult!7879)

(assert (=> b!770291 (= res!521028 (or (= lt!342806 (MissingZero!7879 i!1173)) (= lt!342806 (MissingVacant!7879 i!1173))))))

(assert (=> b!770291 (= lt!342806 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!770292 () Bool)

(declare-fun res!521032 () Bool)

(assert (=> b!770292 (=> (not res!521032) (not e!428874))))

(assert (=> b!770292 (= res!521032 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20700 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20700 a!3186))))))

(declare-fun b!770293 () Bool)

(declare-fun res!521035 () Bool)

(assert (=> b!770293 (=> (not res!521035) (not e!428876))))

(assert (=> b!770293 (= res!521035 e!428871)))

(declare-fun c!85024 () Bool)

(assert (=> b!770293 (= c!85024 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770294 () Bool)

(assert (=> b!770294 (= e!428875 true)))

(declare-fun lt!342812 () Unit!26530)

(assert (=> b!770294 (= lt!342812 e!428873)))

(declare-fun c!85023 () Bool)

(assert (=> b!770294 (= c!85023 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770294 (= lt!342811 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770295 () Bool)

(declare-fun res!521027 () Bool)

(assert (=> b!770295 (=> (not res!521027) (not e!428876))))

(assert (=> b!770295 (= res!521027 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20279 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66796 res!521021) b!770284))

(assert (= (and b!770284 res!521031) b!770286))

(assert (= (and b!770286 res!521033) b!770279))

(assert (= (and b!770279 res!521023) b!770280))

(assert (= (and b!770280 res!521025) b!770291))

(assert (= (and b!770291 res!521028) b!770282))

(assert (= (and b!770282 res!521026) b!770277))

(assert (= (and b!770277 res!521034) b!770292))

(assert (= (and b!770292 res!521032) b!770290))

(assert (= (and b!770290 res!521036) b!770295))

(assert (= (and b!770295 res!521027) b!770293))

(assert (= (and b!770293 c!85024) b!770278))

(assert (= (and b!770293 (not c!85024)) b!770285))

(assert (= (and b!770293 res!521035) b!770281))

(assert (= (and b!770281 res!521024) b!770288))

(assert (= (and b!770288 res!521022) b!770276))

(assert (= (and b!770276 res!521030) b!770289))

(assert (= (and b!770288 (not res!521029)) b!770294))

(assert (= (and b!770294 c!85023) b!770283))

(assert (= (and b!770294 (not c!85023)) b!770287))

(declare-fun m!715579 () Bool)

(assert (=> b!770278 m!715579))

(assert (=> b!770278 m!715579))

(declare-fun m!715581 () Bool)

(assert (=> b!770278 m!715581))

(declare-fun m!715583 () Bool)

(assert (=> b!770282 m!715583))

(assert (=> b!770290 m!715579))

(assert (=> b!770290 m!715579))

(declare-fun m!715585 () Bool)

(assert (=> b!770290 m!715585))

(assert (=> b!770290 m!715585))

(assert (=> b!770290 m!715579))

(declare-fun m!715587 () Bool)

(assert (=> b!770290 m!715587))

(assert (=> b!770285 m!715579))

(assert (=> b!770285 m!715579))

(declare-fun m!715589 () Bool)

(assert (=> b!770285 m!715589))

(declare-fun m!715591 () Bool)

(assert (=> b!770288 m!715591))

(declare-fun m!715593 () Bool)

(assert (=> b!770288 m!715593))

(declare-fun m!715595 () Bool)

(assert (=> start!66796 m!715595))

(declare-fun m!715597 () Bool)

(assert (=> start!66796 m!715597))

(declare-fun m!715599 () Bool)

(assert (=> b!770277 m!715599))

(declare-fun m!715601 () Bool)

(assert (=> b!770281 m!715601))

(declare-fun m!715603 () Bool)

(assert (=> b!770281 m!715603))

(declare-fun m!715605 () Bool)

(assert (=> b!770281 m!715605))

(declare-fun m!715607 () Bool)

(assert (=> b!770281 m!715607))

(declare-fun m!715609 () Bool)

(assert (=> b!770281 m!715609))

(assert (=> b!770281 m!715601))

(declare-fun m!715611 () Bool)

(assert (=> b!770280 m!715611))

(assert (=> b!770287 m!715579))

(assert (=> b!770287 m!715579))

(assert (=> b!770287 m!715589))

(assert (=> b!770287 m!715579))

(declare-fun m!715613 () Bool)

(assert (=> b!770287 m!715613))

(declare-fun m!715615 () Bool)

(assert (=> b!770295 m!715615))

(declare-fun m!715617 () Bool)

(assert (=> b!770279 m!715617))

(assert (=> b!770286 m!715579))

(assert (=> b!770286 m!715579))

(declare-fun m!715619 () Bool)

(assert (=> b!770286 m!715619))

(assert (=> b!770283 m!715579))

(assert (=> b!770283 m!715579))

(declare-fun m!715621 () Bool)

(assert (=> b!770283 m!715621))

(declare-fun m!715623 () Bool)

(assert (=> b!770294 m!715623))

(declare-fun m!715625 () Bool)

(assert (=> b!770291 m!715625))

(assert (=> b!770276 m!715579))

(assert (=> b!770276 m!715579))

(declare-fun m!715627 () Bool)

(assert (=> b!770276 m!715627))

(assert (=> b!770289 m!715579))

(assert (=> b!770289 m!715579))

(declare-fun m!715629 () Bool)

(assert (=> b!770289 m!715629))

(push 1)

