; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96012 () Bool)

(assert start!96012)

(declare-fun b_free!22429 () Bool)

(declare-fun b_next!22429 () Bool)

(assert (=> start!96012 (= b_free!22429 (not b_next!22429))))

(declare-fun tp!79135 () Bool)

(declare-fun b_and!35543 () Bool)

(assert (=> start!96012 (= tp!79135 b_and!35543)))

(declare-fun b!1084690 () Bool)

(declare-fun e!619895 () Bool)

(assert (=> b!1084690 (= e!619895 (not true))))

(declare-datatypes ((V!40369 0))(
  ( (V!40370 (val!13272 Int)) )
))
(declare-datatypes ((tuple2!16824 0))(
  ( (tuple2!16825 (_1!8423 (_ BitVec 64)) (_2!8423 V!40369)) )
))
(declare-datatypes ((List!23419 0))(
  ( (Nil!23416) (Cons!23415 (h!24633 tuple2!16824) (t!32898 List!23419)) )
))
(declare-datatypes ((ListLongMap!14801 0))(
  ( (ListLongMap!14802 (toList!7416 List!23419)) )
))
(declare-fun lt!480555 () ListLongMap!14801)

(declare-fun lt!480557 () ListLongMap!14801)

(assert (=> b!1084690 (and (= lt!480555 lt!480557) (= lt!480557 lt!480555))))

(declare-fun lt!480556 () ListLongMap!14801)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!728 (ListLongMap!14801 (_ BitVec 64)) ListLongMap!14801)

(assert (=> b!1084690 (= lt!480557 (-!728 lt!480556 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((Unit!35623 0))(
  ( (Unit!35624) )
))
(declare-fun lt!480553 () Unit!35623)

(declare-fun minValue!831 () V!40369)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40369)

(declare-datatypes ((array!69843 0))(
  ( (array!69844 (arr!33589 (Array (_ BitVec 32) (_ BitVec 64))) (size!34126 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69843)

(declare-datatypes ((ValueCell!12506 0))(
  ( (ValueCellFull!12506 (v!15889 V!40369)) (EmptyCell!12506) )
))
(declare-datatypes ((array!69845 0))(
  ( (array!69846 (arr!33590 (Array (_ BitVec 32) ValueCell!12506)) (size!34127 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69845)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!17 (array!69843 array!69845 (_ BitVec 32) (_ BitVec 32) V!40369 V!40369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35623)

(assert (=> b!1084690 (= lt!480553 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!17 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480558 () array!69843)

(declare-fun getCurrentListMapNoExtraKeys!3993 (array!69843 array!69845 (_ BitVec 32) (_ BitVec 32) V!40369 V!40369 (_ BitVec 32) Int) ListLongMap!14801)

(declare-fun dynLambda!2114 (Int (_ BitVec 64)) V!40369)

(assert (=> b!1084690 (= lt!480555 (getCurrentListMapNoExtraKeys!3993 lt!480558 (array!69846 (store (arr!33590 _values!874) i!650 (ValueCellFull!12506 (dynLambda!2114 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34127 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084690 (= lt!480556 (getCurrentListMapNoExtraKeys!3993 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084690 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480554 () Unit!35623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69843 (_ BitVec 64) (_ BitVec 32)) Unit!35623)

(assert (=> b!1084690 (= lt!480554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084691 () Bool)

(declare-fun e!619897 () Bool)

(declare-fun tp_is_empty!26431 () Bool)

(assert (=> b!1084691 (= e!619897 tp_is_empty!26431)))

(declare-fun b!1084693 () Bool)

(declare-fun res!722711 () Bool)

(declare-fun e!619894 () Bool)

(assert (=> b!1084693 (=> (not res!722711) (not e!619894))))

(declare-datatypes ((List!23420 0))(
  ( (Nil!23417) (Cons!23416 (h!24634 (_ BitVec 64)) (t!32899 List!23420)) )
))
(declare-fun arrayNoDuplicates!0 (array!69843 (_ BitVec 32) List!23420) Bool)

(assert (=> b!1084693 (= res!722711 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23417))))

(declare-fun mapIsEmpty!41401 () Bool)

(declare-fun mapRes!41401 () Bool)

(assert (=> mapIsEmpty!41401 mapRes!41401))

(declare-fun b!1084694 () Bool)

(declare-fun res!722715 () Bool)

(assert (=> b!1084694 (=> (not res!722715) (not e!619894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084694 (= res!722715 (validKeyInArray!0 k0!904))))

(declare-fun b!1084695 () Bool)

(declare-fun res!722716 () Bool)

(assert (=> b!1084695 (=> (not res!722716) (not e!619894))))

(assert (=> b!1084695 (= res!722716 (= (select (arr!33589 _keys!1070) i!650) k0!904))))

(declare-fun b!1084696 () Bool)

(declare-fun e!619893 () Bool)

(declare-fun e!619898 () Bool)

(assert (=> b!1084696 (= e!619893 (and e!619898 mapRes!41401))))

(declare-fun condMapEmpty!41401 () Bool)

(declare-fun mapDefault!41401 () ValueCell!12506)

(assert (=> b!1084696 (= condMapEmpty!41401 (= (arr!33590 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12506)) mapDefault!41401)))))

(declare-fun mapNonEmpty!41401 () Bool)

(declare-fun tp!79136 () Bool)

(assert (=> mapNonEmpty!41401 (= mapRes!41401 (and tp!79136 e!619897))))

(declare-fun mapRest!41401 () (Array (_ BitVec 32) ValueCell!12506))

(declare-fun mapValue!41401 () ValueCell!12506)

(declare-fun mapKey!41401 () (_ BitVec 32))

(assert (=> mapNonEmpty!41401 (= (arr!33590 _values!874) (store mapRest!41401 mapKey!41401 mapValue!41401))))

(declare-fun b!1084697 () Bool)

(declare-fun res!722718 () Bool)

(assert (=> b!1084697 (=> (not res!722718) (not e!619894))))

(assert (=> b!1084697 (= res!722718 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34126 _keys!1070))))))

(declare-fun b!1084698 () Bool)

(assert (=> b!1084698 (= e!619898 tp_is_empty!26431)))

(declare-fun b!1084699 () Bool)

(assert (=> b!1084699 (= e!619894 e!619895)))

(declare-fun res!722714 () Bool)

(assert (=> b!1084699 (=> (not res!722714) (not e!619895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69843 (_ BitVec 32)) Bool)

(assert (=> b!1084699 (= res!722714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480558 mask!1414))))

(assert (=> b!1084699 (= lt!480558 (array!69844 (store (arr!33589 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34126 _keys!1070)))))

(declare-fun res!722717 () Bool)

(assert (=> start!96012 (=> (not res!722717) (not e!619894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96012 (= res!722717 (validMask!0 mask!1414))))

(assert (=> start!96012 e!619894))

(assert (=> start!96012 tp!79135))

(assert (=> start!96012 true))

(assert (=> start!96012 tp_is_empty!26431))

(declare-fun array_inv!25972 (array!69843) Bool)

(assert (=> start!96012 (array_inv!25972 _keys!1070)))

(declare-fun array_inv!25973 (array!69845) Bool)

(assert (=> start!96012 (and (array_inv!25973 _values!874) e!619893)))

(declare-fun b!1084692 () Bool)

(declare-fun res!722712 () Bool)

(assert (=> b!1084692 (=> (not res!722712) (not e!619894))))

(assert (=> b!1084692 (= res!722712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084700 () Bool)

(declare-fun res!722710 () Bool)

(assert (=> b!1084700 (=> (not res!722710) (not e!619895))))

(assert (=> b!1084700 (= res!722710 (arrayNoDuplicates!0 lt!480558 #b00000000000000000000000000000000 Nil!23417))))

(declare-fun b!1084701 () Bool)

(declare-fun res!722713 () Bool)

(assert (=> b!1084701 (=> (not res!722713) (not e!619894))))

(assert (=> b!1084701 (= res!722713 (and (= (size!34127 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34126 _keys!1070) (size!34127 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96012 res!722717) b!1084701))

(assert (= (and b!1084701 res!722713) b!1084692))

(assert (= (and b!1084692 res!722712) b!1084693))

(assert (= (and b!1084693 res!722711) b!1084697))

(assert (= (and b!1084697 res!722718) b!1084694))

(assert (= (and b!1084694 res!722715) b!1084695))

(assert (= (and b!1084695 res!722716) b!1084699))

(assert (= (and b!1084699 res!722714) b!1084700))

(assert (= (and b!1084700 res!722710) b!1084690))

(assert (= (and b!1084696 condMapEmpty!41401) mapIsEmpty!41401))

(assert (= (and b!1084696 (not condMapEmpty!41401)) mapNonEmpty!41401))

(get-info :version)

(assert (= (and mapNonEmpty!41401 ((_ is ValueCellFull!12506) mapValue!41401)) b!1084691))

(assert (= (and b!1084696 ((_ is ValueCellFull!12506) mapDefault!41401)) b!1084698))

(assert (= start!96012 b!1084696))

(declare-fun b_lambda!17109 () Bool)

(assert (=> (not b_lambda!17109) (not b!1084690)))

(declare-fun t!32897 () Bool)

(declare-fun tb!7299 () Bool)

(assert (=> (and start!96012 (= defaultEntry!882 defaultEntry!882) t!32897) tb!7299))

(declare-fun result!15125 () Bool)

(assert (=> tb!7299 (= result!15125 tp_is_empty!26431)))

(assert (=> b!1084690 t!32897))

(declare-fun b_and!35545 () Bool)

(assert (= b_and!35543 (and (=> t!32897 result!15125) b_and!35545)))

(declare-fun m!1002707 () Bool)

(assert (=> b!1084690 m!1002707))

(declare-fun m!1002709 () Bool)

(assert (=> b!1084690 m!1002709))

(declare-fun m!1002711 () Bool)

(assert (=> b!1084690 m!1002711))

(declare-fun m!1002713 () Bool)

(assert (=> b!1084690 m!1002713))

(declare-fun m!1002715 () Bool)

(assert (=> b!1084690 m!1002715))

(declare-fun m!1002717 () Bool)

(assert (=> b!1084690 m!1002717))

(declare-fun m!1002719 () Bool)

(assert (=> b!1084690 m!1002719))

(declare-fun m!1002721 () Bool)

(assert (=> b!1084690 m!1002721))

(declare-fun m!1002723 () Bool)

(assert (=> b!1084693 m!1002723))

(declare-fun m!1002725 () Bool)

(assert (=> b!1084692 m!1002725))

(declare-fun m!1002727 () Bool)

(assert (=> b!1084700 m!1002727))

(declare-fun m!1002729 () Bool)

(assert (=> b!1084695 m!1002729))

(declare-fun m!1002731 () Bool)

(assert (=> b!1084694 m!1002731))

(declare-fun m!1002733 () Bool)

(assert (=> start!96012 m!1002733))

(declare-fun m!1002735 () Bool)

(assert (=> start!96012 m!1002735))

(declare-fun m!1002737 () Bool)

(assert (=> start!96012 m!1002737))

(declare-fun m!1002739 () Bool)

(assert (=> mapNonEmpty!41401 m!1002739))

(declare-fun m!1002741 () Bool)

(assert (=> b!1084699 m!1002741))

(declare-fun m!1002743 () Bool)

(assert (=> b!1084699 m!1002743))

(check-sat (not b!1084700) (not start!96012) tp_is_empty!26431 (not mapNonEmpty!41401) (not b_lambda!17109) (not b!1084693) (not b!1084692) (not b!1084694) (not b!1084699) (not b!1084690) b_and!35545 (not b_next!22429))
(check-sat b_and!35545 (not b_next!22429))
