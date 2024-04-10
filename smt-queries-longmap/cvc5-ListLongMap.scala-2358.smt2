; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37610 () Bool)

(assert start!37610)

(declare-fun b_free!8737 () Bool)

(declare-fun b_next!8737 () Bool)

(assert (=> start!37610 (= b_free!8737 (not b_next!8737))))

(declare-fun tp!30927 () Bool)

(declare-fun b_and!15979 () Bool)

(assert (=> start!37610 (= tp!30927 b_and!15979)))

(declare-fun b!384763 () Bool)

(declare-fun e!233570 () Bool)

(declare-fun tp_is_empty!9385 () Bool)

(assert (=> b!384763 (= e!233570 tp_is_empty!9385)))

(declare-fun b!384764 () Bool)

(declare-fun e!233572 () Bool)

(assert (=> b!384764 (= e!233572 true)))

(declare-datatypes ((V!13619 0))(
  ( (V!13620 (val!4737 Int)) )
))
(declare-datatypes ((tuple2!6378 0))(
  ( (tuple2!6379 (_1!3200 (_ BitVec 64)) (_2!3200 V!13619)) )
))
(declare-datatypes ((List!6213 0))(
  ( (Nil!6210) (Cons!6209 (h!7065 tuple2!6378) (t!11363 List!6213)) )
))
(declare-datatypes ((ListLongMap!5291 0))(
  ( (ListLongMap!5292 (toList!2661 List!6213)) )
))
(declare-fun lt!181147 () ListLongMap!5291)

(declare-fun lt!181142 () ListLongMap!5291)

(declare-fun lt!181140 () tuple2!6378)

(declare-fun +!996 (ListLongMap!5291 tuple2!6378) ListLongMap!5291)

(assert (=> b!384764 (= lt!181147 (+!996 lt!181142 lt!181140))))

(declare-fun lt!181146 () ListLongMap!5291)

(declare-fun lt!181143 () ListLongMap!5291)

(assert (=> b!384764 (= lt!181146 lt!181143)))

(declare-fun b!384765 () Bool)

(declare-fun res!219362 () Bool)

(declare-fun e!233567 () Bool)

(assert (=> b!384765 (=> (not res!219362) (not e!233567))))

(declare-datatypes ((array!22671 0))(
  ( (array!22672 (arr!10804 (Array (_ BitVec 32) (_ BitVec 64))) (size!11156 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22671)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384765 (= res!219362 (or (= (select (arr!10804 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10804 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384766 () Bool)

(declare-fun res!219361 () Bool)

(assert (=> b!384766 (=> (not res!219361) (not e!233567))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384766 (= res!219361 (validKeyInArray!0 k!778))))

(declare-fun b!384767 () Bool)

(declare-fun res!219356 () Bool)

(declare-fun e!233568 () Bool)

(assert (=> b!384767 (=> (not res!219356) (not e!233568))))

(declare-fun lt!181145 () array!22671)

(declare-datatypes ((List!6214 0))(
  ( (Nil!6211) (Cons!6210 (h!7066 (_ BitVec 64)) (t!11364 List!6214)) )
))
(declare-fun arrayNoDuplicates!0 (array!22671 (_ BitVec 32) List!6214) Bool)

(assert (=> b!384767 (= res!219356 (arrayNoDuplicates!0 lt!181145 #b00000000000000000000000000000000 Nil!6211))))

(declare-fun b!384768 () Bool)

(declare-fun res!219360 () Bool)

(assert (=> b!384768 (=> (not res!219360) (not e!233567))))

(declare-fun arrayContainsKey!0 (array!22671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384768 (= res!219360 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!384769 () Bool)

(declare-fun e!233569 () Bool)

(assert (=> b!384769 (= e!233569 tp_is_empty!9385)))

(declare-fun b!384770 () Bool)

(declare-fun res!219355 () Bool)

(assert (=> b!384770 (=> (not res!219355) (not e!233567))))

(assert (=> b!384770 (= res!219355 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11156 _keys!658))))))

(declare-fun b!384771 () Bool)

(assert (=> b!384771 (= e!233567 e!233568)))

(declare-fun res!219353 () Bool)

(assert (=> b!384771 (=> (not res!219353) (not e!233568))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22671 (_ BitVec 32)) Bool)

(assert (=> b!384771 (= res!219353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181145 mask!970))))

(assert (=> b!384771 (= lt!181145 (array!22672 (store (arr!10804 _keys!658) i!548 k!778) (size!11156 _keys!658)))))

(declare-fun mapIsEmpty!15642 () Bool)

(declare-fun mapRes!15642 () Bool)

(assert (=> mapIsEmpty!15642 mapRes!15642))

(declare-fun mapNonEmpty!15642 () Bool)

(declare-fun tp!30926 () Bool)

(assert (=> mapNonEmpty!15642 (= mapRes!15642 (and tp!30926 e!233570))))

(declare-fun mapKey!15642 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4349 0))(
  ( (ValueCellFull!4349 (v!6934 V!13619)) (EmptyCell!4349) )
))
(declare-datatypes ((array!22673 0))(
  ( (array!22674 (arr!10805 (Array (_ BitVec 32) ValueCell!4349)) (size!11157 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22673)

(declare-fun mapValue!15642 () ValueCell!4349)

(declare-fun mapRest!15642 () (Array (_ BitVec 32) ValueCell!4349))

(assert (=> mapNonEmpty!15642 (= (arr!10805 _values!506) (store mapRest!15642 mapKey!15642 mapValue!15642))))

(declare-fun res!219352 () Bool)

(assert (=> start!37610 (=> (not res!219352) (not e!233567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37610 (= res!219352 (validMask!0 mask!970))))

(assert (=> start!37610 e!233567))

(declare-fun e!233573 () Bool)

(declare-fun array_inv!7954 (array!22673) Bool)

(assert (=> start!37610 (and (array_inv!7954 _values!506) e!233573)))

(assert (=> start!37610 tp!30927))

(assert (=> start!37610 true))

(assert (=> start!37610 tp_is_empty!9385))

(declare-fun array_inv!7955 (array!22671) Bool)

(assert (=> start!37610 (array_inv!7955 _keys!658)))

(declare-fun b!384772 () Bool)

(declare-fun res!219354 () Bool)

(assert (=> b!384772 (=> (not res!219354) (not e!233567))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384772 (= res!219354 (and (= (size!11157 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11156 _keys!658) (size!11157 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384773 () Bool)

(assert (=> b!384773 (= e!233568 (not e!233572))))

(declare-fun res!219359 () Bool)

(assert (=> b!384773 (=> res!219359 e!233572)))

(declare-fun lt!181139 () Bool)

(assert (=> b!384773 (= res!219359 (or (and (not lt!181139) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181139) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181139)))))

(assert (=> b!384773 (= lt!181139 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13619)

(declare-fun minValue!472 () V!13619)

(declare-fun getCurrentListMap!2060 (array!22671 array!22673 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) Int) ListLongMap!5291)

(assert (=> b!384773 (= lt!181142 (getCurrentListMap!2060 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181148 () array!22673)

(assert (=> b!384773 (= lt!181146 (getCurrentListMap!2060 lt!181145 lt!181148 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181144 () ListLongMap!5291)

(assert (=> b!384773 (and (= lt!181143 lt!181144) (= lt!181144 lt!181143))))

(declare-fun lt!181149 () ListLongMap!5291)

(assert (=> b!384773 (= lt!181144 (+!996 lt!181149 lt!181140))))

(declare-fun v!373 () V!13619)

(assert (=> b!384773 (= lt!181140 (tuple2!6379 k!778 v!373))))

(declare-datatypes ((Unit!11874 0))(
  ( (Unit!11875) )
))
(declare-fun lt!181141 () Unit!11874)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!218 (array!22671 array!22673 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) (_ BitVec 64) V!13619 (_ BitVec 32) Int) Unit!11874)

(assert (=> b!384773 (= lt!181141 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!218 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!894 (array!22671 array!22673 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) Int) ListLongMap!5291)

(assert (=> b!384773 (= lt!181143 (getCurrentListMapNoExtraKeys!894 lt!181145 lt!181148 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384773 (= lt!181148 (array!22674 (store (arr!10805 _values!506) i!548 (ValueCellFull!4349 v!373)) (size!11157 _values!506)))))

(assert (=> b!384773 (= lt!181149 (getCurrentListMapNoExtraKeys!894 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384774 () Bool)

(declare-fun res!219357 () Bool)

(assert (=> b!384774 (=> (not res!219357) (not e!233567))))

(assert (=> b!384774 (= res!219357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384775 () Bool)

(declare-fun res!219358 () Bool)

(assert (=> b!384775 (=> (not res!219358) (not e!233567))))

(assert (=> b!384775 (= res!219358 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6211))))

(declare-fun b!384776 () Bool)

(assert (=> b!384776 (= e!233573 (and e!233569 mapRes!15642))))

(declare-fun condMapEmpty!15642 () Bool)

(declare-fun mapDefault!15642 () ValueCell!4349)

