; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66216 () Bool)

(assert start!66216)

(declare-fun b!762507 () Bool)

(declare-fun res!515618 () Bool)

(declare-fun e!425017 () Bool)

(assert (=> b!762507 (=> (not res!515618) (not e!425017))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42121 0))(
  ( (array!42122 (arr!20168 (Array (_ BitVec 32) (_ BitVec 64))) (size!20589 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42121)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!762507 (= res!515618 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20589 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20589 a!3186))))))

(declare-fun b!762508 () Bool)

(declare-fun res!515624 () Bool)

(declare-fun e!425019 () Bool)

(assert (=> b!762508 (=> (not res!515624) (not e!425019))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762508 (= res!515624 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!515623 () Bool)

(assert (=> start!66216 (=> (not res!515623) (not e!425019))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66216 (= res!515623 (validMask!0 mask!3328))))

(assert (=> start!66216 e!425019))

(assert (=> start!66216 true))

(declare-fun array_inv!15964 (array!42121) Bool)

(assert (=> start!66216 (array_inv!15964 a!3186)))

(declare-fun b!762509 () Bool)

(declare-fun res!515626 () Bool)

(assert (=> b!762509 (=> (not res!515626) (not e!425017))))

(declare-datatypes ((List!14170 0))(
  ( (Nil!14167) (Cons!14166 (h!15250 (_ BitVec 64)) (t!20485 List!14170)) )
))
(declare-fun arrayNoDuplicates!0 (array!42121 (_ BitVec 32) List!14170) Bool)

(assert (=> b!762509 (= res!515626 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14167))))

(declare-fun b!762510 () Bool)

(declare-fun res!515622 () Bool)

(assert (=> b!762510 (=> (not res!515622) (not e!425019))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762510 (= res!515622 (validKeyInArray!0 (select (arr!20168 a!3186) j!159)))))

(declare-fun b!762511 () Bool)

(assert (=> b!762511 (= e!425019 e!425017)))

(declare-fun res!515625 () Bool)

(assert (=> b!762511 (=> (not res!515625) (not e!425017))))

(declare-datatypes ((SeekEntryResult!7768 0))(
  ( (MissingZero!7768 (index!33440 (_ BitVec 32))) (Found!7768 (index!33441 (_ BitVec 32))) (Intermediate!7768 (undefined!8580 Bool) (index!33442 (_ BitVec 32)) (x!64348 (_ BitVec 32))) (Undefined!7768) (MissingVacant!7768 (index!33443 (_ BitVec 32))) )
))
(declare-fun lt!339586 () SeekEntryResult!7768)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762511 (= res!515625 (or (= lt!339586 (MissingZero!7768 i!1173)) (= lt!339586 (MissingVacant!7768 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42121 (_ BitVec 32)) SeekEntryResult!7768)

(assert (=> b!762511 (= lt!339586 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762512 () Bool)

(declare-fun res!515620 () Bool)

(assert (=> b!762512 (=> (not res!515620) (not e!425019))))

(assert (=> b!762512 (= res!515620 (validKeyInArray!0 k!2102))))

(declare-fun b!762513 () Bool)

(assert (=> b!762513 (= e!425017 false)))

(declare-fun lt!339587 () SeekEntryResult!7768)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42121 (_ BitVec 32)) SeekEntryResult!7768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762513 (= lt!339587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20168 a!3186) j!159) mask!3328) (select (arr!20168 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762514 () Bool)

(declare-fun res!515621 () Bool)

(assert (=> b!762514 (=> (not res!515621) (not e!425019))))

(assert (=> b!762514 (= res!515621 (and (= (size!20589 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20589 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20589 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762515 () Bool)

(declare-fun res!515619 () Bool)

(assert (=> b!762515 (=> (not res!515619) (not e!425017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42121 (_ BitVec 32)) Bool)

(assert (=> b!762515 (= res!515619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66216 res!515623) b!762514))

(assert (= (and b!762514 res!515621) b!762510))

(assert (= (and b!762510 res!515622) b!762512))

(assert (= (and b!762512 res!515620) b!762508))

(assert (= (and b!762508 res!515624) b!762511))

(assert (= (and b!762511 res!515625) b!762515))

(assert (= (and b!762515 res!515619) b!762509))

(assert (= (and b!762509 res!515626) b!762507))

(assert (= (and b!762507 res!515618) b!762513))

(declare-fun m!709241 () Bool)

(assert (=> b!762510 m!709241))

(assert (=> b!762510 m!709241))

(declare-fun m!709243 () Bool)

(assert (=> b!762510 m!709243))

(declare-fun m!709245 () Bool)

(assert (=> b!762512 m!709245))

(declare-fun m!709247 () Bool)

(assert (=> b!762508 m!709247))

(declare-fun m!709249 () Bool)

(assert (=> b!762511 m!709249))

(declare-fun m!709251 () Bool)

(assert (=> start!66216 m!709251))

(declare-fun m!709253 () Bool)

(assert (=> start!66216 m!709253))

(assert (=> b!762513 m!709241))

(assert (=> b!762513 m!709241))

(declare-fun m!709255 () Bool)

(assert (=> b!762513 m!709255))

(assert (=> b!762513 m!709255))

(assert (=> b!762513 m!709241))

(declare-fun m!709257 () Bool)

(assert (=> b!762513 m!709257))

(declare-fun m!709259 () Bool)

(assert (=> b!762509 m!709259))

(declare-fun m!709261 () Bool)

(assert (=> b!762515 m!709261))

(push 1)

(assert (not start!66216))

(assert (not b!762509))

(assert (not b!762515))

(assert (not b!762512))

(assert (not b!762508))

(assert (not b!762510))

(assert (not b!762513))

(assert (not b!762511))

(check-sat)

