; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40762 () Bool)

(assert start!40762)

(declare-fun b_free!10751 () Bool)

(declare-fun b_next!10751 () Bool)

(assert (=> start!40762 (= b_free!10751 (not b_next!10751))))

(declare-fun tp!38076 () Bool)

(declare-fun b_and!18789 () Bool)

(assert (=> start!40762 (= tp!38076 b_and!18789)))

(declare-fun b!451527 () Bool)

(declare-fun res!268836 () Bool)

(declare-fun e!264498 () Bool)

(assert (=> b!451527 (=> (not res!268836) (not e!264498))))

(declare-datatypes ((array!27985 0))(
  ( (array!27986 (arr!13437 (Array (_ BitVec 32) (_ BitVec 64))) (size!13789 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27985)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27985 (_ BitVec 32)) Bool)

(assert (=> b!451527 (= res!268836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451528 () Bool)

(declare-fun e!264497 () Bool)

(declare-fun tp_is_empty!12089 () Bool)

(assert (=> b!451528 (= e!264497 tp_is_empty!12089)))

(declare-fun b!451530 () Bool)

(declare-fun res!268834 () Bool)

(assert (=> b!451530 (=> (not res!268834) (not e!264498))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451530 (= res!268834 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13789 _keys!709))))))

(declare-fun b!451531 () Bool)

(declare-fun res!268835 () Bool)

(declare-fun e!264500 () Bool)

(assert (=> b!451531 (=> (not res!268835) (not e!264500))))

(declare-fun lt!204950 () array!27985)

(declare-datatypes ((List!8068 0))(
  ( (Nil!8065) (Cons!8064 (h!8920 (_ BitVec 64)) (t!13842 List!8068)) )
))
(declare-fun arrayNoDuplicates!0 (array!27985 (_ BitVec 32) List!8068) Bool)

(assert (=> b!451531 (= res!268835 (arrayNoDuplicates!0 lt!204950 #b00000000000000000000000000000000 Nil!8065))))

(declare-fun b!451532 () Bool)

(declare-fun res!268841 () Bool)

(assert (=> b!451532 (=> (not res!268841) (not e!264498))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17223 0))(
  ( (V!17224 (val!6089 Int)) )
))
(declare-datatypes ((ValueCell!5701 0))(
  ( (ValueCellFull!5701 (v!8348 V!17223)) (EmptyCell!5701) )
))
(declare-datatypes ((array!27987 0))(
  ( (array!27988 (arr!13438 (Array (_ BitVec 32) ValueCell!5701)) (size!13790 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27987)

(assert (=> b!451532 (= res!268841 (and (= (size!13790 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13789 _keys!709) (size!13790 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451533 () Bool)

(declare-fun res!268845 () Bool)

(assert (=> b!451533 (=> (not res!268845) (not e!264500))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!451533 (= res!268845 (bvsle from!863 i!563))))

(declare-fun b!451534 () Bool)

(declare-fun e!264495 () Bool)

(assert (=> b!451534 (= e!264500 e!264495)))

(declare-fun res!268843 () Bool)

(assert (=> b!451534 (=> (not res!268843) (not e!264495))))

(assert (=> b!451534 (= res!268843 (= from!863 i!563))))

(declare-fun minValue!515 () V!17223)

(declare-fun zeroValue!515 () V!17223)

(declare-datatypes ((tuple2!8006 0))(
  ( (tuple2!8007 (_1!4014 (_ BitVec 64)) (_2!4014 V!17223)) )
))
(declare-datatypes ((List!8069 0))(
  ( (Nil!8066) (Cons!8065 (h!8921 tuple2!8006) (t!13843 List!8069)) )
))
(declare-datatypes ((ListLongMap!6919 0))(
  ( (ListLongMap!6920 (toList!3475 List!8069)) )
))
(declare-fun lt!204952 () ListLongMap!6919)

(declare-fun lt!204953 () array!27987)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1659 (array!27985 array!27987 (_ BitVec 32) (_ BitVec 32) V!17223 V!17223 (_ BitVec 32) Int) ListLongMap!6919)

(assert (=> b!451534 (= lt!204952 (getCurrentListMapNoExtraKeys!1659 lt!204950 lt!204953 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17223)

(assert (=> b!451534 (= lt!204953 (array!27988 (store (arr!13438 _values!549) i!563 (ValueCellFull!5701 v!412)) (size!13790 _values!549)))))

(declare-fun lt!204949 () ListLongMap!6919)

(assert (=> b!451534 (= lt!204949 (getCurrentListMapNoExtraKeys!1659 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451535 () Bool)

(declare-fun e!264492 () Bool)

(declare-fun call!29866 () ListLongMap!6919)

(declare-fun call!29867 () ListLongMap!6919)

(assert (=> b!451535 (= e!264492 (= call!29866 call!29867))))

(declare-fun b!451536 () Bool)

(declare-fun e!264493 () Bool)

(assert (=> b!451536 (= e!264493 (bvslt i!563 (size!13790 _values!549)))))

(declare-fun +!1555 (ListLongMap!6919 tuple2!8006) ListLongMap!6919)

(declare-fun get!6616 (ValueCell!5701 V!17223) V!17223)

(declare-fun dynLambda!855 (Int (_ BitVec 64)) V!17223)

(assert (=> b!451536 (= lt!204952 (+!1555 (getCurrentListMapNoExtraKeys!1659 lt!204950 lt!204953 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8007 (select (arr!13437 lt!204950) from!863) (get!6616 (select (arr!13438 lt!204953) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451537 () Bool)

(declare-fun res!268844 () Bool)

(assert (=> b!451537 (=> (not res!268844) (not e!264498))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451537 (= res!268844 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19770 () Bool)

(declare-fun mapRes!19770 () Bool)

(declare-fun tp!38075 () Bool)

(declare-fun e!264496 () Bool)

(assert (=> mapNonEmpty!19770 (= mapRes!19770 (and tp!38075 e!264496))))

(declare-fun mapRest!19770 () (Array (_ BitVec 32) ValueCell!5701))

(declare-fun mapKey!19770 () (_ BitVec 32))

(declare-fun mapValue!19770 () ValueCell!5701)

(assert (=> mapNonEmpty!19770 (= (arr!13438 _values!549) (store mapRest!19770 mapKey!19770 mapValue!19770))))

(declare-fun b!451538 () Bool)

(declare-fun res!268837 () Bool)

(assert (=> b!451538 (=> (not res!268837) (not e!264498))))

(assert (=> b!451538 (= res!268837 (or (= (select (arr!13437 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13437 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451539 () Bool)

(declare-fun res!268847 () Bool)

(assert (=> b!451539 (=> (not res!268847) (not e!264498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451539 (= res!268847 (validKeyInArray!0 k!794))))

(declare-fun b!451540 () Bool)

(declare-fun res!268839 () Bool)

(assert (=> b!451540 (=> (not res!268839) (not e!264498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451540 (= res!268839 (validMask!0 mask!1025))))

(declare-fun b!451541 () Bool)

(declare-fun res!268842 () Bool)

(assert (=> b!451541 (=> (not res!268842) (not e!264498))))

(assert (=> b!451541 (= res!268842 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8065))))

(declare-fun b!451542 () Bool)

(assert (=> b!451542 (= e!264498 e!264500)))

(declare-fun res!268840 () Bool)

(assert (=> b!451542 (=> (not res!268840) (not e!264500))))

(assert (=> b!451542 (= res!268840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204950 mask!1025))))

(assert (=> b!451542 (= lt!204950 (array!27986 (store (arr!13437 _keys!709) i!563 k!794) (size!13789 _keys!709)))))

(declare-fun b!451529 () Bool)

(assert (=> b!451529 (= e!264496 tp_is_empty!12089)))

(declare-fun res!268846 () Bool)

(assert (=> start!40762 (=> (not res!268846) (not e!264498))))

(assert (=> start!40762 (= res!268846 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13789 _keys!709))))))

(assert (=> start!40762 e!264498))

(assert (=> start!40762 tp_is_empty!12089))

(assert (=> start!40762 tp!38076))

(assert (=> start!40762 true))

(declare-fun e!264499 () Bool)

(declare-fun array_inv!9732 (array!27987) Bool)

(assert (=> start!40762 (and (array_inv!9732 _values!549) e!264499)))

(declare-fun array_inv!9733 (array!27985) Bool)

(assert (=> start!40762 (array_inv!9733 _keys!709)))

(declare-fun bm!29863 () Bool)

(declare-fun c!56075 () Bool)

(assert (=> bm!29863 (= call!29866 (getCurrentListMapNoExtraKeys!1659 (ite c!56075 _keys!709 lt!204950) (ite c!56075 _values!549 lt!204953) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451543 () Bool)

(assert (=> b!451543 (= e!264492 (= call!29867 (+!1555 call!29866 (tuple2!8007 k!794 v!412))))))

(declare-fun b!451544 () Bool)

(assert (=> b!451544 (= e!264495 (not e!264493))))

(declare-fun res!268838 () Bool)

(assert (=> b!451544 (=> res!268838 e!264493)))

(assert (=> b!451544 (= res!268838 (validKeyInArray!0 (select (arr!13437 _keys!709) from!863)))))

(assert (=> b!451544 e!264492))

(assert (=> b!451544 (= c!56075 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13212 0))(
  ( (Unit!13213) )
))
(declare-fun lt!204951 () Unit!13212)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!721 (array!27985 array!27987 (_ BitVec 32) (_ BitVec 32) V!17223 V!17223 (_ BitVec 32) (_ BitVec 64) V!17223 (_ BitVec 32) Int) Unit!13212)

(assert (=> b!451544 (= lt!204951 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!721 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451545 () Bool)

(assert (=> b!451545 (= e!264499 (and e!264497 mapRes!19770))))

(declare-fun condMapEmpty!19770 () Bool)

(declare-fun mapDefault!19770 () ValueCell!5701)

