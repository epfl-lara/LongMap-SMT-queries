; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37530 () Bool)

(assert start!37530)

(declare-fun b_free!8671 () Bool)

(declare-fun b_next!8671 () Bool)

(assert (=> start!37530 (= b_free!8671 (not b_next!8671))))

(declare-fun tp!30728 () Bool)

(declare-fun b_and!15887 () Bool)

(assert (=> start!37530 (= tp!30728 b_and!15887)))

(declare-fun res!218133 () Bool)

(declare-fun e!232697 () Bool)

(assert (=> start!37530 (=> (not res!218133) (not e!232697))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37530 (= res!218133 (validMask!0 mask!970))))

(assert (=> start!37530 e!232697))

(declare-datatypes ((V!13531 0))(
  ( (V!13532 (val!4704 Int)) )
))
(declare-datatypes ((ValueCell!4316 0))(
  ( (ValueCellFull!4316 (v!6895 V!13531)) (EmptyCell!4316) )
))
(declare-datatypes ((array!22529 0))(
  ( (array!22530 (arr!10733 (Array (_ BitVec 32) ValueCell!4316)) (size!11086 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22529)

(declare-fun e!232696 () Bool)

(declare-fun array_inv!7904 (array!22529) Bool)

(assert (=> start!37530 (and (array_inv!7904 _values!506) e!232696)))

(assert (=> start!37530 tp!30728))

(assert (=> start!37530 true))

(declare-fun tp_is_empty!9319 () Bool)

(assert (=> start!37530 tp_is_empty!9319))

(declare-datatypes ((array!22531 0))(
  ( (array!22532 (arr!10734 (Array (_ BitVec 32) (_ BitVec 64))) (size!11087 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22531)

(declare-fun array_inv!7905 (array!22531) Bool)

(assert (=> start!37530 (array_inv!7905 _keys!658)))

(declare-fun b!383097 () Bool)

(declare-fun res!218127 () Bool)

(assert (=> b!383097 (=> (not res!218127) (not e!232697))))

(declare-datatypes ((List!6131 0))(
  ( (Nil!6128) (Cons!6127 (h!6983 (_ BitVec 64)) (t!11272 List!6131)) )
))
(declare-fun arrayNoDuplicates!0 (array!22531 (_ BitVec 32) List!6131) Bool)

(assert (=> b!383097 (= res!218127 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6128))))

(declare-fun b!383098 () Bool)

(declare-fun res!218130 () Bool)

(assert (=> b!383098 (=> (not res!218130) (not e!232697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22531 (_ BitVec 32)) Bool)

(assert (=> b!383098 (= res!218130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383099 () Bool)

(declare-fun e!232691 () Bool)

(assert (=> b!383099 (= e!232691 true)))

(declare-datatypes ((tuple2!6306 0))(
  ( (tuple2!6307 (_1!3164 (_ BitVec 64)) (_2!3164 V!13531)) )
))
(declare-datatypes ((List!6132 0))(
  ( (Nil!6129) (Cons!6128 (h!6984 tuple2!6306) (t!11273 List!6132)) )
))
(declare-datatypes ((ListLongMap!5209 0))(
  ( (ListLongMap!5210 (toList!2620 List!6132)) )
))
(declare-fun lt!179830 () ListLongMap!5209)

(declare-fun lt!179834 () ListLongMap!5209)

(declare-fun lt!179833 () tuple2!6306)

(declare-fun +!977 (ListLongMap!5209 tuple2!6306) ListLongMap!5209)

(assert (=> b!383099 (= lt!179830 (+!977 lt!179834 lt!179833))))

(declare-fun lt!179825 () ListLongMap!5209)

(declare-fun lt!179832 () ListLongMap!5209)

(assert (=> b!383099 (= lt!179825 lt!179832)))

(declare-fun b!383100 () Bool)

(declare-fun res!218129 () Bool)

(assert (=> b!383100 (=> (not res!218129) (not e!232697))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383100 (= res!218129 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15543 () Bool)

(declare-fun mapRes!15543 () Bool)

(assert (=> mapIsEmpty!15543 mapRes!15543))

(declare-fun b!383101 () Bool)

(declare-fun e!232693 () Bool)

(assert (=> b!383101 (= e!232693 (not e!232691))))

(declare-fun res!218131 () Bool)

(assert (=> b!383101 (=> res!218131 e!232691)))

(declare-fun lt!179831 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383101 (= res!218131 (or (and (not lt!179831) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179831) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179831)))))

(assert (=> b!383101 (= lt!179831 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!472 () V!13531)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13531)

(declare-fun getCurrentListMap!2002 (array!22531 array!22529 (_ BitVec 32) (_ BitVec 32) V!13531 V!13531 (_ BitVec 32) Int) ListLongMap!5209)

(assert (=> b!383101 (= lt!179834 (getCurrentListMap!2002 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179828 () array!22529)

(declare-fun lt!179827 () array!22531)

(assert (=> b!383101 (= lt!179825 (getCurrentListMap!2002 lt!179827 lt!179828 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179835 () ListLongMap!5209)

(assert (=> b!383101 (and (= lt!179832 lt!179835) (= lt!179835 lt!179832))))

(declare-fun lt!179829 () ListLongMap!5209)

(assert (=> b!383101 (= lt!179835 (+!977 lt!179829 lt!179833))))

(declare-fun v!373 () V!13531)

(assert (=> b!383101 (= lt!179833 (tuple2!6307 k0!778 v!373))))

(declare-datatypes ((Unit!11810 0))(
  ( (Unit!11811) )
))
(declare-fun lt!179826 () Unit!11810)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!195 (array!22531 array!22529 (_ BitVec 32) (_ BitVec 32) V!13531 V!13531 (_ BitVec 32) (_ BitVec 64) V!13531 (_ BitVec 32) Int) Unit!11810)

(assert (=> b!383101 (= lt!179826 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!195 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!867 (array!22531 array!22529 (_ BitVec 32) (_ BitVec 32) V!13531 V!13531 (_ BitVec 32) Int) ListLongMap!5209)

(assert (=> b!383101 (= lt!179832 (getCurrentListMapNoExtraKeys!867 lt!179827 lt!179828 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383101 (= lt!179828 (array!22530 (store (arr!10733 _values!506) i!548 (ValueCellFull!4316 v!373)) (size!11086 _values!506)))))

(assert (=> b!383101 (= lt!179829 (getCurrentListMapNoExtraKeys!867 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383102 () Bool)

(declare-fun e!232695 () Bool)

(assert (=> b!383102 (= e!232695 tp_is_empty!9319)))

(declare-fun b!383103 () Bool)

(declare-fun res!218128 () Bool)

(assert (=> b!383103 (=> (not res!218128) (not e!232697))))

(declare-fun arrayContainsKey!0 (array!22531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383103 (= res!218128 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383104 () Bool)

(declare-fun e!232692 () Bool)

(assert (=> b!383104 (= e!232692 tp_is_empty!9319)))

(declare-fun b!383105 () Bool)

(declare-fun res!218135 () Bool)

(assert (=> b!383105 (=> (not res!218135) (not e!232697))))

(assert (=> b!383105 (= res!218135 (and (= (size!11086 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11087 _keys!658) (size!11086 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15543 () Bool)

(declare-fun tp!30729 () Bool)

(assert (=> mapNonEmpty!15543 (= mapRes!15543 (and tp!30729 e!232692))))

(declare-fun mapRest!15543 () (Array (_ BitVec 32) ValueCell!4316))

(declare-fun mapKey!15543 () (_ BitVec 32))

(declare-fun mapValue!15543 () ValueCell!4316)

(assert (=> mapNonEmpty!15543 (= (arr!10733 _values!506) (store mapRest!15543 mapKey!15543 mapValue!15543))))

(declare-fun b!383106 () Bool)

(declare-fun res!218126 () Bool)

(assert (=> b!383106 (=> (not res!218126) (not e!232697))))

(assert (=> b!383106 (= res!218126 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11087 _keys!658))))))

(declare-fun b!383107 () Bool)

(declare-fun res!218125 () Bool)

(assert (=> b!383107 (=> (not res!218125) (not e!232697))))

(assert (=> b!383107 (= res!218125 (or (= (select (arr!10734 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10734 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383108 () Bool)

(assert (=> b!383108 (= e!232697 e!232693)))

(declare-fun res!218134 () Bool)

(assert (=> b!383108 (=> (not res!218134) (not e!232693))))

(assert (=> b!383108 (= res!218134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179827 mask!970))))

(assert (=> b!383108 (= lt!179827 (array!22532 (store (arr!10734 _keys!658) i!548 k0!778) (size!11087 _keys!658)))))

(declare-fun b!383109 () Bool)

(declare-fun res!218132 () Bool)

(assert (=> b!383109 (=> (not res!218132) (not e!232693))))

(assert (=> b!383109 (= res!218132 (arrayNoDuplicates!0 lt!179827 #b00000000000000000000000000000000 Nil!6128))))

(declare-fun b!383110 () Bool)

(assert (=> b!383110 (= e!232696 (and e!232695 mapRes!15543))))

(declare-fun condMapEmpty!15543 () Bool)

(declare-fun mapDefault!15543 () ValueCell!4316)

(assert (=> b!383110 (= condMapEmpty!15543 (= (arr!10733 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4316)) mapDefault!15543)))))

(assert (= (and start!37530 res!218133) b!383105))

(assert (= (and b!383105 res!218135) b!383098))

(assert (= (and b!383098 res!218130) b!383097))

(assert (= (and b!383097 res!218127) b!383106))

(assert (= (and b!383106 res!218126) b!383100))

(assert (= (and b!383100 res!218129) b!383107))

(assert (= (and b!383107 res!218125) b!383103))

(assert (= (and b!383103 res!218128) b!383108))

(assert (= (and b!383108 res!218134) b!383109))

(assert (= (and b!383109 res!218132) b!383101))

(assert (= (and b!383101 (not res!218131)) b!383099))

(assert (= (and b!383110 condMapEmpty!15543) mapIsEmpty!15543))

(assert (= (and b!383110 (not condMapEmpty!15543)) mapNonEmpty!15543))

(get-info :version)

(assert (= (and mapNonEmpty!15543 ((_ is ValueCellFull!4316) mapValue!15543)) b!383104))

(assert (= (and b!383110 ((_ is ValueCellFull!4316) mapDefault!15543)) b!383102))

(assert (= start!37530 b!383110))

(declare-fun m!379391 () Bool)

(assert (=> b!383107 m!379391))

(declare-fun m!379393 () Bool)

(assert (=> b!383101 m!379393))

(declare-fun m!379395 () Bool)

(assert (=> b!383101 m!379395))

(declare-fun m!379397 () Bool)

(assert (=> b!383101 m!379397))

(declare-fun m!379399 () Bool)

(assert (=> b!383101 m!379399))

(declare-fun m!379401 () Bool)

(assert (=> b!383101 m!379401))

(declare-fun m!379403 () Bool)

(assert (=> b!383101 m!379403))

(declare-fun m!379405 () Bool)

(assert (=> b!383101 m!379405))

(declare-fun m!379407 () Bool)

(assert (=> mapNonEmpty!15543 m!379407))

(declare-fun m!379409 () Bool)

(assert (=> b!383103 m!379409))

(declare-fun m!379411 () Bool)

(assert (=> b!383097 m!379411))

(declare-fun m!379413 () Bool)

(assert (=> start!37530 m!379413))

(declare-fun m!379415 () Bool)

(assert (=> start!37530 m!379415))

(declare-fun m!379417 () Bool)

(assert (=> start!37530 m!379417))

(declare-fun m!379419 () Bool)

(assert (=> b!383108 m!379419))

(declare-fun m!379421 () Bool)

(assert (=> b!383108 m!379421))

(declare-fun m!379423 () Bool)

(assert (=> b!383100 m!379423))

(declare-fun m!379425 () Bool)

(assert (=> b!383099 m!379425))

(declare-fun m!379427 () Bool)

(assert (=> b!383109 m!379427))

(declare-fun m!379429 () Bool)

(assert (=> b!383098 m!379429))

(check-sat (not b_next!8671) (not b!383101) (not b!383109) (not b!383103) (not b!383108) (not b!383097) b_and!15887 (not mapNonEmpty!15543) (not b!383098) (not start!37530) tp_is_empty!9319 (not b!383099) (not b!383100))
(check-sat b_and!15887 (not b_next!8671))
