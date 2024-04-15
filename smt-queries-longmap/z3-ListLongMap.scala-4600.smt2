; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64154 () Bool)

(assert start!64154)

(declare-fun b!720367 () Bool)

(declare-fun res!482655 () Bool)

(declare-fun e!404029 () Bool)

(assert (=> b!720367 (=> (not res!482655) (not e!404029))))

(declare-datatypes ((array!40809 0))(
  ( (array!40810 (arr!19529 (Array (_ BitVec 32) (_ BitVec 64))) (size!19950 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40809)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!720367 (= res!482655 (and (= (size!19950 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19950 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19950 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720368 () Bool)

(declare-fun res!482656 () Bool)

(declare-fun e!404032 () Bool)

(assert (=> b!720368 (=> (not res!482656) (not e!404032))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720368 (= res!482656 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19950 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19950 a!3186))))))

(declare-fun b!720369 () Bool)

(declare-fun e!404028 () Bool)

(declare-datatypes ((SeekEntryResult!7126 0))(
  ( (MissingZero!7126 (index!30872 (_ BitVec 32))) (Found!7126 (index!30873 (_ BitVec 32))) (Intermediate!7126 (undefined!7938 Bool) (index!30874 (_ BitVec 32)) (x!61889 (_ BitVec 32))) (Undefined!7126) (MissingVacant!7126 (index!30875 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40809 (_ BitVec 32)) SeekEntryResult!7126)

(assert (=> b!720369 (= e!404028 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19529 a!3186) j!159) a!3186 mask!3328) (Found!7126 j!159)))))

(declare-fun b!720370 () Bool)

(declare-fun res!482653 () Bool)

(declare-fun e!404030 () Bool)

(assert (=> b!720370 (=> (not res!482653) (not e!404030))))

(assert (=> b!720370 (= res!482653 e!404028)))

(declare-fun c!79230 () Bool)

(assert (=> b!720370 (= c!79230 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720371 () Bool)

(declare-fun res!482652 () Bool)

(assert (=> b!720371 (=> (not res!482652) (not e!404029))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720371 (= res!482652 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720372 () Bool)

(declare-fun res!482648 () Bool)

(assert (=> b!720372 (=> (not res!482648) (not e!404030))))

(assert (=> b!720372 (= res!482648 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19529 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720373 () Bool)

(declare-fun res!482650 () Bool)

(assert (=> b!720373 (=> (not res!482650) (not e!404029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720373 (= res!482650 (validKeyInArray!0 (select (arr!19529 a!3186) j!159)))))

(declare-fun lt!319616 () SeekEntryResult!7126)

(declare-fun b!720374 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40809 (_ BitVec 32)) SeekEntryResult!7126)

(assert (=> b!720374 (= e!404028 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19529 a!3186) j!159) a!3186 mask!3328) lt!319616))))

(declare-fun b!720375 () Bool)

(declare-fun res!482654 () Bool)

(assert (=> b!720375 (=> (not res!482654) (not e!404032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40809 (_ BitVec 32)) Bool)

(assert (=> b!720375 (= res!482654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720376 () Bool)

(assert (=> b!720376 (= e!404030 false)))

(declare-fun lt!319615 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720376 (= lt!319615 (toIndex!0 (select (store (arr!19529 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!720377 () Bool)

(assert (=> b!720377 (= e!404029 e!404032)))

(declare-fun res!482657 () Bool)

(assert (=> b!720377 (=> (not res!482657) (not e!404032))))

(declare-fun lt!319614 () SeekEntryResult!7126)

(assert (=> b!720377 (= res!482657 (or (= lt!319614 (MissingZero!7126 i!1173)) (= lt!319614 (MissingVacant!7126 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40809 (_ BitVec 32)) SeekEntryResult!7126)

(assert (=> b!720377 (= lt!319614 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!482651 () Bool)

(assert (=> start!64154 (=> (not res!482651) (not e!404029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64154 (= res!482651 (validMask!0 mask!3328))))

(assert (=> start!64154 e!404029))

(assert (=> start!64154 true))

(declare-fun array_inv!15412 (array!40809) Bool)

(assert (=> start!64154 (array_inv!15412 a!3186)))

(declare-fun b!720378 () Bool)

(declare-fun res!482649 () Bool)

(assert (=> b!720378 (=> (not res!482649) (not e!404032))))

(declare-datatypes ((List!13570 0))(
  ( (Nil!13567) (Cons!13566 (h!14617 (_ BitVec 64)) (t!19876 List!13570)) )
))
(declare-fun arrayNoDuplicates!0 (array!40809 (_ BitVec 32) List!13570) Bool)

(assert (=> b!720378 (= res!482649 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13567))))

(declare-fun b!720379 () Bool)

(declare-fun res!482658 () Bool)

(assert (=> b!720379 (=> (not res!482658) (not e!404029))))

(assert (=> b!720379 (= res!482658 (validKeyInArray!0 k0!2102))))

(declare-fun b!720380 () Bool)

(assert (=> b!720380 (= e!404032 e!404030)))

(declare-fun res!482647 () Bool)

(assert (=> b!720380 (=> (not res!482647) (not e!404030))))

(assert (=> b!720380 (= res!482647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19529 a!3186) j!159) mask!3328) (select (arr!19529 a!3186) j!159) a!3186 mask!3328) lt!319616))))

(assert (=> b!720380 (= lt!319616 (Intermediate!7126 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64154 res!482651) b!720367))

(assert (= (and b!720367 res!482655) b!720373))

(assert (= (and b!720373 res!482650) b!720379))

(assert (= (and b!720379 res!482658) b!720371))

(assert (= (and b!720371 res!482652) b!720377))

(assert (= (and b!720377 res!482657) b!720375))

(assert (= (and b!720375 res!482654) b!720378))

(assert (= (and b!720378 res!482649) b!720368))

(assert (= (and b!720368 res!482656) b!720380))

(assert (= (and b!720380 res!482647) b!720372))

(assert (= (and b!720372 res!482648) b!720370))

(assert (= (and b!720370 c!79230) b!720374))

(assert (= (and b!720370 (not c!79230)) b!720369))

(assert (= (and b!720370 res!482653) b!720376))

(declare-fun m!674903 () Bool)

(assert (=> b!720375 m!674903))

(declare-fun m!674905 () Bool)

(assert (=> b!720376 m!674905))

(declare-fun m!674907 () Bool)

(assert (=> b!720376 m!674907))

(assert (=> b!720376 m!674907))

(declare-fun m!674909 () Bool)

(assert (=> b!720376 m!674909))

(declare-fun m!674911 () Bool)

(assert (=> b!720372 m!674911))

(declare-fun m!674913 () Bool)

(assert (=> b!720377 m!674913))

(declare-fun m!674915 () Bool)

(assert (=> b!720373 m!674915))

(assert (=> b!720373 m!674915))

(declare-fun m!674917 () Bool)

(assert (=> b!720373 m!674917))

(assert (=> b!720380 m!674915))

(assert (=> b!720380 m!674915))

(declare-fun m!674919 () Bool)

(assert (=> b!720380 m!674919))

(assert (=> b!720380 m!674919))

(assert (=> b!720380 m!674915))

(declare-fun m!674921 () Bool)

(assert (=> b!720380 m!674921))

(declare-fun m!674923 () Bool)

(assert (=> b!720378 m!674923))

(assert (=> b!720374 m!674915))

(assert (=> b!720374 m!674915))

(declare-fun m!674925 () Bool)

(assert (=> b!720374 m!674925))

(declare-fun m!674927 () Bool)

(assert (=> start!64154 m!674927))

(declare-fun m!674929 () Bool)

(assert (=> start!64154 m!674929))

(declare-fun m!674931 () Bool)

(assert (=> b!720379 m!674931))

(assert (=> b!720369 m!674915))

(assert (=> b!720369 m!674915))

(declare-fun m!674933 () Bool)

(assert (=> b!720369 m!674933))

(declare-fun m!674935 () Bool)

(assert (=> b!720371 m!674935))

(check-sat (not b!720375) (not b!720378) (not start!64154) (not b!720374) (not b!720373) (not b!720371) (not b!720377) (not b!720379) (not b!720376) (not b!720380) (not b!720369))
(check-sat)
