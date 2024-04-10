; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66270 () Bool)

(assert start!66270)

(declare-datatypes ((array!42175 0))(
  ( (array!42176 (arr!20195 (Array (_ BitVec 32) (_ BitVec 64))) (size!20616 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42175)

(declare-datatypes ((SeekEntryResult!7795 0))(
  ( (MissingZero!7795 (index!33548 (_ BitVec 32))) (Found!7795 (index!33549 (_ BitVec 32))) (Intermediate!7795 (undefined!8607 Bool) (index!33550 (_ BitVec 32)) (x!64447 (_ BitVec 32))) (Undefined!7795) (MissingVacant!7795 (index!33551 (_ BitVec 32))) )
))
(declare-fun lt!339856 () SeekEntryResult!7795)

(declare-fun e!425423 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!763582 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42175 (_ BitVec 32)) SeekEntryResult!7795)

(assert (=> b!763582 (= e!425423 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20195 a!3186) j!159) a!3186 mask!3328) lt!339856))))

(declare-fun b!763583 () Bool)

(declare-fun res!516542 () Bool)

(declare-fun e!425422 () Bool)

(assert (=> b!763583 (=> (not res!516542) (not e!425422))))

(declare-datatypes ((List!14197 0))(
  ( (Nil!14194) (Cons!14193 (h!15277 (_ BitVec 64)) (t!20512 List!14197)) )
))
(declare-fun arrayNoDuplicates!0 (array!42175 (_ BitVec 32) List!14197) Bool)

(assert (=> b!763583 (= res!516542 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14194))))

(declare-fun b!763584 () Bool)

(declare-fun res!516535 () Bool)

(declare-fun e!425421 () Bool)

(assert (=> b!763584 (=> (not res!516535) (not e!425421))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763584 (= res!516535 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20195 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763585 () Bool)

(declare-fun res!516539 () Bool)

(assert (=> b!763585 (=> (not res!516539) (not e!425421))))

(assert (=> b!763585 (= res!516539 e!425423)))

(declare-fun c!83911 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763585 (= c!83911 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763586 () Bool)

(declare-fun res!516543 () Bool)

(declare-fun e!425424 () Bool)

(assert (=> b!763586 (=> (not res!516543) (not e!425424))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763586 (= res!516543 (validKeyInArray!0 k!2102))))

(declare-fun b!763587 () Bool)

(declare-fun res!516540 () Bool)

(assert (=> b!763587 (=> (not res!516540) (not e!425422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42175 (_ BitVec 32)) Bool)

(assert (=> b!763587 (= res!516540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!516538 () Bool)

(assert (=> start!66270 (=> (not res!516538) (not e!425424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66270 (= res!516538 (validMask!0 mask!3328))))

(assert (=> start!66270 e!425424))

(assert (=> start!66270 true))

(declare-fun array_inv!15991 (array!42175) Bool)

(assert (=> start!66270 (array_inv!15991 a!3186)))

(declare-fun b!763588 () Bool)

(assert (=> b!763588 (= e!425424 e!425422)))

(declare-fun res!516534 () Bool)

(assert (=> b!763588 (=> (not res!516534) (not e!425422))))

(declare-fun lt!339852 () SeekEntryResult!7795)

(assert (=> b!763588 (= res!516534 (or (= lt!339852 (MissingZero!7795 i!1173)) (= lt!339852 (MissingVacant!7795 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42175 (_ BitVec 32)) SeekEntryResult!7795)

(assert (=> b!763588 (= lt!339852 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763589 () Bool)

(declare-fun res!516533 () Bool)

(assert (=> b!763589 (=> (not res!516533) (not e!425424))))

(declare-fun arrayContainsKey!0 (array!42175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763589 (= res!516533 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763590 () Bool)

(declare-fun res!516536 () Bool)

(assert (=> b!763590 (=> (not res!516536) (not e!425422))))

(assert (=> b!763590 (= res!516536 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20616 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20616 a!3186))))))

(declare-fun b!763591 () Bool)

(assert (=> b!763591 (= e!425421 false)))

(declare-fun lt!339857 () (_ BitVec 64))

(declare-fun lt!339854 () array!42175)

(declare-fun lt!339853 () SeekEntryResult!7795)

(assert (=> b!763591 (= lt!339853 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339857 lt!339854 mask!3328))))

(declare-fun lt!339855 () SeekEntryResult!7795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763591 (= lt!339855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339857 mask!3328) lt!339857 lt!339854 mask!3328))))

(assert (=> b!763591 (= lt!339857 (select (store (arr!20195 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!763591 (= lt!339854 (array!42176 (store (arr!20195 a!3186) i!1173 k!2102) (size!20616 a!3186)))))

(declare-fun b!763592 () Bool)

(assert (=> b!763592 (= e!425422 e!425421)))

(declare-fun res!516544 () Bool)

(assert (=> b!763592 (=> (not res!516544) (not e!425421))))

(assert (=> b!763592 (= res!516544 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20195 a!3186) j!159) mask!3328) (select (arr!20195 a!3186) j!159) a!3186 mask!3328) lt!339856))))

(assert (=> b!763592 (= lt!339856 (Intermediate!7795 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763593 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42175 (_ BitVec 32)) SeekEntryResult!7795)

(assert (=> b!763593 (= e!425423 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20195 a!3186) j!159) a!3186 mask!3328) (Found!7795 j!159)))))

(declare-fun b!763594 () Bool)

(declare-fun res!516541 () Bool)

(assert (=> b!763594 (=> (not res!516541) (not e!425424))))

(assert (=> b!763594 (= res!516541 (validKeyInArray!0 (select (arr!20195 a!3186) j!159)))))

(declare-fun b!763595 () Bool)

(declare-fun res!516537 () Bool)

(assert (=> b!763595 (=> (not res!516537) (not e!425424))))

(assert (=> b!763595 (= res!516537 (and (= (size!20616 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20616 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20616 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66270 res!516538) b!763595))

(assert (= (and b!763595 res!516537) b!763594))

(assert (= (and b!763594 res!516541) b!763586))

(assert (= (and b!763586 res!516543) b!763589))

(assert (= (and b!763589 res!516533) b!763588))

(assert (= (and b!763588 res!516534) b!763587))

(assert (= (and b!763587 res!516540) b!763583))

(assert (= (and b!763583 res!516542) b!763590))

(assert (= (and b!763590 res!516536) b!763592))

(assert (= (and b!763592 res!516544) b!763584))

(assert (= (and b!763584 res!516535) b!763585))

(assert (= (and b!763585 c!83911) b!763582))

(assert (= (and b!763585 (not c!83911)) b!763593))

(assert (= (and b!763585 res!516539) b!763591))

(declare-fun m!710047 () Bool)

(assert (=> b!763583 m!710047))

(declare-fun m!710049 () Bool)

(assert (=> b!763586 m!710049))

(declare-fun m!710051 () Bool)

(assert (=> b!763591 m!710051))

(declare-fun m!710053 () Bool)

(assert (=> b!763591 m!710053))

(declare-fun m!710055 () Bool)

(assert (=> b!763591 m!710055))

(declare-fun m!710057 () Bool)

(assert (=> b!763591 m!710057))

(declare-fun m!710059 () Bool)

(assert (=> b!763591 m!710059))

(assert (=> b!763591 m!710053))

(declare-fun m!710061 () Bool)

(assert (=> start!66270 m!710061))

(declare-fun m!710063 () Bool)

(assert (=> start!66270 m!710063))

(declare-fun m!710065 () Bool)

(assert (=> b!763589 m!710065))

(declare-fun m!710067 () Bool)

(assert (=> b!763594 m!710067))

(assert (=> b!763594 m!710067))

(declare-fun m!710069 () Bool)

(assert (=> b!763594 m!710069))

(assert (=> b!763592 m!710067))

(assert (=> b!763592 m!710067))

(declare-fun m!710071 () Bool)

(assert (=> b!763592 m!710071))

(assert (=> b!763592 m!710071))

(assert (=> b!763592 m!710067))

(declare-fun m!710073 () Bool)

(assert (=> b!763592 m!710073))

(declare-fun m!710075 () Bool)

(assert (=> b!763584 m!710075))

(assert (=> b!763593 m!710067))

(assert (=> b!763593 m!710067))

(declare-fun m!710077 () Bool)

(assert (=> b!763593 m!710077))

(declare-fun m!710079 () Bool)

(assert (=> b!763587 m!710079))

(assert (=> b!763582 m!710067))

(assert (=> b!763582 m!710067))

(declare-fun m!710081 () Bool)

(assert (=> b!763582 m!710081))

(declare-fun m!710083 () Bool)

(assert (=> b!763588 m!710083))

(push 1)

