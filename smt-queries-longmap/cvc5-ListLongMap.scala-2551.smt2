; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39124 () Bool)

(assert start!39124)

(declare-fun b_free!9391 () Bool)

(declare-fun b_next!9391 () Bool)

(assert (=> start!39124 (= b_free!9391 (not b_next!9391))))

(declare-fun tp!33702 () Bool)

(declare-fun b_and!16777 () Bool)

(assert (=> start!39124 (= tp!33702 b_and!16777)))

(declare-fun b!411402 () Bool)

(declare-fun e!246395 () Bool)

(assert (=> b!411402 (= e!246395 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15163 0))(
  ( (V!15164 (val!5316 Int)) )
))
(declare-fun minValue!515 () V!15163)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6896 0))(
  ( (tuple2!6897 (_1!3459 (_ BitVec 64)) (_2!3459 V!15163)) )
))
(declare-datatypes ((List!6921 0))(
  ( (Nil!6918) (Cons!6917 (h!7773 tuple2!6896) (t!12095 List!6921)) )
))
(declare-datatypes ((ListLongMap!5809 0))(
  ( (ListLongMap!5810 (toList!2920 List!6921)) )
))
(declare-fun lt!189273 () ListLongMap!5809)

(declare-datatypes ((ValueCell!4928 0))(
  ( (ValueCellFull!4928 (v!7563 V!15163)) (EmptyCell!4928) )
))
(declare-datatypes ((array!24947 0))(
  ( (array!24948 (arr!11923 (Array (_ BitVec 32) ValueCell!4928)) (size!12275 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24947)

(declare-fun zeroValue!515 () V!15163)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24949 0))(
  ( (array!24950 (arr!11924 (Array (_ BitVec 32) (_ BitVec 64))) (size!12276 (_ BitVec 32))) )
))
(declare-fun lt!189274 () array!24949)

(declare-fun v!412 () V!15163)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1128 (array!24949 array!24947 (_ BitVec 32) (_ BitVec 32) V!15163 V!15163 (_ BitVec 32) Int) ListLongMap!5809)

(assert (=> b!411402 (= lt!189273 (getCurrentListMapNoExtraKeys!1128 lt!189274 (array!24948 (store (arr!11923 _values!549) i!563 (ValueCellFull!4928 v!412)) (size!12275 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189275 () ListLongMap!5809)

(declare-fun _keys!709 () array!24949)

(assert (=> b!411402 (= lt!189275 (getCurrentListMapNoExtraKeys!1128 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411403 () Bool)

(declare-fun res!238666 () Bool)

(declare-fun e!246394 () Bool)

(assert (=> b!411403 (=> (not res!238666) (not e!246394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411403 (= res!238666 (validMask!0 mask!1025))))

(declare-fun b!411405 () Bool)

(declare-fun res!238660 () Bool)

(assert (=> b!411405 (=> (not res!238660) (not e!246394))))

(assert (=> b!411405 (= res!238660 (or (= (select (arr!11924 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11924 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411406 () Bool)

(assert (=> b!411406 (= e!246394 e!246395)))

(declare-fun res!238663 () Bool)

(assert (=> b!411406 (=> (not res!238663) (not e!246395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24949 (_ BitVec 32)) Bool)

(assert (=> b!411406 (= res!238663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189274 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!411406 (= lt!189274 (array!24950 (store (arr!11924 _keys!709) i!563 k!794) (size!12276 _keys!709)))))

(declare-fun b!411407 () Bool)

(declare-fun e!246392 () Bool)

(declare-fun tp_is_empty!10543 () Bool)

(assert (=> b!411407 (= e!246392 tp_is_empty!10543)))

(declare-fun b!411408 () Bool)

(declare-fun res!238669 () Bool)

(assert (=> b!411408 (=> (not res!238669) (not e!246394))))

(declare-datatypes ((List!6922 0))(
  ( (Nil!6919) (Cons!6918 (h!7774 (_ BitVec 64)) (t!12096 List!6922)) )
))
(declare-fun arrayNoDuplicates!0 (array!24949 (_ BitVec 32) List!6922) Bool)

(assert (=> b!411408 (= res!238669 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6919))))

(declare-fun b!411409 () Bool)

(declare-fun e!246396 () Bool)

(assert (=> b!411409 (= e!246396 tp_is_empty!10543)))

(declare-fun b!411410 () Bool)

(declare-fun e!246393 () Bool)

(declare-fun mapRes!17436 () Bool)

(assert (=> b!411410 (= e!246393 (and e!246396 mapRes!17436))))

(declare-fun condMapEmpty!17436 () Bool)

(declare-fun mapDefault!17436 () ValueCell!4928)

