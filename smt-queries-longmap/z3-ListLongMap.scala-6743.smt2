; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84690 () Bool)

(assert start!84690)

(declare-fun b_free!20017 () Bool)

(declare-fun b_next!20017 () Bool)

(assert (=> start!84690 (= b_free!20017 (not b_next!20017))))

(declare-fun tp!69836 () Bool)

(declare-fun b_and!32121 () Bool)

(assert (=> start!84690 (= tp!69836 b_and!32121)))

(declare-fun b!989485 () Bool)

(declare-fun res!661547 () Bool)

(declare-fun e!558029 () Bool)

(assert (=> b!989485 (=> (not res!661547) (not e!558029))))

(declare-datatypes ((array!62472 0))(
  ( (array!62473 (arr!30086 (Array (_ BitVec 32) (_ BitVec 64))) (size!30566 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62472)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989485 (= res!661547 (validKeyInArray!0 (select (arr!30086 _keys!1544) from!1932)))))

(declare-fun b!989486 () Bool)

(declare-fun e!558030 () Bool)

(declare-fun tp_is_empty!23233 () Bool)

(assert (=> b!989486 (= e!558030 tp_is_empty!23233)))

(declare-fun b!989487 () Bool)

(declare-fun res!661546 () Bool)

(assert (=> b!989487 (=> (not res!661546) (not e!558029))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989487 (= res!661546 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!989488 () Bool)

(declare-datatypes ((V!35961 0))(
  ( (V!35962 (val!11667 Int)) )
))
(declare-datatypes ((ValueCell!11135 0))(
  ( (ValueCellFull!11135 (v!14231 V!35961)) (EmptyCell!11135) )
))
(declare-datatypes ((array!62474 0))(
  ( (array!62475 (arr!30087 (Array (_ BitVec 32) ValueCell!11135)) (size!30567 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62474)

(assert (=> b!989488 (= e!558029 (bvsge from!1932 (size!30567 _values!1278)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35961)

(declare-fun zeroValue!1220 () V!35961)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14892 0))(
  ( (tuple2!14893 (_1!7457 (_ BitVec 64)) (_2!7457 V!35961)) )
))
(declare-datatypes ((List!20797 0))(
  ( (Nil!20794) (Cons!20793 (h!21961 tuple2!14892) (t!29726 List!20797)) )
))
(declare-datatypes ((ListLongMap!13591 0))(
  ( (ListLongMap!13592 (toList!6811 List!20797)) )
))
(declare-fun lt!438893 () ListLongMap!13591)

(declare-fun getCurrentListMapNoExtraKeys!3539 (array!62472 array!62474 (_ BitVec 32) (_ BitVec 32) V!35961 V!35961 (_ BitVec 32) Int) ListLongMap!13591)

(assert (=> b!989488 (= lt!438893 (getCurrentListMapNoExtraKeys!3539 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989489 () Bool)

(declare-fun res!661545 () Bool)

(assert (=> b!989489 (=> (not res!661545) (not e!558029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62472 (_ BitVec 32)) Bool)

(assert (=> b!989489 (= res!661545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989490 () Bool)

(declare-fun e!558027 () Bool)

(assert (=> b!989490 (= e!558027 tp_is_empty!23233)))

(declare-fun b!989491 () Bool)

(declare-fun e!558028 () Bool)

(declare-fun mapRes!36888 () Bool)

(assert (=> b!989491 (= e!558028 (and e!558027 mapRes!36888))))

(declare-fun condMapEmpty!36888 () Bool)

(declare-fun mapDefault!36888 () ValueCell!11135)

(assert (=> b!989491 (= condMapEmpty!36888 (= (arr!30087 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11135)) mapDefault!36888)))))

(declare-fun mapIsEmpty!36888 () Bool)

(assert (=> mapIsEmpty!36888 mapRes!36888))

(declare-fun mapNonEmpty!36888 () Bool)

(declare-fun tp!69837 () Bool)

(assert (=> mapNonEmpty!36888 (= mapRes!36888 (and tp!69837 e!558030))))

(declare-fun mapRest!36888 () (Array (_ BitVec 32) ValueCell!11135))

(declare-fun mapValue!36888 () ValueCell!11135)

(declare-fun mapKey!36888 () (_ BitVec 32))

(assert (=> mapNonEmpty!36888 (= (arr!30087 _values!1278) (store mapRest!36888 mapKey!36888 mapValue!36888))))

(declare-fun b!989492 () Bool)

(declare-fun res!661541 () Bool)

(assert (=> b!989492 (=> (not res!661541) (not e!558029))))

(declare-datatypes ((List!20798 0))(
  ( (Nil!20795) (Cons!20794 (h!21962 (_ BitVec 64)) (t!29727 List!20798)) )
))
(declare-fun arrayNoDuplicates!0 (array!62472 (_ BitVec 32) List!20798) Bool)

(assert (=> b!989492 (= res!661541 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20795))))

(declare-fun res!661544 () Bool)

(assert (=> start!84690 (=> (not res!661544) (not e!558029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84690 (= res!661544 (validMask!0 mask!1948))))

(assert (=> start!84690 e!558029))

(assert (=> start!84690 true))

(assert (=> start!84690 tp_is_empty!23233))

(declare-fun array_inv!23269 (array!62474) Bool)

(assert (=> start!84690 (and (array_inv!23269 _values!1278) e!558028)))

(assert (=> start!84690 tp!69836))

(declare-fun array_inv!23270 (array!62472) Bool)

(assert (=> start!84690 (array_inv!23270 _keys!1544)))

(declare-fun b!989493 () Bool)

(declare-fun res!661542 () Bool)

(assert (=> b!989493 (=> (not res!661542) (not e!558029))))

(assert (=> b!989493 (= res!661542 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30566 _keys!1544))))))

(declare-fun b!989494 () Bool)

(declare-fun res!661543 () Bool)

(assert (=> b!989494 (=> (not res!661543) (not e!558029))))

(assert (=> b!989494 (= res!661543 (and (= (size!30567 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30566 _keys!1544) (size!30567 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84690 res!661544) b!989494))

(assert (= (and b!989494 res!661543) b!989489))

(assert (= (and b!989489 res!661545) b!989492))

(assert (= (and b!989492 res!661541) b!989493))

(assert (= (and b!989493 res!661542) b!989485))

(assert (= (and b!989485 res!661547) b!989487))

(assert (= (and b!989487 res!661546) b!989488))

(assert (= (and b!989491 condMapEmpty!36888) mapIsEmpty!36888))

(assert (= (and b!989491 (not condMapEmpty!36888)) mapNonEmpty!36888))

(get-info :version)

(assert (= (and mapNonEmpty!36888 ((_ is ValueCellFull!11135) mapValue!36888)) b!989486))

(assert (= (and b!989491 ((_ is ValueCellFull!11135) mapDefault!36888)) b!989490))

(assert (= start!84690 b!989491))

(declare-fun m!917081 () Bool)

(assert (=> b!989485 m!917081))

(assert (=> b!989485 m!917081))

(declare-fun m!917083 () Bool)

(assert (=> b!989485 m!917083))

(declare-fun m!917085 () Bool)

(assert (=> start!84690 m!917085))

(declare-fun m!917087 () Bool)

(assert (=> start!84690 m!917087))

(declare-fun m!917089 () Bool)

(assert (=> start!84690 m!917089))

(declare-fun m!917091 () Bool)

(assert (=> mapNonEmpty!36888 m!917091))

(declare-fun m!917093 () Bool)

(assert (=> b!989489 m!917093))

(declare-fun m!917095 () Bool)

(assert (=> b!989488 m!917095))

(declare-fun m!917097 () Bool)

(assert (=> b!989492 m!917097))

(check-sat (not start!84690) (not b!989489) tp_is_empty!23233 (not mapNonEmpty!36888) b_and!32121 (not b!989488) (not b_next!20017) (not b!989485) (not b!989492))
(check-sat b_and!32121 (not b_next!20017))
