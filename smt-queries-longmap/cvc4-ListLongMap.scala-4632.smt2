; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64496 () Bool)

(assert start!64496)

(declare-fun b!725723 () Bool)

(declare-fun res!486802 () Bool)

(declare-fun e!406391 () Bool)

(assert (=> b!725723 (=> (not res!486802) (not e!406391))))

(declare-datatypes ((array!41014 0))(
  ( (array!41015 (arr!19628 (Array (_ BitVec 32) (_ BitVec 64))) (size!20049 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41014)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!725723 (= res!486802 (and (= (size!20049 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20049 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20049 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7228 0))(
  ( (MissingZero!7228 (index!31280 (_ BitVec 32))) (Found!7228 (index!31281 (_ BitVec 32))) (Intermediate!7228 (undefined!8040 Bool) (index!31282 (_ BitVec 32)) (x!62270 (_ BitVec 32))) (Undefined!7228) (MissingVacant!7228 (index!31283 (_ BitVec 32))) )
))
(declare-fun lt!321446 () SeekEntryResult!7228)

(declare-fun e!406386 () Bool)

(declare-fun b!725724 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41014 (_ BitVec 32)) SeekEntryResult!7228)

(assert (=> b!725724 (= e!406386 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19628 a!3186) j!159) a!3186 mask!3328) lt!321446))))

(declare-fun b!725725 () Bool)

(declare-fun res!486792 () Bool)

(declare-fun e!406387 () Bool)

(assert (=> b!725725 (=> (not res!486792) (not e!406387))))

(declare-fun e!406389 () Bool)

(assert (=> b!725725 (= res!486792 e!406389)))

(declare-fun c!79840 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!725725 (= c!79840 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725726 () Bool)

(declare-fun res!486789 () Bool)

(declare-fun e!406384 () Bool)

(assert (=> b!725726 (=> (not res!486789) (not e!406384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41014 (_ BitVec 32)) Bool)

(assert (=> b!725726 (= res!486789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725727 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!725727 (= e!406389 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19628 a!3186) j!159) a!3186 mask!3328) (Found!7228 j!159)))))

(declare-fun res!486799 () Bool)

(assert (=> start!64496 (=> (not res!486799) (not e!406391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64496 (= res!486799 (validMask!0 mask!3328))))

(assert (=> start!64496 e!406391))

(assert (=> start!64496 true))

(declare-fun array_inv!15424 (array!41014) Bool)

(assert (=> start!64496 (array_inv!15424 a!3186)))

(declare-fun b!725728 () Bool)

(declare-fun res!486791 () Bool)

(assert (=> b!725728 (=> (not res!486791) (not e!406391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725728 (= res!486791 (validKeyInArray!0 (select (arr!19628 a!3186) j!159)))))

(declare-fun lt!321444 () SeekEntryResult!7228)

(declare-fun b!725729 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41014 (_ BitVec 32)) SeekEntryResult!7228)

(assert (=> b!725729 (= e!406389 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19628 a!3186) j!159) a!3186 mask!3328) lt!321444))))

(declare-fun b!725730 () Bool)

(declare-fun res!486803 () Bool)

(assert (=> b!725730 (=> (not res!486803) (not e!406391))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725730 (= res!486803 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725731 () Bool)

(declare-fun res!486798 () Bool)

(assert (=> b!725731 (=> (not res!486798) (not e!406384))))

(declare-datatypes ((List!13630 0))(
  ( (Nil!13627) (Cons!13626 (h!14683 (_ BitVec 64)) (t!19945 List!13630)) )
))
(declare-fun arrayNoDuplicates!0 (array!41014 (_ BitVec 32) List!13630) Bool)

(assert (=> b!725731 (= res!486798 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13627))))

(declare-fun b!725732 () Bool)

(declare-fun res!486795 () Bool)

(assert (=> b!725732 (=> (not res!486795) (not e!406384))))

(assert (=> b!725732 (= res!486795 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20049 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20049 a!3186))))))

(declare-fun b!725733 () Bool)

(assert (=> b!725733 (= e!406384 e!406387)))

(declare-fun res!486793 () Bool)

(assert (=> b!725733 (=> (not res!486793) (not e!406387))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725733 (= res!486793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19628 a!3186) j!159) mask!3328) (select (arr!19628 a!3186) j!159) a!3186 mask!3328) lt!321444))))

(assert (=> b!725733 (= lt!321444 (Intermediate!7228 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725734 () Bool)

(declare-fun res!486801 () Bool)

(assert (=> b!725734 (=> (not res!486801) (not e!406391))))

(assert (=> b!725734 (= res!486801 (validKeyInArray!0 k!2102))))

(declare-fun b!725735 () Bool)

(declare-fun e!406390 () Bool)

(assert (=> b!725735 (= e!406390 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!406385 () Bool)

(assert (=> b!725735 e!406385))

(declare-fun res!486796 () Bool)

(assert (=> b!725735 (=> (not res!486796) (not e!406385))))

(assert (=> b!725735 (= res!486796 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24774 0))(
  ( (Unit!24775) )
))
(declare-fun lt!321448 () Unit!24774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24774)

(assert (=> b!725735 (= lt!321448 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725736 () Bool)

(assert (=> b!725736 (= e!406385 e!406386)))

(declare-fun res!486794 () Bool)

(assert (=> b!725736 (=> (not res!486794) (not e!406386))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41014 (_ BitVec 32)) SeekEntryResult!7228)

(assert (=> b!725736 (= res!486794 (= (seekEntryOrOpen!0 (select (arr!19628 a!3186) j!159) a!3186 mask!3328) lt!321446))))

(assert (=> b!725736 (= lt!321446 (Found!7228 j!159))))

(declare-fun b!725737 () Bool)

(assert (=> b!725737 (= e!406387 e!406390)))

(declare-fun res!486800 () Bool)

(assert (=> b!725737 (=> (not res!486800) (not e!406390))))

(declare-fun lt!321447 () array!41014)

(declare-fun lt!321445 () (_ BitVec 64))

(assert (=> b!725737 (= res!486800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321445 mask!3328) lt!321445 lt!321447 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321445 lt!321447 mask!3328)))))

(assert (=> b!725737 (= lt!321445 (select (store (arr!19628 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725737 (= lt!321447 (array!41015 (store (arr!19628 a!3186) i!1173 k!2102) (size!20049 a!3186)))))

(declare-fun b!725738 () Bool)

(declare-fun res!486797 () Bool)

(assert (=> b!725738 (=> (not res!486797) (not e!406387))))

(assert (=> b!725738 (= res!486797 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19628 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725739 () Bool)

(assert (=> b!725739 (= e!406391 e!406384)))

(declare-fun res!486790 () Bool)

(assert (=> b!725739 (=> (not res!486790) (not e!406384))))

(declare-fun lt!321449 () SeekEntryResult!7228)

(assert (=> b!725739 (= res!486790 (or (= lt!321449 (MissingZero!7228 i!1173)) (= lt!321449 (MissingVacant!7228 i!1173))))))

(assert (=> b!725739 (= lt!321449 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64496 res!486799) b!725723))

(assert (= (and b!725723 res!486802) b!725728))

(assert (= (and b!725728 res!486791) b!725734))

(assert (= (and b!725734 res!486801) b!725730))

(assert (= (and b!725730 res!486803) b!725739))

(assert (= (and b!725739 res!486790) b!725726))

(assert (= (and b!725726 res!486789) b!725731))

(assert (= (and b!725731 res!486798) b!725732))

(assert (= (and b!725732 res!486795) b!725733))

(assert (= (and b!725733 res!486793) b!725738))

(assert (= (and b!725738 res!486797) b!725725))

(assert (= (and b!725725 c!79840) b!725729))

(assert (= (and b!725725 (not c!79840)) b!725727))

(assert (= (and b!725725 res!486792) b!725737))

(assert (= (and b!725737 res!486800) b!725735))

(assert (= (and b!725735 res!486796) b!725736))

(assert (= (and b!725736 res!486794) b!725724))

(declare-fun m!679857 () Bool)

(assert (=> b!725734 m!679857))

(declare-fun m!679859 () Bool)

(assert (=> b!725726 m!679859))

(declare-fun m!679861 () Bool)

(assert (=> b!725736 m!679861))

(assert (=> b!725736 m!679861))

(declare-fun m!679863 () Bool)

(assert (=> b!725736 m!679863))

(declare-fun m!679865 () Bool)

(assert (=> b!725739 m!679865))

(declare-fun m!679867 () Bool)

(assert (=> b!725731 m!679867))

(assert (=> b!725729 m!679861))

(assert (=> b!725729 m!679861))

(declare-fun m!679869 () Bool)

(assert (=> b!725729 m!679869))

(declare-fun m!679871 () Bool)

(assert (=> b!725738 m!679871))

(declare-fun m!679873 () Bool)

(assert (=> b!725735 m!679873))

(declare-fun m!679875 () Bool)

(assert (=> b!725735 m!679875))

(declare-fun m!679877 () Bool)

(assert (=> start!64496 m!679877))

(declare-fun m!679879 () Bool)

(assert (=> start!64496 m!679879))

(assert (=> b!725728 m!679861))

(assert (=> b!725728 m!679861))

(declare-fun m!679881 () Bool)

(assert (=> b!725728 m!679881))

(assert (=> b!725724 m!679861))

(assert (=> b!725724 m!679861))

(declare-fun m!679883 () Bool)

(assert (=> b!725724 m!679883))

(assert (=> b!725733 m!679861))

(assert (=> b!725733 m!679861))

(declare-fun m!679885 () Bool)

(assert (=> b!725733 m!679885))

(assert (=> b!725733 m!679885))

(assert (=> b!725733 m!679861))

(declare-fun m!679887 () Bool)

(assert (=> b!725733 m!679887))

(assert (=> b!725727 m!679861))

(assert (=> b!725727 m!679861))

(declare-fun m!679889 () Bool)

(assert (=> b!725727 m!679889))

(declare-fun m!679891 () Bool)

(assert (=> b!725730 m!679891))

(declare-fun m!679893 () Bool)

(assert (=> b!725737 m!679893))

(declare-fun m!679895 () Bool)

(assert (=> b!725737 m!679895))

(declare-fun m!679897 () Bool)

(assert (=> b!725737 m!679897))

(declare-fun m!679899 () Bool)

(assert (=> b!725737 m!679899))

(declare-fun m!679901 () Bool)

(assert (=> b!725737 m!679901))

(assert (=> b!725737 m!679893))

(push 1)

(assert (not b!725734))

(assert (not start!64496))

(assert (not b!725731))

(assert (not b!725727))

(assert (not b!725726))

(assert (not b!725735))

(assert (not b!725729))

(assert (not b!725739))

(assert (not b!725737))

(assert (not b!725736))

(assert (not b!725730))

(assert (not b!725728))

(assert (not b!725724))

(assert (not b!725733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

