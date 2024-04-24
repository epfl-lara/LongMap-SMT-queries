; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37416 () Bool)

(assert start!37416)

(declare-fun b_free!8557 () Bool)

(declare-fun b_next!8557 () Bool)

(assert (=> start!37416 (= b_free!8557 (not b_next!8557))))

(declare-fun tp!30386 () Bool)

(declare-fun b_and!15813 () Bool)

(assert (=> start!37416 (= tp!30386 b_and!15813)))

(declare-fun b!380925 () Bool)

(declare-fun e!231636 () Bool)

(declare-fun e!231637 () Bool)

(declare-fun mapRes!15372 () Bool)

(assert (=> b!380925 (= e!231636 (and e!231637 mapRes!15372))))

(declare-fun condMapEmpty!15372 () Bool)

(declare-datatypes ((V!13379 0))(
  ( (V!13380 (val!4647 Int)) )
))
(declare-datatypes ((ValueCell!4259 0))(
  ( (ValueCellFull!4259 (v!6845 V!13379)) (EmptyCell!4259) )
))
(declare-datatypes ((array!22310 0))(
  ( (array!22311 (arr!10623 (Array (_ BitVec 32) ValueCell!4259)) (size!10975 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22310)

(declare-fun mapDefault!15372 () ValueCell!4259)

(assert (=> b!380925 (= condMapEmpty!15372 (= (arr!10623 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4259)) mapDefault!15372)))))

(declare-fun mapNonEmpty!15372 () Bool)

(declare-fun tp!30387 () Bool)

(declare-fun e!231639 () Bool)

(assert (=> mapNonEmpty!15372 (= mapRes!15372 (and tp!30387 e!231639))))

(declare-fun mapRest!15372 () (Array (_ BitVec 32) ValueCell!4259))

(declare-fun mapKey!15372 () (_ BitVec 32))

(declare-fun mapValue!15372 () ValueCell!4259)

(assert (=> mapNonEmpty!15372 (= (arr!10623 _values!506) (store mapRest!15372 mapKey!15372 mapValue!15372))))

(declare-fun mapIsEmpty!15372 () Bool)

(assert (=> mapIsEmpty!15372 mapRes!15372))

(declare-fun b!380926 () Bool)

(declare-fun res!216379 () Bool)

(declare-fun e!231642 () Bool)

(assert (=> b!380926 (=> (not res!216379) (not e!231642))))

(declare-datatypes ((array!22312 0))(
  ( (array!22313 (arr!10624 (Array (_ BitVec 32) (_ BitVec 64))) (size!10976 (_ BitVec 32))) )
))
(declare-fun lt!178507 () array!22312)

(declare-datatypes ((List!5949 0))(
  ( (Nil!5946) (Cons!5945 (h!6801 (_ BitVec 64)) (t!11091 List!5949)) )
))
(declare-fun arrayNoDuplicates!0 (array!22312 (_ BitVec 32) List!5949) Bool)

(assert (=> b!380926 (= res!216379 (arrayNoDuplicates!0 lt!178507 #b00000000000000000000000000000000 Nil!5946))))

(declare-fun b!380927 () Bool)

(declare-fun res!216372 () Bool)

(declare-fun e!231640 () Bool)

(assert (=> b!380927 (=> (not res!216372) (not e!231640))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!22312)

(assert (=> b!380927 (= res!216372 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10976 _keys!658))))))

(declare-fun b!380928 () Bool)

(declare-fun res!216380 () Bool)

(assert (=> b!380928 (=> (not res!216380) (not e!231640))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!380928 (= res!216380 (and (= (size!10975 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10976 _keys!658) (size!10975 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380929 () Bool)

(declare-fun res!216374 () Bool)

(assert (=> b!380929 (=> (not res!216374) (not e!231640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22312 (_ BitVec 32)) Bool)

(assert (=> b!380929 (= res!216374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380930 () Bool)

(declare-fun res!216370 () Bool)

(assert (=> b!380930 (=> (not res!216370) (not e!231640))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380930 (= res!216370 (validKeyInArray!0 k0!778))))

(declare-fun b!380931 () Bool)

(declare-fun res!216377 () Bool)

(assert (=> b!380931 (=> (not res!216377) (not e!231640))))

(declare-fun arrayContainsKey!0 (array!22312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380931 (= res!216377 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380932 () Bool)

(declare-fun tp_is_empty!9205 () Bool)

(assert (=> b!380932 (= e!231637 tp_is_empty!9205)))

(declare-fun res!216375 () Bool)

(assert (=> start!37416 (=> (not res!216375) (not e!231640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37416 (= res!216375 (validMask!0 mask!970))))

(assert (=> start!37416 e!231640))

(declare-fun array_inv!7864 (array!22310) Bool)

(assert (=> start!37416 (and (array_inv!7864 _values!506) e!231636)))

(assert (=> start!37416 tp!30386))

(assert (=> start!37416 true))

(assert (=> start!37416 tp_is_empty!9205))

(declare-fun array_inv!7865 (array!22312) Bool)

(assert (=> start!37416 (array_inv!7865 _keys!658)))

(declare-fun b!380933 () Bool)

(declare-fun res!216376 () Bool)

(assert (=> b!380933 (=> (not res!216376) (not e!231640))))

(assert (=> b!380933 (= res!216376 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5946))))

(declare-fun b!380934 () Bool)

(assert (=> b!380934 (= e!231639 tp_is_empty!9205)))

(declare-fun b!380935 () Bool)

(declare-fun e!231638 () Bool)

(assert (=> b!380935 (= e!231638 true)))

(declare-datatypes ((tuple2!6112 0))(
  ( (tuple2!6113 (_1!3067 (_ BitVec 64)) (_2!3067 V!13379)) )
))
(declare-datatypes ((List!5950 0))(
  ( (Nil!5947) (Cons!5946 (h!6802 tuple2!6112) (t!11092 List!5950)) )
))
(declare-datatypes ((ListLongMap!5027 0))(
  ( (ListLongMap!5028 (toList!2529 List!5950)) )
))
(declare-fun lt!178500 () ListLongMap!5027)

(declare-fun lt!178506 () ListLongMap!5027)

(assert (=> b!380935 (= lt!178500 lt!178506)))

(declare-fun b!380936 () Bool)

(assert (=> b!380936 (= e!231642 (not e!231638))))

(declare-fun res!216371 () Bool)

(assert (=> b!380936 (=> res!216371 e!231638)))

(declare-fun lt!178504 () Bool)

(assert (=> b!380936 (= res!216371 (or (and (not lt!178504) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178504) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178504)))))

(assert (=> b!380936 (= lt!178504 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13379)

(declare-fun lt!178503 () ListLongMap!5027)

(declare-fun minValue!472 () V!13379)

(declare-fun getCurrentListMap!1967 (array!22312 array!22310 (_ BitVec 32) (_ BitVec 32) V!13379 V!13379 (_ BitVec 32) Int) ListLongMap!5027)

(assert (=> b!380936 (= lt!178503 (getCurrentListMap!1967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178505 () array!22310)

(assert (=> b!380936 (= lt!178500 (getCurrentListMap!1967 lt!178507 lt!178505 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178499 () ListLongMap!5027)

(assert (=> b!380936 (and (= lt!178506 lt!178499) (= lt!178499 lt!178506))))

(declare-fun v!373 () V!13379)

(declare-fun lt!178501 () ListLongMap!5027)

(declare-fun +!925 (ListLongMap!5027 tuple2!6112) ListLongMap!5027)

(assert (=> b!380936 (= lt!178499 (+!925 lt!178501 (tuple2!6113 k0!778 v!373)))))

(declare-datatypes ((Unit!11729 0))(
  ( (Unit!11730) )
))
(declare-fun lt!178502 () Unit!11729)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!154 (array!22312 array!22310 (_ BitVec 32) (_ BitVec 32) V!13379 V!13379 (_ BitVec 32) (_ BitVec 64) V!13379 (_ BitVec 32) Int) Unit!11729)

(assert (=> b!380936 (= lt!178502 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!154 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!814 (array!22312 array!22310 (_ BitVec 32) (_ BitVec 32) V!13379 V!13379 (_ BitVec 32) Int) ListLongMap!5027)

(assert (=> b!380936 (= lt!178506 (getCurrentListMapNoExtraKeys!814 lt!178507 lt!178505 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380936 (= lt!178505 (array!22311 (store (arr!10623 _values!506) i!548 (ValueCellFull!4259 v!373)) (size!10975 _values!506)))))

(assert (=> b!380936 (= lt!178501 (getCurrentListMapNoExtraKeys!814 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380937 () Bool)

(declare-fun res!216373 () Bool)

(assert (=> b!380937 (=> (not res!216373) (not e!231640))))

(assert (=> b!380937 (= res!216373 (or (= (select (arr!10624 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10624 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380938 () Bool)

(assert (=> b!380938 (= e!231640 e!231642)))

(declare-fun res!216378 () Bool)

(assert (=> b!380938 (=> (not res!216378) (not e!231642))))

(assert (=> b!380938 (= res!216378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178507 mask!970))))

(assert (=> b!380938 (= lt!178507 (array!22313 (store (arr!10624 _keys!658) i!548 k0!778) (size!10976 _keys!658)))))

(assert (= (and start!37416 res!216375) b!380928))

(assert (= (and b!380928 res!216380) b!380929))

(assert (= (and b!380929 res!216374) b!380933))

(assert (= (and b!380933 res!216376) b!380927))

(assert (= (and b!380927 res!216372) b!380930))

(assert (= (and b!380930 res!216370) b!380937))

(assert (= (and b!380937 res!216373) b!380931))

(assert (= (and b!380931 res!216377) b!380938))

(assert (= (and b!380938 res!216378) b!380926))

(assert (= (and b!380926 res!216379) b!380936))

(assert (= (and b!380936 (not res!216371)) b!380935))

(assert (= (and b!380925 condMapEmpty!15372) mapIsEmpty!15372))

(assert (= (and b!380925 (not condMapEmpty!15372)) mapNonEmpty!15372))

(get-info :version)

(assert (= (and mapNonEmpty!15372 ((_ is ValueCellFull!4259) mapValue!15372)) b!380934))

(assert (= (and b!380925 ((_ is ValueCellFull!4259) mapDefault!15372)) b!380932))

(assert (= start!37416 b!380925))

(declare-fun m!378167 () Bool)

(assert (=> b!380937 m!378167))

(declare-fun m!378169 () Bool)

(assert (=> b!380933 m!378169))

(declare-fun m!378171 () Bool)

(assert (=> b!380930 m!378171))

(declare-fun m!378173 () Bool)

(assert (=> b!380929 m!378173))

(declare-fun m!378175 () Bool)

(assert (=> b!380926 m!378175))

(declare-fun m!378177 () Bool)

(assert (=> b!380931 m!378177))

(declare-fun m!378179 () Bool)

(assert (=> mapNonEmpty!15372 m!378179))

(declare-fun m!378181 () Bool)

(assert (=> b!380938 m!378181))

(declare-fun m!378183 () Bool)

(assert (=> b!380938 m!378183))

(declare-fun m!378185 () Bool)

(assert (=> b!380936 m!378185))

(declare-fun m!378187 () Bool)

(assert (=> b!380936 m!378187))

(declare-fun m!378189 () Bool)

(assert (=> b!380936 m!378189))

(declare-fun m!378191 () Bool)

(assert (=> b!380936 m!378191))

(declare-fun m!378193 () Bool)

(assert (=> b!380936 m!378193))

(declare-fun m!378195 () Bool)

(assert (=> b!380936 m!378195))

(declare-fun m!378197 () Bool)

(assert (=> b!380936 m!378197))

(declare-fun m!378199 () Bool)

(assert (=> start!37416 m!378199))

(declare-fun m!378201 () Bool)

(assert (=> start!37416 m!378201))

(declare-fun m!378203 () Bool)

(assert (=> start!37416 m!378203))

(check-sat tp_is_empty!9205 (not b!380931) (not b!380929) (not b_next!8557) (not b!380930) b_and!15813 (not b!380938) (not mapNonEmpty!15372) (not b!380936) (not start!37416) (not b!380926) (not b!380933))
(check-sat b_and!15813 (not b_next!8557))
