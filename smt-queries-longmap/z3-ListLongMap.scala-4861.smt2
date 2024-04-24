; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67126 () Bool)

(assert start!67126)

(declare-fun b!773885 () Bool)

(declare-fun e!430859 () Bool)

(declare-fun e!430864 () Bool)

(assert (=> b!773885 (= e!430859 (not e!430864))))

(declare-fun res!523203 () Bool)

(assert (=> b!773885 (=> res!523203 e!430864)))

(declare-datatypes ((SeekEntryResult!7864 0))(
  ( (MissingZero!7864 (index!33824 (_ BitVec 32))) (Found!7864 (index!33825 (_ BitVec 32))) (Intermediate!7864 (undefined!8676 Bool) (index!33826 (_ BitVec 32)) (x!64926 (_ BitVec 32))) (Undefined!7864) (MissingVacant!7864 (index!33827 (_ BitVec 32))) )
))
(declare-fun lt!344579 () SeekEntryResult!7864)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!773885 (= res!523203 (or (not ((_ is Intermediate!7864) lt!344579)) (bvsge x!1131 (x!64926 lt!344579))))))

(declare-fun e!430867 () Bool)

(assert (=> b!773885 e!430867))

(declare-fun res!523196 () Bool)

(assert (=> b!773885 (=> (not res!523196) (not e!430867))))

(declare-datatypes ((array!42430 0))(
  ( (array!42431 (arr!20308 (Array (_ BitVec 32) (_ BitVec 64))) (size!20728 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42430)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42430 (_ BitVec 32)) Bool)

(assert (=> b!773885 (= res!523196 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26647 0))(
  ( (Unit!26648) )
))
(declare-fun lt!344573 () Unit!26647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26647)

(assert (=> b!773885 (= lt!344573 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773886 () Bool)

(declare-fun res!523197 () Bool)

(declare-fun e!430865 () Bool)

(assert (=> b!773886 (=> (not res!523197) (not e!430865))))

(declare-datatypes ((List!14217 0))(
  ( (Nil!14214) (Cons!14213 (h!15324 (_ BitVec 64)) (t!20524 List!14217)) )
))
(declare-fun arrayNoDuplicates!0 (array!42430 (_ BitVec 32) List!14217) Bool)

(assert (=> b!773886 (= res!523197 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14214))))

(declare-fun b!773887 () Bool)

(declare-fun res!523194 () Bool)

(declare-fun e!430858 () Bool)

(assert (=> b!773887 (=> (not res!523194) (not e!430858))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773887 (= res!523194 (validKeyInArray!0 k0!2102))))

(declare-fun b!773888 () Bool)

(declare-fun e!430861 () Bool)

(assert (=> b!773888 (= e!430861 e!430859)))

(declare-fun res!523199 () Bool)

(assert (=> b!773888 (=> (not res!523199) (not e!430859))))

(declare-fun lt!344580 () SeekEntryResult!7864)

(assert (=> b!773888 (= res!523199 (= lt!344580 lt!344579))))

(declare-fun lt!344572 () array!42430)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!344578 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42430 (_ BitVec 32)) SeekEntryResult!7864)

(assert (=> b!773888 (= lt!344579 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344578 lt!344572 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773888 (= lt!344580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344578 mask!3328) lt!344578 lt!344572 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773888 (= lt!344578 (select (store (arr!20308 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773888 (= lt!344572 (array!42431 (store (arr!20308 a!3186) i!1173 k0!2102) (size!20728 a!3186)))))

(declare-fun b!773889 () Bool)

(declare-fun res!523200 () Bool)

(assert (=> b!773889 (=> (not res!523200) (not e!430858))))

(assert (=> b!773889 (= res!523200 (and (= (size!20728 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20728 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20728 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!430860 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!773890 () Bool)

(declare-fun lt!344571 () SeekEntryResult!7864)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42430 (_ BitVec 32)) SeekEntryResult!7864)

(assert (=> b!773890 (= e!430860 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344571))))

(declare-fun lt!344574 () SeekEntryResult!7864)

(declare-fun e!430866 () Bool)

(declare-fun b!773891 () Bool)

(assert (=> b!773891 (= e!430866 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344574))))

(declare-fun res!523207 () Bool)

(assert (=> start!67126 (=> (not res!523207) (not e!430858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67126 (= res!523207 (validMask!0 mask!3328))))

(assert (=> start!67126 e!430858))

(assert (=> start!67126 true))

(declare-fun array_inv!16167 (array!42430) Bool)

(assert (=> start!67126 (array_inv!16167 a!3186)))

(declare-fun b!773892 () Bool)

(declare-fun res!523205 () Bool)

(assert (=> b!773892 (=> (not res!523205) (not e!430858))))

(assert (=> b!773892 (= res!523205 (validKeyInArray!0 (select (arr!20308 a!3186) j!159)))))

(declare-fun b!773893 () Bool)

(declare-fun res!523202 () Bool)

(assert (=> b!773893 (=> (not res!523202) (not e!430858))))

(declare-fun arrayContainsKey!0 (array!42430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773893 (= res!523202 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773894 () Bool)

(assert (=> b!773894 (= e!430865 e!430861)))

(declare-fun res!523208 () Bool)

(assert (=> b!773894 (=> (not res!523208) (not e!430861))))

(assert (=> b!773894 (= res!523208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20308 a!3186) j!159) mask!3328) (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344574))))

(assert (=> b!773894 (= lt!344574 (Intermediate!7864 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773895 () Bool)

(declare-fun e!430862 () Unit!26647)

(declare-fun Unit!26649 () Unit!26647)

(assert (=> b!773895 (= e!430862 Unit!26649)))

(declare-fun lt!344577 () SeekEntryResult!7864)

(assert (=> b!773895 (= lt!344577 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20308 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344575 () (_ BitVec 32))

(assert (=> b!773895 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344575 resIntermediateIndex!5 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) (Found!7864 j!159))))

(declare-fun b!773896 () Bool)

(declare-fun Unit!26650 () Unit!26647)

(assert (=> b!773896 (= e!430862 Unit!26650)))

(assert (=> b!773896 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344575 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344574)))

(declare-fun b!773897 () Bool)

(assert (=> b!773897 (= e!430867 e!430860)))

(declare-fun res!523195 () Bool)

(assert (=> b!773897 (=> (not res!523195) (not e!430860))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42430 (_ BitVec 32)) SeekEntryResult!7864)

(assert (=> b!773897 (= res!523195 (= (seekEntryOrOpen!0 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344571))))

(assert (=> b!773897 (= lt!344571 (Found!7864 j!159))))

(declare-fun b!773898 () Bool)

(assert (=> b!773898 (= e!430866 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) (Found!7864 j!159)))))

(declare-fun b!773899 () Bool)

(declare-fun res!523198 () Bool)

(assert (=> b!773899 (=> (not res!523198) (not e!430861))))

(assert (=> b!773899 (= res!523198 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20308 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773900 () Bool)

(declare-fun res!523206 () Bool)

(assert (=> b!773900 (=> (not res!523206) (not e!430865))))

(assert (=> b!773900 (= res!523206 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20728 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20728 a!3186))))))

(declare-fun b!773901 () Bool)

(declare-fun res!523201 () Bool)

(assert (=> b!773901 (=> (not res!523201) (not e!430865))))

(assert (=> b!773901 (= res!523201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773902 () Bool)

(assert (=> b!773902 (= e!430858 e!430865)))

(declare-fun res!523209 () Bool)

(assert (=> b!773902 (=> (not res!523209) (not e!430865))))

(declare-fun lt!344576 () SeekEntryResult!7864)

(assert (=> b!773902 (= res!523209 (or (= lt!344576 (MissingZero!7864 i!1173)) (= lt!344576 (MissingVacant!7864 i!1173))))))

(assert (=> b!773902 (= lt!344576 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773903 () Bool)

(assert (=> b!773903 (= e!430864 true)))

(declare-fun lt!344581 () Unit!26647)

(assert (=> b!773903 (= lt!344581 e!430862)))

(declare-fun c!85747 () Bool)

(assert (=> b!773903 (= c!85747 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773903 (= lt!344575 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!773904 () Bool)

(declare-fun res!523204 () Bool)

(assert (=> b!773904 (=> (not res!523204) (not e!430861))))

(assert (=> b!773904 (= res!523204 e!430866)))

(declare-fun c!85748 () Bool)

(assert (=> b!773904 (= c!85748 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67126 res!523207) b!773889))

(assert (= (and b!773889 res!523200) b!773892))

(assert (= (and b!773892 res!523205) b!773887))

(assert (= (and b!773887 res!523194) b!773893))

(assert (= (and b!773893 res!523202) b!773902))

(assert (= (and b!773902 res!523209) b!773901))

(assert (= (and b!773901 res!523201) b!773886))

(assert (= (and b!773886 res!523197) b!773900))

(assert (= (and b!773900 res!523206) b!773894))

(assert (= (and b!773894 res!523208) b!773899))

(assert (= (and b!773899 res!523198) b!773904))

(assert (= (and b!773904 c!85748) b!773891))

(assert (= (and b!773904 (not c!85748)) b!773898))

(assert (= (and b!773904 res!523204) b!773888))

(assert (= (and b!773888 res!523199) b!773885))

(assert (= (and b!773885 res!523196) b!773897))

(assert (= (and b!773897 res!523195) b!773890))

(assert (= (and b!773885 (not res!523203)) b!773903))

(assert (= (and b!773903 c!85747) b!773896))

(assert (= (and b!773903 (not c!85747)) b!773895))

(declare-fun m!719051 () Bool)

(assert (=> b!773903 m!719051))

(declare-fun m!719053 () Bool)

(assert (=> b!773898 m!719053))

(assert (=> b!773898 m!719053))

(declare-fun m!719055 () Bool)

(assert (=> b!773898 m!719055))

(declare-fun m!719057 () Bool)

(assert (=> b!773901 m!719057))

(declare-fun m!719059 () Bool)

(assert (=> b!773893 m!719059))

(assert (=> b!773892 m!719053))

(assert (=> b!773892 m!719053))

(declare-fun m!719061 () Bool)

(assert (=> b!773892 m!719061))

(assert (=> b!773895 m!719053))

(assert (=> b!773895 m!719053))

(assert (=> b!773895 m!719055))

(assert (=> b!773895 m!719053))

(declare-fun m!719063 () Bool)

(assert (=> b!773895 m!719063))

(declare-fun m!719065 () Bool)

(assert (=> b!773887 m!719065))

(assert (=> b!773890 m!719053))

(assert (=> b!773890 m!719053))

(declare-fun m!719067 () Bool)

(assert (=> b!773890 m!719067))

(assert (=> b!773897 m!719053))

(assert (=> b!773897 m!719053))

(declare-fun m!719069 () Bool)

(assert (=> b!773897 m!719069))

(declare-fun m!719071 () Bool)

(assert (=> b!773885 m!719071))

(declare-fun m!719073 () Bool)

(assert (=> b!773885 m!719073))

(assert (=> b!773896 m!719053))

(assert (=> b!773896 m!719053))

(declare-fun m!719075 () Bool)

(assert (=> b!773896 m!719075))

(declare-fun m!719077 () Bool)

(assert (=> b!773888 m!719077))

(assert (=> b!773888 m!719077))

(declare-fun m!719079 () Bool)

(assert (=> b!773888 m!719079))

(declare-fun m!719081 () Bool)

(assert (=> b!773888 m!719081))

(declare-fun m!719083 () Bool)

(assert (=> b!773888 m!719083))

(declare-fun m!719085 () Bool)

(assert (=> b!773888 m!719085))

(declare-fun m!719087 () Bool)

(assert (=> start!67126 m!719087))

(declare-fun m!719089 () Bool)

(assert (=> start!67126 m!719089))

(declare-fun m!719091 () Bool)

(assert (=> b!773902 m!719091))

(declare-fun m!719093 () Bool)

(assert (=> b!773899 m!719093))

(assert (=> b!773891 m!719053))

(assert (=> b!773891 m!719053))

(declare-fun m!719095 () Bool)

(assert (=> b!773891 m!719095))

(declare-fun m!719097 () Bool)

(assert (=> b!773886 m!719097))

(assert (=> b!773894 m!719053))

(assert (=> b!773894 m!719053))

(declare-fun m!719099 () Bool)

(assert (=> b!773894 m!719099))

(assert (=> b!773894 m!719099))

(assert (=> b!773894 m!719053))

(declare-fun m!719101 () Bool)

(assert (=> b!773894 m!719101))

(check-sat (not b!773901) (not b!773896) (not b!773886) (not b!773894) (not b!773891) (not b!773902) (not b!773892) (not b!773895) (not start!67126) (not b!773897) (not b!773890) (not b!773888) (not b!773885) (not b!773898) (not b!773887) (not b!773903) (not b!773893))
(check-sat)
