; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67136 () Bool)

(assert start!67136)

(declare-fun b!775682 () Bool)

(declare-fun res!524570 () Bool)

(declare-fun e!431696 () Bool)

(assert (=> b!775682 (=> (not res!524570) (not e!431696))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42491 0))(
  ( (array!42492 (arr!20341 (Array (_ BitVec 32) (_ BitVec 64))) (size!20762 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42491)

(assert (=> b!775682 (= res!524570 (and (= (size!20762 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20762 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20762 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!524577 () Bool)

(assert (=> start!67136 (=> (not res!524577) (not e!431696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67136 (= res!524577 (validMask!0 mask!3328))))

(assert (=> start!67136 e!431696))

(assert (=> start!67136 true))

(declare-fun array_inv!16137 (array!42491) Bool)

(assert (=> start!67136 (array_inv!16137 a!3186)))

(declare-fun b!775683 () Bool)

(declare-fun res!524580 () Bool)

(assert (=> b!775683 (=> (not res!524580) (not e!431696))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775683 (= res!524580 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775684 () Bool)

(declare-fun res!524582 () Bool)

(declare-fun e!431691 () Bool)

(assert (=> b!775684 (=> (not res!524582) (not e!431691))))

(declare-fun e!431695 () Bool)

(assert (=> b!775684 (= res!524582 e!431695)))

(declare-fun c!85957 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775684 (= c!85957 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775685 () Bool)

(declare-fun e!431692 () Bool)

(assert (=> b!775685 (= e!431692 (not true))))

(declare-fun e!431694 () Bool)

(assert (=> b!775685 e!431694))

(declare-fun res!524576 () Bool)

(assert (=> b!775685 (=> (not res!524576) (not e!431694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42491 (_ BitVec 32)) Bool)

(assert (=> b!775685 (= res!524576 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26776 0))(
  ( (Unit!26777) )
))
(declare-fun lt!345552 () Unit!26776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26776)

(assert (=> b!775685 (= lt!345552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775686 () Bool)

(declare-fun res!524579 () Bool)

(assert (=> b!775686 (=> (not res!524579) (not e!431696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775686 (= res!524579 (validKeyInArray!0 (select (arr!20341 a!3186) j!159)))))

(declare-fun b!775687 () Bool)

(assert (=> b!775687 (= e!431691 e!431692)))

(declare-fun res!524578 () Bool)

(assert (=> b!775687 (=> (not res!524578) (not e!431692))))

(declare-fun lt!345553 () array!42491)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!345557 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7941 0))(
  ( (MissingZero!7941 (index!34132 (_ BitVec 32))) (Found!7941 (index!34133 (_ BitVec 32))) (Intermediate!7941 (undefined!8753 Bool) (index!34134 (_ BitVec 32)) (x!65076 (_ BitVec 32))) (Undefined!7941) (MissingVacant!7941 (index!34135 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42491 (_ BitVec 32)) SeekEntryResult!7941)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775687 (= res!524578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345557 mask!3328) lt!345557 lt!345553 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345557 lt!345553 mask!3328)))))

(assert (=> b!775687 (= lt!345557 (select (store (arr!20341 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775687 (= lt!345553 (array!42492 (store (arr!20341 a!3186) i!1173 k0!2102) (size!20762 a!3186)))))

(declare-fun lt!345554 () SeekEntryResult!7941)

(declare-fun b!775688 () Bool)

(assert (=> b!775688 (= e!431695 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20341 a!3186) j!159) a!3186 mask!3328) lt!345554))))

(declare-fun b!775689 () Bool)

(declare-fun res!524573 () Bool)

(declare-fun e!431693 () Bool)

(assert (=> b!775689 (=> (not res!524573) (not e!431693))))

(declare-datatypes ((List!14343 0))(
  ( (Nil!14340) (Cons!14339 (h!15447 (_ BitVec 64)) (t!20658 List!14343)) )
))
(declare-fun arrayNoDuplicates!0 (array!42491 (_ BitVec 32) List!14343) Bool)

(assert (=> b!775689 (= res!524573 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14340))))

(declare-fun b!775690 () Bool)

(assert (=> b!775690 (= e!431693 e!431691)))

(declare-fun res!524568 () Bool)

(assert (=> b!775690 (=> (not res!524568) (not e!431691))))

(assert (=> b!775690 (= res!524568 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20341 a!3186) j!159) mask!3328) (select (arr!20341 a!3186) j!159) a!3186 mask!3328) lt!345554))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!775690 (= lt!345554 (Intermediate!7941 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775691 () Bool)

(declare-fun e!431690 () Bool)

(assert (=> b!775691 (= e!431694 e!431690)))

(declare-fun res!524569 () Bool)

(assert (=> b!775691 (=> (not res!524569) (not e!431690))))

(declare-fun lt!345555 () SeekEntryResult!7941)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42491 (_ BitVec 32)) SeekEntryResult!7941)

(assert (=> b!775691 (= res!524569 (= (seekEntryOrOpen!0 (select (arr!20341 a!3186) j!159) a!3186 mask!3328) lt!345555))))

(assert (=> b!775691 (= lt!345555 (Found!7941 j!159))))

(declare-fun b!775692 () Bool)

(declare-fun res!524581 () Bool)

(assert (=> b!775692 (=> (not res!524581) (not e!431691))))

(assert (=> b!775692 (= res!524581 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20341 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775693 () Bool)

(declare-fun res!524571 () Bool)

(assert (=> b!775693 (=> (not res!524571) (not e!431696))))

(assert (=> b!775693 (= res!524571 (validKeyInArray!0 k0!2102))))

(declare-fun b!775694 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42491 (_ BitVec 32)) SeekEntryResult!7941)

(assert (=> b!775694 (= e!431690 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20341 a!3186) j!159) a!3186 mask!3328) lt!345555))))

(declare-fun b!775695 () Bool)

(assert (=> b!775695 (= e!431696 e!431693)))

(declare-fun res!524575 () Bool)

(assert (=> b!775695 (=> (not res!524575) (not e!431693))))

(declare-fun lt!345556 () SeekEntryResult!7941)

(assert (=> b!775695 (= res!524575 (or (= lt!345556 (MissingZero!7941 i!1173)) (= lt!345556 (MissingVacant!7941 i!1173))))))

(assert (=> b!775695 (= lt!345556 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775696 () Bool)

(declare-fun res!524574 () Bool)

(assert (=> b!775696 (=> (not res!524574) (not e!431693))))

(assert (=> b!775696 (= res!524574 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20762 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20762 a!3186))))))

(declare-fun b!775697 () Bool)

(declare-fun res!524572 () Bool)

(assert (=> b!775697 (=> (not res!524572) (not e!431693))))

(assert (=> b!775697 (= res!524572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775698 () Bool)

(assert (=> b!775698 (= e!431695 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20341 a!3186) j!159) a!3186 mask!3328) (Found!7941 j!159)))))

(assert (= (and start!67136 res!524577) b!775682))

(assert (= (and b!775682 res!524570) b!775686))

(assert (= (and b!775686 res!524579) b!775693))

(assert (= (and b!775693 res!524571) b!775683))

(assert (= (and b!775683 res!524580) b!775695))

(assert (= (and b!775695 res!524575) b!775697))

(assert (= (and b!775697 res!524572) b!775689))

(assert (= (and b!775689 res!524573) b!775696))

(assert (= (and b!775696 res!524574) b!775690))

(assert (= (and b!775690 res!524568) b!775692))

(assert (= (and b!775692 res!524581) b!775684))

(assert (= (and b!775684 c!85957) b!775688))

(assert (= (and b!775684 (not c!85957)) b!775698))

(assert (= (and b!775684 res!524582) b!775687))

(assert (= (and b!775687 res!524578) b!775685))

(assert (= (and b!775685 res!524576) b!775691))

(assert (= (and b!775691 res!524569) b!775694))

(declare-fun m!719871 () Bool)

(assert (=> b!775687 m!719871))

(declare-fun m!719873 () Bool)

(assert (=> b!775687 m!719873))

(declare-fun m!719875 () Bool)

(assert (=> b!775687 m!719875))

(declare-fun m!719877 () Bool)

(assert (=> b!775687 m!719877))

(assert (=> b!775687 m!719871))

(declare-fun m!719879 () Bool)

(assert (=> b!775687 m!719879))

(declare-fun m!719881 () Bool)

(assert (=> b!775683 m!719881))

(declare-fun m!719883 () Bool)

(assert (=> b!775686 m!719883))

(assert (=> b!775686 m!719883))

(declare-fun m!719885 () Bool)

(assert (=> b!775686 m!719885))

(assert (=> b!775698 m!719883))

(assert (=> b!775698 m!719883))

(declare-fun m!719887 () Bool)

(assert (=> b!775698 m!719887))

(assert (=> b!775694 m!719883))

(assert (=> b!775694 m!719883))

(declare-fun m!719889 () Bool)

(assert (=> b!775694 m!719889))

(declare-fun m!719891 () Bool)

(assert (=> b!775693 m!719891))

(declare-fun m!719893 () Bool)

(assert (=> b!775692 m!719893))

(declare-fun m!719895 () Bool)

(assert (=> b!775697 m!719895))

(assert (=> b!775691 m!719883))

(assert (=> b!775691 m!719883))

(declare-fun m!719897 () Bool)

(assert (=> b!775691 m!719897))

(declare-fun m!719899 () Bool)

(assert (=> b!775689 m!719899))

(declare-fun m!719901 () Bool)

(assert (=> b!775695 m!719901))

(assert (=> b!775688 m!719883))

(assert (=> b!775688 m!719883))

(declare-fun m!719903 () Bool)

(assert (=> b!775688 m!719903))

(declare-fun m!719905 () Bool)

(assert (=> start!67136 m!719905))

(declare-fun m!719907 () Bool)

(assert (=> start!67136 m!719907))

(assert (=> b!775690 m!719883))

(assert (=> b!775690 m!719883))

(declare-fun m!719909 () Bool)

(assert (=> b!775690 m!719909))

(assert (=> b!775690 m!719909))

(assert (=> b!775690 m!719883))

(declare-fun m!719911 () Bool)

(assert (=> b!775690 m!719911))

(declare-fun m!719913 () Bool)

(assert (=> b!775685 m!719913))

(declare-fun m!719915 () Bool)

(assert (=> b!775685 m!719915))

(check-sat (not b!775694) (not b!775695) (not b!775697) (not b!775693) (not start!67136) (not b!775698) (not b!775685) (not b!775689) (not b!775690) (not b!775687) (not b!775686) (not b!775683) (not b!775691) (not b!775688))
(check-sat)
