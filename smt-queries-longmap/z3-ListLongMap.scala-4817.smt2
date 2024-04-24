; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66362 () Bool)

(assert start!66362)

(declare-fun b!763658 () Bool)

(declare-fun res!516329 () Bool)

(declare-fun e!425630 () Bool)

(assert (=> b!763658 (=> (not res!516329) (not e!425630))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42145 0))(
  ( (array!42146 (arr!20176 (Array (_ BitVec 32) (_ BitVec 64))) (size!20596 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42145)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763658 (= res!516329 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20176 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763659 () Bool)

(declare-fun e!425629 () Bool)

(declare-fun e!425627 () Bool)

(assert (=> b!763659 (= e!425629 e!425627)))

(declare-fun res!516318 () Bool)

(assert (=> b!763659 (=> (not res!516318) (not e!425627))))

(declare-datatypes ((SeekEntryResult!7732 0))(
  ( (MissingZero!7732 (index!33296 (_ BitVec 32))) (Found!7732 (index!33297 (_ BitVec 32))) (Intermediate!7732 (undefined!8544 Bool) (index!33298 (_ BitVec 32)) (x!64363 (_ BitVec 32))) (Undefined!7732) (MissingVacant!7732 (index!33299 (_ BitVec 32))) )
))
(declare-fun lt!339974 () SeekEntryResult!7732)

(assert (=> b!763659 (= res!516318 (or (= lt!339974 (MissingZero!7732 i!1173)) (= lt!339974 (MissingVacant!7732 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42145 (_ BitVec 32)) SeekEntryResult!7732)

(assert (=> b!763659 (= lt!339974 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763660 () Bool)

(declare-fun res!516324 () Bool)

(assert (=> b!763660 (=> (not res!516324) (not e!425627))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763660 (= res!516324 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20596 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20596 a!3186))))))

(declare-fun b!763661 () Bool)

(declare-fun res!516326 () Bool)

(assert (=> b!763661 (=> (not res!516326) (not e!425629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763661 (= res!516326 (validKeyInArray!0 k0!2102))))

(declare-fun b!763662 () Bool)

(declare-fun res!516321 () Bool)

(assert (=> b!763662 (=> (not res!516321) (not e!425630))))

(declare-fun e!425628 () Bool)

(assert (=> b!763662 (= res!516321 e!425628)))

(declare-fun c!84059 () Bool)

(assert (=> b!763662 (= c!84059 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763663 () Bool)

(declare-fun res!516320 () Bool)

(assert (=> b!763663 (=> (not res!516320) (not e!425629))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!763663 (= res!516320 (and (= (size!20596 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20596 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20596 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763664 () Bool)

(declare-fun res!516328 () Bool)

(assert (=> b!763664 (=> (not res!516328) (not e!425629))))

(assert (=> b!763664 (= res!516328 (validKeyInArray!0 (select (arr!20176 a!3186) j!159)))))

(declare-fun b!763665 () Bool)

(assert (=> b!763665 (= e!425630 false)))

(declare-fun lt!339975 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763665 (= lt!339975 (toIndex!0 (select (store (arr!20176 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!763666 () Bool)

(declare-fun lt!339973 () SeekEntryResult!7732)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42145 (_ BitVec 32)) SeekEntryResult!7732)

(assert (=> b!763666 (= e!425628 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20176 a!3186) j!159) a!3186 mask!3328) lt!339973))))

(declare-fun b!763667 () Bool)

(declare-fun res!516322 () Bool)

(assert (=> b!763667 (=> (not res!516322) (not e!425627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42145 (_ BitVec 32)) Bool)

(assert (=> b!763667 (= res!516322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763668 () Bool)

(declare-fun res!516327 () Bool)

(assert (=> b!763668 (=> (not res!516327) (not e!425627))))

(declare-datatypes ((List!14085 0))(
  ( (Nil!14082) (Cons!14081 (h!15171 (_ BitVec 64)) (t!20392 List!14085)) )
))
(declare-fun arrayNoDuplicates!0 (array!42145 (_ BitVec 32) List!14085) Bool)

(assert (=> b!763668 (= res!516327 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14082))))

(declare-fun b!763669 () Bool)

(assert (=> b!763669 (= e!425627 e!425630)))

(declare-fun res!516323 () Bool)

(assert (=> b!763669 (=> (not res!516323) (not e!425630))))

(assert (=> b!763669 (= res!516323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20176 a!3186) j!159) mask!3328) (select (arr!20176 a!3186) j!159) a!3186 mask!3328) lt!339973))))

(assert (=> b!763669 (= lt!339973 (Intermediate!7732 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763670 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42145 (_ BitVec 32)) SeekEntryResult!7732)

(assert (=> b!763670 (= e!425628 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20176 a!3186) j!159) a!3186 mask!3328) (Found!7732 j!159)))))

(declare-fun b!763657 () Bool)

(declare-fun res!516319 () Bool)

(assert (=> b!763657 (=> (not res!516319) (not e!425629))))

(declare-fun arrayContainsKey!0 (array!42145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763657 (= res!516319 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!516325 () Bool)

(assert (=> start!66362 (=> (not res!516325) (not e!425629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66362 (= res!516325 (validMask!0 mask!3328))))

(assert (=> start!66362 e!425629))

(assert (=> start!66362 true))

(declare-fun array_inv!16035 (array!42145) Bool)

(assert (=> start!66362 (array_inv!16035 a!3186)))

(assert (= (and start!66362 res!516325) b!763663))

(assert (= (and b!763663 res!516320) b!763664))

(assert (= (and b!763664 res!516328) b!763661))

(assert (= (and b!763661 res!516326) b!763657))

(assert (= (and b!763657 res!516319) b!763659))

(assert (= (and b!763659 res!516318) b!763667))

(assert (= (and b!763667 res!516322) b!763668))

(assert (= (and b!763668 res!516327) b!763660))

(assert (= (and b!763660 res!516324) b!763669))

(assert (= (and b!763669 res!516323) b!763658))

(assert (= (and b!763658 res!516329) b!763662))

(assert (= (and b!763662 c!84059) b!763666))

(assert (= (and b!763662 (not c!84059)) b!763670))

(assert (= (and b!763662 res!516321) b!763665))

(declare-fun m!710623 () Bool)

(assert (=> b!763668 m!710623))

(declare-fun m!710625 () Bool)

(assert (=> b!763667 m!710625))

(declare-fun m!710627 () Bool)

(assert (=> b!763659 m!710627))

(declare-fun m!710629 () Bool)

(assert (=> b!763670 m!710629))

(assert (=> b!763670 m!710629))

(declare-fun m!710631 () Bool)

(assert (=> b!763670 m!710631))

(declare-fun m!710633 () Bool)

(assert (=> b!763658 m!710633))

(declare-fun m!710635 () Bool)

(assert (=> b!763657 m!710635))

(declare-fun m!710637 () Bool)

(assert (=> b!763665 m!710637))

(declare-fun m!710639 () Bool)

(assert (=> b!763665 m!710639))

(assert (=> b!763665 m!710639))

(declare-fun m!710641 () Bool)

(assert (=> b!763665 m!710641))

(declare-fun m!710643 () Bool)

(assert (=> b!763661 m!710643))

(declare-fun m!710645 () Bool)

(assert (=> start!66362 m!710645))

(declare-fun m!710647 () Bool)

(assert (=> start!66362 m!710647))

(assert (=> b!763669 m!710629))

(assert (=> b!763669 m!710629))

(declare-fun m!710649 () Bool)

(assert (=> b!763669 m!710649))

(assert (=> b!763669 m!710649))

(assert (=> b!763669 m!710629))

(declare-fun m!710651 () Bool)

(assert (=> b!763669 m!710651))

(assert (=> b!763664 m!710629))

(assert (=> b!763664 m!710629))

(declare-fun m!710653 () Bool)

(assert (=> b!763664 m!710653))

(assert (=> b!763666 m!710629))

(assert (=> b!763666 m!710629))

(declare-fun m!710655 () Bool)

(assert (=> b!763666 m!710655))

(check-sat (not b!763667) (not b!763659) (not b!763657) (not b!763666) (not b!763665) (not b!763669) (not b!763670) (not start!66362) (not b!763668) (not b!763661) (not b!763664))
(check-sat)
