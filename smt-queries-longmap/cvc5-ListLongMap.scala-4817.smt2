; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66242 () Bool)

(assert start!66242)

(declare-fun b!763012 () Bool)

(declare-fun res!516047 () Bool)

(declare-fun e!425213 () Bool)

(assert (=> b!763012 (=> (not res!516047) (not e!425213))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763012 (= res!516047 (validKeyInArray!0 k!2102))))

(declare-fun b!763013 () Bool)

(declare-fun res!516050 () Bool)

(declare-fun e!425214 () Bool)

(assert (=> b!763013 (=> (not res!516050) (not e!425214))))

(declare-datatypes ((array!42147 0))(
  ( (array!42148 (arr!20181 (Array (_ BitVec 32) (_ BitVec 64))) (size!20602 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42147)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42147 (_ BitVec 32)) Bool)

(assert (=> b!763013 (= res!516050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763014 () Bool)

(declare-fun res!516058 () Bool)

(declare-fun e!425210 () Bool)

(assert (=> b!763014 (=> (not res!516058) (not e!425210))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!763014 (= res!516058 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20181 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763015 () Bool)

(assert (=> b!763015 (= e!425214 e!425210)))

(declare-fun res!516049 () Bool)

(assert (=> b!763015 (=> (not res!516049) (not e!425210))))

(declare-datatypes ((SeekEntryResult!7781 0))(
  ( (MissingZero!7781 (index!33492 (_ BitVec 32))) (Found!7781 (index!33493 (_ BitVec 32))) (Intermediate!7781 (undefined!8593 Bool) (index!33494 (_ BitVec 32)) (x!64401 (_ BitVec 32))) (Undefined!7781) (MissingVacant!7781 (index!33495 (_ BitVec 32))) )
))
(declare-fun lt!339703 () SeekEntryResult!7781)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42147 (_ BitVec 32)) SeekEntryResult!7781)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763015 (= res!516049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20181 a!3186) j!159) mask!3328) (select (arr!20181 a!3186) j!159) a!3186 mask!3328) lt!339703))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763015 (= lt!339703 (Intermediate!7781 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763016 () Bool)

(assert (=> b!763016 (= e!425210 false)))

(declare-fun lt!339704 () (_ BitVec 32))

(assert (=> b!763016 (= lt!339704 (toIndex!0 (select (store (arr!20181 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!763017 () Bool)

(declare-fun res!516054 () Bool)

(assert (=> b!763017 (=> (not res!516054) (not e!425213))))

(declare-fun arrayContainsKey!0 (array!42147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763017 (= res!516054 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763018 () Bool)

(declare-fun res!516053 () Bool)

(assert (=> b!763018 (=> (not res!516053) (not e!425214))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763018 (= res!516053 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20602 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20602 a!3186))))))

(declare-fun b!763019 () Bool)

(declare-fun res!516057 () Bool)

(assert (=> b!763019 (=> (not res!516057) (not e!425213))))

(assert (=> b!763019 (= res!516057 (validKeyInArray!0 (select (arr!20181 a!3186) j!159)))))

(declare-fun res!516055 () Bool)

(assert (=> start!66242 (=> (not res!516055) (not e!425213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66242 (= res!516055 (validMask!0 mask!3328))))

(assert (=> start!66242 e!425213))

(assert (=> start!66242 true))

(declare-fun array_inv!15977 (array!42147) Bool)

(assert (=> start!66242 (array_inv!15977 a!3186)))

(declare-fun b!763020 () Bool)

(declare-fun res!516056 () Bool)

(assert (=> b!763020 (=> (not res!516056) (not e!425214))))

(declare-datatypes ((List!14183 0))(
  ( (Nil!14180) (Cons!14179 (h!15263 (_ BitVec 64)) (t!20498 List!14183)) )
))
(declare-fun arrayNoDuplicates!0 (array!42147 (_ BitVec 32) List!14183) Bool)

(assert (=> b!763020 (= res!516056 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14180))))

(declare-fun b!763021 () Bool)

(declare-fun res!516048 () Bool)

(assert (=> b!763021 (=> (not res!516048) (not e!425210))))

(declare-fun e!425212 () Bool)

(assert (=> b!763021 (= res!516048 e!425212)))

(declare-fun c!83869 () Bool)

(assert (=> b!763021 (= c!83869 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763022 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42147 (_ BitVec 32)) SeekEntryResult!7781)

(assert (=> b!763022 (= e!425212 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20181 a!3186) j!159) a!3186 mask!3328) (Found!7781 j!159)))))

(declare-fun b!763023 () Bool)

(declare-fun res!516052 () Bool)

(assert (=> b!763023 (=> (not res!516052) (not e!425213))))

(assert (=> b!763023 (= res!516052 (and (= (size!20602 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20602 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20602 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763024 () Bool)

(assert (=> b!763024 (= e!425212 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20181 a!3186) j!159) a!3186 mask!3328) lt!339703))))

(declare-fun b!763025 () Bool)

(assert (=> b!763025 (= e!425213 e!425214)))

(declare-fun res!516051 () Bool)

(assert (=> b!763025 (=> (not res!516051) (not e!425214))))

(declare-fun lt!339702 () SeekEntryResult!7781)

(assert (=> b!763025 (= res!516051 (or (= lt!339702 (MissingZero!7781 i!1173)) (= lt!339702 (MissingVacant!7781 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42147 (_ BitVec 32)) SeekEntryResult!7781)

(assert (=> b!763025 (= lt!339702 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!66242 res!516055) b!763023))

(assert (= (and b!763023 res!516052) b!763019))

(assert (= (and b!763019 res!516057) b!763012))

(assert (= (and b!763012 res!516047) b!763017))

(assert (= (and b!763017 res!516054) b!763025))

(assert (= (and b!763025 res!516051) b!763013))

(assert (= (and b!763013 res!516050) b!763020))

(assert (= (and b!763020 res!516056) b!763018))

(assert (= (and b!763018 res!516053) b!763015))

(assert (= (and b!763015 res!516049) b!763014))

(assert (= (and b!763014 res!516058) b!763021))

(assert (= (and b!763021 c!83869) b!763024))

(assert (= (and b!763021 (not c!83869)) b!763022))

(assert (= (and b!763021 res!516048) b!763016))

(declare-fun m!709599 () Bool)

(assert (=> b!763013 m!709599))

(declare-fun m!709601 () Bool)

(assert (=> b!763022 m!709601))

(assert (=> b!763022 m!709601))

(declare-fun m!709603 () Bool)

(assert (=> b!763022 m!709603))

(declare-fun m!709605 () Bool)

(assert (=> b!763012 m!709605))

(assert (=> b!763015 m!709601))

(assert (=> b!763015 m!709601))

(declare-fun m!709607 () Bool)

(assert (=> b!763015 m!709607))

(assert (=> b!763015 m!709607))

(assert (=> b!763015 m!709601))

(declare-fun m!709609 () Bool)

(assert (=> b!763015 m!709609))

(declare-fun m!709611 () Bool)

(assert (=> b!763020 m!709611))

(declare-fun m!709613 () Bool)

(assert (=> start!66242 m!709613))

(declare-fun m!709615 () Bool)

(assert (=> start!66242 m!709615))

(declare-fun m!709617 () Bool)

(assert (=> b!763016 m!709617))

(declare-fun m!709619 () Bool)

(assert (=> b!763016 m!709619))

(assert (=> b!763016 m!709619))

(declare-fun m!709621 () Bool)

(assert (=> b!763016 m!709621))

(declare-fun m!709623 () Bool)

(assert (=> b!763025 m!709623))

(assert (=> b!763024 m!709601))

(assert (=> b!763024 m!709601))

(declare-fun m!709625 () Bool)

(assert (=> b!763024 m!709625))

(declare-fun m!709627 () Bool)

(assert (=> b!763017 m!709627))

(assert (=> b!763019 m!709601))

(assert (=> b!763019 m!709601))

(declare-fun m!709629 () Bool)

(assert (=> b!763019 m!709629))

(declare-fun m!709631 () Bool)

(assert (=> b!763014 m!709631))

(push 1)

