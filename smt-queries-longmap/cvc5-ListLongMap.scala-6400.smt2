; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82196 () Bool)

(assert start!82196)

(declare-fun b_free!18469 () Bool)

(declare-fun b_next!18469 () Bool)

(assert (=> start!82196 (= b_free!18469 (not b_next!18469))))

(declare-fun tp!64367 () Bool)

(declare-fun b_and!29957 () Bool)

(assert (=> start!82196 (= tp!64367 b_and!29957)))

(declare-fun b!958010 () Bool)

(declare-fun res!641263 () Bool)

(declare-fun e!540089 () Bool)

(assert (=> b!958010 (=> (not res!641263) (not e!540089))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58453 0))(
  ( (array!58454 (arr!28100 (Array (_ BitVec 32) (_ BitVec 64))) (size!28579 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58453)

(declare-datatypes ((V!33217 0))(
  ( (V!33218 (val!10638 Int)) )
))
(declare-datatypes ((ValueCell!10106 0))(
  ( (ValueCellFull!10106 (v!13195 V!33217)) (EmptyCell!10106) )
))
(declare-datatypes ((array!58455 0))(
  ( (array!58456 (arr!28101 (Array (_ BitVec 32) ValueCell!10106)) (size!28580 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58455)

(declare-fun mask!2088 () (_ BitVec 32))

(assert (=> b!958010 (= res!641263 (and (= (size!28580 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28579 _keys!1668) (size!28580 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33742 () Bool)

(declare-fun mapRes!33742 () Bool)

(assert (=> mapIsEmpty!33742 mapRes!33742))

(declare-fun b!958011 () Bool)

(declare-fun res!641260 () Bool)

(assert (=> b!958011 (=> (not res!641260) (not e!540089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58453 (_ BitVec 32)) Bool)

(assert (=> b!958011 (= res!641260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958012 () Bool)

(declare-fun res!641261 () Bool)

(assert (=> b!958012 (=> (not res!641261) (not e!540089))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958012 (= res!641261 (validKeyInArray!0 (select (arr!28100 _keys!1668) i!793)))))

(declare-fun res!641264 () Bool)

(assert (=> start!82196 (=> (not res!641264) (not e!540089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82196 (= res!641264 (validMask!0 mask!2088))))

(assert (=> start!82196 e!540089))

(assert (=> start!82196 true))

(declare-fun tp_is_empty!21175 () Bool)

(assert (=> start!82196 tp_is_empty!21175))

(declare-fun array_inv!21797 (array!58453) Bool)

(assert (=> start!82196 (array_inv!21797 _keys!1668)))

(declare-fun e!540088 () Bool)

(declare-fun array_inv!21798 (array!58455) Bool)

(assert (=> start!82196 (and (array_inv!21798 _values!1386) e!540088)))

(assert (=> start!82196 tp!64367))

(declare-fun mapNonEmpty!33742 () Bool)

(declare-fun tp!64368 () Bool)

(declare-fun e!540087 () Bool)

(assert (=> mapNonEmpty!33742 (= mapRes!33742 (and tp!64368 e!540087))))

(declare-fun mapValue!33742 () ValueCell!10106)

(declare-fun mapRest!33742 () (Array (_ BitVec 32) ValueCell!10106))

(declare-fun mapKey!33742 () (_ BitVec 32))

(assert (=> mapNonEmpty!33742 (= (arr!28101 _values!1386) (store mapRest!33742 mapKey!33742 mapValue!33742))))

(declare-fun b!958013 () Bool)

(assert (=> b!958013 (= e!540087 tp_is_empty!21175)))

(declare-fun b!958014 () Bool)

(assert (=> b!958014 (= e!540089 false)))

(declare-fun minValue!1328 () V!33217)

(declare-fun lt!430395 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33217)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13712 0))(
  ( (tuple2!13713 (_1!6867 (_ BitVec 64)) (_2!6867 V!33217)) )
))
(declare-datatypes ((List!19534 0))(
  ( (Nil!19531) (Cons!19530 (h!20692 tuple2!13712) (t!27897 List!19534)) )
))
(declare-datatypes ((ListLongMap!12409 0))(
  ( (ListLongMap!12410 (toList!6220 List!19534)) )
))
(declare-fun contains!5321 (ListLongMap!12409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3453 (array!58453 array!58455 (_ BitVec 32) (_ BitVec 32) V!33217 V!33217 (_ BitVec 32) Int) ListLongMap!12409)

(assert (=> b!958014 (= lt!430395 (contains!5321 (getCurrentListMap!3453 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28100 _keys!1668) i!793)))))

(declare-fun b!958015 () Bool)

(declare-fun res!641259 () Bool)

(assert (=> b!958015 (=> (not res!641259) (not e!540089))))

(declare-datatypes ((List!19535 0))(
  ( (Nil!19532) (Cons!19531 (h!20693 (_ BitVec 64)) (t!27898 List!19535)) )
))
(declare-fun arrayNoDuplicates!0 (array!58453 (_ BitVec 32) List!19535) Bool)

(assert (=> b!958015 (= res!641259 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19532))))

(declare-fun b!958016 () Bool)

(declare-fun e!540090 () Bool)

(assert (=> b!958016 (= e!540088 (and e!540090 mapRes!33742))))

(declare-fun condMapEmpty!33742 () Bool)

(declare-fun mapDefault!33742 () ValueCell!10106)

