; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65448 () Bool)

(assert start!65448)

(declare-datatypes ((array!41491 0))(
  ( (array!41492 (arr!19855 (Array (_ BitVec 32) (_ BitVec 64))) (size!20275 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41491)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!415170 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7411 0))(
  ( (MissingZero!7411 (index!32012 (_ BitVec 32))) (Found!7411 (index!32013 (_ BitVec 32))) (Intermediate!7411 (undefined!8223 Bool) (index!32014 (_ BitVec 32)) (x!63149 (_ BitVec 32))) (Undefined!7411) (MissingVacant!7411 (index!32015 (_ BitVec 32))) )
))
(declare-fun lt!329935 () SeekEntryResult!7411)

(declare-fun b!742698 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41491 (_ BitVec 32)) SeekEntryResult!7411)

(assert (=> b!742698 (= e!415170 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19855 a!3186) j!159) a!3186 mask!3328) lt!329935))))

(declare-fun b!742699 () Bool)

(declare-fun res!499519 () Bool)

(declare-fun e!415169 () Bool)

(assert (=> b!742699 (=> (not res!499519) (not e!415169))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742699 (= res!499519 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742700 () Bool)

(declare-fun res!499518 () Bool)

(declare-fun e!415167 () Bool)

(assert (=> b!742700 (=> (not res!499518) (not e!415167))))

(assert (=> b!742700 (= res!499518 e!415170)))

(declare-fun c!81980 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742700 (= c!81980 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742701 () Bool)

(declare-fun e!415172 () Bool)

(assert (=> b!742701 (= e!415167 e!415172)))

(declare-fun res!499510 () Bool)

(assert (=> b!742701 (=> (not res!499510) (not e!415172))))

(declare-fun lt!329937 () array!41491)

(declare-fun lt!329939 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742701 (= res!499510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329939 mask!3328) lt!329939 lt!329937 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329939 lt!329937 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742701 (= lt!329939 (select (store (arr!19855 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742701 (= lt!329937 (array!41492 (store (arr!19855 a!3186) i!1173 k0!2102) (size!20275 a!3186)))))

(declare-fun b!742702 () Bool)

(declare-fun res!499511 () Bool)

(declare-fun e!415166 () Bool)

(assert (=> b!742702 (=> (not res!499511) (not e!415166))))

(declare-datatypes ((List!13764 0))(
  ( (Nil!13761) (Cons!13760 (h!14838 (_ BitVec 64)) (t!20071 List!13764)) )
))
(declare-fun arrayNoDuplicates!0 (array!41491 (_ BitVec 32) List!13764) Bool)

(assert (=> b!742702 (= res!499511 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13761))))

(declare-fun b!742703 () Bool)

(declare-fun res!499508 () Bool)

(assert (=> b!742703 (=> (not res!499508) (not e!415169))))

(assert (=> b!742703 (= res!499508 (and (= (size!20275 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20275 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20275 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742704 () Bool)

(declare-fun res!499506 () Bool)

(assert (=> b!742704 (=> (not res!499506) (not e!415166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41491 (_ BitVec 32)) Bool)

(assert (=> b!742704 (= res!499506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742705 () Bool)

(assert (=> b!742705 (= e!415172 (not true))))

(declare-fun e!415171 () Bool)

(assert (=> b!742705 e!415171))

(declare-fun res!499505 () Bool)

(assert (=> b!742705 (=> (not res!499505) (not e!415171))))

(assert (=> b!742705 (= res!499505 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25381 0))(
  ( (Unit!25382) )
))
(declare-fun lt!329938 () Unit!25381)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25381)

(assert (=> b!742705 (= lt!329938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!329940 () SeekEntryResult!7411)

(declare-fun b!742707 () Bool)

(declare-fun e!415173 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41491 (_ BitVec 32)) SeekEntryResult!7411)

(assert (=> b!742707 (= e!415173 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19855 a!3186) j!159) a!3186 mask!3328) lt!329940))))

(declare-fun b!742708 () Bool)

(declare-fun res!499513 () Bool)

(assert (=> b!742708 (=> (not res!499513) (not e!415167))))

(assert (=> b!742708 (= res!499513 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19855 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742709 () Bool)

(declare-fun res!499512 () Bool)

(assert (=> b!742709 (=> (not res!499512) (not e!415166))))

(assert (=> b!742709 (= res!499512 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20275 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20275 a!3186))))))

(declare-fun b!742710 () Bool)

(assert (=> b!742710 (= e!415166 e!415167)))

(declare-fun res!499509 () Bool)

(assert (=> b!742710 (=> (not res!499509) (not e!415167))))

(assert (=> b!742710 (= res!499509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19855 a!3186) j!159) mask!3328) (select (arr!19855 a!3186) j!159) a!3186 mask!3328) lt!329935))))

(assert (=> b!742710 (= lt!329935 (Intermediate!7411 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742711 () Bool)

(assert (=> b!742711 (= e!415169 e!415166)))

(declare-fun res!499507 () Bool)

(assert (=> b!742711 (=> (not res!499507) (not e!415166))))

(declare-fun lt!329936 () SeekEntryResult!7411)

(assert (=> b!742711 (= res!499507 (or (= lt!329936 (MissingZero!7411 i!1173)) (= lt!329936 (MissingVacant!7411 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41491 (_ BitVec 32)) SeekEntryResult!7411)

(assert (=> b!742711 (= lt!329936 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742712 () Bool)

(assert (=> b!742712 (= e!415171 e!415173)))

(declare-fun res!499515 () Bool)

(assert (=> b!742712 (=> (not res!499515) (not e!415173))))

(assert (=> b!742712 (= res!499515 (= (seekEntryOrOpen!0 (select (arr!19855 a!3186) j!159) a!3186 mask!3328) lt!329940))))

(assert (=> b!742712 (= lt!329940 (Found!7411 j!159))))

(declare-fun b!742713 () Bool)

(assert (=> b!742713 (= e!415170 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19855 a!3186) j!159) a!3186 mask!3328) (Found!7411 j!159)))))

(declare-fun b!742714 () Bool)

(declare-fun res!499517 () Bool)

(assert (=> b!742714 (=> (not res!499517) (not e!415169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742714 (= res!499517 (validKeyInArray!0 k0!2102))))

(declare-fun res!499516 () Bool)

(assert (=> start!65448 (=> (not res!499516) (not e!415169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65448 (= res!499516 (validMask!0 mask!3328))))

(assert (=> start!65448 e!415169))

(assert (=> start!65448 true))

(declare-fun array_inv!15714 (array!41491) Bool)

(assert (=> start!65448 (array_inv!15714 a!3186)))

(declare-fun b!742706 () Bool)

(declare-fun res!499514 () Bool)

(assert (=> b!742706 (=> (not res!499514) (not e!415169))))

(assert (=> b!742706 (= res!499514 (validKeyInArray!0 (select (arr!19855 a!3186) j!159)))))

(assert (= (and start!65448 res!499516) b!742703))

(assert (= (and b!742703 res!499508) b!742706))

(assert (= (and b!742706 res!499514) b!742714))

(assert (= (and b!742714 res!499517) b!742699))

(assert (= (and b!742699 res!499519) b!742711))

(assert (= (and b!742711 res!499507) b!742704))

(assert (= (and b!742704 res!499506) b!742702))

(assert (= (and b!742702 res!499511) b!742709))

(assert (= (and b!742709 res!499512) b!742710))

(assert (= (and b!742710 res!499509) b!742708))

(assert (= (and b!742708 res!499513) b!742700))

(assert (= (and b!742700 c!81980) b!742698))

(assert (= (and b!742700 (not c!81980)) b!742713))

(assert (= (and b!742700 res!499518) b!742701))

(assert (= (and b!742701 res!499510) b!742705))

(assert (= (and b!742705 res!499505) b!742712))

(assert (= (and b!742712 res!499515) b!742707))

(declare-fun m!694035 () Bool)

(assert (=> b!742712 m!694035))

(assert (=> b!742712 m!694035))

(declare-fun m!694037 () Bool)

(assert (=> b!742712 m!694037))

(declare-fun m!694039 () Bool)

(assert (=> b!742705 m!694039))

(declare-fun m!694041 () Bool)

(assert (=> b!742705 m!694041))

(assert (=> b!742706 m!694035))

(assert (=> b!742706 m!694035))

(declare-fun m!694043 () Bool)

(assert (=> b!742706 m!694043))

(assert (=> b!742698 m!694035))

(assert (=> b!742698 m!694035))

(declare-fun m!694045 () Bool)

(assert (=> b!742698 m!694045))

(assert (=> b!742707 m!694035))

(assert (=> b!742707 m!694035))

(declare-fun m!694047 () Bool)

(assert (=> b!742707 m!694047))

(declare-fun m!694049 () Bool)

(assert (=> b!742711 m!694049))

(declare-fun m!694051 () Bool)

(assert (=> b!742714 m!694051))

(declare-fun m!694053 () Bool)

(assert (=> b!742704 m!694053))

(assert (=> b!742710 m!694035))

(assert (=> b!742710 m!694035))

(declare-fun m!694055 () Bool)

(assert (=> b!742710 m!694055))

(assert (=> b!742710 m!694055))

(assert (=> b!742710 m!694035))

(declare-fun m!694057 () Bool)

(assert (=> b!742710 m!694057))

(declare-fun m!694059 () Bool)

(assert (=> b!742699 m!694059))

(declare-fun m!694061 () Bool)

(assert (=> b!742708 m!694061))

(assert (=> b!742713 m!694035))

(assert (=> b!742713 m!694035))

(declare-fun m!694063 () Bool)

(assert (=> b!742713 m!694063))

(declare-fun m!694065 () Bool)

(assert (=> b!742701 m!694065))

(declare-fun m!694067 () Bool)

(assert (=> b!742701 m!694067))

(declare-fun m!694069 () Bool)

(assert (=> b!742701 m!694069))

(declare-fun m!694071 () Bool)

(assert (=> b!742701 m!694071))

(declare-fun m!694073 () Bool)

(assert (=> b!742701 m!694073))

(assert (=> b!742701 m!694067))

(declare-fun m!694075 () Bool)

(assert (=> b!742702 m!694075))

(declare-fun m!694077 () Bool)

(assert (=> start!65448 m!694077))

(declare-fun m!694079 () Bool)

(assert (=> start!65448 m!694079))

(check-sat (not b!742699) (not b!742702) (not b!742712) (not b!742698) (not b!742707) (not b!742711) (not b!742704) (not b!742714) (not b!742701) (not start!65448) (not b!742706) (not b!742705) (not b!742710) (not b!742713))
(check-sat)
