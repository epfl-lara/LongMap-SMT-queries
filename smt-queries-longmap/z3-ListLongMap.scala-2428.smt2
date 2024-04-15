; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38324 () Bool)

(assert start!38324)

(declare-fun b!395075 () Bool)

(declare-fun e!239187 () Bool)

(declare-fun tp_is_empty!9805 () Bool)

(assert (=> b!395075 (= e!239187 tp_is_empty!9805)))

(declare-fun mapIsEmpty!16320 () Bool)

(declare-fun mapRes!16320 () Bool)

(assert (=> mapIsEmpty!16320 mapRes!16320))

(declare-fun b!395076 () Bool)

(declare-fun e!239184 () Bool)

(assert (=> b!395076 (= e!239184 false)))

(declare-fun lt!186844 () Bool)

(declare-datatypes ((array!23507 0))(
  ( (array!23508 (arr!11206 (Array (_ BitVec 32) (_ BitVec 64))) (size!11559 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23507)

(declare-datatypes ((List!6466 0))(
  ( (Nil!6463) (Cons!6462 (h!7318 (_ BitVec 64)) (t!11631 List!6466)) )
))
(declare-fun arrayNoDuplicates!0 (array!23507 (_ BitVec 32) List!6466) Bool)

(assert (=> b!395076 (= lt!186844 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6463))))

(declare-fun b!395077 () Bool)

(declare-fun e!239185 () Bool)

(assert (=> b!395077 (= e!239185 tp_is_empty!9805)))

(declare-fun b!395078 () Bool)

(declare-fun res!226511 () Bool)

(assert (=> b!395078 (=> (not res!226511) (not e!239184))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14179 0))(
  ( (V!14180 (val!4947 Int)) )
))
(declare-datatypes ((ValueCell!4559 0))(
  ( (ValueCellFull!4559 (v!7187 V!14179)) (EmptyCell!4559) )
))
(declare-datatypes ((array!23509 0))(
  ( (array!23510 (arr!11207 (Array (_ BitVec 32) ValueCell!4559)) (size!11560 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23509)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395078 (= res!226511 (and (= (size!11560 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11559 _keys!709) (size!11560 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395079 () Bool)

(declare-fun e!239186 () Bool)

(assert (=> b!395079 (= e!239186 (and e!239185 mapRes!16320))))

(declare-fun condMapEmpty!16320 () Bool)

(declare-fun mapDefault!16320 () ValueCell!4559)

(assert (=> b!395079 (= condMapEmpty!16320 (= (arr!11207 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4559)) mapDefault!16320)))))

(declare-fun mapNonEmpty!16320 () Bool)

(declare-fun tp!32115 () Bool)

(assert (=> mapNonEmpty!16320 (= mapRes!16320 (and tp!32115 e!239187))))

(declare-fun mapKey!16320 () (_ BitVec 32))

(declare-fun mapRest!16320 () (Array (_ BitVec 32) ValueCell!4559))

(declare-fun mapValue!16320 () ValueCell!4559)

(assert (=> mapNonEmpty!16320 (= (arr!11207 _values!549) (store mapRest!16320 mapKey!16320 mapValue!16320))))

(declare-fun res!226513 () Bool)

(assert (=> start!38324 (=> (not res!226513) (not e!239184))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38324 (= res!226513 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11559 _keys!709))))))

(assert (=> start!38324 e!239184))

(assert (=> start!38324 true))

(declare-fun array_inv!8226 (array!23509) Bool)

(assert (=> start!38324 (and (array_inv!8226 _values!549) e!239186)))

(declare-fun array_inv!8227 (array!23507) Bool)

(assert (=> start!38324 (array_inv!8227 _keys!709)))

(declare-fun b!395080 () Bool)

(declare-fun res!226510 () Bool)

(assert (=> b!395080 (=> (not res!226510) (not e!239184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23507 (_ BitVec 32)) Bool)

(assert (=> b!395080 (= res!226510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395081 () Bool)

(declare-fun res!226512 () Bool)

(assert (=> b!395081 (=> (not res!226512) (not e!239184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395081 (= res!226512 (validMask!0 mask!1025))))

(assert (= (and start!38324 res!226513) b!395081))

(assert (= (and b!395081 res!226512) b!395078))

(assert (= (and b!395078 res!226511) b!395080))

(assert (= (and b!395080 res!226510) b!395076))

(assert (= (and b!395079 condMapEmpty!16320) mapIsEmpty!16320))

(assert (= (and b!395079 (not condMapEmpty!16320)) mapNonEmpty!16320))

(get-info :version)

(assert (= (and mapNonEmpty!16320 ((_ is ValueCellFull!4559) mapValue!16320)) b!395075))

(assert (= (and b!395079 ((_ is ValueCellFull!4559) mapDefault!16320)) b!395077))

(assert (= start!38324 b!395079))

(declare-fun m!390717 () Bool)

(assert (=> b!395080 m!390717))

(declare-fun m!390719 () Bool)

(assert (=> start!38324 m!390719))

(declare-fun m!390721 () Bool)

(assert (=> start!38324 m!390721))

(declare-fun m!390723 () Bool)

(assert (=> b!395076 m!390723))

(declare-fun m!390725 () Bool)

(assert (=> b!395081 m!390725))

(declare-fun m!390727 () Bool)

(assert (=> mapNonEmpty!16320 m!390727))

(check-sat (not start!38324) (not b!395076) tp_is_empty!9805 (not mapNonEmpty!16320) (not b!395080) (not b!395081))
(check-sat)
