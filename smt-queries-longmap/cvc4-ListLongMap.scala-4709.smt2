; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65318 () Bool)

(assert start!65318)

(declare-datatypes ((array!41491 0))(
  ( (array!41492 (arr!19859 (Array (_ BitVec 32) (_ BitVec 64))) (size!20280 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41491)

(declare-fun b!741902 () Bool)

(declare-fun e!414668 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7459 0))(
  ( (MissingZero!7459 (index!32204 (_ BitVec 32))) (Found!7459 (index!32205 (_ BitVec 32))) (Intermediate!7459 (undefined!8271 Bool) (index!32206 (_ BitVec 32)) (x!63177 (_ BitVec 32))) (Undefined!7459) (MissingVacant!7459 (index!32207 (_ BitVec 32))) )
))
(declare-fun lt!329608 () SeekEntryResult!7459)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41491 (_ BitVec 32)) SeekEntryResult!7459)

(assert (=> b!741902 (= e!414668 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19859 a!3186) j!159) a!3186 mask!3328) lt!329608))))

(declare-fun b!741903 () Bool)

(declare-fun res!499168 () Bool)

(declare-fun e!414671 () Bool)

(assert (=> b!741903 (=> (not res!499168) (not e!414671))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741903 (= res!499168 (and (= (size!20280 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20280 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20280 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741904 () Bool)

(declare-fun res!499166 () Bool)

(declare-fun e!414667 () Bool)

(assert (=> b!741904 (=> (not res!499166) (not e!414667))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741904 (= res!499166 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20280 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20280 a!3186))))))

(declare-fun b!741905 () Bool)

(declare-fun e!414664 () Bool)

(assert (=> b!741905 (= e!414667 e!414664)))

(declare-fun res!499169 () Bool)

(assert (=> b!741905 (=> (not res!499169) (not e!414664))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741905 (= res!499169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19859 a!3186) j!159) mask!3328) (select (arr!19859 a!3186) j!159) a!3186 mask!3328) lt!329608))))

(assert (=> b!741905 (= lt!329608 (Intermediate!7459 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741906 () Bool)

(declare-fun res!499167 () Bool)

(assert (=> b!741906 (=> (not res!499167) (not e!414671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741906 (= res!499167 (validKeyInArray!0 (select (arr!19859 a!3186) j!159)))))

(declare-fun b!741907 () Bool)

(declare-fun res!499162 () Bool)

(assert (=> b!741907 (=> (not res!499162) (not e!414667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41491 (_ BitVec 32)) Bool)

(assert (=> b!741907 (= res!499162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741908 () Bool)

(declare-fun res!499160 () Bool)

(assert (=> b!741908 (=> (not res!499160) (not e!414671))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!741908 (= res!499160 (validKeyInArray!0 k!2102))))

(declare-fun b!741909 () Bool)

(declare-fun e!414666 () Bool)

(declare-fun e!414665 () Bool)

(assert (=> b!741909 (= e!414666 e!414665)))

(declare-fun res!499164 () Bool)

(assert (=> b!741909 (=> (not res!499164) (not e!414665))))

(declare-fun lt!329603 () SeekEntryResult!7459)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41491 (_ BitVec 32)) SeekEntryResult!7459)

(assert (=> b!741909 (= res!499164 (= (seekEntryOrOpen!0 (select (arr!19859 a!3186) j!159) a!3186 mask!3328) lt!329603))))

(assert (=> b!741909 (= lt!329603 (Found!7459 j!159))))

(declare-fun res!499161 () Bool)

(assert (=> start!65318 (=> (not res!499161) (not e!414671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65318 (= res!499161 (validMask!0 mask!3328))))

(assert (=> start!65318 e!414671))

(assert (=> start!65318 true))

(declare-fun array_inv!15655 (array!41491) Bool)

(assert (=> start!65318 (array_inv!15655 a!3186)))

(declare-fun b!741910 () Bool)

(declare-fun res!499157 () Bool)

(assert (=> b!741910 (=> (not res!499157) (not e!414667))))

(declare-datatypes ((List!13861 0))(
  ( (Nil!13858) (Cons!13857 (h!14929 (_ BitVec 64)) (t!20176 List!13861)) )
))
(declare-fun arrayNoDuplicates!0 (array!41491 (_ BitVec 32) List!13861) Bool)

(assert (=> b!741910 (= res!499157 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13858))))

(declare-fun lt!329609 () SeekEntryResult!7459)

(declare-fun b!741911 () Bool)

(declare-fun e!414670 () Bool)

(assert (=> b!741911 (= e!414670 (not (or (not (is-Intermediate!7459 lt!329609)) (not (= x!1131 (x!63177 lt!329609))) (not (= index!1321 (index!32206 lt!329609))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!741911 e!414666))

(declare-fun res!499156 () Bool)

(assert (=> b!741911 (=> (not res!499156) (not e!414666))))

(assert (=> b!741911 (= res!499156 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25398 0))(
  ( (Unit!25399) )
))
(declare-fun lt!329606 () Unit!25398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25398)

(assert (=> b!741911 (= lt!329606 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741912 () Bool)

(declare-fun res!499163 () Bool)

(assert (=> b!741912 (=> (not res!499163) (not e!414664))))

(assert (=> b!741912 (= res!499163 e!414668)))

(declare-fun c!81754 () Bool)

(assert (=> b!741912 (= c!81754 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741913 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41491 (_ BitVec 32)) SeekEntryResult!7459)

(assert (=> b!741913 (= e!414665 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19859 a!3186) j!159) a!3186 mask!3328) lt!329603))))

(declare-fun b!741914 () Bool)

(declare-fun res!499159 () Bool)

(assert (=> b!741914 (=> (not res!499159) (not e!414664))))

(assert (=> b!741914 (= res!499159 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19859 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741915 () Bool)

(assert (=> b!741915 (= e!414668 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19859 a!3186) j!159) a!3186 mask!3328) (Found!7459 j!159)))))

(declare-fun b!741916 () Bool)

(assert (=> b!741916 (= e!414664 e!414670)))

(declare-fun res!499155 () Bool)

(assert (=> b!741916 (=> (not res!499155) (not e!414670))))

(declare-fun lt!329602 () SeekEntryResult!7459)

(assert (=> b!741916 (= res!499155 (= lt!329602 lt!329609))))

(declare-fun lt!329605 () (_ BitVec 64))

(declare-fun lt!329607 () array!41491)

(assert (=> b!741916 (= lt!329609 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329605 lt!329607 mask!3328))))

(assert (=> b!741916 (= lt!329602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329605 mask!3328) lt!329605 lt!329607 mask!3328))))

(assert (=> b!741916 (= lt!329605 (select (store (arr!19859 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741916 (= lt!329607 (array!41492 (store (arr!19859 a!3186) i!1173 k!2102) (size!20280 a!3186)))))

(declare-fun b!741917 () Bool)

(declare-fun res!499165 () Bool)

(assert (=> b!741917 (=> (not res!499165) (not e!414671))))

(declare-fun arrayContainsKey!0 (array!41491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741917 (= res!499165 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741918 () Bool)

(assert (=> b!741918 (= e!414671 e!414667)))

(declare-fun res!499158 () Bool)

(assert (=> b!741918 (=> (not res!499158) (not e!414667))))

(declare-fun lt!329604 () SeekEntryResult!7459)

(assert (=> b!741918 (= res!499158 (or (= lt!329604 (MissingZero!7459 i!1173)) (= lt!329604 (MissingVacant!7459 i!1173))))))

(assert (=> b!741918 (= lt!329604 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65318 res!499161) b!741903))

(assert (= (and b!741903 res!499168) b!741906))

(assert (= (and b!741906 res!499167) b!741908))

(assert (= (and b!741908 res!499160) b!741917))

(assert (= (and b!741917 res!499165) b!741918))

(assert (= (and b!741918 res!499158) b!741907))

(assert (= (and b!741907 res!499162) b!741910))

(assert (= (and b!741910 res!499157) b!741904))

(assert (= (and b!741904 res!499166) b!741905))

(assert (= (and b!741905 res!499169) b!741914))

(assert (= (and b!741914 res!499159) b!741912))

(assert (= (and b!741912 c!81754) b!741902))

(assert (= (and b!741912 (not c!81754)) b!741915))

(assert (= (and b!741912 res!499163) b!741916))

(assert (= (and b!741916 res!499155) b!741911))

(assert (= (and b!741911 res!499156) b!741909))

(assert (= (and b!741909 res!499164) b!741913))

(declare-fun m!692829 () Bool)

(assert (=> b!741910 m!692829))

(declare-fun m!692831 () Bool)

(assert (=> b!741915 m!692831))

(assert (=> b!741915 m!692831))

(declare-fun m!692833 () Bool)

(assert (=> b!741915 m!692833))

(assert (=> b!741902 m!692831))

(assert (=> b!741902 m!692831))

(declare-fun m!692835 () Bool)

(assert (=> b!741902 m!692835))

(assert (=> b!741906 m!692831))

(assert (=> b!741906 m!692831))

(declare-fun m!692837 () Bool)

(assert (=> b!741906 m!692837))

(declare-fun m!692839 () Bool)

(assert (=> b!741911 m!692839))

(declare-fun m!692841 () Bool)

(assert (=> b!741911 m!692841))

(assert (=> b!741905 m!692831))

(assert (=> b!741905 m!692831))

(declare-fun m!692843 () Bool)

(assert (=> b!741905 m!692843))

(assert (=> b!741905 m!692843))

(assert (=> b!741905 m!692831))

(declare-fun m!692845 () Bool)

(assert (=> b!741905 m!692845))

(declare-fun m!692847 () Bool)

(assert (=> b!741914 m!692847))

(declare-fun m!692849 () Bool)

(assert (=> b!741907 m!692849))

(declare-fun m!692851 () Bool)

(assert (=> b!741918 m!692851))

(assert (=> b!741909 m!692831))

(assert (=> b!741909 m!692831))

(declare-fun m!692853 () Bool)

(assert (=> b!741909 m!692853))

(declare-fun m!692855 () Bool)

(assert (=> b!741908 m!692855))

(declare-fun m!692857 () Bool)

(assert (=> start!65318 m!692857))

(declare-fun m!692859 () Bool)

(assert (=> start!65318 m!692859))

(assert (=> b!741913 m!692831))

(assert (=> b!741913 m!692831))

(declare-fun m!692861 () Bool)

(assert (=> b!741913 m!692861))

(declare-fun m!692863 () Bool)

(assert (=> b!741916 m!692863))

(declare-fun m!692865 () Bool)

(assert (=> b!741916 m!692865))

(declare-fun m!692867 () Bool)

(assert (=> b!741916 m!692867))

(declare-fun m!692869 () Bool)

(assert (=> b!741916 m!692869))

(assert (=> b!741916 m!692863))

(declare-fun m!692871 () Bool)

(assert (=> b!741916 m!692871))

(declare-fun m!692873 () Bool)

(assert (=> b!741917 m!692873))

(push 1)

(assert (not b!741917))

(assert (not b!741910))

(assert (not b!741902))

(assert (not b!741918))

(assert (not b!741906))

(assert (not b!741907))

(assert (not b!741916))

(assert (not b!741913))

(assert (not b!741905))

(assert (not start!65318))

(assert (not b!741911))

(assert (not b!741909))

(assert (not b!741915))

(assert (not b!741908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

