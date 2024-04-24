; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70172 () Bool)

(assert start!70172)

(declare-fun b_free!12427 () Bool)

(declare-fun b_next!12427 () Bool)

(assert (=> start!70172 (= b_free!12427 (not b_next!12427))))

(declare-fun tp!43996 () Bool)

(declare-fun b_and!21209 () Bool)

(assert (=> start!70172 (= tp!43996 b_and!21209)))

(declare-fun mapIsEmpty!22786 () Bool)

(declare-fun mapRes!22786 () Bool)

(assert (=> mapIsEmpty!22786 mapRes!22786))

(declare-fun b!814532 () Bool)

(declare-fun e!451462 () Bool)

(declare-fun tp_is_empty!14137 () Bool)

(assert (=> b!814532 (= e!451462 tp_is_empty!14137)))

(declare-fun b!814533 () Bool)

(declare-fun res!556168 () Bool)

(declare-fun e!451465 () Bool)

(assert (=> b!814533 (=> (not res!556168) (not e!451465))))

(declare-datatypes ((array!44489 0))(
  ( (array!44490 (arr!21300 (Array (_ BitVec 32) (_ BitVec 64))) (size!21720 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44489)

(declare-datatypes ((List!15060 0))(
  ( (Nil!15057) (Cons!15056 (h!16191 (_ BitVec 64)) (t!21369 List!15060)) )
))
(declare-fun arrayNoDuplicates!0 (array!44489 (_ BitVec 32) List!15060) Bool)

(assert (=> b!814533 (= res!556168 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15057))))

(declare-fun b!814534 () Bool)

(declare-fun e!451464 () Bool)

(declare-fun e!451466 () Bool)

(assert (=> b!814534 (= e!451464 (and e!451466 mapRes!22786))))

(declare-fun condMapEmpty!22786 () Bool)

(declare-datatypes ((V!23851 0))(
  ( (V!23852 (val!7116 Int)) )
))
(declare-datatypes ((ValueCell!6653 0))(
  ( (ValueCellFull!6653 (v!9543 V!23851)) (EmptyCell!6653) )
))
(declare-datatypes ((array!44491 0))(
  ( (array!44492 (arr!21301 (Array (_ BitVec 32) ValueCell!6653)) (size!21721 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44491)

(declare-fun mapDefault!22786 () ValueCell!6653)

(assert (=> b!814534 (= condMapEmpty!22786 (= (arr!21301 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6653)) mapDefault!22786)))))

(declare-fun b!814535 () Bool)

(declare-fun res!556166 () Bool)

(assert (=> b!814535 (=> (not res!556166) (not e!451465))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814535 (= res!556166 (and (= (size!21721 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21720 _keys!976) (size!21721 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814536 () Bool)

(declare-fun res!556165 () Bool)

(assert (=> b!814536 (=> (not res!556165) (not e!451465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44489 (_ BitVec 32)) Bool)

(assert (=> b!814536 (= res!556165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814537 () Bool)

(assert (=> b!814537 (= e!451466 tp_is_empty!14137)))

(declare-fun b!814538 () Bool)

(assert (=> b!814538 (= e!451465 false)))

(declare-fun minValue!754 () V!23851)

(declare-datatypes ((tuple2!9242 0))(
  ( (tuple2!9243 (_1!4632 (_ BitVec 64)) (_2!4632 V!23851)) )
))
(declare-datatypes ((List!15061 0))(
  ( (Nil!15058) (Cons!15057 (h!16192 tuple2!9242) (t!21370 List!15061)) )
))
(declare-datatypes ((ListLongMap!8067 0))(
  ( (ListLongMap!8068 (toList!4049 List!15061)) )
))
(declare-fun lt!364706 () ListLongMap!8067)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!23851)

(declare-fun getCurrentListMapNoExtraKeys!2156 (array!44489 array!44491 (_ BitVec 32) (_ BitVec 32) V!23851 V!23851 (_ BitVec 32) Int) ListLongMap!8067)

(assert (=> b!814538 (= lt!364706 (getCurrentListMapNoExtraKeys!2156 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23851)

(declare-fun lt!364707 () ListLongMap!8067)

(assert (=> b!814538 (= lt!364707 (getCurrentListMapNoExtraKeys!2156 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22786 () Bool)

(declare-fun tp!43995 () Bool)

(assert (=> mapNonEmpty!22786 (= mapRes!22786 (and tp!43995 e!451462))))

(declare-fun mapRest!22786 () (Array (_ BitVec 32) ValueCell!6653))

(declare-fun mapValue!22786 () ValueCell!6653)

(declare-fun mapKey!22786 () (_ BitVec 32))

(assert (=> mapNonEmpty!22786 (= (arr!21301 _values!788) (store mapRest!22786 mapKey!22786 mapValue!22786))))

(declare-fun res!556167 () Bool)

(assert (=> start!70172 (=> (not res!556167) (not e!451465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70172 (= res!556167 (validMask!0 mask!1312))))

(assert (=> start!70172 e!451465))

(assert (=> start!70172 tp_is_empty!14137))

(declare-fun array_inv!17107 (array!44489) Bool)

(assert (=> start!70172 (array_inv!17107 _keys!976)))

(assert (=> start!70172 true))

(declare-fun array_inv!17108 (array!44491) Bool)

(assert (=> start!70172 (and (array_inv!17108 _values!788) e!451464)))

(assert (=> start!70172 tp!43996))

(assert (= (and start!70172 res!556167) b!814535))

(assert (= (and b!814535 res!556166) b!814536))

(assert (= (and b!814536 res!556165) b!814533))

(assert (= (and b!814533 res!556168) b!814538))

(assert (= (and b!814534 condMapEmpty!22786) mapIsEmpty!22786))

(assert (= (and b!814534 (not condMapEmpty!22786)) mapNonEmpty!22786))

(get-info :version)

(assert (= (and mapNonEmpty!22786 ((_ is ValueCellFull!6653) mapValue!22786)) b!814532))

(assert (= (and b!814534 ((_ is ValueCellFull!6653) mapDefault!22786)) b!814537))

(assert (= start!70172 b!814534))

(declare-fun m!756903 () Bool)

(assert (=> start!70172 m!756903))

(declare-fun m!756905 () Bool)

(assert (=> start!70172 m!756905))

(declare-fun m!756907 () Bool)

(assert (=> start!70172 m!756907))

(declare-fun m!756909 () Bool)

(assert (=> mapNonEmpty!22786 m!756909))

(declare-fun m!756911 () Bool)

(assert (=> b!814533 m!756911))

(declare-fun m!756913 () Bool)

(assert (=> b!814536 m!756913))

(declare-fun m!756915 () Bool)

(assert (=> b!814538 m!756915))

(declare-fun m!756917 () Bool)

(assert (=> b!814538 m!756917))

(check-sat (not b!814538) (not b!814533) (not b!814536) b_and!21209 tp_is_empty!14137 (not b_next!12427) (not mapNonEmpty!22786) (not start!70172))
(check-sat b_and!21209 (not b_next!12427))
