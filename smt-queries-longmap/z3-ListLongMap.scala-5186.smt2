; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70104 () Bool)

(assert start!70104)

(declare-fun b_free!12525 () Bool)

(declare-fun b_next!12525 () Bool)

(assert (=> start!70104 (= b_free!12525 (not b_next!12525))))

(declare-fun tp!44290 () Bool)

(declare-fun b_and!21297 () Bool)

(assert (=> start!70104 (= tp!44290 b_and!21297)))

(declare-fun b!814667 () Bool)

(declare-fun e!451619 () Bool)

(declare-fun tp_is_empty!14235 () Bool)

(assert (=> b!814667 (= e!451619 tp_is_empty!14235)))

(declare-fun b!814668 () Bool)

(declare-fun res!556409 () Bool)

(declare-fun e!451622 () Bool)

(assert (=> b!814668 (=> (not res!556409) (not e!451622))))

(declare-datatypes ((array!44672 0))(
  ( (array!44673 (arr!21396 (Array (_ BitVec 32) (_ BitVec 64))) (size!21817 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44672)

(declare-datatypes ((List!15222 0))(
  ( (Nil!15219) (Cons!15218 (h!16347 (_ BitVec 64)) (t!21539 List!15222)) )
))
(declare-fun arrayNoDuplicates!0 (array!44672 (_ BitVec 32) List!15222) Bool)

(assert (=> b!814668 (= res!556409 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15219))))

(declare-fun b!814669 () Bool)

(declare-fun e!451621 () Bool)

(declare-fun mapRes!22933 () Bool)

(assert (=> b!814669 (= e!451621 (and e!451619 mapRes!22933))))

(declare-fun condMapEmpty!22933 () Bool)

(declare-datatypes ((V!23981 0))(
  ( (V!23982 (val!7165 Int)) )
))
(declare-datatypes ((ValueCell!6702 0))(
  ( (ValueCellFull!6702 (v!9592 V!23981)) (EmptyCell!6702) )
))
(declare-datatypes ((array!44674 0))(
  ( (array!44675 (arr!21397 (Array (_ BitVec 32) ValueCell!6702)) (size!21818 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44674)

(declare-fun mapDefault!22933 () ValueCell!6702)

(assert (=> b!814669 (= condMapEmpty!22933 (= (arr!21397 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6702)) mapDefault!22933)))))

(declare-fun b!814670 () Bool)

(declare-fun res!556407 () Bool)

(assert (=> b!814670 (=> (not res!556407) (not e!451622))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814670 (= res!556407 (and (= (size!21818 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21817 _keys!976) (size!21818 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556408 () Bool)

(assert (=> start!70104 (=> (not res!556408) (not e!451622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70104 (= res!556408 (validMask!0 mask!1312))))

(assert (=> start!70104 e!451622))

(assert (=> start!70104 tp_is_empty!14235))

(declare-fun array_inv!17119 (array!44672) Bool)

(assert (=> start!70104 (array_inv!17119 _keys!976)))

(assert (=> start!70104 true))

(declare-fun array_inv!17120 (array!44674) Bool)

(assert (=> start!70104 (and (array_inv!17120 _values!788) e!451621)))

(assert (=> start!70104 tp!44290))

(declare-fun b!814671 () Bool)

(declare-fun res!556410 () Bool)

(assert (=> b!814671 (=> (not res!556410) (not e!451622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44672 (_ BitVec 32)) Bool)

(assert (=> b!814671 (= res!556410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22933 () Bool)

(assert (=> mapIsEmpty!22933 mapRes!22933))

(declare-fun b!814672 () Bool)

(assert (=> b!814672 (= e!451622 (not true))))

(declare-datatypes ((tuple2!9390 0))(
  ( (tuple2!9391 (_1!4706 (_ BitVec 64)) (_2!4706 V!23981)) )
))
(declare-datatypes ((List!15223 0))(
  ( (Nil!15220) (Cons!15219 (h!16348 tuple2!9390) (t!21540 List!15223)) )
))
(declare-datatypes ((ListLongMap!8213 0))(
  ( (ListLongMap!8214 (toList!4122 List!15223)) )
))
(declare-fun lt!364716 () ListLongMap!8213)

(declare-fun lt!364714 () ListLongMap!8213)

(assert (=> b!814672 (= lt!364716 lt!364714)))

(declare-fun zeroValueBefore!34 () V!23981)

(declare-datatypes ((Unit!27742 0))(
  ( (Unit!27743) )
))
(declare-fun lt!364715 () Unit!27742)

(declare-fun zeroValueAfter!34 () V!23981)

(declare-fun minValue!754 () V!23981)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!282 (array!44672 array!44674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23981 V!23981 V!23981 V!23981 (_ BitVec 32) Int) Unit!27742)

(assert (=> b!814672 (= lt!364715 (lemmaNoChangeToArrayThenSameMapNoExtras!282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2172 (array!44672 array!44674 (_ BitVec 32) (_ BitVec 32) V!23981 V!23981 (_ BitVec 32) Int) ListLongMap!8213)

(assert (=> b!814672 (= lt!364714 (getCurrentListMapNoExtraKeys!2172 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814672 (= lt!364716 (getCurrentListMapNoExtraKeys!2172 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22933 () Bool)

(declare-fun tp!44289 () Bool)

(declare-fun e!451623 () Bool)

(assert (=> mapNonEmpty!22933 (= mapRes!22933 (and tp!44289 e!451623))))

(declare-fun mapValue!22933 () ValueCell!6702)

(declare-fun mapRest!22933 () (Array (_ BitVec 32) ValueCell!6702))

(declare-fun mapKey!22933 () (_ BitVec 32))

(assert (=> mapNonEmpty!22933 (= (arr!21397 _values!788) (store mapRest!22933 mapKey!22933 mapValue!22933))))

(declare-fun b!814673 () Bool)

(assert (=> b!814673 (= e!451623 tp_is_empty!14235)))

(assert (= (and start!70104 res!556408) b!814670))

(assert (= (and b!814670 res!556407) b!814671))

(assert (= (and b!814671 res!556410) b!814668))

(assert (= (and b!814668 res!556409) b!814672))

(assert (= (and b!814669 condMapEmpty!22933) mapIsEmpty!22933))

(assert (= (and b!814669 (not condMapEmpty!22933)) mapNonEmpty!22933))

(get-info :version)

(assert (= (and mapNonEmpty!22933 ((_ is ValueCellFull!6702) mapValue!22933)) b!814673))

(assert (= (and b!814669 ((_ is ValueCellFull!6702) mapDefault!22933)) b!814667))

(assert (= start!70104 b!814669))

(declare-fun m!756449 () Bool)

(assert (=> start!70104 m!756449))

(declare-fun m!756451 () Bool)

(assert (=> start!70104 m!756451))

(declare-fun m!756453 () Bool)

(assert (=> start!70104 m!756453))

(declare-fun m!756455 () Bool)

(assert (=> mapNonEmpty!22933 m!756455))

(declare-fun m!756457 () Bool)

(assert (=> b!814671 m!756457))

(declare-fun m!756459 () Bool)

(assert (=> b!814672 m!756459))

(declare-fun m!756461 () Bool)

(assert (=> b!814672 m!756461))

(declare-fun m!756463 () Bool)

(assert (=> b!814672 m!756463))

(declare-fun m!756465 () Bool)

(assert (=> b!814668 m!756465))

(check-sat tp_is_empty!14235 (not b!814668) (not start!70104) (not b!814672) (not b_next!12525) b_and!21297 (not b!814671) (not mapNonEmpty!22933))
(check-sat b_and!21297 (not b_next!12525))
