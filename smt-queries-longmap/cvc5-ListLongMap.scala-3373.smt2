; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46410 () Bool)

(assert start!46410)

(declare-fun b!513424 () Bool)

(declare-fun res!313727 () Bool)

(declare-fun e!299817 () Bool)

(assert (=> b!513424 (=> (not res!313727) (not e!299817))))

(declare-datatypes ((array!32950 0))(
  ( (array!32951 (arr!15849 (Array (_ BitVec 32) (_ BitVec 64))) (size!16213 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32950)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32950 (_ BitVec 32)) Bool)

(assert (=> b!513424 (= res!313727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513425 () Bool)

(declare-fun res!313724 () Bool)

(declare-fun e!299820 () Bool)

(assert (=> b!513425 (=> (not res!313724) (not e!299820))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513425 (= res!313724 (validKeyInArray!0 k!2280))))

(declare-fun b!513427 () Bool)

(declare-fun res!313726 () Bool)

(assert (=> b!513427 (=> (not res!313726) (not e!299820))))

(declare-fun arrayContainsKey!0 (array!32950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513427 (= res!313726 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513428 () Bool)

(assert (=> b!513428 (= e!299820 e!299817)))

(declare-fun res!313725 () Bool)

(assert (=> b!513428 (=> (not res!313725) (not e!299817))))

(declare-datatypes ((SeekEntryResult!4316 0))(
  ( (MissingZero!4316 (index!19452 (_ BitVec 32))) (Found!4316 (index!19453 (_ BitVec 32))) (Intermediate!4316 (undefined!5128 Bool) (index!19454 (_ BitVec 32)) (x!48407 (_ BitVec 32))) (Undefined!4316) (MissingVacant!4316 (index!19455 (_ BitVec 32))) )
))
(declare-fun lt!235061 () SeekEntryResult!4316)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513428 (= res!313725 (or (= lt!235061 (MissingZero!4316 i!1204)) (= lt!235061 (MissingVacant!4316 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32950 (_ BitVec 32)) SeekEntryResult!4316)

(assert (=> b!513428 (= lt!235061 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!513429 () Bool)

(declare-fun e!299818 () Bool)

(assert (=> b!513429 (= e!299817 (not e!299818))))

(declare-fun res!313728 () Bool)

(assert (=> b!513429 (=> res!313728 e!299818)))

(declare-fun lt!235062 () SeekEntryResult!4316)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!235060 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32950 (_ BitVec 32)) SeekEntryResult!4316)

(assert (=> b!513429 (= res!313728 (= lt!235062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235060 (select (store (arr!15849 a!3235) i!1204 k!2280) j!176) (array!32951 (store (arr!15849 a!3235) i!1204 k!2280) (size!16213 a!3235)) mask!3524)))))

(declare-fun lt!235063 () (_ BitVec 32))

(assert (=> b!513429 (= lt!235062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235063 (select (arr!15849 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513429 (= lt!235060 (toIndex!0 (select (store (arr!15849 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!513429 (= lt!235063 (toIndex!0 (select (arr!15849 a!3235) j!176) mask!3524))))

(declare-fun e!299819 () Bool)

(assert (=> b!513429 e!299819))

(declare-fun res!313723 () Bool)

(assert (=> b!513429 (=> (not res!313723) (not e!299819))))

(assert (=> b!513429 (= res!313723 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15890 0))(
  ( (Unit!15891) )
))
(declare-fun lt!235059 () Unit!15890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15890)

(assert (=> b!513429 (= lt!235059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513430 () Bool)

(declare-fun res!313729 () Bool)

(assert (=> b!513430 (=> (not res!313729) (not e!299820))))

(assert (=> b!513430 (= res!313729 (and (= (size!16213 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16213 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16213 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513431 () Bool)

(assert (=> b!513431 (= e!299818 true)))

(assert (=> b!513431 (bvslt (x!48407 lt!235062) #b01111111111111111111111111111110)))

(declare-fun b!513432 () Bool)

(declare-fun res!313730 () Bool)

(assert (=> b!513432 (=> res!313730 e!299818)))

(assert (=> b!513432 (= res!313730 (or (undefined!5128 lt!235062) (not (is-Intermediate!4316 lt!235062))))))

(declare-fun b!513433 () Bool)

(declare-fun res!313720 () Bool)

(assert (=> b!513433 (=> (not res!313720) (not e!299817))))

(declare-datatypes ((List!10007 0))(
  ( (Nil!10004) (Cons!10003 (h!10889 (_ BitVec 64)) (t!16235 List!10007)) )
))
(declare-fun arrayNoDuplicates!0 (array!32950 (_ BitVec 32) List!10007) Bool)

(assert (=> b!513433 (= res!313720 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10004))))

(declare-fun b!513434 () Bool)

(declare-fun res!313722 () Bool)

(assert (=> b!513434 (=> (not res!313722) (not e!299820))))

(assert (=> b!513434 (= res!313722 (validKeyInArray!0 (select (arr!15849 a!3235) j!176)))))

(declare-fun res!313721 () Bool)

(assert (=> start!46410 (=> (not res!313721) (not e!299820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46410 (= res!313721 (validMask!0 mask!3524))))

(assert (=> start!46410 e!299820))

(assert (=> start!46410 true))

(declare-fun array_inv!11645 (array!32950) Bool)

(assert (=> start!46410 (array_inv!11645 a!3235)))

(declare-fun b!513426 () Bool)

(assert (=> b!513426 (= e!299819 (= (seekEntryOrOpen!0 (select (arr!15849 a!3235) j!176) a!3235 mask!3524) (Found!4316 j!176)))))

(assert (= (and start!46410 res!313721) b!513430))

(assert (= (and b!513430 res!313729) b!513434))

(assert (= (and b!513434 res!313722) b!513425))

(assert (= (and b!513425 res!313724) b!513427))

(assert (= (and b!513427 res!313726) b!513428))

(assert (= (and b!513428 res!313725) b!513424))

(assert (= (and b!513424 res!313727) b!513433))

(assert (= (and b!513433 res!313720) b!513429))

(assert (= (and b!513429 res!313723) b!513426))

(assert (= (and b!513429 (not res!313728)) b!513432))

(assert (= (and b!513432 (not res!313730)) b!513431))

(declare-fun m!494985 () Bool)

(assert (=> b!513429 m!494985))

(declare-fun m!494987 () Bool)

(assert (=> b!513429 m!494987))

(declare-fun m!494989 () Bool)

(assert (=> b!513429 m!494989))

(declare-fun m!494991 () Bool)

(assert (=> b!513429 m!494991))

(assert (=> b!513429 m!494989))

(declare-fun m!494993 () Bool)

(assert (=> b!513429 m!494993))

(assert (=> b!513429 m!494991))

(declare-fun m!494995 () Bool)

(assert (=> b!513429 m!494995))

(assert (=> b!513429 m!494991))

(declare-fun m!494997 () Bool)

(assert (=> b!513429 m!494997))

(declare-fun m!494999 () Bool)

(assert (=> b!513429 m!494999))

(assert (=> b!513429 m!494989))

(declare-fun m!495001 () Bool)

(assert (=> b!513429 m!495001))

(declare-fun m!495003 () Bool)

(assert (=> b!513433 m!495003))

(assert (=> b!513434 m!494991))

(assert (=> b!513434 m!494991))

(declare-fun m!495005 () Bool)

(assert (=> b!513434 m!495005))

(declare-fun m!495007 () Bool)

(assert (=> b!513424 m!495007))

(declare-fun m!495009 () Bool)

(assert (=> b!513427 m!495009))

(assert (=> b!513426 m!494991))

(assert (=> b!513426 m!494991))

(declare-fun m!495011 () Bool)

(assert (=> b!513426 m!495011))

(declare-fun m!495013 () Bool)

(assert (=> b!513425 m!495013))

(declare-fun m!495015 () Bool)

(assert (=> start!46410 m!495015))

(declare-fun m!495017 () Bool)

(assert (=> start!46410 m!495017))

(declare-fun m!495019 () Bool)

(assert (=> b!513428 m!495019))

(push 1)

