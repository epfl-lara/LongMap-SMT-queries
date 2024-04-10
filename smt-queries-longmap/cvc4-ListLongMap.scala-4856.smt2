; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66910 () Bool)

(assert start!66910)

(declare-fun b!771998 () Bool)

(declare-fun e!429779 () Bool)

(declare-fun e!429778 () Bool)

(assert (=> b!771998 (= e!429779 e!429778)))

(declare-fun res!522176 () Bool)

(assert (=> b!771998 (=> (not res!522176) (not e!429778))))

(declare-datatypes ((SeekEntryResult!7900 0))(
  ( (MissingZero!7900 (index!33968 (_ BitVec 32))) (Found!7900 (index!33969 (_ BitVec 32))) (Intermediate!7900 (undefined!8712 Bool) (index!33970 (_ BitVec 32)) (x!64899 (_ BitVec 32))) (Undefined!7900) (MissingVacant!7900 (index!33971 (_ BitVec 32))) )
))
(declare-fun lt!343691 () SeekEntryResult!7900)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771998 (= res!522176 (or (= lt!343691 (MissingZero!7900 i!1173)) (= lt!343691 (MissingVacant!7900 i!1173))))))

(declare-datatypes ((array!42403 0))(
  ( (array!42404 (arr!20300 (Array (_ BitVec 32) (_ BitVec 64))) (size!20721 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42403)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42403 (_ BitVec 32)) SeekEntryResult!7900)

(assert (=> b!771998 (= lt!343691 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!772000 () Bool)

(declare-fun res!522173 () Bool)

(assert (=> b!772000 (=> (not res!522173) (not e!429779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772000 (= res!522173 (validKeyInArray!0 k!2102))))

(declare-fun b!772001 () Bool)

(declare-fun res!522177 () Bool)

(assert (=> b!772001 (=> (not res!522177) (not e!429778))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!772001 (= res!522177 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20721 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20721 a!3186))))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!429776 () Bool)

(declare-fun lt!343694 () SeekEntryResult!7900)

(declare-fun b!772002 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42403 (_ BitVec 32)) SeekEntryResult!7900)

(assert (=> b!772002 (= e!429776 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343694))))

(declare-fun b!772003 () Bool)

(declare-fun res!522165 () Bool)

(assert (=> b!772003 (=> (not res!522165) (not e!429779))))

(assert (=> b!772003 (= res!522165 (and (= (size!20721 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20721 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20721 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772004 () Bool)

(declare-fun res!522171 () Bool)

(assert (=> b!772004 (=> (not res!522171) (not e!429778))))

(declare-datatypes ((List!14302 0))(
  ( (Nil!14299) (Cons!14298 (h!15400 (_ BitVec 64)) (t!20617 List!14302)) )
))
(declare-fun arrayNoDuplicates!0 (array!42403 (_ BitVec 32) List!14302) Bool)

(assert (=> b!772004 (= res!522171 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14299))))

(declare-fun b!772005 () Bool)

(declare-fun e!429785 () Bool)

(assert (=> b!772005 (= e!429778 e!429785)))

(declare-fun res!522164 () Bool)

(assert (=> b!772005 (=> (not res!522164) (not e!429785))))

(declare-fun lt!343690 () SeekEntryResult!7900)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42403 (_ BitVec 32)) SeekEntryResult!7900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772005 (= res!522164 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20300 a!3186) j!159) mask!3328) (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343690))))

(assert (=> b!772005 (= lt!343690 (Intermediate!7900 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772006 () Bool)

(declare-fun res!522179 () Bool)

(assert (=> b!772006 (=> (not res!522179) (not e!429785))))

(assert (=> b!772006 (= res!522179 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20300 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!429780 () Bool)

(declare-fun b!772007 () Bool)

(assert (=> b!772007 (= e!429780 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343690))))

(declare-fun b!772008 () Bool)

(declare-datatypes ((Unit!26614 0))(
  ( (Unit!26615) )
))
(declare-fun e!429784 () Unit!26614)

(declare-fun Unit!26616 () Unit!26614)

(assert (=> b!772008 (= e!429784 Unit!26616)))

(declare-fun lt!343686 () SeekEntryResult!7900)

(assert (=> b!772008 (= lt!343686 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20300 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343687 () (_ BitVec 32))

(assert (=> b!772008 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343687 resIntermediateIndex!5 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) (Found!7900 j!159))))

(declare-fun res!522178 () Bool)

(assert (=> start!66910 (=> (not res!522178) (not e!429779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66910 (= res!522178 (validMask!0 mask!3328))))

(assert (=> start!66910 e!429779))

(assert (=> start!66910 true))

(declare-fun array_inv!16096 (array!42403) Bool)

(assert (=> start!66910 (array_inv!16096 a!3186)))

(declare-fun b!771999 () Bool)

(declare-fun res!522175 () Bool)

(assert (=> b!771999 (=> (not res!522175) (not e!429779))))

(declare-fun arrayContainsKey!0 (array!42403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771999 (= res!522175 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772009 () Bool)

(assert (=> b!772009 (= e!429780 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) (Found!7900 j!159)))))

(declare-fun b!772010 () Bool)

(declare-fun res!522166 () Bool)

(assert (=> b!772010 (=> (not res!522166) (not e!429778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42403 (_ BitVec 32)) Bool)

(assert (=> b!772010 (= res!522166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772011 () Bool)

(declare-fun res!522169 () Bool)

(assert (=> b!772011 (=> (not res!522169) (not e!429785))))

(assert (=> b!772011 (= res!522169 e!429780)))

(declare-fun c!85314 () Bool)

(assert (=> b!772011 (= c!85314 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772012 () Bool)

(declare-fun Unit!26617 () Unit!26614)

(assert (=> b!772012 (= e!429784 Unit!26617)))

(assert (=> b!772012 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343687 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343690)))

(declare-fun b!772013 () Bool)

(declare-fun e!429777 () Bool)

(assert (=> b!772013 (= e!429777 e!429776)))

(declare-fun res!522174 () Bool)

(assert (=> b!772013 (=> (not res!522174) (not e!429776))))

(assert (=> b!772013 (= res!522174 (= (seekEntryOrOpen!0 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343694))))

(assert (=> b!772013 (= lt!343694 (Found!7900 j!159))))

(declare-fun b!772014 () Bool)

(declare-fun res!522172 () Bool)

(assert (=> b!772014 (=> (not res!522172) (not e!429779))))

(assert (=> b!772014 (= res!522172 (validKeyInArray!0 (select (arr!20300 a!3186) j!159)))))

(declare-fun b!772015 () Bool)

(declare-fun e!429783 () Bool)

(assert (=> b!772015 (= e!429783 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000)))))

(declare-fun lt!343685 () Unit!26614)

(assert (=> b!772015 (= lt!343685 e!429784)))

(declare-fun c!85315 () Bool)

(assert (=> b!772015 (= c!85315 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772015 (= lt!343687 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772016 () Bool)

(declare-fun e!429782 () Bool)

(assert (=> b!772016 (= e!429782 (not e!429783))))

(declare-fun res!522168 () Bool)

(assert (=> b!772016 (=> res!522168 e!429783)))

(declare-fun lt!343692 () SeekEntryResult!7900)

(assert (=> b!772016 (= res!522168 (or (not (is-Intermediate!7900 lt!343692)) (bvsge x!1131 (x!64899 lt!343692))))))

(assert (=> b!772016 e!429777))

(declare-fun res!522170 () Bool)

(assert (=> b!772016 (=> (not res!522170) (not e!429777))))

(assert (=> b!772016 (= res!522170 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343688 () Unit!26614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26614)

(assert (=> b!772016 (= lt!343688 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772017 () Bool)

(assert (=> b!772017 (= e!429785 e!429782)))

(declare-fun res!522167 () Bool)

(assert (=> b!772017 (=> (not res!522167) (not e!429782))))

(declare-fun lt!343684 () SeekEntryResult!7900)

(assert (=> b!772017 (= res!522167 (= lt!343684 lt!343692))))

(declare-fun lt!343693 () array!42403)

(declare-fun lt!343689 () (_ BitVec 64))

(assert (=> b!772017 (= lt!343692 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343689 lt!343693 mask!3328))))

(assert (=> b!772017 (= lt!343684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343689 mask!3328) lt!343689 lt!343693 mask!3328))))

(assert (=> b!772017 (= lt!343689 (select (store (arr!20300 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!772017 (= lt!343693 (array!42404 (store (arr!20300 a!3186) i!1173 k!2102) (size!20721 a!3186)))))

(assert (= (and start!66910 res!522178) b!772003))

(assert (= (and b!772003 res!522165) b!772014))

(assert (= (and b!772014 res!522172) b!772000))

(assert (= (and b!772000 res!522173) b!771999))

(assert (= (and b!771999 res!522175) b!771998))

(assert (= (and b!771998 res!522176) b!772010))

(assert (= (and b!772010 res!522166) b!772004))

(assert (= (and b!772004 res!522171) b!772001))

(assert (= (and b!772001 res!522177) b!772005))

(assert (= (and b!772005 res!522164) b!772006))

(assert (= (and b!772006 res!522179) b!772011))

(assert (= (and b!772011 c!85314) b!772007))

(assert (= (and b!772011 (not c!85314)) b!772009))

(assert (= (and b!772011 res!522169) b!772017))

(assert (= (and b!772017 res!522167) b!772016))

(assert (= (and b!772016 res!522170) b!772013))

(assert (= (and b!772013 res!522174) b!772002))

(assert (= (and b!772016 (not res!522168)) b!772015))

(assert (= (and b!772015 c!85315) b!772012))

(assert (= (and b!772015 (not c!85315)) b!772008))

(declare-fun m!716995 () Bool)

(assert (=> b!772004 m!716995))

(declare-fun m!716997 () Bool)

(assert (=> b!772012 m!716997))

(assert (=> b!772012 m!716997))

(declare-fun m!716999 () Bool)

(assert (=> b!772012 m!716999))

(declare-fun m!717001 () Bool)

(assert (=> b!772006 m!717001))

(assert (=> b!772013 m!716997))

(assert (=> b!772013 m!716997))

(declare-fun m!717003 () Bool)

(assert (=> b!772013 m!717003))

(assert (=> b!772014 m!716997))

(assert (=> b!772014 m!716997))

(declare-fun m!717005 () Bool)

(assert (=> b!772014 m!717005))

(declare-fun m!717007 () Bool)

(assert (=> b!772016 m!717007))

(declare-fun m!717009 () Bool)

(assert (=> b!772016 m!717009))

(declare-fun m!717011 () Bool)

(assert (=> b!772000 m!717011))

(declare-fun m!717013 () Bool)

(assert (=> b!771998 m!717013))

(assert (=> b!772009 m!716997))

(assert (=> b!772009 m!716997))

(declare-fun m!717015 () Bool)

(assert (=> b!772009 m!717015))

(declare-fun m!717017 () Bool)

(assert (=> b!772010 m!717017))

(declare-fun m!717019 () Bool)

(assert (=> start!66910 m!717019))

(declare-fun m!717021 () Bool)

(assert (=> start!66910 m!717021))

(declare-fun m!717023 () Bool)

(assert (=> b!772017 m!717023))

(declare-fun m!717025 () Bool)

(assert (=> b!772017 m!717025))

(declare-fun m!717027 () Bool)

(assert (=> b!772017 m!717027))

(declare-fun m!717029 () Bool)

(assert (=> b!772017 m!717029))

(assert (=> b!772017 m!717023))

(declare-fun m!717031 () Bool)

(assert (=> b!772017 m!717031))

(declare-fun m!717033 () Bool)

(assert (=> b!771999 m!717033))

(assert (=> b!772007 m!716997))

(assert (=> b!772007 m!716997))

(declare-fun m!717035 () Bool)

(assert (=> b!772007 m!717035))

(assert (=> b!772008 m!716997))

(assert (=> b!772008 m!716997))

(assert (=> b!772008 m!717015))

(assert (=> b!772008 m!716997))

(declare-fun m!717037 () Bool)

(assert (=> b!772008 m!717037))

(declare-fun m!717039 () Bool)

(assert (=> b!772015 m!717039))

(assert (=> b!772002 m!716997))

(assert (=> b!772002 m!716997))

(declare-fun m!717041 () Bool)

(assert (=> b!772002 m!717041))

(assert (=> b!772005 m!716997))

(assert (=> b!772005 m!716997))

(declare-fun m!717043 () Bool)

(assert (=> b!772005 m!717043))

(assert (=> b!772005 m!717043))

(assert (=> b!772005 m!716997))

(declare-fun m!717045 () Bool)

(assert (=> b!772005 m!717045))

(push 1)

