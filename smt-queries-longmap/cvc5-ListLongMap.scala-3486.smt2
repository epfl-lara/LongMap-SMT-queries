; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48384 () Bool)

(assert start!48384)

(declare-fun b!531649 () Bool)

(declare-fun res!327139 () Bool)

(declare-fun e!309671 () Bool)

(assert (=> b!531649 (=> (not res!327139) (not e!309671))))

(declare-datatypes ((array!33692 0))(
  ( (array!33693 (arr!16188 (Array (_ BitVec 32) (_ BitVec 64))) (size!16552 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33692)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531649 (= res!327139 (validKeyInArray!0 (select (arr!16188 a!3154) j!147)))))

(declare-fun b!531650 () Bool)

(declare-fun res!327141 () Bool)

(assert (=> b!531650 (=> (not res!327141) (not e!309671))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!531650 (= res!327141 (validKeyInArray!0 k!1998))))

(declare-fun res!327140 () Bool)

(assert (=> start!48384 (=> (not res!327140) (not e!309671))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48384 (= res!327140 (validMask!0 mask!3216))))

(assert (=> start!48384 e!309671))

(assert (=> start!48384 true))

(declare-fun array_inv!11984 (array!33692) Bool)

(assert (=> start!48384 (array_inv!11984 a!3154)))

(declare-fun b!531651 () Bool)

(declare-fun res!327144 () Bool)

(assert (=> b!531651 (=> (not res!327144) (not e!309671))))

(declare-fun arrayContainsKey!0 (array!33692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531651 (= res!327144 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531652 () Bool)

(declare-fun res!327145 () Bool)

(declare-fun e!309670 () Bool)

(assert (=> b!531652 (=> (not res!327145) (not e!309670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33692 (_ BitVec 32)) Bool)

(assert (=> b!531652 (= res!327145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531653 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531653 (= e!309670 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16552 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16552 a!3154)) (= (select (arr!16188 a!3154) resIndex!32) (select (arr!16188 a!3154) j!147)) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!531654 () Bool)

(assert (=> b!531654 (= e!309671 e!309670)))

(declare-fun res!327142 () Bool)

(assert (=> b!531654 (=> (not res!327142) (not e!309670))))

(declare-datatypes ((SeekEntryResult!4646 0))(
  ( (MissingZero!4646 (index!20808 (_ BitVec 32))) (Found!4646 (index!20809 (_ BitVec 32))) (Intermediate!4646 (undefined!5458 Bool) (index!20810 (_ BitVec 32)) (x!49788 (_ BitVec 32))) (Undefined!4646) (MissingVacant!4646 (index!20811 (_ BitVec 32))) )
))
(declare-fun lt!245050 () SeekEntryResult!4646)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531654 (= res!327142 (or (= lt!245050 (MissingZero!4646 i!1153)) (= lt!245050 (MissingVacant!4646 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33692 (_ BitVec 32)) SeekEntryResult!4646)

(assert (=> b!531654 (= lt!245050 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531655 () Bool)

(declare-fun res!327146 () Bool)

(assert (=> b!531655 (=> (not res!327146) (not e!309671))))

(assert (=> b!531655 (= res!327146 (and (= (size!16552 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16552 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16552 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531656 () Bool)

(declare-fun res!327143 () Bool)

(assert (=> b!531656 (=> (not res!327143) (not e!309670))))

(declare-datatypes ((List!10307 0))(
  ( (Nil!10304) (Cons!10303 (h!11243 (_ BitVec 64)) (t!16535 List!10307)) )
))
(declare-fun arrayNoDuplicates!0 (array!33692 (_ BitVec 32) List!10307) Bool)

(assert (=> b!531656 (= res!327143 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10304))))

(assert (= (and start!48384 res!327140) b!531655))

(assert (= (and b!531655 res!327146) b!531649))

(assert (= (and b!531649 res!327139) b!531650))

(assert (= (and b!531650 res!327141) b!531651))

(assert (= (and b!531651 res!327144) b!531654))

(assert (= (and b!531654 res!327142) b!531652))

(assert (= (and b!531652 res!327145) b!531656))

(assert (= (and b!531656 res!327143) b!531653))

(declare-fun m!512025 () Bool)

(assert (=> b!531654 m!512025))

(declare-fun m!512027 () Bool)

(assert (=> b!531650 m!512027))

(declare-fun m!512029 () Bool)

(assert (=> b!531656 m!512029))

(declare-fun m!512031 () Bool)

(assert (=> b!531653 m!512031))

(declare-fun m!512033 () Bool)

(assert (=> b!531653 m!512033))

(declare-fun m!512035 () Bool)

(assert (=> b!531652 m!512035))

(declare-fun m!512037 () Bool)

(assert (=> start!48384 m!512037))

(declare-fun m!512039 () Bool)

(assert (=> start!48384 m!512039))

(assert (=> b!531649 m!512033))

(assert (=> b!531649 m!512033))

(declare-fun m!512041 () Bool)

(assert (=> b!531649 m!512041))

(declare-fun m!512043 () Bool)

(assert (=> b!531651 m!512043))

(push 1)

(assert (not b!531654))

(assert (not b!531651))

(assert (not b!531656))

(assert (not b!531650))

(assert (not start!48384))

(assert (not b!531649))

