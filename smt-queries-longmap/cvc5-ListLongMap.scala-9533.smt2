; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113060 () Bool)

(assert start!113060)

(declare-fun b_free!31111 () Bool)

(declare-fun b_next!31111 () Bool)

(assert (=> start!113060 (= b_free!31111 (not b_next!31111))))

(declare-fun tp!109138 () Bool)

(declare-fun b_and!50141 () Bool)

(assert (=> start!113060 (= tp!109138 b_and!50141)))

(declare-fun b!1340052 () Bool)

(declare-fun e!763310 () Bool)

(assert (=> b!1340052 (= e!763310 false)))

(declare-datatypes ((V!54585 0))(
  ( (V!54586 (val!18630 Int)) )
))
(declare-fun minValue!1245 () V!54585)

(declare-fun lt!593961 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91076 0))(
  ( (array!91077 (arr!43994 (Array (_ BitVec 32) (_ BitVec 64))) (size!44544 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91076)

(declare-fun zeroValue!1245 () V!54585)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17657 0))(
  ( (ValueCellFull!17657 (v!21278 V!54585)) (EmptyCell!17657) )
))
(declare-datatypes ((array!91078 0))(
  ( (array!91079 (arr!43995 (Array (_ BitVec 32) ValueCell!17657)) (size!44545 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91078)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23974 0))(
  ( (tuple2!23975 (_1!11998 (_ BitVec 64)) (_2!11998 V!54585)) )
))
(declare-datatypes ((List!31141 0))(
  ( (Nil!31138) (Cons!31137 (h!32346 tuple2!23974) (t!45473 List!31141)) )
))
(declare-datatypes ((ListLongMap!21631 0))(
  ( (ListLongMap!21632 (toList!10831 List!31141)) )
))
(declare-fun contains!9007 (ListLongMap!21631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5800 (array!91076 array!91078 (_ BitVec 32) (_ BitVec 32) V!54585 V!54585 (_ BitVec 32) Int) ListLongMap!21631)

(assert (=> b!1340052 (= lt!593961 (contains!9007 (getCurrentListMap!5800 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1340053 () Bool)

(declare-fun e!763313 () Bool)

(declare-fun e!763311 () Bool)

(declare-fun mapRes!57373 () Bool)

(assert (=> b!1340053 (= e!763313 (and e!763311 mapRes!57373))))

(declare-fun condMapEmpty!57373 () Bool)

(declare-fun mapDefault!57373 () ValueCell!17657)

