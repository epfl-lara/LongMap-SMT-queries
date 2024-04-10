; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66244 () Bool)

(assert start!66244)

(declare-fun res!516092 () Bool)

(declare-fun e!425226 () Bool)

(assert (=> start!66244 (=> (not res!516092) (not e!425226))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66244 (= res!516092 (validMask!0 mask!3328))))

(assert (=> start!66244 e!425226))

(assert (=> start!66244 true))

(declare-datatypes ((array!42149 0))(
  ( (array!42150 (arr!20182 (Array (_ BitVec 32) (_ BitVec 64))) (size!20603 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42149)

(declare-fun array_inv!15978 (array!42149) Bool)

(assert (=> start!66244 (array_inv!15978 a!3186)))

(declare-datatypes ((SeekEntryResult!7782 0))(
  ( (MissingZero!7782 (index!33496 (_ BitVec 32))) (Found!7782 (index!33497 (_ BitVec 32))) (Intermediate!7782 (undefined!8594 Bool) (index!33498 (_ BitVec 32)) (x!64402 (_ BitVec 32))) (Undefined!7782) (MissingVacant!7782 (index!33499 (_ BitVec 32))) )
))
(declare-fun lt!339711 () SeekEntryResult!7782)

(declare-fun e!425225 () Bool)

(declare-fun b!763054 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42149 (_ BitVec 32)) SeekEntryResult!7782)

(assert (=> b!763054 (= e!425225 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20182 a!3186) j!159) a!3186 mask!3328) lt!339711))))

(declare-fun b!763055 () Bool)

(declare-fun e!425227 () Bool)

(declare-fun e!425229 () Bool)

(assert (=> b!763055 (= e!425227 e!425229)))

(declare-fun res!516083 () Bool)

(assert (=> b!763055 (=> (not res!516083) (not e!425229))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763055 (= res!516083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20182 a!3186) j!159) mask!3328) (select (arr!20182 a!3186) j!159) a!3186 mask!3328) lt!339711))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763055 (= lt!339711 (Intermediate!7782 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763056 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42149 (_ BitVec 32)) SeekEntryResult!7782)

(assert (=> b!763056 (= e!425225 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20182 a!3186) j!159) a!3186 mask!3328) (Found!7782 j!159)))))

(declare-fun b!763057 () Bool)

(declare-fun res!516094 () Bool)

(assert (=> b!763057 (=> (not res!516094) (not e!425226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763057 (= res!516094 (validKeyInArray!0 (select (arr!20182 a!3186) j!159)))))

(declare-fun b!763058 () Bool)

(declare-fun res!516088 () Bool)

(assert (=> b!763058 (=> (not res!516088) (not e!425226))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763058 (= res!516088 (and (= (size!20603 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20603 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20603 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763059 () Bool)

(declare-fun res!516089 () Bool)

(assert (=> b!763059 (=> (not res!516089) (not e!425226))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!763059 (= res!516089 (validKeyInArray!0 k0!2102))))

(declare-fun b!763060 () Bool)

(declare-fun res!516086 () Bool)

(assert (=> b!763060 (=> (not res!516086) (not e!425229))))

(assert (=> b!763060 (= res!516086 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20182 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763061 () Bool)

(declare-fun res!516091 () Bool)

(assert (=> b!763061 (=> (not res!516091) (not e!425227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42149 (_ BitVec 32)) Bool)

(assert (=> b!763061 (= res!516091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763062 () Bool)

(declare-fun res!516085 () Bool)

(assert (=> b!763062 (=> (not res!516085) (not e!425227))))

(assert (=> b!763062 (= res!516085 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20603 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20603 a!3186))))))

(declare-fun b!763063 () Bool)

(assert (=> b!763063 (= e!425229 false)))

(declare-fun lt!339713 () (_ BitVec 32))

(assert (=> b!763063 (= lt!339713 (toIndex!0 (select (store (arr!20182 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!763064 () Bool)

(assert (=> b!763064 (= e!425226 e!425227)))

(declare-fun res!516093 () Bool)

(assert (=> b!763064 (=> (not res!516093) (not e!425227))))

(declare-fun lt!339712 () SeekEntryResult!7782)

(assert (=> b!763064 (= res!516093 (or (= lt!339712 (MissingZero!7782 i!1173)) (= lt!339712 (MissingVacant!7782 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42149 (_ BitVec 32)) SeekEntryResult!7782)

(assert (=> b!763064 (= lt!339712 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763065 () Bool)

(declare-fun res!516090 () Bool)

(assert (=> b!763065 (=> (not res!516090) (not e!425227))))

(declare-datatypes ((List!14184 0))(
  ( (Nil!14181) (Cons!14180 (h!15264 (_ BitVec 64)) (t!20499 List!14184)) )
))
(declare-fun arrayNoDuplicates!0 (array!42149 (_ BitVec 32) List!14184) Bool)

(assert (=> b!763065 (= res!516090 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14181))))

(declare-fun b!763066 () Bool)

(declare-fun res!516087 () Bool)

(assert (=> b!763066 (=> (not res!516087) (not e!425226))))

(declare-fun arrayContainsKey!0 (array!42149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763066 (= res!516087 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763067 () Bool)

(declare-fun res!516084 () Bool)

(assert (=> b!763067 (=> (not res!516084) (not e!425229))))

(assert (=> b!763067 (= res!516084 e!425225)))

(declare-fun c!83872 () Bool)

(assert (=> b!763067 (= c!83872 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66244 res!516092) b!763058))

(assert (= (and b!763058 res!516088) b!763057))

(assert (= (and b!763057 res!516094) b!763059))

(assert (= (and b!763059 res!516089) b!763066))

(assert (= (and b!763066 res!516087) b!763064))

(assert (= (and b!763064 res!516093) b!763061))

(assert (= (and b!763061 res!516091) b!763065))

(assert (= (and b!763065 res!516090) b!763062))

(assert (= (and b!763062 res!516085) b!763055))

(assert (= (and b!763055 res!516083) b!763060))

(assert (= (and b!763060 res!516086) b!763067))

(assert (= (and b!763067 c!83872) b!763054))

(assert (= (and b!763067 (not c!83872)) b!763056))

(assert (= (and b!763067 res!516084) b!763063))

(declare-fun m!709633 () Bool)

(assert (=> b!763059 m!709633))

(declare-fun m!709635 () Bool)

(assert (=> b!763061 m!709635))

(declare-fun m!709637 () Bool)

(assert (=> b!763066 m!709637))

(declare-fun m!709639 () Bool)

(assert (=> b!763054 m!709639))

(assert (=> b!763054 m!709639))

(declare-fun m!709641 () Bool)

(assert (=> b!763054 m!709641))

(declare-fun m!709643 () Bool)

(assert (=> start!66244 m!709643))

(declare-fun m!709645 () Bool)

(assert (=> start!66244 m!709645))

(assert (=> b!763057 m!709639))

(assert (=> b!763057 m!709639))

(declare-fun m!709647 () Bool)

(assert (=> b!763057 m!709647))

(declare-fun m!709649 () Bool)

(assert (=> b!763064 m!709649))

(declare-fun m!709651 () Bool)

(assert (=> b!763063 m!709651))

(declare-fun m!709653 () Bool)

(assert (=> b!763063 m!709653))

(assert (=> b!763063 m!709653))

(declare-fun m!709655 () Bool)

(assert (=> b!763063 m!709655))

(declare-fun m!709657 () Bool)

(assert (=> b!763065 m!709657))

(declare-fun m!709659 () Bool)

(assert (=> b!763060 m!709659))

(assert (=> b!763056 m!709639))

(assert (=> b!763056 m!709639))

(declare-fun m!709661 () Bool)

(assert (=> b!763056 m!709661))

(assert (=> b!763055 m!709639))

(assert (=> b!763055 m!709639))

(declare-fun m!709663 () Bool)

(assert (=> b!763055 m!709663))

(assert (=> b!763055 m!709663))

(assert (=> b!763055 m!709639))

(declare-fun m!709665 () Bool)

(assert (=> b!763055 m!709665))

(check-sat (not b!763059) (not b!763055) (not b!763066) (not b!763057) (not b!763064) (not b!763065) (not start!66244) (not b!763056) (not b!763061) (not b!763063) (not b!763054))
(check-sat)
