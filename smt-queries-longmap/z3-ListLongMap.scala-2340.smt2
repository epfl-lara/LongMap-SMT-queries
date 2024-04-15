; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37488 () Bool)

(assert start!37488)

(declare-fun b_free!8629 () Bool)

(declare-fun b_next!8629 () Bool)

(assert (=> start!37488 (= b_free!8629 (not b_next!8629))))

(declare-fun tp!30603 () Bool)

(declare-fun b_and!15845 () Bool)

(assert (=> start!37488 (= tp!30603 b_and!15845)))

(declare-fun b!382215 () Bool)

(declare-fun e!232250 () Bool)

(declare-fun e!232252 () Bool)

(declare-fun mapRes!15480 () Bool)

(assert (=> b!382215 (= e!232250 (and e!232252 mapRes!15480))))

(declare-fun condMapEmpty!15480 () Bool)

(declare-datatypes ((V!13475 0))(
  ( (V!13476 (val!4683 Int)) )
))
(declare-datatypes ((ValueCell!4295 0))(
  ( (ValueCellFull!4295 (v!6874 V!13475)) (EmptyCell!4295) )
))
(declare-datatypes ((array!22449 0))(
  ( (array!22450 (arr!10693 (Array (_ BitVec 32) ValueCell!4295)) (size!11046 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22449)

(declare-fun mapDefault!15480 () ValueCell!4295)

(assert (=> b!382215 (= condMapEmpty!15480 (= (arr!10693 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4295)) mapDefault!15480)))))

(declare-fun b!382216 () Bool)

(declare-fun res!217438 () Bool)

(declare-fun e!232255 () Bool)

(assert (=> b!382216 (=> (not res!217438) (not e!232255))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382216 (= res!217438 (validKeyInArray!0 k0!778))))

(declare-fun b!382217 () Bool)

(declare-fun e!232251 () Bool)

(declare-fun tp_is_empty!9277 () Bool)

(assert (=> b!382217 (= e!232251 tp_is_empty!9277)))

(declare-fun b!382218 () Bool)

(declare-fun res!217440 () Bool)

(declare-fun e!232253 () Bool)

(assert (=> b!382218 (=> (not res!217440) (not e!232253))))

(declare-datatypes ((array!22451 0))(
  ( (array!22452 (arr!10694 (Array (_ BitVec 32) (_ BitVec 64))) (size!11047 (_ BitVec 32))) )
))
(declare-fun lt!179221 () array!22451)

(declare-datatypes ((List!6096 0))(
  ( (Nil!6093) (Cons!6092 (h!6948 (_ BitVec 64)) (t!11237 List!6096)) )
))
(declare-fun arrayNoDuplicates!0 (array!22451 (_ BitVec 32) List!6096) Bool)

(assert (=> b!382218 (= res!217440 (arrayNoDuplicates!0 lt!179221 #b00000000000000000000000000000000 Nil!6093))))

(declare-fun b!382219 () Bool)

(assert (=> b!382219 (= e!232252 tp_is_empty!9277)))

(declare-fun b!382220 () Bool)

(declare-fun res!217441 () Bool)

(assert (=> b!382220 (=> (not res!217441) (not e!232255))))

(declare-fun _keys!658 () array!22451)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382220 (= res!217441 (or (= (select (arr!10694 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10694 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382221 () Bool)

(declare-fun e!232254 () Bool)

(assert (=> b!382221 (= e!232254 true)))

(declare-datatypes ((tuple2!6270 0))(
  ( (tuple2!6271 (_1!3146 (_ BitVec 64)) (_2!3146 V!13475)) )
))
(declare-datatypes ((List!6097 0))(
  ( (Nil!6094) (Cons!6093 (h!6949 tuple2!6270) (t!11238 List!6097)) )
))
(declare-datatypes ((ListLongMap!5173 0))(
  ( (ListLongMap!5174 (toList!2602 List!6097)) )
))
(declare-fun lt!179226 () ListLongMap!5173)

(declare-fun lt!179224 () ListLongMap!5173)

(assert (=> b!382221 (= lt!179226 lt!179224)))

(declare-fun mapNonEmpty!15480 () Bool)

(declare-fun tp!30602 () Bool)

(assert (=> mapNonEmpty!15480 (= mapRes!15480 (and tp!30602 e!232251))))

(declare-fun mapValue!15480 () ValueCell!4295)

(declare-fun mapRest!15480 () (Array (_ BitVec 32) ValueCell!4295))

(declare-fun mapKey!15480 () (_ BitVec 32))

(assert (=> mapNonEmpty!15480 (= (arr!10693 _values!506) (store mapRest!15480 mapKey!15480 mapValue!15480))))

(declare-fun mapIsEmpty!15480 () Bool)

(assert (=> mapIsEmpty!15480 mapRes!15480))

(declare-fun b!382222 () Bool)

(declare-fun res!217436 () Bool)

(assert (=> b!382222 (=> (not res!217436) (not e!232255))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382222 (= res!217436 (and (= (size!11046 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11047 _keys!658) (size!11046 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!217433 () Bool)

(assert (=> start!37488 (=> (not res!217433) (not e!232255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37488 (= res!217433 (validMask!0 mask!970))))

(assert (=> start!37488 e!232255))

(declare-fun array_inv!7874 (array!22449) Bool)

(assert (=> start!37488 (and (array_inv!7874 _values!506) e!232250)))

(assert (=> start!37488 tp!30603))

(assert (=> start!37488 true))

(assert (=> start!37488 tp_is_empty!9277))

(declare-fun array_inv!7875 (array!22451) Bool)

(assert (=> start!37488 (array_inv!7875 _keys!658)))

(declare-fun b!382223 () Bool)

(declare-fun res!217435 () Bool)

(assert (=> b!382223 (=> (not res!217435) (not e!232255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22451 (_ BitVec 32)) Bool)

(assert (=> b!382223 (= res!217435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382224 () Bool)

(assert (=> b!382224 (= e!232255 e!232253)))

(declare-fun res!217432 () Bool)

(assert (=> b!382224 (=> (not res!217432) (not e!232253))))

(assert (=> b!382224 (= res!217432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179221 mask!970))))

(assert (=> b!382224 (= lt!179221 (array!22452 (store (arr!10694 _keys!658) i!548 k0!778) (size!11047 _keys!658)))))

(declare-fun b!382225 () Bool)

(declare-fun res!217442 () Bool)

(assert (=> b!382225 (=> (not res!217442) (not e!232255))))

(declare-fun arrayContainsKey!0 (array!22451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382225 (= res!217442 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382226 () Bool)

(declare-fun res!217439 () Bool)

(assert (=> b!382226 (=> (not res!217439) (not e!232255))))

(assert (=> b!382226 (= res!217439 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11047 _keys!658))))))

(declare-fun b!382227 () Bool)

(declare-fun res!217437 () Bool)

(assert (=> b!382227 (=> (not res!217437) (not e!232255))))

(assert (=> b!382227 (= res!217437 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6093))))

(declare-fun b!382228 () Bool)

(assert (=> b!382228 (= e!232253 (not e!232254))))

(declare-fun res!217434 () Bool)

(assert (=> b!382228 (=> res!217434 e!232254)))

(declare-fun lt!179220 () Bool)

(assert (=> b!382228 (= res!217434 (or (and (not lt!179220) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179220) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179220)))))

(assert (=> b!382228 (= lt!179220 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13475)

(declare-fun lt!179225 () ListLongMap!5173)

(declare-fun minValue!472 () V!13475)

(declare-fun getCurrentListMap!1988 (array!22451 array!22449 (_ BitVec 32) (_ BitVec 32) V!13475 V!13475 (_ BitVec 32) Int) ListLongMap!5173)

(assert (=> b!382228 (= lt!179225 (getCurrentListMap!1988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179218 () array!22449)

(assert (=> b!382228 (= lt!179226 (getCurrentListMap!1988 lt!179221 lt!179218 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179223 () ListLongMap!5173)

(assert (=> b!382228 (and (= lt!179224 lt!179223) (= lt!179223 lt!179224))))

(declare-fun v!373 () V!13475)

(declare-fun lt!179222 () ListLongMap!5173)

(declare-fun +!962 (ListLongMap!5173 tuple2!6270) ListLongMap!5173)

(assert (=> b!382228 (= lt!179223 (+!962 lt!179222 (tuple2!6271 k0!778 v!373)))))

(declare-datatypes ((Unit!11782 0))(
  ( (Unit!11783) )
))
(declare-fun lt!179219 () Unit!11782)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!181 (array!22451 array!22449 (_ BitVec 32) (_ BitVec 32) V!13475 V!13475 (_ BitVec 32) (_ BitVec 64) V!13475 (_ BitVec 32) Int) Unit!11782)

(assert (=> b!382228 (= lt!179219 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!181 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!853 (array!22451 array!22449 (_ BitVec 32) (_ BitVec 32) V!13475 V!13475 (_ BitVec 32) Int) ListLongMap!5173)

(assert (=> b!382228 (= lt!179224 (getCurrentListMapNoExtraKeys!853 lt!179221 lt!179218 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382228 (= lt!179218 (array!22450 (store (arr!10693 _values!506) i!548 (ValueCellFull!4295 v!373)) (size!11046 _values!506)))))

(assert (=> b!382228 (= lt!179222 (getCurrentListMapNoExtraKeys!853 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37488 res!217433) b!382222))

(assert (= (and b!382222 res!217436) b!382223))

(assert (= (and b!382223 res!217435) b!382227))

(assert (= (and b!382227 res!217437) b!382226))

(assert (= (and b!382226 res!217439) b!382216))

(assert (= (and b!382216 res!217438) b!382220))

(assert (= (and b!382220 res!217441) b!382225))

(assert (= (and b!382225 res!217442) b!382224))

(assert (= (and b!382224 res!217432) b!382218))

(assert (= (and b!382218 res!217440) b!382228))

(assert (= (and b!382228 (not res!217434)) b!382221))

(assert (= (and b!382215 condMapEmpty!15480) mapIsEmpty!15480))

(assert (= (and b!382215 (not condMapEmpty!15480)) mapNonEmpty!15480))

(get-info :version)

(assert (= (and mapNonEmpty!15480 ((_ is ValueCellFull!4295) mapValue!15480)) b!382217))

(assert (= (and b!382215 ((_ is ValueCellFull!4295) mapDefault!15480)) b!382219))

(assert (= start!37488 b!382215))

(declare-fun m!378581 () Bool)

(assert (=> b!382216 m!378581))

(declare-fun m!378583 () Bool)

(assert (=> b!382223 m!378583))

(declare-fun m!378585 () Bool)

(assert (=> b!382218 m!378585))

(declare-fun m!378587 () Bool)

(assert (=> b!382224 m!378587))

(declare-fun m!378589 () Bool)

(assert (=> b!382224 m!378589))

(declare-fun m!378591 () Bool)

(assert (=> b!382225 m!378591))

(declare-fun m!378593 () Bool)

(assert (=> b!382220 m!378593))

(declare-fun m!378595 () Bool)

(assert (=> b!382227 m!378595))

(declare-fun m!378597 () Bool)

(assert (=> start!37488 m!378597))

(declare-fun m!378599 () Bool)

(assert (=> start!37488 m!378599))

(declare-fun m!378601 () Bool)

(assert (=> start!37488 m!378601))

(declare-fun m!378603 () Bool)

(assert (=> b!382228 m!378603))

(declare-fun m!378605 () Bool)

(assert (=> b!382228 m!378605))

(declare-fun m!378607 () Bool)

(assert (=> b!382228 m!378607))

(declare-fun m!378609 () Bool)

(assert (=> b!382228 m!378609))

(declare-fun m!378611 () Bool)

(assert (=> b!382228 m!378611))

(declare-fun m!378613 () Bool)

(assert (=> b!382228 m!378613))

(declare-fun m!378615 () Bool)

(assert (=> b!382228 m!378615))

(declare-fun m!378617 () Bool)

(assert (=> mapNonEmpty!15480 m!378617))

(check-sat (not b!382224) (not b!382223) (not b!382218) (not b!382216) (not start!37488) (not mapNonEmpty!15480) (not b_next!8629) b_and!15845 (not b!382227) tp_is_empty!9277 (not b!382228) (not b!382225))
(check-sat b_and!15845 (not b_next!8629))
