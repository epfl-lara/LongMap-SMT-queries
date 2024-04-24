; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65298 () Bool)

(assert start!65298)

(declare-fun b!737645 () Bool)

(declare-fun e!412684 () Bool)

(declare-fun e!412683 () Bool)

(assert (=> b!737645 (= e!412684 e!412683)))

(declare-fun res!495588 () Bool)

(assert (=> b!737645 (=> (not res!495588) (not e!412683))))

(declare-datatypes ((array!41341 0))(
  ( (array!41342 (arr!19780 (Array (_ BitVec 32) (_ BitVec 64))) (size!20200 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41341)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7336 0))(
  ( (MissingZero!7336 (index!31712 (_ BitVec 32))) (Found!7336 (index!31713 (_ BitVec 32))) (Intermediate!7336 (undefined!8148 Bool) (index!31714 (_ BitVec 32)) (x!62874 (_ BitVec 32))) (Undefined!7336) (MissingVacant!7336 (index!31715 (_ BitVec 32))) )
))
(declare-fun lt!327183 () SeekEntryResult!7336)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41341 (_ BitVec 32)) SeekEntryResult!7336)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737645 (= res!495588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19780 a!3186) j!159) mask!3328) (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!327183))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737645 (= lt!327183 (Intermediate!7336 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!412689 () Bool)

(declare-fun b!737646 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41341 (_ BitVec 32)) SeekEntryResult!7336)

(assert (=> b!737646 (= e!412689 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) (Found!7336 j!159)))))

(declare-fun b!737648 () Bool)

(declare-fun res!495592 () Bool)

(assert (=> b!737648 (=> (not res!495592) (not e!412683))))

(assert (=> b!737648 (= res!495592 e!412689)))

(declare-fun c!81417 () Bool)

(assert (=> b!737648 (= c!81417 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!327185 () (_ BitVec 32))

(declare-fun lt!327186 () SeekEntryResult!7336)

(declare-fun b!737649 () Bool)

(declare-fun e!412690 () Bool)

(assert (=> b!737649 (= e!412690 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327185 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!327186)))))

(declare-fun b!737650 () Bool)

(declare-fun res!495579 () Bool)

(assert (=> b!737650 (=> (not res!495579) (not e!412684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41341 (_ BitVec 32)) Bool)

(assert (=> b!737650 (= res!495579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737651 () Bool)

(declare-fun res!495581 () Bool)

(assert (=> b!737651 (=> (not res!495581) (not e!412684))))

(declare-datatypes ((List!13689 0))(
  ( (Nil!13686) (Cons!13685 (h!14763 (_ BitVec 64)) (t!19996 List!13689)) )
))
(declare-fun arrayNoDuplicates!0 (array!41341 (_ BitVec 32) List!13689) Bool)

(assert (=> b!737651 (= res!495581 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13686))))

(declare-fun b!737652 () Bool)

(declare-datatypes ((Unit!25117 0))(
  ( (Unit!25118) )
))
(declare-fun e!412681 () Unit!25117)

(declare-fun Unit!25119 () Unit!25117)

(assert (=> b!737652 (= e!412681 Unit!25119)))

(declare-fun lt!327187 () SeekEntryResult!7336)

(assert (=> b!737652 (= lt!327187 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737652 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327185 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!327186)))

(declare-fun b!737653 () Bool)

(declare-fun res!495583 () Bool)

(declare-fun e!412692 () Bool)

(assert (=> b!737653 (=> (not res!495583) (not e!412692))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737653 (= res!495583 (and (= (size!20200 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20200 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20200 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737647 () Bool)

(declare-fun e!412691 () Bool)

(declare-fun e!412686 () Bool)

(assert (=> b!737647 (= e!412691 e!412686)))

(declare-fun res!495595 () Bool)

(assert (=> b!737647 (=> res!495595 e!412686)))

(assert (=> b!737647 (= res!495595 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327185 #b00000000000000000000000000000000) (bvsge lt!327185 (size!20200 a!3186))))))

(declare-fun lt!327191 () Unit!25117)

(assert (=> b!737647 (= lt!327191 e!412681)))

(declare-fun c!81419 () Bool)

(declare-fun lt!327190 () Bool)

(assert (=> b!737647 (= c!81419 lt!327190)))

(assert (=> b!737647 (= lt!327190 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737647 (= lt!327185 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun res!495586 () Bool)

(assert (=> start!65298 (=> (not res!495586) (not e!412692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65298 (= res!495586 (validMask!0 mask!3328))))

(assert (=> start!65298 e!412692))

(assert (=> start!65298 true))

(declare-fun array_inv!15639 (array!41341) Bool)

(assert (=> start!65298 (array_inv!15639 a!3186)))

(declare-fun e!412685 () Bool)

(declare-fun b!737654 () Bool)

(declare-fun lt!327184 () SeekEntryResult!7336)

(assert (=> b!737654 (= e!412685 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!327184))))

(declare-fun b!737655 () Bool)

(declare-fun res!495587 () Bool)

(assert (=> b!737655 (=> (not res!495587) (not e!412692))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737655 (= res!495587 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737656 () Bool)

(assert (=> b!737656 (= e!412690 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327185 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!327183)))))

(declare-fun b!737657 () Bool)

(declare-fun res!495582 () Bool)

(assert (=> b!737657 (=> (not res!495582) (not e!412683))))

(assert (=> b!737657 (= res!495582 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19780 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737658 () Bool)

(declare-fun res!495594 () Bool)

(assert (=> b!737658 (=> (not res!495594) (not e!412684))))

(assert (=> b!737658 (= res!495594 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20200 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20200 a!3186))))))

(declare-fun b!737659 () Bool)

(declare-fun e!412682 () Bool)

(assert (=> b!737659 (= e!412682 (not e!412691))))

(declare-fun res!495589 () Bool)

(assert (=> b!737659 (=> res!495589 e!412691)))

(declare-fun lt!327192 () SeekEntryResult!7336)

(get-info :version)

(assert (=> b!737659 (= res!495589 (or (not ((_ is Intermediate!7336) lt!327192)) (bvsge x!1131 (x!62874 lt!327192))))))

(assert (=> b!737659 (= lt!327186 (Found!7336 j!159))))

(declare-fun e!412687 () Bool)

(assert (=> b!737659 e!412687))

(declare-fun res!495584 () Bool)

(assert (=> b!737659 (=> (not res!495584) (not e!412687))))

(assert (=> b!737659 (= res!495584 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327189 () Unit!25117)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25117)

(assert (=> b!737659 (= lt!327189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737660 () Bool)

(assert (=> b!737660 (= e!412687 e!412685)))

(declare-fun res!495591 () Bool)

(assert (=> b!737660 (=> (not res!495591) (not e!412685))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41341 (_ BitVec 32)) SeekEntryResult!7336)

(assert (=> b!737660 (= res!495591 (= (seekEntryOrOpen!0 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!327184))))

(assert (=> b!737660 (= lt!327184 (Found!7336 j!159))))

(declare-fun b!737661 () Bool)

(assert (=> b!737661 (= e!412692 e!412684)))

(declare-fun res!495590 () Bool)

(assert (=> b!737661 (=> (not res!495590) (not e!412684))))

(declare-fun lt!327179 () SeekEntryResult!7336)

(assert (=> b!737661 (= res!495590 (or (= lt!327179 (MissingZero!7336 i!1173)) (= lt!327179 (MissingVacant!7336 i!1173))))))

(assert (=> b!737661 (= lt!327179 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737662 () Bool)

(assert (=> b!737662 (= e!412683 e!412682)))

(declare-fun res!495580 () Bool)

(assert (=> b!737662 (=> (not res!495580) (not e!412682))))

(declare-fun lt!327180 () SeekEntryResult!7336)

(assert (=> b!737662 (= res!495580 (= lt!327180 lt!327192))))

(declare-fun lt!327188 () (_ BitVec 64))

(declare-fun lt!327181 () array!41341)

(assert (=> b!737662 (= lt!327192 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327188 lt!327181 mask!3328))))

(assert (=> b!737662 (= lt!327180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327188 mask!3328) lt!327188 lt!327181 mask!3328))))

(assert (=> b!737662 (= lt!327188 (select (store (arr!19780 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737662 (= lt!327181 (array!41342 (store (arr!19780 a!3186) i!1173 k0!2102) (size!20200 a!3186)))))

(declare-fun b!737663 () Bool)

(declare-fun res!495593 () Bool)

(assert (=> b!737663 (=> res!495593 e!412686)))

(assert (=> b!737663 (= res!495593 e!412690)))

(declare-fun c!81418 () Bool)

(assert (=> b!737663 (= c!81418 lt!327190)))

(declare-fun b!737664 () Bool)

(assert (=> b!737664 (= e!412686 true)))

(declare-fun lt!327182 () SeekEntryResult!7336)

(assert (=> b!737664 (= lt!327182 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327185 lt!327188 lt!327181 mask!3328))))

(declare-fun b!737665 () Bool)

(declare-fun Unit!25120 () Unit!25117)

(assert (=> b!737665 (= e!412681 Unit!25120)))

(assert (=> b!737665 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327185 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!327183)))

(declare-fun b!737666 () Bool)

(declare-fun res!495585 () Bool)

(assert (=> b!737666 (=> (not res!495585) (not e!412692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737666 (= res!495585 (validKeyInArray!0 k0!2102))))

(declare-fun b!737667 () Bool)

(declare-fun res!495578 () Bool)

(assert (=> b!737667 (=> (not res!495578) (not e!412692))))

(assert (=> b!737667 (= res!495578 (validKeyInArray!0 (select (arr!19780 a!3186) j!159)))))

(declare-fun b!737668 () Bool)

(assert (=> b!737668 (= e!412689 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19780 a!3186) j!159) a!3186 mask!3328) lt!327183))))

(assert (= (and start!65298 res!495586) b!737653))

(assert (= (and b!737653 res!495583) b!737667))

(assert (= (and b!737667 res!495578) b!737666))

(assert (= (and b!737666 res!495585) b!737655))

(assert (= (and b!737655 res!495587) b!737661))

(assert (= (and b!737661 res!495590) b!737650))

(assert (= (and b!737650 res!495579) b!737651))

(assert (= (and b!737651 res!495581) b!737658))

(assert (= (and b!737658 res!495594) b!737645))

(assert (= (and b!737645 res!495588) b!737657))

(assert (= (and b!737657 res!495582) b!737648))

(assert (= (and b!737648 c!81417) b!737668))

(assert (= (and b!737648 (not c!81417)) b!737646))

(assert (= (and b!737648 res!495592) b!737662))

(assert (= (and b!737662 res!495580) b!737659))

(assert (= (and b!737659 res!495584) b!737660))

(assert (= (and b!737660 res!495591) b!737654))

(assert (= (and b!737659 (not res!495589)) b!737647))

(assert (= (and b!737647 c!81419) b!737665))

(assert (= (and b!737647 (not c!81419)) b!737652))

(assert (= (and b!737647 (not res!495595)) b!737663))

(assert (= (and b!737663 c!81418) b!737656))

(assert (= (and b!737663 (not c!81418)) b!737649))

(assert (= (and b!737663 (not res!495593)) b!737664))

(declare-fun m!690075 () Bool)

(assert (=> b!737668 m!690075))

(assert (=> b!737668 m!690075))

(declare-fun m!690077 () Bool)

(assert (=> b!737668 m!690077))

(declare-fun m!690079 () Bool)

(assert (=> b!737661 m!690079))

(assert (=> b!737660 m!690075))

(assert (=> b!737660 m!690075))

(declare-fun m!690081 () Bool)

(assert (=> b!737660 m!690081))

(assert (=> b!737652 m!690075))

(assert (=> b!737652 m!690075))

(declare-fun m!690083 () Bool)

(assert (=> b!737652 m!690083))

(assert (=> b!737652 m!690075))

(declare-fun m!690085 () Bool)

(assert (=> b!737652 m!690085))

(assert (=> b!737656 m!690075))

(assert (=> b!737656 m!690075))

(declare-fun m!690087 () Bool)

(assert (=> b!737656 m!690087))

(assert (=> b!737654 m!690075))

(assert (=> b!737654 m!690075))

(declare-fun m!690089 () Bool)

(assert (=> b!737654 m!690089))

(declare-fun m!690091 () Bool)

(assert (=> b!737664 m!690091))

(declare-fun m!690093 () Bool)

(assert (=> b!737659 m!690093))

(declare-fun m!690095 () Bool)

(assert (=> b!737659 m!690095))

(assert (=> b!737665 m!690075))

(assert (=> b!737665 m!690075))

(assert (=> b!737665 m!690087))

(declare-fun m!690097 () Bool)

(assert (=> b!737647 m!690097))

(declare-fun m!690099 () Bool)

(assert (=> b!737650 m!690099))

(declare-fun m!690101 () Bool)

(assert (=> b!737657 m!690101))

(declare-fun m!690103 () Bool)

(assert (=> b!737651 m!690103))

(declare-fun m!690105 () Bool)

(assert (=> b!737662 m!690105))

(declare-fun m!690107 () Bool)

(assert (=> b!737662 m!690107))

(declare-fun m!690109 () Bool)

(assert (=> b!737662 m!690109))

(declare-fun m!690111 () Bool)

(assert (=> b!737662 m!690111))

(declare-fun m!690113 () Bool)

(assert (=> b!737662 m!690113))

(assert (=> b!737662 m!690105))

(assert (=> b!737667 m!690075))

(assert (=> b!737667 m!690075))

(declare-fun m!690115 () Bool)

(assert (=> b!737667 m!690115))

(declare-fun m!690117 () Bool)

(assert (=> start!65298 m!690117))

(declare-fun m!690119 () Bool)

(assert (=> start!65298 m!690119))

(assert (=> b!737646 m!690075))

(assert (=> b!737646 m!690075))

(assert (=> b!737646 m!690083))

(assert (=> b!737645 m!690075))

(assert (=> b!737645 m!690075))

(declare-fun m!690121 () Bool)

(assert (=> b!737645 m!690121))

(assert (=> b!737645 m!690121))

(assert (=> b!737645 m!690075))

(declare-fun m!690123 () Bool)

(assert (=> b!737645 m!690123))

(declare-fun m!690125 () Bool)

(assert (=> b!737655 m!690125))

(assert (=> b!737649 m!690075))

(assert (=> b!737649 m!690075))

(assert (=> b!737649 m!690085))

(declare-fun m!690127 () Bool)

(assert (=> b!737666 m!690127))

(check-sat (not b!737654) (not b!737662) (not start!65298) (not b!737667) (not b!737645) (not b!737652) (not b!737649) (not b!737660) (not b!737659) (not b!737656) (not b!737668) (not b!737655) (not b!737647) (not b!737650) (not b!737665) (not b!737666) (not b!737646) (not b!737651) (not b!737661) (not b!737664))
(check-sat)
