; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43552 () Bool)

(assert start!43552)

(declare-fun b_free!12331 () Bool)

(declare-fun b_next!12331 () Bool)

(assert (=> start!43552 (= b_free!12331 (not b_next!12331))))

(declare-fun tp!43275 () Bool)

(declare-fun b_and!21091 () Bool)

(assert (=> start!43552 (= tp!43275 b_and!21091)))

(declare-fun b!482611 () Bool)

(declare-fun res!287681 () Bool)

(declare-fun e!284008 () Bool)

(assert (=> b!482611 (=> (not res!287681) (not e!284008))))

(declare-datatypes ((array!31343 0))(
  ( (array!31344 (arr!15074 (Array (_ BitVec 32) (_ BitVec 64))) (size!15432 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31343)

(declare-datatypes ((List!9228 0))(
  ( (Nil!9225) (Cons!9224 (h!10080 (_ BitVec 64)) (t!15442 List!9228)) )
))
(declare-fun arrayNoDuplicates!0 (array!31343 (_ BitVec 32) List!9228) Bool)

(assert (=> b!482611 (= res!287681 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9225))))

(declare-fun b!482612 () Bool)

(declare-fun e!284010 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482612 (= e!284010 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!482613 () Bool)

(declare-fun res!287683 () Bool)

(assert (=> b!482613 (=> (not res!287683) (not e!284008))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31343 (_ BitVec 32)) Bool)

(assert (=> b!482613 (= res!287683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22474 () Bool)

(declare-fun mapRes!22474 () Bool)

(declare-fun tp!43276 () Bool)

(declare-fun e!284007 () Bool)

(assert (=> mapNonEmpty!22474 (= mapRes!22474 (and tp!43276 e!284007))))

(declare-fun mapKey!22474 () (_ BitVec 32))

(declare-datatypes ((V!19529 0))(
  ( (V!19530 (val!6969 Int)) )
))
(declare-datatypes ((ValueCell!6560 0))(
  ( (ValueCellFull!6560 (v!9262 V!19529)) (EmptyCell!6560) )
))
(declare-fun mapValue!22474 () ValueCell!6560)

(declare-fun mapRest!22474 () (Array (_ BitVec 32) ValueCell!6560))

(declare-datatypes ((array!31345 0))(
  ( (array!31346 (arr!15075 (Array (_ BitVec 32) ValueCell!6560)) (size!15433 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31345)

(assert (=> mapNonEmpty!22474 (= (arr!15075 _values!1516) (store mapRest!22474 mapKey!22474 mapValue!22474))))

(declare-fun b!482614 () Bool)

(declare-fun res!287680 () Bool)

(assert (=> b!482614 (=> (not res!287680) (not e!284008))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482614 (= res!287680 (and (= (size!15433 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15432 _keys!1874) (size!15433 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482615 () Bool)

(assert (=> b!482615 (= e!284010 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482616 () Bool)

(declare-fun tp_is_empty!13843 () Bool)

(assert (=> b!482616 (= e!284007 tp_is_empty!13843)))

(declare-fun b!482617 () Bool)

(declare-fun e!284006 () Bool)

(assert (=> b!482617 (= e!284006 tp_is_empty!13843)))

(declare-fun b!482618 () Bool)

(declare-fun res!287682 () Bool)

(assert (=> b!482618 (=> (not res!287682) (not e!284008))))

(declare-fun minValue!1458 () V!19529)

(declare-fun zeroValue!1458 () V!19529)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9148 0))(
  ( (tuple2!9149 (_1!4585 (_ BitVec 64)) (_2!4585 V!19529)) )
))
(declare-datatypes ((List!9229 0))(
  ( (Nil!9226) (Cons!9225 (h!10081 tuple2!9148) (t!15443 List!9229)) )
))
(declare-datatypes ((ListLongMap!8061 0))(
  ( (ListLongMap!8062 (toList!4046 List!9229)) )
))
(declare-fun contains!2660 (ListLongMap!8061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2365 (array!31343 array!31345 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 32) Int) ListLongMap!8061)

(assert (=> b!482618 (= res!287682 (contains!2660 (getCurrentListMap!2365 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!482619 () Bool)

(assert (=> b!482619 (= e!284008 (not (or (not (= (size!15432 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsle #b00000000000000000000000000000000 (size!15432 _keys!1874)))))))

(declare-fun lt!218754 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31343 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482619 (= lt!218754 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!482619 e!284010))

(declare-fun c!57969 () Bool)

(assert (=> b!482619 (= c!57969 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14150 0))(
  ( (Unit!14151) )
))
(declare-fun lt!218755 () Unit!14150)

(declare-fun lemmaKeyInListMapIsInArray!146 (array!31343 array!31345 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 64) Int) Unit!14150)

(assert (=> b!482619 (= lt!218755 (lemmaKeyInListMapIsInArray!146 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!482620 () Bool)

(declare-fun e!284009 () Bool)

(assert (=> b!482620 (= e!284009 (and e!284006 mapRes!22474))))

(declare-fun condMapEmpty!22474 () Bool)

(declare-fun mapDefault!22474 () ValueCell!6560)

