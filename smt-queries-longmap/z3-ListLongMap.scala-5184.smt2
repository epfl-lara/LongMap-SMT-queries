; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70256 () Bool)

(assert start!70256)

(declare-fun b_free!12511 () Bool)

(declare-fun b_next!12511 () Bool)

(assert (=> start!70256 (= b_free!12511 (not b_next!12511))))

(declare-fun tp!44247 () Bool)

(declare-fun b_and!21293 () Bool)

(assert (=> start!70256 (= tp!44247 b_and!21293)))

(declare-fun mapIsEmpty!22912 () Bool)

(declare-fun mapRes!22912 () Bool)

(assert (=> mapIsEmpty!22912 mapRes!22912))

(declare-fun b!815414 () Bool)

(declare-fun res!556669 () Bool)

(declare-fun e!452094 () Bool)

(assert (=> b!815414 (=> (not res!556669) (not e!452094))))

(declare-datatypes ((array!44643 0))(
  ( (array!44644 (arr!21377 (Array (_ BitVec 32) (_ BitVec 64))) (size!21797 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44643)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44643 (_ BitVec 32)) Bool)

(assert (=> b!815414 (= res!556669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815415 () Bool)

(assert (=> b!815415 (= e!452094 (not true))))

(declare-datatypes ((V!23963 0))(
  ( (V!23964 (val!7158 Int)) )
))
(declare-datatypes ((tuple2!9296 0))(
  ( (tuple2!9297 (_1!4659 (_ BitVec 64)) (_2!4659 V!23963)) )
))
(declare-datatypes ((List!15115 0))(
  ( (Nil!15112) (Cons!15111 (h!16246 tuple2!9296) (t!21424 List!15115)) )
))
(declare-datatypes ((ListLongMap!8121 0))(
  ( (ListLongMap!8122 (toList!4076 List!15115)) )
))
(declare-fun lt!365006 () ListLongMap!8121)

(declare-fun lt!365005 () ListLongMap!8121)

(assert (=> b!815415 (= lt!365006 lt!365005)))

(declare-fun zeroValueBefore!34 () V!23963)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23963)

(declare-fun minValue!754 () V!23963)

(declare-datatypes ((ValueCell!6695 0))(
  ( (ValueCellFull!6695 (v!9585 V!23963)) (EmptyCell!6695) )
))
(declare-datatypes ((array!44645 0))(
  ( (array!44646 (arr!21378 (Array (_ BitVec 32) ValueCell!6695)) (size!21798 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44645)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27719 0))(
  ( (Unit!27720) )
))
(declare-fun lt!365007 () Unit!27719)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!271 (array!44643 array!44645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23963 V!23963 V!23963 V!23963 (_ BitVec 32) Int) Unit!27719)

(assert (=> b!815415 (= lt!365007 (lemmaNoChangeToArrayThenSameMapNoExtras!271 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2183 (array!44643 array!44645 (_ BitVec 32) (_ BitVec 32) V!23963 V!23963 (_ BitVec 32) Int) ListLongMap!8121)

(assert (=> b!815415 (= lt!365005 (getCurrentListMapNoExtraKeys!2183 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815415 (= lt!365006 (getCurrentListMapNoExtraKeys!2183 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815416 () Bool)

(declare-fun e!452093 () Bool)

(declare-fun tp_is_empty!14221 () Bool)

(assert (=> b!815416 (= e!452093 tp_is_empty!14221)))

(declare-fun res!556671 () Bool)

(assert (=> start!70256 (=> (not res!556671) (not e!452094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70256 (= res!556671 (validMask!0 mask!1312))))

(assert (=> start!70256 e!452094))

(assert (=> start!70256 tp_is_empty!14221))

(declare-fun array_inv!17157 (array!44643) Bool)

(assert (=> start!70256 (array_inv!17157 _keys!976)))

(assert (=> start!70256 true))

(declare-fun e!452096 () Bool)

(declare-fun array_inv!17158 (array!44645) Bool)

(assert (=> start!70256 (and (array_inv!17158 _values!788) e!452096)))

(assert (=> start!70256 tp!44247))

(declare-fun b!815417 () Bool)

(declare-fun res!556670 () Bool)

(assert (=> b!815417 (=> (not res!556670) (not e!452094))))

(declare-datatypes ((List!15116 0))(
  ( (Nil!15113) (Cons!15112 (h!16247 (_ BitVec 64)) (t!21425 List!15116)) )
))
(declare-fun arrayNoDuplicates!0 (array!44643 (_ BitVec 32) List!15116) Bool)

(assert (=> b!815417 (= res!556670 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15113))))

(declare-fun b!815418 () Bool)

(declare-fun e!452092 () Bool)

(assert (=> b!815418 (= e!452092 tp_is_empty!14221)))

(declare-fun b!815419 () Bool)

(declare-fun res!556672 () Bool)

(assert (=> b!815419 (=> (not res!556672) (not e!452094))))

(assert (=> b!815419 (= res!556672 (and (= (size!21798 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21797 _keys!976) (size!21798 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815420 () Bool)

(assert (=> b!815420 (= e!452096 (and e!452092 mapRes!22912))))

(declare-fun condMapEmpty!22912 () Bool)

(declare-fun mapDefault!22912 () ValueCell!6695)

(assert (=> b!815420 (= condMapEmpty!22912 (= (arr!21378 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6695)) mapDefault!22912)))))

(declare-fun mapNonEmpty!22912 () Bool)

(declare-fun tp!44248 () Bool)

(assert (=> mapNonEmpty!22912 (= mapRes!22912 (and tp!44248 e!452093))))

(declare-fun mapKey!22912 () (_ BitVec 32))

(declare-fun mapRest!22912 () (Array (_ BitVec 32) ValueCell!6695))

(declare-fun mapValue!22912 () ValueCell!6695)

(assert (=> mapNonEmpty!22912 (= (arr!21378 _values!788) (store mapRest!22912 mapKey!22912 mapValue!22912))))

(assert (= (and start!70256 res!556671) b!815419))

(assert (= (and b!815419 res!556672) b!815414))

(assert (= (and b!815414 res!556669) b!815417))

(assert (= (and b!815417 res!556670) b!815415))

(assert (= (and b!815420 condMapEmpty!22912) mapIsEmpty!22912))

(assert (= (and b!815420 (not condMapEmpty!22912)) mapNonEmpty!22912))

(get-info :version)

(assert (= (and mapNonEmpty!22912 ((_ is ValueCellFull!6695) mapValue!22912)) b!815416))

(assert (= (and b!815420 ((_ is ValueCellFull!6695) mapDefault!22912)) b!815418))

(assert (= start!70256 b!815420))

(declare-fun m!757605 () Bool)

(assert (=> b!815414 m!757605))

(declare-fun m!757607 () Bool)

(assert (=> mapNonEmpty!22912 m!757607))

(declare-fun m!757609 () Bool)

(assert (=> b!815417 m!757609))

(declare-fun m!757611 () Bool)

(assert (=> start!70256 m!757611))

(declare-fun m!757613 () Bool)

(assert (=> start!70256 m!757613))

(declare-fun m!757615 () Bool)

(assert (=> start!70256 m!757615))

(declare-fun m!757617 () Bool)

(assert (=> b!815415 m!757617))

(declare-fun m!757619 () Bool)

(assert (=> b!815415 m!757619))

(declare-fun m!757621 () Bool)

(assert (=> b!815415 m!757621))

(check-sat tp_is_empty!14221 (not b!815414) (not mapNonEmpty!22912) (not b!815415) (not b_next!12511) (not b!815417) (not start!70256) b_and!21293)
(check-sat b_and!21293 (not b_next!12511))
