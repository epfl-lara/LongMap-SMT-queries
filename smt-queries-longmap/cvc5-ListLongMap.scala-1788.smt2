; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32428 () Bool)

(assert start!32428)

(declare-fun b!323876 () Bool)

(declare-fun res!177253 () Bool)

(declare-fun e!200097 () Bool)

(assert (=> b!323876 (=> (not res!177253) (not e!200097))))

(declare-datatypes ((array!16567 0))(
  ( (array!16568 (arr!7841 (Array (_ BitVec 32) (_ BitVec 64))) (size!8193 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16567)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2972 0))(
  ( (MissingZero!2972 (index!14064 (_ BitVec 32))) (Found!2972 (index!14065 (_ BitVec 32))) (Intermediate!2972 (undefined!3784 Bool) (index!14066 (_ BitVec 32)) (x!32320 (_ BitVec 32))) (Undefined!2972) (MissingVacant!2972 (index!14067 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16567 (_ BitVec 32)) SeekEntryResult!2972)

(assert (=> b!323876 (= res!177253 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2972 i!1250)))))

(declare-fun b!323877 () Bool)

(declare-fun res!177258 () Bool)

(assert (=> b!323877 (=> (not res!177258) (not e!200097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16567 (_ BitVec 32)) Bool)

(assert (=> b!323877 (= res!177258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323878 () Bool)

(declare-fun res!177255 () Bool)

(assert (=> b!323878 (=> (not res!177255) (not e!200097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323878 (= res!177255 (validKeyInArray!0 k!2497))))

(declare-fun b!323879 () Bool)

(assert (=> b!323879 false))

(declare-datatypes ((Unit!10067 0))(
  ( (Unit!10068) )
))
(declare-fun lt!156719 () Unit!10067)

(declare-fun e!200101 () Unit!10067)

(assert (=> b!323879 (= lt!156719 e!200101)))

(declare-fun c!50941 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16567 (_ BitVec 32)) SeekEntryResult!2972)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323879 (= c!50941 (is-Intermediate!2972 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!200098 () Unit!10067)

(declare-fun Unit!10069 () Unit!10067)

(assert (=> b!323879 (= e!200098 Unit!10069)))

(declare-fun b!323880 () Bool)

(assert (=> b!323880 false))

(declare-fun Unit!10070 () Unit!10067)

(assert (=> b!323880 (= e!200098 Unit!10070)))

(declare-fun b!323881 () Bool)

(declare-fun Unit!10071 () Unit!10067)

(assert (=> b!323881 (= e!200101 Unit!10071)))

(assert (=> b!323881 false))

(declare-fun b!323882 () Bool)

(declare-fun Unit!10072 () Unit!10067)

(assert (=> b!323882 (= e!200101 Unit!10072)))

(declare-fun res!177250 () Bool)

(assert (=> start!32428 (=> (not res!177250) (not e!200097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32428 (= res!177250 (validMask!0 mask!3777))))

(assert (=> start!32428 e!200097))

(declare-fun array_inv!5804 (array!16567) Bool)

(assert (=> start!32428 (array_inv!5804 a!3305)))

(assert (=> start!32428 true))

(declare-fun b!323883 () Bool)

(declare-fun res!177256 () Bool)

(assert (=> b!323883 (=> (not res!177256) (not e!200097))))

(declare-fun arrayContainsKey!0 (array!16567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323883 (= res!177256 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323884 () Bool)

(declare-fun res!177254 () Bool)

(declare-fun e!200096 () Bool)

(assert (=> b!323884 (=> (not res!177254) (not e!200096))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323884 (= res!177254 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7841 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323885 () Bool)

(assert (=> b!323885 (= e!200096 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323885 (= index!1840 resIndex!58)))

(declare-fun lt!156718 () Unit!10067)

(declare-fun e!200099 () Unit!10067)

(assert (=> b!323885 (= lt!156718 e!200099)))

(declare-fun c!50942 () Bool)

(assert (=> b!323885 (= c!50942 (not (= resIndex!58 index!1840)))))

(declare-fun b!323886 () Bool)

(declare-fun res!177249 () Bool)

(assert (=> b!323886 (=> (not res!177249) (not e!200097))))

(assert (=> b!323886 (= res!177249 (and (= (size!8193 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8193 a!3305))))))

(declare-fun b!323887 () Bool)

(declare-fun res!177257 () Bool)

(assert (=> b!323887 (=> (not res!177257) (not e!200096))))

(assert (=> b!323887 (= res!177257 (and (= (select (arr!7841 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8193 a!3305))))))

(declare-fun b!323888 () Bool)

(assert (=> b!323888 (= e!200097 e!200096)))

(declare-fun res!177251 () Bool)

(assert (=> b!323888 (=> (not res!177251) (not e!200096))))

(declare-fun lt!156720 () SeekEntryResult!2972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323888 (= res!177251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156720))))

(assert (=> b!323888 (= lt!156720 (Intermediate!2972 false resIndex!58 resX!58))))

(declare-fun b!323889 () Bool)

(declare-fun Unit!10073 () Unit!10067)

(assert (=> b!323889 (= e!200099 Unit!10073)))

(declare-fun b!323890 () Bool)

(assert (=> b!323890 (= e!200099 e!200098)))

(declare-fun c!50943 () Bool)

(assert (=> b!323890 (= c!50943 (or (= (select (arr!7841 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7841 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323891 () Bool)

(declare-fun res!177252 () Bool)

(assert (=> b!323891 (=> (not res!177252) (not e!200096))))

(assert (=> b!323891 (= res!177252 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156720))))

(assert (= (and start!32428 res!177250) b!323886))

(assert (= (and b!323886 res!177249) b!323878))

(assert (= (and b!323878 res!177255) b!323883))

(assert (= (and b!323883 res!177256) b!323876))

(assert (= (and b!323876 res!177253) b!323877))

(assert (= (and b!323877 res!177258) b!323888))

(assert (= (and b!323888 res!177251) b!323887))

(assert (= (and b!323887 res!177257) b!323891))

(assert (= (and b!323891 res!177252) b!323884))

(assert (= (and b!323884 res!177254) b!323885))

(assert (= (and b!323885 c!50942) b!323890))

(assert (= (and b!323885 (not c!50942)) b!323889))

(assert (= (and b!323890 c!50943) b!323880))

(assert (= (and b!323890 (not c!50943)) b!323879))

(assert (= (and b!323879 c!50941) b!323882))

(assert (= (and b!323879 (not c!50941)) b!323881))

(declare-fun m!331055 () Bool)

(assert (=> b!323878 m!331055))

(declare-fun m!331057 () Bool)

(assert (=> b!323888 m!331057))

(assert (=> b!323888 m!331057))

(declare-fun m!331059 () Bool)

(assert (=> b!323888 m!331059))

(declare-fun m!331061 () Bool)

(assert (=> b!323876 m!331061))

(declare-fun m!331063 () Bool)

(assert (=> b!323877 m!331063))

(declare-fun m!331065 () Bool)

(assert (=> b!323890 m!331065))

(assert (=> b!323884 m!331065))

(declare-fun m!331067 () Bool)

(assert (=> b!323891 m!331067))

(declare-fun m!331069 () Bool)

(assert (=> start!32428 m!331069))

(declare-fun m!331071 () Bool)

(assert (=> start!32428 m!331071))

(declare-fun m!331073 () Bool)

(assert (=> b!323883 m!331073))

(declare-fun m!331075 () Bool)

(assert (=> b!323887 m!331075))

(declare-fun m!331077 () Bool)

(assert (=> b!323879 m!331077))

(assert (=> b!323879 m!331077))

(declare-fun m!331079 () Bool)

(assert (=> b!323879 m!331079))

(push 1)

