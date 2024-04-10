; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38594 () Bool)

(assert start!38594)

(declare-fun b_free!9131 () Bool)

(declare-fun b_next!9131 () Bool)

(assert (=> start!38594 (= b_free!9131 (not b_next!9131))))

(declare-fun tp!32516 () Bool)

(declare-fun b_and!16517 () Bool)

(assert (=> start!38594 (= tp!32516 b_and!16517)))

(declare-fun b!399799 () Bool)

(declare-fun res!229939 () Bool)

(declare-fun e!241383 () Bool)

(assert (=> b!399799 (=> (not res!229939) (not e!241383))))

(declare-datatypes ((array!23937 0))(
  ( (array!23938 (arr!11418 (Array (_ BitVec 32) (_ BitVec 64))) (size!11770 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23937)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399799 (= res!229939 (or (= (select (arr!11418 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11418 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399800 () Bool)

(declare-fun res!229938 () Bool)

(assert (=> b!399800 (=> (not res!229938) (not e!241383))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399800 (= res!229938 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!229936 () Bool)

(assert (=> start!38594 (=> (not res!229936) (not e!241383))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38594 (= res!229936 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11770 _keys!709))))))

(assert (=> start!38594 e!241383))

(declare-fun tp_is_empty!10013 () Bool)

(assert (=> start!38594 tp_is_empty!10013))

(assert (=> start!38594 tp!32516))

(assert (=> start!38594 true))

(declare-datatypes ((V!14455 0))(
  ( (V!14456 (val!5051 Int)) )
))
(declare-datatypes ((ValueCell!4663 0))(
  ( (ValueCellFull!4663 (v!7298 V!14455)) (EmptyCell!4663) )
))
(declare-datatypes ((array!23939 0))(
  ( (array!23940 (arr!11419 (Array (_ BitVec 32) ValueCell!4663)) (size!11771 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23939)

(declare-fun e!241381 () Bool)

(declare-fun array_inv!8366 (array!23939) Bool)

(assert (=> start!38594 (and (array_inv!8366 _values!549) e!241381)))

(declare-fun array_inv!8367 (array!23937) Bool)

(assert (=> start!38594 (array_inv!8367 _keys!709)))

(declare-fun minValue!515 () V!14455)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28054 () Bool)

(declare-fun zeroValue!515 () V!14455)

(declare-fun lt!187618 () array!23937)

(declare-fun c!54653 () Bool)

(declare-datatypes ((tuple2!6690 0))(
  ( (tuple2!6691 (_1!3356 (_ BitVec 64)) (_2!3356 V!14455)) )
))
(declare-datatypes ((List!6616 0))(
  ( (Nil!6613) (Cons!6612 (h!7468 tuple2!6690) (t!11790 List!6616)) )
))
(declare-datatypes ((ListLongMap!5603 0))(
  ( (ListLongMap!5604 (toList!2817 List!6616)) )
))
(declare-fun call!28057 () ListLongMap!5603)

(declare-fun v!412 () V!14455)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1034 (array!23937 array!23939 (_ BitVec 32) (_ BitVec 32) V!14455 V!14455 (_ BitVec 32) Int) ListLongMap!5603)

(assert (=> bm!28054 (= call!28057 (getCurrentListMapNoExtraKeys!1034 (ite c!54653 lt!187618 _keys!709) (ite c!54653 (array!23940 (store (arr!11419 _values!549) i!563 (ValueCellFull!4663 v!412)) (size!11771 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399801 () Bool)

(declare-fun res!229941 () Bool)

(assert (=> b!399801 (=> (not res!229941) (not e!241383))))

(assert (=> b!399801 (= res!229941 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11770 _keys!709))))))

(declare-fun call!28058 () ListLongMap!5603)

(declare-fun bm!28055 () Bool)

(assert (=> bm!28055 (= call!28058 (getCurrentListMapNoExtraKeys!1034 (ite c!54653 _keys!709 lt!187618) (ite c!54653 _values!549 (array!23940 (store (arr!11419 _values!549) i!563 (ValueCellFull!4663 v!412)) (size!11771 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!241379 () Bool)

(declare-fun b!399802 () Bool)

(declare-fun +!1105 (ListLongMap!5603 tuple2!6690) ListLongMap!5603)

(assert (=> b!399802 (= e!241379 (= call!28057 (+!1105 call!28058 (tuple2!6691 k!794 v!412))))))

(declare-fun mapIsEmpty!16641 () Bool)

(declare-fun mapRes!16641 () Bool)

(assert (=> mapIsEmpty!16641 mapRes!16641))

(declare-fun b!399803 () Bool)

(declare-fun e!241380 () Bool)

(assert (=> b!399803 (= e!241380 tp_is_empty!10013)))

(declare-fun b!399804 () Bool)

(declare-fun e!241377 () Bool)

(assert (=> b!399804 (= e!241377 (not true))))

(assert (=> b!399804 e!241379))

(assert (=> b!399804 (= c!54653 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12118 0))(
  ( (Unit!12119) )
))
(declare-fun lt!187619 () Unit!12118)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!317 (array!23937 array!23939 (_ BitVec 32) (_ BitVec 32) V!14455 V!14455 (_ BitVec 32) (_ BitVec 64) V!14455 (_ BitVec 32) Int) Unit!12118)

(assert (=> b!399804 (= lt!187619 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!317 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399805 () Bool)

(assert (=> b!399805 (= e!241383 e!241377)))

(declare-fun res!229935 () Bool)

(assert (=> b!399805 (=> (not res!229935) (not e!241377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23937 (_ BitVec 32)) Bool)

(assert (=> b!399805 (= res!229935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187618 mask!1025))))

(assert (=> b!399805 (= lt!187618 (array!23938 (store (arr!11418 _keys!709) i!563 k!794) (size!11770 _keys!709)))))

(declare-fun b!399806 () Bool)

(assert (=> b!399806 (= e!241379 (= call!28058 call!28057))))

(declare-fun b!399807 () Bool)

(declare-fun res!229931 () Bool)

(assert (=> b!399807 (=> (not res!229931) (not e!241377))))

(declare-datatypes ((List!6617 0))(
  ( (Nil!6614) (Cons!6613 (h!7469 (_ BitVec 64)) (t!11791 List!6617)) )
))
(declare-fun arrayNoDuplicates!0 (array!23937 (_ BitVec 32) List!6617) Bool)

(assert (=> b!399807 (= res!229931 (arrayNoDuplicates!0 lt!187618 #b00000000000000000000000000000000 Nil!6614))))

(declare-fun b!399808 () Bool)

(declare-fun e!241378 () Bool)

(assert (=> b!399808 (= e!241381 (and e!241378 mapRes!16641))))

(declare-fun condMapEmpty!16641 () Bool)

(declare-fun mapDefault!16641 () ValueCell!4663)

