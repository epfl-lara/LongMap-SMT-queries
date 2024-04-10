; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64542 () Bool)

(assert start!64542)

(declare-fun b!726919 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41060 0))(
  ( (array!41061 (arr!19651 (Array (_ BitVec 32) (_ BitVec 64))) (size!20072 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41060)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!406967 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7251 0))(
  ( (MissingZero!7251 (index!31372 (_ BitVec 32))) (Found!7251 (index!31373 (_ BitVec 32))) (Intermediate!7251 (undefined!8063 Bool) (index!31374 (_ BitVec 32)) (x!62357 (_ BitVec 32))) (Undefined!7251) (MissingVacant!7251 (index!31375 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41060 (_ BitVec 32)) SeekEntryResult!7251)

(assert (=> b!726919 (= e!406967 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19651 a!3186) j!159) a!3186 mask!3328) (Found!7251 j!159)))))

(declare-fun b!726920 () Bool)

(declare-fun res!487858 () Bool)

(declare-fun e!406959 () Bool)

(assert (=> b!726920 (=> (not res!487858) (not e!406959))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726920 (= res!487858 (validKeyInArray!0 k0!2102))))

(declare-fun b!726921 () Bool)

(declare-fun e!406964 () Bool)

(assert (=> b!726921 (= e!406959 e!406964)))

(declare-fun res!487853 () Bool)

(assert (=> b!726921 (=> (not res!487853) (not e!406964))))

(declare-fun lt!321936 () SeekEntryResult!7251)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726921 (= res!487853 (or (= lt!321936 (MissingZero!7251 i!1173)) (= lt!321936 (MissingVacant!7251 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41060 (_ BitVec 32)) SeekEntryResult!7251)

(assert (=> b!726921 (= lt!321936 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726922 () Bool)

(declare-fun res!487857 () Bool)

(assert (=> b!726922 (=> (not res!487857) (not e!406959))))

(declare-fun arrayContainsKey!0 (array!41060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726922 (= res!487857 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726923 () Bool)

(declare-fun res!487859 () Bool)

(declare-fun e!406965 () Bool)

(assert (=> b!726923 (=> (not res!487859) (not e!406965))))

(assert (=> b!726923 (= res!487859 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19651 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726924 () Bool)

(declare-fun res!487849 () Bool)

(assert (=> b!726924 (=> (not res!487849) (not e!406959))))

(assert (=> b!726924 (= res!487849 (and (= (size!20072 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20072 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20072 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726925 () Bool)

(declare-fun e!406963 () Bool)

(declare-fun e!406966 () Bool)

(assert (=> b!726925 (= e!406963 e!406966)))

(declare-fun res!487861 () Bool)

(assert (=> b!726925 (=> (not res!487861) (not e!406966))))

(declare-fun lt!321941 () SeekEntryResult!7251)

(assert (=> b!726925 (= res!487861 (= (seekEntryOrOpen!0 (select (arr!19651 a!3186) j!159) a!3186 mask!3328) lt!321941))))

(assert (=> b!726925 (= lt!321941 (Found!7251 j!159))))

(declare-fun b!726926 () Bool)

(assert (=> b!726926 (= e!406964 e!406965)))

(declare-fun res!487862 () Bool)

(assert (=> b!726926 (=> (not res!487862) (not e!406965))))

(declare-fun lt!321944 () SeekEntryResult!7251)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41060 (_ BitVec 32)) SeekEntryResult!7251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726926 (= res!487862 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19651 a!3186) j!159) mask!3328) (select (arr!19651 a!3186) j!159) a!3186 mask!3328) lt!321944))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726926 (= lt!321944 (Intermediate!7251 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726927 () Bool)

(declare-fun res!487852 () Bool)

(assert (=> b!726927 (=> (not res!487852) (not e!406964))))

(assert (=> b!726927 (= res!487852 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20072 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20072 a!3186))))))

(declare-fun b!726928 () Bool)

(declare-fun res!487850 () Bool)

(assert (=> b!726928 (=> (not res!487850) (not e!406964))))

(declare-datatypes ((List!13653 0))(
  ( (Nil!13650) (Cons!13649 (h!14706 (_ BitVec 64)) (t!19968 List!13653)) )
))
(declare-fun arrayNoDuplicates!0 (array!41060 (_ BitVec 32) List!13653) Bool)

(assert (=> b!726928 (= res!487850 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13650))))

(declare-fun res!487847 () Bool)

(assert (=> start!64542 (=> (not res!487847) (not e!406959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64542 (= res!487847 (validMask!0 mask!3328))))

(assert (=> start!64542 e!406959))

(assert (=> start!64542 true))

(declare-fun array_inv!15447 (array!41060) Bool)

(assert (=> start!64542 (array_inv!15447 a!3186)))

(declare-fun b!726929 () Bool)

(declare-fun res!487856 () Bool)

(assert (=> b!726929 (=> (not res!487856) (not e!406959))))

(assert (=> b!726929 (= res!487856 (validKeyInArray!0 (select (arr!19651 a!3186) j!159)))))

(declare-fun b!726930 () Bool)

(assert (=> b!726930 (= e!406967 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19651 a!3186) j!159) a!3186 mask!3328) lt!321944))))

(declare-fun b!726931 () Bool)

(declare-fun e!406961 () Bool)

(assert (=> b!726931 (= e!406965 e!406961)))

(declare-fun res!487851 () Bool)

(assert (=> b!726931 (=> (not res!487851) (not e!406961))))

(declare-fun lt!321939 () SeekEntryResult!7251)

(declare-fun lt!321942 () SeekEntryResult!7251)

(assert (=> b!726931 (= res!487851 (= lt!321939 lt!321942))))

(declare-fun lt!321943 () array!41060)

(declare-fun lt!321938 () (_ BitVec 64))

(assert (=> b!726931 (= lt!321942 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321938 lt!321943 mask!3328))))

(assert (=> b!726931 (= lt!321939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321938 mask!3328) lt!321938 lt!321943 mask!3328))))

(assert (=> b!726931 (= lt!321938 (select (store (arr!19651 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726931 (= lt!321943 (array!41061 (store (arr!19651 a!3186) i!1173 k0!2102) (size!20072 a!3186)))))

(declare-fun e!406962 () Bool)

(declare-fun b!726932 () Bool)

(assert (=> b!726932 (= e!406962 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!321937 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726932 (= lt!321937 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726933 () Bool)

(assert (=> b!726933 (= e!406966 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19651 a!3186) j!159) a!3186 mask!3328) lt!321941))))

(declare-fun b!726934 () Bool)

(assert (=> b!726934 (= e!406961 (not e!406962))))

(declare-fun res!487848 () Bool)

(assert (=> b!726934 (=> res!487848 e!406962)))

(get-info :version)

(assert (=> b!726934 (= res!487848 (or (not ((_ is Intermediate!7251) lt!321942)) (bvsge x!1131 (x!62357 lt!321942))))))

(assert (=> b!726934 e!406963))

(declare-fun res!487860 () Bool)

(assert (=> b!726934 (=> (not res!487860) (not e!406963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41060 (_ BitVec 32)) Bool)

(assert (=> b!726934 (= res!487860 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24820 0))(
  ( (Unit!24821) )
))
(declare-fun lt!321940 () Unit!24820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24820)

(assert (=> b!726934 (= lt!321940 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726935 () Bool)

(declare-fun res!487855 () Bool)

(assert (=> b!726935 (=> (not res!487855) (not e!406965))))

(assert (=> b!726935 (= res!487855 e!406967)))

(declare-fun c!79909 () Bool)

(assert (=> b!726935 (= c!79909 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726936 () Bool)

(declare-fun res!487854 () Bool)

(assert (=> b!726936 (=> (not res!487854) (not e!406964))))

(assert (=> b!726936 (= res!487854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64542 res!487847) b!726924))

(assert (= (and b!726924 res!487849) b!726929))

(assert (= (and b!726929 res!487856) b!726920))

(assert (= (and b!726920 res!487858) b!726922))

(assert (= (and b!726922 res!487857) b!726921))

(assert (= (and b!726921 res!487853) b!726936))

(assert (= (and b!726936 res!487854) b!726928))

(assert (= (and b!726928 res!487850) b!726927))

(assert (= (and b!726927 res!487852) b!726926))

(assert (= (and b!726926 res!487862) b!726923))

(assert (= (and b!726923 res!487859) b!726935))

(assert (= (and b!726935 c!79909) b!726930))

(assert (= (and b!726935 (not c!79909)) b!726919))

(assert (= (and b!726935 res!487855) b!726931))

(assert (= (and b!726931 res!487851) b!726934))

(assert (= (and b!726934 res!487860) b!726925))

(assert (= (and b!726925 res!487861) b!726933))

(assert (= (and b!726934 (not res!487848)) b!726932))

(declare-fun m!680929 () Bool)

(assert (=> b!726920 m!680929))

(declare-fun m!680931 () Bool)

(assert (=> b!726919 m!680931))

(assert (=> b!726919 m!680931))

(declare-fun m!680933 () Bool)

(assert (=> b!726919 m!680933))

(assert (=> b!726933 m!680931))

(assert (=> b!726933 m!680931))

(declare-fun m!680935 () Bool)

(assert (=> b!726933 m!680935))

(declare-fun m!680937 () Bool)

(assert (=> b!726931 m!680937))

(declare-fun m!680939 () Bool)

(assert (=> b!726931 m!680939))

(declare-fun m!680941 () Bool)

(assert (=> b!726931 m!680941))

(assert (=> b!726931 m!680939))

(declare-fun m!680943 () Bool)

(assert (=> b!726931 m!680943))

(declare-fun m!680945 () Bool)

(assert (=> b!726931 m!680945))

(assert (=> b!726929 m!680931))

(assert (=> b!726929 m!680931))

(declare-fun m!680947 () Bool)

(assert (=> b!726929 m!680947))

(declare-fun m!680949 () Bool)

(assert (=> start!64542 m!680949))

(declare-fun m!680951 () Bool)

(assert (=> start!64542 m!680951))

(assert (=> b!726930 m!680931))

(assert (=> b!726930 m!680931))

(declare-fun m!680953 () Bool)

(assert (=> b!726930 m!680953))

(declare-fun m!680955 () Bool)

(assert (=> b!726936 m!680955))

(declare-fun m!680957 () Bool)

(assert (=> b!726923 m!680957))

(assert (=> b!726926 m!680931))

(assert (=> b!726926 m!680931))

(declare-fun m!680959 () Bool)

(assert (=> b!726926 m!680959))

(assert (=> b!726926 m!680959))

(assert (=> b!726926 m!680931))

(declare-fun m!680961 () Bool)

(assert (=> b!726926 m!680961))

(declare-fun m!680963 () Bool)

(assert (=> b!726922 m!680963))

(declare-fun m!680965 () Bool)

(assert (=> b!726932 m!680965))

(assert (=> b!726925 m!680931))

(assert (=> b!726925 m!680931))

(declare-fun m!680967 () Bool)

(assert (=> b!726925 m!680967))

(declare-fun m!680969 () Bool)

(assert (=> b!726928 m!680969))

(declare-fun m!680971 () Bool)

(assert (=> b!726934 m!680971))

(declare-fun m!680973 () Bool)

(assert (=> b!726934 m!680973))

(declare-fun m!680975 () Bool)

(assert (=> b!726921 m!680975))

(check-sat (not b!726929) (not b!726933) (not b!726926) (not b!726925) (not b!726919) (not b!726920) (not b!726921) (not b!726932) (not b!726931) (not b!726928) (not b!726934) (not b!726922) (not b!726930) (not start!64542) (not b!726936))
(check-sat)
