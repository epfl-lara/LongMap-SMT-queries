; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64736 () Bool)

(assert start!64736)

(declare-fun b!730630 () Bool)

(declare-fun e!408858 () Bool)

(declare-fun e!408866 () Bool)

(assert (=> b!730630 (= e!408858 e!408866)))

(declare-fun res!490907 () Bool)

(assert (=> b!730630 (=> (not res!490907) (not e!408866))))

(declare-datatypes ((SeekEntryResult!7312 0))(
  ( (MissingZero!7312 (index!31616 (_ BitVec 32))) (Found!7312 (index!31617 (_ BitVec 32))) (Intermediate!7312 (undefined!8124 Bool) (index!31618 (_ BitVec 32)) (x!62590 (_ BitVec 32))) (Undefined!7312) (MissingVacant!7312 (index!31619 (_ BitVec 32))) )
))
(declare-fun lt!323761 () SeekEntryResult!7312)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730630 (= res!490907 (or (= lt!323761 (MissingZero!7312 i!1173)) (= lt!323761 (MissingVacant!7312 i!1173))))))

(declare-datatypes ((array!41185 0))(
  ( (array!41186 (arr!19712 (Array (_ BitVec 32) (_ BitVec 64))) (size!20133 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41185)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41185 (_ BitVec 32)) SeekEntryResult!7312)

(assert (=> b!730630 (= lt!323761 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730631 () Bool)

(declare-fun res!490906 () Bool)

(declare-fun e!408864 () Bool)

(assert (=> b!730631 (=> (not res!490906) (not e!408864))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!730631 (= res!490906 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19712 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730632 () Bool)

(declare-fun res!490903 () Bool)

(assert (=> b!730632 (=> (not res!490903) (not e!408858))))

(declare-fun arrayContainsKey!0 (array!41185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730632 (= res!490903 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730633 () Bool)

(declare-fun res!490901 () Bool)

(assert (=> b!730633 (=> (not res!490901) (not e!408866))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730633 (= res!490901 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20133 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20133 a!3186))))))

(declare-fun b!730634 () Bool)

(declare-fun res!490910 () Bool)

(assert (=> b!730634 (=> (not res!490910) (not e!408858))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730634 (= res!490910 (validKeyInArray!0 (select (arr!19712 a!3186) j!159)))))

(declare-fun res!490902 () Bool)

(assert (=> start!64736 (=> (not res!490902) (not e!408858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64736 (= res!490902 (validMask!0 mask!3328))))

(assert (=> start!64736 e!408858))

(assert (=> start!64736 true))

(declare-fun array_inv!15508 (array!41185) Bool)

(assert (=> start!64736 (array_inv!15508 a!3186)))

(declare-fun b!730635 () Bool)

(declare-fun res!490913 () Bool)

(assert (=> b!730635 (=> (not res!490913) (not e!408866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41185 (_ BitVec 32)) Bool)

(assert (=> b!730635 (= res!490913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730636 () Bool)

(declare-fun e!408859 () Bool)

(declare-fun e!408865 () Bool)

(assert (=> b!730636 (= e!408859 e!408865)))

(declare-fun res!490909 () Bool)

(assert (=> b!730636 (=> (not res!490909) (not e!408865))))

(declare-fun lt!323764 () SeekEntryResult!7312)

(assert (=> b!730636 (= res!490909 (= (seekEntryOrOpen!0 (select (arr!19712 a!3186) j!159) a!3186 mask!3328) lt!323764))))

(assert (=> b!730636 (= lt!323764 (Found!7312 j!159))))

(declare-fun b!730637 () Bool)

(declare-fun e!408861 () Bool)

(assert (=> b!730637 (= e!408861 true)))

(declare-fun lt!323762 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730637 (= lt!323762 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730638 () Bool)

(declare-fun res!490915 () Bool)

(assert (=> b!730638 (=> (not res!490915) (not e!408858))))

(assert (=> b!730638 (= res!490915 (validKeyInArray!0 k!2102))))

(declare-fun b!730639 () Bool)

(assert (=> b!730639 (= e!408866 e!408864)))

(declare-fun res!490905 () Bool)

(assert (=> b!730639 (=> (not res!490905) (not e!408864))))

(declare-fun lt!323760 () SeekEntryResult!7312)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41185 (_ BitVec 32)) SeekEntryResult!7312)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730639 (= res!490905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19712 a!3186) j!159) mask!3328) (select (arr!19712 a!3186) j!159) a!3186 mask!3328) lt!323760))))

(assert (=> b!730639 (= lt!323760 (Intermediate!7312 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730640 () Bool)

(declare-fun res!490911 () Bool)

(assert (=> b!730640 (=> (not res!490911) (not e!408858))))

(assert (=> b!730640 (= res!490911 (and (= (size!20133 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20133 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20133 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!408860 () Bool)

(declare-fun b!730641 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41185 (_ BitVec 32)) SeekEntryResult!7312)

(assert (=> b!730641 (= e!408860 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19712 a!3186) j!159) a!3186 mask!3328) (Found!7312 j!159)))))

(declare-fun b!730642 () Bool)

(declare-fun e!408862 () Bool)

(assert (=> b!730642 (= e!408864 e!408862)))

(declare-fun res!490908 () Bool)

(assert (=> b!730642 (=> (not res!490908) (not e!408862))))

(declare-fun lt!323757 () SeekEntryResult!7312)

(declare-fun lt!323759 () SeekEntryResult!7312)

(assert (=> b!730642 (= res!490908 (= lt!323757 lt!323759))))

(declare-fun lt!323763 () (_ BitVec 64))

(declare-fun lt!323758 () array!41185)

(assert (=> b!730642 (= lt!323759 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323763 lt!323758 mask!3328))))

(assert (=> b!730642 (= lt!323757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323763 mask!3328) lt!323763 lt!323758 mask!3328))))

(assert (=> b!730642 (= lt!323763 (select (store (arr!19712 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730642 (= lt!323758 (array!41186 (store (arr!19712 a!3186) i!1173 k!2102) (size!20133 a!3186)))))

(declare-fun b!730643 () Bool)

(assert (=> b!730643 (= e!408865 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19712 a!3186) j!159) a!3186 mask!3328) lt!323764))))

(declare-fun b!730644 () Bool)

(assert (=> b!730644 (= e!408860 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19712 a!3186) j!159) a!3186 mask!3328) lt!323760))))

(declare-fun b!730645 () Bool)

(declare-fun res!490912 () Bool)

(assert (=> b!730645 (=> (not res!490912) (not e!408866))))

(declare-datatypes ((List!13714 0))(
  ( (Nil!13711) (Cons!13710 (h!14770 (_ BitVec 64)) (t!20029 List!13714)) )
))
(declare-fun arrayNoDuplicates!0 (array!41185 (_ BitVec 32) List!13714) Bool)

(assert (=> b!730645 (= res!490912 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13711))))

(declare-fun b!730646 () Bool)

(declare-fun res!490916 () Bool)

(assert (=> b!730646 (=> (not res!490916) (not e!408864))))

(assert (=> b!730646 (= res!490916 e!408860)))

(declare-fun c!80239 () Bool)

(assert (=> b!730646 (= c!80239 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730647 () Bool)

(assert (=> b!730647 (= e!408862 (not e!408861))))

(declare-fun res!490914 () Bool)

(assert (=> b!730647 (=> res!490914 e!408861)))

(assert (=> b!730647 (= res!490914 (or (not (is-Intermediate!7312 lt!323759)) (bvsge x!1131 (x!62590 lt!323759))))))

(assert (=> b!730647 e!408859))

(declare-fun res!490904 () Bool)

(assert (=> b!730647 (=> (not res!490904) (not e!408859))))

(assert (=> b!730647 (= res!490904 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24942 0))(
  ( (Unit!24943) )
))
(declare-fun lt!323765 () Unit!24942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24942)

(assert (=> b!730647 (= lt!323765 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64736 res!490902) b!730640))

(assert (= (and b!730640 res!490911) b!730634))

(assert (= (and b!730634 res!490910) b!730638))

(assert (= (and b!730638 res!490915) b!730632))

(assert (= (and b!730632 res!490903) b!730630))

(assert (= (and b!730630 res!490907) b!730635))

(assert (= (and b!730635 res!490913) b!730645))

(assert (= (and b!730645 res!490912) b!730633))

(assert (= (and b!730633 res!490901) b!730639))

(assert (= (and b!730639 res!490905) b!730631))

(assert (= (and b!730631 res!490906) b!730646))

(assert (= (and b!730646 c!80239) b!730644))

(assert (= (and b!730646 (not c!80239)) b!730641))

(assert (= (and b!730646 res!490916) b!730642))

(assert (= (and b!730642 res!490908) b!730647))

(assert (= (and b!730647 res!490904) b!730636))

(assert (= (and b!730636 res!490909) b!730643))

(assert (= (and b!730647 (not res!490914)) b!730637))

(declare-fun m!684139 () Bool)

(assert (=> b!730642 m!684139))

(declare-fun m!684141 () Bool)

(assert (=> b!730642 m!684141))

(assert (=> b!730642 m!684139))

(declare-fun m!684143 () Bool)

(assert (=> b!730642 m!684143))

(declare-fun m!684145 () Bool)

(assert (=> b!730642 m!684145))

(declare-fun m!684147 () Bool)

(assert (=> b!730642 m!684147))

(declare-fun m!684149 () Bool)

(assert (=> b!730636 m!684149))

(assert (=> b!730636 m!684149))

(declare-fun m!684151 () Bool)

(assert (=> b!730636 m!684151))

(assert (=> b!730643 m!684149))

(assert (=> b!730643 m!684149))

(declare-fun m!684153 () Bool)

(assert (=> b!730643 m!684153))

(declare-fun m!684155 () Bool)

(assert (=> b!730647 m!684155))

(declare-fun m!684157 () Bool)

(assert (=> b!730647 m!684157))

(declare-fun m!684159 () Bool)

(assert (=> b!730632 m!684159))

(declare-fun m!684161 () Bool)

(assert (=> b!730645 m!684161))

(declare-fun m!684163 () Bool)

(assert (=> start!64736 m!684163))

(declare-fun m!684165 () Bool)

(assert (=> start!64736 m!684165))

(declare-fun m!684167 () Bool)

(assert (=> b!730635 m!684167))

(declare-fun m!684169 () Bool)

(assert (=> b!730631 m!684169))

(assert (=> b!730634 m!684149))

(assert (=> b!730634 m!684149))

(declare-fun m!684171 () Bool)

(assert (=> b!730634 m!684171))

(declare-fun m!684173 () Bool)

(assert (=> b!730637 m!684173))

(assert (=> b!730641 m!684149))

(assert (=> b!730641 m!684149))

(declare-fun m!684175 () Bool)

(assert (=> b!730641 m!684175))

(declare-fun m!684177 () Bool)

(assert (=> b!730638 m!684177))

(assert (=> b!730639 m!684149))

(assert (=> b!730639 m!684149))

(declare-fun m!684179 () Bool)

(assert (=> b!730639 m!684179))

(assert (=> b!730639 m!684179))

(assert (=> b!730639 m!684149))

(declare-fun m!684181 () Bool)

(assert (=> b!730639 m!684181))

(declare-fun m!684183 () Bool)

(assert (=> b!730630 m!684183))

(assert (=> b!730644 m!684149))

(assert (=> b!730644 m!684149))

(declare-fun m!684185 () Bool)

(assert (=> b!730644 m!684185))

(push 1)

(assert (not b!730636))

(assert (not b!730632))

(assert (not b!730630))

(assert (not b!730643))

(assert (not start!64736))

(assert (not b!730642))

(assert (not b!730638))

(assert (not b!730644))

(assert (not b!730641))

(assert (not b!730634))

(assert (not b!730635))

(assert (not b!730645))

(assert (not b!730637))

(assert (not b!730647))

(assert (not b!730639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

