; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94876 () Bool)

(assert start!94876)

(declare-fun b_free!22087 () Bool)

(declare-fun b_next!22087 () Bool)

(assert (=> start!94876 (= b_free!22087 (not b_next!22087))))

(declare-fun tp!77726 () Bool)

(declare-fun b_and!34915 () Bool)

(assert (=> start!94876 (= tp!77726 b_and!34915)))

(declare-fun b!1072706 () Bool)

(declare-fun e!612754 () Bool)

(declare-fun e!612751 () Bool)

(declare-fun mapRes!40558 () Bool)

(assert (=> b!1072706 (= e!612754 (and e!612751 mapRes!40558))))

(declare-fun condMapEmpty!40558 () Bool)

(declare-datatypes ((V!39665 0))(
  ( (V!39666 (val!12999 Int)) )
))
(declare-datatypes ((ValueCell!12245 0))(
  ( (ValueCellFull!12245 (v!15616 V!39665)) (EmptyCell!12245) )
))
(declare-datatypes ((array!68700 0))(
  ( (array!68701 (arr!33044 (Array (_ BitVec 32) ValueCell!12245)) (size!33582 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68700)

(declare-fun mapDefault!40558 () ValueCell!12245)

(assert (=> b!1072706 (= condMapEmpty!40558 (= (arr!33044 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12245)) mapDefault!40558)))))

(declare-fun res!715540 () Bool)

(declare-fun e!612755 () Bool)

(assert (=> start!94876 (=> (not res!715540) (not e!612755))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94876 (= res!715540 (validMask!0 mask!1515))))

(assert (=> start!94876 e!612755))

(assert (=> start!94876 true))

(declare-fun tp_is_empty!25897 () Bool)

(assert (=> start!94876 tp_is_empty!25897))

(declare-fun array_inv!25564 (array!68700) Bool)

(assert (=> start!94876 (and (array_inv!25564 _values!955) e!612754)))

(assert (=> start!94876 tp!77726))

(declare-datatypes ((array!68702 0))(
  ( (array!68703 (arr!33045 (Array (_ BitVec 32) (_ BitVec 64))) (size!33583 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68702)

(declare-fun array_inv!25565 (array!68702) Bool)

(assert (=> start!94876 (array_inv!25565 _keys!1163)))

(declare-fun b!1072707 () Bool)

(declare-fun res!715541 () Bool)

(assert (=> b!1072707 (=> (not res!715541) (not e!612755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68702 (_ BitVec 32)) Bool)

(assert (=> b!1072707 (= res!715541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40558 () Bool)

(assert (=> mapIsEmpty!40558 mapRes!40558))

(declare-fun mapNonEmpty!40558 () Bool)

(declare-fun tp!77725 () Bool)

(declare-fun e!612753 () Bool)

(assert (=> mapNonEmpty!40558 (= mapRes!40558 (and tp!77725 e!612753))))

(declare-fun mapRest!40558 () (Array (_ BitVec 32) ValueCell!12245))

(declare-fun mapKey!40558 () (_ BitVec 32))

(declare-fun mapValue!40558 () ValueCell!12245)

(assert (=> mapNonEmpty!40558 (= (arr!33044 _values!955) (store mapRest!40558 mapKey!40558 mapValue!40558))))

(declare-fun b!1072708 () Bool)

(assert (=> b!1072708 (= e!612755 (not true))))

(declare-datatypes ((tuple2!16612 0))(
  ( (tuple2!16613 (_1!8317 (_ BitVec 64)) (_2!8317 V!39665)) )
))
(declare-datatypes ((List!23135 0))(
  ( (Nil!23132) (Cons!23131 (h!24340 tuple2!16612) (t!32463 List!23135)) )
))
(declare-datatypes ((ListLongMap!14581 0))(
  ( (ListLongMap!14582 (toList!7306 List!23135)) )
))
(declare-fun lt!475674 () ListLongMap!14581)

(declare-fun lt!475675 () ListLongMap!14581)

(assert (=> b!1072708 (= lt!475674 lt!475675)))

(declare-fun zeroValueBefore!47 () V!39665)

(declare-datatypes ((Unit!35189 0))(
  ( (Unit!35190) )
))
(declare-fun lt!475676 () Unit!35189)

(declare-fun minValue!907 () V!39665)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39665)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!880 (array!68702 array!68700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39665 V!39665 V!39665 V!39665 (_ BitVec 32) Int) Unit!35189)

(assert (=> b!1072708 (= lt!475676 (lemmaNoChangeToArrayThenSameMapNoExtras!880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3886 (array!68702 array!68700 (_ BitVec 32) (_ BitVec 32) V!39665 V!39665 (_ BitVec 32) Int) ListLongMap!14581)

(assert (=> b!1072708 (= lt!475675 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072708 (= lt!475674 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072709 () Bool)

(assert (=> b!1072709 (= e!612751 tp_is_empty!25897)))

(declare-fun b!1072710 () Bool)

(declare-fun res!715542 () Bool)

(assert (=> b!1072710 (=> (not res!715542) (not e!612755))))

(assert (=> b!1072710 (= res!715542 (and (= (size!33582 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33583 _keys!1163) (size!33582 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072711 () Bool)

(assert (=> b!1072711 (= e!612753 tp_is_empty!25897)))

(declare-fun b!1072712 () Bool)

(declare-fun res!715543 () Bool)

(assert (=> b!1072712 (=> (not res!715543) (not e!612755))))

(declare-datatypes ((List!23136 0))(
  ( (Nil!23133) (Cons!23132 (h!24341 (_ BitVec 64)) (t!32464 List!23136)) )
))
(declare-fun arrayNoDuplicates!0 (array!68702 (_ BitVec 32) List!23136) Bool)

(assert (=> b!1072712 (= res!715543 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23133))))

(assert (= (and start!94876 res!715540) b!1072710))

(assert (= (and b!1072710 res!715542) b!1072707))

(assert (= (and b!1072707 res!715541) b!1072712))

(assert (= (and b!1072712 res!715543) b!1072708))

(assert (= (and b!1072706 condMapEmpty!40558) mapIsEmpty!40558))

(assert (= (and b!1072706 (not condMapEmpty!40558)) mapNonEmpty!40558))

(get-info :version)

(assert (= (and mapNonEmpty!40558 ((_ is ValueCellFull!12245) mapValue!40558)) b!1072711))

(assert (= (and b!1072706 ((_ is ValueCellFull!12245) mapDefault!40558)) b!1072709))

(assert (= start!94876 b!1072706))

(declare-fun m!991351 () Bool)

(assert (=> b!1072708 m!991351))

(declare-fun m!991353 () Bool)

(assert (=> b!1072708 m!991353))

(declare-fun m!991355 () Bool)

(assert (=> b!1072708 m!991355))

(declare-fun m!991357 () Bool)

(assert (=> start!94876 m!991357))

(declare-fun m!991359 () Bool)

(assert (=> start!94876 m!991359))

(declare-fun m!991361 () Bool)

(assert (=> start!94876 m!991361))

(declare-fun m!991363 () Bool)

(assert (=> b!1072712 m!991363))

(declare-fun m!991365 () Bool)

(assert (=> b!1072707 m!991365))

(declare-fun m!991367 () Bool)

(assert (=> mapNonEmpty!40558 m!991367))

(check-sat tp_is_empty!25897 (not start!94876) (not b!1072708) (not b_next!22087) (not mapNonEmpty!40558) b_and!34915 (not b!1072712) (not b!1072707))
(check-sat b_and!34915 (not b_next!22087))
