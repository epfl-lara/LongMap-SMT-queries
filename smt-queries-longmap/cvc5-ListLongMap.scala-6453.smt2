; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82558 () Bool)

(assert start!82558)

(declare-fun b_free!18691 () Bool)

(declare-fun b_next!18691 () Bool)

(assert (=> start!82558 (= b_free!18691 (not b_next!18691))))

(declare-fun tp!65192 () Bool)

(declare-fun b_and!30179 () Bool)

(assert (=> start!82558 (= tp!65192 b_and!30179)))

(declare-fun b!962114 () Bool)

(declare-fun e!542570 () Bool)

(assert (=> b!962114 (= e!542570 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33641 0))(
  ( (V!33642 (val!10797 Int)) )
))
(declare-datatypes ((ValueCell!10265 0))(
  ( (ValueCellFull!10265 (v!13355 V!33641)) (EmptyCell!10265) )
))
(declare-datatypes ((array!59083 0))(
  ( (array!59084 (arr!28410 (Array (_ BitVec 32) ValueCell!10265)) (size!28889 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59083)

(declare-datatypes ((array!59085 0))(
  ( (array!59086 (arr!28411 (Array (_ BitVec 32) (_ BitVec 64))) (size!28890 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59085)

(declare-fun minValue!1342 () V!33641)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun lt!430840 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33641)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13868 0))(
  ( (tuple2!13869 (_1!6945 (_ BitVec 64)) (_2!6945 V!33641)) )
))
(declare-datatypes ((List!19717 0))(
  ( (Nil!19714) (Cons!19713 (h!20875 tuple2!13868) (t!28080 List!19717)) )
))
(declare-datatypes ((ListLongMap!12565 0))(
  ( (ListLongMap!12566 (toList!6298 List!19717)) )
))
(declare-fun contains!5401 (ListLongMap!12565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3531 (array!59085 array!59083 (_ BitVec 32) (_ BitVec 32) V!33641 V!33641 (_ BitVec 32) Int) ListLongMap!12565)

(assert (=> b!962114 (= lt!430840 (contains!5401 (getCurrentListMap!3531 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28411 _keys!1686) i!803)))))

(declare-fun b!962115 () Bool)

(declare-fun e!542569 () Bool)

(declare-fun tp_is_empty!21493 () Bool)

(assert (=> b!962115 (= e!542569 tp_is_empty!21493)))

(declare-fun b!962116 () Bool)

(declare-fun res!643873 () Bool)

(assert (=> b!962116 (=> (not res!643873) (not e!542570))))

(declare-datatypes ((List!19718 0))(
  ( (Nil!19715) (Cons!19714 (h!20876 (_ BitVec 64)) (t!28081 List!19718)) )
))
(declare-fun arrayNoDuplicates!0 (array!59085 (_ BitVec 32) List!19718) Bool)

(assert (=> b!962116 (= res!643873 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19715))))

(declare-fun b!962117 () Bool)

(declare-fun res!643869 () Bool)

(assert (=> b!962117 (=> (not res!643869) (not e!542570))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962117 (= res!643869 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28890 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28890 _keys!1686))))))

(declare-fun b!962118 () Bool)

(declare-fun e!542566 () Bool)

(assert (=> b!962118 (= e!542566 tp_is_empty!21493)))

(declare-fun b!962119 () Bool)

(declare-fun e!542568 () Bool)

(declare-fun mapRes!34234 () Bool)

(assert (=> b!962119 (= e!542568 (and e!542566 mapRes!34234))))

(declare-fun condMapEmpty!34234 () Bool)

(declare-fun mapDefault!34234 () ValueCell!10265)

