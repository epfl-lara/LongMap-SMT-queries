; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131912 () Bool)

(assert start!131912)

(declare-fun b_free!31625 () Bool)

(declare-fun b_next!31625 () Bool)

(assert (=> start!131912 (= b_free!31625 (not b_next!31625))))

(declare-fun tp!111127 () Bool)

(declare-fun b_and!51035 () Bool)

(assert (=> start!131912 (= tp!111127 b_and!51035)))

(declare-fun b!1544515 () Bool)

(declare-datatypes ((V!58977 0))(
  ( (V!58978 (val!19028 Int)) )
))
(declare-datatypes ((tuple2!24444 0))(
  ( (tuple2!24445 (_1!12233 (_ BitVec 64)) (_2!12233 V!58977)) )
))
(declare-datatypes ((List!35960 0))(
  ( (Nil!35957) (Cons!35956 (h!37401 tuple2!24444) (t!50654 List!35960)) )
))
(declare-datatypes ((ListLongMap!22053 0))(
  ( (ListLongMap!22054 (toList!11042 List!35960)) )
))
(declare-fun e!859698 () ListLongMap!22053)

(declare-fun call!68915 () ListLongMap!22053)

(assert (=> b!1544515 (= e!859698 call!68915)))

(declare-fun bm!68912 () Bool)

(declare-fun call!68917 () ListLongMap!22053)

(declare-fun call!68918 () ListLongMap!22053)

(assert (=> bm!68912 (= call!68917 call!68918)))

(declare-fun b!1544517 () Bool)

(declare-fun res!1059447 () Bool)

(declare-fun e!859700 () Bool)

(assert (=> b!1544517 (=> (not res!1059447) (not e!859700))))

(declare-datatypes ((array!103014 0))(
  ( (array!103015 (arr!49709 (Array (_ BitVec 32) (_ BitVec 64))) (size!50259 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103014)

(declare-datatypes ((List!35961 0))(
  ( (Nil!35958) (Cons!35957 (h!37402 (_ BitVec 64)) (t!50655 List!35961)) )
))
(declare-fun arrayNoDuplicates!0 (array!103014 (_ BitVec 32) List!35961) Bool)

(assert (=> b!1544517 (= res!1059447 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35958))))

(declare-fun b!1544518 () Bool)

(declare-fun res!1059446 () Bool)

(assert (=> b!1544518 (=> (not res!1059446) (not e!859700))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18040 0))(
  ( (ValueCellFull!18040 (v!21829 V!58977)) (EmptyCell!18040) )
))
(declare-datatypes ((array!103016 0))(
  ( (array!103017 (arr!49710 (Array (_ BitVec 32) ValueCell!18040)) (size!50260 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103016)

(assert (=> b!1544518 (= res!1059446 (and (= (size!50260 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50259 _keys!618) (size!50260 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!68913 () Bool)

(declare-fun call!68919 () ListLongMap!22053)

(assert (=> bm!68913 (= call!68915 call!68919)))

(declare-fun b!1544519 () Bool)

(assert (=> b!1544519 (= e!859698 call!68917)))

(declare-fun b!1544520 () Bool)

(declare-fun res!1059445 () Bool)

(assert (=> b!1544520 (=> (not res!1059445) (not e!859700))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544520 (= res!1059445 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50259 _keys!618))))))

(declare-fun b!1544521 () Bool)

(declare-fun e!859702 () Bool)

(declare-fun tp_is_empty!37901 () Bool)

(assert (=> b!1544521 (= e!859702 tp_is_empty!37901)))

(declare-fun b!1544522 () Bool)

(declare-fun e!859701 () ListLongMap!22053)

(declare-fun e!859699 () ListLongMap!22053)

(assert (=> b!1544522 (= e!859701 e!859699)))

(declare-fun c!141441 () Bool)

(declare-fun lt!666148 () Bool)

(assert (=> b!1544522 (= c!141441 (and (not lt!666148) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58555 () Bool)

(declare-fun mapRes!58555 () Bool)

(assert (=> mapIsEmpty!58555 mapRes!58555))

(declare-fun b!1544523 () Bool)

(declare-fun res!1059444 () Bool)

(assert (=> b!1544523 (=> (not res!1059444) (not e!859700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103014 (_ BitVec 32)) Bool)

(assert (=> b!1544523 (= res!1059444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!68914 () Bool)

(declare-fun zeroValue!436 () V!58977)

(declare-fun defaultEntry!478 () Int)

(declare-fun call!68916 () ListLongMap!22053)

(declare-fun minValue!436 () V!58977)

(declare-fun getCurrentListMapNoExtraKeys!6514 (array!103014 array!103016 (_ BitVec 32) (_ BitVec 32) V!58977 V!58977 (_ BitVec 32) Int) ListLongMap!22053)

(assert (=> bm!68914 (= call!68916 (getCurrentListMapNoExtraKeys!6514 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58555 () Bool)

(declare-fun tp!111126 () Bool)

(declare-fun e!859697 () Bool)

(assert (=> mapNonEmpty!58555 (= mapRes!58555 (and tp!111126 e!859697))))

(declare-fun mapValue!58555 () ValueCell!18040)

(declare-fun mapRest!58555 () (Array (_ BitVec 32) ValueCell!18040))

(declare-fun mapKey!58555 () (_ BitVec 32))

(assert (=> mapNonEmpty!58555 (= (arr!49710 _values!470) (store mapRest!58555 mapKey!58555 mapValue!58555))))

(declare-fun b!1544524 () Bool)

(assert (=> b!1544524 (= e!859697 tp_is_empty!37901)))

(declare-fun b!1544525 () Bool)

(declare-fun e!859703 () Bool)

(assert (=> b!1544525 (= e!859703 (and e!859702 mapRes!58555))))

(declare-fun condMapEmpty!58555 () Bool)

(declare-fun mapDefault!58555 () ValueCell!18040)

