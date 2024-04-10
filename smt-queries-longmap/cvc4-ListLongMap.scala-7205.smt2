; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92296 () Bool)

(assert start!92296)

(declare-fun b!1048965 () Bool)

(declare-fun e!595064 () Bool)

(declare-fun e!595060 () Bool)

(assert (=> b!1048965 (= e!595064 (not e!595060))))

(declare-fun res!698098 () Bool)

(assert (=> b!1048965 (=> res!698098 e!595060)))

(declare-fun lt!463344 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048965 (= res!698098 (bvsle lt!463344 i!1381))))

(declare-fun e!595066 () Bool)

(assert (=> b!1048965 e!595066))

(declare-fun res!698095 () Bool)

(assert (=> b!1048965 (=> (not res!698095) (not e!595066))))

(declare-datatypes ((array!66097 0))(
  ( (array!66098 (arr!31788 (Array (_ BitVec 32) (_ BitVec 64))) (size!32324 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66097)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1048965 (= res!698095 (= (select (store (arr!31788 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463344) k!2747))))

(declare-fun b!1048967 () Bool)

(declare-fun res!698099 () Bool)

(declare-fun e!595062 () Bool)

(assert (=> b!1048967 (=> (not res!698099) (not e!595062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048967 (= res!698099 (validKeyInArray!0 k!2747))))

(declare-fun b!1048968 () Bool)

(declare-fun e!595061 () Bool)

(assert (=> b!1048968 (= e!595061 e!595064)))

(declare-fun res!698096 () Bool)

(assert (=> b!1048968 (=> (not res!698096) (not e!595064))))

(assert (=> b!1048968 (= res!698096 (not (= lt!463344 i!1381)))))

(declare-fun lt!463343 () array!66097)

(declare-fun arrayScanForKey!0 (array!66097 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048968 (= lt!463344 (arrayScanForKey!0 lt!463343 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048969 () Bool)

(assert (=> b!1048969 (= e!595062 e!595061)))

(declare-fun res!698093 () Bool)

(assert (=> b!1048969 (=> (not res!698093) (not e!595061))))

(declare-fun arrayContainsKey!0 (array!66097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048969 (= res!698093 (arrayContainsKey!0 lt!463343 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048969 (= lt!463343 (array!66098 (store (arr!31788 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32324 a!3488)))))

(declare-fun b!1048970 () Bool)

(declare-fun res!698094 () Bool)

(assert (=> b!1048970 (=> (not res!698094) (not e!595062))))

(assert (=> b!1048970 (= res!698094 (= (select (arr!31788 a!3488) i!1381) k!2747))))

(declare-fun e!595063 () Bool)

(declare-fun b!1048971 () Bool)

(assert (=> b!1048971 (= e!595063 (arrayContainsKey!0 a!3488 k!2747 lt!463344))))

(declare-fun b!1048972 () Bool)

(assert (=> b!1048972 (= e!595060 true)))

(declare-datatypes ((List!22100 0))(
  ( (Nil!22097) (Cons!22096 (h!23305 (_ BitVec 64)) (t!31407 List!22100)) )
))
(declare-fun arrayNoDuplicates!0 (array!66097 (_ BitVec 32) List!22100) Bool)

(assert (=> b!1048972 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22097)))

(declare-datatypes ((Unit!34296 0))(
  ( (Unit!34297) )
))
(declare-fun lt!463342 () Unit!34296)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66097 (_ BitVec 32) (_ BitVec 32)) Unit!34296)

(assert (=> b!1048972 (= lt!463342 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1048973 () Bool)

(declare-fun res!698091 () Bool)

(assert (=> b!1048973 (=> (not res!698091) (not e!595062))))

(assert (=> b!1048973 (= res!698091 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22097))))

(declare-fun res!698092 () Bool)

(assert (=> start!92296 (=> (not res!698092) (not e!595062))))

(assert (=> start!92296 (= res!698092 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32324 a!3488)) (bvslt (size!32324 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92296 e!595062))

(assert (=> start!92296 true))

(declare-fun array_inv!24568 (array!66097) Bool)

(assert (=> start!92296 (array_inv!24568 a!3488)))

(declare-fun b!1048966 () Bool)

(assert (=> b!1048966 (= e!595066 e!595063)))

(declare-fun res!698097 () Bool)

(assert (=> b!1048966 (=> res!698097 e!595063)))

(assert (=> b!1048966 (= res!698097 (bvsle lt!463344 i!1381))))

(assert (= (and start!92296 res!698092) b!1048973))

(assert (= (and b!1048973 res!698091) b!1048967))

(assert (= (and b!1048967 res!698099) b!1048970))

(assert (= (and b!1048970 res!698094) b!1048969))

(assert (= (and b!1048969 res!698093) b!1048968))

(assert (= (and b!1048968 res!698096) b!1048965))

(assert (= (and b!1048965 res!698095) b!1048966))

(assert (= (and b!1048966 (not res!698097)) b!1048971))

(assert (= (and b!1048965 (not res!698098)) b!1048972))

(declare-fun m!969811 () Bool)

(assert (=> b!1048971 m!969811))

(declare-fun m!969813 () Bool)

(assert (=> b!1048970 m!969813))

(declare-fun m!969815 () Bool)

(assert (=> b!1048973 m!969815))

(declare-fun m!969817 () Bool)

(assert (=> b!1048972 m!969817))

(declare-fun m!969819 () Bool)

(assert (=> b!1048972 m!969819))

(declare-fun m!969821 () Bool)

(assert (=> b!1048967 m!969821))

(declare-fun m!969823 () Bool)

(assert (=> start!92296 m!969823))

(declare-fun m!969825 () Bool)

(assert (=> b!1048969 m!969825))

(declare-fun m!969827 () Bool)

(assert (=> b!1048969 m!969827))

(assert (=> b!1048965 m!969827))

(declare-fun m!969829 () Bool)

(assert (=> b!1048965 m!969829))

(declare-fun m!969831 () Bool)

(assert (=> b!1048968 m!969831))

(push 1)

