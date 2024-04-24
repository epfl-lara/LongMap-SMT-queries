; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66326 () Bool)

(assert start!66326)

(declare-fun b!763017 () Bool)

(declare-fun res!515755 () Bool)

(declare-fun e!425388 () Bool)

(assert (=> b!763017 (=> (not res!515755) (not e!425388))))

(declare-datatypes ((array!42109 0))(
  ( (array!42110 (arr!20158 (Array (_ BitVec 32) (_ BitVec 64))) (size!20578 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42109)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!763017 (= res!515755 (and (= (size!20578 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20578 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20578 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763018 () Bool)

(declare-fun res!515759 () Bool)

(assert (=> b!763018 (=> (not res!515759) (not e!425388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763018 (= res!515759 (validKeyInArray!0 (select (arr!20158 a!3186) j!159)))))

(declare-fun b!763019 () Bool)

(declare-fun res!515760 () Bool)

(assert (=> b!763019 (=> (not res!515760) (not e!425388))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763019 (= res!515760 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763020 () Bool)

(declare-fun e!425389 () Bool)

(assert (=> b!763020 (= e!425388 e!425389)))

(declare-fun res!515758 () Bool)

(assert (=> b!763020 (=> (not res!515758) (not e!425389))))

(declare-datatypes ((SeekEntryResult!7714 0))(
  ( (MissingZero!7714 (index!33224 (_ BitVec 32))) (Found!7714 (index!33225 (_ BitVec 32))) (Intermediate!7714 (undefined!8526 Bool) (index!33226 (_ BitVec 32)) (x!64297 (_ BitVec 32))) (Undefined!7714) (MissingVacant!7714 (index!33227 (_ BitVec 32))) )
))
(declare-fun lt!339828 () SeekEntryResult!7714)

(assert (=> b!763020 (= res!515758 (or (= lt!339828 (MissingZero!7714 i!1173)) (= lt!339828 (MissingVacant!7714 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42109 (_ BitVec 32)) SeekEntryResult!7714)

(assert (=> b!763020 (= lt!339828 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763021 () Bool)

(declare-fun res!515761 () Bool)

(assert (=> b!763021 (=> (not res!515761) (not e!425389))))

(declare-datatypes ((List!14067 0))(
  ( (Nil!14064) (Cons!14063 (h!15153 (_ BitVec 64)) (t!20374 List!14067)) )
))
(declare-fun arrayNoDuplicates!0 (array!42109 (_ BitVec 32) List!14067) Bool)

(assert (=> b!763021 (= res!515761 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14064))))

(declare-fun res!515756 () Bool)

(assert (=> start!66326 (=> (not res!515756) (not e!425388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66326 (= res!515756 (validMask!0 mask!3328))))

(assert (=> start!66326 e!425388))

(assert (=> start!66326 true))

(declare-fun array_inv!16017 (array!42109) Bool)

(assert (=> start!66326 (array_inv!16017 a!3186)))

(declare-fun b!763022 () Bool)

(assert (=> b!763022 (= e!425389 false)))

(declare-fun lt!339827 () SeekEntryResult!7714)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42109 (_ BitVec 32)) SeekEntryResult!7714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763022 (= lt!339827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20158 a!3186) j!159) mask!3328) (select (arr!20158 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!763023 () Bool)

(declare-fun res!515757 () Bool)

(assert (=> b!763023 (=> (not res!515757) (not e!425389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42109 (_ BitVec 32)) Bool)

(assert (=> b!763023 (= res!515757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763024 () Bool)

(declare-fun res!515762 () Bool)

(assert (=> b!763024 (=> (not res!515762) (not e!425388))))

(assert (=> b!763024 (= res!515762 (validKeyInArray!0 k0!2102))))

(declare-fun b!763025 () Bool)

(declare-fun res!515754 () Bool)

(assert (=> b!763025 (=> (not res!515754) (not e!425389))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763025 (= res!515754 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20578 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20578 a!3186))))))

(assert (= (and start!66326 res!515756) b!763017))

(assert (= (and b!763017 res!515755) b!763018))

(assert (= (and b!763018 res!515759) b!763024))

(assert (= (and b!763024 res!515762) b!763019))

(assert (= (and b!763019 res!515760) b!763020))

(assert (= (and b!763020 res!515758) b!763023))

(assert (= (and b!763023 res!515757) b!763021))

(assert (= (and b!763021 res!515761) b!763025))

(assert (= (and b!763025 res!515754) b!763022))

(declare-fun m!710155 () Bool)

(assert (=> b!763018 m!710155))

(assert (=> b!763018 m!710155))

(declare-fun m!710157 () Bool)

(assert (=> b!763018 m!710157))

(declare-fun m!710159 () Bool)

(assert (=> b!763019 m!710159))

(assert (=> b!763022 m!710155))

(assert (=> b!763022 m!710155))

(declare-fun m!710161 () Bool)

(assert (=> b!763022 m!710161))

(assert (=> b!763022 m!710161))

(assert (=> b!763022 m!710155))

(declare-fun m!710163 () Bool)

(assert (=> b!763022 m!710163))

(declare-fun m!710165 () Bool)

(assert (=> b!763020 m!710165))

(declare-fun m!710167 () Bool)

(assert (=> b!763024 m!710167))

(declare-fun m!710169 () Bool)

(assert (=> start!66326 m!710169))

(declare-fun m!710171 () Bool)

(assert (=> start!66326 m!710171))

(declare-fun m!710173 () Bool)

(assert (=> b!763021 m!710173))

(declare-fun m!710175 () Bool)

(assert (=> b!763023 m!710175))

(check-sat (not b!763024) (not b!763023) (not b!763021) (not b!763019) (not b!763020) (not start!66326) (not b!763022) (not b!763018))
(check-sat)
