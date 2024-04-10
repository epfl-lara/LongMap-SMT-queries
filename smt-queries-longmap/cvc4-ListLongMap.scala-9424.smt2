; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112156 () Bool)

(assert start!112156)

(declare-fun b_free!30551 () Bool)

(declare-fun b_next!30551 () Bool)

(assert (=> start!112156 (= b_free!30551 (not b_next!30551))))

(declare-fun tp!107290 () Bool)

(declare-fun b_and!49201 () Bool)

(assert (=> start!112156 (= tp!107290 b_and!49201)))

(declare-fun b!1328304 () Bool)

(declare-fun e!757335 () Bool)

(assert (=> b!1328304 (= e!757335 false)))

(declare-datatypes ((V!53717 0))(
  ( (V!53718 (val!18305 Int)) )
))
(declare-datatypes ((ValueCell!17332 0))(
  ( (ValueCellFull!17332 (v!20942 V!53717)) (EmptyCell!17332) )
))
(declare-datatypes ((array!89816 0))(
  ( (array!89817 (arr!43374 (Array (_ BitVec 32) ValueCell!17332)) (size!43924 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89816)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89818 0))(
  ( (array!89819 (arr!43375 (Array (_ BitVec 32) (_ BitVec 64))) (size!43925 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89818)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!590824 () Bool)

(declare-fun minValue!1262 () V!53717)

(declare-fun zeroValue!1262 () V!53717)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23560 0))(
  ( (tuple2!23561 (_1!11791 (_ BitVec 64)) (_2!11791 V!53717)) )
))
(declare-datatypes ((List!30716 0))(
  ( (Nil!30713) (Cons!30712 (h!31921 tuple2!23560) (t!44722 List!30716)) )
))
(declare-datatypes ((ListLongMap!21217 0))(
  ( (ListLongMap!21218 (toList!10624 List!30716)) )
))
(declare-fun contains!8788 (ListLongMap!21217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5615 (array!89818 array!89816 (_ BitVec 32) (_ BitVec 32) V!53717 V!53717 (_ BitVec 32) Int) ListLongMap!21217)

(assert (=> b!1328304 (= lt!590824 (contains!8788 (getCurrentListMap!5615 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1328305 () Bool)

(declare-fun e!757336 () Bool)

(declare-fun tp_is_empty!36461 () Bool)

(assert (=> b!1328305 (= e!757336 tp_is_empty!36461)))

(declare-fun b!1328306 () Bool)

(declare-fun res!881325 () Bool)

(assert (=> b!1328306 (=> (not res!881325) (not e!757335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89818 (_ BitVec 32)) Bool)

(assert (=> b!1328306 (= res!881325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881324 () Bool)

(assert (=> start!112156 (=> (not res!881324) (not e!757335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112156 (= res!881324 (validMask!0 mask!1998))))

(assert (=> start!112156 e!757335))

(declare-fun e!757332 () Bool)

(declare-fun array_inv!32729 (array!89816) Bool)

(assert (=> start!112156 (and (array_inv!32729 _values!1320) e!757332)))

(assert (=> start!112156 true))

(declare-fun array_inv!32730 (array!89818) Bool)

(assert (=> start!112156 (array_inv!32730 _keys!1590)))

(assert (=> start!112156 tp!107290))

(assert (=> start!112156 tp_is_empty!36461))

(declare-fun b!1328307 () Bool)

(declare-fun e!757334 () Bool)

(assert (=> b!1328307 (= e!757334 tp_is_empty!36461)))

(declare-fun b!1328308 () Bool)

(declare-fun res!881326 () Bool)

(assert (=> b!1328308 (=> (not res!881326) (not e!757335))))

(assert (=> b!1328308 (= res!881326 (and (= (size!43924 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43925 _keys!1590) (size!43924 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328309 () Bool)

(declare-fun res!881327 () Bool)

(assert (=> b!1328309 (=> (not res!881327) (not e!757335))))

(assert (=> b!1328309 (= res!881327 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43925 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56365 () Bool)

(declare-fun mapRes!56365 () Bool)

(declare-fun tp!107289 () Bool)

(assert (=> mapNonEmpty!56365 (= mapRes!56365 (and tp!107289 e!757336))))

(declare-fun mapKey!56365 () (_ BitVec 32))

(declare-fun mapValue!56365 () ValueCell!17332)

(declare-fun mapRest!56365 () (Array (_ BitVec 32) ValueCell!17332))

(assert (=> mapNonEmpty!56365 (= (arr!43374 _values!1320) (store mapRest!56365 mapKey!56365 mapValue!56365))))

(declare-fun b!1328310 () Bool)

(declare-fun res!881328 () Bool)

(assert (=> b!1328310 (=> (not res!881328) (not e!757335))))

(declare-datatypes ((List!30717 0))(
  ( (Nil!30714) (Cons!30713 (h!31922 (_ BitVec 64)) (t!44723 List!30717)) )
))
(declare-fun arrayNoDuplicates!0 (array!89818 (_ BitVec 32) List!30717) Bool)

(assert (=> b!1328310 (= res!881328 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30714))))

(declare-fun b!1328311 () Bool)

(assert (=> b!1328311 (= e!757332 (and e!757334 mapRes!56365))))

(declare-fun condMapEmpty!56365 () Bool)

(declare-fun mapDefault!56365 () ValueCell!17332)

