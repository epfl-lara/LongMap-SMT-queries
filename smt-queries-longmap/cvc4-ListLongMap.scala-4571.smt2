; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63728 () Bool)

(assert start!63728)

(declare-fun b!717230 () Bool)

(declare-fun res!480017 () Bool)

(declare-fun e!402683 () Bool)

(assert (=> b!717230 (=> (not res!480017) (not e!402683))))

(declare-datatypes ((array!40624 0))(
  ( (array!40625 (arr!19445 (Array (_ BitVec 32) (_ BitVec 64))) (size!19866 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40624)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717230 (= res!480017 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717231 () Bool)

(declare-fun res!480016 () Bool)

(assert (=> b!717231 (=> (not res!480016) (not e!402683))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717231 (= res!480016 (validKeyInArray!0 (select (arr!19445 a!3186) j!159)))))

(declare-fun b!717232 () Bool)

(declare-fun res!480020 () Bool)

(assert (=> b!717232 (=> (not res!480020) (not e!402683))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717232 (= res!480020 (and (= (size!19866 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19866 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19866 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717233 () Bool)

(declare-datatypes ((SeekEntryResult!7045 0))(
  ( (MissingZero!7045 (index!30548 (_ BitVec 32))) (Found!7045 (index!30549 (_ BitVec 32))) (Intermediate!7045 (undefined!7857 Bool) (index!30550 (_ BitVec 32)) (x!61569 (_ BitVec 32))) (Undefined!7045) (MissingVacant!7045 (index!30551 (_ BitVec 32))) )
))
(declare-fun lt!319028 () SeekEntryResult!7045)

(assert (=> b!717233 (= e!402683 (and (or (= lt!319028 (MissingZero!7045 i!1173)) (= lt!319028 (MissingVacant!7045 i!1173))) (bvsgt #b00000000000000000000000000000000 (size!19866 a!3186))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40624 (_ BitVec 32)) SeekEntryResult!7045)

(assert (=> b!717233 (= lt!319028 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717234 () Bool)

(declare-fun res!480019 () Bool)

(assert (=> b!717234 (=> (not res!480019) (not e!402683))))

(assert (=> b!717234 (= res!480019 (validKeyInArray!0 k!2102))))

(declare-fun res!480018 () Bool)

(assert (=> start!63728 (=> (not res!480018) (not e!402683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63728 (= res!480018 (validMask!0 mask!3328))))

(assert (=> start!63728 e!402683))

(declare-fun array_inv!15241 (array!40624) Bool)

(assert (=> start!63728 (array_inv!15241 a!3186)))

(assert (=> start!63728 true))

(assert (= (and start!63728 res!480018) b!717232))

(assert (= (and b!717232 res!480020) b!717231))

(assert (= (and b!717231 res!480016) b!717234))

(assert (= (and b!717234 res!480019) b!717230))

(assert (= (and b!717230 res!480017) b!717233))

(declare-fun m!673181 () Bool)

(assert (=> b!717231 m!673181))

(assert (=> b!717231 m!673181))

(declare-fun m!673183 () Bool)

(assert (=> b!717231 m!673183))

(declare-fun m!673185 () Bool)

(assert (=> b!717233 m!673185))

(declare-fun m!673187 () Bool)

(assert (=> b!717230 m!673187))

(declare-fun m!673189 () Bool)

(assert (=> start!63728 m!673189))

(declare-fun m!673191 () Bool)

(assert (=> start!63728 m!673191))

(declare-fun m!673193 () Bool)

(assert (=> b!717234 m!673193))

(push 1)

(assert (not start!63728))

(assert (not b!717233))

(assert (not b!717234))

(assert (not b!717230))

(assert (not b!717231))

(check-sat)

(pop 1)

(push 1)

(check-sat)

