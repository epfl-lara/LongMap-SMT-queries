; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70200 () Bool)

(assert start!70200)

(declare-fun b_free!12613 () Bool)

(declare-fun b_next!12613 () Bool)

(assert (=> start!70200 (= b_free!12613 (not b_next!12613))))

(declare-fun tp!44559 () Bool)

(declare-fun b_and!21375 () Bool)

(assert (=> start!70200 (= tp!44559 b_and!21375)))

(declare-fun mapNonEmpty!23071 () Bool)

(declare-fun mapRes!23071 () Bool)

(declare-fun tp!44560 () Bool)

(declare-fun e!452280 () Bool)

(assert (=> mapNonEmpty!23071 (= mapRes!23071 (and tp!44560 e!452280))))

(declare-fun mapKey!23071 () (_ BitVec 32))

(declare-datatypes ((V!24099 0))(
  ( (V!24100 (val!7209 Int)) )
))
(declare-datatypes ((ValueCell!6746 0))(
  ( (ValueCellFull!6746 (v!9630 V!24099)) (EmptyCell!6746) )
))
(declare-fun mapRest!23071 () (Array (_ BitVec 32) ValueCell!6746))

(declare-datatypes ((array!44835 0))(
  ( (array!44836 (arr!21476 (Array (_ BitVec 32) ValueCell!6746)) (size!21897 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44835)

(declare-fun mapValue!23071 () ValueCell!6746)

(assert (=> mapNonEmpty!23071 (= (arr!21476 _values!788) (store mapRest!23071 mapKey!23071 mapValue!23071))))

(declare-fun b!815553 () Bool)

(declare-fun res!556932 () Bool)

(declare-fun e!452277 () Bool)

(assert (=> b!815553 (=> (not res!556932) (not e!452277))))

(declare-datatypes ((array!44837 0))(
  ( (array!44838 (arr!21477 (Array (_ BitVec 32) (_ BitVec 64))) (size!21898 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44837)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44837 (_ BitVec 32)) Bool)

(assert (=> b!815553 (= res!556932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556931 () Bool)

(assert (=> start!70200 (=> (not res!556931) (not e!452277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70200 (= res!556931 (validMask!0 mask!1312))))

(assert (=> start!70200 e!452277))

(declare-fun tp_is_empty!14323 () Bool)

(assert (=> start!70200 tp_is_empty!14323))

(declare-fun array_inv!17263 (array!44837) Bool)

(assert (=> start!70200 (array_inv!17263 _keys!976)))

(assert (=> start!70200 true))

(declare-fun e!452279 () Bool)

(declare-fun array_inv!17264 (array!44835) Bool)

(assert (=> start!70200 (and (array_inv!17264 _values!788) e!452279)))

(assert (=> start!70200 tp!44559))

(declare-fun b!815554 () Bool)

(declare-fun res!556929 () Bool)

(assert (=> b!815554 (=> (not res!556929) (not e!452277))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815554 (= res!556929 (and (= (size!21897 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21898 _keys!976) (size!21897 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815555 () Bool)

(declare-fun e!452282 () Bool)

(assert (=> b!815555 (= e!452277 (not e!452282))))

(declare-fun res!556930 () Bool)

(assert (=> b!815555 (=> res!556930 e!452282)))

(assert (=> b!815555 (= res!556930 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9482 0))(
  ( (tuple2!9483 (_1!4752 (_ BitVec 64)) (_2!4752 V!24099)) )
))
(declare-datatypes ((List!15309 0))(
  ( (Nil!15306) (Cons!15305 (h!16434 tuple2!9482) (t!21621 List!15309)) )
))
(declare-datatypes ((ListLongMap!8295 0))(
  ( (ListLongMap!8296 (toList!4163 List!15309)) )
))
(declare-fun lt!365027 () ListLongMap!8295)

(declare-fun lt!365023 () ListLongMap!8295)

(assert (=> b!815555 (= lt!365027 lt!365023)))

(declare-fun zeroValueBefore!34 () V!24099)

(declare-datatypes ((Unit!27758 0))(
  ( (Unit!27759) )
))
(declare-fun lt!365024 () Unit!27758)

(declare-fun zeroValueAfter!34 () V!24099)

(declare-fun minValue!754 () V!24099)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!320 (array!44837 array!44835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 V!24099 V!24099 (_ BitVec 32) Int) Unit!27758)

(assert (=> b!815555 (= lt!365024 (lemmaNoChangeToArrayThenSameMapNoExtras!320 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2227 (array!44837 array!44835 (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 (_ BitVec 32) Int) ListLongMap!8295)

(assert (=> b!815555 (= lt!365023 (getCurrentListMapNoExtraKeys!2227 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815555 (= lt!365027 (getCurrentListMapNoExtraKeys!2227 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815556 () Bool)

(declare-fun e!452281 () Bool)

(assert (=> b!815556 (= e!452281 tp_is_empty!14323)))

(declare-fun b!815557 () Bool)

(declare-fun res!556933 () Bool)

(assert (=> b!815557 (=> (not res!556933) (not e!452277))))

(declare-datatypes ((List!15310 0))(
  ( (Nil!15307) (Cons!15306 (h!16435 (_ BitVec 64)) (t!21622 List!15310)) )
))
(declare-fun arrayNoDuplicates!0 (array!44837 (_ BitVec 32) List!15310) Bool)

(assert (=> b!815557 (= res!556933 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15307))))

(declare-fun b!815558 () Bool)

(assert (=> b!815558 (= e!452279 (and e!452281 mapRes!23071))))

(declare-fun condMapEmpty!23071 () Bool)

(declare-fun mapDefault!23071 () ValueCell!6746)

(assert (=> b!815558 (= condMapEmpty!23071 (= (arr!21476 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6746)) mapDefault!23071)))))

(declare-fun mapIsEmpty!23071 () Bool)

(assert (=> mapIsEmpty!23071 mapRes!23071))

(declare-fun b!815559 () Bool)

(assert (=> b!815559 (= e!452282 true)))

(declare-fun lt!365026 () ListLongMap!8295)

(declare-fun getCurrentListMap!2339 (array!44837 array!44835 (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 (_ BitVec 32) Int) ListLongMap!8295)

(assert (=> b!815559 (= lt!365026 (getCurrentListMap!2339 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365025 () ListLongMap!8295)

(declare-fun +!1827 (ListLongMap!8295 tuple2!9482) ListLongMap!8295)

(assert (=> b!815559 (= lt!365025 (+!1827 (getCurrentListMap!2339 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815560 () Bool)

(assert (=> b!815560 (= e!452280 tp_is_empty!14323)))

(assert (= (and start!70200 res!556931) b!815554))

(assert (= (and b!815554 res!556929) b!815553))

(assert (= (and b!815553 res!556932) b!815557))

(assert (= (and b!815557 res!556933) b!815555))

(assert (= (and b!815555 (not res!556930)) b!815559))

(assert (= (and b!815558 condMapEmpty!23071) mapIsEmpty!23071))

(assert (= (and b!815558 (not condMapEmpty!23071)) mapNonEmpty!23071))

(get-info :version)

(assert (= (and mapNonEmpty!23071 ((_ is ValueCellFull!6746) mapValue!23071)) b!815560))

(assert (= (and b!815558 ((_ is ValueCellFull!6746) mapDefault!23071)) b!815556))

(assert (= start!70200 b!815558))

(declare-fun m!756693 () Bool)

(assert (=> mapNonEmpty!23071 m!756693))

(declare-fun m!756695 () Bool)

(assert (=> b!815559 m!756695))

(declare-fun m!756697 () Bool)

(assert (=> b!815559 m!756697))

(assert (=> b!815559 m!756697))

(declare-fun m!756699 () Bool)

(assert (=> b!815559 m!756699))

(declare-fun m!756701 () Bool)

(assert (=> b!815557 m!756701))

(declare-fun m!756703 () Bool)

(assert (=> b!815555 m!756703))

(declare-fun m!756705 () Bool)

(assert (=> b!815555 m!756705))

(declare-fun m!756707 () Bool)

(assert (=> b!815555 m!756707))

(declare-fun m!756709 () Bool)

(assert (=> b!815553 m!756709))

(declare-fun m!756711 () Bool)

(assert (=> start!70200 m!756711))

(declare-fun m!756713 () Bool)

(assert (=> start!70200 m!756713))

(declare-fun m!756715 () Bool)

(assert (=> start!70200 m!756715))

(check-sat (not mapNonEmpty!23071) tp_is_empty!14323 (not b!815555) b_and!21375 (not b_next!12613) (not b!815557) (not b!815559) (not start!70200) (not b!815553))
(check-sat b_and!21375 (not b_next!12613))
