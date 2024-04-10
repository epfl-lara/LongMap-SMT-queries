; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113388 () Bool)

(assert start!113388)

(declare-fun b_free!31439 () Bool)

(declare-fun b_next!31439 () Bool)

(assert (=> start!113388 (= b_free!31439 (not b_next!31439))))

(declare-fun tp!110122 () Bool)

(declare-fun b_and!50727 () Bool)

(assert (=> start!113388 (= tp!110122 b_and!50727)))

(declare-fun b!1346010 () Bool)

(declare-fun e!765853 () Bool)

(declare-fun tp_is_empty!37439 () Bool)

(assert (=> b!1346010 (= e!765853 tp_is_empty!37439)))

(declare-fun b!1346011 () Bool)

(declare-fun res!893156 () Bool)

(declare-fun e!765852 () Bool)

(assert (=> b!1346011 (=> (not res!893156) (not e!765852))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91718 0))(
  ( (array!91719 (arr!44315 (Array (_ BitVec 32) (_ BitVec 64))) (size!44865 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91718)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346011 (= res!893156 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44865 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346012 () Bool)

(assert (=> b!1346012 (= e!765852 false)))

(declare-datatypes ((V!55021 0))(
  ( (V!55022 (val!18794 Int)) )
))
(declare-fun minValue!1245 () V!55021)

(declare-fun zeroValue!1245 () V!55021)

(declare-datatypes ((ValueCell!17821 0))(
  ( (ValueCellFull!17821 (v!21442 V!55021)) (EmptyCell!17821) )
))
(declare-datatypes ((array!91720 0))(
  ( (array!91721 (arr!44316 (Array (_ BitVec 32) ValueCell!17821)) (size!44866 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91720)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!595461 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24230 0))(
  ( (tuple2!24231 (_1!12126 (_ BitVec 64)) (_2!12126 V!55021)) )
))
(declare-datatypes ((List!31385 0))(
  ( (Nil!31382) (Cons!31381 (h!32590 tuple2!24230) (t!45975 List!31385)) )
))
(declare-datatypes ((ListLongMap!21887 0))(
  ( (ListLongMap!21888 (toList!10959 List!31385)) )
))
(declare-fun contains!9135 (ListLongMap!21887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5911 (array!91718 array!91720 (_ BitVec 32) (_ BitVec 32) V!55021 V!55021 (_ BitVec 32) Int) ListLongMap!21887)

(assert (=> b!1346012 (= lt!595461 (contains!9135 (getCurrentListMap!5911 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1346013 () Bool)

(declare-fun e!765851 () Bool)

(assert (=> b!1346013 (= e!765851 tp_is_empty!37439)))

(declare-fun res!893158 () Bool)

(assert (=> start!113388 (=> (not res!893158) (not e!765852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113388 (= res!893158 (validMask!0 mask!1977))))

(assert (=> start!113388 e!765852))

(assert (=> start!113388 tp_is_empty!37439))

(assert (=> start!113388 true))

(declare-fun array_inv!33393 (array!91718) Bool)

(assert (=> start!113388 (array_inv!33393 _keys!1571)))

(declare-fun e!765850 () Bool)

(declare-fun array_inv!33394 (array!91720) Bool)

(assert (=> start!113388 (and (array_inv!33394 _values!1303) e!765850)))

(assert (=> start!113388 tp!110122))

(declare-fun b!1346014 () Bool)

(declare-fun res!893160 () Bool)

(assert (=> b!1346014 (=> (not res!893160) (not e!765852))))

(declare-datatypes ((List!31386 0))(
  ( (Nil!31383) (Cons!31382 (h!32591 (_ BitVec 64)) (t!45976 List!31386)) )
))
(declare-fun arrayNoDuplicates!0 (array!91718 (_ BitVec 32) List!31386) Bool)

(assert (=> b!1346014 (= res!893160 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31383))))

(declare-fun b!1346015 () Bool)

(declare-fun mapRes!57865 () Bool)

(assert (=> b!1346015 (= e!765850 (and e!765853 mapRes!57865))))

(declare-fun condMapEmpty!57865 () Bool)

(declare-fun mapDefault!57865 () ValueCell!17821)

