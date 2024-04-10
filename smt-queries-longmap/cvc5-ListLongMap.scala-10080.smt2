; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118614 () Bool)

(assert start!118614)

(declare-fun b!1386715 () Bool)

(declare-fun res!927859 () Bool)

(declare-fun e!785522 () Bool)

(assert (=> b!1386715 (=> (not res!927859) (not e!785522))))

(declare-datatypes ((array!94890 0))(
  ( (array!94891 (arr!45821 (Array (_ BitVec 32) (_ BitVec 64))) (size!46371 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94890)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386715 (= res!927859 (validKeyInArray!0 (select (arr!45821 a!2938) i!1065)))))

(declare-fun b!1386716 () Bool)

(declare-fun res!927856 () Bool)

(assert (=> b!1386716 (=> (not res!927856) (not e!785522))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386716 (= res!927856 (and (= (size!46371 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46371 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46371 a!2938))))))

(declare-fun res!927855 () Bool)

(assert (=> start!118614 (=> (not res!927855) (not e!785522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118614 (= res!927855 (validMask!0 mask!2987))))

(assert (=> start!118614 e!785522))

(assert (=> start!118614 true))

(declare-fun array_inv!34849 (array!94890) Bool)

(assert (=> start!118614 (array_inv!34849 a!2938)))

(declare-fun b!1386717 () Bool)

(assert (=> b!1386717 (= e!785522 false)))

(declare-datatypes ((Unit!46334 0))(
  ( (Unit!46335) )
))
(declare-fun lt!609556 () Unit!46334)

(declare-fun e!785521 () Unit!46334)

(assert (=> b!1386717 (= lt!609556 e!785521)))

(declare-fun c!128871 () Bool)

(declare-fun e!785520 () Bool)

(assert (=> b!1386717 (= c!128871 e!785520)))

(declare-fun res!927853 () Bool)

(assert (=> b!1386717 (=> (not res!927853) (not e!785520))))

(assert (=> b!1386717 (= res!927853 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386718 () Bool)

(declare-fun lt!609558 () Unit!46334)

(assert (=> b!1386718 (= e!785521 lt!609558)))

(declare-fun lt!609557 () Unit!46334)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46334)

(assert (=> b!1386718 (= lt!609557 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10164 0))(
  ( (MissingZero!10164 (index!43027 (_ BitVec 32))) (Found!10164 (index!43028 (_ BitVec 32))) (Intermediate!10164 (undefined!10976 Bool) (index!43029 (_ BitVec 32)) (x!124645 (_ BitVec 32))) (Undefined!10164) (MissingVacant!10164 (index!43030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94890 (_ BitVec 32)) SeekEntryResult!10164)

(assert (=> b!1386718 (= (seekEntryOrOpen!0 (select (arr!45821 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45821 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94891 (store (arr!45821 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46371 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46334)

(assert (=> b!1386718 (= lt!609558 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94890 (_ BitVec 32)) Bool)

(assert (=> b!1386718 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386719 () Bool)

(declare-fun Unit!46336 () Unit!46334)

(assert (=> b!1386719 (= e!785521 Unit!46336)))

(declare-fun b!1386720 () Bool)

(declare-fun res!927854 () Bool)

(assert (=> b!1386720 (=> (not res!927854) (not e!785522))))

(declare-datatypes ((List!32349 0))(
  ( (Nil!32346) (Cons!32345 (h!33554 (_ BitVec 64)) (t!47043 List!32349)) )
))
(declare-fun arrayNoDuplicates!0 (array!94890 (_ BitVec 32) List!32349) Bool)

(assert (=> b!1386720 (= res!927854 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32346))))

(declare-fun b!1386721 () Bool)

(declare-fun res!927858 () Bool)

(assert (=> b!1386721 (=> (not res!927858) (not e!785522))))

(assert (=> b!1386721 (= res!927858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386722 () Bool)

(declare-fun res!927857 () Bool)

(assert (=> b!1386722 (=> (not res!927857) (not e!785522))))

(assert (=> b!1386722 (= res!927857 (and (not (= (select (arr!45821 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45821 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386723 () Bool)

(assert (=> b!1386723 (= e!785520 (validKeyInArray!0 (select (arr!45821 a!2938) startIndex!16)))))

(assert (= (and start!118614 res!927855) b!1386716))

(assert (= (and b!1386716 res!927856) b!1386715))

(assert (= (and b!1386715 res!927859) b!1386720))

(assert (= (and b!1386720 res!927854) b!1386721))

(assert (= (and b!1386721 res!927858) b!1386722))

(assert (= (and b!1386722 res!927857) b!1386717))

(assert (= (and b!1386717 res!927853) b!1386723))

(assert (= (and b!1386717 c!128871) b!1386718))

(assert (= (and b!1386717 (not c!128871)) b!1386719))

(declare-fun m!1272111 () Bool)

(assert (=> b!1386720 m!1272111))

(declare-fun m!1272113 () Bool)

(assert (=> b!1386722 m!1272113))

(declare-fun m!1272115 () Bool)

(assert (=> b!1386721 m!1272115))

(assert (=> b!1386715 m!1272113))

(assert (=> b!1386715 m!1272113))

(declare-fun m!1272117 () Bool)

(assert (=> b!1386715 m!1272117))

(declare-fun m!1272119 () Bool)

(assert (=> b!1386718 m!1272119))

(declare-fun m!1272121 () Bool)

(assert (=> b!1386718 m!1272121))

(assert (=> b!1386718 m!1272121))

(declare-fun m!1272123 () Bool)

(assert (=> b!1386718 m!1272123))

(declare-fun m!1272125 () Bool)

(assert (=> b!1386718 m!1272125))

(declare-fun m!1272127 () Bool)

(assert (=> b!1386718 m!1272127))

(declare-fun m!1272129 () Bool)

(assert (=> b!1386718 m!1272129))

(declare-fun m!1272131 () Bool)

(assert (=> b!1386718 m!1272131))

(assert (=> b!1386718 m!1272129))

(declare-fun m!1272133 () Bool)

(assert (=> b!1386718 m!1272133))

(declare-fun m!1272135 () Bool)

(assert (=> start!118614 m!1272135))

(declare-fun m!1272137 () Bool)

(assert (=> start!118614 m!1272137))

(assert (=> b!1386723 m!1272129))

(assert (=> b!1386723 m!1272129))

(declare-fun m!1272139 () Bool)

(assert (=> b!1386723 m!1272139))

(push 1)

(assert (not b!1386718))

(assert (not b!1386715))

(assert (not b!1386721))

(assert (not b!1386720))

(assert (not b!1386723))

(assert (not start!118614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

