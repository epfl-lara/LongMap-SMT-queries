; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95754 () Bool)

(assert start!95754)

(declare-fun b_free!22407 () Bool)

(declare-fun b_next!22407 () Bool)

(assert (=> start!95754 (= b_free!22407 (not b_next!22407))))

(declare-fun tp!79069 () Bool)

(declare-fun b_and!35489 () Bool)

(assert (=> start!95754 (= tp!79069 b_and!35489)))

(declare-fun mapNonEmpty!41368 () Bool)

(declare-fun mapRes!41368 () Bool)

(declare-fun tp!79070 () Bool)

(declare-fun e!618841 () Bool)

(assert (=> mapNonEmpty!41368 (= mapRes!41368 (and tp!79070 e!618841))))

(declare-datatypes ((V!40339 0))(
  ( (V!40340 (val!13261 Int)) )
))
(declare-datatypes ((ValueCell!12495 0))(
  ( (ValueCellFull!12495 (v!15882 V!40339)) (EmptyCell!12495) )
))
(declare-datatypes ((array!69763 0))(
  ( (array!69764 (arr!33555 (Array (_ BitVec 32) ValueCell!12495)) (size!34091 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69763)

(declare-fun mapKey!41368 () (_ BitVec 32))

(declare-fun mapRest!41368 () (Array (_ BitVec 32) ValueCell!12495))

(declare-fun mapValue!41368 () ValueCell!12495)

(assert (=> mapNonEmpty!41368 (= (arr!33555 _values!874) (store mapRest!41368 mapKey!41368 mapValue!41368))))

(declare-fun b!1082945 () Bool)

(declare-fun res!721898 () Bool)

(declare-fun e!618845 () Bool)

(assert (=> b!1082945 (=> (not res!721898) (not e!618845))))

(declare-datatypes ((array!69765 0))(
  ( (array!69766 (arr!33556 (Array (_ BitVec 32) (_ BitVec 64))) (size!34092 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69765)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69765 (_ BitVec 32)) Bool)

(assert (=> b!1082945 (= res!721898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082946 () Bool)

(declare-fun res!721893 () Bool)

(assert (=> b!1082946 (=> (not res!721893) (not e!618845))))

(declare-datatypes ((List!23389 0))(
  ( (Nil!23386) (Cons!23385 (h!24594 (_ BitVec 64)) (t!32854 List!23389)) )
))
(declare-fun arrayNoDuplicates!0 (array!69765 (_ BitVec 32) List!23389) Bool)

(assert (=> b!1082946 (= res!721893 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23386))))

(declare-fun b!1082947 () Bool)

(declare-fun e!618842 () Bool)

(assert (=> b!1082947 (= e!618842 (not true))))

(declare-datatypes ((tuple2!16802 0))(
  ( (tuple2!16803 (_1!8412 (_ BitVec 64)) (_2!8412 V!40339)) )
))
(declare-datatypes ((List!23390 0))(
  ( (Nil!23387) (Cons!23386 (h!24595 tuple2!16802) (t!32855 List!23390)) )
))
(declare-datatypes ((ListLongMap!14771 0))(
  ( (ListLongMap!14772 (toList!7401 List!23390)) )
))
(declare-fun lt!479844 () ListLongMap!14771)

(declare-fun lt!479843 () ListLongMap!14771)

(assert (=> b!1082947 (and (= lt!479844 lt!479843) (= lt!479843 lt!479844))))

(declare-fun lt!479841 () ListLongMap!14771)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!728 (ListLongMap!14771 (_ BitVec 64)) ListLongMap!14771)

(assert (=> b!1082947 (= lt!479843 (-!728 lt!479841 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40339)

(declare-fun minValue!831 () V!40339)

(declare-datatypes ((Unit!35622 0))(
  ( (Unit!35623) )
))
(declare-fun lt!479840 () Unit!35622)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!8 (array!69765 array!69763 (_ BitVec 32) (_ BitVec 32) V!40339 V!40339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35622)

(assert (=> b!1082947 (= lt!479840 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!8 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479845 () array!69765)

(declare-fun getCurrentListMapNoExtraKeys!3949 (array!69765 array!69763 (_ BitVec 32) (_ BitVec 32) V!40339 V!40339 (_ BitVec 32) Int) ListLongMap!14771)

(declare-fun dynLambda!2086 (Int (_ BitVec 64)) V!40339)

(assert (=> b!1082947 (= lt!479844 (getCurrentListMapNoExtraKeys!3949 lt!479845 (array!69764 (store (arr!33555 _values!874) i!650 (ValueCellFull!12495 (dynLambda!2086 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34091 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082947 (= lt!479841 (getCurrentListMapNoExtraKeys!3949 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082947 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479842 () Unit!35622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69765 (_ BitVec 64) (_ BitVec 32)) Unit!35622)

(assert (=> b!1082947 (= lt!479842 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082948 () Bool)

(declare-fun e!618844 () Bool)

(declare-fun e!618840 () Bool)

(assert (=> b!1082948 (= e!618844 (and e!618840 mapRes!41368))))

(declare-fun condMapEmpty!41368 () Bool)

(declare-fun mapDefault!41368 () ValueCell!12495)

(assert (=> b!1082948 (= condMapEmpty!41368 (= (arr!33555 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12495)) mapDefault!41368)))))

(declare-fun mapIsEmpty!41368 () Bool)

(assert (=> mapIsEmpty!41368 mapRes!41368))

(declare-fun b!1082949 () Bool)

(declare-fun res!721894 () Bool)

(assert (=> b!1082949 (=> (not res!721894) (not e!618845))))

(assert (=> b!1082949 (= res!721894 (= (select (arr!33556 _keys!1070) i!650) k0!904))))

(declare-fun b!1082950 () Bool)

(declare-fun res!721892 () Bool)

(assert (=> b!1082950 (=> (not res!721892) (not e!618845))))

(assert (=> b!1082950 (= res!721892 (and (= (size!34091 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34092 _keys!1070) (size!34091 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082951 () Bool)

(declare-fun res!721891 () Bool)

(assert (=> b!1082951 (=> (not res!721891) (not e!618845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082951 (= res!721891 (validKeyInArray!0 k0!904))))

(declare-fun res!721895 () Bool)

(assert (=> start!95754 (=> (not res!721895) (not e!618845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95754 (= res!721895 (validMask!0 mask!1414))))

(assert (=> start!95754 e!618845))

(assert (=> start!95754 tp!79069))

(assert (=> start!95754 true))

(declare-fun tp_is_empty!26409 () Bool)

(assert (=> start!95754 tp_is_empty!26409))

(declare-fun array_inv!25898 (array!69765) Bool)

(assert (=> start!95754 (array_inv!25898 _keys!1070)))

(declare-fun array_inv!25899 (array!69763) Bool)

(assert (=> start!95754 (and (array_inv!25899 _values!874) e!618844)))

(declare-fun b!1082952 () Bool)

(assert (=> b!1082952 (= e!618840 tp_is_empty!26409)))

(declare-fun b!1082953 () Bool)

(declare-fun res!721896 () Bool)

(assert (=> b!1082953 (=> (not res!721896) (not e!618842))))

(assert (=> b!1082953 (= res!721896 (arrayNoDuplicates!0 lt!479845 #b00000000000000000000000000000000 Nil!23386))))

(declare-fun b!1082954 () Bool)

(declare-fun res!721897 () Bool)

(assert (=> b!1082954 (=> (not res!721897) (not e!618845))))

(assert (=> b!1082954 (= res!721897 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34092 _keys!1070))))))

(declare-fun b!1082955 () Bool)

(assert (=> b!1082955 (= e!618845 e!618842)))

(declare-fun res!721899 () Bool)

(assert (=> b!1082955 (=> (not res!721899) (not e!618842))))

(assert (=> b!1082955 (= res!721899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479845 mask!1414))))

(assert (=> b!1082955 (= lt!479845 (array!69766 (store (arr!33556 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34092 _keys!1070)))))

(declare-fun b!1082956 () Bool)

(assert (=> b!1082956 (= e!618841 tp_is_empty!26409)))

(assert (= (and start!95754 res!721895) b!1082950))

(assert (= (and b!1082950 res!721892) b!1082945))

(assert (= (and b!1082945 res!721898) b!1082946))

(assert (= (and b!1082946 res!721893) b!1082954))

(assert (= (and b!1082954 res!721897) b!1082951))

(assert (= (and b!1082951 res!721891) b!1082949))

(assert (= (and b!1082949 res!721894) b!1082955))

(assert (= (and b!1082955 res!721899) b!1082953))

(assert (= (and b!1082953 res!721896) b!1082947))

(assert (= (and b!1082948 condMapEmpty!41368) mapIsEmpty!41368))

(assert (= (and b!1082948 (not condMapEmpty!41368)) mapNonEmpty!41368))

(get-info :version)

(assert (= (and mapNonEmpty!41368 ((_ is ValueCellFull!12495) mapValue!41368)) b!1082956))

(assert (= (and b!1082948 ((_ is ValueCellFull!12495) mapDefault!41368)) b!1082952))

(assert (= start!95754 b!1082948))

(declare-fun b_lambda!17077 () Bool)

(assert (=> (not b_lambda!17077) (not b!1082947)))

(declare-fun t!32853 () Bool)

(declare-fun tb!7285 () Bool)

(assert (=> (and start!95754 (= defaultEntry!882 defaultEntry!882) t!32853) tb!7285))

(declare-fun result!15089 () Bool)

(assert (=> tb!7285 (= result!15089 tp_is_empty!26409)))

(assert (=> b!1082947 t!32853))

(declare-fun b_and!35491 () Bool)

(assert (= b_and!35489 (and (=> t!32853 result!15089) b_and!35491)))

(declare-fun m!1000617 () Bool)

(assert (=> b!1082946 m!1000617))

(declare-fun m!1000619 () Bool)

(assert (=> mapNonEmpty!41368 m!1000619))

(declare-fun m!1000621 () Bool)

(assert (=> b!1082953 m!1000621))

(declare-fun m!1000623 () Bool)

(assert (=> b!1082955 m!1000623))

(declare-fun m!1000625 () Bool)

(assert (=> b!1082955 m!1000625))

(declare-fun m!1000627 () Bool)

(assert (=> b!1082947 m!1000627))

(declare-fun m!1000629 () Bool)

(assert (=> b!1082947 m!1000629))

(declare-fun m!1000631 () Bool)

(assert (=> b!1082947 m!1000631))

(declare-fun m!1000633 () Bool)

(assert (=> b!1082947 m!1000633))

(declare-fun m!1000635 () Bool)

(assert (=> b!1082947 m!1000635))

(declare-fun m!1000637 () Bool)

(assert (=> b!1082947 m!1000637))

(declare-fun m!1000639 () Bool)

(assert (=> b!1082947 m!1000639))

(declare-fun m!1000641 () Bool)

(assert (=> b!1082947 m!1000641))

(declare-fun m!1000643 () Bool)

(assert (=> b!1082949 m!1000643))

(declare-fun m!1000645 () Bool)

(assert (=> b!1082951 m!1000645))

(declare-fun m!1000647 () Bool)

(assert (=> start!95754 m!1000647))

(declare-fun m!1000649 () Bool)

(assert (=> start!95754 m!1000649))

(declare-fun m!1000651 () Bool)

(assert (=> start!95754 m!1000651))

(declare-fun m!1000653 () Bool)

(assert (=> b!1082945 m!1000653))

(check-sat (not b_next!22407) (not b!1082945) (not b!1082946) tp_is_empty!26409 (not b!1082951) (not b!1082953) (not start!95754) (not mapNonEmpty!41368) (not b!1082947) (not b!1082955) b_and!35491 (not b_lambda!17077))
(check-sat b_and!35491 (not b_next!22407))
