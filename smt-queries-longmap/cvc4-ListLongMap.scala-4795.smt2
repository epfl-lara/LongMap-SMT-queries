; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65834 () Bool)

(assert start!65834)

(declare-fun b!758186 () Bool)

(declare-fun e!422712 () Bool)

(declare-datatypes ((SeekEntryResult!7717 0))(
  ( (MissingZero!7717 (index!33236 (_ BitVec 32))) (Found!7717 (index!33237 (_ BitVec 32))) (Intermediate!7717 (undefined!8529 Bool) (index!33238 (_ BitVec 32)) (x!64123 (_ BitVec 32))) (Undefined!7717) (MissingVacant!7717 (index!33239 (_ BitVec 32))) )
))
(declare-fun lt!337698 () SeekEntryResult!7717)

(declare-fun lt!337708 () SeekEntryResult!7717)

(assert (=> b!758186 (= e!422712 (= lt!337698 lt!337708))))

(declare-fun b!758187 () Bool)

(declare-fun res!512895 () Bool)

(declare-fun e!422706 () Bool)

(assert (=> b!758187 (=> (not res!512895) (not e!422706))))

(declare-datatypes ((array!42007 0))(
  ( (array!42008 (arr!20117 (Array (_ BitVec 32) (_ BitVec 64))) (size!20538 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42007)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758187 (= res!512895 (validKeyInArray!0 (select (arr!20117 a!3186) j!159)))))

(declare-fun b!758188 () Bool)

(declare-fun e!422710 () Bool)

(declare-fun e!422714 () Bool)

(assert (=> b!758188 (= e!422710 e!422714)))

(declare-fun res!512900 () Bool)

(assert (=> b!758188 (=> (not res!512900) (not e!422714))))

(declare-fun lt!337705 () SeekEntryResult!7717)

(declare-fun lt!337707 () SeekEntryResult!7717)

(assert (=> b!758188 (= res!512900 (= lt!337705 lt!337707))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337703 () array!42007)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337700 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42007 (_ BitVec 32)) SeekEntryResult!7717)

(assert (=> b!758188 (= lt!337707 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337700 lt!337703 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758188 (= lt!337705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337700 mask!3328) lt!337700 lt!337703 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!758188 (= lt!337700 (select (store (arr!20117 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758188 (= lt!337703 (array!42008 (store (arr!20117 a!3186) i!1173 k!2102) (size!20538 a!3186)))))

(declare-fun b!758189 () Bool)

(declare-fun res!512899 () Bool)

(assert (=> b!758189 (=> (not res!512899) (not e!422706))))

(assert (=> b!758189 (= res!512899 (validKeyInArray!0 k!2102))))

(declare-fun e!422715 () Bool)

(declare-fun lt!337709 () SeekEntryResult!7717)

(declare-fun b!758190 () Bool)

(assert (=> b!758190 (= e!422715 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20117 a!3186) j!159) a!3186 mask!3328) lt!337709))))

(declare-fun b!758191 () Bool)

(declare-fun e!422716 () Bool)

(declare-fun e!422713 () Bool)

(assert (=> b!758191 (= e!422716 e!422713)))

(declare-fun res!512892 () Bool)

(assert (=> b!758191 (=> res!512892 e!422713)))

(declare-fun lt!337704 () (_ BitVec 64))

(assert (=> b!758191 (= res!512892 (= lt!337704 lt!337700))))

(assert (=> b!758191 (= lt!337704 (select (store (arr!20117 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!758192 () Bool)

(declare-datatypes ((Unit!26248 0))(
  ( (Unit!26249) )
))
(declare-fun e!422709 () Unit!26248)

(declare-fun Unit!26250 () Unit!26248)

(assert (=> b!758192 (= e!422709 Unit!26250)))

(declare-fun b!758193 () Bool)

(declare-fun Unit!26251 () Unit!26248)

(assert (=> b!758193 (= e!422709 Unit!26251)))

(assert (=> b!758193 false))

(declare-fun b!758194 () Bool)

(declare-fun res!512888 () Bool)

(assert (=> b!758194 (=> (not res!512888) (not e!422706))))

(declare-fun arrayContainsKey!0 (array!42007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758194 (= res!512888 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758195 () Bool)

(declare-fun e!422711 () Bool)

(assert (=> b!758195 (= e!422711 e!422710)))

(declare-fun res!512902 () Bool)

(assert (=> b!758195 (=> (not res!512902) (not e!422710))))

(assert (=> b!758195 (= res!512902 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20117 a!3186) j!159) mask!3328) (select (arr!20117 a!3186) j!159) a!3186 mask!3328) lt!337709))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758195 (= lt!337709 (Intermediate!7717 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758196 () Bool)

(declare-fun res!512887 () Bool)

(assert (=> b!758196 (=> (not res!512887) (not e!422712))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42007 (_ BitVec 32)) SeekEntryResult!7717)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42007 (_ BitVec 32)) SeekEntryResult!7717)

(assert (=> b!758196 (= res!512887 (= (seekEntryOrOpen!0 lt!337700 lt!337703 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337700 lt!337703 mask!3328)))))

(declare-fun b!758197 () Bool)

(declare-fun res!512894 () Bool)

(assert (=> b!758197 (=> (not res!512894) (not e!422710))))

(assert (=> b!758197 (= res!512894 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20117 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758198 () Bool)

(declare-fun res!512885 () Bool)

(assert (=> b!758198 (=> (not res!512885) (not e!422710))))

(assert (=> b!758198 (= res!512885 e!422715)))

(declare-fun c!83032 () Bool)

(assert (=> b!758198 (= c!83032 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!512903 () Bool)

(assert (=> start!65834 (=> (not res!512903) (not e!422706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65834 (= res!512903 (validMask!0 mask!3328))))

(assert (=> start!65834 e!422706))

(assert (=> start!65834 true))

(declare-fun array_inv!15913 (array!42007) Bool)

(assert (=> start!65834 (array_inv!15913 a!3186)))

(declare-fun b!758199 () Bool)

(assert (=> b!758199 (= e!422715 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20117 a!3186) j!159) a!3186 mask!3328) (Found!7717 j!159)))))

(declare-fun b!758200 () Bool)

(declare-fun res!512886 () Bool)

(assert (=> b!758200 (=> (not res!512886) (not e!422706))))

(assert (=> b!758200 (= res!512886 (and (= (size!20538 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20538 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20538 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758201 () Bool)

(assert (=> b!758201 (= e!422706 e!422711)))

(declare-fun res!512889 () Bool)

(assert (=> b!758201 (=> (not res!512889) (not e!422711))))

(declare-fun lt!337699 () SeekEntryResult!7717)

(assert (=> b!758201 (= res!512889 (or (= lt!337699 (MissingZero!7717 i!1173)) (= lt!337699 (MissingVacant!7717 i!1173))))))

(assert (=> b!758201 (= lt!337699 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758202 () Bool)

(declare-fun e!422717 () Bool)

(assert (=> b!758202 (= e!422717 e!422716)))

(declare-fun res!512898 () Bool)

(assert (=> b!758202 (=> res!512898 e!422716)))

(declare-fun lt!337706 () SeekEntryResult!7717)

(assert (=> b!758202 (= res!512898 (not (= lt!337708 lt!337706)))))

(assert (=> b!758202 (= lt!337708 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20117 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758203 () Bool)

(declare-fun res!512901 () Bool)

(assert (=> b!758203 (=> (not res!512901) (not e!422711))))

(declare-datatypes ((List!14119 0))(
  ( (Nil!14116) (Cons!14115 (h!15187 (_ BitVec 64)) (t!20434 List!14119)) )
))
(declare-fun arrayNoDuplicates!0 (array!42007 (_ BitVec 32) List!14119) Bool)

(assert (=> b!758203 (= res!512901 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14116))))

(declare-fun b!758204 () Bool)

(assert (=> b!758204 (= e!422713 true)))

(assert (=> b!758204 e!422712))

(declare-fun res!512891 () Bool)

(assert (=> b!758204 (=> (not res!512891) (not e!422712))))

(assert (=> b!758204 (= res!512891 (= lt!337704 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337701 () Unit!26248)

(assert (=> b!758204 (= lt!337701 e!422709)))

(declare-fun c!83031 () Bool)

(assert (=> b!758204 (= c!83031 (= lt!337704 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758205 () Bool)

(declare-fun e!422707 () Bool)

(assert (=> b!758205 (= e!422707 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20117 a!3186) j!159) a!3186 mask!3328) lt!337706))))

(declare-fun b!758206 () Bool)

(declare-fun res!512897 () Bool)

(assert (=> b!758206 (=> (not res!512897) (not e!422711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42007 (_ BitVec 32)) Bool)

(assert (=> b!758206 (= res!512897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758207 () Bool)

(declare-fun res!512890 () Bool)

(assert (=> b!758207 (=> (not res!512890) (not e!422711))))

(assert (=> b!758207 (= res!512890 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20538 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20538 a!3186))))))

(declare-fun b!758208 () Bool)

(assert (=> b!758208 (= e!422714 (not e!422717))))

(declare-fun res!512893 () Bool)

(assert (=> b!758208 (=> res!512893 e!422717)))

(assert (=> b!758208 (= res!512893 (or (not (is-Intermediate!7717 lt!337707)) (bvslt x!1131 (x!64123 lt!337707)) (not (= x!1131 (x!64123 lt!337707))) (not (= index!1321 (index!33238 lt!337707)))))))

(assert (=> b!758208 e!422707))

(declare-fun res!512896 () Bool)

(assert (=> b!758208 (=> (not res!512896) (not e!422707))))

(assert (=> b!758208 (= res!512896 (= lt!337698 lt!337706))))

(assert (=> b!758208 (= lt!337706 (Found!7717 j!159))))

(assert (=> b!758208 (= lt!337698 (seekEntryOrOpen!0 (select (arr!20117 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758208 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337702 () Unit!26248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26248)

(assert (=> b!758208 (= lt!337702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65834 res!512903) b!758200))

(assert (= (and b!758200 res!512886) b!758187))

(assert (= (and b!758187 res!512895) b!758189))

(assert (= (and b!758189 res!512899) b!758194))

(assert (= (and b!758194 res!512888) b!758201))

(assert (= (and b!758201 res!512889) b!758206))

(assert (= (and b!758206 res!512897) b!758203))

(assert (= (and b!758203 res!512901) b!758207))

(assert (= (and b!758207 res!512890) b!758195))

(assert (= (and b!758195 res!512902) b!758197))

(assert (= (and b!758197 res!512894) b!758198))

(assert (= (and b!758198 c!83032) b!758190))

(assert (= (and b!758198 (not c!83032)) b!758199))

(assert (= (and b!758198 res!512885) b!758188))

(assert (= (and b!758188 res!512900) b!758208))

(assert (= (and b!758208 res!512896) b!758205))

(assert (= (and b!758208 (not res!512893)) b!758202))

(assert (= (and b!758202 (not res!512898)) b!758191))

(assert (= (and b!758191 (not res!512892)) b!758204))

(assert (= (and b!758204 c!83031) b!758193))

(assert (= (and b!758204 (not c!83031)) b!758192))

(assert (= (and b!758204 res!512891) b!758196))

(assert (= (and b!758196 res!512887) b!758186))

(declare-fun m!705711 () Bool)

(assert (=> b!758206 m!705711))

(declare-fun m!705713 () Bool)

(assert (=> b!758196 m!705713))

(declare-fun m!705715 () Bool)

(assert (=> b!758196 m!705715))

(declare-fun m!705717 () Bool)

(assert (=> b!758205 m!705717))

(assert (=> b!758205 m!705717))

(declare-fun m!705719 () Bool)

(assert (=> b!758205 m!705719))

(assert (=> b!758195 m!705717))

(assert (=> b!758195 m!705717))

(declare-fun m!705721 () Bool)

(assert (=> b!758195 m!705721))

(assert (=> b!758195 m!705721))

(assert (=> b!758195 m!705717))

(declare-fun m!705723 () Bool)

(assert (=> b!758195 m!705723))

(declare-fun m!705725 () Bool)

(assert (=> b!758189 m!705725))

(declare-fun m!705727 () Bool)

(assert (=> b!758191 m!705727))

(declare-fun m!705729 () Bool)

(assert (=> b!758191 m!705729))

(assert (=> b!758202 m!705717))

(assert (=> b!758202 m!705717))

(declare-fun m!705731 () Bool)

(assert (=> b!758202 m!705731))

(declare-fun m!705733 () Bool)

(assert (=> b!758203 m!705733))

(assert (=> b!758199 m!705717))

(assert (=> b!758199 m!705717))

(assert (=> b!758199 m!705731))

(assert (=> b!758187 m!705717))

(assert (=> b!758187 m!705717))

(declare-fun m!705735 () Bool)

(assert (=> b!758187 m!705735))

(assert (=> b!758190 m!705717))

(assert (=> b!758190 m!705717))

(declare-fun m!705737 () Bool)

(assert (=> b!758190 m!705737))

(declare-fun m!705739 () Bool)

(assert (=> b!758188 m!705739))

(declare-fun m!705741 () Bool)

(assert (=> b!758188 m!705741))

(assert (=> b!758188 m!705727))

(assert (=> b!758188 m!705739))

(declare-fun m!705743 () Bool)

(assert (=> b!758188 m!705743))

(declare-fun m!705745 () Bool)

(assert (=> b!758188 m!705745))

(declare-fun m!705747 () Bool)

(assert (=> b!758197 m!705747))

(declare-fun m!705749 () Bool)

(assert (=> start!65834 m!705749))

(declare-fun m!705751 () Bool)

(assert (=> start!65834 m!705751))

(assert (=> b!758208 m!705717))

(assert (=> b!758208 m!705717))

(declare-fun m!705753 () Bool)

(assert (=> b!758208 m!705753))

(declare-fun m!705755 () Bool)

(assert (=> b!758208 m!705755))

(declare-fun m!705757 () Bool)

(assert (=> b!758208 m!705757))

(declare-fun m!705759 () Bool)

(assert (=> b!758194 m!705759))

(declare-fun m!705761 () Bool)

(assert (=> b!758201 m!705761))

(push 1)

