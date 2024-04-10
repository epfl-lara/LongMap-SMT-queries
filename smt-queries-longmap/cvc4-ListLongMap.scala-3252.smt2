; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45388 () Bool)

(assert start!45388)

(declare-fun b!498693 () Bool)

(declare-fun e!292274 () Bool)

(declare-fun e!292277 () Bool)

(assert (=> b!498693 (= e!292274 e!292277)))

(declare-fun res!300757 () Bool)

(assert (=> b!498693 (=> res!300757 e!292277)))

(declare-datatypes ((SeekEntryResult!3955 0))(
  ( (MissingZero!3955 (index!18002 (_ BitVec 32))) (Found!3955 (index!18003 (_ BitVec 32))) (Intermediate!3955 (undefined!4767 Bool) (index!18004 (_ BitVec 32)) (x!47048 (_ BitVec 32))) (Undefined!3955) (MissingVacant!3955 (index!18005 (_ BitVec 32))) )
))
(declare-fun lt!225951 () SeekEntryResult!3955)

(declare-datatypes ((array!32213 0))(
  ( (array!32214 (arr!15488 (Array (_ BitVec 32) (_ BitVec 64))) (size!15852 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32213)

(declare-fun lt!225958 () (_ BitVec 32))

(assert (=> b!498693 (= res!300757 (or (bvsgt #b00000000000000000000000000000000 (x!47048 lt!225951)) (bvsgt (x!47048 lt!225951) #b01111111111111111111111111111110) (bvslt lt!225958 #b00000000000000000000000000000000) (bvsge lt!225958 (size!15852 a!3235)) (bvslt (index!18004 lt!225951) #b00000000000000000000000000000000) (bvsge (index!18004 lt!225951) (size!15852 a!3235)) (not (= lt!225951 (Intermediate!3955 false (index!18004 lt!225951) (x!47048 lt!225951))))))))

(assert (=> b!498693 (and (or (= (select (arr!15488 a!3235) (index!18004 lt!225951)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15488 a!3235) (index!18004 lt!225951)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15488 a!3235) (index!18004 lt!225951)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15488 a!3235) (index!18004 lt!225951)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14896 0))(
  ( (Unit!14897) )
))
(declare-fun lt!225949 () Unit!14896)

(declare-fun e!292276 () Unit!14896)

(assert (=> b!498693 (= lt!225949 e!292276)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!59246 () Bool)

(assert (=> b!498693 (= c!59246 (= (select (arr!15488 a!3235) (index!18004 lt!225951)) (select (arr!15488 a!3235) j!176)))))

(assert (=> b!498693 (and (bvslt (x!47048 lt!225951) #b01111111111111111111111111111110) (or (= (select (arr!15488 a!3235) (index!18004 lt!225951)) (select (arr!15488 a!3235) j!176)) (= (select (arr!15488 a!3235) (index!18004 lt!225951)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15488 a!3235) (index!18004 lt!225951)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498694 () Bool)

(declare-fun res!300758 () Bool)

(assert (=> b!498694 (=> res!300758 e!292274)))

(assert (=> b!498694 (= res!300758 (or (undefined!4767 lt!225951) (not (is-Intermediate!3955 lt!225951))))))

(declare-fun b!498695 () Bool)

(declare-fun res!300760 () Bool)

(declare-fun e!292273 () Bool)

(assert (=> b!498695 (=> (not res!300760) (not e!292273))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32213 (_ BitVec 32)) Bool)

(assert (=> b!498695 (= res!300760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498696 () Bool)

(declare-fun Unit!14898 () Unit!14896)

(assert (=> b!498696 (= e!292276 Unit!14898)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225956 () Unit!14896)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32213 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14896)

(assert (=> b!498696 (= lt!225956 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225958 #b00000000000000000000000000000000 (index!18004 lt!225951) (x!47048 lt!225951) mask!3524))))

(declare-fun lt!225955 () array!32213)

(declare-fun res!300761 () Bool)

(declare-fun lt!225953 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32213 (_ BitVec 32)) SeekEntryResult!3955)

(assert (=> b!498696 (= res!300761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225958 lt!225953 lt!225955 mask!3524) (Intermediate!3955 false (index!18004 lt!225951) (x!47048 lt!225951))))))

(declare-fun e!292275 () Bool)

(assert (=> b!498696 (=> (not res!300761) (not e!292275))))

(assert (=> b!498696 e!292275))

(declare-fun b!498697 () Bool)

(declare-fun e!292278 () Bool)

(assert (=> b!498697 (= e!292278 e!292273)))

(declare-fun res!300763 () Bool)

(assert (=> b!498697 (=> (not res!300763) (not e!292273))))

(declare-fun lt!225950 () SeekEntryResult!3955)

(assert (=> b!498697 (= res!300763 (or (= lt!225950 (MissingZero!3955 i!1204)) (= lt!225950 (MissingVacant!3955 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32213 (_ BitVec 32)) SeekEntryResult!3955)

(assert (=> b!498697 (= lt!225950 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498698 () Bool)

(declare-fun res!300756 () Bool)

(assert (=> b!498698 (=> (not res!300756) (not e!292273))))

(declare-datatypes ((List!9646 0))(
  ( (Nil!9643) (Cons!9642 (h!10516 (_ BitVec 64)) (t!15874 List!9646)) )
))
(declare-fun arrayNoDuplicates!0 (array!32213 (_ BitVec 32) List!9646) Bool)

(assert (=> b!498698 (= res!300756 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9643))))

(declare-fun b!498699 () Bool)

(declare-fun res!300759 () Bool)

(assert (=> b!498699 (=> (not res!300759) (not e!292278))))

(assert (=> b!498699 (= res!300759 (and (= (size!15852 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15852 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15852 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498700 () Bool)

(assert (=> b!498700 (= e!292273 (not e!292274))))

(declare-fun res!300767 () Bool)

(assert (=> b!498700 (=> res!300767 e!292274)))

(declare-fun lt!225957 () (_ BitVec 32))

(assert (=> b!498700 (= res!300767 (= lt!225951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225957 lt!225953 lt!225955 mask!3524)))))

(assert (=> b!498700 (= lt!225951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225958 (select (arr!15488 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498700 (= lt!225957 (toIndex!0 lt!225953 mask!3524))))

(assert (=> b!498700 (= lt!225953 (select (store (arr!15488 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498700 (= lt!225958 (toIndex!0 (select (arr!15488 a!3235) j!176) mask!3524))))

(assert (=> b!498700 (= lt!225955 (array!32214 (store (arr!15488 a!3235) i!1204 k!2280) (size!15852 a!3235)))))

(declare-fun e!292272 () Bool)

(assert (=> b!498700 e!292272))

(declare-fun res!300766 () Bool)

(assert (=> b!498700 (=> (not res!300766) (not e!292272))))

(assert (=> b!498700 (= res!300766 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225954 () Unit!14896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14896)

(assert (=> b!498700 (= lt!225954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498701 () Bool)

(assert (=> b!498701 (= e!292277 true)))

(declare-fun lt!225952 () SeekEntryResult!3955)

(assert (=> b!498701 (= lt!225952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225958 lt!225953 lt!225955 mask!3524))))

(declare-fun b!498702 () Bool)

(declare-fun res!300755 () Bool)

(assert (=> b!498702 (=> (not res!300755) (not e!292278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498702 (= res!300755 (validKeyInArray!0 k!2280))))

(declare-fun b!498703 () Bool)

(declare-fun Unit!14899 () Unit!14896)

(assert (=> b!498703 (= e!292276 Unit!14899)))

(declare-fun b!498704 () Bool)

(declare-fun res!300764 () Bool)

(assert (=> b!498704 (=> (not res!300764) (not e!292278))))

(assert (=> b!498704 (= res!300764 (validKeyInArray!0 (select (arr!15488 a!3235) j!176)))))

(declare-fun b!498706 () Bool)

(declare-fun res!300765 () Bool)

(assert (=> b!498706 (=> (not res!300765) (not e!292278))))

(declare-fun arrayContainsKey!0 (array!32213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498706 (= res!300765 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498707 () Bool)

(assert (=> b!498707 (= e!292272 (= (seekEntryOrOpen!0 (select (arr!15488 a!3235) j!176) a!3235 mask!3524) (Found!3955 j!176)))))

(declare-fun b!498705 () Bool)

(assert (=> b!498705 (= e!292275 false)))

(declare-fun res!300762 () Bool)

(assert (=> start!45388 (=> (not res!300762) (not e!292278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45388 (= res!300762 (validMask!0 mask!3524))))

(assert (=> start!45388 e!292278))

(assert (=> start!45388 true))

(declare-fun array_inv!11284 (array!32213) Bool)

(assert (=> start!45388 (array_inv!11284 a!3235)))

(assert (= (and start!45388 res!300762) b!498699))

(assert (= (and b!498699 res!300759) b!498704))

(assert (= (and b!498704 res!300764) b!498702))

(assert (= (and b!498702 res!300755) b!498706))

(assert (= (and b!498706 res!300765) b!498697))

(assert (= (and b!498697 res!300763) b!498695))

(assert (= (and b!498695 res!300760) b!498698))

(assert (= (and b!498698 res!300756) b!498700))

(assert (= (and b!498700 res!300766) b!498707))

(assert (= (and b!498700 (not res!300767)) b!498694))

(assert (= (and b!498694 (not res!300758)) b!498693))

(assert (= (and b!498693 c!59246) b!498696))

(assert (= (and b!498693 (not c!59246)) b!498703))

(assert (= (and b!498696 res!300761) b!498705))

(assert (= (and b!498693 (not res!300757)) b!498701))

(declare-fun m!479943 () Bool)

(assert (=> b!498698 m!479943))

(declare-fun m!479945 () Bool)

(assert (=> b!498701 m!479945))

(declare-fun m!479947 () Bool)

(assert (=> b!498707 m!479947))

(assert (=> b!498707 m!479947))

(declare-fun m!479949 () Bool)

(assert (=> b!498707 m!479949))

(assert (=> b!498704 m!479947))

(assert (=> b!498704 m!479947))

(declare-fun m!479951 () Bool)

(assert (=> b!498704 m!479951))

(assert (=> b!498700 m!479947))

(declare-fun m!479953 () Bool)

(assert (=> b!498700 m!479953))

(declare-fun m!479955 () Bool)

(assert (=> b!498700 m!479955))

(declare-fun m!479957 () Bool)

(assert (=> b!498700 m!479957))

(declare-fun m!479959 () Bool)

(assert (=> b!498700 m!479959))

(declare-fun m!479961 () Bool)

(assert (=> b!498700 m!479961))

(assert (=> b!498700 m!479947))

(declare-fun m!479963 () Bool)

(assert (=> b!498700 m!479963))

(assert (=> b!498700 m!479947))

(declare-fun m!479965 () Bool)

(assert (=> b!498700 m!479965))

(declare-fun m!479967 () Bool)

(assert (=> b!498700 m!479967))

(declare-fun m!479969 () Bool)

(assert (=> start!45388 m!479969))

(declare-fun m!479971 () Bool)

(assert (=> start!45388 m!479971))

(declare-fun m!479973 () Bool)

(assert (=> b!498702 m!479973))

(declare-fun m!479975 () Bool)

(assert (=> b!498696 m!479975))

(assert (=> b!498696 m!479945))

(declare-fun m!479977 () Bool)

(assert (=> b!498693 m!479977))

(assert (=> b!498693 m!479947))

(declare-fun m!479979 () Bool)

(assert (=> b!498695 m!479979))

(declare-fun m!479981 () Bool)

(assert (=> b!498706 m!479981))

(declare-fun m!479983 () Bool)

(assert (=> b!498697 m!479983))

(push 1)

