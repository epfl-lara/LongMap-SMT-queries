; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82356 () Bool)

(assert start!82356)

(declare-fun b_free!18623 () Bool)

(declare-fun b_next!18623 () Bool)

(assert (=> start!82356 (= b_free!18623 (not b_next!18623))))

(declare-fun tp!64839 () Bool)

(declare-fun b_and!30111 () Bool)

(assert (=> start!82356 (= tp!64839 b_and!30111)))

(declare-fun mapIsEmpty!33982 () Bool)

(declare-fun mapRes!33982 () Bool)

(assert (=> mapIsEmpty!33982 mapRes!33982))

(declare-fun b!960233 () Bool)

(declare-fun res!642767 () Bool)

(declare-fun e!541287 () Bool)

(assert (=> b!960233 (=> (not res!642767) (not e!541287))))

(declare-datatypes ((array!58761 0))(
  ( (array!58762 (arr!28254 (Array (_ BitVec 32) (_ BitVec 64))) (size!28733 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58761)

(declare-datatypes ((List!19648 0))(
  ( (Nil!19645) (Cons!19644 (h!20806 (_ BitVec 64)) (t!28011 List!19648)) )
))
(declare-fun arrayNoDuplicates!0 (array!58761 (_ BitVec 32) List!19648) Bool)

(assert (=> b!960233 (= res!642767 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19645))))

(declare-fun b!960234 () Bool)

(declare-fun res!642765 () Bool)

(assert (=> b!960234 (=> (not res!642765) (not e!541287))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960234 (= res!642765 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28733 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28733 _keys!1668))))))

(declare-fun b!960235 () Bool)

(declare-fun res!642762 () Bool)

(assert (=> b!960235 (=> (not res!642762) (not e!541287))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58761 (_ BitVec 32)) Bool)

(assert (=> b!960235 (= res!642762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!642763 () Bool)

(assert (=> start!82356 (=> (not res!642763) (not e!541287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82356 (= res!642763 (validMask!0 mask!2088))))

(assert (=> start!82356 e!541287))

(assert (=> start!82356 true))

(declare-fun tp_is_empty!21335 () Bool)

(assert (=> start!82356 tp_is_empty!21335))

(declare-fun array_inv!21895 (array!58761) Bool)

(assert (=> start!82356 (array_inv!21895 _keys!1668)))

(declare-datatypes ((V!33429 0))(
  ( (V!33430 (val!10718 Int)) )
))
(declare-datatypes ((ValueCell!10186 0))(
  ( (ValueCellFull!10186 (v!13275 V!33429)) (EmptyCell!10186) )
))
(declare-datatypes ((array!58763 0))(
  ( (array!58764 (arr!28255 (Array (_ BitVec 32) ValueCell!10186)) (size!28734 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58763)

(declare-fun e!541288 () Bool)

(declare-fun array_inv!21896 (array!58763) Bool)

(assert (=> start!82356 (and (array_inv!21896 _values!1386) e!541288)))

(assert (=> start!82356 tp!64839))

(declare-fun b!960236 () Bool)

(assert (=> b!960236 (= e!541287 false)))

(declare-fun minValue!1328 () V!33429)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33429)

(declare-fun lt!430626 () Bool)

(declare-datatypes ((tuple2!13828 0))(
  ( (tuple2!13829 (_1!6925 (_ BitVec 64)) (_2!6925 V!33429)) )
))
(declare-datatypes ((List!19649 0))(
  ( (Nil!19646) (Cons!19645 (h!20807 tuple2!13828) (t!28012 List!19649)) )
))
(declare-datatypes ((ListLongMap!12525 0))(
  ( (ListLongMap!12526 (toList!6278 List!19649)) )
))
(declare-fun contains!5377 (ListLongMap!12525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3511 (array!58761 array!58763 (_ BitVec 32) (_ BitVec 32) V!33429 V!33429 (_ BitVec 32) Int) ListLongMap!12525)

(assert (=> b!960236 (= lt!430626 (contains!5377 (getCurrentListMap!3511 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28254 _keys!1668) i!793)))))

(declare-fun b!960237 () Bool)

(declare-fun e!541289 () Bool)

(assert (=> b!960237 (= e!541289 tp_is_empty!21335)))

(declare-fun b!960238 () Bool)

(declare-fun e!541286 () Bool)

(assert (=> b!960238 (= e!541286 tp_is_empty!21335)))

(declare-fun b!960239 () Bool)

(declare-fun res!642766 () Bool)

(assert (=> b!960239 (=> (not res!642766) (not e!541287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960239 (= res!642766 (validKeyInArray!0 (select (arr!28254 _keys!1668) i!793)))))

(declare-fun b!960240 () Bool)

(assert (=> b!960240 (= e!541288 (and e!541286 mapRes!33982))))

(declare-fun condMapEmpty!33982 () Bool)

(declare-fun mapDefault!33982 () ValueCell!10186)

