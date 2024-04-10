; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70240 () Bool)

(assert start!70240)

(declare-fun b_free!12633 () Bool)

(declare-fun b_next!12633 () Bool)

(assert (=> start!70240 (= b_free!12633 (not b_next!12633))))

(declare-fun tp!44620 () Bool)

(declare-fun b_and!21421 () Bool)

(assert (=> start!70240 (= tp!44620 b_and!21421)))

(declare-fun b!816040 () Bool)

(declare-fun res!557186 () Bool)

(declare-fun e!452607 () Bool)

(assert (=> b!816040 (=> (not res!557186) (not e!452607))))

(declare-datatypes ((array!44886 0))(
  ( (array!44887 (arr!21501 (Array (_ BitVec 32) (_ BitVec 64))) (size!21922 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44886)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24125 0))(
  ( (V!24126 (val!7219 Int)) )
))
(declare-datatypes ((ValueCell!6756 0))(
  ( (ValueCellFull!6756 (v!9646 V!24125)) (EmptyCell!6756) )
))
(declare-datatypes ((array!44888 0))(
  ( (array!44889 (arr!21502 (Array (_ BitVec 32) ValueCell!6756)) (size!21923 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44888)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816040 (= res!557186 (and (= (size!21923 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21922 _keys!976) (size!21923 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23101 () Bool)

(declare-fun mapRes!23101 () Bool)

(assert (=> mapIsEmpty!23101 mapRes!23101))

(declare-fun mapNonEmpty!23101 () Bool)

(declare-fun tp!44619 () Bool)

(declare-fun e!452608 () Bool)

(assert (=> mapNonEmpty!23101 (= mapRes!23101 (and tp!44619 e!452608))))

(declare-fun mapRest!23101 () (Array (_ BitVec 32) ValueCell!6756))

(declare-fun mapKey!23101 () (_ BitVec 32))

(declare-fun mapValue!23101 () ValueCell!6756)

(assert (=> mapNonEmpty!23101 (= (arr!21502 _values!788) (store mapRest!23101 mapKey!23101 mapValue!23101))))

(declare-fun b!816041 () Bool)

(declare-fun e!452611 () Bool)

(declare-fun tp_is_empty!14343 () Bool)

(assert (=> b!816041 (= e!452611 tp_is_empty!14343)))

(declare-fun b!816042 () Bool)

(assert (=> b!816042 (= e!452608 tp_is_empty!14343)))

(declare-fun b!816043 () Bool)

(declare-fun e!452612 () Bool)

(assert (=> b!816043 (= e!452607 (not e!452612))))

(declare-fun res!557189 () Bool)

(assert (=> b!816043 (=> res!557189 e!452612)))

(assert (=> b!816043 (= res!557189 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9478 0))(
  ( (tuple2!9479 (_1!4750 (_ BitVec 64)) (_2!4750 V!24125)) )
))
(declare-datatypes ((List!15308 0))(
  ( (Nil!15305) (Cons!15304 (h!16433 tuple2!9478) (t!21629 List!15308)) )
))
(declare-datatypes ((ListLongMap!8301 0))(
  ( (ListLongMap!8302 (toList!4166 List!15308)) )
))
(declare-fun lt!365417 () ListLongMap!8301)

(declare-fun lt!365419 () ListLongMap!8301)

(assert (=> b!816043 (= lt!365417 lt!365419)))

(declare-fun zeroValueBefore!34 () V!24125)

(declare-fun zeroValueAfter!34 () V!24125)

(declare-fun minValue!754 () V!24125)

(declare-datatypes ((Unit!27820 0))(
  ( (Unit!27821) )
))
(declare-fun lt!365416 () Unit!27820)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!321 (array!44886 array!44888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24125 V!24125 V!24125 V!24125 (_ BitVec 32) Int) Unit!27820)

(assert (=> b!816043 (= lt!365416 (lemmaNoChangeToArrayThenSameMapNoExtras!321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2211 (array!44886 array!44888 (_ BitVec 32) (_ BitVec 32) V!24125 V!24125 (_ BitVec 32) Int) ListLongMap!8301)

(assert (=> b!816043 (= lt!365419 (getCurrentListMapNoExtraKeys!2211 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816043 (= lt!365417 (getCurrentListMapNoExtraKeys!2211 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816044 () Bool)

(declare-fun e!452610 () Bool)

(assert (=> b!816044 (= e!452610 (and e!452611 mapRes!23101))))

(declare-fun condMapEmpty!23101 () Bool)

(declare-fun mapDefault!23101 () ValueCell!6756)

(assert (=> b!816044 (= condMapEmpty!23101 (= (arr!21502 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6756)) mapDefault!23101)))))

(declare-fun b!816039 () Bool)

(declare-fun res!557185 () Bool)

(assert (=> b!816039 (=> (not res!557185) (not e!452607))))

(declare-datatypes ((List!15309 0))(
  ( (Nil!15306) (Cons!15305 (h!16434 (_ BitVec 64)) (t!21630 List!15309)) )
))
(declare-fun arrayNoDuplicates!0 (array!44886 (_ BitVec 32) List!15309) Bool)

(assert (=> b!816039 (= res!557185 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15306))))

(declare-fun res!557188 () Bool)

(assert (=> start!70240 (=> (not res!557188) (not e!452607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70240 (= res!557188 (validMask!0 mask!1312))))

(assert (=> start!70240 e!452607))

(assert (=> start!70240 tp_is_empty!14343))

(declare-fun array_inv!17203 (array!44886) Bool)

(assert (=> start!70240 (array_inv!17203 _keys!976)))

(assert (=> start!70240 true))

(declare-fun array_inv!17204 (array!44888) Bool)

(assert (=> start!70240 (and (array_inv!17204 _values!788) e!452610)))

(assert (=> start!70240 tp!44620))

(declare-fun b!816045 () Bool)

(declare-fun res!557187 () Bool)

(assert (=> b!816045 (=> (not res!557187) (not e!452607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44886 (_ BitVec 32)) Bool)

(assert (=> b!816045 (= res!557187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816046 () Bool)

(assert (=> b!816046 (= e!452612 true)))

(declare-fun lt!365418 () ListLongMap!8301)

(declare-fun getCurrentListMap!2393 (array!44886 array!44888 (_ BitVec 32) (_ BitVec 32) V!24125 V!24125 (_ BitVec 32) Int) ListLongMap!8301)

(assert (=> b!816046 (= lt!365418 (getCurrentListMap!2393 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365420 () ListLongMap!8301)

(declare-fun +!1799 (ListLongMap!8301 tuple2!9478) ListLongMap!8301)

(assert (=> b!816046 (= lt!365420 (+!1799 (getCurrentListMap!2393 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9479 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70240 res!557188) b!816040))

(assert (= (and b!816040 res!557186) b!816045))

(assert (= (and b!816045 res!557187) b!816039))

(assert (= (and b!816039 res!557185) b!816043))

(assert (= (and b!816043 (not res!557189)) b!816046))

(assert (= (and b!816044 condMapEmpty!23101) mapIsEmpty!23101))

(assert (= (and b!816044 (not condMapEmpty!23101)) mapNonEmpty!23101))

(get-info :version)

(assert (= (and mapNonEmpty!23101 ((_ is ValueCellFull!6756) mapValue!23101)) b!816042))

(assert (= (and b!816044 ((_ is ValueCellFull!6756) mapDefault!23101)) b!816041))

(assert (= start!70240 b!816044))

(declare-fun m!757685 () Bool)

(assert (=> start!70240 m!757685))

(declare-fun m!757687 () Bool)

(assert (=> start!70240 m!757687))

(declare-fun m!757689 () Bool)

(assert (=> start!70240 m!757689))

(declare-fun m!757691 () Bool)

(assert (=> b!816046 m!757691))

(declare-fun m!757693 () Bool)

(assert (=> b!816046 m!757693))

(assert (=> b!816046 m!757693))

(declare-fun m!757695 () Bool)

(assert (=> b!816046 m!757695))

(declare-fun m!757697 () Bool)

(assert (=> b!816039 m!757697))

(declare-fun m!757699 () Bool)

(assert (=> b!816045 m!757699))

(declare-fun m!757701 () Bool)

(assert (=> b!816043 m!757701))

(declare-fun m!757703 () Bool)

(assert (=> b!816043 m!757703))

(declare-fun m!757705 () Bool)

(assert (=> b!816043 m!757705))

(declare-fun m!757707 () Bool)

(assert (=> mapNonEmpty!23101 m!757707))

(check-sat b_and!21421 (not b!816046) tp_is_empty!14343 (not b!816045) (not start!70240) (not mapNonEmpty!23101) (not b!816039) (not b!816043) (not b_next!12633))
(check-sat b_and!21421 (not b_next!12633))
