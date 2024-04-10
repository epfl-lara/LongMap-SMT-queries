; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67674 () Bool)

(assert start!67674)

(declare-fun b!783965 () Bool)

(declare-datatypes ((Unit!27068 0))(
  ( (Unit!27069) )
))
(declare-fun e!435893 () Unit!27068)

(declare-fun Unit!27070 () Unit!27068)

(assert (=> b!783965 (= e!435893 Unit!27070)))

(assert (=> b!783965 false))

(declare-fun b!783967 () Bool)

(declare-fun res!530460 () Bool)

(declare-fun e!435885 () Bool)

(assert (=> b!783967 (=> (not res!530460) (not e!435885))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783967 (= res!530460 (validKeyInArray!0 k!2102))))

(declare-fun b!783968 () Bool)

(declare-fun res!530450 () Bool)

(declare-fun e!435895 () Bool)

(assert (=> b!783968 (=> (not res!530450) (not e!435895))))

(declare-datatypes ((array!42714 0))(
  ( (array!42715 (arr!20445 (Array (_ BitVec 32) (_ BitVec 64))) (size!20866 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42714)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42714 (_ BitVec 32)) Bool)

(assert (=> b!783968 (= res!530450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783969 () Bool)

(declare-fun res!530462 () Bool)

(assert (=> b!783969 (=> (not res!530462) (not e!435885))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!783969 (= res!530462 (validKeyInArray!0 (select (arr!20445 a!3186) j!159)))))

(declare-datatypes ((SeekEntryResult!8045 0))(
  ( (MissingZero!8045 (index!34548 (_ BitVec 32))) (Found!8045 (index!34549 (_ BitVec 32))) (Intermediate!8045 (undefined!8857 Bool) (index!34550 (_ BitVec 32)) (x!65505 (_ BitVec 32))) (Undefined!8045) (MissingVacant!8045 (index!34551 (_ BitVec 32))) )
))
(declare-fun lt!349439 () SeekEntryResult!8045)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!783970 () Bool)

(declare-fun e!435889 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42714 (_ BitVec 32)) SeekEntryResult!8045)

(assert (=> b!783970 (= e!435889 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20445 a!3186) j!159) a!3186 mask!3328) lt!349439))))

(declare-fun b!783971 () Bool)

(declare-fun res!530461 () Bool)

(assert (=> b!783971 (=> (not res!530461) (not e!435885))))

(declare-fun arrayContainsKey!0 (array!42714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783971 (= res!530461 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!349438 () SeekEntryResult!8045)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!783972 () Bool)

(declare-fun e!435888 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42714 (_ BitVec 32)) SeekEntryResult!8045)

(assert (=> b!783972 (= e!435888 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20445 a!3186) j!159) a!3186 mask!3328) lt!349438))))

(declare-fun b!783973 () Bool)

(declare-fun e!435891 () Bool)

(assert (=> b!783973 (= e!435891 true)))

(declare-fun e!435886 () Bool)

(assert (=> b!783973 e!435886))

(declare-fun res!530455 () Bool)

(assert (=> b!783973 (=> (not res!530455) (not e!435886))))

(declare-fun lt!349444 () (_ BitVec 64))

(assert (=> b!783973 (= res!530455 (= lt!349444 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349448 () Unit!27068)

(assert (=> b!783973 (= lt!349448 e!435893)))

(declare-fun c!87169 () Bool)

(assert (=> b!783973 (= c!87169 (= lt!349444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783974 () Bool)

(assert (=> b!783974 (= e!435889 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20445 a!3186) j!159) a!3186 mask!3328) (Found!8045 j!159)))))

(declare-fun b!783975 () Bool)

(declare-fun res!530457 () Bool)

(declare-fun e!435896 () Bool)

(assert (=> b!783975 (=> (not res!530457) (not e!435896))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783975 (= res!530457 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20445 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783976 () Bool)

(declare-fun res!530458 () Bool)

(assert (=> b!783976 (=> (not res!530458) (not e!435885))))

(assert (=> b!783976 (= res!530458 (and (= (size!20866 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20866 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20866 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783977 () Bool)

(declare-fun e!435887 () Bool)

(assert (=> b!783977 (= e!435887 e!435891)))

(declare-fun res!530456 () Bool)

(assert (=> b!783977 (=> res!530456 e!435891)))

(declare-fun lt!349437 () (_ BitVec 64))

(assert (=> b!783977 (= res!530456 (= lt!349444 lt!349437))))

(assert (=> b!783977 (= lt!349444 (select (store (arr!20445 a!3186) i!1173 k!2102) index!1321))))

(declare-fun res!530447 () Bool)

(assert (=> start!67674 (=> (not res!530447) (not e!435885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67674 (= res!530447 (validMask!0 mask!3328))))

(assert (=> start!67674 e!435885))

(assert (=> start!67674 true))

(declare-fun array_inv!16241 (array!42714) Bool)

(assert (=> start!67674 (array_inv!16241 a!3186)))

(declare-fun b!783966 () Bool)

(declare-fun e!435894 () Bool)

(assert (=> b!783966 (= e!435896 e!435894)))

(declare-fun res!530452 () Bool)

(assert (=> b!783966 (=> (not res!530452) (not e!435894))))

(declare-fun lt!349442 () SeekEntryResult!8045)

(declare-fun lt!349447 () SeekEntryResult!8045)

(assert (=> b!783966 (= res!530452 (= lt!349442 lt!349447))))

(declare-fun lt!349446 () array!42714)

(assert (=> b!783966 (= lt!349447 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349437 lt!349446 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783966 (= lt!349442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349437 mask!3328) lt!349437 lt!349446 mask!3328))))

(assert (=> b!783966 (= lt!349437 (select (store (arr!20445 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783966 (= lt!349446 (array!42715 (store (arr!20445 a!3186) i!1173 k!2102) (size!20866 a!3186)))))

(declare-fun b!783978 () Bool)

(declare-fun e!435890 () Bool)

(assert (=> b!783978 (= e!435894 (not e!435890))))

(declare-fun res!530451 () Bool)

(assert (=> b!783978 (=> res!530451 e!435890)))

(assert (=> b!783978 (= res!530451 (or (not (is-Intermediate!8045 lt!349447)) (bvslt x!1131 (x!65505 lt!349447)) (not (= x!1131 (x!65505 lt!349447))) (not (= index!1321 (index!34550 lt!349447)))))))

(assert (=> b!783978 e!435888))

(declare-fun res!530445 () Bool)

(assert (=> b!783978 (=> (not res!530445) (not e!435888))))

(declare-fun lt!349445 () SeekEntryResult!8045)

(assert (=> b!783978 (= res!530445 (= lt!349445 lt!349438))))

(assert (=> b!783978 (= lt!349438 (Found!8045 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42714 (_ BitVec 32)) SeekEntryResult!8045)

(assert (=> b!783978 (= lt!349445 (seekEntryOrOpen!0 (select (arr!20445 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783978 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349440 () Unit!27068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27068)

(assert (=> b!783978 (= lt!349440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783979 () Bool)

(declare-fun lt!349443 () SeekEntryResult!8045)

(assert (=> b!783979 (= e!435886 (= lt!349445 lt!349443))))

(declare-fun b!783980 () Bool)

(assert (=> b!783980 (= e!435890 e!435887)))

(declare-fun res!530453 () Bool)

(assert (=> b!783980 (=> res!530453 e!435887)))

(assert (=> b!783980 (= res!530453 (not (= lt!349443 lt!349438)))))

(assert (=> b!783980 (= lt!349443 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20445 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783981 () Bool)

(declare-fun res!530448 () Bool)

(assert (=> b!783981 (=> (not res!530448) (not e!435895))))

(declare-datatypes ((List!14447 0))(
  ( (Nil!14444) (Cons!14443 (h!15566 (_ BitVec 64)) (t!20762 List!14447)) )
))
(declare-fun arrayNoDuplicates!0 (array!42714 (_ BitVec 32) List!14447) Bool)

(assert (=> b!783981 (= res!530448 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14444))))

(declare-fun b!783982 () Bool)

(declare-fun Unit!27071 () Unit!27068)

(assert (=> b!783982 (= e!435893 Unit!27071)))

(declare-fun b!783983 () Bool)

(assert (=> b!783983 (= e!435895 e!435896)))

(declare-fun res!530444 () Bool)

(assert (=> b!783983 (=> (not res!530444) (not e!435896))))

(assert (=> b!783983 (= res!530444 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20445 a!3186) j!159) mask!3328) (select (arr!20445 a!3186) j!159) a!3186 mask!3328) lt!349439))))

(assert (=> b!783983 (= lt!349439 (Intermediate!8045 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783984 () Bool)

(declare-fun res!530454 () Bool)

(assert (=> b!783984 (=> (not res!530454) (not e!435896))))

(assert (=> b!783984 (= res!530454 e!435889)))

(declare-fun c!87168 () Bool)

(assert (=> b!783984 (= c!87168 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783985 () Bool)

(declare-fun res!530449 () Bool)

(assert (=> b!783985 (=> (not res!530449) (not e!435895))))

(assert (=> b!783985 (= res!530449 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20866 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20866 a!3186))))))

(declare-fun b!783986 () Bool)

(assert (=> b!783986 (= e!435885 e!435895)))

(declare-fun res!530459 () Bool)

(assert (=> b!783986 (=> (not res!530459) (not e!435895))))

(declare-fun lt!349441 () SeekEntryResult!8045)

(assert (=> b!783986 (= res!530459 (or (= lt!349441 (MissingZero!8045 i!1173)) (= lt!349441 (MissingVacant!8045 i!1173))))))

(assert (=> b!783986 (= lt!349441 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!783987 () Bool)

(declare-fun res!530446 () Bool)

(assert (=> b!783987 (=> (not res!530446) (not e!435886))))

(assert (=> b!783987 (= res!530446 (= (seekEntryOrOpen!0 lt!349437 lt!349446 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349437 lt!349446 mask!3328)))))

(assert (= (and start!67674 res!530447) b!783976))

(assert (= (and b!783976 res!530458) b!783969))

(assert (= (and b!783969 res!530462) b!783967))

(assert (= (and b!783967 res!530460) b!783971))

(assert (= (and b!783971 res!530461) b!783986))

(assert (= (and b!783986 res!530459) b!783968))

(assert (= (and b!783968 res!530450) b!783981))

(assert (= (and b!783981 res!530448) b!783985))

(assert (= (and b!783985 res!530449) b!783983))

(assert (= (and b!783983 res!530444) b!783975))

(assert (= (and b!783975 res!530457) b!783984))

(assert (= (and b!783984 c!87168) b!783970))

(assert (= (and b!783984 (not c!87168)) b!783974))

(assert (= (and b!783984 res!530454) b!783966))

(assert (= (and b!783966 res!530452) b!783978))

(assert (= (and b!783978 res!530445) b!783972))

(assert (= (and b!783978 (not res!530451)) b!783980))

(assert (= (and b!783980 (not res!530453)) b!783977))

(assert (= (and b!783977 (not res!530456)) b!783973))

(assert (= (and b!783973 c!87169) b!783965))

(assert (= (and b!783973 (not c!87169)) b!783982))

(assert (= (and b!783973 res!530455) b!783987))

(assert (= (and b!783987 res!530446) b!783979))

(declare-fun m!726401 () Bool)

(assert (=> b!783966 m!726401))

(declare-fun m!726403 () Bool)

(assert (=> b!783966 m!726403))

(declare-fun m!726405 () Bool)

(assert (=> b!783966 m!726405))

(declare-fun m!726407 () Bool)

(assert (=> b!783966 m!726407))

(declare-fun m!726409 () Bool)

(assert (=> b!783966 m!726409))

(assert (=> b!783966 m!726401))

(declare-fun m!726411 () Bool)

(assert (=> b!783983 m!726411))

(assert (=> b!783983 m!726411))

(declare-fun m!726413 () Bool)

(assert (=> b!783983 m!726413))

(assert (=> b!783983 m!726413))

(assert (=> b!783983 m!726411))

(declare-fun m!726415 () Bool)

(assert (=> b!783983 m!726415))

(assert (=> b!783969 m!726411))

(assert (=> b!783969 m!726411))

(declare-fun m!726417 () Bool)

(assert (=> b!783969 m!726417))

(assert (=> b!783978 m!726411))

(assert (=> b!783978 m!726411))

(declare-fun m!726419 () Bool)

(assert (=> b!783978 m!726419))

(declare-fun m!726421 () Bool)

(assert (=> b!783978 m!726421))

(declare-fun m!726423 () Bool)

(assert (=> b!783978 m!726423))

(declare-fun m!726425 () Bool)

(assert (=> b!783968 m!726425))

(declare-fun m!726427 () Bool)

(assert (=> b!783967 m!726427))

(declare-fun m!726429 () Bool)

(assert (=> b!783971 m!726429))

(assert (=> b!783980 m!726411))

(assert (=> b!783980 m!726411))

(declare-fun m!726431 () Bool)

(assert (=> b!783980 m!726431))

(assert (=> b!783970 m!726411))

(assert (=> b!783970 m!726411))

(declare-fun m!726433 () Bool)

(assert (=> b!783970 m!726433))

(declare-fun m!726435 () Bool)

(assert (=> b!783986 m!726435))

(declare-fun m!726437 () Bool)

(assert (=> b!783975 m!726437))

(assert (=> b!783972 m!726411))

(assert (=> b!783972 m!726411))

(declare-fun m!726439 () Bool)

(assert (=> b!783972 m!726439))

(declare-fun m!726441 () Bool)

(assert (=> b!783987 m!726441))

(declare-fun m!726443 () Bool)

(assert (=> b!783987 m!726443))

(declare-fun m!726445 () Bool)

(assert (=> start!67674 m!726445))

(declare-fun m!726447 () Bool)

(assert (=> start!67674 m!726447))

(assert (=> b!783974 m!726411))

(assert (=> b!783974 m!726411))

(assert (=> b!783974 m!726431))

(assert (=> b!783977 m!726405))

(declare-fun m!726449 () Bool)

(assert (=> b!783977 m!726449))

(declare-fun m!726451 () Bool)

(assert (=> b!783981 m!726451))

(push 1)

