; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82190 () Bool)

(assert start!82190)

(declare-fun b_free!18463 () Bool)

(declare-fun b_next!18463 () Bool)

(assert (=> start!82190 (= b_free!18463 (not b_next!18463))))

(declare-fun tp!64350 () Bool)

(declare-fun b_and!29951 () Bool)

(assert (=> start!82190 (= tp!64350 b_and!29951)))

(declare-fun res!641205 () Bool)

(declare-fun e!540042 () Bool)

(assert (=> start!82190 (=> (not res!641205) (not e!540042))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82190 (= res!641205 (validMask!0 mask!2088))))

(assert (=> start!82190 e!540042))

(assert (=> start!82190 true))

(declare-fun tp_is_empty!21169 () Bool)

(assert (=> start!82190 tp_is_empty!21169))

(declare-datatypes ((array!58441 0))(
  ( (array!58442 (arr!28094 (Array (_ BitVec 32) (_ BitVec 64))) (size!28573 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58441)

(declare-fun array_inv!21791 (array!58441) Bool)

(assert (=> start!82190 (array_inv!21791 _keys!1668)))

(declare-datatypes ((V!33209 0))(
  ( (V!33210 (val!10635 Int)) )
))
(declare-datatypes ((ValueCell!10103 0))(
  ( (ValueCellFull!10103 (v!13192 V!33209)) (EmptyCell!10103) )
))
(declare-datatypes ((array!58443 0))(
  ( (array!58444 (arr!28095 (Array (_ BitVec 32) ValueCell!10103)) (size!28574 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58443)

(declare-fun e!540045 () Bool)

(declare-fun array_inv!21792 (array!58443) Bool)

(assert (=> start!82190 (and (array_inv!21792 _values!1386) e!540045)))

(assert (=> start!82190 tp!64350))

(declare-fun mapNonEmpty!33733 () Bool)

(declare-fun mapRes!33733 () Bool)

(declare-fun tp!64349 () Bool)

(declare-fun e!540043 () Bool)

(assert (=> mapNonEmpty!33733 (= mapRes!33733 (and tp!64349 e!540043))))

(declare-fun mapRest!33733 () (Array (_ BitVec 32) ValueCell!10103))

(declare-fun mapValue!33733 () ValueCell!10103)

(declare-fun mapKey!33733 () (_ BitVec 32))

(assert (=> mapNonEmpty!33733 (= (arr!28095 _values!1386) (store mapRest!33733 mapKey!33733 mapValue!33733))))

(declare-fun b!957929 () Bool)

(declare-fun res!641206 () Bool)

(assert (=> b!957929 (=> (not res!641206) (not e!540042))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957929 (= res!641206 (validKeyInArray!0 (select (arr!28094 _keys!1668) i!793)))))

(declare-fun b!957930 () Bool)

(declare-fun res!641208 () Bool)

(assert (=> b!957930 (=> (not res!641208) (not e!540042))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!957930 (= res!641208 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28573 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28573 _keys!1668))))))

(declare-fun b!957931 () Bool)

(declare-fun e!540044 () Bool)

(assert (=> b!957931 (= e!540044 tp_is_empty!21169)))

(declare-fun b!957932 () Bool)

(declare-fun res!641210 () Bool)

(assert (=> b!957932 (=> (not res!641210) (not e!540042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58441 (_ BitVec 32)) Bool)

(assert (=> b!957932 (= res!641210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33733 () Bool)

(assert (=> mapIsEmpty!33733 mapRes!33733))

(declare-fun b!957933 () Bool)

(declare-fun res!641209 () Bool)

(assert (=> b!957933 (=> (not res!641209) (not e!540042))))

(declare-datatypes ((List!19530 0))(
  ( (Nil!19527) (Cons!19526 (h!20688 (_ BitVec 64)) (t!27893 List!19530)) )
))
(declare-fun arrayNoDuplicates!0 (array!58441 (_ BitVec 32) List!19530) Bool)

(assert (=> b!957933 (= res!641209 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19527))))

(declare-fun b!957934 () Bool)

(declare-fun res!641207 () Bool)

(assert (=> b!957934 (=> (not res!641207) (not e!540042))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957934 (= res!641207 (and (= (size!28574 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28573 _keys!1668) (size!28574 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957935 () Bool)

(assert (=> b!957935 (= e!540042 false)))

(declare-fun minValue!1328 () V!33209)

(declare-fun lt!430386 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33209)

(declare-datatypes ((tuple2!13708 0))(
  ( (tuple2!13709 (_1!6865 (_ BitVec 64)) (_2!6865 V!33209)) )
))
(declare-datatypes ((List!19531 0))(
  ( (Nil!19528) (Cons!19527 (h!20689 tuple2!13708) (t!27894 List!19531)) )
))
(declare-datatypes ((ListLongMap!12405 0))(
  ( (ListLongMap!12406 (toList!6218 List!19531)) )
))
(declare-fun contains!5319 (ListLongMap!12405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3451 (array!58441 array!58443 (_ BitVec 32) (_ BitVec 32) V!33209 V!33209 (_ BitVec 32) Int) ListLongMap!12405)

(assert (=> b!957935 (= lt!430386 (contains!5319 (getCurrentListMap!3451 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28094 _keys!1668) i!793)))))

(declare-fun b!957936 () Bool)

(assert (=> b!957936 (= e!540043 tp_is_empty!21169)))

(declare-fun b!957937 () Bool)

(assert (=> b!957937 (= e!540045 (and e!540044 mapRes!33733))))

(declare-fun condMapEmpty!33733 () Bool)

(declare-fun mapDefault!33733 () ValueCell!10103)

