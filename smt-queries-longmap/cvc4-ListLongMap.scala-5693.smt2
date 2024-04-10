; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73946 () Bool)

(assert start!73946)

(declare-fun b_free!14861 () Bool)

(declare-fun b_next!14861 () Bool)

(assert (=> start!73946 (= b_free!14861 (not b_next!14861))))

(declare-fun tp!52086 () Bool)

(declare-fun b_and!24613 () Bool)

(assert (=> start!73946 (= tp!52086 b_and!24613)))

(declare-fun mapNonEmpty!27095 () Bool)

(declare-fun mapRes!27095 () Bool)

(declare-fun tp!52087 () Bool)

(declare-fun e!484051 () Bool)

(assert (=> mapNonEmpty!27095 (= mapRes!27095 (and tp!52087 e!484051))))

(declare-datatypes ((V!27709 0))(
  ( (V!27710 (val!8546 Int)) )
))
(declare-datatypes ((ValueCell!8059 0))(
  ( (ValueCellFull!8059 (v!10971 V!27709)) (EmptyCell!8059) )
))
(declare-fun mapValue!27095 () ValueCell!8059)

(declare-fun mapRest!27095 () (Array (_ BitVec 32) ValueCell!8059))

(declare-datatypes ((array!50142 0))(
  ( (array!50143 (arr!24102 (Array (_ BitVec 32) ValueCell!8059)) (size!24542 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50142)

(declare-fun mapKey!27095 () (_ BitVec 32))

(assert (=> mapNonEmpty!27095 (= (arr!24102 _values!688) (store mapRest!27095 mapKey!27095 mapValue!27095))))

(declare-fun b!869151 () Bool)

(declare-fun tp_is_empty!16997 () Bool)

(assert (=> b!869151 (= e!484051 tp_is_empty!16997)))

(declare-fun b!869152 () Bool)

(declare-fun res!590643 () Bool)

(declare-fun e!484049 () Bool)

(assert (=> b!869152 (=> (not res!590643) (not e!484049))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869152 (= res!590643 (validMask!0 mask!1196))))

(declare-fun res!590638 () Bool)

(assert (=> start!73946 (=> (not res!590638) (not e!484049))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50144 0))(
  ( (array!50145 (arr!24103 (Array (_ BitVec 32) (_ BitVec 64))) (size!24543 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50144)

(assert (=> start!73946 (= res!590638 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24543 _keys!868))))))

(assert (=> start!73946 e!484049))

(assert (=> start!73946 tp_is_empty!16997))

(assert (=> start!73946 true))

(assert (=> start!73946 tp!52086))

(declare-fun array_inv!19038 (array!50144) Bool)

(assert (=> start!73946 (array_inv!19038 _keys!868)))

(declare-fun e!484046 () Bool)

(declare-fun array_inv!19039 (array!50142) Bool)

(assert (=> start!73946 (and (array_inv!19039 _values!688) e!484046)))

(declare-fun b!869153 () Bool)

(declare-fun res!590644 () Bool)

(assert (=> b!869153 (=> (not res!590644) (not e!484049))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869153 (= res!590644 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24543 _keys!868))))))

(declare-fun b!869154 () Bool)

(declare-fun e!484047 () Bool)

(assert (=> b!869154 (= e!484046 (and e!484047 mapRes!27095))))

(declare-fun condMapEmpty!27095 () Bool)

(declare-fun mapDefault!27095 () ValueCell!8059)

