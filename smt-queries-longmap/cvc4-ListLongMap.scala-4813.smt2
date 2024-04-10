; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66222 () Bool)

(assert start!66222)

(declare-fun b!762620 () Bool)

(declare-fun res!515725 () Bool)

(declare-fun e!425060 () Bool)

(assert (=> b!762620 (=> (not res!515725) (not e!425060))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42127 0))(
  ( (array!42128 (arr!20171 (Array (_ BitVec 32) (_ BitVec 64))) (size!20592 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42127)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762620 (= res!515725 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20592 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20592 a!3186))))))

(declare-fun b!762621 () Bool)

(declare-fun res!515722 () Bool)

(declare-fun e!425062 () Bool)

(assert (=> b!762621 (=> (not res!515722) (not e!425062))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762621 (= res!515722 (and (= (size!20592 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20592 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20592 a!3186)) (not (= i!1173 j!159))))))

(declare-datatypes ((SeekEntryResult!7771 0))(
  ( (MissingZero!7771 (index!33452 (_ BitVec 32))) (Found!7771 (index!33453 (_ BitVec 32))) (Intermediate!7771 (undefined!8583 Bool) (index!33454 (_ BitVec 32)) (x!64359 (_ BitVec 32))) (Undefined!7771) (MissingVacant!7771 (index!33455 (_ BitVec 32))) )
))
(declare-fun lt!339614 () SeekEntryResult!7771)

(declare-fun b!762622 () Bool)

(declare-fun e!425061 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42127 (_ BitVec 32)) SeekEntryResult!7771)

(assert (=> b!762622 (= e!425061 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20171 a!3186) j!159) a!3186 mask!3328) lt!339614)))))

(declare-fun b!762623 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42127 (_ BitVec 32)) SeekEntryResult!7771)

(assert (=> b!762623 (= e!425061 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20171 a!3186) j!159) a!3186 mask!3328) (Found!7771 j!159))))))

(declare-fun b!762624 () Bool)

(declare-fun res!515723 () Bool)

(declare-fun e!425063 () Bool)

(assert (=> b!762624 (=> (not res!515723) (not e!425063))))

(assert (=> b!762624 (= res!515723 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20171 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762625 () Bool)

(assert (=> b!762625 (= e!425063 false)))

(declare-fun lt!339613 () Bool)

(assert (=> b!762625 (= lt!339613 e!425061)))

(declare-fun c!83839 () Bool)

(assert (=> b!762625 (= c!83839 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762626 () Bool)

(declare-fun res!515717 () Bool)

(assert (=> b!762626 (=> (not res!515717) (not e!425062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762626 (= res!515717 (validKeyInArray!0 (select (arr!20171 a!3186) j!159)))))

(declare-fun b!762627 () Bool)

(declare-fun res!515718 () Bool)

(assert (=> b!762627 (=> (not res!515718) (not e!425060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42127 (_ BitVec 32)) Bool)

(assert (=> b!762627 (= res!515718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762628 () Bool)

(assert (=> b!762628 (= e!425062 e!425060)))

(declare-fun res!515719 () Bool)

(assert (=> b!762628 (=> (not res!515719) (not e!425060))))

(declare-fun lt!339612 () SeekEntryResult!7771)

(assert (=> b!762628 (= res!515719 (or (= lt!339612 (MissingZero!7771 i!1173)) (= lt!339612 (MissingVacant!7771 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42127 (_ BitVec 32)) SeekEntryResult!7771)

(assert (=> b!762628 (= lt!339612 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762629 () Bool)

(declare-fun res!515716 () Bool)

(assert (=> b!762629 (=> (not res!515716) (not e!425062))))

(declare-fun arrayContainsKey!0 (array!42127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762629 (= res!515716 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!515721 () Bool)

(assert (=> start!66222 (=> (not res!515721) (not e!425062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66222 (= res!515721 (validMask!0 mask!3328))))

(assert (=> start!66222 e!425062))

(assert (=> start!66222 true))

(declare-fun array_inv!15967 (array!42127) Bool)

(assert (=> start!66222 (array_inv!15967 a!3186)))

(declare-fun b!762630 () Bool)

(declare-fun res!515720 () Bool)

(assert (=> b!762630 (=> (not res!515720) (not e!425060))))

(declare-datatypes ((List!14173 0))(
  ( (Nil!14170) (Cons!14169 (h!15253 (_ BitVec 64)) (t!20488 List!14173)) )
))
(declare-fun arrayNoDuplicates!0 (array!42127 (_ BitVec 32) List!14173) Bool)

(assert (=> b!762630 (= res!515720 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14170))))

(declare-fun b!762631 () Bool)

(assert (=> b!762631 (= e!425060 e!425063)))

(declare-fun res!515715 () Bool)

(assert (=> b!762631 (=> (not res!515715) (not e!425063))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762631 (= res!515715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20171 a!3186) j!159) mask!3328) (select (arr!20171 a!3186) j!159) a!3186 mask!3328) lt!339614))))

(assert (=> b!762631 (= lt!339614 (Intermediate!7771 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762632 () Bool)

(declare-fun res!515724 () Bool)

(assert (=> b!762632 (=> (not res!515724) (not e!425062))))

(assert (=> b!762632 (= res!515724 (validKeyInArray!0 k!2102))))

(assert (= (and start!66222 res!515721) b!762621))

(assert (= (and b!762621 res!515722) b!762626))

(assert (= (and b!762626 res!515717) b!762632))

(assert (= (and b!762632 res!515724) b!762629))

(assert (= (and b!762629 res!515716) b!762628))

(assert (= (and b!762628 res!515719) b!762627))

(assert (= (and b!762627 res!515718) b!762630))

(assert (= (and b!762630 res!515720) b!762620))

(assert (= (and b!762620 res!515725) b!762631))

(assert (= (and b!762631 res!515715) b!762624))

(assert (= (and b!762624 res!515723) b!762625))

(assert (= (and b!762625 c!83839) b!762622))

(assert (= (and b!762625 (not c!83839)) b!762623))

(declare-fun m!709319 () Bool)

(assert (=> b!762631 m!709319))

(assert (=> b!762631 m!709319))

(declare-fun m!709321 () Bool)

(assert (=> b!762631 m!709321))

(assert (=> b!762631 m!709321))

(assert (=> b!762631 m!709319))

(declare-fun m!709323 () Bool)

(assert (=> b!762631 m!709323))

(declare-fun m!709325 () Bool)

(assert (=> b!762632 m!709325))

(declare-fun m!709327 () Bool)

(assert (=> b!762630 m!709327))

(assert (=> b!762626 m!709319))

(assert (=> b!762626 m!709319))

(declare-fun m!709329 () Bool)

(assert (=> b!762626 m!709329))

(declare-fun m!709331 () Bool)

(assert (=> b!762628 m!709331))

(assert (=> b!762622 m!709319))

(assert (=> b!762622 m!709319))

(declare-fun m!709333 () Bool)

(assert (=> b!762622 m!709333))

(declare-fun m!709335 () Bool)

(assert (=> b!762627 m!709335))

(assert (=> b!762623 m!709319))

(assert (=> b!762623 m!709319))

(declare-fun m!709337 () Bool)

(assert (=> b!762623 m!709337))

(declare-fun m!709339 () Bool)

(assert (=> b!762629 m!709339))

(declare-fun m!709341 () Bool)

(assert (=> b!762624 m!709341))

(declare-fun m!709343 () Bool)

(assert (=> start!66222 m!709343))

(declare-fun m!709345 () Bool)

(assert (=> start!66222 m!709345))

(push 1)

(assert (not b!762626))

(assert (not b!762630))

(assert (not b!762622))

(assert (not b!762629))

(assert (not start!66222))

