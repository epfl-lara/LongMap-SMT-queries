; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131776 () Bool)

(assert start!131776)

(declare-fun b!1542939 () Bool)

(declare-fun e!858545 () Bool)

(assert (=> b!1542939 (= e!858545 false)))

(declare-fun lt!665900 () Bool)

(declare-datatypes ((array!102756 0))(
  ( (array!102757 (arr!49580 (Array (_ BitVec 32) (_ BitVec 64))) (size!50130 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102756)

(declare-datatypes ((List!35897 0))(
  ( (Nil!35894) (Cons!35893 (h!37338 (_ BitVec 64)) (t!50591 List!35897)) )
))
(declare-fun arrayNoDuplicates!0 (array!102756 (_ BitVec 32) List!35897) Bool)

(assert (=> b!1542939 (= lt!665900 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35894))))

(declare-fun b!1542940 () Bool)

(declare-fun e!858546 () Bool)

(declare-fun tp_is_empty!37765 () Bool)

(assert (=> b!1542940 (= e!858546 tp_is_empty!37765)))

(declare-fun b!1542941 () Bool)

(declare-fun res!1058745 () Bool)

(assert (=> b!1542941 (=> (not res!1058745) (not e!858545))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102756 (_ BitVec 32)) Bool)

(assert (=> b!1542941 (= res!1058745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542942 () Bool)

(declare-fun e!858549 () Bool)

(assert (=> b!1542942 (= e!858549 tp_is_empty!37765)))

(declare-fun res!1058744 () Bool)

(assert (=> start!131776 (=> (not res!1058744) (not e!858545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131776 (= res!1058744 (validMask!0 mask!926))))

(assert (=> start!131776 e!858545))

(assert (=> start!131776 true))

(declare-datatypes ((V!58797 0))(
  ( (V!58798 (val!18960 Int)) )
))
(declare-datatypes ((ValueCell!17972 0))(
  ( (ValueCellFull!17972 (v!21761 V!58797)) (EmptyCell!17972) )
))
(declare-datatypes ((array!102758 0))(
  ( (array!102759 (arr!49581 (Array (_ BitVec 32) ValueCell!17972)) (size!50131 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102758)

(declare-fun e!858547 () Bool)

(declare-fun array_inv!38577 (array!102758) Bool)

(assert (=> start!131776 (and (array_inv!38577 _values!470) e!858547)))

(declare-fun array_inv!38578 (array!102756) Bool)

(assert (=> start!131776 (array_inv!38578 _keys!618)))

(declare-fun mapNonEmpty!58351 () Bool)

(declare-fun mapRes!58351 () Bool)

(declare-fun tp!110878 () Bool)

(assert (=> mapNonEmpty!58351 (= mapRes!58351 (and tp!110878 e!858546))))

(declare-fun mapKey!58351 () (_ BitVec 32))

(declare-fun mapValue!58351 () ValueCell!17972)

(declare-fun mapRest!58351 () (Array (_ BitVec 32) ValueCell!17972))

(assert (=> mapNonEmpty!58351 (= (arr!49581 _values!470) (store mapRest!58351 mapKey!58351 mapValue!58351))))

(declare-fun b!1542943 () Bool)

(assert (=> b!1542943 (= e!858547 (and e!858549 mapRes!58351))))

(declare-fun condMapEmpty!58351 () Bool)

(declare-fun mapDefault!58351 () ValueCell!17972)

