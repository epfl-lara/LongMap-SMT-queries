; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66806 () Bool)

(assert start!66806)

(declare-fun b!770576 () Bool)

(declare-fun e!429027 () Bool)

(declare-fun e!429029 () Bool)

(assert (=> b!770576 (= e!429027 e!429029)))

(declare-fun res!521266 () Bool)

(assert (=> b!770576 (=> (not res!521266) (not e!429029))))

(declare-datatypes ((SeekEntryResult!7884 0))(
  ( (MissingZero!7884 (index!33904 (_ BitVec 32))) (Found!7884 (index!33905 (_ BitVec 32))) (Intermediate!7884 (undefined!8696 Bool) (index!33906 (_ BitVec 32)) (x!64831 (_ BitVec 32))) (Undefined!7884) (MissingVacant!7884 (index!33907 (_ BitVec 32))) )
))
(declare-fun lt!342976 () SeekEntryResult!7884)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770576 (= res!521266 (or (= lt!342976 (MissingZero!7884 i!1173)) (= lt!342976 (MissingVacant!7884 i!1173))))))

(declare-datatypes ((array!42368 0))(
  ( (array!42369 (arr!20284 (Array (_ BitVec 32) (_ BitVec 64))) (size!20705 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42368)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42368 (_ BitVec 32)) SeekEntryResult!7884)

(assert (=> b!770576 (= lt!342976 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770577 () Bool)

(declare-fun res!521264 () Bool)

(declare-fun e!429028 () Bool)

(assert (=> b!770577 (=> (not res!521264) (not e!429028))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!770577 (= res!521264 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20284 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770578 () Bool)

(declare-fun res!521275 () Bool)

(assert (=> b!770578 (=> (not res!521275) (not e!429027))))

(declare-fun arrayContainsKey!0 (array!42368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770578 (= res!521275 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770579 () Bool)

(declare-fun res!521274 () Bool)

(assert (=> b!770579 (=> (not res!521274) (not e!429028))))

(declare-fun e!429022 () Bool)

(assert (=> b!770579 (= res!521274 e!429022)))

(declare-fun c!85053 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770579 (= c!85053 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770580 () Bool)

(declare-fun res!521272 () Bool)

(assert (=> b!770580 (=> (not res!521272) (not e!429027))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!770580 (= res!521272 (and (= (size!20705 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20705 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20705 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770581 () Bool)

(declare-fun e!429026 () Bool)

(assert (=> b!770581 (= e!429026 true)))

(declare-datatypes ((Unit!26550 0))(
  ( (Unit!26551) )
))
(declare-fun lt!342972 () Unit!26550)

(declare-fun e!429021 () Unit!26550)

(assert (=> b!770581 (= lt!342972 e!429021)))

(declare-fun c!85054 () Bool)

(assert (=> b!770581 (= c!85054 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342979 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770581 (= lt!342979 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!521269 () Bool)

(assert (=> start!66806 (=> (not res!521269) (not e!429027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66806 (= res!521269 (validMask!0 mask!3328))))

(assert (=> start!66806 e!429027))

(assert (=> start!66806 true))

(declare-fun array_inv!16080 (array!42368) Bool)

(assert (=> start!66806 (array_inv!16080 a!3186)))

(declare-fun e!429024 () Bool)

(declare-fun lt!342975 () SeekEntryResult!7884)

(declare-fun b!770582 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42368 (_ BitVec 32)) SeekEntryResult!7884)

(assert (=> b!770582 (= e!429024 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!342975))))

(declare-fun b!770583 () Bool)

(assert (=> b!770583 (= e!429029 e!429028)))

(declare-fun res!521276 () Bool)

(assert (=> b!770583 (=> (not res!521276) (not e!429028))))

(declare-fun lt!342971 () SeekEntryResult!7884)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42368 (_ BitVec 32)) SeekEntryResult!7884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770583 (= res!521276 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20284 a!3186) j!159) mask!3328) (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!342971))))

(assert (=> b!770583 (= lt!342971 (Intermediate!7884 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770584 () Bool)

(assert (=> b!770584 (= e!429022 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!342971))))

(declare-fun b!770585 () Bool)

(declare-fun e!429025 () Bool)

(assert (=> b!770585 (= e!429025 e!429024)))

(declare-fun res!521267 () Bool)

(assert (=> b!770585 (=> (not res!521267) (not e!429024))))

(assert (=> b!770585 (= res!521267 (= (seekEntryOrOpen!0 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!342975))))

(assert (=> b!770585 (= lt!342975 (Found!7884 j!159))))

(declare-fun b!770586 () Bool)

(declare-fun res!521265 () Bool)

(assert (=> b!770586 (=> (not res!521265) (not e!429029))))

(assert (=> b!770586 (= res!521265 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20705 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20705 a!3186))))))

(declare-fun b!770587 () Bool)

(declare-fun res!521273 () Bool)

(assert (=> b!770587 (=> (not res!521273) (not e!429029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42368 (_ BitVec 32)) Bool)

(assert (=> b!770587 (= res!521273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770588 () Bool)

(assert (=> b!770588 (= e!429022 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) (Found!7884 j!159)))))

(declare-fun b!770589 () Bool)

(declare-fun res!521268 () Bool)

(assert (=> b!770589 (=> (not res!521268) (not e!429027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770589 (= res!521268 (validKeyInArray!0 (select (arr!20284 a!3186) j!159)))))

(declare-fun b!770590 () Bool)

(declare-fun e!429020 () Bool)

(assert (=> b!770590 (= e!429020 (not e!429026))))

(declare-fun res!521262 () Bool)

(assert (=> b!770590 (=> res!521262 e!429026)))

(declare-fun lt!342970 () SeekEntryResult!7884)

(get-info :version)

(assert (=> b!770590 (= res!521262 (or (not ((_ is Intermediate!7884) lt!342970)) (bvsge x!1131 (x!64831 lt!342970))))))

(assert (=> b!770590 e!429025))

(declare-fun res!521261 () Bool)

(assert (=> b!770590 (=> (not res!521261) (not e!429025))))

(assert (=> b!770590 (= res!521261 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342978 () Unit!26550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26550)

(assert (=> b!770590 (= lt!342978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770591 () Bool)

(declare-fun Unit!26552 () Unit!26550)

(assert (=> b!770591 (= e!429021 Unit!26552)))

(assert (=> b!770591 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342979 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!342971)))

(declare-fun b!770592 () Bool)

(declare-fun Unit!26553 () Unit!26550)

(assert (=> b!770592 (= e!429021 Unit!26553)))

(declare-fun lt!342973 () SeekEntryResult!7884)

(assert (=> b!770592 (= lt!342973 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20284 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770592 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342979 resIntermediateIndex!5 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) (Found!7884 j!159))))

(declare-fun b!770593 () Bool)

(assert (=> b!770593 (= e!429028 e!429020)))

(declare-fun res!521270 () Bool)

(assert (=> b!770593 (=> (not res!521270) (not e!429020))))

(declare-fun lt!342974 () SeekEntryResult!7884)

(assert (=> b!770593 (= res!521270 (= lt!342974 lt!342970))))

(declare-fun lt!342980 () array!42368)

(declare-fun lt!342977 () (_ BitVec 64))

(assert (=> b!770593 (= lt!342970 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342977 lt!342980 mask!3328))))

(assert (=> b!770593 (= lt!342974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342977 mask!3328) lt!342977 lt!342980 mask!3328))))

(assert (=> b!770593 (= lt!342977 (select (store (arr!20284 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770593 (= lt!342980 (array!42369 (store (arr!20284 a!3186) i!1173 k0!2102) (size!20705 a!3186)))))

(declare-fun b!770594 () Bool)

(declare-fun res!521271 () Bool)

(assert (=> b!770594 (=> (not res!521271) (not e!429029))))

(declare-datatypes ((List!14286 0))(
  ( (Nil!14283) (Cons!14282 (h!15381 (_ BitVec 64)) (t!20601 List!14286)) )
))
(declare-fun arrayNoDuplicates!0 (array!42368 (_ BitVec 32) List!14286) Bool)

(assert (=> b!770594 (= res!521271 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14283))))

(declare-fun b!770595 () Bool)

(declare-fun res!521263 () Bool)

(assert (=> b!770595 (=> (not res!521263) (not e!429027))))

(assert (=> b!770595 (= res!521263 (validKeyInArray!0 k0!2102))))

(assert (= (and start!66806 res!521269) b!770580))

(assert (= (and b!770580 res!521272) b!770589))

(assert (= (and b!770589 res!521268) b!770595))

(assert (= (and b!770595 res!521263) b!770578))

(assert (= (and b!770578 res!521275) b!770576))

(assert (= (and b!770576 res!521266) b!770587))

(assert (= (and b!770587 res!521273) b!770594))

(assert (= (and b!770594 res!521271) b!770586))

(assert (= (and b!770586 res!521265) b!770583))

(assert (= (and b!770583 res!521276) b!770577))

(assert (= (and b!770577 res!521264) b!770579))

(assert (= (and b!770579 c!85053) b!770584))

(assert (= (and b!770579 (not c!85053)) b!770588))

(assert (= (and b!770579 res!521274) b!770593))

(assert (= (and b!770593 res!521270) b!770590))

(assert (= (and b!770590 res!521261) b!770585))

(assert (= (and b!770585 res!521267) b!770582))

(assert (= (and b!770590 (not res!521262)) b!770581))

(assert (= (and b!770581 c!85054) b!770591))

(assert (= (and b!770581 (not c!85054)) b!770592))

(declare-fun m!715839 () Bool)

(assert (=> b!770595 m!715839))

(declare-fun m!715841 () Bool)

(assert (=> b!770590 m!715841))

(declare-fun m!715843 () Bool)

(assert (=> b!770590 m!715843))

(declare-fun m!715845 () Bool)

(assert (=> b!770592 m!715845))

(assert (=> b!770592 m!715845))

(declare-fun m!715847 () Bool)

(assert (=> b!770592 m!715847))

(assert (=> b!770592 m!715845))

(declare-fun m!715849 () Bool)

(assert (=> b!770592 m!715849))

(assert (=> b!770588 m!715845))

(assert (=> b!770588 m!715845))

(assert (=> b!770588 m!715847))

(assert (=> b!770591 m!715845))

(assert (=> b!770591 m!715845))

(declare-fun m!715851 () Bool)

(assert (=> b!770591 m!715851))

(declare-fun m!715853 () Bool)

(assert (=> b!770577 m!715853))

(declare-fun m!715855 () Bool)

(assert (=> b!770576 m!715855))

(declare-fun m!715857 () Bool)

(assert (=> b!770593 m!715857))

(declare-fun m!715859 () Bool)

(assert (=> b!770593 m!715859))

(declare-fun m!715861 () Bool)

(assert (=> b!770593 m!715861))

(assert (=> b!770593 m!715857))

(declare-fun m!715863 () Bool)

(assert (=> b!770593 m!715863))

(declare-fun m!715865 () Bool)

(assert (=> b!770593 m!715865))

(assert (=> b!770582 m!715845))

(assert (=> b!770582 m!715845))

(declare-fun m!715867 () Bool)

(assert (=> b!770582 m!715867))

(assert (=> b!770583 m!715845))

(assert (=> b!770583 m!715845))

(declare-fun m!715869 () Bool)

(assert (=> b!770583 m!715869))

(assert (=> b!770583 m!715869))

(assert (=> b!770583 m!715845))

(declare-fun m!715871 () Bool)

(assert (=> b!770583 m!715871))

(assert (=> b!770589 m!715845))

(assert (=> b!770589 m!715845))

(declare-fun m!715873 () Bool)

(assert (=> b!770589 m!715873))

(declare-fun m!715875 () Bool)

(assert (=> b!770578 m!715875))

(assert (=> b!770584 m!715845))

(assert (=> b!770584 m!715845))

(declare-fun m!715877 () Bool)

(assert (=> b!770584 m!715877))

(declare-fun m!715879 () Bool)

(assert (=> b!770581 m!715879))

(declare-fun m!715881 () Bool)

(assert (=> b!770587 m!715881))

(declare-fun m!715883 () Bool)

(assert (=> b!770594 m!715883))

(declare-fun m!715885 () Bool)

(assert (=> start!66806 m!715885))

(declare-fun m!715887 () Bool)

(assert (=> start!66806 m!715887))

(assert (=> b!770585 m!715845))

(assert (=> b!770585 m!715845))

(declare-fun m!715889 () Bool)

(assert (=> b!770585 m!715889))

(check-sat (not b!770590) (not b!770594) (not b!770592) (not b!770589) (not b!770584) (not b!770583) (not b!770585) (not b!770591) (not b!770595) (not start!66806) (not b!770593) (not b!770578) (not b!770581) (not b!770588) (not b!770576) (not b!770582) (not b!770587))
(check-sat)
