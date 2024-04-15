; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84154 () Bool)

(assert start!84154)

(declare-fun b_free!19873 () Bool)

(declare-fun b_next!19873 () Bool)

(assert (=> start!84154 (= b_free!19873 (not b_next!19873))))

(declare-fun tp!69224 () Bool)

(declare-fun b_and!31797 () Bool)

(assert (=> start!84154 (= tp!69224 b_and!31797)))

(declare-fun b!984078 () Bool)

(declare-fun res!658539 () Bool)

(declare-fun e!554754 () Bool)

(assert (=> b!984078 (=> (not res!658539) (not e!554754))))

(declare-datatypes ((array!61858 0))(
  ( (array!61859 (arr!29787 (Array (_ BitVec 32) (_ BitVec 64))) (size!30268 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61858)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984078 (= res!658539 (validKeyInArray!0 (select (arr!29787 _keys!1544) from!1932)))))

(declare-fun b!984079 () Bool)

(declare-fun e!554752 () Bool)

(declare-fun tp_is_empty!22975 () Bool)

(assert (=> b!984079 (= e!554752 tp_is_empty!22975)))

(declare-fun b!984080 () Bool)

(declare-fun res!658544 () Bool)

(assert (=> b!984080 (=> (not res!658544) (not e!554754))))

(declare-datatypes ((List!20683 0))(
  ( (Nil!20680) (Cons!20679 (h!21841 (_ BitVec 64)) (t!29491 List!20683)) )
))
(declare-fun arrayNoDuplicates!0 (array!61858 (_ BitVec 32) List!20683) Bool)

(assert (=> b!984080 (= res!658544 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20680))))

(declare-fun b!984082 () Bool)

(declare-fun res!658540 () Bool)

(assert (=> b!984082 (=> (not res!658540) (not e!554754))))

(declare-datatypes ((V!35617 0))(
  ( (V!35618 (val!11538 Int)) )
))
(declare-datatypes ((ValueCell!11006 0))(
  ( (ValueCellFull!11006 (v!14099 V!35617)) (EmptyCell!11006) )
))
(declare-datatypes ((array!61860 0))(
  ( (array!61861 (arr!29788 (Array (_ BitVec 32) ValueCell!11006)) (size!30269 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61860)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!984082 (= res!658540 (and (= (size!30269 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30268 _keys!1544) (size!30269 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984083 () Bool)

(declare-fun e!554753 () Bool)

(declare-fun mapRes!36491 () Bool)

(assert (=> b!984083 (= e!554753 (and e!554752 mapRes!36491))))

(declare-fun condMapEmpty!36491 () Bool)

(declare-fun mapDefault!36491 () ValueCell!11006)

(assert (=> b!984083 (= condMapEmpty!36491 (= (arr!29788 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11006)) mapDefault!36491)))))

(declare-fun b!984084 () Bool)

(declare-fun res!658541 () Bool)

(assert (=> b!984084 (=> (not res!658541) (not e!554754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61858 (_ BitVec 32)) Bool)

(assert (=> b!984084 (= res!658541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36491 () Bool)

(declare-fun tp!69223 () Bool)

(declare-fun e!554751 () Bool)

(assert (=> mapNonEmpty!36491 (= mapRes!36491 (and tp!69223 e!554751))))

(declare-fun mapValue!36491 () ValueCell!11006)

(declare-fun mapKey!36491 () (_ BitVec 32))

(declare-fun mapRest!36491 () (Array (_ BitVec 32) ValueCell!11006))

(assert (=> mapNonEmpty!36491 (= (arr!29788 _values!1278) (store mapRest!36491 mapKey!36491 mapValue!36491))))

(declare-fun b!984085 () Bool)

(assert (=> b!984085 (= e!554751 tp_is_empty!22975)))

(declare-fun mapIsEmpty!36491 () Bool)

(assert (=> mapIsEmpty!36491 mapRes!36491))

(declare-fun b!984086 () Bool)

(declare-fun res!658538 () Bool)

(assert (=> b!984086 (=> (not res!658538) (not e!554754))))

(assert (=> b!984086 (= res!658538 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30268 _keys!1544))))))

(declare-fun b!984081 () Bool)

(declare-fun e!554756 () Bool)

(assert (=> b!984081 (= e!554756 (not true))))

(declare-datatypes ((tuple2!14830 0))(
  ( (tuple2!14831 (_1!7426 (_ BitVec 64)) (_2!7426 V!35617)) )
))
(declare-datatypes ((List!20684 0))(
  ( (Nil!20681) (Cons!20680 (h!21842 tuple2!14830) (t!29492 List!20684)) )
))
(declare-datatypes ((ListLongMap!13517 0))(
  ( (ListLongMap!13518 (toList!6774 List!20684)) )
))
(declare-fun lt!436530 () ListLongMap!13517)

(declare-fun lt!436528 () tuple2!14830)

(declare-fun lt!436526 () tuple2!14830)

(declare-fun +!3056 (ListLongMap!13517 tuple2!14830) ListLongMap!13517)

(assert (=> b!984081 (= (+!3056 (+!3056 lt!436530 lt!436528) lt!436526) (+!3056 (+!3056 lt!436530 lt!436526) lt!436528))))

(declare-fun lt!436529 () V!35617)

(assert (=> b!984081 (= lt!436526 (tuple2!14831 (select (arr!29787 _keys!1544) from!1932) lt!436529))))

(declare-fun minValue!1220 () V!35617)

(assert (=> b!984081 (= lt!436528 (tuple2!14831 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32578 0))(
  ( (Unit!32579) )
))
(declare-fun lt!436527 () Unit!32578)

(declare-fun addCommutativeForDiffKeys!660 (ListLongMap!13517 (_ BitVec 64) V!35617 (_ BitVec 64) V!35617) Unit!32578)

(assert (=> b!984081 (= lt!436527 (addCommutativeForDiffKeys!660 lt!436530 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29787 _keys!1544) from!1932) lt!436529))))

(declare-fun res!658545 () Bool)

(assert (=> start!84154 (=> (not res!658545) (not e!554754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84154 (= res!658545 (validMask!0 mask!1948))))

(assert (=> start!84154 e!554754))

(assert (=> start!84154 true))

(assert (=> start!84154 tp_is_empty!22975))

(declare-fun array_inv!23035 (array!61860) Bool)

(assert (=> start!84154 (and (array_inv!23035 _values!1278) e!554753)))

(assert (=> start!84154 tp!69224))

(declare-fun array_inv!23036 (array!61858) Bool)

(assert (=> start!84154 (array_inv!23036 _keys!1544)))

(declare-fun b!984087 () Bool)

(assert (=> b!984087 (= e!554754 e!554756)))

(declare-fun res!658542 () Bool)

(assert (=> b!984087 (=> (not res!658542) (not e!554756))))

(assert (=> b!984087 (= res!658542 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29787 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15468 (ValueCell!11006 V!35617) V!35617)

(declare-fun dynLambda!1810 (Int (_ BitVec 64)) V!35617)

(assert (=> b!984087 (= lt!436529 (get!15468 (select (arr!29788 _values!1278) from!1932) (dynLambda!1810 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35617)

(declare-fun getCurrentListMapNoExtraKeys!3482 (array!61858 array!61860 (_ BitVec 32) (_ BitVec 32) V!35617 V!35617 (_ BitVec 32) Int) ListLongMap!13517)

(assert (=> b!984087 (= lt!436530 (getCurrentListMapNoExtraKeys!3482 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984088 () Bool)

(declare-fun res!658543 () Bool)

(assert (=> b!984088 (=> (not res!658543) (not e!554754))))

(assert (=> b!984088 (= res!658543 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!84154 res!658545) b!984082))

(assert (= (and b!984082 res!658540) b!984084))

(assert (= (and b!984084 res!658541) b!984080))

(assert (= (and b!984080 res!658544) b!984086))

(assert (= (and b!984086 res!658538) b!984078))

(assert (= (and b!984078 res!658539) b!984088))

(assert (= (and b!984088 res!658543) b!984087))

(assert (= (and b!984087 res!658542) b!984081))

(assert (= (and b!984083 condMapEmpty!36491) mapIsEmpty!36491))

(assert (= (and b!984083 (not condMapEmpty!36491)) mapNonEmpty!36491))

(get-info :version)

(assert (= (and mapNonEmpty!36491 ((_ is ValueCellFull!11006) mapValue!36491)) b!984085))

(assert (= (and b!984083 ((_ is ValueCellFull!11006) mapDefault!36491)) b!984079))

(assert (= start!84154 b!984083))

(declare-fun b_lambda!14887 () Bool)

(assert (=> (not b_lambda!14887) (not b!984087)))

(declare-fun t!29490 () Bool)

(declare-fun tb!6659 () Bool)

(assert (=> (and start!84154 (= defaultEntry!1281 defaultEntry!1281) t!29490) tb!6659))

(declare-fun result!13315 () Bool)

(assert (=> tb!6659 (= result!13315 tp_is_empty!22975)))

(assert (=> b!984087 t!29490))

(declare-fun b_and!31799 () Bool)

(assert (= b_and!31797 (and (=> t!29490 result!13315) b_and!31799)))

(declare-fun m!910649 () Bool)

(assert (=> b!984078 m!910649))

(assert (=> b!984078 m!910649))

(declare-fun m!910651 () Bool)

(assert (=> b!984078 m!910651))

(declare-fun m!910653 () Bool)

(assert (=> start!84154 m!910653))

(declare-fun m!910655 () Bool)

(assert (=> start!84154 m!910655))

(declare-fun m!910657 () Bool)

(assert (=> start!84154 m!910657))

(assert (=> b!984087 m!910649))

(declare-fun m!910659 () Bool)

(assert (=> b!984087 m!910659))

(declare-fun m!910661 () Bool)

(assert (=> b!984087 m!910661))

(declare-fun m!910663 () Bool)

(assert (=> b!984087 m!910663))

(assert (=> b!984087 m!910659))

(assert (=> b!984087 m!910663))

(declare-fun m!910665 () Bool)

(assert (=> b!984087 m!910665))

(declare-fun m!910667 () Bool)

(assert (=> b!984081 m!910667))

(declare-fun m!910669 () Bool)

(assert (=> b!984081 m!910669))

(assert (=> b!984081 m!910649))

(declare-fun m!910671 () Bool)

(assert (=> b!984081 m!910671))

(assert (=> b!984081 m!910649))

(declare-fun m!910673 () Bool)

(assert (=> b!984081 m!910673))

(assert (=> b!984081 m!910673))

(declare-fun m!910675 () Bool)

(assert (=> b!984081 m!910675))

(assert (=> b!984081 m!910667))

(declare-fun m!910677 () Bool)

(assert (=> b!984084 m!910677))

(declare-fun m!910679 () Bool)

(assert (=> b!984080 m!910679))

(declare-fun m!910681 () Bool)

(assert (=> mapNonEmpty!36491 m!910681))

(check-sat (not b!984078) (not b_lambda!14887) (not start!84154) tp_is_empty!22975 (not b_next!19873) (not mapNonEmpty!36491) (not b!984081) (not b!984080) b_and!31799 (not b!984084) (not b!984087))
(check-sat b_and!31799 (not b_next!19873))
