; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66234 () Bool)

(assert start!66234)

(declare-fun b!763012 () Bool)

(declare-fun res!516159 () Bool)

(declare-fun e!425148 () Bool)

(assert (=> b!763012 (=> (not res!516159) (not e!425148))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763012 (= res!516159 (validKeyInArray!0 k0!2102))))

(declare-datatypes ((array!42156 0))(
  ( (array!42157 (arr!20186 (Array (_ BitVec 32) (_ BitVec 64))) (size!20607 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42156)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425150 () Bool)

(declare-fun b!763013 () Bool)

(declare-datatypes ((SeekEntryResult!7783 0))(
  ( (MissingZero!7783 (index!33500 (_ BitVec 32))) (Found!7783 (index!33501 (_ BitVec 32))) (Intermediate!7783 (undefined!8595 Bool) (index!33502 (_ BitVec 32)) (x!64414 (_ BitVec 32))) (Undefined!7783) (MissingVacant!7783 (index!33503 (_ BitVec 32))) )
))
(declare-fun lt!339517 () SeekEntryResult!7783)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42156 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!763013 (= e!425150 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20186 a!3186) j!159) a!3186 mask!3328) lt!339517)))))

(declare-fun b!763014 () Bool)

(declare-fun res!516151 () Bool)

(declare-fun e!425146 () Bool)

(assert (=> b!763014 (=> (not res!516151) (not e!425146))))

(declare-datatypes ((List!14227 0))(
  ( (Nil!14224) (Cons!14223 (h!15307 (_ BitVec 64)) (t!20533 List!14227)) )
))
(declare-fun arrayNoDuplicates!0 (array!42156 (_ BitVec 32) List!14227) Bool)

(assert (=> b!763014 (= res!516151 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14224))))

(declare-fun b!763015 () Bool)

(declare-fun e!425147 () Bool)

(assert (=> b!763015 (= e!425146 e!425147)))

(declare-fun res!516161 () Bool)

(assert (=> b!763015 (=> (not res!516161) (not e!425147))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763015 (= res!516161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20186 a!3186) j!159) mask!3328) (select (arr!20186 a!3186) j!159) a!3186 mask!3328) lt!339517))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763015 (= lt!339517 (Intermediate!7783 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763016 () Bool)

(declare-fun res!516154 () Bool)

(assert (=> b!763016 (=> (not res!516154) (not e!425148))))

(assert (=> b!763016 (= res!516154 (validKeyInArray!0 (select (arr!20186 a!3186) j!159)))))

(declare-fun res!516157 () Bool)

(assert (=> start!66234 (=> (not res!516157) (not e!425148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66234 (= res!516157 (validMask!0 mask!3328))))

(assert (=> start!66234 e!425148))

(assert (=> start!66234 true))

(declare-fun array_inv!16069 (array!42156) Bool)

(assert (=> start!66234 (array_inv!16069 a!3186)))

(declare-fun b!763017 () Bool)

(assert (=> b!763017 (= e!425147 false)))

(declare-fun lt!339518 () Bool)

(assert (=> b!763017 (= lt!339518 e!425150)))

(declare-fun c!83817 () Bool)

(assert (=> b!763017 (= c!83817 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763018 () Bool)

(declare-fun res!516152 () Bool)

(assert (=> b!763018 (=> (not res!516152) (not e!425148))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763018 (= res!516152 (and (= (size!20607 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20607 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20607 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763019 () Bool)

(assert (=> b!763019 (= e!425148 e!425146)))

(declare-fun res!516156 () Bool)

(assert (=> b!763019 (=> (not res!516156) (not e!425146))))

(declare-fun lt!339516 () SeekEntryResult!7783)

(assert (=> b!763019 (= res!516156 (or (= lt!339516 (MissingZero!7783 i!1173)) (= lt!339516 (MissingVacant!7783 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42156 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!763019 (= lt!339516 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763020 () Bool)

(declare-fun res!516160 () Bool)

(assert (=> b!763020 (=> (not res!516160) (not e!425146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42156 (_ BitVec 32)) Bool)

(assert (=> b!763020 (= res!516160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763021 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42156 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!763021 (= e!425150 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20186 a!3186) j!159) a!3186 mask!3328) (Found!7783 j!159))))))

(declare-fun b!763022 () Bool)

(declare-fun res!516153 () Bool)

(assert (=> b!763022 (=> (not res!516153) (not e!425147))))

(assert (=> b!763022 (= res!516153 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20186 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763023 () Bool)

(declare-fun res!516158 () Bool)

(assert (=> b!763023 (=> (not res!516158) (not e!425146))))

(assert (=> b!763023 (= res!516158 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20607 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20607 a!3186))))))

(declare-fun b!763024 () Bool)

(declare-fun res!516155 () Bool)

(assert (=> b!763024 (=> (not res!516155) (not e!425148))))

(declare-fun arrayContainsKey!0 (array!42156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763024 (= res!516155 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66234 res!516157) b!763018))

(assert (= (and b!763018 res!516152) b!763016))

(assert (= (and b!763016 res!516154) b!763012))

(assert (= (and b!763012 res!516159) b!763024))

(assert (= (and b!763024 res!516155) b!763019))

(assert (= (and b!763019 res!516156) b!763020))

(assert (= (and b!763020 res!516160) b!763014))

(assert (= (and b!763014 res!516151) b!763023))

(assert (= (and b!763023 res!516158) b!763015))

(assert (= (and b!763015 res!516161) b!763022))

(assert (= (and b!763022 res!516153) b!763017))

(assert (= (and b!763017 c!83817) b!763013))

(assert (= (and b!763017 (not c!83817)) b!763021))

(declare-fun m!709045 () Bool)

(assert (=> b!763024 m!709045))

(declare-fun m!709047 () Bool)

(assert (=> b!763019 m!709047))

(declare-fun m!709049 () Bool)

(assert (=> b!763020 m!709049))

(declare-fun m!709051 () Bool)

(assert (=> start!66234 m!709051))

(declare-fun m!709053 () Bool)

(assert (=> start!66234 m!709053))

(declare-fun m!709055 () Bool)

(assert (=> b!763016 m!709055))

(assert (=> b!763016 m!709055))

(declare-fun m!709057 () Bool)

(assert (=> b!763016 m!709057))

(declare-fun m!709059 () Bool)

(assert (=> b!763012 m!709059))

(assert (=> b!763021 m!709055))

(assert (=> b!763021 m!709055))

(declare-fun m!709061 () Bool)

(assert (=> b!763021 m!709061))

(assert (=> b!763013 m!709055))

(assert (=> b!763013 m!709055))

(declare-fun m!709063 () Bool)

(assert (=> b!763013 m!709063))

(assert (=> b!763015 m!709055))

(assert (=> b!763015 m!709055))

(declare-fun m!709065 () Bool)

(assert (=> b!763015 m!709065))

(assert (=> b!763015 m!709065))

(assert (=> b!763015 m!709055))

(declare-fun m!709067 () Bool)

(assert (=> b!763015 m!709067))

(declare-fun m!709069 () Bool)

(assert (=> b!763014 m!709069))

(declare-fun m!709071 () Bool)

(assert (=> b!763022 m!709071))

(check-sat (not b!763019) (not b!763020) (not b!763014) (not start!66234) (not b!763015) (not b!763024) (not b!763012) (not b!763013) (not b!763021) (not b!763016))
(check-sat)
