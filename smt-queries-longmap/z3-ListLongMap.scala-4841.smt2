; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66642 () Bool)

(assert start!66642)

(declare-fun res!519486 () Bool)

(declare-fun e!427619 () Bool)

(assert (=> start!66642 (=> (not res!519486) (not e!427619))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66642 (= res!519486 (validMask!0 mask!3328))))

(assert (=> start!66642 e!427619))

(assert (=> start!66642 true))

(declare-datatypes ((array!42300 0))(
  ( (array!42301 (arr!20252 (Array (_ BitVec 32) (_ BitVec 64))) (size!20673 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42300)

(declare-fun array_inv!16135 (array!42300) Bool)

(assert (=> start!66642 (array_inv!16135 a!3186)))

(declare-fun b!767925 () Bool)

(declare-fun res!519502 () Bool)

(assert (=> b!767925 (=> (not res!519502) (not e!427619))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767925 (= res!519502 (validKeyInArray!0 k0!2102))))

(declare-fun b!767926 () Bool)

(declare-fun res!519503 () Bool)

(declare-fun e!427615 () Bool)

(assert (=> b!767926 (=> (not res!519503) (not e!427615))))

(declare-fun e!427617 () Bool)

(assert (=> b!767926 (= res!519503 e!427617)))

(declare-fun c!84612 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767926 (= c!84612 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767927 () Bool)

(declare-fun res!519488 () Bool)

(assert (=> b!767927 (=> (not res!519488) (not e!427615))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767927 (= res!519488 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20252 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7849 0))(
  ( (MissingZero!7849 (index!33764 (_ BitVec 32))) (Found!7849 (index!33765 (_ BitVec 32))) (Intermediate!7849 (undefined!8661 Bool) (index!33766 (_ BitVec 32)) (x!64698 (_ BitVec 32))) (Undefined!7849) (MissingVacant!7849 (index!33767 (_ BitVec 32))) )
))
(declare-fun lt!341493 () SeekEntryResult!7849)

(declare-fun b!767928 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42300 (_ BitVec 32)) SeekEntryResult!7849)

(assert (=> b!767928 (= e!427617 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341493))))

(declare-fun b!767929 () Bool)

(declare-fun res!519492 () Bool)

(assert (=> b!767929 (=> (not res!519492) (not e!427619))))

(assert (=> b!767929 (= res!519492 (validKeyInArray!0 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!767930 () Bool)

(declare-fun e!427612 () Bool)

(declare-fun lt!341492 () SeekEntryResult!7849)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42300 (_ BitVec 32)) SeekEntryResult!7849)

(assert (=> b!767930 (= e!427612 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341492))))

(declare-fun b!767931 () Bool)

(declare-fun res!519494 () Bool)

(declare-fun e!427611 () Bool)

(assert (=> b!767931 (=> (not res!519494) (not e!427611))))

(assert (=> b!767931 (= res!519494 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20673 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20673 a!3186))))))

(declare-fun b!767932 () Bool)

(declare-fun e!427616 () Bool)

(assert (=> b!767932 (= e!427616 e!427612)))

(declare-fun res!519489 () Bool)

(assert (=> b!767932 (=> (not res!519489) (not e!427612))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42300 (_ BitVec 32)) SeekEntryResult!7849)

(assert (=> b!767932 (= res!519489 (= (seekEntryOrOpen!0 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341492))))

(assert (=> b!767932 (= lt!341492 (Found!7849 j!159))))

(declare-fun b!767933 () Bool)

(declare-fun res!519487 () Bool)

(assert (=> b!767933 (=> (not res!519487) (not e!427619))))

(declare-fun arrayContainsKey!0 (array!42300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767933 (= res!519487 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767934 () Bool)

(declare-fun e!427618 () Bool)

(declare-fun e!427610 () Bool)

(assert (=> b!767934 (= e!427618 (not e!427610))))

(declare-fun res!519496 () Bool)

(assert (=> b!767934 (=> res!519496 e!427610)))

(declare-fun lt!341497 () SeekEntryResult!7849)

(get-info :version)

(assert (=> b!767934 (= res!519496 (or (not ((_ is Intermediate!7849) lt!341497)) (bvsge x!1131 (x!64698 lt!341497))))))

(declare-fun lt!341499 () SeekEntryResult!7849)

(assert (=> b!767934 (= lt!341499 (Found!7849 j!159))))

(assert (=> b!767934 e!427616))

(declare-fun res!519491 () Bool)

(assert (=> b!767934 (=> (not res!519491) (not e!427616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42300 (_ BitVec 32)) Bool)

(assert (=> b!767934 (= res!519491 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26396 0))(
  ( (Unit!26397) )
))
(declare-fun lt!341496 () Unit!26396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26396)

(assert (=> b!767934 (= lt!341496 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!341500 () (_ BitVec 32))

(declare-fun e!427613 () Bool)

(declare-fun b!767935 () Bool)

(assert (=> b!767935 (= e!427613 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341500 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341499))))

(declare-fun b!767936 () Bool)

(assert (=> b!767936 (= e!427611 e!427615)))

(declare-fun res!519495 () Bool)

(assert (=> b!767936 (=> (not res!519495) (not e!427615))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767936 (= res!519495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341493))))

(assert (=> b!767936 (= lt!341493 (Intermediate!7849 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767937 () Bool)

(declare-fun res!519493 () Bool)

(assert (=> b!767937 (=> (not res!519493) (not e!427619))))

(assert (=> b!767937 (= res!519493 (and (= (size!20673 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20673 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20673 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767938 () Bool)

(declare-fun res!519500 () Bool)

(assert (=> b!767938 (=> (not res!519500) (not e!427611))))

(assert (=> b!767938 (= res!519500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767939 () Bool)

(declare-fun res!519490 () Bool)

(assert (=> b!767939 (=> res!519490 e!427613)))

(assert (=> b!767939 (= res!519490 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341499))))

(declare-fun b!767940 () Bool)

(assert (=> b!767940 (= e!427619 e!427611)))

(declare-fun res!519501 () Bool)

(assert (=> b!767940 (=> (not res!519501) (not e!427611))))

(declare-fun lt!341501 () SeekEntryResult!7849)

(assert (=> b!767940 (= res!519501 (or (= lt!341501 (MissingZero!7849 i!1173)) (= lt!341501 (MissingVacant!7849 i!1173))))))

(assert (=> b!767940 (= lt!341501 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767941 () Bool)

(assert (=> b!767941 (= e!427610 e!427613)))

(declare-fun res!519498 () Bool)

(assert (=> b!767941 (=> res!519498 e!427613)))

(assert (=> b!767941 (= res!519498 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767941 (= lt!341500 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767942 () Bool)

(assert (=> b!767942 (= e!427617 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) (Found!7849 j!159)))))

(declare-fun b!767943 () Bool)

(declare-fun res!519499 () Bool)

(assert (=> b!767943 (=> (not res!519499) (not e!427611))))

(declare-datatypes ((List!14293 0))(
  ( (Nil!14290) (Cons!14289 (h!15385 (_ BitVec 64)) (t!20599 List!14293)) )
))
(declare-fun arrayNoDuplicates!0 (array!42300 (_ BitVec 32) List!14293) Bool)

(assert (=> b!767943 (= res!519499 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14290))))

(declare-fun b!767944 () Bool)

(assert (=> b!767944 (= e!427615 e!427618)))

(declare-fun res!519497 () Bool)

(assert (=> b!767944 (=> (not res!519497) (not e!427618))))

(declare-fun lt!341495 () SeekEntryResult!7849)

(assert (=> b!767944 (= res!519497 (= lt!341495 lt!341497))))

(declare-fun lt!341498 () array!42300)

(declare-fun lt!341494 () (_ BitVec 64))

(assert (=> b!767944 (= lt!341497 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341494 lt!341498 mask!3328))))

(assert (=> b!767944 (= lt!341495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341494 mask!3328) lt!341494 lt!341498 mask!3328))))

(assert (=> b!767944 (= lt!341494 (select (store (arr!20252 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767944 (= lt!341498 (array!42301 (store (arr!20252 a!3186) i!1173 k0!2102) (size!20673 a!3186)))))

(assert (= (and start!66642 res!519486) b!767937))

(assert (= (and b!767937 res!519493) b!767929))

(assert (= (and b!767929 res!519492) b!767925))

(assert (= (and b!767925 res!519502) b!767933))

(assert (= (and b!767933 res!519487) b!767940))

(assert (= (and b!767940 res!519501) b!767938))

(assert (= (and b!767938 res!519500) b!767943))

(assert (= (and b!767943 res!519499) b!767931))

(assert (= (and b!767931 res!519494) b!767936))

(assert (= (and b!767936 res!519495) b!767927))

(assert (= (and b!767927 res!519488) b!767926))

(assert (= (and b!767926 c!84612) b!767928))

(assert (= (and b!767926 (not c!84612)) b!767942))

(assert (= (and b!767926 res!519503) b!767944))

(assert (= (and b!767944 res!519497) b!767934))

(assert (= (and b!767934 res!519491) b!767932))

(assert (= (and b!767932 res!519489) b!767930))

(assert (= (and b!767934 (not res!519496)) b!767941))

(assert (= (and b!767941 (not res!519498)) b!767939))

(assert (= (and b!767939 (not res!519490)) b!767935))

(declare-fun m!713017 () Bool)

(assert (=> b!767930 m!713017))

(assert (=> b!767930 m!713017))

(declare-fun m!713019 () Bool)

(assert (=> b!767930 m!713019))

(assert (=> b!767939 m!713017))

(assert (=> b!767939 m!713017))

(declare-fun m!713021 () Bool)

(assert (=> b!767939 m!713021))

(assert (=> b!767936 m!713017))

(assert (=> b!767936 m!713017))

(declare-fun m!713023 () Bool)

(assert (=> b!767936 m!713023))

(assert (=> b!767936 m!713023))

(assert (=> b!767936 m!713017))

(declare-fun m!713025 () Bool)

(assert (=> b!767936 m!713025))

(declare-fun m!713027 () Bool)

(assert (=> b!767938 m!713027))

(assert (=> b!767932 m!713017))

(assert (=> b!767932 m!713017))

(declare-fun m!713029 () Bool)

(assert (=> b!767932 m!713029))

(assert (=> b!767928 m!713017))

(assert (=> b!767928 m!713017))

(declare-fun m!713031 () Bool)

(assert (=> b!767928 m!713031))

(declare-fun m!713033 () Bool)

(assert (=> b!767933 m!713033))

(declare-fun m!713035 () Bool)

(assert (=> b!767927 m!713035))

(declare-fun m!713037 () Bool)

(assert (=> b!767940 m!713037))

(declare-fun m!713039 () Bool)

(assert (=> start!66642 m!713039))

(declare-fun m!713041 () Bool)

(assert (=> start!66642 m!713041))

(declare-fun m!713043 () Bool)

(assert (=> b!767934 m!713043))

(declare-fun m!713045 () Bool)

(assert (=> b!767934 m!713045))

(declare-fun m!713047 () Bool)

(assert (=> b!767943 m!713047))

(assert (=> b!767942 m!713017))

(assert (=> b!767942 m!713017))

(assert (=> b!767942 m!713021))

(declare-fun m!713049 () Bool)

(assert (=> b!767941 m!713049))

(declare-fun m!713051 () Bool)

(assert (=> b!767944 m!713051))

(declare-fun m!713053 () Bool)

(assert (=> b!767944 m!713053))

(declare-fun m!713055 () Bool)

(assert (=> b!767944 m!713055))

(declare-fun m!713057 () Bool)

(assert (=> b!767944 m!713057))

(declare-fun m!713059 () Bool)

(assert (=> b!767944 m!713059))

(assert (=> b!767944 m!713051))

(assert (=> b!767929 m!713017))

(assert (=> b!767929 m!713017))

(declare-fun m!713061 () Bool)

(assert (=> b!767929 m!713061))

(assert (=> b!767935 m!713017))

(assert (=> b!767935 m!713017))

(declare-fun m!713063 () Bool)

(assert (=> b!767935 m!713063))

(declare-fun m!713065 () Bool)

(assert (=> b!767925 m!713065))

(check-sat (not b!767939) (not b!767925) (not b!767930) (not b!767934) (not b!767928) (not b!767940) (not b!767932) (not b!767933) (not b!767944) (not b!767935) (not b!767936) (not b!767938) (not b!767943) (not b!767929) (not b!767942) (not start!66642) (not b!767941))
(check-sat)
(get-model)

(declare-fun d!101285 () Bool)

(declare-fun res!519616 () Bool)

(declare-fun e!427684 () Bool)

(assert (=> d!101285 (=> res!519616 e!427684)))

(assert (=> d!101285 (= res!519616 (= (select (arr!20252 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101285 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!427684)))

(declare-fun b!768069 () Bool)

(declare-fun e!427685 () Bool)

(assert (=> b!768069 (= e!427684 e!427685)))

(declare-fun res!519617 () Bool)

(assert (=> b!768069 (=> (not res!519617) (not e!427685))))

(assert (=> b!768069 (= res!519617 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20673 a!3186)))))

(declare-fun b!768070 () Bool)

(assert (=> b!768070 (= e!427685 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101285 (not res!519616)) b!768069))

(assert (= (and b!768069 res!519617) b!768070))

(declare-fun m!713167 () Bool)

(assert (=> d!101285 m!713167))

(declare-fun m!713169 () Bool)

(assert (=> b!768070 m!713169))

(assert (=> b!767933 d!101285))

(declare-fun b!768089 () Bool)

(declare-fun e!427696 () Bool)

(declare-fun lt!341566 () SeekEntryResult!7849)

(assert (=> b!768089 (= e!427696 (bvsge (x!64698 lt!341566) #b01111111111111111111111111111110))))

(declare-fun b!768090 () Bool)

(assert (=> b!768090 (and (bvsge (index!33766 lt!341566) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341566) (size!20673 lt!341498)))))

(declare-fun res!519624 () Bool)

(assert (=> b!768090 (= res!519624 (= (select (arr!20252 lt!341498) (index!33766 lt!341566)) lt!341494))))

(declare-fun e!427699 () Bool)

(assert (=> b!768090 (=> res!519624 e!427699)))

(declare-fun e!427697 () Bool)

(assert (=> b!768090 (= e!427697 e!427699)))

(declare-fun b!768091 () Bool)

(assert (=> b!768091 (and (bvsge (index!33766 lt!341566) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341566) (size!20673 lt!341498)))))

(assert (=> b!768091 (= e!427699 (= (select (arr!20252 lt!341498) (index!33766 lt!341566)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768092 () Bool)

(assert (=> b!768092 (and (bvsge (index!33766 lt!341566) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341566) (size!20673 lt!341498)))))

(declare-fun res!519625 () Bool)

(assert (=> b!768092 (= res!519625 (= (select (arr!20252 lt!341498) (index!33766 lt!341566)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768092 (=> res!519625 e!427699)))

(declare-fun b!768093 () Bool)

(declare-fun e!427698 () SeekEntryResult!7849)

(declare-fun e!427700 () SeekEntryResult!7849)

(assert (=> b!768093 (= e!427698 e!427700)))

(declare-fun c!84627 () Bool)

(declare-fun lt!341567 () (_ BitVec 64))

(assert (=> b!768093 (= c!84627 (or (= lt!341567 lt!341494) (= (bvadd lt!341567 lt!341567) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768094 () Bool)

(assert (=> b!768094 (= e!427696 e!427697)))

(declare-fun res!519626 () Bool)

(assert (=> b!768094 (= res!519626 (and ((_ is Intermediate!7849) lt!341566) (not (undefined!8661 lt!341566)) (bvslt (x!64698 lt!341566) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341566) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341566) x!1131)))))

(assert (=> b!768094 (=> (not res!519626) (not e!427697))))

(declare-fun b!768095 () Bool)

(assert (=> b!768095 (= e!427700 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341494 lt!341498 mask!3328))))

(declare-fun b!768096 () Bool)

(assert (=> b!768096 (= e!427700 (Intermediate!7849 false index!1321 x!1131))))

(declare-fun b!768097 () Bool)

(assert (=> b!768097 (= e!427698 (Intermediate!7849 true index!1321 x!1131))))

(declare-fun d!101287 () Bool)

(assert (=> d!101287 e!427696))

(declare-fun c!84625 () Bool)

(assert (=> d!101287 (= c!84625 (and ((_ is Intermediate!7849) lt!341566) (undefined!8661 lt!341566)))))

(assert (=> d!101287 (= lt!341566 e!427698)))

(declare-fun c!84626 () Bool)

(assert (=> d!101287 (= c!84626 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101287 (= lt!341567 (select (arr!20252 lt!341498) index!1321))))

(assert (=> d!101287 (validMask!0 mask!3328)))

(assert (=> d!101287 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341494 lt!341498 mask!3328) lt!341566)))

(assert (= (and d!101287 c!84626) b!768097))

(assert (= (and d!101287 (not c!84626)) b!768093))

(assert (= (and b!768093 c!84627) b!768096))

(assert (= (and b!768093 (not c!84627)) b!768095))

(assert (= (and d!101287 c!84625) b!768089))

(assert (= (and d!101287 (not c!84625)) b!768094))

(assert (= (and b!768094 res!519626) b!768090))

(assert (= (and b!768090 (not res!519624)) b!768092))

(assert (= (and b!768092 (not res!519625)) b!768091))

(declare-fun m!713171 () Bool)

(assert (=> b!768091 m!713171))

(declare-fun m!713173 () Bool)

(assert (=> d!101287 m!713173))

(assert (=> d!101287 m!713039))

(assert (=> b!768090 m!713171))

(assert (=> b!768092 m!713171))

(assert (=> b!768095 m!713049))

(assert (=> b!768095 m!713049))

(declare-fun m!713175 () Bool)

(assert (=> b!768095 m!713175))

(assert (=> b!767944 d!101287))

(declare-fun b!768098 () Bool)

(declare-fun e!427701 () Bool)

(declare-fun lt!341568 () SeekEntryResult!7849)

(assert (=> b!768098 (= e!427701 (bvsge (x!64698 lt!341568) #b01111111111111111111111111111110))))

(declare-fun b!768099 () Bool)

(assert (=> b!768099 (and (bvsge (index!33766 lt!341568) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341568) (size!20673 lt!341498)))))

(declare-fun res!519627 () Bool)

(assert (=> b!768099 (= res!519627 (= (select (arr!20252 lt!341498) (index!33766 lt!341568)) lt!341494))))

(declare-fun e!427704 () Bool)

(assert (=> b!768099 (=> res!519627 e!427704)))

(declare-fun e!427702 () Bool)

(assert (=> b!768099 (= e!427702 e!427704)))

(declare-fun b!768100 () Bool)

(assert (=> b!768100 (and (bvsge (index!33766 lt!341568) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341568) (size!20673 lt!341498)))))

(assert (=> b!768100 (= e!427704 (= (select (arr!20252 lt!341498) (index!33766 lt!341568)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768101 () Bool)

(assert (=> b!768101 (and (bvsge (index!33766 lt!341568) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341568) (size!20673 lt!341498)))))

(declare-fun res!519628 () Bool)

(assert (=> b!768101 (= res!519628 (= (select (arr!20252 lt!341498) (index!33766 lt!341568)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768101 (=> res!519628 e!427704)))

(declare-fun b!768102 () Bool)

(declare-fun e!427703 () SeekEntryResult!7849)

(declare-fun e!427705 () SeekEntryResult!7849)

(assert (=> b!768102 (= e!427703 e!427705)))

(declare-fun c!84630 () Bool)

(declare-fun lt!341569 () (_ BitVec 64))

(assert (=> b!768102 (= c!84630 (or (= lt!341569 lt!341494) (= (bvadd lt!341569 lt!341569) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768103 () Bool)

(assert (=> b!768103 (= e!427701 e!427702)))

(declare-fun res!519629 () Bool)

(assert (=> b!768103 (= res!519629 (and ((_ is Intermediate!7849) lt!341568) (not (undefined!8661 lt!341568)) (bvslt (x!64698 lt!341568) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341568) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341568) #b00000000000000000000000000000000)))))

(assert (=> b!768103 (=> (not res!519629) (not e!427702))))

(declare-fun b!768104 () Bool)

(assert (=> b!768104 (= e!427705 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341494 lt!341498 mask!3328))))

(declare-fun b!768105 () Bool)

(assert (=> b!768105 (= e!427705 (Intermediate!7849 false (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768106 () Bool)

(assert (=> b!768106 (= e!427703 (Intermediate!7849 true (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101289 () Bool)

(assert (=> d!101289 e!427701))

(declare-fun c!84628 () Bool)

(assert (=> d!101289 (= c!84628 (and ((_ is Intermediate!7849) lt!341568) (undefined!8661 lt!341568)))))

(assert (=> d!101289 (= lt!341568 e!427703)))

(declare-fun c!84629 () Bool)

(assert (=> d!101289 (= c!84629 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101289 (= lt!341569 (select (arr!20252 lt!341498) (toIndex!0 lt!341494 mask!3328)))))

(assert (=> d!101289 (validMask!0 mask!3328)))

(assert (=> d!101289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341494 mask!3328) lt!341494 lt!341498 mask!3328) lt!341568)))

(assert (= (and d!101289 c!84629) b!768106))

(assert (= (and d!101289 (not c!84629)) b!768102))

(assert (= (and b!768102 c!84630) b!768105))

(assert (= (and b!768102 (not c!84630)) b!768104))

(assert (= (and d!101289 c!84628) b!768098))

(assert (= (and d!101289 (not c!84628)) b!768103))

(assert (= (and b!768103 res!519629) b!768099))

(assert (= (and b!768099 (not res!519627)) b!768101))

(assert (= (and b!768101 (not res!519628)) b!768100))

(declare-fun m!713177 () Bool)

(assert (=> b!768100 m!713177))

(assert (=> d!101289 m!713051))

(declare-fun m!713179 () Bool)

(assert (=> d!101289 m!713179))

(assert (=> d!101289 m!713039))

(assert (=> b!768099 m!713177))

(assert (=> b!768101 m!713177))

(assert (=> b!768104 m!713051))

(declare-fun m!713181 () Bool)

(assert (=> b!768104 m!713181))

(assert (=> b!768104 m!713181))

(declare-fun m!713183 () Bool)

(assert (=> b!768104 m!713183))

(assert (=> b!767944 d!101289))

(declare-fun d!101291 () Bool)

(declare-fun lt!341575 () (_ BitVec 32))

(declare-fun lt!341574 () (_ BitVec 32))

(assert (=> d!101291 (= lt!341575 (bvmul (bvxor lt!341574 (bvlshr lt!341574 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101291 (= lt!341574 ((_ extract 31 0) (bvand (bvxor lt!341494 (bvlshr lt!341494 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101291 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519630 (let ((h!15388 ((_ extract 31 0) (bvand (bvxor lt!341494 (bvlshr lt!341494 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64702 (bvmul (bvxor h!15388 (bvlshr h!15388 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64702 (bvlshr x!64702 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519630 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519630 #b00000000000000000000000000000000))))))

(assert (=> d!101291 (= (toIndex!0 lt!341494 mask!3328) (bvand (bvxor lt!341575 (bvlshr lt!341575 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767944 d!101291))

(declare-fun b!768119 () Bool)

(declare-fun e!427713 () SeekEntryResult!7849)

(assert (=> b!768119 (= e!427713 Undefined!7849)))

(declare-fun b!768120 () Bool)

(declare-fun c!84639 () Bool)

(declare-fun lt!341580 () (_ BitVec 64))

(assert (=> b!768120 (= c!84639 (= lt!341580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427714 () SeekEntryResult!7849)

(declare-fun e!427712 () SeekEntryResult!7849)

(assert (=> b!768120 (= e!427714 e!427712)))

(declare-fun b!768121 () Bool)

(assert (=> b!768121 (= e!427713 e!427714)))

(declare-fun c!84638 () Bool)

(assert (=> b!768121 (= c!84638 (= lt!341580 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768122 () Bool)

(assert (=> b!768122 (= e!427712 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!341581 () SeekEntryResult!7849)

(declare-fun d!101293 () Bool)

(assert (=> d!101293 (and (or ((_ is Undefined!7849) lt!341581) (not ((_ is Found!7849) lt!341581)) (and (bvsge (index!33765 lt!341581) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341581) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341581) ((_ is Found!7849) lt!341581) (not ((_ is MissingVacant!7849) lt!341581)) (not (= (index!33767 lt!341581) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341581) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341581) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341581) (ite ((_ is Found!7849) lt!341581) (= (select (arr!20252 a!3186) (index!33765 lt!341581)) (select (arr!20252 a!3186) j!159)) (and ((_ is MissingVacant!7849) lt!341581) (= (index!33767 lt!341581) resIntermediateIndex!5) (= (select (arr!20252 a!3186) (index!33767 lt!341581)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101293 (= lt!341581 e!427713)))

(declare-fun c!84637 () Bool)

(assert (=> d!101293 (= c!84637 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101293 (= lt!341580 (select (arr!20252 a!3186) index!1321))))

(assert (=> d!101293 (validMask!0 mask!3328)))

(assert (=> d!101293 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341581)))

(declare-fun b!768123 () Bool)

(assert (=> b!768123 (= e!427712 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!768124 () Bool)

(assert (=> b!768124 (= e!427714 (Found!7849 index!1321))))

(assert (= (and d!101293 c!84637) b!768119))

(assert (= (and d!101293 (not c!84637)) b!768121))

(assert (= (and b!768121 c!84638) b!768124))

(assert (= (and b!768121 (not c!84638)) b!768120))

(assert (= (and b!768120 c!84639) b!768123))

(assert (= (and b!768120 (not c!84639)) b!768122))

(assert (=> b!768122 m!713049))

(assert (=> b!768122 m!713049))

(assert (=> b!768122 m!713017))

(declare-fun m!713185 () Bool)

(assert (=> b!768122 m!713185))

(declare-fun m!713187 () Bool)

(assert (=> d!101293 m!713187))

(declare-fun m!713189 () Bool)

(assert (=> d!101293 m!713189))

(declare-fun m!713191 () Bool)

(assert (=> d!101293 m!713191))

(assert (=> d!101293 m!713039))

(assert (=> b!767942 d!101293))

(declare-fun b!768137 () Bool)

(declare-fun e!427723 () SeekEntryResult!7849)

(declare-fun lt!341589 () SeekEntryResult!7849)

(assert (=> b!768137 (= e!427723 (Found!7849 (index!33766 lt!341589)))))

(declare-fun b!768138 () Bool)

(declare-fun e!427721 () SeekEntryResult!7849)

(assert (=> b!768138 (= e!427721 (MissingZero!7849 (index!33766 lt!341589)))))

(declare-fun b!768139 () Bool)

(assert (=> b!768139 (= e!427721 (seekKeyOrZeroReturnVacant!0 (x!64698 lt!341589) (index!33766 lt!341589) (index!33766 lt!341589) (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768140 () Bool)

(declare-fun e!427722 () SeekEntryResult!7849)

(assert (=> b!768140 (= e!427722 Undefined!7849)))

(declare-fun d!101295 () Bool)

(declare-fun lt!341590 () SeekEntryResult!7849)

(assert (=> d!101295 (and (or ((_ is Undefined!7849) lt!341590) (not ((_ is Found!7849) lt!341590)) (and (bvsge (index!33765 lt!341590) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341590) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341590) ((_ is Found!7849) lt!341590) (not ((_ is MissingZero!7849) lt!341590)) (and (bvsge (index!33764 lt!341590) #b00000000000000000000000000000000) (bvslt (index!33764 lt!341590) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341590) ((_ is Found!7849) lt!341590) ((_ is MissingZero!7849) lt!341590) (not ((_ is MissingVacant!7849) lt!341590)) (and (bvsge (index!33767 lt!341590) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341590) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341590) (ite ((_ is Found!7849) lt!341590) (= (select (arr!20252 a!3186) (index!33765 lt!341590)) (select (arr!20252 a!3186) j!159)) (ite ((_ is MissingZero!7849) lt!341590) (= (select (arr!20252 a!3186) (index!33764 lt!341590)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7849) lt!341590) (= (select (arr!20252 a!3186) (index!33767 lt!341590)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101295 (= lt!341590 e!427722)))

(declare-fun c!84646 () Bool)

(assert (=> d!101295 (= c!84646 (and ((_ is Intermediate!7849) lt!341589) (undefined!8661 lt!341589)))))

(assert (=> d!101295 (= lt!341589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101295 (validMask!0 mask!3328)))

(assert (=> d!101295 (= (seekEntryOrOpen!0 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341590)))

(declare-fun b!768141 () Bool)

(assert (=> b!768141 (= e!427722 e!427723)))

(declare-fun lt!341588 () (_ BitVec 64))

(assert (=> b!768141 (= lt!341588 (select (arr!20252 a!3186) (index!33766 lt!341589)))))

(declare-fun c!84647 () Bool)

(assert (=> b!768141 (= c!84647 (= lt!341588 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768142 () Bool)

(declare-fun c!84648 () Bool)

(assert (=> b!768142 (= c!84648 (= lt!341588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768142 (= e!427723 e!427721)))

(assert (= (and d!101295 c!84646) b!768140))

(assert (= (and d!101295 (not c!84646)) b!768141))

(assert (= (and b!768141 c!84647) b!768137))

(assert (= (and b!768141 (not c!84647)) b!768142))

(assert (= (and b!768142 c!84648) b!768138))

(assert (= (and b!768142 (not c!84648)) b!768139))

(assert (=> b!768139 m!713017))

(declare-fun m!713193 () Bool)

(assert (=> b!768139 m!713193))

(declare-fun m!713195 () Bool)

(assert (=> d!101295 m!713195))

(assert (=> d!101295 m!713023))

(assert (=> d!101295 m!713017))

(assert (=> d!101295 m!713025))

(assert (=> d!101295 m!713039))

(declare-fun m!713197 () Bool)

(assert (=> d!101295 m!713197))

(declare-fun m!713199 () Bool)

(assert (=> d!101295 m!713199))

(assert (=> d!101295 m!713017))

(assert (=> d!101295 m!713023))

(declare-fun m!713201 () Bool)

(assert (=> b!768141 m!713201))

(assert (=> b!767932 d!101295))

(declare-fun b!768161 () Bool)

(declare-fun e!427738 () Bool)

(declare-fun call!35062 () Bool)

(assert (=> b!768161 (= e!427738 call!35062)))

(declare-fun b!768162 () Bool)

(declare-fun e!427739 () Bool)

(assert (=> b!768162 (= e!427739 e!427738)))

(declare-fun c!84655 () Bool)

(assert (=> b!768162 (= c!84655 (validKeyInArray!0 (select (arr!20252 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35059 () Bool)

(assert (=> bm!35059 (= call!35062 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84655 (Cons!14289 (select (arr!20252 a!3186) #b00000000000000000000000000000000) Nil!14290) Nil!14290)))))

(declare-fun d!101299 () Bool)

(declare-fun res!519638 () Bool)

(declare-fun e!427736 () Bool)

(assert (=> d!101299 (=> res!519638 e!427736)))

(assert (=> d!101299 (= res!519638 (bvsge #b00000000000000000000000000000000 (size!20673 a!3186)))))

(assert (=> d!101299 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14290) e!427736)))

(declare-fun b!768163 () Bool)

(assert (=> b!768163 (= e!427738 call!35062)))

(declare-fun b!768164 () Bool)

(declare-fun e!427737 () Bool)

(declare-fun contains!4066 (List!14293 (_ BitVec 64)) Bool)

(assert (=> b!768164 (= e!427737 (contains!4066 Nil!14290 (select (arr!20252 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768165 () Bool)

(assert (=> b!768165 (= e!427736 e!427739)))

(declare-fun res!519637 () Bool)

(assert (=> b!768165 (=> (not res!519637) (not e!427739))))

(assert (=> b!768165 (= res!519637 (not e!427737))))

(declare-fun res!519639 () Bool)

(assert (=> b!768165 (=> (not res!519639) (not e!427737))))

(assert (=> b!768165 (= res!519639 (validKeyInArray!0 (select (arr!20252 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101299 (not res!519638)) b!768165))

(assert (= (and b!768165 res!519639) b!768164))

(assert (= (and b!768165 res!519637) b!768162))

(assert (= (and b!768162 c!84655) b!768161))

(assert (= (and b!768162 (not c!84655)) b!768163))

(assert (= (or b!768161 b!768163) bm!35059))

(assert (=> b!768162 m!713167))

(assert (=> b!768162 m!713167))

(declare-fun m!713203 () Bool)

(assert (=> b!768162 m!713203))

(assert (=> bm!35059 m!713167))

(declare-fun m!713205 () Bool)

(assert (=> bm!35059 m!713205))

(assert (=> b!768164 m!713167))

(assert (=> b!768164 m!713167))

(declare-fun m!713207 () Bool)

(assert (=> b!768164 m!713207))

(assert (=> b!768165 m!713167))

(assert (=> b!768165 m!713167))

(assert (=> b!768165 m!713203))

(assert (=> b!767943 d!101299))

(declare-fun d!101301 () Bool)

(assert (=> d!101301 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767925 d!101301))

(declare-fun b!768176 () Bool)

(declare-fun e!427746 () Bool)

(declare-fun lt!341595 () SeekEntryResult!7849)

(assert (=> b!768176 (= e!427746 (bvsge (x!64698 lt!341595) #b01111111111111111111111111111110))))

(declare-fun b!768177 () Bool)

(assert (=> b!768177 (and (bvsge (index!33766 lt!341595) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341595) (size!20673 a!3186)))))

(declare-fun res!519646 () Bool)

(assert (=> b!768177 (= res!519646 (= (select (arr!20252 a!3186) (index!33766 lt!341595)) (select (arr!20252 a!3186) j!159)))))

(declare-fun e!427749 () Bool)

(assert (=> b!768177 (=> res!519646 e!427749)))

(declare-fun e!427747 () Bool)

(assert (=> b!768177 (= e!427747 e!427749)))

(declare-fun b!768178 () Bool)

(assert (=> b!768178 (and (bvsge (index!33766 lt!341595) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341595) (size!20673 a!3186)))))

(assert (=> b!768178 (= e!427749 (= (select (arr!20252 a!3186) (index!33766 lt!341595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768179 () Bool)

(assert (=> b!768179 (and (bvsge (index!33766 lt!341595) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341595) (size!20673 a!3186)))))

(declare-fun res!519647 () Bool)

(assert (=> b!768179 (= res!519647 (= (select (arr!20252 a!3186) (index!33766 lt!341595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768179 (=> res!519647 e!427749)))

(declare-fun b!768180 () Bool)

(declare-fun e!427748 () SeekEntryResult!7849)

(declare-fun e!427750 () SeekEntryResult!7849)

(assert (=> b!768180 (= e!427748 e!427750)))

(declare-fun c!84660 () Bool)

(declare-fun lt!341596 () (_ BitVec 64))

(assert (=> b!768180 (= c!84660 (or (= lt!341596 (select (arr!20252 a!3186) j!159)) (= (bvadd lt!341596 lt!341596) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768181 () Bool)

(assert (=> b!768181 (= e!427746 e!427747)))

(declare-fun res!519648 () Bool)

(assert (=> b!768181 (= res!519648 (and ((_ is Intermediate!7849) lt!341595) (not (undefined!8661 lt!341595)) (bvslt (x!64698 lt!341595) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341595) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341595) #b00000000000000000000000000000000)))))

(assert (=> b!768181 (=> (not res!519648) (not e!427747))))

(declare-fun b!768182 () Bool)

(assert (=> b!768182 (= e!427750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768183 () Bool)

(assert (=> b!768183 (= e!427750 (Intermediate!7849 false (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768184 () Bool)

(assert (=> b!768184 (= e!427748 (Intermediate!7849 true (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101303 () Bool)

(assert (=> d!101303 e!427746))

(declare-fun c!84658 () Bool)

(assert (=> d!101303 (= c!84658 (and ((_ is Intermediate!7849) lt!341595) (undefined!8661 lt!341595)))))

(assert (=> d!101303 (= lt!341595 e!427748)))

(declare-fun c!84659 () Bool)

(assert (=> d!101303 (= c!84659 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101303 (= lt!341596 (select (arr!20252 a!3186) (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328)))))

(assert (=> d!101303 (validMask!0 mask!3328)))

(assert (=> d!101303 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341595)))

(assert (= (and d!101303 c!84659) b!768184))

(assert (= (and d!101303 (not c!84659)) b!768180))

(assert (= (and b!768180 c!84660) b!768183))

(assert (= (and b!768180 (not c!84660)) b!768182))

(assert (= (and d!101303 c!84658) b!768176))

(assert (= (and d!101303 (not c!84658)) b!768181))

(assert (= (and b!768181 res!519648) b!768177))

(assert (= (and b!768177 (not res!519646)) b!768179))

(assert (= (and b!768179 (not res!519647)) b!768178))

(declare-fun m!713209 () Bool)

(assert (=> b!768178 m!713209))

(assert (=> d!101303 m!713023))

(declare-fun m!713211 () Bool)

(assert (=> d!101303 m!713211))

(assert (=> d!101303 m!713039))

(assert (=> b!768177 m!713209))

(assert (=> b!768179 m!713209))

(assert (=> b!768182 m!713023))

(declare-fun m!713213 () Bool)

(assert (=> b!768182 m!713213))

(assert (=> b!768182 m!713213))

(assert (=> b!768182 m!713017))

(declare-fun m!713215 () Bool)

(assert (=> b!768182 m!713215))

(assert (=> b!767936 d!101303))

(declare-fun d!101305 () Bool)

(declare-fun lt!341598 () (_ BitVec 32))

(declare-fun lt!341597 () (_ BitVec 32))

(assert (=> d!101305 (= lt!341598 (bvmul (bvxor lt!341597 (bvlshr lt!341597 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101305 (= lt!341597 ((_ extract 31 0) (bvand (bvxor (select (arr!20252 a!3186) j!159) (bvlshr (select (arr!20252 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101305 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519630 (let ((h!15388 ((_ extract 31 0) (bvand (bvxor (select (arr!20252 a!3186) j!159) (bvlshr (select (arr!20252 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64702 (bvmul (bvxor h!15388 (bvlshr h!15388 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64702 (bvlshr x!64702 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519630 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519630 #b00000000000000000000000000000000))))))

(assert (=> d!101305 (= (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) (bvand (bvxor lt!341598 (bvlshr lt!341598 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767936 d!101305))

(declare-fun b!768211 () Bool)

(declare-fun e!427768 () Bool)

(declare-fun call!35065 () Bool)

(assert (=> b!768211 (= e!427768 call!35065)))

(declare-fun bm!35062 () Bool)

(assert (=> bm!35062 (= call!35065 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101307 () Bool)

(declare-fun res!519660 () Bool)

(declare-fun e!427769 () Bool)

(assert (=> d!101307 (=> res!519660 e!427769)))

(assert (=> d!101307 (= res!519660 (bvsge j!159 (size!20673 a!3186)))))

(assert (=> d!101307 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427769)))

(declare-fun b!768212 () Bool)

(assert (=> b!768212 (= e!427769 e!427768)))

(declare-fun c!84669 () Bool)

(assert (=> b!768212 (= c!84669 (validKeyInArray!0 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768213 () Bool)

(declare-fun e!427767 () Bool)

(assert (=> b!768213 (= e!427767 call!35065)))

(declare-fun b!768214 () Bool)

(assert (=> b!768214 (= e!427768 e!427767)))

(declare-fun lt!341617 () (_ BitVec 64))

(assert (=> b!768214 (= lt!341617 (select (arr!20252 a!3186) j!159))))

(declare-fun lt!341616 () Unit!26396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42300 (_ BitVec 64) (_ BitVec 32)) Unit!26396)

(assert (=> b!768214 (= lt!341616 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341617 j!159))))

(assert (=> b!768214 (arrayContainsKey!0 a!3186 lt!341617 #b00000000000000000000000000000000)))

(declare-fun lt!341615 () Unit!26396)

(assert (=> b!768214 (= lt!341615 lt!341616)))

(declare-fun res!519661 () Bool)

(assert (=> b!768214 (= res!519661 (= (seekEntryOrOpen!0 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) (Found!7849 j!159)))))

(assert (=> b!768214 (=> (not res!519661) (not e!427767))))

(assert (= (and d!101307 (not res!519660)) b!768212))

(assert (= (and b!768212 c!84669) b!768214))

(assert (= (and b!768212 (not c!84669)) b!768211))

(assert (= (and b!768214 res!519661) b!768213))

(assert (= (or b!768213 b!768211) bm!35062))

(declare-fun m!713231 () Bool)

(assert (=> bm!35062 m!713231))

(assert (=> b!768212 m!713017))

(assert (=> b!768212 m!713017))

(assert (=> b!768212 m!713061))

(assert (=> b!768214 m!713017))

(declare-fun m!713233 () Bool)

(assert (=> b!768214 m!713233))

(declare-fun m!713235 () Bool)

(assert (=> b!768214 m!713235))

(assert (=> b!768214 m!713017))

(assert (=> b!768214 m!713029))

(assert (=> b!767934 d!101307))

(declare-fun d!101315 () Bool)

(assert (=> d!101315 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341620 () Unit!26396)

(declare-fun choose!38 (array!42300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26396)

(assert (=> d!101315 (= lt!341620 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101315 (validMask!0 mask!3328)))

(assert (=> d!101315 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341620)))

(declare-fun bs!21503 () Bool)

(assert (= bs!21503 d!101315))

(assert (=> bs!21503 m!713043))

(declare-fun m!713237 () Bool)

(assert (=> bs!21503 m!713237))

(assert (=> bs!21503 m!713039))

(assert (=> b!767934 d!101315))

(declare-fun b!768215 () Bool)

(declare-fun e!427771 () SeekEntryResult!7849)

(assert (=> b!768215 (= e!427771 Undefined!7849)))

(declare-fun b!768216 () Bool)

(declare-fun c!84672 () Bool)

(declare-fun lt!341621 () (_ BitVec 64))

(assert (=> b!768216 (= c!84672 (= lt!341621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427772 () SeekEntryResult!7849)

(declare-fun e!427770 () SeekEntryResult!7849)

(assert (=> b!768216 (= e!427772 e!427770)))

(declare-fun b!768217 () Bool)

(assert (=> b!768217 (= e!427771 e!427772)))

(declare-fun c!84671 () Bool)

(assert (=> b!768217 (= c!84671 (= lt!341621 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768218 () Bool)

(assert (=> b!768218 (= e!427770 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341500 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!341622 () SeekEntryResult!7849)

(declare-fun d!101317 () Bool)

(assert (=> d!101317 (and (or ((_ is Undefined!7849) lt!341622) (not ((_ is Found!7849) lt!341622)) (and (bvsge (index!33765 lt!341622) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341622) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341622) ((_ is Found!7849) lt!341622) (not ((_ is MissingVacant!7849) lt!341622)) (not (= (index!33767 lt!341622) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341622) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341622) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341622) (ite ((_ is Found!7849) lt!341622) (= (select (arr!20252 a!3186) (index!33765 lt!341622)) (select (arr!20252 a!3186) j!159)) (and ((_ is MissingVacant!7849) lt!341622) (= (index!33767 lt!341622) resIntermediateIndex!5) (= (select (arr!20252 a!3186) (index!33767 lt!341622)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101317 (= lt!341622 e!427771)))

(declare-fun c!84670 () Bool)

(assert (=> d!101317 (= c!84670 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101317 (= lt!341621 (select (arr!20252 a!3186) lt!341500))))

(assert (=> d!101317 (validMask!0 mask!3328)))

(assert (=> d!101317 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341500 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341622)))

(declare-fun b!768219 () Bool)

(assert (=> b!768219 (= e!427770 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!768220 () Bool)

(assert (=> b!768220 (= e!427772 (Found!7849 lt!341500))))

(assert (= (and d!101317 c!84670) b!768215))

(assert (= (and d!101317 (not c!84670)) b!768217))

(assert (= (and b!768217 c!84671) b!768220))

(assert (= (and b!768217 (not c!84671)) b!768216))

(assert (= (and b!768216 c!84672) b!768219))

(assert (= (and b!768216 (not c!84672)) b!768218))

(declare-fun m!713239 () Bool)

(assert (=> b!768218 m!713239))

(assert (=> b!768218 m!713239))

(assert (=> b!768218 m!713017))

(declare-fun m!713241 () Bool)

(assert (=> b!768218 m!713241))

(declare-fun m!713243 () Bool)

(assert (=> d!101317 m!713243))

(declare-fun m!713245 () Bool)

(assert (=> d!101317 m!713245))

(declare-fun m!713247 () Bool)

(assert (=> d!101317 m!713247))

(assert (=> d!101317 m!713039))

(assert (=> b!767935 d!101317))

(declare-fun b!768221 () Bool)

(declare-fun e!427774 () Bool)

(declare-fun call!35066 () Bool)

(assert (=> b!768221 (= e!427774 call!35066)))

(declare-fun bm!35063 () Bool)

(assert (=> bm!35063 (= call!35066 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101319 () Bool)

(declare-fun res!519662 () Bool)

(declare-fun e!427775 () Bool)

(assert (=> d!101319 (=> res!519662 e!427775)))

(assert (=> d!101319 (= res!519662 (bvsge #b00000000000000000000000000000000 (size!20673 a!3186)))))

(assert (=> d!101319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427775)))

(declare-fun b!768222 () Bool)

(assert (=> b!768222 (= e!427775 e!427774)))

(declare-fun c!84673 () Bool)

(assert (=> b!768222 (= c!84673 (validKeyInArray!0 (select (arr!20252 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768223 () Bool)

(declare-fun e!427773 () Bool)

(assert (=> b!768223 (= e!427773 call!35066)))

(declare-fun b!768224 () Bool)

(assert (=> b!768224 (= e!427774 e!427773)))

(declare-fun lt!341625 () (_ BitVec 64))

(assert (=> b!768224 (= lt!341625 (select (arr!20252 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341624 () Unit!26396)

(assert (=> b!768224 (= lt!341624 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341625 #b00000000000000000000000000000000))))

(assert (=> b!768224 (arrayContainsKey!0 a!3186 lt!341625 #b00000000000000000000000000000000)))

(declare-fun lt!341623 () Unit!26396)

(assert (=> b!768224 (= lt!341623 lt!341624)))

(declare-fun res!519663 () Bool)

(assert (=> b!768224 (= res!519663 (= (seekEntryOrOpen!0 (select (arr!20252 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7849 #b00000000000000000000000000000000)))))

(assert (=> b!768224 (=> (not res!519663) (not e!427773))))

(assert (= (and d!101319 (not res!519662)) b!768222))

(assert (= (and b!768222 c!84673) b!768224))

(assert (= (and b!768222 (not c!84673)) b!768221))

(assert (= (and b!768224 res!519663) b!768223))

(assert (= (or b!768223 b!768221) bm!35063))

(declare-fun m!713249 () Bool)

(assert (=> bm!35063 m!713249))

(assert (=> b!768222 m!713167))

(assert (=> b!768222 m!713167))

(assert (=> b!768222 m!713203))

(assert (=> b!768224 m!713167))

(declare-fun m!713251 () Bool)

(assert (=> b!768224 m!713251))

(declare-fun m!713253 () Bool)

(assert (=> b!768224 m!713253))

(assert (=> b!768224 m!713167))

(declare-fun m!713255 () Bool)

(assert (=> b!768224 m!713255))

(assert (=> b!767938 d!101319))

(declare-fun b!768225 () Bool)

(declare-fun e!427776 () Bool)

(declare-fun lt!341626 () SeekEntryResult!7849)

(assert (=> b!768225 (= e!427776 (bvsge (x!64698 lt!341626) #b01111111111111111111111111111110))))

(declare-fun b!768226 () Bool)

(assert (=> b!768226 (and (bvsge (index!33766 lt!341626) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341626) (size!20673 a!3186)))))

(declare-fun res!519664 () Bool)

(assert (=> b!768226 (= res!519664 (= (select (arr!20252 a!3186) (index!33766 lt!341626)) (select (arr!20252 a!3186) j!159)))))

(declare-fun e!427779 () Bool)

(assert (=> b!768226 (=> res!519664 e!427779)))

(declare-fun e!427777 () Bool)

(assert (=> b!768226 (= e!427777 e!427779)))

(declare-fun b!768227 () Bool)

(assert (=> b!768227 (and (bvsge (index!33766 lt!341626) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341626) (size!20673 a!3186)))))

(assert (=> b!768227 (= e!427779 (= (select (arr!20252 a!3186) (index!33766 lt!341626)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768228 () Bool)

(assert (=> b!768228 (and (bvsge (index!33766 lt!341626) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341626) (size!20673 a!3186)))))

(declare-fun res!519665 () Bool)

(assert (=> b!768228 (= res!519665 (= (select (arr!20252 a!3186) (index!33766 lt!341626)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768228 (=> res!519665 e!427779)))

(declare-fun b!768229 () Bool)

(declare-fun e!427778 () SeekEntryResult!7849)

(declare-fun e!427780 () SeekEntryResult!7849)

(assert (=> b!768229 (= e!427778 e!427780)))

(declare-fun lt!341627 () (_ BitVec 64))

(declare-fun c!84676 () Bool)

(assert (=> b!768229 (= c!84676 (or (= lt!341627 (select (arr!20252 a!3186) j!159)) (= (bvadd lt!341627 lt!341627) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768230 () Bool)

(assert (=> b!768230 (= e!427776 e!427777)))

(declare-fun res!519666 () Bool)

(assert (=> b!768230 (= res!519666 (and ((_ is Intermediate!7849) lt!341626) (not (undefined!8661 lt!341626)) (bvslt (x!64698 lt!341626) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341626) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341626) x!1131)))))

(assert (=> b!768230 (=> (not res!519666) (not e!427777))))

(declare-fun b!768231 () Bool)

(assert (=> b!768231 (= e!427780 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768232 () Bool)

(assert (=> b!768232 (= e!427780 (Intermediate!7849 false index!1321 x!1131))))

(declare-fun b!768233 () Bool)

(assert (=> b!768233 (= e!427778 (Intermediate!7849 true index!1321 x!1131))))

(declare-fun d!101321 () Bool)

(assert (=> d!101321 e!427776))

(declare-fun c!84674 () Bool)

(assert (=> d!101321 (= c!84674 (and ((_ is Intermediate!7849) lt!341626) (undefined!8661 lt!341626)))))

(assert (=> d!101321 (= lt!341626 e!427778)))

(declare-fun c!84675 () Bool)

(assert (=> d!101321 (= c!84675 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101321 (= lt!341627 (select (arr!20252 a!3186) index!1321))))

(assert (=> d!101321 (validMask!0 mask!3328)))

(assert (=> d!101321 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341626)))

(assert (= (and d!101321 c!84675) b!768233))

(assert (= (and d!101321 (not c!84675)) b!768229))

(assert (= (and b!768229 c!84676) b!768232))

(assert (= (and b!768229 (not c!84676)) b!768231))

(assert (= (and d!101321 c!84674) b!768225))

(assert (= (and d!101321 (not c!84674)) b!768230))

(assert (= (and b!768230 res!519666) b!768226))

(assert (= (and b!768226 (not res!519664)) b!768228))

(assert (= (and b!768228 (not res!519665)) b!768227))

(declare-fun m!713257 () Bool)

(assert (=> b!768227 m!713257))

(assert (=> d!101321 m!713191))

(assert (=> d!101321 m!713039))

(assert (=> b!768226 m!713257))

(assert (=> b!768228 m!713257))

(assert (=> b!768231 m!713049))

(assert (=> b!768231 m!713049))

(assert (=> b!768231 m!713017))

(declare-fun m!713259 () Bool)

(assert (=> b!768231 m!713259))

(assert (=> b!767928 d!101321))

(assert (=> b!767939 d!101293))

(declare-fun d!101323 () Bool)

(assert (=> d!101323 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66642 d!101323))

(declare-fun d!101325 () Bool)

(assert (=> d!101325 (= (array_inv!16135 a!3186) (bvsge (size!20673 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66642 d!101325))

(declare-fun b!768246 () Bool)

(declare-fun e!427788 () SeekEntryResult!7849)

(assert (=> b!768246 (= e!427788 Undefined!7849)))

(declare-fun b!768247 () Bool)

(declare-fun c!84685 () Bool)

(declare-fun lt!341634 () (_ BitVec 64))

(assert (=> b!768247 (= c!84685 (= lt!341634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427789 () SeekEntryResult!7849)

(declare-fun e!427787 () SeekEntryResult!7849)

(assert (=> b!768247 (= e!427789 e!427787)))

(declare-fun b!768248 () Bool)

(assert (=> b!768248 (= e!427788 e!427789)))

(declare-fun c!84684 () Bool)

(assert (=> b!768248 (= c!84684 (= lt!341634 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768249 () Bool)

(assert (=> b!768249 (= e!427787 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101327 () Bool)

(declare-fun lt!341635 () SeekEntryResult!7849)

(assert (=> d!101327 (and (or ((_ is Undefined!7849) lt!341635) (not ((_ is Found!7849) lt!341635)) (and (bvsge (index!33765 lt!341635) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341635) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341635) ((_ is Found!7849) lt!341635) (not ((_ is MissingVacant!7849) lt!341635)) (not (= (index!33767 lt!341635) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341635) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341635) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341635) (ite ((_ is Found!7849) lt!341635) (= (select (arr!20252 a!3186) (index!33765 lt!341635)) (select (arr!20252 a!3186) j!159)) (and ((_ is MissingVacant!7849) lt!341635) (= (index!33767 lt!341635) resIntermediateIndex!5) (= (select (arr!20252 a!3186) (index!33767 lt!341635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101327 (= lt!341635 e!427788)))

(declare-fun c!84683 () Bool)

(assert (=> d!101327 (= c!84683 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101327 (= lt!341634 (select (arr!20252 a!3186) resIntermediateIndex!5))))

(assert (=> d!101327 (validMask!0 mask!3328)))

(assert (=> d!101327 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341635)))

(declare-fun b!768250 () Bool)

(assert (=> b!768250 (= e!427787 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!768251 () Bool)

(assert (=> b!768251 (= e!427789 (Found!7849 resIntermediateIndex!5))))

(assert (= (and d!101327 c!84683) b!768246))

(assert (= (and d!101327 (not c!84683)) b!768248))

(assert (= (and b!768248 c!84684) b!768251))

(assert (= (and b!768248 (not c!84684)) b!768247))

(assert (= (and b!768247 c!84685) b!768250))

(assert (= (and b!768247 (not c!84685)) b!768249))

(declare-fun m!713261 () Bool)

(assert (=> b!768249 m!713261))

(assert (=> b!768249 m!713261))

(assert (=> b!768249 m!713017))

(declare-fun m!713263 () Bool)

(assert (=> b!768249 m!713263))

(declare-fun m!713265 () Bool)

(assert (=> d!101327 m!713265))

(declare-fun m!713267 () Bool)

(assert (=> d!101327 m!713267))

(assert (=> d!101327 m!713035))

(assert (=> d!101327 m!713039))

(assert (=> b!767930 d!101327))

(declare-fun d!101329 () Bool)

(declare-fun lt!341641 () (_ BitVec 32))

(assert (=> d!101329 (and (bvsge lt!341641 #b00000000000000000000000000000000) (bvslt lt!341641 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101329 (= lt!341641 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101329 (validMask!0 mask!3328)))

(assert (=> d!101329 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341641)))

(declare-fun bs!21504 () Bool)

(assert (= bs!21504 d!101329))

(declare-fun m!713283 () Bool)

(assert (=> bs!21504 m!713283))

(assert (=> bs!21504 m!713039))

(assert (=> b!767941 d!101329))

(declare-fun d!101333 () Bool)

(assert (=> d!101333 (= (validKeyInArray!0 (select (arr!20252 a!3186) j!159)) (and (not (= (select (arr!20252 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20252 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767929 d!101333))

(declare-fun b!768258 () Bool)

(declare-fun e!427795 () SeekEntryResult!7849)

(declare-fun lt!341643 () SeekEntryResult!7849)

(assert (=> b!768258 (= e!427795 (Found!7849 (index!33766 lt!341643)))))

(declare-fun b!768259 () Bool)

(declare-fun e!427793 () SeekEntryResult!7849)

(assert (=> b!768259 (= e!427793 (MissingZero!7849 (index!33766 lt!341643)))))

(declare-fun b!768260 () Bool)

(assert (=> b!768260 (= e!427793 (seekKeyOrZeroReturnVacant!0 (x!64698 lt!341643) (index!33766 lt!341643) (index!33766 lt!341643) k0!2102 a!3186 mask!3328))))

(declare-fun b!768261 () Bool)

(declare-fun e!427794 () SeekEntryResult!7849)

(assert (=> b!768261 (= e!427794 Undefined!7849)))

(declare-fun d!101335 () Bool)

(declare-fun lt!341644 () SeekEntryResult!7849)

(assert (=> d!101335 (and (or ((_ is Undefined!7849) lt!341644) (not ((_ is Found!7849) lt!341644)) (and (bvsge (index!33765 lt!341644) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341644) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341644) ((_ is Found!7849) lt!341644) (not ((_ is MissingZero!7849) lt!341644)) (and (bvsge (index!33764 lt!341644) #b00000000000000000000000000000000) (bvslt (index!33764 lt!341644) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341644) ((_ is Found!7849) lt!341644) ((_ is MissingZero!7849) lt!341644) (not ((_ is MissingVacant!7849) lt!341644)) (and (bvsge (index!33767 lt!341644) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341644) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341644) (ite ((_ is Found!7849) lt!341644) (= (select (arr!20252 a!3186) (index!33765 lt!341644)) k0!2102) (ite ((_ is MissingZero!7849) lt!341644) (= (select (arr!20252 a!3186) (index!33764 lt!341644)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7849) lt!341644) (= (select (arr!20252 a!3186) (index!33767 lt!341644)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101335 (= lt!341644 e!427794)))

(declare-fun c!84689 () Bool)

(assert (=> d!101335 (= c!84689 (and ((_ is Intermediate!7849) lt!341643) (undefined!8661 lt!341643)))))

(assert (=> d!101335 (= lt!341643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101335 (validMask!0 mask!3328)))

(assert (=> d!101335 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!341644)))

(declare-fun b!768262 () Bool)

(assert (=> b!768262 (= e!427794 e!427795)))

(declare-fun lt!341642 () (_ BitVec 64))

(assert (=> b!768262 (= lt!341642 (select (arr!20252 a!3186) (index!33766 lt!341643)))))

(declare-fun c!84690 () Bool)

(assert (=> b!768262 (= c!84690 (= lt!341642 k0!2102))))

(declare-fun b!768263 () Bool)

(declare-fun c!84691 () Bool)

(assert (=> b!768263 (= c!84691 (= lt!341642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768263 (= e!427795 e!427793)))

(assert (= (and d!101335 c!84689) b!768261))

(assert (= (and d!101335 (not c!84689)) b!768262))

(assert (= (and b!768262 c!84690) b!768258))

(assert (= (and b!768262 (not c!84690)) b!768263))

(assert (= (and b!768263 c!84691) b!768259))

(assert (= (and b!768263 (not c!84691)) b!768260))

(declare-fun m!713285 () Bool)

(assert (=> b!768260 m!713285))

(declare-fun m!713287 () Bool)

(assert (=> d!101335 m!713287))

(declare-fun m!713289 () Bool)

(assert (=> d!101335 m!713289))

(declare-fun m!713291 () Bool)

(assert (=> d!101335 m!713291))

(assert (=> d!101335 m!713039))

(declare-fun m!713293 () Bool)

(assert (=> d!101335 m!713293))

(declare-fun m!713295 () Bool)

(assert (=> d!101335 m!713295))

(assert (=> d!101335 m!713289))

(declare-fun m!713297 () Bool)

(assert (=> b!768262 m!713297))

(assert (=> b!767940 d!101335))

(check-sat (not d!101329) (not b!768164) (not b!768182) (not b!768095) (not bm!35063) (not b!768224) (not bm!35059) (not bm!35062) (not d!101287) (not b!768260) (not b!768212) (not b!768249) (not b!768165) (not b!768162) (not d!101293) (not d!101317) (not b!768104) (not b!768222) (not b!768231) (not b!768070) (not b!768122) (not b!768218) (not d!101295) (not d!101335) (not d!101315) (not b!768139) (not d!101327) (not b!768214) (not d!101321) (not d!101303) (not d!101289))
(check-sat)
(get-model)

(assert (=> d!101317 d!101323))

(declare-fun b!768500 () Bool)

(declare-fun e!427942 () SeekEntryResult!7849)

(assert (=> b!768500 (= e!427942 Undefined!7849)))

(declare-fun b!768501 () Bool)

(declare-fun c!84777 () Bool)

(declare-fun lt!341742 () (_ BitVec 64))

(assert (=> b!768501 (= c!84777 (= lt!341742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427943 () SeekEntryResult!7849)

(declare-fun e!427941 () SeekEntryResult!7849)

(assert (=> b!768501 (= e!427943 e!427941)))

(declare-fun b!768502 () Bool)

(assert (=> b!768502 (= e!427942 e!427943)))

(declare-fun c!84776 () Bool)

(assert (=> b!768502 (= c!84776 (= lt!341742 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768503 () Bool)

(assert (=> b!768503 (= e!427941 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64698 lt!341589) #b00000000000000000000000000000001) (nextIndex!0 (index!33766 lt!341589) (x!64698 lt!341589) mask!3328) (index!33766 lt!341589) (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101411 () Bool)

(declare-fun lt!341743 () SeekEntryResult!7849)

(assert (=> d!101411 (and (or ((_ is Undefined!7849) lt!341743) (not ((_ is Found!7849) lt!341743)) (and (bvsge (index!33765 lt!341743) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341743) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341743) ((_ is Found!7849) lt!341743) (not ((_ is MissingVacant!7849) lt!341743)) (not (= (index!33767 lt!341743) (index!33766 lt!341589))) (and (bvsge (index!33767 lt!341743) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341743) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341743) (ite ((_ is Found!7849) lt!341743) (= (select (arr!20252 a!3186) (index!33765 lt!341743)) (select (arr!20252 a!3186) j!159)) (and ((_ is MissingVacant!7849) lt!341743) (= (index!33767 lt!341743) (index!33766 lt!341589)) (= (select (arr!20252 a!3186) (index!33767 lt!341743)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101411 (= lt!341743 e!427942)))

(declare-fun c!84775 () Bool)

(assert (=> d!101411 (= c!84775 (bvsge (x!64698 lt!341589) #b01111111111111111111111111111110))))

(assert (=> d!101411 (= lt!341742 (select (arr!20252 a!3186) (index!33766 lt!341589)))))

(assert (=> d!101411 (validMask!0 mask!3328)))

(assert (=> d!101411 (= (seekKeyOrZeroReturnVacant!0 (x!64698 lt!341589) (index!33766 lt!341589) (index!33766 lt!341589) (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341743)))

(declare-fun b!768504 () Bool)

(assert (=> b!768504 (= e!427941 (MissingVacant!7849 (index!33766 lt!341589)))))

(declare-fun b!768505 () Bool)

(assert (=> b!768505 (= e!427943 (Found!7849 (index!33766 lt!341589)))))

(assert (= (and d!101411 c!84775) b!768500))

(assert (= (and d!101411 (not c!84775)) b!768502))

(assert (= (and b!768502 c!84776) b!768505))

(assert (= (and b!768502 (not c!84776)) b!768501))

(assert (= (and b!768501 c!84777) b!768504))

(assert (= (and b!768501 (not c!84777)) b!768503))

(declare-fun m!713479 () Bool)

(assert (=> b!768503 m!713479))

(assert (=> b!768503 m!713479))

(assert (=> b!768503 m!713017))

(declare-fun m!713481 () Bool)

(assert (=> b!768503 m!713481))

(declare-fun m!713483 () Bool)

(assert (=> d!101411 m!713483))

(declare-fun m!713485 () Bool)

(assert (=> d!101411 m!713485))

(assert (=> d!101411 m!713201))

(assert (=> d!101411 m!713039))

(assert (=> b!768139 d!101411))

(declare-fun b!768506 () Bool)

(declare-fun e!427945 () SeekEntryResult!7849)

(assert (=> b!768506 (= e!427945 Undefined!7849)))

(declare-fun b!768507 () Bool)

(declare-fun c!84780 () Bool)

(declare-fun lt!341744 () (_ BitVec 64))

(assert (=> b!768507 (= c!84780 (= lt!341744 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427946 () SeekEntryResult!7849)

(declare-fun e!427944 () SeekEntryResult!7849)

(assert (=> b!768507 (= e!427946 e!427944)))

(declare-fun b!768508 () Bool)

(assert (=> b!768508 (= e!427945 e!427946)))

(declare-fun c!84779 () Bool)

(assert (=> b!768508 (= c!84779 (= lt!341744 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768509 () Bool)

(assert (=> b!768509 (= e!427944 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101413 () Bool)

(declare-fun lt!341745 () SeekEntryResult!7849)

(assert (=> d!101413 (and (or ((_ is Undefined!7849) lt!341745) (not ((_ is Found!7849) lt!341745)) (and (bvsge (index!33765 lt!341745) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341745) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341745) ((_ is Found!7849) lt!341745) (not ((_ is MissingVacant!7849) lt!341745)) (not (= (index!33767 lt!341745) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341745) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341745) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341745) (ite ((_ is Found!7849) lt!341745) (= (select (arr!20252 a!3186) (index!33765 lt!341745)) (select (arr!20252 a!3186) j!159)) (and ((_ is MissingVacant!7849) lt!341745) (= (index!33767 lt!341745) resIntermediateIndex!5) (= (select (arr!20252 a!3186) (index!33767 lt!341745)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101413 (= lt!341745 e!427945)))

(declare-fun c!84778 () Bool)

(assert (=> d!101413 (= c!84778 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!101413 (= lt!341744 (select (arr!20252 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!101413 (validMask!0 mask!3328)))

(assert (=> d!101413 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341745)))

(declare-fun b!768510 () Bool)

(assert (=> b!768510 (= e!427944 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!768511 () Bool)

(assert (=> b!768511 (= e!427946 (Found!7849 (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (= (and d!101413 c!84778) b!768506))

(assert (= (and d!101413 (not c!84778)) b!768508))

(assert (= (and b!768508 c!84779) b!768511))

(assert (= (and b!768508 (not c!84779)) b!768507))

(assert (= (and b!768507 c!84780) b!768510))

(assert (= (and b!768507 (not c!84780)) b!768509))

(assert (=> b!768509 m!713049))

(declare-fun m!713487 () Bool)

(assert (=> b!768509 m!713487))

(assert (=> b!768509 m!713487))

(assert (=> b!768509 m!713017))

(declare-fun m!713489 () Bool)

(assert (=> b!768509 m!713489))

(declare-fun m!713491 () Bool)

(assert (=> d!101413 m!713491))

(declare-fun m!713493 () Bool)

(assert (=> d!101413 m!713493))

(assert (=> d!101413 m!713049))

(declare-fun m!713495 () Bool)

(assert (=> d!101413 m!713495))

(assert (=> d!101413 m!713039))

(assert (=> b!768122 d!101413))

(assert (=> b!768122 d!101329))

(declare-fun b!768512 () Bool)

(declare-fun e!427947 () Bool)

(declare-fun lt!341746 () SeekEntryResult!7849)

(assert (=> b!768512 (= e!427947 (bvsge (x!64698 lt!341746) #b01111111111111111111111111111110))))

(declare-fun b!768513 () Bool)

(assert (=> b!768513 (and (bvsge (index!33766 lt!341746) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341746) (size!20673 a!3186)))))

(declare-fun res!519738 () Bool)

(assert (=> b!768513 (= res!519738 (= (select (arr!20252 a!3186) (index!33766 lt!341746)) (select (arr!20252 a!3186) j!159)))))

(declare-fun e!427950 () Bool)

(assert (=> b!768513 (=> res!519738 e!427950)))

(declare-fun e!427948 () Bool)

(assert (=> b!768513 (= e!427948 e!427950)))

(declare-fun b!768514 () Bool)

(assert (=> b!768514 (and (bvsge (index!33766 lt!341746) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341746) (size!20673 a!3186)))))

(assert (=> b!768514 (= e!427950 (= (select (arr!20252 a!3186) (index!33766 lt!341746)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768515 () Bool)

(assert (=> b!768515 (and (bvsge (index!33766 lt!341746) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341746) (size!20673 a!3186)))))

(declare-fun res!519739 () Bool)

(assert (=> b!768515 (= res!519739 (= (select (arr!20252 a!3186) (index!33766 lt!341746)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768515 (=> res!519739 e!427950)))

(declare-fun b!768516 () Bool)

(declare-fun e!427949 () SeekEntryResult!7849)

(declare-fun e!427951 () SeekEntryResult!7849)

(assert (=> b!768516 (= e!427949 e!427951)))

(declare-fun c!84783 () Bool)

(declare-fun lt!341747 () (_ BitVec 64))

(assert (=> b!768516 (= c!84783 (or (= lt!341747 (select (arr!20252 a!3186) j!159)) (= (bvadd lt!341747 lt!341747) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768517 () Bool)

(assert (=> b!768517 (= e!427947 e!427948)))

(declare-fun res!519740 () Bool)

(assert (=> b!768517 (= res!519740 (and ((_ is Intermediate!7849) lt!341746) (not (undefined!8661 lt!341746)) (bvslt (x!64698 lt!341746) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341746) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341746) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!768517 (=> (not res!519740) (not e!427948))))

(declare-fun b!768518 () Bool)

(assert (=> b!768518 (= e!427951 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768519 () Bool)

(assert (=> b!768519 (= e!427951 (Intermediate!7849 false (nextIndex!0 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!768520 () Bool)

(assert (=> b!768520 (= e!427949 (Intermediate!7849 true (nextIndex!0 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun d!101415 () Bool)

(assert (=> d!101415 e!427947))

(declare-fun c!84781 () Bool)

(assert (=> d!101415 (= c!84781 (and ((_ is Intermediate!7849) lt!341746) (undefined!8661 lt!341746)))))

(assert (=> d!101415 (= lt!341746 e!427949)))

(declare-fun c!84782 () Bool)

(assert (=> d!101415 (= c!84782 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!101415 (= lt!341747 (select (arr!20252 a!3186) (nextIndex!0 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!101415 (validMask!0 mask!3328)))

(assert (=> d!101415 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341746)))

(assert (= (and d!101415 c!84782) b!768520))

(assert (= (and d!101415 (not c!84782)) b!768516))

(assert (= (and b!768516 c!84783) b!768519))

(assert (= (and b!768516 (not c!84783)) b!768518))

(assert (= (and d!101415 c!84781) b!768512))

(assert (= (and d!101415 (not c!84781)) b!768517))

(assert (= (and b!768517 res!519740) b!768513))

(assert (= (and b!768513 (not res!519738)) b!768515))

(assert (= (and b!768515 (not res!519739)) b!768514))

(declare-fun m!713497 () Bool)

(assert (=> b!768514 m!713497))

(assert (=> d!101415 m!713213))

(declare-fun m!713499 () Bool)

(assert (=> d!101415 m!713499))

(assert (=> d!101415 m!713039))

(assert (=> b!768513 m!713497))

(assert (=> b!768515 m!713497))

(assert (=> b!768518 m!713213))

(declare-fun m!713501 () Bool)

(assert (=> b!768518 m!713501))

(assert (=> b!768518 m!713501))

(assert (=> b!768518 m!713017))

(declare-fun m!713503 () Bool)

(assert (=> b!768518 m!713503))

(assert (=> b!768182 d!101415))

(declare-fun d!101417 () Bool)

(declare-fun lt!341748 () (_ BitVec 32))

(assert (=> d!101417 (and (bvsge lt!341748 #b00000000000000000000000000000000) (bvslt lt!341748 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101417 (= lt!341748 (choose!52 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!101417 (validMask!0 mask!3328)))

(assert (=> d!101417 (= (nextIndex!0 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341748)))

(declare-fun bs!21509 () Bool)

(assert (= bs!21509 d!101417))

(assert (=> bs!21509 m!713023))

(declare-fun m!713505 () Bool)

(assert (=> bs!21509 m!713505))

(assert (=> bs!21509 m!713039))

(assert (=> b!768182 d!101417))

(declare-fun b!768521 () Bool)

(declare-fun e!427952 () Bool)

(declare-fun lt!341749 () SeekEntryResult!7849)

(assert (=> b!768521 (= e!427952 (bvsge (x!64698 lt!341749) #b01111111111111111111111111111110))))

(declare-fun b!768522 () Bool)

(assert (=> b!768522 (and (bvsge (index!33766 lt!341749) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341749) (size!20673 lt!341498)))))

(declare-fun res!519741 () Bool)

(assert (=> b!768522 (= res!519741 (= (select (arr!20252 lt!341498) (index!33766 lt!341749)) lt!341494))))

(declare-fun e!427955 () Bool)

(assert (=> b!768522 (=> res!519741 e!427955)))

(declare-fun e!427953 () Bool)

(assert (=> b!768522 (= e!427953 e!427955)))

(declare-fun b!768523 () Bool)

(assert (=> b!768523 (and (bvsge (index!33766 lt!341749) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341749) (size!20673 lt!341498)))))

(assert (=> b!768523 (= e!427955 (= (select (arr!20252 lt!341498) (index!33766 lt!341749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768524 () Bool)

(assert (=> b!768524 (and (bvsge (index!33766 lt!341749) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341749) (size!20673 lt!341498)))))

(declare-fun res!519742 () Bool)

(assert (=> b!768524 (= res!519742 (= (select (arr!20252 lt!341498) (index!33766 lt!341749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768524 (=> res!519742 e!427955)))

(declare-fun b!768525 () Bool)

(declare-fun e!427954 () SeekEntryResult!7849)

(declare-fun e!427956 () SeekEntryResult!7849)

(assert (=> b!768525 (= e!427954 e!427956)))

(declare-fun c!84786 () Bool)

(declare-fun lt!341750 () (_ BitVec 64))

(assert (=> b!768525 (= c!84786 (or (= lt!341750 lt!341494) (= (bvadd lt!341750 lt!341750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768526 () Bool)

(assert (=> b!768526 (= e!427952 e!427953)))

(declare-fun res!519743 () Bool)

(assert (=> b!768526 (= res!519743 (and ((_ is Intermediate!7849) lt!341749) (not (undefined!8661 lt!341749)) (bvslt (x!64698 lt!341749) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341749) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341749) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!768526 (=> (not res!519743) (not e!427953))))

(declare-fun b!768527 () Bool)

(assert (=> b!768527 (= e!427956 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!341494 lt!341498 mask!3328))))

(declare-fun b!768528 () Bool)

(assert (=> b!768528 (= e!427956 (Intermediate!7849 false (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!768529 () Bool)

(assert (=> b!768529 (= e!427954 (Intermediate!7849 true (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun d!101419 () Bool)

(assert (=> d!101419 e!427952))

(declare-fun c!84784 () Bool)

(assert (=> d!101419 (= c!84784 (and ((_ is Intermediate!7849) lt!341749) (undefined!8661 lt!341749)))))

(assert (=> d!101419 (= lt!341749 e!427954)))

(declare-fun c!84785 () Bool)

(assert (=> d!101419 (= c!84785 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!101419 (= lt!341750 (select (arr!20252 lt!341498) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!101419 (validMask!0 mask!3328)))

(assert (=> d!101419 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341494 lt!341498 mask!3328) lt!341749)))

(assert (= (and d!101419 c!84785) b!768529))

(assert (= (and d!101419 (not c!84785)) b!768525))

(assert (= (and b!768525 c!84786) b!768528))

(assert (= (and b!768525 (not c!84786)) b!768527))

(assert (= (and d!101419 c!84784) b!768521))

(assert (= (and d!101419 (not c!84784)) b!768526))

(assert (= (and b!768526 res!519743) b!768522))

(assert (= (and b!768522 (not res!519741)) b!768524))

(assert (= (and b!768524 (not res!519742)) b!768523))

(declare-fun m!713507 () Bool)

(assert (=> b!768523 m!713507))

(assert (=> d!101419 m!713049))

(declare-fun m!713509 () Bool)

(assert (=> d!101419 m!713509))

(assert (=> d!101419 m!713039))

(assert (=> b!768522 m!713507))

(assert (=> b!768524 m!713507))

(assert (=> b!768527 m!713049))

(assert (=> b!768527 m!713487))

(assert (=> b!768527 m!713487))

(declare-fun m!713511 () Bool)

(assert (=> b!768527 m!713511))

(assert (=> b!768095 d!101419))

(assert (=> b!768095 d!101329))

(declare-fun b!768530 () Bool)

(declare-fun e!427957 () Bool)

(declare-fun lt!341751 () SeekEntryResult!7849)

(assert (=> b!768530 (= e!427957 (bvsge (x!64698 lt!341751) #b01111111111111111111111111111110))))

(declare-fun b!768531 () Bool)

(assert (=> b!768531 (and (bvsge (index!33766 lt!341751) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341751) (size!20673 a!3186)))))

(declare-fun res!519744 () Bool)

(assert (=> b!768531 (= res!519744 (= (select (arr!20252 a!3186) (index!33766 lt!341751)) k0!2102))))

(declare-fun e!427960 () Bool)

(assert (=> b!768531 (=> res!519744 e!427960)))

(declare-fun e!427958 () Bool)

(assert (=> b!768531 (= e!427958 e!427960)))

(declare-fun b!768532 () Bool)

(assert (=> b!768532 (and (bvsge (index!33766 lt!341751) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341751) (size!20673 a!3186)))))

(assert (=> b!768532 (= e!427960 (= (select (arr!20252 a!3186) (index!33766 lt!341751)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768533 () Bool)

(assert (=> b!768533 (and (bvsge (index!33766 lt!341751) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341751) (size!20673 a!3186)))))

(declare-fun res!519745 () Bool)

(assert (=> b!768533 (= res!519745 (= (select (arr!20252 a!3186) (index!33766 lt!341751)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768533 (=> res!519745 e!427960)))

(declare-fun b!768534 () Bool)

(declare-fun e!427959 () SeekEntryResult!7849)

(declare-fun e!427961 () SeekEntryResult!7849)

(assert (=> b!768534 (= e!427959 e!427961)))

(declare-fun c!84789 () Bool)

(declare-fun lt!341752 () (_ BitVec 64))

(assert (=> b!768534 (= c!84789 (or (= lt!341752 k0!2102) (= (bvadd lt!341752 lt!341752) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768535 () Bool)

(assert (=> b!768535 (= e!427957 e!427958)))

(declare-fun res!519746 () Bool)

(assert (=> b!768535 (= res!519746 (and ((_ is Intermediate!7849) lt!341751) (not (undefined!8661 lt!341751)) (bvslt (x!64698 lt!341751) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341751) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341751) #b00000000000000000000000000000000)))))

(assert (=> b!768535 (=> (not res!519746) (not e!427958))))

(declare-fun b!768536 () Bool)

(assert (=> b!768536 (= e!427961 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000 mask!3328) k0!2102 a!3186 mask!3328))))

(declare-fun b!768537 () Bool)

(assert (=> b!768537 (= e!427961 (Intermediate!7849 false (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768538 () Bool)

(assert (=> b!768538 (= e!427959 (Intermediate!7849 true (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101421 () Bool)

(assert (=> d!101421 e!427957))

(declare-fun c!84787 () Bool)

(assert (=> d!101421 (= c!84787 (and ((_ is Intermediate!7849) lt!341751) (undefined!8661 lt!341751)))))

(assert (=> d!101421 (= lt!341751 e!427959)))

(declare-fun c!84788 () Bool)

(assert (=> d!101421 (= c!84788 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101421 (= lt!341752 (select (arr!20252 a!3186) (toIndex!0 k0!2102 mask!3328)))))

(assert (=> d!101421 (validMask!0 mask!3328)))

(assert (=> d!101421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328) lt!341751)))

(assert (= (and d!101421 c!84788) b!768538))

(assert (= (and d!101421 (not c!84788)) b!768534))

(assert (= (and b!768534 c!84789) b!768537))

(assert (= (and b!768534 (not c!84789)) b!768536))

(assert (= (and d!101421 c!84787) b!768530))

(assert (= (and d!101421 (not c!84787)) b!768535))

(assert (= (and b!768535 res!519746) b!768531))

(assert (= (and b!768531 (not res!519744)) b!768533))

(assert (= (and b!768533 (not res!519745)) b!768532))

(declare-fun m!713513 () Bool)

(assert (=> b!768532 m!713513))

(assert (=> d!101421 m!713289))

(declare-fun m!713515 () Bool)

(assert (=> d!101421 m!713515))

(assert (=> d!101421 m!713039))

(assert (=> b!768531 m!713513))

(assert (=> b!768533 m!713513))

(assert (=> b!768536 m!713289))

(declare-fun m!713517 () Bool)

(assert (=> b!768536 m!713517))

(assert (=> b!768536 m!713517))

(declare-fun m!713519 () Bool)

(assert (=> b!768536 m!713519))

(assert (=> d!101335 d!101421))

(declare-fun d!101423 () Bool)

(declare-fun lt!341754 () (_ BitVec 32))

(declare-fun lt!341753 () (_ BitVec 32))

(assert (=> d!101423 (= lt!341754 (bvmul (bvxor lt!341753 (bvlshr lt!341753 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101423 (= lt!341753 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101423 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519630 (let ((h!15388 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64702 (bvmul (bvxor h!15388 (bvlshr h!15388 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64702 (bvlshr x!64702 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519630 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519630 #b00000000000000000000000000000000))))))

(assert (=> d!101423 (= (toIndex!0 k0!2102 mask!3328) (bvand (bvxor lt!341754 (bvlshr lt!341754 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> d!101335 d!101423))

(assert (=> d!101335 d!101323))

(assert (=> d!101303 d!101323))

(declare-fun d!101425 () Bool)

(assert (=> d!101425 (= (validKeyInArray!0 (select (arr!20252 a!3186) #b00000000000000000000000000000000)) (and (not (= (select (arr!20252 a!3186) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20252 a!3186) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768162 d!101425))

(assert (=> d!101315 d!101307))

(declare-fun d!101427 () Bool)

(assert (=> d!101427 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(assert (=> d!101427 true))

(declare-fun _$72!113 () Unit!26396)

(assert (=> d!101427 (= (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) _$72!113)))

(declare-fun bs!21510 () Bool)

(assert (= bs!21510 d!101427))

(assert (=> bs!21510 m!713043))

(assert (=> d!101315 d!101427))

(assert (=> d!101315 d!101323))

(declare-fun b!768539 () Bool)

(declare-fun e!427962 () Bool)

(declare-fun lt!341755 () SeekEntryResult!7849)

(assert (=> b!768539 (= e!427962 (bvsge (x!64698 lt!341755) #b01111111111111111111111111111110))))

(declare-fun b!768540 () Bool)

(assert (=> b!768540 (and (bvsge (index!33766 lt!341755) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341755) (size!20673 a!3186)))))

(declare-fun res!519747 () Bool)

(assert (=> b!768540 (= res!519747 (= (select (arr!20252 a!3186) (index!33766 lt!341755)) (select (arr!20252 a!3186) j!159)))))

(declare-fun e!427965 () Bool)

(assert (=> b!768540 (=> res!519747 e!427965)))

(declare-fun e!427963 () Bool)

(assert (=> b!768540 (= e!427963 e!427965)))

(declare-fun b!768541 () Bool)

(assert (=> b!768541 (and (bvsge (index!33766 lt!341755) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341755) (size!20673 a!3186)))))

(assert (=> b!768541 (= e!427965 (= (select (arr!20252 a!3186) (index!33766 lt!341755)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768542 () Bool)

(assert (=> b!768542 (and (bvsge (index!33766 lt!341755) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341755) (size!20673 a!3186)))))

(declare-fun res!519748 () Bool)

(assert (=> b!768542 (= res!519748 (= (select (arr!20252 a!3186) (index!33766 lt!341755)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768542 (=> res!519748 e!427965)))

(declare-fun b!768543 () Bool)

(declare-fun e!427964 () SeekEntryResult!7849)

(declare-fun e!427966 () SeekEntryResult!7849)

(assert (=> b!768543 (= e!427964 e!427966)))

(declare-fun lt!341756 () (_ BitVec 64))

(declare-fun c!84792 () Bool)

(assert (=> b!768543 (= c!84792 (or (= lt!341756 (select (arr!20252 a!3186) j!159)) (= (bvadd lt!341756 lt!341756) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768544 () Bool)

(assert (=> b!768544 (= e!427962 e!427963)))

(declare-fun res!519749 () Bool)

(assert (=> b!768544 (= res!519749 (and ((_ is Intermediate!7849) lt!341755) (not (undefined!8661 lt!341755)) (bvslt (x!64698 lt!341755) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341755) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341755) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!768544 (=> (not res!519749) (not e!427963))))

(declare-fun b!768545 () Bool)

(assert (=> b!768545 (= e!427966 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768546 () Bool)

(assert (=> b!768546 (= e!427966 (Intermediate!7849 false (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!768547 () Bool)

(assert (=> b!768547 (= e!427964 (Intermediate!7849 true (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun d!101429 () Bool)

(assert (=> d!101429 e!427962))

(declare-fun c!84790 () Bool)

(assert (=> d!101429 (= c!84790 (and ((_ is Intermediate!7849) lt!341755) (undefined!8661 lt!341755)))))

(assert (=> d!101429 (= lt!341755 e!427964)))

(declare-fun c!84791 () Bool)

(assert (=> d!101429 (= c!84791 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!101429 (= lt!341756 (select (arr!20252 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!101429 (validMask!0 mask!3328)))

(assert (=> d!101429 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341755)))

(assert (= (and d!101429 c!84791) b!768547))

(assert (= (and d!101429 (not c!84791)) b!768543))

(assert (= (and b!768543 c!84792) b!768546))

(assert (= (and b!768543 (not c!84792)) b!768545))

(assert (= (and d!101429 c!84790) b!768539))

(assert (= (and d!101429 (not c!84790)) b!768544))

(assert (= (and b!768544 res!519749) b!768540))

(assert (= (and b!768540 (not res!519747)) b!768542))

(assert (= (and b!768542 (not res!519748)) b!768541))

(declare-fun m!713521 () Bool)

(assert (=> b!768541 m!713521))

(assert (=> d!101429 m!713049))

(assert (=> d!101429 m!713495))

(assert (=> d!101429 m!713039))

(assert (=> b!768540 m!713521))

(assert (=> b!768542 m!713521))

(assert (=> b!768545 m!713049))

(assert (=> b!768545 m!713487))

(assert (=> b!768545 m!713487))

(assert (=> b!768545 m!713017))

(declare-fun m!713523 () Bool)

(assert (=> b!768545 m!713523))

(assert (=> b!768231 d!101429))

(assert (=> b!768231 d!101329))

(declare-fun b!768548 () Bool)

(declare-fun e!427969 () Bool)

(declare-fun call!35081 () Bool)

(assert (=> b!768548 (= e!427969 call!35081)))

(declare-fun b!768549 () Bool)

(declare-fun e!427970 () Bool)

(assert (=> b!768549 (= e!427970 e!427969)))

(declare-fun c!84793 () Bool)

(assert (=> b!768549 (= c!84793 (validKeyInArray!0 (select (arr!20252 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!35078 () Bool)

(assert (=> bm!35078 (= call!35081 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!84793 (Cons!14289 (select (arr!20252 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!84655 (Cons!14289 (select (arr!20252 a!3186) #b00000000000000000000000000000000) Nil!14290) Nil!14290)) (ite c!84655 (Cons!14289 (select (arr!20252 a!3186) #b00000000000000000000000000000000) Nil!14290) Nil!14290))))))

(declare-fun d!101431 () Bool)

(declare-fun res!519751 () Bool)

(declare-fun e!427967 () Bool)

(assert (=> d!101431 (=> res!519751 e!427967)))

(assert (=> d!101431 (= res!519751 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20673 a!3186)))))

(assert (=> d!101431 (= (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84655 (Cons!14289 (select (arr!20252 a!3186) #b00000000000000000000000000000000) Nil!14290) Nil!14290)) e!427967)))

(declare-fun b!768550 () Bool)

(assert (=> b!768550 (= e!427969 call!35081)))

(declare-fun b!768551 () Bool)

(declare-fun e!427968 () Bool)

(assert (=> b!768551 (= e!427968 (contains!4066 (ite c!84655 (Cons!14289 (select (arr!20252 a!3186) #b00000000000000000000000000000000) Nil!14290) Nil!14290) (select (arr!20252 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!768552 () Bool)

(assert (=> b!768552 (= e!427967 e!427970)))

(declare-fun res!519750 () Bool)

(assert (=> b!768552 (=> (not res!519750) (not e!427970))))

(assert (=> b!768552 (= res!519750 (not e!427968))))

(declare-fun res!519752 () Bool)

(assert (=> b!768552 (=> (not res!519752) (not e!427968))))

(assert (=> b!768552 (= res!519752 (validKeyInArray!0 (select (arr!20252 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!101431 (not res!519751)) b!768552))

(assert (= (and b!768552 res!519752) b!768551))

(assert (= (and b!768552 res!519750) b!768549))

(assert (= (and b!768549 c!84793) b!768548))

(assert (= (and b!768549 (not c!84793)) b!768550))

(assert (= (or b!768548 b!768550) bm!35078))

(declare-fun m!713525 () Bool)

(assert (=> b!768549 m!713525))

(assert (=> b!768549 m!713525))

(declare-fun m!713527 () Bool)

(assert (=> b!768549 m!713527))

(assert (=> bm!35078 m!713525))

(declare-fun m!713529 () Bool)

(assert (=> bm!35078 m!713529))

(assert (=> b!768551 m!713525))

(assert (=> b!768551 m!713525))

(declare-fun m!713531 () Bool)

(assert (=> b!768551 m!713531))

(assert (=> b!768552 m!713525))

(assert (=> b!768552 m!713525))

(assert (=> b!768552 m!713527))

(assert (=> bm!35059 d!101431))

(assert (=> d!101321 d!101323))

(declare-fun b!768553 () Bool)

(declare-fun e!427972 () SeekEntryResult!7849)

(assert (=> b!768553 (= e!427972 Undefined!7849)))

(declare-fun b!768554 () Bool)

(declare-fun c!84796 () Bool)

(declare-fun lt!341757 () (_ BitVec 64))

(assert (=> b!768554 (= c!84796 (= lt!341757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427973 () SeekEntryResult!7849)

(declare-fun e!427971 () SeekEntryResult!7849)

(assert (=> b!768554 (= e!427973 e!427971)))

(declare-fun b!768555 () Bool)

(assert (=> b!768555 (= e!427972 e!427973)))

(declare-fun c!84795 () Bool)

(assert (=> b!768555 (= c!84795 (= lt!341757 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768556 () Bool)

(assert (=> b!768556 (= e!427971 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!341758 () SeekEntryResult!7849)

(declare-fun d!101433 () Bool)

(assert (=> d!101433 (and (or ((_ is Undefined!7849) lt!341758) (not ((_ is Found!7849) lt!341758)) (and (bvsge (index!33765 lt!341758) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341758) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341758) ((_ is Found!7849) lt!341758) (not ((_ is MissingVacant!7849) lt!341758)) (not (= (index!33767 lt!341758) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341758) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341758) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341758) (ite ((_ is Found!7849) lt!341758) (= (select (arr!20252 a!3186) (index!33765 lt!341758)) (select (arr!20252 a!3186) j!159)) (and ((_ is MissingVacant!7849) lt!341758) (= (index!33767 lt!341758) resIntermediateIndex!5) (= (select (arr!20252 a!3186) (index!33767 lt!341758)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101433 (= lt!341758 e!427972)))

(declare-fun c!84794 () Bool)

(assert (=> d!101433 (= c!84794 (bvsge (bvadd resIntermediateX!5 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!101433 (= lt!341757 (select (arr!20252 a!3186) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(assert (=> d!101433 (validMask!0 mask!3328)))

(assert (=> d!101433 (= (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341758)))

(declare-fun b!768557 () Bool)

(assert (=> b!768557 (= e!427971 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!768558 () Bool)

(assert (=> b!768558 (= e!427973 (Found!7849 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(assert (= (and d!101433 c!84794) b!768553))

(assert (= (and d!101433 (not c!84794)) b!768555))

(assert (= (and b!768555 c!84795) b!768558))

(assert (= (and b!768555 (not c!84795)) b!768554))

(assert (= (and b!768554 c!84796) b!768557))

(assert (= (and b!768554 (not c!84796)) b!768556))

(assert (=> b!768556 m!713261))

(declare-fun m!713533 () Bool)

(assert (=> b!768556 m!713533))

(assert (=> b!768556 m!713533))

(assert (=> b!768556 m!713017))

(declare-fun m!713535 () Bool)

(assert (=> b!768556 m!713535))

(declare-fun m!713537 () Bool)

(assert (=> d!101433 m!713537))

(declare-fun m!713539 () Bool)

(assert (=> d!101433 m!713539))

(assert (=> d!101433 m!713261))

(declare-fun m!713541 () Bool)

(assert (=> d!101433 m!713541))

(assert (=> d!101433 m!713039))

(assert (=> b!768249 d!101433))

(declare-fun d!101435 () Bool)

(declare-fun lt!341759 () (_ BitVec 32))

(assert (=> d!101435 (and (bvsge lt!341759 #b00000000000000000000000000000000) (bvslt lt!341759 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101435 (= lt!341759 (choose!52 resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(assert (=> d!101435 (validMask!0 mask!3328)))

(assert (=> d!101435 (= (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) lt!341759)))

(declare-fun bs!21511 () Bool)

(assert (= bs!21511 d!101435))

(declare-fun m!713543 () Bool)

(assert (=> bs!21511 m!713543))

(assert (=> bs!21511 m!713039))

(assert (=> b!768249 d!101435))

(assert (=> b!768165 d!101425))

(declare-fun d!101437 () Bool)

(declare-fun lt!341762 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!379 (List!14293) (InoxSet (_ BitVec 64)))

(assert (=> d!101437 (= lt!341762 (select (content!379 Nil!14290) (select (arr!20252 a!3186) #b00000000000000000000000000000000)))))

(declare-fun e!427979 () Bool)

(assert (=> d!101437 (= lt!341762 e!427979)))

(declare-fun res!519757 () Bool)

(assert (=> d!101437 (=> (not res!519757) (not e!427979))))

(assert (=> d!101437 (= res!519757 ((_ is Cons!14289) Nil!14290))))

(assert (=> d!101437 (= (contains!4066 Nil!14290 (select (arr!20252 a!3186) #b00000000000000000000000000000000)) lt!341762)))

(declare-fun b!768563 () Bool)

(declare-fun e!427978 () Bool)

(assert (=> b!768563 (= e!427979 e!427978)))

(declare-fun res!519758 () Bool)

(assert (=> b!768563 (=> res!519758 e!427978)))

(assert (=> b!768563 (= res!519758 (= (h!15385 Nil!14290) (select (arr!20252 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768564 () Bool)

(assert (=> b!768564 (= e!427978 (contains!4066 (t!20599 Nil!14290) (select (arr!20252 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101437 res!519757) b!768563))

(assert (= (and b!768563 (not res!519758)) b!768564))

(declare-fun m!713545 () Bool)

(assert (=> d!101437 m!713545))

(assert (=> d!101437 m!713167))

(declare-fun m!713547 () Bool)

(assert (=> d!101437 m!713547))

(assert (=> b!768564 m!713167))

(declare-fun m!713549 () Bool)

(assert (=> b!768564 m!713549))

(assert (=> b!768164 d!101437))

(declare-fun d!101439 () Bool)

(declare-fun res!519759 () Bool)

(declare-fun e!427980 () Bool)

(assert (=> d!101439 (=> res!519759 e!427980)))

(assert (=> d!101439 (= res!519759 (= (select (arr!20252 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2102))))

(assert (=> d!101439 (= (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!427980)))

(declare-fun b!768565 () Bool)

(declare-fun e!427981 () Bool)

(assert (=> b!768565 (= e!427980 e!427981)))

(declare-fun res!519760 () Bool)

(assert (=> b!768565 (=> (not res!519760) (not e!427981))))

(assert (=> b!768565 (= res!519760 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!20673 a!3186)))))

(declare-fun b!768566 () Bool)

(assert (=> b!768566 (= e!427981 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!101439 (not res!519759)) b!768565))

(assert (= (and b!768565 res!519760) b!768566))

(assert (=> d!101439 m!713525))

(declare-fun m!713551 () Bool)

(assert (=> b!768566 m!713551))

(assert (=> b!768070 d!101439))

(declare-fun b!768567 () Bool)

(declare-fun e!427983 () SeekEntryResult!7849)

(assert (=> b!768567 (= e!427983 Undefined!7849)))

(declare-fun b!768568 () Bool)

(declare-fun c!84799 () Bool)

(declare-fun lt!341763 () (_ BitVec 64))

(assert (=> b!768568 (= c!84799 (= lt!341763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427984 () SeekEntryResult!7849)

(declare-fun e!427982 () SeekEntryResult!7849)

(assert (=> b!768568 (= e!427984 e!427982)))

(declare-fun b!768569 () Bool)

(assert (=> b!768569 (= e!427983 e!427984)))

(declare-fun c!84798 () Bool)

(assert (=> b!768569 (= c!84798 (= lt!341763 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768570 () Bool)

(assert (=> b!768570 (= e!427982 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!341500 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!341764 () SeekEntryResult!7849)

(declare-fun d!101441 () Bool)

(assert (=> d!101441 (and (or ((_ is Undefined!7849) lt!341764) (not ((_ is Found!7849) lt!341764)) (and (bvsge (index!33765 lt!341764) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341764) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341764) ((_ is Found!7849) lt!341764) (not ((_ is MissingVacant!7849) lt!341764)) (not (= (index!33767 lt!341764) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341764) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341764) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341764) (ite ((_ is Found!7849) lt!341764) (= (select (arr!20252 a!3186) (index!33765 lt!341764)) (select (arr!20252 a!3186) j!159)) (and ((_ is MissingVacant!7849) lt!341764) (= (index!33767 lt!341764) resIntermediateIndex!5) (= (select (arr!20252 a!3186) (index!33767 lt!341764)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101441 (= lt!341764 e!427983)))

(declare-fun c!84797 () Bool)

(assert (=> d!101441 (= c!84797 (bvsge (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!101441 (= lt!341763 (select (arr!20252 a!3186) (nextIndex!0 lt!341500 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328)))))

(assert (=> d!101441 (validMask!0 mask!3328)))

(assert (=> d!101441 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341500 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341764)))

(declare-fun b!768571 () Bool)

(assert (=> b!768571 (= e!427982 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!768572 () Bool)

(assert (=> b!768572 (= e!427984 (Found!7849 (nextIndex!0 lt!341500 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328)))))

(assert (= (and d!101441 c!84797) b!768567))

(assert (= (and d!101441 (not c!84797)) b!768569))

(assert (= (and b!768569 c!84798) b!768572))

(assert (= (and b!768569 (not c!84798)) b!768568))

(assert (= (and b!768568 c!84799) b!768571))

(assert (= (and b!768568 (not c!84799)) b!768570))

(assert (=> b!768570 m!713239))

(declare-fun m!713553 () Bool)

(assert (=> b!768570 m!713553))

(assert (=> b!768570 m!713553))

(assert (=> b!768570 m!713017))

(declare-fun m!713555 () Bool)

(assert (=> b!768570 m!713555))

(declare-fun m!713557 () Bool)

(assert (=> d!101441 m!713557))

(declare-fun m!713559 () Bool)

(assert (=> d!101441 m!713559))

(assert (=> d!101441 m!713239))

(declare-fun m!713561 () Bool)

(assert (=> d!101441 m!713561))

(assert (=> d!101441 m!713039))

(assert (=> b!768218 d!101441))

(declare-fun d!101443 () Bool)

(declare-fun lt!341765 () (_ BitVec 32))

(assert (=> d!101443 (and (bvsge lt!341765 #b00000000000000000000000000000000) (bvslt lt!341765 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101443 (= lt!341765 (choose!52 lt!341500 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!101443 (validMask!0 mask!3328)))

(assert (=> d!101443 (= (nextIndex!0 lt!341500 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!341765)))

(declare-fun bs!21512 () Bool)

(assert (= bs!21512 d!101443))

(declare-fun m!713563 () Bool)

(assert (=> bs!21512 m!713563))

(assert (=> bs!21512 m!713039))

(assert (=> b!768218 d!101443))

(declare-fun b!768573 () Bool)

(declare-fun e!427985 () Bool)

(declare-fun lt!341766 () SeekEntryResult!7849)

(assert (=> b!768573 (= e!427985 (bvsge (x!64698 lt!341766) #b01111111111111111111111111111110))))

(declare-fun b!768574 () Bool)

(assert (=> b!768574 (and (bvsge (index!33766 lt!341766) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341766) (size!20673 lt!341498)))))

(declare-fun res!519761 () Bool)

(assert (=> b!768574 (= res!519761 (= (select (arr!20252 lt!341498) (index!33766 lt!341766)) lt!341494))))

(declare-fun e!427988 () Bool)

(assert (=> b!768574 (=> res!519761 e!427988)))

(declare-fun e!427986 () Bool)

(assert (=> b!768574 (= e!427986 e!427988)))

(declare-fun b!768575 () Bool)

(assert (=> b!768575 (and (bvsge (index!33766 lt!341766) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341766) (size!20673 lt!341498)))))

(assert (=> b!768575 (= e!427988 (= (select (arr!20252 lt!341498) (index!33766 lt!341766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768576 () Bool)

(assert (=> b!768576 (and (bvsge (index!33766 lt!341766) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341766) (size!20673 lt!341498)))))

(declare-fun res!519762 () Bool)

(assert (=> b!768576 (= res!519762 (= (select (arr!20252 lt!341498) (index!33766 lt!341766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768576 (=> res!519762 e!427988)))

(declare-fun b!768577 () Bool)

(declare-fun e!427987 () SeekEntryResult!7849)

(declare-fun e!427989 () SeekEntryResult!7849)

(assert (=> b!768577 (= e!427987 e!427989)))

(declare-fun c!84802 () Bool)

(declare-fun lt!341767 () (_ BitVec 64))

(assert (=> b!768577 (= c!84802 (or (= lt!341767 lt!341494) (= (bvadd lt!341767 lt!341767) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768578 () Bool)

(assert (=> b!768578 (= e!427985 e!427986)))

(declare-fun res!519763 () Bool)

(assert (=> b!768578 (= res!519763 (and ((_ is Intermediate!7849) lt!341766) (not (undefined!8661 lt!341766)) (bvslt (x!64698 lt!341766) #b01111111111111111111111111111110) (bvsge (x!64698 lt!341766) #b00000000000000000000000000000000) (bvsge (x!64698 lt!341766) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!768578 (=> (not res!519763) (not e!427986))))

(declare-fun b!768579 () Bool)

(assert (=> b!768579 (= e!427989 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!341494 lt!341498 mask!3328))))

(declare-fun b!768580 () Bool)

(assert (=> b!768580 (= e!427989 (Intermediate!7849 false (nextIndex!0 (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!768581 () Bool)

(assert (=> b!768581 (= e!427987 (Intermediate!7849 true (nextIndex!0 (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun d!101445 () Bool)

(assert (=> d!101445 e!427985))

(declare-fun c!84800 () Bool)

(assert (=> d!101445 (= c!84800 (and ((_ is Intermediate!7849) lt!341766) (undefined!8661 lt!341766)))))

(assert (=> d!101445 (= lt!341766 e!427987)))

(declare-fun c!84801 () Bool)

(assert (=> d!101445 (= c!84801 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!101445 (= lt!341767 (select (arr!20252 lt!341498) (nextIndex!0 (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!101445 (validMask!0 mask!3328)))

(assert (=> d!101445 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341494 lt!341498 mask!3328) lt!341766)))

(assert (= (and d!101445 c!84801) b!768581))

(assert (= (and d!101445 (not c!84801)) b!768577))

(assert (= (and b!768577 c!84802) b!768580))

(assert (= (and b!768577 (not c!84802)) b!768579))

(assert (= (and d!101445 c!84800) b!768573))

(assert (= (and d!101445 (not c!84800)) b!768578))

(assert (= (and b!768578 res!519763) b!768574))

(assert (= (and b!768574 (not res!519761)) b!768576))

(assert (= (and b!768576 (not res!519762)) b!768575))

(declare-fun m!713565 () Bool)

(assert (=> b!768575 m!713565))

(assert (=> d!101445 m!713181))

(declare-fun m!713567 () Bool)

(assert (=> d!101445 m!713567))

(assert (=> d!101445 m!713039))

(assert (=> b!768574 m!713565))

(assert (=> b!768576 m!713565))

(assert (=> b!768579 m!713181))

(declare-fun m!713569 () Bool)

(assert (=> b!768579 m!713569))

(assert (=> b!768579 m!713569))

(declare-fun m!713571 () Bool)

(assert (=> b!768579 m!713571))

(assert (=> b!768104 d!101445))

(declare-fun d!101447 () Bool)

(declare-fun lt!341768 () (_ BitVec 32))

(assert (=> d!101447 (and (bvsge lt!341768 #b00000000000000000000000000000000) (bvslt lt!341768 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101447 (= lt!341768 (choose!52 (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!101447 (validMask!0 mask!3328)))

(assert (=> d!101447 (= (nextIndex!0 (toIndex!0 lt!341494 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341768)))

(declare-fun bs!21513 () Bool)

(assert (= bs!21513 d!101447))

(assert (=> bs!21513 m!713051))

(declare-fun m!713573 () Bool)

(assert (=> bs!21513 m!713573))

(assert (=> bs!21513 m!713039))

(assert (=> b!768104 d!101447))

(assert (=> d!101289 d!101323))

(assert (=> d!101295 d!101303))

(assert (=> d!101295 d!101305))

(assert (=> d!101295 d!101323))

(declare-fun b!768582 () Bool)

(declare-fun e!427991 () Bool)

(declare-fun call!35082 () Bool)

(assert (=> b!768582 (= e!427991 call!35082)))

(declare-fun bm!35079 () Bool)

(assert (=> bm!35079 (= call!35082 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101449 () Bool)

(declare-fun res!519764 () Bool)

(declare-fun e!427992 () Bool)

(assert (=> d!101449 (=> res!519764 e!427992)))

(assert (=> d!101449 (= res!519764 (bvsge (bvadd j!159 #b00000000000000000000000000000001) (size!20673 a!3186)))))

(assert (=> d!101449 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328) e!427992)))

(declare-fun b!768583 () Bool)

(assert (=> b!768583 (= e!427992 e!427991)))

(declare-fun c!84803 () Bool)

(assert (=> b!768583 (= c!84803 (validKeyInArray!0 (select (arr!20252 a!3186) (bvadd j!159 #b00000000000000000000000000000001))))))

(declare-fun b!768584 () Bool)

(declare-fun e!427990 () Bool)

(assert (=> b!768584 (= e!427990 call!35082)))

(declare-fun b!768585 () Bool)

(assert (=> b!768585 (= e!427991 e!427990)))

(declare-fun lt!341771 () (_ BitVec 64))

(assert (=> b!768585 (= lt!341771 (select (arr!20252 a!3186) (bvadd j!159 #b00000000000000000000000000000001)))))

(declare-fun lt!341770 () Unit!26396)

(assert (=> b!768585 (= lt!341770 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341771 (bvadd j!159 #b00000000000000000000000000000001)))))

(assert (=> b!768585 (arrayContainsKey!0 a!3186 lt!341771 #b00000000000000000000000000000000)))

(declare-fun lt!341769 () Unit!26396)

(assert (=> b!768585 (= lt!341769 lt!341770)))

(declare-fun res!519765 () Bool)

(assert (=> b!768585 (= res!519765 (= (seekEntryOrOpen!0 (select (arr!20252 a!3186) (bvadd j!159 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7849 (bvadd j!159 #b00000000000000000000000000000001))))))

(assert (=> b!768585 (=> (not res!519765) (not e!427990))))

(assert (= (and d!101449 (not res!519764)) b!768583))

(assert (= (and b!768583 c!84803) b!768585))

(assert (= (and b!768583 (not c!84803)) b!768582))

(assert (= (and b!768585 res!519765) b!768584))

(assert (= (or b!768584 b!768582) bm!35079))

(declare-fun m!713575 () Bool)

(assert (=> bm!35079 m!713575))

(declare-fun m!713577 () Bool)

(assert (=> b!768583 m!713577))

(assert (=> b!768583 m!713577))

(declare-fun m!713579 () Bool)

(assert (=> b!768583 m!713579))

(assert (=> b!768585 m!713577))

(declare-fun m!713581 () Bool)

(assert (=> b!768585 m!713581))

(declare-fun m!713583 () Bool)

(assert (=> b!768585 m!713583))

(assert (=> b!768585 m!713577))

(declare-fun m!713585 () Bool)

(assert (=> b!768585 m!713585))

(assert (=> bm!35062 d!101449))

(declare-fun b!768586 () Bool)

(declare-fun e!427994 () SeekEntryResult!7849)

(assert (=> b!768586 (= e!427994 Undefined!7849)))

(declare-fun b!768587 () Bool)

(declare-fun c!84806 () Bool)

(declare-fun lt!341772 () (_ BitVec 64))

(assert (=> b!768587 (= c!84806 (= lt!341772 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427995 () SeekEntryResult!7849)

(declare-fun e!427993 () SeekEntryResult!7849)

(assert (=> b!768587 (= e!427995 e!427993)))

(declare-fun b!768588 () Bool)

(assert (=> b!768588 (= e!427994 e!427995)))

(declare-fun c!84805 () Bool)

(assert (=> b!768588 (= c!84805 (= lt!341772 k0!2102))))

(declare-fun b!768589 () Bool)

(assert (=> b!768589 (= e!427993 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64698 lt!341643) #b00000000000000000000000000000001) (nextIndex!0 (index!33766 lt!341643) (x!64698 lt!341643) mask!3328) (index!33766 lt!341643) k0!2102 a!3186 mask!3328))))

(declare-fun lt!341773 () SeekEntryResult!7849)

(declare-fun d!101451 () Bool)

(assert (=> d!101451 (and (or ((_ is Undefined!7849) lt!341773) (not ((_ is Found!7849) lt!341773)) (and (bvsge (index!33765 lt!341773) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341773) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341773) ((_ is Found!7849) lt!341773) (not ((_ is MissingVacant!7849) lt!341773)) (not (= (index!33767 lt!341773) (index!33766 lt!341643))) (and (bvsge (index!33767 lt!341773) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341773) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341773) (ite ((_ is Found!7849) lt!341773) (= (select (arr!20252 a!3186) (index!33765 lt!341773)) k0!2102) (and ((_ is MissingVacant!7849) lt!341773) (= (index!33767 lt!341773) (index!33766 lt!341643)) (= (select (arr!20252 a!3186) (index!33767 lt!341773)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101451 (= lt!341773 e!427994)))

(declare-fun c!84804 () Bool)

(assert (=> d!101451 (= c!84804 (bvsge (x!64698 lt!341643) #b01111111111111111111111111111110))))

(assert (=> d!101451 (= lt!341772 (select (arr!20252 a!3186) (index!33766 lt!341643)))))

(assert (=> d!101451 (validMask!0 mask!3328)))

(assert (=> d!101451 (= (seekKeyOrZeroReturnVacant!0 (x!64698 lt!341643) (index!33766 lt!341643) (index!33766 lt!341643) k0!2102 a!3186 mask!3328) lt!341773)))

(declare-fun b!768590 () Bool)

(assert (=> b!768590 (= e!427993 (MissingVacant!7849 (index!33766 lt!341643)))))

(declare-fun b!768591 () Bool)

(assert (=> b!768591 (= e!427995 (Found!7849 (index!33766 lt!341643)))))

(assert (= (and d!101451 c!84804) b!768586))

(assert (= (and d!101451 (not c!84804)) b!768588))

(assert (= (and b!768588 c!84805) b!768591))

(assert (= (and b!768588 (not c!84805)) b!768587))

(assert (= (and b!768587 c!84806) b!768590))

(assert (= (and b!768587 (not c!84806)) b!768589))

(declare-fun m!713587 () Bool)

(assert (=> b!768589 m!713587))

(assert (=> b!768589 m!713587))

(declare-fun m!713589 () Bool)

(assert (=> b!768589 m!713589))

(declare-fun m!713591 () Bool)

(assert (=> d!101451 m!713591))

(declare-fun m!713593 () Bool)

(assert (=> d!101451 m!713593))

(assert (=> d!101451 m!713297))

(assert (=> d!101451 m!713039))

(assert (=> b!768260 d!101451))

(assert (=> b!768212 d!101333))

(assert (=> b!768222 d!101425))

(declare-fun d!101453 () Bool)

(assert (=> d!101453 (arrayContainsKey!0 a!3186 lt!341617 #b00000000000000000000000000000000)))

(declare-fun lt!341776 () Unit!26396)

(declare-fun choose!13 (array!42300 (_ BitVec 64) (_ BitVec 32)) Unit!26396)

(assert (=> d!101453 (= lt!341776 (choose!13 a!3186 lt!341617 j!159))))

(assert (=> d!101453 (bvsge j!159 #b00000000000000000000000000000000)))

(assert (=> d!101453 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341617 j!159) lt!341776)))

(declare-fun bs!21514 () Bool)

(assert (= bs!21514 d!101453))

(assert (=> bs!21514 m!713235))

(declare-fun m!713595 () Bool)

(assert (=> bs!21514 m!713595))

(assert (=> b!768214 d!101453))

(declare-fun d!101455 () Bool)

(declare-fun res!519766 () Bool)

(declare-fun e!427996 () Bool)

(assert (=> d!101455 (=> res!519766 e!427996)))

(assert (=> d!101455 (= res!519766 (= (select (arr!20252 a!3186) #b00000000000000000000000000000000) lt!341617))))

(assert (=> d!101455 (= (arrayContainsKey!0 a!3186 lt!341617 #b00000000000000000000000000000000) e!427996)))

(declare-fun b!768592 () Bool)

(declare-fun e!427997 () Bool)

(assert (=> b!768592 (= e!427996 e!427997)))

(declare-fun res!519767 () Bool)

(assert (=> b!768592 (=> (not res!519767) (not e!427997))))

(assert (=> b!768592 (= res!519767 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20673 a!3186)))))

(declare-fun b!768593 () Bool)

(assert (=> b!768593 (= e!427997 (arrayContainsKey!0 a!3186 lt!341617 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101455 (not res!519766)) b!768592))

(assert (= (and b!768592 res!519767) b!768593))

(assert (=> d!101455 m!713167))

(declare-fun m!713597 () Bool)

(assert (=> b!768593 m!713597))

(assert (=> b!768214 d!101455))

(assert (=> b!768214 d!101295))

(assert (=> d!101327 d!101323))

(assert (=> d!101293 d!101323))

(assert (=> d!101287 d!101323))

(declare-fun b!768594 () Bool)

(declare-fun e!427999 () Bool)

(declare-fun call!35083 () Bool)

(assert (=> b!768594 (= e!427999 call!35083)))

(declare-fun bm!35080 () Bool)

(assert (=> bm!35080 (= call!35083 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101457 () Bool)

(declare-fun res!519768 () Bool)

(declare-fun e!428000 () Bool)

(assert (=> d!101457 (=> res!519768 e!428000)))

(assert (=> d!101457 (= res!519768 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20673 a!3186)))))

(assert (=> d!101457 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328) e!428000)))

(declare-fun b!768595 () Bool)

(assert (=> b!768595 (= e!428000 e!427999)))

(declare-fun c!84807 () Bool)

(assert (=> b!768595 (= c!84807 (validKeyInArray!0 (select (arr!20252 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!768596 () Bool)

(declare-fun e!427998 () Bool)

(assert (=> b!768596 (= e!427998 call!35083)))

(declare-fun b!768597 () Bool)

(assert (=> b!768597 (= e!427999 e!427998)))

(declare-fun lt!341779 () (_ BitVec 64))

(assert (=> b!768597 (= lt!341779 (select (arr!20252 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!341778 () Unit!26396)

(assert (=> b!768597 (= lt!341778 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341779 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!768597 (arrayContainsKey!0 a!3186 lt!341779 #b00000000000000000000000000000000)))

(declare-fun lt!341777 () Unit!26396)

(assert (=> b!768597 (= lt!341777 lt!341778)))

(declare-fun res!519769 () Bool)

(assert (=> b!768597 (= res!519769 (= (seekEntryOrOpen!0 (select (arr!20252 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7849 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!768597 (=> (not res!519769) (not e!427998))))

(assert (= (and d!101457 (not res!519768)) b!768595))

(assert (= (and b!768595 c!84807) b!768597))

(assert (= (and b!768595 (not c!84807)) b!768594))

(assert (= (and b!768597 res!519769) b!768596))

(assert (= (or b!768596 b!768594) bm!35080))

(declare-fun m!713599 () Bool)

(assert (=> bm!35080 m!713599))

(assert (=> b!768595 m!713525))

(assert (=> b!768595 m!713525))

(assert (=> b!768595 m!713527))

(assert (=> b!768597 m!713525))

(declare-fun m!713601 () Bool)

(assert (=> b!768597 m!713601))

(declare-fun m!713603 () Bool)

(assert (=> b!768597 m!713603))

(assert (=> b!768597 m!713525))

(declare-fun m!713605 () Bool)

(assert (=> b!768597 m!713605))

(assert (=> bm!35063 d!101457))

(declare-fun d!101459 () Bool)

(declare-fun res!519772 () (_ BitVec 32))

(assert (=> d!101459 (and (bvsge res!519772 #b00000000000000000000000000000000) (bvslt res!519772 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101459 true))

(assert (=> d!101459 (= (choose!52 index!1321 x!1131 mask!3328) res!519772)))

(assert (=> d!101329 d!101459))

(assert (=> d!101329 d!101323))

(declare-fun d!101461 () Bool)

(assert (=> d!101461 (arrayContainsKey!0 a!3186 lt!341625 #b00000000000000000000000000000000)))

(declare-fun lt!341780 () Unit!26396)

(assert (=> d!101461 (= lt!341780 (choose!13 a!3186 lt!341625 #b00000000000000000000000000000000))))

(assert (=> d!101461 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!101461 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341625 #b00000000000000000000000000000000) lt!341780)))

(declare-fun bs!21515 () Bool)

(assert (= bs!21515 d!101461))

(assert (=> bs!21515 m!713253))

(declare-fun m!713607 () Bool)

(assert (=> bs!21515 m!713607))

(assert (=> b!768224 d!101461))

(declare-fun d!101463 () Bool)

(declare-fun res!519773 () Bool)

(declare-fun e!428001 () Bool)

(assert (=> d!101463 (=> res!519773 e!428001)))

(assert (=> d!101463 (= res!519773 (= (select (arr!20252 a!3186) #b00000000000000000000000000000000) lt!341625))))

(assert (=> d!101463 (= (arrayContainsKey!0 a!3186 lt!341625 #b00000000000000000000000000000000) e!428001)))

(declare-fun b!768598 () Bool)

(declare-fun e!428002 () Bool)

(assert (=> b!768598 (= e!428001 e!428002)))

(declare-fun res!519774 () Bool)

(assert (=> b!768598 (=> (not res!519774) (not e!428002))))

(assert (=> b!768598 (= res!519774 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20673 a!3186)))))

(declare-fun b!768599 () Bool)

(assert (=> b!768599 (= e!428002 (arrayContainsKey!0 a!3186 lt!341625 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101463 (not res!519773)) b!768598))

(assert (= (and b!768598 res!519774) b!768599))

(assert (=> d!101463 m!713167))

(declare-fun m!713609 () Bool)

(assert (=> b!768599 m!713609))

(assert (=> b!768224 d!101463))

(declare-fun b!768600 () Bool)

(declare-fun e!428005 () SeekEntryResult!7849)

(declare-fun lt!341782 () SeekEntryResult!7849)

(assert (=> b!768600 (= e!428005 (Found!7849 (index!33766 lt!341782)))))

(declare-fun b!768601 () Bool)

(declare-fun e!428003 () SeekEntryResult!7849)

(assert (=> b!768601 (= e!428003 (MissingZero!7849 (index!33766 lt!341782)))))

(declare-fun b!768602 () Bool)

(assert (=> b!768602 (= e!428003 (seekKeyOrZeroReturnVacant!0 (x!64698 lt!341782) (index!33766 lt!341782) (index!33766 lt!341782) (select (arr!20252 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(declare-fun b!768603 () Bool)

(declare-fun e!428004 () SeekEntryResult!7849)

(assert (=> b!768603 (= e!428004 Undefined!7849)))

(declare-fun d!101465 () Bool)

(declare-fun lt!341783 () SeekEntryResult!7849)

(assert (=> d!101465 (and (or ((_ is Undefined!7849) lt!341783) (not ((_ is Found!7849) lt!341783)) (and (bvsge (index!33765 lt!341783) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341783) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341783) ((_ is Found!7849) lt!341783) (not ((_ is MissingZero!7849) lt!341783)) (and (bvsge (index!33764 lt!341783) #b00000000000000000000000000000000) (bvslt (index!33764 lt!341783) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341783) ((_ is Found!7849) lt!341783) ((_ is MissingZero!7849) lt!341783) (not ((_ is MissingVacant!7849) lt!341783)) (and (bvsge (index!33767 lt!341783) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341783) (size!20673 a!3186)))) (or ((_ is Undefined!7849) lt!341783) (ite ((_ is Found!7849) lt!341783) (= (select (arr!20252 a!3186) (index!33765 lt!341783)) (select (arr!20252 a!3186) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!7849) lt!341783) (= (select (arr!20252 a!3186) (index!33764 lt!341783)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7849) lt!341783) (= (select (arr!20252 a!3186) (index!33767 lt!341783)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101465 (= lt!341783 e!428004)))

(declare-fun c!84808 () Bool)

(assert (=> d!101465 (= c!84808 (and ((_ is Intermediate!7849) lt!341782) (undefined!8661 lt!341782)))))

(assert (=> d!101465 (= lt!341782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20252 a!3186) #b00000000000000000000000000000000) mask!3328) (select (arr!20252 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(assert (=> d!101465 (validMask!0 mask!3328)))

(assert (=> d!101465 (= (seekEntryOrOpen!0 (select (arr!20252 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) lt!341783)))

(declare-fun b!768604 () Bool)

(assert (=> b!768604 (= e!428004 e!428005)))

(declare-fun lt!341781 () (_ BitVec 64))

(assert (=> b!768604 (= lt!341781 (select (arr!20252 a!3186) (index!33766 lt!341782)))))

(declare-fun c!84809 () Bool)

(assert (=> b!768604 (= c!84809 (= lt!341781 (select (arr!20252 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768605 () Bool)

(declare-fun c!84810 () Bool)

(assert (=> b!768605 (= c!84810 (= lt!341781 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768605 (= e!428005 e!428003)))

(assert (= (and d!101465 c!84808) b!768603))

(assert (= (and d!101465 (not c!84808)) b!768604))

(assert (= (and b!768604 c!84809) b!768600))

(assert (= (and b!768604 (not c!84809)) b!768605))

(assert (= (and b!768605 c!84810) b!768601))

(assert (= (and b!768605 (not c!84810)) b!768602))

(assert (=> b!768602 m!713167))

(declare-fun m!713611 () Bool)

(assert (=> b!768602 m!713611))

(declare-fun m!713613 () Bool)

(assert (=> d!101465 m!713613))

(declare-fun m!713615 () Bool)

(assert (=> d!101465 m!713615))

(assert (=> d!101465 m!713167))

(declare-fun m!713617 () Bool)

(assert (=> d!101465 m!713617))

(assert (=> d!101465 m!713039))

(declare-fun m!713619 () Bool)

(assert (=> d!101465 m!713619))

(declare-fun m!713621 () Bool)

(assert (=> d!101465 m!713621))

(assert (=> d!101465 m!713167))

(assert (=> d!101465 m!713615))

(declare-fun m!713623 () Bool)

(assert (=> b!768604 m!713623))

(assert (=> b!768224 d!101465))

(check-sat (not d!101437) (not bm!35080) (not d!101433) (not b!768549) (not d!101461) (not b!768545) (not b!768552) (not d!101417) (not d!101443) (not d!101415) (not b!768589) (not d!101429) (not d!101441) (not d!101413) (not d!101427) (not bm!35078) (not d!101421) (not d!101445) (not d!101451) (not d!101465) (not bm!35079) (not b!768503) (not b!768583) (not d!101419) (not d!101447) (not b!768593) (not b!768599) (not b!768518) (not b!768602) (not b!768564) (not b!768536) (not d!101453) (not b!768597) (not b!768579) (not b!768566) (not d!101411) (not b!768570) (not b!768551) (not d!101435) (not b!768585) (not b!768509) (not b!768595) (not b!768556) (not b!768527))
(check-sat)
