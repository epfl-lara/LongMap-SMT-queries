; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112218 () Bool)

(assert start!112218)

(declare-fun b_free!30613 () Bool)

(declare-fun b_next!30613 () Bool)

(assert (=> start!112218 (= b_free!30613 (not b_next!30613))))

(declare-fun tp!107475 () Bool)

(declare-fun b_and!49281 () Bool)

(assert (=> start!112218 (= tp!107475 b_and!49281)))

(declare-fun mapIsEmpty!56458 () Bool)

(declare-fun mapRes!56458 () Bool)

(assert (=> mapIsEmpty!56458 mapRes!56458))

(declare-fun mapNonEmpty!56458 () Bool)

(declare-fun tp!107476 () Bool)

(declare-fun e!757797 () Bool)

(assert (=> mapNonEmpty!56458 (= mapRes!56458 (and tp!107476 e!757797))))

(declare-datatypes ((V!53801 0))(
  ( (V!53802 (val!18336 Int)) )
))
(declare-datatypes ((ValueCell!17363 0))(
  ( (ValueCellFull!17363 (v!20973 V!53801)) (EmptyCell!17363) )
))
(declare-datatypes ((array!89938 0))(
  ( (array!89939 (arr!43435 (Array (_ BitVec 32) ValueCell!17363)) (size!43985 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89938)

(declare-fun mapValue!56458 () ValueCell!17363)

(declare-fun mapKey!56458 () (_ BitVec 32))

(declare-fun mapRest!56458 () (Array (_ BitVec 32) ValueCell!17363))

(assert (=> mapNonEmpty!56458 (= (arr!43435 _values!1320) (store mapRest!56458 mapKey!56458 mapValue!56458))))

(declare-fun b!1329209 () Bool)

(declare-fun res!881939 () Bool)

(declare-fun e!757800 () Bool)

(assert (=> b!1329209 (=> (not res!881939) (not e!757800))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329209 (= res!881939 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329210 () Bool)

(declare-fun res!881938 () Bool)

(assert (=> b!1329210 (=> (not res!881938) (not e!757800))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!89940 0))(
  ( (array!89941 (arr!43436 (Array (_ BitVec 32) (_ BitVec 64))) (size!43986 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89940)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1329210 (= res!881938 (not (= (select (arr!43436 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1329211 () Bool)

(declare-fun e!757798 () Bool)

(declare-fun tp_is_empty!36523 () Bool)

(assert (=> b!1329211 (= e!757798 tp_is_empty!36523)))

(declare-fun b!1329212 () Bool)

(declare-fun res!881936 () Bool)

(assert (=> b!1329212 (=> (not res!881936) (not e!757800))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89940 (_ BitVec 32)) Bool)

(assert (=> b!1329212 (= res!881936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329213 () Bool)

(assert (=> b!1329213 (= e!757797 tp_is_empty!36523)))

(declare-fun res!881933 () Bool)

(assert (=> start!112218 (=> (not res!881933) (not e!757800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112218 (= res!881933 (validMask!0 mask!1998))))

(assert (=> start!112218 e!757800))

(declare-fun e!757799 () Bool)

(declare-fun array_inv!32773 (array!89938) Bool)

(assert (=> start!112218 (and (array_inv!32773 _values!1320) e!757799)))

(assert (=> start!112218 true))

(declare-fun array_inv!32774 (array!89940) Bool)

(assert (=> start!112218 (array_inv!32774 _keys!1590)))

(assert (=> start!112218 tp!107475))

(assert (=> start!112218 tp_is_empty!36523))

(declare-fun b!1329214 () Bool)

(declare-fun res!881932 () Bool)

(assert (=> b!1329214 (=> (not res!881932) (not e!757800))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53801)

(declare-fun zeroValue!1262 () V!53801)

(declare-datatypes ((tuple2!23606 0))(
  ( (tuple2!23607 (_1!11814 (_ BitVec 64)) (_2!11814 V!53801)) )
))
(declare-datatypes ((List!30761 0))(
  ( (Nil!30758) (Cons!30757 (h!31966 tuple2!23606) (t!44787 List!30761)) )
))
(declare-datatypes ((ListLongMap!21263 0))(
  ( (ListLongMap!21264 (toList!10647 List!30761)) )
))
(declare-fun contains!8811 (ListLongMap!21263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5637 (array!89940 array!89938 (_ BitVec 32) (_ BitVec 32) V!53801 V!53801 (_ BitVec 32) Int) ListLongMap!21263)

(assert (=> b!1329214 (= res!881932 (contains!8811 (getCurrentListMap!5637 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1329215 () Bool)

(assert (=> b!1329215 (= e!757799 (and e!757798 mapRes!56458))))

(declare-fun condMapEmpty!56458 () Bool)

(declare-fun mapDefault!56458 () ValueCell!17363)

