; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66294 () Bool)

(assert start!66294)

(declare-fun b!764103 () Bool)

(declare-fun e!425618 () Bool)

(declare-fun e!425621 () Bool)

(assert (=> b!764103 (= e!425618 e!425621)))

(declare-fun res!516983 () Bool)

(assert (=> b!764103 (=> (not res!516983) (not e!425621))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!340037 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42199 0))(
  ( (array!42200 (arr!20207 (Array (_ BitVec 32) (_ BitVec 64))) (size!20628 (_ BitVec 32))) )
))
(declare-fun lt!340035 () array!42199)

(declare-datatypes ((SeekEntryResult!7807 0))(
  ( (MissingZero!7807 (index!33596 (_ BitVec 32))) (Found!7807 (index!33597 (_ BitVec 32))) (Intermediate!7807 (undefined!8619 Bool) (index!33598 (_ BitVec 32)) (x!64491 (_ BitVec 32))) (Undefined!7807) (MissingVacant!7807 (index!33599 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42199 (_ BitVec 32)) SeekEntryResult!7807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764103 (= res!516983 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340037 mask!3328) lt!340037 lt!340035 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340037 lt!340035 mask!3328)))))

(declare-fun a!3186 () array!42199)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!764103 (= lt!340037 (select (store (arr!20207 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764103 (= lt!340035 (array!42200 (store (arr!20207 a!3186) i!1173 k!2102) (size!20628 a!3186)))))

(declare-fun res!516982 () Bool)

(declare-fun e!425622 () Bool)

(assert (=> start!66294 (=> (not res!516982) (not e!425622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66294 (= res!516982 (validMask!0 mask!3328))))

(assert (=> start!66294 e!425622))

(assert (=> start!66294 true))

(declare-fun array_inv!16003 (array!42199) Bool)

(assert (=> start!66294 (array_inv!16003 a!3186)))

(declare-fun b!764104 () Bool)

(declare-fun res!516992 () Bool)

(assert (=> b!764104 (=> (not res!516992) (not e!425618))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!764104 (= res!516992 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20207 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764105 () Bool)

(declare-fun res!516985 () Bool)

(assert (=> b!764105 (=> (not res!516985) (not e!425622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764105 (= res!516985 (validKeyInArray!0 k!2102))))

(declare-fun e!425619 () Bool)

(declare-fun b!764106 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42199 (_ BitVec 32)) SeekEntryResult!7807)

(assert (=> b!764106 (= e!425619 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20207 a!3186) j!159) a!3186 mask!3328) (Found!7807 j!159)))))

(declare-fun b!764107 () Bool)

(declare-fun res!516990 () Bool)

(declare-fun e!425620 () Bool)

(assert (=> b!764107 (=> (not res!516990) (not e!425620))))

(declare-datatypes ((List!14209 0))(
  ( (Nil!14206) (Cons!14205 (h!15289 (_ BitVec 64)) (t!20524 List!14209)) )
))
(declare-fun arrayNoDuplicates!0 (array!42199 (_ BitVec 32) List!14209) Bool)

(assert (=> b!764107 (= res!516990 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14206))))

(declare-fun b!764108 () Bool)

(declare-fun res!516994 () Bool)

(assert (=> b!764108 (=> (not res!516994) (not e!425620))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764108 (= res!516994 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20628 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20628 a!3186))))))

(declare-fun b!764109 () Bool)

(declare-fun res!516991 () Bool)

(assert (=> b!764109 (=> (not res!516991) (not e!425622))))

(assert (=> b!764109 (= res!516991 (and (= (size!20628 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20628 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20628 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764110 () Bool)

(declare-fun res!516989 () Bool)

(assert (=> b!764110 (=> (not res!516989) (not e!425620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42199 (_ BitVec 32)) Bool)

(assert (=> b!764110 (= res!516989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764111 () Bool)

(assert (=> b!764111 (= e!425622 e!425620)))

(declare-fun res!516993 () Bool)

(assert (=> b!764111 (=> (not res!516993) (not e!425620))))

(declare-fun lt!340034 () SeekEntryResult!7807)

(assert (=> b!764111 (= res!516993 (or (= lt!340034 (MissingZero!7807 i!1173)) (= lt!340034 (MissingVacant!7807 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42199 (_ BitVec 32)) SeekEntryResult!7807)

(assert (=> b!764111 (= lt!340034 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!764112 () Bool)

(declare-fun res!516984 () Bool)

(assert (=> b!764112 (=> (not res!516984) (not e!425622))))

(declare-fun arrayContainsKey!0 (array!42199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764112 (= res!516984 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764113 () Bool)

(assert (=> b!764113 (= e!425621 (and (bvsle #b00000000000000000000000000000000 (size!20628 a!3186)) (bvsgt j!159 (size!20628 a!3186))))))

(declare-fun b!764114 () Bool)

(assert (=> b!764114 (= e!425620 e!425618)))

(declare-fun res!516986 () Bool)

(assert (=> b!764114 (=> (not res!516986) (not e!425618))))

(declare-fun lt!340036 () SeekEntryResult!7807)

(assert (=> b!764114 (= res!516986 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20207 a!3186) j!159) mask!3328) (select (arr!20207 a!3186) j!159) a!3186 mask!3328) lt!340036))))

(assert (=> b!764114 (= lt!340036 (Intermediate!7807 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764115 () Bool)

(declare-fun res!516988 () Bool)

(assert (=> b!764115 (=> (not res!516988) (not e!425622))))

(assert (=> b!764115 (= res!516988 (validKeyInArray!0 (select (arr!20207 a!3186) j!159)))))

(declare-fun b!764116 () Bool)

(declare-fun res!516987 () Bool)

(assert (=> b!764116 (=> (not res!516987) (not e!425618))))

(assert (=> b!764116 (= res!516987 e!425619)))

(declare-fun c!83947 () Bool)

(assert (=> b!764116 (= c!83947 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764117 () Bool)

(assert (=> b!764117 (= e!425619 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20207 a!3186) j!159) a!3186 mask!3328) lt!340036))))

(assert (= (and start!66294 res!516982) b!764109))

(assert (= (and b!764109 res!516991) b!764115))

(assert (= (and b!764115 res!516988) b!764105))

(assert (= (and b!764105 res!516985) b!764112))

(assert (= (and b!764112 res!516984) b!764111))

(assert (= (and b!764111 res!516993) b!764110))

(assert (= (and b!764110 res!516989) b!764107))

(assert (= (and b!764107 res!516990) b!764108))

(assert (= (and b!764108 res!516994) b!764114))

(assert (= (and b!764114 res!516986) b!764104))

(assert (= (and b!764104 res!516992) b!764116))

(assert (= (and b!764116 c!83947) b!764117))

(assert (= (and b!764116 (not c!83947)) b!764106))

(assert (= (and b!764116 res!516987) b!764103))

(assert (= (and b!764103 res!516983) b!764113))

(declare-fun m!710503 () Bool)

(assert (=> b!764110 m!710503))

(declare-fun m!710505 () Bool)

(assert (=> b!764114 m!710505))

(assert (=> b!764114 m!710505))

(declare-fun m!710507 () Bool)

(assert (=> b!764114 m!710507))

(assert (=> b!764114 m!710507))

(assert (=> b!764114 m!710505))

(declare-fun m!710509 () Bool)

(assert (=> b!764114 m!710509))

(declare-fun m!710511 () Bool)

(assert (=> b!764111 m!710511))

(assert (=> b!764115 m!710505))

(assert (=> b!764115 m!710505))

(declare-fun m!710513 () Bool)

(assert (=> b!764115 m!710513))

(declare-fun m!710515 () Bool)

(assert (=> b!764107 m!710515))

(declare-fun m!710517 () Bool)

(assert (=> start!66294 m!710517))

(declare-fun m!710519 () Bool)

(assert (=> start!66294 m!710519))

(assert (=> b!764117 m!710505))

(assert (=> b!764117 m!710505))

(declare-fun m!710521 () Bool)

(assert (=> b!764117 m!710521))

(declare-fun m!710523 () Bool)

(assert (=> b!764112 m!710523))

(assert (=> b!764106 m!710505))

(assert (=> b!764106 m!710505))

(declare-fun m!710525 () Bool)

(assert (=> b!764106 m!710525))

(declare-fun m!710527 () Bool)

(assert (=> b!764104 m!710527))

(declare-fun m!710529 () Bool)

(assert (=> b!764103 m!710529))

(declare-fun m!710531 () Bool)

(assert (=> b!764103 m!710531))

(declare-fun m!710533 () Bool)

(assert (=> b!764103 m!710533))

(assert (=> b!764103 m!710529))

(declare-fun m!710535 () Bool)

(assert (=> b!764103 m!710535))

(declare-fun m!710537 () Bool)

(assert (=> b!764103 m!710537))

(declare-fun m!710539 () Bool)

(assert (=> b!764105 m!710539))

(push 1)

(assert (not b!764114))

(assert (not b!764103))

(assert (not b!764111))

(assert (not b!764112))

(assert (not b!764110))

(assert (not b!764115))

(assert (not b!764106))

(assert (not start!66294))

(assert (not b!764117))

(assert (not b!764105))

(assert (not b!764107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

