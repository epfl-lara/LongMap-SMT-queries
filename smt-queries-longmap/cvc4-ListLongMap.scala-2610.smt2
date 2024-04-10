; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39482 () Bool)

(assert start!39482)

(declare-fun b_free!9749 () Bool)

(declare-fun b_next!9749 () Bool)

(assert (=> start!39482 (= b_free!9749 (not b_next!9749))))

(declare-fun tp!34776 () Bool)

(declare-fun b_and!17373 () Bool)

(assert (=> start!39482 (= tp!34776 b_and!17373)))

(declare-fun b!421383 () Bool)

(declare-fun res!245912 () Bool)

(declare-fun e!250861 () Bool)

(assert (=> b!421383 (=> (not res!245912) (not e!250861))))

(declare-datatypes ((array!25651 0))(
  ( (array!25652 (arr!12275 (Array (_ BitVec 32) (_ BitVec 64))) (size!12627 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25651)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15639 0))(
  ( (V!15640 (val!5495 Int)) )
))
(declare-datatypes ((ValueCell!5107 0))(
  ( (ValueCellFull!5107 (v!7742 V!15639)) (EmptyCell!5107) )
))
(declare-datatypes ((array!25653 0))(
  ( (array!25654 (arr!12276 (Array (_ BitVec 32) ValueCell!5107)) (size!12628 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25653)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!421383 (= res!245912 (and (= (size!12628 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12627 _keys!709) (size!12628 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun lt!193437 () array!25651)

(declare-fun minValue!515 () V!15639)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15639)

(declare-fun lt!193433 () array!25653)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!29422 () Bool)

(declare-datatypes ((tuple2!7206 0))(
  ( (tuple2!7207 (_1!3614 (_ BitVec 64)) (_2!3614 V!15639)) )
))
(declare-datatypes ((List!7212 0))(
  ( (Nil!7209) (Cons!7208 (h!8064 tuple2!7206) (t!12626 List!7212)) )
))
(declare-datatypes ((ListLongMap!6119 0))(
  ( (ListLongMap!6120 (toList!3075 List!7212)) )
))
(declare-fun call!29426 () ListLongMap!6119)

(declare-fun c!55337 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1279 (array!25651 array!25653 (_ BitVec 32) (_ BitVec 32) V!15639 V!15639 (_ BitVec 32) Int) ListLongMap!6119)

(assert (=> bm!29422 (= call!29426 (getCurrentListMapNoExtraKeys!1279 (ite c!55337 lt!193437 _keys!709) (ite c!55337 lt!193433 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421384 () Bool)

(declare-fun res!245923 () Bool)

(assert (=> b!421384 (=> (not res!245923) (not e!250861))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421384 (= res!245923 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!421385 () Bool)

(declare-fun res!245913 () Bool)

(declare-fun e!250863 () Bool)

(assert (=> b!421385 (=> (not res!245913) (not e!250863))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421385 (= res!245913 (bvsle from!863 i!563))))

(declare-fun b!421386 () Bool)

(declare-fun v!412 () V!15639)

(declare-fun call!29425 () ListLongMap!6119)

(declare-fun e!250867 () Bool)

(declare-fun +!1270 (ListLongMap!6119 tuple2!7206) ListLongMap!6119)

(assert (=> b!421386 (= e!250867 (= call!29426 (+!1270 call!29425 (tuple2!7207 k!794 v!412))))))

(declare-fun b!421387 () Bool)

(declare-fun res!245925 () Bool)

(assert (=> b!421387 (=> (not res!245925) (not e!250861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421387 (= res!245925 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!17973 () Bool)

(declare-fun mapRes!17973 () Bool)

(declare-fun tp!34775 () Bool)

(declare-fun e!250862 () Bool)

(assert (=> mapNonEmpty!17973 (= mapRes!17973 (and tp!34775 e!250862))))

(declare-fun mapValue!17973 () ValueCell!5107)

(declare-fun mapKey!17973 () (_ BitVec 32))

(declare-fun mapRest!17973 () (Array (_ BitVec 32) ValueCell!5107))

(assert (=> mapNonEmpty!17973 (= (arr!12276 _values!549) (store mapRest!17973 mapKey!17973 mapValue!17973))))

(declare-fun b!421388 () Bool)

(declare-fun res!245924 () Bool)

(assert (=> b!421388 (=> (not res!245924) (not e!250863))))

(declare-datatypes ((List!7213 0))(
  ( (Nil!7210) (Cons!7209 (h!8065 (_ BitVec 64)) (t!12627 List!7213)) )
))
(declare-fun arrayNoDuplicates!0 (array!25651 (_ BitVec 32) List!7213) Bool)

(assert (=> b!421388 (= res!245924 (arrayNoDuplicates!0 lt!193437 #b00000000000000000000000000000000 Nil!7210))))

(declare-fun b!421389 () Bool)

(declare-fun res!245914 () Bool)

(assert (=> b!421389 (=> (not res!245914) (not e!250861))))

(assert (=> b!421389 (= res!245914 (or (= (select (arr!12275 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12275 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421390 () Bool)

(declare-fun res!245916 () Bool)

(assert (=> b!421390 (=> (not res!245916) (not e!250861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25651 (_ BitVec 32)) Bool)

(assert (=> b!421390 (= res!245916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421392 () Bool)

(declare-fun res!245918 () Bool)

(assert (=> b!421392 (=> (not res!245918) (not e!250861))))

(assert (=> b!421392 (= res!245918 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12627 _keys!709))))))

(declare-fun b!421393 () Bool)

(declare-fun tp_is_empty!10901 () Bool)

(assert (=> b!421393 (= e!250862 tp_is_empty!10901)))

(declare-fun b!421394 () Bool)

(assert (=> b!421394 (= e!250867 (= call!29425 call!29426))))

(declare-fun b!421395 () Bool)

(declare-fun e!250868 () Bool)

(assert (=> b!421395 (= e!250863 e!250868)))

(declare-fun res!245919 () Bool)

(assert (=> b!421395 (=> (not res!245919) (not e!250868))))

(assert (=> b!421395 (= res!245919 (= from!863 i!563))))

(declare-fun lt!193441 () ListLongMap!6119)

(assert (=> b!421395 (= lt!193441 (getCurrentListMapNoExtraKeys!1279 lt!193437 lt!193433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421395 (= lt!193433 (array!25654 (store (arr!12276 _values!549) i!563 (ValueCellFull!5107 v!412)) (size!12628 _values!549)))))

(declare-fun lt!193436 () ListLongMap!6119)

(assert (=> b!421395 (= lt!193436 (getCurrentListMapNoExtraKeys!1279 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17973 () Bool)

(assert (=> mapIsEmpty!17973 mapRes!17973))

(declare-fun b!421396 () Bool)

(assert (=> b!421396 (= e!250861 e!250863)))

(declare-fun res!245922 () Bool)

(assert (=> b!421396 (=> (not res!245922) (not e!250863))))

(assert (=> b!421396 (= res!245922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193437 mask!1025))))

(assert (=> b!421396 (= lt!193437 (array!25652 (store (arr!12275 _keys!709) i!563 k!794) (size!12627 _keys!709)))))

(declare-fun b!421397 () Bool)

(declare-fun res!245915 () Bool)

(assert (=> b!421397 (=> (not res!245915) (not e!250861))))

(assert (=> b!421397 (= res!245915 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7210))))

(declare-fun bm!29423 () Bool)

(assert (=> bm!29423 (= call!29425 (getCurrentListMapNoExtraKeys!1279 (ite c!55337 _keys!709 lt!193437) (ite c!55337 _values!549 lt!193433) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421398 () Bool)

(declare-fun e!250869 () Bool)

(declare-fun e!250864 () Bool)

(assert (=> b!421398 (= e!250869 (and e!250864 mapRes!17973))))

(declare-fun condMapEmpty!17973 () Bool)

(declare-fun mapDefault!17973 () ValueCell!5107)

