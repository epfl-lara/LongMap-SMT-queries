; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65258 () Bool)

(assert start!65258)

(declare-fun b!740068 () Bool)

(declare-fun e!413796 () Bool)

(declare-fun e!413794 () Bool)

(assert (=> b!740068 (= e!413796 (not e!413794))))

(declare-fun res!497664 () Bool)

(assert (=> b!740068 (=> res!497664 e!413794)))

(declare-datatypes ((SeekEntryResult!7429 0))(
  ( (MissingZero!7429 (index!32084 (_ BitVec 32))) (Found!7429 (index!32085 (_ BitVec 32))) (Intermediate!7429 (undefined!8241 Bool) (index!32086 (_ BitVec 32)) (x!63067 (_ BitVec 32))) (Undefined!7429) (MissingVacant!7429 (index!32087 (_ BitVec 32))) )
))
(declare-fun lt!328724 () SeekEntryResult!7429)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!740068 (= res!497664 (or (not (is-Intermediate!7429 lt!328724)) (bvsge x!1131 (x!63067 lt!328724))))))

(declare-fun lt!328721 () SeekEntryResult!7429)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!740068 (= lt!328721 (Found!7429 j!159))))

(declare-fun e!413798 () Bool)

(assert (=> b!740068 e!413798))

(declare-fun res!497649 () Bool)

(assert (=> b!740068 (=> (not res!497649) (not e!413798))))

(declare-datatypes ((array!41431 0))(
  ( (array!41432 (arr!19829 (Array (_ BitVec 32) (_ BitVec 64))) (size!20250 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41431)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41431 (_ BitVec 32)) Bool)

(assert (=> b!740068 (= res!497649 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25312 0))(
  ( (Unit!25313) )
))
(declare-fun lt!328714 () Unit!25312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25312)

(assert (=> b!740068 (= lt!328714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740069 () Bool)

(declare-fun res!497656 () Bool)

(declare-fun e!413792 () Bool)

(assert (=> b!740069 (=> res!497656 e!413792)))

(declare-fun e!413788 () Bool)

(assert (=> b!740069 (= res!497656 e!413788)))

(declare-fun c!81591 () Bool)

(declare-fun lt!328715 () Bool)

(assert (=> b!740069 (= c!81591 lt!328715)))

(declare-fun b!740070 () Bool)

(declare-fun e!413793 () Unit!25312)

(declare-fun Unit!25314 () Unit!25312)

(assert (=> b!740070 (= e!413793 Unit!25314)))

(declare-fun lt!328722 () SeekEntryResult!7429)

(declare-fun lt!328719 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41431 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!740070 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328719 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328722)))

(declare-fun b!740071 () Bool)

(declare-fun e!413789 () Bool)

(declare-fun e!413787 () Bool)

(assert (=> b!740071 (= e!413789 e!413787)))

(declare-fun res!497665 () Bool)

(assert (=> b!740071 (=> (not res!497665) (not e!413787))))

(declare-fun lt!328725 () SeekEntryResult!7429)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740071 (= res!497665 (or (= lt!328725 (MissingZero!7429 i!1173)) (= lt!328725 (MissingVacant!7429 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41431 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!740071 (= lt!328725 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!740072 () Bool)

(declare-fun Unit!25315 () Unit!25312)

(assert (=> b!740072 (= e!413793 Unit!25315)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!328720 () SeekEntryResult!7429)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41431 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!740072 (= lt!328720 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740072 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328719 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328721)))

(declare-fun res!497663 () Bool)

(assert (=> start!65258 (=> (not res!497663) (not e!413789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65258 (= res!497663 (validMask!0 mask!3328))))

(assert (=> start!65258 e!413789))

(assert (=> start!65258 true))

(declare-fun array_inv!15625 (array!41431) Bool)

(assert (=> start!65258 (array_inv!15625 a!3186)))

(declare-fun b!740073 () Bool)

(declare-fun res!497657 () Bool)

(assert (=> b!740073 (=> (not res!497657) (not e!413789))))

(assert (=> b!740073 (= res!497657 (and (= (size!20250 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20250 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20250 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740074 () Bool)

(declare-fun res!497651 () Bool)

(declare-fun e!413791 () Bool)

(assert (=> b!740074 (=> (not res!497651) (not e!413791))))

(declare-fun e!413797 () Bool)

(assert (=> b!740074 (= res!497651 e!413797)))

(declare-fun c!81590 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740074 (= c!81590 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740075 () Bool)

(assert (=> b!740075 (= e!413788 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328719 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328721)))))

(declare-fun b!740076 () Bool)

(declare-fun e!413790 () Bool)

(assert (=> b!740076 (= e!413798 e!413790)))

(declare-fun res!497654 () Bool)

(assert (=> b!740076 (=> (not res!497654) (not e!413790))))

(declare-fun lt!328718 () SeekEntryResult!7429)

(assert (=> b!740076 (= res!497654 (= (seekEntryOrOpen!0 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328718))))

(assert (=> b!740076 (= lt!328718 (Found!7429 j!159))))

(declare-fun b!740077 () Bool)

(declare-fun res!497652 () Bool)

(assert (=> b!740077 (=> (not res!497652) (not e!413787))))

(assert (=> b!740077 (= res!497652 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20250 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20250 a!3186))))))

(declare-fun b!740078 () Bool)

(assert (=> b!740078 (= e!413797 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328722))))

(declare-fun b!740079 () Bool)

(assert (=> b!740079 (= e!413794 e!413792)))

(declare-fun res!497658 () Bool)

(assert (=> b!740079 (=> res!497658 e!413792)))

(assert (=> b!740079 (= res!497658 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328719 #b00000000000000000000000000000000) (bvsge lt!328719 (size!20250 a!3186))))))

(declare-fun lt!328716 () Unit!25312)

(assert (=> b!740079 (= lt!328716 e!413793)))

(declare-fun c!81592 () Bool)

(assert (=> b!740079 (= c!81592 lt!328715)))

(assert (=> b!740079 (= lt!328715 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740079 (= lt!328719 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740080 () Bool)

(assert (=> b!740080 (= e!413787 e!413791)))

(declare-fun res!497660 () Bool)

(assert (=> b!740080 (=> (not res!497660) (not e!413791))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740080 (= res!497660 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19829 a!3186) j!159) mask!3328) (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328722))))

(assert (=> b!740080 (= lt!328722 (Intermediate!7429 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740081 () Bool)

(declare-fun res!497661 () Bool)

(assert (=> b!740081 (=> (not res!497661) (not e!413789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740081 (= res!497661 (validKeyInArray!0 k!2102))))

(declare-fun b!740082 () Bool)

(declare-fun res!497666 () Bool)

(assert (=> b!740082 (=> (not res!497666) (not e!413787))))

(declare-datatypes ((List!13831 0))(
  ( (Nil!13828) (Cons!13827 (h!14899 (_ BitVec 64)) (t!20146 List!13831)) )
))
(declare-fun arrayNoDuplicates!0 (array!41431 (_ BitVec 32) List!13831) Bool)

(assert (=> b!740082 (= res!497666 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13828))))

(declare-fun b!740083 () Bool)

(assert (=> b!740083 (= e!413791 e!413796)))

(declare-fun res!497655 () Bool)

(assert (=> b!740083 (=> (not res!497655) (not e!413796))))

(declare-fun lt!328726 () SeekEntryResult!7429)

(assert (=> b!740083 (= res!497655 (= lt!328726 lt!328724))))

(declare-fun lt!328717 () (_ BitVec 64))

(declare-fun lt!328727 () array!41431)

(assert (=> b!740083 (= lt!328724 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328717 lt!328727 mask!3328))))

(assert (=> b!740083 (= lt!328726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328717 mask!3328) lt!328717 lt!328727 mask!3328))))

(assert (=> b!740083 (= lt!328717 (select (store (arr!19829 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740083 (= lt!328727 (array!41432 (store (arr!19829 a!3186) i!1173 k!2102) (size!20250 a!3186)))))

(declare-fun b!740084 () Bool)

(declare-fun res!497653 () Bool)

(assert (=> b!740084 (=> (not res!497653) (not e!413787))))

(assert (=> b!740084 (= res!497653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740085 () Bool)

(assert (=> b!740085 (= e!413790 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328718))))

(declare-fun b!740086 () Bool)

(declare-fun res!497662 () Bool)

(assert (=> b!740086 (=> (not res!497662) (not e!413789))))

(assert (=> b!740086 (= res!497662 (validKeyInArray!0 (select (arr!19829 a!3186) j!159)))))

(declare-fun b!740087 () Bool)

(assert (=> b!740087 (= e!413797 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) (Found!7429 j!159)))))

(declare-fun b!740088 () Bool)

(assert (=> b!740088 (= e!413788 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328719 (select (arr!19829 a!3186) j!159) a!3186 mask!3328) lt!328722)))))

(declare-fun b!740089 () Bool)

(assert (=> b!740089 (= e!413792 true)))

(declare-fun lt!328723 () SeekEntryResult!7429)

(assert (=> b!740089 (= lt!328723 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328719 lt!328717 lt!328727 mask!3328))))

(declare-fun b!740090 () Bool)

(declare-fun res!497659 () Bool)

(assert (=> b!740090 (=> (not res!497659) (not e!413789))))

(declare-fun arrayContainsKey!0 (array!41431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740090 (= res!497659 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740091 () Bool)

(declare-fun res!497650 () Bool)

(assert (=> b!740091 (=> (not res!497650) (not e!413791))))

(assert (=> b!740091 (= res!497650 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19829 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65258 res!497663) b!740073))

(assert (= (and b!740073 res!497657) b!740086))

(assert (= (and b!740086 res!497662) b!740081))

(assert (= (and b!740081 res!497661) b!740090))

(assert (= (and b!740090 res!497659) b!740071))

(assert (= (and b!740071 res!497665) b!740084))

(assert (= (and b!740084 res!497653) b!740082))

(assert (= (and b!740082 res!497666) b!740077))

(assert (= (and b!740077 res!497652) b!740080))

(assert (= (and b!740080 res!497660) b!740091))

(assert (= (and b!740091 res!497650) b!740074))

(assert (= (and b!740074 c!81590) b!740078))

(assert (= (and b!740074 (not c!81590)) b!740087))

(assert (= (and b!740074 res!497651) b!740083))

(assert (= (and b!740083 res!497655) b!740068))

(assert (= (and b!740068 res!497649) b!740076))

(assert (= (and b!740076 res!497654) b!740085))

(assert (= (and b!740068 (not res!497664)) b!740079))

(assert (= (and b!740079 c!81592) b!740070))

(assert (= (and b!740079 (not c!81592)) b!740072))

(assert (= (and b!740079 (not res!497658)) b!740069))

(assert (= (and b!740069 c!81591) b!740088))

(assert (= (and b!740069 (not c!81591)) b!740075))

(assert (= (and b!740069 (not res!497656)) b!740089))

(declare-fun m!691291 () Bool)

(assert (=> b!740075 m!691291))

(assert (=> b!740075 m!691291))

(declare-fun m!691293 () Bool)

(assert (=> b!740075 m!691293))

(declare-fun m!691295 () Bool)

(assert (=> b!740089 m!691295))

(assert (=> b!740072 m!691291))

(assert (=> b!740072 m!691291))

(declare-fun m!691297 () Bool)

(assert (=> b!740072 m!691297))

(assert (=> b!740072 m!691291))

(assert (=> b!740072 m!691293))

(assert (=> b!740080 m!691291))

(assert (=> b!740080 m!691291))

(declare-fun m!691299 () Bool)

(assert (=> b!740080 m!691299))

(assert (=> b!740080 m!691299))

(assert (=> b!740080 m!691291))

(declare-fun m!691301 () Bool)

(assert (=> b!740080 m!691301))

(declare-fun m!691303 () Bool)

(assert (=> b!740083 m!691303))

(declare-fun m!691305 () Bool)

(assert (=> b!740083 m!691305))

(declare-fun m!691307 () Bool)

(assert (=> b!740083 m!691307))

(assert (=> b!740083 m!691303))

(declare-fun m!691309 () Bool)

(assert (=> b!740083 m!691309))

(declare-fun m!691311 () Bool)

(assert (=> b!740083 m!691311))

(assert (=> b!740076 m!691291))

(assert (=> b!740076 m!691291))

(declare-fun m!691313 () Bool)

(assert (=> b!740076 m!691313))

(declare-fun m!691315 () Bool)

(assert (=> start!65258 m!691315))

(declare-fun m!691317 () Bool)

(assert (=> start!65258 m!691317))

(declare-fun m!691319 () Bool)

(assert (=> b!740079 m!691319))

(assert (=> b!740070 m!691291))

(assert (=> b!740070 m!691291))

(declare-fun m!691321 () Bool)

(assert (=> b!740070 m!691321))

(assert (=> b!740088 m!691291))

(assert (=> b!740088 m!691291))

(assert (=> b!740088 m!691321))

(assert (=> b!740087 m!691291))

(assert (=> b!740087 m!691291))

(assert (=> b!740087 m!691297))

(declare-fun m!691323 () Bool)

(assert (=> b!740081 m!691323))

(declare-fun m!691325 () Bool)

(assert (=> b!740091 m!691325))

(assert (=> b!740078 m!691291))

(assert (=> b!740078 m!691291))

(declare-fun m!691327 () Bool)

(assert (=> b!740078 m!691327))

(declare-fun m!691329 () Bool)

(assert (=> b!740090 m!691329))

(declare-fun m!691331 () Bool)

(assert (=> b!740082 m!691331))

(declare-fun m!691333 () Bool)

(assert (=> b!740084 m!691333))

(assert (=> b!740085 m!691291))

(assert (=> b!740085 m!691291))

(declare-fun m!691335 () Bool)

(assert (=> b!740085 m!691335))

(declare-fun m!691337 () Bool)

(assert (=> b!740071 m!691337))

(declare-fun m!691339 () Bool)

(assert (=> b!740068 m!691339))

(declare-fun m!691341 () Bool)

(assert (=> b!740068 m!691341))

(assert (=> b!740086 m!691291))

(assert (=> b!740086 m!691291))

(declare-fun m!691343 () Bool)

(assert (=> b!740086 m!691343))

(push 1)

