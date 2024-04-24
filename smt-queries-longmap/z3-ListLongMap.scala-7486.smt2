; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95124 () Bool)

(assert start!95124)

(declare-fun b_free!22093 () Bool)

(declare-fun b_next!22093 () Bool)

(assert (=> start!95124 (= b_free!22093 (not b_next!22093))))

(declare-fun tp!77743 () Bool)

(declare-fun b_and!34957 () Bool)

(assert (=> start!95124 (= tp!77743 b_and!34957)))

(declare-fun b!1074249 () Bool)

(declare-fun e!613746 () Bool)

(declare-fun tp_is_empty!25903 () Bool)

(assert (=> b!1074249 (= e!613746 tp_is_empty!25903)))

(declare-fun b!1074250 () Bool)

(declare-fun e!613748 () Bool)

(declare-fun mapRes!40567 () Bool)

(assert (=> b!1074250 (= e!613748 (and e!613746 mapRes!40567))))

(declare-fun condMapEmpty!40567 () Bool)

(declare-datatypes ((V!39673 0))(
  ( (V!39674 (val!13002 Int)) )
))
(declare-datatypes ((ValueCell!12248 0))(
  ( (ValueCellFull!12248 (v!15616 V!39673)) (EmptyCell!12248) )
))
(declare-datatypes ((array!68817 0))(
  ( (array!68818 (arr!33096 (Array (_ BitVec 32) ValueCell!12248)) (size!33633 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68817)

(declare-fun mapDefault!40567 () ValueCell!12248)

(assert (=> b!1074250 (= condMapEmpty!40567 (= (arr!33096 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12248)) mapDefault!40567)))))

(declare-fun b!1074251 () Bool)

(declare-fun res!716170 () Bool)

(declare-fun e!613745 () Bool)

(assert (=> b!1074251 (=> (not res!716170) (not e!613745))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68819 0))(
  ( (array!68820 (arr!33097 (Array (_ BitVec 32) (_ BitVec 64))) (size!33634 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68819)

(assert (=> b!1074251 (= res!716170 (and (= (size!33633 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33634 _keys!1163) (size!33633 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40567 () Bool)

(declare-fun tp!77744 () Bool)

(declare-fun e!613744 () Bool)

(assert (=> mapNonEmpty!40567 (= mapRes!40567 (and tp!77744 e!613744))))

(declare-fun mapKey!40567 () (_ BitVec 32))

(declare-fun mapRest!40567 () (Array (_ BitVec 32) ValueCell!12248))

(declare-fun mapValue!40567 () ValueCell!12248)

(assert (=> mapNonEmpty!40567 (= (arr!33096 _values!955) (store mapRest!40567 mapKey!40567 mapValue!40567))))

(declare-fun b!1074252 () Bool)

(declare-fun res!716168 () Bool)

(assert (=> b!1074252 (=> (not res!716168) (not e!613745))))

(declare-datatypes ((List!23095 0))(
  ( (Nil!23092) (Cons!23091 (h!24309 (_ BitVec 64)) (t!32424 List!23095)) )
))
(declare-fun arrayNoDuplicates!0 (array!68819 (_ BitVec 32) List!23095) Bool)

(assert (=> b!1074252 (= res!716168 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23092))))

(declare-fun res!716167 () Bool)

(assert (=> start!95124 (=> (not res!716167) (not e!613745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95124 (= res!716167 (validMask!0 mask!1515))))

(assert (=> start!95124 e!613745))

(assert (=> start!95124 true))

(assert (=> start!95124 tp_is_empty!25903))

(declare-fun array_inv!25618 (array!68817) Bool)

(assert (=> start!95124 (and (array_inv!25618 _values!955) e!613748)))

(assert (=> start!95124 tp!77743))

(declare-fun array_inv!25619 (array!68819) Bool)

(assert (=> start!95124 (array_inv!25619 _keys!1163)))

(declare-fun b!1074253 () Bool)

(assert (=> b!1074253 (= e!613745 false)))

(declare-datatypes ((tuple2!16540 0))(
  ( (tuple2!16541 (_1!8281 (_ BitVec 64)) (_2!8281 V!39673)) )
))
(declare-datatypes ((List!23096 0))(
  ( (Nil!23093) (Cons!23092 (h!24310 tuple2!16540) (t!32425 List!23096)) )
))
(declare-datatypes ((ListLongMap!14517 0))(
  ( (ListLongMap!14518 (toList!7274 List!23096)) )
))
(declare-fun lt!476414 () ListLongMap!14517)

(declare-fun minValue!907 () V!39673)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39673)

(declare-fun getCurrentListMapNoExtraKeys!3872 (array!68819 array!68817 (_ BitVec 32) (_ BitVec 32) V!39673 V!39673 (_ BitVec 32) Int) ListLongMap!14517)

(assert (=> b!1074253 (= lt!476414 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39673)

(declare-fun lt!476415 () ListLongMap!14517)

(assert (=> b!1074253 (= lt!476415 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40567 () Bool)

(assert (=> mapIsEmpty!40567 mapRes!40567))

(declare-fun b!1074254 () Bool)

(declare-fun res!716169 () Bool)

(assert (=> b!1074254 (=> (not res!716169) (not e!613745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68819 (_ BitVec 32)) Bool)

(assert (=> b!1074254 (= res!716169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074255 () Bool)

(assert (=> b!1074255 (= e!613744 tp_is_empty!25903)))

(assert (= (and start!95124 res!716167) b!1074251))

(assert (= (and b!1074251 res!716170) b!1074254))

(assert (= (and b!1074254 res!716169) b!1074252))

(assert (= (and b!1074252 res!716168) b!1074253))

(assert (= (and b!1074250 condMapEmpty!40567) mapIsEmpty!40567))

(assert (= (and b!1074250 (not condMapEmpty!40567)) mapNonEmpty!40567))

(get-info :version)

(assert (= (and mapNonEmpty!40567 ((_ is ValueCellFull!12248) mapValue!40567)) b!1074255))

(assert (= (and b!1074250 ((_ is ValueCellFull!12248) mapDefault!40567)) b!1074249))

(assert (= start!95124 b!1074250))

(declare-fun m!993703 () Bool)

(assert (=> start!95124 m!993703))

(declare-fun m!993705 () Bool)

(assert (=> start!95124 m!993705))

(declare-fun m!993707 () Bool)

(assert (=> start!95124 m!993707))

(declare-fun m!993709 () Bool)

(assert (=> mapNonEmpty!40567 m!993709))

(declare-fun m!993711 () Bool)

(assert (=> b!1074253 m!993711))

(declare-fun m!993713 () Bool)

(assert (=> b!1074253 m!993713))

(declare-fun m!993715 () Bool)

(assert (=> b!1074252 m!993715))

(declare-fun m!993717 () Bool)

(assert (=> b!1074254 m!993717))

(check-sat (not b_next!22093) (not b!1074253) b_and!34957 (not b!1074254) (not mapNonEmpty!40567) (not start!95124) tp_is_empty!25903 (not b!1074252))
(check-sat b_and!34957 (not b_next!22093))
