; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37734 () Bool)

(assert start!37734)

(declare-fun b_free!8851 () Bool)

(declare-fun b_next!8851 () Bool)

(assert (=> start!37734 (= b_free!8851 (not b_next!8851))))

(declare-fun tp!31305 () Bool)

(declare-fun b_and!16107 () Bool)

(assert (=> start!37734 (= tp!31305 b_and!16107)))

(declare-fun b!387250 () Bool)

(declare-fun res!221268 () Bool)

(declare-fun e!234796 () Bool)

(assert (=> b!387250 (=> (not res!221268) (not e!234796))))

(declare-datatypes ((array!22930 0))(
  ( (array!22931 (arr!10933 (Array (_ BitVec 32) (_ BitVec 64))) (size!11285 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22930)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387250 (= res!221268 (or (= (select (arr!10933 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10933 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387251 () Bool)

(declare-fun res!221264 () Bool)

(declare-fun e!234798 () Bool)

(assert (=> b!387251 (=> (not res!221264) (not e!234798))))

(declare-fun lt!182024 () array!22930)

(declare-datatypes ((List!6175 0))(
  ( (Nil!6172) (Cons!6171 (h!7027 (_ BitVec 64)) (t!11317 List!6175)) )
))
(declare-fun arrayNoDuplicates!0 (array!22930 (_ BitVec 32) List!6175) Bool)

(assert (=> b!387251 (= res!221264 (arrayNoDuplicates!0 lt!182024 #b00000000000000000000000000000000 Nil!6172))))

(declare-fun b!387252 () Bool)

(declare-fun res!221265 () Bool)

(assert (=> b!387252 (=> (not res!221265) (not e!234796))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387252 (= res!221265 (validKeyInArray!0 k0!778))))

(declare-fun b!387253 () Bool)

(assert (=> b!387253 (= e!234798 false)))

(declare-datatypes ((V!13803 0))(
  ( (V!13804 (val!4806 Int)) )
))
(declare-datatypes ((tuple2!6326 0))(
  ( (tuple2!6327 (_1!3174 (_ BitVec 64)) (_2!3174 V!13803)) )
))
(declare-datatypes ((List!6176 0))(
  ( (Nil!6173) (Cons!6172 (h!7028 tuple2!6326) (t!11318 List!6176)) )
))
(declare-datatypes ((ListLongMap!5241 0))(
  ( (ListLongMap!5242 (toList!2636 List!6176)) )
))
(declare-fun lt!182026 () ListLongMap!5241)

(declare-datatypes ((ValueCell!4418 0))(
  ( (ValueCellFull!4418 (v!7004 V!13803)) (EmptyCell!4418) )
))
(declare-datatypes ((array!22932 0))(
  ( (array!22933 (arr!10934 (Array (_ BitVec 32) ValueCell!4418)) (size!11286 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22932)

(declare-fun defaultEntry!514 () Int)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13803)

(declare-fun zeroValue!472 () V!13803)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13803)

(declare-fun getCurrentListMapNoExtraKeys!911 (array!22930 array!22932 (_ BitVec 32) (_ BitVec 32) V!13803 V!13803 (_ BitVec 32) Int) ListLongMap!5241)

(assert (=> b!387253 (= lt!182026 (getCurrentListMapNoExtraKeys!911 lt!182024 (array!22933 (store (arr!10934 _values!506) i!548 (ValueCellFull!4418 v!373)) (size!11286 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182025 () ListLongMap!5241)

(assert (=> b!387253 (= lt!182025 (getCurrentListMapNoExtraKeys!911 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387254 () Bool)

(declare-fun e!234797 () Bool)

(declare-fun tp_is_empty!9523 () Bool)

(assert (=> b!387254 (= e!234797 tp_is_empty!9523)))

(declare-fun b!387255 () Bool)

(declare-fun res!221271 () Bool)

(assert (=> b!387255 (=> (not res!221271) (not e!234796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22930 (_ BitVec 32)) Bool)

(assert (=> b!387255 (= res!221271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387256 () Bool)

(assert (=> b!387256 (= e!234796 e!234798)))

(declare-fun res!221273 () Bool)

(assert (=> b!387256 (=> (not res!221273) (not e!234798))))

(assert (=> b!387256 (= res!221273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182024 mask!970))))

(assert (=> b!387256 (= lt!182024 (array!22931 (store (arr!10933 _keys!658) i!548 k0!778) (size!11285 _keys!658)))))

(declare-fun mapNonEmpty!15849 () Bool)

(declare-fun mapRes!15849 () Bool)

(declare-fun tp!31304 () Bool)

(assert (=> mapNonEmpty!15849 (= mapRes!15849 (and tp!31304 e!234797))))

(declare-fun mapValue!15849 () ValueCell!4418)

(declare-fun mapKey!15849 () (_ BitVec 32))

(declare-fun mapRest!15849 () (Array (_ BitVec 32) ValueCell!4418))

(assert (=> mapNonEmpty!15849 (= (arr!10934 _values!506) (store mapRest!15849 mapKey!15849 mapValue!15849))))

(declare-fun b!387257 () Bool)

(declare-fun res!221269 () Bool)

(assert (=> b!387257 (=> (not res!221269) (not e!234796))))

(declare-fun arrayContainsKey!0 (array!22930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387257 (= res!221269 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387258 () Bool)

(declare-fun res!221272 () Bool)

(assert (=> b!387258 (=> (not res!221272) (not e!234796))))

(assert (=> b!387258 (= res!221272 (and (= (size!11286 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11285 _keys!658) (size!11286 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15849 () Bool)

(assert (=> mapIsEmpty!15849 mapRes!15849))

(declare-fun b!387259 () Bool)

(declare-fun res!221270 () Bool)

(assert (=> b!387259 (=> (not res!221270) (not e!234796))))

(assert (=> b!387259 (= res!221270 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11285 _keys!658))))))

(declare-fun res!221266 () Bool)

(assert (=> start!37734 (=> (not res!221266) (not e!234796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37734 (= res!221266 (validMask!0 mask!970))))

(assert (=> start!37734 e!234796))

(declare-fun e!234794 () Bool)

(declare-fun array_inv!8080 (array!22932) Bool)

(assert (=> start!37734 (and (array_inv!8080 _values!506) e!234794)))

(assert (=> start!37734 tp!31305))

(assert (=> start!37734 true))

(assert (=> start!37734 tp_is_empty!9523))

(declare-fun array_inv!8081 (array!22930) Bool)

(assert (=> start!37734 (array_inv!8081 _keys!658)))

(declare-fun b!387260 () Bool)

(declare-fun e!234793 () Bool)

(assert (=> b!387260 (= e!234794 (and e!234793 mapRes!15849))))

(declare-fun condMapEmpty!15849 () Bool)

(declare-fun mapDefault!15849 () ValueCell!4418)

(assert (=> b!387260 (= condMapEmpty!15849 (= (arr!10934 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4418)) mapDefault!15849)))))

(declare-fun b!387261 () Bool)

(declare-fun res!221267 () Bool)

(assert (=> b!387261 (=> (not res!221267) (not e!234796))))

(assert (=> b!387261 (= res!221267 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6172))))

(declare-fun b!387262 () Bool)

(assert (=> b!387262 (= e!234793 tp_is_empty!9523)))

(assert (= (and start!37734 res!221266) b!387258))

(assert (= (and b!387258 res!221272) b!387255))

(assert (= (and b!387255 res!221271) b!387261))

(assert (= (and b!387261 res!221267) b!387259))

(assert (= (and b!387259 res!221270) b!387252))

(assert (= (and b!387252 res!221265) b!387250))

(assert (= (and b!387250 res!221268) b!387257))

(assert (= (and b!387257 res!221269) b!387256))

(assert (= (and b!387256 res!221273) b!387251))

(assert (= (and b!387251 res!221264) b!387253))

(assert (= (and b!387260 condMapEmpty!15849) mapIsEmpty!15849))

(assert (= (and b!387260 (not condMapEmpty!15849)) mapNonEmpty!15849))

(get-info :version)

(assert (= (and mapNonEmpty!15849 ((_ is ValueCellFull!4418) mapValue!15849)) b!387254))

(assert (= (and b!387260 ((_ is ValueCellFull!4418) mapDefault!15849)) b!387262))

(assert (= start!37734 b!387260))

(declare-fun m!383675 () Bool)

(assert (=> start!37734 m!383675))

(declare-fun m!383677 () Bool)

(assert (=> start!37734 m!383677))

(declare-fun m!383679 () Bool)

(assert (=> start!37734 m!383679))

(declare-fun m!383681 () Bool)

(assert (=> b!387261 m!383681))

(declare-fun m!383683 () Bool)

(assert (=> b!387250 m!383683))

(declare-fun m!383685 () Bool)

(assert (=> b!387252 m!383685))

(declare-fun m!383687 () Bool)

(assert (=> b!387257 m!383687))

(declare-fun m!383689 () Bool)

(assert (=> mapNonEmpty!15849 m!383689))

(declare-fun m!383691 () Bool)

(assert (=> b!387256 m!383691))

(declare-fun m!383693 () Bool)

(assert (=> b!387256 m!383693))

(declare-fun m!383695 () Bool)

(assert (=> b!387251 m!383695))

(declare-fun m!383697 () Bool)

(assert (=> b!387253 m!383697))

(declare-fun m!383699 () Bool)

(assert (=> b!387253 m!383699))

(declare-fun m!383701 () Bool)

(assert (=> b!387253 m!383701))

(declare-fun m!383703 () Bool)

(assert (=> b!387255 m!383703))

(check-sat tp_is_empty!9523 (not b!387253) (not b!387261) (not b!387252) (not b_next!8851) (not start!37734) (not b!387257) (not b!387251) (not mapNonEmpty!15849) (not b!387255) (not b!387256) b_and!16107)
(check-sat b_and!16107 (not b_next!8851))
