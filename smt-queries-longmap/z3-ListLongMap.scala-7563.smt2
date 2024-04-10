; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95700 () Bool)

(assert start!95700)

(declare-fun b_free!22353 () Bool)

(declare-fun b_next!22353 () Bool)

(assert (=> start!95700 (= b_free!22353 (not b_next!22353))))

(declare-fun tp!78908 () Bool)

(declare-fun b_and!35381 () Bool)

(assert (=> start!95700 (= tp!78908 b_and!35381)))

(declare-fun b!1081920 () Bool)

(declare-fun res!721164 () Bool)

(declare-fun e!618358 () Bool)

(assert (=> b!1081920 (=> (not res!721164) (not e!618358))))

(declare-datatypes ((array!69657 0))(
  ( (array!69658 (arr!33502 (Array (_ BitVec 32) (_ BitVec 64))) (size!34038 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69657)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081920 (= res!721164 (= (select (arr!33502 _keys!1070) i!650) k0!904))))

(declare-fun b!1081921 () Bool)

(declare-fun e!618354 () Bool)

(declare-fun tp_is_empty!26355 () Bool)

(assert (=> b!1081921 (= e!618354 tp_is_empty!26355)))

(declare-fun b!1081922 () Bool)

(declare-fun res!721169 () Bool)

(assert (=> b!1081922 (=> (not res!721169) (not e!618358))))

(assert (=> b!1081922 (= res!721169 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34038 _keys!1070))))))

(declare-fun b!1081923 () Bool)

(declare-fun e!618356 () Bool)

(assert (=> b!1081923 (= e!618356 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40267 0))(
  ( (V!40268 (val!13234 Int)) )
))
(declare-datatypes ((ValueCell!12468 0))(
  ( (ValueCellFull!12468 (v!15855 V!40267)) (EmptyCell!12468) )
))
(declare-datatypes ((array!69659 0))(
  ( (array!69660 (arr!33503 (Array (_ BitVec 32) ValueCell!12468)) (size!34039 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69659)

(declare-fun minValue!831 () V!40267)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16770 0))(
  ( (tuple2!16771 (_1!8396 (_ BitVec 64)) (_2!8396 V!40267)) )
))
(declare-datatypes ((List!23350 0))(
  ( (Nil!23347) (Cons!23346 (h!24555 tuple2!16770) (t!32761 List!23350)) )
))
(declare-datatypes ((ListLongMap!14739 0))(
  ( (ListLongMap!14740 (toList!7385 List!23350)) )
))
(declare-fun lt!479455 () ListLongMap!14739)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40267)

(declare-fun lt!479454 () array!69657)

(declare-fun getCurrentListMapNoExtraKeys!3933 (array!69657 array!69659 (_ BitVec 32) (_ BitVec 32) V!40267 V!40267 (_ BitVec 32) Int) ListLongMap!14739)

(declare-fun dynLambda!2070 (Int (_ BitVec 64)) V!40267)

(assert (=> b!1081923 (= lt!479455 (getCurrentListMapNoExtraKeys!3933 lt!479454 (array!69660 (store (arr!33503 _values!874) i!650 (ValueCellFull!12468 (dynLambda!2070 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34039 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479453 () ListLongMap!14739)

(assert (=> b!1081923 (= lt!479453 (getCurrentListMapNoExtraKeys!3933 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081923 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35590 0))(
  ( (Unit!35591) )
))
(declare-fun lt!479452 () Unit!35590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69657 (_ BitVec 64) (_ BitVec 32)) Unit!35590)

(assert (=> b!1081923 (= lt!479452 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081924 () Bool)

(declare-fun res!721170 () Bool)

(assert (=> b!1081924 (=> (not res!721170) (not e!618358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081924 (= res!721170 (validKeyInArray!0 k0!904))))

(declare-fun b!1081925 () Bool)

(declare-fun res!721168 () Bool)

(assert (=> b!1081925 (=> (not res!721168) (not e!618358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69657 (_ BitVec 32)) Bool)

(assert (=> b!1081925 (= res!721168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081926 () Bool)

(declare-fun res!721162 () Bool)

(assert (=> b!1081926 (=> (not res!721162) (not e!618356))))

(declare-datatypes ((List!23351 0))(
  ( (Nil!23348) (Cons!23347 (h!24556 (_ BitVec 64)) (t!32762 List!23351)) )
))
(declare-fun arrayNoDuplicates!0 (array!69657 (_ BitVec 32) List!23351) Bool)

(assert (=> b!1081926 (= res!721162 (arrayNoDuplicates!0 lt!479454 #b00000000000000000000000000000000 Nil!23348))))

(declare-fun mapIsEmpty!41287 () Bool)

(declare-fun mapRes!41287 () Bool)

(assert (=> mapIsEmpty!41287 mapRes!41287))

(declare-fun mapNonEmpty!41287 () Bool)

(declare-fun tp!78907 () Bool)

(declare-fun e!618355 () Bool)

(assert (=> mapNonEmpty!41287 (= mapRes!41287 (and tp!78907 e!618355))))

(declare-fun mapRest!41287 () (Array (_ BitVec 32) ValueCell!12468))

(declare-fun mapKey!41287 () (_ BitVec 32))

(declare-fun mapValue!41287 () ValueCell!12468)

(assert (=> mapNonEmpty!41287 (= (arr!33503 _values!874) (store mapRest!41287 mapKey!41287 mapValue!41287))))

(declare-fun b!1081927 () Bool)

(assert (=> b!1081927 (= e!618355 tp_is_empty!26355)))

(declare-fun b!1081928 () Bool)

(declare-fun res!721167 () Bool)

(assert (=> b!1081928 (=> (not res!721167) (not e!618358))))

(assert (=> b!1081928 (= res!721167 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23348))))

(declare-fun res!721166 () Bool)

(assert (=> start!95700 (=> (not res!721166) (not e!618358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95700 (= res!721166 (validMask!0 mask!1414))))

(assert (=> start!95700 e!618358))

(assert (=> start!95700 tp!78908))

(assert (=> start!95700 true))

(assert (=> start!95700 tp_is_empty!26355))

(declare-fun array_inv!25864 (array!69657) Bool)

(assert (=> start!95700 (array_inv!25864 _keys!1070)))

(declare-fun e!618359 () Bool)

(declare-fun array_inv!25865 (array!69659) Bool)

(assert (=> start!95700 (and (array_inv!25865 _values!874) e!618359)))

(declare-fun b!1081919 () Bool)

(declare-fun res!721165 () Bool)

(assert (=> b!1081919 (=> (not res!721165) (not e!618358))))

(assert (=> b!1081919 (= res!721165 (and (= (size!34039 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34038 _keys!1070) (size!34039 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081929 () Bool)

(assert (=> b!1081929 (= e!618358 e!618356)))

(declare-fun res!721163 () Bool)

(assert (=> b!1081929 (=> (not res!721163) (not e!618356))))

(assert (=> b!1081929 (= res!721163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479454 mask!1414))))

(assert (=> b!1081929 (= lt!479454 (array!69658 (store (arr!33502 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34038 _keys!1070)))))

(declare-fun b!1081930 () Bool)

(assert (=> b!1081930 (= e!618359 (and e!618354 mapRes!41287))))

(declare-fun condMapEmpty!41287 () Bool)

(declare-fun mapDefault!41287 () ValueCell!12468)

(assert (=> b!1081930 (= condMapEmpty!41287 (= (arr!33503 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12468)) mapDefault!41287)))))

(assert (= (and start!95700 res!721166) b!1081919))

(assert (= (and b!1081919 res!721165) b!1081925))

(assert (= (and b!1081925 res!721168) b!1081928))

(assert (= (and b!1081928 res!721167) b!1081922))

(assert (= (and b!1081922 res!721169) b!1081924))

(assert (= (and b!1081924 res!721170) b!1081920))

(assert (= (and b!1081920 res!721164) b!1081929))

(assert (= (and b!1081929 res!721163) b!1081926))

(assert (= (and b!1081926 res!721162) b!1081923))

(assert (= (and b!1081930 condMapEmpty!41287) mapIsEmpty!41287))

(assert (= (and b!1081930 (not condMapEmpty!41287)) mapNonEmpty!41287))

(get-info :version)

(assert (= (and mapNonEmpty!41287 ((_ is ValueCellFull!12468) mapValue!41287)) b!1081927))

(assert (= (and b!1081930 ((_ is ValueCellFull!12468) mapDefault!41287)) b!1081921))

(assert (= start!95700 b!1081930))

(declare-fun b_lambda!17023 () Bool)

(assert (=> (not b_lambda!17023) (not b!1081923)))

(declare-fun t!32760 () Bool)

(declare-fun tb!7231 () Bool)

(assert (=> (and start!95700 (= defaultEntry!882 defaultEntry!882) t!32760) tb!7231))

(declare-fun result!14981 () Bool)

(assert (=> tb!7231 (= result!14981 tp_is_empty!26355)))

(assert (=> b!1081923 t!32760))

(declare-fun b_and!35383 () Bool)

(assert (= b_and!35381 (and (=> t!32760 result!14981) b_and!35383)))

(declare-fun m!999659 () Bool)

(assert (=> b!1081924 m!999659))

(declare-fun m!999661 () Bool)

(assert (=> b!1081925 m!999661))

(declare-fun m!999663 () Bool)

(assert (=> mapNonEmpty!41287 m!999663))

(declare-fun m!999665 () Bool)

(assert (=> b!1081923 m!999665))

(declare-fun m!999667 () Bool)

(assert (=> b!1081923 m!999667))

(declare-fun m!999669 () Bool)

(assert (=> b!1081923 m!999669))

(declare-fun m!999671 () Bool)

(assert (=> b!1081923 m!999671))

(declare-fun m!999673 () Bool)

(assert (=> b!1081923 m!999673))

(declare-fun m!999675 () Bool)

(assert (=> b!1081923 m!999675))

(declare-fun m!999677 () Bool)

(assert (=> b!1081920 m!999677))

(declare-fun m!999679 () Bool)

(assert (=> b!1081929 m!999679))

(declare-fun m!999681 () Bool)

(assert (=> b!1081929 m!999681))

(declare-fun m!999683 () Bool)

(assert (=> start!95700 m!999683))

(declare-fun m!999685 () Bool)

(assert (=> start!95700 m!999685))

(declare-fun m!999687 () Bool)

(assert (=> start!95700 m!999687))

(declare-fun m!999689 () Bool)

(assert (=> b!1081926 m!999689))

(declare-fun m!999691 () Bool)

(assert (=> b!1081928 m!999691))

(check-sat (not b!1081928) (not b!1081924) tp_is_empty!26355 (not b!1081925) (not b!1081923) (not b!1081929) (not b!1081926) (not b_lambda!17023) (not b_next!22353) (not start!95700) b_and!35383 (not mapNonEmpty!41287))
(check-sat b_and!35383 (not b_next!22353))
