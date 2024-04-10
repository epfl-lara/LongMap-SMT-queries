; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4444 () Bool)

(assert start!4444)

(declare-fun b_free!1205 () Bool)

(declare-fun b_next!1205 () Bool)

(assert (=> start!4444 (= b_free!1205 (not b_next!1205))))

(declare-fun tp!5052 () Bool)

(declare-fun b_and!2027 () Bool)

(assert (=> start!4444 (= tp!5052 b_and!2027)))

(declare-fun mapNonEmpty!1885 () Bool)

(declare-fun mapRes!1885 () Bool)

(declare-fun tp!5053 () Bool)

(declare-fun e!21775 () Bool)

(assert (=> mapNonEmpty!1885 (= mapRes!1885 (and tp!5053 e!21775))))

(declare-datatypes ((V!1903 0))(
  ( (V!1904 (val!806 Int)) )
))
(declare-datatypes ((ValueCell!580 0))(
  ( (ValueCellFull!580 (v!1901 V!1903)) (EmptyCell!580) )
))
(declare-fun mapRest!1885 () (Array (_ BitVec 32) ValueCell!580))

(declare-datatypes ((array!2335 0))(
  ( (array!2336 (arr!1115 (Array (_ BitVec 32) ValueCell!580)) (size!1216 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2335)

(declare-fun mapKey!1885 () (_ BitVec 32))

(declare-fun mapValue!1885 () ValueCell!580)

(assert (=> mapNonEmpty!1885 (= (arr!1115 _values!1501) (store mapRest!1885 mapKey!1885 mapValue!1885))))

(declare-fun b!34291 () Bool)

(declare-fun res!20785 () Bool)

(declare-fun e!21773 () Bool)

(assert (=> b!34291 (=> (not res!20785) (not e!21773))))

(declare-datatypes ((array!2337 0))(
  ( (array!2338 (arr!1116 (Array (_ BitVec 32) (_ BitVec 64))) (size!1217 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2337)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2337 (_ BitVec 32)) Bool)

(assert (=> b!34291 (= res!20785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34292 () Bool)

(declare-fun res!20788 () Bool)

(assert (=> b!34292 (=> (not res!20788) (not e!21773))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34292 (= res!20788 (and (= (size!1216 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1217 _keys!1833) (size!1216 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34293 () Bool)

(declare-fun e!21770 () Bool)

(assert (=> b!34293 (= e!21773 e!21770)))

(declare-fun res!20786 () Bool)

(assert (=> b!34293 (=> (not res!20786) (not e!21770))))

(declare-datatypes ((tuple2!1312 0))(
  ( (tuple2!1313 (_1!667 (_ BitVec 64)) (_2!667 V!1903)) )
))
(declare-datatypes ((List!901 0))(
  ( (Nil!898) (Cons!897 (h!1464 tuple2!1312) (t!3606 List!901)) )
))
(declare-datatypes ((ListLongMap!889 0))(
  ( (ListLongMap!890 (toList!460 List!901)) )
))
(declare-fun lt!12762 () ListLongMap!889)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!406 (ListLongMap!889 (_ BitVec 64)) Bool)

(assert (=> b!34293 (= res!20786 (not (contains!406 lt!12762 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1903)

(declare-fun minValue!1443 () V!1903)

(declare-fun getCurrentListMap!284 (array!2337 array!2335 (_ BitVec 32) (_ BitVec 32) V!1903 V!1903 (_ BitVec 32) Int) ListLongMap!889)

(assert (=> b!34293 (= lt!12762 (getCurrentListMap!284 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!20790 () Bool)

(assert (=> start!4444 (=> (not res!20790) (not e!21773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4444 (= res!20790 (validMask!0 mask!2294))))

(assert (=> start!4444 e!21773))

(assert (=> start!4444 true))

(assert (=> start!4444 tp!5052))

(declare-fun e!21771 () Bool)

(declare-fun array_inv!785 (array!2335) Bool)

(assert (=> start!4444 (and (array_inv!785 _values!1501) e!21771)))

(declare-fun array_inv!786 (array!2337) Bool)

(assert (=> start!4444 (array_inv!786 _keys!1833)))

(declare-fun tp_is_empty!1559 () Bool)

(assert (=> start!4444 tp_is_empty!1559))

(declare-fun b!34294 () Bool)

(declare-fun e!21774 () Bool)

(assert (=> b!34294 (= e!21774 tp_is_empty!1559)))

(declare-fun b!34295 () Bool)

(declare-fun res!20789 () Bool)

(assert (=> b!34295 (=> (not res!20789) (not e!21773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34295 (= res!20789 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1885 () Bool)

(assert (=> mapIsEmpty!1885 mapRes!1885))

(declare-fun b!34296 () Bool)

(assert (=> b!34296 (= e!21771 (and e!21774 mapRes!1885))))

(declare-fun condMapEmpty!1885 () Bool)

(declare-fun mapDefault!1885 () ValueCell!580)

