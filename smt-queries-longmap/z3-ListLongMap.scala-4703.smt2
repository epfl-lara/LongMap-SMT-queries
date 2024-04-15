; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65258 () Bool)

(assert start!65258)

(declare-fun b!740569 () Bool)

(declare-fun e!413997 () Bool)

(declare-fun e!414006 () Bool)

(assert (=> b!740569 (= e!413997 e!414006)))

(declare-fun res!498113 () Bool)

(assert (=> b!740569 (=> res!498113 e!414006)))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!740569 (= res!498113 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-datatypes ((array!41448 0))(
  ( (array!41449 (arr!19838 (Array (_ BitVec 32) (_ BitVec 64))) (size!20259 (_ BitVec 32))) )
))
(declare-fun lt!328899 () array!41448)

(declare-datatypes ((SeekEntryResult!7435 0))(
  ( (MissingZero!7435 (index!32108 (_ BitVec 32))) (Found!7435 (index!32109 (_ BitVec 32))) (Intermediate!7435 (undefined!8247 Bool) (index!32110 (_ BitVec 32)) (x!63100 (_ BitVec 32))) (Undefined!7435) (MissingVacant!7435 (index!32111 (_ BitVec 32))) )
))
(declare-fun lt!328900 () SeekEntryResult!7435)

(declare-fun lt!328898 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41448 (_ BitVec 32)) SeekEntryResult!7435)

(assert (=> b!740569 (= (seekEntryOrOpen!0 lt!328898 lt!328899 mask!3328) lt!328900)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!41448)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!328896 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((Unit!25316 0))(
  ( (Unit!25317) )
))
(declare-fun lt!328907 () Unit!25316)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41448 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25316)

(assert (=> b!740569 (= lt!328907 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!328896 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740570 () Bool)

(declare-fun res!498110 () Bool)

(declare-fun e!413996 () Bool)

(assert (=> b!740570 (=> (not res!498110) (not e!413996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740570 (= res!498110 (validKeyInArray!0 (select (arr!19838 a!3186) j!159)))))

(declare-fun b!740571 () Bool)

(declare-fun res!498116 () Bool)

(declare-fun e!414000 () Bool)

(assert (=> b!740571 (=> (not res!498116) (not e!414000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41448 (_ BitVec 32)) Bool)

(assert (=> b!740571 (= res!498116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!328903 () SeekEntryResult!7435)

(declare-fun e!413998 () Bool)

(declare-fun b!740572 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41448 (_ BitVec 32)) SeekEntryResult!7435)

(assert (=> b!740572 (= e!413998 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!328903))))

(declare-fun b!740573 () Bool)

(declare-fun res!498121 () Bool)

(assert (=> b!740573 (=> (not res!498121) (not e!413996))))

(assert (=> b!740573 (= res!498121 (and (= (size!20259 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20259 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20259 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740574 () Bool)

(declare-fun e!414005 () Unit!25316)

(declare-fun Unit!25318 () Unit!25316)

(assert (=> b!740574 (= e!414005 Unit!25318)))

(declare-fun lt!328895 () SeekEntryResult!7435)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41448 (_ BitVec 32)) SeekEntryResult!7435)

(assert (=> b!740574 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328896 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!328895)))

(declare-fun b!740575 () Bool)

(declare-fun e!413999 () Bool)

(declare-fun e!414003 () Bool)

(assert (=> b!740575 (= e!413999 (not e!414003))))

(declare-fun res!498122 () Bool)

(assert (=> b!740575 (=> res!498122 e!414003)))

(declare-fun lt!328897 () SeekEntryResult!7435)

(get-info :version)

(assert (=> b!740575 (= res!498122 (or (not ((_ is Intermediate!7435) lt!328897)) (bvsge x!1131 (x!63100 lt!328897))))))

(assert (=> b!740575 (= lt!328900 (Found!7435 j!159))))

(declare-fun e!414007 () Bool)

(assert (=> b!740575 e!414007))

(declare-fun res!498124 () Bool)

(assert (=> b!740575 (=> (not res!498124) (not e!414007))))

(assert (=> b!740575 (= res!498124 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328906 () Unit!25316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25316)

(assert (=> b!740575 (= lt!328906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!414002 () Bool)

(declare-fun b!740576 () Bool)

(assert (=> b!740576 (= e!414002 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328896 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!328895)))))

(declare-fun b!740577 () Bool)

(declare-fun res!498129 () Bool)

(assert (=> b!740577 (=> (not res!498129) (not e!413996))))

(assert (=> b!740577 (= res!498129 (validKeyInArray!0 k0!2102))))

(declare-fun e!413995 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!740578 () Bool)

(assert (=> b!740578 (= e!413995 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!328895))))

(declare-fun b!740579 () Bool)

(assert (=> b!740579 (= e!414002 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328896 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!328900)))))

(declare-fun b!740580 () Bool)

(declare-fun res!498115 () Bool)

(assert (=> b!740580 (=> res!498115 e!413997)))

(assert (=> b!740580 (= res!498115 e!414002)))

(declare-fun c!81611 () Bool)

(declare-fun lt!328904 () Bool)

(assert (=> b!740580 (= c!81611 lt!328904)))

(declare-fun b!740581 () Bool)

(assert (=> b!740581 (= e!413995 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) (Found!7435 j!159)))))

(declare-fun b!740582 () Bool)

(declare-fun res!498123 () Bool)

(declare-fun e!414004 () Bool)

(assert (=> b!740582 (=> (not res!498123) (not e!414004))))

(assert (=> b!740582 (= res!498123 e!413995)))

(declare-fun c!81612 () Bool)

(assert (=> b!740582 (= c!81612 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740583 () Bool)

(declare-fun Unit!25319 () Unit!25316)

(assert (=> b!740583 (= e!414005 Unit!25319)))

(declare-fun lt!328902 () SeekEntryResult!7435)

(assert (=> b!740583 (= lt!328902 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740583 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328896 resIntermediateIndex!5 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!328900)))

(declare-fun b!740584 () Bool)

(assert (=> b!740584 (= e!414007 e!413998)))

(declare-fun res!498120 () Bool)

(assert (=> b!740584 (=> (not res!498120) (not e!413998))))

(assert (=> b!740584 (= res!498120 (= (seekEntryOrOpen!0 (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!328903))))

(assert (=> b!740584 (= lt!328903 (Found!7435 j!159))))

(declare-fun b!740585 () Bool)

(declare-fun res!498117 () Bool)

(assert (=> b!740585 (=> (not res!498117) (not e!414004))))

(assert (=> b!740585 (= res!498117 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19838 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740586 () Bool)

(assert (=> b!740586 (= e!414003 e!413997)))

(declare-fun res!498125 () Bool)

(assert (=> b!740586 (=> res!498125 e!413997)))

(assert (=> b!740586 (= res!498125 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328896 #b00000000000000000000000000000000) (bvsge lt!328896 (size!20259 a!3186))))))

(declare-fun lt!328905 () Unit!25316)

(assert (=> b!740586 (= lt!328905 e!414005)))

(declare-fun c!81610 () Bool)

(assert (=> b!740586 (= c!81610 lt!328904)))

(assert (=> b!740586 (= lt!328904 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740586 (= lt!328896 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!498111 () Bool)

(assert (=> start!65258 (=> (not res!498111) (not e!413996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65258 (= res!498111 (validMask!0 mask!3328))))

(assert (=> start!65258 e!413996))

(assert (=> start!65258 true))

(declare-fun array_inv!15721 (array!41448) Bool)

(assert (=> start!65258 (array_inv!15721 a!3186)))

(declare-fun b!740587 () Bool)

(declare-fun res!498112 () Bool)

(assert (=> b!740587 (=> res!498112 e!413997)))

(declare-fun lt!328894 () SeekEntryResult!7435)

(assert (=> b!740587 (= res!498112 (not (= lt!328894 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328896 lt!328898 lt!328899 mask!3328))))))

(declare-fun b!740588 () Bool)

(declare-fun res!498127 () Bool)

(assert (=> b!740588 (=> (not res!498127) (not e!414000))))

(assert (=> b!740588 (= res!498127 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20259 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20259 a!3186))))))

(declare-fun b!740589 () Bool)

(assert (=> b!740589 (= e!413996 e!414000)))

(declare-fun res!498128 () Bool)

(assert (=> b!740589 (=> (not res!498128) (not e!414000))))

(declare-fun lt!328901 () SeekEntryResult!7435)

(assert (=> b!740589 (= res!498128 (or (= lt!328901 (MissingZero!7435 i!1173)) (= lt!328901 (MissingVacant!7435 i!1173))))))

(assert (=> b!740589 (= lt!328901 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740590 () Bool)

(assert (=> b!740590 (= e!414006 (validKeyInArray!0 lt!328898))))

(declare-fun b!740591 () Bool)

(declare-fun res!498119 () Bool)

(assert (=> b!740591 (=> (not res!498119) (not e!413996))))

(declare-fun arrayContainsKey!0 (array!41448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740591 (= res!498119 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740592 () Bool)

(assert (=> b!740592 (= e!414004 e!413999)))

(declare-fun res!498126 () Bool)

(assert (=> b!740592 (=> (not res!498126) (not e!413999))))

(assert (=> b!740592 (= res!498126 (= lt!328894 lt!328897))))

(assert (=> b!740592 (= lt!328897 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328898 lt!328899 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740592 (= lt!328894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328898 mask!3328) lt!328898 lt!328899 mask!3328))))

(assert (=> b!740592 (= lt!328898 (select (store (arr!19838 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740592 (= lt!328899 (array!41449 (store (arr!19838 a!3186) i!1173 k0!2102) (size!20259 a!3186)))))

(declare-fun b!740593 () Bool)

(assert (=> b!740593 (= e!414000 e!414004)))

(declare-fun res!498114 () Bool)

(assert (=> b!740593 (=> (not res!498114) (not e!414004))))

(assert (=> b!740593 (= res!498114 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19838 a!3186) j!159) mask!3328) (select (arr!19838 a!3186) j!159) a!3186 mask!3328) lt!328895))))

(assert (=> b!740593 (= lt!328895 (Intermediate!7435 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740594 () Bool)

(declare-fun res!498118 () Bool)

(assert (=> b!740594 (=> (not res!498118) (not e!414000))))

(declare-datatypes ((List!13879 0))(
  ( (Nil!13876) (Cons!13875 (h!14947 (_ BitVec 64)) (t!20185 List!13879)) )
))
(declare-fun arrayNoDuplicates!0 (array!41448 (_ BitVec 32) List!13879) Bool)

(assert (=> b!740594 (= res!498118 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13876))))

(assert (= (and start!65258 res!498111) b!740573))

(assert (= (and b!740573 res!498121) b!740570))

(assert (= (and b!740570 res!498110) b!740577))

(assert (= (and b!740577 res!498129) b!740591))

(assert (= (and b!740591 res!498119) b!740589))

(assert (= (and b!740589 res!498128) b!740571))

(assert (= (and b!740571 res!498116) b!740594))

(assert (= (and b!740594 res!498118) b!740588))

(assert (= (and b!740588 res!498127) b!740593))

(assert (= (and b!740593 res!498114) b!740585))

(assert (= (and b!740585 res!498117) b!740582))

(assert (= (and b!740582 c!81612) b!740578))

(assert (= (and b!740582 (not c!81612)) b!740581))

(assert (= (and b!740582 res!498123) b!740592))

(assert (= (and b!740592 res!498126) b!740575))

(assert (= (and b!740575 res!498124) b!740584))

(assert (= (and b!740584 res!498120) b!740572))

(assert (= (and b!740575 (not res!498122)) b!740586))

(assert (= (and b!740586 c!81610) b!740574))

(assert (= (and b!740586 (not c!81610)) b!740583))

(assert (= (and b!740586 (not res!498125)) b!740580))

(assert (= (and b!740580 c!81611) b!740576))

(assert (= (and b!740580 (not c!81611)) b!740579))

(assert (= (and b!740580 (not res!498115)) b!740587))

(assert (= (and b!740587 (not res!498112)) b!740569))

(assert (= (and b!740569 (not res!498113)) b!740590))

(declare-fun m!691109 () Bool)

(assert (=> b!740576 m!691109))

(assert (=> b!740576 m!691109))

(declare-fun m!691111 () Bool)

(assert (=> b!740576 m!691111))

(declare-fun m!691113 () Bool)

(assert (=> b!740586 m!691113))

(assert (=> b!740584 m!691109))

(assert (=> b!740584 m!691109))

(declare-fun m!691115 () Bool)

(assert (=> b!740584 m!691115))

(declare-fun m!691117 () Bool)

(assert (=> b!740577 m!691117))

(declare-fun m!691119 () Bool)

(assert (=> b!740590 m!691119))

(declare-fun m!691121 () Bool)

(assert (=> b!740594 m!691121))

(declare-fun m!691123 () Bool)

(assert (=> b!740589 m!691123))

(declare-fun m!691125 () Bool)

(assert (=> b!740585 m!691125))

(assert (=> b!740583 m!691109))

(assert (=> b!740583 m!691109))

(declare-fun m!691127 () Bool)

(assert (=> b!740583 m!691127))

(assert (=> b!740583 m!691109))

(declare-fun m!691129 () Bool)

(assert (=> b!740583 m!691129))

(assert (=> b!740574 m!691109))

(assert (=> b!740574 m!691109))

(assert (=> b!740574 m!691111))

(declare-fun m!691131 () Bool)

(assert (=> b!740575 m!691131))

(declare-fun m!691133 () Bool)

(assert (=> b!740575 m!691133))

(assert (=> b!740593 m!691109))

(assert (=> b!740593 m!691109))

(declare-fun m!691135 () Bool)

(assert (=> b!740593 m!691135))

(assert (=> b!740593 m!691135))

(assert (=> b!740593 m!691109))

(declare-fun m!691137 () Bool)

(assert (=> b!740593 m!691137))

(assert (=> b!740570 m!691109))

(assert (=> b!740570 m!691109))

(declare-fun m!691139 () Bool)

(assert (=> b!740570 m!691139))

(assert (=> b!740578 m!691109))

(assert (=> b!740578 m!691109))

(declare-fun m!691141 () Bool)

(assert (=> b!740578 m!691141))

(assert (=> b!740579 m!691109))

(assert (=> b!740579 m!691109))

(assert (=> b!740579 m!691129))

(declare-fun m!691143 () Bool)

(assert (=> b!740591 m!691143))

(assert (=> b!740572 m!691109))

(assert (=> b!740572 m!691109))

(declare-fun m!691145 () Bool)

(assert (=> b!740572 m!691145))

(declare-fun m!691147 () Bool)

(assert (=> b!740569 m!691147))

(declare-fun m!691149 () Bool)

(assert (=> b!740569 m!691149))

(declare-fun m!691151 () Bool)

(assert (=> start!65258 m!691151))

(declare-fun m!691153 () Bool)

(assert (=> start!65258 m!691153))

(declare-fun m!691155 () Bool)

(assert (=> b!740587 m!691155))

(declare-fun m!691157 () Bool)

(assert (=> b!740571 m!691157))

(assert (=> b!740581 m!691109))

(assert (=> b!740581 m!691109))

(assert (=> b!740581 m!691127))

(declare-fun m!691159 () Bool)

(assert (=> b!740592 m!691159))

(declare-fun m!691161 () Bool)

(assert (=> b!740592 m!691161))

(declare-fun m!691163 () Bool)

(assert (=> b!740592 m!691163))

(declare-fun m!691165 () Bool)

(assert (=> b!740592 m!691165))

(assert (=> b!740592 m!691159))

(declare-fun m!691167 () Bool)

(assert (=> b!740592 m!691167))

(check-sat (not b!740570) (not b!740591) (not b!740575) (not b!740586) (not b!740593) (not b!740589) (not b!740587) (not b!740579) (not b!740590) (not b!740594) (not b!740584) (not b!740574) (not b!740571) (not b!740581) (not b!740578) (not b!740583) (not b!740576) (not b!740592) (not start!65258) (not b!740569) (not b!740577) (not b!740572))
(check-sat)
