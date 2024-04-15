; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135420 () Bool)

(assert start!135420)

(declare-fun res!1075319 () Bool)

(declare-fun e!877673 () Bool)

(assert (=> start!135420 (=> (not res!1075319) (not e!877673))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135420 (= res!1075319 (validMask!0 mask!877))))

(assert (=> start!135420 e!877673))

(assert (=> start!135420 true))

(declare-datatypes ((array!105126 0))(
  ( (array!105127 (arr!50714 (Array (_ BitVec 32) (_ BitVec 64))) (size!51266 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105126)

(declare-fun array_inv!39650 (array!105126) Bool)

(assert (=> start!135420 (array_inv!39650 _keys!591)))

(declare-fun b!1573842 () Bool)

(declare-fun res!1075318 () Bool)

(assert (=> b!1573842 (=> (not res!1075318) (not e!877673))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573842 (= res!1075318 (and (= (size!51266 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51266 _keys!591)) (bvslt i!537 (size!51266 _keys!591))))))

(declare-fun b!1573843 () Bool)

(declare-fun res!1075320 () Bool)

(assert (=> b!1573843 (=> (not res!1075320) (not e!877673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573843 (= res!1075320 (not (validKeyInArray!0 (select (arr!50714 _keys!591) i!537))))))

(declare-fun b!1573844 () Bool)

(assert (=> b!1573844 (= e!877673 (bvslt (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(assert (= (and start!135420 res!1075319) b!1573842))

(assert (= (and b!1573842 res!1075318) b!1573843))

(assert (= (and b!1573843 res!1075320) b!1573844))

(declare-fun m!1446525 () Bool)

(assert (=> start!135420 m!1446525))

(declare-fun m!1446527 () Bool)

(assert (=> start!135420 m!1446527))

(declare-fun m!1446529 () Bool)

(assert (=> b!1573843 m!1446529))

(assert (=> b!1573843 m!1446529))

(declare-fun m!1446531 () Bool)

(assert (=> b!1573843 m!1446531))

(check-sat (not b!1573843) (not start!135420))
(check-sat)
