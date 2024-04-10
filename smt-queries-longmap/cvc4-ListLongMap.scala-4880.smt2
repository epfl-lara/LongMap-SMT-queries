; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67264 () Bool)

(assert start!67264)

(declare-fun res!526243 () Bool)

(declare-fun e!432783 () Bool)

(assert (=> start!67264 (=> (not res!526243) (not e!432783))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67264 (= res!526243 (validMask!0 mask!3328))))

(assert (=> start!67264 e!432783))

(assert (=> start!67264 true))

(declare-datatypes ((array!42556 0))(
  ( (array!42557 (arr!20372 (Array (_ BitVec 32) (_ BitVec 64))) (size!20793 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42556)

(declare-fun array_inv!16168 (array!42556) Bool)

(assert (=> start!67264 (array_inv!16168 a!3186)))

(declare-fun b!777839 () Bool)

(declare-fun e!432790 () Bool)

(declare-fun e!432789 () Bool)

(assert (=> b!777839 (= e!432790 (not e!432789))))

(declare-fun res!526240 () Bool)

(assert (=> b!777839 (=> res!526240 e!432789)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7972 0))(
  ( (MissingZero!7972 (index!34256 (_ BitVec 32))) (Found!7972 (index!34257 (_ BitVec 32))) (Intermediate!7972 (undefined!8784 Bool) (index!34258 (_ BitVec 32)) (x!65196 (_ BitVec 32))) (Undefined!7972) (MissingVacant!7972 (index!34259 (_ BitVec 32))) )
))
(declare-fun lt!346547 () SeekEntryResult!7972)

(assert (=> b!777839 (= res!526240 (or (not (is-Intermediate!7972 lt!346547)) (bvslt x!1131 (x!65196 lt!346547)) (not (= x!1131 (x!65196 lt!346547))) (not (= index!1321 (index!34258 lt!346547)))))))

(declare-fun e!432784 () Bool)

(assert (=> b!777839 e!432784))

(declare-fun res!526231 () Bool)

(assert (=> b!777839 (=> (not res!526231) (not e!432784))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42556 (_ BitVec 32)) Bool)

(assert (=> b!777839 (= res!526231 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26838 0))(
  ( (Unit!26839) )
))
(declare-fun lt!346545 () Unit!26838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26838)

(assert (=> b!777839 (= lt!346545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777840 () Bool)

(declare-fun res!526241 () Bool)

(declare-fun e!432788 () Bool)

(assert (=> b!777840 (=> (not res!526241) (not e!432788))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777840 (= res!526241 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20372 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777841 () Bool)

(declare-fun res!526235 () Bool)

(assert (=> b!777841 (=> (not res!526235) (not e!432783))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777841 (= res!526235 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777842 () Bool)

(declare-fun e!432791 () Bool)

(assert (=> b!777842 (= e!432783 e!432791)))

(declare-fun res!526237 () Bool)

(assert (=> b!777842 (=> (not res!526237) (not e!432791))))

(declare-fun lt!346542 () SeekEntryResult!7972)

(assert (=> b!777842 (= res!526237 (or (= lt!346542 (MissingZero!7972 i!1173)) (= lt!346542 (MissingVacant!7972 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42556 (_ BitVec 32)) SeekEntryResult!7972)

(assert (=> b!777842 (= lt!346542 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!777843 () Bool)

(declare-fun lt!346548 () SeekEntryResult!7972)

(declare-fun e!432786 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42556 (_ BitVec 32)) SeekEntryResult!7972)

(assert (=> b!777843 (= e!432786 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) lt!346548))))

(declare-fun b!777844 () Bool)

(declare-fun res!526246 () Bool)

(assert (=> b!777844 (=> res!526246 e!432789)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42556 (_ BitVec 32)) SeekEntryResult!7972)

(assert (=> b!777844 (= res!526246 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) (Found!7972 j!159))))))

(declare-fun b!777845 () Bool)

(declare-fun res!526239 () Bool)

(assert (=> b!777845 (=> (not res!526239) (not e!432783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777845 (= res!526239 (validKeyInArray!0 (select (arr!20372 a!3186) j!159)))))

(declare-fun lt!346546 () SeekEntryResult!7972)

(declare-fun e!432787 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!777846 () Bool)

(assert (=> b!777846 (= e!432787 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) lt!346546))))

(declare-fun b!777847 () Bool)

(assert (=> b!777847 (= e!432791 e!432788)))

(declare-fun res!526247 () Bool)

(assert (=> b!777847 (=> (not res!526247) (not e!432788))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777847 (= res!526247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20372 a!3186) j!159) mask!3328) (select (arr!20372 a!3186) j!159) a!3186 mask!3328) lt!346548))))

(assert (=> b!777847 (= lt!346548 (Intermediate!7972 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777848 () Bool)

(assert (=> b!777848 (= e!432786 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) (Found!7972 j!159)))))

(declare-fun b!777849 () Bool)

(assert (=> b!777849 (= e!432788 e!432790)))

(declare-fun res!526232 () Bool)

(assert (=> b!777849 (=> (not res!526232) (not e!432790))))

(declare-fun lt!346550 () SeekEntryResult!7972)

(assert (=> b!777849 (= res!526232 (= lt!346550 lt!346547))))

(declare-fun lt!346544 () (_ BitVec 64))

(declare-fun lt!346543 () array!42556)

(assert (=> b!777849 (= lt!346547 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346544 lt!346543 mask!3328))))

(assert (=> b!777849 (= lt!346550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346544 mask!3328) lt!346544 lt!346543 mask!3328))))

(assert (=> b!777849 (= lt!346544 (select (store (arr!20372 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!777849 (= lt!346543 (array!42557 (store (arr!20372 a!3186) i!1173 k!2102) (size!20793 a!3186)))))

(declare-fun b!777850 () Bool)

(declare-fun res!526233 () Bool)

(assert (=> b!777850 (=> (not res!526233) (not e!432783))))

(assert (=> b!777850 (= res!526233 (validKeyInArray!0 k!2102))))

(declare-fun b!777851 () Bool)

(declare-fun res!526245 () Bool)

(assert (=> b!777851 (=> (not res!526245) (not e!432791))))

(assert (=> b!777851 (= res!526245 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20793 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20793 a!3186))))))

(declare-fun b!777852 () Bool)

(assert (=> b!777852 (= e!432789 true)))

(declare-fun lt!346549 () SeekEntryResult!7972)

(assert (=> b!777852 (= lt!346549 (seekEntryOrOpen!0 lt!346544 lt!346543 mask!3328))))

(declare-fun b!777853 () Bool)

(declare-fun res!526234 () Bool)

(assert (=> b!777853 (=> (not res!526234) (not e!432783))))

(assert (=> b!777853 (= res!526234 (and (= (size!20793 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20793 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20793 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777854 () Bool)

(declare-fun res!526230 () Bool)

(assert (=> b!777854 (=> (not res!526230) (not e!432791))))

(declare-datatypes ((List!14374 0))(
  ( (Nil!14371) (Cons!14370 (h!15481 (_ BitVec 64)) (t!20689 List!14374)) )
))
(declare-fun arrayNoDuplicates!0 (array!42556 (_ BitVec 32) List!14374) Bool)

(assert (=> b!777854 (= res!526230 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14371))))

(declare-fun b!777855 () Bool)

(declare-fun res!526244 () Bool)

(assert (=> b!777855 (=> (not res!526244) (not e!432791))))

(assert (=> b!777855 (= res!526244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777856 () Bool)

(declare-fun res!526238 () Bool)

(assert (=> b!777856 (=> (not res!526238) (not e!432788))))

(assert (=> b!777856 (= res!526238 e!432786)))

(declare-fun c!86206 () Bool)

(assert (=> b!777856 (= c!86206 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777857 () Bool)

(declare-fun res!526242 () Bool)

(assert (=> b!777857 (=> res!526242 e!432789)))

(assert (=> b!777857 (= res!526242 (or (not (= (select (store (arr!20372 a!3186) i!1173 k!2102) index!1321) lt!346544)) (undefined!8784 lt!346547)))))

(declare-fun b!777858 () Bool)

(assert (=> b!777858 (= e!432784 e!432787)))

(declare-fun res!526236 () Bool)

(assert (=> b!777858 (=> (not res!526236) (not e!432787))))

(assert (=> b!777858 (= res!526236 (= (seekEntryOrOpen!0 (select (arr!20372 a!3186) j!159) a!3186 mask!3328) lt!346546))))

(assert (=> b!777858 (= lt!346546 (Found!7972 j!159))))

(assert (= (and start!67264 res!526243) b!777853))

(assert (= (and b!777853 res!526234) b!777845))

(assert (= (and b!777845 res!526239) b!777850))

(assert (= (and b!777850 res!526233) b!777841))

(assert (= (and b!777841 res!526235) b!777842))

(assert (= (and b!777842 res!526237) b!777855))

(assert (= (and b!777855 res!526244) b!777854))

(assert (= (and b!777854 res!526230) b!777851))

(assert (= (and b!777851 res!526245) b!777847))

(assert (= (and b!777847 res!526247) b!777840))

(assert (= (and b!777840 res!526241) b!777856))

(assert (= (and b!777856 c!86206) b!777843))

(assert (= (and b!777856 (not c!86206)) b!777848))

(assert (= (and b!777856 res!526238) b!777849))

(assert (= (and b!777849 res!526232) b!777839))

(assert (= (and b!777839 res!526231) b!777858))

(assert (= (and b!777858 res!526236) b!777846))

(assert (= (and b!777839 (not res!526240)) b!777844))

(assert (= (and b!777844 (not res!526246)) b!777857))

(assert (= (and b!777857 (not res!526242)) b!777852))

(declare-fun m!721641 () Bool)

(assert (=> b!777839 m!721641))

(declare-fun m!721643 () Bool)

(assert (=> b!777839 m!721643))

(declare-fun m!721645 () Bool)

(assert (=> b!777841 m!721645))

(declare-fun m!721647 () Bool)

(assert (=> b!777840 m!721647))

(declare-fun m!721649 () Bool)

(assert (=> b!777846 m!721649))

(assert (=> b!777846 m!721649))

(declare-fun m!721651 () Bool)

(assert (=> b!777846 m!721651))

(declare-fun m!721653 () Bool)

(assert (=> b!777854 m!721653))

(assert (=> b!777843 m!721649))

(assert (=> b!777843 m!721649))

(declare-fun m!721655 () Bool)

(assert (=> b!777843 m!721655))

(assert (=> b!777848 m!721649))

(assert (=> b!777848 m!721649))

(declare-fun m!721657 () Bool)

(assert (=> b!777848 m!721657))

(declare-fun m!721659 () Bool)

(assert (=> b!777852 m!721659))

(declare-fun m!721661 () Bool)

(assert (=> b!777855 m!721661))

(assert (=> b!777858 m!721649))

(assert (=> b!777858 m!721649))

(declare-fun m!721663 () Bool)

(assert (=> b!777858 m!721663))

(declare-fun m!721665 () Bool)

(assert (=> start!67264 m!721665))

(declare-fun m!721667 () Bool)

(assert (=> start!67264 m!721667))

(assert (=> b!777844 m!721649))

(assert (=> b!777844 m!721649))

(assert (=> b!777844 m!721657))

(assert (=> b!777847 m!721649))

(assert (=> b!777847 m!721649))

(declare-fun m!721669 () Bool)

(assert (=> b!777847 m!721669))

(assert (=> b!777847 m!721669))

(assert (=> b!777847 m!721649))

(declare-fun m!721671 () Bool)

(assert (=> b!777847 m!721671))

(declare-fun m!721673 () Bool)

(assert (=> b!777850 m!721673))

(declare-fun m!721675 () Bool)

(assert (=> b!777842 m!721675))

(declare-fun m!721677 () Bool)

(assert (=> b!777849 m!721677))

(declare-fun m!721679 () Bool)

(assert (=> b!777849 m!721679))

(declare-fun m!721681 () Bool)

(assert (=> b!777849 m!721681))

(declare-fun m!721683 () Bool)

(assert (=> b!777849 m!721683))

(assert (=> b!777849 m!721679))

(declare-fun m!721685 () Bool)

(assert (=> b!777849 m!721685))

(assert (=> b!777845 m!721649))

(assert (=> b!777845 m!721649))

(declare-fun m!721687 () Bool)

(assert (=> b!777845 m!721687))

(assert (=> b!777857 m!721683))

(declare-fun m!721689 () Bool)

(assert (=> b!777857 m!721689))

(push 1)

(assert (not b!777852))

(assert (not b!777841))

(assert (not b!777846))

(assert (not b!777839))

(assert (not b!777843))

(assert (not b!777855))

(assert (not start!67264))

(assert (not b!777845))

(assert (not b!777854))

(assert (not b!777844))

(assert (not b!777849))

(assert (not b!777848))

(assert (not b!777847))

(assert (not b!777842))

(assert (not b!777858))

(assert (not b!777850))

(check-sat)

(pop 1)

