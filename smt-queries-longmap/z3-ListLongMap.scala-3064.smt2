; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43228 () Bool)

(assert start!43228)

(declare-fun b!479038 () Bool)

(declare-fun e!281774 () Bool)

(assert (=> b!479038 (= e!281774 false)))

(declare-fun lt!217810 () Bool)

(declare-datatypes ((array!30907 0))(
  ( (array!30908 (arr!14861 (Array (_ BitVec 32) (_ BitVec 64))) (size!15219 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30907)

(declare-datatypes ((List!9080 0))(
  ( (Nil!9077) (Cons!9076 (h!9932 (_ BitVec 64)) (t!15286 List!9080)) )
))
(declare-fun arrayNoDuplicates!0 (array!30907 (_ BitVec 32) List!9080) Bool)

(assert (=> b!479038 (= lt!217810 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9077))))

(declare-fun b!479039 () Bool)

(declare-fun e!281776 () Bool)

(declare-fun tp_is_empty!13617 () Bool)

(assert (=> b!479039 (= e!281776 tp_is_empty!13617)))

(declare-fun mapNonEmpty!22120 () Bool)

(declare-fun mapRes!22120 () Bool)

(declare-fun tp!42595 () Bool)

(assert (=> mapNonEmpty!22120 (= mapRes!22120 (and tp!42595 e!281776))))

(declare-datatypes ((V!19227 0))(
  ( (V!19228 (val!6856 Int)) )
))
(declare-datatypes ((ValueCell!6447 0))(
  ( (ValueCellFull!6447 (v!9145 V!19227)) (EmptyCell!6447) )
))
(declare-fun mapValue!22120 () ValueCell!6447)

(declare-fun mapRest!22120 () (Array (_ BitVec 32) ValueCell!6447))

(declare-fun mapKey!22120 () (_ BitVec 32))

(declare-datatypes ((array!30909 0))(
  ( (array!30910 (arr!14862 (Array (_ BitVec 32) ValueCell!6447)) (size!15220 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30909)

(assert (=> mapNonEmpty!22120 (= (arr!14862 _values!1516) (store mapRest!22120 mapKey!22120 mapValue!22120))))

(declare-fun b!479040 () Bool)

(declare-fun res!285768 () Bool)

(assert (=> b!479040 (=> (not res!285768) (not e!281774))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30907 (_ BitVec 32)) Bool)

(assert (=> b!479040 (= res!285768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285766 () Bool)

(assert (=> start!43228 (=> (not res!285766) (not e!281774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43228 (= res!285766 (validMask!0 mask!2352))))

(assert (=> start!43228 e!281774))

(assert (=> start!43228 true))

(declare-fun e!281778 () Bool)

(declare-fun array_inv!10724 (array!30909) Bool)

(assert (=> start!43228 (and (array_inv!10724 _values!1516) e!281778)))

(declare-fun array_inv!10725 (array!30907) Bool)

(assert (=> start!43228 (array_inv!10725 _keys!1874)))

(declare-fun b!479041 () Bool)

(declare-fun e!281775 () Bool)

(assert (=> b!479041 (= e!281778 (and e!281775 mapRes!22120))))

(declare-fun condMapEmpty!22120 () Bool)

(declare-fun mapDefault!22120 () ValueCell!6447)

(assert (=> b!479041 (= condMapEmpty!22120 (= (arr!14862 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6447)) mapDefault!22120)))))

(declare-fun mapIsEmpty!22120 () Bool)

(assert (=> mapIsEmpty!22120 mapRes!22120))

(declare-fun b!479042 () Bool)

(declare-fun res!285767 () Bool)

(assert (=> b!479042 (=> (not res!285767) (not e!281774))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479042 (= res!285767 (and (= (size!15220 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15219 _keys!1874) (size!15220 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479043 () Bool)

(assert (=> b!479043 (= e!281775 tp_is_empty!13617)))

(assert (= (and start!43228 res!285766) b!479042))

(assert (= (and b!479042 res!285767) b!479040))

(assert (= (and b!479040 res!285768) b!479038))

(assert (= (and b!479041 condMapEmpty!22120) mapIsEmpty!22120))

(assert (= (and b!479041 (not condMapEmpty!22120)) mapNonEmpty!22120))

(get-info :version)

(assert (= (and mapNonEmpty!22120 ((_ is ValueCellFull!6447) mapValue!22120)) b!479039))

(assert (= (and b!479041 ((_ is ValueCellFull!6447) mapDefault!22120)) b!479043))

(assert (= start!43228 b!479041))

(declare-fun m!461105 () Bool)

(assert (=> b!479038 m!461105))

(declare-fun m!461107 () Bool)

(assert (=> mapNonEmpty!22120 m!461107))

(declare-fun m!461109 () Bool)

(assert (=> b!479040 m!461109))

(declare-fun m!461111 () Bool)

(assert (=> start!43228 m!461111))

(declare-fun m!461113 () Bool)

(assert (=> start!43228 m!461113))

(declare-fun m!461115 () Bool)

(assert (=> start!43228 m!461115))

(check-sat (not b!479038) (not start!43228) (not b!479040) tp_is_empty!13617 (not mapNonEmpty!22120))
(check-sat)
