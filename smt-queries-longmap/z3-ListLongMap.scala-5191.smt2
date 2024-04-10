; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70148 () Bool)

(assert start!70148)

(declare-fun b_free!12555 () Bool)

(declare-fun b_next!12555 () Bool)

(assert (=> start!70148 (= b_free!12555 (not b_next!12555))))

(declare-fun tp!44383 () Bool)

(declare-fun b_and!21335 () Bool)

(assert (=> start!70148 (= tp!44383 b_and!21335)))

(declare-fun mapNonEmpty!22981 () Bool)

(declare-fun mapRes!22981 () Bool)

(declare-fun tp!44382 () Bool)

(declare-fun e!451899 () Bool)

(assert (=> mapNonEmpty!22981 (= mapRes!22981 (and tp!44382 e!451899))))

(declare-fun mapKey!22981 () (_ BitVec 32))

(declare-datatypes ((V!24021 0))(
  ( (V!24022 (val!7180 Int)) )
))
(declare-datatypes ((ValueCell!6717 0))(
  ( (ValueCellFull!6717 (v!9607 V!24021)) (EmptyCell!6717) )
))
(declare-fun mapRest!22981 () (Array (_ BitVec 32) ValueCell!6717))

(declare-fun mapValue!22981 () ValueCell!6717)

(declare-datatypes ((array!44734 0))(
  ( (array!44735 (arr!21426 (Array (_ BitVec 32) ValueCell!6717)) (size!21847 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44734)

(assert (=> mapNonEmpty!22981 (= (arr!21426 _values!788) (store mapRest!22981 mapKey!22981 mapValue!22981))))

(declare-fun b!815067 () Bool)

(declare-fun tp_is_empty!14265 () Bool)

(assert (=> b!815067 (= e!451899 tp_is_empty!14265)))

(declare-fun b!815068 () Bool)

(declare-fun e!451900 () Bool)

(assert (=> b!815068 (= e!451900 tp_is_empty!14265)))

(declare-fun b!815069 () Bool)

(declare-fun e!451902 () Bool)

(assert (=> b!815069 (= e!451902 (not true))))

(declare-datatypes ((tuple2!9414 0))(
  ( (tuple2!9415 (_1!4718 (_ BitVec 64)) (_2!4718 V!24021)) )
))
(declare-datatypes ((List!15246 0))(
  ( (Nil!15243) (Cons!15242 (h!16371 tuple2!9414) (t!21565 List!15246)) )
))
(declare-datatypes ((ListLongMap!8237 0))(
  ( (ListLongMap!8238 (toList!4134 List!15246)) )
))
(declare-fun lt!364891 () ListLongMap!8237)

(declare-fun lt!364890 () ListLongMap!8237)

(assert (=> b!815069 (= lt!364891 lt!364890)))

(declare-fun zeroValueBefore!34 () V!24021)

(declare-datatypes ((array!44736 0))(
  ( (array!44737 (arr!21427 (Array (_ BitVec 32) (_ BitVec 64))) (size!21848 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44736)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24021)

(declare-fun minValue!754 () V!24021)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27766 0))(
  ( (Unit!27767) )
))
(declare-fun lt!364889 () Unit!27766)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!294 (array!44736 array!44734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24021 V!24021 V!24021 V!24021 (_ BitVec 32) Int) Unit!27766)

(assert (=> b!815069 (= lt!364889 (lemmaNoChangeToArrayThenSameMapNoExtras!294 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2184 (array!44736 array!44734 (_ BitVec 32) (_ BitVec 32) V!24021 V!24021 (_ BitVec 32) Int) ListLongMap!8237)

(assert (=> b!815069 (= lt!364890 (getCurrentListMapNoExtraKeys!2184 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815069 (= lt!364891 (getCurrentListMapNoExtraKeys!2184 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815070 () Bool)

(declare-fun e!451901 () Bool)

(assert (=> b!815070 (= e!451901 (and e!451900 mapRes!22981))))

(declare-fun condMapEmpty!22981 () Bool)

(declare-fun mapDefault!22981 () ValueCell!6717)

(assert (=> b!815070 (= condMapEmpty!22981 (= (arr!21426 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6717)) mapDefault!22981)))))

(declare-fun mapIsEmpty!22981 () Bool)

(assert (=> mapIsEmpty!22981 mapRes!22981))

(declare-fun b!815071 () Bool)

(declare-fun res!556618 () Bool)

(assert (=> b!815071 (=> (not res!556618) (not e!451902))))

(declare-datatypes ((List!15247 0))(
  ( (Nil!15244) (Cons!15243 (h!16372 (_ BitVec 64)) (t!21566 List!15247)) )
))
(declare-fun arrayNoDuplicates!0 (array!44736 (_ BitVec 32) List!15247) Bool)

(assert (=> b!815071 (= res!556618 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15244))))

(declare-fun b!815072 () Bool)

(declare-fun res!556621 () Bool)

(assert (=> b!815072 (=> (not res!556621) (not e!451902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44736 (_ BitVec 32)) Bool)

(assert (=> b!815072 (= res!556621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815073 () Bool)

(declare-fun res!556619 () Bool)

(assert (=> b!815073 (=> (not res!556619) (not e!451902))))

(assert (=> b!815073 (= res!556619 (and (= (size!21847 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21848 _keys!976) (size!21847 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556620 () Bool)

(assert (=> start!70148 (=> (not res!556620) (not e!451902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70148 (= res!556620 (validMask!0 mask!1312))))

(assert (=> start!70148 e!451902))

(assert (=> start!70148 tp_is_empty!14265))

(declare-fun array_inv!17145 (array!44736) Bool)

(assert (=> start!70148 (array_inv!17145 _keys!976)))

(assert (=> start!70148 true))

(declare-fun array_inv!17146 (array!44734) Bool)

(assert (=> start!70148 (and (array_inv!17146 _values!788) e!451901)))

(assert (=> start!70148 tp!44383))

(assert (= (and start!70148 res!556620) b!815073))

(assert (= (and b!815073 res!556619) b!815072))

(assert (= (and b!815072 res!556621) b!815071))

(assert (= (and b!815071 res!556618) b!815069))

(assert (= (and b!815070 condMapEmpty!22981) mapIsEmpty!22981))

(assert (= (and b!815070 (not condMapEmpty!22981)) mapNonEmpty!22981))

(get-info :version)

(assert (= (and mapNonEmpty!22981 ((_ is ValueCellFull!6717) mapValue!22981)) b!815067))

(assert (= (and b!815070 ((_ is ValueCellFull!6717) mapDefault!22981)) b!815068))

(assert (= start!70148 b!815070))

(declare-fun m!756785 () Bool)

(assert (=> start!70148 m!756785))

(declare-fun m!756787 () Bool)

(assert (=> start!70148 m!756787))

(declare-fun m!756789 () Bool)

(assert (=> start!70148 m!756789))

(declare-fun m!756791 () Bool)

(assert (=> b!815072 m!756791))

(declare-fun m!756793 () Bool)

(assert (=> b!815069 m!756793))

(declare-fun m!756795 () Bool)

(assert (=> b!815069 m!756795))

(declare-fun m!756797 () Bool)

(assert (=> b!815069 m!756797))

(declare-fun m!756799 () Bool)

(assert (=> mapNonEmpty!22981 m!756799))

(declare-fun m!756801 () Bool)

(assert (=> b!815071 m!756801))

(check-sat (not start!70148) tp_is_empty!14265 (not b!815069) (not b_next!12555) (not b!815072) (not b!815071) b_and!21335 (not mapNonEmpty!22981))
(check-sat b_and!21335 (not b_next!12555))
