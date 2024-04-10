; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94502 () Bool)

(assert start!94502)

(declare-fun b_free!21807 () Bool)

(declare-fun b_next!21807 () Bool)

(assert (=> start!94502 (= b_free!21807 (not b_next!21807))))

(declare-fun tp!76870 () Bool)

(declare-fun b_and!34609 () Bool)

(assert (=> start!94502 (= tp!76870 b_and!34609)))

(declare-fun b!1068552 () Bool)

(declare-fun e!609658 () Bool)

(declare-fun tp_is_empty!25617 () Bool)

(assert (=> b!1068552 (= e!609658 tp_is_empty!25617)))

(declare-fun res!713011 () Bool)

(declare-fun e!609661 () Bool)

(assert (=> start!94502 (=> (not res!713011) (not e!609661))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94502 (= res!713011 (validMask!0 mask!1515))))

(assert (=> start!94502 e!609661))

(assert (=> start!94502 true))

(assert (=> start!94502 tp_is_empty!25617))

(declare-datatypes ((V!39291 0))(
  ( (V!39292 (val!12859 Int)) )
))
(declare-datatypes ((ValueCell!12105 0))(
  ( (ValueCellFull!12105 (v!15474 V!39291)) (EmptyCell!12105) )
))
(declare-datatypes ((array!68215 0))(
  ( (array!68216 (arr!32806 (Array (_ BitVec 32) ValueCell!12105)) (size!33342 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68215)

(declare-fun e!609659 () Bool)

(declare-fun array_inv!25396 (array!68215) Bool)

(assert (=> start!94502 (and (array_inv!25396 _values!955) e!609659)))

(assert (=> start!94502 tp!76870))

(declare-datatypes ((array!68217 0))(
  ( (array!68218 (arr!32807 (Array (_ BitVec 32) (_ BitVec 64))) (size!33343 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68217)

(declare-fun array_inv!25397 (array!68217) Bool)

(assert (=> start!94502 (array_inv!25397 _keys!1163)))

(declare-fun b!1068553 () Bool)

(declare-fun res!713007 () Bool)

(assert (=> b!1068553 (=> (not res!713007) (not e!609661))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068553 (= res!713007 (and (= (size!33342 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33343 _keys!1163) (size!33342 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40123 () Bool)

(declare-fun mapRes!40123 () Bool)

(declare-fun tp!76871 () Bool)

(declare-fun e!609662 () Bool)

(assert (=> mapNonEmpty!40123 (= mapRes!40123 (and tp!76871 e!609662))))

(declare-fun mapValue!40123 () ValueCell!12105)

(declare-fun mapKey!40123 () (_ BitVec 32))

(declare-fun mapRest!40123 () (Array (_ BitVec 32) ValueCell!12105))

(assert (=> mapNonEmpty!40123 (= (arr!32806 _values!955) (store mapRest!40123 mapKey!40123 mapValue!40123))))

(declare-fun b!1068554 () Bool)

(assert (=> b!1068554 (= e!609662 tp_is_empty!25617)))

(declare-fun b!1068555 () Bool)

(declare-fun e!609657 () Bool)

(assert (=> b!1068555 (= e!609661 (not e!609657))))

(declare-fun res!713009 () Bool)

(assert (=> b!1068555 (=> res!713009 e!609657)))

(assert (=> b!1068555 (= res!713009 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16334 0))(
  ( (tuple2!16335 (_1!8178 (_ BitVec 64)) (_2!8178 V!39291)) )
))
(declare-datatypes ((List!22884 0))(
  ( (Nil!22881) (Cons!22880 (h!24089 tuple2!16334) (t!32211 List!22884)) )
))
(declare-datatypes ((ListLongMap!14303 0))(
  ( (ListLongMap!14304 (toList!7167 List!22884)) )
))
(declare-fun lt!472089 () ListLongMap!14303)

(declare-fun lt!472087 () ListLongMap!14303)

(assert (=> b!1068555 (= lt!472089 lt!472087)))

(declare-fun zeroValueBefore!47 () V!39291)

(declare-datatypes ((Unit!35133 0))(
  ( (Unit!35134) )
))
(declare-fun lt!472091 () Unit!35133)

(declare-fun minValue!907 () V!39291)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39291)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!784 (array!68217 array!68215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39291 V!39291 V!39291 V!39291 (_ BitVec 32) Int) Unit!35133)

(assert (=> b!1068555 (= lt!472091 (lemmaNoChangeToArrayThenSameMapNoExtras!784 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3747 (array!68217 array!68215 (_ BitVec 32) (_ BitVec 32) V!39291 V!39291 (_ BitVec 32) Int) ListLongMap!14303)

(assert (=> b!1068555 (= lt!472087 (getCurrentListMapNoExtraKeys!3747 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068555 (= lt!472089 (getCurrentListMapNoExtraKeys!3747 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068556 () Bool)

(declare-fun e!609656 () Bool)

(assert (=> b!1068556 (= e!609656 true)))

(declare-fun lt!472090 () ListLongMap!14303)

(declare-fun -!650 (ListLongMap!14303 (_ BitVec 64)) ListLongMap!14303)

(assert (=> b!1068556 (= (-!650 lt!472090 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472090)))

(declare-fun lt!472088 () Unit!35133)

(declare-fun removeNotPresentStillSame!60 (ListLongMap!14303 (_ BitVec 64)) Unit!35133)

(assert (=> b!1068556 (= lt!472088 (removeNotPresentStillSame!60 lt!472090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068557 () Bool)

(declare-fun res!713008 () Bool)

(assert (=> b!1068557 (=> (not res!713008) (not e!609661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68217 (_ BitVec 32)) Bool)

(assert (=> b!1068557 (= res!713008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068558 () Bool)

(declare-fun res!713006 () Bool)

(assert (=> b!1068558 (=> (not res!713006) (not e!609661))))

(declare-datatypes ((List!22885 0))(
  ( (Nil!22882) (Cons!22881 (h!24090 (_ BitVec 64)) (t!32212 List!22885)) )
))
(declare-fun arrayNoDuplicates!0 (array!68217 (_ BitVec 32) List!22885) Bool)

(assert (=> b!1068558 (= res!713006 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22882))))

(declare-fun mapIsEmpty!40123 () Bool)

(assert (=> mapIsEmpty!40123 mapRes!40123))

(declare-fun b!1068559 () Bool)

(assert (=> b!1068559 (= e!609657 e!609656)))

(declare-fun res!713010 () Bool)

(assert (=> b!1068559 (=> res!713010 e!609656)))

(declare-fun contains!6298 (ListLongMap!14303 (_ BitVec 64)) Bool)

(assert (=> b!1068559 (= res!713010 (contains!6298 lt!472090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4094 (array!68217 array!68215 (_ BitVec 32) (_ BitVec 32) V!39291 V!39291 (_ BitVec 32) Int) ListLongMap!14303)

(assert (=> b!1068559 (= lt!472090 (getCurrentListMap!4094 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068560 () Bool)

(assert (=> b!1068560 (= e!609659 (and e!609658 mapRes!40123))))

(declare-fun condMapEmpty!40123 () Bool)

(declare-fun mapDefault!40123 () ValueCell!12105)

(assert (=> b!1068560 (= condMapEmpty!40123 (= (arr!32806 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12105)) mapDefault!40123)))))

(assert (= (and start!94502 res!713011) b!1068553))

(assert (= (and b!1068553 res!713007) b!1068557))

(assert (= (and b!1068557 res!713008) b!1068558))

(assert (= (and b!1068558 res!713006) b!1068555))

(assert (= (and b!1068555 (not res!713009)) b!1068559))

(assert (= (and b!1068559 (not res!713010)) b!1068556))

(assert (= (and b!1068560 condMapEmpty!40123) mapIsEmpty!40123))

(assert (= (and b!1068560 (not condMapEmpty!40123)) mapNonEmpty!40123))

(get-info :version)

(assert (= (and mapNonEmpty!40123 ((_ is ValueCellFull!12105) mapValue!40123)) b!1068554))

(assert (= (and b!1068560 ((_ is ValueCellFull!12105) mapDefault!40123)) b!1068552))

(assert (= start!94502 b!1068560))

(declare-fun m!987119 () Bool)

(assert (=> b!1068556 m!987119))

(declare-fun m!987121 () Bool)

(assert (=> b!1068556 m!987121))

(declare-fun m!987123 () Bool)

(assert (=> b!1068558 m!987123))

(declare-fun m!987125 () Bool)

(assert (=> b!1068557 m!987125))

(declare-fun m!987127 () Bool)

(assert (=> mapNonEmpty!40123 m!987127))

(declare-fun m!987129 () Bool)

(assert (=> b!1068559 m!987129))

(declare-fun m!987131 () Bool)

(assert (=> b!1068559 m!987131))

(declare-fun m!987133 () Bool)

(assert (=> b!1068555 m!987133))

(declare-fun m!987135 () Bool)

(assert (=> b!1068555 m!987135))

(declare-fun m!987137 () Bool)

(assert (=> b!1068555 m!987137))

(declare-fun m!987139 () Bool)

(assert (=> start!94502 m!987139))

(declare-fun m!987141 () Bool)

(assert (=> start!94502 m!987141))

(declare-fun m!987143 () Bool)

(assert (=> start!94502 m!987143))

(check-sat (not b_next!21807) (not b!1068556) (not b!1068558) (not b!1068557) (not mapNonEmpty!40123) (not b!1068559) (not b!1068555) tp_is_empty!25617 b_and!34609 (not start!94502))
(check-sat b_and!34609 (not b_next!21807))
