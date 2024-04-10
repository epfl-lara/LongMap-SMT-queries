; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40938 () Bool)

(assert start!40938)

(declare-fun b_free!10873 () Bool)

(declare-fun b_next!10873 () Bool)

(assert (=> start!40938 (= b_free!10873 (not b_next!10873))))

(declare-fun tp!38445 () Bool)

(declare-fun b_and!19015 () Bool)

(assert (=> start!40938 (= tp!38445 b_and!19015)))

(declare-fun b!455267 () Bool)

(declare-fun res!271428 () Bool)

(declare-fun e!266211 () Bool)

(assert (=> b!455267 (=> (not res!271428) (not e!266211))))

(declare-datatypes ((array!28225 0))(
  ( (array!28226 (arr!13556 (Array (_ BitVec 32) (_ BitVec 64))) (size!13908 (_ BitVec 32))) )
))
(declare-fun lt!206302 () array!28225)

(declare-datatypes ((List!8169 0))(
  ( (Nil!8166) (Cons!8165 (h!9021 (_ BitVec 64)) (t!13997 List!8169)) )
))
(declare-fun arrayNoDuplicates!0 (array!28225 (_ BitVec 32) List!8169) Bool)

(assert (=> b!455267 (= res!271428 (arrayNoDuplicates!0 lt!206302 #b00000000000000000000000000000000 Nil!8166))))

(declare-fun b!455268 () Bool)

(declare-fun res!271431 () Bool)

(declare-fun e!266210 () Bool)

(assert (=> b!455268 (=> (not res!271431) (not e!266210))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!28225)

(assert (=> b!455268 (= res!271431 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13908 _keys!709))))))

(declare-fun b!455269 () Bool)

(assert (=> b!455269 (= e!266210 e!266211)))

(declare-fun res!271430 () Bool)

(assert (=> b!455269 (=> (not res!271430) (not e!266211))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28225 (_ BitVec 32)) Bool)

(assert (=> b!455269 (= res!271430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206302 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!455269 (= lt!206302 (array!28226 (store (arr!13556 _keys!709) i!563 k!794) (size!13908 _keys!709)))))

(declare-fun b!455270 () Bool)

(declare-fun res!271436 () Bool)

(assert (=> b!455270 (=> (not res!271436) (not e!266210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455270 (= res!271436 (validKeyInArray!0 k!794))))

(declare-fun b!455271 () Bool)

(declare-fun res!271433 () Bool)

(assert (=> b!455271 (=> (not res!271433) (not e!266210))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17387 0))(
  ( (V!17388 (val!6150 Int)) )
))
(declare-datatypes ((ValueCell!5762 0))(
  ( (ValueCellFull!5762 (v!8416 V!17387)) (EmptyCell!5762) )
))
(declare-datatypes ((array!28227 0))(
  ( (array!28228 (arr!13557 (Array (_ BitVec 32) ValueCell!5762)) (size!13909 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28227)

(assert (=> b!455271 (= res!271433 (and (= (size!13909 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13908 _keys!709) (size!13909 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455272 () Bool)

(declare-fun e!266212 () Bool)

(declare-fun tp_is_empty!12211 () Bool)

(assert (=> b!455272 (= e!266212 tp_is_empty!12211)))

(declare-fun b!455273 () Bool)

(declare-fun res!271438 () Bool)

(assert (=> b!455273 (=> (not res!271438) (not e!266210))))

(declare-fun arrayContainsKey!0 (array!28225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455273 (= res!271438 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!455274 () Bool)

(declare-fun res!271435 () Bool)

(assert (=> b!455274 (=> (not res!271435) (not e!266210))))

(assert (=> b!455274 (= res!271435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455275 () Bool)

(declare-fun res!271434 () Bool)

(assert (=> b!455275 (=> (not res!271434) (not e!266211))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!455275 (= res!271434 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19957 () Bool)

(declare-fun mapRes!19957 () Bool)

(declare-fun tp!38446 () Bool)

(assert (=> mapNonEmpty!19957 (= mapRes!19957 (and tp!38446 e!266212))))

(declare-fun mapKey!19957 () (_ BitVec 32))

(declare-fun mapValue!19957 () ValueCell!5762)

(declare-fun mapRest!19957 () (Array (_ BitVec 32) ValueCell!5762))

(assert (=> mapNonEmpty!19957 (= (arr!13557 _values!549) (store mapRest!19957 mapKey!19957 mapValue!19957))))

(declare-fun b!455276 () Bool)

(declare-fun e!266214 () Bool)

(assert (=> b!455276 (= e!266214 tp_is_empty!12211)))

(declare-fun b!455277 () Bool)

(declare-fun e!266213 () Bool)

(assert (=> b!455277 (= e!266213 (and e!266214 mapRes!19957))))

(declare-fun condMapEmpty!19957 () Bool)

(declare-fun mapDefault!19957 () ValueCell!5762)

