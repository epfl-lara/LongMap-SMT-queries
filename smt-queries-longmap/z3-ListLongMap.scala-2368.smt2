; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37656 () Bool)

(assert start!37656)

(declare-fun b_free!8773 () Bool)

(declare-fun b_next!8773 () Bool)

(assert (=> start!37656 (= b_free!8773 (not b_next!8773))))

(declare-fun tp!31070 () Bool)

(declare-fun b_and!16029 () Bool)

(assert (=> start!37656 (= tp!31070 b_and!16029)))

(declare-fun b!385729 () Bool)

(declare-fun e!234094 () Bool)

(declare-fun tp_is_empty!9445 () Bool)

(assert (=> b!385729 (= e!234094 tp_is_empty!9445)))

(declare-fun b!385730 () Bool)

(declare-fun res!220098 () Bool)

(declare-fun e!234093 () Bool)

(assert (=> b!385730 (=> (not res!220098) (not e!234093))))

(declare-datatypes ((array!22778 0))(
  ( (array!22779 (arr!10857 (Array (_ BitVec 32) (_ BitVec 64))) (size!11209 (_ BitVec 32))) )
))
(declare-fun lt!181681 () array!22778)

(declare-datatypes ((List!6121 0))(
  ( (Nil!6118) (Cons!6117 (h!6973 (_ BitVec 64)) (t!11263 List!6121)) )
))
(declare-fun arrayNoDuplicates!0 (array!22778 (_ BitVec 32) List!6121) Bool)

(assert (=> b!385730 (= res!220098 (arrayNoDuplicates!0 lt!181681 #b00000000000000000000000000000000 Nil!6118))))

(declare-fun b!385731 () Bool)

(declare-fun res!220102 () Bool)

(declare-fun e!234092 () Bool)

(assert (=> b!385731 (=> (not res!220102) (not e!234092))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385731 (= res!220102 (validKeyInArray!0 k0!778))))

(declare-fun b!385732 () Bool)

(declare-fun res!220095 () Bool)

(assert (=> b!385732 (=> (not res!220095) (not e!234092))))

(declare-fun _keys!658 () array!22778)

(assert (=> b!385732 (= res!220095 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6118))))

(declare-fun b!385733 () Bool)

(declare-fun res!220103 () Bool)

(assert (=> b!385733 (=> (not res!220103) (not e!234092))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22778 (_ BitVec 32)) Bool)

(assert (=> b!385733 (= res!220103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385734 () Bool)

(declare-fun res!220097 () Bool)

(assert (=> b!385734 (=> (not res!220097) (not e!234092))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385734 (= res!220097 (or (= (select (arr!10857 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10857 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!220096 () Bool)

(assert (=> start!37656 (=> (not res!220096) (not e!234092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37656 (= res!220096 (validMask!0 mask!970))))

(assert (=> start!37656 e!234092))

(assert (=> start!37656 true))

(declare-datatypes ((V!13699 0))(
  ( (V!13700 (val!4767 Int)) )
))
(declare-datatypes ((ValueCell!4379 0))(
  ( (ValueCellFull!4379 (v!6965 V!13699)) (EmptyCell!4379) )
))
(declare-datatypes ((array!22780 0))(
  ( (array!22781 (arr!10858 (Array (_ BitVec 32) ValueCell!4379)) (size!11210 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22780)

(declare-fun e!234091 () Bool)

(declare-fun array_inv!8026 (array!22780) Bool)

(assert (=> start!37656 (and (array_inv!8026 _values!506) e!234091)))

(assert (=> start!37656 tp!31070))

(assert (=> start!37656 tp_is_empty!9445))

(declare-fun array_inv!8027 (array!22778) Bool)

(assert (=> start!37656 (array_inv!8027 _keys!658)))

(declare-fun b!385735 () Bool)

(declare-fun res!220100 () Bool)

(assert (=> b!385735 (=> (not res!220100) (not e!234092))))

(declare-fun arrayContainsKey!0 (array!22778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385735 (= res!220100 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385736 () Bool)

(declare-fun e!234095 () Bool)

(declare-fun mapRes!15732 () Bool)

(assert (=> b!385736 (= e!234091 (and e!234095 mapRes!15732))))

(declare-fun condMapEmpty!15732 () Bool)

(declare-fun mapDefault!15732 () ValueCell!4379)

(assert (=> b!385736 (= condMapEmpty!15732 (= (arr!10858 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4379)) mapDefault!15732)))))

(declare-fun b!385737 () Bool)

(declare-fun res!220101 () Bool)

(assert (=> b!385737 (=> (not res!220101) (not e!234092))))

(assert (=> b!385737 (= res!220101 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11209 _keys!658))))))

(declare-fun b!385738 () Bool)

(declare-fun res!220094 () Bool)

(assert (=> b!385738 (=> (not res!220094) (not e!234092))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385738 (= res!220094 (and (= (size!11210 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11209 _keys!658) (size!11210 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15732 () Bool)

(assert (=> mapIsEmpty!15732 mapRes!15732))

(declare-fun b!385739 () Bool)

(assert (=> b!385739 (= e!234092 e!234093)))

(declare-fun res!220099 () Bool)

(assert (=> b!385739 (=> (not res!220099) (not e!234093))))

(assert (=> b!385739 (= res!220099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181681 mask!970))))

(assert (=> b!385739 (= lt!181681 (array!22779 (store (arr!10857 _keys!658) i!548 k0!778) (size!11209 _keys!658)))))

(declare-fun b!385740 () Bool)

(assert (=> b!385740 (= e!234093 (bvsge i!548 (size!11210 _values!506)))))

(declare-datatypes ((tuple2!6276 0))(
  ( (tuple2!6277 (_1!3149 (_ BitVec 64)) (_2!3149 V!13699)) )
))
(declare-datatypes ((List!6122 0))(
  ( (Nil!6119) (Cons!6118 (h!6974 tuple2!6276) (t!11264 List!6122)) )
))
(declare-datatypes ((ListLongMap!5191 0))(
  ( (ListLongMap!5192 (toList!2611 List!6122)) )
))
(declare-fun lt!181680 () ListLongMap!5191)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13699)

(declare-fun minValue!472 () V!13699)

(declare-fun getCurrentListMapNoExtraKeys!886 (array!22778 array!22780 (_ BitVec 32) (_ BitVec 32) V!13699 V!13699 (_ BitVec 32) Int) ListLongMap!5191)

(assert (=> b!385740 (= lt!181680 (getCurrentListMapNoExtraKeys!886 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385741 () Bool)

(assert (=> b!385741 (= e!234095 tp_is_empty!9445)))

(declare-fun mapNonEmpty!15732 () Bool)

(declare-fun tp!31071 () Bool)

(assert (=> mapNonEmpty!15732 (= mapRes!15732 (and tp!31071 e!234094))))

(declare-fun mapKey!15732 () (_ BitVec 32))

(declare-fun mapRest!15732 () (Array (_ BitVec 32) ValueCell!4379))

(declare-fun mapValue!15732 () ValueCell!4379)

(assert (=> mapNonEmpty!15732 (= (arr!10858 _values!506) (store mapRest!15732 mapKey!15732 mapValue!15732))))

(assert (= (and start!37656 res!220096) b!385738))

(assert (= (and b!385738 res!220094) b!385733))

(assert (= (and b!385733 res!220103) b!385732))

(assert (= (and b!385732 res!220095) b!385737))

(assert (= (and b!385737 res!220101) b!385731))

(assert (= (and b!385731 res!220102) b!385734))

(assert (= (and b!385734 res!220097) b!385735))

(assert (= (and b!385735 res!220100) b!385739))

(assert (= (and b!385739 res!220099) b!385730))

(assert (= (and b!385730 res!220098) b!385740))

(assert (= (and b!385736 condMapEmpty!15732) mapIsEmpty!15732))

(assert (= (and b!385736 (not condMapEmpty!15732)) mapNonEmpty!15732))

(get-info :version)

(assert (= (and mapNonEmpty!15732 ((_ is ValueCellFull!4379) mapValue!15732)) b!385729))

(assert (= (and b!385736 ((_ is ValueCellFull!4379) mapDefault!15732)) b!385741))

(assert (= start!37656 b!385736))

(declare-fun m!382517 () Bool)

(assert (=> b!385739 m!382517))

(declare-fun m!382519 () Bool)

(assert (=> b!385739 m!382519))

(declare-fun m!382521 () Bool)

(assert (=> start!37656 m!382521))

(declare-fun m!382523 () Bool)

(assert (=> start!37656 m!382523))

(declare-fun m!382525 () Bool)

(assert (=> start!37656 m!382525))

(declare-fun m!382527 () Bool)

(assert (=> b!385730 m!382527))

(declare-fun m!382529 () Bool)

(assert (=> b!385732 m!382529))

(declare-fun m!382531 () Bool)

(assert (=> b!385733 m!382531))

(declare-fun m!382533 () Bool)

(assert (=> b!385731 m!382533))

(declare-fun m!382535 () Bool)

(assert (=> b!385740 m!382535))

(declare-fun m!382537 () Bool)

(assert (=> b!385734 m!382537))

(declare-fun m!382539 () Bool)

(assert (=> b!385735 m!382539))

(declare-fun m!382541 () Bool)

(assert (=> mapNonEmpty!15732 m!382541))

(check-sat (not start!37656) (not b!385733) (not b!385730) b_and!16029 (not b!385735) (not b!385732) (not b!385731) tp_is_empty!9445 (not b_next!8773) (not mapNonEmpty!15732) (not b!385739) (not b!385740))
(check-sat b_and!16029 (not b_next!8773))
