; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70294 () Bool)

(assert start!70294)

(declare-fun b_free!12669 () Bool)

(declare-fun b_next!12669 () Bool)

(assert (=> start!70294 (= b_free!12669 (not b_next!12669))))

(declare-fun tp!44730 () Bool)

(declare-fun b_and!21469 () Bool)

(assert (=> start!70294 (= tp!44730 b_and!21469)))

(declare-fun b!816655 () Bool)

(declare-fun e!453043 () Bool)

(declare-fun tp_is_empty!14379 () Bool)

(assert (=> b!816655 (= e!453043 tp_is_empty!14379)))

(declare-fun res!557539 () Bool)

(declare-fun e!453046 () Bool)

(assert (=> start!70294 (=> (not res!557539) (not e!453046))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70294 (= res!557539 (validMask!0 mask!1312))))

(assert (=> start!70294 e!453046))

(assert (=> start!70294 tp_is_empty!14379))

(declare-datatypes ((array!44958 0))(
  ( (array!44959 (arr!21536 (Array (_ BitVec 32) (_ BitVec 64))) (size!21957 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44958)

(declare-fun array_inv!17233 (array!44958) Bool)

(assert (=> start!70294 (array_inv!17233 _keys!976)))

(assert (=> start!70294 true))

(declare-datatypes ((V!24173 0))(
  ( (V!24174 (val!7237 Int)) )
))
(declare-datatypes ((ValueCell!6774 0))(
  ( (ValueCellFull!6774 (v!9665 V!24173)) (EmptyCell!6774) )
))
(declare-datatypes ((array!44960 0))(
  ( (array!44961 (arr!21537 (Array (_ BitVec 32) ValueCell!6774)) (size!21958 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44960)

(declare-fun e!453045 () Bool)

(declare-fun array_inv!17234 (array!44960) Bool)

(assert (=> start!70294 (and (array_inv!17234 _values!788) e!453045)))

(assert (=> start!70294 tp!44730))

(declare-fun mapNonEmpty!23158 () Bool)

(declare-fun mapRes!23158 () Bool)

(declare-fun tp!44731 () Bool)

(assert (=> mapNonEmpty!23158 (= mapRes!23158 (and tp!44731 e!453043))))

(declare-fun mapValue!23158 () ValueCell!6774)

(declare-fun mapRest!23158 () (Array (_ BitVec 32) ValueCell!6774))

(declare-fun mapKey!23158 () (_ BitVec 32))

(assert (=> mapNonEmpty!23158 (= (arr!21537 _values!788) (store mapRest!23158 mapKey!23158 mapValue!23158))))

(declare-fun b!816656 () Bool)

(declare-fun res!557537 () Bool)

(assert (=> b!816656 (=> (not res!557537) (not e!453046))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816656 (= res!557537 (and (= (size!21958 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21957 _keys!976) (size!21958 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816657 () Bool)

(declare-fun res!557541 () Bool)

(assert (=> b!816657 (=> (not res!557541) (not e!453046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44958 (_ BitVec 32)) Bool)

(assert (=> b!816657 (= res!557541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816658 () Bool)

(declare-fun e!453044 () Bool)

(assert (=> b!816658 (= e!453044 tp_is_empty!14379)))

(declare-fun b!816659 () Bool)

(assert (=> b!816659 (= e!453045 (and e!453044 mapRes!23158))))

(declare-fun condMapEmpty!23158 () Bool)

(declare-fun mapDefault!23158 () ValueCell!6774)

(assert (=> b!816659 (= condMapEmpty!23158 (= (arr!21537 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6774)) mapDefault!23158)))))

(declare-fun b!816660 () Bool)

(declare-fun e!453042 () Bool)

(assert (=> b!816660 (= e!453046 (not e!453042))))

(declare-fun res!557540 () Bool)

(assert (=> b!816660 (=> res!557540 e!453042)))

(assert (=> b!816660 (= res!557540 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9512 0))(
  ( (tuple2!9513 (_1!4767 (_ BitVec 64)) (_2!4767 V!24173)) )
))
(declare-datatypes ((List!15340 0))(
  ( (Nil!15337) (Cons!15336 (h!16465 tuple2!9512) (t!21663 List!15340)) )
))
(declare-datatypes ((ListLongMap!8335 0))(
  ( (ListLongMap!8336 (toList!4183 List!15340)) )
))
(declare-fun lt!365808 () ListLongMap!8335)

(declare-fun lt!365812 () ListLongMap!8335)

(assert (=> b!816660 (= lt!365808 lt!365812)))

(declare-fun zeroValueBefore!34 () V!24173)

(declare-fun zeroValueAfter!34 () V!24173)

(declare-fun minValue!754 () V!24173)

(declare-datatypes ((Unit!27850 0))(
  ( (Unit!27851) )
))
(declare-fun lt!365809 () Unit!27850)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!335 (array!44958 array!44960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24173 V!24173 V!24173 V!24173 (_ BitVec 32) Int) Unit!27850)

(assert (=> b!816660 (= lt!365809 (lemmaNoChangeToArrayThenSameMapNoExtras!335 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2225 (array!44958 array!44960 (_ BitVec 32) (_ BitVec 32) V!24173 V!24173 (_ BitVec 32) Int) ListLongMap!8335)

(assert (=> b!816660 (= lt!365812 (getCurrentListMapNoExtraKeys!2225 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816660 (= lt!365808 (getCurrentListMapNoExtraKeys!2225 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816661 () Bool)

(declare-fun res!557538 () Bool)

(assert (=> b!816661 (=> (not res!557538) (not e!453046))))

(declare-datatypes ((List!15341 0))(
  ( (Nil!15338) (Cons!15337 (h!16466 (_ BitVec 64)) (t!21664 List!15341)) )
))
(declare-fun arrayNoDuplicates!0 (array!44958 (_ BitVec 32) List!15341) Bool)

(assert (=> b!816661 (= res!557538 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15338))))

(declare-fun mapIsEmpty!23158 () Bool)

(assert (=> mapIsEmpty!23158 mapRes!23158))

(declare-fun b!816662 () Bool)

(assert (=> b!816662 (= e!453042 true)))

(declare-fun lt!365810 () ListLongMap!8335)

(declare-fun getCurrentListMap!2408 (array!44958 array!44960 (_ BitVec 32) (_ BitVec 32) V!24173 V!24173 (_ BitVec 32) Int) ListLongMap!8335)

(assert (=> b!816662 (= lt!365810 (getCurrentListMap!2408 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365811 () ListLongMap!8335)

(declare-fun +!1814 (ListLongMap!8335 tuple2!9512) ListLongMap!8335)

(assert (=> b!816662 (= lt!365811 (+!1814 (getCurrentListMap!2408 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70294 res!557539) b!816656))

(assert (= (and b!816656 res!557537) b!816657))

(assert (= (and b!816657 res!557541) b!816661))

(assert (= (and b!816661 res!557538) b!816660))

(assert (= (and b!816660 (not res!557540)) b!816662))

(assert (= (and b!816659 condMapEmpty!23158) mapIsEmpty!23158))

(assert (= (and b!816659 (not condMapEmpty!23158)) mapNonEmpty!23158))

(get-info :version)

(assert (= (and mapNonEmpty!23158 ((_ is ValueCellFull!6774) mapValue!23158)) b!816655))

(assert (= (and b!816659 ((_ is ValueCellFull!6774) mapDefault!23158)) b!816658))

(assert (= start!70294 b!816659))

(declare-fun m!758287 () Bool)

(assert (=> mapNonEmpty!23158 m!758287))

(declare-fun m!758289 () Bool)

(assert (=> start!70294 m!758289))

(declare-fun m!758291 () Bool)

(assert (=> start!70294 m!758291))

(declare-fun m!758293 () Bool)

(assert (=> start!70294 m!758293))

(declare-fun m!758295 () Bool)

(assert (=> b!816661 m!758295))

(declare-fun m!758297 () Bool)

(assert (=> b!816660 m!758297))

(declare-fun m!758299 () Bool)

(assert (=> b!816660 m!758299))

(declare-fun m!758301 () Bool)

(assert (=> b!816660 m!758301))

(declare-fun m!758303 () Bool)

(assert (=> b!816662 m!758303))

(declare-fun m!758305 () Bool)

(assert (=> b!816662 m!758305))

(assert (=> b!816662 m!758305))

(declare-fun m!758307 () Bool)

(assert (=> b!816662 m!758307))

(declare-fun m!758309 () Bool)

(assert (=> b!816657 m!758309))

(check-sat (not b!816662) (not start!70294) (not b!816657) (not b!816661) (not mapNonEmpty!23158) b_and!21469 (not b_next!12669) tp_is_empty!14379 (not b!816660))
(check-sat b_and!21469 (not b_next!12669))
