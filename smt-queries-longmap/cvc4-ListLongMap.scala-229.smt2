; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4060 () Bool)

(assert start!4060)

(declare-fun b_free!965 () Bool)

(declare-fun b_next!965 () Bool)

(assert (=> start!4060 (= b_free!965 (not b_next!965))))

(declare-fun tp!4315 () Bool)

(declare-fun b_and!1775 () Bool)

(assert (=> start!4060 (= tp!4315 b_and!1775)))

(declare-fun mapNonEmpty!1507 () Bool)

(declare-fun mapRes!1507 () Bool)

(declare-fun tp!4314 () Bool)

(declare-fun e!19250 () Bool)

(assert (=> mapNonEmpty!1507 (= mapRes!1507 (and tp!4314 e!19250))))

(declare-datatypes ((V!1583 0))(
  ( (V!1584 (val!686 Int)) )
))
(declare-datatypes ((ValueCell!460 0))(
  ( (ValueCellFull!460 (v!1775 V!1583)) (EmptyCell!460) )
))
(declare-datatypes ((array!1869 0))(
  ( (array!1870 (arr!888 (Array (_ BitVec 32) ValueCell!460)) (size!989 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1869)

(declare-fun mapValue!1507 () ValueCell!460)

(declare-fun mapKey!1507 () (_ BitVec 32))

(declare-fun mapRest!1507 () (Array (_ BitVec 32) ValueCell!460))

(assert (=> mapNonEmpty!1507 (= (arr!888 _values!1501) (store mapRest!1507 mapKey!1507 mapValue!1507))))

(declare-fun b!29865 () Bool)

(declare-fun res!17945 () Bool)

(declare-fun e!19249 () Bool)

(assert (=> b!29865 (=> (not res!17945) (not e!19249))))

(declare-datatypes ((array!1871 0))(
  ( (array!1872 (arr!889 (Array (_ BitVec 32) (_ BitVec 64))) (size!990 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1871)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1871 (_ BitVec 32)) Bool)

(assert (=> b!29865 (= res!17945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17941 () Bool)

(assert (=> start!4060 (=> (not res!17941) (not e!19249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4060 (= res!17941 (validMask!0 mask!2294))))

(assert (=> start!4060 e!19249))

(assert (=> start!4060 true))

(assert (=> start!4060 tp!4315))

(declare-fun e!19248 () Bool)

(declare-fun array_inv!619 (array!1869) Bool)

(assert (=> start!4060 (and (array_inv!619 _values!1501) e!19248)))

(declare-fun array_inv!620 (array!1871) Bool)

(assert (=> start!4060 (array_inv!620 _keys!1833)))

(declare-fun tp_is_empty!1319 () Bool)

(assert (=> start!4060 tp_is_empty!1319))

(declare-fun b!29866 () Bool)

(declare-fun res!17946 () Bool)

(assert (=> b!29866 (=> (not res!17946) (not e!19249))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1583)

(declare-fun minValue!1443 () V!1583)

(declare-datatypes ((tuple2!1138 0))(
  ( (tuple2!1139 (_1!580 (_ BitVec 64)) (_2!580 V!1583)) )
))
(declare-datatypes ((List!735 0))(
  ( (Nil!732) (Cons!731 (h!1298 tuple2!1138) (t!3428 List!735)) )
))
(declare-datatypes ((ListLongMap!715 0))(
  ( (ListLongMap!716 (toList!373 List!735)) )
))
(declare-fun contains!313 (ListLongMap!715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!201 (array!1871 array!1869 (_ BitVec 32) (_ BitVec 32) V!1583 V!1583 (_ BitVec 32) Int) ListLongMap!715)

(assert (=> b!29866 (= res!17946 (not (contains!313 (getCurrentListMap!201 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!29867 () Bool)

(declare-fun e!19247 () Bool)

(assert (=> b!29867 (= e!19248 (and e!19247 mapRes!1507))))

(declare-fun condMapEmpty!1507 () Bool)

(declare-fun mapDefault!1507 () ValueCell!460)

