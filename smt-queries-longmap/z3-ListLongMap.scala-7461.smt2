; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94676 () Bool)

(assert start!94676)

(declare-fun b_free!21945 () Bool)

(declare-fun b_next!21945 () Bool)

(assert (=> start!94676 (= b_free!21945 (not b_next!21945))))

(declare-fun tp!77291 () Bool)

(declare-fun b_and!34765 () Bool)

(assert (=> start!94676 (= tp!77291 b_and!34765)))

(declare-fun b!1070445 () Bool)

(declare-fun e!611053 () Bool)

(declare-fun tp_is_empty!25755 () Bool)

(assert (=> b!1070445 (= e!611053 tp_is_empty!25755)))

(declare-fun mapIsEmpty!40336 () Bool)

(declare-fun mapRes!40336 () Bool)

(assert (=> mapIsEmpty!40336 mapRes!40336))

(declare-fun b!1070446 () Bool)

(declare-fun e!611048 () Bool)

(declare-fun e!611050 () Bool)

(assert (=> b!1070446 (= e!611048 (not e!611050))))

(declare-fun res!714132 () Bool)

(assert (=> b!1070446 (=> res!714132 e!611050)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070446 (= res!714132 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39475 0))(
  ( (V!39476 (val!12928 Int)) )
))
(declare-datatypes ((tuple2!16438 0))(
  ( (tuple2!16439 (_1!8230 (_ BitVec 64)) (_2!8230 V!39475)) )
))
(declare-datatypes ((List!22982 0))(
  ( (Nil!22979) (Cons!22978 (h!24187 tuple2!16438) (t!32313 List!22982)) )
))
(declare-datatypes ((ListLongMap!14407 0))(
  ( (ListLongMap!14408 (toList!7219 List!22982)) )
))
(declare-fun lt!473075 () ListLongMap!14407)

(declare-fun lt!473076 () ListLongMap!14407)

(assert (=> b!1070446 (= lt!473075 lt!473076)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39475)

(declare-datatypes ((Unit!35237 0))(
  ( (Unit!35238) )
))
(declare-fun lt!473077 () Unit!35237)

(declare-datatypes ((ValueCell!12174 0))(
  ( (ValueCellFull!12174 (v!15544 V!39475)) (EmptyCell!12174) )
))
(declare-datatypes ((array!68485 0))(
  ( (array!68486 (arr!32939 (Array (_ BitVec 32) ValueCell!12174)) (size!33475 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68485)

(declare-fun minValue!907 () V!39475)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39475)

(declare-datatypes ((array!68487 0))(
  ( (array!68488 (arr!32940 (Array (_ BitVec 32) (_ BitVec 64))) (size!33476 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68487)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!832 (array!68487 array!68485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39475 V!39475 V!39475 V!39475 (_ BitVec 32) Int) Unit!35237)

(assert (=> b!1070446 (= lt!473077 (lemmaNoChangeToArrayThenSameMapNoExtras!832 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3795 (array!68487 array!68485 (_ BitVec 32) (_ BitVec 32) V!39475 V!39475 (_ BitVec 32) Int) ListLongMap!14407)

(assert (=> b!1070446 (= lt!473076 (getCurrentListMapNoExtraKeys!3795 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070446 (= lt!473075 (getCurrentListMapNoExtraKeys!3795 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070447 () Bool)

(declare-fun res!714128 () Bool)

(assert (=> b!1070447 (=> (not res!714128) (not e!611048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68487 (_ BitVec 32)) Bool)

(assert (=> b!1070447 (= res!714128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070448 () Bool)

(declare-fun res!714129 () Bool)

(assert (=> b!1070448 (=> (not res!714129) (not e!611048))))

(assert (=> b!1070448 (= res!714129 (and (= (size!33475 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33476 _keys!1163) (size!33475 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!714131 () Bool)

(assert (=> start!94676 (=> (not res!714131) (not e!611048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94676 (= res!714131 (validMask!0 mask!1515))))

(assert (=> start!94676 e!611048))

(assert (=> start!94676 true))

(assert (=> start!94676 tp_is_empty!25755))

(declare-fun e!611052 () Bool)

(declare-fun array_inv!25480 (array!68485) Bool)

(assert (=> start!94676 (and (array_inv!25480 _values!955) e!611052)))

(assert (=> start!94676 tp!77291))

(declare-fun array_inv!25481 (array!68487) Bool)

(assert (=> start!94676 (array_inv!25481 _keys!1163)))

(declare-fun b!1070449 () Bool)

(declare-fun res!714130 () Bool)

(assert (=> b!1070449 (=> (not res!714130) (not e!611048))))

(declare-datatypes ((List!22983 0))(
  ( (Nil!22980) (Cons!22979 (h!24188 (_ BitVec 64)) (t!32314 List!22983)) )
))
(declare-fun arrayNoDuplicates!0 (array!68487 (_ BitVec 32) List!22983) Bool)

(assert (=> b!1070449 (= res!714130 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22980))))

(declare-fun b!1070450 () Bool)

(assert (=> b!1070450 (= e!611052 (and e!611053 mapRes!40336))))

(declare-fun condMapEmpty!40336 () Bool)

(declare-fun mapDefault!40336 () ValueCell!12174)

(assert (=> b!1070450 (= condMapEmpty!40336 (= (arr!32939 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12174)) mapDefault!40336)))))

(declare-fun mapNonEmpty!40336 () Bool)

(declare-fun tp!77290 () Bool)

(declare-fun e!611051 () Bool)

(assert (=> mapNonEmpty!40336 (= mapRes!40336 (and tp!77290 e!611051))))

(declare-fun mapValue!40336 () ValueCell!12174)

(declare-fun mapKey!40336 () (_ BitVec 32))

(declare-fun mapRest!40336 () (Array (_ BitVec 32) ValueCell!12174))

(assert (=> mapNonEmpty!40336 (= (arr!32939 _values!955) (store mapRest!40336 mapKey!40336 mapValue!40336))))

(declare-fun b!1070451 () Bool)

(assert (=> b!1070451 (= e!611050 true)))

(declare-fun lt!473074 () ListLongMap!14407)

(declare-fun getCurrentListMap!4122 (array!68487 array!68485 (_ BitVec 32) (_ BitVec 32) V!39475 V!39475 (_ BitVec 32) Int) ListLongMap!14407)

(assert (=> b!1070451 (= lt!473074 (getCurrentListMap!4122 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070452 () Bool)

(assert (=> b!1070452 (= e!611051 tp_is_empty!25755)))

(assert (= (and start!94676 res!714131) b!1070448))

(assert (= (and b!1070448 res!714129) b!1070447))

(assert (= (and b!1070447 res!714128) b!1070449))

(assert (= (and b!1070449 res!714130) b!1070446))

(assert (= (and b!1070446 (not res!714132)) b!1070451))

(assert (= (and b!1070450 condMapEmpty!40336) mapIsEmpty!40336))

(assert (= (and b!1070450 (not condMapEmpty!40336)) mapNonEmpty!40336))

(get-info :version)

(assert (= (and mapNonEmpty!40336 ((_ is ValueCellFull!12174) mapValue!40336)) b!1070452))

(assert (= (and b!1070450 ((_ is ValueCellFull!12174) mapDefault!40336)) b!1070445))

(assert (= start!94676 b!1070450))

(declare-fun m!988793 () Bool)

(assert (=> b!1070447 m!988793))

(declare-fun m!988795 () Bool)

(assert (=> b!1070451 m!988795))

(declare-fun m!988797 () Bool)

(assert (=> start!94676 m!988797))

(declare-fun m!988799 () Bool)

(assert (=> start!94676 m!988799))

(declare-fun m!988801 () Bool)

(assert (=> start!94676 m!988801))

(declare-fun m!988803 () Bool)

(assert (=> b!1070446 m!988803))

(declare-fun m!988805 () Bool)

(assert (=> b!1070446 m!988805))

(declare-fun m!988807 () Bool)

(assert (=> b!1070446 m!988807))

(declare-fun m!988809 () Bool)

(assert (=> b!1070449 m!988809))

(declare-fun m!988811 () Bool)

(assert (=> mapNonEmpty!40336 m!988811))

(check-sat (not b!1070451) (not b!1070447) (not b!1070446) tp_is_empty!25755 (not start!94676) (not mapNonEmpty!40336) (not b_next!21945) (not b!1070449) b_and!34765)
(check-sat b_and!34765 (not b_next!21945))
