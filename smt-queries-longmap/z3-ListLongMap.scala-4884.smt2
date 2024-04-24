; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67468 () Bool)

(assert start!67468)

(declare-datatypes ((array!42577 0))(
  ( (array!42578 (arr!20377 (Array (_ BitVec 32) (_ BitVec 64))) (size!20797 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42577)

(declare-fun e!433736 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!779497 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7933 0))(
  ( (MissingZero!7933 (index!34100 (_ BitVec 32))) (Found!7933 (index!34101 (_ BitVec 32))) (Intermediate!7933 (undefined!8745 Bool) (index!34102 (_ BitVec 32)) (x!65209 (_ BitVec 32))) (Undefined!7933) (MissingVacant!7933 (index!34103 (_ BitVec 32))) )
))
(declare-fun lt!347272 () SeekEntryResult!7933)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42577 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!779497 (= e!433736 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!347272))))

(declare-fun b!779498 () Bool)

(declare-fun e!433731 () Bool)

(declare-fun e!433732 () Bool)

(assert (=> b!779498 (= e!433731 e!433732)))

(declare-fun res!527155 () Bool)

(assert (=> b!779498 (=> (not res!527155) (not e!433732))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779498 (= res!527155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328) (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!347272))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779498 (= lt!347272 (Intermediate!7933 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!527146 () Bool)

(declare-fun e!433737 () Bool)

(assert (=> start!67468 (=> (not res!527146) (not e!433737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67468 (= res!527146 (validMask!0 mask!3328))))

(assert (=> start!67468 e!433737))

(assert (=> start!67468 true))

(declare-fun array_inv!16236 (array!42577) Bool)

(assert (=> start!67468 (array_inv!16236 a!3186)))

(declare-fun b!779499 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42577 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!779499 (= e!433736 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) (Found!7933 j!159)))))

(declare-fun b!779500 () Bool)

(declare-fun res!527147 () Bool)

(assert (=> b!779500 (=> (not res!527147) (not e!433737))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779500 (= res!527147 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779501 () Bool)

(declare-fun res!527151 () Bool)

(assert (=> b!779501 (=> (not res!527151) (not e!433731))))

(declare-datatypes ((List!14286 0))(
  ( (Nil!14283) (Cons!14282 (h!15402 (_ BitVec 64)) (t!20593 List!14286)) )
))
(declare-fun arrayNoDuplicates!0 (array!42577 (_ BitVec 32) List!14286) Bool)

(assert (=> b!779501 (= res!527151 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14283))))

(declare-fun b!779502 () Bool)

(declare-fun res!527148 () Bool)

(assert (=> b!779502 (=> (not res!527148) (not e!433732))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779502 (= res!527148 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20377 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779503 () Bool)

(declare-fun e!433733 () Bool)

(assert (=> b!779503 (= e!433733 true)))

(declare-fun lt!347273 () SeekEntryResult!7933)

(assert (=> b!779503 (= lt!347273 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779504 () Bool)

(declare-fun res!527159 () Bool)

(assert (=> b!779504 (=> (not res!527159) (not e!433732))))

(assert (=> b!779504 (= res!527159 e!433736)))

(declare-fun c!86582 () Bool)

(assert (=> b!779504 (= c!86582 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779505 () Bool)

(declare-fun res!527157 () Bool)

(assert (=> b!779505 (=> (not res!527157) (not e!433737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779505 (= res!527157 (validKeyInArray!0 k0!2102))))

(declare-fun b!779506 () Bool)

(declare-fun res!527154 () Bool)

(assert (=> b!779506 (=> (not res!527154) (not e!433731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42577 (_ BitVec 32)) Bool)

(assert (=> b!779506 (= res!527154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779507 () Bool)

(declare-fun res!527158 () Bool)

(assert (=> b!779507 (=> (not res!527158) (not e!433737))))

(assert (=> b!779507 (= res!527158 (and (= (size!20797 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20797 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20797 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779508 () Bool)

(declare-fun e!433734 () Bool)

(assert (=> b!779508 (= e!433732 e!433734)))

(declare-fun res!527150 () Bool)

(assert (=> b!779508 (=> (not res!527150) (not e!433734))))

(declare-fun lt!347268 () SeekEntryResult!7933)

(declare-fun lt!347270 () SeekEntryResult!7933)

(assert (=> b!779508 (= res!527150 (= lt!347268 lt!347270))))

(declare-fun lt!347274 () array!42577)

(declare-fun lt!347267 () (_ BitVec 64))

(assert (=> b!779508 (= lt!347270 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347267 lt!347274 mask!3328))))

(assert (=> b!779508 (= lt!347268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347267 mask!3328) lt!347267 lt!347274 mask!3328))))

(assert (=> b!779508 (= lt!347267 (select (store (arr!20377 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779508 (= lt!347274 (array!42578 (store (arr!20377 a!3186) i!1173 k0!2102) (size!20797 a!3186)))))

(declare-fun b!779509 () Bool)

(declare-fun e!433738 () Bool)

(declare-fun e!433735 () Bool)

(assert (=> b!779509 (= e!433738 e!433735)))

(declare-fun res!527152 () Bool)

(assert (=> b!779509 (=> (not res!527152) (not e!433735))))

(declare-fun lt!347271 () SeekEntryResult!7933)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42577 (_ BitVec 32)) SeekEntryResult!7933)

(assert (=> b!779509 (= res!527152 (= (seekEntryOrOpen!0 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!347271))))

(assert (=> b!779509 (= lt!347271 (Found!7933 j!159))))

(declare-fun b!779510 () Bool)

(assert (=> b!779510 (= e!433735 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!347271))))

(declare-fun b!779511 () Bool)

(assert (=> b!779511 (= e!433737 e!433731)))

(declare-fun res!527153 () Bool)

(assert (=> b!779511 (=> (not res!527153) (not e!433731))))

(declare-fun lt!347269 () SeekEntryResult!7933)

(assert (=> b!779511 (= res!527153 (or (= lt!347269 (MissingZero!7933 i!1173)) (= lt!347269 (MissingVacant!7933 i!1173))))))

(assert (=> b!779511 (= lt!347269 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779512 () Bool)

(declare-fun res!527145 () Bool)

(assert (=> b!779512 (=> (not res!527145) (not e!433731))))

(assert (=> b!779512 (= res!527145 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20797 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20797 a!3186))))))

(declare-fun b!779513 () Bool)

(declare-fun res!527156 () Bool)

(assert (=> b!779513 (=> (not res!527156) (not e!433737))))

(assert (=> b!779513 (= res!527156 (validKeyInArray!0 (select (arr!20377 a!3186) j!159)))))

(declare-fun b!779514 () Bool)

(assert (=> b!779514 (= e!433734 (not e!433733))))

(declare-fun res!527149 () Bool)

(assert (=> b!779514 (=> res!527149 e!433733)))

(get-info :version)

(assert (=> b!779514 (= res!527149 (or (not ((_ is Intermediate!7933) lt!347270)) (bvslt x!1131 (x!65209 lt!347270)) (not (= x!1131 (x!65209 lt!347270))) (not (= index!1321 (index!34102 lt!347270)))))))

(assert (=> b!779514 e!433738))

(declare-fun res!527160 () Bool)

(assert (=> b!779514 (=> (not res!527160) (not e!433738))))

(assert (=> b!779514 (= res!527160 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26839 0))(
  ( (Unit!26840) )
))
(declare-fun lt!347275 () Unit!26839)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26839)

(assert (=> b!779514 (= lt!347275 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67468 res!527146) b!779507))

(assert (= (and b!779507 res!527158) b!779513))

(assert (= (and b!779513 res!527156) b!779505))

(assert (= (and b!779505 res!527157) b!779500))

(assert (= (and b!779500 res!527147) b!779511))

(assert (= (and b!779511 res!527153) b!779506))

(assert (= (and b!779506 res!527154) b!779501))

(assert (= (and b!779501 res!527151) b!779512))

(assert (= (and b!779512 res!527145) b!779498))

(assert (= (and b!779498 res!527155) b!779502))

(assert (= (and b!779502 res!527148) b!779504))

(assert (= (and b!779504 c!86582) b!779497))

(assert (= (and b!779504 (not c!86582)) b!779499))

(assert (= (and b!779504 res!527159) b!779508))

(assert (= (and b!779508 res!527150) b!779514))

(assert (= (and b!779514 res!527160) b!779509))

(assert (= (and b!779509 res!527152) b!779510))

(assert (= (and b!779514 (not res!527149)) b!779503))

(declare-fun m!723503 () Bool)

(assert (=> b!779503 m!723503))

(assert (=> b!779503 m!723503))

(declare-fun m!723505 () Bool)

(assert (=> b!779503 m!723505))

(declare-fun m!723507 () Bool)

(assert (=> b!779506 m!723507))

(declare-fun m!723509 () Bool)

(assert (=> b!779502 m!723509))

(assert (=> b!779497 m!723503))

(assert (=> b!779497 m!723503))

(declare-fun m!723511 () Bool)

(assert (=> b!779497 m!723511))

(declare-fun m!723513 () Bool)

(assert (=> start!67468 m!723513))

(declare-fun m!723515 () Bool)

(assert (=> start!67468 m!723515))

(declare-fun m!723517 () Bool)

(assert (=> b!779505 m!723517))

(assert (=> b!779499 m!723503))

(assert (=> b!779499 m!723503))

(assert (=> b!779499 m!723505))

(declare-fun m!723519 () Bool)

(assert (=> b!779501 m!723519))

(declare-fun m!723521 () Bool)

(assert (=> b!779514 m!723521))

(declare-fun m!723523 () Bool)

(assert (=> b!779514 m!723523))

(assert (=> b!779498 m!723503))

(assert (=> b!779498 m!723503))

(declare-fun m!723525 () Bool)

(assert (=> b!779498 m!723525))

(assert (=> b!779498 m!723525))

(assert (=> b!779498 m!723503))

(declare-fun m!723527 () Bool)

(assert (=> b!779498 m!723527))

(assert (=> b!779513 m!723503))

(assert (=> b!779513 m!723503))

(declare-fun m!723529 () Bool)

(assert (=> b!779513 m!723529))

(assert (=> b!779509 m!723503))

(assert (=> b!779509 m!723503))

(declare-fun m!723531 () Bool)

(assert (=> b!779509 m!723531))

(assert (=> b!779510 m!723503))

(assert (=> b!779510 m!723503))

(declare-fun m!723533 () Bool)

(assert (=> b!779510 m!723533))

(declare-fun m!723535 () Bool)

(assert (=> b!779511 m!723535))

(declare-fun m!723537 () Bool)

(assert (=> b!779500 m!723537))

(declare-fun m!723539 () Bool)

(assert (=> b!779508 m!723539))

(declare-fun m!723541 () Bool)

(assert (=> b!779508 m!723541))

(declare-fun m!723543 () Bool)

(assert (=> b!779508 m!723543))

(declare-fun m!723545 () Bool)

(assert (=> b!779508 m!723545))

(assert (=> b!779508 m!723545))

(declare-fun m!723547 () Bool)

(assert (=> b!779508 m!723547))

(check-sat (not b!779513) (not b!779508) (not b!779499) (not b!779510) (not b!779505) (not b!779514) (not start!67468) (not b!779498) (not b!779500) (not b!779503) (not b!779497) (not b!779501) (not b!779506) (not b!779511) (not b!779509))
(check-sat)
