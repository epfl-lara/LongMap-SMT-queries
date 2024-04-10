; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113438 () Bool)

(assert start!113438)

(declare-fun b_free!31489 () Bool)

(declare-fun b_next!31489 () Bool)

(assert (=> start!113438 (= b_free!31489 (not b_next!31489))))

(declare-fun tp!110272 () Bool)

(declare-fun b_and!50777 () Bool)

(assert (=> start!113438 (= tp!110272 b_and!50777)))

(declare-fun b!1346637 () Bool)

(declare-fun res!893560 () Bool)

(declare-fun e!766226 () Bool)

(assert (=> b!1346637 (=> (not res!893560) (not e!766226))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91810 0))(
  ( (array!91811 (arr!44361 (Array (_ BitVec 32) (_ BitVec 64))) (size!44911 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91810)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346637 (= res!893560 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44911 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346638 () Bool)

(declare-fun res!893561 () Bool)

(assert (=> b!1346638 (=> (not res!893561) (not e!766226))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91810 (_ BitVec 32)) Bool)

(assert (=> b!1346638 (= res!893561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346639 () Bool)

(assert (=> b!1346639 (= e!766226 false)))

(declare-datatypes ((V!55089 0))(
  ( (V!55090 (val!18819 Int)) )
))
(declare-fun minValue!1245 () V!55089)

(declare-fun zeroValue!1245 () V!55089)

(declare-fun lt!595527 () Bool)

(declare-datatypes ((ValueCell!17846 0))(
  ( (ValueCellFull!17846 (v!21467 V!55089)) (EmptyCell!17846) )
))
(declare-datatypes ((array!91812 0))(
  ( (array!91813 (arr!44362 (Array (_ BitVec 32) ValueCell!17846)) (size!44912 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91812)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24256 0))(
  ( (tuple2!24257 (_1!12139 (_ BitVec 64)) (_2!12139 V!55089)) )
))
(declare-datatypes ((List!31413 0))(
  ( (Nil!31410) (Cons!31409 (h!32618 tuple2!24256) (t!46003 List!31413)) )
))
(declare-datatypes ((ListLongMap!21913 0))(
  ( (ListLongMap!21914 (toList!10972 List!31413)) )
))
(declare-fun contains!9148 (ListLongMap!21913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5924 (array!91810 array!91812 (_ BitVec 32) (_ BitVec 32) V!55089 V!55089 (_ BitVec 32) Int) ListLongMap!21913)

(assert (=> b!1346639 (= lt!595527 (contains!9148 (getCurrentListMap!5924 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1346640 () Bool)

(declare-fun res!893558 () Bool)

(assert (=> b!1346640 (=> (not res!893558) (not e!766226))))

(assert (=> b!1346640 (= res!893558 (and (= (size!44912 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44911 _keys!1571) (size!44912 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57940 () Bool)

(declare-fun mapRes!57940 () Bool)

(declare-fun tp!110271 () Bool)

(declare-fun e!766229 () Bool)

(assert (=> mapNonEmpty!57940 (= mapRes!57940 (and tp!110271 e!766229))))

(declare-fun mapKey!57940 () (_ BitVec 32))

(declare-fun mapValue!57940 () ValueCell!17846)

(declare-fun mapRest!57940 () (Array (_ BitVec 32) ValueCell!17846))

(assert (=> mapNonEmpty!57940 (= (arr!44362 _values!1303) (store mapRest!57940 mapKey!57940 mapValue!57940))))

(declare-fun res!893562 () Bool)

(assert (=> start!113438 (=> (not res!893562) (not e!766226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113438 (= res!893562 (validMask!0 mask!1977))))

(assert (=> start!113438 e!766226))

(declare-fun tp_is_empty!37489 () Bool)

(assert (=> start!113438 tp_is_empty!37489))

(assert (=> start!113438 true))

(declare-fun array_inv!33419 (array!91810) Bool)

(assert (=> start!113438 (array_inv!33419 _keys!1571)))

(declare-fun e!766227 () Bool)

(declare-fun array_inv!33420 (array!91812) Bool)

(assert (=> start!113438 (and (array_inv!33420 _values!1303) e!766227)))

(assert (=> start!113438 tp!110272))

(declare-fun b!1346641 () Bool)

(declare-fun res!893559 () Bool)

(assert (=> b!1346641 (=> (not res!893559) (not e!766226))))

(declare-datatypes ((List!31414 0))(
  ( (Nil!31411) (Cons!31410 (h!32619 (_ BitVec 64)) (t!46004 List!31414)) )
))
(declare-fun arrayNoDuplicates!0 (array!91810 (_ BitVec 32) List!31414) Bool)

(assert (=> b!1346641 (= res!893559 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31411))))

(declare-fun mapIsEmpty!57940 () Bool)

(assert (=> mapIsEmpty!57940 mapRes!57940))

(declare-fun b!1346642 () Bool)

(declare-fun e!766225 () Bool)

(assert (=> b!1346642 (= e!766225 tp_is_empty!37489)))

(declare-fun b!1346643 () Bool)

(assert (=> b!1346643 (= e!766229 tp_is_empty!37489)))

(declare-fun b!1346644 () Bool)

(assert (=> b!1346644 (= e!766227 (and e!766225 mapRes!57940))))

(declare-fun condMapEmpty!57940 () Bool)

(declare-fun mapDefault!57940 () ValueCell!17846)

