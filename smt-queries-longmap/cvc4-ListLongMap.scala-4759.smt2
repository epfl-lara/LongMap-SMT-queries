; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65618 () Bool)

(assert start!65618)

(declare-fun b!750771 () Bool)

(declare-fun res!506774 () Bool)

(declare-fun e!418860 () Bool)

(assert (=> b!750771 (=> (not res!506774) (not e!418860))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41791 0))(
  ( (array!41792 (arr!20009 (Array (_ BitVec 32) (_ BitVec 64))) (size!20430 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41791)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750771 (= res!506774 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20430 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20430 a!3186))))))

(declare-fun b!750772 () Bool)

(declare-fun e!418863 () Bool)

(declare-fun e!418855 () Bool)

(assert (=> b!750772 (= e!418863 e!418855)))

(declare-fun res!506782 () Bool)

(assert (=> b!750772 (=> res!506782 e!418855)))

(declare-fun lt!333848 () (_ BitVec 64))

(declare-fun lt!333847 () (_ BitVec 64))

(assert (=> b!750772 (= res!506782 (= lt!333848 lt!333847))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750772 (= lt!333848 (select (store (arr!20009 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750773 () Bool)

(declare-fun e!418865 () Bool)

(declare-fun e!418862 () Bool)

(assert (=> b!750773 (= e!418865 e!418862)))

(declare-fun res!506769 () Bool)

(assert (=> b!750773 (=> (not res!506769) (not e!418862))))

(declare-datatypes ((SeekEntryResult!7609 0))(
  ( (MissingZero!7609 (index!32804 (_ BitVec 32))) (Found!7609 (index!32805 (_ BitVec 32))) (Intermediate!7609 (undefined!8421 Bool) (index!32806 (_ BitVec 32)) (x!63727 (_ BitVec 32))) (Undefined!7609) (MissingVacant!7609 (index!32807 (_ BitVec 32))) )
))
(declare-fun lt!333849 () SeekEntryResult!7609)

(declare-fun lt!333854 () SeekEntryResult!7609)

(assert (=> b!750773 (= res!506769 (= lt!333849 lt!333854))))

(declare-fun lt!333850 () array!41791)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41791 (_ BitVec 32)) SeekEntryResult!7609)

(assert (=> b!750773 (= lt!333854 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333847 lt!333850 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750773 (= lt!333849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333847 mask!3328) lt!333847 lt!333850 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!750773 (= lt!333847 (select (store (arr!20009 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750773 (= lt!333850 (array!41792 (store (arr!20009 a!3186) i!1173 k!2102) (size!20430 a!3186)))))

(declare-fun lt!333851 () SeekEntryResult!7609)

(declare-fun b!750774 () Bool)

(declare-fun e!418856 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41791 (_ BitVec 32)) SeekEntryResult!7609)

(assert (=> b!750774 (= e!418856 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20009 a!3186) j!159) a!3186 mask!3328) lt!333851))))

(declare-fun b!750775 () Bool)

(declare-fun e!418857 () Bool)

(declare-fun lt!333855 () SeekEntryResult!7609)

(assert (=> b!750775 (= e!418857 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20009 a!3186) j!159) a!3186 mask!3328) lt!333855))))

(declare-fun res!506770 () Bool)

(declare-fun e!418861 () Bool)

(assert (=> start!65618 (=> (not res!506770) (not e!418861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65618 (= res!506770 (validMask!0 mask!3328))))

(assert (=> start!65618 e!418861))

(assert (=> start!65618 true))

(declare-fun array_inv!15805 (array!41791) Bool)

(assert (=> start!65618 (array_inv!15805 a!3186)))

(declare-fun b!750776 () Bool)

(assert (=> b!750776 (= e!418857 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20009 a!3186) j!159) a!3186 mask!3328) (Found!7609 j!159)))))

(declare-fun b!750777 () Bool)

(declare-fun res!506766 () Bool)

(assert (=> b!750777 (=> (not res!506766) (not e!418860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41791 (_ BitVec 32)) Bool)

(assert (=> b!750777 (= res!506766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750778 () Bool)

(assert (=> b!750778 (= e!418855 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!418859 () Bool)

(assert (=> b!750778 e!418859))

(declare-fun res!506771 () Bool)

(assert (=> b!750778 (=> (not res!506771) (not e!418859))))

(assert (=> b!750778 (= res!506771 (= lt!333848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25816 0))(
  ( (Unit!25817) )
))
(declare-fun lt!333852 () Unit!25816)

(declare-fun e!418858 () Unit!25816)

(assert (=> b!750778 (= lt!333852 e!418858)))

(declare-fun c!82383 () Bool)

(assert (=> b!750778 (= c!82383 (= lt!333848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750779 () Bool)

(declare-fun Unit!25818 () Unit!25816)

(assert (=> b!750779 (= e!418858 Unit!25818)))

(declare-fun b!750780 () Bool)

(declare-fun res!506775 () Bool)

(assert (=> b!750780 (=> res!506775 e!418863)))

(assert (=> b!750780 (= res!506775 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20009 a!3186) j!159) a!3186 mask!3328) lt!333851)))))

(declare-fun b!750781 () Bool)

(declare-fun res!506781 () Bool)

(assert (=> b!750781 (=> (not res!506781) (not e!418861))))

(declare-fun arrayContainsKey!0 (array!41791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750781 (= res!506781 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750782 () Bool)

(declare-fun res!506767 () Bool)

(assert (=> b!750782 (=> (not res!506767) (not e!418861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750782 (= res!506767 (validKeyInArray!0 k!2102))))

(declare-fun b!750783 () Bool)

(declare-fun res!506779 () Bool)

(assert (=> b!750783 (=> (not res!506779) (not e!418860))))

(declare-datatypes ((List!14011 0))(
  ( (Nil!14008) (Cons!14007 (h!15079 (_ BitVec 64)) (t!20326 List!14011)) )
))
(declare-fun arrayNoDuplicates!0 (array!41791 (_ BitVec 32) List!14011) Bool)

(assert (=> b!750783 (= res!506779 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14008))))

(declare-fun b!750784 () Bool)

(assert (=> b!750784 (= e!418860 e!418865)))

(declare-fun res!506772 () Bool)

(assert (=> b!750784 (=> (not res!506772) (not e!418865))))

(assert (=> b!750784 (= res!506772 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20009 a!3186) j!159) mask!3328) (select (arr!20009 a!3186) j!159) a!3186 mask!3328) lt!333855))))

(assert (=> b!750784 (= lt!333855 (Intermediate!7609 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750785 () Bool)

(declare-fun res!506773 () Bool)

(assert (=> b!750785 (=> (not res!506773) (not e!418861))))

(assert (=> b!750785 (= res!506773 (validKeyInArray!0 (select (arr!20009 a!3186) j!159)))))

(declare-fun b!750786 () Bool)

(declare-fun res!506768 () Bool)

(assert (=> b!750786 (=> (not res!506768) (not e!418861))))

(assert (=> b!750786 (= res!506768 (and (= (size!20430 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20430 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20430 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750787 () Bool)

(assert (=> b!750787 (= e!418861 e!418860)))

(declare-fun res!506777 () Bool)

(assert (=> b!750787 (=> (not res!506777) (not e!418860))))

(declare-fun lt!333857 () SeekEntryResult!7609)

(assert (=> b!750787 (= res!506777 (or (= lt!333857 (MissingZero!7609 i!1173)) (= lt!333857 (MissingVacant!7609 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41791 (_ BitVec 32)) SeekEntryResult!7609)

(assert (=> b!750787 (= lt!333857 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750788 () Bool)

(declare-fun res!506776 () Bool)

(assert (=> b!750788 (=> (not res!506776) (not e!418865))))

(assert (=> b!750788 (= res!506776 e!418857)))

(declare-fun c!82384 () Bool)

(assert (=> b!750788 (= c!82384 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750789 () Bool)

(declare-fun Unit!25819 () Unit!25816)

(assert (=> b!750789 (= e!418858 Unit!25819)))

(assert (=> b!750789 false))

(declare-fun b!750790 () Bool)

(declare-fun res!506783 () Bool)

(assert (=> b!750790 (=> (not res!506783) (not e!418865))))

(assert (=> b!750790 (= res!506783 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20009 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750791 () Bool)

(assert (=> b!750791 (= e!418862 (not e!418863))))

(declare-fun res!506780 () Bool)

(assert (=> b!750791 (=> res!506780 e!418863)))

(assert (=> b!750791 (= res!506780 (or (not (is-Intermediate!7609 lt!333854)) (bvslt x!1131 (x!63727 lt!333854)) (not (= x!1131 (x!63727 lt!333854))) (not (= index!1321 (index!32806 lt!333854)))))))

(assert (=> b!750791 e!418856))

(declare-fun res!506778 () Bool)

(assert (=> b!750791 (=> (not res!506778) (not e!418856))))

(declare-fun lt!333853 () SeekEntryResult!7609)

(assert (=> b!750791 (= res!506778 (= lt!333853 lt!333851))))

(assert (=> b!750791 (= lt!333851 (Found!7609 j!159))))

(assert (=> b!750791 (= lt!333853 (seekEntryOrOpen!0 (select (arr!20009 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!750791 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333856 () Unit!25816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25816)

(assert (=> b!750791 (= lt!333856 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750792 () Bool)

(assert (=> b!750792 (= e!418859 (= (seekEntryOrOpen!0 lt!333847 lt!333850 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333847 lt!333850 mask!3328)))))

(assert (= (and start!65618 res!506770) b!750786))

(assert (= (and b!750786 res!506768) b!750785))

(assert (= (and b!750785 res!506773) b!750782))

(assert (= (and b!750782 res!506767) b!750781))

(assert (= (and b!750781 res!506781) b!750787))

(assert (= (and b!750787 res!506777) b!750777))

(assert (= (and b!750777 res!506766) b!750783))

(assert (= (and b!750783 res!506779) b!750771))

(assert (= (and b!750771 res!506774) b!750784))

(assert (= (and b!750784 res!506772) b!750790))

(assert (= (and b!750790 res!506783) b!750788))

(assert (= (and b!750788 c!82384) b!750775))

(assert (= (and b!750788 (not c!82384)) b!750776))

(assert (= (and b!750788 res!506776) b!750773))

(assert (= (and b!750773 res!506769) b!750791))

(assert (= (and b!750791 res!506778) b!750774))

(assert (= (and b!750791 (not res!506780)) b!750780))

(assert (= (and b!750780 (not res!506775)) b!750772))

(assert (= (and b!750772 (not res!506782)) b!750778))

(assert (= (and b!750778 c!82383) b!750789))

(assert (= (and b!750778 (not c!82383)) b!750779))

(assert (= (and b!750778 res!506771) b!750792))

(declare-fun m!700095 () Bool)

(assert (=> b!750777 m!700095))

(declare-fun m!700097 () Bool)

(assert (=> b!750775 m!700097))

(assert (=> b!750775 m!700097))

(declare-fun m!700099 () Bool)

(assert (=> b!750775 m!700099))

(assert (=> b!750780 m!700097))

(assert (=> b!750780 m!700097))

(declare-fun m!700101 () Bool)

(assert (=> b!750780 m!700101))

(declare-fun m!700103 () Bool)

(assert (=> b!750792 m!700103))

(declare-fun m!700105 () Bool)

(assert (=> b!750792 m!700105))

(assert (=> b!750791 m!700097))

(assert (=> b!750791 m!700097))

(declare-fun m!700107 () Bool)

(assert (=> b!750791 m!700107))

(declare-fun m!700109 () Bool)

(assert (=> b!750791 m!700109))

(declare-fun m!700111 () Bool)

(assert (=> b!750791 m!700111))

(declare-fun m!700113 () Bool)

(assert (=> b!750787 m!700113))

(declare-fun m!700115 () Bool)

(assert (=> b!750783 m!700115))

(declare-fun m!700117 () Bool)

(assert (=> b!750772 m!700117))

(declare-fun m!700119 () Bool)

(assert (=> b!750772 m!700119))

(assert (=> b!750776 m!700097))

(assert (=> b!750776 m!700097))

(assert (=> b!750776 m!700101))

(declare-fun m!700121 () Bool)

(assert (=> start!65618 m!700121))

(declare-fun m!700123 () Bool)

(assert (=> start!65618 m!700123))

(declare-fun m!700125 () Bool)

(assert (=> b!750781 m!700125))

(declare-fun m!700127 () Bool)

(assert (=> b!750773 m!700127))

(declare-fun m!700129 () Bool)

(assert (=> b!750773 m!700129))

(assert (=> b!750773 m!700117))

(assert (=> b!750773 m!700129))

(declare-fun m!700131 () Bool)

(assert (=> b!750773 m!700131))

(declare-fun m!700133 () Bool)

(assert (=> b!750773 m!700133))

(assert (=> b!750784 m!700097))

(assert (=> b!750784 m!700097))

(declare-fun m!700135 () Bool)

(assert (=> b!750784 m!700135))

(assert (=> b!750784 m!700135))

(assert (=> b!750784 m!700097))

(declare-fun m!700137 () Bool)

(assert (=> b!750784 m!700137))

(declare-fun m!700139 () Bool)

(assert (=> b!750782 m!700139))

(assert (=> b!750785 m!700097))

(assert (=> b!750785 m!700097))

(declare-fun m!700141 () Bool)

(assert (=> b!750785 m!700141))

(declare-fun m!700143 () Bool)

(assert (=> b!750790 m!700143))

(assert (=> b!750774 m!700097))

(assert (=> b!750774 m!700097))

(declare-fun m!700145 () Bool)

(assert (=> b!750774 m!700145))

(push 1)

(assert (not b!750774))

(assert (not b!750782))

(assert (not b!750792))

(assert (not b!750777))

(assert (not b!750775))

(assert (not start!65618))

(assert (not b!750785))

(assert (not b!750781))

(assert (not b!750787))

(assert (not b!750783))

(assert (not b!750773))

(assert (not b!750776))

(assert (not b!750780))

(assert (not b!750791))

(assert (not b!750784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

