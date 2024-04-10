; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66272 () Bool)

(assert start!66272)

(declare-fun b!763624 () Bool)

(declare-datatypes ((SeekEntryResult!7796 0))(
  ( (MissingZero!7796 (index!33552 (_ BitVec 32))) (Found!7796 (index!33553 (_ BitVec 32))) (Intermediate!7796 (undefined!8608 Bool) (index!33554 (_ BitVec 32)) (x!64456 (_ BitVec 32))) (Undefined!7796) (MissingVacant!7796 (index!33555 (_ BitVec 32))) )
))
(declare-fun lt!339870 () SeekEntryResult!7796)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42177 0))(
  ( (array!42178 (arr!20196 (Array (_ BitVec 32) (_ BitVec 64))) (size!20617 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42177)

(declare-fun e!425439 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42177 (_ BitVec 32)) SeekEntryResult!7796)

(assert (=> b!763624 (= e!425439 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20196 a!3186) j!159) a!3186 mask!3328) lt!339870))))

(declare-fun b!763625 () Bool)

(declare-fun res!516575 () Bool)

(declare-fun e!425435 () Bool)

(assert (=> b!763625 (=> (not res!516575) (not e!425435))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763625 (= res!516575 (validKeyInArray!0 k!2102))))

(declare-fun b!763626 () Bool)

(declare-fun e!425438 () Bool)

(assert (=> b!763626 (= e!425438 false)))

(declare-fun lt!339871 () SeekEntryResult!7796)

(declare-fun lt!339873 () array!42177)

(declare-fun lt!339874 () (_ BitVec 64))

(assert (=> b!763626 (= lt!339871 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339874 lt!339873 mask!3328))))

(declare-fun lt!339875 () SeekEntryResult!7796)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763626 (= lt!339875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339874 mask!3328) lt!339874 lt!339873 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763626 (= lt!339874 (select (store (arr!20196 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!763626 (= lt!339873 (array!42178 (store (arr!20196 a!3186) i!1173 k!2102) (size!20617 a!3186)))))

(declare-fun b!763627 () Bool)

(declare-fun res!516569 () Bool)

(assert (=> b!763627 (=> (not res!516569) (not e!425438))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!763627 (= res!516569 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20196 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763628 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42177 (_ BitVec 32)) SeekEntryResult!7796)

(assert (=> b!763628 (= e!425439 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20196 a!3186) j!159) a!3186 mask!3328) (Found!7796 j!159)))))

(declare-fun b!763629 () Bool)

(declare-fun res!516579 () Bool)

(declare-fun e!425436 () Bool)

(assert (=> b!763629 (=> (not res!516579) (not e!425436))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763629 (= res!516579 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20617 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20617 a!3186))))))

(declare-fun b!763630 () Bool)

(declare-fun res!516580 () Bool)

(assert (=> b!763630 (=> (not res!516580) (not e!425435))))

(declare-fun arrayContainsKey!0 (array!42177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763630 (= res!516580 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763631 () Bool)

(declare-fun res!516574 () Bool)

(assert (=> b!763631 (=> (not res!516574) (not e!425436))))

(declare-datatypes ((List!14198 0))(
  ( (Nil!14195) (Cons!14194 (h!15278 (_ BitVec 64)) (t!20513 List!14198)) )
))
(declare-fun arrayNoDuplicates!0 (array!42177 (_ BitVec 32) List!14198) Bool)

(assert (=> b!763631 (= res!516574 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14195))))

(declare-fun b!763632 () Bool)

(assert (=> b!763632 (= e!425435 e!425436)))

(declare-fun res!516577 () Bool)

(assert (=> b!763632 (=> (not res!516577) (not e!425436))))

(declare-fun lt!339872 () SeekEntryResult!7796)

(assert (=> b!763632 (= res!516577 (or (= lt!339872 (MissingZero!7796 i!1173)) (= lt!339872 (MissingVacant!7796 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42177 (_ BitVec 32)) SeekEntryResult!7796)

(assert (=> b!763632 (= lt!339872 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763633 () Bool)

(declare-fun res!516573 () Bool)

(assert (=> b!763633 (=> (not res!516573) (not e!425438))))

(assert (=> b!763633 (= res!516573 e!425439)))

(declare-fun c!83914 () Bool)

(assert (=> b!763633 (= c!83914 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763634 () Bool)

(assert (=> b!763634 (= e!425436 e!425438)))

(declare-fun res!516576 () Bool)

(assert (=> b!763634 (=> (not res!516576) (not e!425438))))

(assert (=> b!763634 (= res!516576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20196 a!3186) j!159) mask!3328) (select (arr!20196 a!3186) j!159) a!3186 mask!3328) lt!339870))))

(assert (=> b!763634 (= lt!339870 (Intermediate!7796 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763635 () Bool)

(declare-fun res!516578 () Bool)

(assert (=> b!763635 (=> (not res!516578) (not e!425436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42177 (_ BitVec 32)) Bool)

(assert (=> b!763635 (= res!516578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!516570 () Bool)

(assert (=> start!66272 (=> (not res!516570) (not e!425435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66272 (= res!516570 (validMask!0 mask!3328))))

(assert (=> start!66272 e!425435))

(assert (=> start!66272 true))

(declare-fun array_inv!15992 (array!42177) Bool)

(assert (=> start!66272 (array_inv!15992 a!3186)))

(declare-fun b!763636 () Bool)

(declare-fun res!516571 () Bool)

(assert (=> b!763636 (=> (not res!516571) (not e!425435))))

(assert (=> b!763636 (= res!516571 (validKeyInArray!0 (select (arr!20196 a!3186) j!159)))))

(declare-fun b!763637 () Bool)

(declare-fun res!516572 () Bool)

(assert (=> b!763637 (=> (not res!516572) (not e!425435))))

(assert (=> b!763637 (= res!516572 (and (= (size!20617 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20617 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20617 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66272 res!516570) b!763637))

(assert (= (and b!763637 res!516572) b!763636))

(assert (= (and b!763636 res!516571) b!763625))

(assert (= (and b!763625 res!516575) b!763630))

(assert (= (and b!763630 res!516580) b!763632))

(assert (= (and b!763632 res!516577) b!763635))

(assert (= (and b!763635 res!516578) b!763631))

(assert (= (and b!763631 res!516574) b!763629))

(assert (= (and b!763629 res!516579) b!763634))

(assert (= (and b!763634 res!516576) b!763627))

(assert (= (and b!763627 res!516569) b!763633))

(assert (= (and b!763633 c!83914) b!763624))

(assert (= (and b!763633 (not c!83914)) b!763628))

(assert (= (and b!763633 res!516573) b!763626))

(declare-fun m!710085 () Bool)

(assert (=> b!763632 m!710085))

(declare-fun m!710087 () Bool)

(assert (=> b!763636 m!710087))

(assert (=> b!763636 m!710087))

(declare-fun m!710089 () Bool)

(assert (=> b!763636 m!710089))

(declare-fun m!710091 () Bool)

(assert (=> b!763635 m!710091))

(declare-fun m!710093 () Bool)

(assert (=> b!763626 m!710093))

(declare-fun m!710095 () Bool)

(assert (=> b!763626 m!710095))

(declare-fun m!710097 () Bool)

(assert (=> b!763626 m!710097))

(declare-fun m!710099 () Bool)

(assert (=> b!763626 m!710099))

(assert (=> b!763626 m!710093))

(declare-fun m!710101 () Bool)

(assert (=> b!763626 m!710101))

(declare-fun m!710103 () Bool)

(assert (=> b!763630 m!710103))

(declare-fun m!710105 () Bool)

(assert (=> b!763627 m!710105))

(declare-fun m!710107 () Bool)

(assert (=> b!763631 m!710107))

(assert (=> b!763624 m!710087))

(assert (=> b!763624 m!710087))

(declare-fun m!710109 () Bool)

(assert (=> b!763624 m!710109))

(assert (=> b!763628 m!710087))

(assert (=> b!763628 m!710087))

(declare-fun m!710111 () Bool)

(assert (=> b!763628 m!710111))

(declare-fun m!710113 () Bool)

(assert (=> start!66272 m!710113))

(declare-fun m!710115 () Bool)

(assert (=> start!66272 m!710115))

(assert (=> b!763634 m!710087))

(assert (=> b!763634 m!710087))

(declare-fun m!710117 () Bool)

(assert (=> b!763634 m!710117))

(assert (=> b!763634 m!710117))

(assert (=> b!763634 m!710087))

(declare-fun m!710119 () Bool)

(assert (=> b!763634 m!710119))

(declare-fun m!710121 () Bool)

(assert (=> b!763625 m!710121))

(push 1)

