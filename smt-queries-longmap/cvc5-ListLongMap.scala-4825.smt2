; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66290 () Bool)

(assert start!66290)

(declare-datatypes ((array!42195 0))(
  ( (array!42196 (arr!20205 (Array (_ BitVec 32) (_ BitVec 64))) (size!20626 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42195)

(declare-datatypes ((SeekEntryResult!7805 0))(
  ( (MissingZero!7805 (index!33588 (_ BitVec 32))) (Found!7805 (index!33589 (_ BitVec 32))) (Intermediate!7805 (undefined!8617 Bool) (index!33590 (_ BitVec 32)) (x!64489 (_ BitVec 32))) (Undefined!7805) (MissingVacant!7805 (index!33591 (_ BitVec 32))) )
))
(declare-fun lt!340013 () SeekEntryResult!7805)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425582 () Bool)

(declare-fun b!764013 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42195 (_ BitVec 32)) SeekEntryResult!7805)

(assert (=> b!764013 (= e!425582 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20205 a!3186) j!159) a!3186 mask!3328) lt!340013))))

(declare-fun b!764014 () Bool)

(declare-fun res!516909 () Bool)

(declare-fun e!425585 () Bool)

(assert (=> b!764014 (=> (not res!516909) (not e!425585))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!764014 (= res!516909 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20626 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20626 a!3186))))))

(declare-fun b!764015 () Bool)

(declare-fun res!516915 () Bool)

(assert (=> b!764015 (=> (not res!516915) (not e!425585))))

(declare-datatypes ((List!14207 0))(
  ( (Nil!14204) (Cons!14203 (h!15287 (_ BitVec 64)) (t!20522 List!14207)) )
))
(declare-fun arrayNoDuplicates!0 (array!42195 (_ BitVec 32) List!14207) Bool)

(assert (=> b!764015 (= res!516915 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14204))))

(declare-fun res!516905 () Bool)

(declare-fun e!425583 () Bool)

(assert (=> start!66290 (=> (not res!516905) (not e!425583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66290 (= res!516905 (validMask!0 mask!3328))))

(assert (=> start!66290 e!425583))

(assert (=> start!66290 true))

(declare-fun array_inv!16001 (array!42195) Bool)

(assert (=> start!66290 (array_inv!16001 a!3186)))

(declare-fun b!764016 () Bool)

(declare-fun res!516916 () Bool)

(assert (=> b!764016 (=> (not res!516916) (not e!425583))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764016 (= res!516916 (validKeyInArray!0 k!2102))))

(declare-fun b!764017 () Bool)

(declare-fun res!516904 () Bool)

(declare-fun e!425586 () Bool)

(assert (=> b!764017 (=> (not res!516904) (not e!425586))))

(assert (=> b!764017 (= res!516904 e!425582)))

(declare-fun c!83941 () Bool)

(assert (=> b!764017 (= c!83941 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764018 () Bool)

(declare-fun res!516907 () Bool)

(assert (=> b!764018 (=> (not res!516907) (not e!425583))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764018 (= res!516907 (and (= (size!20626 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20626 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20626 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764019 () Bool)

(declare-fun res!516914 () Bool)

(assert (=> b!764019 (=> (not res!516914) (not e!425585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42195 (_ BitVec 32)) Bool)

(assert (=> b!764019 (= res!516914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764020 () Bool)

(declare-fun e!425581 () Bool)

(assert (=> b!764020 (= e!425581 (and (bvsle #b00000000000000000000000000000000 (size!20626 a!3186)) (bvsgt j!159 (size!20626 a!3186))))))

(declare-fun b!764021 () Bool)

(declare-fun res!516906 () Bool)

(assert (=> b!764021 (=> (not res!516906) (not e!425583))))

(assert (=> b!764021 (= res!516906 (validKeyInArray!0 (select (arr!20205 a!3186) j!159)))))

(declare-fun b!764022 () Bool)

(declare-fun res!516913 () Bool)

(assert (=> b!764022 (=> (not res!516913) (not e!425583))))

(declare-fun arrayContainsKey!0 (array!42195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764022 (= res!516913 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764023 () Bool)

(assert (=> b!764023 (= e!425586 e!425581)))

(declare-fun res!516908 () Bool)

(assert (=> b!764023 (=> (not res!516908) (not e!425581))))

(declare-fun lt!340011 () (_ BitVec 64))

(declare-fun lt!340012 () array!42195)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764023 (= res!516908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340011 mask!3328) lt!340011 lt!340012 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340011 lt!340012 mask!3328)))))

(assert (=> b!764023 (= lt!340011 (select (store (arr!20205 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764023 (= lt!340012 (array!42196 (store (arr!20205 a!3186) i!1173 k!2102) (size!20626 a!3186)))))

(declare-fun b!764024 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42195 (_ BitVec 32)) SeekEntryResult!7805)

(assert (=> b!764024 (= e!425582 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20205 a!3186) j!159) a!3186 mask!3328) (Found!7805 j!159)))))

(declare-fun b!764025 () Bool)

(assert (=> b!764025 (= e!425585 e!425586)))

(declare-fun res!516911 () Bool)

(assert (=> b!764025 (=> (not res!516911) (not e!425586))))

(assert (=> b!764025 (= res!516911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20205 a!3186) j!159) mask!3328) (select (arr!20205 a!3186) j!159) a!3186 mask!3328) lt!340013))))

(assert (=> b!764025 (= lt!340013 (Intermediate!7805 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764026 () Bool)

(declare-fun res!516910 () Bool)

(assert (=> b!764026 (=> (not res!516910) (not e!425586))))

(assert (=> b!764026 (= res!516910 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20205 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764027 () Bool)

(assert (=> b!764027 (= e!425583 e!425585)))

(declare-fun res!516912 () Bool)

(assert (=> b!764027 (=> (not res!516912) (not e!425585))))

(declare-fun lt!340010 () SeekEntryResult!7805)

(assert (=> b!764027 (= res!516912 (or (= lt!340010 (MissingZero!7805 i!1173)) (= lt!340010 (MissingVacant!7805 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42195 (_ BitVec 32)) SeekEntryResult!7805)

(assert (=> b!764027 (= lt!340010 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!66290 res!516905) b!764018))

(assert (= (and b!764018 res!516907) b!764021))

(assert (= (and b!764021 res!516906) b!764016))

(assert (= (and b!764016 res!516916) b!764022))

(assert (= (and b!764022 res!516913) b!764027))

(assert (= (and b!764027 res!516912) b!764019))

(assert (= (and b!764019 res!516914) b!764015))

(assert (= (and b!764015 res!516915) b!764014))

(assert (= (and b!764014 res!516909) b!764025))

(assert (= (and b!764025 res!516911) b!764026))

(assert (= (and b!764026 res!516910) b!764017))

(assert (= (and b!764017 c!83941) b!764013))

(assert (= (and b!764017 (not c!83941)) b!764024))

(assert (= (and b!764017 res!516904) b!764023))

(assert (= (and b!764023 res!516908) b!764020))

(declare-fun m!710427 () Bool)

(assert (=> b!764016 m!710427))

(declare-fun m!710429 () Bool)

(assert (=> b!764026 m!710429))

(declare-fun m!710431 () Bool)

(assert (=> b!764015 m!710431))

(declare-fun m!710433 () Bool)

(assert (=> b!764019 m!710433))

(declare-fun m!710435 () Bool)

(assert (=> b!764022 m!710435))

(declare-fun m!710437 () Bool)

(assert (=> b!764025 m!710437))

(assert (=> b!764025 m!710437))

(declare-fun m!710439 () Bool)

(assert (=> b!764025 m!710439))

(assert (=> b!764025 m!710439))

(assert (=> b!764025 m!710437))

(declare-fun m!710441 () Bool)

(assert (=> b!764025 m!710441))

(declare-fun m!710443 () Bool)

(assert (=> start!66290 m!710443))

(declare-fun m!710445 () Bool)

(assert (=> start!66290 m!710445))

(declare-fun m!710447 () Bool)

(assert (=> b!764023 m!710447))

(declare-fun m!710449 () Bool)

(assert (=> b!764023 m!710449))

(declare-fun m!710451 () Bool)

(assert (=> b!764023 m!710451))

(declare-fun m!710453 () Bool)

(assert (=> b!764023 m!710453))

(assert (=> b!764023 m!710449))

(declare-fun m!710455 () Bool)

(assert (=> b!764023 m!710455))

(declare-fun m!710457 () Bool)

(assert (=> b!764027 m!710457))

(assert (=> b!764013 m!710437))

(assert (=> b!764013 m!710437))

(declare-fun m!710459 () Bool)

(assert (=> b!764013 m!710459))

(assert (=> b!764024 m!710437))

(assert (=> b!764024 m!710437))

(declare-fun m!710461 () Bool)

(assert (=> b!764024 m!710461))

(assert (=> b!764021 m!710437))

(assert (=> b!764021 m!710437))

(declare-fun m!710463 () Bool)

(assert (=> b!764021 m!710463))

(push 1)

(assert (not b!764022))

(assert (not b!764019))

(assert (not b!764021))

(assert (not b!764016))

(assert (not b!764027))

(assert (not b!764015))

(assert (not b!764023))

(assert (not start!66290))

(assert (not b!764013))

(assert (not b!764024))

(assert (not b!764025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

