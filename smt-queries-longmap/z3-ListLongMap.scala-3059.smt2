; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43198 () Bool)

(assert start!43198)

(declare-fun res!285632 () Bool)

(declare-fun e!281549 () Bool)

(assert (=> start!43198 (=> (not res!285632) (not e!281549))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43198 (= res!285632 (validMask!0 mask!2352))))

(assert (=> start!43198 e!281549))

(assert (=> start!43198 true))

(declare-datatypes ((V!19187 0))(
  ( (V!19188 (val!6841 Int)) )
))
(declare-datatypes ((ValueCell!6432 0))(
  ( (ValueCellFull!6432 (v!9130 V!19187)) (EmptyCell!6432) )
))
(declare-datatypes ((array!30851 0))(
  ( (array!30852 (arr!14833 (Array (_ BitVec 32) ValueCell!6432)) (size!15191 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30851)

(declare-fun e!281550 () Bool)

(declare-fun array_inv!10702 (array!30851) Bool)

(assert (=> start!43198 (and (array_inv!10702 _values!1516) e!281550)))

(declare-datatypes ((array!30853 0))(
  ( (array!30854 (arr!14834 (Array (_ BitVec 32) (_ BitVec 64))) (size!15192 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30853)

(declare-fun array_inv!10703 (array!30853) Bool)

(assert (=> start!43198 (array_inv!10703 _keys!1874)))

(declare-fun b!478768 () Bool)

(assert (=> b!478768 (= e!281549 false)))

(declare-fun lt!217765 () Bool)

(declare-datatypes ((List!9068 0))(
  ( (Nil!9065) (Cons!9064 (h!9920 (_ BitVec 64)) (t!15274 List!9068)) )
))
(declare-fun arrayNoDuplicates!0 (array!30853 (_ BitVec 32) List!9068) Bool)

(assert (=> b!478768 (= lt!217765 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9065))))

(declare-fun b!478769 () Bool)

(declare-fun res!285633 () Bool)

(assert (=> b!478769 (=> (not res!285633) (not e!281549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30853 (_ BitVec 32)) Bool)

(assert (=> b!478769 (= res!285633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22075 () Bool)

(declare-fun mapRes!22075 () Bool)

(declare-fun tp!42550 () Bool)

(declare-fun e!281552 () Bool)

(assert (=> mapNonEmpty!22075 (= mapRes!22075 (and tp!42550 e!281552))))

(declare-fun mapKey!22075 () (_ BitVec 32))

(declare-fun mapRest!22075 () (Array (_ BitVec 32) ValueCell!6432))

(declare-fun mapValue!22075 () ValueCell!6432)

(assert (=> mapNonEmpty!22075 (= (arr!14833 _values!1516) (store mapRest!22075 mapKey!22075 mapValue!22075))))

(declare-fun b!478770 () Bool)

(declare-fun res!285631 () Bool)

(assert (=> b!478770 (=> (not res!285631) (not e!281549))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478770 (= res!285631 (and (= (size!15191 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15192 _keys!1874) (size!15191 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478771 () Bool)

(declare-fun e!281553 () Bool)

(declare-fun tp_is_empty!13587 () Bool)

(assert (=> b!478771 (= e!281553 tp_is_empty!13587)))

(declare-fun b!478772 () Bool)

(assert (=> b!478772 (= e!281552 tp_is_empty!13587)))

(declare-fun b!478773 () Bool)

(assert (=> b!478773 (= e!281550 (and e!281553 mapRes!22075))))

(declare-fun condMapEmpty!22075 () Bool)

(declare-fun mapDefault!22075 () ValueCell!6432)

(assert (=> b!478773 (= condMapEmpty!22075 (= (arr!14833 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6432)) mapDefault!22075)))))

(declare-fun mapIsEmpty!22075 () Bool)

(assert (=> mapIsEmpty!22075 mapRes!22075))

(assert (= (and start!43198 res!285632) b!478770))

(assert (= (and b!478770 res!285631) b!478769))

(assert (= (and b!478769 res!285633) b!478768))

(assert (= (and b!478773 condMapEmpty!22075) mapIsEmpty!22075))

(assert (= (and b!478773 (not condMapEmpty!22075)) mapNonEmpty!22075))

(get-info :version)

(assert (= (and mapNonEmpty!22075 ((_ is ValueCellFull!6432) mapValue!22075)) b!478772))

(assert (= (and b!478773 ((_ is ValueCellFull!6432) mapDefault!22075)) b!478771))

(assert (= start!43198 b!478773))

(declare-fun m!460925 () Bool)

(assert (=> start!43198 m!460925))

(declare-fun m!460927 () Bool)

(assert (=> start!43198 m!460927))

(declare-fun m!460929 () Bool)

(assert (=> start!43198 m!460929))

(declare-fun m!460931 () Bool)

(assert (=> b!478768 m!460931))

(declare-fun m!460933 () Bool)

(assert (=> b!478769 m!460933))

(declare-fun m!460935 () Bool)

(assert (=> mapNonEmpty!22075 m!460935))

(check-sat (not b!478769) tp_is_empty!13587 (not b!478768) (not mapNonEmpty!22075) (not start!43198))
(check-sat)
