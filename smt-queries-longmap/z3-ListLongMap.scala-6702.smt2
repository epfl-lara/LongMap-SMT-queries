; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84186 () Bool)

(assert start!84186)

(declare-fun b_free!19887 () Bool)

(declare-fun b_next!19887 () Bool)

(assert (=> start!84186 (= b_free!19887 (not b_next!19887))))

(declare-fun tp!69265 () Bool)

(declare-fun b_and!31851 () Bool)

(assert (=> start!84186 (= tp!69265 b_and!31851)))

(declare-fun b!984562 () Bool)

(declare-fun res!658822 () Bool)

(declare-fun e!555027 () Bool)

(assert (=> b!984562 (=> (not res!658822) (not e!555027))))

(declare-datatypes ((array!61959 0))(
  ( (array!61960 (arr!29837 (Array (_ BitVec 32) (_ BitVec 64))) (size!30316 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61959)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61959 (_ BitVec 32)) Bool)

(assert (=> b!984562 (= res!658822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984563 () Bool)

(declare-fun e!555030 () Bool)

(assert (=> b!984563 (= e!555027 e!555030)))

(declare-fun res!658818 () Bool)

(assert (=> b!984563 (=> (not res!658818) (not e!555030))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984563 (= res!658818 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29837 _keys!1544) from!1932))))))

(declare-datatypes ((V!35635 0))(
  ( (V!35636 (val!11545 Int)) )
))
(declare-datatypes ((ValueCell!11013 0))(
  ( (ValueCellFull!11013 (v!14107 V!35635)) (EmptyCell!11013) )
))
(declare-datatypes ((array!61961 0))(
  ( (array!61962 (arr!29838 (Array (_ BitVec 32) ValueCell!11013)) (size!30317 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61961)

(declare-fun lt!436870 () V!35635)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15477 (ValueCell!11013 V!35635) V!35635)

(declare-fun dynLambda!1820 (Int (_ BitVec 64)) V!35635)

(assert (=> b!984563 (= lt!436870 (get!15477 (select (arr!29838 _values!1278) from!1932) (dynLambda!1820 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35635)

(declare-fun zeroValue!1220 () V!35635)

(declare-datatypes ((tuple2!14766 0))(
  ( (tuple2!14767 (_1!7394 (_ BitVec 64)) (_2!7394 V!35635)) )
))
(declare-datatypes ((List!20658 0))(
  ( (Nil!20655) (Cons!20654 (h!21816 tuple2!14766) (t!29489 List!20658)) )
))
(declare-datatypes ((ListLongMap!13463 0))(
  ( (ListLongMap!13464 (toList!6747 List!20658)) )
))
(declare-fun lt!436867 () ListLongMap!13463)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3440 (array!61959 array!61961 (_ BitVec 32) (_ BitVec 32) V!35635 V!35635 (_ BitVec 32) Int) ListLongMap!13463)

(assert (=> b!984563 (= lt!436867 (getCurrentListMapNoExtraKeys!3440 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984564 () Bool)

(declare-fun res!658816 () Bool)

(assert (=> b!984564 (=> (not res!658816) (not e!555027))))

(assert (=> b!984564 (= res!658816 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984565 () Bool)

(declare-fun res!658819 () Bool)

(assert (=> b!984565 (=> (not res!658819) (not e!555027))))

(assert (=> b!984565 (= res!658819 (and (= (size!30317 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30316 _keys!1544) (size!30317 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984566 () Bool)

(declare-fun e!555025 () Bool)

(declare-fun tp_is_empty!22989 () Bool)

(assert (=> b!984566 (= e!555025 tp_is_empty!22989)))

(declare-fun res!658823 () Bool)

(assert (=> start!84186 (=> (not res!658823) (not e!555027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84186 (= res!658823 (validMask!0 mask!1948))))

(assert (=> start!84186 e!555027))

(assert (=> start!84186 true))

(assert (=> start!84186 tp_is_empty!22989))

(declare-fun e!555026 () Bool)

(declare-fun array_inv!23067 (array!61961) Bool)

(assert (=> start!84186 (and (array_inv!23067 _values!1278) e!555026)))

(assert (=> start!84186 tp!69265))

(declare-fun array_inv!23068 (array!61959) Bool)

(assert (=> start!84186 (array_inv!23068 _keys!1544)))

(declare-fun b!984567 () Bool)

(declare-fun e!555028 () Bool)

(declare-fun mapRes!36512 () Bool)

(assert (=> b!984567 (= e!555026 (and e!555028 mapRes!36512))))

(declare-fun condMapEmpty!36512 () Bool)

(declare-fun mapDefault!36512 () ValueCell!11013)

(assert (=> b!984567 (= condMapEmpty!36512 (= (arr!29838 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11013)) mapDefault!36512)))))

(declare-fun b!984568 () Bool)

(declare-fun res!658820 () Bool)

(assert (=> b!984568 (=> (not res!658820) (not e!555027))))

(assert (=> b!984568 (= res!658820 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30316 _keys!1544))))))

(declare-fun b!984569 () Bool)

(assert (=> b!984569 (= e!555028 tp_is_empty!22989)))

(declare-fun b!984570 () Bool)

(declare-fun res!658817 () Bool)

(assert (=> b!984570 (=> (not res!658817) (not e!555027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984570 (= res!658817 (validKeyInArray!0 (select (arr!29837 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36512 () Bool)

(declare-fun tp!69264 () Bool)

(assert (=> mapNonEmpty!36512 (= mapRes!36512 (and tp!69264 e!555025))))

(declare-fun mapKey!36512 () (_ BitVec 32))

(declare-fun mapRest!36512 () (Array (_ BitVec 32) ValueCell!11013))

(declare-fun mapValue!36512 () ValueCell!11013)

(assert (=> mapNonEmpty!36512 (= (arr!29838 _values!1278) (store mapRest!36512 mapKey!36512 mapValue!36512))))

(declare-fun mapIsEmpty!36512 () Bool)

(assert (=> mapIsEmpty!36512 mapRes!36512))

(declare-fun b!984571 () Bool)

(assert (=> b!984571 (= e!555030 (not true))))

(declare-fun lt!436868 () tuple2!14766)

(declare-fun lt!436871 () tuple2!14766)

(declare-fun +!3038 (ListLongMap!13463 tuple2!14766) ListLongMap!13463)

(assert (=> b!984571 (= (+!3038 (+!3038 lt!436867 lt!436868) lt!436871) (+!3038 (+!3038 lt!436867 lt!436871) lt!436868))))

(assert (=> b!984571 (= lt!436871 (tuple2!14767 (select (arr!29837 _keys!1544) from!1932) lt!436870))))

(assert (=> b!984571 (= lt!436868 (tuple2!14767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32715 0))(
  ( (Unit!32716) )
))
(declare-fun lt!436869 () Unit!32715)

(declare-fun addCommutativeForDiffKeys!666 (ListLongMap!13463 (_ BitVec 64) V!35635 (_ BitVec 64) V!35635) Unit!32715)

(assert (=> b!984571 (= lt!436869 (addCommutativeForDiffKeys!666 lt!436867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29837 _keys!1544) from!1932) lt!436870))))

(declare-fun b!984572 () Bool)

(declare-fun res!658821 () Bool)

(assert (=> b!984572 (=> (not res!658821) (not e!555027))))

(declare-datatypes ((List!20659 0))(
  ( (Nil!20656) (Cons!20655 (h!21817 (_ BitVec 64)) (t!29490 List!20659)) )
))
(declare-fun arrayNoDuplicates!0 (array!61959 (_ BitVec 32) List!20659) Bool)

(assert (=> b!984572 (= res!658821 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20656))))

(assert (= (and start!84186 res!658823) b!984565))

(assert (= (and b!984565 res!658819) b!984562))

(assert (= (and b!984562 res!658822) b!984572))

(assert (= (and b!984572 res!658821) b!984568))

(assert (= (and b!984568 res!658820) b!984570))

(assert (= (and b!984570 res!658817) b!984564))

(assert (= (and b!984564 res!658816) b!984563))

(assert (= (and b!984563 res!658818) b!984571))

(assert (= (and b!984567 condMapEmpty!36512) mapIsEmpty!36512))

(assert (= (and b!984567 (not condMapEmpty!36512)) mapNonEmpty!36512))

(get-info :version)

(assert (= (and mapNonEmpty!36512 ((_ is ValueCellFull!11013) mapValue!36512)) b!984566))

(assert (= (and b!984567 ((_ is ValueCellFull!11013) mapDefault!36512)) b!984569))

(assert (= start!84186 b!984567))

(declare-fun b_lambda!14919 () Bool)

(assert (=> (not b_lambda!14919) (not b!984563)))

(declare-fun t!29488 () Bool)

(declare-fun tb!6681 () Bool)

(assert (=> (and start!84186 (= defaultEntry!1281 defaultEntry!1281) t!29488) tb!6681))

(declare-fun result!13351 () Bool)

(assert (=> tb!6681 (= result!13351 tp_is_empty!22989)))

(assert (=> b!984563 t!29488))

(declare-fun b_and!31853 () Bool)

(assert (= b_and!31851 (and (=> t!29488 result!13351) b_and!31853)))

(declare-fun m!911645 () Bool)

(assert (=> b!984570 m!911645))

(assert (=> b!984570 m!911645))

(declare-fun m!911647 () Bool)

(assert (=> b!984570 m!911647))

(assert (=> b!984571 m!911645))

(declare-fun m!911649 () Bool)

(assert (=> b!984571 m!911649))

(assert (=> b!984571 m!911645))

(declare-fun m!911651 () Bool)

(assert (=> b!984571 m!911651))

(declare-fun m!911653 () Bool)

(assert (=> b!984571 m!911653))

(declare-fun m!911655 () Bool)

(assert (=> b!984571 m!911655))

(assert (=> b!984571 m!911655))

(declare-fun m!911657 () Bool)

(assert (=> b!984571 m!911657))

(assert (=> b!984571 m!911651))

(declare-fun m!911659 () Bool)

(assert (=> b!984562 m!911659))

(assert (=> b!984563 m!911645))

(declare-fun m!911661 () Bool)

(assert (=> b!984563 m!911661))

(declare-fun m!911663 () Bool)

(assert (=> b!984563 m!911663))

(declare-fun m!911665 () Bool)

(assert (=> b!984563 m!911665))

(assert (=> b!984563 m!911661))

(assert (=> b!984563 m!911665))

(declare-fun m!911667 () Bool)

(assert (=> b!984563 m!911667))

(declare-fun m!911669 () Bool)

(assert (=> b!984572 m!911669))

(declare-fun m!911671 () Bool)

(assert (=> start!84186 m!911671))

(declare-fun m!911673 () Bool)

(assert (=> start!84186 m!911673))

(declare-fun m!911675 () Bool)

(assert (=> start!84186 m!911675))

(declare-fun m!911677 () Bool)

(assert (=> mapNonEmpty!36512 m!911677))

(check-sat (not mapNonEmpty!36512) (not b_next!19887) (not b!984571) (not b!984572) (not b!984563) (not b!984570) tp_is_empty!22989 b_and!31853 (not start!84186) (not b!984562) (not b_lambda!14919))
(check-sat b_and!31853 (not b_next!19887))
