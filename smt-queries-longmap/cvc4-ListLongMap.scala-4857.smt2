; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66916 () Bool)

(assert start!66916)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42409 0))(
  ( (array!42410 (arr!20303 (Array (_ BitVec 32) (_ BitVec 64))) (size!20724 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42409)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7903 0))(
  ( (MissingZero!7903 (index!33980 (_ BitVec 32))) (Found!7903 (index!33981 (_ BitVec 32))) (Intermediate!7903 (undefined!8715 Bool) (index!33982 (_ BitVec 32)) (x!64910 (_ BitVec 32))) (Undefined!7903) (MissingVacant!7903 (index!33983 (_ BitVec 32))) )
))
(declare-fun lt!343785 () SeekEntryResult!7903)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!429875 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!772179 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42409 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!772179 (= e!429875 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343785))))

(declare-fun b!772180 () Bool)

(declare-fun res!522311 () Bool)

(declare-fun e!429867 () Bool)

(assert (=> b!772180 (=> (not res!522311) (not e!429867))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!772180 (= res!522311 (and (= (size!20724 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20724 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20724 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772181 () Bool)

(declare-fun res!522321 () Bool)

(declare-fun e!429873 () Bool)

(assert (=> b!772181 (=> (not res!522321) (not e!429873))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!772181 (= res!522321 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20724 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20724 a!3186))))))

(declare-fun b!772182 () Bool)

(declare-fun e!429874 () Bool)

(assert (=> b!772182 (= e!429874 e!429875)))

(declare-fun res!522312 () Bool)

(assert (=> b!772182 (=> (not res!522312) (not e!429875))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42409 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!772182 (= res!522312 (= (seekEntryOrOpen!0 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343785))))

(assert (=> b!772182 (= lt!343785 (Found!7903 j!159))))

(declare-fun b!772183 () Bool)

(declare-fun e!429868 () Bool)

(declare-fun e!429871 () Bool)

(assert (=> b!772183 (= e!429868 e!429871)))

(declare-fun res!522309 () Bool)

(assert (=> b!772183 (=> (not res!522309) (not e!429871))))

(declare-fun lt!343788 () SeekEntryResult!7903)

(declare-fun lt!343793 () SeekEntryResult!7903)

(assert (=> b!772183 (= res!522309 (= lt!343788 lt!343793))))

(declare-fun lt!343786 () (_ BitVec 64))

(declare-fun lt!343783 () array!42409)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42409 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!772183 (= lt!343793 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343786 lt!343783 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772183 (= lt!343788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343786 mask!3328) lt!343786 lt!343783 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!772183 (= lt!343786 (select (store (arr!20303 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!772183 (= lt!343783 (array!42410 (store (arr!20303 a!3186) i!1173 k!2102) (size!20724 a!3186)))))

(declare-fun b!772184 () Bool)

(declare-fun res!522315 () Bool)

(assert (=> b!772184 (=> (not res!522315) (not e!429867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772184 (= res!522315 (validKeyInArray!0 (select (arr!20303 a!3186) j!159)))))

(declare-fun b!772185 () Bool)

(declare-fun res!522318 () Bool)

(assert (=> b!772185 (=> (not res!522318) (not e!429873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42409 (_ BitVec 32)) Bool)

(assert (=> b!772185 (= res!522318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772186 () Bool)

(declare-fun res!522316 () Bool)

(assert (=> b!772186 (=> (not res!522316) (not e!429868))))

(declare-fun e!429870 () Bool)

(assert (=> b!772186 (= res!522316 e!429870)))

(declare-fun c!85333 () Bool)

(assert (=> b!772186 (= c!85333 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772187 () Bool)

(declare-datatypes ((Unit!26626 0))(
  ( (Unit!26627) )
))
(declare-fun e!429866 () Unit!26626)

(declare-fun Unit!26628 () Unit!26626)

(assert (=> b!772187 (= e!429866 Unit!26628)))

(declare-fun lt!343791 () SeekEntryResult!7903)

(assert (=> b!772187 (= lt!343791 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343789 () (_ BitVec 32))

(assert (=> b!772187 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343789 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) (Found!7903 j!159))))

(declare-fun b!772188 () Bool)

(assert (=> b!772188 (= e!429870 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) (Found!7903 j!159)))))

(declare-fun b!772189 () Bool)

(declare-fun res!522314 () Bool)

(assert (=> b!772189 (=> (not res!522314) (not e!429867))))

(assert (=> b!772189 (= res!522314 (validKeyInArray!0 k!2102))))

(declare-fun res!522319 () Bool)

(assert (=> start!66916 (=> (not res!522319) (not e!429867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66916 (= res!522319 (validMask!0 mask!3328))))

(assert (=> start!66916 e!429867))

(assert (=> start!66916 true))

(declare-fun array_inv!16099 (array!42409) Bool)

(assert (=> start!66916 (array_inv!16099 a!3186)))

(declare-fun b!772178 () Bool)

(declare-fun res!522310 () Bool)

(assert (=> b!772178 (=> (not res!522310) (not e!429873))))

(declare-datatypes ((List!14305 0))(
  ( (Nil!14302) (Cons!14301 (h!15403 (_ BitVec 64)) (t!20620 List!14305)) )
))
(declare-fun arrayNoDuplicates!0 (array!42409 (_ BitVec 32) List!14305) Bool)

(assert (=> b!772178 (= res!522310 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14302))))

(declare-fun b!772190 () Bool)

(assert (=> b!772190 (= e!429867 e!429873)))

(declare-fun res!522317 () Bool)

(assert (=> b!772190 (=> (not res!522317) (not e!429873))))

(declare-fun lt!343792 () SeekEntryResult!7903)

(assert (=> b!772190 (= res!522317 (or (= lt!343792 (MissingZero!7903 i!1173)) (= lt!343792 (MissingVacant!7903 i!1173))))))

(assert (=> b!772190 (= lt!343792 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!772191 () Bool)

(declare-fun e!429869 () Bool)

(assert (=> b!772191 (= e!429869 true)))

(declare-fun lt!343784 () Unit!26626)

(assert (=> b!772191 (= lt!343784 e!429866)))

(declare-fun c!85332 () Bool)

(assert (=> b!772191 (= c!85332 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772191 (= lt!343789 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772192 () Bool)

(declare-fun res!522308 () Bool)

(assert (=> b!772192 (=> (not res!522308) (not e!429867))))

(declare-fun arrayContainsKey!0 (array!42409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772192 (= res!522308 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772193 () Bool)

(declare-fun res!522313 () Bool)

(assert (=> b!772193 (=> (not res!522313) (not e!429868))))

(assert (=> b!772193 (= res!522313 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20303 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772194 () Bool)

(assert (=> b!772194 (= e!429871 (not e!429869))))

(declare-fun res!522322 () Bool)

(assert (=> b!772194 (=> res!522322 e!429869)))

(assert (=> b!772194 (= res!522322 (or (not (is-Intermediate!7903 lt!343793)) (bvsge x!1131 (x!64910 lt!343793))))))

(assert (=> b!772194 e!429874))

(declare-fun res!522320 () Bool)

(assert (=> b!772194 (=> (not res!522320) (not e!429874))))

(assert (=> b!772194 (= res!522320 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343790 () Unit!26626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26626)

(assert (=> b!772194 (= lt!343790 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772195 () Bool)

(declare-fun Unit!26629 () Unit!26626)

(assert (=> b!772195 (= e!429866 Unit!26629)))

(declare-fun lt!343787 () SeekEntryResult!7903)

(assert (=> b!772195 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343789 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343787)))

(declare-fun b!772196 () Bool)

(assert (=> b!772196 (= e!429873 e!429868)))

(declare-fun res!522323 () Bool)

(assert (=> b!772196 (=> (not res!522323) (not e!429868))))

(assert (=> b!772196 (= res!522323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328) (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343787))))

(assert (=> b!772196 (= lt!343787 (Intermediate!7903 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772197 () Bool)

(assert (=> b!772197 (= e!429870 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343787))))

(assert (= (and start!66916 res!522319) b!772180))

(assert (= (and b!772180 res!522311) b!772184))

(assert (= (and b!772184 res!522315) b!772189))

(assert (= (and b!772189 res!522314) b!772192))

(assert (= (and b!772192 res!522308) b!772190))

(assert (= (and b!772190 res!522317) b!772185))

(assert (= (and b!772185 res!522318) b!772178))

(assert (= (and b!772178 res!522310) b!772181))

(assert (= (and b!772181 res!522321) b!772196))

(assert (= (and b!772196 res!522323) b!772193))

(assert (= (and b!772193 res!522313) b!772186))

(assert (= (and b!772186 c!85333) b!772197))

(assert (= (and b!772186 (not c!85333)) b!772188))

(assert (= (and b!772186 res!522316) b!772183))

(assert (= (and b!772183 res!522309) b!772194))

(assert (= (and b!772194 res!522320) b!772182))

(assert (= (and b!772182 res!522312) b!772179))

(assert (= (and b!772194 (not res!522322)) b!772191))

(assert (= (and b!772191 c!85332) b!772195))

(assert (= (and b!772191 (not c!85332)) b!772187))

(declare-fun m!717151 () Bool)

(assert (=> b!772185 m!717151))

(declare-fun m!717153 () Bool)

(assert (=> start!66916 m!717153))

(declare-fun m!717155 () Bool)

(assert (=> start!66916 m!717155))

(declare-fun m!717157 () Bool)

(assert (=> b!772184 m!717157))

(assert (=> b!772184 m!717157))

(declare-fun m!717159 () Bool)

(assert (=> b!772184 m!717159))

(assert (=> b!772195 m!717157))

(assert (=> b!772195 m!717157))

(declare-fun m!717161 () Bool)

(assert (=> b!772195 m!717161))

(declare-fun m!717163 () Bool)

(assert (=> b!772193 m!717163))

(declare-fun m!717165 () Bool)

(assert (=> b!772190 m!717165))

(declare-fun m!717167 () Bool)

(assert (=> b!772183 m!717167))

(declare-fun m!717169 () Bool)

(assert (=> b!772183 m!717169))

(assert (=> b!772183 m!717167))

(declare-fun m!717171 () Bool)

(assert (=> b!772183 m!717171))

(declare-fun m!717173 () Bool)

(assert (=> b!772183 m!717173))

(declare-fun m!717175 () Bool)

(assert (=> b!772183 m!717175))

(assert (=> b!772196 m!717157))

(assert (=> b!772196 m!717157))

(declare-fun m!717177 () Bool)

(assert (=> b!772196 m!717177))

(assert (=> b!772196 m!717177))

(assert (=> b!772196 m!717157))

(declare-fun m!717179 () Bool)

(assert (=> b!772196 m!717179))

(assert (=> b!772182 m!717157))

(assert (=> b!772182 m!717157))

(declare-fun m!717181 () Bool)

(assert (=> b!772182 m!717181))

(assert (=> b!772188 m!717157))

(assert (=> b!772188 m!717157))

(declare-fun m!717183 () Bool)

(assert (=> b!772188 m!717183))

(declare-fun m!717185 () Bool)

(assert (=> b!772178 m!717185))

(declare-fun m!717187 () Bool)

(assert (=> b!772194 m!717187))

(declare-fun m!717189 () Bool)

(assert (=> b!772194 m!717189))

(assert (=> b!772197 m!717157))

(assert (=> b!772197 m!717157))

(declare-fun m!717191 () Bool)

(assert (=> b!772197 m!717191))

(declare-fun m!717193 () Bool)

(assert (=> b!772192 m!717193))

(assert (=> b!772187 m!717157))

(assert (=> b!772187 m!717157))

(assert (=> b!772187 m!717183))

(assert (=> b!772187 m!717157))

(declare-fun m!717195 () Bool)

(assert (=> b!772187 m!717195))

(declare-fun m!717197 () Bool)

(assert (=> b!772189 m!717197))

(declare-fun m!717199 () Bool)

(assert (=> b!772191 m!717199))

(assert (=> b!772179 m!717157))

(assert (=> b!772179 m!717157))

(declare-fun m!717201 () Bool)

(assert (=> b!772179 m!717201))

(push 1)

