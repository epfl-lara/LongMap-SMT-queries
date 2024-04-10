; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37744 () Bool)

(assert start!37744)

(declare-fun b_free!8847 () Bool)

(declare-fun b_next!8847 () Bool)

(assert (=> start!37744 (= b_free!8847 (not b_next!8847))))

(declare-fun tp!31293 () Bool)

(declare-fun b_and!16089 () Bool)

(assert (=> start!37744 (= tp!31293 b_and!16089)))

(declare-fun b!387221 () Bool)

(declare-fun e!234791 () Bool)

(assert (=> b!387221 (= e!234791 false)))

(declare-datatypes ((V!13797 0))(
  ( (V!13798 (val!4804 Int)) )
))
(declare-datatypes ((ValueCell!4416 0))(
  ( (ValueCellFull!4416 (v!7001 V!13797)) (EmptyCell!4416) )
))
(declare-datatypes ((array!22931 0))(
  ( (array!22932 (arr!10934 (Array (_ BitVec 32) ValueCell!4416)) (size!11286 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22931)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13797)

(declare-datatypes ((tuple2!6458 0))(
  ( (tuple2!6459 (_1!3240 (_ BitVec 64)) (_2!3240 V!13797)) )
))
(declare-datatypes ((List!6308 0))(
  ( (Nil!6305) (Cons!6304 (h!7160 tuple2!6458) (t!11458 List!6308)) )
))
(declare-datatypes ((ListLongMap!5371 0))(
  ( (ListLongMap!5372 (toList!2701 List!6308)) )
))
(declare-fun lt!181988 () ListLongMap!5371)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13797)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22933 0))(
  ( (array!22934 (arr!10935 (Array (_ BitVec 32) (_ BitVec 64))) (size!11287 (_ BitVec 32))) )
))
(declare-fun lt!181987 () array!22933)

(declare-fun minValue!472 () V!13797)

(declare-fun getCurrentListMapNoExtraKeys!930 (array!22933 array!22931 (_ BitVec 32) (_ BitVec 32) V!13797 V!13797 (_ BitVec 32) Int) ListLongMap!5371)

(assert (=> b!387221 (= lt!181988 (getCurrentListMapNoExtraKeys!930 lt!181987 (array!22932 (store (arr!10934 _values!506) i!548 (ValueCellFull!4416 v!373)) (size!11286 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181989 () ListLongMap!5371)

(declare-fun _keys!658 () array!22933)

(assert (=> b!387221 (= lt!181989 (getCurrentListMapNoExtraKeys!930 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387222 () Bool)

(declare-fun res!221214 () Bool)

(assert (=> b!387222 (=> (not res!221214) (not e!234791))))

(declare-datatypes ((List!6309 0))(
  ( (Nil!6306) (Cons!6305 (h!7161 (_ BitVec 64)) (t!11459 List!6309)) )
))
(declare-fun arrayNoDuplicates!0 (array!22933 (_ BitVec 32) List!6309) Bool)

(assert (=> b!387222 (= res!221214 (arrayNoDuplicates!0 lt!181987 #b00000000000000000000000000000000 Nil!6306))))

(declare-fun res!221211 () Bool)

(declare-fun e!234794 () Bool)

(assert (=> start!37744 (=> (not res!221211) (not e!234794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37744 (= res!221211 (validMask!0 mask!970))))

(assert (=> start!37744 e!234794))

(declare-fun e!234790 () Bool)

(declare-fun array_inv!8046 (array!22931) Bool)

(assert (=> start!37744 (and (array_inv!8046 _values!506) e!234790)))

(assert (=> start!37744 tp!31293))

(assert (=> start!37744 true))

(declare-fun tp_is_empty!9519 () Bool)

(assert (=> start!37744 tp_is_empty!9519))

(declare-fun array_inv!8047 (array!22933) Bool)

(assert (=> start!37744 (array_inv!8047 _keys!658)))

(declare-fun b!387223 () Bool)

(declare-fun e!234793 () Bool)

(declare-fun mapRes!15843 () Bool)

(assert (=> b!387223 (= e!234790 (and e!234793 mapRes!15843))))

(declare-fun condMapEmpty!15843 () Bool)

(declare-fun mapDefault!15843 () ValueCell!4416)

(assert (=> b!387223 (= condMapEmpty!15843 (= (arr!10934 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4416)) mapDefault!15843)))))

(declare-fun b!387224 () Bool)

(assert (=> b!387224 (= e!234793 tp_is_empty!9519)))

(declare-fun b!387225 () Bool)

(declare-fun res!221207 () Bool)

(assert (=> b!387225 (=> (not res!221207) (not e!234794))))

(assert (=> b!387225 (= res!221207 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11287 _keys!658))))))

(declare-fun b!387226 () Bool)

(declare-fun res!221209 () Bool)

(assert (=> b!387226 (=> (not res!221209) (not e!234794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22933 (_ BitVec 32)) Bool)

(assert (=> b!387226 (= res!221209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387227 () Bool)

(declare-fun res!221215 () Bool)

(assert (=> b!387227 (=> (not res!221215) (not e!234794))))

(assert (=> b!387227 (= res!221215 (and (= (size!11286 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11287 _keys!658) (size!11286 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387228 () Bool)

(declare-fun res!221210 () Bool)

(assert (=> b!387228 (=> (not res!221210) (not e!234794))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387228 (= res!221210 (validKeyInArray!0 k0!778))))

(declare-fun b!387229 () Bool)

(declare-fun res!221212 () Bool)

(assert (=> b!387229 (=> (not res!221212) (not e!234794))))

(declare-fun arrayContainsKey!0 (array!22933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387229 (= res!221212 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15843 () Bool)

(assert (=> mapIsEmpty!15843 mapRes!15843))

(declare-fun b!387230 () Bool)

(declare-fun res!221208 () Bool)

(assert (=> b!387230 (=> (not res!221208) (not e!234794))))

(assert (=> b!387230 (= res!221208 (or (= (select (arr!10935 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10935 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387231 () Bool)

(declare-fun e!234792 () Bool)

(assert (=> b!387231 (= e!234792 tp_is_empty!9519)))

(declare-fun b!387232 () Bool)

(assert (=> b!387232 (= e!234794 e!234791)))

(declare-fun res!221216 () Bool)

(assert (=> b!387232 (=> (not res!221216) (not e!234791))))

(assert (=> b!387232 (= res!221216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181987 mask!970))))

(assert (=> b!387232 (= lt!181987 (array!22934 (store (arr!10935 _keys!658) i!548 k0!778) (size!11287 _keys!658)))))

(declare-fun b!387233 () Bool)

(declare-fun res!221213 () Bool)

(assert (=> b!387233 (=> (not res!221213) (not e!234794))))

(assert (=> b!387233 (= res!221213 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6306))))

(declare-fun mapNonEmpty!15843 () Bool)

(declare-fun tp!31292 () Bool)

(assert (=> mapNonEmpty!15843 (= mapRes!15843 (and tp!31292 e!234792))))

(declare-fun mapValue!15843 () ValueCell!4416)

(declare-fun mapKey!15843 () (_ BitVec 32))

(declare-fun mapRest!15843 () (Array (_ BitVec 32) ValueCell!4416))

(assert (=> mapNonEmpty!15843 (= (arr!10934 _values!506) (store mapRest!15843 mapKey!15843 mapValue!15843))))

(assert (= (and start!37744 res!221211) b!387227))

(assert (= (and b!387227 res!221215) b!387226))

(assert (= (and b!387226 res!221209) b!387233))

(assert (= (and b!387233 res!221213) b!387225))

(assert (= (and b!387225 res!221207) b!387228))

(assert (= (and b!387228 res!221210) b!387230))

(assert (= (and b!387230 res!221208) b!387229))

(assert (= (and b!387229 res!221212) b!387232))

(assert (= (and b!387232 res!221216) b!387222))

(assert (= (and b!387222 res!221214) b!387221))

(assert (= (and b!387223 condMapEmpty!15843) mapIsEmpty!15843))

(assert (= (and b!387223 (not condMapEmpty!15843)) mapNonEmpty!15843))

(get-info :version)

(assert (= (and mapNonEmpty!15843 ((_ is ValueCellFull!4416) mapValue!15843)) b!387231))

(assert (= (and b!387223 ((_ is ValueCellFull!4416) mapDefault!15843)) b!387224))

(assert (= start!37744 b!387223))

(declare-fun m!383385 () Bool)

(assert (=> b!387229 m!383385))

(declare-fun m!383387 () Bool)

(assert (=> b!387233 m!383387))

(declare-fun m!383389 () Bool)

(assert (=> b!387228 m!383389))

(declare-fun m!383391 () Bool)

(assert (=> b!387221 m!383391))

(declare-fun m!383393 () Bool)

(assert (=> b!387221 m!383393))

(declare-fun m!383395 () Bool)

(assert (=> b!387221 m!383395))

(declare-fun m!383397 () Bool)

(assert (=> b!387230 m!383397))

(declare-fun m!383399 () Bool)

(assert (=> b!387226 m!383399))

(declare-fun m!383401 () Bool)

(assert (=> mapNonEmpty!15843 m!383401))

(declare-fun m!383403 () Bool)

(assert (=> b!387232 m!383403))

(declare-fun m!383405 () Bool)

(assert (=> b!387232 m!383405))

(declare-fun m!383407 () Bool)

(assert (=> b!387222 m!383407))

(declare-fun m!383409 () Bool)

(assert (=> start!37744 m!383409))

(declare-fun m!383411 () Bool)

(assert (=> start!37744 m!383411))

(declare-fun m!383413 () Bool)

(assert (=> start!37744 m!383413))

(check-sat (not b!387221) tp_is_empty!9519 (not start!37744) (not mapNonEmpty!15843) (not b!387226) (not b_next!8847) (not b!387232) b_and!16089 (not b!387229) (not b!387228) (not b!387233) (not b!387222))
(check-sat b_and!16089 (not b_next!8847))
