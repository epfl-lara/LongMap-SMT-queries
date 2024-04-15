; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38714 () Bool)

(assert start!38714)

(declare-fun b_free!9265 () Bool)

(declare-fun b_next!9265 () Bool)

(assert (=> start!38714 (= b_free!9265 (not b_next!9265))))

(declare-fun tp!32919 () Bool)

(declare-fun b_and!16625 () Bool)

(assert (=> start!38714 (= tp!32919 b_and!16625)))

(declare-fun b!402945 () Bool)

(declare-fun e!242615 () Bool)

(declare-fun e!242614 () Bool)

(declare-fun mapRes!16842 () Bool)

(assert (=> b!402945 (= e!242615 (and e!242614 mapRes!16842))))

(declare-fun condMapEmpty!16842 () Bool)

(declare-datatypes ((V!14635 0))(
  ( (V!14636 (val!5118 Int)) )
))
(declare-datatypes ((ValueCell!4730 0))(
  ( (ValueCellFull!4730 (v!7359 V!14635)) (EmptyCell!4730) )
))
(declare-datatypes ((array!24175 0))(
  ( (array!24176 (arr!11537 (Array (_ BitVec 32) ValueCell!4730)) (size!11890 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24175)

(declare-fun mapDefault!16842 () ValueCell!4730)

(assert (=> b!402945 (= condMapEmpty!16842 (= (arr!11537 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4730)) mapDefault!16842)))))

(declare-fun minValue!515 () V!14635)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6784 0))(
  ( (tuple2!6785 (_1!3403 (_ BitVec 64)) (_2!3403 V!14635)) )
))
(declare-datatypes ((List!6688 0))(
  ( (Nil!6685) (Cons!6684 (h!7540 tuple2!6784) (t!11853 List!6688)) )
))
(declare-datatypes ((ListLongMap!5687 0))(
  ( (ListLongMap!5688 (toList!2859 List!6688)) )
))
(declare-fun call!28435 () ListLongMap!5687)

(declare-datatypes ((array!24177 0))(
  ( (array!24178 (arr!11538 (Array (_ BitVec 32) (_ BitVec 64))) (size!11891 (_ BitVec 32))) )
))
(declare-fun lt!187786 () array!24177)

(declare-fun zeroValue!515 () V!14635)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun bm!28431 () Bool)

(declare-fun v!412 () V!14635)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!24177)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54783 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1075 (array!24177 array!24175 (_ BitVec 32) (_ BitVec 32) V!14635 V!14635 (_ BitVec 32) Int) ListLongMap!5687)

(assert (=> bm!28431 (= call!28435 (getCurrentListMapNoExtraKeys!1075 (ite c!54783 lt!187786 _keys!709) (ite c!54783 (array!24176 (store (arr!11537 _values!549) i!563 (ValueCellFull!4730 v!412)) (size!11890 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402946 () Bool)

(declare-fun e!242612 () Bool)

(declare-fun call!28434 () ListLongMap!5687)

(assert (=> b!402946 (= e!242612 (= call!28434 call!28435))))

(declare-fun b!402947 () Bool)

(declare-fun res!232216 () Bool)

(declare-fun e!242616 () Bool)

(assert (=> b!402947 (=> (not res!232216) (not e!242616))))

(assert (=> b!402947 (= res!232216 (or (= (select (arr!11538 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11538 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!232221 () Bool)

(assert (=> start!38714 (=> (not res!232221) (not e!242616))))

(assert (=> start!38714 (= res!232221 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11891 _keys!709))))))

(assert (=> start!38714 e!242616))

(declare-fun tp_is_empty!10147 () Bool)

(assert (=> start!38714 tp_is_empty!10147))

(assert (=> start!38714 tp!32919))

(assert (=> start!38714 true))

(declare-fun array_inv!8460 (array!24175) Bool)

(assert (=> start!38714 (and (array_inv!8460 _values!549) e!242615)))

(declare-fun array_inv!8461 (array!24177) Bool)

(assert (=> start!38714 (array_inv!8461 _keys!709)))

(declare-fun b!402948 () Bool)

(declare-fun res!232223 () Bool)

(assert (=> b!402948 (=> (not res!232223) (not e!242616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24177 (_ BitVec 32)) Bool)

(assert (=> b!402948 (= res!232223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402949 () Bool)

(declare-fun res!232222 () Bool)

(declare-fun e!242613 () Bool)

(assert (=> b!402949 (=> (not res!232222) (not e!242613))))

(assert (=> b!402949 (= res!232222 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11891 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402950 () Bool)

(declare-fun res!232215 () Bool)

(assert (=> b!402950 (=> (not res!232215) (not e!242616))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402950 (= res!232215 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402951 () Bool)

(declare-fun res!232214 () Bool)

(assert (=> b!402951 (=> (not res!232214) (not e!242616))))

(assert (=> b!402951 (= res!232214 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11891 _keys!709))))))

(declare-fun b!402952 () Bool)

(declare-fun res!232218 () Bool)

(assert (=> b!402952 (=> (not res!232218) (not e!242616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402952 (= res!232218 (validKeyInArray!0 k0!794))))

(declare-fun b!402953 () Bool)

(assert (=> b!402953 (= e!242613 (not true))))

(assert (=> b!402953 e!242612))

(assert (=> b!402953 (= c!54783 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12168 0))(
  ( (Unit!12169) )
))
(declare-fun lt!187787 () Unit!12168)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!347 (array!24177 array!24175 (_ BitVec 32) (_ BitVec 32) V!14635 V!14635 (_ BitVec 32) (_ BitVec 64) V!14635 (_ BitVec 32) Int) Unit!12168)

(assert (=> b!402953 (= lt!187787 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!347 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402954 () Bool)

(declare-fun e!242610 () Bool)

(assert (=> b!402954 (= e!242610 tp_is_empty!10147)))

(declare-fun b!402955 () Bool)

(declare-fun +!1162 (ListLongMap!5687 tuple2!6784) ListLongMap!5687)

(assert (=> b!402955 (= e!242612 (= call!28435 (+!1162 call!28434 (tuple2!6785 k0!794 v!412))))))

(declare-fun mapIsEmpty!16842 () Bool)

(assert (=> mapIsEmpty!16842 mapRes!16842))

(declare-fun b!402956 () Bool)

(assert (=> b!402956 (= e!242614 tp_is_empty!10147)))

(declare-fun b!402957 () Bool)

(declare-fun res!232217 () Bool)

(assert (=> b!402957 (=> (not res!232217) (not e!242616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402957 (= res!232217 (validMask!0 mask!1025))))

(declare-fun b!402958 () Bool)

(assert (=> b!402958 (= e!242616 e!242613)))

(declare-fun res!232213 () Bool)

(assert (=> b!402958 (=> (not res!232213) (not e!242613))))

(assert (=> b!402958 (= res!232213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187786 mask!1025))))

(assert (=> b!402958 (= lt!187786 (array!24178 (store (arr!11538 _keys!709) i!563 k0!794) (size!11891 _keys!709)))))

(declare-fun bm!28432 () Bool)

(assert (=> bm!28432 (= call!28434 (getCurrentListMapNoExtraKeys!1075 (ite c!54783 _keys!709 lt!187786) (ite c!54783 _values!549 (array!24176 (store (arr!11537 _values!549) i!563 (ValueCellFull!4730 v!412)) (size!11890 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402959 () Bool)

(declare-fun res!232220 () Bool)

(assert (=> b!402959 (=> (not res!232220) (not e!242616))))

(declare-datatypes ((List!6689 0))(
  ( (Nil!6686) (Cons!6685 (h!7541 (_ BitVec 64)) (t!11854 List!6689)) )
))
(declare-fun arrayNoDuplicates!0 (array!24177 (_ BitVec 32) List!6689) Bool)

(assert (=> b!402959 (= res!232220 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6686))))

(declare-fun b!402960 () Bool)

(declare-fun res!232224 () Bool)

(assert (=> b!402960 (=> (not res!232224) (not e!242613))))

(assert (=> b!402960 (= res!232224 (arrayNoDuplicates!0 lt!187786 #b00000000000000000000000000000000 Nil!6686))))

(declare-fun mapNonEmpty!16842 () Bool)

(declare-fun tp!32918 () Bool)

(assert (=> mapNonEmpty!16842 (= mapRes!16842 (and tp!32918 e!242610))))

(declare-fun mapKey!16842 () (_ BitVec 32))

(declare-fun mapRest!16842 () (Array (_ BitVec 32) ValueCell!4730))

(declare-fun mapValue!16842 () ValueCell!4730)

(assert (=> mapNonEmpty!16842 (= (arr!11537 _values!549) (store mapRest!16842 mapKey!16842 mapValue!16842))))

(declare-fun b!402961 () Bool)

(declare-fun res!232219 () Bool)

(assert (=> b!402961 (=> (not res!232219) (not e!242616))))

(assert (=> b!402961 (= res!232219 (and (= (size!11890 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11891 _keys!709) (size!11890 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38714 res!232221) b!402957))

(assert (= (and b!402957 res!232217) b!402961))

(assert (= (and b!402961 res!232219) b!402948))

(assert (= (and b!402948 res!232223) b!402959))

(assert (= (and b!402959 res!232220) b!402951))

(assert (= (and b!402951 res!232214) b!402952))

(assert (= (and b!402952 res!232218) b!402947))

(assert (= (and b!402947 res!232216) b!402950))

(assert (= (and b!402950 res!232215) b!402958))

(assert (= (and b!402958 res!232213) b!402960))

(assert (= (and b!402960 res!232224) b!402949))

(assert (= (and b!402949 res!232222) b!402953))

(assert (= (and b!402953 c!54783) b!402955))

(assert (= (and b!402953 (not c!54783)) b!402946))

(assert (= (or b!402955 b!402946) bm!28431))

(assert (= (or b!402955 b!402946) bm!28432))

(assert (= (and b!402945 condMapEmpty!16842) mapIsEmpty!16842))

(assert (= (and b!402945 (not condMapEmpty!16842)) mapNonEmpty!16842))

(get-info :version)

(assert (= (and mapNonEmpty!16842 ((_ is ValueCellFull!4730) mapValue!16842)) b!402954))

(assert (= (and b!402945 ((_ is ValueCellFull!4730) mapDefault!16842)) b!402956))

(assert (= start!38714 b!402945))

(declare-fun m!395757 () Bool)

(assert (=> b!402955 m!395757))

(declare-fun m!395759 () Bool)

(assert (=> b!402950 m!395759))

(declare-fun m!395761 () Bool)

(assert (=> b!402952 m!395761))

(declare-fun m!395763 () Bool)

(assert (=> b!402948 m!395763))

(declare-fun m!395765 () Bool)

(assert (=> b!402957 m!395765))

(declare-fun m!395767 () Bool)

(assert (=> b!402947 m!395767))

(declare-fun m!395769 () Bool)

(assert (=> mapNonEmpty!16842 m!395769))

(declare-fun m!395771 () Bool)

(assert (=> b!402960 m!395771))

(declare-fun m!395773 () Bool)

(assert (=> b!402958 m!395773))

(declare-fun m!395775 () Bool)

(assert (=> b!402958 m!395775))

(declare-fun m!395777 () Bool)

(assert (=> bm!28431 m!395777))

(declare-fun m!395779 () Bool)

(assert (=> bm!28431 m!395779))

(declare-fun m!395781 () Bool)

(assert (=> b!402953 m!395781))

(assert (=> bm!28432 m!395777))

(declare-fun m!395783 () Bool)

(assert (=> bm!28432 m!395783))

(declare-fun m!395785 () Bool)

(assert (=> start!38714 m!395785))

(declare-fun m!395787 () Bool)

(assert (=> start!38714 m!395787))

(declare-fun m!395789 () Bool)

(assert (=> b!402959 m!395789))

(check-sat (not b!402958) (not b!402960) (not b_next!9265) (not b!402950) (not b!402953) (not bm!28431) (not b!402955) b_and!16625 (not b!402952) (not mapNonEmpty!16842) (not b!402948) tp_is_empty!10147 (not bm!28432) (not b!402959) (not start!38714) (not b!402957))
(check-sat b_and!16625 (not b_next!9265))
