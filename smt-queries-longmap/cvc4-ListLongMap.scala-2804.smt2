; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40716 () Bool)

(assert start!40716)

(declare-fun b_free!10727 () Bool)

(declare-fun b_next!10727 () Bool)

(assert (=> start!40716 (= b_free!10727 (not b_next!10727))))

(declare-fun tp!38000 () Bool)

(declare-fun b_and!18735 () Bool)

(assert (=> start!40716 (= tp!38000 b_and!18735)))

(declare-fun b!450676 () Bool)

(declare-fun e!264071 () Bool)

(declare-fun e!264072 () Bool)

(assert (=> b!450676 (= e!264071 (not e!264072))))

(declare-fun res!268270 () Bool)

(assert (=> b!450676 (=> res!268270 e!264072)))

(declare-datatypes ((array!27935 0))(
  ( (array!27936 (arr!13413 (Array (_ BitVec 32) (_ BitVec 64))) (size!13765 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27935)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450676 (= res!268270 (validKeyInArray!0 (select (arr!13413 _keys!709) from!863)))))

(declare-fun e!264070 () Bool)

(assert (=> b!450676 e!264070))

(declare-fun c!55997 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450676 (= c!55997 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!17191 0))(
  ( (V!17192 (val!6077 Int)) )
))
(declare-fun minValue!515 () V!17191)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5689 0))(
  ( (ValueCellFull!5689 (v!8332 V!17191)) (EmptyCell!5689) )
))
(declare-datatypes ((array!27937 0))(
  ( (array!27938 (arr!13414 (Array (_ BitVec 32) ValueCell!5689)) (size!13766 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27937)

(declare-fun zeroValue!515 () V!17191)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13196 0))(
  ( (Unit!13197) )
))
(declare-fun lt!204672 () Unit!13196)

(declare-fun v!412 () V!17191)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!713 (array!27935 array!27937 (_ BitVec 32) (_ BitVec 32) V!17191 V!17191 (_ BitVec 32) (_ BitVec 64) V!17191 (_ BitVec 32) Int) Unit!13196)

(assert (=> b!450676 (= lt!204672 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!713 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450677 () Bool)

(declare-fun e!264066 () Bool)

(assert (=> b!450677 (= e!264066 e!264071)))

(declare-fun res!268273 () Bool)

(assert (=> b!450677 (=> (not res!268273) (not e!264071))))

(assert (=> b!450677 (= res!268273 (= from!863 i!563))))

(declare-fun lt!204673 () array!27937)

(declare-fun lt!204675 () array!27935)

(declare-datatypes ((tuple2!7984 0))(
  ( (tuple2!7985 (_1!4003 (_ BitVec 64)) (_2!4003 V!17191)) )
))
(declare-datatypes ((List!8050 0))(
  ( (Nil!8047) (Cons!8046 (h!8902 tuple2!7984) (t!13812 List!8050)) )
))
(declare-datatypes ((ListLongMap!6897 0))(
  ( (ListLongMap!6898 (toList!3464 List!8050)) )
))
(declare-fun lt!204674 () ListLongMap!6897)

(declare-fun getCurrentListMapNoExtraKeys!1648 (array!27935 array!27937 (_ BitVec 32) (_ BitVec 32) V!17191 V!17191 (_ BitVec 32) Int) ListLongMap!6897)

(assert (=> b!450677 (= lt!204674 (getCurrentListMapNoExtraKeys!1648 lt!204675 lt!204673 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450677 (= lt!204673 (array!27938 (store (arr!13414 _values!549) i!563 (ValueCellFull!5689 v!412)) (size!13766 _values!549)))))

(declare-fun lt!204671 () ListLongMap!6897)

(assert (=> b!450677 (= lt!204671 (getCurrentListMapNoExtraKeys!1648 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450678 () Bool)

(declare-fun res!268266 () Bool)

(declare-fun e!264068 () Bool)

(assert (=> b!450678 (=> (not res!268266) (not e!264068))))

(assert (=> b!450678 (= res!268266 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13765 _keys!709))))))

(declare-fun b!450679 () Bool)

(declare-fun e!264073 () Bool)

(declare-fun tp_is_empty!12065 () Bool)

(assert (=> b!450679 (= e!264073 tp_is_empty!12065)))

(declare-fun mapNonEmpty!19731 () Bool)

(declare-fun mapRes!19731 () Bool)

(declare-fun tp!38001 () Bool)

(assert (=> mapNonEmpty!19731 (= mapRes!19731 (and tp!38001 e!264073))))

(declare-fun mapValue!19731 () ValueCell!5689)

(declare-fun mapKey!19731 () (_ BitVec 32))

(declare-fun mapRest!19731 () (Array (_ BitVec 32) ValueCell!5689))

(assert (=> mapNonEmpty!19731 (= (arr!13414 _values!549) (store mapRest!19731 mapKey!19731 mapValue!19731))))

(declare-fun b!450680 () Bool)

(declare-fun res!268272 () Bool)

(assert (=> b!450680 (=> (not res!268272) (not e!264068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450680 (= res!268272 (validMask!0 mask!1025))))

(declare-fun b!450681 () Bool)

(declare-fun call!29774 () ListLongMap!6897)

(declare-fun call!29773 () ListLongMap!6897)

(declare-fun +!1545 (ListLongMap!6897 tuple2!7984) ListLongMap!6897)

(assert (=> b!450681 (= e!264070 (= call!29774 (+!1545 call!29773 (tuple2!7985 k!794 v!412))))))

(declare-fun b!450682 () Bool)

(declare-fun e!264067 () Bool)

(assert (=> b!450682 (= e!264067 tp_is_empty!12065)))

(declare-fun res!268276 () Bool)

(assert (=> start!40716 (=> (not res!268276) (not e!264068))))

(assert (=> start!40716 (= res!268276 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13765 _keys!709))))))

(assert (=> start!40716 e!264068))

(assert (=> start!40716 tp_is_empty!12065))

(assert (=> start!40716 tp!38000))

(assert (=> start!40716 true))

(declare-fun e!264074 () Bool)

(declare-fun array_inv!9712 (array!27937) Bool)

(assert (=> start!40716 (and (array_inv!9712 _values!549) e!264074)))

(declare-fun array_inv!9713 (array!27935) Bool)

(assert (=> start!40716 (array_inv!9713 _keys!709)))

(declare-fun b!450683 () Bool)

(declare-fun res!268268 () Bool)

(assert (=> b!450683 (=> (not res!268268) (not e!264068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27935 (_ BitVec 32)) Bool)

(assert (=> b!450683 (= res!268268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450684 () Bool)

(declare-fun res!268267 () Bool)

(assert (=> b!450684 (=> (not res!268267) (not e!264066))))

(assert (=> b!450684 (= res!268267 (bvsle from!863 i!563))))

(declare-fun b!450685 () Bool)

(declare-fun res!268265 () Bool)

(assert (=> b!450685 (=> (not res!268265) (not e!264068))))

(assert (=> b!450685 (= res!268265 (validKeyInArray!0 k!794))))

(declare-fun b!450686 () Bool)

(declare-fun res!268274 () Bool)

(assert (=> b!450686 (=> (not res!268274) (not e!264068))))

(assert (=> b!450686 (= res!268274 (and (= (size!13766 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13765 _keys!709) (size!13766 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450687 () Bool)

(assert (=> b!450687 (= e!264072 (bvslt i!563 (size!13766 _values!549)))))

(declare-fun b!450688 () Bool)

(declare-fun res!268269 () Bool)

(assert (=> b!450688 (=> (not res!268269) (not e!264068))))

(assert (=> b!450688 (= res!268269 (or (= (select (arr!13413 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13413 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29770 () Bool)

(assert (=> bm!29770 (= call!29773 (getCurrentListMapNoExtraKeys!1648 (ite c!55997 _keys!709 lt!204675) (ite c!55997 _values!549 lt!204673) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450689 () Bool)

(assert (=> b!450689 (= e!264070 (= call!29773 call!29774))))

(declare-fun b!450690 () Bool)

(assert (=> b!450690 (= e!264074 (and e!264067 mapRes!19731))))

(declare-fun condMapEmpty!19731 () Bool)

(declare-fun mapDefault!19731 () ValueCell!5689)

