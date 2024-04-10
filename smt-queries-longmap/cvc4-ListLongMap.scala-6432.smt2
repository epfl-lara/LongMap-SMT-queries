; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82392 () Bool)

(assert start!82392)

(declare-fun b_free!18659 () Bool)

(declare-fun b_next!18659 () Bool)

(assert (=> start!82392 (= b_free!18659 (not b_next!18659))))

(declare-fun tp!64947 () Bool)

(declare-fun b_and!30147 () Bool)

(assert (=> start!82392 (= tp!64947 b_and!30147)))

(declare-fun b!960719 () Bool)

(declare-fun res!643088 () Bool)

(declare-fun e!541560 () Bool)

(assert (=> b!960719 (=> (not res!643088) (not e!541560))))

(declare-datatypes ((array!58831 0))(
  ( (array!58832 (arr!28289 (Array (_ BitVec 32) (_ BitVec 64))) (size!28768 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58831)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960719 (= res!643088 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28768 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28768 _keys!1668))))))

(declare-fun b!960720 () Bool)

(declare-fun e!541559 () Bool)

(declare-fun tp_is_empty!21371 () Bool)

(assert (=> b!960720 (= e!541559 tp_is_empty!21371)))

(declare-fun b!960721 () Bool)

(declare-fun res!643091 () Bool)

(assert (=> b!960721 (=> (not res!643091) (not e!541560))))

(declare-datatypes ((List!19672 0))(
  ( (Nil!19669) (Cons!19668 (h!20830 (_ BitVec 64)) (t!28035 List!19672)) )
))
(declare-fun arrayNoDuplicates!0 (array!58831 (_ BitVec 32) List!19672) Bool)

(assert (=> b!960721 (= res!643091 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19669))))

(declare-fun b!960722 () Bool)

(declare-fun res!643090 () Bool)

(assert (=> b!960722 (=> (not res!643090) (not e!541560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960722 (= res!643090 (validKeyInArray!0 (select (arr!28289 _keys!1668) i!793)))))

(declare-fun b!960723 () Bool)

(assert (=> b!960723 (= e!541560 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33477 0))(
  ( (V!33478 (val!10736 Int)) )
))
(declare-fun minValue!1328 () V!33477)

(declare-fun lt!430680 () Bool)

(declare-datatypes ((ValueCell!10204 0))(
  ( (ValueCellFull!10204 (v!13293 V!33477)) (EmptyCell!10204) )
))
(declare-datatypes ((array!58833 0))(
  ( (array!58834 (arr!28290 (Array (_ BitVec 32) ValueCell!10204)) (size!28769 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58833)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33477)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((tuple2!13850 0))(
  ( (tuple2!13851 (_1!6936 (_ BitVec 64)) (_2!6936 V!33477)) )
))
(declare-datatypes ((List!19673 0))(
  ( (Nil!19670) (Cons!19669 (h!20831 tuple2!13850) (t!28036 List!19673)) )
))
(declare-datatypes ((ListLongMap!12547 0))(
  ( (ListLongMap!12548 (toList!6289 List!19673)) )
))
(declare-fun contains!5388 (ListLongMap!12547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3522 (array!58831 array!58833 (_ BitVec 32) (_ BitVec 32) V!33477 V!33477 (_ BitVec 32) Int) ListLongMap!12547)

(assert (=> b!960723 (= lt!430680 (contains!5388 (getCurrentListMap!3522 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28289 _keys!1668) i!793)))))

(declare-fun b!960724 () Bool)

(declare-fun e!541556 () Bool)

(assert (=> b!960724 (= e!541556 tp_is_empty!21371)))

(declare-fun b!960725 () Bool)

(declare-fun res!643086 () Bool)

(assert (=> b!960725 (=> (not res!643086) (not e!541560))))

(assert (=> b!960725 (= res!643086 (and (= (size!28769 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28768 _keys!1668) (size!28769 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960726 () Bool)

(declare-fun res!643089 () Bool)

(assert (=> b!960726 (=> (not res!643089) (not e!541560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58831 (_ BitVec 32)) Bool)

(assert (=> b!960726 (= res!643089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!34036 () Bool)

(declare-fun mapRes!34036 () Bool)

(assert (=> mapIsEmpty!34036 mapRes!34036))

(declare-fun b!960727 () Bool)

(declare-fun e!541558 () Bool)

(assert (=> b!960727 (= e!541558 (and e!541556 mapRes!34036))))

(declare-fun condMapEmpty!34036 () Bool)

(declare-fun mapDefault!34036 () ValueCell!10204)

