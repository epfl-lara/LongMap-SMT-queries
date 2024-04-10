; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40090 () Bool)

(assert start!40090)

(declare-fun b_free!10357 () Bool)

(declare-fun b_next!10357 () Bool)

(assert (=> start!40090 (= b_free!10357 (not b_next!10357))))

(declare-fun tp!36600 () Bool)

(declare-fun b_and!18325 () Bool)

(assert (=> start!40090 (= tp!36600 b_and!18325)))

(declare-fun b!437924 () Bool)

(declare-fun res!258454 () Bool)

(declare-fun e!258392 () Bool)

(assert (=> b!437924 (=> (not res!258454) (not e!258392))))

(declare-datatypes ((array!26835 0))(
  ( (array!26836 (arr!12867 (Array (_ BitVec 32) (_ BitVec 64))) (size!13219 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26835)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26835 (_ BitVec 32)) Bool)

(assert (=> b!437924 (= res!258454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437925 () Bool)

(declare-fun e!258394 () Bool)

(declare-fun tp_is_empty!11509 () Bool)

(assert (=> b!437925 (= e!258394 tp_is_empty!11509)))

(declare-fun b!437926 () Bool)

(declare-fun res!258458 () Bool)

(declare-fun e!258396 () Bool)

(assert (=> b!437926 (=> (not res!258458) (not e!258396))))

(declare-fun lt!201796 () array!26835)

(declare-datatypes ((List!7684 0))(
  ( (Nil!7681) (Cons!7680 (h!8536 (_ BitVec 64)) (t!13440 List!7684)) )
))
(declare-fun arrayNoDuplicates!0 (array!26835 (_ BitVec 32) List!7684) Bool)

(assert (=> b!437926 (= res!258458 (arrayNoDuplicates!0 lt!201796 #b00000000000000000000000000000000 Nil!7681))))

(declare-fun b!437927 () Bool)

(declare-fun res!258465 () Bool)

(assert (=> b!437927 (=> (not res!258465) (not e!258392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437927 (= res!258465 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18885 () Bool)

(declare-fun mapRes!18885 () Bool)

(assert (=> mapIsEmpty!18885 mapRes!18885))

(declare-fun b!437928 () Bool)

(declare-fun res!258457 () Bool)

(assert (=> b!437928 (=> (not res!258457) (not e!258392))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437928 (= res!258457 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13219 _keys!709))))))

(declare-fun res!258456 () Bool)

(assert (=> start!40090 (=> (not res!258456) (not e!258392))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40090 (= res!258456 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13219 _keys!709))))))

(assert (=> start!40090 e!258392))

(assert (=> start!40090 tp_is_empty!11509))

(assert (=> start!40090 tp!36600))

(assert (=> start!40090 true))

(declare-datatypes ((V!16451 0))(
  ( (V!16452 (val!5799 Int)) )
))
(declare-datatypes ((ValueCell!5411 0))(
  ( (ValueCellFull!5411 (v!8046 V!16451)) (EmptyCell!5411) )
))
(declare-datatypes ((array!26837 0))(
  ( (array!26838 (arr!12868 (Array (_ BitVec 32) ValueCell!5411)) (size!13220 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26837)

(declare-fun e!258391 () Bool)

(declare-fun array_inv!9346 (array!26837) Bool)

(assert (=> start!40090 (and (array_inv!9346 _values!549) e!258391)))

(declare-fun array_inv!9347 (array!26835) Bool)

(assert (=> start!40090 (array_inv!9347 _keys!709)))

(declare-fun b!437929 () Bool)

(declare-fun e!258390 () Bool)

(assert (=> b!437929 (= e!258390 tp_is_empty!11509)))

(declare-fun b!437930 () Bool)

(declare-fun e!258395 () Bool)

(assert (=> b!437930 (= e!258395 (not true))))

(declare-fun minValue!515 () V!16451)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!201797 () array!26837)

(declare-fun zeroValue!515 () V!16451)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16451)

(declare-datatypes ((tuple2!7684 0))(
  ( (tuple2!7685 (_1!3853 (_ BitVec 64)) (_2!3853 V!16451)) )
))
(declare-datatypes ((List!7685 0))(
  ( (Nil!7682) (Cons!7681 (h!8537 tuple2!7684) (t!13441 List!7685)) )
))
(declare-datatypes ((ListLongMap!6597 0))(
  ( (ListLongMap!6598 (toList!3314 List!7685)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1503 (array!26835 array!26837 (_ BitVec 32) (_ BitVec 32) V!16451 V!16451 (_ BitVec 32) Int) ListLongMap!6597)

(declare-fun +!1458 (ListLongMap!6597 tuple2!7684) ListLongMap!6597)

(assert (=> b!437930 (= (getCurrentListMapNoExtraKeys!1503 lt!201796 lt!201797 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1458 (getCurrentListMapNoExtraKeys!1503 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7685 k!794 v!412)))))

(declare-datatypes ((Unit!13020 0))(
  ( (Unit!13021) )
))
(declare-fun lt!201800 () Unit!13020)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!627 (array!26835 array!26837 (_ BitVec 32) (_ BitVec 32) V!16451 V!16451 (_ BitVec 32) (_ BitVec 64) V!16451 (_ BitVec 32) Int) Unit!13020)

(assert (=> b!437930 (= lt!201800 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!627 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437931 () Bool)

(declare-fun res!258463 () Bool)

(assert (=> b!437931 (=> (not res!258463) (not e!258392))))

(assert (=> b!437931 (= res!258463 (and (= (size!13220 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13219 _keys!709) (size!13220 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437932 () Bool)

(declare-fun res!258462 () Bool)

(assert (=> b!437932 (=> (not res!258462) (not e!258392))))

(assert (=> b!437932 (= res!258462 (or (= (select (arr!12867 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12867 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437933 () Bool)

(assert (=> b!437933 (= e!258391 (and e!258394 mapRes!18885))))

(declare-fun condMapEmpty!18885 () Bool)

(declare-fun mapDefault!18885 () ValueCell!5411)

