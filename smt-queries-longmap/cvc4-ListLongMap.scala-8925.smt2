; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108236 () Bool)

(assert start!108236)

(declare-fun b_free!27917 () Bool)

(declare-fun b_next!27917 () Bool)

(assert (=> start!108236 (= b_free!27917 (not b_next!27917))))

(declare-fun tp!98710 () Bool)

(declare-fun b_and!45977 () Bool)

(assert (=> start!108236 (= tp!98710 b_and!45977)))

(declare-fun mapIsEmpty!51737 () Bool)

(declare-fun mapRes!51737 () Bool)

(assert (=> mapIsEmpty!51737 mapRes!51737))

(declare-fun b!1278078 () Bool)

(declare-fun res!849180 () Bool)

(declare-fun e!729973 () Bool)

(assert (=> b!1278078 (=> (not res!849180) (not e!729973))))

(declare-datatypes ((array!84022 0))(
  ( (array!84023 (arr!40520 (Array (_ BitVec 32) (_ BitVec 64))) (size!41070 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84022)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84022 (_ BitVec 32)) Bool)

(assert (=> b!1278078 (= res!849180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278079 () Bool)

(declare-fun e!729974 () Bool)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1278079 (= e!729974 (ite (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1278080 () Bool)

(declare-fun arrayContainsKey!0 (array!84022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278080 (= e!729974 (arrayContainsKey!0 _keys!1427 k!1053 #b00000000000000000000000000000000))))

(declare-fun res!849182 () Bool)

(assert (=> start!108236 (=> (not res!849182) (not e!729973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108236 (= res!849182 (validMask!0 mask!1805))))

(assert (=> start!108236 e!729973))

(assert (=> start!108236 true))

(assert (=> start!108236 tp!98710))

(declare-fun tp_is_empty!33467 () Bool)

(assert (=> start!108236 tp_is_empty!33467))

(declare-datatypes ((V!49725 0))(
  ( (V!49726 (val!16808 Int)) )
))
(declare-datatypes ((ValueCell!15835 0))(
  ( (ValueCellFull!15835 (v!19407 V!49725)) (EmptyCell!15835) )
))
(declare-datatypes ((array!84024 0))(
  ( (array!84025 (arr!40521 (Array (_ BitVec 32) ValueCell!15835)) (size!41071 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84024)

(declare-fun e!729972 () Bool)

(declare-fun array_inv!30779 (array!84024) Bool)

(assert (=> start!108236 (and (array_inv!30779 _values!1187) e!729972)))

(declare-fun array_inv!30780 (array!84022) Bool)

(assert (=> start!108236 (array_inv!30780 _keys!1427)))

(declare-fun b!1278081 () Bool)

(declare-fun res!849183 () Bool)

(assert (=> b!1278081 (=> (not res!849183) (not e!729973))))

(assert (=> b!1278081 (= res!849183 (and (= (size!41071 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41070 _keys!1427) (size!41071 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1278082 () Bool)

(declare-fun e!729971 () Bool)

(assert (=> b!1278082 (= e!729971 tp_is_empty!33467)))

(declare-fun b!1278083 () Bool)

(declare-fun res!849179 () Bool)

(assert (=> b!1278083 (=> (not res!849179) (not e!729973))))

(assert (=> b!1278083 (= res!849179 (bvslt #b00000000000000000000000000000000 (size!41070 _keys!1427)))))

(declare-fun b!1278084 () Bool)

(declare-fun res!849181 () Bool)

(assert (=> b!1278084 (=> (not res!849181) (not e!729973))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49725)

(declare-fun zeroValue!1129 () V!49725)

(declare-datatypes ((tuple2!21558 0))(
  ( (tuple2!21559 (_1!10790 (_ BitVec 64)) (_2!10790 V!49725)) )
))
(declare-datatypes ((List!28734 0))(
  ( (Nil!28731) (Cons!28730 (h!29939 tuple2!21558) (t!42274 List!28734)) )
))
(declare-datatypes ((ListLongMap!19215 0))(
  ( (ListLongMap!19216 (toList!9623 List!28734)) )
))
(declare-fun contains!7734 (ListLongMap!19215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4707 (array!84022 array!84024 (_ BitVec 32) (_ BitVec 32) V!49725 V!49725 (_ BitVec 32) Int) ListLongMap!19215)

(assert (=> b!1278084 (= res!849181 (contains!7734 (getCurrentListMap!4707 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1278085 () Bool)

(assert (=> b!1278085 (= e!729973 (not true))))

(assert (=> b!1278085 e!729974))

(declare-fun c!124026 () Bool)

(assert (=> b!1278085 (= c!124026 (and (not (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!42383 0))(
  ( (Unit!42384) )
))
(declare-fun lt!575845 () Unit!42383)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!631 (array!84022 array!84024 (_ BitVec 32) (_ BitVec 32) V!49725 V!49725 (_ BitVec 64) (_ BitVec 32) Int) Unit!42383)

(assert (=> b!1278085 (= lt!575845 (lemmaListMapContainsThenArrayContainsFrom!631 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1278086 () Bool)

(declare-fun res!849178 () Bool)

(assert (=> b!1278086 (=> (not res!849178) (not e!729973))))

(declare-datatypes ((List!28735 0))(
  ( (Nil!28732) (Cons!28731 (h!29940 (_ BitVec 64)) (t!42275 List!28735)) )
))
(declare-fun arrayNoDuplicates!0 (array!84022 (_ BitVec 32) List!28735) Bool)

(assert (=> b!1278086 (= res!849178 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28732))))

(declare-fun b!1278087 () Bool)

(assert (=> b!1278087 (= e!729972 (and e!729971 mapRes!51737))))

(declare-fun condMapEmpty!51737 () Bool)

(declare-fun mapDefault!51737 () ValueCell!15835)

