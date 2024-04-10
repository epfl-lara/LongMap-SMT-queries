; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32222 () Bool)

(assert start!32222)

(declare-fun b!320874 () Bool)

(declare-fun res!174994 () Bool)

(declare-fun e!199004 () Bool)

(assert (=> b!320874 (=> (not res!174994) (not e!199004))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320874 (= res!174994 (validKeyInArray!0 k!2497))))

(declare-fun b!320875 () Bool)

(declare-fun res!174995 () Bool)

(assert (=> b!320875 (=> (not res!174995) (not e!199004))))

(declare-datatypes ((array!16412 0))(
  ( (array!16413 (arr!7765 (Array (_ BitVec 32) (_ BitVec 64))) (size!8117 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16412)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2896 0))(
  ( (MissingZero!2896 (index!13760 (_ BitVec 32))) (Found!2896 (index!13761 (_ BitVec 32))) (Intermediate!2896 (undefined!3708 Bool) (index!13762 (_ BitVec 32)) (x!32027 (_ BitVec 32))) (Undefined!2896) (MissingVacant!2896 (index!13763 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16412 (_ BitVec 32)) SeekEntryResult!2896)

(assert (=> b!320875 (= res!174995 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2896 i!1250)))))

(declare-fun b!320876 () Bool)

(declare-fun res!175000 () Bool)

(assert (=> b!320876 (=> (not res!175000) (not e!199004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16412 (_ BitVec 32)) Bool)

(assert (=> b!320876 (= res!175000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320877 () Bool)

(declare-fun res!174996 () Bool)

(assert (=> b!320877 (=> (not res!174996) (not e!199004))))

(assert (=> b!320877 (= res!174996 (and (= (size!8117 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8117 a!3305))))))

(declare-fun b!320878 () Bool)

(declare-fun res!175001 () Bool)

(assert (=> b!320878 (=> (not res!175001) (not e!199004))))

(declare-fun arrayContainsKey!0 (array!16412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320878 (= res!175001 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320879 () Bool)

(declare-fun res!175002 () Bool)

(declare-fun e!199006 () Bool)

(assert (=> b!320879 (=> (not res!175002) (not e!199006))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!320879 (= res!175002 (and (= (select (arr!7765 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8117 a!3305))))))

(declare-fun b!320880 () Bool)

(declare-fun res!174998 () Bool)

(assert (=> b!320880 (=> (not res!174998) (not e!199006))))

(declare-fun lt!156129 () SeekEntryResult!2896)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16412 (_ BitVec 32)) SeekEntryResult!2896)

(assert (=> b!320880 (= res!174998 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156129))))

(declare-fun b!320881 () Bool)

(assert (=> b!320881 (= e!199004 e!199006)))

(declare-fun res!174999 () Bool)

(assert (=> b!320881 (=> (not res!174999) (not e!199006))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320881 (= res!174999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156129))))

(assert (=> b!320881 (= lt!156129 (Intermediate!2896 false resIndex!58 resX!58))))

(declare-fun res!174997 () Bool)

(assert (=> start!32222 (=> (not res!174997) (not e!199004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32222 (= res!174997 (validMask!0 mask!3777))))

(assert (=> start!32222 e!199004))

(declare-fun array_inv!5728 (array!16412) Bool)

(assert (=> start!32222 (array_inv!5728 a!3305)))

(assert (=> start!32222 true))

(declare-fun b!320882 () Bool)

(assert (=> b!320882 (= e!199006 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7765 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7765 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7765 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(assert (= (and start!32222 res!174997) b!320877))

(assert (= (and b!320877 res!174996) b!320874))

(assert (= (and b!320874 res!174994) b!320878))

(assert (= (and b!320878 res!175001) b!320875))

(assert (= (and b!320875 res!174995) b!320876))

(assert (= (and b!320876 res!175000) b!320881))

(assert (= (and b!320881 res!174999) b!320879))

(assert (= (and b!320879 res!175002) b!320880))

(assert (= (and b!320880 res!174998) b!320882))

(declare-fun m!329119 () Bool)

(assert (=> b!320882 m!329119))

(declare-fun m!329121 () Bool)

(assert (=> b!320881 m!329121))

(assert (=> b!320881 m!329121))

(declare-fun m!329123 () Bool)

(assert (=> b!320881 m!329123))

(declare-fun m!329125 () Bool)

(assert (=> b!320874 m!329125))

(declare-fun m!329127 () Bool)

(assert (=> start!32222 m!329127))

(declare-fun m!329129 () Bool)

(assert (=> start!32222 m!329129))

(declare-fun m!329131 () Bool)

(assert (=> b!320879 m!329131))

(declare-fun m!329133 () Bool)

(assert (=> b!320875 m!329133))

(declare-fun m!329135 () Bool)

(assert (=> b!320876 m!329135))

(declare-fun m!329137 () Bool)

(assert (=> b!320880 m!329137))

(declare-fun m!329139 () Bool)

(assert (=> b!320878 m!329139))

(push 1)

