; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67106 () Bool)

(assert start!67106)

(declare-fun b!774597 () Bool)

(declare-datatypes ((Unit!26718 0))(
  ( (Unit!26719) )
))
(declare-fun e!431178 () Unit!26718)

(declare-fun Unit!26720 () Unit!26718)

(assert (=> b!774597 (= e!431178 Unit!26720)))

(declare-datatypes ((array!42461 0))(
  ( (array!42462 (arr!20326 (Array (_ BitVec 32) (_ BitVec 64))) (size!20747 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42461)

(declare-fun lt!344968 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7926 0))(
  ( (MissingZero!7926 (index!34072 (_ BitVec 32))) (Found!7926 (index!34073 (_ BitVec 32))) (Intermediate!7926 (undefined!8738 Bool) (index!34074 (_ BitVec 32)) (x!65021 (_ BitVec 32))) (Undefined!7926) (MissingVacant!7926 (index!34075 (_ BitVec 32))) )
))
(declare-fun lt!344966 () SeekEntryResult!7926)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42461 (_ BitVec 32)) SeekEntryResult!7926)

(assert (=> b!774597 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344968 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!344966)))

(declare-fun b!774598 () Bool)

(declare-fun e!431169 () Bool)

(assert (=> b!774598 (= e!431169 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1131)) (bvsub #b01111111111111111111111111111110 x!1131)))))

(declare-fun b!774599 () Bool)

(declare-fun e!431179 () Bool)

(assert (=> b!774599 (= e!431179 e!431169)))

(declare-fun res!523746 () Bool)

(assert (=> b!774599 (=> res!523746 e!431169)))

(assert (=> b!774599 (= res!523746 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344968 #b00000000000000000000000000000000) (bvsge lt!344968 (size!20747 a!3186))))))

(declare-fun lt!344973 () Unit!26718)

(assert (=> b!774599 (= lt!344973 e!431178)))

(declare-fun c!85834 () Bool)

(declare-fun lt!344976 () Bool)

(assert (=> b!774599 (= c!85834 lt!344976)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774599 (= lt!344976 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774599 (= lt!344968 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!523750 () Bool)

(declare-fun e!431173 () Bool)

(assert (=> start!67106 (=> (not res!523750) (not e!431173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67106 (= res!523750 (validMask!0 mask!3328))))

(assert (=> start!67106 e!431173))

(assert (=> start!67106 true))

(declare-fun array_inv!16122 (array!42461) Bool)

(assert (=> start!67106 (array_inv!16122 a!3186)))

(declare-fun b!774600 () Bool)

(declare-fun res!523735 () Bool)

(declare-fun e!431172 () Bool)

(assert (=> b!774600 (=> (not res!523735) (not e!431172))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!774600 (= res!523735 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20747 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20747 a!3186))))))

(declare-fun b!774601 () Bool)

(declare-fun res!523742 () Bool)

(assert (=> b!774601 (=> res!523742 e!431169)))

(declare-fun e!431175 () Bool)

(assert (=> b!774601 (= res!523742 e!431175)))

(declare-fun c!85832 () Bool)

(assert (=> b!774601 (= c!85832 lt!344976)))

(declare-fun b!774602 () Bool)

(declare-fun res!523745 () Bool)

(declare-fun e!431177 () Bool)

(assert (=> b!774602 (=> (not res!523745) (not e!431177))))

(declare-fun e!431170 () Bool)

(assert (=> b!774602 (= res!523745 e!431170)))

(declare-fun c!85833 () Bool)

(assert (=> b!774602 (= c!85833 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774603 () Bool)

(declare-fun res!523744 () Bool)

(assert (=> b!774603 (=> (not res!523744) (not e!431177))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774603 (= res!523744 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20326 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774604 () Bool)

(declare-fun res!523743 () Bool)

(assert (=> b!774604 (=> (not res!523743) (not e!431173))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774604 (= res!523743 (validKeyInArray!0 k0!2102))))

(declare-fun b!774605 () Bool)

(declare-fun res!523737 () Bool)

(assert (=> b!774605 (=> (not res!523737) (not e!431172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42461 (_ BitVec 32)) Bool)

(assert (=> b!774605 (= res!523737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774606 () Bool)

(assert (=> b!774606 (= e!431173 e!431172)))

(declare-fun res!523739 () Bool)

(assert (=> b!774606 (=> (not res!523739) (not e!431172))))

(declare-fun lt!344978 () SeekEntryResult!7926)

(assert (=> b!774606 (= res!523739 (or (= lt!344978 (MissingZero!7926 i!1173)) (= lt!344978 (MissingVacant!7926 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42461 (_ BitVec 32)) SeekEntryResult!7926)

(assert (=> b!774606 (= lt!344978 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!774607 () Bool)

(declare-fun res!523734 () Bool)

(assert (=> b!774607 (=> (not res!523734) (not e!431173))))

(assert (=> b!774607 (= res!523734 (validKeyInArray!0 (select (arr!20326 a!3186) j!159)))))

(declare-fun b!774608 () Bool)

(declare-fun res!523738 () Bool)

(assert (=> b!774608 (=> (not res!523738) (not e!431172))))

(declare-datatypes ((List!14328 0))(
  ( (Nil!14325) (Cons!14324 (h!15432 (_ BitVec 64)) (t!20643 List!14328)) )
))
(declare-fun arrayNoDuplicates!0 (array!42461 (_ BitVec 32) List!14328) Bool)

(assert (=> b!774608 (= res!523738 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14325))))

(declare-fun b!774609 () Bool)

(declare-fun e!431171 () Bool)

(assert (=> b!774609 (= e!431171 (not e!431179))))

(declare-fun res!523733 () Bool)

(assert (=> b!774609 (=> res!523733 e!431179)))

(declare-fun lt!344969 () SeekEntryResult!7926)

(get-info :version)

(assert (=> b!774609 (= res!523733 (or (not ((_ is Intermediate!7926) lt!344969)) (bvsge x!1131 (x!65021 lt!344969))))))

(declare-fun lt!344974 () SeekEntryResult!7926)

(assert (=> b!774609 (= lt!344974 (Found!7926 j!159))))

(declare-fun e!431174 () Bool)

(assert (=> b!774609 e!431174))

(declare-fun res!523749 () Bool)

(assert (=> b!774609 (=> (not res!523749) (not e!431174))))

(assert (=> b!774609 (= res!523749 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344977 () Unit!26718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26718)

(assert (=> b!774609 (= lt!344977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774610 () Bool)

(declare-fun res!523736 () Bool)

(assert (=> b!774610 (=> res!523736 e!431169)))

(declare-fun lt!344972 () (_ BitVec 64))

(declare-fun lt!344975 () SeekEntryResult!7926)

(declare-fun lt!344970 () array!42461)

(assert (=> b!774610 (= res!523736 (not (= lt!344975 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344968 lt!344972 lt!344970 mask!3328))))))

(declare-fun b!774611 () Bool)

(declare-fun lt!344971 () SeekEntryResult!7926)

(declare-fun e!431176 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42461 (_ BitVec 32)) SeekEntryResult!7926)

(assert (=> b!774611 (= e!431176 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!344971))))

(declare-fun b!774612 () Bool)

(assert (=> b!774612 (= e!431170 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) (Found!7926 j!159)))))

(declare-fun b!774613 () Bool)

(declare-fun res!523751 () Bool)

(assert (=> b!774613 (=> (not res!523751) (not e!431173))))

(declare-fun arrayContainsKey!0 (array!42461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774613 (= res!523751 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774614 () Bool)

(declare-fun Unit!26721 () Unit!26718)

(assert (=> b!774614 (= e!431178 Unit!26721)))

(declare-fun lt!344967 () SeekEntryResult!7926)

(assert (=> b!774614 (= lt!344967 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774614 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344968 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!344974)))

(declare-fun b!774615 () Bool)

(assert (=> b!774615 (= e!431175 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344968 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!344966)))))

(declare-fun b!774616 () Bool)

(assert (=> b!774616 (= e!431170 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!344966))))

(declare-fun b!774617 () Bool)

(assert (=> b!774617 (= e!431174 e!431176)))

(declare-fun res!523740 () Bool)

(assert (=> b!774617 (=> (not res!523740) (not e!431176))))

(assert (=> b!774617 (= res!523740 (= (seekEntryOrOpen!0 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!344971))))

(assert (=> b!774617 (= lt!344971 (Found!7926 j!159))))

(declare-fun b!774618 () Bool)

(declare-fun res!523741 () Bool)

(assert (=> b!774618 (=> (not res!523741) (not e!431173))))

(assert (=> b!774618 (= res!523741 (and (= (size!20747 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20747 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20747 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774619 () Bool)

(assert (=> b!774619 (= e!431177 e!431171)))

(declare-fun res!523747 () Bool)

(assert (=> b!774619 (=> (not res!523747) (not e!431171))))

(assert (=> b!774619 (= res!523747 (= lt!344975 lt!344969))))

(assert (=> b!774619 (= lt!344969 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344972 lt!344970 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774619 (= lt!344975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344972 mask!3328) lt!344972 lt!344970 mask!3328))))

(assert (=> b!774619 (= lt!344972 (select (store (arr!20326 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774619 (= lt!344970 (array!42462 (store (arr!20326 a!3186) i!1173 k0!2102) (size!20747 a!3186)))))

(declare-fun b!774620 () Bool)

(assert (=> b!774620 (= e!431175 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344968 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!344974)))))

(declare-fun b!774621 () Bool)

(assert (=> b!774621 (= e!431172 e!431177)))

(declare-fun res!523748 () Bool)

(assert (=> b!774621 (=> (not res!523748) (not e!431177))))

(assert (=> b!774621 (= res!523748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20326 a!3186) j!159) mask!3328) (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!344966))))

(assert (=> b!774621 (= lt!344966 (Intermediate!7926 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67106 res!523750) b!774618))

(assert (= (and b!774618 res!523741) b!774607))

(assert (= (and b!774607 res!523734) b!774604))

(assert (= (and b!774604 res!523743) b!774613))

(assert (= (and b!774613 res!523751) b!774606))

(assert (= (and b!774606 res!523739) b!774605))

(assert (= (and b!774605 res!523737) b!774608))

(assert (= (and b!774608 res!523738) b!774600))

(assert (= (and b!774600 res!523735) b!774621))

(assert (= (and b!774621 res!523748) b!774603))

(assert (= (and b!774603 res!523744) b!774602))

(assert (= (and b!774602 c!85833) b!774616))

(assert (= (and b!774602 (not c!85833)) b!774612))

(assert (= (and b!774602 res!523745) b!774619))

(assert (= (and b!774619 res!523747) b!774609))

(assert (= (and b!774609 res!523749) b!774617))

(assert (= (and b!774617 res!523740) b!774611))

(assert (= (and b!774609 (not res!523733)) b!774599))

(assert (= (and b!774599 c!85834) b!774597))

(assert (= (and b!774599 (not c!85834)) b!774614))

(assert (= (and b!774599 (not res!523746)) b!774601))

(assert (= (and b!774601 c!85832) b!774615))

(assert (= (and b!774601 (not c!85832)) b!774620))

(assert (= (and b!774601 (not res!523742)) b!774610))

(assert (= (and b!774610 (not res!523736)) b!774598))

(declare-fun m!719021 () Bool)

(assert (=> start!67106 m!719021))

(declare-fun m!719023 () Bool)

(assert (=> start!67106 m!719023))

(declare-fun m!719025 () Bool)

(assert (=> b!774609 m!719025))

(declare-fun m!719027 () Bool)

(assert (=> b!774609 m!719027))

(declare-fun m!719029 () Bool)

(assert (=> b!774607 m!719029))

(assert (=> b!774607 m!719029))

(declare-fun m!719031 () Bool)

(assert (=> b!774607 m!719031))

(assert (=> b!774615 m!719029))

(assert (=> b!774615 m!719029))

(declare-fun m!719033 () Bool)

(assert (=> b!774615 m!719033))

(assert (=> b!774614 m!719029))

(assert (=> b!774614 m!719029))

(declare-fun m!719035 () Bool)

(assert (=> b!774614 m!719035))

(assert (=> b!774614 m!719029))

(declare-fun m!719037 () Bool)

(assert (=> b!774614 m!719037))

(declare-fun m!719039 () Bool)

(assert (=> b!774613 m!719039))

(declare-fun m!719041 () Bool)

(assert (=> b!774610 m!719041))

(assert (=> b!774620 m!719029))

(assert (=> b!774620 m!719029))

(assert (=> b!774620 m!719037))

(declare-fun m!719043 () Bool)

(assert (=> b!774605 m!719043))

(assert (=> b!774612 m!719029))

(assert (=> b!774612 m!719029))

(assert (=> b!774612 m!719035))

(declare-fun m!719045 () Bool)

(assert (=> b!774604 m!719045))

(assert (=> b!774611 m!719029))

(assert (=> b!774611 m!719029))

(declare-fun m!719047 () Bool)

(assert (=> b!774611 m!719047))

(declare-fun m!719049 () Bool)

(assert (=> b!774606 m!719049))

(assert (=> b!774621 m!719029))

(assert (=> b!774621 m!719029))

(declare-fun m!719051 () Bool)

(assert (=> b!774621 m!719051))

(assert (=> b!774621 m!719051))

(assert (=> b!774621 m!719029))

(declare-fun m!719053 () Bool)

(assert (=> b!774621 m!719053))

(declare-fun m!719055 () Bool)

(assert (=> b!774608 m!719055))

(assert (=> b!774597 m!719029))

(assert (=> b!774597 m!719029))

(assert (=> b!774597 m!719033))

(declare-fun m!719057 () Bool)

(assert (=> b!774599 m!719057))

(declare-fun m!719059 () Bool)

(assert (=> b!774619 m!719059))

(declare-fun m!719061 () Bool)

(assert (=> b!774619 m!719061))

(declare-fun m!719063 () Bool)

(assert (=> b!774619 m!719063))

(declare-fun m!719065 () Bool)

(assert (=> b!774619 m!719065))

(assert (=> b!774619 m!719063))

(declare-fun m!719067 () Bool)

(assert (=> b!774619 m!719067))

(assert (=> b!774616 m!719029))

(assert (=> b!774616 m!719029))

(declare-fun m!719069 () Bool)

(assert (=> b!774616 m!719069))

(declare-fun m!719071 () Bool)

(assert (=> b!774603 m!719071))

(assert (=> b!774617 m!719029))

(assert (=> b!774617 m!719029))

(declare-fun m!719073 () Bool)

(assert (=> b!774617 m!719073))

(check-sat (not b!774611) (not b!774609) (not b!774619) (not b!774616) (not b!774620) (not b!774617) (not b!774612) (not b!774604) (not b!774608) (not b!774607) (not b!774599) (not b!774615) (not b!774605) (not b!774614) (not b!774606) (not b!774613) (not start!67106) (not b!774621) (not b!774610) (not b!774597))
(check-sat)
