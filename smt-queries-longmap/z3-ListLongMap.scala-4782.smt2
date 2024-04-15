; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65732 () Bool)

(assert start!65732)

(declare-fun res!510456 () Bool)

(declare-fun e!421087 () Bool)

(assert (=> start!65732 (=> (not res!510456) (not e!421087))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65732 (= res!510456 (validMask!0 mask!3328))))

(assert (=> start!65732 e!421087))

(assert (=> start!65732 true))

(declare-datatypes ((array!41922 0))(
  ( (array!41923 (arr!20075 (Array (_ BitVec 32) (_ BitVec 64))) (size!20496 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41922)

(declare-fun array_inv!15958 (array!41922) Bool)

(assert (=> start!65732 (array_inv!15958 a!3186)))

(declare-fun b!755107 () Bool)

(declare-fun e!421082 () Bool)

(assert (=> b!755107 (= e!421087 e!421082)))

(declare-fun res!510440 () Bool)

(assert (=> b!755107 (=> (not res!510440) (not e!421082))))

(declare-datatypes ((SeekEntryResult!7672 0))(
  ( (MissingZero!7672 (index!33056 (_ BitVec 32))) (Found!7672 (index!33057 (_ BitVec 32))) (Intermediate!7672 (undefined!8484 Bool) (index!33058 (_ BitVec 32)) (x!63969 (_ BitVec 32))) (Undefined!7672) (MissingVacant!7672 (index!33059 (_ BitVec 32))) )
))
(declare-fun lt!335985 () SeekEntryResult!7672)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755107 (= res!510440 (or (= lt!335985 (MissingZero!7672 i!1173)) (= lt!335985 (MissingVacant!7672 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41922 (_ BitVec 32)) SeekEntryResult!7672)

(assert (=> b!755107 (= lt!335985 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755108 () Bool)

(declare-fun res!510439 () Bool)

(declare-fun e!421085 () Bool)

(assert (=> b!755108 (=> (not res!510439) (not e!421085))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!755108 (= res!510439 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20075 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755109 () Bool)

(declare-fun res!510443 () Bool)

(declare-fun e!421084 () Bool)

(assert (=> b!755109 (=> (not res!510443) (not e!421084))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!335984 () array!41922)

(declare-fun lt!335982 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41922 (_ BitVec 32)) SeekEntryResult!7672)

(assert (=> b!755109 (= res!510443 (= (seekEntryOrOpen!0 lt!335982 lt!335984 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335982 lt!335984 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!755110 () Bool)

(declare-fun lt!335992 () SeekEntryResult!7672)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!421083 () Bool)

(assert (=> b!755110 (= e!421083 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20075 a!3186) j!159) a!3186 mask!3328) lt!335992))))

(declare-fun b!755111 () Bool)

(declare-fun e!421079 () Bool)

(assert (=> b!755111 (= e!421079 true)))

(assert (=> b!755111 e!421084))

(declare-fun res!510447 () Bool)

(assert (=> b!755111 (=> (not res!510447) (not e!421084))))

(declare-fun lt!335988 () (_ BitVec 64))

(assert (=> b!755111 (= res!510447 (= lt!335988 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26048 0))(
  ( (Unit!26049) )
))
(declare-fun lt!335993 () Unit!26048)

(declare-fun e!421078 () Unit!26048)

(assert (=> b!755111 (= lt!335993 e!421078)))

(declare-fun c!82715 () Bool)

(assert (=> b!755111 (= c!82715 (= lt!335988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755112 () Bool)

(declare-fun e!421086 () Bool)

(assert (=> b!755112 (= e!421086 e!421079)))

(declare-fun res!510452 () Bool)

(assert (=> b!755112 (=> res!510452 e!421079)))

(assert (=> b!755112 (= res!510452 (= lt!335988 lt!335982))))

(assert (=> b!755112 (= lt!335988 (select (store (arr!20075 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755113 () Bool)

(assert (=> b!755113 (= e!421082 e!421085)))

(declare-fun res!510441 () Bool)

(assert (=> b!755113 (=> (not res!510441) (not e!421085))))

(declare-fun lt!335986 () SeekEntryResult!7672)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41922 (_ BitVec 32)) SeekEntryResult!7672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755113 (= res!510441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20075 a!3186) j!159) mask!3328) (select (arr!20075 a!3186) j!159) a!3186 mask!3328) lt!335986))))

(assert (=> b!755113 (= lt!335986 (Intermediate!7672 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755114 () Bool)

(declare-fun res!510442 () Bool)

(assert (=> b!755114 (=> (not res!510442) (not e!421087))))

(assert (=> b!755114 (= res!510442 (and (= (size!20496 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20496 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20496 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755115 () Bool)

(declare-fun res!510453 () Bool)

(assert (=> b!755115 (=> (not res!510453) (not e!421082))))

(assert (=> b!755115 (= res!510453 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20496 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20496 a!3186))))))

(declare-fun b!755116 () Bool)

(declare-fun res!510448 () Bool)

(assert (=> b!755116 (=> (not res!510448) (not e!421082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41922 (_ BitVec 32)) Bool)

(assert (=> b!755116 (= res!510448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755117 () Bool)

(declare-fun res!510454 () Bool)

(assert (=> b!755117 (=> (not res!510454) (not e!421087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755117 (= res!510454 (validKeyInArray!0 (select (arr!20075 a!3186) j!159)))))

(declare-fun b!755118 () Bool)

(declare-fun e!421077 () Bool)

(declare-fun e!421081 () Bool)

(assert (=> b!755118 (= e!421077 (not e!421081))))

(declare-fun res!510438 () Bool)

(assert (=> b!755118 (=> res!510438 e!421081)))

(declare-fun lt!335987 () SeekEntryResult!7672)

(get-info :version)

(assert (=> b!755118 (= res!510438 (or (not ((_ is Intermediate!7672) lt!335987)) (bvslt x!1131 (x!63969 lt!335987)) (not (= x!1131 (x!63969 lt!335987))) (not (= index!1321 (index!33058 lt!335987)))))))

(assert (=> b!755118 e!421083))

(declare-fun res!510444 () Bool)

(assert (=> b!755118 (=> (not res!510444) (not e!421083))))

(declare-fun lt!335989 () SeekEntryResult!7672)

(assert (=> b!755118 (= res!510444 (= lt!335989 lt!335992))))

(assert (=> b!755118 (= lt!335992 (Found!7672 j!159))))

(assert (=> b!755118 (= lt!335989 (seekEntryOrOpen!0 (select (arr!20075 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755118 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335991 () Unit!26048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26048)

(assert (=> b!755118 (= lt!335991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!421080 () Bool)

(declare-fun b!755119 () Bool)

(assert (=> b!755119 (= e!421080 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20075 a!3186) j!159) a!3186 mask!3328) (Found!7672 j!159)))))

(declare-fun b!755120 () Bool)

(declare-fun Unit!26050 () Unit!26048)

(assert (=> b!755120 (= e!421078 Unit!26050)))

(declare-fun b!755121 () Bool)

(assert (=> b!755121 (= e!421081 e!421086)))

(declare-fun res!510450 () Bool)

(assert (=> b!755121 (=> res!510450 e!421086)))

(declare-fun lt!335983 () SeekEntryResult!7672)

(assert (=> b!755121 (= res!510450 (not (= lt!335983 lt!335992)))))

(assert (=> b!755121 (= lt!335983 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20075 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755122 () Bool)

(declare-fun res!510446 () Bool)

(assert (=> b!755122 (=> (not res!510446) (not e!421082))))

(declare-datatypes ((List!14116 0))(
  ( (Nil!14113) (Cons!14112 (h!15184 (_ BitVec 64)) (t!20422 List!14116)) )
))
(declare-fun arrayNoDuplicates!0 (array!41922 (_ BitVec 32) List!14116) Bool)

(assert (=> b!755122 (= res!510446 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14113))))

(declare-fun b!755123 () Bool)

(declare-fun res!510455 () Bool)

(assert (=> b!755123 (=> (not res!510455) (not e!421087))))

(assert (=> b!755123 (= res!510455 (validKeyInArray!0 k0!2102))))

(declare-fun b!755124 () Bool)

(assert (=> b!755124 (= e!421084 (= lt!335989 lt!335983))))

(declare-fun b!755125 () Bool)

(declare-fun Unit!26051 () Unit!26048)

(assert (=> b!755125 (= e!421078 Unit!26051)))

(assert (=> b!755125 false))

(declare-fun b!755126 () Bool)

(declare-fun res!510451 () Bool)

(assert (=> b!755126 (=> (not res!510451) (not e!421087))))

(declare-fun arrayContainsKey!0 (array!41922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755126 (= res!510451 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755127 () Bool)

(assert (=> b!755127 (= e!421080 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20075 a!3186) j!159) a!3186 mask!3328) lt!335986))))

(declare-fun b!755128 () Bool)

(declare-fun res!510449 () Bool)

(assert (=> b!755128 (=> (not res!510449) (not e!421085))))

(assert (=> b!755128 (= res!510449 e!421080)))

(declare-fun c!82716 () Bool)

(assert (=> b!755128 (= c!82716 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755129 () Bool)

(assert (=> b!755129 (= e!421085 e!421077)))

(declare-fun res!510445 () Bool)

(assert (=> b!755129 (=> (not res!510445) (not e!421077))))

(declare-fun lt!335990 () SeekEntryResult!7672)

(assert (=> b!755129 (= res!510445 (= lt!335990 lt!335987))))

(assert (=> b!755129 (= lt!335987 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335982 lt!335984 mask!3328))))

(assert (=> b!755129 (= lt!335990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335982 mask!3328) lt!335982 lt!335984 mask!3328))))

(assert (=> b!755129 (= lt!335982 (select (store (arr!20075 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755129 (= lt!335984 (array!41923 (store (arr!20075 a!3186) i!1173 k0!2102) (size!20496 a!3186)))))

(assert (= (and start!65732 res!510456) b!755114))

(assert (= (and b!755114 res!510442) b!755117))

(assert (= (and b!755117 res!510454) b!755123))

(assert (= (and b!755123 res!510455) b!755126))

(assert (= (and b!755126 res!510451) b!755107))

(assert (= (and b!755107 res!510440) b!755116))

(assert (= (and b!755116 res!510448) b!755122))

(assert (= (and b!755122 res!510446) b!755115))

(assert (= (and b!755115 res!510453) b!755113))

(assert (= (and b!755113 res!510441) b!755108))

(assert (= (and b!755108 res!510439) b!755128))

(assert (= (and b!755128 c!82716) b!755127))

(assert (= (and b!755128 (not c!82716)) b!755119))

(assert (= (and b!755128 res!510449) b!755129))

(assert (= (and b!755129 res!510445) b!755118))

(assert (= (and b!755118 res!510444) b!755110))

(assert (= (and b!755118 (not res!510438)) b!755121))

(assert (= (and b!755121 (not res!510450)) b!755112))

(assert (= (and b!755112 (not res!510452)) b!755111))

(assert (= (and b!755111 c!82715) b!755125))

(assert (= (and b!755111 (not c!82715)) b!755120))

(assert (= (and b!755111 res!510447) b!755109))

(assert (= (and b!755109 res!510443) b!755124))

(declare-fun m!702821 () Bool)

(assert (=> b!755127 m!702821))

(assert (=> b!755127 m!702821))

(declare-fun m!702823 () Bool)

(assert (=> b!755127 m!702823))

(assert (=> b!755121 m!702821))

(assert (=> b!755121 m!702821))

(declare-fun m!702825 () Bool)

(assert (=> b!755121 m!702825))

(declare-fun m!702827 () Bool)

(assert (=> b!755126 m!702827))

(declare-fun m!702829 () Bool)

(assert (=> b!755116 m!702829))

(assert (=> b!755110 m!702821))

(assert (=> b!755110 m!702821))

(declare-fun m!702831 () Bool)

(assert (=> b!755110 m!702831))

(assert (=> b!755113 m!702821))

(assert (=> b!755113 m!702821))

(declare-fun m!702833 () Bool)

(assert (=> b!755113 m!702833))

(assert (=> b!755113 m!702833))

(assert (=> b!755113 m!702821))

(declare-fun m!702835 () Bool)

(assert (=> b!755113 m!702835))

(assert (=> b!755117 m!702821))

(assert (=> b!755117 m!702821))

(declare-fun m!702837 () Bool)

(assert (=> b!755117 m!702837))

(declare-fun m!702839 () Bool)

(assert (=> b!755129 m!702839))

(declare-fun m!702841 () Bool)

(assert (=> b!755129 m!702841))

(declare-fun m!702843 () Bool)

(assert (=> b!755129 m!702843))

(declare-fun m!702845 () Bool)

(assert (=> b!755129 m!702845))

(assert (=> b!755129 m!702839))

(declare-fun m!702847 () Bool)

(assert (=> b!755129 m!702847))

(declare-fun m!702849 () Bool)

(assert (=> start!65732 m!702849))

(declare-fun m!702851 () Bool)

(assert (=> start!65732 m!702851))

(assert (=> b!755118 m!702821))

(assert (=> b!755118 m!702821))

(declare-fun m!702853 () Bool)

(assert (=> b!755118 m!702853))

(declare-fun m!702855 () Bool)

(assert (=> b!755118 m!702855))

(declare-fun m!702857 () Bool)

(assert (=> b!755118 m!702857))

(declare-fun m!702859 () Bool)

(assert (=> b!755107 m!702859))

(assert (=> b!755119 m!702821))

(assert (=> b!755119 m!702821))

(assert (=> b!755119 m!702825))

(declare-fun m!702861 () Bool)

(assert (=> b!755109 m!702861))

(declare-fun m!702863 () Bool)

(assert (=> b!755109 m!702863))

(assert (=> b!755112 m!702841))

(declare-fun m!702865 () Bool)

(assert (=> b!755112 m!702865))

(declare-fun m!702867 () Bool)

(assert (=> b!755123 m!702867))

(declare-fun m!702869 () Bool)

(assert (=> b!755122 m!702869))

(declare-fun m!702871 () Bool)

(assert (=> b!755108 m!702871))

(check-sat (not b!755116) (not b!755127) (not b!755117) (not b!755107) (not b!755118) (not b!755121) (not start!65732) (not b!755109) (not b!755126) (not b!755119) (not b!755129) (not b!755110) (not b!755123) (not b!755113) (not b!755122))
(check-sat)
