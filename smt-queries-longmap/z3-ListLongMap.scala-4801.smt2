; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65846 () Bool)

(assert start!65846)

(declare-fun b!758947 () Bool)

(declare-fun res!513627 () Bool)

(declare-fun e!423093 () Bool)

(assert (=> b!758947 (=> (not res!513627) (not e!423093))))

(declare-fun e!423100 () Bool)

(assert (=> b!758947 (= res!513627 e!423100)))

(declare-fun c!83046 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758947 (= c!83046 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758948 () Bool)

(declare-fun res!513620 () Bool)

(declare-fun e!423098 () Bool)

(assert (=> b!758948 (=> (not res!513620) (not e!423098))))

(declare-datatypes ((array!42036 0))(
  ( (array!42037 (arr!20132 (Array (_ BitVec 32) (_ BitVec 64))) (size!20553 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42036)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!758948 (= res!513620 (and (= (size!20553 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20553 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20553 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758949 () Bool)

(declare-fun res!513623 () Bool)

(declare-fun e!423094 () Bool)

(assert (=> b!758949 (=> (not res!513623) (not e!423094))))

(declare-datatypes ((List!14173 0))(
  ( (Nil!14170) (Cons!14169 (h!15241 (_ BitVec 64)) (t!20479 List!14173)) )
))
(declare-fun arrayNoDuplicates!0 (array!42036 (_ BitVec 32) List!14173) Bool)

(assert (=> b!758949 (= res!513623 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14170))))

(declare-fun b!758950 () Bool)

(declare-fun res!513618 () Bool)

(assert (=> b!758950 (=> (not res!513618) (not e!423098))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758950 (= res!513618 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7729 0))(
  ( (MissingZero!7729 (index!33284 (_ BitVec 32))) (Found!7729 (index!33285 (_ BitVec 32))) (Intermediate!7729 (undefined!8541 Bool) (index!33286 (_ BitVec 32)) (x!64178 (_ BitVec 32))) (Undefined!7729) (MissingVacant!7729 (index!33287 (_ BitVec 32))) )
))
(declare-fun lt!338077 () SeekEntryResult!7729)

(declare-fun b!758951 () Bool)

(declare-fun e!423099 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42036 (_ BitVec 32)) SeekEntryResult!7729)

(assert (=> b!758951 (= e!423099 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20132 a!3186) j!159) a!3186 mask!3328) lt!338077))))

(declare-fun b!758952 () Bool)

(declare-fun res!513628 () Bool)

(assert (=> b!758952 (=> (not res!513628) (not e!423094))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758952 (= res!513628 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20553 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20553 a!3186))))))

(declare-fun res!513625 () Bool)

(assert (=> start!65846 (=> (not res!513625) (not e!423098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65846 (= res!513625 (validMask!0 mask!3328))))

(assert (=> start!65846 e!423098))

(assert (=> start!65846 true))

(declare-fun array_inv!16015 (array!42036) Bool)

(assert (=> start!65846 (array_inv!16015 a!3186)))

(declare-fun b!758953 () Bool)

(declare-fun res!513629 () Bool)

(assert (=> b!758953 (=> (not res!513629) (not e!423098))))

(declare-fun arrayContainsKey!0 (array!42036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758953 (= res!513629 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758954 () Bool)

(assert (=> b!758954 (= e!423098 e!423094)))

(declare-fun res!513621 () Bool)

(assert (=> b!758954 (=> (not res!513621) (not e!423094))))

(declare-fun lt!338080 () SeekEntryResult!7729)

(assert (=> b!758954 (= res!513621 (or (= lt!338080 (MissingZero!7729 i!1173)) (= lt!338080 (MissingVacant!7729 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42036 (_ BitVec 32)) SeekEntryResult!7729)

(assert (=> b!758954 (= lt!338080 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758955 () Bool)

(declare-fun res!513630 () Bool)

(assert (=> b!758955 (=> (not res!513630) (not e!423098))))

(assert (=> b!758955 (= res!513630 (validKeyInArray!0 (select (arr!20132 a!3186) j!159)))))

(declare-fun b!758956 () Bool)

(assert (=> b!758956 (= e!423094 e!423093)))

(declare-fun res!513617 () Bool)

(assert (=> b!758956 (=> (not res!513617) (not e!423093))))

(declare-fun lt!338076 () SeekEntryResult!7729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42036 (_ BitVec 32)) SeekEntryResult!7729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758956 (= res!513617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20132 a!3186) j!159) mask!3328) (select (arr!20132 a!3186) j!159) a!3186 mask!3328) lt!338076))))

(assert (=> b!758956 (= lt!338076 (Intermediate!7729 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758957 () Bool)

(declare-fun res!513622 () Bool)

(assert (=> b!758957 (=> (not res!513622) (not e!423094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42036 (_ BitVec 32)) Bool)

(assert (=> b!758957 (= res!513622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758958 () Bool)

(assert (=> b!758958 (= e!423100 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20132 a!3186) j!159) a!3186 mask!3328) lt!338076))))

(declare-fun b!758959 () Bool)

(declare-fun e!423095 () Bool)

(assert (=> b!758959 (= e!423095 e!423099)))

(declare-fun res!513624 () Bool)

(assert (=> b!758959 (=> (not res!513624) (not e!423099))))

(assert (=> b!758959 (= res!513624 (= (seekEntryOrOpen!0 (select (arr!20132 a!3186) j!159) a!3186 mask!3328) lt!338077))))

(assert (=> b!758959 (= lt!338077 (Found!7729 j!159))))

(declare-fun b!758960 () Bool)

(assert (=> b!758960 (= e!423100 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20132 a!3186) j!159) a!3186 mask!3328) (Found!7729 j!159)))))

(declare-fun b!758961 () Bool)

(declare-fun e!423097 () Bool)

(assert (=> b!758961 (= e!423093 e!423097)))

(declare-fun res!513616 () Bool)

(assert (=> b!758961 (=> (not res!513616) (not e!423097))))

(declare-fun lt!338081 () array!42036)

(declare-fun lt!338079 () (_ BitVec 64))

(assert (=> b!758961 (= res!513616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338079 mask!3328) lt!338079 lt!338081 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338079 lt!338081 mask!3328)))))

(assert (=> b!758961 (= lt!338079 (select (store (arr!20132 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758961 (= lt!338081 (array!42037 (store (arr!20132 a!3186) i!1173 k0!2102) (size!20553 a!3186)))))

(declare-fun b!758962 () Bool)

(assert (=> b!758962 (= e!423097 (not true))))

(assert (=> b!758962 e!423095))

(declare-fun res!513619 () Bool)

(assert (=> b!758962 (=> (not res!513619) (not e!423095))))

(assert (=> b!758962 (= res!513619 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26270 0))(
  ( (Unit!26271) )
))
(declare-fun lt!338078 () Unit!26270)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26270)

(assert (=> b!758962 (= lt!338078 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758963 () Bool)

(declare-fun res!513626 () Bool)

(assert (=> b!758963 (=> (not res!513626) (not e!423093))))

(assert (=> b!758963 (= res!513626 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20132 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65846 res!513625) b!758948))

(assert (= (and b!758948 res!513620) b!758955))

(assert (= (and b!758955 res!513630) b!758950))

(assert (= (and b!758950 res!513618) b!758953))

(assert (= (and b!758953 res!513629) b!758954))

(assert (= (and b!758954 res!513621) b!758957))

(assert (= (and b!758957 res!513622) b!758949))

(assert (= (and b!758949 res!513623) b!758952))

(assert (= (and b!758952 res!513628) b!758956))

(assert (= (and b!758956 res!513617) b!758963))

(assert (= (and b!758963 res!513626) b!758947))

(assert (= (and b!758947 c!83046) b!758958))

(assert (= (and b!758947 (not c!83046)) b!758960))

(assert (= (and b!758947 res!513627) b!758961))

(assert (= (and b!758961 res!513616) b!758962))

(assert (= (and b!758962 res!513619) b!758959))

(assert (= (and b!758959 res!513624) b!758951))

(declare-fun m!705821 () Bool)

(assert (=> b!758956 m!705821))

(assert (=> b!758956 m!705821))

(declare-fun m!705823 () Bool)

(assert (=> b!758956 m!705823))

(assert (=> b!758956 m!705823))

(assert (=> b!758956 m!705821))

(declare-fun m!705825 () Bool)

(assert (=> b!758956 m!705825))

(declare-fun m!705827 () Bool)

(assert (=> b!758961 m!705827))

(declare-fun m!705829 () Bool)

(assert (=> b!758961 m!705829))

(declare-fun m!705831 () Bool)

(assert (=> b!758961 m!705831))

(declare-fun m!705833 () Bool)

(assert (=> b!758961 m!705833))

(declare-fun m!705835 () Bool)

(assert (=> b!758961 m!705835))

(assert (=> b!758961 m!705833))

(declare-fun m!705837 () Bool)

(assert (=> b!758954 m!705837))

(declare-fun m!705839 () Bool)

(assert (=> start!65846 m!705839))

(declare-fun m!705841 () Bool)

(assert (=> start!65846 m!705841))

(declare-fun m!705843 () Bool)

(assert (=> b!758957 m!705843))

(assert (=> b!758955 m!705821))

(assert (=> b!758955 m!705821))

(declare-fun m!705845 () Bool)

(assert (=> b!758955 m!705845))

(assert (=> b!758959 m!705821))

(assert (=> b!758959 m!705821))

(declare-fun m!705847 () Bool)

(assert (=> b!758959 m!705847))

(assert (=> b!758951 m!705821))

(assert (=> b!758951 m!705821))

(declare-fun m!705849 () Bool)

(assert (=> b!758951 m!705849))

(assert (=> b!758960 m!705821))

(assert (=> b!758960 m!705821))

(declare-fun m!705851 () Bool)

(assert (=> b!758960 m!705851))

(declare-fun m!705853 () Bool)

(assert (=> b!758963 m!705853))

(assert (=> b!758958 m!705821))

(assert (=> b!758958 m!705821))

(declare-fun m!705855 () Bool)

(assert (=> b!758958 m!705855))

(declare-fun m!705857 () Bool)

(assert (=> b!758953 m!705857))

(declare-fun m!705859 () Bool)

(assert (=> b!758950 m!705859))

(declare-fun m!705861 () Bool)

(assert (=> b!758949 m!705861))

(declare-fun m!705863 () Bool)

(assert (=> b!758962 m!705863))

(declare-fun m!705865 () Bool)

(assert (=> b!758962 m!705865))

(check-sat (not b!758956) (not b!758951) (not b!758960) (not start!65846) (not b!758949) (not b!758958) (not b!758959) (not b!758953) (not b!758957) (not b!758962) (not b!758961) (not b!758954) (not b!758950) (not b!758955))
(check-sat)
