; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82304 () Bool)

(assert start!82304)

(declare-fun b_free!18577 () Bool)

(declare-fun b_next!18577 () Bool)

(assert (=> start!82304 (= b_free!18577 (not b_next!18577))))

(declare-fun tp!64692 () Bool)

(declare-fun b_and!30065 () Bool)

(assert (=> start!82304 (= tp!64692 b_and!30065)))

(declare-fun b!959542 () Bool)

(declare-fun res!642306 () Bool)

(declare-fun e!540900 () Bool)

(assert (=> b!959542 (=> (not res!642306) (not e!540900))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33361 0))(
  ( (V!33362 (val!10692 Int)) )
))
(declare-fun minValue!1328 () V!33361)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58659 0))(
  ( (array!58660 (arr!28203 (Array (_ BitVec 32) (_ BitVec 64))) (size!28682 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58659)

(declare-datatypes ((ValueCell!10160 0))(
  ( (ValueCellFull!10160 (v!13249 V!33361)) (EmptyCell!10160) )
))
(declare-datatypes ((array!58661 0))(
  ( (array!58662 (arr!28204 (Array (_ BitVec 32) ValueCell!10160)) (size!28683 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58661)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33361)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13794 0))(
  ( (tuple2!13795 (_1!6908 (_ BitVec 64)) (_2!6908 V!33361)) )
))
(declare-datatypes ((List!19613 0))(
  ( (Nil!19610) (Cons!19609 (h!20771 tuple2!13794) (t!27976 List!19613)) )
))
(declare-datatypes ((ListLongMap!12491 0))(
  ( (ListLongMap!12492 (toList!6261 List!19613)) )
))
(declare-fun contains!5362 (ListLongMap!12491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3494 (array!58659 array!58661 (_ BitVec 32) (_ BitVec 32) V!33361 V!33361 (_ BitVec 32) Int) ListLongMap!12491)

(assert (=> b!959542 (= res!642306 (contains!5362 (getCurrentListMap!3494 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28203 _keys!1668) i!793)))))

(declare-fun b!959543 () Bool)

(declare-fun e!540899 () Bool)

(declare-fun e!540896 () Bool)

(declare-fun mapRes!33904 () Bool)

(assert (=> b!959543 (= e!540899 (and e!540896 mapRes!33904))))

(declare-fun condMapEmpty!33904 () Bool)

(declare-fun mapDefault!33904 () ValueCell!10160)

