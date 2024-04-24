; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118434 () Bool)

(assert start!118434)

(declare-fun res!925178 () Bool)

(declare-fun e!784764 () Bool)

(assert (=> start!118434 (=> (not res!925178) (not e!784764))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118434 (= res!925178 (validMask!0 mask!2987))))

(assert (=> start!118434 e!784764))

(assert (=> start!118434 true))

(declare-datatypes ((array!94635 0))(
  ( (array!94636 (arr!45693 (Array (_ BitVec 32) (_ BitVec 64))) (size!46244 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94635)

(declare-fun array_inv!34974 (array!94635) Bool)

(assert (=> start!118434 (array_inv!34974 a!2938)))

(declare-fun b!1384377 () Bool)

(assert (=> b!1384377 (= e!784764 false)))

(declare-fun lt!609003 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94635 (_ BitVec 32)) Bool)

(assert (=> b!1384377 (= lt!609003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384376 () Bool)

(declare-fun res!925177 () Bool)

(assert (=> b!1384376 (=> (not res!925177) (not e!784764))))

(declare-datatypes ((List!32208 0))(
  ( (Nil!32205) (Cons!32204 (h!33422 (_ BitVec 64)) (t!46894 List!32208)) )
))
(declare-fun arrayNoDuplicates!0 (array!94635 (_ BitVec 32) List!32208) Bool)

(assert (=> b!1384376 (= res!925177 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32205))))

(declare-fun b!1384375 () Bool)

(declare-fun res!925179 () Bool)

(assert (=> b!1384375 (=> (not res!925179) (not e!784764))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384375 (= res!925179 (validKeyInArray!0 (select (arr!45693 a!2938) i!1065)))))

(declare-fun b!1384374 () Bool)

(declare-fun res!925180 () Bool)

(assert (=> b!1384374 (=> (not res!925180) (not e!784764))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384374 (= res!925180 (and (= (size!46244 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46244 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46244 a!2938))))))

(assert (= (and start!118434 res!925178) b!1384374))

(assert (= (and b!1384374 res!925180) b!1384375))

(assert (= (and b!1384375 res!925179) b!1384376))

(assert (= (and b!1384376 res!925177) b!1384377))

(declare-fun m!1269801 () Bool)

(assert (=> start!118434 m!1269801))

(declare-fun m!1269803 () Bool)

(assert (=> start!118434 m!1269803))

(declare-fun m!1269805 () Bool)

(assert (=> b!1384377 m!1269805))

(declare-fun m!1269807 () Bool)

(assert (=> b!1384376 m!1269807))

(declare-fun m!1269809 () Bool)

(assert (=> b!1384375 m!1269809))

(assert (=> b!1384375 m!1269809))

(declare-fun m!1269811 () Bool)

(assert (=> b!1384375 m!1269811))

(push 1)

(assert (not b!1384377))

(assert (not b!1384375))

(assert (not start!118434))

(assert (not b!1384376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

