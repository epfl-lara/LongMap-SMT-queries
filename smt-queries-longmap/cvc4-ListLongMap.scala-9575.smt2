; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113316 () Bool)

(assert start!113316)

(declare-fun b_free!31367 () Bool)

(declare-fun b_next!31367 () Bool)

(assert (=> start!113316 (= b_free!31367 (not b_next!31367))))

(declare-fun tp!109906 () Bool)

(declare-fun b_and!50589 () Bool)

(assert (=> start!113316 (= tp!109906 b_and!50589)))

(declare-fun b!1344519 () Bool)

(declare-fun res!892059 () Bool)

(declare-fun e!765233 () Bool)

(assert (=> b!1344519 (=> (not res!892059) (not e!765233))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91574 0))(
  ( (array!91575 (arr!44243 (Array (_ BitVec 32) (_ BitVec 64))) (size!44793 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91574)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344519 (= res!892059 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44793 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57757 () Bool)

(declare-fun mapRes!57757 () Bool)

(assert (=> mapIsEmpty!57757 mapRes!57757))

(declare-fun mapNonEmpty!57757 () Bool)

(declare-fun tp!109905 () Bool)

(declare-fun e!765232 () Bool)

(assert (=> mapNonEmpty!57757 (= mapRes!57757 (and tp!109905 e!765232))))

(declare-fun mapKey!57757 () (_ BitVec 32))

(declare-datatypes ((V!54925 0))(
  ( (V!54926 (val!18758 Int)) )
))
(declare-datatypes ((ValueCell!17785 0))(
  ( (ValueCellFull!17785 (v!21406 V!54925)) (EmptyCell!17785) )
))
(declare-fun mapValue!57757 () ValueCell!17785)

(declare-datatypes ((array!91576 0))(
  ( (array!91577 (arr!44244 (Array (_ BitVec 32) ValueCell!17785)) (size!44794 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91576)

(declare-fun mapRest!57757 () (Array (_ BitVec 32) ValueCell!17785))

(assert (=> mapNonEmpty!57757 (= (arr!44244 _values!1303) (store mapRest!57757 mapKey!57757 mapValue!57757))))

(declare-fun b!1344521 () Bool)

(assert (=> b!1344521 (= e!765233 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun b!1344522 () Bool)

(declare-fun res!892062 () Bool)

(assert (=> b!1344522 (=> (not res!892062) (not e!765233))))

(declare-datatypes ((List!31329 0))(
  ( (Nil!31326) (Cons!31325 (h!32534 (_ BitVec 64)) (t!45853 List!31329)) )
))
(declare-fun arrayNoDuplicates!0 (array!91574 (_ BitVec 32) List!31329) Bool)

(assert (=> b!1344522 (= res!892062 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31326))))

(declare-fun b!1344523 () Bool)

(declare-fun res!892056 () Bool)

(assert (=> b!1344523 (=> (not res!892056) (not e!765233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344523 (= res!892056 (validKeyInArray!0 (select (arr!44243 _keys!1571) from!1960)))))

(declare-fun b!1344524 () Bool)

(declare-fun e!765231 () Bool)

(declare-fun tp_is_empty!37367 () Bool)

(assert (=> b!1344524 (= e!765231 tp_is_empty!37367)))

(declare-fun b!1344525 () Bool)

(declare-fun res!892058 () Bool)

(assert (=> b!1344525 (=> (not res!892058) (not e!765233))))

(assert (=> b!1344525 (= res!892058 (not (= (select (arr!44243 _keys!1571) from!1960) k!1142)))))

(declare-fun res!892055 () Bool)

(assert (=> start!113316 (=> (not res!892055) (not e!765233))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113316 (= res!892055 (validMask!0 mask!1977))))

(assert (=> start!113316 e!765233))

(assert (=> start!113316 tp_is_empty!37367))

(assert (=> start!113316 true))

(declare-fun array_inv!33343 (array!91574) Bool)

(assert (=> start!113316 (array_inv!33343 _keys!1571)))

(declare-fun e!765230 () Bool)

(declare-fun array_inv!33344 (array!91576) Bool)

(assert (=> start!113316 (and (array_inv!33344 _values!1303) e!765230)))

(assert (=> start!113316 tp!109906))

(declare-fun b!1344520 () Bool)

(declare-fun res!892060 () Bool)

(assert (=> b!1344520 (=> (not res!892060) (not e!765233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91574 (_ BitVec 32)) Bool)

(assert (=> b!1344520 (= res!892060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344526 () Bool)

(assert (=> b!1344526 (= e!765232 tp_is_empty!37367)))

(declare-fun b!1344527 () Bool)

(declare-fun res!892061 () Bool)

(assert (=> b!1344527 (=> (not res!892061) (not e!765233))))

(declare-fun minValue!1245 () V!54925)

(declare-fun zeroValue!1245 () V!54925)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24174 0))(
  ( (tuple2!24175 (_1!12098 (_ BitVec 64)) (_2!12098 V!54925)) )
))
(declare-datatypes ((List!31330 0))(
  ( (Nil!31327) (Cons!31326 (h!32535 tuple2!24174) (t!45854 List!31330)) )
))
(declare-datatypes ((ListLongMap!21831 0))(
  ( (ListLongMap!21832 (toList!10931 List!31330)) )
))
(declare-fun contains!9107 (ListLongMap!21831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5887 (array!91574 array!91576 (_ BitVec 32) (_ BitVec 32) V!54925 V!54925 (_ BitVec 32) Int) ListLongMap!21831)

(assert (=> b!1344527 (= res!892061 (contains!9107 (getCurrentListMap!5887 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344528 () Bool)

(assert (=> b!1344528 (= e!765230 (and e!765231 mapRes!57757))))

(declare-fun condMapEmpty!57757 () Bool)

(declare-fun mapDefault!57757 () ValueCell!17785)

