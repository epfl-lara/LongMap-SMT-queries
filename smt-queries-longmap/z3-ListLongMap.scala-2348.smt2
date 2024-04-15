; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37536 () Bool)

(assert start!37536)

(declare-fun b_free!8677 () Bool)

(declare-fun b_next!8677 () Bool)

(assert (=> start!37536 (= b_free!8677 (not b_next!8677))))

(declare-fun tp!30746 () Bool)

(declare-fun b_and!15893 () Bool)

(assert (=> start!37536 (= tp!30746 b_and!15893)))

(declare-fun b!383223 () Bool)

(declare-fun res!218234 () Bool)

(declare-fun e!232756 () Bool)

(assert (=> b!383223 (=> (not res!218234) (not e!232756))))

(declare-datatypes ((array!22541 0))(
  ( (array!22542 (arr!10739 (Array (_ BitVec 32) (_ BitVec 64))) (size!11092 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22541)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383223 (= res!218234 (or (= (select (arr!10739 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10739 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383224 () Bool)

(declare-fun res!218230 () Bool)

(assert (=> b!383224 (=> (not res!218230) (not e!232756))))

(declare-datatypes ((List!6137 0))(
  ( (Nil!6134) (Cons!6133 (h!6989 (_ BitVec 64)) (t!11278 List!6137)) )
))
(declare-fun arrayNoDuplicates!0 (array!22541 (_ BitVec 32) List!6137) Bool)

(assert (=> b!383224 (= res!218230 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6134))))

(declare-fun b!383225 () Bool)

(declare-fun e!232755 () Bool)

(declare-fun tp_is_empty!9325 () Bool)

(assert (=> b!383225 (= e!232755 tp_is_empty!9325)))

(declare-fun b!383226 () Bool)

(declare-fun res!218227 () Bool)

(assert (=> b!383226 (=> (not res!218227) (not e!232756))))

(assert (=> b!383226 (= res!218227 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11092 _keys!658))))))

(declare-fun b!383227 () Bool)

(declare-fun res!218229 () Bool)

(assert (=> b!383227 (=> (not res!218229) (not e!232756))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22541 (_ BitVec 32)) Bool)

(assert (=> b!383227 (= res!218229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15552 () Bool)

(declare-fun mapRes!15552 () Bool)

(declare-fun tp!30747 () Bool)

(assert (=> mapNonEmpty!15552 (= mapRes!15552 (and tp!30747 e!232755))))

(declare-datatypes ((V!13539 0))(
  ( (V!13540 (val!4707 Int)) )
))
(declare-datatypes ((ValueCell!4319 0))(
  ( (ValueCellFull!4319 (v!6898 V!13539)) (EmptyCell!4319) )
))
(declare-datatypes ((array!22543 0))(
  ( (array!22544 (arr!10740 (Array (_ BitVec 32) ValueCell!4319)) (size!11093 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22543)

(declare-fun mapValue!15552 () ValueCell!4319)

(declare-fun mapKey!15552 () (_ BitVec 32))

(declare-fun mapRest!15552 () (Array (_ BitVec 32) ValueCell!4319))

(assert (=> mapNonEmpty!15552 (= (arr!10740 _values!506) (store mapRest!15552 mapKey!15552 mapValue!15552))))

(declare-fun mapIsEmpty!15552 () Bool)

(assert (=> mapIsEmpty!15552 mapRes!15552))

(declare-fun b!383229 () Bool)

(declare-fun e!232754 () Bool)

(declare-fun e!232760 () Bool)

(assert (=> b!383229 (= e!232754 (and e!232760 mapRes!15552))))

(declare-fun condMapEmpty!15552 () Bool)

(declare-fun mapDefault!15552 () ValueCell!4319)

(assert (=> b!383229 (= condMapEmpty!15552 (= (arr!10740 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4319)) mapDefault!15552)))))

(declare-fun b!383230 () Bool)

(declare-fun res!218226 () Bool)

(declare-fun e!232758 () Bool)

(assert (=> b!383230 (=> (not res!218226) (not e!232758))))

(declare-fun lt!179928 () array!22541)

(assert (=> b!383230 (= res!218226 (arrayNoDuplicates!0 lt!179928 #b00000000000000000000000000000000 Nil!6134))))

(declare-fun b!383231 () Bool)

(declare-fun e!232757 () Bool)

(assert (=> b!383231 (= e!232757 true)))

(declare-datatypes ((tuple2!6312 0))(
  ( (tuple2!6313 (_1!3167 (_ BitVec 64)) (_2!3167 V!13539)) )
))
(declare-datatypes ((List!6138 0))(
  ( (Nil!6135) (Cons!6134 (h!6990 tuple2!6312) (t!11279 List!6138)) )
))
(declare-datatypes ((ListLongMap!5215 0))(
  ( (ListLongMap!5216 (toList!2623 List!6138)) )
))
(declare-fun lt!179934 () ListLongMap!5215)

(declare-fun lt!179931 () ListLongMap!5215)

(declare-fun lt!179930 () tuple2!6312)

(declare-fun +!980 (ListLongMap!5215 tuple2!6312) ListLongMap!5215)

(assert (=> b!383231 (= lt!179934 (+!980 lt!179931 lt!179930))))

(declare-fun lt!179924 () ListLongMap!5215)

(declare-fun lt!179932 () ListLongMap!5215)

(assert (=> b!383231 (= lt!179924 lt!179932)))

(declare-fun b!383232 () Bool)

(assert (=> b!383232 (= e!232760 tp_is_empty!9325)))

(declare-fun res!218231 () Bool)

(assert (=> start!37536 (=> (not res!218231) (not e!232756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37536 (= res!218231 (validMask!0 mask!970))))

(assert (=> start!37536 e!232756))

(declare-fun array_inv!7908 (array!22543) Bool)

(assert (=> start!37536 (and (array_inv!7908 _values!506) e!232754)))

(assert (=> start!37536 tp!30746))

(assert (=> start!37536 true))

(assert (=> start!37536 tp_is_empty!9325))

(declare-fun array_inv!7909 (array!22541) Bool)

(assert (=> start!37536 (array_inv!7909 _keys!658)))

(declare-fun b!383228 () Bool)

(declare-fun res!218232 () Bool)

(assert (=> b!383228 (=> (not res!218232) (not e!232756))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383228 (= res!218232 (and (= (size!11093 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11092 _keys!658) (size!11093 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383233 () Bool)

(assert (=> b!383233 (= e!232756 e!232758)))

(declare-fun res!218233 () Bool)

(assert (=> b!383233 (=> (not res!218233) (not e!232758))))

(assert (=> b!383233 (= res!218233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179928 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!383233 (= lt!179928 (array!22542 (store (arr!10739 _keys!658) i!548 k0!778) (size!11092 _keys!658)))))

(declare-fun b!383234 () Bool)

(declare-fun res!218225 () Bool)

(assert (=> b!383234 (=> (not res!218225) (not e!232756))))

(declare-fun arrayContainsKey!0 (array!22541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383234 (= res!218225 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383235 () Bool)

(declare-fun res!218228 () Bool)

(assert (=> b!383235 (=> (not res!218228) (not e!232756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383235 (= res!218228 (validKeyInArray!0 k0!778))))

(declare-fun b!383236 () Bool)

(assert (=> b!383236 (= e!232758 (not e!232757))))

(declare-fun res!218224 () Bool)

(assert (=> b!383236 (=> res!218224 e!232757)))

(declare-fun lt!179933 () Bool)

(assert (=> b!383236 (= res!218224 (or (and (not lt!179933) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179933) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179933)))))

(assert (=> b!383236 (= lt!179933 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13539)

(declare-fun minValue!472 () V!13539)

(declare-fun getCurrentListMap!2004 (array!22541 array!22543 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) Int) ListLongMap!5215)

(assert (=> b!383236 (= lt!179931 (getCurrentListMap!2004 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179926 () array!22543)

(assert (=> b!383236 (= lt!179924 (getCurrentListMap!2004 lt!179928 lt!179926 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179929 () ListLongMap!5215)

(assert (=> b!383236 (and (= lt!179932 lt!179929) (= lt!179929 lt!179932))))

(declare-fun lt!179927 () ListLongMap!5215)

(assert (=> b!383236 (= lt!179929 (+!980 lt!179927 lt!179930))))

(declare-fun v!373 () V!13539)

(assert (=> b!383236 (= lt!179930 (tuple2!6313 k0!778 v!373))))

(declare-datatypes ((Unit!11814 0))(
  ( (Unit!11815) )
))
(declare-fun lt!179925 () Unit!11814)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!197 (array!22541 array!22543 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) (_ BitVec 64) V!13539 (_ BitVec 32) Int) Unit!11814)

(assert (=> b!383236 (= lt!179925 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!197 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!869 (array!22541 array!22543 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) Int) ListLongMap!5215)

(assert (=> b!383236 (= lt!179932 (getCurrentListMapNoExtraKeys!869 lt!179928 lt!179926 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383236 (= lt!179926 (array!22544 (store (arr!10740 _values!506) i!548 (ValueCellFull!4319 v!373)) (size!11093 _values!506)))))

(assert (=> b!383236 (= lt!179927 (getCurrentListMapNoExtraKeys!869 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37536 res!218231) b!383228))

(assert (= (and b!383228 res!218232) b!383227))

(assert (= (and b!383227 res!218229) b!383224))

(assert (= (and b!383224 res!218230) b!383226))

(assert (= (and b!383226 res!218227) b!383235))

(assert (= (and b!383235 res!218228) b!383223))

(assert (= (and b!383223 res!218234) b!383234))

(assert (= (and b!383234 res!218225) b!383233))

(assert (= (and b!383233 res!218233) b!383230))

(assert (= (and b!383230 res!218226) b!383236))

(assert (= (and b!383236 (not res!218224)) b!383231))

(assert (= (and b!383229 condMapEmpty!15552) mapIsEmpty!15552))

(assert (= (and b!383229 (not condMapEmpty!15552)) mapNonEmpty!15552))

(get-info :version)

(assert (= (and mapNonEmpty!15552 ((_ is ValueCellFull!4319) mapValue!15552)) b!383225))

(assert (= (and b!383229 ((_ is ValueCellFull!4319) mapDefault!15552)) b!383232))

(assert (= start!37536 b!383229))

(declare-fun m!379511 () Bool)

(assert (=> b!383234 m!379511))

(declare-fun m!379513 () Bool)

(assert (=> b!383230 m!379513))

(declare-fun m!379515 () Bool)

(assert (=> b!383224 m!379515))

(declare-fun m!379517 () Bool)

(assert (=> b!383236 m!379517))

(declare-fun m!379519 () Bool)

(assert (=> b!383236 m!379519))

(declare-fun m!379521 () Bool)

(assert (=> b!383236 m!379521))

(declare-fun m!379523 () Bool)

(assert (=> b!383236 m!379523))

(declare-fun m!379525 () Bool)

(assert (=> b!383236 m!379525))

(declare-fun m!379527 () Bool)

(assert (=> b!383236 m!379527))

(declare-fun m!379529 () Bool)

(assert (=> b!383236 m!379529))

(declare-fun m!379531 () Bool)

(assert (=> b!383223 m!379531))

(declare-fun m!379533 () Bool)

(assert (=> b!383227 m!379533))

(declare-fun m!379535 () Bool)

(assert (=> b!383235 m!379535))

(declare-fun m!379537 () Bool)

(assert (=> start!37536 m!379537))

(declare-fun m!379539 () Bool)

(assert (=> start!37536 m!379539))

(declare-fun m!379541 () Bool)

(assert (=> start!37536 m!379541))

(declare-fun m!379543 () Bool)

(assert (=> b!383233 m!379543))

(declare-fun m!379545 () Bool)

(assert (=> b!383233 m!379545))

(declare-fun m!379547 () Bool)

(assert (=> mapNonEmpty!15552 m!379547))

(declare-fun m!379549 () Bool)

(assert (=> b!383231 m!379549))

(check-sat tp_is_empty!9325 (not b!383234) (not b!383233) (not b!383231) (not start!37536) (not b!383230) (not b!383236) (not b_next!8677) (not b!383227) (not mapNonEmpty!15552) (not b!383224) b_and!15893 (not b!383235))
(check-sat b_and!15893 (not b_next!8677))
