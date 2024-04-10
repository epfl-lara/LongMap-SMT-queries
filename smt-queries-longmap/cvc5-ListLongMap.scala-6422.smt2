; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82328 () Bool)

(assert start!82328)

(declare-fun b_free!18595 () Bool)

(declare-fun b_next!18595 () Bool)

(assert (=> start!82328 (= b_free!18595 (not b_next!18595))))

(declare-fun tp!64755 () Bool)

(declare-fun b_and!30083 () Bool)

(assert (=> start!82328 (= tp!64755 b_and!30083)))

(declare-fun b!959855 () Bool)

(declare-fun res!642511 () Bool)

(declare-fun e!541078 () Bool)

(assert (=> b!959855 (=> (not res!642511) (not e!541078))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58705 0))(
  ( (array!58706 (arr!28226 (Array (_ BitVec 32) (_ BitVec 64))) (size!28705 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58705)

(declare-datatypes ((V!33393 0))(
  ( (V!33394 (val!10704 Int)) )
))
(declare-datatypes ((ValueCell!10172 0))(
  ( (ValueCellFull!10172 (v!13261 V!33393)) (EmptyCell!10172) )
))
(declare-datatypes ((array!58707 0))(
  ( (array!58708 (arr!28227 (Array (_ BitVec 32) ValueCell!10172)) (size!28706 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58707)

(assert (=> b!959855 (= res!642511 (and (= (size!28706 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28705 _keys!1668) (size!28706 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959856 () Bool)

(assert (=> b!959856 (= e!541078 false)))

(declare-fun minValue!1328 () V!33393)

(declare-fun zeroValue!1328 () V!33393)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430584 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-datatypes ((tuple2!13808 0))(
  ( (tuple2!13809 (_1!6915 (_ BitVec 64)) (_2!6915 V!33393)) )
))
(declare-datatypes ((List!19627 0))(
  ( (Nil!19624) (Cons!19623 (h!20785 tuple2!13808) (t!27990 List!19627)) )
))
(declare-datatypes ((ListLongMap!12505 0))(
  ( (ListLongMap!12506 (toList!6268 List!19627)) )
))
(declare-fun contains!5367 (ListLongMap!12505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3501 (array!58705 array!58707 (_ BitVec 32) (_ BitVec 32) V!33393 V!33393 (_ BitVec 32) Int) ListLongMap!12505)

(assert (=> b!959856 (= lt!430584 (contains!5367 (getCurrentListMap!3501 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28226 _keys!1668) i!793)))))

(declare-fun res!642512 () Bool)

(assert (=> start!82328 (=> (not res!642512) (not e!541078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82328 (= res!642512 (validMask!0 mask!2088))))

(assert (=> start!82328 e!541078))

(assert (=> start!82328 true))

(declare-fun tp_is_empty!21307 () Bool)

(assert (=> start!82328 tp_is_empty!21307))

(declare-fun array_inv!21875 (array!58705) Bool)

(assert (=> start!82328 (array_inv!21875 _keys!1668)))

(declare-fun e!541076 () Bool)

(declare-fun array_inv!21876 (array!58707) Bool)

(assert (=> start!82328 (and (array_inv!21876 _values!1386) e!541076)))

(assert (=> start!82328 tp!64755))

(declare-fun b!959857 () Bool)

(declare-fun e!541077 () Bool)

(assert (=> b!959857 (= e!541077 tp_is_empty!21307)))

(declare-fun mapNonEmpty!33940 () Bool)

(declare-fun mapRes!33940 () Bool)

(declare-fun tp!64754 () Bool)

(declare-fun e!541079 () Bool)

(assert (=> mapNonEmpty!33940 (= mapRes!33940 (and tp!64754 e!541079))))

(declare-fun mapKey!33940 () (_ BitVec 32))

(declare-fun mapRest!33940 () (Array (_ BitVec 32) ValueCell!10172))

(declare-fun mapValue!33940 () ValueCell!10172)

(assert (=> mapNonEmpty!33940 (= (arr!28227 _values!1386) (store mapRest!33940 mapKey!33940 mapValue!33940))))

(declare-fun b!959858 () Bool)

(declare-fun res!642515 () Bool)

(assert (=> b!959858 (=> (not res!642515) (not e!541078))))

(declare-datatypes ((List!19628 0))(
  ( (Nil!19625) (Cons!19624 (h!20786 (_ BitVec 64)) (t!27991 List!19628)) )
))
(declare-fun arrayNoDuplicates!0 (array!58705 (_ BitVec 32) List!19628) Bool)

(assert (=> b!959858 (= res!642515 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19625))))

(declare-fun mapIsEmpty!33940 () Bool)

(assert (=> mapIsEmpty!33940 mapRes!33940))

(declare-fun b!959859 () Bool)

(declare-fun res!642513 () Bool)

(assert (=> b!959859 (=> (not res!642513) (not e!541078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58705 (_ BitVec 32)) Bool)

(assert (=> b!959859 (= res!642513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959860 () Bool)

(declare-fun res!642514 () Bool)

(assert (=> b!959860 (=> (not res!642514) (not e!541078))))

(assert (=> b!959860 (= res!642514 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28705 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28705 _keys!1668))))))

(declare-fun b!959861 () Bool)

(assert (=> b!959861 (= e!541076 (and e!541077 mapRes!33940))))

(declare-fun condMapEmpty!33940 () Bool)

(declare-fun mapDefault!33940 () ValueCell!10172)

