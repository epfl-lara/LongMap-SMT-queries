; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66266 () Bool)

(assert start!66266)

(declare-datatypes ((array!42171 0))(
  ( (array!42172 (arr!20193 (Array (_ BitVec 32) (_ BitVec 64))) (size!20614 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42171)

(declare-fun e!425394 () Bool)

(declare-fun b!763498 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7793 0))(
  ( (MissingZero!7793 (index!33540 (_ BitVec 32))) (Found!7793 (index!33541 (_ BitVec 32))) (Intermediate!7793 (undefined!8605 Bool) (index!33542 (_ BitVec 32)) (x!64445 (_ BitVec 32))) (Undefined!7793) (MissingVacant!7793 (index!33543 (_ BitVec 32))) )
))
(declare-fun lt!339817 () SeekEntryResult!7793)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42171 (_ BitVec 32)) SeekEntryResult!7793)

(assert (=> b!763498 (= e!425394 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20193 a!3186) j!159) a!3186 mask!3328) lt!339817))))

(declare-fun b!763499 () Bool)

(declare-fun res!516463 () Bool)

(declare-fun e!425390 () Bool)

(assert (=> b!763499 (=> (not res!516463) (not e!425390))))

(assert (=> b!763499 (= res!516463 e!425394)))

(declare-fun c!83905 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763499 (= c!83905 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763500 () Bool)

(declare-fun res!516472 () Bool)

(declare-fun e!425393 () Bool)

(assert (=> b!763500 (=> (not res!516472) (not e!425393))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763500 (= res!516472 (validKeyInArray!0 k!2102))))

(declare-fun b!763501 () Bool)

(declare-fun res!516470 () Bool)

(assert (=> b!763501 (=> (not res!516470) (not e!425390))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763501 (= res!516470 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20193 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763502 () Bool)

(declare-fun res!516464 () Bool)

(declare-fun e!425391 () Bool)

(assert (=> b!763502 (=> (not res!516464) (not e!425391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42171 (_ BitVec 32)) Bool)

(assert (=> b!763502 (= res!516464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763503 () Bool)

(assert (=> b!763503 (= e!425390 false)))

(declare-fun lt!339820 () (_ BitVec 64))

(declare-fun lt!339816 () array!42171)

(declare-fun lt!339821 () SeekEntryResult!7793)

(assert (=> b!763503 (= lt!339821 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339820 lt!339816 mask!3328))))

(declare-fun lt!339819 () SeekEntryResult!7793)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763503 (= lt!339819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339820 mask!3328) lt!339820 lt!339816 mask!3328))))

(assert (=> b!763503 (= lt!339820 (select (store (arr!20193 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!763503 (= lt!339816 (array!42172 (store (arr!20193 a!3186) i!1173 k!2102) (size!20614 a!3186)))))

(declare-fun b!763504 () Bool)

(declare-fun res!516462 () Bool)

(assert (=> b!763504 (=> (not res!516462) (not e!425393))))

(declare-fun arrayContainsKey!0 (array!42171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763504 (= res!516462 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763505 () Bool)

(declare-fun res!516466 () Bool)

(assert (=> b!763505 (=> (not res!516466) (not e!425393))))

(assert (=> b!763505 (= res!516466 (and (= (size!20614 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20614 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20614 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763506 () Bool)

(assert (=> b!763506 (= e!425391 e!425390)))

(declare-fun res!516469 () Bool)

(assert (=> b!763506 (=> (not res!516469) (not e!425390))))

(assert (=> b!763506 (= res!516469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20193 a!3186) j!159) mask!3328) (select (arr!20193 a!3186) j!159) a!3186 mask!3328) lt!339817))))

(assert (=> b!763506 (= lt!339817 (Intermediate!7793 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763507 () Bool)

(declare-fun res!516468 () Bool)

(assert (=> b!763507 (=> (not res!516468) (not e!425391))))

(declare-datatypes ((List!14195 0))(
  ( (Nil!14192) (Cons!14191 (h!15275 (_ BitVec 64)) (t!20510 List!14195)) )
))
(declare-fun arrayNoDuplicates!0 (array!42171 (_ BitVec 32) List!14195) Bool)

(assert (=> b!763507 (= res!516468 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14192))))

(declare-fun b!763508 () Bool)

(declare-fun res!516461 () Bool)

(assert (=> b!763508 (=> (not res!516461) (not e!425393))))

(assert (=> b!763508 (= res!516461 (validKeyInArray!0 (select (arr!20193 a!3186) j!159)))))

(declare-fun res!516467 () Bool)

(assert (=> start!66266 (=> (not res!516467) (not e!425393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66266 (= res!516467 (validMask!0 mask!3328))))

(assert (=> start!66266 e!425393))

(assert (=> start!66266 true))

(declare-fun array_inv!15989 (array!42171) Bool)

(assert (=> start!66266 (array_inv!15989 a!3186)))

(declare-fun b!763509 () Bool)

(assert (=> b!763509 (= e!425393 e!425391)))

(declare-fun res!516471 () Bool)

(assert (=> b!763509 (=> (not res!516471) (not e!425391))))

(declare-fun lt!339818 () SeekEntryResult!7793)

(assert (=> b!763509 (= res!516471 (or (= lt!339818 (MissingZero!7793 i!1173)) (= lt!339818 (MissingVacant!7793 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42171 (_ BitVec 32)) SeekEntryResult!7793)

(assert (=> b!763509 (= lt!339818 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763510 () Bool)

(declare-fun res!516465 () Bool)

(assert (=> b!763510 (=> (not res!516465) (not e!425391))))

(assert (=> b!763510 (= res!516465 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20614 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20614 a!3186))))))

(declare-fun b!763511 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42171 (_ BitVec 32)) SeekEntryResult!7793)

(assert (=> b!763511 (= e!425394 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20193 a!3186) j!159) a!3186 mask!3328) (Found!7793 j!159)))))

(assert (= (and start!66266 res!516467) b!763505))

(assert (= (and b!763505 res!516466) b!763508))

(assert (= (and b!763508 res!516461) b!763500))

(assert (= (and b!763500 res!516472) b!763504))

(assert (= (and b!763504 res!516462) b!763509))

(assert (= (and b!763509 res!516471) b!763502))

(assert (= (and b!763502 res!516464) b!763507))

(assert (= (and b!763507 res!516468) b!763510))

(assert (= (and b!763510 res!516465) b!763506))

(assert (= (and b!763506 res!516469) b!763501))

(assert (= (and b!763501 res!516470) b!763499))

(assert (= (and b!763499 c!83905) b!763498))

(assert (= (and b!763499 (not c!83905)) b!763511))

(assert (= (and b!763499 res!516463) b!763503))

(declare-fun m!709971 () Bool)

(assert (=> b!763511 m!709971))

(assert (=> b!763511 m!709971))

(declare-fun m!709973 () Bool)

(assert (=> b!763511 m!709973))

(declare-fun m!709975 () Bool)

(assert (=> b!763502 m!709975))

(declare-fun m!709977 () Bool)

(assert (=> b!763504 m!709977))

(declare-fun m!709979 () Bool)

(assert (=> b!763500 m!709979))

(declare-fun m!709981 () Bool)

(assert (=> b!763507 m!709981))

(declare-fun m!709983 () Bool)

(assert (=> b!763501 m!709983))

(assert (=> b!763508 m!709971))

(assert (=> b!763508 m!709971))

(declare-fun m!709985 () Bool)

(assert (=> b!763508 m!709985))

(declare-fun m!709987 () Bool)

(assert (=> b!763509 m!709987))

(declare-fun m!709989 () Bool)

(assert (=> start!66266 m!709989))

(declare-fun m!709991 () Bool)

(assert (=> start!66266 m!709991))

(assert (=> b!763506 m!709971))

(assert (=> b!763506 m!709971))

(declare-fun m!709993 () Bool)

(assert (=> b!763506 m!709993))

(assert (=> b!763506 m!709993))

(assert (=> b!763506 m!709971))

(declare-fun m!709995 () Bool)

(assert (=> b!763506 m!709995))

(assert (=> b!763498 m!709971))

(assert (=> b!763498 m!709971))

(declare-fun m!709997 () Bool)

(assert (=> b!763498 m!709997))

(declare-fun m!709999 () Bool)

(assert (=> b!763503 m!709999))

(declare-fun m!710001 () Bool)

(assert (=> b!763503 m!710001))

(declare-fun m!710003 () Bool)

(assert (=> b!763503 m!710003))

(declare-fun m!710005 () Bool)

(assert (=> b!763503 m!710005))

(declare-fun m!710007 () Bool)

(assert (=> b!763503 m!710007))

(assert (=> b!763503 m!710001))

(push 1)

