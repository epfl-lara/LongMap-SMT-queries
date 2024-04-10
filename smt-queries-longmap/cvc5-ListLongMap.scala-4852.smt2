; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66810 () Bool)

(assert start!66810)

(declare-fun b!770696 () Bool)

(declare-datatypes ((Unit!26558 0))(
  ( (Unit!26559) )
))
(declare-fun e!429083 () Unit!26558)

(declare-fun Unit!26560 () Unit!26558)

(assert (=> b!770696 (= e!429083 Unit!26560)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42372 0))(
  ( (array!42373 (arr!20286 (Array (_ BitVec 32) (_ BitVec 64))) (size!20707 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42372)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7886 0))(
  ( (MissingZero!7886 (index!33912 (_ BitVec 32))) (Found!7886 (index!33913 (_ BitVec 32))) (Intermediate!7886 (undefined!8698 Bool) (index!33914 (_ BitVec 32)) (x!64841 (_ BitVec 32))) (Undefined!7886) (MissingVacant!7886 (index!33915 (_ BitVec 32))) )
))
(declare-fun lt!343039 () SeekEntryResult!7886)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42372 (_ BitVec 32)) SeekEntryResult!7886)

(assert (=> b!770696 (= lt!343039 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20286 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343042 () (_ BitVec 32))

(assert (=> b!770696 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343042 resIntermediateIndex!5 (select (arr!20286 a!3186) j!159) a!3186 mask!3328) (Found!7886 j!159))))

(declare-fun b!770697 () Bool)

(declare-fun res!521363 () Bool)

(declare-fun e!429087 () Bool)

(assert (=> b!770697 (=> (not res!521363) (not e!429087))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770697 (= res!521363 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20707 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20707 a!3186))))))

(declare-fun b!770698 () Bool)

(declare-fun res!521365 () Bool)

(declare-fun e!429085 () Bool)

(assert (=> b!770698 (=> (not res!521365) (not e!429085))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770698 (= res!521365 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20286 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770699 () Bool)

(declare-fun e!429080 () Bool)

(assert (=> b!770699 (= e!429080 true)))

(declare-fun lt!343044 () Unit!26558)

(assert (=> b!770699 (= lt!343044 e!429083)))

(declare-fun c!85065 () Bool)

(assert (=> b!770699 (= c!85065 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770699 (= lt!343042 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770701 () Bool)

(declare-fun e!429089 () Bool)

(assert (=> b!770701 (= e!429089 e!429087)))

(declare-fun res!521371 () Bool)

(assert (=> b!770701 (=> (not res!521371) (not e!429087))))

(declare-fun lt!343046 () SeekEntryResult!7886)

(assert (=> b!770701 (= res!521371 (or (= lt!343046 (MissingZero!7886 i!1173)) (= lt!343046 (MissingVacant!7886 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42372 (_ BitVec 32)) SeekEntryResult!7886)

(assert (=> b!770701 (= lt!343046 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!770702 () Bool)

(declare-fun e!429082 () Bool)

(assert (=> b!770702 (= e!429085 e!429082)))

(declare-fun res!521370 () Bool)

(assert (=> b!770702 (=> (not res!521370) (not e!429082))))

(declare-fun lt!343045 () SeekEntryResult!7886)

(declare-fun lt!343037 () SeekEntryResult!7886)

(assert (=> b!770702 (= res!521370 (= lt!343045 lt!343037))))

(declare-fun lt!343038 () (_ BitVec 64))

(declare-fun lt!343036 () array!42372)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42372 (_ BitVec 32)) SeekEntryResult!7886)

(assert (=> b!770702 (= lt!343037 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343038 lt!343036 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770702 (= lt!343045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343038 mask!3328) lt!343038 lt!343036 mask!3328))))

(assert (=> b!770702 (= lt!343038 (select (store (arr!20286 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770702 (= lt!343036 (array!42373 (store (arr!20286 a!3186) i!1173 k!2102) (size!20707 a!3186)))))

(declare-fun b!770703 () Bool)

(declare-fun res!521366 () Bool)

(assert (=> b!770703 (=> (not res!521366) (not e!429087))))

(declare-datatypes ((List!14288 0))(
  ( (Nil!14285) (Cons!14284 (h!15383 (_ BitVec 64)) (t!20603 List!14288)) )
))
(declare-fun arrayNoDuplicates!0 (array!42372 (_ BitVec 32) List!14288) Bool)

(assert (=> b!770703 (= res!521366 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14285))))

(declare-fun b!770704 () Bool)

(declare-fun e!429081 () Bool)

(declare-fun e!429086 () Bool)

(assert (=> b!770704 (= e!429081 e!429086)))

(declare-fun res!521364 () Bool)

(assert (=> b!770704 (=> (not res!521364) (not e!429086))))

(declare-fun lt!343041 () SeekEntryResult!7886)

(assert (=> b!770704 (= res!521364 (= (seekEntryOrOpen!0 (select (arr!20286 a!3186) j!159) a!3186 mask!3328) lt!343041))))

(assert (=> b!770704 (= lt!343041 (Found!7886 j!159))))

(declare-fun b!770705 () Bool)

(declare-fun res!521369 () Bool)

(assert (=> b!770705 (=> (not res!521369) (not e!429089))))

(assert (=> b!770705 (= res!521369 (and (= (size!20707 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20707 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20707 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770706 () Bool)

(assert (=> b!770706 (= e!429086 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20286 a!3186) j!159) a!3186 mask!3328) lt!343041))))

(declare-fun b!770707 () Bool)

(declare-fun res!521359 () Bool)

(assert (=> b!770707 (=> (not res!521359) (not e!429089))))

(declare-fun arrayContainsKey!0 (array!42372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770707 (= res!521359 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770708 () Bool)

(assert (=> b!770708 (= e!429087 e!429085)))

(declare-fun res!521372 () Bool)

(assert (=> b!770708 (=> (not res!521372) (not e!429085))))

(declare-fun lt!343040 () SeekEntryResult!7886)

(assert (=> b!770708 (= res!521372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20286 a!3186) j!159) mask!3328) (select (arr!20286 a!3186) j!159) a!3186 mask!3328) lt!343040))))

(assert (=> b!770708 (= lt!343040 (Intermediate!7886 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770709 () Bool)

(declare-fun res!521358 () Bool)

(assert (=> b!770709 (=> (not res!521358) (not e!429089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770709 (= res!521358 (validKeyInArray!0 k!2102))))

(declare-fun b!770710 () Bool)

(declare-fun Unit!26561 () Unit!26558)

(assert (=> b!770710 (= e!429083 Unit!26561)))

(assert (=> b!770710 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343042 (select (arr!20286 a!3186) j!159) a!3186 mask!3328) lt!343040)))

(declare-fun b!770711 () Bool)

(declare-fun res!521357 () Bool)

(assert (=> b!770711 (=> (not res!521357) (not e!429085))))

(declare-fun e!429084 () Bool)

(assert (=> b!770711 (= res!521357 e!429084)))

(declare-fun c!85066 () Bool)

(assert (=> b!770711 (= c!85066 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770712 () Bool)

(assert (=> b!770712 (= e!429082 (not e!429080))))

(declare-fun res!521360 () Bool)

(assert (=> b!770712 (=> res!521360 e!429080)))

(assert (=> b!770712 (= res!521360 (or (not (is-Intermediate!7886 lt!343037)) (bvsge x!1131 (x!64841 lt!343037))))))

(assert (=> b!770712 e!429081))

(declare-fun res!521368 () Bool)

(assert (=> b!770712 (=> (not res!521368) (not e!429081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42372 (_ BitVec 32)) Bool)

(assert (=> b!770712 (= res!521368 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343043 () Unit!26558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26558)

(assert (=> b!770712 (= lt!343043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770713 () Bool)

(declare-fun res!521361 () Bool)

(assert (=> b!770713 (=> (not res!521361) (not e!429087))))

(assert (=> b!770713 (= res!521361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770714 () Bool)

(assert (=> b!770714 (= e!429084 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20286 a!3186) j!159) a!3186 mask!3328) lt!343040))))

(declare-fun b!770715 () Bool)

(declare-fun res!521362 () Bool)

(assert (=> b!770715 (=> (not res!521362) (not e!429089))))

(assert (=> b!770715 (= res!521362 (validKeyInArray!0 (select (arr!20286 a!3186) j!159)))))

(declare-fun b!770700 () Bool)

(assert (=> b!770700 (= e!429084 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20286 a!3186) j!159) a!3186 mask!3328) (Found!7886 j!159)))))

(declare-fun res!521367 () Bool)

(assert (=> start!66810 (=> (not res!521367) (not e!429089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66810 (= res!521367 (validMask!0 mask!3328))))

(assert (=> start!66810 e!429089))

(assert (=> start!66810 true))

(declare-fun array_inv!16082 (array!42372) Bool)

(assert (=> start!66810 (array_inv!16082 a!3186)))

(assert (= (and start!66810 res!521367) b!770705))

(assert (= (and b!770705 res!521369) b!770715))

(assert (= (and b!770715 res!521362) b!770709))

(assert (= (and b!770709 res!521358) b!770707))

(assert (= (and b!770707 res!521359) b!770701))

(assert (= (and b!770701 res!521371) b!770713))

(assert (= (and b!770713 res!521361) b!770703))

(assert (= (and b!770703 res!521366) b!770697))

(assert (= (and b!770697 res!521363) b!770708))

(assert (= (and b!770708 res!521372) b!770698))

(assert (= (and b!770698 res!521365) b!770711))

(assert (= (and b!770711 c!85066) b!770714))

(assert (= (and b!770711 (not c!85066)) b!770700))

(assert (= (and b!770711 res!521357) b!770702))

(assert (= (and b!770702 res!521370) b!770712))

(assert (= (and b!770712 res!521368) b!770704))

(assert (= (and b!770704 res!521364) b!770706))

(assert (= (and b!770712 (not res!521360)) b!770699))

(assert (= (and b!770699 c!85065) b!770710))

(assert (= (and b!770699 (not c!85065)) b!770696))

(declare-fun m!715943 () Bool)

(assert (=> b!770698 m!715943))

(declare-fun m!715945 () Bool)

(assert (=> b!770696 m!715945))

(assert (=> b!770696 m!715945))

(declare-fun m!715947 () Bool)

(assert (=> b!770696 m!715947))

(assert (=> b!770696 m!715945))

(declare-fun m!715949 () Bool)

(assert (=> b!770696 m!715949))

(assert (=> b!770715 m!715945))

(assert (=> b!770715 m!715945))

(declare-fun m!715951 () Bool)

(assert (=> b!770715 m!715951))

(declare-fun m!715953 () Bool)

(assert (=> b!770699 m!715953))

(declare-fun m!715955 () Bool)

(assert (=> b!770703 m!715955))

(declare-fun m!715957 () Bool)

(assert (=> start!66810 m!715957))

(declare-fun m!715959 () Bool)

(assert (=> start!66810 m!715959))

(declare-fun m!715961 () Bool)

(assert (=> b!770713 m!715961))

(declare-fun m!715963 () Bool)

(assert (=> b!770702 m!715963))

(declare-fun m!715965 () Bool)

(assert (=> b!770702 m!715965))

(declare-fun m!715967 () Bool)

(assert (=> b!770702 m!715967))

(assert (=> b!770702 m!715963))

(declare-fun m!715969 () Bool)

(assert (=> b!770702 m!715969))

(declare-fun m!715971 () Bool)

(assert (=> b!770702 m!715971))

(declare-fun m!715973 () Bool)

(assert (=> b!770707 m!715973))

(assert (=> b!770710 m!715945))

(assert (=> b!770710 m!715945))

(declare-fun m!715975 () Bool)

(assert (=> b!770710 m!715975))

(declare-fun m!715977 () Bool)

(assert (=> b!770712 m!715977))

(declare-fun m!715979 () Bool)

(assert (=> b!770712 m!715979))

(assert (=> b!770714 m!715945))

(assert (=> b!770714 m!715945))

(declare-fun m!715981 () Bool)

(assert (=> b!770714 m!715981))

(assert (=> b!770700 m!715945))

(assert (=> b!770700 m!715945))

(assert (=> b!770700 m!715947))

(declare-fun m!715983 () Bool)

(assert (=> b!770701 m!715983))

(assert (=> b!770708 m!715945))

(assert (=> b!770708 m!715945))

(declare-fun m!715985 () Bool)

(assert (=> b!770708 m!715985))

(assert (=> b!770708 m!715985))

(assert (=> b!770708 m!715945))

(declare-fun m!715987 () Bool)

(assert (=> b!770708 m!715987))

(assert (=> b!770704 m!715945))

(assert (=> b!770704 m!715945))

(declare-fun m!715989 () Bool)

(assert (=> b!770704 m!715989))

(assert (=> b!770706 m!715945))

(assert (=> b!770706 m!715945))

(declare-fun m!715991 () Bool)

(assert (=> b!770706 m!715991))

(declare-fun m!715993 () Bool)

(assert (=> b!770709 m!715993))

(push 1)

