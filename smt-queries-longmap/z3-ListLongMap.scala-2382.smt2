; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37756 () Bool)

(assert start!37756)

(declare-fun b_free!8859 () Bool)

(declare-fun b_next!8859 () Bool)

(assert (=> start!37756 (= b_free!8859 (not b_next!8859))))

(declare-fun tp!31328 () Bool)

(declare-fun b_and!16101 () Bool)

(assert (=> start!37756 (= tp!31328 b_and!16101)))

(declare-fun b!387455 () Bool)

(declare-fun res!221393 () Bool)

(declare-fun e!234900 () Bool)

(assert (=> b!387455 (=> (not res!221393) (not e!234900))))

(declare-datatypes ((array!22953 0))(
  ( (array!22954 (arr!10945 (Array (_ BitVec 32) (_ BitVec 64))) (size!11297 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22953)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387455 (= res!221393 (or (= (select (arr!10945 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10945 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387456 () Bool)

(declare-fun e!234902 () Bool)

(assert (=> b!387456 (= e!234900 e!234902)))

(declare-fun res!221389 () Bool)

(assert (=> b!387456 (=> (not res!221389) (not e!234902))))

(declare-fun lt!182041 () array!22953)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22953 (_ BitVec 32)) Bool)

(assert (=> b!387456 (= res!221389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182041 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!387456 (= lt!182041 (array!22954 (store (arr!10945 _keys!658) i!548 k0!778) (size!11297 _keys!658)))))

(declare-fun b!387458 () Bool)

(declare-fun res!221392 () Bool)

(assert (=> b!387458 (=> (not res!221392) (not e!234900))))

(assert (=> b!387458 (= res!221392 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11297 _keys!658))))))

(declare-fun b!387459 () Bool)

(declare-fun res!221388 () Bool)

(assert (=> b!387459 (=> (not res!221388) (not e!234900))))

(declare-datatypes ((List!6315 0))(
  ( (Nil!6312) (Cons!6311 (h!7167 (_ BitVec 64)) (t!11465 List!6315)) )
))
(declare-fun arrayNoDuplicates!0 (array!22953 (_ BitVec 32) List!6315) Bool)

(assert (=> b!387459 (= res!221388 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6312))))

(declare-fun b!387460 () Bool)

(declare-fun res!221387 () Bool)

(assert (=> b!387460 (=> (not res!221387) (not e!234900))))

(assert (=> b!387460 (= res!221387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387461 () Bool)

(declare-fun res!221391 () Bool)

(assert (=> b!387461 (=> (not res!221391) (not e!234902))))

(assert (=> b!387461 (= res!221391 (arrayNoDuplicates!0 lt!182041 #b00000000000000000000000000000000 Nil!6312))))

(declare-fun mapIsEmpty!15861 () Bool)

(declare-fun mapRes!15861 () Bool)

(assert (=> mapIsEmpty!15861 mapRes!15861))

(declare-fun b!387462 () Bool)

(declare-fun e!234897 () Bool)

(declare-fun tp_is_empty!9531 () Bool)

(assert (=> b!387462 (= e!234897 tp_is_empty!9531)))

(declare-fun b!387463 () Bool)

(declare-fun e!234901 () Bool)

(assert (=> b!387463 (= e!234901 tp_is_empty!9531)))

(declare-fun b!387464 () Bool)

(declare-fun res!221394 () Bool)

(assert (=> b!387464 (=> (not res!221394) (not e!234900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387464 (= res!221394 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15861 () Bool)

(declare-fun tp!31329 () Bool)

(assert (=> mapNonEmpty!15861 (= mapRes!15861 (and tp!31329 e!234897))))

(declare-datatypes ((V!13813 0))(
  ( (V!13814 (val!4810 Int)) )
))
(declare-datatypes ((ValueCell!4422 0))(
  ( (ValueCellFull!4422 (v!7007 V!13813)) (EmptyCell!4422) )
))
(declare-datatypes ((array!22955 0))(
  ( (array!22956 (arr!10946 (Array (_ BitVec 32) ValueCell!4422)) (size!11298 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22955)

(declare-fun mapKey!15861 () (_ BitVec 32))

(declare-fun mapRest!15861 () (Array (_ BitVec 32) ValueCell!4422))

(declare-fun mapValue!15861 () ValueCell!4422)

(assert (=> mapNonEmpty!15861 (= (arr!10946 _values!506) (store mapRest!15861 mapKey!15861 mapValue!15861))))

(declare-fun b!387465 () Bool)

(declare-fun e!234899 () Bool)

(assert (=> b!387465 (= e!234899 (and e!234901 mapRes!15861))))

(declare-fun condMapEmpty!15861 () Bool)

(declare-fun mapDefault!15861 () ValueCell!4422)

(assert (=> b!387465 (= condMapEmpty!15861 (= (arr!10946 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4422)) mapDefault!15861)))))

(declare-fun b!387466 () Bool)

(declare-fun res!221390 () Bool)

(assert (=> b!387466 (=> (not res!221390) (not e!234900))))

(declare-fun arrayContainsKey!0 (array!22953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387466 (= res!221390 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387467 () Bool)

(declare-fun res!221395 () Bool)

(assert (=> b!387467 (=> (not res!221395) (not e!234900))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!387467 (= res!221395 (and (= (size!11298 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11297 _keys!658) (size!11298 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!221396 () Bool)

(assert (=> start!37756 (=> (not res!221396) (not e!234900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37756 (= res!221396 (validMask!0 mask!970))))

(assert (=> start!37756 e!234900))

(declare-fun array_inv!8052 (array!22955) Bool)

(assert (=> start!37756 (and (array_inv!8052 _values!506) e!234899)))

(assert (=> start!37756 tp!31328))

(assert (=> start!37756 true))

(assert (=> start!37756 tp_is_empty!9531))

(declare-fun array_inv!8053 (array!22953) Bool)

(assert (=> start!37756 (array_inv!8053 _keys!658)))

(declare-fun b!387457 () Bool)

(assert (=> b!387457 (= e!234902 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6464 0))(
  ( (tuple2!6465 (_1!3243 (_ BitVec 64)) (_2!3243 V!13813)) )
))
(declare-datatypes ((List!6316 0))(
  ( (Nil!6313) (Cons!6312 (h!7168 tuple2!6464) (t!11466 List!6316)) )
))
(declare-datatypes ((ListLongMap!5377 0))(
  ( (ListLongMap!5378 (toList!2704 List!6316)) )
))
(declare-fun lt!182042 () ListLongMap!5377)

(declare-fun zeroValue!472 () V!13813)

(declare-fun v!373 () V!13813)

(declare-fun minValue!472 () V!13813)

(declare-fun getCurrentListMapNoExtraKeys!933 (array!22953 array!22955 (_ BitVec 32) (_ BitVec 32) V!13813 V!13813 (_ BitVec 32) Int) ListLongMap!5377)

(assert (=> b!387457 (= lt!182042 (getCurrentListMapNoExtraKeys!933 lt!182041 (array!22956 (store (arr!10946 _values!506) i!548 (ValueCellFull!4422 v!373)) (size!11298 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182043 () ListLongMap!5377)

(assert (=> b!387457 (= lt!182043 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37756 res!221396) b!387467))

(assert (= (and b!387467 res!221395) b!387460))

(assert (= (and b!387460 res!221387) b!387459))

(assert (= (and b!387459 res!221388) b!387458))

(assert (= (and b!387458 res!221392) b!387464))

(assert (= (and b!387464 res!221394) b!387455))

(assert (= (and b!387455 res!221393) b!387466))

(assert (= (and b!387466 res!221390) b!387456))

(assert (= (and b!387456 res!221389) b!387461))

(assert (= (and b!387461 res!221391) b!387457))

(assert (= (and b!387465 condMapEmpty!15861) mapIsEmpty!15861))

(assert (= (and b!387465 (not condMapEmpty!15861)) mapNonEmpty!15861))

(get-info :version)

(assert (= (and mapNonEmpty!15861 ((_ is ValueCellFull!4422) mapValue!15861)) b!387462))

(assert (= (and b!387465 ((_ is ValueCellFull!4422) mapDefault!15861)) b!387463))

(assert (= start!37756 b!387465))

(declare-fun m!383565 () Bool)

(assert (=> b!387460 m!383565))

(declare-fun m!383567 () Bool)

(assert (=> b!387455 m!383567))

(declare-fun m!383569 () Bool)

(assert (=> b!387464 m!383569))

(declare-fun m!383571 () Bool)

(assert (=> b!387456 m!383571))

(declare-fun m!383573 () Bool)

(assert (=> b!387456 m!383573))

(declare-fun m!383575 () Bool)

(assert (=> start!37756 m!383575))

(declare-fun m!383577 () Bool)

(assert (=> start!37756 m!383577))

(declare-fun m!383579 () Bool)

(assert (=> start!37756 m!383579))

(declare-fun m!383581 () Bool)

(assert (=> b!387457 m!383581))

(declare-fun m!383583 () Bool)

(assert (=> b!387457 m!383583))

(declare-fun m!383585 () Bool)

(assert (=> b!387457 m!383585))

(declare-fun m!383587 () Bool)

(assert (=> b!387459 m!383587))

(declare-fun m!383589 () Bool)

(assert (=> mapNonEmpty!15861 m!383589))

(declare-fun m!383591 () Bool)

(assert (=> b!387461 m!383591))

(declare-fun m!383593 () Bool)

(assert (=> b!387466 m!383593))

(check-sat (not b!387461) b_and!16101 (not b!387459) (not b!387456) (not b!387457) (not b!387466) (not b!387464) (not b!387460) (not b_next!8859) tp_is_empty!9531 (not mapNonEmpty!15861) (not start!37756))
(check-sat b_and!16101 (not b_next!8859))
