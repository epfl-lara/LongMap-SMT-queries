; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43276 () Bool)

(assert start!43276)

(declare-fun b_free!12157 () Bool)

(declare-fun b_next!12157 () Bool)

(assert (=> start!43276 (= b_free!12157 (not b_next!12157))))

(declare-fun tp!42742 () Bool)

(declare-fun b_and!20919 () Bool)

(assert (=> start!43276 (= tp!42742 b_and!20919)))

(declare-fun b!479554 () Bool)

(declare-fun res!286083 () Bool)

(declare-fun e!282154 () Bool)

(assert (=> b!479554 (=> (not res!286083) (not e!282154))))

(declare-datatypes ((array!30992 0))(
  ( (array!30993 (arr!14902 (Array (_ BitVec 32) (_ BitVec 64))) (size!15260 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30992)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30992 (_ BitVec 32)) Bool)

(assert (=> b!479554 (= res!286083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479555 () Bool)

(declare-fun res!286082 () Bool)

(assert (=> b!479555 (=> (not res!286082) (not e!282154))))

(declare-datatypes ((List!9021 0))(
  ( (Nil!9018) (Cons!9017 (h!9873 (_ BitVec 64)) (t!15219 List!9021)) )
))
(declare-fun arrayNoDuplicates!0 (array!30992 (_ BitVec 32) List!9021) Bool)

(assert (=> b!479555 (= res!286082 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9018))))

(declare-fun b!479556 () Bool)

(declare-fun res!286084 () Bool)

(assert (=> b!479556 (=> (not res!286084) (not e!282154))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19297 0))(
  ( (V!19298 (val!6882 Int)) )
))
(declare-datatypes ((ValueCell!6473 0))(
  ( (ValueCellFull!6473 (v!9172 V!19297)) (EmptyCell!6473) )
))
(declare-datatypes ((array!30994 0))(
  ( (array!30995 (arr!14903 (Array (_ BitVec 32) ValueCell!6473)) (size!15261 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30994)

(assert (=> b!479556 (= res!286084 (and (= (size!15261 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15260 _keys!1874) (size!15261 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22201 () Bool)

(declare-fun mapRes!22201 () Bool)

(assert (=> mapIsEmpty!22201 mapRes!22201))

(declare-fun res!286085 () Bool)

(assert (=> start!43276 (=> (not res!286085) (not e!282154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43276 (= res!286085 (validMask!0 mask!2352))))

(assert (=> start!43276 e!282154))

(assert (=> start!43276 true))

(declare-fun tp_is_empty!13669 () Bool)

(assert (=> start!43276 tp_is_empty!13669))

(declare-fun e!282153 () Bool)

(declare-fun array_inv!10828 (array!30994) Bool)

(assert (=> start!43276 (and (array_inv!10828 _values!1516) e!282153)))

(assert (=> start!43276 tp!42742))

(declare-fun array_inv!10829 (array!30992) Bool)

(assert (=> start!43276 (array_inv!10829 _keys!1874)))

(declare-fun b!479557 () Bool)

(assert (=> b!479557 (= e!282154 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217900 () Bool)

(declare-fun minValue!1458 () V!19297)

(declare-fun zeroValue!1458 () V!19297)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8952 0))(
  ( (tuple2!8953 (_1!4487 (_ BitVec 64)) (_2!4487 V!19297)) )
))
(declare-datatypes ((List!9022 0))(
  ( (Nil!9019) (Cons!9018 (h!9874 tuple2!8952) (t!15220 List!9022)) )
))
(declare-datatypes ((ListLongMap!7867 0))(
  ( (ListLongMap!7868 (toList!3949 List!9022)) )
))
(declare-fun contains!2577 (ListLongMap!7867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2263 (array!30992 array!30994 (_ BitVec 32) (_ BitVec 32) V!19297 V!19297 (_ BitVec 32) Int) ListLongMap!7867)

(assert (=> b!479557 (= lt!217900 (contains!2577 (getCurrentListMap!2263 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479558 () Bool)

(declare-fun e!282155 () Bool)

(assert (=> b!479558 (= e!282153 (and e!282155 mapRes!22201))))

(declare-fun condMapEmpty!22201 () Bool)

(declare-fun mapDefault!22201 () ValueCell!6473)

(assert (=> b!479558 (= condMapEmpty!22201 (= (arr!14903 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6473)) mapDefault!22201)))))

(declare-fun b!479559 () Bool)

(assert (=> b!479559 (= e!282155 tp_is_empty!13669)))

(declare-fun b!479560 () Bool)

(declare-fun e!282152 () Bool)

(assert (=> b!479560 (= e!282152 tp_is_empty!13669)))

(declare-fun mapNonEmpty!22201 () Bool)

(declare-fun tp!42741 () Bool)

(assert (=> mapNonEmpty!22201 (= mapRes!22201 (and tp!42741 e!282152))))

(declare-fun mapValue!22201 () ValueCell!6473)

(declare-fun mapRest!22201 () (Array (_ BitVec 32) ValueCell!6473))

(declare-fun mapKey!22201 () (_ BitVec 32))

(assert (=> mapNonEmpty!22201 (= (arr!14903 _values!1516) (store mapRest!22201 mapKey!22201 mapValue!22201))))

(assert (= (and start!43276 res!286085) b!479556))

(assert (= (and b!479556 res!286084) b!479554))

(assert (= (and b!479554 res!286083) b!479555))

(assert (= (and b!479555 res!286082) b!479557))

(assert (= (and b!479558 condMapEmpty!22201) mapIsEmpty!22201))

(assert (= (and b!479558 (not condMapEmpty!22201)) mapNonEmpty!22201))

(get-info :version)

(assert (= (and mapNonEmpty!22201 ((_ is ValueCellFull!6473) mapValue!22201)) b!479560))

(assert (= (and b!479558 ((_ is ValueCellFull!6473) mapDefault!22201)) b!479559))

(assert (= start!43276 b!479558))

(declare-fun m!461701 () Bool)

(assert (=> b!479554 m!461701))

(declare-fun m!461703 () Bool)

(assert (=> b!479555 m!461703))

(declare-fun m!461705 () Bool)

(assert (=> mapNonEmpty!22201 m!461705))

(declare-fun m!461707 () Bool)

(assert (=> start!43276 m!461707))

(declare-fun m!461709 () Bool)

(assert (=> start!43276 m!461709))

(declare-fun m!461711 () Bool)

(assert (=> start!43276 m!461711))

(declare-fun m!461713 () Bool)

(assert (=> b!479557 m!461713))

(assert (=> b!479557 m!461713))

(declare-fun m!461715 () Bool)

(assert (=> b!479557 m!461715))

(check-sat (not b_next!12157) b_and!20919 (not start!43276) (not mapNonEmpty!22201) (not b!479555) (not b!479554) tp_is_empty!13669 (not b!479557))
(check-sat b_and!20919 (not b_next!12157))
