; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65798 () Bool)

(assert start!65798)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41971 0))(
  ( (array!41972 (arr!20099 (Array (_ BitVec 32) (_ BitVec 64))) (size!20520 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41971)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!756944 () Bool)

(declare-datatypes ((SeekEntryResult!7699 0))(
  ( (MissingZero!7699 (index!33164 (_ BitVec 32))) (Found!7699 (index!33165 (_ BitVec 32))) (Intermediate!7699 (undefined!8511 Bool) (index!33166 (_ BitVec 32)) (x!64057 (_ BitVec 32))) (Undefined!7699) (MissingVacant!7699 (index!33167 (_ BitVec 32))) )
))
(declare-fun lt!337057 () SeekEntryResult!7699)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!422067 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41971 (_ BitVec 32)) SeekEntryResult!7699)

(assert (=> b!756944 (= e!422067 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20099 a!3186) j!159) a!3186 mask!3328) lt!337057))))

(declare-fun b!756945 () Bool)

(declare-fun e!422068 () Bool)

(declare-fun e!422058 () Bool)

(assert (=> b!756945 (= e!422068 e!422058)))

(declare-fun res!511869 () Bool)

(assert (=> b!756945 (=> res!511869 e!422058)))

(declare-fun lt!337051 () (_ BitVec 64))

(declare-fun lt!337056 () (_ BitVec 64))

(assert (=> b!756945 (= res!511869 (= lt!337051 lt!337056))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!756945 (= lt!337051 (select (store (arr!20099 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!756946 () Bool)

(declare-fun res!511877 () Bool)

(declare-fun e!422066 () Bool)

(assert (=> b!756946 (=> (not res!511877) (not e!422066))))

(assert (=> b!756946 (= res!511877 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20099 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756947 () Bool)

(assert (=> b!756947 (= e!422058 true)))

(declare-fun e!422062 () Bool)

(assert (=> b!756947 e!422062))

(declare-fun res!511860 () Bool)

(assert (=> b!756947 (=> (not res!511860) (not e!422062))))

(assert (=> b!756947 (= res!511860 (= lt!337051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26176 0))(
  ( (Unit!26177) )
))
(declare-fun lt!337053 () Unit!26176)

(declare-fun e!422059 () Unit!26176)

(assert (=> b!756947 (= lt!337053 e!422059)))

(declare-fun c!82923 () Bool)

(assert (=> b!756947 (= c!82923 (= lt!337051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!511866 () Bool)

(declare-fun e!422065 () Bool)

(assert (=> start!65798 (=> (not res!511866) (not e!422065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65798 (= res!511866 (validMask!0 mask!3328))))

(assert (=> start!65798 e!422065))

(assert (=> start!65798 true))

(declare-fun array_inv!15895 (array!41971) Bool)

(assert (=> start!65798 (array_inv!15895 a!3186)))

(declare-fun b!756948 () Bool)

(declare-fun res!511863 () Bool)

(assert (=> b!756948 (=> (not res!511863) (not e!422065))))

(assert (=> b!756948 (= res!511863 (and (= (size!20520 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20520 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20520 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756949 () Bool)

(declare-fun res!511873 () Bool)

(declare-fun e!422063 () Bool)

(assert (=> b!756949 (=> (not res!511873) (not e!422063))))

(declare-datatypes ((List!14101 0))(
  ( (Nil!14098) (Cons!14097 (h!15169 (_ BitVec 64)) (t!20416 List!14101)) )
))
(declare-fun arrayNoDuplicates!0 (array!41971 (_ BitVec 32) List!14101) Bool)

(assert (=> b!756949 (= res!511873 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14098))))

(declare-fun b!756950 () Bool)

(declare-fun Unit!26178 () Unit!26176)

(assert (=> b!756950 (= e!422059 Unit!26178)))

(assert (=> b!756950 false))

(declare-fun b!756951 () Bool)

(declare-fun res!511862 () Bool)

(assert (=> b!756951 (=> (not res!511862) (not e!422065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756951 (= res!511862 (validKeyInArray!0 k!2102))))

(declare-fun b!756952 () Bool)

(declare-fun res!511868 () Bool)

(assert (=> b!756952 (=> (not res!511868) (not e!422065))))

(declare-fun arrayContainsKey!0 (array!41971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756952 (= res!511868 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756953 () Bool)

(declare-fun res!511867 () Bool)

(assert (=> b!756953 (=> (not res!511867) (not e!422063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41971 (_ BitVec 32)) Bool)

(assert (=> b!756953 (= res!511867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756954 () Bool)

(assert (=> b!756954 (= e!422063 e!422066)))

(declare-fun res!511872 () Bool)

(assert (=> b!756954 (=> (not res!511872) (not e!422066))))

(declare-fun lt!337060 () SeekEntryResult!7699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41971 (_ BitVec 32)) SeekEntryResult!7699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756954 (= res!511872 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20099 a!3186) j!159) mask!3328) (select (arr!20099 a!3186) j!159) a!3186 mask!3328) lt!337060))))

(assert (=> b!756954 (= lt!337060 (Intermediate!7699 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756955 () Bool)

(declare-fun res!511875 () Bool)

(assert (=> b!756955 (=> (not res!511875) (not e!422062))))

(declare-fun lt!337055 () array!41971)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41971 (_ BitVec 32)) SeekEntryResult!7699)

(assert (=> b!756955 (= res!511875 (= (seekEntryOrOpen!0 lt!337056 lt!337055 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337056 lt!337055 mask!3328)))))

(declare-fun b!756956 () Bool)

(declare-fun e!422060 () Bool)

(assert (=> b!756956 (= e!422060 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20099 a!3186) j!159) a!3186 mask!3328) lt!337060))))

(declare-fun b!756957 () Bool)

(declare-fun res!511871 () Bool)

(assert (=> b!756957 (=> (not res!511871) (not e!422066))))

(assert (=> b!756957 (= res!511871 e!422060)))

(declare-fun c!82924 () Bool)

(assert (=> b!756957 (= c!82924 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756958 () Bool)

(declare-fun res!511874 () Bool)

(assert (=> b!756958 (=> (not res!511874) (not e!422063))))

(assert (=> b!756958 (= res!511874 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20520 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20520 a!3186))))))

(declare-fun b!756959 () Bool)

(declare-fun Unit!26179 () Unit!26176)

(assert (=> b!756959 (= e!422059 Unit!26179)))

(declare-fun b!756960 () Bool)

(assert (=> b!756960 (= e!422060 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20099 a!3186) j!159) a!3186 mask!3328) (Found!7699 j!159)))))

(declare-fun b!756961 () Bool)

(declare-fun res!511861 () Bool)

(assert (=> b!756961 (=> (not res!511861) (not e!422065))))

(assert (=> b!756961 (= res!511861 (validKeyInArray!0 (select (arr!20099 a!3186) j!159)))))

(declare-fun b!756962 () Bool)

(declare-fun e!422061 () Bool)

(assert (=> b!756962 (= e!422061 e!422068)))

(declare-fun res!511859 () Bool)

(assert (=> b!756962 (=> res!511859 e!422068)))

(declare-fun lt!337061 () SeekEntryResult!7699)

(assert (=> b!756962 (= res!511859 (not (= lt!337061 lt!337057)))))

(assert (=> b!756962 (= lt!337061 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20099 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756963 () Bool)

(declare-fun e!422069 () Bool)

(assert (=> b!756963 (= e!422066 e!422069)))

(declare-fun res!511864 () Bool)

(assert (=> b!756963 (=> (not res!511864) (not e!422069))))

(declare-fun lt!337050 () SeekEntryResult!7699)

(declare-fun lt!337058 () SeekEntryResult!7699)

(assert (=> b!756963 (= res!511864 (= lt!337050 lt!337058))))

(assert (=> b!756963 (= lt!337058 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337056 lt!337055 mask!3328))))

(assert (=> b!756963 (= lt!337050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337056 mask!3328) lt!337056 lt!337055 mask!3328))))

(assert (=> b!756963 (= lt!337056 (select (store (arr!20099 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756963 (= lt!337055 (array!41972 (store (arr!20099 a!3186) i!1173 k!2102) (size!20520 a!3186)))))

(declare-fun b!756964 () Bool)

(assert (=> b!756964 (= e!422065 e!422063)))

(declare-fun res!511865 () Bool)

(assert (=> b!756964 (=> (not res!511865) (not e!422063))))

(declare-fun lt!337059 () SeekEntryResult!7699)

(assert (=> b!756964 (= res!511865 (or (= lt!337059 (MissingZero!7699 i!1173)) (= lt!337059 (MissingVacant!7699 i!1173))))))

(assert (=> b!756964 (= lt!337059 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756965 () Bool)

(assert (=> b!756965 (= e!422069 (not e!422061))))

(declare-fun res!511876 () Bool)

(assert (=> b!756965 (=> res!511876 e!422061)))

(assert (=> b!756965 (= res!511876 (or (not (is-Intermediate!7699 lt!337058)) (bvslt x!1131 (x!64057 lt!337058)) (not (= x!1131 (x!64057 lt!337058))) (not (= index!1321 (index!33166 lt!337058)))))))

(assert (=> b!756965 e!422067))

(declare-fun res!511870 () Bool)

(assert (=> b!756965 (=> (not res!511870) (not e!422067))))

(declare-fun lt!337052 () SeekEntryResult!7699)

(assert (=> b!756965 (= res!511870 (= lt!337052 lt!337057))))

(assert (=> b!756965 (= lt!337057 (Found!7699 j!159))))

(assert (=> b!756965 (= lt!337052 (seekEntryOrOpen!0 (select (arr!20099 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756965 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337054 () Unit!26176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26176)

(assert (=> b!756965 (= lt!337054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756966 () Bool)

(assert (=> b!756966 (= e!422062 (= lt!337052 lt!337061))))

(assert (= (and start!65798 res!511866) b!756948))

(assert (= (and b!756948 res!511863) b!756961))

(assert (= (and b!756961 res!511861) b!756951))

(assert (= (and b!756951 res!511862) b!756952))

(assert (= (and b!756952 res!511868) b!756964))

(assert (= (and b!756964 res!511865) b!756953))

(assert (= (and b!756953 res!511867) b!756949))

(assert (= (and b!756949 res!511873) b!756958))

(assert (= (and b!756958 res!511874) b!756954))

(assert (= (and b!756954 res!511872) b!756946))

(assert (= (and b!756946 res!511877) b!756957))

(assert (= (and b!756957 c!82924) b!756956))

(assert (= (and b!756957 (not c!82924)) b!756960))

(assert (= (and b!756957 res!511871) b!756963))

(assert (= (and b!756963 res!511864) b!756965))

(assert (= (and b!756965 res!511870) b!756944))

(assert (= (and b!756965 (not res!511876)) b!756962))

(assert (= (and b!756962 (not res!511859)) b!756945))

(assert (= (and b!756945 (not res!511869)) b!756947))

(assert (= (and b!756947 c!82923) b!756950))

(assert (= (and b!756947 (not c!82923)) b!756959))

(assert (= (and b!756947 res!511860) b!756955))

(assert (= (and b!756955 res!511875) b!756966))

(declare-fun m!704775 () Bool)

(assert (=> b!756945 m!704775))

(declare-fun m!704777 () Bool)

(assert (=> b!756945 m!704777))

(declare-fun m!704779 () Bool)

(assert (=> b!756961 m!704779))

(assert (=> b!756961 m!704779))

(declare-fun m!704781 () Bool)

(assert (=> b!756961 m!704781))

(declare-fun m!704783 () Bool)

(assert (=> b!756964 m!704783))

(declare-fun m!704785 () Bool)

(assert (=> start!65798 m!704785))

(declare-fun m!704787 () Bool)

(assert (=> start!65798 m!704787))

(assert (=> b!756965 m!704779))

(assert (=> b!756965 m!704779))

(declare-fun m!704789 () Bool)

(assert (=> b!756965 m!704789))

(declare-fun m!704791 () Bool)

(assert (=> b!756965 m!704791))

(declare-fun m!704793 () Bool)

(assert (=> b!756965 m!704793))

(declare-fun m!704795 () Bool)

(assert (=> b!756963 m!704795))

(declare-fun m!704797 () Bool)

(assert (=> b!756963 m!704797))

(assert (=> b!756963 m!704775))

(declare-fun m!704799 () Bool)

(assert (=> b!756963 m!704799))

(declare-fun m!704801 () Bool)

(assert (=> b!756963 m!704801))

(assert (=> b!756963 m!704795))

(assert (=> b!756944 m!704779))

(assert (=> b!756944 m!704779))

(declare-fun m!704803 () Bool)

(assert (=> b!756944 m!704803))

(assert (=> b!756956 m!704779))

(assert (=> b!756956 m!704779))

(declare-fun m!704805 () Bool)

(assert (=> b!756956 m!704805))

(declare-fun m!704807 () Bool)

(assert (=> b!756953 m!704807))

(declare-fun m!704809 () Bool)

(assert (=> b!756952 m!704809))

(assert (=> b!756960 m!704779))

(assert (=> b!756960 m!704779))

(declare-fun m!704811 () Bool)

(assert (=> b!756960 m!704811))

(declare-fun m!704813 () Bool)

(assert (=> b!756946 m!704813))

(declare-fun m!704815 () Bool)

(assert (=> b!756955 m!704815))

(declare-fun m!704817 () Bool)

(assert (=> b!756955 m!704817))

(assert (=> b!756954 m!704779))

(assert (=> b!756954 m!704779))

(declare-fun m!704819 () Bool)

(assert (=> b!756954 m!704819))

(assert (=> b!756954 m!704819))

(assert (=> b!756954 m!704779))

(declare-fun m!704821 () Bool)

(assert (=> b!756954 m!704821))

(declare-fun m!704823 () Bool)

(assert (=> b!756951 m!704823))

(declare-fun m!704825 () Bool)

(assert (=> b!756949 m!704825))

(assert (=> b!756962 m!704779))

(assert (=> b!756962 m!704779))

(assert (=> b!756962 m!704811))

(push 1)

