; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134828 () Bool)

(assert start!134828)

(declare-fun res!1073915 () Bool)

(declare-fun e!876412 () Bool)

(assert (=> start!134828 (=> (not res!1073915) (not e!876412))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134828 (= res!1073915 (validMask!0 mask!889))))

(assert (=> start!134828 e!876412))

(assert (=> start!134828 true))

(declare-datatypes ((array!104925 0))(
  ( (array!104926 (arr!50632 (Array (_ BitVec 32) (_ BitVec 64))) (size!51182 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104925)

(declare-fun array_inv!39359 (array!104925) Bool)

(assert (=> start!134828 (array_inv!39359 _keys!600)))

(declare-fun b!1571797 () Bool)

(declare-fun res!1073914 () Bool)

(assert (=> b!1571797 (=> (not res!1073914) (not e!876412))))

(assert (=> b!1571797 (= res!1073914 (= (size!51182 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571798 () Bool)

(declare-fun res!1073916 () Bool)

(assert (=> b!1571798 (=> (not res!1073916) (not e!876412))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571798 (= res!1073916 (validKeyInArray!0 k!754))))

(declare-fun b!1571799 () Bool)

(assert (=> b!1571799 (= e!876412 false)))

(declare-datatypes ((SeekEntryResult!13545 0))(
  ( (MissingZero!13545 (index!56578 (_ BitVec 32))) (Found!13545 (index!56579 (_ BitVec 32))) (Intermediate!13545 (undefined!14357 Bool) (index!56580 (_ BitVec 32)) (x!141349 (_ BitVec 32))) (Undefined!13545) (MissingVacant!13545 (index!56581 (_ BitVec 32))) )
))
(declare-fun lt!673744 () SeekEntryResult!13545)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104925 (_ BitVec 32)) SeekEntryResult!13545)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571799 (= lt!673744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134828 res!1073915) b!1571797))

(assert (= (and b!1571797 res!1073914) b!1571798))

(assert (= (and b!1571798 res!1073916) b!1571799))

(declare-fun m!1445671 () Bool)

(assert (=> start!134828 m!1445671))

(declare-fun m!1445673 () Bool)

(assert (=> start!134828 m!1445673))

(declare-fun m!1445675 () Bool)

(assert (=> b!1571798 m!1445675))

(declare-fun m!1445677 () Bool)

(assert (=> b!1571799 m!1445677))

(assert (=> b!1571799 m!1445677))

(declare-fun m!1445679 () Bool)

(assert (=> b!1571799 m!1445679))

(push 1)

(assert (not start!134828))

(assert (not b!1571799))

(assert (not b!1571798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

