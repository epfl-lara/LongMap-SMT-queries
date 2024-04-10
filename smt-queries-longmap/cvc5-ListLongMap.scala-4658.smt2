; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64720 () Bool)

(assert start!64720)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408645 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!730198 () Bool)

(declare-datatypes ((array!41169 0))(
  ( (array!41170 (arr!19704 (Array (_ BitVec 32) (_ BitVec 64))) (size!20125 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41169)

(declare-datatypes ((SeekEntryResult!7304 0))(
  ( (MissingZero!7304 (index!31584 (_ BitVec 32))) (Found!7304 (index!31585 (_ BitVec 32))) (Intermediate!7304 (undefined!8116 Bool) (index!31586 (_ BitVec 32)) (x!62566 (_ BitVec 32))) (Undefined!7304) (MissingVacant!7304 (index!31587 (_ BitVec 32))) )
))
(declare-fun lt!323541 () SeekEntryResult!7304)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41169 (_ BitVec 32)) SeekEntryResult!7304)

(assert (=> b!730198 (= e!408645 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19704 a!3186) j!159) a!3186 mask!3328) lt!323541))))

(declare-fun b!730199 () Bool)

(declare-fun res!490527 () Bool)

(declare-fun e!408650 () Bool)

(assert (=> b!730199 (=> (not res!490527) (not e!408650))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730199 (= res!490527 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19704 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730200 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41169 (_ BitVec 32)) SeekEntryResult!7304)

(assert (=> b!730200 (= e!408645 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19704 a!3186) j!159) a!3186 mask!3328) (Found!7304 j!159)))))

(declare-fun res!490526 () Bool)

(declare-fun e!408646 () Bool)

(assert (=> start!64720 (=> (not res!490526) (not e!408646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64720 (= res!490526 (validMask!0 mask!3328))))

(assert (=> start!64720 e!408646))

(assert (=> start!64720 true))

(declare-fun array_inv!15500 (array!41169) Bool)

(assert (=> start!64720 (array_inv!15500 a!3186)))

(declare-fun b!730201 () Bool)

(declare-fun e!408642 () Bool)

(assert (=> b!730201 (= e!408650 e!408642)))

(declare-fun res!490525 () Bool)

(assert (=> b!730201 (=> (not res!490525) (not e!408642))))

(declare-fun lt!323544 () SeekEntryResult!7304)

(declare-fun lt!323548 () SeekEntryResult!7304)

(assert (=> b!730201 (= res!490525 (= lt!323544 lt!323548))))

(declare-fun lt!323546 () array!41169)

(declare-fun lt!323549 () (_ BitVec 64))

(assert (=> b!730201 (= lt!323548 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323549 lt!323546 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730201 (= lt!323544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323549 mask!3328) lt!323549 lt!323546 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!730201 (= lt!323549 (select (store (arr!19704 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730201 (= lt!323546 (array!41170 (store (arr!19704 a!3186) i!1173 k!2102) (size!20125 a!3186)))))

(declare-fun e!408644 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!730202 () Bool)

(assert (=> b!730202 (= e!408644 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323547 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730202 (= lt!323547 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730203 () Bool)

(assert (=> b!730203 (= e!408642 (not e!408644))))

(declare-fun res!490529 () Bool)

(assert (=> b!730203 (=> res!490529 e!408644)))

(assert (=> b!730203 (= res!490529 (or (not (is-Intermediate!7304 lt!323548)) (bvsge x!1131 (x!62566 lt!323548))))))

(declare-fun e!408647 () Bool)

(assert (=> b!730203 e!408647))

(declare-fun res!490532 () Bool)

(assert (=> b!730203 (=> (not res!490532) (not e!408647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41169 (_ BitVec 32)) Bool)

(assert (=> b!730203 (= res!490532 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24926 0))(
  ( (Unit!24927) )
))
(declare-fun lt!323542 () Unit!24926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24926)

(assert (=> b!730203 (= lt!323542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730204 () Bool)

(declare-fun res!490531 () Bool)

(declare-fun e!408643 () Bool)

(assert (=> b!730204 (=> (not res!490531) (not e!408643))))

(assert (=> b!730204 (= res!490531 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20125 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20125 a!3186))))))

(declare-fun b!730205 () Bool)

(declare-fun res!490528 () Bool)

(assert (=> b!730205 (=> (not res!490528) (not e!408646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730205 (= res!490528 (validKeyInArray!0 k!2102))))

(declare-fun b!730206 () Bool)

(declare-fun res!490521 () Bool)

(assert (=> b!730206 (=> (not res!490521) (not e!408643))))

(declare-datatypes ((List!13706 0))(
  ( (Nil!13703) (Cons!13702 (h!14762 (_ BitVec 64)) (t!20021 List!13706)) )
))
(declare-fun arrayNoDuplicates!0 (array!41169 (_ BitVec 32) List!13706) Bool)

(assert (=> b!730206 (= res!490521 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13703))))

(declare-fun b!730207 () Bool)

(assert (=> b!730207 (= e!408646 e!408643)))

(declare-fun res!490530 () Bool)

(assert (=> b!730207 (=> (not res!490530) (not e!408643))))

(declare-fun lt!323545 () SeekEntryResult!7304)

(assert (=> b!730207 (= res!490530 (or (= lt!323545 (MissingZero!7304 i!1173)) (= lt!323545 (MissingVacant!7304 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41169 (_ BitVec 32)) SeekEntryResult!7304)

(assert (=> b!730207 (= lt!323545 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730208 () Bool)

(declare-fun e!408648 () Bool)

(assert (=> b!730208 (= e!408647 e!408648)))

(declare-fun res!490518 () Bool)

(assert (=> b!730208 (=> (not res!490518) (not e!408648))))

(declare-fun lt!323543 () SeekEntryResult!7304)

(assert (=> b!730208 (= res!490518 (= (seekEntryOrOpen!0 (select (arr!19704 a!3186) j!159) a!3186 mask!3328) lt!323543))))

(assert (=> b!730208 (= lt!323543 (Found!7304 j!159))))

(declare-fun b!730209 () Bool)

(declare-fun res!490519 () Bool)

(assert (=> b!730209 (=> (not res!490519) (not e!408650))))

(assert (=> b!730209 (= res!490519 e!408645)))

(declare-fun c!80215 () Bool)

(assert (=> b!730209 (= c!80215 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730210 () Bool)

(declare-fun res!490520 () Bool)

(assert (=> b!730210 (=> (not res!490520) (not e!408643))))

(assert (=> b!730210 (= res!490520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730211 () Bool)

(declare-fun res!490522 () Bool)

(assert (=> b!730211 (=> (not res!490522) (not e!408646))))

(assert (=> b!730211 (= res!490522 (validKeyInArray!0 (select (arr!19704 a!3186) j!159)))))

(declare-fun b!730212 () Bool)

(assert (=> b!730212 (= e!408648 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19704 a!3186) j!159) a!3186 mask!3328) lt!323543))))

(declare-fun b!730213 () Bool)

(declare-fun res!490524 () Bool)

(assert (=> b!730213 (=> (not res!490524) (not e!408646))))

(declare-fun arrayContainsKey!0 (array!41169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730213 (= res!490524 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730214 () Bool)

(declare-fun res!490517 () Bool)

(assert (=> b!730214 (=> (not res!490517) (not e!408646))))

(assert (=> b!730214 (= res!490517 (and (= (size!20125 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20125 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20125 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730215 () Bool)

(assert (=> b!730215 (= e!408643 e!408650)))

(declare-fun res!490523 () Bool)

(assert (=> b!730215 (=> (not res!490523) (not e!408650))))

(assert (=> b!730215 (= res!490523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19704 a!3186) j!159) mask!3328) (select (arr!19704 a!3186) j!159) a!3186 mask!3328) lt!323541))))

(assert (=> b!730215 (= lt!323541 (Intermediate!7304 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64720 res!490526) b!730214))

(assert (= (and b!730214 res!490517) b!730211))

(assert (= (and b!730211 res!490522) b!730205))

(assert (= (and b!730205 res!490528) b!730213))

(assert (= (and b!730213 res!490524) b!730207))

(assert (= (and b!730207 res!490530) b!730210))

(assert (= (and b!730210 res!490520) b!730206))

(assert (= (and b!730206 res!490521) b!730204))

(assert (= (and b!730204 res!490531) b!730215))

(assert (= (and b!730215 res!490523) b!730199))

(assert (= (and b!730199 res!490527) b!730209))

(assert (= (and b!730209 c!80215) b!730198))

(assert (= (and b!730209 (not c!80215)) b!730200))

(assert (= (and b!730209 res!490519) b!730201))

(assert (= (and b!730201 res!490525) b!730203))

(assert (= (and b!730203 res!490532) b!730208))

(assert (= (and b!730208 res!490518) b!730212))

(assert (= (and b!730203 (not res!490529)) b!730202))

(declare-fun m!683755 () Bool)

(assert (=> b!730203 m!683755))

(declare-fun m!683757 () Bool)

(assert (=> b!730203 m!683757))

(declare-fun m!683759 () Bool)

(assert (=> b!730212 m!683759))

(assert (=> b!730212 m!683759))

(declare-fun m!683761 () Bool)

(assert (=> b!730212 m!683761))

(assert (=> b!730200 m!683759))

(assert (=> b!730200 m!683759))

(declare-fun m!683763 () Bool)

(assert (=> b!730200 m!683763))

(assert (=> b!730211 m!683759))

(assert (=> b!730211 m!683759))

(declare-fun m!683765 () Bool)

(assert (=> b!730211 m!683765))

(assert (=> b!730215 m!683759))

(assert (=> b!730215 m!683759))

(declare-fun m!683767 () Bool)

(assert (=> b!730215 m!683767))

(assert (=> b!730215 m!683767))

(assert (=> b!730215 m!683759))

(declare-fun m!683769 () Bool)

(assert (=> b!730215 m!683769))

(declare-fun m!683771 () Bool)

(assert (=> b!730207 m!683771))

(assert (=> b!730208 m!683759))

(assert (=> b!730208 m!683759))

(declare-fun m!683773 () Bool)

(assert (=> b!730208 m!683773))

(assert (=> b!730198 m!683759))

(assert (=> b!730198 m!683759))

(declare-fun m!683775 () Bool)

(assert (=> b!730198 m!683775))

(declare-fun m!683777 () Bool)

(assert (=> start!64720 m!683777))

(declare-fun m!683779 () Bool)

(assert (=> start!64720 m!683779))

(declare-fun m!683781 () Bool)

(assert (=> b!730201 m!683781))

(declare-fun m!683783 () Bool)

(assert (=> b!730201 m!683783))

(declare-fun m!683785 () Bool)

(assert (=> b!730201 m!683785))

(declare-fun m!683787 () Bool)

(assert (=> b!730201 m!683787))

(assert (=> b!730201 m!683783))

(declare-fun m!683789 () Bool)

(assert (=> b!730201 m!683789))

(declare-fun m!683791 () Bool)

(assert (=> b!730206 m!683791))

(declare-fun m!683793 () Bool)

(assert (=> b!730213 m!683793))

(declare-fun m!683795 () Bool)

(assert (=> b!730210 m!683795))

(declare-fun m!683797 () Bool)

(assert (=> b!730205 m!683797))

(declare-fun m!683799 () Bool)

(assert (=> b!730199 m!683799))

(declare-fun m!683801 () Bool)

(assert (=> b!730202 m!683801))

(push 1)

(assert (not b!730208))

(assert (not b!730212))

(assert (not b!730202))

(assert (not b!730207))

(assert (not b!730210))

(assert (not b!730211))

(assert (not start!64720))

(assert (not b!730203))

(assert (not b!730215))

(assert (not b!730198))

(assert (not b!730206))

(assert (not b!730205))

(assert (not b!730200))

(assert (not b!730213))

(assert (not b!730201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

