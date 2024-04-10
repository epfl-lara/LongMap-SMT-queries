; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48624 () Bool)

(assert start!48624)

(declare-fun b!534056 () Bool)

(declare-fun e!310599 () Bool)

(declare-fun e!310598 () Bool)

(assert (=> b!534056 (= e!310599 e!310598)))

(declare-fun res!329263 () Bool)

(assert (=> b!534056 (=> (not res!329263) (not e!310598))))

(declare-datatypes ((SeekEntryResult!4715 0))(
  ( (MissingZero!4715 (index!21084 (_ BitVec 32))) (Found!4715 (index!21085 (_ BitVec 32))) (Intermediate!4715 (undefined!5527 Bool) (index!21086 (_ BitVec 32)) (x!50050 (_ BitVec 32))) (Undefined!4715) (MissingVacant!4715 (index!21087 (_ BitVec 32))) )
))
(declare-fun lt!245557 () SeekEntryResult!4715)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534056 (= res!329263 (or (= lt!245557 (MissingZero!4715 i!1153)) (= lt!245557 (MissingVacant!4715 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33836 0))(
  ( (array!33837 (arr!16257 (Array (_ BitVec 32) (_ BitVec 64))) (size!16621 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33836)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33836 (_ BitVec 32)) SeekEntryResult!4715)

(assert (=> b!534056 (= lt!245557 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534057 () Bool)

(declare-fun res!329262 () Bool)

(assert (=> b!534057 (=> (not res!329262) (not e!310599))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!534057 (= res!329262 (and (= (size!16621 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16621 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16621 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534058 () Bool)

(declare-fun res!329266 () Bool)

(assert (=> b!534058 (=> (not res!329266) (not e!310598))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33836 (_ BitVec 32)) SeekEntryResult!4715)

(assert (=> b!534058 (= res!329266 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16257 a!3154) j!147) a!3154 mask!3216) (Intermediate!4715 false resIndex!32 resX!32)))))

(declare-fun res!329264 () Bool)

(assert (=> start!48624 (=> (not res!329264) (not e!310599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48624 (= res!329264 (validMask!0 mask!3216))))

(assert (=> start!48624 e!310599))

(assert (=> start!48624 true))

(declare-fun array_inv!12053 (array!33836) Bool)

(assert (=> start!48624 (array_inv!12053 a!3154)))

(declare-fun b!534059 () Bool)

(declare-fun res!329268 () Bool)

(assert (=> b!534059 (=> (not res!329268) (not e!310599))))

(declare-fun arrayContainsKey!0 (array!33836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534059 (= res!329268 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534060 () Bool)

(declare-fun res!329270 () Bool)

(assert (=> b!534060 (=> (not res!329270) (not e!310599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534060 (= res!329270 (validKeyInArray!0 (select (arr!16257 a!3154) j!147)))))

(declare-fun b!534061 () Bool)

(assert (=> b!534061 (= e!310598 false)))

(declare-fun lt!245556 () SeekEntryResult!4715)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534061 (= lt!245556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16257 a!3154) j!147) mask!3216) (select (arr!16257 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534062 () Bool)

(declare-fun res!329269 () Bool)

(assert (=> b!534062 (=> (not res!329269) (not e!310598))))

(assert (=> b!534062 (= res!329269 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16621 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16621 a!3154)) (= (select (arr!16257 a!3154) resIndex!32) (select (arr!16257 a!3154) j!147))))))

(declare-fun b!534063 () Bool)

(declare-fun res!329267 () Bool)

(assert (=> b!534063 (=> (not res!329267) (not e!310599))))

(assert (=> b!534063 (= res!329267 (validKeyInArray!0 k!1998))))

(declare-fun b!534064 () Bool)

(declare-fun res!329265 () Bool)

(assert (=> b!534064 (=> (not res!329265) (not e!310598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33836 (_ BitVec 32)) Bool)

(assert (=> b!534064 (= res!329265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534065 () Bool)

(declare-fun res!329261 () Bool)

(assert (=> b!534065 (=> (not res!329261) (not e!310598))))

(declare-datatypes ((List!10376 0))(
  ( (Nil!10373) (Cons!10372 (h!11315 (_ BitVec 64)) (t!16604 List!10376)) )
))
(declare-fun arrayNoDuplicates!0 (array!33836 (_ BitVec 32) List!10376) Bool)

(assert (=> b!534065 (= res!329261 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10373))))

(assert (= (and start!48624 res!329264) b!534057))

(assert (= (and b!534057 res!329262) b!534060))

(assert (= (and b!534060 res!329270) b!534063))

(assert (= (and b!534063 res!329267) b!534059))

(assert (= (and b!534059 res!329268) b!534056))

(assert (= (and b!534056 res!329263) b!534064))

(assert (= (and b!534064 res!329265) b!534065))

(assert (= (and b!534065 res!329261) b!534062))

(assert (= (and b!534062 res!329269) b!534058))

(assert (= (and b!534058 res!329266) b!534061))

(declare-fun m!513825 () Bool)

(assert (=> b!534064 m!513825))

(declare-fun m!513827 () Bool)

(assert (=> b!534058 m!513827))

(assert (=> b!534058 m!513827))

(declare-fun m!513829 () Bool)

(assert (=> b!534058 m!513829))

(declare-fun m!513831 () Bool)

(assert (=> b!534056 m!513831))

(assert (=> b!534061 m!513827))

(assert (=> b!534061 m!513827))

(declare-fun m!513833 () Bool)

(assert (=> b!534061 m!513833))

(assert (=> b!534061 m!513833))

(assert (=> b!534061 m!513827))

(declare-fun m!513835 () Bool)

(assert (=> b!534061 m!513835))

(declare-fun m!513837 () Bool)

(assert (=> b!534063 m!513837))

(declare-fun m!513839 () Bool)

(assert (=> b!534065 m!513839))

(declare-fun m!513841 () Bool)

(assert (=> start!48624 m!513841))

(declare-fun m!513843 () Bool)

(assert (=> start!48624 m!513843))

(declare-fun m!513845 () Bool)

(assert (=> b!534062 m!513845))

(assert (=> b!534062 m!513827))

(declare-fun m!513847 () Bool)

(assert (=> b!534059 m!513847))

(assert (=> b!534060 m!513827))

(assert (=> b!534060 m!513827))

(declare-fun m!513849 () Bool)

(assert (=> b!534060 m!513849))

(push 1)

