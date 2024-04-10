; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65288 () Bool)

(assert start!65288)

(declare-fun b!741137 () Bool)

(declare-fun res!498481 () Bool)

(declare-fun e!414310 () Bool)

(assert (=> b!741137 (=> (not res!498481) (not e!414310))))

(declare-fun e!414311 () Bool)

(assert (=> b!741137 (= res!498481 e!414311)))

(declare-fun c!81709 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741137 (= c!81709 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741138 () Bool)

(declare-fun e!414304 () Bool)

(assert (=> b!741138 (= e!414304 e!414310)))

(declare-fun res!498487 () Bool)

(assert (=> b!741138 (=> (not res!498487) (not e!414310))))

(declare-datatypes ((SeekEntryResult!7444 0))(
  ( (MissingZero!7444 (index!32144 (_ BitVec 32))) (Found!7444 (index!32145 (_ BitVec 32))) (Intermediate!7444 (undefined!8256 Bool) (index!32146 (_ BitVec 32)) (x!63122 (_ BitVec 32))) (Undefined!7444) (MissingVacant!7444 (index!32147 (_ BitVec 32))) )
))
(declare-fun lt!329280 () SeekEntryResult!7444)

(declare-datatypes ((array!41461 0))(
  ( (array!41462 (arr!19844 (Array (_ BitVec 32) (_ BitVec 64))) (size!20265 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41461)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41461 (_ BitVec 32)) SeekEntryResult!7444)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741138 (= res!498487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19844 a!3186) j!159) mask!3328) (select (arr!19844 a!3186) j!159) a!3186 mask!3328) lt!329280))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!741138 (= lt!329280 (Intermediate!7444 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741139 () Bool)

(declare-fun res!498492 () Bool)

(assert (=> b!741139 (=> (not res!498492) (not e!414304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41461 (_ BitVec 32)) Bool)

(assert (=> b!741139 (= res!498492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741140 () Bool)

(declare-fun res!498488 () Bool)

(assert (=> b!741140 (=> (not res!498488) (not e!414304))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!741140 (= res!498488 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20265 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20265 a!3186))))))

(declare-fun b!741141 () Bool)

(assert (=> b!741141 (= e!414311 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19844 a!3186) j!159) a!3186 mask!3328) lt!329280))))

(declare-fun res!498482 () Bool)

(declare-fun e!414309 () Bool)

(assert (=> start!65288 (=> (not res!498482) (not e!414309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65288 (= res!498482 (validMask!0 mask!3328))))

(assert (=> start!65288 e!414309))

(assert (=> start!65288 true))

(declare-fun array_inv!15640 (array!41461) Bool)

(assert (=> start!65288 (array_inv!15640 a!3186)))

(declare-fun b!741142 () Bool)

(assert (=> b!741142 (= e!414309 e!414304)))

(declare-fun res!498493 () Bool)

(assert (=> b!741142 (=> (not res!498493) (not e!414304))))

(declare-fun lt!329283 () SeekEntryResult!7444)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741142 (= res!498493 (or (= lt!329283 (MissingZero!7444 i!1173)) (= lt!329283 (MissingVacant!7444 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41461 (_ BitVec 32)) SeekEntryResult!7444)

(assert (=> b!741142 (= lt!329283 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741143 () Bool)

(declare-fun res!498490 () Bool)

(assert (=> b!741143 (=> (not res!498490) (not e!414310))))

(assert (=> b!741143 (= res!498490 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19844 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741144 () Bool)

(declare-fun e!414305 () Bool)

(assert (=> b!741144 (= e!414305 (not true))))

(declare-fun e!414306 () Bool)

(assert (=> b!741144 e!414306))

(declare-fun res!498480 () Bool)

(assert (=> b!741144 (=> (not res!498480) (not e!414306))))

(assert (=> b!741144 (= res!498480 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25368 0))(
  ( (Unit!25369) )
))
(declare-fun lt!329282 () Unit!25368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25368)

(assert (=> b!741144 (= lt!329282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741145 () Bool)

(declare-fun res!498494 () Bool)

(assert (=> b!741145 (=> (not res!498494) (not e!414304))))

(declare-datatypes ((List!13846 0))(
  ( (Nil!13843) (Cons!13842 (h!14914 (_ BitVec 64)) (t!20161 List!13846)) )
))
(declare-fun arrayNoDuplicates!0 (array!41461 (_ BitVec 32) List!13846) Bool)

(assert (=> b!741145 (= res!498494 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13843))))

(declare-fun b!741146 () Bool)

(declare-fun e!414307 () Bool)

(assert (=> b!741146 (= e!414306 e!414307)))

(declare-fun res!498486 () Bool)

(assert (=> b!741146 (=> (not res!498486) (not e!414307))))

(declare-fun lt!329285 () SeekEntryResult!7444)

(assert (=> b!741146 (= res!498486 (= (seekEntryOrOpen!0 (select (arr!19844 a!3186) j!159) a!3186 mask!3328) lt!329285))))

(assert (=> b!741146 (= lt!329285 (Found!7444 j!159))))

(declare-fun b!741147 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41461 (_ BitVec 32)) SeekEntryResult!7444)

(assert (=> b!741147 (= e!414307 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19844 a!3186) j!159) a!3186 mask!3328) lt!329285))))

(declare-fun b!741148 () Bool)

(declare-fun res!498489 () Bool)

(assert (=> b!741148 (=> (not res!498489) (not e!414309))))

(declare-fun arrayContainsKey!0 (array!41461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741148 (= res!498489 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741149 () Bool)

(declare-fun res!498491 () Bool)

(assert (=> b!741149 (=> (not res!498491) (not e!414309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741149 (= res!498491 (validKeyInArray!0 k!2102))))

(declare-fun b!741150 () Bool)

(assert (=> b!741150 (= e!414311 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19844 a!3186) j!159) a!3186 mask!3328) (Found!7444 j!159)))))

(declare-fun b!741151 () Bool)

(declare-fun res!498484 () Bool)

(assert (=> b!741151 (=> (not res!498484) (not e!414309))))

(assert (=> b!741151 (= res!498484 (and (= (size!20265 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20265 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20265 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741152 () Bool)

(declare-fun res!498483 () Bool)

(assert (=> b!741152 (=> (not res!498483) (not e!414309))))

(assert (=> b!741152 (= res!498483 (validKeyInArray!0 (select (arr!19844 a!3186) j!159)))))

(declare-fun b!741153 () Bool)

(assert (=> b!741153 (= e!414310 e!414305)))

(declare-fun res!498485 () Bool)

(assert (=> b!741153 (=> (not res!498485) (not e!414305))))

(declare-fun lt!329281 () (_ BitVec 64))

(declare-fun lt!329284 () array!41461)

(assert (=> b!741153 (= res!498485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329281 mask!3328) lt!329281 lt!329284 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329281 lt!329284 mask!3328)))))

(assert (=> b!741153 (= lt!329281 (select (store (arr!19844 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741153 (= lt!329284 (array!41462 (store (arr!19844 a!3186) i!1173 k!2102) (size!20265 a!3186)))))

(assert (= (and start!65288 res!498482) b!741151))

(assert (= (and b!741151 res!498484) b!741152))

(assert (= (and b!741152 res!498483) b!741149))

(assert (= (and b!741149 res!498491) b!741148))

(assert (= (and b!741148 res!498489) b!741142))

(assert (= (and b!741142 res!498493) b!741139))

(assert (= (and b!741139 res!498492) b!741145))

(assert (= (and b!741145 res!498494) b!741140))

(assert (= (and b!741140 res!498488) b!741138))

(assert (= (and b!741138 res!498487) b!741143))

(assert (= (and b!741143 res!498490) b!741137))

(assert (= (and b!741137 c!81709) b!741141))

(assert (= (and b!741137 (not c!81709)) b!741150))

(assert (= (and b!741137 res!498481) b!741153))

(assert (= (and b!741153 res!498485) b!741144))

(assert (= (and b!741144 res!498480) b!741146))

(assert (= (and b!741146 res!498486) b!741147))

(declare-fun m!692139 () Bool)

(assert (=> b!741152 m!692139))

(assert (=> b!741152 m!692139))

(declare-fun m!692141 () Bool)

(assert (=> b!741152 m!692141))

(declare-fun m!692143 () Bool)

(assert (=> b!741142 m!692143))

(declare-fun m!692145 () Bool)

(assert (=> b!741145 m!692145))

(declare-fun m!692147 () Bool)

(assert (=> b!741153 m!692147))

(declare-fun m!692149 () Bool)

(assert (=> b!741153 m!692149))

(declare-fun m!692151 () Bool)

(assert (=> b!741153 m!692151))

(assert (=> b!741153 m!692149))

(declare-fun m!692153 () Bool)

(assert (=> b!741153 m!692153))

(declare-fun m!692155 () Bool)

(assert (=> b!741153 m!692155))

(assert (=> b!741141 m!692139))

(assert (=> b!741141 m!692139))

(declare-fun m!692157 () Bool)

(assert (=> b!741141 m!692157))

(assert (=> b!741138 m!692139))

(assert (=> b!741138 m!692139))

(declare-fun m!692159 () Bool)

(assert (=> b!741138 m!692159))

(assert (=> b!741138 m!692159))

(assert (=> b!741138 m!692139))

(declare-fun m!692161 () Bool)

(assert (=> b!741138 m!692161))

(assert (=> b!741150 m!692139))

(assert (=> b!741150 m!692139))

(declare-fun m!692163 () Bool)

(assert (=> b!741150 m!692163))

(declare-fun m!692165 () Bool)

(assert (=> start!65288 m!692165))

(declare-fun m!692167 () Bool)

(assert (=> start!65288 m!692167))

(declare-fun m!692169 () Bool)

(assert (=> b!741143 m!692169))

(assert (=> b!741146 m!692139))

(assert (=> b!741146 m!692139))

(declare-fun m!692171 () Bool)

(assert (=> b!741146 m!692171))

(declare-fun m!692173 () Bool)

(assert (=> b!741144 m!692173))

(declare-fun m!692175 () Bool)

(assert (=> b!741144 m!692175))

(assert (=> b!741147 m!692139))

(assert (=> b!741147 m!692139))

(declare-fun m!692177 () Bool)

(assert (=> b!741147 m!692177))

(declare-fun m!692179 () Bool)

(assert (=> b!741149 m!692179))

(declare-fun m!692181 () Bool)

(assert (=> b!741139 m!692181))

(declare-fun m!692183 () Bool)

(assert (=> b!741148 m!692183))

(push 1)

