; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67660 () Bool)

(assert start!67660)

(declare-fun b!783492 () Bool)

(declare-fun res!530071 () Bool)

(declare-fun e!435642 () Bool)

(assert (=> b!783492 (=> (not res!530071) (not e!435642))))

(declare-datatypes ((array!42700 0))(
  ( (array!42701 (arr!20438 (Array (_ BitVec 32) (_ BitVec 64))) (size!20859 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42700)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783492 (= res!530071 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783493 () Bool)

(declare-fun res!530068 () Bool)

(assert (=> b!783493 (=> (not res!530068) (not e!435642))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783493 (= res!530068 (validKeyInArray!0 (select (arr!20438 a!3186) j!159)))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349190 () array!42700)

(declare-fun b!783494 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!349194 () (_ BitVec 64))

(declare-fun e!435639 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8038 0))(
  ( (MissingZero!8038 (index!34520 (_ BitVec 32))) (Found!8038 (index!34521 (_ BitVec 32))) (Intermediate!8038 (undefined!8850 Bool) (index!34522 (_ BitVec 32)) (x!65474 (_ BitVec 32))) (Undefined!8038) (MissingVacant!8038 (index!34523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42700 (_ BitVec 32)) SeekEntryResult!8038)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42700 (_ BitVec 32)) SeekEntryResult!8038)

(assert (=> b!783494 (= e!435639 (= (seekEntryOrOpen!0 lt!349194 lt!349190 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349194 lt!349190 mask!3328)))))

(declare-fun b!783495 () Bool)

(declare-fun e!435636 () Bool)

(assert (=> b!783495 (= e!435642 e!435636)))

(declare-fun res!530063 () Bool)

(assert (=> b!783495 (=> (not res!530063) (not e!435636))))

(declare-fun lt!349191 () SeekEntryResult!8038)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783495 (= res!530063 (or (= lt!349191 (MissingZero!8038 i!1173)) (= lt!349191 (MissingVacant!8038 i!1173))))))

(assert (=> b!783495 (= lt!349191 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!783496 () Bool)

(declare-fun res!530064 () Bool)

(assert (=> b!783496 (=> (not res!530064) (not e!435636))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783496 (= res!530064 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20859 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20859 a!3186))))))

(declare-fun b!783497 () Bool)

(declare-datatypes ((Unit!27040 0))(
  ( (Unit!27041) )
))
(declare-fun e!435641 () Unit!27040)

(declare-fun Unit!27042 () Unit!27040)

(assert (=> b!783497 (= e!435641 Unit!27042)))

(assert (=> b!783497 false))

(declare-fun b!783498 () Bool)

(declare-fun res!530069 () Bool)

(assert (=> b!783498 (=> (not res!530069) (not e!435642))))

(assert (=> b!783498 (= res!530069 (and (= (size!20859 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20859 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20859 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783499 () Bool)

(declare-fun Unit!27043 () Unit!27040)

(assert (=> b!783499 (= e!435641 Unit!27043)))

(declare-fun b!783500 () Bool)

(declare-fun e!435634 () Bool)

(declare-fun e!435640 () Bool)

(assert (=> b!783500 (= e!435634 e!435640)))

(declare-fun res!530055 () Bool)

(assert (=> b!783500 (=> res!530055 e!435640)))

(declare-fun lt!349187 () (_ BitVec 64))

(assert (=> b!783500 (= res!530055 (= lt!349187 lt!349194))))

(assert (=> b!783500 (= lt!349187 (select (store (arr!20438 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!783501 () Bool)

(declare-fun res!530056 () Bool)

(assert (=> b!783501 (=> (not res!530056) (not e!435636))))

(declare-datatypes ((List!14440 0))(
  ( (Nil!14437) (Cons!14436 (h!15559 (_ BitVec 64)) (t!20755 List!14440)) )
))
(declare-fun arrayNoDuplicates!0 (array!42700 (_ BitVec 32) List!14440) Bool)

(assert (=> b!783501 (= res!530056 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14437))))

(declare-fun b!783502 () Bool)

(declare-fun res!530062 () Bool)

(assert (=> b!783502 (=> (not res!530062) (not e!435642))))

(assert (=> b!783502 (= res!530062 (validKeyInArray!0 k!2102))))

(declare-fun b!783504 () Bool)

(declare-fun e!435638 () Bool)

(declare-fun e!435637 () Bool)

(assert (=> b!783504 (= e!435638 e!435637)))

(declare-fun res!530066 () Bool)

(assert (=> b!783504 (=> (not res!530066) (not e!435637))))

(declare-fun lt!349195 () SeekEntryResult!8038)

(declare-fun lt!349188 () SeekEntryResult!8038)

(assert (=> b!783504 (= res!530066 (= lt!349195 lt!349188))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42700 (_ BitVec 32)) SeekEntryResult!8038)

(assert (=> b!783504 (= lt!349188 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349194 lt!349190 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783504 (= lt!349195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349194 mask!3328) lt!349194 lt!349190 mask!3328))))

(assert (=> b!783504 (= lt!349194 (select (store (arr!20438 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783504 (= lt!349190 (array!42701 (store (arr!20438 a!3186) i!1173 k!2102) (size!20859 a!3186)))))

(declare-fun b!783505 () Bool)

(declare-fun e!435644 () Bool)

(declare-fun lt!349196 () SeekEntryResult!8038)

(assert (=> b!783505 (= e!435644 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20438 a!3186) j!159) a!3186 mask!3328) lt!349196))))

(declare-fun b!783506 () Bool)

(assert (=> b!783506 (= e!435640 true)))

(assert (=> b!783506 e!435639))

(declare-fun res!530059 () Bool)

(assert (=> b!783506 (=> (not res!530059) (not e!435639))))

(assert (=> b!783506 (= res!530059 (= lt!349187 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349193 () Unit!27040)

(assert (=> b!783506 (= lt!349193 e!435641)))

(declare-fun c!87127 () Bool)

(assert (=> b!783506 (= c!87127 (= lt!349187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783507 () Bool)

(declare-fun res!530070 () Bool)

(assert (=> b!783507 (=> res!530070 e!435634)))

(assert (=> b!783507 (= res!530070 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20438 a!3186) j!159) a!3186 mask!3328) lt!349196)))))

(declare-fun e!435635 () Bool)

(declare-fun lt!349189 () SeekEntryResult!8038)

(declare-fun b!783508 () Bool)

(assert (=> b!783508 (= e!435635 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20438 a!3186) j!159) a!3186 mask!3328) lt!349189))))

(declare-fun b!783509 () Bool)

(declare-fun res!530061 () Bool)

(assert (=> b!783509 (=> (not res!530061) (not e!435638))))

(assert (=> b!783509 (= res!530061 e!435635)))

(declare-fun c!87126 () Bool)

(assert (=> b!783509 (= c!87126 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783510 () Bool)

(assert (=> b!783510 (= e!435635 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20438 a!3186) j!159) a!3186 mask!3328) (Found!8038 j!159)))))

(declare-fun b!783511 () Bool)

(declare-fun res!530058 () Bool)

(assert (=> b!783511 (=> (not res!530058) (not e!435636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42700 (_ BitVec 32)) Bool)

(assert (=> b!783511 (= res!530058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!530067 () Bool)

(assert (=> start!67660 (=> (not res!530067) (not e!435642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67660 (= res!530067 (validMask!0 mask!3328))))

(assert (=> start!67660 e!435642))

(assert (=> start!67660 true))

(declare-fun array_inv!16234 (array!42700) Bool)

(assert (=> start!67660 (array_inv!16234 a!3186)))

(declare-fun b!783503 () Bool)

(declare-fun res!530057 () Bool)

(assert (=> b!783503 (=> (not res!530057) (not e!435638))))

(assert (=> b!783503 (= res!530057 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20438 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783512 () Bool)

(assert (=> b!783512 (= e!435637 (not e!435634))))

(declare-fun res!530060 () Bool)

(assert (=> b!783512 (=> res!530060 e!435634)))

(assert (=> b!783512 (= res!530060 (or (not (is-Intermediate!8038 lt!349188)) (bvslt x!1131 (x!65474 lt!349188)) (not (= x!1131 (x!65474 lt!349188))) (not (= index!1321 (index!34522 lt!349188)))))))

(assert (=> b!783512 e!435644))

(declare-fun res!530072 () Bool)

(assert (=> b!783512 (=> (not res!530072) (not e!435644))))

(declare-fun lt!349192 () SeekEntryResult!8038)

(assert (=> b!783512 (= res!530072 (= lt!349192 lt!349196))))

(assert (=> b!783512 (= lt!349196 (Found!8038 j!159))))

(assert (=> b!783512 (= lt!349192 (seekEntryOrOpen!0 (select (arr!20438 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783512 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349186 () Unit!27040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27040)

(assert (=> b!783512 (= lt!349186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783513 () Bool)

(assert (=> b!783513 (= e!435636 e!435638)))

(declare-fun res!530065 () Bool)

(assert (=> b!783513 (=> (not res!530065) (not e!435638))))

(assert (=> b!783513 (= res!530065 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20438 a!3186) j!159) mask!3328) (select (arr!20438 a!3186) j!159) a!3186 mask!3328) lt!349189))))

(assert (=> b!783513 (= lt!349189 (Intermediate!8038 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67660 res!530067) b!783498))

(assert (= (and b!783498 res!530069) b!783493))

(assert (= (and b!783493 res!530068) b!783502))

(assert (= (and b!783502 res!530062) b!783492))

(assert (= (and b!783492 res!530071) b!783495))

(assert (= (and b!783495 res!530063) b!783511))

(assert (= (and b!783511 res!530058) b!783501))

(assert (= (and b!783501 res!530056) b!783496))

(assert (= (and b!783496 res!530064) b!783513))

(assert (= (and b!783513 res!530065) b!783503))

(assert (= (and b!783503 res!530057) b!783509))

(assert (= (and b!783509 c!87126) b!783508))

(assert (= (and b!783509 (not c!87126)) b!783510))

(assert (= (and b!783509 res!530061) b!783504))

(assert (= (and b!783504 res!530066) b!783512))

(assert (= (and b!783512 res!530072) b!783505))

(assert (= (and b!783512 (not res!530060)) b!783507))

(assert (= (and b!783507 (not res!530070)) b!783500))

(assert (= (and b!783500 (not res!530055)) b!783506))

(assert (= (and b!783506 c!87127) b!783497))

(assert (= (and b!783506 (not c!87127)) b!783499))

(assert (= (and b!783506 res!530059) b!783494))

(declare-fun m!726037 () Bool)

(assert (=> start!67660 m!726037))

(declare-fun m!726039 () Bool)

(assert (=> start!67660 m!726039))

(declare-fun m!726041 () Bool)

(assert (=> b!783493 m!726041))

(assert (=> b!783493 m!726041))

(declare-fun m!726043 () Bool)

(assert (=> b!783493 m!726043))

(declare-fun m!726045 () Bool)

(assert (=> b!783504 m!726045))

(declare-fun m!726047 () Bool)

(assert (=> b!783504 m!726047))

(declare-fun m!726049 () Bool)

(assert (=> b!783504 m!726049))

(declare-fun m!726051 () Bool)

(assert (=> b!783504 m!726051))

(declare-fun m!726053 () Bool)

(assert (=> b!783504 m!726053))

(assert (=> b!783504 m!726051))

(declare-fun m!726055 () Bool)

(assert (=> b!783495 m!726055))

(declare-fun m!726057 () Bool)

(assert (=> b!783494 m!726057))

(declare-fun m!726059 () Bool)

(assert (=> b!783494 m!726059))

(assert (=> b!783500 m!726045))

(declare-fun m!726061 () Bool)

(assert (=> b!783500 m!726061))

(assert (=> b!783508 m!726041))

(assert (=> b!783508 m!726041))

(declare-fun m!726063 () Bool)

(assert (=> b!783508 m!726063))

(assert (=> b!783507 m!726041))

(assert (=> b!783507 m!726041))

(declare-fun m!726065 () Bool)

(assert (=> b!783507 m!726065))

(declare-fun m!726067 () Bool)

(assert (=> b!783502 m!726067))

(declare-fun m!726069 () Bool)

(assert (=> b!783492 m!726069))

(assert (=> b!783513 m!726041))

(assert (=> b!783513 m!726041))

(declare-fun m!726071 () Bool)

(assert (=> b!783513 m!726071))

(assert (=> b!783513 m!726071))

(assert (=> b!783513 m!726041))

(declare-fun m!726073 () Bool)

(assert (=> b!783513 m!726073))

(assert (=> b!783510 m!726041))

(assert (=> b!783510 m!726041))

(assert (=> b!783510 m!726065))

(assert (=> b!783512 m!726041))

(assert (=> b!783512 m!726041))

(declare-fun m!726075 () Bool)

(assert (=> b!783512 m!726075))

(declare-fun m!726077 () Bool)

(assert (=> b!783512 m!726077))

(declare-fun m!726079 () Bool)

(assert (=> b!783512 m!726079))

(declare-fun m!726081 () Bool)

(assert (=> b!783511 m!726081))

(assert (=> b!783505 m!726041))

(assert (=> b!783505 m!726041))

(declare-fun m!726083 () Bool)

(assert (=> b!783505 m!726083))

(declare-fun m!726085 () Bool)

(assert (=> b!783501 m!726085))

(declare-fun m!726087 () Bool)

(assert (=> b!783503 m!726087))

(push 1)

