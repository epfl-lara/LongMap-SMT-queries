; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95640 () Bool)

(assert start!95640)

(declare-fun b_free!22293 () Bool)

(declare-fun b_next!22293 () Bool)

(assert (=> start!95640 (= b_free!22293 (not b_next!22293))))

(declare-fun tp!78728 () Bool)

(declare-fun b_and!35271 () Bool)

(assert (=> start!95640 (= tp!78728 b_and!35271)))

(declare-fun b!1080789 () Bool)

(declare-fun e!617815 () Bool)

(assert (=> b!1080789 (= e!617815 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40187 0))(
  ( (V!40188 (val!13204 Int)) )
))
(declare-fun zeroValue!831 () V!40187)

(declare-datatypes ((array!69541 0))(
  ( (array!69542 (arr!33444 (Array (_ BitVec 32) (_ BitVec 64))) (size!33980 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69541)

(declare-datatypes ((ValueCell!12438 0))(
  ( (ValueCellFull!12438 (v!15825 V!40187)) (EmptyCell!12438) )
))
(declare-datatypes ((array!69543 0))(
  ( (array!69544 (arr!33445 (Array (_ BitVec 32) ValueCell!12438)) (size!33981 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69543)

(declare-datatypes ((tuple2!16722 0))(
  ( (tuple2!16723 (_1!8372 (_ BitVec 64)) (_2!8372 V!40187)) )
))
(declare-datatypes ((List!23304 0))(
  ( (Nil!23301) (Cons!23300 (h!24509 tuple2!16722) (t!32663 List!23304)) )
))
(declare-datatypes ((ListLongMap!14691 0))(
  ( (ListLongMap!14692 (toList!7361 List!23304)) )
))
(declare-fun lt!479107 () ListLongMap!14691)

(declare-fun minValue!831 () V!40187)

(declare-fun getCurrentListMapNoExtraKeys!3909 (array!69541 array!69543 (_ BitVec 32) (_ BitVec 32) V!40187 V!40187 (_ BitVec 32) Int) ListLongMap!14691)

(assert (=> b!1080789 (= lt!479107 (getCurrentListMapNoExtraKeys!3909 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080789 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35542 0))(
  ( (Unit!35543) )
))
(declare-fun lt!479105 () Unit!35542)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69541 (_ BitVec 64) (_ BitVec 32)) Unit!35542)

(assert (=> b!1080789 (= lt!479105 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080790 () Bool)

(declare-fun e!617819 () Bool)

(declare-fun tp_is_empty!26295 () Bool)

(assert (=> b!1080790 (= e!617819 tp_is_empty!26295)))

(declare-fun b!1080791 () Bool)

(declare-fun e!617814 () Bool)

(declare-fun mapRes!41197 () Bool)

(assert (=> b!1080791 (= e!617814 (and e!617819 mapRes!41197))))

(declare-fun condMapEmpty!41197 () Bool)

(declare-fun mapDefault!41197 () ValueCell!12438)

(assert (=> b!1080791 (= condMapEmpty!41197 (= (arr!33445 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12438)) mapDefault!41197)))))

(declare-fun b!1080792 () Bool)

(declare-fun e!617818 () Bool)

(assert (=> b!1080792 (= e!617818 e!617815)))

(declare-fun res!720356 () Bool)

(assert (=> b!1080792 (=> (not res!720356) (not e!617815))))

(declare-fun lt!479106 () array!69541)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69541 (_ BitVec 32)) Bool)

(assert (=> b!1080792 (= res!720356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479106 mask!1414))))

(assert (=> b!1080792 (= lt!479106 (array!69542 (store (arr!33444 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33980 _keys!1070)))))

(declare-fun b!1080793 () Bool)

(declare-fun res!720359 () Bool)

(assert (=> b!1080793 (=> (not res!720359) (not e!617818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080793 (= res!720359 (validKeyInArray!0 k0!904))))

(declare-fun b!1080794 () Bool)

(declare-fun res!720355 () Bool)

(assert (=> b!1080794 (=> (not res!720355) (not e!617818))))

(assert (=> b!1080794 (= res!720355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!720354 () Bool)

(assert (=> start!95640 (=> (not res!720354) (not e!617818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95640 (= res!720354 (validMask!0 mask!1414))))

(assert (=> start!95640 e!617818))

(assert (=> start!95640 tp!78728))

(assert (=> start!95640 true))

(assert (=> start!95640 tp_is_empty!26295))

(declare-fun array_inv!25820 (array!69541) Bool)

(assert (=> start!95640 (array_inv!25820 _keys!1070)))

(declare-fun array_inv!25821 (array!69543) Bool)

(assert (=> start!95640 (and (array_inv!25821 _values!874) e!617814)))

(declare-fun mapNonEmpty!41197 () Bool)

(declare-fun tp!78727 () Bool)

(declare-fun e!617816 () Bool)

(assert (=> mapNonEmpty!41197 (= mapRes!41197 (and tp!78727 e!617816))))

(declare-fun mapRest!41197 () (Array (_ BitVec 32) ValueCell!12438))

(declare-fun mapKey!41197 () (_ BitVec 32))

(declare-fun mapValue!41197 () ValueCell!12438)

(assert (=> mapNonEmpty!41197 (= (arr!33445 _values!874) (store mapRest!41197 mapKey!41197 mapValue!41197))))

(declare-fun b!1080795 () Bool)

(declare-fun res!720360 () Bool)

(assert (=> b!1080795 (=> (not res!720360) (not e!617818))))

(assert (=> b!1080795 (= res!720360 (= (select (arr!33444 _keys!1070) i!650) k0!904))))

(declare-fun b!1080796 () Bool)

(declare-fun res!720358 () Bool)

(assert (=> b!1080796 (=> (not res!720358) (not e!617818))))

(declare-datatypes ((List!23305 0))(
  ( (Nil!23302) (Cons!23301 (h!24510 (_ BitVec 64)) (t!32664 List!23305)) )
))
(declare-fun arrayNoDuplicates!0 (array!69541 (_ BitVec 32) List!23305) Bool)

(assert (=> b!1080796 (= res!720358 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23302))))

(declare-fun mapIsEmpty!41197 () Bool)

(assert (=> mapIsEmpty!41197 mapRes!41197))

(declare-fun b!1080797 () Bool)

(declare-fun res!720357 () Bool)

(assert (=> b!1080797 (=> (not res!720357) (not e!617818))))

(assert (=> b!1080797 (= res!720357 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33980 _keys!1070))))))

(declare-fun b!1080798 () Bool)

(declare-fun res!720353 () Bool)

(assert (=> b!1080798 (=> (not res!720353) (not e!617815))))

(assert (=> b!1080798 (= res!720353 (arrayNoDuplicates!0 lt!479106 #b00000000000000000000000000000000 Nil!23302))))

(declare-fun b!1080799 () Bool)

(declare-fun res!720352 () Bool)

(assert (=> b!1080799 (=> (not res!720352) (not e!617818))))

(assert (=> b!1080799 (= res!720352 (and (= (size!33981 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33980 _keys!1070) (size!33981 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080800 () Bool)

(assert (=> b!1080800 (= e!617816 tp_is_empty!26295)))

(assert (= (and start!95640 res!720354) b!1080799))

(assert (= (and b!1080799 res!720352) b!1080794))

(assert (= (and b!1080794 res!720355) b!1080796))

(assert (= (and b!1080796 res!720358) b!1080797))

(assert (= (and b!1080797 res!720357) b!1080793))

(assert (= (and b!1080793 res!720359) b!1080795))

(assert (= (and b!1080795 res!720360) b!1080792))

(assert (= (and b!1080792 res!720356) b!1080798))

(assert (= (and b!1080798 res!720353) b!1080789))

(assert (= (and b!1080791 condMapEmpty!41197) mapIsEmpty!41197))

(assert (= (and b!1080791 (not condMapEmpty!41197)) mapNonEmpty!41197))

(get-info :version)

(assert (= (and mapNonEmpty!41197 ((_ is ValueCellFull!12438) mapValue!41197)) b!1080800))

(assert (= (and b!1080791 ((_ is ValueCellFull!12438) mapDefault!41197)) b!1080790))

(assert (= start!95640 b!1080791))

(declare-fun m!998669 () Bool)

(assert (=> b!1080792 m!998669))

(declare-fun m!998671 () Bool)

(assert (=> b!1080792 m!998671))

(declare-fun m!998673 () Bool)

(assert (=> b!1080794 m!998673))

(declare-fun m!998675 () Bool)

(assert (=> b!1080798 m!998675))

(declare-fun m!998677 () Bool)

(assert (=> start!95640 m!998677))

(declare-fun m!998679 () Bool)

(assert (=> start!95640 m!998679))

(declare-fun m!998681 () Bool)

(assert (=> start!95640 m!998681))

(declare-fun m!998683 () Bool)

(assert (=> b!1080789 m!998683))

(declare-fun m!998685 () Bool)

(assert (=> b!1080789 m!998685))

(declare-fun m!998687 () Bool)

(assert (=> b!1080789 m!998687))

(declare-fun m!998689 () Bool)

(assert (=> b!1080793 m!998689))

(declare-fun m!998691 () Bool)

(assert (=> mapNonEmpty!41197 m!998691))

(declare-fun m!998693 () Bool)

(assert (=> b!1080795 m!998693))

(declare-fun m!998695 () Bool)

(assert (=> b!1080796 m!998695))

(check-sat (not b!1080794) (not b!1080798) (not b!1080789) (not b!1080796) (not b_next!22293) (not b!1080793) (not mapNonEmpty!41197) (not start!95640) (not b!1080792) tp_is_empty!26295 b_and!35271)
(check-sat b_and!35271 (not b_next!22293))
