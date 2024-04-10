; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4216 () Bool)

(assert start!4216)

(declare-fun b_free!1121 () Bool)

(declare-fun b_next!1121 () Bool)

(assert (=> start!4216 (= b_free!1121 (not b_next!1121))))

(declare-fun tp!4782 () Bool)

(declare-fun b_and!1931 () Bool)

(assert (=> start!4216 (= tp!4782 b_and!1931)))

(declare-fun b!32187 () Bool)

(declare-fun res!19562 () Bool)

(declare-fun e!20472 () Bool)

(assert (=> b!32187 (=> (not res!19562) (not e!20472))))

(declare-datatypes ((array!2159 0))(
  ( (array!2160 (arr!1033 (Array (_ BitVec 32) (_ BitVec 64))) (size!1134 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2159)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32187 (= res!19562 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32188 () Bool)

(declare-fun res!19561 () Bool)

(assert (=> b!32188 (=> (not res!19561) (not e!20472))))

(declare-datatypes ((List!834 0))(
  ( (Nil!831) (Cons!830 (h!1397 (_ BitVec 64)) (t!3527 List!834)) )
))
(declare-fun arrayNoDuplicates!0 (array!2159 (_ BitVec 32) List!834) Bool)

(assert (=> b!32188 (= res!19561 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!831))))

(declare-fun b!32189 () Bool)

(declare-fun res!19563 () Bool)

(assert (=> b!32189 (=> (not res!19563) (not e!20472))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1791 0))(
  ( (V!1792 (val!764 Int)) )
))
(declare-datatypes ((ValueCell!538 0))(
  ( (ValueCellFull!538 (v!1853 V!1791)) (EmptyCell!538) )
))
(declare-datatypes ((array!2161 0))(
  ( (array!2162 (arr!1034 (Array (_ BitVec 32) ValueCell!538)) (size!1135 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2161)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1791)

(declare-fun minValue!1443 () V!1791)

(declare-datatypes ((tuple2!1240 0))(
  ( (tuple2!1241 (_1!631 (_ BitVec 64)) (_2!631 V!1791)) )
))
(declare-datatypes ((List!835 0))(
  ( (Nil!832) (Cons!831 (h!1398 tuple2!1240) (t!3528 List!835)) )
))
(declare-datatypes ((ListLongMap!817 0))(
  ( (ListLongMap!818 (toList!424 List!835)) )
))
(declare-fun contains!364 (ListLongMap!817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!252 (array!2159 array!2161 (_ BitVec 32) (_ BitVec 32) V!1791 V!1791 (_ BitVec 32) Int) ListLongMap!817)

(assert (=> b!32189 (= res!19563 (not (contains!364 (getCurrentListMap!252 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun mapNonEmpty!1741 () Bool)

(declare-fun mapRes!1741 () Bool)

(declare-fun tp!4783 () Bool)

(declare-fun e!20473 () Bool)

(assert (=> mapNonEmpty!1741 (= mapRes!1741 (and tp!4783 e!20473))))

(declare-fun mapKey!1741 () (_ BitVec 32))

(declare-fun mapValue!1741 () ValueCell!538)

(declare-fun mapRest!1741 () (Array (_ BitVec 32) ValueCell!538))

(assert (=> mapNonEmpty!1741 (= (arr!1034 _values!1501) (store mapRest!1741 mapKey!1741 mapValue!1741))))

(declare-fun b!32190 () Bool)

(assert (=> b!32190 (= e!20472 false)))

(declare-fun lt!11642 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2159 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32190 (= lt!11642 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32191 () Bool)

(declare-fun e!20470 () Bool)

(declare-fun e!20471 () Bool)

(assert (=> b!32191 (= e!20470 (and e!20471 mapRes!1741))))

(declare-fun condMapEmpty!1741 () Bool)

(declare-fun mapDefault!1741 () ValueCell!538)

