; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40718 () Bool)

(assert start!40718)

(declare-fun b_free!10729 () Bool)

(declare-fun b_next!10729 () Bool)

(assert (=> start!40718 (= b_free!10729 (not b_next!10729))))

(declare-fun tp!38006 () Bool)

(declare-fun b_and!18737 () Bool)

(assert (=> start!40718 (= tp!38006 b_and!18737)))

(declare-fun b!450733 () Bool)

(declare-fun e!264095 () Bool)

(declare-fun e!264098 () Bool)

(assert (=> b!450733 (= e!264095 (not e!264098))))

(declare-fun res!268313 () Bool)

(assert (=> b!450733 (=> res!268313 e!264098)))

(declare-datatypes ((array!27939 0))(
  ( (array!27940 (arr!13415 (Array (_ BitVec 32) (_ BitVec 64))) (size!13767 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27939)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450733 (= res!268313 (validKeyInArray!0 (select (arr!13415 _keys!709) from!863)))))

(declare-fun e!264100 () Bool)

(assert (=> b!450733 e!264100))

(declare-fun c!56000 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450733 (= c!56000 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!17195 0))(
  ( (V!17196 (val!6078 Int)) )
))
(declare-fun minValue!515 () V!17195)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5690 0))(
  ( (ValueCellFull!5690 (v!8333 V!17195)) (EmptyCell!5690) )
))
(declare-datatypes ((array!27941 0))(
  ( (array!27942 (arr!13416 (Array (_ BitVec 32) ValueCell!5690)) (size!13768 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27941)

(declare-fun zeroValue!515 () V!17195)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17195)

(declare-datatypes ((Unit!13198 0))(
  ( (Unit!13199) )
))
(declare-fun lt!204692 () Unit!13198)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!714 (array!27939 array!27941 (_ BitVec 32) (_ BitVec 32) V!17195 V!17195 (_ BitVec 32) (_ BitVec 64) V!17195 (_ BitVec 32) Int) Unit!13198)

(assert (=> b!450733 (= lt!204692 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!714 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450734 () Bool)

(declare-fun res!268314 () Bool)

(declare-fun e!264093 () Bool)

(assert (=> b!450734 (=> (not res!268314) (not e!264093))))

(assert (=> b!450734 (= res!268314 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13767 _keys!709))))))

(declare-fun res!268318 () Bool)

(assert (=> start!40718 (=> (not res!268318) (not e!264093))))

(assert (=> start!40718 (= res!268318 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13767 _keys!709))))))

(assert (=> start!40718 e!264093))

(declare-fun tp_is_empty!12067 () Bool)

(assert (=> start!40718 tp_is_empty!12067))

(assert (=> start!40718 tp!38006))

(assert (=> start!40718 true))

(declare-fun e!264101 () Bool)

(declare-fun array_inv!9714 (array!27941) Bool)

(assert (=> start!40718 (and (array_inv!9714 _values!549) e!264101)))

(declare-fun array_inv!9715 (array!27939) Bool)

(assert (=> start!40718 (array_inv!9715 _keys!709)))

(declare-fun b!450735 () Bool)

(declare-fun e!264097 () Bool)

(assert (=> b!450735 (= e!264097 e!264095)))

(declare-fun res!268319 () Bool)

(assert (=> b!450735 (=> (not res!268319) (not e!264095))))

(assert (=> b!450735 (= res!268319 (= from!863 i!563))))

(declare-fun lt!204693 () array!27939)

(declare-datatypes ((tuple2!7986 0))(
  ( (tuple2!7987 (_1!4004 (_ BitVec 64)) (_2!4004 V!17195)) )
))
(declare-datatypes ((List!8051 0))(
  ( (Nil!8048) (Cons!8047 (h!8903 tuple2!7986) (t!13813 List!8051)) )
))
(declare-datatypes ((ListLongMap!6899 0))(
  ( (ListLongMap!6900 (toList!3465 List!8051)) )
))
(declare-fun lt!204689 () ListLongMap!6899)

(declare-fun lt!204688 () array!27941)

(declare-fun getCurrentListMapNoExtraKeys!1649 (array!27939 array!27941 (_ BitVec 32) (_ BitVec 32) V!17195 V!17195 (_ BitVec 32) Int) ListLongMap!6899)

(assert (=> b!450735 (= lt!204689 (getCurrentListMapNoExtraKeys!1649 lt!204693 lt!204688 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450735 (= lt!204688 (array!27942 (store (arr!13416 _values!549) i!563 (ValueCellFull!5690 v!412)) (size!13768 _values!549)))))

(declare-fun lt!204690 () ListLongMap!6899)

(assert (=> b!450735 (= lt!204690 (getCurrentListMapNoExtraKeys!1649 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450736 () Bool)

(assert (=> b!450736 (= e!264098 (bvslt from!863 (size!13767 _keys!709)))))

(declare-fun lt!204691 () ListLongMap!6899)

(assert (=> b!450736 (= lt!204691 (getCurrentListMapNoExtraKeys!1649 lt!204693 lt!204688 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450737 () Bool)

(declare-fun res!268307 () Bool)

(assert (=> b!450737 (=> (not res!268307) (not e!264093))))

(assert (=> b!450737 (= res!268307 (validKeyInArray!0 k!794))))

(declare-fun b!450738 () Bool)

(declare-fun e!264094 () Bool)

(assert (=> b!450738 (= e!264094 tp_is_empty!12067)))

(declare-fun b!450739 () Bool)

(declare-fun res!268311 () Bool)

(assert (=> b!450739 (=> (not res!268311) (not e!264093))))

(declare-datatypes ((List!8052 0))(
  ( (Nil!8049) (Cons!8048 (h!8904 (_ BitVec 64)) (t!13814 List!8052)) )
))
(declare-fun arrayNoDuplicates!0 (array!27939 (_ BitVec 32) List!8052) Bool)

(assert (=> b!450739 (= res!268311 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8049))))

(declare-fun call!29780 () ListLongMap!6899)

(declare-fun bm!29776 () Bool)

(assert (=> bm!29776 (= call!29780 (getCurrentListMapNoExtraKeys!1649 (ite c!56000 _keys!709 lt!204693) (ite c!56000 _values!549 lt!204688) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450740 () Bool)

(declare-fun call!29779 () ListLongMap!6899)

(assert (=> b!450740 (= e!264100 (= call!29780 call!29779))))

(declare-fun b!450741 () Bool)

(declare-fun res!268316 () Bool)

(assert (=> b!450741 (=> (not res!268316) (not e!264093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27939 (_ BitVec 32)) Bool)

(assert (=> b!450741 (= res!268316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450742 () Bool)

(declare-fun res!268309 () Bool)

(assert (=> b!450742 (=> (not res!268309) (not e!264097))))

(assert (=> b!450742 (= res!268309 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19734 () Bool)

(declare-fun mapRes!19734 () Bool)

(assert (=> mapIsEmpty!19734 mapRes!19734))

(declare-fun b!450743 () Bool)

(declare-fun res!268310 () Bool)

(assert (=> b!450743 (=> (not res!268310) (not e!264093))))

(declare-fun arrayContainsKey!0 (array!27939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450743 (= res!268310 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!450744 () Bool)

(declare-fun res!268312 () Bool)

(assert (=> b!450744 (=> (not res!268312) (not e!264093))))

(assert (=> b!450744 (= res!268312 (or (= (select (arr!13415 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13415 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19734 () Bool)

(declare-fun tp!38007 () Bool)

(assert (=> mapNonEmpty!19734 (= mapRes!19734 (and tp!38007 e!264094))))

(declare-fun mapValue!19734 () ValueCell!5690)

(declare-fun mapKey!19734 () (_ BitVec 32))

(declare-fun mapRest!19734 () (Array (_ BitVec 32) ValueCell!5690))

(assert (=> mapNonEmpty!19734 (= (arr!13416 _values!549) (store mapRest!19734 mapKey!19734 mapValue!19734))))

(declare-fun b!450745 () Bool)

(assert (=> b!450745 (= e!264093 e!264097)))

(declare-fun res!268315 () Bool)

(assert (=> b!450745 (=> (not res!268315) (not e!264097))))

(assert (=> b!450745 (= res!268315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204693 mask!1025))))

(assert (=> b!450745 (= lt!204693 (array!27940 (store (arr!13415 _keys!709) i!563 k!794) (size!13767 _keys!709)))))

(declare-fun b!450746 () Bool)

(declare-fun e!264096 () Bool)

(assert (=> b!450746 (= e!264096 tp_is_empty!12067)))

(declare-fun b!450747 () Bool)

(declare-fun res!268320 () Bool)

(assert (=> b!450747 (=> (not res!268320) (not e!264093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450747 (= res!268320 (validMask!0 mask!1025))))

(declare-fun b!450748 () Bool)

(declare-fun res!268308 () Bool)

(assert (=> b!450748 (=> (not res!268308) (not e!264093))))

(assert (=> b!450748 (= res!268308 (and (= (size!13768 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13767 _keys!709) (size!13768 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450749 () Bool)

(declare-fun +!1546 (ListLongMap!6899 tuple2!7986) ListLongMap!6899)

(assert (=> b!450749 (= e!264100 (= call!29779 (+!1546 call!29780 (tuple2!7987 k!794 v!412))))))

(declare-fun b!450750 () Bool)

(assert (=> b!450750 (= e!264101 (and e!264096 mapRes!19734))))

(declare-fun condMapEmpty!19734 () Bool)

(declare-fun mapDefault!19734 () ValueCell!5690)

