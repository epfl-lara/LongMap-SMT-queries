; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40228 () Bool)

(assert start!40228)

(declare-fun b_free!10495 () Bool)

(declare-fun b_next!10495 () Bool)

(assert (=> start!40228 (= b_free!10495 (not b_next!10495))))

(declare-fun tp!37014 () Bool)

(declare-fun b_and!18463 () Bool)

(assert (=> start!40228 (= tp!37014 b_and!18463)))

(declare-fun b!441236 () Bool)

(declare-fun res!261144 () Bool)

(declare-fun e!259844 () Bool)

(assert (=> b!441236 (=> (not res!261144) (not e!259844))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441236 (= res!261144 (validMask!0 mask!1025))))

(declare-fun res!261150 () Bool)

(assert (=> start!40228 (=> (not res!261150) (not e!259844))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27107 0))(
  ( (array!27108 (arr!13003 (Array (_ BitVec 32) (_ BitVec 64))) (size!13355 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27107)

(assert (=> start!40228 (= res!261150 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13355 _keys!709))))))

(assert (=> start!40228 e!259844))

(declare-fun tp_is_empty!11647 () Bool)

(assert (=> start!40228 tp_is_empty!11647))

(assert (=> start!40228 tp!37014))

(assert (=> start!40228 true))

(declare-datatypes ((V!16635 0))(
  ( (V!16636 (val!5868 Int)) )
))
(declare-datatypes ((ValueCell!5480 0))(
  ( (ValueCellFull!5480 (v!8115 V!16635)) (EmptyCell!5480) )
))
(declare-datatypes ((array!27109 0))(
  ( (array!27110 (arr!13004 (Array (_ BitVec 32) ValueCell!5480)) (size!13356 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27109)

(declare-fun e!259842 () Bool)

(declare-fun array_inv!9438 (array!27109) Bool)

(assert (=> start!40228 (and (array_inv!9438 _values!549) e!259842)))

(declare-fun array_inv!9439 (array!27107) Bool)

(assert (=> start!40228 (array_inv!9439 _keys!709)))

(declare-fun b!441237 () Bool)

(declare-fun res!261147 () Bool)

(declare-fun e!259843 () Bool)

(assert (=> b!441237 (=> (not res!261147) (not e!259843))))

(declare-fun lt!202831 () array!27107)

(declare-datatypes ((List!7803 0))(
  ( (Nil!7800) (Cons!7799 (h!8655 (_ BitVec 64)) (t!13559 List!7803)) )
))
(declare-fun arrayNoDuplicates!0 (array!27107 (_ BitVec 32) List!7803) Bool)

(assert (=> b!441237 (= res!261147 (arrayNoDuplicates!0 lt!202831 #b00000000000000000000000000000000 Nil!7800))))

(declare-fun mapIsEmpty!19092 () Bool)

(declare-fun mapRes!19092 () Bool)

(assert (=> mapIsEmpty!19092 mapRes!19092))

(declare-fun b!441238 () Bool)

(declare-fun res!261148 () Bool)

(assert (=> b!441238 (=> (not res!261148) (not e!259844))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!441238 (= res!261148 (and (= (size!13356 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13355 _keys!709) (size!13356 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441239 () Bool)

(declare-fun e!259840 () Bool)

(assert (=> b!441239 (= e!259840 (not true))))

(declare-fun minValue!515 () V!16635)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202832 () array!27109)

(declare-fun zeroValue!515 () V!16635)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16635)

(declare-datatypes ((tuple2!7808 0))(
  ( (tuple2!7809 (_1!3915 (_ BitVec 64)) (_2!3915 V!16635)) )
))
(declare-datatypes ((List!7804 0))(
  ( (Nil!7801) (Cons!7800 (h!8656 tuple2!7808) (t!13560 List!7804)) )
))
(declare-datatypes ((ListLongMap!6721 0))(
  ( (ListLongMap!6722 (toList!3376 List!7804)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1565 (array!27107 array!27109 (_ BitVec 32) (_ BitVec 32) V!16635 V!16635 (_ BitVec 32) Int) ListLongMap!6721)

(declare-fun +!1512 (ListLongMap!6721 tuple2!7808) ListLongMap!6721)

(assert (=> b!441239 (= (getCurrentListMapNoExtraKeys!1565 lt!202831 lt!202832 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1512 (getCurrentListMapNoExtraKeys!1565 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7809 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13128 0))(
  ( (Unit!13129) )
))
(declare-fun lt!202834 () Unit!13128)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!681 (array!27107 array!27109 (_ BitVec 32) (_ BitVec 32) V!16635 V!16635 (_ BitVec 32) (_ BitVec 64) V!16635 (_ BitVec 32) Int) Unit!13128)

(assert (=> b!441239 (= lt!202834 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!681 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441240 () Bool)

(assert (=> b!441240 (= e!259844 e!259843)))

(declare-fun res!261153 () Bool)

(assert (=> b!441240 (=> (not res!261153) (not e!259843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27107 (_ BitVec 32)) Bool)

(assert (=> b!441240 (= res!261153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202831 mask!1025))))

(assert (=> b!441240 (= lt!202831 (array!27108 (store (arr!13003 _keys!709) i!563 k!794) (size!13355 _keys!709)))))

(declare-fun mapNonEmpty!19092 () Bool)

(declare-fun tp!37013 () Bool)

(declare-fun e!259839 () Bool)

(assert (=> mapNonEmpty!19092 (= mapRes!19092 (and tp!37013 e!259839))))

(declare-fun mapValue!19092 () ValueCell!5480)

(declare-fun mapKey!19092 () (_ BitVec 32))

(declare-fun mapRest!19092 () (Array (_ BitVec 32) ValueCell!5480))

(assert (=> mapNonEmpty!19092 (= (arr!13004 _values!549) (store mapRest!19092 mapKey!19092 mapValue!19092))))

(declare-fun b!441241 () Bool)

(declare-fun res!261154 () Bool)

(assert (=> b!441241 (=> (not res!261154) (not e!259844))))

(assert (=> b!441241 (= res!261154 (or (= (select (arr!13003 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13003 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441242 () Bool)

(declare-fun res!261145 () Bool)

(assert (=> b!441242 (=> (not res!261145) (not e!259843))))

(assert (=> b!441242 (= res!261145 (bvsle from!863 i!563))))

(declare-fun b!441243 () Bool)

(assert (=> b!441243 (= e!259843 e!259840)))

(declare-fun res!261155 () Bool)

(assert (=> b!441243 (=> (not res!261155) (not e!259840))))

(assert (=> b!441243 (= res!261155 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202833 () ListLongMap!6721)

(assert (=> b!441243 (= lt!202833 (getCurrentListMapNoExtraKeys!1565 lt!202831 lt!202832 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441243 (= lt!202832 (array!27110 (store (arr!13004 _values!549) i!563 (ValueCellFull!5480 v!412)) (size!13356 _values!549)))))

(declare-fun lt!202835 () ListLongMap!6721)

(assert (=> b!441243 (= lt!202835 (getCurrentListMapNoExtraKeys!1565 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441244 () Bool)

(declare-fun res!261146 () Bool)

(assert (=> b!441244 (=> (not res!261146) (not e!259844))))

(assert (=> b!441244 (= res!261146 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13355 _keys!709))))))

(declare-fun b!441245 () Bool)

(assert (=> b!441245 (= e!259839 tp_is_empty!11647)))

(declare-fun b!441246 () Bool)

(declare-fun e!259845 () Bool)

(assert (=> b!441246 (= e!259845 tp_is_empty!11647)))

(declare-fun b!441247 () Bool)

(declare-fun res!261156 () Bool)

(assert (=> b!441247 (=> (not res!261156) (not e!259844))))

(assert (=> b!441247 (= res!261156 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7800))))

(declare-fun b!441248 () Bool)

(declare-fun res!261149 () Bool)

(assert (=> b!441248 (=> (not res!261149) (not e!259844))))

(declare-fun arrayContainsKey!0 (array!27107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441248 (= res!261149 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!441249 () Bool)

(declare-fun res!261151 () Bool)

(assert (=> b!441249 (=> (not res!261151) (not e!259844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441249 (= res!261151 (validKeyInArray!0 k!794))))

(declare-fun b!441250 () Bool)

(assert (=> b!441250 (= e!259842 (and e!259845 mapRes!19092))))

(declare-fun condMapEmpty!19092 () Bool)

(declare-fun mapDefault!19092 () ValueCell!5480)

