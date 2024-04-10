; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45636 () Bool)

(assert start!45636)

(declare-fun b!503147 () Bool)

(declare-fun res!304492 () Bool)

(declare-fun e!294674 () Bool)

(assert (=> b!503147 (=> (not res!304492) (not e!294674))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503147 (= res!304492 (validKeyInArray!0 k!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!294671 () Bool)

(declare-datatypes ((array!32392 0))(
  ( (array!32393 (arr!15576 (Array (_ BitVec 32) (_ BitVec 64))) (size!15940 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32392)

(declare-fun lt!228834 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4043 0))(
  ( (MissingZero!4043 (index!18360 (_ BitVec 32))) (Found!4043 (index!18361 (_ BitVec 32))) (Intermediate!4043 (undefined!4855 Bool) (index!18362 (_ BitVec 32)) (x!47388 (_ BitVec 32))) (Undefined!4043) (MissingVacant!4043 (index!18363 (_ BitVec 32))) )
))
(declare-fun lt!228836 () SeekEntryResult!4043)

(declare-fun b!503148 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32392 (_ BitVec 32)) SeekEntryResult!4043)

(assert (=> b!503148 (= e!294671 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228834 (index!18362 lt!228836) (select (arr!15576 a!3235) j!176) a!3235 mask!3524) (Found!4043 j!176))))))

(declare-fun b!503149 () Bool)

(declare-fun res!304490 () Bool)

(assert (=> b!503149 (=> (not res!304490) (not e!294674))))

(declare-fun arrayContainsKey!0 (array!32392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503149 (= res!304490 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503150 () Bool)

(declare-fun e!294669 () Bool)

(assert (=> b!503150 (= e!294674 e!294669)))

(declare-fun res!304487 () Bool)

(assert (=> b!503150 (=> (not res!304487) (not e!294669))))

(declare-fun lt!228837 () SeekEntryResult!4043)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503150 (= res!304487 (or (= lt!228837 (MissingZero!4043 i!1204)) (= lt!228837 (MissingVacant!4043 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32392 (_ BitVec 32)) SeekEntryResult!4043)

(assert (=> b!503150 (= lt!228837 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503151 () Bool)

(declare-fun res!304482 () Bool)

(assert (=> b!503151 (=> (not res!304482) (not e!294669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32392 (_ BitVec 32)) Bool)

(assert (=> b!503151 (= res!304482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503152 () Bool)

(declare-datatypes ((Unit!15248 0))(
  ( (Unit!15249) )
))
(declare-fun e!294667 () Unit!15248)

(declare-fun Unit!15250 () Unit!15248)

(assert (=> b!503152 (= e!294667 Unit!15250)))

(declare-fun b!503153 () Bool)

(declare-fun Unit!15251 () Unit!15248)

(assert (=> b!503153 (= e!294667 Unit!15251)))

(declare-fun lt!228842 () Unit!15248)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32392 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15248)

(assert (=> b!503153 (= lt!228842 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228834 #b00000000000000000000000000000000 (index!18362 lt!228836) (x!47388 lt!228836) mask!3524))))

(declare-fun lt!228841 () array!32392)

(declare-fun lt!228844 () (_ BitVec 64))

(declare-fun res!304484 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32392 (_ BitVec 32)) SeekEntryResult!4043)

(assert (=> b!503153 (= res!304484 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228834 lt!228844 lt!228841 mask!3524) (Intermediate!4043 false (index!18362 lt!228836) (x!47388 lt!228836))))))

(declare-fun e!294670 () Bool)

(assert (=> b!503153 (=> (not res!304484) (not e!294670))))

(assert (=> b!503153 e!294670))

(declare-fun b!503146 () Bool)

(declare-fun e!294675 () Bool)

(assert (=> b!503146 (= e!294669 (not e!294675))))

(declare-fun res!304491 () Bool)

(assert (=> b!503146 (=> res!304491 e!294675)))

(declare-fun lt!228838 () (_ BitVec 32))

(assert (=> b!503146 (= res!304491 (= lt!228836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228838 lt!228844 lt!228841 mask!3524)))))

(assert (=> b!503146 (= lt!228836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228834 (select (arr!15576 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503146 (= lt!228838 (toIndex!0 lt!228844 mask!3524))))

(assert (=> b!503146 (= lt!228844 (select (store (arr!15576 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503146 (= lt!228834 (toIndex!0 (select (arr!15576 a!3235) j!176) mask!3524))))

(assert (=> b!503146 (= lt!228841 (array!32393 (store (arr!15576 a!3235) i!1204 k!2280) (size!15940 a!3235)))))

(declare-fun e!294673 () Bool)

(assert (=> b!503146 e!294673))

(declare-fun res!304493 () Bool)

(assert (=> b!503146 (=> (not res!304493) (not e!294673))))

(assert (=> b!503146 (= res!304493 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228835 () Unit!15248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15248)

(assert (=> b!503146 (= lt!228835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!304489 () Bool)

(assert (=> start!45636 (=> (not res!304489) (not e!294674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45636 (= res!304489 (validMask!0 mask!3524))))

(assert (=> start!45636 e!294674))

(assert (=> start!45636 true))

(declare-fun array_inv!11372 (array!32392) Bool)

(assert (=> start!45636 (array_inv!11372 a!3235)))

(declare-fun b!503154 () Bool)

(assert (=> b!503154 (= e!294670 false)))

(declare-fun b!503155 () Bool)

(declare-fun e!294672 () Bool)

(assert (=> b!503155 (= e!294672 true)))

(declare-fun lt!228839 () SeekEntryResult!4043)

(assert (=> b!503155 (= lt!228839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228834 lt!228844 lt!228841 mask!3524))))

(declare-fun b!503156 () Bool)

(declare-fun res!304479 () Bool)

(assert (=> b!503156 (=> (not res!304479) (not e!294674))))

(assert (=> b!503156 (= res!304479 (validKeyInArray!0 (select (arr!15576 a!3235) j!176)))))

(declare-fun b!503157 () Bool)

(declare-fun res!304488 () Bool)

(assert (=> b!503157 (=> res!304488 e!294675)))

(assert (=> b!503157 (= res!304488 (or (undefined!4855 lt!228836) (not (is-Intermediate!4043 lt!228836))))))

(declare-fun b!503158 () Bool)

(assert (=> b!503158 (= e!294673 (= (seekEntryOrOpen!0 (select (arr!15576 a!3235) j!176) a!3235 mask!3524) (Found!4043 j!176)))))

(declare-fun b!503159 () Bool)

(assert (=> b!503159 (= e!294675 e!294672)))

(declare-fun res!304483 () Bool)

(assert (=> b!503159 (=> res!304483 e!294672)))

(assert (=> b!503159 (= res!304483 (or (bvsgt (x!47388 lt!228836) #b01111111111111111111111111111110) (bvslt lt!228834 #b00000000000000000000000000000000) (bvsge lt!228834 (size!15940 a!3235)) (bvslt (index!18362 lt!228836) #b00000000000000000000000000000000) (bvsge (index!18362 lt!228836) (size!15940 a!3235)) (not (= lt!228836 (Intermediate!4043 false (index!18362 lt!228836) (x!47388 lt!228836))))))))

(assert (=> b!503159 (= (index!18362 lt!228836) i!1204)))

(declare-fun lt!228843 () Unit!15248)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32392 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15248)

(assert (=> b!503159 (= lt!228843 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228834 #b00000000000000000000000000000000 (index!18362 lt!228836) (x!47388 lt!228836) mask!3524))))

(assert (=> b!503159 (and (or (= (select (arr!15576 a!3235) (index!18362 lt!228836)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15576 a!3235) (index!18362 lt!228836)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15576 a!3235) (index!18362 lt!228836)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15576 a!3235) (index!18362 lt!228836)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228840 () Unit!15248)

(assert (=> b!503159 (= lt!228840 e!294667)))

(declare-fun c!59612 () Bool)

(assert (=> b!503159 (= c!59612 (= (select (arr!15576 a!3235) (index!18362 lt!228836)) (select (arr!15576 a!3235) j!176)))))

(assert (=> b!503159 (and (bvslt (x!47388 lt!228836) #b01111111111111111111111111111110) (or (= (select (arr!15576 a!3235) (index!18362 lt!228836)) (select (arr!15576 a!3235) j!176)) (= (select (arr!15576 a!3235) (index!18362 lt!228836)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15576 a!3235) (index!18362 lt!228836)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503160 () Bool)

(declare-fun res!304481 () Bool)

(assert (=> b!503160 (=> (not res!304481) (not e!294674))))

(assert (=> b!503160 (= res!304481 (and (= (size!15940 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15940 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15940 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503161 () Bool)

(declare-fun res!304480 () Bool)

(assert (=> b!503161 (=> res!304480 e!294672)))

(assert (=> b!503161 (= res!304480 e!294671)))

(declare-fun res!304485 () Bool)

(assert (=> b!503161 (=> (not res!304485) (not e!294671))))

(assert (=> b!503161 (= res!304485 (bvsgt #b00000000000000000000000000000000 (x!47388 lt!228836)))))

(declare-fun b!503162 () Bool)

(declare-fun res!304486 () Bool)

(assert (=> b!503162 (=> (not res!304486) (not e!294669))))

(declare-datatypes ((List!9734 0))(
  ( (Nil!9731) (Cons!9730 (h!10607 (_ BitVec 64)) (t!15962 List!9734)) )
))
(declare-fun arrayNoDuplicates!0 (array!32392 (_ BitVec 32) List!9734) Bool)

(assert (=> b!503162 (= res!304486 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9731))))

(assert (= (and start!45636 res!304489) b!503160))

(assert (= (and b!503160 res!304481) b!503156))

(assert (= (and b!503156 res!304479) b!503147))

(assert (= (and b!503147 res!304492) b!503149))

(assert (= (and b!503149 res!304490) b!503150))

(assert (= (and b!503150 res!304487) b!503151))

(assert (= (and b!503151 res!304482) b!503162))

(assert (= (and b!503162 res!304486) b!503146))

(assert (= (and b!503146 res!304493) b!503158))

(assert (= (and b!503146 (not res!304491)) b!503157))

(assert (= (and b!503157 (not res!304488)) b!503159))

(assert (= (and b!503159 c!59612) b!503153))

(assert (= (and b!503159 (not c!59612)) b!503152))

(assert (= (and b!503153 res!304484) b!503154))

(assert (= (and b!503159 (not res!304483)) b!503161))

(assert (= (and b!503161 res!304485) b!503148))

(assert (= (and b!503161 (not res!304480)) b!503155))

(declare-fun m!484011 () Bool)

(assert (=> b!503155 m!484011))

(declare-fun m!484013 () Bool)

(assert (=> b!503156 m!484013))

(assert (=> b!503156 m!484013))

(declare-fun m!484015 () Bool)

(assert (=> b!503156 m!484015))

(assert (=> b!503158 m!484013))

(assert (=> b!503158 m!484013))

(declare-fun m!484017 () Bool)

(assert (=> b!503158 m!484017))

(declare-fun m!484019 () Bool)

(assert (=> b!503147 m!484019))

(declare-fun m!484021 () Bool)

(assert (=> b!503159 m!484021))

(declare-fun m!484023 () Bool)

(assert (=> b!503159 m!484023))

(assert (=> b!503159 m!484013))

(assert (=> b!503148 m!484013))

(assert (=> b!503148 m!484013))

(declare-fun m!484025 () Bool)

(assert (=> b!503148 m!484025))

(declare-fun m!484027 () Bool)

(assert (=> b!503162 m!484027))

(declare-fun m!484029 () Bool)

(assert (=> b!503150 m!484029))

(declare-fun m!484031 () Bool)

(assert (=> b!503153 m!484031))

(assert (=> b!503153 m!484011))

(declare-fun m!484033 () Bool)

(assert (=> b!503149 m!484033))

(declare-fun m!484035 () Bool)

(assert (=> b!503146 m!484035))

(declare-fun m!484037 () Bool)

(assert (=> b!503146 m!484037))

(declare-fun m!484039 () Bool)

(assert (=> b!503146 m!484039))

(declare-fun m!484041 () Bool)

(assert (=> b!503146 m!484041))

(assert (=> b!503146 m!484013))

(declare-fun m!484043 () Bool)

(assert (=> b!503146 m!484043))

(assert (=> b!503146 m!484013))

(declare-fun m!484045 () Bool)

(assert (=> b!503146 m!484045))

(assert (=> b!503146 m!484013))

(declare-fun m!484047 () Bool)

(assert (=> b!503146 m!484047))

(declare-fun m!484049 () Bool)

(assert (=> b!503146 m!484049))

(declare-fun m!484051 () Bool)

(assert (=> b!503151 m!484051))

(declare-fun m!484053 () Bool)

(assert (=> start!45636 m!484053))

(declare-fun m!484055 () Bool)

(assert (=> start!45636 m!484055))

(push 1)

