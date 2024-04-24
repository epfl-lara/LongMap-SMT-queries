; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70178 () Bool)

(assert start!70178)

(declare-fun b_free!12433 () Bool)

(declare-fun b_next!12433 () Bool)

(assert (=> start!70178 (= b_free!12433 (not b_next!12433))))

(declare-fun tp!44014 () Bool)

(declare-fun b_and!21215 () Bool)

(assert (=> start!70178 (= tp!44014 b_and!21215)))

(declare-fun b!814595 () Bool)

(declare-fun res!556202 () Bool)

(declare-fun e!451508 () Bool)

(assert (=> b!814595 (=> (not res!556202) (not e!451508))))

(declare-datatypes ((array!44501 0))(
  ( (array!44502 (arr!21306 (Array (_ BitVec 32) (_ BitVec 64))) (size!21726 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44501)

(declare-datatypes ((List!15065 0))(
  ( (Nil!15062) (Cons!15061 (h!16196 (_ BitVec 64)) (t!21374 List!15065)) )
))
(declare-fun arrayNoDuplicates!0 (array!44501 (_ BitVec 32) List!15065) Bool)

(assert (=> b!814595 (= res!556202 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15062))))

(declare-fun mapIsEmpty!22795 () Bool)

(declare-fun mapRes!22795 () Bool)

(assert (=> mapIsEmpty!22795 mapRes!22795))

(declare-fun res!556203 () Bool)

(assert (=> start!70178 (=> (not res!556203) (not e!451508))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70178 (= res!556203 (validMask!0 mask!1312))))

(assert (=> start!70178 e!451508))

(declare-fun tp_is_empty!14143 () Bool)

(assert (=> start!70178 tp_is_empty!14143))

(declare-fun array_inv!17113 (array!44501) Bool)

(assert (=> start!70178 (array_inv!17113 _keys!976)))

(assert (=> start!70178 true))

(declare-datatypes ((V!23859 0))(
  ( (V!23860 (val!7119 Int)) )
))
(declare-datatypes ((ValueCell!6656 0))(
  ( (ValueCellFull!6656 (v!9546 V!23859)) (EmptyCell!6656) )
))
(declare-datatypes ((array!44503 0))(
  ( (array!44504 (arr!21307 (Array (_ BitVec 32) ValueCell!6656)) (size!21727 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44503)

(declare-fun e!451507 () Bool)

(declare-fun array_inv!17114 (array!44503) Bool)

(assert (=> start!70178 (and (array_inv!17114 _values!788) e!451507)))

(assert (=> start!70178 tp!44014))

(declare-fun mapNonEmpty!22795 () Bool)

(declare-fun tp!44013 () Bool)

(declare-fun e!451511 () Bool)

(assert (=> mapNonEmpty!22795 (= mapRes!22795 (and tp!44013 e!451511))))

(declare-fun mapValue!22795 () ValueCell!6656)

(declare-fun mapKey!22795 () (_ BitVec 32))

(declare-fun mapRest!22795 () (Array (_ BitVec 32) ValueCell!6656))

(assert (=> mapNonEmpty!22795 (= (arr!21307 _values!788) (store mapRest!22795 mapKey!22795 mapValue!22795))))

(declare-fun b!814596 () Bool)

(assert (=> b!814596 (= e!451508 false)))

(declare-fun zeroValueAfter!34 () V!23859)

(declare-fun minValue!754 () V!23859)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9248 0))(
  ( (tuple2!9249 (_1!4635 (_ BitVec 64)) (_2!4635 V!23859)) )
))
(declare-datatypes ((List!15066 0))(
  ( (Nil!15063) (Cons!15062 (h!16197 tuple2!9248) (t!21375 List!15066)) )
))
(declare-datatypes ((ListLongMap!8073 0))(
  ( (ListLongMap!8074 (toList!4052 List!15066)) )
))
(declare-fun lt!364724 () ListLongMap!8073)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2159 (array!44501 array!44503 (_ BitVec 32) (_ BitVec 32) V!23859 V!23859 (_ BitVec 32) Int) ListLongMap!8073)

(assert (=> b!814596 (= lt!364724 (getCurrentListMapNoExtraKeys!2159 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23859)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364725 () ListLongMap!8073)

(assert (=> b!814596 (= lt!364725 (getCurrentListMapNoExtraKeys!2159 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814597 () Bool)

(declare-fun res!556201 () Bool)

(assert (=> b!814597 (=> (not res!556201) (not e!451508))))

(assert (=> b!814597 (= res!556201 (and (= (size!21727 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21726 _keys!976) (size!21727 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814598 () Bool)

(declare-fun e!451509 () Bool)

(assert (=> b!814598 (= e!451507 (and e!451509 mapRes!22795))))

(declare-fun condMapEmpty!22795 () Bool)

(declare-fun mapDefault!22795 () ValueCell!6656)

(assert (=> b!814598 (= condMapEmpty!22795 (= (arr!21307 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6656)) mapDefault!22795)))))

(declare-fun b!814599 () Bool)

(declare-fun res!556204 () Bool)

(assert (=> b!814599 (=> (not res!556204) (not e!451508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44501 (_ BitVec 32)) Bool)

(assert (=> b!814599 (= res!556204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814600 () Bool)

(assert (=> b!814600 (= e!451511 tp_is_empty!14143)))

(declare-fun b!814601 () Bool)

(assert (=> b!814601 (= e!451509 tp_is_empty!14143)))

(assert (= (and start!70178 res!556203) b!814597))

(assert (= (and b!814597 res!556201) b!814599))

(assert (= (and b!814599 res!556204) b!814595))

(assert (= (and b!814595 res!556202) b!814596))

(assert (= (and b!814598 condMapEmpty!22795) mapIsEmpty!22795))

(assert (= (and b!814598 (not condMapEmpty!22795)) mapNonEmpty!22795))

(get-info :version)

(assert (= (and mapNonEmpty!22795 ((_ is ValueCellFull!6656) mapValue!22795)) b!814600))

(assert (= (and b!814598 ((_ is ValueCellFull!6656) mapDefault!22795)) b!814601))

(assert (= start!70178 b!814598))

(declare-fun m!756951 () Bool)

(assert (=> mapNonEmpty!22795 m!756951))

(declare-fun m!756953 () Bool)

(assert (=> start!70178 m!756953))

(declare-fun m!756955 () Bool)

(assert (=> start!70178 m!756955))

(declare-fun m!756957 () Bool)

(assert (=> start!70178 m!756957))

(declare-fun m!756959 () Bool)

(assert (=> b!814596 m!756959))

(declare-fun m!756961 () Bool)

(assert (=> b!814596 m!756961))

(declare-fun m!756963 () Bool)

(assert (=> b!814599 m!756963))

(declare-fun m!756965 () Bool)

(assert (=> b!814595 m!756965))

(check-sat (not b!814596) (not b!814599) (not b_next!12433) b_and!21215 tp_is_empty!14143 (not b!814595) (not mapNonEmpty!22795) (not start!70178))
(check-sat b_and!21215 (not b_next!12433))
