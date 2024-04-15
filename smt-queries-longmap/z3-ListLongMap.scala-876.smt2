; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20356 () Bool)

(assert start!20356)

(declare-fun b_free!5011 () Bool)

(declare-fun b_next!5011 () Bool)

(assert (=> start!20356 (= b_free!5011 (not b_next!5011))))

(declare-fun tp!18064 () Bool)

(declare-fun b_and!11731 () Bool)

(assert (=> start!20356 (= tp!18064 b_and!11731)))

(declare-fun res!95700 () Bool)

(declare-fun e!131564 () Bool)

(assert (=> start!20356 (=> (not res!95700) (not e!131564))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20356 (= res!95700 (validMask!0 mask!1149))))

(assert (=> start!20356 e!131564))

(declare-datatypes ((V!6137 0))(
  ( (V!6138 (val!2478 Int)) )
))
(declare-datatypes ((ValueCell!2090 0))(
  ( (ValueCellFull!2090 (v!4442 V!6137)) (EmptyCell!2090) )
))
(declare-datatypes ((array!8951 0))(
  ( (array!8952 (arr!4225 (Array (_ BitVec 32) ValueCell!2090)) (size!4551 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8951)

(declare-fun e!131566 () Bool)

(declare-fun array_inv!2757 (array!8951) Bool)

(assert (=> start!20356 (and (array_inv!2757 _values!649) e!131566)))

(assert (=> start!20356 true))

(declare-fun tp_is_empty!4867 () Bool)

(assert (=> start!20356 tp_is_empty!4867))

(declare-datatypes ((array!8953 0))(
  ( (array!8954 (arr!4226 (Array (_ BitVec 32) (_ BitVec 64))) (size!4552 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8953)

(declare-fun array_inv!2758 (array!8953) Bool)

(assert (=> start!20356 (array_inv!2758 _keys!825)))

(assert (=> start!20356 tp!18064))

(declare-fun b!200679 () Bool)

(declare-fun e!131567 () Bool)

(assert (=> b!200679 (= e!131567 tp_is_empty!4867)))

(declare-fun b!200680 () Bool)

(declare-fun res!95699 () Bool)

(assert (=> b!200680 (=> (not res!95699) (not e!131564))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200680 (= res!95699 (= (select (arr!4226 _keys!825) i!601) k0!843))))

(declare-fun b!200681 () Bool)

(declare-fun res!95702 () Bool)

(assert (=> b!200681 (=> (not res!95702) (not e!131564))))

(declare-datatypes ((List!2645 0))(
  ( (Nil!2642) (Cons!2641 (h!3283 (_ BitVec 64)) (t!7567 List!2645)) )
))
(declare-fun arrayNoDuplicates!0 (array!8953 (_ BitVec 32) List!2645) Bool)

(assert (=> b!200681 (= res!95702 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2642))))

(declare-fun b!200682 () Bool)

(declare-fun e!131562 () Bool)

(assert (=> b!200682 (= e!131562 tp_is_empty!4867)))

(declare-fun b!200683 () Bool)

(declare-fun res!95698 () Bool)

(assert (=> b!200683 (=> (not res!95698) (not e!131564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200683 (= res!95698 (validKeyInArray!0 k0!843))))

(declare-fun b!200684 () Bool)

(declare-fun res!95704 () Bool)

(assert (=> b!200684 (=> (not res!95704) (not e!131564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8953 (_ BitVec 32)) Bool)

(assert (=> b!200684 (= res!95704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8369 () Bool)

(declare-fun mapRes!8369 () Bool)

(declare-fun tp!18065 () Bool)

(assert (=> mapNonEmpty!8369 (= mapRes!8369 (and tp!18065 e!131567))))

(declare-fun mapRest!8369 () (Array (_ BitVec 32) ValueCell!2090))

(declare-fun mapKey!8369 () (_ BitVec 32))

(declare-fun mapValue!8369 () ValueCell!2090)

(assert (=> mapNonEmpty!8369 (= (arr!4225 _values!649) (store mapRest!8369 mapKey!8369 mapValue!8369))))

(declare-fun b!200685 () Bool)

(declare-fun res!95701 () Bool)

(assert (=> b!200685 (=> (not res!95701) (not e!131564))))

(assert (=> b!200685 (= res!95701 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4552 _keys!825))))))

(declare-fun b!200686 () Bool)

(declare-fun res!95697 () Bool)

(assert (=> b!200686 (=> (not res!95697) (not e!131564))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200686 (= res!95697 (and (= (size!4551 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4552 _keys!825) (size!4551 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200687 () Bool)

(declare-fun e!131568 () Bool)

(assert (=> b!200687 (= e!131564 (not e!131568))))

(declare-fun res!95705 () Bool)

(assert (=> b!200687 (=> res!95705 e!131568)))

(assert (=> b!200687 (= res!95705 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3722 0))(
  ( (tuple2!3723 (_1!1872 (_ BitVec 64)) (_2!1872 V!6137)) )
))
(declare-datatypes ((List!2646 0))(
  ( (Nil!2643) (Cons!2642 (h!3284 tuple2!3722) (t!7568 List!2646)) )
))
(declare-datatypes ((ListLongMap!2625 0))(
  ( (ListLongMap!2626 (toList!1328 List!2646)) )
))
(declare-fun lt!99375 () ListLongMap!2625)

(declare-fun zeroValue!615 () V!6137)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6137)

(declare-fun getCurrentListMap!894 (array!8953 array!8951 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) Int) ListLongMap!2625)

(assert (=> b!200687 (= lt!99375 (getCurrentListMap!894 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99372 () ListLongMap!2625)

(declare-fun lt!99382 () array!8951)

(assert (=> b!200687 (= lt!99372 (getCurrentListMap!894 _keys!825 lt!99382 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99378 () ListLongMap!2625)

(declare-fun lt!99376 () ListLongMap!2625)

(assert (=> b!200687 (and (= lt!99378 lt!99376) (= lt!99376 lt!99378))))

(declare-fun lt!99373 () ListLongMap!2625)

(declare-fun lt!99384 () tuple2!3722)

(declare-fun +!377 (ListLongMap!2625 tuple2!3722) ListLongMap!2625)

(assert (=> b!200687 (= lt!99376 (+!377 lt!99373 lt!99384))))

(declare-fun v!520 () V!6137)

(assert (=> b!200687 (= lt!99384 (tuple2!3723 k0!843 v!520))))

(declare-datatypes ((Unit!6006 0))(
  ( (Unit!6007) )
))
(declare-fun lt!99374 () Unit!6006)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!53 (array!8953 array!8951 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) (_ BitVec 64) V!6137 (_ BitVec 32) Int) Unit!6006)

(assert (=> b!200687 (= lt!99374 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!53 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!304 (array!8953 array!8951 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) Int) ListLongMap!2625)

(assert (=> b!200687 (= lt!99378 (getCurrentListMapNoExtraKeys!304 _keys!825 lt!99382 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200687 (= lt!99382 (array!8952 (store (arr!4225 _values!649) i!601 (ValueCellFull!2090 v!520)) (size!4551 _values!649)))))

(assert (=> b!200687 (= lt!99373 (getCurrentListMapNoExtraKeys!304 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200688 () Bool)

(assert (=> b!200688 (= e!131566 (and e!131562 mapRes!8369))))

(declare-fun condMapEmpty!8369 () Bool)

(declare-fun mapDefault!8369 () ValueCell!2090)

(assert (=> b!200688 (= condMapEmpty!8369 (= (arr!4225 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2090)) mapDefault!8369)))))

(declare-fun b!200689 () Bool)

(declare-fun e!131565 () Bool)

(assert (=> b!200689 (= e!131568 e!131565)))

(declare-fun res!95703 () Bool)

(assert (=> b!200689 (=> res!95703 e!131565)))

(assert (=> b!200689 (= res!95703 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99383 () ListLongMap!2625)

(declare-fun lt!99377 () ListLongMap!2625)

(assert (=> b!200689 (= lt!99383 lt!99377)))

(declare-fun lt!99381 () ListLongMap!2625)

(assert (=> b!200689 (= lt!99377 (+!377 lt!99381 lt!99384))))

(declare-fun lt!99386 () Unit!6006)

(declare-fun addCommutativeForDiffKeys!86 (ListLongMap!2625 (_ BitVec 64) V!6137 (_ BitVec 64) V!6137) Unit!6006)

(assert (=> b!200689 (= lt!99386 (addCommutativeForDiffKeys!86 lt!99373 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99380 () tuple2!3722)

(assert (=> b!200689 (= lt!99372 (+!377 lt!99383 lt!99380))))

(declare-fun lt!99385 () tuple2!3722)

(assert (=> b!200689 (= lt!99383 (+!377 lt!99376 lt!99385))))

(declare-fun lt!99371 () ListLongMap!2625)

(assert (=> b!200689 (= lt!99375 lt!99371)))

(assert (=> b!200689 (= lt!99371 (+!377 lt!99381 lt!99380))))

(assert (=> b!200689 (= lt!99381 (+!377 lt!99373 lt!99385))))

(assert (=> b!200689 (= lt!99372 (+!377 (+!377 lt!99378 lt!99385) lt!99380))))

(assert (=> b!200689 (= lt!99380 (tuple2!3723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200689 (= lt!99385 (tuple2!3723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8369 () Bool)

(assert (=> mapIsEmpty!8369 mapRes!8369))

(declare-fun b!200690 () Bool)

(assert (=> b!200690 (= e!131565 true)))

(assert (=> b!200690 (= (+!377 lt!99377 lt!99380) (+!377 lt!99371 lt!99384))))

(declare-fun lt!99379 () Unit!6006)

(assert (=> b!200690 (= lt!99379 (addCommutativeForDiffKeys!86 lt!99381 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20356 res!95700) b!200686))

(assert (= (and b!200686 res!95697) b!200684))

(assert (= (and b!200684 res!95704) b!200681))

(assert (= (and b!200681 res!95702) b!200685))

(assert (= (and b!200685 res!95701) b!200683))

(assert (= (and b!200683 res!95698) b!200680))

(assert (= (and b!200680 res!95699) b!200687))

(assert (= (and b!200687 (not res!95705)) b!200689))

(assert (= (and b!200689 (not res!95703)) b!200690))

(assert (= (and b!200688 condMapEmpty!8369) mapIsEmpty!8369))

(assert (= (and b!200688 (not condMapEmpty!8369)) mapNonEmpty!8369))

(get-info :version)

(assert (= (and mapNonEmpty!8369 ((_ is ValueCellFull!2090) mapValue!8369)) b!200679))

(assert (= (and b!200688 ((_ is ValueCellFull!2090) mapDefault!8369)) b!200682))

(assert (= start!20356 b!200688))

(declare-fun m!226863 () Bool)

(assert (=> start!20356 m!226863))

(declare-fun m!226865 () Bool)

(assert (=> start!20356 m!226865))

(declare-fun m!226867 () Bool)

(assert (=> start!20356 m!226867))

(declare-fun m!226869 () Bool)

(assert (=> b!200684 m!226869))

(declare-fun m!226871 () Bool)

(assert (=> b!200687 m!226871))

(declare-fun m!226873 () Bool)

(assert (=> b!200687 m!226873))

(declare-fun m!226875 () Bool)

(assert (=> b!200687 m!226875))

(declare-fun m!226877 () Bool)

(assert (=> b!200687 m!226877))

(declare-fun m!226879 () Bool)

(assert (=> b!200687 m!226879))

(declare-fun m!226881 () Bool)

(assert (=> b!200687 m!226881))

(declare-fun m!226883 () Bool)

(assert (=> b!200687 m!226883))

(declare-fun m!226885 () Bool)

(assert (=> b!200689 m!226885))

(declare-fun m!226887 () Bool)

(assert (=> b!200689 m!226887))

(declare-fun m!226889 () Bool)

(assert (=> b!200689 m!226889))

(declare-fun m!226891 () Bool)

(assert (=> b!200689 m!226891))

(assert (=> b!200689 m!226887))

(declare-fun m!226893 () Bool)

(assert (=> b!200689 m!226893))

(declare-fun m!226895 () Bool)

(assert (=> b!200689 m!226895))

(declare-fun m!226897 () Bool)

(assert (=> b!200689 m!226897))

(declare-fun m!226899 () Bool)

(assert (=> b!200689 m!226899))

(declare-fun m!226901 () Bool)

(assert (=> b!200680 m!226901))

(declare-fun m!226903 () Bool)

(assert (=> b!200681 m!226903))

(declare-fun m!226905 () Bool)

(assert (=> mapNonEmpty!8369 m!226905))

(declare-fun m!226907 () Bool)

(assert (=> b!200683 m!226907))

(declare-fun m!226909 () Bool)

(assert (=> b!200690 m!226909))

(declare-fun m!226911 () Bool)

(assert (=> b!200690 m!226911))

(declare-fun m!226913 () Bool)

(assert (=> b!200690 m!226913))

(check-sat (not b!200681) (not b!200687) (not b!200683) (not b_next!5011) (not mapNonEmpty!8369) tp_is_empty!4867 b_and!11731 (not b!200684) (not b!200689) (not start!20356) (not b!200690))
(check-sat b_and!11731 (not b_next!5011))
