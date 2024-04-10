; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65198 () Bool)

(assert start!65198)

(declare-fun b!737908 () Bool)

(declare-fun e!412716 () Bool)

(assert (=> b!737908 (= e!412716 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327460 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7399 0))(
  ( (MissingZero!7399 (index!31964 (_ BitVec 32))) (Found!7399 (index!31965 (_ BitVec 32))) (Intermediate!7399 (undefined!8211 Bool) (index!31966 (_ BitVec 32)) (x!62957 (_ BitVec 32))) (Undefined!7399) (MissingVacant!7399 (index!31967 (_ BitVec 32))) )
))
(declare-fun lt!327456 () SeekEntryResult!7399)

(declare-fun lt!327454 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41371 0))(
  ( (array!41372 (arr!19799 (Array (_ BitVec 32) (_ BitVec 64))) (size!20220 (_ BitVec 32))) )
))
(declare-fun lt!327464 () array!41371)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41371 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!737908 (= lt!327456 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327460 lt!327454 lt!327464 mask!3328))))

(declare-fun b!737909 () Bool)

(declare-datatypes ((Unit!25192 0))(
  ( (Unit!25193) )
))
(declare-fun e!412717 () Unit!25192)

(declare-fun Unit!25194 () Unit!25192)

(assert (=> b!737909 (= e!412717 Unit!25194)))

(declare-fun a!3186 () array!41371)

(declare-fun lt!327458 () SeekEntryResult!7399)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!737909 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327460 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327458)))

(declare-fun b!737910 () Bool)

(declare-fun e!412712 () Bool)

(declare-fun e!412714 () Bool)

(assert (=> b!737910 (= e!412712 e!412714)))

(declare-fun res!496041 () Bool)

(assert (=> b!737910 (=> (not res!496041) (not e!412714))))

(declare-fun lt!327459 () SeekEntryResult!7399)

(declare-fun lt!327455 () SeekEntryResult!7399)

(assert (=> b!737910 (= res!496041 (= lt!327459 lt!327455))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!737910 (= lt!327455 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327454 lt!327464 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737910 (= lt!327459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327454 mask!3328) lt!327454 lt!327464 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!737910 (= lt!327454 (select (store (arr!19799 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737910 (= lt!327464 (array!41372 (store (arr!19799 a!3186) i!1173 k!2102) (size!20220 a!3186)))))

(declare-fun b!737911 () Bool)

(declare-fun e!412715 () Bool)

(declare-fun e!412708 () Bool)

(assert (=> b!737911 (= e!412715 e!412708)))

(declare-fun res!496038 () Bool)

(assert (=> b!737911 (=> (not res!496038) (not e!412708))))

(declare-fun lt!327457 () SeekEntryResult!7399)

(assert (=> b!737911 (= res!496038 (or (= lt!327457 (MissingZero!7399 i!1173)) (= lt!327457 (MissingVacant!7399 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41371 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!737911 (= lt!327457 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!737912 () Bool)

(declare-fun res!496043 () Bool)

(assert (=> b!737912 (=> (not res!496043) (not e!412715))))

(declare-fun arrayContainsKey!0 (array!41371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737912 (= res!496043 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737913 () Bool)

(declare-fun Unit!25195 () Unit!25192)

(assert (=> b!737913 (= e!412717 Unit!25195)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!327466 () SeekEntryResult!7399)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41371 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!737913 (= lt!327466 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327463 () SeekEntryResult!7399)

(assert (=> b!737913 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327460 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327463)))

(declare-fun b!737914 () Bool)

(declare-fun res!496029 () Bool)

(assert (=> b!737914 (=> (not res!496029) (not e!412715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737914 (= res!496029 (validKeyInArray!0 k!2102))))

(declare-fun b!737915 () Bool)

(declare-fun lt!327462 () SeekEntryResult!7399)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!412718 () Bool)

(assert (=> b!737915 (= e!412718 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327462))))

(declare-fun b!737916 () Bool)

(declare-fun e!412709 () Bool)

(assert (=> b!737916 (= e!412709 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327460 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327458)))))

(declare-fun res!496033 () Bool)

(assert (=> start!65198 (=> (not res!496033) (not e!412715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65198 (= res!496033 (validMask!0 mask!3328))))

(assert (=> start!65198 e!412715))

(assert (=> start!65198 true))

(declare-fun array_inv!15595 (array!41371) Bool)

(assert (=> start!65198 (array_inv!15595 a!3186)))

(declare-fun b!737917 () Bool)

(declare-fun e!412713 () Bool)

(assert (=> b!737917 (= e!412713 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) (Found!7399 j!159)))))

(declare-fun b!737918 () Bool)

(declare-fun res!496046 () Bool)

(assert (=> b!737918 (=> (not res!496046) (not e!412715))))

(assert (=> b!737918 (= res!496046 (validKeyInArray!0 (select (arr!19799 a!3186) j!159)))))

(declare-fun b!737919 () Bool)

(declare-fun res!496030 () Bool)

(assert (=> b!737919 (=> (not res!496030) (not e!412708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41371 (_ BitVec 32)) Bool)

(assert (=> b!737919 (= res!496030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737920 () Bool)

(assert (=> b!737920 (= e!412708 e!412712)))

(declare-fun res!496032 () Bool)

(assert (=> b!737920 (=> (not res!496032) (not e!412712))))

(assert (=> b!737920 (= res!496032 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19799 a!3186) j!159) mask!3328) (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327458))))

(assert (=> b!737920 (= lt!327458 (Intermediate!7399 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737921 () Bool)

(declare-fun e!412710 () Bool)

(assert (=> b!737921 (= e!412710 e!412716)))

(declare-fun res!496034 () Bool)

(assert (=> b!737921 (=> res!496034 e!412716)))

(assert (=> b!737921 (= res!496034 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327460 #b00000000000000000000000000000000) (bvsge lt!327460 (size!20220 a!3186))))))

(declare-fun lt!327467 () Unit!25192)

(assert (=> b!737921 (= lt!327467 e!412717)))

(declare-fun c!81320 () Bool)

(declare-fun lt!327461 () Bool)

(assert (=> b!737921 (= c!81320 lt!327461)))

(assert (=> b!737921 (= lt!327461 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737921 (= lt!327460 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737922 () Bool)

(declare-fun res!496044 () Bool)

(assert (=> b!737922 (=> (not res!496044) (not e!412712))))

(assert (=> b!737922 (= res!496044 e!412713)))

(declare-fun c!81322 () Bool)

(assert (=> b!737922 (= c!81322 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737923 () Bool)

(declare-fun res!496031 () Bool)

(assert (=> b!737923 (=> (not res!496031) (not e!412708))))

(declare-datatypes ((List!13801 0))(
  ( (Nil!13798) (Cons!13797 (h!14869 (_ BitVec 64)) (t!20116 List!13801)) )
))
(declare-fun arrayNoDuplicates!0 (array!41371 (_ BitVec 32) List!13801) Bool)

(assert (=> b!737923 (= res!496031 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13798))))

(declare-fun b!737924 () Bool)

(declare-fun res!496042 () Bool)

(assert (=> b!737924 (=> (not res!496042) (not e!412715))))

(assert (=> b!737924 (= res!496042 (and (= (size!20220 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20220 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20220 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737925 () Bool)

(assert (=> b!737925 (= e!412714 (not e!412710))))

(declare-fun res!496036 () Bool)

(assert (=> b!737925 (=> res!496036 e!412710)))

(assert (=> b!737925 (= res!496036 (or (not (is-Intermediate!7399 lt!327455)) (bvsge x!1131 (x!62957 lt!327455))))))

(assert (=> b!737925 (= lt!327463 (Found!7399 j!159))))

(declare-fun e!412711 () Bool)

(assert (=> b!737925 e!412711))

(declare-fun res!496045 () Bool)

(assert (=> b!737925 (=> (not res!496045) (not e!412711))))

(assert (=> b!737925 (= res!496045 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327465 () Unit!25192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25192)

(assert (=> b!737925 (= lt!327465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737926 () Bool)

(assert (=> b!737926 (= e!412709 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327460 resIntermediateIndex!5 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327463)))))

(declare-fun b!737927 () Bool)

(declare-fun res!496039 () Bool)

(assert (=> b!737927 (=> (not res!496039) (not e!412708))))

(assert (=> b!737927 (= res!496039 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20220 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20220 a!3186))))))

(declare-fun b!737928 () Bool)

(declare-fun res!496037 () Bool)

(assert (=> b!737928 (=> res!496037 e!412716)))

(assert (=> b!737928 (= res!496037 e!412709)))

(declare-fun c!81321 () Bool)

(assert (=> b!737928 (= c!81321 lt!327461)))

(declare-fun b!737929 () Bool)

(declare-fun res!496040 () Bool)

(assert (=> b!737929 (=> (not res!496040) (not e!412712))))

(assert (=> b!737929 (= res!496040 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19799 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737930 () Bool)

(assert (=> b!737930 (= e!412711 e!412718)))

(declare-fun res!496035 () Bool)

(assert (=> b!737930 (=> (not res!496035) (not e!412718))))

(assert (=> b!737930 (= res!496035 (= (seekEntryOrOpen!0 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327462))))

(assert (=> b!737930 (= lt!327462 (Found!7399 j!159))))

(declare-fun b!737931 () Bool)

(assert (=> b!737931 (= e!412713 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19799 a!3186) j!159) a!3186 mask!3328) lt!327458))))

(assert (= (and start!65198 res!496033) b!737924))

(assert (= (and b!737924 res!496042) b!737918))

(assert (= (and b!737918 res!496046) b!737914))

(assert (= (and b!737914 res!496029) b!737912))

(assert (= (and b!737912 res!496043) b!737911))

(assert (= (and b!737911 res!496038) b!737919))

(assert (= (and b!737919 res!496030) b!737923))

(assert (= (and b!737923 res!496031) b!737927))

(assert (= (and b!737927 res!496039) b!737920))

(assert (= (and b!737920 res!496032) b!737929))

(assert (= (and b!737929 res!496040) b!737922))

(assert (= (and b!737922 c!81322) b!737931))

(assert (= (and b!737922 (not c!81322)) b!737917))

(assert (= (and b!737922 res!496044) b!737910))

(assert (= (and b!737910 res!496041) b!737925))

(assert (= (and b!737925 res!496045) b!737930))

(assert (= (and b!737930 res!496035) b!737915))

(assert (= (and b!737925 (not res!496036)) b!737921))

(assert (= (and b!737921 c!81320) b!737909))

(assert (= (and b!737921 (not c!81320)) b!737913))

(assert (= (and b!737921 (not res!496034)) b!737928))

(assert (= (and b!737928 c!81321) b!737916))

(assert (= (and b!737928 (not c!81321)) b!737926))

(assert (= (and b!737928 (not res!496037)) b!737908))

(declare-fun m!689671 () Bool)

(assert (=> b!737908 m!689671))

(declare-fun m!689673 () Bool)

(assert (=> b!737925 m!689673))

(declare-fun m!689675 () Bool)

(assert (=> b!737925 m!689675))

(declare-fun m!689677 () Bool)

(assert (=> b!737911 m!689677))

(declare-fun m!689679 () Bool)

(assert (=> b!737923 m!689679))

(declare-fun m!689681 () Bool)

(assert (=> b!737919 m!689681))

(declare-fun m!689683 () Bool)

(assert (=> b!737910 m!689683))

(declare-fun m!689685 () Bool)

(assert (=> b!737910 m!689685))

(assert (=> b!737910 m!689683))

(declare-fun m!689687 () Bool)

(assert (=> b!737910 m!689687))

(declare-fun m!689689 () Bool)

(assert (=> b!737910 m!689689))

(declare-fun m!689691 () Bool)

(assert (=> b!737910 m!689691))

(declare-fun m!689693 () Bool)

(assert (=> b!737909 m!689693))

(assert (=> b!737909 m!689693))

(declare-fun m!689695 () Bool)

(assert (=> b!737909 m!689695))

(assert (=> b!737930 m!689693))

(assert (=> b!737930 m!689693))

(declare-fun m!689697 () Bool)

(assert (=> b!737930 m!689697))

(assert (=> b!737915 m!689693))

(assert (=> b!737915 m!689693))

(declare-fun m!689699 () Bool)

(assert (=> b!737915 m!689699))

(declare-fun m!689701 () Bool)

(assert (=> b!737914 m!689701))

(assert (=> b!737920 m!689693))

(assert (=> b!737920 m!689693))

(declare-fun m!689703 () Bool)

(assert (=> b!737920 m!689703))

(assert (=> b!737920 m!689703))

(assert (=> b!737920 m!689693))

(declare-fun m!689705 () Bool)

(assert (=> b!737920 m!689705))

(assert (=> b!737916 m!689693))

(assert (=> b!737916 m!689693))

(assert (=> b!737916 m!689695))

(assert (=> b!737918 m!689693))

(assert (=> b!737918 m!689693))

(declare-fun m!689707 () Bool)

(assert (=> b!737918 m!689707))

(declare-fun m!689709 () Bool)

(assert (=> b!737912 m!689709))

(assert (=> b!737931 m!689693))

(assert (=> b!737931 m!689693))

(declare-fun m!689711 () Bool)

(assert (=> b!737931 m!689711))

(assert (=> b!737913 m!689693))

(assert (=> b!737913 m!689693))

(declare-fun m!689713 () Bool)

(assert (=> b!737913 m!689713))

(assert (=> b!737913 m!689693))

(declare-fun m!689715 () Bool)

(assert (=> b!737913 m!689715))

(declare-fun m!689717 () Bool)

(assert (=> start!65198 m!689717))

(declare-fun m!689719 () Bool)

(assert (=> start!65198 m!689719))

(assert (=> b!737917 m!689693))

(assert (=> b!737917 m!689693))

(assert (=> b!737917 m!689713))

(assert (=> b!737926 m!689693))

(assert (=> b!737926 m!689693))

(assert (=> b!737926 m!689715))

(declare-fun m!689721 () Bool)

(assert (=> b!737929 m!689721))

(declare-fun m!689723 () Bool)

(assert (=> b!737921 m!689723))

(push 1)

