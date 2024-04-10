; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4218 () Bool)

(assert start!4218)

(declare-fun b_free!1123 () Bool)

(declare-fun b_next!1123 () Bool)

(assert (=> start!4218 (= b_free!1123 (not b_next!1123))))

(declare-fun tp!4789 () Bool)

(declare-fun b_and!1933 () Bool)

(assert (=> start!4218 (= tp!4789 b_and!1933)))

(declare-fun b!32217 () Bool)

(declare-fun res!19585 () Bool)

(declare-fun e!20486 () Bool)

(assert (=> b!32217 (=> (not res!19585) (not e!20486))))

(declare-datatypes ((array!2163 0))(
  ( (array!2164 (arr!1035 (Array (_ BitVec 32) (_ BitVec 64))) (size!1136 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2163)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32217 (= res!19585 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1744 () Bool)

(declare-fun mapRes!1744 () Bool)

(declare-fun tp!4788 () Bool)

(declare-fun e!20488 () Bool)

(assert (=> mapNonEmpty!1744 (= mapRes!1744 (and tp!4788 e!20488))))

(declare-fun mapKey!1744 () (_ BitVec 32))

(declare-datatypes ((V!1795 0))(
  ( (V!1796 (val!765 Int)) )
))
(declare-datatypes ((ValueCell!539 0))(
  ( (ValueCellFull!539 (v!1854 V!1795)) (EmptyCell!539) )
))
(declare-datatypes ((array!2165 0))(
  ( (array!2166 (arr!1036 (Array (_ BitVec 32) ValueCell!539)) (size!1137 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2165)

(declare-fun mapValue!1744 () ValueCell!539)

(declare-fun mapRest!1744 () (Array (_ BitVec 32) ValueCell!539))

(assert (=> mapNonEmpty!1744 (= (arr!1036 _values!1501) (store mapRest!1744 mapKey!1744 mapValue!1744))))

(declare-fun b!32218 () Bool)

(declare-fun res!19582 () Bool)

(assert (=> b!32218 (=> (not res!19582) (not e!20486))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2163 (_ BitVec 32)) Bool)

(assert (=> b!32218 (= res!19582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32219 () Bool)

(declare-fun res!19586 () Bool)

(assert (=> b!32219 (=> (not res!19586) (not e!20486))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1795)

(declare-fun minValue!1443 () V!1795)

(declare-datatypes ((tuple2!1242 0))(
  ( (tuple2!1243 (_1!632 (_ BitVec 64)) (_2!632 V!1795)) )
))
(declare-datatypes ((List!836 0))(
  ( (Nil!833) (Cons!832 (h!1399 tuple2!1242) (t!3529 List!836)) )
))
(declare-datatypes ((ListLongMap!819 0))(
  ( (ListLongMap!820 (toList!425 List!836)) )
))
(declare-fun contains!365 (ListLongMap!819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!253 (array!2163 array!2165 (_ BitVec 32) (_ BitVec 32) V!1795 V!1795 (_ BitVec 32) Int) ListLongMap!819)

(assert (=> b!32219 (= res!19586 (not (contains!365 (getCurrentListMap!253 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!32220 () Bool)

(declare-fun res!19584 () Bool)

(assert (=> b!32220 (=> (not res!19584) (not e!20486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32220 (= res!19584 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1744 () Bool)

(assert (=> mapIsEmpty!1744 mapRes!1744))

(declare-fun b!32221 () Bool)

(declare-fun res!19581 () Bool)

(assert (=> b!32221 (=> (not res!19581) (not e!20486))))

(declare-datatypes ((List!837 0))(
  ( (Nil!834) (Cons!833 (h!1400 (_ BitVec 64)) (t!3530 List!837)) )
))
(declare-fun arrayNoDuplicates!0 (array!2163 (_ BitVec 32) List!837) Bool)

(assert (=> b!32221 (= res!19581 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!834))))

(declare-fun b!32222 () Bool)

(declare-fun res!19587 () Bool)

(assert (=> b!32222 (=> (not res!19587) (not e!20486))))

(assert (=> b!32222 (= res!19587 (and (= (size!1137 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1136 _keys!1833) (size!1137 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32224 () Bool)

(declare-fun e!20487 () Bool)

(declare-fun tp_is_empty!1477 () Bool)

(assert (=> b!32224 (= e!20487 tp_is_empty!1477)))

(declare-fun b!32225 () Bool)

(assert (=> b!32225 (= e!20488 tp_is_empty!1477)))

(declare-fun b!32226 () Bool)

(declare-fun e!20489 () Bool)

(assert (=> b!32226 (= e!20489 (and e!20487 mapRes!1744))))

(declare-fun condMapEmpty!1744 () Bool)

(declare-fun mapDefault!1744 () ValueCell!539)

