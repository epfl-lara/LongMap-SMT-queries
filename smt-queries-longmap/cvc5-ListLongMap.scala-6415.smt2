; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82286 () Bool)

(assert start!82286)

(declare-fun b_free!18559 () Bool)

(declare-fun b_next!18559 () Bool)

(assert (=> start!82286 (= b_free!18559 (not b_next!18559))))

(declare-fun tp!64637 () Bool)

(declare-fun b_and!30047 () Bool)

(assert (=> start!82286 (= tp!64637 b_and!30047)))

(declare-fun mapIsEmpty!33877 () Bool)

(declare-fun mapRes!33877 () Bool)

(assert (=> mapIsEmpty!33877 mapRes!33877))

(declare-fun mapNonEmpty!33877 () Bool)

(declare-fun tp!64638 () Bool)

(declare-fun e!540765 () Bool)

(assert (=> mapNonEmpty!33877 (= mapRes!33877 (and tp!64638 e!540765))))

(declare-datatypes ((V!33337 0))(
  ( (V!33338 (val!10683 Int)) )
))
(declare-datatypes ((ValueCell!10151 0))(
  ( (ValueCellFull!10151 (v!13240 V!33337)) (EmptyCell!10151) )
))
(declare-fun mapRest!33877 () (Array (_ BitVec 32) ValueCell!10151))

(declare-datatypes ((array!58625 0))(
  ( (array!58626 (arr!28186 (Array (_ BitVec 32) ValueCell!10151)) (size!28665 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58625)

(declare-fun mapKey!33877 () (_ BitVec 32))

(declare-fun mapValue!33877 () ValueCell!10151)

(assert (=> mapNonEmpty!33877 (= (arr!28186 _values!1386) (store mapRest!33877 mapKey!33877 mapValue!33877))))

(declare-fun b!959272 () Bool)

(declare-fun res!642121 () Bool)

(declare-fun e!540764 () Bool)

(assert (=> b!959272 (=> (not res!642121) (not e!540764))))

(declare-datatypes ((array!58627 0))(
  ( (array!58628 (arr!28187 (Array (_ BitVec 32) (_ BitVec 64))) (size!28666 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58627)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58627 (_ BitVec 32)) Bool)

(assert (=> b!959272 (= res!642121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959273 () Bool)

(declare-fun e!540763 () Bool)

(declare-fun tp_is_empty!21265 () Bool)

(assert (=> b!959273 (= e!540763 tp_is_empty!21265)))

(declare-fun b!959274 () Bool)

(declare-fun res!642116 () Bool)

(assert (=> b!959274 (=> (not res!642116) (not e!540764))))

(declare-datatypes ((List!19598 0))(
  ( (Nil!19595) (Cons!19594 (h!20756 (_ BitVec 64)) (t!27961 List!19598)) )
))
(declare-fun arrayNoDuplicates!0 (array!58627 (_ BitVec 32) List!19598) Bool)

(assert (=> b!959274 (= res!642116 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19595))))

(declare-fun b!959275 () Bool)

(assert (=> b!959275 (= e!540764 (not true))))

(declare-fun minValue!1328 () V!33337)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33337)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((tuple2!13780 0))(
  ( (tuple2!13781 (_1!6901 (_ BitVec 64)) (_2!6901 V!33337)) )
))
(declare-datatypes ((List!19599 0))(
  ( (Nil!19596) (Cons!19595 (h!20757 tuple2!13780) (t!27962 List!19599)) )
))
(declare-datatypes ((ListLongMap!12477 0))(
  ( (ListLongMap!12478 (toList!6254 List!19599)) )
))
(declare-fun contains!5355 (ListLongMap!12477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3487 (array!58627 array!58625 (_ BitVec 32) (_ BitVec 32) V!33337 V!33337 (_ BitVec 32) Int) ListLongMap!12477)

(assert (=> b!959275 (contains!5355 (getCurrentListMap!3487 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28187 _keys!1668) i!793))))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((Unit!32183 0))(
  ( (Unit!32184) )
))
(declare-fun lt!430530 () Unit!32183)

(declare-fun lemmaInListMapFromThenInFromSmaller!13 (array!58627 array!58625 (_ BitVec 32) (_ BitVec 32) V!33337 V!33337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32183)

(assert (=> b!959275 (= lt!430530 (lemmaInListMapFromThenInFromSmaller!13 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959276 () Bool)

(assert (=> b!959276 (= e!540765 tp_is_empty!21265)))

(declare-fun b!959277 () Bool)

(declare-fun res!642118 () Bool)

(assert (=> b!959277 (=> (not res!642118) (not e!540764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959277 (= res!642118 (validKeyInArray!0 (select (arr!28187 _keys!1668) i!793)))))

(declare-fun res!642122 () Bool)

(assert (=> start!82286 (=> (not res!642122) (not e!540764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82286 (= res!642122 (validMask!0 mask!2088))))

(assert (=> start!82286 e!540764))

(assert (=> start!82286 true))

(assert (=> start!82286 tp_is_empty!21265))

(declare-fun array_inv!21851 (array!58627) Bool)

(assert (=> start!82286 (array_inv!21851 _keys!1668)))

(declare-fun e!540762 () Bool)

(declare-fun array_inv!21852 (array!58625) Bool)

(assert (=> start!82286 (and (array_inv!21852 _values!1386) e!540762)))

(assert (=> start!82286 tp!64637))

(declare-fun b!959278 () Bool)

(declare-fun res!642120 () Bool)

(assert (=> b!959278 (=> (not res!642120) (not e!540764))))

(assert (=> b!959278 (= res!642120 (contains!5355 (getCurrentListMap!3487 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28187 _keys!1668) i!793)))))

(declare-fun b!959279 () Bool)

(declare-fun res!642117 () Bool)

(assert (=> b!959279 (=> (not res!642117) (not e!540764))))

(assert (=> b!959279 (= res!642117 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28666 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28666 _keys!1668))))))

(declare-fun b!959280 () Bool)

(declare-fun res!642119 () Bool)

(assert (=> b!959280 (=> (not res!642119) (not e!540764))))

(assert (=> b!959280 (= res!642119 (and (= (size!28665 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28666 _keys!1668) (size!28665 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959281 () Bool)

(assert (=> b!959281 (= e!540762 (and e!540763 mapRes!33877))))

(declare-fun condMapEmpty!33877 () Bool)

(declare-fun mapDefault!33877 () ValueCell!10151)

