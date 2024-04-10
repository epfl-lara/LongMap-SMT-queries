; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4212 () Bool)

(assert start!4212)

(declare-fun b_free!1117 () Bool)

(declare-fun b_next!1117 () Bool)

(assert (=> start!4212 (= b_free!1117 (not b_next!1117))))

(declare-fun tp!4770 () Bool)

(declare-fun b_and!1927 () Bool)

(assert (=> start!4212 (= tp!4770 b_and!1927)))

(declare-fun b!32127 () Bool)

(declare-fun res!19522 () Bool)

(declare-fun e!20442 () Bool)

(assert (=> b!32127 (=> (not res!19522) (not e!20442))))

(declare-datatypes ((array!2151 0))(
  ( (array!2152 (arr!1029 (Array (_ BitVec 32) (_ BitVec 64))) (size!1130 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2151)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2151 (_ BitVec 32)) Bool)

(assert (=> b!32127 (= res!19522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32128 () Bool)

(declare-fun e!20444 () Bool)

(declare-fun tp_is_empty!1471 () Bool)

(assert (=> b!32128 (= e!20444 tp_is_empty!1471)))

(declare-fun mapIsEmpty!1735 () Bool)

(declare-fun mapRes!1735 () Bool)

(assert (=> mapIsEmpty!1735 mapRes!1735))

(declare-fun b!32129 () Bool)

(declare-fun res!19519 () Bool)

(assert (=> b!32129 (=> (not res!19519) (not e!20442))))

(declare-datatypes ((List!830 0))(
  ( (Nil!827) (Cons!826 (h!1393 (_ BitVec 64)) (t!3523 List!830)) )
))
(declare-fun arrayNoDuplicates!0 (array!2151 (_ BitVec 32) List!830) Bool)

(assert (=> b!32129 (= res!19519 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!827))))

(declare-fun b!32130 () Bool)

(assert (=> b!32130 (= e!20442 false)))

(declare-fun lt!11636 () (_ BitVec 32))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2151 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32130 (= lt!11636 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1735 () Bool)

(declare-fun tp!4771 () Bool)

(assert (=> mapNonEmpty!1735 (= mapRes!1735 (and tp!4771 e!20444))))

(declare-datatypes ((V!1787 0))(
  ( (V!1788 (val!762 Int)) )
))
(declare-datatypes ((ValueCell!536 0))(
  ( (ValueCellFull!536 (v!1851 V!1787)) (EmptyCell!536) )
))
(declare-datatypes ((array!2153 0))(
  ( (array!2154 (arr!1030 (Array (_ BitVec 32) ValueCell!536)) (size!1131 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2153)

(declare-fun mapRest!1735 () (Array (_ BitVec 32) ValueCell!536))

(declare-fun mapValue!1735 () ValueCell!536)

(declare-fun mapKey!1735 () (_ BitVec 32))

(assert (=> mapNonEmpty!1735 (= (arr!1030 _values!1501) (store mapRest!1735 mapKey!1735 mapValue!1735))))

(declare-fun b!32131 () Bool)

(declare-fun res!19521 () Bool)

(assert (=> b!32131 (=> (not res!19521) (not e!20442))))

(declare-fun arrayContainsKey!0 (array!2151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32131 (= res!19521 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32133 () Bool)

(declare-fun e!20440 () Bool)

(assert (=> b!32133 (= e!20440 tp_is_empty!1471)))

(declare-fun b!32134 () Bool)

(declare-fun res!19523 () Bool)

(assert (=> b!32134 (=> (not res!19523) (not e!20442))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1787)

(declare-fun minValue!1443 () V!1787)

(declare-datatypes ((tuple2!1236 0))(
  ( (tuple2!1237 (_1!629 (_ BitVec 64)) (_2!629 V!1787)) )
))
(declare-datatypes ((List!831 0))(
  ( (Nil!828) (Cons!827 (h!1394 tuple2!1236) (t!3524 List!831)) )
))
(declare-datatypes ((ListLongMap!813 0))(
  ( (ListLongMap!814 (toList!422 List!831)) )
))
(declare-fun contains!362 (ListLongMap!813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!250 (array!2151 array!2153 (_ BitVec 32) (_ BitVec 32) V!1787 V!1787 (_ BitVec 32) Int) ListLongMap!813)

(assert (=> b!32134 (= res!19523 (not (contains!362 (getCurrentListMap!250 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!32135 () Bool)

(declare-fun res!19524 () Bool)

(assert (=> b!32135 (=> (not res!19524) (not e!20442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32135 (= res!19524 (validKeyInArray!0 k!1304))))

(declare-fun b!32136 () Bool)

(declare-fun res!19520 () Bool)

(assert (=> b!32136 (=> (not res!19520) (not e!20442))))

(assert (=> b!32136 (= res!19520 (and (= (size!1131 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1130 _keys!1833) (size!1131 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!19518 () Bool)

(assert (=> start!4212 (=> (not res!19518) (not e!20442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4212 (= res!19518 (validMask!0 mask!2294))))

(assert (=> start!4212 e!20442))

(assert (=> start!4212 true))

(assert (=> start!4212 tp!4770))

(declare-fun e!20441 () Bool)

(declare-fun array_inv!719 (array!2153) Bool)

(assert (=> start!4212 (and (array_inv!719 _values!1501) e!20441)))

(declare-fun array_inv!720 (array!2151) Bool)

(assert (=> start!4212 (array_inv!720 _keys!1833)))

(assert (=> start!4212 tp_is_empty!1471))

(declare-fun b!32132 () Bool)

(assert (=> b!32132 (= e!20441 (and e!20440 mapRes!1735))))

(declare-fun condMapEmpty!1735 () Bool)

(declare-fun mapDefault!1735 () ValueCell!536)

