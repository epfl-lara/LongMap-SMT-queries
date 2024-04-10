; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66238 () Bool)

(assert start!66238)

(declare-fun b!762932 () Bool)

(declare-fun e!425180 () Bool)

(declare-fun e!425181 () Bool)

(assert (=> b!762932 (= e!425180 e!425181)))

(declare-fun res!515989 () Bool)

(assert (=> b!762932 (=> (not res!515989) (not e!425181))))

(declare-datatypes ((array!42143 0))(
  ( (array!42144 (arr!20179 (Array (_ BitVec 32) (_ BitVec 64))) (size!20600 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42143)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7779 0))(
  ( (MissingZero!7779 (index!33484 (_ BitVec 32))) (Found!7779 (index!33485 (_ BitVec 32))) (Intermediate!7779 (undefined!8591 Bool) (index!33486 (_ BitVec 32)) (x!64391 (_ BitVec 32))) (Undefined!7779) (MissingVacant!7779 (index!33487 (_ BitVec 32))) )
))
(declare-fun lt!339684 () SeekEntryResult!7779)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42143 (_ BitVec 32)) SeekEntryResult!7779)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762932 (= res!515989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20179 a!3186) j!159) mask!3328) (select (arr!20179 a!3186) j!159) a!3186 mask!3328) lt!339684))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762932 (= lt!339684 (Intermediate!7779 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762933 () Bool)

(declare-fun res!515981 () Bool)

(declare-fun e!425184 () Bool)

(assert (=> b!762933 (=> (not res!515981) (not e!425184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762933 (= res!515981 (validKeyInArray!0 (select (arr!20179 a!3186) j!159)))))

(declare-fun b!762934 () Bool)

(assert (=> b!762934 (= e!425184 e!425180)))

(declare-fun res!515980 () Bool)

(assert (=> b!762934 (=> (not res!515980) (not e!425180))))

(declare-fun lt!339686 () SeekEntryResult!7779)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762934 (= res!515980 (or (= lt!339686 (MissingZero!7779 i!1173)) (= lt!339686 (MissingVacant!7779 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42143 (_ BitVec 32)) SeekEntryResult!7779)

(assert (=> b!762934 (= lt!339686 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762935 () Bool)

(declare-fun res!515988 () Bool)

(assert (=> b!762935 (=> (not res!515988) (not e!425184))))

(assert (=> b!762935 (= res!515988 (and (= (size!20600 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20600 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20600 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762936 () Bool)

(declare-fun res!515982 () Bool)

(assert (=> b!762936 (=> (not res!515982) (not e!425180))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!762936 (= res!515982 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20600 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20600 a!3186))))))

(declare-fun b!762937 () Bool)

(declare-fun res!515987 () Bool)

(assert (=> b!762937 (=> (not res!515987) (not e!425184))))

(declare-fun arrayContainsKey!0 (array!42143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762937 (= res!515987 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!425182 () Bool)

(declare-fun b!762938 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42143 (_ BitVec 32)) SeekEntryResult!7779)

(assert (=> b!762938 (= e!425182 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20179 a!3186) j!159) a!3186 mask!3328) (Found!7779 j!159))))))

(declare-fun b!762939 () Bool)

(declare-fun res!515986 () Bool)

(assert (=> b!762939 (=> (not res!515986) (not e!425181))))

(assert (=> b!762939 (= res!515986 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20179 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762940 () Bool)

(declare-fun res!515984 () Bool)

(assert (=> b!762940 (=> (not res!515984) (not e!425184))))

(assert (=> b!762940 (= res!515984 (validKeyInArray!0 k0!2102))))

(declare-fun b!762941 () Bool)

(declare-fun res!515985 () Bool)

(assert (=> b!762941 (=> (not res!515985) (not e!425180))))

(declare-datatypes ((List!14181 0))(
  ( (Nil!14178) (Cons!14177 (h!15261 (_ BitVec 64)) (t!20496 List!14181)) )
))
(declare-fun arrayNoDuplicates!0 (array!42143 (_ BitVec 32) List!14181) Bool)

(assert (=> b!762941 (= res!515985 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14178))))

(declare-fun b!762942 () Bool)

(assert (=> b!762942 (= e!425182 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20179 a!3186) j!159) a!3186 mask!3328) lt!339684)))))

(declare-fun res!515979 () Bool)

(assert (=> start!66238 (=> (not res!515979) (not e!425184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66238 (= res!515979 (validMask!0 mask!3328))))

(assert (=> start!66238 e!425184))

(assert (=> start!66238 true))

(declare-fun array_inv!15975 (array!42143) Bool)

(assert (=> start!66238 (array_inv!15975 a!3186)))

(declare-fun b!762943 () Bool)

(declare-fun res!515983 () Bool)

(assert (=> b!762943 (=> (not res!515983) (not e!425180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42143 (_ BitVec 32)) Bool)

(assert (=> b!762943 (= res!515983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762944 () Bool)

(assert (=> b!762944 (= e!425181 false)))

(declare-fun lt!339685 () Bool)

(assert (=> b!762944 (= lt!339685 e!425182)))

(declare-fun c!83863 () Bool)

(assert (=> b!762944 (= c!83863 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66238 res!515979) b!762935))

(assert (= (and b!762935 res!515988) b!762933))

(assert (= (and b!762933 res!515981) b!762940))

(assert (= (and b!762940 res!515984) b!762937))

(assert (= (and b!762937 res!515987) b!762934))

(assert (= (and b!762934 res!515980) b!762943))

(assert (= (and b!762943 res!515983) b!762941))

(assert (= (and b!762941 res!515985) b!762936))

(assert (= (and b!762936 res!515982) b!762932))

(assert (= (and b!762932 res!515989) b!762939))

(assert (= (and b!762939 res!515986) b!762944))

(assert (= (and b!762944 c!83863) b!762942))

(assert (= (and b!762944 (not c!83863)) b!762938))

(declare-fun m!709543 () Bool)

(assert (=> b!762942 m!709543))

(assert (=> b!762942 m!709543))

(declare-fun m!709545 () Bool)

(assert (=> b!762942 m!709545))

(declare-fun m!709547 () Bool)

(assert (=> b!762943 m!709547))

(declare-fun m!709549 () Bool)

(assert (=> b!762941 m!709549))

(assert (=> b!762933 m!709543))

(assert (=> b!762933 m!709543))

(declare-fun m!709551 () Bool)

(assert (=> b!762933 m!709551))

(assert (=> b!762938 m!709543))

(assert (=> b!762938 m!709543))

(declare-fun m!709553 () Bool)

(assert (=> b!762938 m!709553))

(declare-fun m!709555 () Bool)

(assert (=> b!762940 m!709555))

(declare-fun m!709557 () Bool)

(assert (=> start!66238 m!709557))

(declare-fun m!709559 () Bool)

(assert (=> start!66238 m!709559))

(declare-fun m!709561 () Bool)

(assert (=> b!762937 m!709561))

(declare-fun m!709563 () Bool)

(assert (=> b!762939 m!709563))

(declare-fun m!709565 () Bool)

(assert (=> b!762934 m!709565))

(assert (=> b!762932 m!709543))

(assert (=> b!762932 m!709543))

(declare-fun m!709567 () Bool)

(assert (=> b!762932 m!709567))

(assert (=> b!762932 m!709567))

(assert (=> b!762932 m!709543))

(declare-fun m!709569 () Bool)

(assert (=> b!762932 m!709569))

(check-sat (not b!762934) (not start!66238) (not b!762940) (not b!762941) (not b!762938) (not b!762937) (not b!762933) (not b!762943) (not b!762932) (not b!762942))
(check-sat)
