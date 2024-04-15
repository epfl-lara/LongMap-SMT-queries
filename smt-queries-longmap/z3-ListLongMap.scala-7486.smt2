; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94882 () Bool)

(assert start!94882)

(declare-fun b_free!22093 () Bool)

(declare-fun b_next!22093 () Bool)

(assert (=> start!94882 (= b_free!22093 (not b_next!22093))))

(declare-fun tp!77744 () Bool)

(declare-fun b_and!34921 () Bool)

(assert (=> start!94882 (= tp!77744 b_and!34921)))

(declare-fun b!1072769 () Bool)

(declare-fun e!612797 () Bool)

(assert (=> b!1072769 (= e!612797 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39673 0))(
  ( (V!39674 (val!13002 Int)) )
))
(declare-datatypes ((ValueCell!12248 0))(
  ( (ValueCellFull!12248 (v!15619 V!39673)) (EmptyCell!12248) )
))
(declare-datatypes ((array!68712 0))(
  ( (array!68713 (arr!33050 (Array (_ BitVec 32) ValueCell!12248)) (size!33588 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68712)

(declare-fun minValue!907 () V!39673)

(declare-datatypes ((array!68714 0))(
  ( (array!68715 (arr!33051 (Array (_ BitVec 32) (_ BitVec 64))) (size!33589 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68714)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((tuple2!16616 0))(
  ( (tuple2!16617 (_1!8319 (_ BitVec 64)) (_2!8319 V!39673)) )
))
(declare-datatypes ((List!23140 0))(
  ( (Nil!23137) (Cons!23136 (h!24345 tuple2!16616) (t!32468 List!23140)) )
))
(declare-datatypes ((ListLongMap!14585 0))(
  ( (ListLongMap!14586 (toList!7308 List!23140)) )
))
(declare-fun lt!475700 () ListLongMap!14585)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39673)

(declare-fun getCurrentListMapNoExtraKeys!3888 (array!68714 array!68712 (_ BitVec 32) (_ BitVec 32) V!39673 V!39673 (_ BitVec 32) Int) ListLongMap!14585)

(assert (=> b!1072769 (= lt!475700 (getCurrentListMapNoExtraKeys!3888 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39673)

(declare-fun lt!475699 () ListLongMap!14585)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072769 (= lt!475699 (getCurrentListMapNoExtraKeys!3888 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072770 () Bool)

(declare-fun e!612799 () Bool)

(declare-fun tp_is_empty!25903 () Bool)

(assert (=> b!1072770 (= e!612799 tp_is_empty!25903)))

(declare-fun b!1072771 () Bool)

(declare-fun res!715579 () Bool)

(assert (=> b!1072771 (=> (not res!715579) (not e!612797))))

(assert (=> b!1072771 (= res!715579 (and (= (size!33588 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33589 _keys!1163) (size!33588 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072772 () Bool)

(declare-fun res!715577 () Bool)

(assert (=> b!1072772 (=> (not res!715577) (not e!612797))))

(declare-datatypes ((List!23141 0))(
  ( (Nil!23138) (Cons!23137 (h!24346 (_ BitVec 64)) (t!32469 List!23141)) )
))
(declare-fun arrayNoDuplicates!0 (array!68714 (_ BitVec 32) List!23141) Bool)

(assert (=> b!1072772 (= res!715577 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23138))))

(declare-fun b!1072773 () Bool)

(declare-fun res!715576 () Bool)

(assert (=> b!1072773 (=> (not res!715576) (not e!612797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68714 (_ BitVec 32)) Bool)

(assert (=> b!1072773 (= res!715576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40567 () Bool)

(declare-fun mapRes!40567 () Bool)

(assert (=> mapIsEmpty!40567 mapRes!40567))

(declare-fun mapNonEmpty!40567 () Bool)

(declare-fun tp!77743 () Bool)

(assert (=> mapNonEmpty!40567 (= mapRes!40567 (and tp!77743 e!612799))))

(declare-fun mapValue!40567 () ValueCell!12248)

(declare-fun mapKey!40567 () (_ BitVec 32))

(declare-fun mapRest!40567 () (Array (_ BitVec 32) ValueCell!12248))

(assert (=> mapNonEmpty!40567 (= (arr!33050 _values!955) (store mapRest!40567 mapKey!40567 mapValue!40567))))

(declare-fun res!715578 () Bool)

(assert (=> start!94882 (=> (not res!715578) (not e!612797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94882 (= res!715578 (validMask!0 mask!1515))))

(assert (=> start!94882 e!612797))

(assert (=> start!94882 true))

(assert (=> start!94882 tp_is_empty!25903))

(declare-fun e!612800 () Bool)

(declare-fun array_inv!25568 (array!68712) Bool)

(assert (=> start!94882 (and (array_inv!25568 _values!955) e!612800)))

(assert (=> start!94882 tp!77744))

(declare-fun array_inv!25569 (array!68714) Bool)

(assert (=> start!94882 (array_inv!25569 _keys!1163)))

(declare-fun b!1072774 () Bool)

(declare-fun e!612798 () Bool)

(assert (=> b!1072774 (= e!612798 tp_is_empty!25903)))

(declare-fun b!1072775 () Bool)

(assert (=> b!1072775 (= e!612800 (and e!612798 mapRes!40567))))

(declare-fun condMapEmpty!40567 () Bool)

(declare-fun mapDefault!40567 () ValueCell!12248)

(assert (=> b!1072775 (= condMapEmpty!40567 (= (arr!33050 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12248)) mapDefault!40567)))))

(assert (= (and start!94882 res!715578) b!1072771))

(assert (= (and b!1072771 res!715579) b!1072773))

(assert (= (and b!1072773 res!715576) b!1072772))

(assert (= (and b!1072772 res!715577) b!1072769))

(assert (= (and b!1072775 condMapEmpty!40567) mapIsEmpty!40567))

(assert (= (and b!1072775 (not condMapEmpty!40567)) mapNonEmpty!40567))

(get-info :version)

(assert (= (and mapNonEmpty!40567 ((_ is ValueCellFull!12248) mapValue!40567)) b!1072770))

(assert (= (and b!1072775 ((_ is ValueCellFull!12248) mapDefault!40567)) b!1072774))

(assert (= start!94882 b!1072775))

(declare-fun m!991405 () Bool)

(assert (=> start!94882 m!991405))

(declare-fun m!991407 () Bool)

(assert (=> start!94882 m!991407))

(declare-fun m!991409 () Bool)

(assert (=> start!94882 m!991409))

(declare-fun m!991411 () Bool)

(assert (=> b!1072772 m!991411))

(declare-fun m!991413 () Bool)

(assert (=> b!1072769 m!991413))

(declare-fun m!991415 () Bool)

(assert (=> b!1072769 m!991415))

(declare-fun m!991417 () Bool)

(assert (=> mapNonEmpty!40567 m!991417))

(declare-fun m!991419 () Bool)

(assert (=> b!1072773 m!991419))

(check-sat b_and!34921 (not b!1072769) (not b_next!22093) (not start!94882) (not b!1072772) (not b!1072773) (not mapNonEmpty!40567) tp_is_empty!25903)
(check-sat b_and!34921 (not b_next!22093))
