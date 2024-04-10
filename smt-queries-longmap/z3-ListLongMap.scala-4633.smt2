; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64500 () Bool)

(assert start!64500)

(declare-fun b!725825 () Bool)

(declare-fun e!406438 () Bool)

(declare-fun e!406433 () Bool)

(assert (=> b!725825 (= e!406438 e!406433)))

(declare-fun res!486882 () Bool)

(assert (=> b!725825 (=> (not res!486882) (not e!406433))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321484 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41018 0))(
  ( (array!41019 (arr!19630 (Array (_ BitVec 32) (_ BitVec 64))) (size!20051 (_ BitVec 32))) )
))
(declare-fun lt!321485 () array!41018)

(declare-datatypes ((SeekEntryResult!7230 0))(
  ( (MissingZero!7230 (index!31288 (_ BitVec 32))) (Found!7230 (index!31289 (_ BitVec 32))) (Intermediate!7230 (undefined!8042 Bool) (index!31290 (_ BitVec 32)) (x!62280 (_ BitVec 32))) (Undefined!7230) (MissingVacant!7230 (index!31291 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41018 (_ BitVec 32)) SeekEntryResult!7230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725825 (= res!486882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321484 mask!3328) lt!321484 lt!321485 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321484 lt!321485 mask!3328)))))

(declare-fun a!3186 () array!41018)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725825 (= lt!321484 (select (store (arr!19630 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725825 (= lt!321485 (array!41019 (store (arr!19630 a!3186) i!1173 k0!2102) (size!20051 a!3186)))))

(declare-fun b!725826 () Bool)

(assert (=> b!725826 (= e!406433 (not true))))

(declare-fun e!406435 () Bool)

(assert (=> b!725826 e!406435))

(declare-fun res!486885 () Bool)

(assert (=> b!725826 (=> (not res!486885) (not e!406435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41018 (_ BitVec 32)) Bool)

(assert (=> b!725826 (= res!486885 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24778 0))(
  ( (Unit!24779) )
))
(declare-fun lt!321483 () Unit!24778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24778)

(assert (=> b!725826 (= lt!321483 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725827 () Bool)

(declare-fun res!486891 () Bool)

(assert (=> b!725827 (=> (not res!486891) (not e!406438))))

(declare-fun e!406436 () Bool)

(assert (=> b!725827 (= res!486891 e!406436)))

(declare-fun c!79846 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725827 (= c!79846 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!486893 () Bool)

(declare-fun e!406434 () Bool)

(assert (=> start!64500 (=> (not res!486893) (not e!406434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64500 (= res!486893 (validMask!0 mask!3328))))

(assert (=> start!64500 e!406434))

(assert (=> start!64500 true))

(declare-fun array_inv!15426 (array!41018) Bool)

(assert (=> start!64500 (array_inv!15426 a!3186)))

(declare-fun b!725828 () Bool)

(declare-fun res!486886 () Bool)

(declare-fun e!406439 () Bool)

(assert (=> b!725828 (=> (not res!486886) (not e!406439))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725828 (= res!486886 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20051 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20051 a!3186))))))

(declare-fun b!725829 () Bool)

(declare-fun e!406432 () Bool)

(assert (=> b!725829 (= e!406435 e!406432)))

(declare-fun res!486890 () Bool)

(assert (=> b!725829 (=> (not res!486890) (not e!406432))))

(declare-fun lt!321480 () SeekEntryResult!7230)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41018 (_ BitVec 32)) SeekEntryResult!7230)

(assert (=> b!725829 (= res!486890 (= (seekEntryOrOpen!0 (select (arr!19630 a!3186) j!159) a!3186 mask!3328) lt!321480))))

(assert (=> b!725829 (= lt!321480 (Found!7230 j!159))))

(declare-fun b!725830 () Bool)

(declare-fun res!486887 () Bool)

(assert (=> b!725830 (=> (not res!486887) (not e!406434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725830 (= res!486887 (validKeyInArray!0 k0!2102))))

(declare-fun b!725831 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41018 (_ BitVec 32)) SeekEntryResult!7230)

(assert (=> b!725831 (= e!406436 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19630 a!3186) j!159) a!3186 mask!3328) (Found!7230 j!159)))))

(declare-fun b!725832 () Bool)

(assert (=> b!725832 (= e!406439 e!406438)))

(declare-fun res!486879 () Bool)

(assert (=> b!725832 (=> (not res!486879) (not e!406438))))

(declare-fun lt!321481 () SeekEntryResult!7230)

(assert (=> b!725832 (= res!486879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19630 a!3186) j!159) mask!3328) (select (arr!19630 a!3186) j!159) a!3186 mask!3328) lt!321481))))

(assert (=> b!725832 (= lt!321481 (Intermediate!7230 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725833 () Bool)

(assert (=> b!725833 (= e!406434 e!406439)))

(declare-fun res!486883 () Bool)

(assert (=> b!725833 (=> (not res!486883) (not e!406439))))

(declare-fun lt!321482 () SeekEntryResult!7230)

(assert (=> b!725833 (= res!486883 (or (= lt!321482 (MissingZero!7230 i!1173)) (= lt!321482 (MissingVacant!7230 i!1173))))))

(assert (=> b!725833 (= lt!321482 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725834 () Bool)

(declare-fun res!486889 () Bool)

(assert (=> b!725834 (=> (not res!486889) (not e!406434))))

(declare-fun arrayContainsKey!0 (array!41018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725834 (= res!486889 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725835 () Bool)

(declare-fun res!486884 () Bool)

(assert (=> b!725835 (=> (not res!486884) (not e!406439))))

(declare-datatypes ((List!13632 0))(
  ( (Nil!13629) (Cons!13628 (h!14685 (_ BitVec 64)) (t!19947 List!13632)) )
))
(declare-fun arrayNoDuplicates!0 (array!41018 (_ BitVec 32) List!13632) Bool)

(assert (=> b!725835 (= res!486884 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13629))))

(declare-fun b!725836 () Bool)

(declare-fun res!486880 () Bool)

(assert (=> b!725836 (=> (not res!486880) (not e!406439))))

(assert (=> b!725836 (= res!486880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725837 () Bool)

(assert (=> b!725837 (= e!406432 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19630 a!3186) j!159) a!3186 mask!3328) lt!321480))))

(declare-fun b!725838 () Bool)

(declare-fun res!486888 () Bool)

(assert (=> b!725838 (=> (not res!486888) (not e!406434))))

(assert (=> b!725838 (= res!486888 (validKeyInArray!0 (select (arr!19630 a!3186) j!159)))))

(declare-fun b!725839 () Bool)

(assert (=> b!725839 (= e!406436 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19630 a!3186) j!159) a!3186 mask!3328) lt!321481))))

(declare-fun b!725840 () Bool)

(declare-fun res!486892 () Bool)

(assert (=> b!725840 (=> (not res!486892) (not e!406438))))

(assert (=> b!725840 (= res!486892 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19630 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725841 () Bool)

(declare-fun res!486881 () Bool)

(assert (=> b!725841 (=> (not res!486881) (not e!406434))))

(assert (=> b!725841 (= res!486881 (and (= (size!20051 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20051 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20051 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64500 res!486893) b!725841))

(assert (= (and b!725841 res!486881) b!725838))

(assert (= (and b!725838 res!486888) b!725830))

(assert (= (and b!725830 res!486887) b!725834))

(assert (= (and b!725834 res!486889) b!725833))

(assert (= (and b!725833 res!486883) b!725836))

(assert (= (and b!725836 res!486880) b!725835))

(assert (= (and b!725835 res!486884) b!725828))

(assert (= (and b!725828 res!486886) b!725832))

(assert (= (and b!725832 res!486879) b!725840))

(assert (= (and b!725840 res!486892) b!725827))

(assert (= (and b!725827 c!79846) b!725839))

(assert (= (and b!725827 (not c!79846)) b!725831))

(assert (= (and b!725827 res!486891) b!725825))

(assert (= (and b!725825 res!486882) b!725826))

(assert (= (and b!725826 res!486885) b!725829))

(assert (= (and b!725829 res!486890) b!725837))

(declare-fun m!679949 () Bool)

(assert (=> b!725836 m!679949))

(declare-fun m!679951 () Bool)

(assert (=> b!725837 m!679951))

(assert (=> b!725837 m!679951))

(declare-fun m!679953 () Bool)

(assert (=> b!725837 m!679953))

(declare-fun m!679955 () Bool)

(assert (=> b!725830 m!679955))

(assert (=> b!725829 m!679951))

(assert (=> b!725829 m!679951))

(declare-fun m!679957 () Bool)

(assert (=> b!725829 m!679957))

(declare-fun m!679959 () Bool)

(assert (=> b!725835 m!679959))

(declare-fun m!679961 () Bool)

(assert (=> b!725833 m!679961))

(declare-fun m!679963 () Bool)

(assert (=> start!64500 m!679963))

(declare-fun m!679965 () Bool)

(assert (=> start!64500 m!679965))

(assert (=> b!725831 m!679951))

(assert (=> b!725831 m!679951))

(declare-fun m!679967 () Bool)

(assert (=> b!725831 m!679967))

(assert (=> b!725838 m!679951))

(assert (=> b!725838 m!679951))

(declare-fun m!679969 () Bool)

(assert (=> b!725838 m!679969))

(assert (=> b!725839 m!679951))

(assert (=> b!725839 m!679951))

(declare-fun m!679971 () Bool)

(assert (=> b!725839 m!679971))

(declare-fun m!679973 () Bool)

(assert (=> b!725840 m!679973))

(assert (=> b!725832 m!679951))

(assert (=> b!725832 m!679951))

(declare-fun m!679975 () Bool)

(assert (=> b!725832 m!679975))

(assert (=> b!725832 m!679975))

(assert (=> b!725832 m!679951))

(declare-fun m!679977 () Bool)

(assert (=> b!725832 m!679977))

(declare-fun m!679979 () Bool)

(assert (=> b!725826 m!679979))

(declare-fun m!679981 () Bool)

(assert (=> b!725826 m!679981))

(declare-fun m!679983 () Bool)

(assert (=> b!725825 m!679983))

(declare-fun m!679985 () Bool)

(assert (=> b!725825 m!679985))

(declare-fun m!679987 () Bool)

(assert (=> b!725825 m!679987))

(declare-fun m!679989 () Bool)

(assert (=> b!725825 m!679989))

(assert (=> b!725825 m!679987))

(declare-fun m!679991 () Bool)

(assert (=> b!725825 m!679991))

(declare-fun m!679993 () Bool)

(assert (=> b!725834 m!679993))

(check-sat (not b!725826) (not b!725829) (not start!64500) (not b!725832) (not b!725831) (not b!725835) (not b!725830) (not b!725839) (not b!725836) (not b!725834) (not b!725825) (not b!725837) (not b!725833) (not b!725838))
(check-sat)
