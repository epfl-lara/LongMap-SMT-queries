; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81918 () Bool)

(assert start!81918)

(declare-fun b_free!18413 () Bool)

(declare-fun b_next!18413 () Bool)

(assert (=> start!81918 (= b_free!18413 (not b_next!18413))))

(declare-fun tp!63939 () Bool)

(declare-fun b_and!29899 () Bool)

(assert (=> start!81918 (= tp!63939 b_and!29899)))

(declare-fun b!955497 () Bool)

(declare-fun res!639859 () Bool)

(declare-fun e!538286 () Bool)

(assert (=> b!955497 (=> (not res!639859) (not e!538286))))

(declare-datatypes ((array!58019 0))(
  ( (array!58020 (arr!27889 (Array (_ BitVec 32) (_ BitVec 64))) (size!28368 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58019)

(declare-datatypes ((List!19438 0))(
  ( (Nil!19435) (Cons!19434 (h!20596 (_ BitVec 64)) (t!27799 List!19438)) )
))
(declare-fun arrayNoDuplicates!0 (array!58019 (_ BitVec 32) List!19438) Bool)

(assert (=> b!955497 (= res!639859 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19435))))

(declare-fun b!955498 () Bool)

(declare-fun res!639856 () Bool)

(assert (=> b!955498 (=> (not res!639856) (not e!538286))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32925 0))(
  ( (V!32926 (val!10529 Int)) )
))
(declare-fun zeroValue!1139 () V!32925)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9997 0))(
  ( (ValueCellFull!9997 (v!13084 V!32925)) (EmptyCell!9997) )
))
(declare-datatypes ((array!58021 0))(
  ( (array!58022 (arr!27890 (Array (_ BitVec 32) ValueCell!9997)) (size!28369 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58021)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32925)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13664 0))(
  ( (tuple2!13665 (_1!6843 (_ BitVec 64)) (_2!6843 V!32925)) )
))
(declare-datatypes ((List!19439 0))(
  ( (Nil!19436) (Cons!19435 (h!20597 tuple2!13664) (t!27800 List!19439)) )
))
(declare-datatypes ((ListLongMap!12361 0))(
  ( (ListLongMap!12362 (toList!6196 List!19439)) )
))
(declare-fun contains!5294 (ListLongMap!12361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3429 (array!58019 array!58021 (_ BitVec 32) (_ BitVec 32) V!32925 V!32925 (_ BitVec 32) Int) ListLongMap!12361)

(assert (=> b!955498 (= res!639856 (contains!5294 (getCurrentListMap!3429 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27889 _keys!1441) i!735)))))

(declare-fun b!955499 () Bool)

(declare-fun res!639861 () Bool)

(assert (=> b!955499 (=> (not res!639861) (not e!538286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955499 (= res!639861 (validKeyInArray!0 (select (arr!27889 _keys!1441) i!735)))))

(declare-fun b!955500 () Bool)

(assert (=> b!955500 (= e!538286 (not true))))

(assert (=> b!955500 (contains!5294 (getCurrentListMap!3429 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27889 _keys!1441) i!735))))

(declare-datatypes ((Unit!32113 0))(
  ( (Unit!32114) )
))
(declare-fun lt!430013 () Unit!32113)

(declare-fun lemmaInListMapFromThenFromZero!11 (array!58019 array!58021 (_ BitVec 32) (_ BitVec 32) V!32925 V!32925 (_ BitVec 32) (_ BitVec 32) Int) Unit!32113)

(assert (=> b!955500 (= lt!430013 (lemmaInListMapFromThenFromZero!11 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955501 () Bool)

(declare-fun res!639857 () Bool)

(assert (=> b!955501 (=> (not res!639857) (not e!538286))))

(assert (=> b!955501 (= res!639857 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28368 _keys!1441))))))

(declare-fun mapIsEmpty!33397 () Bool)

(declare-fun mapRes!33397 () Bool)

(assert (=> mapIsEmpty!33397 mapRes!33397))

(declare-fun b!955503 () Bool)

(declare-fun res!639858 () Bool)

(assert (=> b!955503 (=> (not res!639858) (not e!538286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58019 (_ BitVec 32)) Bool)

(assert (=> b!955503 (= res!639858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955504 () Bool)

(declare-fun e!538287 () Bool)

(declare-fun e!538285 () Bool)

(assert (=> b!955504 (= e!538287 (and e!538285 mapRes!33397))))

(declare-fun condMapEmpty!33397 () Bool)

(declare-fun mapDefault!33397 () ValueCell!9997)

