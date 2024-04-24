; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74678 () Bool)

(assert start!74678)

(declare-fun b_free!15199 () Bool)

(declare-fun b_next!15199 () Bool)

(assert (=> start!74678 (= b_free!15199 (not b_next!15199))))

(declare-fun tp!53280 () Bool)

(declare-fun b_and!25085 () Bool)

(assert (=> start!74678 (= tp!53280 b_and!25085)))

(declare-fun b!878522 () Bool)

(declare-fun res!596534 () Bool)

(declare-fun e!489109 () Bool)

(assert (=> b!878522 (=> (not res!596534) (not e!489109))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51057 0))(
  ( (array!51058 (arr!24550 (Array (_ BitVec 32) (_ BitVec 64))) (size!24991 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51057)

(declare-datatypes ((V!28305 0))(
  ( (V!28306 (val!8769 Int)) )
))
(declare-datatypes ((ValueCell!8282 0))(
  ( (ValueCellFull!8282 (v!11209 V!28305)) (EmptyCell!8282) )
))
(declare-datatypes ((array!51059 0))(
  ( (array!51060 (arr!24551 (Array (_ BitVec 32) ValueCell!8282)) (size!24992 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51059)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!878522 (= res!596534 (and (= (size!24992 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24991 _keys!868) (size!24992 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878523 () Bool)

(declare-fun res!596531 () Bool)

(assert (=> b!878523 (=> (not res!596531) (not e!489109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878523 (= res!596531 (validMask!0 mask!1196))))

(declare-fun b!878524 () Bool)

(declare-fun e!489111 () Bool)

(declare-fun tp_is_empty!17443 () Bool)

(assert (=> b!878524 (= e!489111 tp_is_empty!17443)))

(declare-fun mapNonEmpty!27780 () Bool)

(declare-fun mapRes!27780 () Bool)

(declare-fun tp!53279 () Bool)

(declare-fun e!489110 () Bool)

(assert (=> mapNonEmpty!27780 (= mapRes!27780 (and tp!53279 e!489110))))

(declare-fun mapKey!27780 () (_ BitVec 32))

(declare-fun mapRest!27780 () (Array (_ BitVec 32) ValueCell!8282))

(declare-fun mapValue!27780 () ValueCell!8282)

(assert (=> mapNonEmpty!27780 (= (arr!24551 _values!688) (store mapRest!27780 mapKey!27780 mapValue!27780))))

(declare-fun b!878525 () Bool)

(declare-fun res!596530 () Bool)

(assert (=> b!878525 (=> (not res!596530) (not e!489109))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878525 (= res!596530 (validKeyInArray!0 k0!854))))

(declare-fun b!878526 () Bool)

(assert (=> b!878526 (= e!489110 tp_is_empty!17443)))

(declare-fun b!878527 () Bool)

(declare-fun res!596536 () Bool)

(assert (=> b!878527 (=> (not res!596536) (not e!489109))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878527 (= res!596536 (and (= (select (arr!24550 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878528 () Bool)

(assert (=> b!878528 (= e!489109 false)))

(declare-fun v!557 () V!28305)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28305)

(declare-fun zeroValue!654 () V!28305)

(declare-datatypes ((tuple2!11534 0))(
  ( (tuple2!11535 (_1!5778 (_ BitVec 64)) (_2!5778 V!28305)) )
))
(declare-datatypes ((List!17368 0))(
  ( (Nil!17365) (Cons!17364 (h!18501 tuple2!11534) (t!24449 List!17368)) )
))
(declare-datatypes ((ListLongMap!10305 0))(
  ( (ListLongMap!10306 (toList!5168 List!17368)) )
))
(declare-fun lt!397468 () ListLongMap!10305)

(declare-fun getCurrentListMapNoExtraKeys!3210 (array!51057 array!51059 (_ BitVec 32) (_ BitVec 32) V!28305 V!28305 (_ BitVec 32) Int) ListLongMap!10305)

(assert (=> b!878528 (= lt!397468 (getCurrentListMapNoExtraKeys!3210 _keys!868 (array!51060 (store (arr!24551 _values!688) i!612 (ValueCellFull!8282 v!557)) (size!24992 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397467 () ListLongMap!10305)

(assert (=> b!878528 (= lt!397467 (getCurrentListMapNoExtraKeys!3210 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878529 () Bool)

(declare-fun res!596532 () Bool)

(assert (=> b!878529 (=> (not res!596532) (not e!489109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51057 (_ BitVec 32)) Bool)

(assert (=> b!878529 (= res!596532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!596533 () Bool)

(assert (=> start!74678 (=> (not res!596533) (not e!489109))))

(assert (=> start!74678 (= res!596533 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24991 _keys!868))))))

(assert (=> start!74678 e!489109))

(assert (=> start!74678 tp_is_empty!17443))

(assert (=> start!74678 true))

(assert (=> start!74678 tp!53280))

(declare-fun array_inv!19400 (array!51057) Bool)

(assert (=> start!74678 (array_inv!19400 _keys!868)))

(declare-fun e!489108 () Bool)

(declare-fun array_inv!19401 (array!51059) Bool)

(assert (=> start!74678 (and (array_inv!19401 _values!688) e!489108)))

(declare-fun mapIsEmpty!27780 () Bool)

(assert (=> mapIsEmpty!27780 mapRes!27780))

(declare-fun b!878530 () Bool)

(declare-fun res!596529 () Bool)

(assert (=> b!878530 (=> (not res!596529) (not e!489109))))

(declare-datatypes ((List!17369 0))(
  ( (Nil!17366) (Cons!17365 (h!18502 (_ BitVec 64)) (t!24450 List!17369)) )
))
(declare-fun arrayNoDuplicates!0 (array!51057 (_ BitVec 32) List!17369) Bool)

(assert (=> b!878530 (= res!596529 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17366))))

(declare-fun b!878531 () Bool)

(declare-fun res!596535 () Bool)

(assert (=> b!878531 (=> (not res!596535) (not e!489109))))

(assert (=> b!878531 (= res!596535 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24991 _keys!868))))))

(declare-fun b!878532 () Bool)

(assert (=> b!878532 (= e!489108 (and e!489111 mapRes!27780))))

(declare-fun condMapEmpty!27780 () Bool)

(declare-fun mapDefault!27780 () ValueCell!8282)

(assert (=> b!878532 (= condMapEmpty!27780 (= (arr!24551 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8282)) mapDefault!27780)))))

(assert (= (and start!74678 res!596533) b!878523))

(assert (= (and b!878523 res!596531) b!878522))

(assert (= (and b!878522 res!596534) b!878529))

(assert (= (and b!878529 res!596532) b!878530))

(assert (= (and b!878530 res!596529) b!878531))

(assert (= (and b!878531 res!596535) b!878525))

(assert (= (and b!878525 res!596530) b!878527))

(assert (= (and b!878527 res!596536) b!878528))

(assert (= (and b!878532 condMapEmpty!27780) mapIsEmpty!27780))

(assert (= (and b!878532 (not condMapEmpty!27780)) mapNonEmpty!27780))

(get-info :version)

(assert (= (and mapNonEmpty!27780 ((_ is ValueCellFull!8282) mapValue!27780)) b!878526))

(assert (= (and b!878532 ((_ is ValueCellFull!8282) mapDefault!27780)) b!878524))

(assert (= start!74678 b!878532))

(declare-fun m!819057 () Bool)

(assert (=> mapNonEmpty!27780 m!819057))

(declare-fun m!819059 () Bool)

(assert (=> b!878525 m!819059))

(declare-fun m!819061 () Bool)

(assert (=> b!878527 m!819061))

(declare-fun m!819063 () Bool)

(assert (=> b!878523 m!819063))

(declare-fun m!819065 () Bool)

(assert (=> start!74678 m!819065))

(declare-fun m!819067 () Bool)

(assert (=> start!74678 m!819067))

(declare-fun m!819069 () Bool)

(assert (=> b!878530 m!819069))

(declare-fun m!819071 () Bool)

(assert (=> b!878528 m!819071))

(declare-fun m!819073 () Bool)

(assert (=> b!878528 m!819073))

(declare-fun m!819075 () Bool)

(assert (=> b!878528 m!819075))

(declare-fun m!819077 () Bool)

(assert (=> b!878529 m!819077))

(check-sat (not b!878529) (not b!878528) (not mapNonEmpty!27780) b_and!25085 tp_is_empty!17443 (not b!878523) (not b!878525) (not b_next!15199) (not b!878530) (not start!74678))
(check-sat b_and!25085 (not b_next!15199))
