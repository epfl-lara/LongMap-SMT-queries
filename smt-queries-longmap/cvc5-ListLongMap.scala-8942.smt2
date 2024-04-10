; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108378 () Bool)

(assert start!108378)

(declare-fun b_free!27925 () Bool)

(declare-fun b_next!27925 () Bool)

(assert (=> start!108378 (= b_free!27925 (not b_next!27925))))

(declare-fun tp!98884 () Bool)

(declare-fun b_and!45985 () Bool)

(assert (=> start!108378 (= tp!98884 b_and!45985)))

(declare-fun b!1279104 () Bool)

(declare-fun res!849701 () Bool)

(declare-fun e!730804 () Bool)

(assert (=> b!1279104 (=> (not res!849701) (not e!730804))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84218 0))(
  ( (array!84219 (arr!40613 (Array (_ BitVec 32) (_ BitVec 64))) (size!41163 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84218)

(assert (=> b!1279104 (= res!849701 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41163 _keys!1741))))))

(declare-fun mapNonEmpty!51899 () Bool)

(declare-fun mapRes!51899 () Bool)

(declare-fun tp!98885 () Bool)

(declare-fun e!730802 () Bool)

(assert (=> mapNonEmpty!51899 (= mapRes!51899 (and tp!98885 e!730802))))

(declare-datatypes ((V!49857 0))(
  ( (V!49858 (val!16857 Int)) )
))
(declare-datatypes ((ValueCell!15884 0))(
  ( (ValueCellFull!15884 (v!19457 V!49857)) (EmptyCell!15884) )
))
(declare-fun mapValue!51899 () ValueCell!15884)

(declare-datatypes ((array!84220 0))(
  ( (array!84221 (arr!40614 (Array (_ BitVec 32) ValueCell!15884)) (size!41164 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84220)

(declare-fun mapRest!51899 () (Array (_ BitVec 32) ValueCell!15884))

(declare-fun mapKey!51899 () (_ BitVec 32))

(assert (=> mapNonEmpty!51899 (= (arr!40614 _values!1445) (store mapRest!51899 mapKey!51899 mapValue!51899))))

(declare-fun b!1279105 () Bool)

(declare-fun res!849697 () Bool)

(assert (=> b!1279105 (=> (not res!849697) (not e!730804))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279105 (= res!849697 (and (= (size!41164 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41163 _keys!1741) (size!41164 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279106 () Bool)

(declare-fun e!730805 () Bool)

(declare-fun e!730803 () Bool)

(assert (=> b!1279106 (= e!730805 (and e!730803 mapRes!51899))))

(declare-fun condMapEmpty!51899 () Bool)

(declare-fun mapDefault!51899 () ValueCell!15884)

