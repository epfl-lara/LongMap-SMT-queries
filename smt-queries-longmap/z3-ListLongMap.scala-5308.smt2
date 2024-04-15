; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71048 () Bool)

(assert start!71048)

(declare-fun b_free!13255 () Bool)

(declare-fun b_next!13255 () Bool)

(assert (=> start!71048 (= b_free!13255 (not b_next!13255))))

(declare-fun tp!46521 () Bool)

(declare-fun b_and!22143 () Bool)

(assert (=> start!71048 (= tp!46521 b_and!22143)))

(declare-fun mapIsEmpty!24070 () Bool)

(declare-fun mapRes!24070 () Bool)

(assert (=> mapIsEmpty!24070 mapRes!24070))

(declare-fun b!825042 () Bool)

(declare-fun e!459166 () Bool)

(declare-fun tp_is_empty!14965 () Bool)

(assert (=> b!825042 (= e!459166 tp_is_empty!14965)))

(declare-fun b!825043 () Bool)

(declare-fun res!562488 () Bool)

(declare-fun e!459169 () Bool)

(assert (=> b!825043 (=> (not res!562488) (not e!459169))))

(declare-datatypes ((array!46083 0))(
  ( (array!46084 (arr!22088 (Array (_ BitVec 32) (_ BitVec 64))) (size!22509 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46083)

(declare-datatypes ((V!24955 0))(
  ( (V!24956 (val!7530 Int)) )
))
(declare-datatypes ((ValueCell!7067 0))(
  ( (ValueCellFull!7067 (v!9957 V!24955)) (EmptyCell!7067) )
))
(declare-datatypes ((array!46085 0))(
  ( (array!46086 (arr!22089 (Array (_ BitVec 32) ValueCell!7067)) (size!22510 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46085)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825043 (= res!562488 (and (= (size!22510 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22509 _keys!976) (size!22510 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825044 () Bool)

(declare-fun res!562491 () Bool)

(assert (=> b!825044 (=> (not res!562491) (not e!459169))))

(declare-datatypes ((List!15769 0))(
  ( (Nil!15766) (Cons!15765 (h!16894 (_ BitVec 64)) (t!22105 List!15769)) )
))
(declare-fun arrayNoDuplicates!0 (array!46083 (_ BitVec 32) List!15769) Bool)

(assert (=> b!825044 (= res!562491 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15766))))

(declare-fun b!825045 () Bool)

(declare-fun e!459165 () Bool)

(assert (=> b!825045 (= e!459165 tp_is_empty!14965)))

(declare-fun b!825046 () Bool)

(declare-fun res!562485 () Bool)

(assert (=> b!825046 (=> (not res!562485) (not e!459169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46083 (_ BitVec 32)) Bool)

(assert (=> b!825046 (= res!562485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825047 () Bool)

(declare-fun e!459171 () Bool)

(assert (=> b!825047 (= e!459171 true)))

(declare-datatypes ((tuple2!9972 0))(
  ( (tuple2!9973 (_1!4997 (_ BitVec 64)) (_2!4997 V!24955)) )
))
(declare-datatypes ((List!15770 0))(
  ( (Nil!15767) (Cons!15766 (h!16895 tuple2!9972) (t!22106 List!15770)) )
))
(declare-datatypes ((ListLongMap!8785 0))(
  ( (ListLongMap!8786 (toList!4408 List!15770)) )
))
(declare-fun lt!372222 () ListLongMap!8785)

(declare-fun lt!372228 () tuple2!9972)

(declare-fun lt!372231 () tuple2!9972)

(declare-fun lt!372218 () ListLongMap!8785)

(declare-fun +!1945 (ListLongMap!8785 tuple2!9972) ListLongMap!8785)

(assert (=> b!825047 (= lt!372218 (+!1945 (+!1945 lt!372222 lt!372231) lt!372228))))

(declare-fun lt!372220 () ListLongMap!8785)

(declare-fun lt!372227 () ListLongMap!8785)

(declare-fun lt!372225 () ListLongMap!8785)

(assert (=> b!825047 (and (= lt!372220 lt!372227) (= lt!372225 lt!372227) (= lt!372225 lt!372220))))

(declare-fun lt!372219 () ListLongMap!8785)

(assert (=> b!825047 (= lt!372227 (+!1945 lt!372219 lt!372231))))

(declare-fun lt!372230 () ListLongMap!8785)

(assert (=> b!825047 (= lt!372220 (+!1945 lt!372230 lt!372231))))

(declare-fun zeroValueBefore!34 () V!24955)

(declare-datatypes ((Unit!28235 0))(
  ( (Unit!28236) )
))
(declare-fun lt!372224 () Unit!28235)

(declare-fun zeroValueAfter!34 () V!24955)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!216 (ListLongMap!8785 (_ BitVec 64) V!24955 V!24955) Unit!28235)

(assert (=> b!825047 (= lt!372224 (addSameAsAddTwiceSameKeyDiffValues!216 lt!372230 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459167 () Bool)

(assert (=> b!825047 e!459167))

(declare-fun res!562487 () Bool)

(assert (=> b!825047 (=> (not res!562487) (not e!459167))))

(declare-fun lt!372229 () ListLongMap!8785)

(assert (=> b!825047 (= res!562487 (= lt!372229 lt!372219))))

(declare-fun lt!372221 () tuple2!9972)

(assert (=> b!825047 (= lt!372219 (+!1945 lt!372230 lt!372221))))

(assert (=> b!825047 (= lt!372230 (+!1945 lt!372222 lt!372228))))

(assert (=> b!825047 (= lt!372231 (tuple2!9973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459170 () Bool)

(assert (=> b!825047 e!459170))

(declare-fun res!562490 () Bool)

(assert (=> b!825047 (=> (not res!562490) (not e!459170))))

(assert (=> b!825047 (= res!562490 (= lt!372229 (+!1945 (+!1945 lt!372222 lt!372221) lt!372228)))))

(declare-fun minValue!754 () V!24955)

(assert (=> b!825047 (= lt!372228 (tuple2!9973 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825047 (= lt!372221 (tuple2!9973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2499 (array!46083 array!46085 (_ BitVec 32) (_ BitVec 32) V!24955 V!24955 (_ BitVec 32) Int) ListLongMap!8785)

(assert (=> b!825047 (= lt!372225 (getCurrentListMap!2499 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825047 (= lt!372229 (getCurrentListMap!2499 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825048 () Bool)

(declare-fun e!459164 () Bool)

(assert (=> b!825048 (= e!459164 (and e!459166 mapRes!24070))))

(declare-fun condMapEmpty!24070 () Bool)

(declare-fun mapDefault!24070 () ValueCell!7067)

(assert (=> b!825048 (= condMapEmpty!24070 (= (arr!22089 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7067)) mapDefault!24070)))))

(declare-fun mapNonEmpty!24070 () Bool)

(declare-fun tp!46522 () Bool)

(assert (=> mapNonEmpty!24070 (= mapRes!24070 (and tp!46522 e!459165))))

(declare-fun mapKey!24070 () (_ BitVec 32))

(declare-fun mapRest!24070 () (Array (_ BitVec 32) ValueCell!7067))

(declare-fun mapValue!24070 () ValueCell!7067)

(assert (=> mapNonEmpty!24070 (= (arr!22089 _values!788) (store mapRest!24070 mapKey!24070 mapValue!24070))))

(declare-fun res!562489 () Bool)

(assert (=> start!71048 (=> (not res!562489) (not e!459169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71048 (= res!562489 (validMask!0 mask!1312))))

(assert (=> start!71048 e!459169))

(assert (=> start!71048 tp_is_empty!14965))

(declare-fun array_inv!17683 (array!46083) Bool)

(assert (=> start!71048 (array_inv!17683 _keys!976)))

(assert (=> start!71048 true))

(declare-fun array_inv!17684 (array!46085) Bool)

(assert (=> start!71048 (and (array_inv!17684 _values!788) e!459164)))

(assert (=> start!71048 tp!46521))

(declare-fun b!825049 () Bool)

(assert (=> b!825049 (= e!459169 (not e!459171))))

(declare-fun res!562486 () Bool)

(assert (=> b!825049 (=> res!562486 e!459171)))

(assert (=> b!825049 (= res!562486 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372223 () ListLongMap!8785)

(assert (=> b!825049 (= lt!372222 lt!372223)))

(declare-fun lt!372226 () Unit!28235)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!542 (array!46083 array!46085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24955 V!24955 V!24955 V!24955 (_ BitVec 32) Int) Unit!28235)

(assert (=> b!825049 (= lt!372226 (lemmaNoChangeToArrayThenSameMapNoExtras!542 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2449 (array!46083 array!46085 (_ BitVec 32) (_ BitVec 32) V!24955 V!24955 (_ BitVec 32) Int) ListLongMap!8785)

(assert (=> b!825049 (= lt!372223 (getCurrentListMapNoExtraKeys!2449 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825049 (= lt!372222 (getCurrentListMapNoExtraKeys!2449 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825050 () Bool)

(assert (=> b!825050 (= e!459167 (= lt!372225 (+!1945 (+!1945 lt!372223 lt!372228) lt!372231)))))

(declare-fun b!825051 () Bool)

(assert (=> b!825051 (= e!459170 (= lt!372225 (+!1945 (+!1945 lt!372223 (tuple2!9973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372228)))))

(assert (= (and start!71048 res!562489) b!825043))

(assert (= (and b!825043 res!562488) b!825046))

(assert (= (and b!825046 res!562485) b!825044))

(assert (= (and b!825044 res!562491) b!825049))

(assert (= (and b!825049 (not res!562486)) b!825047))

(assert (= (and b!825047 res!562490) b!825051))

(assert (= (and b!825047 res!562487) b!825050))

(assert (= (and b!825048 condMapEmpty!24070) mapIsEmpty!24070))

(assert (= (and b!825048 (not condMapEmpty!24070)) mapNonEmpty!24070))

(get-info :version)

(assert (= (and mapNonEmpty!24070 ((_ is ValueCellFull!7067) mapValue!24070)) b!825045))

(assert (= (and b!825048 ((_ is ValueCellFull!7067) mapDefault!24070)) b!825042))

(assert (= start!71048 b!825048))

(declare-fun m!766605 () Bool)

(assert (=> b!825044 m!766605))

(declare-fun m!766607 () Bool)

(assert (=> mapNonEmpty!24070 m!766607))

(declare-fun m!766609 () Bool)

(assert (=> b!825051 m!766609))

(assert (=> b!825051 m!766609))

(declare-fun m!766611 () Bool)

(assert (=> b!825051 m!766611))

(declare-fun m!766613 () Bool)

(assert (=> b!825046 m!766613))

(declare-fun m!766615 () Bool)

(assert (=> b!825047 m!766615))

(declare-fun m!766617 () Bool)

(assert (=> b!825047 m!766617))

(declare-fun m!766619 () Bool)

(assert (=> b!825047 m!766619))

(declare-fun m!766621 () Bool)

(assert (=> b!825047 m!766621))

(declare-fun m!766623 () Bool)

(assert (=> b!825047 m!766623))

(declare-fun m!766625 () Bool)

(assert (=> b!825047 m!766625))

(declare-fun m!766627 () Bool)

(assert (=> b!825047 m!766627))

(assert (=> b!825047 m!766623))

(declare-fun m!766629 () Bool)

(assert (=> b!825047 m!766629))

(assert (=> b!825047 m!766617))

(declare-fun m!766631 () Bool)

(assert (=> b!825047 m!766631))

(declare-fun m!766633 () Bool)

(assert (=> b!825047 m!766633))

(declare-fun m!766635 () Bool)

(assert (=> b!825047 m!766635))

(declare-fun m!766637 () Bool)

(assert (=> b!825050 m!766637))

(assert (=> b!825050 m!766637))

(declare-fun m!766639 () Bool)

(assert (=> b!825050 m!766639))

(declare-fun m!766641 () Bool)

(assert (=> start!71048 m!766641))

(declare-fun m!766643 () Bool)

(assert (=> start!71048 m!766643))

(declare-fun m!766645 () Bool)

(assert (=> start!71048 m!766645))

(declare-fun m!766647 () Bool)

(assert (=> b!825049 m!766647))

(declare-fun m!766649 () Bool)

(assert (=> b!825049 m!766649))

(declare-fun m!766651 () Bool)

(assert (=> b!825049 m!766651))

(check-sat (not mapNonEmpty!24070) (not b!825051) b_and!22143 (not b!825047) tp_is_empty!14965 (not start!71048) (not b_next!13255) (not b!825050) (not b!825044) (not b!825046) (not b!825049))
(check-sat b_and!22143 (not b_next!13255))
