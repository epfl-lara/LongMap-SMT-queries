; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65734 () Bool)

(assert start!65734)

(declare-fun b!754736 () Bool)

(declare-fun e!420914 () Bool)

(declare-fun e!420917 () Bool)

(assert (=> b!754736 (= e!420914 e!420917)))

(declare-fun res!510052 () Bool)

(assert (=> b!754736 (=> (not res!510052) (not e!420917))))

(declare-datatypes ((SeekEntryResult!7667 0))(
  ( (MissingZero!7667 (index!33036 (_ BitVec 32))) (Found!7667 (index!33037 (_ BitVec 32))) (Intermediate!7667 (undefined!8479 Bool) (index!33038 (_ BitVec 32)) (x!63945 (_ BitVec 32))) (Undefined!7667) (MissingVacant!7667 (index!33039 (_ BitVec 32))) )
))
(declare-fun lt!335908 () SeekEntryResult!7667)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754736 (= res!510052 (or (= lt!335908 (MissingZero!7667 i!1173)) (= lt!335908 (MissingVacant!7667 i!1173))))))

(declare-datatypes ((array!41907 0))(
  ( (array!41908 (arr!20067 (Array (_ BitVec 32) (_ BitVec 64))) (size!20488 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41907)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41907 (_ BitVec 32)) SeekEntryResult!7667)

(assert (=> b!754736 (= lt!335908 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!754737 () Bool)

(declare-fun res!510037 () Bool)

(declare-fun e!420915 () Bool)

(assert (=> b!754737 (=> (not res!510037) (not e!420915))))

(declare-fun e!420909 () Bool)

(assert (=> b!754737 (= res!510037 e!420909)))

(declare-fun c!82732 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754737 (= c!82732 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754738 () Bool)

(declare-fun e!420916 () Bool)

(declare-fun e!420906 () Bool)

(assert (=> b!754738 (= e!420916 e!420906)))

(declare-fun res!510051 () Bool)

(assert (=> b!754738 (=> res!510051 e!420906)))

(declare-fun lt!335899 () SeekEntryResult!7667)

(declare-fun lt!335909 () SeekEntryResult!7667)

(assert (=> b!754738 (= res!510051 (not (= lt!335899 lt!335909)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41907 (_ BitVec 32)) SeekEntryResult!7667)

(assert (=> b!754738 (= lt!335899 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20067 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754739 () Bool)

(assert (=> b!754739 (= e!420909 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20067 a!3186) j!159) a!3186 mask!3328) (Found!7667 j!159)))))

(declare-fun b!754740 () Bool)

(declare-fun e!420911 () Bool)

(assert (=> b!754740 (= e!420911 true)))

(declare-fun e!420913 () Bool)

(assert (=> b!754740 e!420913))

(declare-fun res!510038 () Bool)

(assert (=> b!754740 (=> (not res!510038) (not e!420913))))

(declare-fun lt!335904 () (_ BitVec 64))

(assert (=> b!754740 (= res!510038 (= lt!335904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26048 0))(
  ( (Unit!26049) )
))
(declare-fun lt!335905 () Unit!26048)

(declare-fun e!420907 () Unit!26048)

(assert (=> b!754740 (= lt!335905 e!420907)))

(declare-fun c!82731 () Bool)

(assert (=> b!754740 (= c!82731 (= lt!335904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754741 () Bool)

(declare-fun e!420908 () Bool)

(assert (=> b!754741 (= e!420915 e!420908)))

(declare-fun res!510040 () Bool)

(assert (=> b!754741 (=> (not res!510040) (not e!420908))))

(declare-fun lt!335902 () SeekEntryResult!7667)

(declare-fun lt!335898 () SeekEntryResult!7667)

(assert (=> b!754741 (= res!510040 (= lt!335902 lt!335898))))

(declare-fun lt!335901 () array!41907)

(declare-fun lt!335906 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41907 (_ BitVec 32)) SeekEntryResult!7667)

(assert (=> b!754741 (= lt!335898 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335906 lt!335901 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754741 (= lt!335902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335906 mask!3328) lt!335906 lt!335901 mask!3328))))

(assert (=> b!754741 (= lt!335906 (select (store (arr!20067 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754741 (= lt!335901 (array!41908 (store (arr!20067 a!3186) i!1173 k!2102) (size!20488 a!3186)))))

(declare-fun b!754742 () Bool)

(assert (=> b!754742 (= e!420908 (not e!420916))))

(declare-fun res!510042 () Bool)

(assert (=> b!754742 (=> res!510042 e!420916)))

(assert (=> b!754742 (= res!510042 (or (not (is-Intermediate!7667 lt!335898)) (bvslt x!1131 (x!63945 lt!335898)) (not (= x!1131 (x!63945 lt!335898))) (not (= index!1321 (index!33038 lt!335898)))))))

(declare-fun e!420912 () Bool)

(assert (=> b!754742 e!420912))

(declare-fun res!510050 () Bool)

(assert (=> b!754742 (=> (not res!510050) (not e!420912))))

(declare-fun lt!335907 () SeekEntryResult!7667)

(assert (=> b!754742 (= res!510050 (= lt!335907 lt!335909))))

(assert (=> b!754742 (= lt!335909 (Found!7667 j!159))))

(assert (=> b!754742 (= lt!335907 (seekEntryOrOpen!0 (select (arr!20067 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41907 (_ BitVec 32)) Bool)

(assert (=> b!754742 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335903 () Unit!26048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26048)

(assert (=> b!754742 (= lt!335903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754743 () Bool)

(declare-fun res!510044 () Bool)

(assert (=> b!754743 (=> (not res!510044) (not e!420914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754743 (= res!510044 (validKeyInArray!0 (select (arr!20067 a!3186) j!159)))))

(declare-fun b!754744 () Bool)

(declare-fun res!510053 () Bool)

(assert (=> b!754744 (=> (not res!510053) (not e!420915))))

(assert (=> b!754744 (= res!510053 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20067 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754745 () Bool)

(declare-fun res!510039 () Bool)

(assert (=> b!754745 (=> (not res!510039) (not e!420914))))

(declare-fun arrayContainsKey!0 (array!41907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754745 (= res!510039 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754746 () Bool)

(assert (=> b!754746 (= e!420913 (= lt!335907 lt!335899))))

(declare-fun lt!335900 () SeekEntryResult!7667)

(declare-fun b!754747 () Bool)

(assert (=> b!754747 (= e!420909 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20067 a!3186) j!159) a!3186 mask!3328) lt!335900))))

(declare-fun b!754749 () Bool)

(declare-fun Unit!26050 () Unit!26048)

(assert (=> b!754749 (= e!420907 Unit!26050)))

(declare-fun b!754750 () Bool)

(declare-fun res!510035 () Bool)

(assert (=> b!754750 (=> (not res!510035) (not e!420917))))

(assert (=> b!754750 (= res!510035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754751 () Bool)

(assert (=> b!754751 (= e!420906 e!420911)))

(declare-fun res!510049 () Bool)

(assert (=> b!754751 (=> res!510049 e!420911)))

(assert (=> b!754751 (= res!510049 (= lt!335904 lt!335906))))

(assert (=> b!754751 (= lt!335904 (select (store (arr!20067 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754752 () Bool)

(declare-fun res!510048 () Bool)

(assert (=> b!754752 (=> (not res!510048) (not e!420917))))

(declare-datatypes ((List!14069 0))(
  ( (Nil!14066) (Cons!14065 (h!15137 (_ BitVec 64)) (t!20384 List!14069)) )
))
(declare-fun arrayNoDuplicates!0 (array!41907 (_ BitVec 32) List!14069) Bool)

(assert (=> b!754752 (= res!510048 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14066))))

(declare-fun b!754753 () Bool)

(assert (=> b!754753 (= e!420917 e!420915)))

(declare-fun res!510045 () Bool)

(assert (=> b!754753 (=> (not res!510045) (not e!420915))))

(assert (=> b!754753 (= res!510045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20067 a!3186) j!159) mask!3328) (select (arr!20067 a!3186) j!159) a!3186 mask!3328) lt!335900))))

(assert (=> b!754753 (= lt!335900 (Intermediate!7667 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754754 () Bool)

(declare-fun Unit!26051 () Unit!26048)

(assert (=> b!754754 (= e!420907 Unit!26051)))

(assert (=> b!754754 false))

(declare-fun b!754755 () Bool)

(declare-fun res!510036 () Bool)

(assert (=> b!754755 (=> (not res!510036) (not e!420913))))

(assert (=> b!754755 (= res!510036 (= (seekEntryOrOpen!0 lt!335906 lt!335901 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335906 lt!335901 mask!3328)))))

(declare-fun b!754756 () Bool)

(assert (=> b!754756 (= e!420912 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20067 a!3186) j!159) a!3186 mask!3328) lt!335909))))

(declare-fun b!754757 () Bool)

(declare-fun res!510043 () Bool)

(assert (=> b!754757 (=> (not res!510043) (not e!420914))))

(assert (=> b!754757 (= res!510043 (validKeyInArray!0 k!2102))))

(declare-fun b!754758 () Bool)

(declare-fun res!510041 () Bool)

(assert (=> b!754758 (=> (not res!510041) (not e!420917))))

(assert (=> b!754758 (= res!510041 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20488 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20488 a!3186))))))

(declare-fun res!510046 () Bool)

(assert (=> start!65734 (=> (not res!510046) (not e!420914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65734 (= res!510046 (validMask!0 mask!3328))))

(assert (=> start!65734 e!420914))

(assert (=> start!65734 true))

(declare-fun array_inv!15863 (array!41907) Bool)

(assert (=> start!65734 (array_inv!15863 a!3186)))

(declare-fun b!754748 () Bool)

(declare-fun res!510047 () Bool)

(assert (=> b!754748 (=> (not res!510047) (not e!420914))))

(assert (=> b!754748 (= res!510047 (and (= (size!20488 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20488 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20488 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65734 res!510046) b!754748))

(assert (= (and b!754748 res!510047) b!754743))

(assert (= (and b!754743 res!510044) b!754757))

(assert (= (and b!754757 res!510043) b!754745))

(assert (= (and b!754745 res!510039) b!754736))

(assert (= (and b!754736 res!510052) b!754750))

(assert (= (and b!754750 res!510035) b!754752))

(assert (= (and b!754752 res!510048) b!754758))

(assert (= (and b!754758 res!510041) b!754753))

(assert (= (and b!754753 res!510045) b!754744))

(assert (= (and b!754744 res!510053) b!754737))

(assert (= (and b!754737 c!82732) b!754747))

(assert (= (and b!754737 (not c!82732)) b!754739))

(assert (= (and b!754737 res!510037) b!754741))

(assert (= (and b!754741 res!510040) b!754742))

(assert (= (and b!754742 res!510050) b!754756))

(assert (= (and b!754742 (not res!510042)) b!754738))

(assert (= (and b!754738 (not res!510051)) b!754751))

(assert (= (and b!754751 (not res!510049)) b!754740))

(assert (= (and b!754740 c!82731) b!754754))

(assert (= (and b!754740 (not c!82731)) b!754749))

(assert (= (and b!754740 res!510038) b!754755))

(assert (= (and b!754755 res!510036) b!754746))

(declare-fun m!703111 () Bool)

(assert (=> b!754751 m!703111))

(declare-fun m!703113 () Bool)

(assert (=> b!754751 m!703113))

(declare-fun m!703115 () Bool)

(assert (=> b!754739 m!703115))

(assert (=> b!754739 m!703115))

(declare-fun m!703117 () Bool)

(assert (=> b!754739 m!703117))

(declare-fun m!703119 () Bool)

(assert (=> start!65734 m!703119))

(declare-fun m!703121 () Bool)

(assert (=> start!65734 m!703121))

(declare-fun m!703123 () Bool)

(assert (=> b!754755 m!703123))

(declare-fun m!703125 () Bool)

(assert (=> b!754755 m!703125))

(assert (=> b!754747 m!703115))

(assert (=> b!754747 m!703115))

(declare-fun m!703127 () Bool)

(assert (=> b!754747 m!703127))

(assert (=> b!754738 m!703115))

(assert (=> b!754738 m!703115))

(assert (=> b!754738 m!703117))

(assert (=> b!754756 m!703115))

(assert (=> b!754756 m!703115))

(declare-fun m!703129 () Bool)

(assert (=> b!754756 m!703129))

(declare-fun m!703131 () Bool)

(assert (=> b!754752 m!703131))

(declare-fun m!703133 () Bool)

(assert (=> b!754741 m!703133))

(declare-fun m!703135 () Bool)

(assert (=> b!754741 m!703135))

(declare-fun m!703137 () Bool)

(assert (=> b!754741 m!703137))

(assert (=> b!754741 m!703133))

(assert (=> b!754741 m!703111))

(declare-fun m!703139 () Bool)

(assert (=> b!754741 m!703139))

(assert (=> b!754743 m!703115))

(assert (=> b!754743 m!703115))

(declare-fun m!703141 () Bool)

(assert (=> b!754743 m!703141))

(declare-fun m!703143 () Bool)

(assert (=> b!754744 m!703143))

(declare-fun m!703145 () Bool)

(assert (=> b!754750 m!703145))

(declare-fun m!703147 () Bool)

(assert (=> b!754745 m!703147))

(assert (=> b!754742 m!703115))

(assert (=> b!754742 m!703115))

(declare-fun m!703149 () Bool)

(assert (=> b!754742 m!703149))

(declare-fun m!703151 () Bool)

(assert (=> b!754742 m!703151))

(declare-fun m!703153 () Bool)

(assert (=> b!754742 m!703153))

(declare-fun m!703155 () Bool)

(assert (=> b!754757 m!703155))

(declare-fun m!703157 () Bool)

(assert (=> b!754736 m!703157))

(assert (=> b!754753 m!703115))

(assert (=> b!754753 m!703115))

(declare-fun m!703159 () Bool)

(assert (=> b!754753 m!703159))

(assert (=> b!754753 m!703159))

(assert (=> b!754753 m!703115))

(declare-fun m!703161 () Bool)

(assert (=> b!754753 m!703161))

(push 1)

