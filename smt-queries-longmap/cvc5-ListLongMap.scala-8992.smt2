; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108712 () Bool)

(assert start!108712)

(declare-fun b_free!28225 () Bool)

(declare-fun b_next!28225 () Bool)

(assert (=> start!108712 (= b_free!28225 (not b_next!28225))))

(declare-fun tp!99790 () Bool)

(declare-fun b_and!46291 () Bool)

(assert (=> start!108712 (= tp!99790 b_and!46291)))

(declare-fun mapNonEmpty!52355 () Bool)

(declare-fun mapRes!52355 () Bool)

(declare-fun tp!99791 () Bool)

(declare-fun e!733249 () Bool)

(assert (=> mapNonEmpty!52355 (= mapRes!52355 (and tp!99791 e!733249))))

(declare-datatypes ((V!50257 0))(
  ( (V!50258 (val!17007 Int)) )
))
(declare-datatypes ((ValueCell!16034 0))(
  ( (ValueCellFull!16034 (v!19609 V!50257)) (EmptyCell!16034) )
))
(declare-fun mapRest!52355 () (Array (_ BitVec 32) ValueCell!16034))

(declare-fun mapValue!52355 () ValueCell!16034)

(declare-datatypes ((array!84792 0))(
  ( (array!84793 (arr!40898 (Array (_ BitVec 32) ValueCell!16034)) (size!41448 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84792)

(declare-fun mapKey!52355 () (_ BitVec 32))

(assert (=> mapNonEmpty!52355 (= (arr!40898 _values!1445) (store mapRest!52355 mapKey!52355 mapValue!52355))))

(declare-fun b!1283488 () Bool)

(declare-fun res!852588 () Bool)

(declare-fun e!733248 () Bool)

(assert (=> b!1283488 (=> (not res!852588) (not e!733248))))

(declare-datatypes ((array!84794 0))(
  ( (array!84795 (arr!40899 (Array (_ BitVec 32) (_ BitVec 64))) (size!41449 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84794)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283488 (= res!852588 (validKeyInArray!0 (select (arr!40899 _keys!1741) from!2144)))))

(declare-fun b!1283489 () Bool)

(declare-fun e!733246 () Bool)

(declare-fun tp_is_empty!33865 () Bool)

(assert (=> b!1283489 (= e!733246 tp_is_empty!33865)))

(declare-fun b!1283490 () Bool)

(declare-fun res!852585 () Bool)

(assert (=> b!1283490 (=> (not res!852585) (not e!733248))))

(declare-datatypes ((List!28977 0))(
  ( (Nil!28974) (Cons!28973 (h!30182 (_ BitVec 64)) (t!42521 List!28977)) )
))
(declare-fun arrayNoDuplicates!0 (array!84794 (_ BitVec 32) List!28977) Bool)

(assert (=> b!1283490 (= res!852585 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28974))))

(declare-fun b!1283491 () Bool)

(declare-fun res!852587 () Bool)

(assert (=> b!1283491 (=> (not res!852587) (not e!733248))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1283491 (= res!852587 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41449 _keys!1741))))))

(declare-fun b!1283492 () Bool)

(assert (=> b!1283492 (= e!733248 (not true))))

(declare-datatypes ((tuple2!21780 0))(
  ( (tuple2!21781 (_1!10901 (_ BitVec 64)) (_2!10901 V!50257)) )
))
(declare-datatypes ((List!28978 0))(
  ( (Nil!28975) (Cons!28974 (h!30183 tuple2!21780) (t!42522 List!28978)) )
))
(declare-datatypes ((ListLongMap!19437 0))(
  ( (ListLongMap!19438 (toList!9734 List!28978)) )
))
(declare-fun lt!576664 () ListLongMap!19437)

(declare-fun contains!7851 (ListLongMap!19437 (_ BitVec 64)) Bool)

(assert (=> b!1283492 (contains!7851 lt!576664 k!1205)))

(declare-fun minValue!1387 () V!50257)

(declare-datatypes ((Unit!42477 0))(
  ( (Unit!42478) )
))
(declare-fun lt!576663 () Unit!42477)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!9 ((_ BitVec 64) (_ BitVec 64) V!50257 ListLongMap!19437) Unit!42477)

(assert (=> b!1283492 (= lt!576663 (lemmaInListMapAfterAddingDiffThenInBefore!9 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576664))))

(declare-fun zeroValue!1387 () V!50257)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun +!4285 (ListLongMap!19437 tuple2!21780) ListLongMap!19437)

(declare-fun getCurrentListMapNoExtraKeys!5915 (array!84794 array!84792 (_ BitVec 32) (_ BitVec 32) V!50257 V!50257 (_ BitVec 32) Int) ListLongMap!19437)

(assert (=> b!1283492 (= lt!576664 (+!4285 (getCurrentListMapNoExtraKeys!5915 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21781 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283493 () Bool)

(declare-fun res!852583 () Bool)

(assert (=> b!1283493 (=> (not res!852583) (not e!733248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84794 (_ BitVec 32)) Bool)

(assert (=> b!1283493 (= res!852583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283494 () Bool)

(declare-fun res!852590 () Bool)

(assert (=> b!1283494 (=> (not res!852590) (not e!733248))))

(assert (=> b!1283494 (= res!852590 (and (= (size!41448 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41449 _keys!1741) (size!41448 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!852586 () Bool)

(assert (=> start!108712 (=> (not res!852586) (not e!733248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108712 (= res!852586 (validMask!0 mask!2175))))

(assert (=> start!108712 e!733248))

(assert (=> start!108712 tp_is_empty!33865))

(assert (=> start!108712 true))

(declare-fun e!733247 () Bool)

(declare-fun array_inv!31023 (array!84792) Bool)

(assert (=> start!108712 (and (array_inv!31023 _values!1445) e!733247)))

(declare-fun array_inv!31024 (array!84794) Bool)

(assert (=> start!108712 (array_inv!31024 _keys!1741)))

(assert (=> start!108712 tp!99790))

(declare-fun b!1283495 () Bool)

(declare-fun res!852584 () Bool)

(assert (=> b!1283495 (=> (not res!852584) (not e!733248))))

(assert (=> b!1283495 (= res!852584 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41449 _keys!1741))))))

(declare-fun mapIsEmpty!52355 () Bool)

(assert (=> mapIsEmpty!52355 mapRes!52355))

(declare-fun b!1283496 () Bool)

(declare-fun res!852589 () Bool)

(assert (=> b!1283496 (=> (not res!852589) (not e!733248))))

(assert (=> b!1283496 (= res!852589 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283497 () Bool)

(assert (=> b!1283497 (= e!733247 (and e!733246 mapRes!52355))))

(declare-fun condMapEmpty!52355 () Bool)

(declare-fun mapDefault!52355 () ValueCell!16034)

