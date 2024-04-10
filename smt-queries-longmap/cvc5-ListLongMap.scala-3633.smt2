; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50126 () Bool)

(assert start!50126)

(declare-fun b!548983 () Bool)

(declare-fun res!342220 () Bool)

(declare-fun e!317114 () Bool)

(assert (=> b!548983 (=> (not res!342220) (not e!317114))))

(declare-datatypes ((array!34624 0))(
  ( (array!34625 (arr!16629 (Array (_ BitVec 32) (_ BitVec 64))) (size!16993 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34624)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548983 (= res!342220 (validKeyInArray!0 (select (arr!16629 a!3118) j!142)))))

(declare-fun b!548984 () Bool)

(declare-fun e!317115 () Bool)

(assert (=> b!548984 (= e!317114 e!317115)))

(declare-fun res!342221 () Bool)

(assert (=> b!548984 (=> (not res!342221) (not e!317115))))

(declare-datatypes ((SeekEntryResult!5078 0))(
  ( (MissingZero!5078 (index!22539 (_ BitVec 32))) (Found!5078 (index!22540 (_ BitVec 32))) (Intermediate!5078 (undefined!5890 Bool) (index!22541 (_ BitVec 32)) (x!51477 (_ BitVec 32))) (Undefined!5078) (MissingVacant!5078 (index!22542 (_ BitVec 32))) )
))
(declare-fun lt!249975 () SeekEntryResult!5078)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548984 (= res!342221 (or (= lt!249975 (MissingZero!5078 i!1132)) (= lt!249975 (MissingVacant!5078 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34624 (_ BitVec 32)) SeekEntryResult!5078)

(assert (=> b!548984 (= lt!249975 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548985 () Bool)

(declare-fun res!342217 () Bool)

(assert (=> b!548985 (=> (not res!342217) (not e!317115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34624 (_ BitVec 32)) Bool)

(assert (=> b!548985 (= res!342217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!342219 () Bool)

(assert (=> start!50126 (=> (not res!342219) (not e!317114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50126 (= res!342219 (validMask!0 mask!3119))))

(assert (=> start!50126 e!317114))

(assert (=> start!50126 true))

(declare-fun array_inv!12425 (array!34624) Bool)

(assert (=> start!50126 (array_inv!12425 a!3118)))

(declare-fun b!548986 () Bool)

(declare-fun res!342216 () Bool)

(assert (=> b!548986 (=> (not res!342216) (not e!317115))))

(declare-datatypes ((List!10709 0))(
  ( (Nil!10706) (Cons!10705 (h!11675 (_ BitVec 64)) (t!16937 List!10709)) )
))
(declare-fun arrayNoDuplicates!0 (array!34624 (_ BitVec 32) List!10709) Bool)

(assert (=> b!548986 (= res!342216 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10706))))

(declare-fun b!548987 () Bool)

(assert (=> b!548987 (= e!317115 false)))

(declare-fun lt!249976 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548987 (= lt!249976 (toIndex!0 (select (store (arr!16629 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!548988 () Bool)

(declare-fun res!342214 () Bool)

(assert (=> b!548988 (=> (not res!342214) (not e!317114))))

(assert (=> b!548988 (= res!342214 (and (= (size!16993 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16993 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16993 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548989 () Bool)

(declare-fun res!342215 () Bool)

(assert (=> b!548989 (=> (not res!342215) (not e!317114))))

(assert (=> b!548989 (= res!342215 (validKeyInArray!0 k!1914))))

(declare-fun b!548990 () Bool)

(declare-fun res!342218 () Bool)

(assert (=> b!548990 (=> (not res!342218) (not e!317114))))

(declare-fun arrayContainsKey!0 (array!34624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548990 (= res!342218 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50126 res!342219) b!548988))

(assert (= (and b!548988 res!342214) b!548983))

(assert (= (and b!548983 res!342220) b!548989))

(assert (= (and b!548989 res!342215) b!548990))

(assert (= (and b!548990 res!342218) b!548984))

(assert (= (and b!548984 res!342221) b!548985))

(assert (= (and b!548985 res!342217) b!548986))

(assert (= (and b!548986 res!342216) b!548987))

(declare-fun m!525891 () Bool)

(assert (=> b!548985 m!525891))

(declare-fun m!525893 () Bool)

(assert (=> b!548987 m!525893))

(declare-fun m!525895 () Bool)

(assert (=> b!548987 m!525895))

(assert (=> b!548987 m!525895))

(declare-fun m!525897 () Bool)

(assert (=> b!548987 m!525897))

(declare-fun m!525899 () Bool)

(assert (=> b!548989 m!525899))

(declare-fun m!525901 () Bool)

(assert (=> b!548990 m!525901))

(declare-fun m!525903 () Bool)

(assert (=> b!548986 m!525903))

(declare-fun m!525905 () Bool)

(assert (=> b!548983 m!525905))

(assert (=> b!548983 m!525905))

(declare-fun m!525907 () Bool)

(assert (=> b!548983 m!525907))

(declare-fun m!525909 () Bool)

(assert (=> start!50126 m!525909))

(declare-fun m!525911 () Bool)

(assert (=> start!50126 m!525911))

(declare-fun m!525913 () Bool)

(assert (=> b!548984 m!525913))

(push 1)

