; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40770 () Bool)

(assert start!40770)

(declare-fun b_free!10759 () Bool)

(declare-fun b_next!10759 () Bool)

(assert (=> start!40770 (= b_free!10759 (not b_next!10759))))

(declare-fun tp!38099 () Bool)

(declare-fun b_and!18805 () Bool)

(assert (=> start!40770 (= tp!38099 b_and!18805)))

(declare-fun b!451763 () Bool)

(declare-fun res!269004 () Bool)

(declare-fun e!264606 () Bool)

(assert (=> b!451763 (=> (not res!269004) (not e!264606))))

(declare-datatypes ((array!28001 0))(
  ( (array!28002 (arr!13445 (Array (_ BitVec 32) (_ BitVec 64))) (size!13797 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28001)

(declare-datatypes ((List!8074 0))(
  ( (Nil!8071) (Cons!8070 (h!8926 (_ BitVec 64)) (t!13856 List!8074)) )
))
(declare-fun arrayNoDuplicates!0 (array!28001 (_ BitVec 32) List!8074) Bool)

(assert (=> b!451763 (= res!269004 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8071))))

(declare-fun b!451765 () Bool)

(declare-fun e!264600 () Bool)

(declare-fun tp_is_empty!12097 () Bool)

(assert (=> b!451765 (= e!264600 tp_is_empty!12097)))

(declare-fun b!451766 () Bool)

(declare-fun res!269012 () Bool)

(declare-fun e!264601 () Bool)

(assert (=> b!451766 (=> (not res!269012) (not e!264601))))

(declare-fun lt!205012 () array!28001)

(assert (=> b!451766 (= res!269012 (arrayNoDuplicates!0 lt!205012 #b00000000000000000000000000000000 Nil!8071))))

(declare-fun e!264605 () Bool)

(declare-datatypes ((V!17235 0))(
  ( (V!17236 (val!6093 Int)) )
))
(declare-datatypes ((tuple2!8014 0))(
  ( (tuple2!8015 (_1!4018 (_ BitVec 64)) (_2!4018 V!17235)) )
))
(declare-datatypes ((List!8075 0))(
  ( (Nil!8072) (Cons!8071 (h!8927 tuple2!8014) (t!13857 List!8075)) )
))
(declare-datatypes ((ListLongMap!6927 0))(
  ( (ListLongMap!6928 (toList!3479 List!8075)) )
))
(declare-fun call!29891 () ListLongMap!6927)

(declare-fun b!451767 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun call!29890 () ListLongMap!6927)

(declare-fun v!412 () V!17235)

(declare-fun +!1558 (ListLongMap!6927 tuple2!8014) ListLongMap!6927)

(assert (=> b!451767 (= e!264605 (= call!29890 (+!1558 call!29891 (tuple2!8015 k!794 v!412))))))

(declare-fun b!451768 () Bool)

(declare-fun e!264604 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5705 0))(
  ( (ValueCellFull!5705 (v!8352 V!17235)) (EmptyCell!5705) )
))
(declare-datatypes ((array!28003 0))(
  ( (array!28004 (arr!13446 (Array (_ BitVec 32) ValueCell!5705)) (size!13798 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28003)

(assert (=> b!451768 (= e!264604 (bvslt i!563 (size!13798 _values!549)))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17235)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!205009 () array!28003)

(declare-fun lt!205013 () ListLongMap!6927)

(declare-fun zeroValue!515 () V!17235)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1663 (array!28001 array!28003 (_ BitVec 32) (_ BitVec 32) V!17235 V!17235 (_ BitVec 32) Int) ListLongMap!6927)

(declare-fun get!6623 (ValueCell!5705 V!17235) V!17235)

(declare-fun dynLambda!858 (Int (_ BitVec 64)) V!17235)

(assert (=> b!451768 (= lt!205013 (+!1558 (getCurrentListMapNoExtraKeys!1663 lt!205012 lt!205009 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8015 (select (arr!13445 lt!205012) from!863) (get!6623 (select (arr!13446 lt!205009) from!863) (dynLambda!858 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451769 () Bool)

(declare-fun res!269013 () Bool)

(assert (=> b!451769 (=> (not res!269013) (not e!264606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28001 (_ BitVec 32)) Bool)

(assert (=> b!451769 (= res!269013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451770 () Bool)

(assert (=> b!451770 (= e!264606 e!264601)))

(declare-fun res!269007 () Bool)

(assert (=> b!451770 (=> (not res!269007) (not e!264601))))

(assert (=> b!451770 (= res!269007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205012 mask!1025))))

(assert (=> b!451770 (= lt!205012 (array!28002 (store (arr!13445 _keys!709) i!563 k!794) (size!13797 _keys!709)))))

(declare-fun b!451771 () Bool)

(declare-fun res!269002 () Bool)

(assert (=> b!451771 (=> (not res!269002) (not e!264606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451771 (= res!269002 (validKeyInArray!0 k!794))))

(declare-fun b!451772 () Bool)

(assert (=> b!451772 (= e!264605 (= call!29891 call!29890))))

(declare-fun b!451773 () Bool)

(declare-fun e!264608 () Bool)

(declare-fun e!264607 () Bool)

(declare-fun mapRes!19782 () Bool)

(assert (=> b!451773 (= e!264608 (and e!264607 mapRes!19782))))

(declare-fun condMapEmpty!19782 () Bool)

(declare-fun mapDefault!19782 () ValueCell!5705)

