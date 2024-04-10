; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38196 () Bool)

(assert start!38196)

(declare-fun b_free!9055 () Bool)

(declare-fun b_next!9055 () Bool)

(assert (=> start!38196 (= b_free!9055 (not b_next!9055))))

(declare-fun tp!31949 () Bool)

(declare-fun b_and!16429 () Bool)

(assert (=> start!38196 (= tp!31949 b_and!16429)))

(declare-fun mapNonEmpty!16188 () Bool)

(declare-fun mapRes!16188 () Bool)

(declare-fun tp!31950 () Bool)

(declare-fun e!238465 () Bool)

(assert (=> mapNonEmpty!16188 (= mapRes!16188 (and tp!31950 e!238465))))

(declare-datatypes ((V!14075 0))(
  ( (V!14076 (val!4908 Int)) )
))
(declare-datatypes ((ValueCell!4520 0))(
  ( (ValueCellFull!4520 (v!7149 V!14075)) (EmptyCell!4520) )
))
(declare-fun mapValue!16188 () ValueCell!4520)

(declare-fun mapRest!16188 () (Array (_ BitVec 32) ValueCell!4520))

(declare-datatypes ((array!23361 0))(
  ( (array!23362 (arr!11138 (Array (_ BitVec 32) ValueCell!4520)) (size!11490 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23361)

(declare-fun mapKey!16188 () (_ BitVec 32))

(assert (=> mapNonEmpty!16188 (= (arr!11138 _values!506) (store mapRest!16188 mapKey!16188 mapValue!16188))))

(declare-fun res!225728 () Bool)

(declare-fun e!238471 () Bool)

(assert (=> start!38196 (=> (not res!225728) (not e!238471))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38196 (= res!225728 (validMask!0 mask!970))))

(assert (=> start!38196 e!238471))

(declare-fun e!238468 () Bool)

(declare-fun array_inv!8178 (array!23361) Bool)

(assert (=> start!38196 (and (array_inv!8178 _values!506) e!238468)))

(assert (=> start!38196 tp!31949))

(assert (=> start!38196 true))

(declare-fun tp_is_empty!9727 () Bool)

(assert (=> start!38196 tp_is_empty!9727))

(declare-datatypes ((array!23363 0))(
  ( (array!23364 (arr!11139 (Array (_ BitVec 32) (_ BitVec 64))) (size!11491 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23363)

(declare-fun array_inv!8179 (array!23363) Bool)

(assert (=> start!38196 (array_inv!8179 _keys!658)))

(declare-fun b!393910 () Bool)

(declare-fun res!225730 () Bool)

(assert (=> b!393910 (=> (not res!225730) (not e!238471))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393910 (= res!225730 (and (= (size!11490 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11491 _keys!658) (size!11490 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393911 () Bool)

(assert (=> b!393911 (= e!238465 tp_is_empty!9727)))

(declare-fun b!393912 () Bool)

(declare-fun res!225736 () Bool)

(assert (=> b!393912 (=> (not res!225736) (not e!238471))))

(declare-datatypes ((List!6478 0))(
  ( (Nil!6475) (Cons!6474 (h!7330 (_ BitVec 64)) (t!11650 List!6478)) )
))
(declare-fun arrayNoDuplicates!0 (array!23363 (_ BitVec 32) List!6478) Bool)

(assert (=> b!393912 (= res!225736 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6475))))

(declare-fun b!393913 () Bool)

(declare-fun res!225737 () Bool)

(assert (=> b!393913 (=> (not res!225737) (not e!238471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23363 (_ BitVec 32)) Bool)

(assert (=> b!393913 (= res!225737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393914 () Bool)

(declare-fun res!225729 () Bool)

(assert (=> b!393914 (=> (not res!225729) (not e!238471))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393914 (= res!225729 (validKeyInArray!0 k!778))))

(declare-fun b!393915 () Bool)

(declare-datatypes ((tuple2!6626 0))(
  ( (tuple2!6627 (_1!3324 (_ BitVec 64)) (_2!3324 V!14075)) )
))
(declare-datatypes ((List!6479 0))(
  ( (Nil!6476) (Cons!6475 (h!7331 tuple2!6626) (t!11651 List!6479)) )
))
(declare-datatypes ((ListLongMap!5539 0))(
  ( (ListLongMap!5540 (toList!2785 List!6479)) )
))
(declare-fun lt!186530 () ListLongMap!5539)

(declare-fun lt!186528 () tuple2!6626)

(declare-fun e!238469 () Bool)

(declare-fun lt!186522 () ListLongMap!5539)

(declare-fun +!1078 (ListLongMap!5539 tuple2!6626) ListLongMap!5539)

(assert (=> b!393915 (= e!238469 (= (+!1078 lt!186522 lt!186528) lt!186530))))

(declare-fun lt!186527 () ListLongMap!5539)

(assert (=> b!393915 (= lt!186530 lt!186527)))

(declare-fun mapIsEmpty!16188 () Bool)

(assert (=> mapIsEmpty!16188 mapRes!16188))

(declare-fun b!393916 () Bool)

(declare-fun res!225731 () Bool)

(assert (=> b!393916 (=> (not res!225731) (not e!238471))))

(declare-fun arrayContainsKey!0 (array!23363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393916 (= res!225731 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!393917 () Bool)

(declare-fun res!225733 () Bool)

(assert (=> b!393917 (=> (not res!225733) (not e!238471))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393917 (= res!225733 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11491 _keys!658))))))

(declare-fun b!393918 () Bool)

(declare-fun e!238467 () Bool)

(assert (=> b!393918 (= e!238467 tp_is_empty!9727)))

(declare-fun b!393919 () Bool)

(declare-fun res!225738 () Bool)

(declare-fun e!238466 () Bool)

(assert (=> b!393919 (=> (not res!225738) (not e!238466))))

(declare-fun lt!186531 () array!23363)

(assert (=> b!393919 (= res!225738 (arrayNoDuplicates!0 lt!186531 #b00000000000000000000000000000000 Nil!6475))))

(declare-fun b!393920 () Bool)

(declare-fun res!225735 () Bool)

(assert (=> b!393920 (=> (not res!225735) (not e!238471))))

(assert (=> b!393920 (= res!225735 (or (= (select (arr!11139 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11139 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393921 () Bool)

(assert (=> b!393921 (= e!238466 (not e!238469))))

(declare-fun res!225734 () Bool)

(assert (=> b!393921 (=> res!225734 e!238469)))

(declare-fun lt!186524 () Bool)

(assert (=> b!393921 (= res!225734 (or (and (not lt!186524) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186524) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186524)))))

(assert (=> b!393921 (= lt!186524 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14075)

(declare-fun minValue!472 () V!14075)

(declare-fun getCurrentListMap!2124 (array!23363 array!23361 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) Int) ListLongMap!5539)

(assert (=> b!393921 (= lt!186522 (getCurrentListMap!2124 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186525 () array!23361)

(assert (=> b!393921 (= lt!186530 (getCurrentListMap!2124 lt!186531 lt!186525 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186526 () ListLongMap!5539)

(assert (=> b!393921 (and (= lt!186527 lt!186526) (= lt!186526 lt!186527))))

(declare-fun lt!186523 () ListLongMap!5539)

(assert (=> b!393921 (= lt!186526 (+!1078 lt!186523 lt!186528))))

(declare-fun v!373 () V!14075)

(assert (=> b!393921 (= lt!186528 (tuple2!6627 k!778 v!373))))

(declare-datatypes ((Unit!12044 0))(
  ( (Unit!12045) )
))
(declare-fun lt!186529 () Unit!12044)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!288 (array!23363 array!23361 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) (_ BitVec 64) V!14075 (_ BitVec 32) Int) Unit!12044)

(assert (=> b!393921 (= lt!186529 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!288 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1004 (array!23363 array!23361 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) Int) ListLongMap!5539)

(assert (=> b!393921 (= lt!186527 (getCurrentListMapNoExtraKeys!1004 lt!186531 lt!186525 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393921 (= lt!186525 (array!23362 (store (arr!11138 _values!506) i!548 (ValueCellFull!4520 v!373)) (size!11490 _values!506)))))

(assert (=> b!393921 (= lt!186523 (getCurrentListMapNoExtraKeys!1004 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393922 () Bool)

(assert (=> b!393922 (= e!238468 (and e!238467 mapRes!16188))))

(declare-fun condMapEmpty!16188 () Bool)

(declare-fun mapDefault!16188 () ValueCell!4520)

