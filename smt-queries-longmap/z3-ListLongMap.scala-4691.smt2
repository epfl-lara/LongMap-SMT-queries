; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65186 () Bool)

(assert start!65186)

(declare-fun b!737946 () Bool)

(declare-fun res!496135 () Bool)

(declare-fun e!412707 () Bool)

(assert (=> b!737946 (=> (not res!496135) (not e!412707))))

(declare-datatypes ((array!41376 0))(
  ( (array!41377 (arr!19802 (Array (_ BitVec 32) (_ BitVec 64))) (size!20223 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41376)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737946 (= res!496135 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737947 () Bool)

(declare-fun res!496139 () Bool)

(assert (=> b!737947 (=> (not res!496139) (not e!412707))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737947 (= res!496139 (validKeyInArray!0 (select (arr!19802 a!3186) j!159)))))

(declare-fun b!737948 () Bool)

(declare-fun res!496138 () Bool)

(assert (=> b!737948 (=> (not res!496138) (not e!412707))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!737948 (= res!496138 (and (= (size!20223 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20223 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20223 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737949 () Bool)

(declare-fun res!496151 () Bool)

(assert (=> b!737949 (=> (not res!496151) (not e!412707))))

(assert (=> b!737949 (= res!496151 (validKeyInArray!0 k0!2102))))

(declare-fun b!737950 () Bool)

(declare-fun e!412705 () Bool)

(declare-fun e!412708 () Bool)

(assert (=> b!737950 (= e!412705 e!412708)))

(declare-fun res!496136 () Bool)

(assert (=> b!737950 (=> (not res!496136) (not e!412708))))

(declare-datatypes ((SeekEntryResult!7399 0))(
  ( (MissingZero!7399 (index!31964 (_ BitVec 32))) (Found!7399 (index!31965 (_ BitVec 32))) (Intermediate!7399 (undefined!8211 Bool) (index!31966 (_ BitVec 32)) (x!62968 (_ BitVec 32))) (Undefined!7399) (MissingVacant!7399 (index!31967 (_ BitVec 32))) )
))
(declare-fun lt!327387 () SeekEntryResult!7399)

(declare-fun lt!327393 () SeekEntryResult!7399)

(assert (=> b!737950 (= res!496136 (= lt!327387 lt!327393))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327392 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327385 () array!41376)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41376 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!737950 (= lt!327393 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327392 lt!327385 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737950 (= lt!327387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327392 mask!3328) lt!327392 lt!327385 mask!3328))))

(assert (=> b!737950 (= lt!327392 (select (store (arr!19802 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737950 (= lt!327385 (array!41377 (store (arr!19802 a!3186) i!1173 k0!2102) (size!20223 a!3186)))))

(declare-fun res!496145 () Bool)

(assert (=> start!65186 (=> (not res!496145) (not e!412707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65186 (= res!496145 (validMask!0 mask!3328))))

(assert (=> start!65186 e!412707))

(assert (=> start!65186 true))

(declare-fun array_inv!15685 (array!41376) Bool)

(assert (=> start!65186 (array_inv!15685 a!3186)))

(declare-fun b!737951 () Bool)

(declare-datatypes ((Unit!25172 0))(
  ( (Unit!25173) )
))
(declare-fun e!412701 () Unit!25172)

(declare-fun Unit!25174 () Unit!25172)

(assert (=> b!737951 (= e!412701 Unit!25174)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!327391 () SeekEntryResult!7399)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41376 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!737951 (= lt!327391 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327394 () (_ BitVec 32))

(declare-fun lt!327382 () SeekEntryResult!7399)

(assert (=> b!737951 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327394 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327382)))

(declare-fun e!412698 () Bool)

(declare-fun b!737952 () Bool)

(declare-fun lt!327390 () SeekEntryResult!7399)

(assert (=> b!737952 (= e!412698 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327394 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327390)))))

(declare-fun b!737953 () Bool)

(declare-fun res!496142 () Bool)

(assert (=> b!737953 (=> (not res!496142) (not e!412705))))

(assert (=> b!737953 (= res!496142 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19802 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737954 () Bool)

(declare-fun e!412706 () Bool)

(assert (=> b!737954 (= e!412708 (not e!412706))))

(declare-fun res!496147 () Bool)

(assert (=> b!737954 (=> res!496147 e!412706)))

(get-info :version)

(assert (=> b!737954 (= res!496147 (or (not ((_ is Intermediate!7399) lt!327393)) (bvsge x!1131 (x!62968 lt!327393))))))

(assert (=> b!737954 (= lt!327382 (Found!7399 j!159))))

(declare-fun e!412697 () Bool)

(assert (=> b!737954 e!412697))

(declare-fun res!496149 () Bool)

(assert (=> b!737954 (=> (not res!496149) (not e!412697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41376 (_ BitVec 32)) Bool)

(assert (=> b!737954 (= res!496149 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327388 () Unit!25172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25172)

(assert (=> b!737954 (= lt!327388 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737955 () Bool)

(declare-fun e!412703 () Bool)

(assert (=> b!737955 (= e!412707 e!412703)))

(declare-fun res!496141 () Bool)

(assert (=> b!737955 (=> (not res!496141) (not e!412703))))

(declare-fun lt!327384 () SeekEntryResult!7399)

(assert (=> b!737955 (= res!496141 (or (= lt!327384 (MissingZero!7399 i!1173)) (= lt!327384 (MissingVacant!7399 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41376 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!737955 (= lt!327384 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737956 () Bool)

(assert (=> b!737956 (= e!412698 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327394 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327382)))))

(declare-fun b!737957 () Bool)

(assert (=> b!737957 (= e!412703 e!412705)))

(declare-fun res!496140 () Bool)

(assert (=> b!737957 (=> (not res!496140) (not e!412705))))

(assert (=> b!737957 (= res!496140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19802 a!3186) j!159) mask!3328) (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327390))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737957 (= lt!327390 (Intermediate!7399 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737958 () Bool)

(declare-fun res!496137 () Bool)

(assert (=> b!737958 (=> (not res!496137) (not e!412705))))

(declare-fun e!412702 () Bool)

(assert (=> b!737958 (= res!496137 e!412702)))

(declare-fun c!81287 () Bool)

(assert (=> b!737958 (= c!81287 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737959 () Bool)

(declare-fun e!412700 () Bool)

(assert (=> b!737959 (= e!412697 e!412700)))

(declare-fun res!496146 () Bool)

(assert (=> b!737959 (=> (not res!496146) (not e!412700))))

(declare-fun lt!327386 () SeekEntryResult!7399)

(assert (=> b!737959 (= res!496146 (= (seekEntryOrOpen!0 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327386))))

(assert (=> b!737959 (= lt!327386 (Found!7399 j!159))))

(declare-fun b!737960 () Bool)

(declare-fun res!496150 () Bool)

(declare-fun e!412704 () Bool)

(assert (=> b!737960 (=> res!496150 e!412704)))

(assert (=> b!737960 (= res!496150 e!412698)))

(declare-fun c!81286 () Bool)

(declare-fun lt!327383 () Bool)

(assert (=> b!737960 (= c!81286 lt!327383)))

(declare-fun b!737961 () Bool)

(declare-fun Unit!25175 () Unit!25172)

(assert (=> b!737961 (= e!412701 Unit!25175)))

(assert (=> b!737961 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327394 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327390)))

(declare-fun b!737962 () Bool)

(declare-fun res!496152 () Bool)

(assert (=> b!737962 (=> (not res!496152) (not e!412703))))

(assert (=> b!737962 (= res!496152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737963 () Bool)

(assert (=> b!737963 (= e!412702 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327390))))

(declare-fun b!737964 () Bool)

(declare-fun res!496148 () Bool)

(assert (=> b!737964 (=> (not res!496148) (not e!412703))))

(assert (=> b!737964 (= res!496148 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20223 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20223 a!3186))))))

(declare-fun b!737965 () Bool)

(assert (=> b!737965 (= e!412706 e!412704)))

(declare-fun res!496144 () Bool)

(assert (=> b!737965 (=> res!496144 e!412704)))

(assert (=> b!737965 (= res!496144 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327394 #b00000000000000000000000000000000) (bvsge lt!327394 (size!20223 a!3186))))))

(declare-fun lt!327395 () Unit!25172)

(assert (=> b!737965 (= lt!327395 e!412701)))

(declare-fun c!81288 () Bool)

(assert (=> b!737965 (= c!81288 lt!327383)))

(assert (=> b!737965 (= lt!327383 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737965 (= lt!327394 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737966 () Bool)

(assert (=> b!737966 (= e!412700 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327386))))

(declare-fun b!737967 () Bool)

(assert (=> b!737967 (= e!412702 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) (Found!7399 j!159)))))

(declare-fun b!737968 () Bool)

(declare-fun res!496143 () Bool)

(assert (=> b!737968 (=> (not res!496143) (not e!412703))))

(declare-datatypes ((List!13843 0))(
  ( (Nil!13840) (Cons!13839 (h!14911 (_ BitVec 64)) (t!20149 List!13843)) )
))
(declare-fun arrayNoDuplicates!0 (array!41376 (_ BitVec 32) List!13843) Bool)

(assert (=> b!737968 (= res!496143 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13840))))

(declare-fun b!737969 () Bool)

(assert (=> b!737969 (= e!412704 true)))

(declare-fun lt!327389 () SeekEntryResult!7399)

(assert (=> b!737969 (= lt!327389 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327394 lt!327392 lt!327385 mask!3328))))

(assert (= (and start!65186 res!496145) b!737948))

(assert (= (and b!737948 res!496138) b!737947))

(assert (= (and b!737947 res!496139) b!737949))

(assert (= (and b!737949 res!496151) b!737946))

(assert (= (and b!737946 res!496135) b!737955))

(assert (= (and b!737955 res!496141) b!737962))

(assert (= (and b!737962 res!496152) b!737968))

(assert (= (and b!737968 res!496143) b!737964))

(assert (= (and b!737964 res!496148) b!737957))

(assert (= (and b!737957 res!496140) b!737953))

(assert (= (and b!737953 res!496142) b!737958))

(assert (= (and b!737958 c!81287) b!737963))

(assert (= (and b!737958 (not c!81287)) b!737967))

(assert (= (and b!737958 res!496137) b!737950))

(assert (= (and b!737950 res!496136) b!737954))

(assert (= (and b!737954 res!496149) b!737959))

(assert (= (and b!737959 res!496146) b!737966))

(assert (= (and b!737954 (not res!496147)) b!737965))

(assert (= (and b!737965 c!81288) b!737961))

(assert (= (and b!737965 (not c!81288)) b!737951))

(assert (= (and b!737965 (not res!496144)) b!737960))

(assert (= (and b!737960 c!81286) b!737952))

(assert (= (and b!737960 (not c!81286)) b!737956))

(assert (= (and b!737960 (not res!496150)) b!737969))

(declare-fun m!689129 () Bool)

(assert (=> b!737967 m!689129))

(assert (=> b!737967 m!689129))

(declare-fun m!689131 () Bool)

(assert (=> b!737967 m!689131))

(declare-fun m!689133 () Bool)

(assert (=> b!737965 m!689133))

(declare-fun m!689135 () Bool)

(assert (=> b!737969 m!689135))

(assert (=> b!737957 m!689129))

(assert (=> b!737957 m!689129))

(declare-fun m!689137 () Bool)

(assert (=> b!737957 m!689137))

(assert (=> b!737957 m!689137))

(assert (=> b!737957 m!689129))

(declare-fun m!689139 () Bool)

(assert (=> b!737957 m!689139))

(assert (=> b!737961 m!689129))

(assert (=> b!737961 m!689129))

(declare-fun m!689141 () Bool)

(assert (=> b!737961 m!689141))

(declare-fun m!689143 () Bool)

(assert (=> b!737953 m!689143))

(declare-fun m!689145 () Bool)

(assert (=> start!65186 m!689145))

(declare-fun m!689147 () Bool)

(assert (=> start!65186 m!689147))

(declare-fun m!689149 () Bool)

(assert (=> b!737968 m!689149))

(declare-fun m!689151 () Bool)

(assert (=> b!737950 m!689151))

(assert (=> b!737950 m!689151))

(declare-fun m!689153 () Bool)

(assert (=> b!737950 m!689153))

(declare-fun m!689155 () Bool)

(assert (=> b!737950 m!689155))

(declare-fun m!689157 () Bool)

(assert (=> b!737950 m!689157))

(declare-fun m!689159 () Bool)

(assert (=> b!737950 m!689159))

(assert (=> b!737952 m!689129))

(assert (=> b!737952 m!689129))

(assert (=> b!737952 m!689141))

(assert (=> b!737959 m!689129))

(assert (=> b!737959 m!689129))

(declare-fun m!689161 () Bool)

(assert (=> b!737959 m!689161))

(declare-fun m!689163 () Bool)

(assert (=> b!737946 m!689163))

(declare-fun m!689165 () Bool)

(assert (=> b!737954 m!689165))

(declare-fun m!689167 () Bool)

(assert (=> b!737954 m!689167))

(assert (=> b!737966 m!689129))

(assert (=> b!737966 m!689129))

(declare-fun m!689169 () Bool)

(assert (=> b!737966 m!689169))

(assert (=> b!737951 m!689129))

(assert (=> b!737951 m!689129))

(assert (=> b!737951 m!689131))

(assert (=> b!737951 m!689129))

(declare-fun m!689171 () Bool)

(assert (=> b!737951 m!689171))

(assert (=> b!737947 m!689129))

(assert (=> b!737947 m!689129))

(declare-fun m!689173 () Bool)

(assert (=> b!737947 m!689173))

(declare-fun m!689175 () Bool)

(assert (=> b!737962 m!689175))

(assert (=> b!737956 m!689129))

(assert (=> b!737956 m!689129))

(assert (=> b!737956 m!689171))

(assert (=> b!737963 m!689129))

(assert (=> b!737963 m!689129))

(declare-fun m!689177 () Bool)

(assert (=> b!737963 m!689177))

(declare-fun m!689179 () Bool)

(assert (=> b!737949 m!689179))

(declare-fun m!689181 () Bool)

(assert (=> b!737955 m!689181))

(check-sat (not b!737956) (not b!737961) (not b!737963) (not b!737955) (not b!737947) (not b!737954) (not b!737952) (not b!737951) (not b!737959) (not b!737965) (not b!737950) (not b!737957) (not b!737967) (not b!737969) (not b!737946) (not b!737966) (not b!737968) (not b!737962) (not start!65186) (not b!737949))
(check-sat)
