; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64704 () Bool)

(assert start!64704)

(declare-fun b!729766 () Bool)

(declare-fun res!490145 () Bool)

(declare-fun e!408427 () Bool)

(assert (=> b!729766 (=> (not res!490145) (not e!408427))))

(declare-datatypes ((array!41153 0))(
  ( (array!41154 (arr!19696 (Array (_ BitVec 32) (_ BitVec 64))) (size!20117 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41153)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729766 (= res!490145 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729767 () Bool)

(declare-fun res!490135 () Bool)

(assert (=> b!729767 (=> (not res!490135) (not e!408427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729767 (= res!490135 (validKeyInArray!0 k0!2102))))

(declare-datatypes ((SeekEntryResult!7296 0))(
  ( (MissingZero!7296 (index!31552 (_ BitVec 32))) (Found!7296 (index!31553 (_ BitVec 32))) (Intermediate!7296 (undefined!8108 Bool) (index!31554 (_ BitVec 32)) (x!62534 (_ BitVec 32))) (Undefined!7296) (MissingVacant!7296 (index!31555 (_ BitVec 32))) )
))
(declare-fun lt!323328 () SeekEntryResult!7296)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!729768 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!408431 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41153 (_ BitVec 32)) SeekEntryResult!7296)

(assert (=> b!729768 (= e!408431 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19696 a!3186) j!159) a!3186 mask!3328) lt!323328))))

(declare-fun b!729769 () Bool)

(declare-fun e!408430 () Bool)

(declare-fun e!408429 () Bool)

(assert (=> b!729769 (= e!408430 e!408429)))

(declare-fun res!490143 () Bool)

(assert (=> b!729769 (=> (not res!490143) (not e!408429))))

(declare-fun lt!323330 () SeekEntryResult!7296)

(declare-fun lt!323331 () SeekEntryResult!7296)

(assert (=> b!729769 (= res!490143 (= lt!323330 lt!323331))))

(declare-fun lt!323329 () array!41153)

(declare-fun lt!323325 () (_ BitVec 64))

(assert (=> b!729769 (= lt!323331 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323325 lt!323329 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729769 (= lt!323330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323325 mask!3328) lt!323325 lt!323329 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729769 (= lt!323325 (select (store (arr!19696 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729769 (= lt!323329 (array!41154 (store (arr!19696 a!3186) i!1173 k0!2102) (size!20117 a!3186)))))

(declare-fun res!490144 () Bool)

(assert (=> start!64704 (=> (not res!490144) (not e!408427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64704 (= res!490144 (validMask!0 mask!3328))))

(assert (=> start!64704 e!408427))

(assert (=> start!64704 true))

(declare-fun array_inv!15492 (array!41153) Bool)

(assert (=> start!64704 (array_inv!15492 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!729770 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41153 (_ BitVec 32)) SeekEntryResult!7296)

(assert (=> b!729770 (= e!408431 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19696 a!3186) j!159) a!3186 mask!3328) (Found!7296 j!159)))))

(declare-fun b!729771 () Bool)

(declare-fun e!408432 () Bool)

(assert (=> b!729771 (= e!408432 true)))

(declare-fun lt!323327 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729771 (= lt!323327 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729772 () Bool)

(declare-fun e!408434 () Bool)

(assert (=> b!729772 (= e!408427 e!408434)))

(declare-fun res!490142 () Bool)

(assert (=> b!729772 (=> (not res!490142) (not e!408434))))

(declare-fun lt!323332 () SeekEntryResult!7296)

(assert (=> b!729772 (= res!490142 (or (= lt!323332 (MissingZero!7296 i!1173)) (= lt!323332 (MissingVacant!7296 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41153 (_ BitVec 32)) SeekEntryResult!7296)

(assert (=> b!729772 (= lt!323332 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729773 () Bool)

(declare-fun e!408428 () Bool)

(declare-fun e!408433 () Bool)

(assert (=> b!729773 (= e!408428 e!408433)))

(declare-fun res!490133 () Bool)

(assert (=> b!729773 (=> (not res!490133) (not e!408433))))

(declare-fun lt!323326 () SeekEntryResult!7296)

(assert (=> b!729773 (= res!490133 (= (seekEntryOrOpen!0 (select (arr!19696 a!3186) j!159) a!3186 mask!3328) lt!323326))))

(assert (=> b!729773 (= lt!323326 (Found!7296 j!159))))

(declare-fun b!729774 () Bool)

(declare-fun res!490146 () Bool)

(assert (=> b!729774 (=> (not res!490146) (not e!408434))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729774 (= res!490146 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20117 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20117 a!3186))))))

(declare-fun b!729775 () Bool)

(declare-fun res!490140 () Bool)

(assert (=> b!729775 (=> (not res!490140) (not e!408434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41153 (_ BitVec 32)) Bool)

(assert (=> b!729775 (= res!490140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729776 () Bool)

(assert (=> b!729776 (= e!408429 (not e!408432))))

(declare-fun res!490139 () Bool)

(assert (=> b!729776 (=> res!490139 e!408432)))

(get-info :version)

(assert (=> b!729776 (= res!490139 (or (not ((_ is Intermediate!7296) lt!323331)) (bvsge x!1131 (x!62534 lt!323331))))))

(assert (=> b!729776 e!408428))

(declare-fun res!490147 () Bool)

(assert (=> b!729776 (=> (not res!490147) (not e!408428))))

(assert (=> b!729776 (= res!490147 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24910 0))(
  ( (Unit!24911) )
))
(declare-fun lt!323333 () Unit!24910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24910)

(assert (=> b!729776 (= lt!323333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729777 () Bool)

(assert (=> b!729777 (= e!408434 e!408430)))

(declare-fun res!490137 () Bool)

(assert (=> b!729777 (=> (not res!490137) (not e!408430))))

(assert (=> b!729777 (= res!490137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19696 a!3186) j!159) mask!3328) (select (arr!19696 a!3186) j!159) a!3186 mask!3328) lt!323328))))

(assert (=> b!729777 (= lt!323328 (Intermediate!7296 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729778 () Bool)

(declare-fun res!490136 () Bool)

(assert (=> b!729778 (=> (not res!490136) (not e!408427))))

(assert (=> b!729778 (= res!490136 (and (= (size!20117 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20117 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20117 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729779 () Bool)

(declare-fun res!490138 () Bool)

(assert (=> b!729779 (=> (not res!490138) (not e!408427))))

(assert (=> b!729779 (= res!490138 (validKeyInArray!0 (select (arr!19696 a!3186) j!159)))))

(declare-fun b!729780 () Bool)

(declare-fun res!490148 () Bool)

(assert (=> b!729780 (=> (not res!490148) (not e!408434))))

(declare-datatypes ((List!13698 0))(
  ( (Nil!13695) (Cons!13694 (h!14754 (_ BitVec 64)) (t!20013 List!13698)) )
))
(declare-fun arrayNoDuplicates!0 (array!41153 (_ BitVec 32) List!13698) Bool)

(assert (=> b!729780 (= res!490148 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13695))))

(declare-fun b!729781 () Bool)

(declare-fun res!490141 () Bool)

(assert (=> b!729781 (=> (not res!490141) (not e!408430))))

(assert (=> b!729781 (= res!490141 e!408431)))

(declare-fun c!80191 () Bool)

(assert (=> b!729781 (= c!80191 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729782 () Bool)

(assert (=> b!729782 (= e!408433 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19696 a!3186) j!159) a!3186 mask!3328) lt!323326))))

(declare-fun b!729783 () Bool)

(declare-fun res!490134 () Bool)

(assert (=> b!729783 (=> (not res!490134) (not e!408430))))

(assert (=> b!729783 (= res!490134 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19696 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64704 res!490144) b!729778))

(assert (= (and b!729778 res!490136) b!729779))

(assert (= (and b!729779 res!490138) b!729767))

(assert (= (and b!729767 res!490135) b!729766))

(assert (= (and b!729766 res!490145) b!729772))

(assert (= (and b!729772 res!490142) b!729775))

(assert (= (and b!729775 res!490140) b!729780))

(assert (= (and b!729780 res!490148) b!729774))

(assert (= (and b!729774 res!490146) b!729777))

(assert (= (and b!729777 res!490137) b!729783))

(assert (= (and b!729783 res!490134) b!729781))

(assert (= (and b!729781 c!80191) b!729768))

(assert (= (and b!729781 (not c!80191)) b!729770))

(assert (= (and b!729781 res!490141) b!729769))

(assert (= (and b!729769 res!490143) b!729776))

(assert (= (and b!729776 res!490147) b!729773))

(assert (= (and b!729773 res!490133) b!729782))

(assert (= (and b!729776 (not res!490139)) b!729771))

(declare-fun m!683371 () Bool)

(assert (=> b!729777 m!683371))

(assert (=> b!729777 m!683371))

(declare-fun m!683373 () Bool)

(assert (=> b!729777 m!683373))

(assert (=> b!729777 m!683373))

(assert (=> b!729777 m!683371))

(declare-fun m!683375 () Bool)

(assert (=> b!729777 m!683375))

(assert (=> b!729773 m!683371))

(assert (=> b!729773 m!683371))

(declare-fun m!683377 () Bool)

(assert (=> b!729773 m!683377))

(declare-fun m!683379 () Bool)

(assert (=> b!729775 m!683379))

(declare-fun m!683381 () Bool)

(assert (=> b!729771 m!683381))

(declare-fun m!683383 () Bool)

(assert (=> b!729772 m!683383))

(declare-fun m!683385 () Bool)

(assert (=> b!729780 m!683385))

(assert (=> b!729779 m!683371))

(assert (=> b!729779 m!683371))

(declare-fun m!683387 () Bool)

(assert (=> b!729779 m!683387))

(declare-fun m!683389 () Bool)

(assert (=> b!729776 m!683389))

(declare-fun m!683391 () Bool)

(assert (=> b!729776 m!683391))

(assert (=> b!729782 m!683371))

(assert (=> b!729782 m!683371))

(declare-fun m!683393 () Bool)

(assert (=> b!729782 m!683393))

(assert (=> b!729770 m!683371))

(assert (=> b!729770 m!683371))

(declare-fun m!683395 () Bool)

(assert (=> b!729770 m!683395))

(declare-fun m!683397 () Bool)

(assert (=> b!729767 m!683397))

(declare-fun m!683399 () Bool)

(assert (=> b!729766 m!683399))

(declare-fun m!683401 () Bool)

(assert (=> start!64704 m!683401))

(declare-fun m!683403 () Bool)

(assert (=> start!64704 m!683403))

(declare-fun m!683405 () Bool)

(assert (=> b!729769 m!683405))

(declare-fun m!683407 () Bool)

(assert (=> b!729769 m!683407))

(declare-fun m!683409 () Bool)

(assert (=> b!729769 m!683409))

(declare-fun m!683411 () Bool)

(assert (=> b!729769 m!683411))

(declare-fun m!683413 () Bool)

(assert (=> b!729769 m!683413))

(assert (=> b!729769 m!683407))

(assert (=> b!729768 m!683371))

(assert (=> b!729768 m!683371))

(declare-fun m!683415 () Bool)

(assert (=> b!729768 m!683415))

(declare-fun m!683417 () Bool)

(assert (=> b!729783 m!683417))

(check-sat (not start!64704) (not b!729777) (not b!729773) (not b!729780) (not b!729776) (not b!729768) (not b!729770) (not b!729772) (not b!729766) (not b!729775) (not b!729779) (not b!729767) (not b!729782) (not b!729771) (not b!729769))
(check-sat)
