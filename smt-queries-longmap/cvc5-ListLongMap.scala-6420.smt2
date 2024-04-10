; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82316 () Bool)

(assert start!82316)

(declare-fun b_free!18583 () Bool)

(declare-fun b_next!18583 () Bool)

(assert (=> start!82316 (= b_free!18583 (not b_next!18583))))

(declare-fun tp!64718 () Bool)

(declare-fun b_and!30071 () Bool)

(assert (=> start!82316 (= tp!64718 b_and!30071)))

(declare-fun b!959693 () Bool)

(declare-fun res!642407 () Bool)

(declare-fun e!540989 () Bool)

(assert (=> b!959693 (=> (not res!642407) (not e!540989))))

(declare-datatypes ((array!58681 0))(
  ( (array!58682 (arr!28214 (Array (_ BitVec 32) (_ BitVec 64))) (size!28693 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58681)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959693 (= res!642407 (validKeyInArray!0 (select (arr!28214 _keys!1668) i!793)))))

(declare-fun b!959694 () Bool)

(declare-fun e!540987 () Bool)

(declare-fun tp_is_empty!21295 () Bool)

(assert (=> b!959694 (= e!540987 tp_is_empty!21295)))

(declare-fun b!959695 () Bool)

(declare-fun res!642403 () Bool)

(assert (=> b!959695 (=> (not res!642403) (not e!540989))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33377 0))(
  ( (V!33378 (val!10698 Int)) )
))
(declare-datatypes ((ValueCell!10166 0))(
  ( (ValueCellFull!10166 (v!13255 V!33377)) (EmptyCell!10166) )
))
(declare-datatypes ((array!58683 0))(
  ( (array!58684 (arr!28215 (Array (_ BitVec 32) ValueCell!10166)) (size!28694 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58683)

(declare-fun mask!2088 () (_ BitVec 32))

(assert (=> b!959695 (= res!642403 (and (= (size!28694 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28693 _keys!1668) (size!28694 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959696 () Bool)

(declare-fun e!540990 () Bool)

(assert (=> b!959696 (= e!540990 tp_is_empty!21295)))

(declare-fun res!642404 () Bool)

(assert (=> start!82316 (=> (not res!642404) (not e!540989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82316 (= res!642404 (validMask!0 mask!2088))))

(assert (=> start!82316 e!540989))

(assert (=> start!82316 true))

(assert (=> start!82316 tp_is_empty!21295))

(declare-fun array_inv!21867 (array!58681) Bool)

(assert (=> start!82316 (array_inv!21867 _keys!1668)))

(declare-fun e!540988 () Bool)

(declare-fun array_inv!21868 (array!58683) Bool)

(assert (=> start!82316 (and (array_inv!21868 _values!1386) e!540988)))

(assert (=> start!82316 tp!64718))

(declare-fun mapIsEmpty!33922 () Bool)

(declare-fun mapRes!33922 () Bool)

(assert (=> mapIsEmpty!33922 mapRes!33922))

(declare-fun b!959697 () Bool)

(assert (=> b!959697 (= e!540989 (bvslt i!793 #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!13798 0))(
  ( (tuple2!13799 (_1!6910 (_ BitVec 64)) (_2!6910 V!33377)) )
))
(declare-datatypes ((List!19618 0))(
  ( (Nil!19615) (Cons!19614 (h!20776 tuple2!13798) (t!27981 List!19618)) )
))
(declare-datatypes ((ListLongMap!12495 0))(
  ( (ListLongMap!12496 (toList!6263 List!19618)) )
))
(declare-fun lt!430566 () ListLongMap!12495)

(declare-fun minValue!1328 () V!33377)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33377)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun getCurrentListMap!3496 (array!58681 array!58683 (_ BitVec 32) (_ BitVec 32) V!33377 V!33377 (_ BitVec 32) Int) ListLongMap!12495)

(assert (=> b!959697 (= lt!430566 (getCurrentListMap!3496 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389))))

(declare-fun b!959698 () Bool)

(assert (=> b!959698 (= e!540988 (and e!540990 mapRes!33922))))

(declare-fun condMapEmpty!33922 () Bool)

(declare-fun mapDefault!33922 () ValueCell!10166)

