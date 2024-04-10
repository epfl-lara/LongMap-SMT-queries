; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65680 () Bool)

(assert start!65680)

(declare-fun b!752873 () Bool)

(declare-fun e!419942 () Bool)

(assert (=> b!752873 (= e!419942 true)))

(declare-fun e!419938 () Bool)

(assert (=> b!752873 e!419938))

(declare-fun res!508511 () Bool)

(assert (=> b!752873 (=> (not res!508511) (not e!419938))))

(declare-fun lt!334931 () (_ BitVec 64))

(assert (=> b!752873 (= res!508511 (= lt!334931 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25940 0))(
  ( (Unit!25941) )
))
(declare-fun lt!334934 () Unit!25940)

(declare-fun e!419937 () Unit!25940)

(assert (=> b!752873 (= lt!334934 e!419937)))

(declare-fun c!82570 () Bool)

(assert (=> b!752873 (= c!82570 (= lt!334931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752874 () Bool)

(declare-fun e!419939 () Bool)

(assert (=> b!752874 (= e!419939 e!419942)))

(declare-fun res!508499 () Bool)

(assert (=> b!752874 (=> res!508499 e!419942)))

(declare-fun lt!334930 () (_ BitVec 64))

(assert (=> b!752874 (= res!508499 (= lt!334931 lt!334930))))

(declare-datatypes ((array!41853 0))(
  ( (array!41854 (arr!20040 (Array (_ BitVec 32) (_ BitVec 64))) (size!20461 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41853)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!752874 (= lt!334931 (select (store (arr!20040 a!3186) i!1173 k!2102) index!1321))))

(declare-fun e!419941 () Bool)

(declare-fun b!752875 () Bool)

(declare-datatypes ((SeekEntryResult!7640 0))(
  ( (MissingZero!7640 (index!32928 (_ BitVec 32))) (Found!7640 (index!32929 (_ BitVec 32))) (Intermediate!7640 (undefined!8452 Bool) (index!32930 (_ BitVec 32)) (x!63846 (_ BitVec 32))) (Undefined!7640) (MissingVacant!7640 (index!32931 (_ BitVec 32))) )
))
(declare-fun lt!334932 () SeekEntryResult!7640)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41853 (_ BitVec 32)) SeekEntryResult!7640)

(assert (=> b!752875 (= e!419941 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20040 a!3186) j!159) a!3186 mask!3328) lt!334932))))

(declare-fun b!752876 () Bool)

(declare-fun res!508514 () Bool)

(declare-fun e!419940 () Bool)

(assert (=> b!752876 (=> (not res!508514) (not e!419940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41853 (_ BitVec 32)) Bool)

(assert (=> b!752876 (= res!508514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752877 () Bool)

(declare-fun Unit!25942 () Unit!25940)

(assert (=> b!752877 (= e!419937 Unit!25942)))

(assert (=> b!752877 false))

(declare-fun b!752878 () Bool)

(declare-fun e!419936 () Bool)

(assert (=> b!752878 (= e!419936 e!419939)))

(declare-fun res!508501 () Bool)

(assert (=> b!752878 (=> res!508501 e!419939)))

(declare-fun lt!334935 () SeekEntryResult!7640)

(declare-fun lt!334929 () SeekEntryResult!7640)

(assert (=> b!752878 (= res!508501 (not (= lt!334935 lt!334929)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41853 (_ BitVec 32)) SeekEntryResult!7640)

(assert (=> b!752878 (= lt!334935 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20040 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752879 () Bool)

(declare-fun res!508503 () Bool)

(assert (=> b!752879 (=> (not res!508503) (not e!419940))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752879 (= res!508503 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20461 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20461 a!3186))))))

(declare-fun res!508507 () Bool)

(declare-fun e!419945 () Bool)

(assert (=> start!65680 (=> (not res!508507) (not e!419945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65680 (= res!508507 (validMask!0 mask!3328))))

(assert (=> start!65680 e!419945))

(assert (=> start!65680 true))

(declare-fun array_inv!15836 (array!41853) Bool)

(assert (=> start!65680 (array_inv!15836 a!3186)))

(declare-fun b!752880 () Bool)

(declare-fun e!419934 () Bool)

(assert (=> b!752880 (= e!419934 (not e!419936))))

(declare-fun res!508504 () Bool)

(assert (=> b!752880 (=> res!508504 e!419936)))

(declare-fun lt!334926 () SeekEntryResult!7640)

(assert (=> b!752880 (= res!508504 (or (not (is-Intermediate!7640 lt!334926)) (bvslt x!1131 (x!63846 lt!334926)) (not (= x!1131 (x!63846 lt!334926))) (not (= index!1321 (index!32930 lt!334926)))))))

(declare-fun e!419943 () Bool)

(assert (=> b!752880 e!419943))

(declare-fun res!508508 () Bool)

(assert (=> b!752880 (=> (not res!508508) (not e!419943))))

(declare-fun lt!334928 () SeekEntryResult!7640)

(assert (=> b!752880 (= res!508508 (= lt!334928 lt!334929))))

(assert (=> b!752880 (= lt!334929 (Found!7640 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41853 (_ BitVec 32)) SeekEntryResult!7640)

(assert (=> b!752880 (= lt!334928 (seekEntryOrOpen!0 (select (arr!20040 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752880 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334933 () Unit!25940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25940)

(assert (=> b!752880 (= lt!334933 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752881 () Bool)

(assert (=> b!752881 (= e!419943 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20040 a!3186) j!159) a!3186 mask!3328) lt!334929))))

(declare-fun b!752882 () Bool)

(declare-fun res!508500 () Bool)

(assert (=> b!752882 (=> (not res!508500) (not e!419945))))

(declare-fun arrayContainsKey!0 (array!41853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752882 (= res!508500 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752883 () Bool)

(declare-fun res!508505 () Bool)

(declare-fun e!419944 () Bool)

(assert (=> b!752883 (=> (not res!508505) (not e!419944))))

(assert (=> b!752883 (= res!508505 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20040 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752884 () Bool)

(declare-fun res!508498 () Bool)

(assert (=> b!752884 (=> (not res!508498) (not e!419938))))

(declare-fun lt!334927 () array!41853)

(assert (=> b!752884 (= res!508498 (= (seekEntryOrOpen!0 lt!334930 lt!334927 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334930 lt!334927 mask!3328)))))

(declare-fun b!752885 () Bool)

(declare-fun Unit!25943 () Unit!25940)

(assert (=> b!752885 (= e!419937 Unit!25943)))

(declare-fun b!752886 () Bool)

(declare-fun res!508506 () Bool)

(assert (=> b!752886 (=> (not res!508506) (not e!419945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752886 (= res!508506 (validKeyInArray!0 k!2102))))

(declare-fun b!752887 () Bool)

(assert (=> b!752887 (= e!419944 e!419934)))

(declare-fun res!508513 () Bool)

(assert (=> b!752887 (=> (not res!508513) (not e!419934))))

(declare-fun lt!334936 () SeekEntryResult!7640)

(assert (=> b!752887 (= res!508513 (= lt!334936 lt!334926))))

(assert (=> b!752887 (= lt!334926 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334930 lt!334927 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752887 (= lt!334936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334930 mask!3328) lt!334930 lt!334927 mask!3328))))

(assert (=> b!752887 (= lt!334930 (select (store (arr!20040 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752887 (= lt!334927 (array!41854 (store (arr!20040 a!3186) i!1173 k!2102) (size!20461 a!3186)))))

(declare-fun b!752888 () Bool)

(assert (=> b!752888 (= e!419940 e!419944)))

(declare-fun res!508497 () Bool)

(assert (=> b!752888 (=> (not res!508497) (not e!419944))))

(assert (=> b!752888 (= res!508497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20040 a!3186) j!159) mask!3328) (select (arr!20040 a!3186) j!159) a!3186 mask!3328) lt!334932))))

(assert (=> b!752888 (= lt!334932 (Intermediate!7640 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752889 () Bool)

(declare-fun res!508502 () Bool)

(assert (=> b!752889 (=> (not res!508502) (not e!419944))))

(assert (=> b!752889 (= res!508502 e!419941)))

(declare-fun c!82569 () Bool)

(assert (=> b!752889 (= c!82569 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752890 () Bool)

(declare-fun res!508496 () Bool)

(assert (=> b!752890 (=> (not res!508496) (not e!419940))))

(declare-datatypes ((List!14042 0))(
  ( (Nil!14039) (Cons!14038 (h!15110 (_ BitVec 64)) (t!20357 List!14042)) )
))
(declare-fun arrayNoDuplicates!0 (array!41853 (_ BitVec 32) List!14042) Bool)

(assert (=> b!752890 (= res!508496 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14039))))

(declare-fun b!752891 () Bool)

(declare-fun res!508510 () Bool)

(assert (=> b!752891 (=> (not res!508510) (not e!419945))))

(assert (=> b!752891 (= res!508510 (and (= (size!20461 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20461 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20461 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752892 () Bool)

(assert (=> b!752892 (= e!419941 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20040 a!3186) j!159) a!3186 mask!3328) (Found!7640 j!159)))))

(declare-fun b!752893 () Bool)

(declare-fun res!508509 () Bool)

(assert (=> b!752893 (=> (not res!508509) (not e!419945))))

(assert (=> b!752893 (= res!508509 (validKeyInArray!0 (select (arr!20040 a!3186) j!159)))))

(declare-fun b!752894 () Bool)

(assert (=> b!752894 (= e!419938 (= lt!334928 lt!334935))))

(declare-fun b!752895 () Bool)

(assert (=> b!752895 (= e!419945 e!419940)))

(declare-fun res!508512 () Bool)

(assert (=> b!752895 (=> (not res!508512) (not e!419940))))

(declare-fun lt!334937 () SeekEntryResult!7640)

(assert (=> b!752895 (= res!508512 (or (= lt!334937 (MissingZero!7640 i!1173)) (= lt!334937 (MissingVacant!7640 i!1173))))))

(assert (=> b!752895 (= lt!334937 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65680 res!508507) b!752891))

(assert (= (and b!752891 res!508510) b!752893))

(assert (= (and b!752893 res!508509) b!752886))

(assert (= (and b!752886 res!508506) b!752882))

(assert (= (and b!752882 res!508500) b!752895))

(assert (= (and b!752895 res!508512) b!752876))

(assert (= (and b!752876 res!508514) b!752890))

(assert (= (and b!752890 res!508496) b!752879))

(assert (= (and b!752879 res!508503) b!752888))

(assert (= (and b!752888 res!508497) b!752883))

(assert (= (and b!752883 res!508505) b!752889))

(assert (= (and b!752889 c!82569) b!752875))

(assert (= (and b!752889 (not c!82569)) b!752892))

(assert (= (and b!752889 res!508502) b!752887))

(assert (= (and b!752887 res!508513) b!752880))

(assert (= (and b!752880 res!508508) b!752881))

(assert (= (and b!752880 (not res!508504)) b!752878))

(assert (= (and b!752878 (not res!508501)) b!752874))

(assert (= (and b!752874 (not res!508499)) b!752873))

(assert (= (and b!752873 c!82570) b!752877))

(assert (= (and b!752873 (not c!82570)) b!752885))

(assert (= (and b!752873 res!508511) b!752884))

(assert (= (and b!752884 res!508498) b!752894))

(declare-fun m!701707 () Bool)

(assert (=> b!752893 m!701707))

(assert (=> b!752893 m!701707))

(declare-fun m!701709 () Bool)

(assert (=> b!752893 m!701709))

(assert (=> b!752880 m!701707))

(assert (=> b!752880 m!701707))

(declare-fun m!701711 () Bool)

(assert (=> b!752880 m!701711))

(declare-fun m!701713 () Bool)

(assert (=> b!752880 m!701713))

(declare-fun m!701715 () Bool)

(assert (=> b!752880 m!701715))

(assert (=> b!752881 m!701707))

(assert (=> b!752881 m!701707))

(declare-fun m!701717 () Bool)

(assert (=> b!752881 m!701717))

(assert (=> b!752878 m!701707))

(assert (=> b!752878 m!701707))

(declare-fun m!701719 () Bool)

(assert (=> b!752878 m!701719))

(declare-fun m!701721 () Bool)

(assert (=> b!752895 m!701721))

(declare-fun m!701723 () Bool)

(assert (=> b!752876 m!701723))

(assert (=> b!752888 m!701707))

(assert (=> b!752888 m!701707))

(declare-fun m!701725 () Bool)

(assert (=> b!752888 m!701725))

(assert (=> b!752888 m!701725))

(assert (=> b!752888 m!701707))

(declare-fun m!701727 () Bool)

(assert (=> b!752888 m!701727))

(declare-fun m!701729 () Bool)

(assert (=> b!752887 m!701729))

(declare-fun m!701731 () Bool)

(assert (=> b!752887 m!701731))

(assert (=> b!752887 m!701729))

(declare-fun m!701733 () Bool)

(assert (=> b!752887 m!701733))

(declare-fun m!701735 () Bool)

(assert (=> b!752887 m!701735))

(declare-fun m!701737 () Bool)

(assert (=> b!752887 m!701737))

(declare-fun m!701739 () Bool)

(assert (=> start!65680 m!701739))

(declare-fun m!701741 () Bool)

(assert (=> start!65680 m!701741))

(declare-fun m!701743 () Bool)

(assert (=> b!752883 m!701743))

(assert (=> b!752892 m!701707))

(assert (=> b!752892 m!701707))

(assert (=> b!752892 m!701719))

(assert (=> b!752875 m!701707))

(assert (=> b!752875 m!701707))

(declare-fun m!701745 () Bool)

(assert (=> b!752875 m!701745))

(declare-fun m!701747 () Bool)

(assert (=> b!752886 m!701747))

(declare-fun m!701749 () Bool)

(assert (=> b!752890 m!701749))

(declare-fun m!701751 () Bool)

(assert (=> b!752884 m!701751))

(declare-fun m!701753 () Bool)

(assert (=> b!752884 m!701753))

(assert (=> b!752874 m!701735))

(declare-fun m!701755 () Bool)

(assert (=> b!752874 m!701755))

(declare-fun m!701757 () Bool)

(assert (=> b!752882 m!701757))

(push 1)

