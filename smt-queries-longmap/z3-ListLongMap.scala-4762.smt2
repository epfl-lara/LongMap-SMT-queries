; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65612 () Bool)

(assert start!65612)

(declare-fun b!750983 () Bool)

(declare-fun e!418941 () Bool)

(declare-fun e!418935 () Bool)

(assert (=> b!750983 (= e!418941 e!418935)))

(declare-fun res!507051 () Bool)

(assert (=> b!750983 (=> (not res!507051) (not e!418935))))

(declare-datatypes ((array!41802 0))(
  ( (array!41803 (arr!20015 (Array (_ BitVec 32) (_ BitVec 64))) (size!20436 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41802)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7612 0))(
  ( (MissingZero!7612 (index!32816 (_ BitVec 32))) (Found!7612 (index!32817 (_ BitVec 32))) (Intermediate!7612 (undefined!8424 Bool) (index!32818 (_ BitVec 32)) (x!63749 (_ BitVec 32))) (Undefined!7612) (MissingVacant!7612 (index!32819 (_ BitVec 32))) )
))
(declare-fun lt!333847 () SeekEntryResult!7612)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41802 (_ BitVec 32)) SeekEntryResult!7612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750983 (= res!507051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20015 a!3186) j!159) mask!3328) (select (arr!20015 a!3186) j!159) a!3186 mask!3328) lt!333847))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750983 (= lt!333847 (Intermediate!7612 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!418939 () Bool)

(declare-fun b!750984 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!750984 (= e!418939 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20015 a!3186) j!159) a!3186 mask!3328) lt!333847))))

(declare-fun res!507036 () Bool)

(declare-fun e!418942 () Bool)

(assert (=> start!65612 (=> (not res!507036) (not e!418942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65612 (= res!507036 (validMask!0 mask!3328))))

(assert (=> start!65612 e!418942))

(assert (=> start!65612 true))

(declare-fun array_inv!15898 (array!41802) Bool)

(assert (=> start!65612 (array_inv!15898 a!3186)))

(declare-fun b!750985 () Bool)

(declare-fun e!418934 () Bool)

(assert (=> b!750985 (= e!418934 true)))

(declare-fun e!418938 () Bool)

(assert (=> b!750985 e!418938))

(declare-fun res!507045 () Bool)

(assert (=> b!750985 (=> (not res!507045) (not e!418938))))

(declare-fun lt!333841 () (_ BitVec 64))

(assert (=> b!750985 (= res!507045 (= lt!333841 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25808 0))(
  ( (Unit!25809) )
))
(declare-fun lt!333844 () Unit!25808)

(declare-fun e!418936 () Unit!25808)

(assert (=> b!750985 (= lt!333844 e!418936)))

(declare-fun c!82356 () Bool)

(assert (=> b!750985 (= c!82356 (= lt!333841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750986 () Bool)

(declare-fun Unit!25810 () Unit!25808)

(assert (=> b!750986 (= e!418936 Unit!25810)))

(declare-fun b!750987 () Bool)

(declare-fun res!507039 () Bool)

(assert (=> b!750987 (=> (not res!507039) (not e!418942))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750987 (= res!507039 (validKeyInArray!0 k0!2102))))

(declare-fun b!750988 () Bool)

(declare-fun res!507042 () Bool)

(declare-fun e!418940 () Bool)

(assert (=> b!750988 (=> res!507042 e!418940)))

(declare-fun lt!333848 () SeekEntryResult!7612)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41802 (_ BitVec 32)) SeekEntryResult!7612)

(assert (=> b!750988 (= res!507042 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20015 a!3186) j!159) a!3186 mask!3328) lt!333848)))))

(declare-fun b!750989 () Bool)

(declare-fun res!507046 () Bool)

(assert (=> b!750989 (=> (not res!507046) (not e!418935))))

(assert (=> b!750989 (= res!507046 e!418939)))

(declare-fun c!82355 () Bool)

(assert (=> b!750989 (= c!82355 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750990 () Bool)

(assert (=> b!750990 (= e!418942 e!418941)))

(declare-fun res!507035 () Bool)

(assert (=> b!750990 (=> (not res!507035) (not e!418941))))

(declare-fun lt!333845 () SeekEntryResult!7612)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750990 (= res!507035 (or (= lt!333845 (MissingZero!7612 i!1173)) (= lt!333845 (MissingVacant!7612 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41802 (_ BitVec 32)) SeekEntryResult!7612)

(assert (=> b!750990 (= lt!333845 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750991 () Bool)

(declare-fun res!507040 () Bool)

(assert (=> b!750991 (=> (not res!507040) (not e!418935))))

(assert (=> b!750991 (= res!507040 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20015 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750992 () Bool)

(assert (=> b!750992 (= e!418940 e!418934)))

(declare-fun res!507044 () Bool)

(assert (=> b!750992 (=> res!507044 e!418934)))

(declare-fun lt!333840 () (_ BitVec 64))

(assert (=> b!750992 (= res!507044 (= lt!333841 lt!333840))))

(assert (=> b!750992 (= lt!333841 (select (store (arr!20015 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750993 () Bool)

(declare-fun lt!333842 () array!41802)

(assert (=> b!750993 (= e!418938 (= (seekEntryOrOpen!0 lt!333840 lt!333842 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333840 lt!333842 mask!3328)))))

(declare-fun b!750994 () Bool)

(declare-fun res!507037 () Bool)

(assert (=> b!750994 (=> (not res!507037) (not e!418941))))

(assert (=> b!750994 (= res!507037 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20436 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20436 a!3186))))))

(declare-fun b!750995 () Bool)

(declare-fun Unit!25811 () Unit!25808)

(assert (=> b!750995 (= e!418936 Unit!25811)))

(assert (=> b!750995 false))

(declare-fun b!750996 () Bool)

(declare-fun res!507043 () Bool)

(assert (=> b!750996 (=> (not res!507043) (not e!418942))))

(assert (=> b!750996 (= res!507043 (and (= (size!20436 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20436 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20436 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750997 () Bool)

(declare-fun res!507038 () Bool)

(assert (=> b!750997 (=> (not res!507038) (not e!418942))))

(assert (=> b!750997 (= res!507038 (validKeyInArray!0 (select (arr!20015 a!3186) j!159)))))

(declare-fun b!750998 () Bool)

(assert (=> b!750998 (= e!418939 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20015 a!3186) j!159) a!3186 mask!3328) (Found!7612 j!159)))))

(declare-fun b!750999 () Bool)

(declare-fun res!507047 () Bool)

(assert (=> b!750999 (=> (not res!507047) (not e!418941))))

(declare-datatypes ((List!14056 0))(
  ( (Nil!14053) (Cons!14052 (h!15124 (_ BitVec 64)) (t!20362 List!14056)) )
))
(declare-fun arrayNoDuplicates!0 (array!41802 (_ BitVec 32) List!14056) Bool)

(assert (=> b!750999 (= res!507047 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14053))))

(declare-fun b!751000 () Bool)

(declare-fun res!507048 () Bool)

(assert (=> b!751000 (=> (not res!507048) (not e!418942))))

(declare-fun arrayContainsKey!0 (array!41802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751000 (= res!507048 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751001 () Bool)

(declare-fun e!418932 () Bool)

(assert (=> b!751001 (= e!418932 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20015 a!3186) j!159) a!3186 mask!3328) lt!333848))))

(declare-fun b!751002 () Bool)

(declare-fun res!507034 () Bool)

(assert (=> b!751002 (=> (not res!507034) (not e!418941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41802 (_ BitVec 32)) Bool)

(assert (=> b!751002 (= res!507034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751003 () Bool)

(declare-fun e!418933 () Bool)

(assert (=> b!751003 (= e!418933 (not e!418940))))

(declare-fun res!507050 () Bool)

(assert (=> b!751003 (=> res!507050 e!418940)))

(declare-fun lt!333846 () SeekEntryResult!7612)

(get-info :version)

(assert (=> b!751003 (= res!507050 (or (not ((_ is Intermediate!7612) lt!333846)) (bvslt x!1131 (x!63749 lt!333846)) (not (= x!1131 (x!63749 lt!333846))) (not (= index!1321 (index!32818 lt!333846)))))))

(assert (=> b!751003 e!418932))

(declare-fun res!507041 () Bool)

(assert (=> b!751003 (=> (not res!507041) (not e!418932))))

(declare-fun lt!333839 () SeekEntryResult!7612)

(assert (=> b!751003 (= res!507041 (= lt!333839 lt!333848))))

(assert (=> b!751003 (= lt!333848 (Found!7612 j!159))))

(assert (=> b!751003 (= lt!333839 (seekEntryOrOpen!0 (select (arr!20015 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751003 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333838 () Unit!25808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25808)

(assert (=> b!751003 (= lt!333838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751004 () Bool)

(assert (=> b!751004 (= e!418935 e!418933)))

(declare-fun res!507049 () Bool)

(assert (=> b!751004 (=> (not res!507049) (not e!418933))))

(declare-fun lt!333843 () SeekEntryResult!7612)

(assert (=> b!751004 (= res!507049 (= lt!333843 lt!333846))))

(assert (=> b!751004 (= lt!333846 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333840 lt!333842 mask!3328))))

(assert (=> b!751004 (= lt!333843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333840 mask!3328) lt!333840 lt!333842 mask!3328))))

(assert (=> b!751004 (= lt!333840 (select (store (arr!20015 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751004 (= lt!333842 (array!41803 (store (arr!20015 a!3186) i!1173 k0!2102) (size!20436 a!3186)))))

(assert (= (and start!65612 res!507036) b!750996))

(assert (= (and b!750996 res!507043) b!750997))

(assert (= (and b!750997 res!507038) b!750987))

(assert (= (and b!750987 res!507039) b!751000))

(assert (= (and b!751000 res!507048) b!750990))

(assert (= (and b!750990 res!507035) b!751002))

(assert (= (and b!751002 res!507034) b!750999))

(assert (= (and b!750999 res!507047) b!750994))

(assert (= (and b!750994 res!507037) b!750983))

(assert (= (and b!750983 res!507051) b!750991))

(assert (= (and b!750991 res!507040) b!750989))

(assert (= (and b!750989 c!82355) b!750984))

(assert (= (and b!750989 (not c!82355)) b!750998))

(assert (= (and b!750989 res!507046) b!751004))

(assert (= (and b!751004 res!507049) b!751003))

(assert (= (and b!751003 res!507041) b!751001))

(assert (= (and b!751003 (not res!507050)) b!750988))

(assert (= (and b!750988 (not res!507042)) b!750992))

(assert (= (and b!750992 (not res!507044)) b!750985))

(assert (= (and b!750985 c!82356) b!750995))

(assert (= (and b!750985 (not c!82356)) b!750986))

(assert (= (and b!750985 res!507045) b!750993))

(declare-fun m!699701 () Bool)

(assert (=> b!751001 m!699701))

(assert (=> b!751001 m!699701))

(declare-fun m!699703 () Bool)

(assert (=> b!751001 m!699703))

(declare-fun m!699705 () Bool)

(assert (=> b!751002 m!699705))

(assert (=> b!750998 m!699701))

(assert (=> b!750998 m!699701))

(declare-fun m!699707 () Bool)

(assert (=> b!750998 m!699707))

(declare-fun m!699709 () Bool)

(assert (=> b!750987 m!699709))

(assert (=> b!750988 m!699701))

(assert (=> b!750988 m!699701))

(assert (=> b!750988 m!699707))

(declare-fun m!699711 () Bool)

(assert (=> b!750999 m!699711))

(assert (=> b!750997 m!699701))

(assert (=> b!750997 m!699701))

(declare-fun m!699713 () Bool)

(assert (=> b!750997 m!699713))

(declare-fun m!699715 () Bool)

(assert (=> b!750991 m!699715))

(declare-fun m!699717 () Bool)

(assert (=> b!750992 m!699717))

(declare-fun m!699719 () Bool)

(assert (=> b!750992 m!699719))

(declare-fun m!699721 () Bool)

(assert (=> b!750993 m!699721))

(declare-fun m!699723 () Bool)

(assert (=> b!750993 m!699723))

(assert (=> b!751003 m!699701))

(assert (=> b!751003 m!699701))

(declare-fun m!699725 () Bool)

(assert (=> b!751003 m!699725))

(declare-fun m!699727 () Bool)

(assert (=> b!751003 m!699727))

(declare-fun m!699729 () Bool)

(assert (=> b!751003 m!699729))

(declare-fun m!699731 () Bool)

(assert (=> b!751004 m!699731))

(declare-fun m!699733 () Bool)

(assert (=> b!751004 m!699733))

(assert (=> b!751004 m!699717))

(declare-fun m!699735 () Bool)

(assert (=> b!751004 m!699735))

(declare-fun m!699737 () Bool)

(assert (=> b!751004 m!699737))

(assert (=> b!751004 m!699731))

(declare-fun m!699739 () Bool)

(assert (=> start!65612 m!699739))

(declare-fun m!699741 () Bool)

(assert (=> start!65612 m!699741))

(assert (=> b!750984 m!699701))

(assert (=> b!750984 m!699701))

(declare-fun m!699743 () Bool)

(assert (=> b!750984 m!699743))

(assert (=> b!750983 m!699701))

(assert (=> b!750983 m!699701))

(declare-fun m!699745 () Bool)

(assert (=> b!750983 m!699745))

(assert (=> b!750983 m!699745))

(assert (=> b!750983 m!699701))

(declare-fun m!699747 () Bool)

(assert (=> b!750983 m!699747))

(declare-fun m!699749 () Bool)

(assert (=> b!750990 m!699749))

(declare-fun m!699751 () Bool)

(assert (=> b!751000 m!699751))

(check-sat (not b!750987) (not b!751000) (not b!751001) (not b!750990) (not b!751004) (not b!750988) (not b!750999) (not b!751002) (not b!750983) (not b!750998) (not b!750984) (not b!750993) (not b!751003) (not start!65612) (not b!750997))
(check-sat)
