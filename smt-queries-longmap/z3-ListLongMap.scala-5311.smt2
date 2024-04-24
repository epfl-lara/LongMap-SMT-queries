; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71252 () Bool)

(assert start!71252)

(declare-fun b_free!13273 () Bool)

(declare-fun b_next!13273 () Bool)

(assert (=> start!71252 (= b_free!13273 (not b_next!13273))))

(declare-fun tp!46575 () Bool)

(declare-fun b_and!22197 () Bool)

(assert (=> start!71252 (= tp!46575 b_and!22197)))

(declare-datatypes ((V!24979 0))(
  ( (V!24980 (val!7539 Int)) )
))
(declare-datatypes ((tuple2!9902 0))(
  ( (tuple2!9903 (_1!4962 (_ BitVec 64)) (_2!4962 V!24979)) )
))
(declare-fun lt!373201 () tuple2!9902)

(declare-fun e!460113 () Bool)

(declare-datatypes ((List!15687 0))(
  ( (Nil!15684) (Cons!15683 (h!16818 tuple2!9902) (t!22024 List!15687)) )
))
(declare-datatypes ((ListLongMap!8727 0))(
  ( (ListLongMap!8728 (toList!4379 List!15687)) )
))
(declare-fun lt!373197 () ListLongMap!8727)

(declare-fun lt!373199 () ListLongMap!8727)

(declare-fun b!826452 () Bool)

(declare-fun lt!373193 () tuple2!9902)

(declare-fun +!1926 (ListLongMap!8727 tuple2!9902) ListLongMap!8727)

(assert (=> b!826452 (= e!460113 (= lt!373199 (+!1926 (+!1926 lt!373197 lt!373201) lt!373193)))))

(declare-fun res!563129 () Bool)

(declare-fun e!460114 () Bool)

(assert (=> start!71252 (=> (not res!563129) (not e!460114))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71252 (= res!563129 (validMask!0 mask!1312))))

(assert (=> start!71252 e!460114))

(declare-fun tp_is_empty!14983 () Bool)

(assert (=> start!71252 tp_is_empty!14983))

(declare-datatypes ((array!46149 0))(
  ( (array!46150 (arr!22116 (Array (_ BitVec 32) (_ BitVec 64))) (size!22536 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46149)

(declare-fun array_inv!17673 (array!46149) Bool)

(assert (=> start!71252 (array_inv!17673 _keys!976)))

(assert (=> start!71252 true))

(declare-datatypes ((ValueCell!7076 0))(
  ( (ValueCellFull!7076 (v!9972 V!24979)) (EmptyCell!7076) )
))
(declare-datatypes ((array!46151 0))(
  ( (array!46152 (arr!22117 (Array (_ BitVec 32) ValueCell!7076)) (size!22537 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46151)

(declare-fun e!460110 () Bool)

(declare-fun array_inv!17674 (array!46151) Bool)

(assert (=> start!71252 (and (array_inv!17674 _values!788) e!460110)))

(assert (=> start!71252 tp!46575))

(declare-fun b!826453 () Bool)

(declare-fun e!460111 () Bool)

(declare-fun mapRes!24097 () Bool)

(assert (=> b!826453 (= e!460110 (and e!460111 mapRes!24097))))

(declare-fun condMapEmpty!24097 () Bool)

(declare-fun mapDefault!24097 () ValueCell!7076)

(assert (=> b!826453 (= condMapEmpty!24097 (= (arr!22117 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7076)) mapDefault!24097)))))

(declare-fun b!826454 () Bool)

(declare-fun res!563127 () Bool)

(assert (=> b!826454 (=> (not res!563127) (not e!460114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46149 (_ BitVec 32)) Bool)

(assert (=> b!826454 (= res!563127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826455 () Bool)

(declare-fun e!460115 () Bool)

(assert (=> b!826455 (= e!460115 tp_is_empty!14983)))

(declare-fun b!826456 () Bool)

(declare-fun e!460112 () Bool)

(assert (=> b!826456 (= e!460114 (not e!460112))))

(declare-fun res!563130 () Bool)

(assert (=> b!826456 (=> res!563130 e!460112)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826456 (= res!563130 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373206 () ListLongMap!8727)

(assert (=> b!826456 (= lt!373206 lt!373197)))

(declare-fun zeroValueBefore!34 () V!24979)

(declare-fun zeroValueAfter!34 () V!24979)

(declare-fun minValue!754 () V!24979)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28310 0))(
  ( (Unit!28311) )
))
(declare-fun lt!373204 () Unit!28310)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!548 (array!46149 array!46151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24979 V!24979 V!24979 V!24979 (_ BitVec 32) Int) Unit!28310)

(assert (=> b!826456 (= lt!373204 (lemmaNoChangeToArrayThenSameMapNoExtras!548 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2460 (array!46149 array!46151 (_ BitVec 32) (_ BitVec 32) V!24979 V!24979 (_ BitVec 32) Int) ListLongMap!8727)

(assert (=> b!826456 (= lt!373197 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826456 (= lt!373206 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24097 () Bool)

(assert (=> mapIsEmpty!24097 mapRes!24097))

(declare-fun e!460109 () Bool)

(declare-fun b!826457 () Bool)

(assert (=> b!826457 (= e!460109 (= lt!373199 (+!1926 (+!1926 lt!373197 (tuple2!9903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373201)))))

(declare-fun b!826458 () Bool)

(assert (=> b!826458 (= e!460112 true)))

(declare-fun lt!373194 () ListLongMap!8727)

(assert (=> b!826458 (= lt!373194 (+!1926 (+!1926 lt!373206 lt!373193) lt!373201))))

(declare-fun lt!373198 () ListLongMap!8727)

(declare-fun lt!373196 () ListLongMap!8727)

(assert (=> b!826458 (and (= lt!373198 lt!373196) (= lt!373199 lt!373196) (= lt!373199 lt!373198))))

(declare-fun lt!373200 () ListLongMap!8727)

(assert (=> b!826458 (= lt!373196 (+!1926 lt!373200 lt!373193))))

(declare-fun lt!373202 () ListLongMap!8727)

(assert (=> b!826458 (= lt!373198 (+!1926 lt!373202 lt!373193))))

(declare-fun lt!373203 () Unit!28310)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!214 (ListLongMap!8727 (_ BitVec 64) V!24979 V!24979) Unit!28310)

(assert (=> b!826458 (= lt!373203 (addSameAsAddTwiceSameKeyDiffValues!214 lt!373202 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826458 e!460113))

(declare-fun res!563131 () Bool)

(assert (=> b!826458 (=> (not res!563131) (not e!460113))))

(declare-fun lt!373205 () ListLongMap!8727)

(assert (=> b!826458 (= res!563131 (= lt!373205 lt!373200))))

(declare-fun lt!373195 () tuple2!9902)

(assert (=> b!826458 (= lt!373200 (+!1926 lt!373202 lt!373195))))

(assert (=> b!826458 (= lt!373202 (+!1926 lt!373206 lt!373201))))

(assert (=> b!826458 (= lt!373193 (tuple2!9903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826458 e!460109))

(declare-fun res!563126 () Bool)

(assert (=> b!826458 (=> (not res!563126) (not e!460109))))

(assert (=> b!826458 (= res!563126 (= lt!373205 (+!1926 (+!1926 lt!373206 lt!373195) lt!373201)))))

(assert (=> b!826458 (= lt!373201 (tuple2!9903 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826458 (= lt!373195 (tuple2!9903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2505 (array!46149 array!46151 (_ BitVec 32) (_ BitVec 32) V!24979 V!24979 (_ BitVec 32) Int) ListLongMap!8727)

(assert (=> b!826458 (= lt!373199 (getCurrentListMap!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826458 (= lt!373205 (getCurrentListMap!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826459 () Bool)

(assert (=> b!826459 (= e!460111 tp_is_empty!14983)))

(declare-fun b!826460 () Bool)

(declare-fun res!563128 () Bool)

(assert (=> b!826460 (=> (not res!563128) (not e!460114))))

(assert (=> b!826460 (= res!563128 (and (= (size!22537 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22536 _keys!976) (size!22537 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826461 () Bool)

(declare-fun res!563132 () Bool)

(assert (=> b!826461 (=> (not res!563132) (not e!460114))))

(declare-datatypes ((List!15688 0))(
  ( (Nil!15685) (Cons!15684 (h!16819 (_ BitVec 64)) (t!22025 List!15688)) )
))
(declare-fun arrayNoDuplicates!0 (array!46149 (_ BitVec 32) List!15688) Bool)

(assert (=> b!826461 (= res!563132 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15685))))

(declare-fun mapNonEmpty!24097 () Bool)

(declare-fun tp!46576 () Bool)

(assert (=> mapNonEmpty!24097 (= mapRes!24097 (and tp!46576 e!460115))))

(declare-fun mapValue!24097 () ValueCell!7076)

(declare-fun mapRest!24097 () (Array (_ BitVec 32) ValueCell!7076))

(declare-fun mapKey!24097 () (_ BitVec 32))

(assert (=> mapNonEmpty!24097 (= (arr!22117 _values!788) (store mapRest!24097 mapKey!24097 mapValue!24097))))

(assert (= (and start!71252 res!563129) b!826460))

(assert (= (and b!826460 res!563128) b!826454))

(assert (= (and b!826454 res!563127) b!826461))

(assert (= (and b!826461 res!563132) b!826456))

(assert (= (and b!826456 (not res!563130)) b!826458))

(assert (= (and b!826458 res!563126) b!826457))

(assert (= (and b!826458 res!563131) b!826452))

(assert (= (and b!826453 condMapEmpty!24097) mapIsEmpty!24097))

(assert (= (and b!826453 (not condMapEmpty!24097)) mapNonEmpty!24097))

(get-info :version)

(assert (= (and mapNonEmpty!24097 ((_ is ValueCellFull!7076) mapValue!24097)) b!826455))

(assert (= (and b!826453 ((_ is ValueCellFull!7076) mapDefault!24097)) b!826459))

(assert (= start!71252 b!826453))

(declare-fun m!769071 () Bool)

(assert (=> b!826457 m!769071))

(assert (=> b!826457 m!769071))

(declare-fun m!769073 () Bool)

(assert (=> b!826457 m!769073))

(declare-fun m!769075 () Bool)

(assert (=> b!826458 m!769075))

(declare-fun m!769077 () Bool)

(assert (=> b!826458 m!769077))

(assert (=> b!826458 m!769075))

(declare-fun m!769079 () Bool)

(assert (=> b!826458 m!769079))

(declare-fun m!769081 () Bool)

(assert (=> b!826458 m!769081))

(declare-fun m!769083 () Bool)

(assert (=> b!826458 m!769083))

(declare-fun m!769085 () Bool)

(assert (=> b!826458 m!769085))

(declare-fun m!769087 () Bool)

(assert (=> b!826458 m!769087))

(declare-fun m!769089 () Bool)

(assert (=> b!826458 m!769089))

(declare-fun m!769091 () Bool)

(assert (=> b!826458 m!769091))

(declare-fun m!769093 () Bool)

(assert (=> b!826458 m!769093))

(assert (=> b!826458 m!769085))

(declare-fun m!769095 () Bool)

(assert (=> b!826458 m!769095))

(declare-fun m!769097 () Bool)

(assert (=> b!826452 m!769097))

(assert (=> b!826452 m!769097))

(declare-fun m!769099 () Bool)

(assert (=> b!826452 m!769099))

(declare-fun m!769101 () Bool)

(assert (=> b!826461 m!769101))

(declare-fun m!769103 () Bool)

(assert (=> mapNonEmpty!24097 m!769103))

(declare-fun m!769105 () Bool)

(assert (=> start!71252 m!769105))

(declare-fun m!769107 () Bool)

(assert (=> start!71252 m!769107))

(declare-fun m!769109 () Bool)

(assert (=> start!71252 m!769109))

(declare-fun m!769111 () Bool)

(assert (=> b!826456 m!769111))

(declare-fun m!769113 () Bool)

(assert (=> b!826456 m!769113))

(declare-fun m!769115 () Bool)

(assert (=> b!826456 m!769115))

(declare-fun m!769117 () Bool)

(assert (=> b!826454 m!769117))

(check-sat (not b!826452) (not b_next!13273) (not b!826458) b_and!22197 (not b!826461) (not b!826454) (not mapNonEmpty!24097) (not b!826456) (not b!826457) tp_is_empty!14983 (not start!71252))
(check-sat b_and!22197 (not b_next!13273))
