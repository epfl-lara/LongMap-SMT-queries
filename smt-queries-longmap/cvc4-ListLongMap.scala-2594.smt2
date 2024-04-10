; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39386 () Bool)

(assert start!39386)

(declare-fun b_free!9653 () Bool)

(declare-fun b_next!9653 () Bool)

(assert (=> start!39386 (= b_free!9653 (not b_next!9653))))

(declare-fun tp!34488 () Bool)

(declare-fun b_and!17181 () Bool)

(assert (=> start!39386 (= tp!34488 b_and!17181)))

(declare-fun b!418551 () Bool)

(declare-fun res!243901 () Bool)

(declare-fun e!249569 () Bool)

(assert (=> b!418551 (=> (not res!243901) (not e!249569))))

(declare-datatypes ((array!25461 0))(
  ( (array!25462 (arr!12180 (Array (_ BitVec 32) (_ BitVec 64))) (size!12532 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25461)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418551 (= res!243901 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17829 () Bool)

(declare-fun mapRes!17829 () Bool)

(declare-fun tp!34487 () Bool)

(declare-fun e!249567 () Bool)

(assert (=> mapNonEmpty!17829 (= mapRes!17829 (and tp!34487 e!249567))))

(declare-datatypes ((V!15511 0))(
  ( (V!15512 (val!5447 Int)) )
))
(declare-datatypes ((ValueCell!5059 0))(
  ( (ValueCellFull!5059 (v!7694 V!15511)) (EmptyCell!5059) )
))
(declare-datatypes ((array!25463 0))(
  ( (array!25464 (arr!12181 (Array (_ BitVec 32) ValueCell!5059)) (size!12533 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25463)

(declare-fun mapRest!17829 () (Array (_ BitVec 32) ValueCell!5059))

(declare-fun mapValue!17829 () ValueCell!5059)

(declare-fun mapKey!17829 () (_ BitVec 32))

(assert (=> mapNonEmpty!17829 (= (arr!12181 _values!549) (store mapRest!17829 mapKey!17829 mapValue!17829))))

(declare-fun b!418552 () Bool)

(declare-fun e!249568 () Bool)

(declare-fun e!249572 () Bool)

(assert (=> b!418552 (= e!249568 (not e!249572))))

(declare-fun res!243907 () Bool)

(assert (=> b!418552 (=> res!243907 e!249572)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418552 (= res!243907 (validKeyInArray!0 (select (arr!12180 _keys!709) from!863)))))

(declare-fun e!249570 () Bool)

(assert (=> b!418552 e!249570))

(declare-fun c!55193 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418552 (= c!55193 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15511)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15511)

(declare-fun v!412 () V!15511)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!12370 0))(
  ( (Unit!12371) )
))
(declare-fun lt!191848 () Unit!12370)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!436 (array!25461 array!25463 (_ BitVec 32) (_ BitVec 32) V!15511 V!15511 (_ BitVec 32) (_ BitVec 64) V!15511 (_ BitVec 32) Int) Unit!12370)

(assert (=> b!418552 (= lt!191848 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!436 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((tuple2!7124 0))(
  ( (tuple2!7125 (_1!3573 (_ BitVec 64)) (_2!3573 V!15511)) )
))
(declare-datatypes ((List!7137 0))(
  ( (Nil!7134) (Cons!7133 (h!7989 tuple2!7124) (t!12455 List!7137)) )
))
(declare-datatypes ((ListLongMap!6037 0))(
  ( (ListLongMap!6038 (toList!3034 List!7137)) )
))
(declare-fun call!29138 () ListLongMap!6037)

(declare-fun b!418553 () Bool)

(declare-fun call!29137 () ListLongMap!6037)

(declare-fun +!1233 (ListLongMap!6037 tuple2!7124) ListLongMap!6037)

(assert (=> b!418553 (= e!249570 (= call!29138 (+!1233 call!29137 (tuple2!7125 k!794 v!412))))))

(declare-fun b!418554 () Bool)

(assert (=> b!418554 (= e!249570 (= call!29137 call!29138))))

(declare-fun bm!29134 () Bool)

(declare-fun lt!191858 () array!25461)

(declare-fun lt!191849 () array!25463)

(declare-fun getCurrentListMapNoExtraKeys!1239 (array!25461 array!25463 (_ BitVec 32) (_ BitVec 32) V!15511 V!15511 (_ BitVec 32) Int) ListLongMap!6037)

(assert (=> bm!29134 (= call!29137 (getCurrentListMapNoExtraKeys!1239 (ite c!55193 _keys!709 lt!191858) (ite c!55193 _values!549 lt!191849) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418555 () Bool)

(declare-fun res!243905 () Bool)

(assert (=> b!418555 (=> (not res!243905) (not e!249569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418555 (= res!243905 (validMask!0 mask!1025))))

(declare-fun b!418556 () Bool)

(declare-fun res!243909 () Bool)

(assert (=> b!418556 (=> (not res!243909) (not e!249569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25461 (_ BitVec 32)) Bool)

(assert (=> b!418556 (= res!243909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418557 () Bool)

(declare-fun res!243898 () Bool)

(assert (=> b!418557 (=> (not res!243898) (not e!249569))))

(declare-datatypes ((List!7138 0))(
  ( (Nil!7135) (Cons!7134 (h!7990 (_ BitVec 64)) (t!12456 List!7138)) )
))
(declare-fun arrayNoDuplicates!0 (array!25461 (_ BitVec 32) List!7138) Bool)

(assert (=> b!418557 (= res!243898 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7135))))

(declare-fun bm!29135 () Bool)

(assert (=> bm!29135 (= call!29138 (getCurrentListMapNoExtraKeys!1239 (ite c!55193 lt!191858 _keys!709) (ite c!55193 lt!191849 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418558 () Bool)

(declare-fun res!243897 () Bool)

(declare-fun e!249565 () Bool)

(assert (=> b!418558 (=> (not res!243897) (not e!249565))))

(assert (=> b!418558 (= res!243897 (bvsle from!863 i!563))))

(declare-fun b!418559 () Bool)

(declare-fun res!243903 () Bool)

(assert (=> b!418559 (=> (not res!243903) (not e!249565))))

(assert (=> b!418559 (= res!243903 (arrayNoDuplicates!0 lt!191858 #b00000000000000000000000000000000 Nil!7135))))

(declare-fun mapIsEmpty!17829 () Bool)

(assert (=> mapIsEmpty!17829 mapRes!17829))

(declare-fun b!418560 () Bool)

(assert (=> b!418560 (= e!249572 true)))

(declare-fun lt!191853 () tuple2!7124)

(declare-fun lt!191850 () ListLongMap!6037)

(declare-fun lt!191852 () V!15511)

(assert (=> b!418560 (= (+!1233 lt!191850 lt!191853) (+!1233 (+!1233 lt!191850 (tuple2!7125 k!794 lt!191852)) lt!191853))))

(declare-fun lt!191855 () V!15511)

(assert (=> b!418560 (= lt!191853 (tuple2!7125 k!794 lt!191855))))

(declare-fun lt!191856 () Unit!12370)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!33 (ListLongMap!6037 (_ BitVec 64) V!15511 V!15511) Unit!12370)

(assert (=> b!418560 (= lt!191856 (addSameAsAddTwiceSameKeyDiffValues!33 lt!191850 k!794 lt!191852 lt!191855))))

(declare-fun lt!191851 () V!15511)

(declare-fun get!6035 (ValueCell!5059 V!15511) V!15511)

(assert (=> b!418560 (= lt!191852 (get!6035 (select (arr!12181 _values!549) from!863) lt!191851))))

(declare-fun lt!191857 () ListLongMap!6037)

(assert (=> b!418560 (= lt!191857 (+!1233 lt!191850 (tuple2!7125 (select (arr!12180 lt!191858) from!863) lt!191855)))))

(assert (=> b!418560 (= lt!191855 (get!6035 (select (store (arr!12181 _values!549) i!563 (ValueCellFull!5059 v!412)) from!863) lt!191851))))

(declare-fun dynLambda!704 (Int (_ BitVec 64)) V!15511)

(assert (=> b!418560 (= lt!191851 (dynLambda!704 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418560 (= lt!191850 (getCurrentListMapNoExtraKeys!1239 lt!191858 lt!191849 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418561 () Bool)

(declare-fun tp_is_empty!10805 () Bool)

(assert (=> b!418561 (= e!249567 tp_is_empty!10805)))

(declare-fun b!418563 () Bool)

(declare-fun e!249571 () Bool)

(assert (=> b!418563 (= e!249571 tp_is_empty!10805)))

(declare-fun res!243906 () Bool)

(assert (=> start!39386 (=> (not res!243906) (not e!249569))))

(assert (=> start!39386 (= res!243906 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12532 _keys!709))))))

(assert (=> start!39386 e!249569))

(assert (=> start!39386 tp_is_empty!10805))

(assert (=> start!39386 tp!34488))

(assert (=> start!39386 true))

(declare-fun e!249573 () Bool)

(declare-fun array_inv!8880 (array!25463) Bool)

(assert (=> start!39386 (and (array_inv!8880 _values!549) e!249573)))

(declare-fun array_inv!8881 (array!25461) Bool)

(assert (=> start!39386 (array_inv!8881 _keys!709)))

(declare-fun b!418562 () Bool)

(assert (=> b!418562 (= e!249573 (and e!249571 mapRes!17829))))

(declare-fun condMapEmpty!17829 () Bool)

(declare-fun mapDefault!17829 () ValueCell!5059)

