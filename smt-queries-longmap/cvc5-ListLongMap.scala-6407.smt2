; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82238 () Bool)

(assert start!82238)

(declare-fun b_free!18511 () Bool)

(declare-fun b_next!18511 () Bool)

(assert (=> start!82238 (= b_free!18511 (not b_next!18511))))

(declare-fun tp!64494 () Bool)

(declare-fun b_and!29999 () Bool)

(assert (=> start!82238 (= tp!64494 b_and!29999)))

(declare-fun b!958577 () Bool)

(declare-fun e!540401 () Bool)

(assert (=> b!958577 (= e!540401 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33273 0))(
  ( (V!33274 (val!10659 Int)) )
))
(declare-fun minValue!1328 () V!33273)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58533 0))(
  ( (array!58534 (arr!28140 (Array (_ BitVec 32) (_ BitVec 64))) (size!28619 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58533)

(declare-datatypes ((ValueCell!10127 0))(
  ( (ValueCellFull!10127 (v!13216 V!33273)) (EmptyCell!10127) )
))
(declare-datatypes ((array!58535 0))(
  ( (array!58536 (arr!28141 (Array (_ BitVec 32) ValueCell!10127)) (size!28620 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58535)

(declare-fun lt!430458 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33273)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13740 0))(
  ( (tuple2!13741 (_1!6881 (_ BitVec 64)) (_2!6881 V!33273)) )
))
(declare-datatypes ((List!19563 0))(
  ( (Nil!19560) (Cons!19559 (h!20721 tuple2!13740) (t!27926 List!19563)) )
))
(declare-datatypes ((ListLongMap!12437 0))(
  ( (ListLongMap!12438 (toList!6234 List!19563)) )
))
(declare-fun contains!5335 (ListLongMap!12437 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3467 (array!58533 array!58535 (_ BitVec 32) (_ BitVec 32) V!33273 V!33273 (_ BitVec 32) Int) ListLongMap!12437)

(assert (=> b!958577 (= lt!430458 (contains!5335 (getCurrentListMap!3467 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28140 _keys!1668) i!793)))))

(declare-fun b!958578 () Bool)

(declare-fun e!540405 () Bool)

(declare-fun e!540404 () Bool)

(declare-fun mapRes!33805 () Bool)

(assert (=> b!958578 (= e!540405 (and e!540404 mapRes!33805))))

(declare-fun condMapEmpty!33805 () Bool)

(declare-fun mapDefault!33805 () ValueCell!10127)

