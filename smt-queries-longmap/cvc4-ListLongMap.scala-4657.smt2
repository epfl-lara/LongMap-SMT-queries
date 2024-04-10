; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64718 () Bool)

(assert start!64718)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41167 0))(
  ( (array!41168 (arr!19703 (Array (_ BitVec 32) (_ BitVec 64))) (size!20124 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41167)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!730144 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!408622 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7303 0))(
  ( (MissingZero!7303 (index!31580 (_ BitVec 32))) (Found!7303 (index!31581 (_ BitVec 32))) (Intermediate!7303 (undefined!8115 Bool) (index!31582 (_ BitVec 32)) (x!62557 (_ BitVec 32))) (Undefined!7303) (MissingVacant!7303 (index!31583 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41167 (_ BitVec 32)) SeekEntryResult!7303)

(assert (=> b!730144 (= e!408622 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19703 a!3186) j!159) a!3186 mask!3328) (Found!7303 j!159)))))

(declare-fun b!730145 () Bool)

(declare-fun res!490479 () Bool)

(declare-fun e!408617 () Bool)

(assert (=> b!730145 (=> (not res!490479) (not e!408617))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730145 (= res!490479 (and (= (size!20124 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20124 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20124 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730146 () Bool)

(declare-fun e!408619 () Bool)

(declare-fun e!408620 () Bool)

(assert (=> b!730146 (= e!408619 e!408620)))

(declare-fun res!490481 () Bool)

(assert (=> b!730146 (=> (not res!490481) (not e!408620))))

(declare-fun lt!323521 () SeekEntryResult!7303)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41167 (_ BitVec 32)) SeekEntryResult!7303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730146 (= res!490481 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19703 a!3186) j!159) mask!3328) (select (arr!19703 a!3186) j!159) a!3186 mask!3328) lt!323521))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730146 (= lt!323521 (Intermediate!7303 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730147 () Bool)

(declare-fun res!490474 () Bool)

(assert (=> b!730147 (=> (not res!490474) (not e!408617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730147 (= res!490474 (validKeyInArray!0 (select (arr!19703 a!3186) j!159)))))

(declare-fun b!730148 () Bool)

(declare-fun res!490480 () Bool)

(assert (=> b!730148 (=> (not res!490480) (not e!408617))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!730148 (= res!490480 (validKeyInArray!0 k!2102))))

(declare-fun b!730149 () Bool)

(declare-fun e!408618 () Bool)

(declare-fun e!408623 () Bool)

(assert (=> b!730149 (= e!408618 (not e!408623))))

(declare-fun res!490473 () Bool)

(assert (=> b!730149 (=> res!490473 e!408623)))

(declare-fun lt!323514 () SeekEntryResult!7303)

(assert (=> b!730149 (= res!490473 (or (not (is-Intermediate!7303 lt!323514)) (bvsge x!1131 (x!62557 lt!323514))))))

(declare-fun e!408615 () Bool)

(assert (=> b!730149 e!408615))

(declare-fun res!490476 () Bool)

(assert (=> b!730149 (=> (not res!490476) (not e!408615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41167 (_ BitVec 32)) Bool)

(assert (=> b!730149 (= res!490476 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24924 0))(
  ( (Unit!24925) )
))
(declare-fun lt!323519 () Unit!24924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24924)

(assert (=> b!730149 (= lt!323519 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730150 () Bool)

(declare-fun e!408621 () Bool)

(assert (=> b!730150 (= e!408615 e!408621)))

(declare-fun res!490475 () Bool)

(assert (=> b!730150 (=> (not res!490475) (not e!408621))))

(declare-fun lt!323515 () SeekEntryResult!7303)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41167 (_ BitVec 32)) SeekEntryResult!7303)

(assert (=> b!730150 (= res!490475 (= (seekEntryOrOpen!0 (select (arr!19703 a!3186) j!159) a!3186 mask!3328) lt!323515))))

(assert (=> b!730150 (= lt!323515 (Found!7303 j!159))))

(declare-fun b!730152 () Bool)

(declare-fun res!490483 () Bool)

(assert (=> b!730152 (=> (not res!490483) (not e!408620))))

(assert (=> b!730152 (= res!490483 e!408622)))

(declare-fun c!80212 () Bool)

(assert (=> b!730152 (= c!80212 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730153 () Bool)

(declare-fun res!490477 () Bool)

(assert (=> b!730153 (=> (not res!490477) (not e!408619))))

(assert (=> b!730153 (= res!490477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730154 () Bool)

(declare-fun res!490469 () Bool)

(assert (=> b!730154 (=> (not res!490469) (not e!408619))))

(declare-datatypes ((List!13705 0))(
  ( (Nil!13702) (Cons!13701 (h!14761 (_ BitVec 64)) (t!20020 List!13705)) )
))
(declare-fun arrayNoDuplicates!0 (array!41167 (_ BitVec 32) List!13705) Bool)

(assert (=> b!730154 (= res!490469 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13702))))

(declare-fun b!730155 () Bool)

(declare-fun res!490470 () Bool)

(assert (=> b!730155 (=> (not res!490470) (not e!408617))))

(declare-fun arrayContainsKey!0 (array!41167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730155 (= res!490470 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730156 () Bool)

(assert (=> b!730156 (= e!408617 e!408619)))

(declare-fun res!490471 () Bool)

(assert (=> b!730156 (=> (not res!490471) (not e!408619))))

(declare-fun lt!323520 () SeekEntryResult!7303)

(assert (=> b!730156 (= res!490471 (or (= lt!323520 (MissingZero!7303 i!1173)) (= lt!323520 (MissingVacant!7303 i!1173))))))

(assert (=> b!730156 (= lt!323520 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730157 () Bool)

(declare-fun res!490482 () Bool)

(assert (=> b!730157 (=> (not res!490482) (not e!408620))))

(assert (=> b!730157 (= res!490482 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19703 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730158 () Bool)

(assert (=> b!730158 (= e!408622 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19703 a!3186) j!159) a!3186 mask!3328) lt!323521))))

(declare-fun b!730159 () Bool)

(assert (=> b!730159 (= e!408621 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19703 a!3186) j!159) a!3186 mask!3328) lt!323515))))

(declare-fun res!490484 () Bool)

(assert (=> start!64718 (=> (not res!490484) (not e!408617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64718 (= res!490484 (validMask!0 mask!3328))))

(assert (=> start!64718 e!408617))

(assert (=> start!64718 true))

(declare-fun array_inv!15499 (array!41167) Bool)

(assert (=> start!64718 (array_inv!15499 a!3186)))

(declare-fun b!730151 () Bool)

(assert (=> b!730151 (= e!408623 true)))

(declare-fun lt!323517 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730151 (= lt!323517 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730160 () Bool)

(declare-fun res!490478 () Bool)

(assert (=> b!730160 (=> (not res!490478) (not e!408619))))

(assert (=> b!730160 (= res!490478 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20124 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20124 a!3186))))))

(declare-fun b!730161 () Bool)

(assert (=> b!730161 (= e!408620 e!408618)))

(declare-fun res!490472 () Bool)

(assert (=> b!730161 (=> (not res!490472) (not e!408618))))

(declare-fun lt!323518 () SeekEntryResult!7303)

(assert (=> b!730161 (= res!490472 (= lt!323518 lt!323514))))

(declare-fun lt!323516 () (_ BitVec 64))

(declare-fun lt!323522 () array!41167)

(assert (=> b!730161 (= lt!323514 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323516 lt!323522 mask!3328))))

(assert (=> b!730161 (= lt!323518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323516 mask!3328) lt!323516 lt!323522 mask!3328))))

(assert (=> b!730161 (= lt!323516 (select (store (arr!19703 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730161 (= lt!323522 (array!41168 (store (arr!19703 a!3186) i!1173 k!2102) (size!20124 a!3186)))))

(assert (= (and start!64718 res!490484) b!730145))

(assert (= (and b!730145 res!490479) b!730147))

(assert (= (and b!730147 res!490474) b!730148))

(assert (= (and b!730148 res!490480) b!730155))

(assert (= (and b!730155 res!490470) b!730156))

(assert (= (and b!730156 res!490471) b!730153))

(assert (= (and b!730153 res!490477) b!730154))

(assert (= (and b!730154 res!490469) b!730160))

(assert (= (and b!730160 res!490478) b!730146))

(assert (= (and b!730146 res!490481) b!730157))

(assert (= (and b!730157 res!490482) b!730152))

(assert (= (and b!730152 c!80212) b!730158))

(assert (= (and b!730152 (not c!80212)) b!730144))

(assert (= (and b!730152 res!490483) b!730161))

(assert (= (and b!730161 res!490472) b!730149))

(assert (= (and b!730149 res!490476) b!730150))

(assert (= (and b!730150 res!490475) b!730159))

(assert (= (and b!730149 (not res!490473)) b!730151))

(declare-fun m!683707 () Bool)

(assert (=> b!730147 m!683707))

(assert (=> b!730147 m!683707))

(declare-fun m!683709 () Bool)

(assert (=> b!730147 m!683709))

(assert (=> b!730146 m!683707))

(assert (=> b!730146 m!683707))

(declare-fun m!683711 () Bool)

(assert (=> b!730146 m!683711))

(assert (=> b!730146 m!683711))

(assert (=> b!730146 m!683707))

(declare-fun m!683713 () Bool)

(assert (=> b!730146 m!683713))

(declare-fun m!683715 () Bool)

(assert (=> b!730149 m!683715))

(declare-fun m!683717 () Bool)

(assert (=> b!730149 m!683717))

(declare-fun m!683719 () Bool)

(assert (=> b!730148 m!683719))

(declare-fun m!683721 () Bool)

(assert (=> b!730161 m!683721))

(declare-fun m!683723 () Bool)

(assert (=> b!730161 m!683723))

(declare-fun m!683725 () Bool)

(assert (=> b!730161 m!683725))

(declare-fun m!683727 () Bool)

(assert (=> b!730161 m!683727))

(assert (=> b!730161 m!683725))

(declare-fun m!683729 () Bool)

(assert (=> b!730161 m!683729))

(assert (=> b!730144 m!683707))

(assert (=> b!730144 m!683707))

(declare-fun m!683731 () Bool)

(assert (=> b!730144 m!683731))

(assert (=> b!730158 m!683707))

(assert (=> b!730158 m!683707))

(declare-fun m!683733 () Bool)

(assert (=> b!730158 m!683733))

(declare-fun m!683735 () Bool)

(assert (=> b!730153 m!683735))

(declare-fun m!683737 () Bool)

(assert (=> b!730157 m!683737))

(assert (=> b!730159 m!683707))

(assert (=> b!730159 m!683707))

(declare-fun m!683739 () Bool)

(assert (=> b!730159 m!683739))

(declare-fun m!683741 () Bool)

(assert (=> b!730155 m!683741))

(declare-fun m!683743 () Bool)

(assert (=> b!730154 m!683743))

(assert (=> b!730150 m!683707))

(assert (=> b!730150 m!683707))

(declare-fun m!683745 () Bool)

(assert (=> b!730150 m!683745))

(declare-fun m!683747 () Bool)

(assert (=> b!730151 m!683747))

(declare-fun m!683749 () Bool)

(assert (=> b!730156 m!683749))

(declare-fun m!683751 () Bool)

(assert (=> start!64718 m!683751))

(declare-fun m!683753 () Bool)

(assert (=> start!64718 m!683753))

(push 1)

