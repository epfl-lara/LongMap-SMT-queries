; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40234 () Bool)

(assert start!40234)

(declare-fun b_free!10501 () Bool)

(declare-fun b_next!10501 () Bool)

(assert (=> start!40234 (= b_free!10501 (not b_next!10501))))

(declare-fun tp!37031 () Bool)

(declare-fun b_and!18469 () Bool)

(assert (=> start!40234 (= tp!37031 b_and!18469)))

(declare-fun b!441380 () Bool)

(declare-fun res!261269 () Bool)

(declare-fun e!259905 () Bool)

(assert (=> b!441380 (=> (not res!261269) (not e!259905))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441380 (= res!261269 (validKeyInArray!0 k!794))))

(declare-fun b!441381 () Bool)

(declare-fun e!259904 () Bool)

(declare-fun e!259903 () Bool)

(assert (=> b!441381 (= e!259904 e!259903)))

(declare-fun res!261263 () Bool)

(assert (=> b!441381 (=> (not res!261263) (not e!259903))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441381 (= res!261263 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16643 0))(
  ( (V!16644 (val!5871 Int)) )
))
(declare-fun minValue!515 () V!16643)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16643)

(declare-datatypes ((tuple2!7812 0))(
  ( (tuple2!7813 (_1!3917 (_ BitVec 64)) (_2!3917 V!16643)) )
))
(declare-datatypes ((List!7808 0))(
  ( (Nil!7805) (Cons!7804 (h!8660 tuple2!7812) (t!13564 List!7808)) )
))
(declare-datatypes ((ListLongMap!6725 0))(
  ( (ListLongMap!6726 (toList!3378 List!7808)) )
))
(declare-fun lt!202880 () ListLongMap!6725)

(declare-datatypes ((array!27119 0))(
  ( (array!27120 (arr!13009 (Array (_ BitVec 32) (_ BitVec 64))) (size!13361 (_ BitVec 32))) )
))
(declare-fun lt!202876 () array!27119)

(declare-datatypes ((ValueCell!5483 0))(
  ( (ValueCellFull!5483 (v!8118 V!16643)) (EmptyCell!5483) )
))
(declare-datatypes ((array!27121 0))(
  ( (array!27122 (arr!13010 (Array (_ BitVec 32) ValueCell!5483)) (size!13362 (_ BitVec 32))) )
))
(declare-fun lt!202877 () array!27121)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1567 (array!27119 array!27121 (_ BitVec 32) (_ BitVec 32) V!16643 V!16643 (_ BitVec 32) Int) ListLongMap!6725)

(assert (=> b!441381 (= lt!202880 (getCurrentListMapNoExtraKeys!1567 lt!202876 lt!202877 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27121)

(declare-fun v!412 () V!16643)

(assert (=> b!441381 (= lt!202877 (array!27122 (store (arr!13010 _values!549) i!563 (ValueCellFull!5483 v!412)) (size!13362 _values!549)))))

(declare-fun lt!202878 () ListLongMap!6725)

(declare-fun _keys!709 () array!27119)

(assert (=> b!441381 (= lt!202878 (getCurrentListMapNoExtraKeys!1567 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441382 () Bool)

(declare-fun res!261261 () Bool)

(assert (=> b!441382 (=> (not res!261261) (not e!259905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441382 (= res!261261 (validMask!0 mask!1025))))

(declare-fun b!441383 () Bool)

(declare-fun res!261270 () Bool)

(assert (=> b!441383 (=> (not res!261270) (not e!259905))))

(declare-datatypes ((List!7809 0))(
  ( (Nil!7806) (Cons!7805 (h!8661 (_ BitVec 64)) (t!13565 List!7809)) )
))
(declare-fun arrayNoDuplicates!0 (array!27119 (_ BitVec 32) List!7809) Bool)

(assert (=> b!441383 (= res!261270 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7806))))

(declare-fun b!441384 () Bool)

(declare-fun e!259902 () Bool)

(declare-fun tp_is_empty!11653 () Bool)

(assert (=> b!441384 (= e!259902 tp_is_empty!11653)))

(declare-fun b!441385 () Bool)

(declare-fun res!261266 () Bool)

(assert (=> b!441385 (=> (not res!261266) (not e!259905))))

(assert (=> b!441385 (= res!261266 (or (= (select (arr!13009 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13009 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441387 () Bool)

(declare-fun res!261265 () Bool)

(assert (=> b!441387 (=> (not res!261265) (not e!259904))))

(assert (=> b!441387 (= res!261265 (bvsle from!863 i!563))))

(declare-fun b!441388 () Bool)

(declare-fun e!259906 () Bool)

(assert (=> b!441388 (= e!259906 tp_is_empty!11653)))

(declare-fun b!441389 () Bool)

(declare-fun res!261267 () Bool)

(assert (=> b!441389 (=> (not res!261267) (not e!259905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27119 (_ BitVec 32)) Bool)

(assert (=> b!441389 (= res!261267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441390 () Bool)

(declare-fun res!261262 () Bool)

(assert (=> b!441390 (=> (not res!261262) (not e!259904))))

(assert (=> b!441390 (= res!261262 (arrayNoDuplicates!0 lt!202876 #b00000000000000000000000000000000 Nil!7806))))

(declare-fun b!441391 () Bool)

(assert (=> b!441391 (= e!259903 (not true))))

(declare-fun +!1514 (ListLongMap!6725 tuple2!7812) ListLongMap!6725)

(assert (=> b!441391 (= (getCurrentListMapNoExtraKeys!1567 lt!202876 lt!202877 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1514 (getCurrentListMapNoExtraKeys!1567 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7813 k!794 v!412)))))

(declare-datatypes ((Unit!13132 0))(
  ( (Unit!13133) )
))
(declare-fun lt!202879 () Unit!13132)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!683 (array!27119 array!27121 (_ BitVec 32) (_ BitVec 32) V!16643 V!16643 (_ BitVec 32) (_ BitVec 64) V!16643 (_ BitVec 32) Int) Unit!13132)

(assert (=> b!441391 (= lt!202879 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441392 () Bool)

(declare-fun res!261264 () Bool)

(assert (=> b!441392 (=> (not res!261264) (not e!259905))))

(declare-fun arrayContainsKey!0 (array!27119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441392 (= res!261264 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!441393 () Bool)

(declare-fun res!261271 () Bool)

(assert (=> b!441393 (=> (not res!261271) (not e!259905))))

(assert (=> b!441393 (= res!261271 (and (= (size!13362 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13361 _keys!709) (size!13362 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441394 () Bool)

(declare-fun res!261268 () Bool)

(assert (=> b!441394 (=> (not res!261268) (not e!259905))))

(assert (=> b!441394 (= res!261268 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13361 _keys!709))))))

(declare-fun b!441395 () Bool)

(assert (=> b!441395 (= e!259905 e!259904)))

(declare-fun res!261273 () Bool)

(assert (=> b!441395 (=> (not res!261273) (not e!259904))))

(assert (=> b!441395 (= res!261273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202876 mask!1025))))

(assert (=> b!441395 (= lt!202876 (array!27120 (store (arr!13009 _keys!709) i!563 k!794) (size!13361 _keys!709)))))

(declare-fun b!441386 () Bool)

(declare-fun e!259908 () Bool)

(declare-fun mapRes!19101 () Bool)

(assert (=> b!441386 (= e!259908 (and e!259906 mapRes!19101))))

(declare-fun condMapEmpty!19101 () Bool)

(declare-fun mapDefault!19101 () ValueCell!5483)

