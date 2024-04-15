; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84172 () Bool)

(assert start!84172)

(declare-fun b_free!19891 () Bool)

(declare-fun b_next!19891 () Bool)

(assert (=> start!84172 (= b_free!19891 (not b_next!19891))))

(declare-fun tp!69278 () Bool)

(declare-fun b_and!31833 () Bool)

(assert (=> start!84172 (= tp!69278 b_and!31833)))

(declare-fun b!984393 () Bool)

(declare-fun res!658754 () Bool)

(declare-fun e!554913 () Bool)

(assert (=> b!984393 (=> (not res!658754) (not e!554913))))

(declare-datatypes ((V!35641 0))(
  ( (V!35642 (val!11547 Int)) )
))
(declare-datatypes ((ValueCell!11015 0))(
  ( (ValueCellFull!11015 (v!14108 V!35641)) (EmptyCell!11015) )
))
(declare-datatypes ((array!61894 0))(
  ( (array!61895 (arr!29805 (Array (_ BitVec 32) ValueCell!11015)) (size!30286 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61894)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61896 0))(
  ( (array!61897 (arr!29806 (Array (_ BitVec 32) (_ BitVec 64))) (size!30287 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61896)

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!984393 (= res!658754 (and (= (size!30286 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30287 _keys!1544) (size!30286 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984394 () Bool)

(declare-fun e!554915 () Bool)

(assert (=> b!984394 (= e!554913 e!554915)))

(declare-fun res!658757 () Bool)

(assert (=> b!984394 (=> (not res!658757) (not e!554915))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984394 (= res!658757 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29806 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436664 () V!35641)

(declare-fun get!15480 (ValueCell!11015 V!35641) V!35641)

(declare-fun dynLambda!1816 (Int (_ BitVec 64)) V!35641)

(assert (=> b!984394 (= lt!436664 (get!15480 (select (arr!29805 _values!1278) from!1932) (dynLambda!1816 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35641)

(declare-datatypes ((tuple2!14846 0))(
  ( (tuple2!14847 (_1!7434 (_ BitVec 64)) (_2!7434 V!35641)) )
))
(declare-datatypes ((List!20698 0))(
  ( (Nil!20695) (Cons!20694 (h!21856 tuple2!14846) (t!29524 List!20698)) )
))
(declare-datatypes ((ListLongMap!13533 0))(
  ( (ListLongMap!13534 (toList!6782 List!20698)) )
))
(declare-fun lt!436665 () ListLongMap!13533)

(declare-fun zeroValue!1220 () V!35641)

(declare-fun getCurrentListMapNoExtraKeys!3488 (array!61896 array!61894 (_ BitVec 32) (_ BitVec 32) V!35641 V!35641 (_ BitVec 32) Int) ListLongMap!13533)

(assert (=> b!984394 (= lt!436665 (getCurrentListMapNoExtraKeys!3488 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984395 () Bool)

(assert (=> b!984395 (= e!554915 (not true))))

(declare-fun lt!436663 () tuple2!14846)

(declare-fun lt!436661 () tuple2!14846)

(declare-fun +!3062 (ListLongMap!13533 tuple2!14846) ListLongMap!13533)

(assert (=> b!984395 (= (+!3062 (+!3062 lt!436665 lt!436663) lt!436661) (+!3062 (+!3062 lt!436665 lt!436661) lt!436663))))

(assert (=> b!984395 (= lt!436661 (tuple2!14847 (select (arr!29806 _keys!1544) from!1932) lt!436664))))

(assert (=> b!984395 (= lt!436663 (tuple2!14847 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32590 0))(
  ( (Unit!32591) )
))
(declare-fun lt!436662 () Unit!32590)

(declare-fun addCommutativeForDiffKeys!666 (ListLongMap!13533 (_ BitVec 64) V!35641 (_ BitVec 64) V!35641) Unit!32590)

(assert (=> b!984395 (= lt!436662 (addCommutativeForDiffKeys!666 lt!436665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29806 _keys!1544) from!1932) lt!436664))))

(declare-fun b!984396 () Bool)

(declare-fun res!658760 () Bool)

(assert (=> b!984396 (=> (not res!658760) (not e!554913))))

(assert (=> b!984396 (= res!658760 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984397 () Bool)

(declare-fun res!658761 () Bool)

(assert (=> b!984397 (=> (not res!658761) (not e!554913))))

(declare-datatypes ((List!20699 0))(
  ( (Nil!20696) (Cons!20695 (h!21857 (_ BitVec 64)) (t!29525 List!20699)) )
))
(declare-fun arrayNoDuplicates!0 (array!61896 (_ BitVec 32) List!20699) Bool)

(assert (=> b!984397 (= res!658761 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20696))))

(declare-fun mapIsEmpty!36518 () Bool)

(declare-fun mapRes!36518 () Bool)

(assert (=> mapIsEmpty!36518 mapRes!36518))

(declare-fun res!658756 () Bool)

(assert (=> start!84172 (=> (not res!658756) (not e!554913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84172 (= res!658756 (validMask!0 mask!1948))))

(assert (=> start!84172 e!554913))

(assert (=> start!84172 true))

(declare-fun tp_is_empty!22993 () Bool)

(assert (=> start!84172 tp_is_empty!22993))

(declare-fun e!554918 () Bool)

(declare-fun array_inv!23045 (array!61894) Bool)

(assert (=> start!84172 (and (array_inv!23045 _values!1278) e!554918)))

(assert (=> start!84172 tp!69278))

(declare-fun array_inv!23046 (array!61896) Bool)

(assert (=> start!84172 (array_inv!23046 _keys!1544)))

(declare-fun b!984398 () Bool)

(declare-fun e!554916 () Bool)

(assert (=> b!984398 (= e!554916 tp_is_empty!22993)))

(declare-fun b!984399 () Bool)

(assert (=> b!984399 (= e!554918 (and e!554916 mapRes!36518))))

(declare-fun condMapEmpty!36518 () Bool)

(declare-fun mapDefault!36518 () ValueCell!11015)

(assert (=> b!984399 (= condMapEmpty!36518 (= (arr!29805 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11015)) mapDefault!36518)))))

(declare-fun b!984400 () Bool)

(declare-fun res!658759 () Bool)

(assert (=> b!984400 (=> (not res!658759) (not e!554913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984400 (= res!658759 (validKeyInArray!0 (select (arr!29806 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36518 () Bool)

(declare-fun tp!69277 () Bool)

(declare-fun e!554917 () Bool)

(assert (=> mapNonEmpty!36518 (= mapRes!36518 (and tp!69277 e!554917))))

(declare-fun mapRest!36518 () (Array (_ BitVec 32) ValueCell!11015))

(declare-fun mapValue!36518 () ValueCell!11015)

(declare-fun mapKey!36518 () (_ BitVec 32))

(assert (=> mapNonEmpty!36518 (= (arr!29805 _values!1278) (store mapRest!36518 mapKey!36518 mapValue!36518))))

(declare-fun b!984401 () Bool)

(declare-fun res!658755 () Bool)

(assert (=> b!984401 (=> (not res!658755) (not e!554913))))

(assert (=> b!984401 (= res!658755 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30287 _keys!1544))))))

(declare-fun b!984402 () Bool)

(assert (=> b!984402 (= e!554917 tp_is_empty!22993)))

(declare-fun b!984403 () Bool)

(declare-fun res!658758 () Bool)

(assert (=> b!984403 (=> (not res!658758) (not e!554913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61896 (_ BitVec 32)) Bool)

(assert (=> b!984403 (= res!658758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84172 res!658756) b!984393))

(assert (= (and b!984393 res!658754) b!984403))

(assert (= (and b!984403 res!658758) b!984397))

(assert (= (and b!984397 res!658761) b!984401))

(assert (= (and b!984401 res!658755) b!984400))

(assert (= (and b!984400 res!658759) b!984396))

(assert (= (and b!984396 res!658760) b!984394))

(assert (= (and b!984394 res!658757) b!984395))

(assert (= (and b!984399 condMapEmpty!36518) mapIsEmpty!36518))

(assert (= (and b!984399 (not condMapEmpty!36518)) mapNonEmpty!36518))

(get-info :version)

(assert (= (and mapNonEmpty!36518 ((_ is ValueCellFull!11015) mapValue!36518)) b!984402))

(assert (= (and b!984399 ((_ is ValueCellFull!11015) mapDefault!36518)) b!984398))

(assert (= start!84172 b!984399))

(declare-fun b_lambda!14905 () Bool)

(assert (=> (not b_lambda!14905) (not b!984394)))

(declare-fun t!29523 () Bool)

(declare-fun tb!6677 () Bool)

(assert (=> (and start!84172 (= defaultEntry!1281 defaultEntry!1281) t!29523) tb!6677))

(declare-fun result!13351 () Bool)

(assert (=> tb!6677 (= result!13351 tp_is_empty!22993)))

(assert (=> b!984394 t!29523))

(declare-fun b_and!31835 () Bool)

(assert (= b_and!31833 (and (=> t!29523 result!13351) b_and!31835)))

(declare-fun m!910955 () Bool)

(assert (=> b!984395 m!910955))

(assert (=> b!984395 m!910955))

(declare-fun m!910957 () Bool)

(assert (=> b!984395 m!910957))

(declare-fun m!910959 () Bool)

(assert (=> b!984395 m!910959))

(assert (=> b!984395 m!910959))

(declare-fun m!910961 () Bool)

(assert (=> b!984395 m!910961))

(declare-fun m!910963 () Bool)

(assert (=> b!984395 m!910963))

(assert (=> b!984395 m!910963))

(declare-fun m!910965 () Bool)

(assert (=> b!984395 m!910965))

(declare-fun m!910967 () Bool)

(assert (=> b!984403 m!910967))

(declare-fun m!910969 () Bool)

(assert (=> start!84172 m!910969))

(declare-fun m!910971 () Bool)

(assert (=> start!84172 m!910971))

(declare-fun m!910973 () Bool)

(assert (=> start!84172 m!910973))

(assert (=> b!984394 m!910955))

(declare-fun m!910975 () Bool)

(assert (=> b!984394 m!910975))

(declare-fun m!910977 () Bool)

(assert (=> b!984394 m!910977))

(declare-fun m!910979 () Bool)

(assert (=> b!984394 m!910979))

(assert (=> b!984394 m!910975))

(assert (=> b!984394 m!910979))

(declare-fun m!910981 () Bool)

(assert (=> b!984394 m!910981))

(declare-fun m!910983 () Bool)

(assert (=> mapNonEmpty!36518 m!910983))

(declare-fun m!910985 () Bool)

(assert (=> b!984397 m!910985))

(assert (=> b!984400 m!910955))

(assert (=> b!984400 m!910955))

(declare-fun m!910987 () Bool)

(assert (=> b!984400 m!910987))

(check-sat (not b!984400) (not b_lambda!14905) (not b!984394) b_and!31835 tp_is_empty!22993 (not b!984397) (not mapNonEmpty!36518) (not start!84172) (not b!984395) (not b!984403) (not b_next!19891))
(check-sat b_and!31835 (not b_next!19891))
