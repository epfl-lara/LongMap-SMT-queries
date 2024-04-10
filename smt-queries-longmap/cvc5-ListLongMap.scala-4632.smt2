; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64492 () Bool)

(assert start!64492)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!406339 () Bool)

(declare-datatypes ((SeekEntryResult!7226 0))(
  ( (MissingZero!7226 (index!31272 (_ BitVec 32))) (Found!7226 (index!31273 (_ BitVec 32))) (Intermediate!7226 (undefined!8038 Bool) (index!31274 (_ BitVec 32)) (x!62268 (_ BitVec 32))) (Undefined!7226) (MissingVacant!7226 (index!31275 (_ BitVec 32))) )
))
(declare-fun lt!321410 () SeekEntryResult!7226)

(declare-datatypes ((array!41010 0))(
  ( (array!41011 (arr!19626 (Array (_ BitVec 32) (_ BitVec 64))) (size!20047 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41010)

(declare-fun b!725621 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41010 (_ BitVec 32)) SeekEntryResult!7226)

(assert (=> b!725621 (= e!406339 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19626 a!3186) j!159) a!3186 mask!3328) lt!321410))))

(declare-fun b!725622 () Bool)

(declare-fun res!486699 () Bool)

(declare-fun e!406338 () Bool)

(assert (=> b!725622 (=> (not res!486699) (not e!406338))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725622 (= res!486699 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19626 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725623 () Bool)

(declare-fun res!486708 () Bool)

(assert (=> b!725623 (=> (not res!486708) (not e!406338))))

(declare-fun e!406337 () Bool)

(assert (=> b!725623 (= res!486708 e!406337)))

(declare-fun c!79834 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!725623 (= c!79834 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725624 () Bool)

(declare-fun e!406341 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!725624 (= e!406341 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!406343 () Bool)

(assert (=> b!725624 e!406343))

(declare-fun res!486705 () Bool)

(assert (=> b!725624 (=> (not res!486705) (not e!406343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41010 (_ BitVec 32)) Bool)

(assert (=> b!725624 (= res!486705 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24770 0))(
  ( (Unit!24771) )
))
(declare-fun lt!321408 () Unit!24770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24770)

(assert (=> b!725624 (= lt!321408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725625 () Bool)

(declare-fun res!486704 () Bool)

(declare-fun e!406336 () Bool)

(assert (=> b!725625 (=> (not res!486704) (not e!406336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725625 (= res!486704 (validKeyInArray!0 (select (arr!19626 a!3186) j!159)))))

(declare-fun res!486710 () Bool)

(assert (=> start!64492 (=> (not res!486710) (not e!406336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64492 (= res!486710 (validMask!0 mask!3328))))

(assert (=> start!64492 e!406336))

(assert (=> start!64492 true))

(declare-fun array_inv!15422 (array!41010) Bool)

(assert (=> start!64492 (array_inv!15422 a!3186)))

(declare-fun b!725626 () Bool)

(declare-fun res!486709 () Bool)

(declare-fun e!406342 () Bool)

(assert (=> b!725626 (=> (not res!486709) (not e!406342))))

(declare-datatypes ((List!13628 0))(
  ( (Nil!13625) (Cons!13624 (h!14681 (_ BitVec 64)) (t!19943 List!13628)) )
))
(declare-fun arrayNoDuplicates!0 (array!41010 (_ BitVec 32) List!13628) Bool)

(assert (=> b!725626 (= res!486709 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13625))))

(declare-fun b!725627 () Bool)

(declare-fun res!486700 () Bool)

(assert (=> b!725627 (=> (not res!486700) (not e!406342))))

(assert (=> b!725627 (= res!486700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!321409 () SeekEntryResult!7226)

(declare-fun b!725628 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41010 (_ BitVec 32)) SeekEntryResult!7226)

(assert (=> b!725628 (= e!406337 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19626 a!3186) j!159) a!3186 mask!3328) lt!321409))))

(declare-fun b!725629 () Bool)

(declare-fun res!486712 () Bool)

(assert (=> b!725629 (=> (not res!486712) (not e!406336))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725629 (= res!486712 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725630 () Bool)

(assert (=> b!725630 (= e!406343 e!406339)))

(declare-fun res!486713 () Bool)

(assert (=> b!725630 (=> (not res!486713) (not e!406339))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41010 (_ BitVec 32)) SeekEntryResult!7226)

(assert (=> b!725630 (= res!486713 (= (seekEntryOrOpen!0 (select (arr!19626 a!3186) j!159) a!3186 mask!3328) lt!321410))))

(assert (=> b!725630 (= lt!321410 (Found!7226 j!159))))

(declare-fun b!725631 () Bool)

(declare-fun res!486711 () Bool)

(assert (=> b!725631 (=> (not res!486711) (not e!406336))))

(assert (=> b!725631 (= res!486711 (and (= (size!20047 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20047 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20047 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725632 () Bool)

(declare-fun res!486703 () Bool)

(assert (=> b!725632 (=> (not res!486703) (not e!406336))))

(assert (=> b!725632 (= res!486703 (validKeyInArray!0 k!2102))))

(declare-fun b!725633 () Bool)

(assert (=> b!725633 (= e!406338 e!406341)))

(declare-fun res!486707 () Bool)

(assert (=> b!725633 (=> (not res!486707) (not e!406341))))

(declare-fun lt!321411 () (_ BitVec 64))

(declare-fun lt!321413 () array!41010)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725633 (= res!486707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321411 mask!3328) lt!321411 lt!321413 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321411 lt!321413 mask!3328)))))

(assert (=> b!725633 (= lt!321411 (select (store (arr!19626 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725633 (= lt!321413 (array!41011 (store (arr!19626 a!3186) i!1173 k!2102) (size!20047 a!3186)))))

(declare-fun b!725634 () Bool)

(assert (=> b!725634 (= e!406337 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19626 a!3186) j!159) a!3186 mask!3328) (Found!7226 j!159)))))

(declare-fun b!725635 () Bool)

(declare-fun res!486702 () Bool)

(assert (=> b!725635 (=> (not res!486702) (not e!406342))))

(assert (=> b!725635 (= res!486702 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20047 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20047 a!3186))))))

(declare-fun b!725636 () Bool)

(assert (=> b!725636 (= e!406342 e!406338)))

(declare-fun res!486706 () Bool)

(assert (=> b!725636 (=> (not res!486706) (not e!406338))))

(assert (=> b!725636 (= res!486706 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19626 a!3186) j!159) mask!3328) (select (arr!19626 a!3186) j!159) a!3186 mask!3328) lt!321409))))

(assert (=> b!725636 (= lt!321409 (Intermediate!7226 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725637 () Bool)

(assert (=> b!725637 (= e!406336 e!406342)))

(declare-fun res!486701 () Bool)

(assert (=> b!725637 (=> (not res!486701) (not e!406342))))

(declare-fun lt!321412 () SeekEntryResult!7226)

(assert (=> b!725637 (= res!486701 (or (= lt!321412 (MissingZero!7226 i!1173)) (= lt!321412 (MissingVacant!7226 i!1173))))))

(assert (=> b!725637 (= lt!321412 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64492 res!486710) b!725631))

(assert (= (and b!725631 res!486711) b!725625))

(assert (= (and b!725625 res!486704) b!725632))

(assert (= (and b!725632 res!486703) b!725629))

(assert (= (and b!725629 res!486712) b!725637))

(assert (= (and b!725637 res!486701) b!725627))

(assert (= (and b!725627 res!486700) b!725626))

(assert (= (and b!725626 res!486709) b!725635))

(assert (= (and b!725635 res!486702) b!725636))

(assert (= (and b!725636 res!486706) b!725622))

(assert (= (and b!725622 res!486699) b!725623))

(assert (= (and b!725623 c!79834) b!725628))

(assert (= (and b!725623 (not c!79834)) b!725634))

(assert (= (and b!725623 res!486708) b!725633))

(assert (= (and b!725633 res!486707) b!725624))

(assert (= (and b!725624 res!486705) b!725630))

(assert (= (and b!725630 res!486713) b!725621))

(declare-fun m!679765 () Bool)

(assert (=> b!725624 m!679765))

(declare-fun m!679767 () Bool)

(assert (=> b!725624 m!679767))

(declare-fun m!679769 () Bool)

(assert (=> b!725627 m!679769))

(declare-fun m!679771 () Bool)

(assert (=> b!725621 m!679771))

(assert (=> b!725621 m!679771))

(declare-fun m!679773 () Bool)

(assert (=> b!725621 m!679773))

(declare-fun m!679775 () Bool)

(assert (=> b!725629 m!679775))

(assert (=> b!725630 m!679771))

(assert (=> b!725630 m!679771))

(declare-fun m!679777 () Bool)

(assert (=> b!725630 m!679777))

(assert (=> b!725634 m!679771))

(assert (=> b!725634 m!679771))

(declare-fun m!679779 () Bool)

(assert (=> b!725634 m!679779))

(assert (=> b!725636 m!679771))

(assert (=> b!725636 m!679771))

(declare-fun m!679781 () Bool)

(assert (=> b!725636 m!679781))

(assert (=> b!725636 m!679781))

(assert (=> b!725636 m!679771))

(declare-fun m!679783 () Bool)

(assert (=> b!725636 m!679783))

(assert (=> b!725625 m!679771))

(assert (=> b!725625 m!679771))

(declare-fun m!679785 () Bool)

(assert (=> b!725625 m!679785))

(assert (=> b!725628 m!679771))

(assert (=> b!725628 m!679771))

(declare-fun m!679787 () Bool)

(assert (=> b!725628 m!679787))

(declare-fun m!679789 () Bool)

(assert (=> b!725632 m!679789))

(declare-fun m!679791 () Bool)

(assert (=> b!725633 m!679791))

(declare-fun m!679793 () Bool)

(assert (=> b!725633 m!679793))

(declare-fun m!679795 () Bool)

(assert (=> b!725633 m!679795))

(declare-fun m!679797 () Bool)

(assert (=> b!725633 m!679797))

(declare-fun m!679799 () Bool)

(assert (=> b!725633 m!679799))

(assert (=> b!725633 m!679793))

(declare-fun m!679801 () Bool)

(assert (=> b!725637 m!679801))

(declare-fun m!679803 () Bool)

(assert (=> b!725626 m!679803))

(declare-fun m!679805 () Bool)

(assert (=> start!64492 m!679805))

(declare-fun m!679807 () Bool)

(assert (=> start!64492 m!679807))

(declare-fun m!679809 () Bool)

(assert (=> b!725622 m!679809))

(push 1)

(assert (not b!725626))

(assert (not b!725634))

(assert (not b!725624))

(assert (not b!725633))

(assert (not b!725637))

(assert (not b!725627))

(assert (not b!725632))

(assert (not b!725625))

(assert (not b!725630))

(assert (not b!725629))

(assert (not start!64492))

(assert (not b!725628))

(assert (not b!725621))

(assert (not b!725636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

