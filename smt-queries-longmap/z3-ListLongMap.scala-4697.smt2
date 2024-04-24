; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65370 () Bool)

(assert start!65370)

(declare-datatypes ((SeekEntryResult!7372 0))(
  ( (MissingZero!7372 (index!31856 (_ BitVec 32))) (Found!7372 (index!31857 (_ BitVec 32))) (Intermediate!7372 (undefined!8184 Bool) (index!31858 (_ BitVec 32)) (x!63006 (_ BitVec 32))) (Undefined!7372) (MissingVacant!7372 (index!31859 (_ BitVec 32))) )
))
(declare-fun lt!328704 () SeekEntryResult!7372)

(declare-fun e!413977 () Bool)

(declare-fun b!740237 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41413 0))(
  ( (array!41414 (arr!19816 (Array (_ BitVec 32) (_ BitVec 64))) (size!20236 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41413)

(declare-fun lt!328691 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41413 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!740237 (= e!413977 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328691 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328704)))))

(declare-fun b!740238 () Bool)

(declare-datatypes ((Unit!25261 0))(
  ( (Unit!25262) )
))
(declare-fun e!413980 () Unit!25261)

(declare-fun Unit!25263 () Unit!25261)

(assert (=> b!740238 (= e!413980 Unit!25263)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!328696 () SeekEntryResult!7372)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41413 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!740238 (= lt!328696 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328698 () SeekEntryResult!7372)

(assert (=> b!740238 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328691 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328698)))

(declare-fun b!740239 () Bool)

(declare-fun e!413986 () Bool)

(declare-fun e!413979 () Bool)

(assert (=> b!740239 (= e!413986 e!413979)))

(declare-fun res!497527 () Bool)

(assert (=> b!740239 (=> res!497527 e!413979)))

(assert (=> b!740239 (= res!497527 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328691 #b00000000000000000000000000000000) (bvsge lt!328691 (size!20236 a!3186))))))

(declare-fun lt!328699 () Unit!25261)

(assert (=> b!740239 (= lt!328699 e!413980)))

(declare-fun c!81741 () Bool)

(declare-fun lt!328694 () Bool)

(assert (=> b!740239 (= c!81741 lt!328694)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740239 (= lt!328694 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740239 (= lt!328691 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!740240 () Bool)

(declare-fun Unit!25264 () Unit!25261)

(assert (=> b!740240 (= e!413980 Unit!25264)))

(assert (=> b!740240 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328691 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328704)))

(declare-fun b!740241 () Bool)

(declare-fun e!413981 () Bool)

(declare-fun e!413978 () Bool)

(assert (=> b!740241 (= e!413981 e!413978)))

(declare-fun res!497523 () Bool)

(assert (=> b!740241 (=> (not res!497523) (not e!413978))))

(declare-fun lt!328702 () SeekEntryResult!7372)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740241 (= res!497523 (or (= lt!328702 (MissingZero!7372 i!1173)) (= lt!328702 (MissingVacant!7372 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41413 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!740241 (= lt!328702 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740242 () Bool)

(declare-fun e!413984 () Bool)

(declare-fun e!413982 () Bool)

(assert (=> b!740242 (= e!413984 e!413982)))

(declare-fun res!497529 () Bool)

(assert (=> b!740242 (=> (not res!497529) (not e!413982))))

(declare-fun lt!328695 () SeekEntryResult!7372)

(declare-fun lt!328703 () SeekEntryResult!7372)

(assert (=> b!740242 (= res!497529 (= lt!328695 lt!328703))))

(declare-fun lt!328701 () (_ BitVec 64))

(declare-fun lt!328697 () array!41413)

(assert (=> b!740242 (= lt!328703 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328701 lt!328697 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740242 (= lt!328695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328701 mask!3328) lt!328701 lt!328697 mask!3328))))

(assert (=> b!740242 (= lt!328701 (select (store (arr!19816 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740242 (= lt!328697 (array!41414 (store (arr!19816 a!3186) i!1173 k0!2102) (size!20236 a!3186)))))

(declare-fun b!740243 () Bool)

(declare-fun res!497528 () Bool)

(assert (=> b!740243 (=> (not res!497528) (not e!413978))))

(declare-datatypes ((List!13725 0))(
  ( (Nil!13722) (Cons!13721 (h!14799 (_ BitVec 64)) (t!20032 List!13725)) )
))
(declare-fun arrayNoDuplicates!0 (array!41413 (_ BitVec 32) List!13725) Bool)

(assert (=> b!740243 (= res!497528 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13722))))

(declare-fun b!740244 () Bool)

(assert (=> b!740244 (= e!413977 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328691 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328698)))))

(declare-fun b!740245 () Bool)

(assert (=> b!740245 (= e!413982 (not e!413986))))

(declare-fun res!497537 () Bool)

(assert (=> b!740245 (=> res!497537 e!413986)))

(get-info :version)

(assert (=> b!740245 (= res!497537 (or (not ((_ is Intermediate!7372) lt!328703)) (bvsge x!1131 (x!63006 lt!328703))))))

(assert (=> b!740245 (= lt!328698 (Found!7372 j!159))))

(declare-fun e!413988 () Bool)

(assert (=> b!740245 e!413988))

(declare-fun res!497538 () Bool)

(assert (=> b!740245 (=> (not res!497538) (not e!413988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41413 (_ BitVec 32)) Bool)

(assert (=> b!740245 (= res!497538 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328693 () Unit!25261)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25261)

(assert (=> b!740245 (= lt!328693 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740246 () Bool)

(declare-fun res!497533 () Bool)

(assert (=> b!740246 (=> (not res!497533) (not e!413981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740246 (= res!497533 (validKeyInArray!0 k0!2102))))

(declare-fun b!740247 () Bool)

(declare-fun e!413983 () Bool)

(assert (=> b!740247 (= e!413983 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) (Found!7372 j!159)))))

(declare-fun b!740248 () Bool)

(declare-fun res!497539 () Bool)

(assert (=> b!740248 (=> (not res!497539) (not e!413981))))

(declare-fun arrayContainsKey!0 (array!41413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740248 (= res!497539 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740249 () Bool)

(declare-fun e!413985 () Bool)

(assert (=> b!740249 (= e!413988 e!413985)))

(declare-fun res!497536 () Bool)

(assert (=> b!740249 (=> (not res!497536) (not e!413985))))

(declare-fun lt!328700 () SeekEntryResult!7372)

(assert (=> b!740249 (= res!497536 (= (seekEntryOrOpen!0 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328700))))

(assert (=> b!740249 (= lt!328700 (Found!7372 j!159))))

(declare-fun b!740250 () Bool)

(assert (=> b!740250 (= e!413978 e!413984)))

(declare-fun res!497531 () Bool)

(assert (=> b!740250 (=> (not res!497531) (not e!413984))))

(assert (=> b!740250 (= res!497531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19816 a!3186) j!159) mask!3328) (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328704))))

(assert (=> b!740250 (= lt!328704 (Intermediate!7372 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740251 () Bool)

(declare-fun res!497522 () Bool)

(assert (=> b!740251 (=> (not res!497522) (not e!413981))))

(assert (=> b!740251 (= res!497522 (validKeyInArray!0 (select (arr!19816 a!3186) j!159)))))

(declare-fun b!740252 () Bool)

(declare-fun res!497534 () Bool)

(assert (=> b!740252 (=> res!497534 e!413979)))

(assert (=> b!740252 (= res!497534 e!413977)))

(declare-fun c!81742 () Bool)

(assert (=> b!740252 (= c!81742 lt!328694)))

(declare-fun b!740253 () Bool)

(assert (=> b!740253 (= e!413979 true)))

(declare-fun lt!328692 () SeekEntryResult!7372)

(assert (=> b!740253 (= lt!328692 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328691 lt!328701 lt!328697 mask!3328))))

(declare-fun b!740254 () Bool)

(declare-fun res!497535 () Bool)

(assert (=> b!740254 (=> (not res!497535) (not e!413978))))

(assert (=> b!740254 (= res!497535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740255 () Bool)

(declare-fun res!497525 () Bool)

(assert (=> b!740255 (=> (not res!497525) (not e!413981))))

(assert (=> b!740255 (= res!497525 (and (= (size!20236 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20236 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20236 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!497524 () Bool)

(assert (=> start!65370 (=> (not res!497524) (not e!413981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65370 (= res!497524 (validMask!0 mask!3328))))

(assert (=> start!65370 e!413981))

(assert (=> start!65370 true))

(declare-fun array_inv!15675 (array!41413) Bool)

(assert (=> start!65370 (array_inv!15675 a!3186)))

(declare-fun b!740256 () Bool)

(declare-fun res!497532 () Bool)

(assert (=> b!740256 (=> (not res!497532) (not e!413984))))

(assert (=> b!740256 (= res!497532 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19816 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740257 () Bool)

(declare-fun res!497526 () Bool)

(assert (=> b!740257 (=> (not res!497526) (not e!413978))))

(assert (=> b!740257 (= res!497526 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20236 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20236 a!3186))))))

(declare-fun b!740258 () Bool)

(assert (=> b!740258 (= e!413985 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328700))))

(declare-fun b!740259 () Bool)

(declare-fun res!497530 () Bool)

(assert (=> b!740259 (=> (not res!497530) (not e!413984))))

(assert (=> b!740259 (= res!497530 e!413983)))

(declare-fun c!81743 () Bool)

(assert (=> b!740259 (= c!81743 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740260 () Bool)

(assert (=> b!740260 (= e!413983 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328704))))

(assert (= (and start!65370 res!497524) b!740255))

(assert (= (and b!740255 res!497525) b!740251))

(assert (= (and b!740251 res!497522) b!740246))

(assert (= (and b!740246 res!497533) b!740248))

(assert (= (and b!740248 res!497539) b!740241))

(assert (= (and b!740241 res!497523) b!740254))

(assert (= (and b!740254 res!497535) b!740243))

(assert (= (and b!740243 res!497528) b!740257))

(assert (= (and b!740257 res!497526) b!740250))

(assert (= (and b!740250 res!497531) b!740256))

(assert (= (and b!740256 res!497532) b!740259))

(assert (= (and b!740259 c!81743) b!740260))

(assert (= (and b!740259 (not c!81743)) b!740247))

(assert (= (and b!740259 res!497530) b!740242))

(assert (= (and b!740242 res!497529) b!740245))

(assert (= (and b!740245 res!497538) b!740249))

(assert (= (and b!740249 res!497536) b!740258))

(assert (= (and b!740245 (not res!497537)) b!740239))

(assert (= (and b!740239 c!81741) b!740240))

(assert (= (and b!740239 (not c!81741)) b!740238))

(assert (= (and b!740239 (not res!497527)) b!740252))

(assert (= (and b!740252 c!81742) b!740237))

(assert (= (and b!740252 (not c!81742)) b!740244))

(assert (= (and b!740252 (not res!497534)) b!740253))

(declare-fun m!692019 () Bool)

(assert (=> b!740239 m!692019))

(declare-fun m!692021 () Bool)

(assert (=> b!740248 m!692021))

(declare-fun m!692023 () Bool)

(assert (=> b!740237 m!692023))

(assert (=> b!740237 m!692023))

(declare-fun m!692025 () Bool)

(assert (=> b!740237 m!692025))

(assert (=> b!740247 m!692023))

(assert (=> b!740247 m!692023))

(declare-fun m!692027 () Bool)

(assert (=> b!740247 m!692027))

(assert (=> b!740244 m!692023))

(assert (=> b!740244 m!692023))

(declare-fun m!692029 () Bool)

(assert (=> b!740244 m!692029))

(declare-fun m!692031 () Bool)

(assert (=> b!740253 m!692031))

(declare-fun m!692033 () Bool)

(assert (=> b!740256 m!692033))

(assert (=> b!740238 m!692023))

(assert (=> b!740238 m!692023))

(assert (=> b!740238 m!692027))

(assert (=> b!740238 m!692023))

(assert (=> b!740238 m!692029))

(declare-fun m!692035 () Bool)

(assert (=> b!740245 m!692035))

(declare-fun m!692037 () Bool)

(assert (=> b!740245 m!692037))

(assert (=> b!740249 m!692023))

(assert (=> b!740249 m!692023))

(declare-fun m!692039 () Bool)

(assert (=> b!740249 m!692039))

(declare-fun m!692041 () Bool)

(assert (=> b!740243 m!692041))

(declare-fun m!692043 () Bool)

(assert (=> b!740242 m!692043))

(declare-fun m!692045 () Bool)

(assert (=> b!740242 m!692045))

(declare-fun m!692047 () Bool)

(assert (=> b!740242 m!692047))

(assert (=> b!740242 m!692045))

(declare-fun m!692049 () Bool)

(assert (=> b!740242 m!692049))

(declare-fun m!692051 () Bool)

(assert (=> b!740242 m!692051))

(declare-fun m!692053 () Bool)

(assert (=> start!65370 m!692053))

(declare-fun m!692055 () Bool)

(assert (=> start!65370 m!692055))

(assert (=> b!740240 m!692023))

(assert (=> b!740240 m!692023))

(assert (=> b!740240 m!692025))

(assert (=> b!740250 m!692023))

(assert (=> b!740250 m!692023))

(declare-fun m!692057 () Bool)

(assert (=> b!740250 m!692057))

(assert (=> b!740250 m!692057))

(assert (=> b!740250 m!692023))

(declare-fun m!692059 () Bool)

(assert (=> b!740250 m!692059))

(assert (=> b!740258 m!692023))

(assert (=> b!740258 m!692023))

(declare-fun m!692061 () Bool)

(assert (=> b!740258 m!692061))

(declare-fun m!692063 () Bool)

(assert (=> b!740241 m!692063))

(assert (=> b!740260 m!692023))

(assert (=> b!740260 m!692023))

(declare-fun m!692065 () Bool)

(assert (=> b!740260 m!692065))

(declare-fun m!692067 () Bool)

(assert (=> b!740246 m!692067))

(assert (=> b!740251 m!692023))

(assert (=> b!740251 m!692023))

(declare-fun m!692069 () Bool)

(assert (=> b!740251 m!692069))

(declare-fun m!692071 () Bool)

(assert (=> b!740254 m!692071))

(check-sat (not b!740249) (not b!740239) (not b!740247) (not b!740237) (not b!740260) (not b!740243) (not b!740240) (not b!740253) (not b!740244) (not b!740241) (not b!740245) (not b!740242) (not b!740258) (not b!740238) (not b!740251) (not b!740246) (not b!740250) (not start!65370) (not b!740254) (not b!740248))
(check-sat)
