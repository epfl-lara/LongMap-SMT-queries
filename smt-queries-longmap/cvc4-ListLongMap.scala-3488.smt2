; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48400 () Bool)

(assert start!48400)

(declare-fun b!531832 () Bool)

(declare-fun e!309744 () Bool)

(declare-fun e!309743 () Bool)

(assert (=> b!531832 (= e!309744 e!309743)))

(declare-fun res!327328 () Bool)

(assert (=> b!531832 (=> (not res!327328) (not e!309743))))

(declare-datatypes ((SeekEntryResult!4654 0))(
  ( (MissingZero!4654 (index!20840 (_ BitVec 32))) (Found!4654 (index!20841 (_ BitVec 32))) (Intermediate!4654 (undefined!5466 Bool) (index!20842 (_ BitVec 32)) (x!49812 (_ BitVec 32))) (Undefined!4654) (MissingVacant!4654 (index!20843 (_ BitVec 32))) )
))
(declare-fun lt!245083 () SeekEntryResult!4654)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531832 (= res!327328 (or (= lt!245083 (MissingZero!4654 i!1153)) (= lt!245083 (MissingVacant!4654 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33708 0))(
  ( (array!33709 (arr!16196 (Array (_ BitVec 32) (_ BitVec 64))) (size!16560 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33708)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33708 (_ BitVec 32)) SeekEntryResult!4654)

(assert (=> b!531832 (= lt!245083 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!327322 () Bool)

(assert (=> start!48400 (=> (not res!327322) (not e!309744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48400 (= res!327322 (validMask!0 mask!3216))))

(assert (=> start!48400 e!309744))

(assert (=> start!48400 true))

(declare-fun array_inv!11992 (array!33708) Bool)

(assert (=> start!48400 (array_inv!11992 a!3154)))

(declare-fun b!531833 () Bool)

(declare-fun res!327327 () Bool)

(assert (=> b!531833 (=> (not res!327327) (not e!309744))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531833 (= res!327327 (and (= (size!16560 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16560 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16560 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531834 () Bool)

(declare-fun res!327329 () Bool)

(assert (=> b!531834 (=> (not res!327329) (not e!309743))))

(declare-datatypes ((List!10315 0))(
  ( (Nil!10312) (Cons!10311 (h!11251 (_ BitVec 64)) (t!16543 List!10315)) )
))
(declare-fun arrayNoDuplicates!0 (array!33708 (_ BitVec 32) List!10315) Bool)

(assert (=> b!531834 (= res!327329 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10312))))

(declare-fun b!531835 () Bool)

(declare-fun res!327324 () Bool)

(assert (=> b!531835 (=> (not res!327324) (not e!309743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33708 (_ BitVec 32)) Bool)

(assert (=> b!531835 (= res!327324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531836 () Bool)

(declare-fun res!327326 () Bool)

(assert (=> b!531836 (=> (not res!327326) (not e!309744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531836 (= res!327326 (validKeyInArray!0 (select (arr!16196 a!3154) j!147)))))

(declare-fun b!531837 () Bool)

(declare-fun res!327325 () Bool)

(assert (=> b!531837 (=> (not res!327325) (not e!309744))))

(declare-fun arrayContainsKey!0 (array!33708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531837 (= res!327325 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531838 () Bool)

(declare-fun res!327323 () Bool)

(assert (=> b!531838 (=> (not res!327323) (not e!309744))))

(assert (=> b!531838 (= res!327323 (validKeyInArray!0 k!1998))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun b!531839 () Bool)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531839 (= e!309743 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16560 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16560 a!3154)) (= (select (arr!16196 a!3154) resIndex!32) (select (arr!16196 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(assert (= (and start!48400 res!327322) b!531833))

(assert (= (and b!531833 res!327327) b!531836))

(assert (= (and b!531836 res!327326) b!531838))

(assert (= (and b!531838 res!327323) b!531837))

(assert (= (and b!531837 res!327325) b!531832))

(assert (= (and b!531832 res!327328) b!531835))

(assert (= (and b!531835 res!327324) b!531834))

(assert (= (and b!531834 res!327329) b!531839))

(declare-fun m!512179 () Bool)

(assert (=> b!531834 m!512179))

(declare-fun m!512181 () Bool)

(assert (=> b!531836 m!512181))

(assert (=> b!531836 m!512181))

(declare-fun m!512183 () Bool)

(assert (=> b!531836 m!512183))

(declare-fun m!512185 () Bool)

(assert (=> b!531835 m!512185))

(declare-fun m!512187 () Bool)

(assert (=> b!531832 m!512187))

(declare-fun m!512189 () Bool)

(assert (=> b!531838 m!512189))

(declare-fun m!512191 () Bool)

(assert (=> b!531837 m!512191))

(declare-fun m!512193 () Bool)

(assert (=> b!531839 m!512193))

(assert (=> b!531839 m!512181))

(declare-fun m!512195 () Bool)

(assert (=> start!48400 m!512195))

(declare-fun m!512197 () Bool)

(assert (=> start!48400 m!512197))

(push 1)

(assert (not b!531835))

(assert (not b!531832))

(assert (not b!531837))

(assert (not b!531834))

(assert (not start!48400))

(assert (not b!531838))

(assert (not b!531836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

