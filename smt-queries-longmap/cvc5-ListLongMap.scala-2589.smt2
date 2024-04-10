; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39352 () Bool)

(assert start!39352)

(declare-fun b_free!9619 () Bool)

(declare-fun b_next!9619 () Bool)

(assert (=> start!39352 (= b_free!9619 (not b_next!9619))))

(declare-fun tp!34385 () Bool)

(declare-fun b_and!17113 () Bool)

(assert (=> start!39352 (= tp!34385 b_and!17113)))

(declare-fun b!417548 () Bool)

(declare-fun res!243187 () Bool)

(declare-fun e!249108 () Bool)

(assert (=> b!417548 (=> (not res!243187) (not e!249108))))

(declare-datatypes ((array!25393 0))(
  ( (array!25394 (arr!12146 (Array (_ BitVec 32) (_ BitVec 64))) (size!12498 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25393)

(declare-datatypes ((List!7107 0))(
  ( (Nil!7104) (Cons!7103 (h!7959 (_ BitVec 64)) (t!12391 List!7107)) )
))
(declare-fun arrayNoDuplicates!0 (array!25393 (_ BitVec 32) List!7107) Bool)

(assert (=> b!417548 (= res!243187 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7104))))

(declare-fun b!417549 () Bool)

(declare-fun e!249111 () Bool)

(assert (=> b!417549 (= e!249108 e!249111)))

(declare-fun res!243194 () Bool)

(assert (=> b!417549 (=> (not res!243194) (not e!249111))))

(declare-fun lt!191288 () array!25393)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25393 (_ BitVec 32)) Bool)

(assert (=> b!417549 (= res!243194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191288 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!417549 (= lt!191288 (array!25394 (store (arr!12146 _keys!709) i!563 k!794) (size!12498 _keys!709)))))

(declare-fun b!417550 () Bool)

(declare-fun res!243182 () Bool)

(assert (=> b!417550 (=> (not res!243182) (not e!249108))))

(assert (=> b!417550 (= res!243182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417551 () Bool)

(declare-fun res!243190 () Bool)

(assert (=> b!417551 (=> (not res!243190) (not e!249108))))

(assert (=> b!417551 (= res!243190 (or (= (select (arr!12146 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12146 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417553 () Bool)

(declare-fun res!243192 () Bool)

(assert (=> b!417553 (=> (not res!243192) (not e!249108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417553 (= res!243192 (validKeyInArray!0 k!794))))

(declare-datatypes ((V!15467 0))(
  ( (V!15468 (val!5430 Int)) )
))
(declare-fun minValue!515 () V!15467)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29032 () Bool)

(declare-datatypes ((tuple2!7090 0))(
  ( (tuple2!7091 (_1!3556 (_ BitVec 64)) (_2!3556 V!15467)) )
))
(declare-datatypes ((List!7108 0))(
  ( (Nil!7105) (Cons!7104 (h!7960 tuple2!7090) (t!12392 List!7108)) )
))
(declare-datatypes ((ListLongMap!6003 0))(
  ( (ListLongMap!6004 (toList!3017 List!7108)) )
))
(declare-fun call!29036 () ListLongMap!6003)

(declare-datatypes ((ValueCell!5042 0))(
  ( (ValueCellFull!5042 (v!7677 V!15467)) (EmptyCell!5042) )
))
(declare-datatypes ((array!25395 0))(
  ( (array!25396 (arr!12147 (Array (_ BitVec 32) ValueCell!5042)) (size!12499 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25395)

(declare-fun lt!191296 () array!25395)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!55142 () Bool)

(declare-fun zeroValue!515 () V!15467)

(declare-fun getCurrentListMapNoExtraKeys!1222 (array!25393 array!25395 (_ BitVec 32) (_ BitVec 32) V!15467 V!15467 (_ BitVec 32) Int) ListLongMap!6003)

(assert (=> bm!29032 (= call!29036 (getCurrentListMapNoExtraKeys!1222 (ite c!55142 lt!191288 _keys!709) (ite c!55142 lt!191296 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17778 () Bool)

(declare-fun mapRes!17778 () Bool)

(declare-fun tp!34386 () Bool)

(declare-fun e!249106 () Bool)

(assert (=> mapNonEmpty!17778 (= mapRes!17778 (and tp!34386 e!249106))))

(declare-fun mapKey!17778 () (_ BitVec 32))

(declare-fun mapValue!17778 () ValueCell!5042)

(declare-fun mapRest!17778 () (Array (_ BitVec 32) ValueCell!5042))

(assert (=> mapNonEmpty!17778 (= (arr!12147 _values!549) (store mapRest!17778 mapKey!17778 mapValue!17778))))

(declare-fun call!29035 () ListLongMap!6003)

(declare-fun bm!29033 () Bool)

(assert (=> bm!29033 (= call!29035 (getCurrentListMapNoExtraKeys!1222 (ite c!55142 _keys!709 lt!191288) (ite c!55142 _values!549 lt!191296) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417554 () Bool)

(declare-fun e!249110 () Bool)

(declare-fun e!249109 () Bool)

(assert (=> b!417554 (= e!249110 (not e!249109))))

(declare-fun res!243183 () Bool)

(assert (=> b!417554 (=> res!243183 e!249109)))

(assert (=> b!417554 (= res!243183 (validKeyInArray!0 (select (arr!12146 _keys!709) from!863)))))

(declare-fun e!249114 () Bool)

(assert (=> b!417554 e!249114))

(assert (=> b!417554 (= c!55142 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!15467)

(declare-datatypes ((Unit!12338 0))(
  ( (Unit!12339) )
))
(declare-fun lt!191287 () Unit!12338)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!425 (array!25393 array!25395 (_ BitVec 32) (_ BitVec 32) V!15467 V!15467 (_ BitVec 32) (_ BitVec 64) V!15467 (_ BitVec 32) Int) Unit!12338)

(assert (=> b!417554 (= lt!191287 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!425 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417555 () Bool)

(declare-fun res!243193 () Bool)

(assert (=> b!417555 (=> (not res!243193) (not e!249111))))

(assert (=> b!417555 (= res!243193 (arrayNoDuplicates!0 lt!191288 #b00000000000000000000000000000000 Nil!7104))))

(declare-fun b!417556 () Bool)

(declare-fun res!243195 () Bool)

(assert (=> b!417556 (=> (not res!243195) (not e!249108))))

(assert (=> b!417556 (= res!243195 (and (= (size!12499 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12498 _keys!709) (size!12499 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417557 () Bool)

(declare-fun e!249107 () Bool)

(declare-fun e!249113 () Bool)

(assert (=> b!417557 (= e!249107 (and e!249113 mapRes!17778))))

(declare-fun condMapEmpty!17778 () Bool)

(declare-fun mapDefault!17778 () ValueCell!5042)

