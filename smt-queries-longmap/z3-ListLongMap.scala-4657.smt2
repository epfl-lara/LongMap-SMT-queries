; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64716 () Bool)

(assert start!64716)

(declare-fun b!730090 () Bool)

(declare-fun e!408589 () Bool)

(declare-fun e!408591 () Bool)

(assert (=> b!730090 (= e!408589 e!408591)))

(declare-fun res!490427 () Bool)

(assert (=> b!730090 (=> (not res!490427) (not e!408591))))

(declare-datatypes ((array!41165 0))(
  ( (array!41166 (arr!19702 (Array (_ BitVec 32) (_ BitVec 64))) (size!20123 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41165)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7302 0))(
  ( (MissingZero!7302 (index!31576 (_ BitVec 32))) (Found!7302 (index!31577 (_ BitVec 32))) (Intermediate!7302 (undefined!8114 Bool) (index!31578 (_ BitVec 32)) (x!62556 (_ BitVec 32))) (Undefined!7302) (MissingVacant!7302 (index!31579 (_ BitVec 32))) )
))
(declare-fun lt!323491 () SeekEntryResult!7302)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41165 (_ BitVec 32)) SeekEntryResult!7302)

(assert (=> b!730090 (= res!490427 (= (seekEntryOrOpen!0 (select (arr!19702 a!3186) j!159) a!3186 mask!3328) lt!323491))))

(assert (=> b!730090 (= lt!323491 (Found!7302 j!159))))

(declare-fun b!730091 () Bool)

(declare-fun res!490434 () Bool)

(declare-fun e!408595 () Bool)

(assert (=> b!730091 (=> (not res!490434) (not e!408595))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730091 (= res!490434 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19702 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730092 () Bool)

(declare-fun res!490423 () Bool)

(declare-fun e!408596 () Bool)

(assert (=> b!730092 (=> (not res!490423) (not e!408596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41165 (_ BitVec 32)) Bool)

(assert (=> b!730092 (= res!490423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!408593 () Bool)

(declare-fun b!730094 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41165 (_ BitVec 32)) SeekEntryResult!7302)

(assert (=> b!730094 (= e!408593 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19702 a!3186) j!159) a!3186 mask!3328) (Found!7302 j!159)))))

(declare-fun b!730095 () Bool)

(assert (=> b!730095 (= e!408596 e!408595)))

(declare-fun res!490429 () Bool)

(assert (=> b!730095 (=> (not res!490429) (not e!408595))))

(declare-fun lt!323494 () SeekEntryResult!7302)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41165 (_ BitVec 32)) SeekEntryResult!7302)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730095 (= res!490429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19702 a!3186) j!159) mask!3328) (select (arr!19702 a!3186) j!159) a!3186 mask!3328) lt!323494))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730095 (= lt!323494 (Intermediate!7302 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730096 () Bool)

(declare-fun res!490431 () Bool)

(assert (=> b!730096 (=> (not res!490431) (not e!408596))))

(declare-datatypes ((List!13704 0))(
  ( (Nil!13701) (Cons!13700 (h!14760 (_ BitVec 64)) (t!20019 List!13704)) )
))
(declare-fun arrayNoDuplicates!0 (array!41165 (_ BitVec 32) List!13704) Bool)

(assert (=> b!730096 (= res!490431 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13701))))

(declare-fun b!730097 () Bool)

(assert (=> b!730097 (= e!408593 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19702 a!3186) j!159) a!3186 mask!3328) lt!323494))))

(declare-fun b!730098 () Bool)

(declare-fun e!408594 () Bool)

(assert (=> b!730098 (= e!408594 true)))

(declare-fun lt!323495 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730098 (= lt!323495 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730099 () Bool)

(declare-fun res!490428 () Bool)

(declare-fun e!408592 () Bool)

(assert (=> b!730099 (=> (not res!490428) (not e!408592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730099 (= res!490428 (validKeyInArray!0 (select (arr!19702 a!3186) j!159)))))

(declare-fun b!730100 () Bool)

(declare-fun res!490435 () Bool)

(assert (=> b!730100 (=> (not res!490435) (not e!408592))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730100 (= res!490435 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730101 () Bool)

(assert (=> b!730101 (= e!408591 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19702 a!3186) j!159) a!3186 mask!3328) lt!323491))))

(declare-fun b!730102 () Bool)

(assert (=> b!730102 (= e!408592 e!408596)))

(declare-fun res!490430 () Bool)

(assert (=> b!730102 (=> (not res!490430) (not e!408596))))

(declare-fun lt!323493 () SeekEntryResult!7302)

(assert (=> b!730102 (= res!490430 (or (= lt!323493 (MissingZero!7302 i!1173)) (= lt!323493 (MissingVacant!7302 i!1173))))))

(assert (=> b!730102 (= lt!323493 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730093 () Bool)

(declare-fun res!490426 () Bool)

(assert (=> b!730093 (=> (not res!490426) (not e!408592))))

(assert (=> b!730093 (= res!490426 (validKeyInArray!0 k0!2102))))

(declare-fun res!490436 () Bool)

(assert (=> start!64716 (=> (not res!490436) (not e!408592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64716 (= res!490436 (validMask!0 mask!3328))))

(assert (=> start!64716 e!408592))

(assert (=> start!64716 true))

(declare-fun array_inv!15498 (array!41165) Bool)

(assert (=> start!64716 (array_inv!15498 a!3186)))

(declare-fun b!730103 () Bool)

(declare-fun res!490421 () Bool)

(assert (=> b!730103 (=> (not res!490421) (not e!408596))))

(assert (=> b!730103 (= res!490421 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20123 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20123 a!3186))))))

(declare-fun b!730104 () Bool)

(declare-fun e!408588 () Bool)

(assert (=> b!730104 (= e!408595 e!408588)))

(declare-fun res!490433 () Bool)

(assert (=> b!730104 (=> (not res!490433) (not e!408588))))

(declare-fun lt!323487 () SeekEntryResult!7302)

(declare-fun lt!323488 () SeekEntryResult!7302)

(assert (=> b!730104 (= res!490433 (= lt!323487 lt!323488))))

(declare-fun lt!323489 () (_ BitVec 64))

(declare-fun lt!323492 () array!41165)

(assert (=> b!730104 (= lt!323488 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323489 lt!323492 mask!3328))))

(assert (=> b!730104 (= lt!323487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323489 mask!3328) lt!323489 lt!323492 mask!3328))))

(assert (=> b!730104 (= lt!323489 (select (store (arr!19702 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730104 (= lt!323492 (array!41166 (store (arr!19702 a!3186) i!1173 k0!2102) (size!20123 a!3186)))))

(declare-fun b!730105 () Bool)

(declare-fun res!490424 () Bool)

(assert (=> b!730105 (=> (not res!490424) (not e!408592))))

(assert (=> b!730105 (= res!490424 (and (= (size!20123 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20123 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20123 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730106 () Bool)

(declare-fun res!490422 () Bool)

(assert (=> b!730106 (=> (not res!490422) (not e!408595))))

(assert (=> b!730106 (= res!490422 e!408593)))

(declare-fun c!80209 () Bool)

(assert (=> b!730106 (= c!80209 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730107 () Bool)

(assert (=> b!730107 (= e!408588 (not e!408594))))

(declare-fun res!490425 () Bool)

(assert (=> b!730107 (=> res!490425 e!408594)))

(get-info :version)

(assert (=> b!730107 (= res!490425 (or (not ((_ is Intermediate!7302) lt!323488)) (bvsge x!1131 (x!62556 lt!323488))))))

(assert (=> b!730107 e!408589))

(declare-fun res!490432 () Bool)

(assert (=> b!730107 (=> (not res!490432) (not e!408589))))

(assert (=> b!730107 (= res!490432 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24922 0))(
  ( (Unit!24923) )
))
(declare-fun lt!323490 () Unit!24922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24922)

(assert (=> b!730107 (= lt!323490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64716 res!490436) b!730105))

(assert (= (and b!730105 res!490424) b!730099))

(assert (= (and b!730099 res!490428) b!730093))

(assert (= (and b!730093 res!490426) b!730100))

(assert (= (and b!730100 res!490435) b!730102))

(assert (= (and b!730102 res!490430) b!730092))

(assert (= (and b!730092 res!490423) b!730096))

(assert (= (and b!730096 res!490431) b!730103))

(assert (= (and b!730103 res!490421) b!730095))

(assert (= (and b!730095 res!490429) b!730091))

(assert (= (and b!730091 res!490434) b!730106))

(assert (= (and b!730106 c!80209) b!730097))

(assert (= (and b!730106 (not c!80209)) b!730094))

(assert (= (and b!730106 res!490422) b!730104))

(assert (= (and b!730104 res!490433) b!730107))

(assert (= (and b!730107 res!490432) b!730090))

(assert (= (and b!730090 res!490427) b!730101))

(assert (= (and b!730107 (not res!490425)) b!730098))

(declare-fun m!683659 () Bool)

(assert (=> b!730095 m!683659))

(assert (=> b!730095 m!683659))

(declare-fun m!683661 () Bool)

(assert (=> b!730095 m!683661))

(assert (=> b!730095 m!683661))

(assert (=> b!730095 m!683659))

(declare-fun m!683663 () Bool)

(assert (=> b!730095 m!683663))

(declare-fun m!683665 () Bool)

(assert (=> b!730107 m!683665))

(declare-fun m!683667 () Bool)

(assert (=> b!730107 m!683667))

(declare-fun m!683669 () Bool)

(assert (=> b!730100 m!683669))

(declare-fun m!683671 () Bool)

(assert (=> b!730104 m!683671))

(declare-fun m!683673 () Bool)

(assert (=> b!730104 m!683673))

(declare-fun m!683675 () Bool)

(assert (=> b!730104 m!683675))

(declare-fun m!683677 () Bool)

(assert (=> b!730104 m!683677))

(declare-fun m!683679 () Bool)

(assert (=> b!730104 m!683679))

(assert (=> b!730104 m!683671))

(assert (=> b!730097 m!683659))

(assert (=> b!730097 m!683659))

(declare-fun m!683681 () Bool)

(assert (=> b!730097 m!683681))

(assert (=> b!730099 m!683659))

(assert (=> b!730099 m!683659))

(declare-fun m!683683 () Bool)

(assert (=> b!730099 m!683683))

(declare-fun m!683685 () Bool)

(assert (=> b!730098 m!683685))

(declare-fun m!683687 () Bool)

(assert (=> b!730102 m!683687))

(assert (=> b!730101 m!683659))

(assert (=> b!730101 m!683659))

(declare-fun m!683689 () Bool)

(assert (=> b!730101 m!683689))

(declare-fun m!683691 () Bool)

(assert (=> b!730093 m!683691))

(declare-fun m!683693 () Bool)

(assert (=> start!64716 m!683693))

(declare-fun m!683695 () Bool)

(assert (=> start!64716 m!683695))

(declare-fun m!683697 () Bool)

(assert (=> b!730096 m!683697))

(declare-fun m!683699 () Bool)

(assert (=> b!730091 m!683699))

(declare-fun m!683701 () Bool)

(assert (=> b!730092 m!683701))

(assert (=> b!730090 m!683659))

(assert (=> b!730090 m!683659))

(declare-fun m!683703 () Bool)

(assert (=> b!730090 m!683703))

(assert (=> b!730094 m!683659))

(assert (=> b!730094 m!683659))

(declare-fun m!683705 () Bool)

(assert (=> b!730094 m!683705))

(check-sat (not b!730104) (not b!730099) (not b!730102) (not b!730097) (not b!730096) (not b!730100) (not b!730094) (not b!730093) (not b!730090) (not b!730098) (not b!730092) (not start!64716) (not b!730095) (not b!730107) (not b!730101))
(check-sat)
