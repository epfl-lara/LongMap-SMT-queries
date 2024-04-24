; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43240 () Bool)

(assert start!43240)

(declare-fun b_free!12121 () Bool)

(declare-fun b_next!12121 () Bool)

(assert (=> start!43240 (= b_free!12121 (not b_next!12121))))

(declare-fun tp!42633 () Bool)

(declare-fun b_and!20883 () Bool)

(assert (=> start!43240 (= tp!42633 b_and!20883)))

(declare-fun mapIsEmpty!22147 () Bool)

(declare-fun mapRes!22147 () Bool)

(assert (=> mapIsEmpty!22147 mapRes!22147))

(declare-fun mapNonEmpty!22147 () Bool)

(declare-fun tp!42634 () Bool)

(declare-fun e!281884 () Bool)

(assert (=> mapNonEmpty!22147 (= mapRes!22147 (and tp!42634 e!281884))))

(declare-fun mapKey!22147 () (_ BitVec 32))

(declare-datatypes ((V!19249 0))(
  ( (V!19250 (val!6864 Int)) )
))
(declare-datatypes ((ValueCell!6455 0))(
  ( (ValueCellFull!6455 (v!9154 V!19249)) (EmptyCell!6455) )
))
(declare-fun mapRest!22147 () (Array (_ BitVec 32) ValueCell!6455))

(declare-fun mapValue!22147 () ValueCell!6455)

(declare-datatypes ((array!30924 0))(
  ( (array!30925 (arr!14868 (Array (_ BitVec 32) ValueCell!6455)) (size!15226 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30924)

(assert (=> mapNonEmpty!22147 (= (arr!14868 _values!1516) (store mapRest!22147 mapKey!22147 mapValue!22147))))

(declare-fun b!479176 () Bool)

(declare-fun res!285867 () Bool)

(declare-fun e!281883 () Bool)

(assert (=> b!479176 (=> (not res!285867) (not e!281883))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30926 0))(
  ( (array!30927 (arr!14869 (Array (_ BitVec 32) (_ BitVec 64))) (size!15227 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30926)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479176 (= res!285867 (and (= (size!15226 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15227 _keys!1874) (size!15226 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479177 () Bool)

(declare-fun e!281882 () Bool)

(declare-fun e!281885 () Bool)

(assert (=> b!479177 (= e!281882 (and e!281885 mapRes!22147))))

(declare-fun condMapEmpty!22147 () Bool)

(declare-fun mapDefault!22147 () ValueCell!6455)

(assert (=> b!479177 (= condMapEmpty!22147 (= (arr!14868 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6455)) mapDefault!22147)))))

(declare-fun b!479178 () Bool)

(declare-fun res!285869 () Bool)

(assert (=> b!479178 (=> (not res!285869) (not e!281883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30926 (_ BitVec 32)) Bool)

(assert (=> b!479178 (= res!285869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285868 () Bool)

(assert (=> start!43240 (=> (not res!285868) (not e!281883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43240 (= res!285868 (validMask!0 mask!2352))))

(assert (=> start!43240 e!281883))

(assert (=> start!43240 true))

(declare-fun tp_is_empty!13633 () Bool)

(assert (=> start!43240 tp_is_empty!13633))

(declare-fun array_inv!10804 (array!30924) Bool)

(assert (=> start!43240 (and (array_inv!10804 _values!1516) e!281882)))

(assert (=> start!43240 tp!42633))

(declare-fun array_inv!10805 (array!30926) Bool)

(assert (=> start!43240 (array_inv!10805 _keys!1874)))

(declare-fun b!479179 () Bool)

(declare-fun res!285866 () Bool)

(assert (=> b!479179 (=> (not res!285866) (not e!281883))))

(declare-datatypes ((List!8996 0))(
  ( (Nil!8993) (Cons!8992 (h!9848 (_ BitVec 64)) (t!15194 List!8996)) )
))
(declare-fun arrayNoDuplicates!0 (array!30926 (_ BitVec 32) List!8996) Bool)

(assert (=> b!479179 (= res!285866 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8993))))

(declare-fun b!479180 () Bool)

(assert (=> b!479180 (= e!281883 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19249)

(declare-fun zeroValue!1458 () V!19249)

(declare-fun lt!217846 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8930 0))(
  ( (tuple2!8931 (_1!4476 (_ BitVec 64)) (_2!4476 V!19249)) )
))
(declare-datatypes ((List!8997 0))(
  ( (Nil!8994) (Cons!8993 (h!9849 tuple2!8930) (t!15195 List!8997)) )
))
(declare-datatypes ((ListLongMap!7845 0))(
  ( (ListLongMap!7846 (toList!3938 List!8997)) )
))
(declare-fun contains!2566 (ListLongMap!7845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2252 (array!30926 array!30924 (_ BitVec 32) (_ BitVec 32) V!19249 V!19249 (_ BitVec 32) Int) ListLongMap!7845)

(assert (=> b!479180 (= lt!217846 (contains!2566 (getCurrentListMap!2252 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479181 () Bool)

(assert (=> b!479181 (= e!281884 tp_is_empty!13633)))

(declare-fun b!479182 () Bool)

(assert (=> b!479182 (= e!281885 tp_is_empty!13633)))

(assert (= (and start!43240 res!285868) b!479176))

(assert (= (and b!479176 res!285867) b!479178))

(assert (= (and b!479178 res!285869) b!479179))

(assert (= (and b!479179 res!285866) b!479180))

(assert (= (and b!479177 condMapEmpty!22147) mapIsEmpty!22147))

(assert (= (and b!479177 (not condMapEmpty!22147)) mapNonEmpty!22147))

(get-info :version)

(assert (= (and mapNonEmpty!22147 ((_ is ValueCellFull!6455) mapValue!22147)) b!479181))

(assert (= (and b!479177 ((_ is ValueCellFull!6455) mapDefault!22147)) b!479182))

(assert (= start!43240 b!479177))

(declare-fun m!461413 () Bool)

(assert (=> b!479180 m!461413))

(assert (=> b!479180 m!461413))

(declare-fun m!461415 () Bool)

(assert (=> b!479180 m!461415))

(declare-fun m!461417 () Bool)

(assert (=> mapNonEmpty!22147 m!461417))

(declare-fun m!461419 () Bool)

(assert (=> start!43240 m!461419))

(declare-fun m!461421 () Bool)

(assert (=> start!43240 m!461421))

(declare-fun m!461423 () Bool)

(assert (=> start!43240 m!461423))

(declare-fun m!461425 () Bool)

(assert (=> b!479178 m!461425))

(declare-fun m!461427 () Bool)

(assert (=> b!479179 m!461427))

(check-sat (not b!479179) (not start!43240) (not b!479180) b_and!20883 (not b!479178) (not mapNonEmpty!22147) tp_is_empty!13633 (not b_next!12121))
(check-sat b_and!20883 (not b_next!12121))
