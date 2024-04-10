; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108388 () Bool)

(assert start!108388)

(declare-fun b_free!27935 () Bool)

(declare-fun b_next!27935 () Bool)

(assert (=> start!108388 (= b_free!27935 (not b_next!27935))))

(declare-fun tp!98915 () Bool)

(declare-fun b_and!45995 () Bool)

(assert (=> start!108388 (= tp!98915 b_and!45995)))

(declare-fun b!1279224 () Bool)

(declare-fun e!730880 () Bool)

(declare-fun tp_is_empty!33575 () Bool)

(assert (=> b!1279224 (= e!730880 tp_is_empty!33575)))

(declare-fun b!1279225 () Bool)

(declare-fun res!849775 () Bool)

(declare-fun e!730878 () Bool)

(assert (=> b!1279225 (=> (not res!849775) (not e!730878))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49869 0))(
  ( (V!49870 (val!16862 Int)) )
))
(declare-datatypes ((ValueCell!15889 0))(
  ( (ValueCellFull!15889 (v!19462 V!49869)) (EmptyCell!15889) )
))
(declare-datatypes ((array!84238 0))(
  ( (array!84239 (arr!40623 (Array (_ BitVec 32) ValueCell!15889)) (size!41173 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84238)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84240 0))(
  ( (array!84241 (arr!40624 (Array (_ BitVec 32) (_ BitVec 64))) (size!41174 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84240)

(assert (=> b!1279225 (= res!849775 (and (= (size!41173 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41174 _keys!1741) (size!41173 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51914 () Bool)

(declare-fun mapRes!51914 () Bool)

(assert (=> mapIsEmpty!51914 mapRes!51914))

(declare-fun res!849774 () Bool)

(assert (=> start!108388 (=> (not res!849774) (not e!730878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108388 (= res!849774 (validMask!0 mask!2175))))

(assert (=> start!108388 e!730878))

(assert (=> start!108388 tp_is_empty!33575))

(assert (=> start!108388 true))

(declare-fun e!730879 () Bool)

(declare-fun array_inv!30843 (array!84238) Bool)

(assert (=> start!108388 (and (array_inv!30843 _values!1445) e!730879)))

(declare-fun array_inv!30844 (array!84240) Bool)

(assert (=> start!108388 (array_inv!30844 _keys!1741)))

(assert (=> start!108388 tp!98915))

(declare-fun b!1279226 () Bool)

(declare-fun res!849776 () Bool)

(assert (=> b!1279226 (=> (not res!849776) (not e!730878))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279226 (= res!849776 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41174 _keys!1741))))))

(declare-fun b!1279227 () Bool)

(assert (=> b!1279227 (= e!730878 false)))

(declare-fun minValue!1387 () V!49869)

(declare-fun zeroValue!1387 () V!49869)

(declare-fun lt!575984 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21572 0))(
  ( (tuple2!21573 (_1!10797 (_ BitVec 64)) (_2!10797 V!49869)) )
))
(declare-datatypes ((List!28772 0))(
  ( (Nil!28769) (Cons!28768 (h!29977 tuple2!21572) (t!42312 List!28772)) )
))
(declare-datatypes ((ListLongMap!19229 0))(
  ( (ListLongMap!19230 (toList!9630 List!28772)) )
))
(declare-fun contains!7745 (ListLongMap!19229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4714 (array!84240 array!84238 (_ BitVec 32) (_ BitVec 32) V!49869 V!49869 (_ BitVec 32) Int) ListLongMap!19229)

(assert (=> b!1279227 (= lt!575984 (contains!7745 (getCurrentListMap!4714 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279228 () Bool)

(declare-fun res!849773 () Bool)

(assert (=> b!1279228 (=> (not res!849773) (not e!730878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84240 (_ BitVec 32)) Bool)

(assert (=> b!1279228 (= res!849773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51914 () Bool)

(declare-fun tp!98914 () Bool)

(assert (=> mapNonEmpty!51914 (= mapRes!51914 (and tp!98914 e!730880))))

(declare-fun mapKey!51914 () (_ BitVec 32))

(declare-fun mapValue!51914 () ValueCell!15889)

(declare-fun mapRest!51914 () (Array (_ BitVec 32) ValueCell!15889))

(assert (=> mapNonEmpty!51914 (= (arr!40623 _values!1445) (store mapRest!51914 mapKey!51914 mapValue!51914))))

(declare-fun b!1279229 () Bool)

(declare-fun e!730876 () Bool)

(assert (=> b!1279229 (= e!730876 tp_is_empty!33575)))

(declare-fun b!1279230 () Bool)

(assert (=> b!1279230 (= e!730879 (and e!730876 mapRes!51914))))

(declare-fun condMapEmpty!51914 () Bool)

(declare-fun mapDefault!51914 () ValueCell!15889)

