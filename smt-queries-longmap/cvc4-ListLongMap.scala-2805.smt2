; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40722 () Bool)

(assert start!40722)

(declare-fun b_free!10733 () Bool)

(declare-fun b_next!10733 () Bool)

(assert (=> start!40722 (= b_free!10733 (not b_next!10733))))

(declare-fun tp!38018 () Bool)

(declare-fun b_and!18741 () Bool)

(assert (=> start!40722 (= tp!38018 b_and!18741)))

(declare-fun b!450847 () Bool)

(declare-fun res!268392 () Bool)

(declare-fun e!264147 () Bool)

(assert (=> b!450847 (=> (not res!268392) (not e!264147))))

(declare-datatypes ((array!27947 0))(
  ( (array!27948 (arr!13419 (Array (_ BitVec 32) (_ BitVec 64))) (size!13771 (_ BitVec 32))) )
))
(declare-fun lt!204726 () array!27947)

(declare-datatypes ((List!8055 0))(
  ( (Nil!8052) (Cons!8051 (h!8907 (_ BitVec 64)) (t!13817 List!8055)) )
))
(declare-fun arrayNoDuplicates!0 (array!27947 (_ BitVec 32) List!8055) Bool)

(assert (=> b!450847 (= res!268392 (arrayNoDuplicates!0 lt!204726 #b00000000000000000000000000000000 Nil!8052))))

(declare-fun b!450848 () Bool)

(declare-fun res!268403 () Bool)

(declare-fun e!264152 () Bool)

(assert (=> b!450848 (=> (not res!268403) (not e!264152))))

(declare-fun _keys!709 () array!27947)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27947 (_ BitVec 32)) Bool)

(assert (=> b!450848 (= res!268403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450849 () Bool)

(declare-fun res!268398 () Bool)

(assert (=> b!450849 (=> (not res!268398) (not e!264152))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17199 0))(
  ( (V!17200 (val!6080 Int)) )
))
(declare-datatypes ((ValueCell!5692 0))(
  ( (ValueCellFull!5692 (v!8335 V!17199)) (EmptyCell!5692) )
))
(declare-datatypes ((array!27949 0))(
  ( (array!27950 (arr!13420 (Array (_ BitVec 32) ValueCell!5692)) (size!13772 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27949)

(assert (=> b!450849 (= res!268398 (and (= (size!13772 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13771 _keys!709) (size!13772 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450850 () Bool)

(declare-fun res!268393 () Bool)

(assert (=> b!450850 (=> (not res!268393) (not e!264152))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450850 (= res!268393 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13771 _keys!709))))))

(declare-fun minValue!515 () V!17199)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!29788 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!204728 () array!27949)

(declare-fun c!56006 () Bool)

(declare-fun zeroValue!515 () V!17199)

(declare-datatypes ((tuple2!7990 0))(
  ( (tuple2!7991 (_1!4006 (_ BitVec 64)) (_2!4006 V!17199)) )
))
(declare-datatypes ((List!8056 0))(
  ( (Nil!8053) (Cons!8052 (h!8908 tuple2!7990) (t!13818 List!8056)) )
))
(declare-datatypes ((ListLongMap!6903 0))(
  ( (ListLongMap!6904 (toList!3467 List!8056)) )
))
(declare-fun call!29792 () ListLongMap!6903)

(declare-fun getCurrentListMapNoExtraKeys!1651 (array!27947 array!27949 (_ BitVec 32) (_ BitVec 32) V!17199 V!17199 (_ BitVec 32) Int) ListLongMap!6903)

(assert (=> bm!29788 (= call!29792 (getCurrentListMapNoExtraKeys!1651 (ite c!56006 _keys!709 lt!204726) (ite c!56006 _values!549 lt!204728) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450851 () Bool)

(declare-fun res!268401 () Bool)

(assert (=> b!450851 (=> (not res!268401) (not e!264152))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450851 (= res!268401 (validKeyInArray!0 k!794))))

(declare-fun b!450852 () Bool)

(declare-fun res!268399 () Bool)

(assert (=> b!450852 (=> (not res!268399) (not e!264152))))

(declare-fun arrayContainsKey!0 (array!27947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450852 (= res!268399 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!268391 () Bool)

(assert (=> start!40722 (=> (not res!268391) (not e!264152))))

(assert (=> start!40722 (= res!268391 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13771 _keys!709))))))

(assert (=> start!40722 e!264152))

(declare-fun tp_is_empty!12071 () Bool)

(assert (=> start!40722 tp_is_empty!12071))

(assert (=> start!40722 tp!38018))

(assert (=> start!40722 true))

(declare-fun e!264149 () Bool)

(declare-fun array_inv!9718 (array!27949) Bool)

(assert (=> start!40722 (and (array_inv!9718 _values!549) e!264149)))

(declare-fun array_inv!9719 (array!27947) Bool)

(assert (=> start!40722 (array_inv!9719 _keys!709)))

(declare-fun mapIsEmpty!19740 () Bool)

(declare-fun mapRes!19740 () Bool)

(assert (=> mapIsEmpty!19740 mapRes!19740))

(declare-fun b!450853 () Bool)

(declare-fun e!264150 () Bool)

(assert (=> b!450853 (= e!264150 (bvslt from!863 (size!13771 _keys!709)))))

(declare-fun lt!204729 () ListLongMap!6903)

(assert (=> b!450853 (= lt!204729 (getCurrentListMapNoExtraKeys!1651 lt!204726 lt!204728 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19740 () Bool)

(declare-fun tp!38019 () Bool)

(declare-fun e!264154 () Bool)

(assert (=> mapNonEmpty!19740 (= mapRes!19740 (and tp!38019 e!264154))))

(declare-fun mapRest!19740 () (Array (_ BitVec 32) ValueCell!5692))

(declare-fun mapValue!19740 () ValueCell!5692)

(declare-fun mapKey!19740 () (_ BitVec 32))

(assert (=> mapNonEmpty!19740 (= (arr!13420 _values!549) (store mapRest!19740 mapKey!19740 mapValue!19740))))

(declare-fun bm!29789 () Bool)

(declare-fun call!29791 () ListLongMap!6903)

(assert (=> bm!29789 (= call!29791 (getCurrentListMapNoExtraKeys!1651 (ite c!56006 lt!204726 _keys!709) (ite c!56006 lt!204728 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450854 () Bool)

(declare-fun res!268404 () Bool)

(assert (=> b!450854 (=> (not res!268404) (not e!264147))))

(assert (=> b!450854 (= res!268404 (bvsle from!863 i!563))))

(declare-fun b!450855 () Bool)

(declare-fun e!264155 () Bool)

(assert (=> b!450855 (= e!264155 (= call!29792 call!29791))))

(declare-fun b!450856 () Bool)

(declare-fun res!268395 () Bool)

(assert (=> b!450856 (=> (not res!268395) (not e!264152))))

(assert (=> b!450856 (= res!268395 (or (= (select (arr!13419 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13419 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450857 () Bool)

(assert (=> b!450857 (= e!264154 tp_is_empty!12071)))

(declare-fun b!450858 () Bool)

(declare-fun e!264151 () Bool)

(assert (=> b!450858 (= e!264147 e!264151)))

(declare-fun res!268394 () Bool)

(assert (=> b!450858 (=> (not res!268394) (not e!264151))))

(assert (=> b!450858 (= res!268394 (= from!863 i!563))))

(declare-fun lt!204724 () ListLongMap!6903)

(assert (=> b!450858 (= lt!204724 (getCurrentListMapNoExtraKeys!1651 lt!204726 lt!204728 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17199)

(assert (=> b!450858 (= lt!204728 (array!27950 (store (arr!13420 _values!549) i!563 (ValueCellFull!5692 v!412)) (size!13772 _values!549)))))

(declare-fun lt!204725 () ListLongMap!6903)

(assert (=> b!450858 (= lt!204725 (getCurrentListMapNoExtraKeys!1651 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450859 () Bool)

(declare-fun e!264148 () Bool)

(assert (=> b!450859 (= e!264149 (and e!264148 mapRes!19740))))

(declare-fun condMapEmpty!19740 () Bool)

(declare-fun mapDefault!19740 () ValueCell!5692)

