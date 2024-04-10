; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112440 () Bool)

(assert start!112440)

(declare-fun b_free!30835 () Bool)

(declare-fun b_next!30835 () Bool)

(assert (=> start!112440 (= b_free!30835 (not b_next!30835))))

(declare-fun tp!108142 () Bool)

(declare-fun b_and!49677 () Bool)

(assert (=> start!112440 (= tp!108142 b_and!49677)))

(declare-fun b!1333089 () Bool)

(declare-fun res!884641 () Bool)

(declare-fun e!759465 () Bool)

(assert (=> b!1333089 (=> (not res!884641) (not e!759465))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90364 0))(
  ( (array!90365 (arr!43648 (Array (_ BitVec 32) (_ BitVec 64))) (size!44198 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90364)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1333089 (= res!884641 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44198 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333090 () Bool)

(declare-fun res!884643 () Bool)

(assert (=> b!1333090 (=> (not res!884643) (not e!759465))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90364 (_ BitVec 32)) Bool)

(assert (=> b!1333090 (= res!884643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333091 () Bool)

(assert (=> b!1333091 (= e!759465 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun b!1333092 () Bool)

(declare-fun res!884640 () Bool)

(assert (=> b!1333092 (=> (not res!884640) (not e!759465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333092 (= res!884640 (validKeyInArray!0 (select (arr!43648 _keys!1590) from!1980)))))

(declare-fun b!1333093 () Bool)

(declare-fun res!884644 () Bool)

(assert (=> b!1333093 (=> (not res!884644) (not e!759465))))

(declare-datatypes ((V!54097 0))(
  ( (V!54098 (val!18447 Int)) )
))
(declare-datatypes ((ValueCell!17474 0))(
  ( (ValueCellFull!17474 (v!21084 V!54097)) (EmptyCell!17474) )
))
(declare-datatypes ((array!90366 0))(
  ( (array!90367 (arr!43649 (Array (_ BitVec 32) ValueCell!17474)) (size!44199 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90366)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54097)

(declare-fun zeroValue!1262 () V!54097)

(declare-datatypes ((tuple2!23776 0))(
  ( (tuple2!23777 (_1!11899 (_ BitVec 64)) (_2!11899 V!54097)) )
))
(declare-datatypes ((List!30920 0))(
  ( (Nil!30917) (Cons!30916 (h!32125 tuple2!23776) (t!45118 List!30920)) )
))
(declare-datatypes ((ListLongMap!21433 0))(
  ( (ListLongMap!21434 (toList!10732 List!30920)) )
))
(declare-fun contains!8896 (ListLongMap!21433 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5713 (array!90364 array!90366 (_ BitVec 32) (_ BitVec 32) V!54097 V!54097 (_ BitVec 32) Int) ListLongMap!21433)

(assert (=> b!1333093 (= res!884644 (contains!8896 (getCurrentListMap!5713 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1333094 () Bool)

(declare-fun e!759463 () Bool)

(declare-fun e!759464 () Bool)

(declare-fun mapRes!56791 () Bool)

(assert (=> b!1333094 (= e!759463 (and e!759464 mapRes!56791))))

(declare-fun condMapEmpty!56791 () Bool)

(declare-fun mapDefault!56791 () ValueCell!17474)

