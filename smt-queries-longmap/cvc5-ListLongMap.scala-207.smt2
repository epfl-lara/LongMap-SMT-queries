; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3924 () Bool)

(assert start!3924)

(declare-fun b_free!829 () Bool)

(declare-fun b_next!829 () Bool)

(assert (=> start!3924 (= b_free!829 (not b_next!829))))

(declare-fun tp!3907 () Bool)

(declare-fun b_and!1639 () Bool)

(assert (=> start!3924 (= tp!3907 b_and!1639)))

(declare-fun res!16504 () Bool)

(declare-fun e!18064 () Bool)

(assert (=> start!3924 (=> (not res!16504) (not e!18064))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3924 (= res!16504 (validMask!0 mask!2294))))

(assert (=> start!3924 e!18064))

(assert (=> start!3924 true))

(assert (=> start!3924 tp!3907))

(declare-datatypes ((V!1403 0))(
  ( (V!1404 (val!618 Int)) )
))
(declare-datatypes ((ValueCell!392 0))(
  ( (ValueCellFull!392 (v!1707 V!1403)) (EmptyCell!392) )
))
(declare-datatypes ((array!1607 0))(
  ( (array!1608 (arr!757 (Array (_ BitVec 32) ValueCell!392)) (size!858 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1607)

(declare-fun e!18066 () Bool)

(declare-fun array_inv!519 (array!1607) Bool)

(assert (=> start!3924 (and (array_inv!519 _values!1501) e!18066)))

(declare-datatypes ((array!1609 0))(
  ( (array!1610 (arr!758 (Array (_ BitVec 32) (_ BitVec 64))) (size!859 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1609)

(declare-fun array_inv!520 (array!1609) Bool)

(assert (=> start!3924 (array_inv!520 _keys!1833)))

(declare-fun tp_is_empty!1183 () Bool)

(assert (=> start!3924 tp_is_empty!1183))

(declare-fun b!27816 () Bool)

(declare-fun res!16507 () Bool)

(assert (=> b!27816 (=> (not res!16507) (not e!18064))))

(declare-datatypes ((List!636 0))(
  ( (Nil!633) (Cons!632 (h!1199 (_ BitVec 64)) (t!3329 List!636)) )
))
(declare-fun arrayNoDuplicates!0 (array!1609 (_ BitVec 32) List!636) Bool)

(assert (=> b!27816 (= res!16507 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!633))))

(declare-fun b!27817 () Bool)

(declare-fun res!16509 () Bool)

(assert (=> b!27817 (=> (not res!16509) (not e!18064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1609 (_ BitVec 32)) Bool)

(assert (=> b!27817 (= res!16509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27818 () Bool)

(declare-fun res!16503 () Bool)

(assert (=> b!27818 (=> (not res!16503) (not e!18064))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27818 (= res!16503 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1303 () Bool)

(declare-fun mapRes!1303 () Bool)

(declare-fun tp!3906 () Bool)

(declare-fun e!18068 () Bool)

(assert (=> mapNonEmpty!1303 (= mapRes!1303 (and tp!3906 e!18068))))

(declare-fun mapRest!1303 () (Array (_ BitVec 32) ValueCell!392))

(declare-fun mapValue!1303 () ValueCell!392)

(declare-fun mapKey!1303 () (_ BitVec 32))

(assert (=> mapNonEmpty!1303 (= (arr!757 _values!1501) (store mapRest!1303 mapKey!1303 mapValue!1303))))

(declare-fun b!27819 () Bool)

(assert (=> b!27819 (= e!18068 tp_is_empty!1183)))

(declare-fun mapIsEmpty!1303 () Bool)

(assert (=> mapIsEmpty!1303 mapRes!1303))

(declare-fun b!27820 () Bool)

(assert (=> b!27820 (= e!18064 false)))

(declare-fun lt!10718 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1609 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27820 (= lt!10718 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!27821 () Bool)

(declare-fun e!18067 () Bool)

(assert (=> b!27821 (= e!18067 tp_is_empty!1183)))

(declare-fun b!27822 () Bool)

(declare-fun res!16506 () Bool)

(assert (=> b!27822 (=> (not res!16506) (not e!18064))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1403)

(declare-fun minValue!1443 () V!1403)

(declare-datatypes ((tuple2!1034 0))(
  ( (tuple2!1035 (_1!528 (_ BitVec 64)) (_2!528 V!1403)) )
))
(declare-datatypes ((List!637 0))(
  ( (Nil!634) (Cons!633 (h!1200 tuple2!1034) (t!3330 List!637)) )
))
(declare-datatypes ((ListLongMap!611 0))(
  ( (ListLongMap!612 (toList!321 List!637)) )
))
(declare-fun contains!261 (ListLongMap!611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!151 (array!1609 array!1607 (_ BitVec 32) (_ BitVec 32) V!1403 V!1403 (_ BitVec 32) Int) ListLongMap!611)

(assert (=> b!27822 (= res!16506 (not (contains!261 (getCurrentListMap!151 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!27823 () Bool)

(assert (=> b!27823 (= e!18066 (and e!18067 mapRes!1303))))

(declare-fun condMapEmpty!1303 () Bool)

(declare-fun mapDefault!1303 () ValueCell!392)

