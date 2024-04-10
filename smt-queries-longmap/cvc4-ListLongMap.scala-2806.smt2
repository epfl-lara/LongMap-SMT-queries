; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40728 () Bool)

(assert start!40728)

(declare-fun b_free!10739 () Bool)

(declare-fun b_next!10739 () Bool)

(assert (=> start!40728 (= b_free!10739 (not b_next!10739))))

(declare-fun tp!38037 () Bool)

(declare-fun b_and!18747 () Bool)

(assert (=> start!40728 (= tp!38037 b_and!18747)))

(declare-fun b!451018 () Bool)

(declare-fun res!268524 () Bool)

(declare-fun e!264231 () Bool)

(assert (=> b!451018 (=> (not res!268524) (not e!264231))))

(declare-datatypes ((array!27959 0))(
  ( (array!27960 (arr!13425 (Array (_ BitVec 32) (_ BitVec 64))) (size!13777 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27959)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451018 (= res!268524 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!451019 () Bool)

(declare-fun e!264235 () Bool)

(declare-fun e!264229 () Bool)

(assert (=> b!451019 (= e!264235 (not e!264229))))

(declare-fun res!268529 () Bool)

(assert (=> b!451019 (=> res!268529 e!264229)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451019 (= res!268529 (validKeyInArray!0 (select (arr!13425 _keys!709) from!863)))))

(declare-fun e!264236 () Bool)

(assert (=> b!451019 e!264236))

(declare-fun c!56015 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451019 (= c!56015 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!17207 0))(
  ( (V!17208 (val!6083 Int)) )
))
(declare-fun minValue!515 () V!17207)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5695 0))(
  ( (ValueCellFull!5695 (v!8338 V!17207)) (EmptyCell!5695) )
))
(declare-datatypes ((array!27961 0))(
  ( (array!27962 (arr!13426 (Array (_ BitVec 32) ValueCell!5695)) (size!13778 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27961)

(declare-fun zeroValue!515 () V!17207)

(declare-fun v!412 () V!17207)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!13204 0))(
  ( (Unit!13205) )
))
(declare-fun lt!204782 () Unit!13204)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!717 (array!27959 array!27961 (_ BitVec 32) (_ BitVec 32) V!17207 V!17207 (_ BitVec 32) (_ BitVec 64) V!17207 (_ BitVec 32) Int) Unit!13204)

(assert (=> b!451019 (= lt!204782 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!717 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((tuple2!7994 0))(
  ( (tuple2!7995 (_1!4008 (_ BitVec 64)) (_2!4008 V!17207)) )
))
(declare-datatypes ((List!8059 0))(
  ( (Nil!8056) (Cons!8055 (h!8911 tuple2!7994) (t!13821 List!8059)) )
))
(declare-datatypes ((ListLongMap!6907 0))(
  ( (ListLongMap!6908 (toList!3469 List!8059)) )
))
(declare-fun call!29810 () ListLongMap!6907)

(declare-fun call!29809 () ListLongMap!6907)

(declare-fun b!451020 () Bool)

(declare-fun +!1549 (ListLongMap!6907 tuple2!7994) ListLongMap!6907)

(assert (=> b!451020 (= e!264236 (= call!29810 (+!1549 call!29809 (tuple2!7995 k!794 v!412))))))

(declare-fun mapIsEmpty!19749 () Bool)

(declare-fun mapRes!19749 () Bool)

(assert (=> mapIsEmpty!19749 mapRes!19749))

(declare-fun b!451021 () Bool)

(declare-fun e!264234 () Bool)

(assert (=> b!451021 (= e!264231 e!264234)))

(declare-fun res!268520 () Bool)

(assert (=> b!451021 (=> (not res!268520) (not e!264234))))

(declare-fun lt!204783 () array!27959)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27959 (_ BitVec 32)) Bool)

(assert (=> b!451021 (= res!268520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204783 mask!1025))))

(assert (=> b!451021 (= lt!204783 (array!27960 (store (arr!13425 _keys!709) i!563 k!794) (size!13777 _keys!709)))))

(declare-fun mapNonEmpty!19749 () Bool)

(declare-fun tp!38036 () Bool)

(declare-fun e!264230 () Bool)

(assert (=> mapNonEmpty!19749 (= mapRes!19749 (and tp!38036 e!264230))))

(declare-fun mapValue!19749 () ValueCell!5695)

(declare-fun mapKey!19749 () (_ BitVec 32))

(declare-fun mapRest!19749 () (Array (_ BitVec 32) ValueCell!5695))

(assert (=> mapNonEmpty!19749 (= (arr!13426 _values!549) (store mapRest!19749 mapKey!19749 mapValue!19749))))

(declare-fun b!451023 () Bool)

(declare-fun res!268518 () Bool)

(assert (=> b!451023 (=> (not res!268518) (not e!264231))))

(assert (=> b!451023 (= res!268518 (validKeyInArray!0 k!794))))

(declare-fun b!451024 () Bool)

(declare-fun tp_is_empty!12077 () Bool)

(assert (=> b!451024 (= e!264230 tp_is_empty!12077)))

(declare-fun b!451025 () Bool)

(assert (=> b!451025 (= e!264229 (bvslt from!863 (size!13778 _values!549)))))

(declare-fun lt!204781 () array!27961)

(declare-fun lt!204778 () ListLongMap!6907)

(declare-fun getCurrentListMapNoExtraKeys!1653 (array!27959 array!27961 (_ BitVec 32) (_ BitVec 32) V!17207 V!17207 (_ BitVec 32) Int) ListLongMap!6907)

(assert (=> b!451025 (= lt!204778 (getCurrentListMapNoExtraKeys!1653 lt!204783 lt!204781 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451026 () Bool)

(declare-fun res!268519 () Bool)

(assert (=> b!451026 (=> (not res!268519) (not e!264234))))

(assert (=> b!451026 (= res!268519 (bvsle from!863 i!563))))

(declare-fun b!451027 () Bool)

(declare-fun res!268521 () Bool)

(assert (=> b!451027 (=> (not res!268521) (not e!264231))))

(assert (=> b!451027 (= res!268521 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13777 _keys!709))))))

(declare-fun bm!29806 () Bool)

(assert (=> bm!29806 (= call!29810 (getCurrentListMapNoExtraKeys!1653 (ite c!56015 lt!204783 _keys!709) (ite c!56015 lt!204781 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!268522 () Bool)

(assert (=> start!40728 (=> (not res!268522) (not e!264231))))

(assert (=> start!40728 (= res!268522 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13777 _keys!709))))))

(assert (=> start!40728 e!264231))

(assert (=> start!40728 tp_is_empty!12077))

(assert (=> start!40728 tp!38037))

(assert (=> start!40728 true))

(declare-fun e!264232 () Bool)

(declare-fun array_inv!9722 (array!27961) Bool)

(assert (=> start!40728 (and (array_inv!9722 _values!549) e!264232)))

(declare-fun array_inv!9723 (array!27959) Bool)

(assert (=> start!40728 (array_inv!9723 _keys!709)))

(declare-fun b!451022 () Bool)

(declare-fun res!268517 () Bool)

(assert (=> b!451022 (=> (not res!268517) (not e!264231))))

(assert (=> b!451022 (= res!268517 (or (= (select (arr!13425 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13425 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451028 () Bool)

(declare-fun e!264233 () Bool)

(assert (=> b!451028 (= e!264232 (and e!264233 mapRes!19749))))

(declare-fun condMapEmpty!19749 () Bool)

(declare-fun mapDefault!19749 () ValueCell!5695)

