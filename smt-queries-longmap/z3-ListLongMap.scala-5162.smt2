; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70112 () Bool)

(assert start!70112)

(declare-fun b_free!12379 () Bool)

(declare-fun b_next!12379 () Bool)

(assert (=> start!70112 (= b_free!12379 (not b_next!12379))))

(declare-fun tp!43848 () Bool)

(declare-fun b_and!21157 () Bool)

(assert (=> start!70112 (= tp!43848 b_and!21157)))

(declare-fun mapIsEmpty!22711 () Bool)

(declare-fun mapRes!22711 () Bool)

(assert (=> mapIsEmpty!22711 mapRes!22711))

(declare-fun b!813955 () Bool)

(declare-fun e!451054 () Bool)

(declare-fun tp_is_empty!14089 () Bool)

(assert (=> b!813955 (= e!451054 tp_is_empty!14089)))

(declare-fun b!813956 () Bool)

(declare-fun res!555852 () Bool)

(declare-fun e!451056 () Bool)

(assert (=> b!813956 (=> (not res!555852) (not e!451056))))

(declare-datatypes ((array!44395 0))(
  ( (array!44396 (arr!21254 (Array (_ BitVec 32) (_ BitVec 64))) (size!21674 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44395)

(declare-datatypes ((List!15025 0))(
  ( (Nil!15022) (Cons!15021 (h!16156 (_ BitVec 64)) (t!21332 List!15025)) )
))
(declare-fun arrayNoDuplicates!0 (array!44395 (_ BitVec 32) List!15025) Bool)

(assert (=> b!813956 (= res!555852 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15022))))

(declare-fun b!813957 () Bool)

(declare-fun e!451058 () Bool)

(assert (=> b!813957 (= e!451058 (and e!451054 mapRes!22711))))

(declare-fun condMapEmpty!22711 () Bool)

(declare-datatypes ((V!23787 0))(
  ( (V!23788 (val!7092 Int)) )
))
(declare-datatypes ((ValueCell!6629 0))(
  ( (ValueCellFull!6629 (v!9519 V!23787)) (EmptyCell!6629) )
))
(declare-datatypes ((array!44397 0))(
  ( (array!44398 (arr!21255 (Array (_ BitVec 32) ValueCell!6629)) (size!21675 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44397)

(declare-fun mapDefault!22711 () ValueCell!6629)

(assert (=> b!813957 (= condMapEmpty!22711 (= (arr!21255 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6629)) mapDefault!22711)))))

(declare-fun b!813958 () Bool)

(declare-fun res!555850 () Bool)

(assert (=> b!813958 (=> (not res!555850) (not e!451056))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813958 (= res!555850 (and (= (size!21675 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21674 _keys!976) (size!21675 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813959 () Bool)

(assert (=> b!813959 (= e!451056 false)))

(declare-fun zeroValueBefore!34 () V!23787)

(declare-fun minValue!754 () V!23787)

(declare-datatypes ((tuple2!9206 0))(
  ( (tuple2!9207 (_1!4614 (_ BitVec 64)) (_2!4614 V!23787)) )
))
(declare-datatypes ((List!15026 0))(
  ( (Nil!15023) (Cons!15022 (h!16157 tuple2!9206) (t!21333 List!15026)) )
))
(declare-datatypes ((ListLongMap!8031 0))(
  ( (ListLongMap!8032 (toList!4031 List!15026)) )
))
(declare-fun lt!364584 () ListLongMap!8031)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2138 (array!44395 array!44397 (_ BitVec 32) (_ BitVec 32) V!23787 V!23787 (_ BitVec 32) Int) ListLongMap!8031)

(assert (=> b!813959 (= lt!364584 (getCurrentListMapNoExtraKeys!2138 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813960 () Bool)

(declare-fun e!451055 () Bool)

(assert (=> b!813960 (= e!451055 tp_is_empty!14089)))

(declare-fun b!813961 () Bool)

(declare-fun res!555851 () Bool)

(assert (=> b!813961 (=> (not res!555851) (not e!451056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44395 (_ BitVec 32)) Bool)

(assert (=> b!813961 (= res!555851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555853 () Bool)

(assert (=> start!70112 (=> (not res!555853) (not e!451056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70112 (= res!555853 (validMask!0 mask!1312))))

(assert (=> start!70112 e!451056))

(assert (=> start!70112 tp_is_empty!14089))

(declare-fun array_inv!17077 (array!44395) Bool)

(assert (=> start!70112 (array_inv!17077 _keys!976)))

(assert (=> start!70112 true))

(declare-fun array_inv!17078 (array!44397) Bool)

(assert (=> start!70112 (and (array_inv!17078 _values!788) e!451058)))

(assert (=> start!70112 tp!43848))

(declare-fun mapNonEmpty!22711 () Bool)

(declare-fun tp!43849 () Bool)

(assert (=> mapNonEmpty!22711 (= mapRes!22711 (and tp!43849 e!451055))))

(declare-fun mapKey!22711 () (_ BitVec 32))

(declare-fun mapValue!22711 () ValueCell!6629)

(declare-fun mapRest!22711 () (Array (_ BitVec 32) ValueCell!6629))

(assert (=> mapNonEmpty!22711 (= (arr!21255 _values!788) (store mapRest!22711 mapKey!22711 mapValue!22711))))

(assert (= (and start!70112 res!555853) b!813958))

(assert (= (and b!813958 res!555850) b!813961))

(assert (= (and b!813961 res!555851) b!813956))

(assert (= (and b!813956 res!555852) b!813959))

(assert (= (and b!813957 condMapEmpty!22711) mapIsEmpty!22711))

(assert (= (and b!813957 (not condMapEmpty!22711)) mapNonEmpty!22711))

(get-info :version)

(assert (= (and mapNonEmpty!22711 ((_ is ValueCellFull!6629) mapValue!22711)) b!813960))

(assert (= (and b!813957 ((_ is ValueCellFull!6629) mapDefault!22711)) b!813955))

(assert (= start!70112 b!813957))

(declare-fun m!756511 () Bool)

(assert (=> b!813961 m!756511))

(declare-fun m!756513 () Bool)

(assert (=> b!813959 m!756513))

(declare-fun m!756515 () Bool)

(assert (=> start!70112 m!756515))

(declare-fun m!756517 () Bool)

(assert (=> start!70112 m!756517))

(declare-fun m!756519 () Bool)

(assert (=> start!70112 m!756519))

(declare-fun m!756521 () Bool)

(assert (=> mapNonEmpty!22711 m!756521))

(declare-fun m!756523 () Bool)

(assert (=> b!813956 m!756523))

(check-sat (not b!813956) tp_is_empty!14089 (not start!70112) b_and!21157 (not mapNonEmpty!22711) (not b!813959) (not b!813961) (not b_next!12379))
(check-sat b_and!21157 (not b_next!12379))
