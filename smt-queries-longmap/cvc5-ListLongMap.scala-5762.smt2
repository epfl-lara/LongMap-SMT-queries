; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74420 () Bool)

(assert start!74420)

(declare-fun b_free!15163 () Bool)

(declare-fun b_next!15163 () Bool)

(assert (=> start!74420 (= b_free!15163 (not b_next!15163))))

(declare-fun tp!53166 () Bool)

(declare-fun b_and!24979 () Bool)

(assert (=> start!74420 (= tp!53166 b_and!24979)))

(declare-datatypes ((V!28257 0))(
  ( (V!28258 (val!8751 Int)) )
))
(declare-datatypes ((ValueCell!8264 0))(
  ( (ValueCellFull!8264 (v!11184 V!28257)) (EmptyCell!8264) )
))
(declare-datatypes ((array!50940 0))(
  ( (array!50941 (arr!24497 (Array (_ BitVec 32) ValueCell!8264)) (size!24937 (_ BitVec 32))) )
))
(declare-fun lt!396456 () array!50940)

(declare-fun bm!38729 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50942 0))(
  ( (array!50943 (arr!24498 (Array (_ BitVec 32) (_ BitVec 64))) (size!24938 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50942)

(declare-datatypes ((tuple2!11570 0))(
  ( (tuple2!11571 (_1!5796 (_ BitVec 64)) (_2!5796 V!28257)) )
))
(declare-datatypes ((List!17388 0))(
  ( (Nil!17385) (Cons!17384 (h!18515 tuple2!11570) (t!24455 List!17388)) )
))
(declare-datatypes ((ListLongMap!10339 0))(
  ( (ListLongMap!10340 (toList!5185 List!17388)) )
))
(declare-fun call!38732 () ListLongMap!10339)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28257)

(declare-fun zeroValue!654 () V!28257)

(declare-fun getCurrentListMapNoExtraKeys!3152 (array!50942 array!50940 (_ BitVec 32) (_ BitVec 32) V!28257 V!28257 (_ BitVec 32) Int) ListLongMap!10339)

(assert (=> bm!38729 (= call!38732 (getCurrentListMapNoExtraKeys!3152 _keys!868 lt!396456 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876341 () Bool)

(declare-fun res!595491 () Bool)

(declare-fun e!487840 () Bool)

(assert (=> b!876341 (=> (not res!595491) (not e!487840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876341 (= res!595491 (validMask!0 mask!1196))))

(declare-fun b!876342 () Bool)

(declare-fun res!595497 () Bool)

(assert (=> b!876342 (=> (not res!595497) (not e!487840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50942 (_ BitVec 32)) Bool)

(assert (=> b!876342 (= res!595497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876343 () Bool)

(declare-fun e!487839 () Bool)

(declare-fun e!487842 () Bool)

(declare-fun mapRes!27722 () Bool)

(assert (=> b!876343 (= e!487839 (and e!487842 mapRes!27722))))

(declare-fun condMapEmpty!27722 () Bool)

(declare-fun _values!688 () array!50940)

(declare-fun mapDefault!27722 () ValueCell!8264)

