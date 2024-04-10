; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131810 () Bool)

(assert start!131810)

(declare-fun b!1543245 () Bool)

(declare-fun res!1058896 () Bool)

(declare-fun e!858802 () Bool)

(assert (=> b!1543245 (=> (not res!1058896) (not e!858802))))

(declare-datatypes ((array!102824 0))(
  ( (array!102825 (arr!49614 (Array (_ BitVec 32) (_ BitVec 64))) (size!50164 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102824)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58841 0))(
  ( (V!58842 (val!18977 Int)) )
))
(declare-datatypes ((ValueCell!17989 0))(
  ( (ValueCellFull!17989 (v!21778 V!58841)) (EmptyCell!17989) )
))
(declare-datatypes ((array!102826 0))(
  ( (array!102827 (arr!49615 (Array (_ BitVec 32) ValueCell!17989)) (size!50165 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102826)

(assert (=> b!1543245 (= res!1058896 (and (= (size!50165 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50164 _keys!618) (size!50165 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543246 () Bool)

(declare-fun res!1058898 () Bool)

(assert (=> b!1543246 (=> (not res!1058898) (not e!858802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102824 (_ BitVec 32)) Bool)

(assert (=> b!1543246 (= res!1058898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543247 () Bool)

(declare-fun e!858804 () Bool)

(declare-fun tp_is_empty!37799 () Bool)

(assert (=> b!1543247 (= e!858804 tp_is_empty!37799)))

(declare-fun b!1543248 () Bool)

(assert (=> b!1543248 (= e!858802 false)))

(declare-fun lt!665951 () Bool)

(declare-datatypes ((List!35913 0))(
  ( (Nil!35910) (Cons!35909 (h!37354 (_ BitVec 64)) (t!50607 List!35913)) )
))
(declare-fun arrayNoDuplicates!0 (array!102824 (_ BitVec 32) List!35913) Bool)

(assert (=> b!1543248 (= lt!665951 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35910))))

(declare-fun b!1543249 () Bool)

(declare-fun e!858803 () Bool)

(declare-fun e!858800 () Bool)

(declare-fun mapRes!58402 () Bool)

(assert (=> b!1543249 (= e!858803 (and e!858800 mapRes!58402))))

(declare-fun condMapEmpty!58402 () Bool)

(declare-fun mapDefault!58402 () ValueCell!17989)

