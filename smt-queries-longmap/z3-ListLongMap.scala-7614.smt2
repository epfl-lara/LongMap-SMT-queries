; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95998 () Bool)

(assert start!95998)

(declare-fun b_free!22657 () Bool)

(declare-fun b_next!22657 () Bool)

(assert (=> start!95998 (= b_free!22657 (not b_next!22657))))

(declare-fun tp!79820 () Bool)

(declare-fun b_and!35963 () Bool)

(assert (=> start!95998 (= tp!79820 b_and!35963)))

(declare-fun b!1088042 () Bool)

(declare-fun res!725699 () Bool)

(declare-fun e!621485 () Bool)

(assert (=> b!1088042 (=> (not res!725699) (not e!621485))))

(declare-datatypes ((array!70168 0))(
  ( (array!70169 (arr!33758 (Array (_ BitVec 32) (_ BitVec 64))) (size!34296 (_ BitVec 32))) )
))
(declare-fun lt!484389 () array!70168)

(declare-datatypes ((List!23617 0))(
  ( (Nil!23614) (Cons!23613 (h!24822 (_ BitVec 64)) (t!33323 List!23617)) )
))
(declare-fun arrayNoDuplicates!0 (array!70168 (_ BitVec 32) List!23617) Bool)

(assert (=> b!1088042 (= res!725699 (arrayNoDuplicates!0 lt!484389 #b00000000000000000000000000000000 Nil!23614))))

(declare-fun b!1088043 () Bool)

(declare-fun res!725696 () Bool)

(declare-fun e!621482 () Bool)

(assert (=> b!1088043 (=> (not res!725696) (not e!621482))))

(declare-fun _keys!1070 () array!70168)

(assert (=> b!1088043 (= res!725696 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23614))))

(declare-fun b!1088044 () Bool)

(declare-fun res!725700 () Bool)

(assert (=> b!1088044 (=> (not res!725700) (not e!621482))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088044 (= res!725700 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34296 _keys!1070))))))

(declare-fun b!1088045 () Bool)

(declare-fun e!621481 () Bool)

(declare-fun e!621484 () Bool)

(declare-fun mapRes!41743 () Bool)

(assert (=> b!1088045 (= e!621481 (and e!621484 mapRes!41743))))

(declare-fun condMapEmpty!41743 () Bool)

(declare-datatypes ((V!40673 0))(
  ( (V!40674 (val!13386 Int)) )
))
(declare-datatypes ((ValueCell!12620 0))(
  ( (ValueCellFull!12620 (v!16006 V!40673)) (EmptyCell!12620) )
))
(declare-datatypes ((array!70170 0))(
  ( (array!70171 (arr!33759 (Array (_ BitVec 32) ValueCell!12620)) (size!34297 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70170)

(declare-fun mapDefault!41743 () ValueCell!12620)

(assert (=> b!1088045 (= condMapEmpty!41743 (= (arr!33759 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12620)) mapDefault!41743)))))

(declare-fun b!1088046 () Bool)

(assert (=> b!1088046 (= e!621482 e!621485)))

(declare-fun res!725701 () Bool)

(assert (=> b!1088046 (=> (not res!725701) (not e!621485))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70168 (_ BitVec 32)) Bool)

(assert (=> b!1088046 (= res!725701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484389 mask!1414))))

(assert (=> b!1088046 (= lt!484389 (array!70169 (store (arr!33758 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34296 _keys!1070)))))

(declare-fun b!1088047 () Bool)

(declare-fun e!621483 () Bool)

(declare-fun tp_is_empty!26659 () Bool)

(assert (=> b!1088047 (= e!621483 tp_is_empty!26659)))

(declare-fun b!1088048 () Bool)

(declare-fun e!621478 () Bool)

(declare-fun e!621479 () Bool)

(assert (=> b!1088048 (= e!621478 e!621479)))

(declare-fun res!725697 () Bool)

(assert (=> b!1088048 (=> res!725697 e!621479)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1088048 (= res!725697 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17050 0))(
  ( (tuple2!17051 (_1!8536 (_ BitVec 64)) (_2!8536 V!40673)) )
))
(declare-datatypes ((List!23618 0))(
  ( (Nil!23615) (Cons!23614 (h!24823 tuple2!17050) (t!33324 List!23618)) )
))
(declare-datatypes ((ListLongMap!15019 0))(
  ( (ListLongMap!15020 (toList!7525 List!23618)) )
))
(declare-fun lt!484379 () ListLongMap!15019)

(declare-fun lt!484380 () ListLongMap!15019)

(assert (=> b!1088048 (= lt!484379 lt!484380)))

(declare-fun lt!484381 () ListLongMap!15019)

(declare-fun lt!484387 () tuple2!17050)

(declare-fun +!3328 (ListLongMap!15019 tuple2!17050) ListLongMap!15019)

(assert (=> b!1088048 (= lt!484380 (+!3328 lt!484381 lt!484387))))

(declare-fun lt!484383 () ListLongMap!15019)

(declare-fun lt!484384 () ListLongMap!15019)

(assert (=> b!1088048 (= lt!484383 lt!484384)))

(declare-fun lt!484388 () ListLongMap!15019)

(assert (=> b!1088048 (= lt!484384 (+!3328 lt!484388 lt!484387))))

(declare-fun lt!484386 () ListLongMap!15019)

(assert (=> b!1088048 (= lt!484379 (+!3328 lt!484386 lt!484387))))

(declare-fun zeroValue!831 () V!40673)

(assert (=> b!1088048 (= lt!484387 (tuple2!17051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088049 () Bool)

(declare-fun res!725702 () Bool)

(assert (=> b!1088049 (=> (not res!725702) (not e!621482))))

(assert (=> b!1088049 (= res!725702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088050 () Bool)

(declare-fun res!725698 () Bool)

(assert (=> b!1088050 (=> (not res!725698) (not e!621482))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088050 (= res!725698 (and (= (size!34297 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34296 _keys!1070) (size!34297 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41743 () Bool)

(assert (=> mapIsEmpty!41743 mapRes!41743))

(declare-fun mapNonEmpty!41743 () Bool)

(declare-fun tp!79819 () Bool)

(assert (=> mapNonEmpty!41743 (= mapRes!41743 (and tp!79819 e!621483))))

(declare-fun mapValue!41743 () ValueCell!12620)

(declare-fun mapRest!41743 () (Array (_ BitVec 32) ValueCell!12620))

(declare-fun mapKey!41743 () (_ BitVec 32))

(assert (=> mapNonEmpty!41743 (= (arr!33759 _values!874) (store mapRest!41743 mapKey!41743 mapValue!41743))))

(declare-fun b!1088051 () Bool)

(assert (=> b!1088051 (= e!621484 tp_is_empty!26659)))

(declare-fun b!1088052 () Bool)

(declare-fun res!725706 () Bool)

(assert (=> b!1088052 (=> (not res!725706) (not e!621482))))

(assert (=> b!1088052 (= res!725706 (= (select (arr!33758 _keys!1070) i!650) k0!904))))

(declare-fun b!1088041 () Bool)

(assert (=> b!1088041 (= e!621485 (not e!621478))))

(declare-fun res!725705 () Bool)

(assert (=> b!1088041 (=> res!725705 e!621478)))

(assert (=> b!1088041 (= res!725705 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40673)

(declare-fun getCurrentListMap!4206 (array!70168 array!70170 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) Int) ListLongMap!15019)

(assert (=> b!1088041 (= lt!484383 (getCurrentListMap!4206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484390 () array!70170)

(assert (=> b!1088041 (= lt!484379 (getCurrentListMap!4206 lt!484389 lt!484390 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088041 (and (= lt!484386 lt!484381) (= lt!484381 lt!484386))))

(declare-fun -!803 (ListLongMap!15019 (_ BitVec 64)) ListLongMap!15019)

(assert (=> b!1088041 (= lt!484381 (-!803 lt!484388 k0!904))))

(declare-datatypes ((Unit!35641 0))(
  ( (Unit!35642) )
))
(declare-fun lt!484382 () Unit!35641)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!90 (array!70168 array!70170 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35641)

(assert (=> b!1088041 (= lt!484382 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!90 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4076 (array!70168 array!70170 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) Int) ListLongMap!15019)

(assert (=> b!1088041 (= lt!484386 (getCurrentListMapNoExtraKeys!4076 lt!484389 lt!484390 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2147 (Int (_ BitVec 64)) V!40673)

(assert (=> b!1088041 (= lt!484390 (array!70171 (store (arr!33759 _values!874) i!650 (ValueCellFull!12620 (dynLambda!2147 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34297 _values!874)))))

(assert (=> b!1088041 (= lt!484388 (getCurrentListMapNoExtraKeys!4076 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088041 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484391 () Unit!35641)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70168 (_ BitVec 64) (_ BitVec 32)) Unit!35641)

(assert (=> b!1088041 (= lt!484391 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!725704 () Bool)

(assert (=> start!95998 (=> (not res!725704) (not e!621482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95998 (= res!725704 (validMask!0 mask!1414))))

(assert (=> start!95998 e!621482))

(assert (=> start!95998 tp!79820))

(assert (=> start!95998 true))

(assert (=> start!95998 tp_is_empty!26659))

(declare-fun array_inv!26084 (array!70168) Bool)

(assert (=> start!95998 (array_inv!26084 _keys!1070)))

(declare-fun array_inv!26085 (array!70170) Bool)

(assert (=> start!95998 (and (array_inv!26085 _values!874) e!621481)))

(declare-fun b!1088053 () Bool)

(declare-fun res!725703 () Bool)

(assert (=> b!1088053 (=> (not res!725703) (not e!621482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088053 (= res!725703 (validKeyInArray!0 k0!904))))

(declare-fun b!1088054 () Bool)

(assert (=> b!1088054 (= e!621479 true)))

(assert (=> b!1088054 (= (-!803 lt!484384 k0!904) lt!484380)))

(declare-fun lt!484385 () Unit!35641)

(declare-fun addRemoveCommutativeForDiffKeys!55 (ListLongMap!15019 (_ BitVec 64) V!40673 (_ BitVec 64)) Unit!35641)

(assert (=> b!1088054 (= lt!484385 (addRemoveCommutativeForDiffKeys!55 lt!484388 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (= (and start!95998 res!725704) b!1088050))

(assert (= (and b!1088050 res!725698) b!1088049))

(assert (= (and b!1088049 res!725702) b!1088043))

(assert (= (and b!1088043 res!725696) b!1088044))

(assert (= (and b!1088044 res!725700) b!1088053))

(assert (= (and b!1088053 res!725703) b!1088052))

(assert (= (and b!1088052 res!725706) b!1088046))

(assert (= (and b!1088046 res!725701) b!1088042))

(assert (= (and b!1088042 res!725699) b!1088041))

(assert (= (and b!1088041 (not res!725705)) b!1088048))

(assert (= (and b!1088048 (not res!725697)) b!1088054))

(assert (= (and b!1088045 condMapEmpty!41743) mapIsEmpty!41743))

(assert (= (and b!1088045 (not condMapEmpty!41743)) mapNonEmpty!41743))

(get-info :version)

(assert (= (and mapNonEmpty!41743 ((_ is ValueCellFull!12620) mapValue!41743)) b!1088047))

(assert (= (and b!1088045 ((_ is ValueCellFull!12620) mapDefault!41743)) b!1088051))

(assert (= start!95998 b!1088045))

(declare-fun b_lambda!17305 () Bool)

(assert (=> (not b_lambda!17305) (not b!1088041)))

(declare-fun t!33322 () Bool)

(declare-fun tb!7527 () Bool)

(assert (=> (and start!95998 (= defaultEntry!882 defaultEntry!882) t!33322) tb!7527))

(declare-fun result!15581 () Bool)

(assert (=> tb!7527 (= result!15581 tp_is_empty!26659)))

(assert (=> b!1088041 t!33322))

(declare-fun b_and!35965 () Bool)

(assert (= b_and!35963 (and (=> t!33322 result!15581) b_and!35965)))

(declare-fun m!1006589 () Bool)

(assert (=> b!1088053 m!1006589))

(declare-fun m!1006591 () Bool)

(assert (=> b!1088042 m!1006591))

(declare-fun m!1006593 () Bool)

(assert (=> b!1088043 m!1006593))

(declare-fun m!1006595 () Bool)

(assert (=> start!95998 m!1006595))

(declare-fun m!1006597 () Bool)

(assert (=> start!95998 m!1006597))

(declare-fun m!1006599 () Bool)

(assert (=> start!95998 m!1006599))

(declare-fun m!1006601 () Bool)

(assert (=> b!1088041 m!1006601))

(declare-fun m!1006603 () Bool)

(assert (=> b!1088041 m!1006603))

(declare-fun m!1006605 () Bool)

(assert (=> b!1088041 m!1006605))

(declare-fun m!1006607 () Bool)

(assert (=> b!1088041 m!1006607))

(declare-fun m!1006609 () Bool)

(assert (=> b!1088041 m!1006609))

(declare-fun m!1006611 () Bool)

(assert (=> b!1088041 m!1006611))

(declare-fun m!1006613 () Bool)

(assert (=> b!1088041 m!1006613))

(declare-fun m!1006615 () Bool)

(assert (=> b!1088041 m!1006615))

(declare-fun m!1006617 () Bool)

(assert (=> b!1088041 m!1006617))

(declare-fun m!1006619 () Bool)

(assert (=> b!1088041 m!1006619))

(declare-fun m!1006621 () Bool)

(assert (=> mapNonEmpty!41743 m!1006621))

(declare-fun m!1006623 () Bool)

(assert (=> b!1088052 m!1006623))

(declare-fun m!1006625 () Bool)

(assert (=> b!1088048 m!1006625))

(declare-fun m!1006627 () Bool)

(assert (=> b!1088048 m!1006627))

(declare-fun m!1006629 () Bool)

(assert (=> b!1088048 m!1006629))

(declare-fun m!1006631 () Bool)

(assert (=> b!1088054 m!1006631))

(declare-fun m!1006633 () Bool)

(assert (=> b!1088054 m!1006633))

(declare-fun m!1006635 () Bool)

(assert (=> b!1088049 m!1006635))

(declare-fun m!1006637 () Bool)

(assert (=> b!1088046 m!1006637))

(declare-fun m!1006639 () Bool)

(assert (=> b!1088046 m!1006639))

(check-sat (not b!1088048) (not start!95998) (not b_next!22657) (not b!1088043) tp_is_empty!26659 b_and!35965 (not b!1088049) (not b!1088041) (not mapNonEmpty!41743) (not b!1088053) (not b!1088046) (not b_lambda!17305) (not b!1088054) (not b!1088042))
(check-sat b_and!35965 (not b_next!22657))
