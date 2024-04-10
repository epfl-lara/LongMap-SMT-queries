; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40954 () Bool)

(assert start!40954)

(declare-fun b_free!10889 () Bool)

(declare-fun b_next!10889 () Bool)

(assert (=> start!40954 (= b_free!10889 (not b_next!10889))))

(declare-fun tp!38494 () Bool)

(declare-fun b_and!19031 () Bool)

(assert (=> start!40954 (= tp!38494 b_and!19031)))

(declare-fun mapNonEmpty!19981 () Bool)

(declare-fun mapRes!19981 () Bool)

(declare-fun tp!38493 () Bool)

(declare-fun e!266358 () Bool)

(assert (=> mapNonEmpty!19981 (= mapRes!19981 (and tp!38493 e!266358))))

(declare-datatypes ((V!17407 0))(
  ( (V!17408 (val!6158 Int)) )
))
(declare-datatypes ((ValueCell!5770 0))(
  ( (ValueCellFull!5770 (v!8424 V!17407)) (EmptyCell!5770) )
))
(declare-fun mapValue!19981 () ValueCell!5770)

(declare-fun mapRest!19981 () (Array (_ BitVec 32) ValueCell!5770))

(declare-fun mapKey!19981 () (_ BitVec 32))

(declare-datatypes ((array!28257 0))(
  ( (array!28258 (arr!13572 (Array (_ BitVec 32) ValueCell!5770)) (size!13924 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28257)

(assert (=> mapNonEmpty!19981 (= (arr!13572 _values!549) (store mapRest!19981 mapKey!19981 mapValue!19981))))

(declare-fun mapIsEmpty!19981 () Bool)

(assert (=> mapIsEmpty!19981 mapRes!19981))

(declare-fun res!271726 () Bool)

(declare-fun e!266354 () Bool)

(assert (=> start!40954 (=> (not res!271726) (not e!266354))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28259 0))(
  ( (array!28260 (arr!13573 (Array (_ BitVec 32) (_ BitVec 64))) (size!13925 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28259)

(assert (=> start!40954 (= res!271726 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13925 _keys!709))))))

(assert (=> start!40954 e!266354))

(declare-fun tp_is_empty!12227 () Bool)

(assert (=> start!40954 tp_is_empty!12227))

(assert (=> start!40954 tp!38494))

(assert (=> start!40954 true))

(declare-fun e!266356 () Bool)

(declare-fun array_inv!9834 (array!28257) Bool)

(assert (=> start!40954 (and (array_inv!9834 _values!549) e!266356)))

(declare-fun array_inv!9835 (array!28259) Bool)

(assert (=> start!40954 (array_inv!9835 _keys!709)))

(declare-fun b!455627 () Bool)

(declare-fun res!271717 () Bool)

(assert (=> b!455627 (=> (not res!271717) (not e!266354))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!455627 (= res!271717 (and (= (size!13924 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13925 _keys!709) (size!13924 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455628 () Bool)

(declare-fun res!271719 () Bool)

(declare-fun e!266359 () Bool)

(assert (=> b!455628 (=> (not res!271719) (not e!266359))))

(declare-fun lt!206375 () array!28259)

(declare-datatypes ((List!8181 0))(
  ( (Nil!8178) (Cons!8177 (h!9033 (_ BitVec 64)) (t!14009 List!8181)) )
))
(declare-fun arrayNoDuplicates!0 (array!28259 (_ BitVec 32) List!8181) Bool)

(assert (=> b!455628 (= res!271719 (arrayNoDuplicates!0 lt!206375 #b00000000000000000000000000000000 Nil!8178))))

(declare-fun b!455629 () Bool)

(declare-fun res!271724 () Bool)

(assert (=> b!455629 (=> (not res!271724) (not e!266359))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455629 (= res!271724 (bvsle from!863 i!563))))

(declare-fun b!455630 () Bool)

(assert (=> b!455630 (= e!266358 tp_is_empty!12227)))

(declare-fun b!455631 () Bool)

(declare-fun e!266355 () Bool)

(assert (=> b!455631 (= e!266355 tp_is_empty!12227)))

(declare-fun b!455632 () Bool)

(assert (=> b!455632 (= e!266354 e!266359)))

(declare-fun res!271720 () Bool)

(assert (=> b!455632 (=> (not res!271720) (not e!266359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28259 (_ BitVec 32)) Bool)

(assert (=> b!455632 (= res!271720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206375 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!455632 (= lt!206375 (array!28260 (store (arr!13573 _keys!709) i!563 k!794) (size!13925 _keys!709)))))

(declare-fun b!455633 () Bool)

(declare-fun res!271721 () Bool)

(assert (=> b!455633 (=> (not res!271721) (not e!266354))))

(assert (=> b!455633 (= res!271721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455634 () Bool)

(declare-fun res!271727 () Bool)

(assert (=> b!455634 (=> (not res!271727) (not e!266354))))

(assert (=> b!455634 (= res!271727 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13925 _keys!709))))))

(declare-fun b!455635 () Bool)

(declare-fun res!271716 () Bool)

(assert (=> b!455635 (=> (not res!271716) (not e!266354))))

(assert (=> b!455635 (= res!271716 (or (= (select (arr!13573 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13573 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455636 () Bool)

(assert (=> b!455636 (= e!266356 (and e!266355 mapRes!19981))))

(declare-fun condMapEmpty!19981 () Bool)

(declare-fun mapDefault!19981 () ValueCell!5770)

