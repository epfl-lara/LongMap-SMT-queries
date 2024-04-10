; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38558 () Bool)

(assert start!38558)

(declare-fun b_free!9095 () Bool)

(declare-fun b_next!9095 () Bool)

(assert (=> start!38558 (= b_free!9095 (not b_next!9095))))

(declare-fun tp!32408 () Bool)

(declare-fun b_and!16481 () Bool)

(assert (=> start!38558 (= tp!32408 b_and!16481)))

(declare-fun b!398881 () Bool)

(declare-fun res!229293 () Bool)

(declare-fun e!241003 () Bool)

(assert (=> b!398881 (=> (not res!229293) (not e!241003))))

(declare-datatypes ((array!23865 0))(
  ( (array!23866 (arr!11382 (Array (_ BitVec 32) (_ BitVec 64))) (size!11734 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23865)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14407 0))(
  ( (V!14408 (val!5033 Int)) )
))
(declare-datatypes ((ValueCell!4645 0))(
  ( (ValueCellFull!4645 (v!7280 V!14407)) (EmptyCell!4645) )
))
(declare-datatypes ((array!23867 0))(
  ( (array!23868 (arr!11383 (Array (_ BitVec 32) ValueCell!4645)) (size!11735 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23867)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!398881 (= res!229293 (and (= (size!11735 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11734 _keys!709) (size!11735 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16587 () Bool)

(declare-fun mapRes!16587 () Bool)

(assert (=> mapIsEmpty!16587 mapRes!16587))

(declare-fun b!398882 () Bool)

(declare-fun res!229287 () Bool)

(assert (=> b!398882 (=> (not res!229287) (not e!241003))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398882 (= res!229287 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!398883 () Bool)

(declare-fun res!229291 () Bool)

(assert (=> b!398883 (=> (not res!229291) (not e!241003))))

(declare-datatypes ((List!6584 0))(
  ( (Nil!6581) (Cons!6580 (h!7436 (_ BitVec 64)) (t!11758 List!6584)) )
))
(declare-fun arrayNoDuplicates!0 (array!23865 (_ BitVec 32) List!6584) Bool)

(assert (=> b!398883 (= res!229291 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6581))))

(declare-datatypes ((tuple2!6658 0))(
  ( (tuple2!6659 (_1!3340 (_ BitVec 64)) (_2!3340 V!14407)) )
))
(declare-datatypes ((List!6585 0))(
  ( (Nil!6582) (Cons!6581 (h!7437 tuple2!6658) (t!11759 List!6585)) )
))
(declare-datatypes ((ListLongMap!5571 0))(
  ( (ListLongMap!5572 (toList!2801 List!6585)) )
))
(declare-fun call!27949 () ListLongMap!5571)

(declare-fun e!241005 () Bool)

(declare-fun b!398884 () Bool)

(declare-fun call!27950 () ListLongMap!5571)

(declare-fun v!412 () V!14407)

(declare-fun +!1091 (ListLongMap!5571 tuple2!6658) ListLongMap!5571)

(assert (=> b!398884 (= e!241005 (= call!27949 (+!1091 call!27950 (tuple2!6659 k!794 v!412))))))

(declare-fun b!398885 () Bool)

(declare-fun res!229285 () Bool)

(declare-fun e!240999 () Bool)

(assert (=> b!398885 (=> (not res!229285) (not e!240999))))

(declare-fun lt!187510 () array!23865)

(assert (=> b!398885 (= res!229285 (arrayNoDuplicates!0 lt!187510 #b00000000000000000000000000000000 Nil!6581))))

(declare-fun b!398886 () Bool)

(declare-fun e!241000 () Bool)

(declare-fun tp_is_empty!9977 () Bool)

(assert (=> b!398886 (= e!241000 tp_is_empty!9977)))

(declare-fun b!398887 () Bool)

(assert (=> b!398887 (= e!240999 (not true))))

(assert (=> b!398887 e!241005))

(declare-fun c!54599 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398887 (= c!54599 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14407)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14407)

(declare-datatypes ((Unit!12088 0))(
  ( (Unit!12089) )
))
(declare-fun lt!187511 () Unit!12088)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!302 (array!23865 array!23867 (_ BitVec 32) (_ BitVec 32) V!14407 V!14407 (_ BitVec 32) (_ BitVec 64) V!14407 (_ BitVec 32) Int) Unit!12088)

(assert (=> b!398887 (= lt!187511 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!302 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398888 () Bool)

(assert (=> b!398888 (= e!241003 e!240999)))

(declare-fun res!229288 () Bool)

(assert (=> b!398888 (=> (not res!229288) (not e!240999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23865 (_ BitVec 32)) Bool)

(assert (=> b!398888 (= res!229288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187510 mask!1025))))

(assert (=> b!398888 (= lt!187510 (array!23866 (store (arr!11382 _keys!709) i!563 k!794) (size!11734 _keys!709)))))

(declare-fun b!398889 () Bool)

(declare-fun res!229289 () Bool)

(assert (=> b!398889 (=> (not res!229289) (not e!241003))))

(assert (=> b!398889 (= res!229289 (or (= (select (arr!11382 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11382 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398890 () Bool)

(declare-fun e!241002 () Bool)

(assert (=> b!398890 (= e!241002 tp_is_empty!9977)))

(declare-fun b!398891 () Bool)

(declare-fun res!229290 () Bool)

(assert (=> b!398891 (=> (not res!229290) (not e!240999))))

(assert (=> b!398891 (= res!229290 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11734 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398892 () Bool)

(declare-fun res!229284 () Bool)

(assert (=> b!398892 (=> (not res!229284) (not e!241003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398892 (= res!229284 (validKeyInArray!0 k!794))))

(declare-fun b!398893 () Bool)

(assert (=> b!398893 (= e!241005 (= call!27950 call!27949))))

(declare-fun b!398894 () Bool)

(declare-fun res!229292 () Bool)

(assert (=> b!398894 (=> (not res!229292) (not e!241003))))

(assert (=> b!398894 (= res!229292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!27947 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1019 (array!23865 array!23867 (_ BitVec 32) (_ BitVec 32) V!14407 V!14407 (_ BitVec 32) Int) ListLongMap!5571)

(assert (=> bm!27947 (= call!27950 (getCurrentListMapNoExtraKeys!1019 (ite c!54599 _keys!709 lt!187510) (ite c!54599 _values!549 (array!23868 (store (arr!11383 _values!549) i!563 (ValueCellFull!4645 v!412)) (size!11735 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398895 () Bool)

(declare-fun res!229286 () Bool)

(assert (=> b!398895 (=> (not res!229286) (not e!241003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398895 (= res!229286 (validMask!0 mask!1025))))

(declare-fun b!398896 () Bool)

(declare-fun res!229283 () Bool)

(assert (=> b!398896 (=> (not res!229283) (not e!241003))))

(assert (=> b!398896 (= res!229283 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11734 _keys!709))))))

(declare-fun bm!27946 () Bool)

(assert (=> bm!27946 (= call!27949 (getCurrentListMapNoExtraKeys!1019 (ite c!54599 lt!187510 _keys!709) (ite c!54599 (array!23868 (store (arr!11383 _values!549) i!563 (ValueCellFull!4645 v!412)) (size!11735 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!229282 () Bool)

(assert (=> start!38558 (=> (not res!229282) (not e!241003))))

(assert (=> start!38558 (= res!229282 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11734 _keys!709))))))

(assert (=> start!38558 e!241003))

(assert (=> start!38558 tp_is_empty!9977))

(assert (=> start!38558 tp!32408))

(assert (=> start!38558 true))

(declare-fun e!241001 () Bool)

(declare-fun array_inv!8340 (array!23867) Bool)

(assert (=> start!38558 (and (array_inv!8340 _values!549) e!241001)))

(declare-fun array_inv!8341 (array!23865) Bool)

(assert (=> start!38558 (array_inv!8341 _keys!709)))

(declare-fun b!398897 () Bool)

(assert (=> b!398897 (= e!241001 (and e!241002 mapRes!16587))))

(declare-fun condMapEmpty!16587 () Bool)

(declare-fun mapDefault!16587 () ValueCell!4645)

