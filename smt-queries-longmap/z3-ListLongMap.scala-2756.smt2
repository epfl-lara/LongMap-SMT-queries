; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40374 () Bool)

(assert start!40374)

(declare-fun b!443863 () Bool)

(declare-fun res!263132 () Bool)

(declare-fun e!261098 () Bool)

(assert (=> b!443863 (=> (not res!263132) (not e!261098))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443863 (= res!263132 (validKeyInArray!0 k0!794))))

(declare-fun b!443864 () Bool)

(declare-fun res!263129 () Bool)

(assert (=> b!443864 (=> (not res!263129) (not e!261098))))

(declare-datatypes ((array!27360 0))(
  ( (array!27361 (arr!13127 (Array (_ BitVec 32) (_ BitVec 64))) (size!13479 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27360)

(declare-fun arrayContainsKey!0 (array!27360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443864 (= res!263129 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443865 () Bool)

(declare-fun res!263136 () Bool)

(assert (=> b!443865 (=> (not res!263136) (not e!261098))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27360 (_ BitVec 32)) Bool)

(assert (=> b!443865 (= res!263136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443866 () Bool)

(declare-fun e!261097 () Bool)

(declare-fun tp_is_empty!11773 () Bool)

(assert (=> b!443866 (= e!261097 tp_is_empty!11773)))

(declare-fun b!443867 () Bool)

(declare-fun e!261099 () Bool)

(assert (=> b!443867 (= e!261099 tp_is_empty!11773)))

(declare-fun b!443868 () Bool)

(declare-fun res!263134 () Bool)

(assert (=> b!443868 (=> (not res!263134) (not e!261098))))

(declare-datatypes ((List!7772 0))(
  ( (Nil!7769) (Cons!7768 (h!8624 (_ BitVec 64)) (t!13522 List!7772)) )
))
(declare-fun arrayNoDuplicates!0 (array!27360 (_ BitVec 32) List!7772) Bool)

(assert (=> b!443868 (= res!263134 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7769))))

(declare-fun b!443869 () Bool)

(declare-fun e!261102 () Bool)

(assert (=> b!443869 (= e!261102 false)))

(declare-fun lt!203430 () Bool)

(declare-fun lt!203429 () array!27360)

(assert (=> b!443869 (= lt!203430 (arrayNoDuplicates!0 lt!203429 #b00000000000000000000000000000000 Nil!7769))))

(declare-fun b!443870 () Bool)

(declare-fun res!263137 () Bool)

(assert (=> b!443870 (=> (not res!263137) (not e!261098))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443870 (= res!263137 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13479 _keys!709))))))

(declare-fun b!443871 () Bool)

(declare-fun res!263128 () Bool)

(assert (=> b!443871 (=> (not res!263128) (not e!261098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443871 (= res!263128 (validMask!0 mask!1025))))

(declare-fun b!443873 () Bool)

(declare-fun res!263131 () Bool)

(assert (=> b!443873 (=> (not res!263131) (not e!261098))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16803 0))(
  ( (V!16804 (val!5931 Int)) )
))
(declare-datatypes ((ValueCell!5543 0))(
  ( (ValueCellFull!5543 (v!8183 V!16803)) (EmptyCell!5543) )
))
(declare-datatypes ((array!27362 0))(
  ( (array!27363 (arr!13128 (Array (_ BitVec 32) ValueCell!5543)) (size!13480 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27362)

(assert (=> b!443873 (= res!263131 (and (= (size!13480 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13479 _keys!709) (size!13480 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443874 () Bool)

(declare-fun res!263133 () Bool)

(assert (=> b!443874 (=> (not res!263133) (not e!261098))))

(assert (=> b!443874 (= res!263133 (or (= (select (arr!13127 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13127 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443875 () Bool)

(declare-fun e!261100 () Bool)

(declare-fun mapRes!19287 () Bool)

(assert (=> b!443875 (= e!261100 (and e!261097 mapRes!19287))))

(declare-fun condMapEmpty!19287 () Bool)

(declare-fun mapDefault!19287 () ValueCell!5543)

(assert (=> b!443875 (= condMapEmpty!19287 (= (arr!13128 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5543)) mapDefault!19287)))))

(declare-fun mapIsEmpty!19287 () Bool)

(assert (=> mapIsEmpty!19287 mapRes!19287))

(declare-fun mapNonEmpty!19287 () Bool)

(declare-fun tp!37269 () Bool)

(assert (=> mapNonEmpty!19287 (= mapRes!19287 (and tp!37269 e!261099))))

(declare-fun mapRest!19287 () (Array (_ BitVec 32) ValueCell!5543))

(declare-fun mapKey!19287 () (_ BitVec 32))

(declare-fun mapValue!19287 () ValueCell!5543)

(assert (=> mapNonEmpty!19287 (= (arr!13128 _values!549) (store mapRest!19287 mapKey!19287 mapValue!19287))))

(declare-fun b!443872 () Bool)

(assert (=> b!443872 (= e!261098 e!261102)))

(declare-fun res!263130 () Bool)

(assert (=> b!443872 (=> (not res!263130) (not e!261102))))

(assert (=> b!443872 (= res!263130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203429 mask!1025))))

(assert (=> b!443872 (= lt!203429 (array!27361 (store (arr!13127 _keys!709) i!563 k0!794) (size!13479 _keys!709)))))

(declare-fun res!263135 () Bool)

(assert (=> start!40374 (=> (not res!263135) (not e!261098))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40374 (= res!263135 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13479 _keys!709))))))

(assert (=> start!40374 e!261098))

(assert (=> start!40374 true))

(declare-fun array_inv!9592 (array!27362) Bool)

(assert (=> start!40374 (and (array_inv!9592 _values!549) e!261100)))

(declare-fun array_inv!9593 (array!27360) Bool)

(assert (=> start!40374 (array_inv!9593 _keys!709)))

(assert (= (and start!40374 res!263135) b!443871))

(assert (= (and b!443871 res!263128) b!443873))

(assert (= (and b!443873 res!263131) b!443865))

(assert (= (and b!443865 res!263136) b!443868))

(assert (= (and b!443868 res!263134) b!443870))

(assert (= (and b!443870 res!263137) b!443863))

(assert (= (and b!443863 res!263132) b!443874))

(assert (= (and b!443874 res!263133) b!443864))

(assert (= (and b!443864 res!263129) b!443872))

(assert (= (and b!443872 res!263130) b!443869))

(assert (= (and b!443875 condMapEmpty!19287) mapIsEmpty!19287))

(assert (= (and b!443875 (not condMapEmpty!19287)) mapNonEmpty!19287))

(get-info :version)

(assert (= (and mapNonEmpty!19287 ((_ is ValueCellFull!5543) mapValue!19287)) b!443867))

(assert (= (and b!443875 ((_ is ValueCellFull!5543) mapDefault!19287)) b!443866))

(assert (= start!40374 b!443875))

(declare-fun m!430215 () Bool)

(assert (=> start!40374 m!430215))

(declare-fun m!430217 () Bool)

(assert (=> start!40374 m!430217))

(declare-fun m!430219 () Bool)

(assert (=> b!443868 m!430219))

(declare-fun m!430221 () Bool)

(assert (=> b!443872 m!430221))

(declare-fun m!430223 () Bool)

(assert (=> b!443872 m!430223))

(declare-fun m!430225 () Bool)

(assert (=> b!443863 m!430225))

(declare-fun m!430227 () Bool)

(assert (=> b!443864 m!430227))

(declare-fun m!430229 () Bool)

(assert (=> b!443865 m!430229))

(declare-fun m!430231 () Bool)

(assert (=> b!443874 m!430231))

(declare-fun m!430233 () Bool)

(assert (=> mapNonEmpty!19287 m!430233))

(declare-fun m!430235 () Bool)

(assert (=> b!443871 m!430235))

(declare-fun m!430237 () Bool)

(assert (=> b!443869 m!430237))

(check-sat (not start!40374) (not b!443872) (not mapNonEmpty!19287) (not b!443871) (not b!443869) tp_is_empty!11773 (not b!443865) (not b!443863) (not b!443864) (not b!443868))
(check-sat)
