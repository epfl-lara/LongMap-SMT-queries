; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66460 () Bool)

(assert start!66460)

(declare-fun b!765703 () Bool)

(declare-fun e!426438 () Bool)

(declare-fun e!426442 () Bool)

(assert (=> b!765703 (= e!426438 e!426442)))

(declare-fun res!517926 () Bool)

(assert (=> b!765703 (=> (not res!517926) (not e!426442))))

(declare-datatypes ((array!42239 0))(
  ( (array!42240 (arr!20224 (Array (_ BitVec 32) (_ BitVec 64))) (size!20645 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42239)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7824 0))(
  ( (MissingZero!7824 (index!33664 (_ BitVec 32))) (Found!7824 (index!33665 (_ BitVec 32))) (Intermediate!7824 (undefined!8636 Bool) (index!33666 (_ BitVec 32)) (x!64574 (_ BitVec 32))) (Undefined!7824) (MissingVacant!7824 (index!33667 (_ BitVec 32))) )
))
(declare-fun lt!340629 () SeekEntryResult!7824)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42239 (_ BitVec 32)) SeekEntryResult!7824)

(assert (=> b!765703 (= res!517926 (= (seekEntryOrOpen!0 (select (arr!20224 a!3186) j!159) a!3186 mask!3328) lt!340629))))

(assert (=> b!765703 (= lt!340629 (Found!7824 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!765704 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42239 (_ BitVec 32)) SeekEntryResult!7824)

(assert (=> b!765704 (= e!426442 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20224 a!3186) j!159) a!3186 mask!3328) lt!340629))))

(declare-fun b!765705 () Bool)

(declare-fun res!517922 () Bool)

(declare-fun e!426437 () Bool)

(assert (=> b!765705 (=> (not res!517922) (not e!426437))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!765705 (= res!517922 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20645 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20645 a!3186))))))

(declare-fun b!765706 () Bool)

(declare-fun res!517916 () Bool)

(declare-fun e!426444 () Bool)

(assert (=> b!765706 (=> (not res!517916) (not e!426444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765706 (= res!517916 (validKeyInArray!0 (select (arr!20224 a!3186) j!159)))))

(declare-fun b!765707 () Bool)

(declare-fun e!426443 () Bool)

(assert (=> b!765707 (= e!426443 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20224 a!3186) j!159) a!3186 mask!3328) (Found!7824 j!159)))))

(declare-fun res!517924 () Bool)

(assert (=> start!66460 (=> (not res!517924) (not e!426444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66460 (= res!517924 (validMask!0 mask!3328))))

(assert (=> start!66460 e!426444))

(assert (=> start!66460 true))

(declare-fun array_inv!16020 (array!42239) Bool)

(assert (=> start!66460 (array_inv!16020 a!3186)))

(declare-fun b!765708 () Bool)

(declare-fun res!517920 () Bool)

(declare-fun e!426440 () Bool)

(assert (=> b!765708 (=> (not res!517920) (not e!426440))))

(assert (=> b!765708 (= res!517920 e!426443)))

(declare-fun c!84283 () Bool)

(assert (=> b!765708 (= c!84283 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765709 () Bool)

(assert (=> b!765709 (= e!426444 e!426437)))

(declare-fun res!517930 () Bool)

(assert (=> b!765709 (=> (not res!517930) (not e!426437))))

(declare-fun lt!340630 () SeekEntryResult!7824)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765709 (= res!517930 (or (= lt!340630 (MissingZero!7824 i!1173)) (= lt!340630 (MissingVacant!7824 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!765709 (= lt!340630 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!765710 () Bool)

(assert (=> b!765710 (= e!426437 e!426440)))

(declare-fun res!517925 () Bool)

(assert (=> b!765710 (=> (not res!517925) (not e!426440))))

(declare-fun lt!340628 () SeekEntryResult!7824)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42239 (_ BitVec 32)) SeekEntryResult!7824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765710 (= res!517925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20224 a!3186) j!159) mask!3328) (select (arr!20224 a!3186) j!159) a!3186 mask!3328) lt!340628))))

(assert (=> b!765710 (= lt!340628 (Intermediate!7824 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765711 () Bool)

(declare-fun e!426439 () Bool)

(assert (=> b!765711 (= e!426440 e!426439)))

(declare-fun res!517923 () Bool)

(assert (=> b!765711 (=> (not res!517923) (not e!426439))))

(declare-fun lt!340626 () array!42239)

(declare-fun lt!340631 () (_ BitVec 64))

(assert (=> b!765711 (= res!517923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340631 mask!3328) lt!340631 lt!340626 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340631 lt!340626 mask!3328)))))

(assert (=> b!765711 (= lt!340631 (select (store (arr!20224 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765711 (= lt!340626 (array!42240 (store (arr!20224 a!3186) i!1173 k0!2102) (size!20645 a!3186)))))

(declare-fun b!765712 () Bool)

(assert (=> b!765712 (= e!426443 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20224 a!3186) j!159) a!3186 mask!3328) lt!340628))))

(declare-fun b!765713 () Bool)

(declare-fun res!517929 () Bool)

(assert (=> b!765713 (=> (not res!517929) (not e!426437))))

(declare-datatypes ((List!14226 0))(
  ( (Nil!14223) (Cons!14222 (h!15312 (_ BitVec 64)) (t!20541 List!14226)) )
))
(declare-fun arrayNoDuplicates!0 (array!42239 (_ BitVec 32) List!14226) Bool)

(assert (=> b!765713 (= res!517929 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14223))))

(declare-fun b!765714 () Bool)

(declare-fun res!517918 () Bool)

(assert (=> b!765714 (=> (not res!517918) (not e!426440))))

(assert (=> b!765714 (= res!517918 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20224 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765715 () Bool)

(declare-fun res!517928 () Bool)

(assert (=> b!765715 (=> (not res!517928) (not e!426444))))

(assert (=> b!765715 (= res!517928 (validKeyInArray!0 k0!2102))))

(declare-fun b!765716 () Bool)

(declare-fun res!517927 () Bool)

(assert (=> b!765716 (=> (not res!517927) (not e!426437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42239 (_ BitVec 32)) Bool)

(assert (=> b!765716 (= res!517927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765717 () Bool)

(assert (=> b!765717 (= e!426439 (not true))))

(assert (=> b!765717 e!426438))

(declare-fun res!517919 () Bool)

(assert (=> b!765717 (=> (not res!517919) (not e!426438))))

(assert (=> b!765717 (= res!517919 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26374 0))(
  ( (Unit!26375) )
))
(declare-fun lt!340627 () Unit!26374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26374)

(assert (=> b!765717 (= lt!340627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765718 () Bool)

(declare-fun res!517921 () Bool)

(assert (=> b!765718 (=> (not res!517921) (not e!426444))))

(declare-fun arrayContainsKey!0 (array!42239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765718 (= res!517921 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765719 () Bool)

(declare-fun res!517917 () Bool)

(assert (=> b!765719 (=> (not res!517917) (not e!426444))))

(assert (=> b!765719 (= res!517917 (and (= (size!20645 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20645 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20645 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66460 res!517924) b!765719))

(assert (= (and b!765719 res!517917) b!765706))

(assert (= (and b!765706 res!517916) b!765715))

(assert (= (and b!765715 res!517928) b!765718))

(assert (= (and b!765718 res!517921) b!765709))

(assert (= (and b!765709 res!517930) b!765716))

(assert (= (and b!765716 res!517927) b!765713))

(assert (= (and b!765713 res!517929) b!765705))

(assert (= (and b!765705 res!517922) b!765710))

(assert (= (and b!765710 res!517925) b!765714))

(assert (= (and b!765714 res!517918) b!765708))

(assert (= (and b!765708 c!84283) b!765712))

(assert (= (and b!765708 (not c!84283)) b!765707))

(assert (= (and b!765708 res!517920) b!765711))

(assert (= (and b!765711 res!517923) b!765717))

(assert (= (and b!765717 res!517919) b!765703))

(assert (= (and b!765703 res!517926) b!765704))

(declare-fun m!711769 () Bool)

(assert (=> b!765714 m!711769))

(declare-fun m!711771 () Bool)

(assert (=> b!765706 m!711771))

(assert (=> b!765706 m!711771))

(declare-fun m!711773 () Bool)

(assert (=> b!765706 m!711773))

(assert (=> b!765703 m!711771))

(assert (=> b!765703 m!711771))

(declare-fun m!711775 () Bool)

(assert (=> b!765703 m!711775))

(declare-fun m!711777 () Bool)

(assert (=> b!765718 m!711777))

(assert (=> b!765710 m!711771))

(assert (=> b!765710 m!711771))

(declare-fun m!711779 () Bool)

(assert (=> b!765710 m!711779))

(assert (=> b!765710 m!711779))

(assert (=> b!765710 m!711771))

(declare-fun m!711781 () Bool)

(assert (=> b!765710 m!711781))

(declare-fun m!711783 () Bool)

(assert (=> b!765709 m!711783))

(assert (=> b!765707 m!711771))

(assert (=> b!765707 m!711771))

(declare-fun m!711785 () Bool)

(assert (=> b!765707 m!711785))

(assert (=> b!765704 m!711771))

(assert (=> b!765704 m!711771))

(declare-fun m!711787 () Bool)

(assert (=> b!765704 m!711787))

(declare-fun m!711789 () Bool)

(assert (=> b!765716 m!711789))

(declare-fun m!711791 () Bool)

(assert (=> b!765717 m!711791))

(declare-fun m!711793 () Bool)

(assert (=> b!765717 m!711793))

(declare-fun m!711795 () Bool)

(assert (=> b!765711 m!711795))

(declare-fun m!711797 () Bool)

(assert (=> b!765711 m!711797))

(declare-fun m!711799 () Bool)

(assert (=> b!765711 m!711799))

(assert (=> b!765711 m!711795))

(declare-fun m!711801 () Bool)

(assert (=> b!765711 m!711801))

(declare-fun m!711803 () Bool)

(assert (=> b!765711 m!711803))

(declare-fun m!711805 () Bool)

(assert (=> start!66460 m!711805))

(declare-fun m!711807 () Bool)

(assert (=> start!66460 m!711807))

(assert (=> b!765712 m!711771))

(assert (=> b!765712 m!711771))

(declare-fun m!711809 () Bool)

(assert (=> b!765712 m!711809))

(declare-fun m!711811 () Bool)

(assert (=> b!765713 m!711811))

(declare-fun m!711813 () Bool)

(assert (=> b!765715 m!711813))

(check-sat (not b!765709) (not b!765712) (not b!765711) (not b!765713) (not b!765703) (not b!765706) (not b!765718) (not b!765710) (not start!66460) (not b!765707) (not b!765716) (not b!765717) (not b!765715) (not b!765704))
(check-sat)
