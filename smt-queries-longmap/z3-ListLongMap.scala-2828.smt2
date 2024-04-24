; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40918 () Bool)

(assert start!40918)

(declare-fun b_free!10867 () Bool)

(declare-fun b_next!10867 () Bool)

(assert (=> start!40918 (= b_free!10867 (not b_next!10867))))

(declare-fun tp!38427 () Bool)

(declare-fun b_and!19019 () Bool)

(assert (=> start!40918 (= tp!38427 b_and!19019)))

(declare-fun mapIsEmpty!19948 () Bool)

(declare-fun mapRes!19948 () Bool)

(assert (=> mapIsEmpty!19948 mapRes!19948))

(declare-fun b!455071 () Bool)

(declare-fun res!271313 () Bool)

(declare-fun e!266119 () Bool)

(assert (=> b!455071 (=> (not res!271313) (not e!266119))))

(declare-datatypes ((array!28206 0))(
  ( (array!28207 (arr!13546 (Array (_ BitVec 32) (_ BitVec 64))) (size!13898 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28206)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455071 (= res!271313 (or (= (select (arr!13546 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13546 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455072 () Bool)

(declare-fun res!271316 () Bool)

(assert (=> b!455072 (=> (not res!271316) (not e!266119))))

(assert (=> b!455072 (= res!271316 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13898 _keys!709))))))

(declare-fun mapNonEmpty!19948 () Bool)

(declare-fun tp!38428 () Bool)

(declare-fun e!266117 () Bool)

(assert (=> mapNonEmpty!19948 (= mapRes!19948 (and tp!38428 e!266117))))

(declare-datatypes ((V!17379 0))(
  ( (V!17380 (val!6147 Int)) )
))
(declare-datatypes ((ValueCell!5759 0))(
  ( (ValueCellFull!5759 (v!8414 V!17379)) (EmptyCell!5759) )
))
(declare-datatypes ((array!28208 0))(
  ( (array!28209 (arr!13547 (Array (_ BitVec 32) ValueCell!5759)) (size!13899 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28208)

(declare-fun mapKey!19948 () (_ BitVec 32))

(declare-fun mapRest!19948 () (Array (_ BitVec 32) ValueCell!5759))

(declare-fun mapValue!19948 () ValueCell!5759)

(assert (=> mapNonEmpty!19948 (= (arr!13547 _values!549) (store mapRest!19948 mapKey!19948 mapValue!19948))))

(declare-fun b!455073 () Bool)

(declare-fun res!271320 () Bool)

(assert (=> b!455073 (=> (not res!271320) (not e!266119))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455073 (= res!271320 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455075 () Bool)

(declare-fun res!271321 () Bool)

(declare-fun e!266122 () Bool)

(assert (=> b!455075 (=> (not res!271321) (not e!266122))))

(declare-fun lt!206286 () array!28206)

(declare-datatypes ((List!8074 0))(
  ( (Nil!8071) (Cons!8070 (h!8926 (_ BitVec 64)) (t!13894 List!8074)) )
))
(declare-fun arrayNoDuplicates!0 (array!28206 (_ BitVec 32) List!8074) Bool)

(assert (=> b!455075 (= res!271321 (arrayNoDuplicates!0 lt!206286 #b00000000000000000000000000000000 Nil!8071))))

(declare-fun b!455076 () Bool)

(declare-fun res!271319 () Bool)

(assert (=> b!455076 (=> (not res!271319) (not e!266119))))

(assert (=> b!455076 (= res!271319 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8071))))

(declare-fun b!455077 () Bool)

(declare-fun tp_is_empty!12205 () Bool)

(assert (=> b!455077 (= e!266117 tp_is_empty!12205)))

(declare-fun b!455078 () Bool)

(declare-fun res!271322 () Bool)

(assert (=> b!455078 (=> (not res!271322) (not e!266119))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28206 (_ BitVec 32)) Bool)

(assert (=> b!455078 (= res!271322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455079 () Bool)

(declare-fun res!271324 () Bool)

(assert (=> b!455079 (=> (not res!271324) (not e!266119))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!455079 (= res!271324 (and (= (size!13899 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13898 _keys!709) (size!13899 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455080 () Bool)

(declare-fun res!271318 () Bool)

(assert (=> b!455080 (=> (not res!271318) (not e!266122))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!455080 (= res!271318 (bvsle from!863 i!563))))

(declare-fun b!455081 () Bool)

(assert (=> b!455081 (= e!266119 e!266122)))

(declare-fun res!271315 () Bool)

(assert (=> b!455081 (=> (not res!271315) (not e!266122))))

(assert (=> b!455081 (= res!271315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206286 mask!1025))))

(assert (=> b!455081 (= lt!206286 (array!28207 (store (arr!13546 _keys!709) i!563 k0!794) (size!13898 _keys!709)))))

(declare-fun b!455082 () Bool)

(declare-fun res!271317 () Bool)

(assert (=> b!455082 (=> (not res!271317) (not e!266119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455082 (= res!271317 (validMask!0 mask!1025))))

(declare-fun b!455083 () Bool)

(declare-fun res!271314 () Bool)

(assert (=> b!455083 (=> (not res!271314) (not e!266119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455083 (= res!271314 (validKeyInArray!0 k0!794))))

(declare-fun b!455084 () Bool)

(declare-fun e!266120 () Bool)

(assert (=> b!455084 (= e!266120 tp_is_empty!12205)))

(declare-fun b!455085 () Bool)

(declare-fun e!266121 () Bool)

(assert (=> b!455085 (= e!266121 (and e!266120 mapRes!19948))))

(declare-fun condMapEmpty!19948 () Bool)

(declare-fun mapDefault!19948 () ValueCell!5759)

(assert (=> b!455085 (= condMapEmpty!19948 (= (arr!13547 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5759)) mapDefault!19948)))))

(declare-fun b!455074 () Bool)

(assert (=> b!455074 (= e!266122 false)))

(declare-fun minValue!515 () V!17379)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8004 0))(
  ( (tuple2!8005 (_1!4013 (_ BitVec 64)) (_2!4013 V!17379)) )
))
(declare-datatypes ((List!8075 0))(
  ( (Nil!8072) (Cons!8071 (h!8927 tuple2!8004) (t!13895 List!8075)) )
))
(declare-datatypes ((ListLongMap!6919 0))(
  ( (ListLongMap!6920 (toList!3475 List!8075)) )
))
(declare-fun lt!206287 () ListLongMap!6919)

(declare-fun v!412 () V!17379)

(declare-fun zeroValue!515 () V!17379)

(declare-fun getCurrentListMapNoExtraKeys!1704 (array!28206 array!28208 (_ BitVec 32) (_ BitVec 32) V!17379 V!17379 (_ BitVec 32) Int) ListLongMap!6919)

(assert (=> b!455074 (= lt!206287 (getCurrentListMapNoExtraKeys!1704 lt!206286 (array!28209 (store (arr!13547 _values!549) i!563 (ValueCellFull!5759 v!412)) (size!13899 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206288 () ListLongMap!6919)

(assert (=> b!455074 (= lt!206288 (getCurrentListMapNoExtraKeys!1704 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!271323 () Bool)

(assert (=> start!40918 (=> (not res!271323) (not e!266119))))

(assert (=> start!40918 (= res!271323 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13898 _keys!709))))))

(assert (=> start!40918 e!266119))

(assert (=> start!40918 tp_is_empty!12205))

(assert (=> start!40918 tp!38427))

(assert (=> start!40918 true))

(declare-fun array_inv!9886 (array!28208) Bool)

(assert (=> start!40918 (and (array_inv!9886 _values!549) e!266121)))

(declare-fun array_inv!9887 (array!28206) Bool)

(assert (=> start!40918 (array_inv!9887 _keys!709)))

(assert (= (and start!40918 res!271323) b!455082))

(assert (= (and b!455082 res!271317) b!455079))

(assert (= (and b!455079 res!271324) b!455078))

(assert (= (and b!455078 res!271322) b!455076))

(assert (= (and b!455076 res!271319) b!455072))

(assert (= (and b!455072 res!271316) b!455083))

(assert (= (and b!455083 res!271314) b!455071))

(assert (= (and b!455071 res!271313) b!455073))

(assert (= (and b!455073 res!271320) b!455081))

(assert (= (and b!455081 res!271315) b!455075))

(assert (= (and b!455075 res!271321) b!455080))

(assert (= (and b!455080 res!271318) b!455074))

(assert (= (and b!455085 condMapEmpty!19948) mapIsEmpty!19948))

(assert (= (and b!455085 (not condMapEmpty!19948)) mapNonEmpty!19948))

(get-info :version)

(assert (= (and mapNonEmpty!19948 ((_ is ValueCellFull!5759) mapValue!19948)) b!455077))

(assert (= (and b!455085 ((_ is ValueCellFull!5759) mapDefault!19948)) b!455084))

(assert (= start!40918 b!455085))

(declare-fun m!439203 () Bool)

(assert (=> b!455082 m!439203))

(declare-fun m!439205 () Bool)

(assert (=> b!455074 m!439205))

(declare-fun m!439207 () Bool)

(assert (=> b!455074 m!439207))

(declare-fun m!439209 () Bool)

(assert (=> b!455074 m!439209))

(declare-fun m!439211 () Bool)

(assert (=> b!455075 m!439211))

(declare-fun m!439213 () Bool)

(assert (=> start!40918 m!439213))

(declare-fun m!439215 () Bool)

(assert (=> start!40918 m!439215))

(declare-fun m!439217 () Bool)

(assert (=> b!455076 m!439217))

(declare-fun m!439219 () Bool)

(assert (=> b!455071 m!439219))

(declare-fun m!439221 () Bool)

(assert (=> b!455083 m!439221))

(declare-fun m!439223 () Bool)

(assert (=> b!455081 m!439223))

(declare-fun m!439225 () Bool)

(assert (=> b!455081 m!439225))

(declare-fun m!439227 () Bool)

(assert (=> b!455078 m!439227))

(declare-fun m!439229 () Bool)

(assert (=> mapNonEmpty!19948 m!439229))

(declare-fun m!439231 () Bool)

(assert (=> b!455073 m!439231))

(check-sat (not b!455073) (not mapNonEmpty!19948) tp_is_empty!12205 (not b!455076) (not b_next!10867) (not b!455074) (not b!455075) (not start!40918) (not b!455083) (not b!455082) (not b!455078) (not b!455081) b_and!19019)
(check-sat b_and!19019 (not b_next!10867))
