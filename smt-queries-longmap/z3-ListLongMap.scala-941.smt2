; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20746 () Bool)

(assert start!20746)

(declare-fun b_free!5401 () Bool)

(declare-fun b_next!5401 () Bool)

(assert (=> start!20746 (= b_free!5401 (not b_next!5401))))

(declare-fun tp!19234 () Bool)

(declare-fun b_and!12121 () Bool)

(assert (=> start!20746 (= tp!19234 b_and!12121)))

(declare-fun b!207479 () Bool)

(declare-fun e!135419 () Bool)

(declare-fun e!135422 () Bool)

(declare-fun mapRes!8954 () Bool)

(assert (=> b!207479 (= e!135419 (and e!135422 mapRes!8954))))

(declare-fun condMapEmpty!8954 () Bool)

(declare-datatypes ((V!6657 0))(
  ( (V!6658 (val!2673 Int)) )
))
(declare-datatypes ((ValueCell!2285 0))(
  ( (ValueCellFull!2285 (v!4637 V!6657)) (EmptyCell!2285) )
))
(declare-datatypes ((array!9709 0))(
  ( (array!9710 (arr!4604 (Array (_ BitVec 32) ValueCell!2285)) (size!4930 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9709)

(declare-fun mapDefault!8954 () ValueCell!2285)

(assert (=> b!207479 (= condMapEmpty!8954 (= (arr!4604 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2285)) mapDefault!8954)))))

(declare-fun b!207480 () Bool)

(declare-fun res!100747 () Bool)

(declare-fun e!135421 () Bool)

(assert (=> b!207480 (=> (not res!100747) (not e!135421))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9711 0))(
  ( (array!9712 (arr!4605 (Array (_ BitVec 32) (_ BitVec 64))) (size!4931 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9711)

(assert (=> b!207480 (= res!100747 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4931 _keys!825))))))

(declare-fun b!207481 () Bool)

(declare-fun res!100744 () Bool)

(assert (=> b!207481 (=> (not res!100744) (not e!135421))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207481 (= res!100744 (and (= (size!4930 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4931 _keys!825) (size!4930 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8954 () Bool)

(declare-fun tp!19235 () Bool)

(declare-fun e!135423 () Bool)

(assert (=> mapNonEmpty!8954 (= mapRes!8954 (and tp!19235 e!135423))))

(declare-fun mapKey!8954 () (_ BitVec 32))

(declare-fun mapRest!8954 () (Array (_ BitVec 32) ValueCell!2285))

(declare-fun mapValue!8954 () ValueCell!2285)

(assert (=> mapNonEmpty!8954 (= (arr!4604 _values!649) (store mapRest!8954 mapKey!8954 mapValue!8954))))

(declare-fun res!100742 () Bool)

(assert (=> start!20746 (=> (not res!100742) (not e!135421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20746 (= res!100742 (validMask!0 mask!1149))))

(assert (=> start!20746 e!135421))

(declare-fun array_inv!3027 (array!9709) Bool)

(assert (=> start!20746 (and (array_inv!3027 _values!649) e!135419)))

(assert (=> start!20746 true))

(declare-fun tp_is_empty!5257 () Bool)

(assert (=> start!20746 tp_is_empty!5257))

(declare-fun array_inv!3028 (array!9711) Bool)

(assert (=> start!20746 (array_inv!3028 _keys!825)))

(assert (=> start!20746 tp!19234))

(declare-fun b!207482 () Bool)

(declare-fun res!100745 () Bool)

(assert (=> b!207482 (=> (not res!100745) (not e!135421))))

(declare-datatypes ((List!2940 0))(
  ( (Nil!2937) (Cons!2936 (h!3578 (_ BitVec 64)) (t!7862 List!2940)) )
))
(declare-fun arrayNoDuplicates!0 (array!9711 (_ BitVec 32) List!2940) Bool)

(assert (=> b!207482 (= res!100745 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2937))))

(declare-fun b!207483 () Bool)

(declare-fun res!100748 () Bool)

(assert (=> b!207483 (=> (not res!100748) (not e!135421))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207483 (= res!100748 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8954 () Bool)

(assert (=> mapIsEmpty!8954 mapRes!8954))

(declare-fun b!207484 () Bool)

(assert (=> b!207484 (= e!135421 (not true))))

(declare-fun zeroValue!615 () V!6657)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6657)

(declare-datatypes ((tuple2!4036 0))(
  ( (tuple2!4037 (_1!2029 (_ BitVec 64)) (_2!2029 V!6657)) )
))
(declare-datatypes ((List!2941 0))(
  ( (Nil!2938) (Cons!2937 (h!3579 tuple2!4036) (t!7863 List!2941)) )
))
(declare-datatypes ((ListLongMap!2939 0))(
  ( (ListLongMap!2940 (toList!1485 List!2941)) )
))
(declare-fun lt!106231 () ListLongMap!2939)

(declare-fun getCurrentListMap!1026 (array!9711 array!9709 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) Int) ListLongMap!2939)

(assert (=> b!207484 (= lt!106231 (getCurrentListMap!1026 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106235 () array!9709)

(declare-fun lt!106230 () ListLongMap!2939)

(assert (=> b!207484 (= lt!106230 (getCurrentListMap!1026 _keys!825 lt!106235 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106234 () ListLongMap!2939)

(declare-fun lt!106229 () ListLongMap!2939)

(assert (=> b!207484 (and (= lt!106234 lt!106229) (= lt!106229 lt!106234))))

(declare-fun lt!106232 () ListLongMap!2939)

(declare-fun v!520 () V!6657)

(declare-fun +!534 (ListLongMap!2939 tuple2!4036) ListLongMap!2939)

(assert (=> b!207484 (= lt!106229 (+!534 lt!106232 (tuple2!4037 k0!843 v!520)))))

(declare-datatypes ((Unit!6308 0))(
  ( (Unit!6309) )
))
(declare-fun lt!106233 () Unit!6308)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!185 (array!9711 array!9709 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) (_ BitVec 64) V!6657 (_ BitVec 32) Int) Unit!6308)

(assert (=> b!207484 (= lt!106233 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!185 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!436 (array!9711 array!9709 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) Int) ListLongMap!2939)

(assert (=> b!207484 (= lt!106234 (getCurrentListMapNoExtraKeys!436 _keys!825 lt!106235 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207484 (= lt!106235 (array!9710 (store (arr!4604 _values!649) i!601 (ValueCellFull!2285 v!520)) (size!4930 _values!649)))))

(assert (=> b!207484 (= lt!106232 (getCurrentListMapNoExtraKeys!436 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207485 () Bool)

(assert (=> b!207485 (= e!135422 tp_is_empty!5257)))

(declare-fun b!207486 () Bool)

(declare-fun res!100743 () Bool)

(assert (=> b!207486 (=> (not res!100743) (not e!135421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9711 (_ BitVec 32)) Bool)

(assert (=> b!207486 (= res!100743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207487 () Bool)

(declare-fun res!100746 () Bool)

(assert (=> b!207487 (=> (not res!100746) (not e!135421))))

(assert (=> b!207487 (= res!100746 (= (select (arr!4605 _keys!825) i!601) k0!843))))

(declare-fun b!207488 () Bool)

(assert (=> b!207488 (= e!135423 tp_is_empty!5257)))

(assert (= (and start!20746 res!100742) b!207481))

(assert (= (and b!207481 res!100744) b!207486))

(assert (= (and b!207486 res!100743) b!207482))

(assert (= (and b!207482 res!100745) b!207480))

(assert (= (and b!207480 res!100747) b!207483))

(assert (= (and b!207483 res!100748) b!207487))

(assert (= (and b!207487 res!100746) b!207484))

(assert (= (and b!207479 condMapEmpty!8954) mapIsEmpty!8954))

(assert (= (and b!207479 (not condMapEmpty!8954)) mapNonEmpty!8954))

(get-info :version)

(assert (= (and mapNonEmpty!8954 ((_ is ValueCellFull!2285) mapValue!8954)) b!207488))

(assert (= (and b!207479 ((_ is ValueCellFull!2285) mapDefault!8954)) b!207485))

(assert (= start!20746 b!207479))

(declare-fun m!234753 () Bool)

(assert (=> b!207487 m!234753))

(declare-fun m!234755 () Bool)

(assert (=> mapNonEmpty!8954 m!234755))

(declare-fun m!234757 () Bool)

(assert (=> b!207486 m!234757))

(declare-fun m!234759 () Bool)

(assert (=> b!207483 m!234759))

(declare-fun m!234761 () Bool)

(assert (=> start!20746 m!234761))

(declare-fun m!234763 () Bool)

(assert (=> start!20746 m!234763))

(declare-fun m!234765 () Bool)

(assert (=> start!20746 m!234765))

(declare-fun m!234767 () Bool)

(assert (=> b!207482 m!234767))

(declare-fun m!234769 () Bool)

(assert (=> b!207484 m!234769))

(declare-fun m!234771 () Bool)

(assert (=> b!207484 m!234771))

(declare-fun m!234773 () Bool)

(assert (=> b!207484 m!234773))

(declare-fun m!234775 () Bool)

(assert (=> b!207484 m!234775))

(declare-fun m!234777 () Bool)

(assert (=> b!207484 m!234777))

(declare-fun m!234779 () Bool)

(assert (=> b!207484 m!234779))

(declare-fun m!234781 () Bool)

(assert (=> b!207484 m!234781))

(check-sat (not b!207484) (not b!207483) (not b!207482) tp_is_empty!5257 (not mapNonEmpty!8954) (not b_next!5401) b_and!12121 (not start!20746) (not b!207486))
(check-sat b_and!12121 (not b_next!5401))
