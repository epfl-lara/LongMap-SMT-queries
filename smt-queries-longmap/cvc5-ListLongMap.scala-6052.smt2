; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78232 () Bool)

(assert start!78232)

(declare-fun b_free!16723 () Bool)

(declare-fun b_next!16723 () Bool)

(assert (=> start!78232 (= b_free!16723 (not b_next!16723))))

(declare-fun tp!58445 () Bool)

(declare-fun b_and!27299 () Bool)

(assert (=> start!78232 (= tp!58445 b_and!27299)))

(declare-fun res!615967 () Bool)

(declare-fun e!512160 () Bool)

(assert (=> start!78232 (=> (not res!615967) (not e!512160))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78232 (= res!615967 (validMask!0 mask!1756))))

(assert (=> start!78232 e!512160))

(declare-datatypes ((V!30487 0))(
  ( (V!30488 (val!9621 Int)) )
))
(declare-datatypes ((ValueCell!9089 0))(
  ( (ValueCellFull!9089 (v!12132 V!30487)) (EmptyCell!9089) )
))
(declare-datatypes ((array!54272 0))(
  ( (array!54273 (arr!26090 (Array (_ BitVec 32) ValueCell!9089)) (size!26549 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54272)

(declare-fun e!512163 () Bool)

(declare-fun array_inv!20378 (array!54272) Bool)

(assert (=> start!78232 (and (array_inv!20378 _values!1152) e!512163)))

(assert (=> start!78232 tp!58445))

(assert (=> start!78232 true))

(declare-fun tp_is_empty!19141 () Bool)

(assert (=> start!78232 tp_is_empty!19141))

(declare-datatypes ((array!54274 0))(
  ( (array!54275 (arr!26091 (Array (_ BitVec 32) (_ BitVec 64))) (size!26550 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54274)

(declare-fun array_inv!20379 (array!54274) Bool)

(assert (=> start!78232 (array_inv!20379 _keys!1386)))

(declare-fun b!913103 () Bool)

(declare-fun res!615969 () Bool)

(assert (=> b!913103 (=> (not res!615969) (not e!512160))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!913103 (= res!615969 (and (= (size!26549 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26550 _keys!1386) (size!26549 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30439 () Bool)

(declare-fun mapRes!30439 () Bool)

(declare-fun tp!58446 () Bool)

(declare-fun e!512159 () Bool)

(assert (=> mapNonEmpty!30439 (= mapRes!30439 (and tp!58446 e!512159))))

(declare-fun mapKey!30439 () (_ BitVec 32))

(declare-fun mapRest!30439 () (Array (_ BitVec 32) ValueCell!9089))

(declare-fun mapValue!30439 () ValueCell!9089)

(assert (=> mapNonEmpty!30439 (= (arr!26090 _values!1152) (store mapRest!30439 mapKey!30439 mapValue!30439))))

(declare-fun b!913104 () Bool)

(declare-fun res!615963 () Bool)

(assert (=> b!913104 (=> (not res!615963) (not e!512160))))

(declare-datatypes ((List!18326 0))(
  ( (Nil!18323) (Cons!18322 (h!19468 (_ BitVec 64)) (t!25915 List!18326)) )
))
(declare-fun arrayNoDuplicates!0 (array!54274 (_ BitVec 32) List!18326) Bool)

(assert (=> b!913104 (= res!615963 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18323))))

(declare-fun b!913105 () Bool)

(declare-fun e!512161 () Bool)

(assert (=> b!913105 (= e!512161 tp_is_empty!19141)))

(declare-fun b!913106 () Bool)

(declare-fun res!615968 () Bool)

(assert (=> b!913106 (=> (not res!615968) (not e!512160))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913106 (= res!615968 (inRange!0 i!717 mask!1756))))

(declare-fun b!913107 () Bool)

(declare-fun res!615965 () Bool)

(assert (=> b!913107 (=> (not res!615965) (not e!512160))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30487)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30487)

(declare-datatypes ((tuple2!12538 0))(
  ( (tuple2!12539 (_1!6280 (_ BitVec 64)) (_2!6280 V!30487)) )
))
(declare-datatypes ((List!18327 0))(
  ( (Nil!18324) (Cons!18323 (h!19469 tuple2!12538) (t!25916 List!18327)) )
))
(declare-datatypes ((ListLongMap!11235 0))(
  ( (ListLongMap!11236 (toList!5633 List!18327)) )
))
(declare-fun contains!4679 (ListLongMap!11235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2895 (array!54274 array!54272 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 32) Int) ListLongMap!11235)

(assert (=> b!913107 (= res!615965 (contains!4679 (getCurrentListMap!2895 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapIsEmpty!30439 () Bool)

(assert (=> mapIsEmpty!30439 mapRes!30439))

(declare-fun b!913108 () Bool)

(declare-fun res!615966 () Bool)

(assert (=> b!913108 (=> (not res!615966) (not e!512160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54274 (_ BitVec 32)) Bool)

(assert (=> b!913108 (= res!615966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913109 () Bool)

(assert (=> b!913109 (= e!512160 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26550 _keys!1386)))))))

(declare-fun arrayContainsKey!0 (array!54274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913109 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30908 0))(
  ( (Unit!30909) )
))
(declare-fun lt!410735 () Unit!30908)

(declare-fun lemmaKeyInListMapIsInArray!279 (array!54274 array!54272 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 64) Int) Unit!30908)

(assert (=> b!913109 (= lt!410735 (lemmaKeyInListMapIsInArray!279 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!913110 () Bool)

(assert (=> b!913110 (= e!512159 tp_is_empty!19141)))

(declare-fun b!913111 () Bool)

(declare-fun res!615964 () Bool)

(assert (=> b!913111 (=> (not res!615964) (not e!512160))))

(assert (=> b!913111 (= res!615964 (and (= (select (arr!26091 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913112 () Bool)

(assert (=> b!913112 (= e!512163 (and e!512161 mapRes!30439))))

(declare-fun condMapEmpty!30439 () Bool)

(declare-fun mapDefault!30439 () ValueCell!9089)

