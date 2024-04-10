; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64748 () Bool)

(assert start!64748)

(declare-fun b!730979 () Bool)

(declare-fun res!491220 () Bool)

(declare-fun e!409037 () Bool)

(assert (=> b!730979 (=> (not res!491220) (not e!409037))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41197 0))(
  ( (array!41198 (arr!19718 (Array (_ BitVec 32) (_ BitVec 64))) (size!20139 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41197)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730979 (= res!491220 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19718 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730980 () Bool)

(declare-fun res!491228 () Bool)

(assert (=> b!730980 (=> (not res!491228) (not e!409037))))

(declare-fun e!409046 () Bool)

(assert (=> b!730980 (= res!491228 e!409046)))

(declare-fun c!80257 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730980 (= c!80257 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!730981 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7318 0))(
  ( (MissingZero!7318 (index!31640 (_ BitVec 32))) (Found!7318 (index!31641 (_ BitVec 32))) (Intermediate!7318 (undefined!8130 Bool) (index!31642 (_ BitVec 32)) (x!62612 (_ BitVec 32))) (Undefined!7318) (MissingVacant!7318 (index!31643 (_ BitVec 32))) )
))
(declare-fun lt!323930 () SeekEntryResult!7318)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41197 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!730981 (= e!409046 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) lt!323930))))

(declare-fun b!730982 () Bool)

(declare-fun res!491227 () Bool)

(declare-fun e!409044 () Bool)

(assert (=> b!730982 (=> (not res!491227) (not e!409044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41197 (_ BitVec 32)) Bool)

(assert (=> b!730982 (= res!491227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730983 () Bool)

(declare-fun res!491229 () Bool)

(declare-fun e!409042 () Bool)

(assert (=> b!730983 (=> (not res!491229) (not e!409042))))

(assert (=> b!730983 (= res!491229 (and (= (size!20139 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20139 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20139 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!491218 () Bool)

(assert (=> start!64748 (=> (not res!491218) (not e!409042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64748 (= res!491218 (validMask!0 mask!3328))))

(assert (=> start!64748 e!409042))

(assert (=> start!64748 true))

(declare-fun array_inv!15514 (array!41197) Bool)

(assert (=> start!64748 (array_inv!15514 a!3186)))

(declare-fun b!730984 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41197 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!730984 (= e!409046 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) (Found!7318 j!159)))))

(declare-fun b!730985 () Bool)

(assert (=> b!730985 (= e!409044 e!409037)))

(declare-fun res!491231 () Bool)

(assert (=> b!730985 (=> (not res!491231) (not e!409037))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730985 (= res!491231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19718 a!3186) j!159) mask!3328) (select (arr!19718 a!3186) j!159) a!3186 mask!3328) lt!323930))))

(assert (=> b!730985 (= lt!323930 (Intermediate!7318 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730986 () Bool)

(declare-fun e!409043 () Bool)

(declare-fun e!409038 () Bool)

(assert (=> b!730986 (= e!409043 e!409038)))

(declare-fun res!491224 () Bool)

(assert (=> b!730986 (=> res!491224 e!409038)))

(assert (=> b!730986 (= res!491224 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323932 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730986 (= lt!323932 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730987 () Bool)

(declare-fun res!491219 () Bool)

(assert (=> b!730987 (=> (not res!491219) (not e!409042))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730987 (= res!491219 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730988 () Bool)

(declare-fun res!491217 () Bool)

(assert (=> b!730988 (=> (not res!491217) (not e!409044))))

(declare-datatypes ((List!13720 0))(
  ( (Nil!13717) (Cons!13716 (h!14776 (_ BitVec 64)) (t!20035 List!13720)) )
))
(declare-fun arrayNoDuplicates!0 (array!41197 (_ BitVec 32) List!13720) Bool)

(assert (=> b!730988 (= res!491217 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13717))))

(declare-fun b!730989 () Bool)

(declare-fun res!491221 () Bool)

(assert (=> b!730989 (=> res!491221 e!409038)))

(assert (=> b!730989 (= res!491221 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) (Found!7318 j!159))))))

(declare-fun b!730990 () Bool)

(assert (=> b!730990 (= e!409038 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!730991 () Bool)

(declare-fun e!409045 () Bool)

(assert (=> b!730991 (= e!409045 (not e!409043))))

(declare-fun res!491226 () Bool)

(assert (=> b!730991 (=> res!491226 e!409043)))

(declare-fun lt!323931 () SeekEntryResult!7318)

(assert (=> b!730991 (= res!491226 (or (not (is-Intermediate!7318 lt!323931)) (bvsge x!1131 (x!62612 lt!323931))))))

(declare-fun e!409040 () Bool)

(assert (=> b!730991 e!409040))

(declare-fun res!491216 () Bool)

(assert (=> b!730991 (=> (not res!491216) (not e!409040))))

(assert (=> b!730991 (= res!491216 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24954 0))(
  ( (Unit!24955) )
))
(declare-fun lt!323928 () Unit!24954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24954)

(assert (=> b!730991 (= lt!323928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730992 () Bool)

(declare-fun res!491222 () Bool)

(assert (=> b!730992 (=> (not res!491222) (not e!409042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730992 (= res!491222 (validKeyInArray!0 k!2102))))

(declare-fun b!730993 () Bool)

(declare-fun e!409039 () Bool)

(assert (=> b!730993 (= e!409040 e!409039)))

(declare-fun res!491225 () Bool)

(assert (=> b!730993 (=> (not res!491225) (not e!409039))))

(declare-fun lt!323934 () SeekEntryResult!7318)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41197 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!730993 (= res!491225 (= (seekEntryOrOpen!0 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) lt!323934))))

(assert (=> b!730993 (= lt!323934 (Found!7318 j!159))))

(declare-fun b!730994 () Bool)

(declare-fun res!491215 () Bool)

(assert (=> b!730994 (=> (not res!491215) (not e!409044))))

(assert (=> b!730994 (= res!491215 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20139 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20139 a!3186))))))

(declare-fun b!730995 () Bool)

(assert (=> b!730995 (= e!409039 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) lt!323934))))

(declare-fun b!730996 () Bool)

(assert (=> b!730996 (= e!409042 e!409044)))

(declare-fun res!491214 () Bool)

(assert (=> b!730996 (=> (not res!491214) (not e!409044))))

(declare-fun lt!323929 () SeekEntryResult!7318)

(assert (=> b!730996 (= res!491214 (or (= lt!323929 (MissingZero!7318 i!1173)) (= lt!323929 (MissingVacant!7318 i!1173))))))

(assert (=> b!730996 (= lt!323929 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730997 () Bool)

(declare-fun res!491230 () Bool)

(assert (=> b!730997 (=> (not res!491230) (not e!409042))))

(assert (=> b!730997 (= res!491230 (validKeyInArray!0 (select (arr!19718 a!3186) j!159)))))

(declare-fun b!730998 () Bool)

(assert (=> b!730998 (= e!409037 e!409045)))

(declare-fun res!491223 () Bool)

(assert (=> b!730998 (=> (not res!491223) (not e!409045))))

(declare-fun lt!323936 () SeekEntryResult!7318)

(assert (=> b!730998 (= res!491223 (= lt!323936 lt!323931))))

(declare-fun lt!323935 () array!41197)

(declare-fun lt!323933 () (_ BitVec 64))

(assert (=> b!730998 (= lt!323931 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323933 lt!323935 mask!3328))))

(assert (=> b!730998 (= lt!323936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323933 mask!3328) lt!323933 lt!323935 mask!3328))))

(assert (=> b!730998 (= lt!323933 (select (store (arr!19718 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730998 (= lt!323935 (array!41198 (store (arr!19718 a!3186) i!1173 k!2102) (size!20139 a!3186)))))

(assert (= (and start!64748 res!491218) b!730983))

(assert (= (and b!730983 res!491229) b!730997))

(assert (= (and b!730997 res!491230) b!730992))

(assert (= (and b!730992 res!491222) b!730987))

(assert (= (and b!730987 res!491219) b!730996))

(assert (= (and b!730996 res!491214) b!730982))

(assert (= (and b!730982 res!491227) b!730988))

(assert (= (and b!730988 res!491217) b!730994))

(assert (= (and b!730994 res!491215) b!730985))

(assert (= (and b!730985 res!491231) b!730979))

(assert (= (and b!730979 res!491220) b!730980))

(assert (= (and b!730980 c!80257) b!730981))

(assert (= (and b!730980 (not c!80257)) b!730984))

(assert (= (and b!730980 res!491228) b!730998))

(assert (= (and b!730998 res!491223) b!730991))

(assert (= (and b!730991 res!491216) b!730993))

(assert (= (and b!730993 res!491225) b!730995))

(assert (= (and b!730991 (not res!491226)) b!730986))

(assert (= (and b!730986 (not res!491224)) b!730989))

(assert (= (and b!730989 (not res!491221)) b!730990))

(declare-fun m!684427 () Bool)

(assert (=> b!730982 m!684427))

(declare-fun m!684429 () Bool)

(assert (=> b!730993 m!684429))

(assert (=> b!730993 m!684429))

(declare-fun m!684431 () Bool)

(assert (=> b!730993 m!684431))

(declare-fun m!684433 () Bool)

(assert (=> b!730986 m!684433))

(assert (=> b!730997 m!684429))

(assert (=> b!730997 m!684429))

(declare-fun m!684435 () Bool)

(assert (=> b!730997 m!684435))

(declare-fun m!684437 () Bool)

(assert (=> b!730991 m!684437))

(declare-fun m!684439 () Bool)

(assert (=> b!730991 m!684439))

(assert (=> b!730995 m!684429))

(assert (=> b!730995 m!684429))

(declare-fun m!684441 () Bool)

(assert (=> b!730995 m!684441))

(assert (=> b!730989 m!684429))

(assert (=> b!730989 m!684429))

(declare-fun m!684443 () Bool)

(assert (=> b!730989 m!684443))

(declare-fun m!684445 () Bool)

(assert (=> b!730979 m!684445))

(assert (=> b!730985 m!684429))

(assert (=> b!730985 m!684429))

(declare-fun m!684447 () Bool)

(assert (=> b!730985 m!684447))

(assert (=> b!730985 m!684447))

(assert (=> b!730985 m!684429))

(declare-fun m!684449 () Bool)

(assert (=> b!730985 m!684449))

(declare-fun m!684451 () Bool)

(assert (=> b!730987 m!684451))

(declare-fun m!684453 () Bool)

(assert (=> b!730998 m!684453))

(declare-fun m!684455 () Bool)

(assert (=> b!730998 m!684455))

(declare-fun m!684457 () Bool)

(assert (=> b!730998 m!684457))

(assert (=> b!730998 m!684453))

(declare-fun m!684459 () Bool)

(assert (=> b!730998 m!684459))

(declare-fun m!684461 () Bool)

(assert (=> b!730998 m!684461))

(assert (=> b!730984 m!684429))

(assert (=> b!730984 m!684429))

(assert (=> b!730984 m!684443))

(declare-fun m!684463 () Bool)

(assert (=> start!64748 m!684463))

(declare-fun m!684465 () Bool)

(assert (=> start!64748 m!684465))

(assert (=> b!730981 m!684429))

(assert (=> b!730981 m!684429))

(declare-fun m!684467 () Bool)

(assert (=> b!730981 m!684467))

(declare-fun m!684469 () Bool)

(assert (=> b!730996 m!684469))

(declare-fun m!684471 () Bool)

(assert (=> b!730992 m!684471))

(declare-fun m!684473 () Bool)

(assert (=> b!730988 m!684473))

(push 1)

