; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112322 () Bool)

(assert start!112322)

(declare-fun b!1329038 () Bool)

(declare-fun e!757741 () Bool)

(declare-fun tp_is_empty!36403 () Bool)

(assert (=> b!1329038 (= e!757741 tp_is_empty!36403)))

(declare-fun mapNonEmpty!56278 () Bool)

(declare-fun mapRes!56278 () Bool)

(declare-fun tp!107185 () Bool)

(assert (=> mapNonEmpty!56278 (= mapRes!56278 (and tp!107185 e!757741))))

(declare-fun mapKey!56278 () (_ BitVec 32))

(declare-datatypes ((V!53641 0))(
  ( (V!53642 (val!18276 Int)) )
))
(declare-datatypes ((ValueCell!17303 0))(
  ( (ValueCellFull!17303 (v!20908 V!53641)) (EmptyCell!17303) )
))
(declare-datatypes ((array!89817 0))(
  ( (array!89818 (arr!43370 (Array (_ BitVec 32) ValueCell!17303)) (size!43921 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89817)

(declare-fun mapValue!56278 () ValueCell!17303)

(declare-fun mapRest!56278 () (Array (_ BitVec 32) ValueCell!17303))

(assert (=> mapNonEmpty!56278 (= (arr!43370 _values!1320) (store mapRest!56278 mapKey!56278 mapValue!56278))))

(declare-fun b!1329039 () Bool)

(declare-fun res!881539 () Bool)

(declare-fun e!757740 () Bool)

(assert (=> b!1329039 (=> (not res!881539) (not e!757740))))

(declare-datatypes ((array!89819 0))(
  ( (array!89820 (arr!43371 (Array (_ BitVec 32) (_ BitVec 64))) (size!43922 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89819)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89819 (_ BitVec 32)) Bool)

(assert (=> b!1329039 (= res!881539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881538 () Bool)

(assert (=> start!112322 (=> (not res!881538) (not e!757740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112322 (= res!881538 (validMask!0 mask!1998))))

(assert (=> start!112322 e!757740))

(assert (=> start!112322 true))

(declare-fun e!757744 () Bool)

(declare-fun array_inv!32997 (array!89817) Bool)

(assert (=> start!112322 (and (array_inv!32997 _values!1320) e!757744)))

(declare-fun array_inv!32998 (array!89819) Bool)

(assert (=> start!112322 (array_inv!32998 _keys!1590)))

(declare-fun b!1329040 () Bool)

(declare-fun e!757742 () Bool)

(assert (=> b!1329040 (= e!757742 tp_is_empty!36403)))

(declare-fun b!1329041 () Bool)

(declare-fun res!881540 () Bool)

(assert (=> b!1329041 (=> (not res!881540) (not e!757740))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329041 (= res!881540 (and (= (size!43921 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43922 _keys!1590) (size!43921 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56278 () Bool)

(assert (=> mapIsEmpty!56278 mapRes!56278))

(declare-fun b!1329042 () Bool)

(assert (=> b!1329042 (= e!757740 false)))

(declare-fun lt!591222 () Bool)

(declare-datatypes ((List!30740 0))(
  ( (Nil!30737) (Cons!30736 (h!31954 (_ BitVec 64)) (t!44738 List!30740)) )
))
(declare-fun arrayNoDuplicates!0 (array!89819 (_ BitVec 32) List!30740) Bool)

(assert (=> b!1329042 (= lt!591222 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30737))))

(declare-fun b!1329043 () Bool)

(assert (=> b!1329043 (= e!757744 (and e!757742 mapRes!56278))))

(declare-fun condMapEmpty!56278 () Bool)

(declare-fun mapDefault!56278 () ValueCell!17303)

(assert (=> b!1329043 (= condMapEmpty!56278 (= (arr!43370 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17303)) mapDefault!56278)))))

(assert (= (and start!112322 res!881538) b!1329041))

(assert (= (and b!1329041 res!881540) b!1329039))

(assert (= (and b!1329039 res!881539) b!1329042))

(assert (= (and b!1329043 condMapEmpty!56278) mapIsEmpty!56278))

(assert (= (and b!1329043 (not condMapEmpty!56278)) mapNonEmpty!56278))

(get-info :version)

(assert (= (and mapNonEmpty!56278 ((_ is ValueCellFull!17303) mapValue!56278)) b!1329038))

(assert (= (and b!1329043 ((_ is ValueCellFull!17303) mapDefault!56278)) b!1329040))

(assert (= start!112322 b!1329043))

(declare-fun m!1218551 () Bool)

(assert (=> mapNonEmpty!56278 m!1218551))

(declare-fun m!1218553 () Bool)

(assert (=> b!1329039 m!1218553))

(declare-fun m!1218555 () Bool)

(assert (=> start!112322 m!1218555))

(declare-fun m!1218557 () Bool)

(assert (=> start!112322 m!1218557))

(declare-fun m!1218559 () Bool)

(assert (=> start!112322 m!1218559))

(declare-fun m!1218561 () Bool)

(assert (=> b!1329042 m!1218561))

(check-sat (not b!1329042) (not start!112322) (not mapNonEmpty!56278) (not b!1329039) tp_is_empty!36403)
(check-sat)
