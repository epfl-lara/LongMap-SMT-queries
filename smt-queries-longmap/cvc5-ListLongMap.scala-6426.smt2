; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82352 () Bool)

(assert start!82352)

(declare-fun b_free!18619 () Bool)

(declare-fun b_next!18619 () Bool)

(assert (=> start!82352 (= b_free!18619 (not b_next!18619))))

(declare-fun tp!64826 () Bool)

(declare-fun b_and!30107 () Bool)

(assert (=> start!82352 (= tp!64826 b_and!30107)))

(declare-fun b!960179 () Bool)

(declare-fun res!642726 () Bool)

(declare-fun e!541259 () Bool)

(assert (=> b!960179 (=> (not res!642726) (not e!541259))))

(declare-datatypes ((array!58753 0))(
  ( (array!58754 (arr!28250 (Array (_ BitVec 32) (_ BitVec 64))) (size!28729 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58753)

(declare-datatypes ((List!19644 0))(
  ( (Nil!19641) (Cons!19640 (h!20802 (_ BitVec 64)) (t!28007 List!19644)) )
))
(declare-fun arrayNoDuplicates!0 (array!58753 (_ BitVec 32) List!19644) Bool)

(assert (=> b!960179 (= res!642726 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19641))))

(declare-fun b!960180 () Bool)

(assert (=> b!960180 (= e!541259 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33425 0))(
  ( (V!33426 (val!10716 Int)) )
))
(declare-fun minValue!1328 () V!33425)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10184 0))(
  ( (ValueCellFull!10184 (v!13273 V!33425)) (EmptyCell!10184) )
))
(declare-datatypes ((array!58755 0))(
  ( (array!58756 (arr!28251 (Array (_ BitVec 32) ValueCell!10184)) (size!28730 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58755)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33425)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430620 () Bool)

(declare-datatypes ((tuple2!13824 0))(
  ( (tuple2!13825 (_1!6923 (_ BitVec 64)) (_2!6923 V!33425)) )
))
(declare-datatypes ((List!19645 0))(
  ( (Nil!19642) (Cons!19641 (h!20803 tuple2!13824) (t!28008 List!19645)) )
))
(declare-datatypes ((ListLongMap!12521 0))(
  ( (ListLongMap!12522 (toList!6276 List!19645)) )
))
(declare-fun contains!5375 (ListLongMap!12521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3509 (array!58753 array!58755 (_ BitVec 32) (_ BitVec 32) V!33425 V!33425 (_ BitVec 32) Int) ListLongMap!12521)

(assert (=> b!960180 (= lt!430620 (contains!5375 (getCurrentListMap!3509 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28250 _keys!1668) i!793)))))

(declare-fun b!960181 () Bool)

(declare-fun res!642731 () Bool)

(assert (=> b!960181 (=> (not res!642731) (not e!541259))))

(assert (=> b!960181 (= res!642731 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28729 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28729 _keys!1668))))))

(declare-fun b!960182 () Bool)

(declare-fun e!541260 () Bool)

(declare-fun tp_is_empty!21331 () Bool)

(assert (=> b!960182 (= e!541260 tp_is_empty!21331)))

(declare-fun res!642728 () Bool)

(assert (=> start!82352 (=> (not res!642728) (not e!541259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82352 (= res!642728 (validMask!0 mask!2088))))

(assert (=> start!82352 e!541259))

(assert (=> start!82352 true))

(assert (=> start!82352 tp_is_empty!21331))

(declare-fun array_inv!21891 (array!58753) Bool)

(assert (=> start!82352 (array_inv!21891 _keys!1668)))

(declare-fun e!541257 () Bool)

(declare-fun array_inv!21892 (array!58755) Bool)

(assert (=> start!82352 (and (array_inv!21892 _values!1386) e!541257)))

(assert (=> start!82352 tp!64826))

(declare-fun mapIsEmpty!33976 () Bool)

(declare-fun mapRes!33976 () Bool)

(assert (=> mapIsEmpty!33976 mapRes!33976))

(declare-fun b!960183 () Bool)

(assert (=> b!960183 (= e!541257 (and e!541260 mapRes!33976))))

(declare-fun condMapEmpty!33976 () Bool)

(declare-fun mapDefault!33976 () ValueCell!10184)

