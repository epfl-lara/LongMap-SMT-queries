; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108444 () Bool)

(assert start!108444)

(declare-fun b_free!27991 () Bool)

(declare-fun b_next!27991 () Bool)

(assert (=> start!108444 (= b_free!27991 (not b_next!27991))))

(declare-fun tp!99082 () Bool)

(declare-fun b_and!46051 () Bool)

(assert (=> start!108444 (= tp!99082 b_and!46051)))

(declare-fun b!1279905 () Bool)

(declare-fun e!731298 () Bool)

(declare-fun tp_is_empty!33631 () Bool)

(assert (=> b!1279905 (= e!731298 tp_is_empty!33631)))

(declare-fun b!1279906 () Bool)

(declare-fun res!850202 () Bool)

(declare-fun e!731296 () Bool)

(assert (=> b!1279906 (=> (not res!850202) (not e!731296))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49945 0))(
  ( (V!49946 (val!16890 Int)) )
))
(declare-datatypes ((ValueCell!15917 0))(
  ( (ValueCellFull!15917 (v!19490 V!49945)) (EmptyCell!15917) )
))
(declare-datatypes ((array!84344 0))(
  ( (array!84345 (arr!40676 (Array (_ BitVec 32) ValueCell!15917)) (size!41226 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84344)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84346 0))(
  ( (array!84347 (arr!40677 (Array (_ BitVec 32) (_ BitVec 64))) (size!41227 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84346)

(assert (=> b!1279906 (= res!850202 (and (= (size!41226 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41227 _keys!1741) (size!41226 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279907 () Bool)

(declare-fun res!850205 () Bool)

(assert (=> b!1279907 (=> (not res!850205) (not e!731296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84346 (_ BitVec 32)) Bool)

(assert (=> b!1279907 (= res!850205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51998 () Bool)

(declare-fun mapRes!51998 () Bool)

(assert (=> mapIsEmpty!51998 mapRes!51998))

(declare-fun res!850204 () Bool)

(assert (=> start!108444 (=> (not res!850204) (not e!731296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108444 (= res!850204 (validMask!0 mask!2175))))

(assert (=> start!108444 e!731296))

(assert (=> start!108444 tp_is_empty!33631))

(assert (=> start!108444 true))

(declare-fun e!731299 () Bool)

(declare-fun array_inv!30875 (array!84344) Bool)

(assert (=> start!108444 (and (array_inv!30875 _values!1445) e!731299)))

(declare-fun array_inv!30876 (array!84346) Bool)

(assert (=> start!108444 (array_inv!30876 _keys!1741)))

(assert (=> start!108444 tp!99082))

(declare-fun mapNonEmpty!51998 () Bool)

(declare-fun tp!99083 () Bool)

(declare-fun e!731297 () Bool)

(assert (=> mapNonEmpty!51998 (= mapRes!51998 (and tp!99083 e!731297))))

(declare-fun mapValue!51998 () ValueCell!15917)

(declare-fun mapRest!51998 () (Array (_ BitVec 32) ValueCell!15917))

(declare-fun mapKey!51998 () (_ BitVec 32))

(assert (=> mapNonEmpty!51998 (= (arr!40676 _values!1445) (store mapRest!51998 mapKey!51998 mapValue!51998))))

(declare-fun b!1279908 () Bool)

(declare-fun res!850203 () Bool)

(assert (=> b!1279908 (=> (not res!850203) (not e!731296))))

(declare-datatypes ((List!28811 0))(
  ( (Nil!28808) (Cons!28807 (h!30016 (_ BitVec 64)) (t!42351 List!28811)) )
))
(declare-fun arrayNoDuplicates!0 (array!84346 (_ BitVec 32) List!28811) Bool)

(assert (=> b!1279908 (= res!850203 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28808))))

(declare-fun b!1279909 () Bool)

(assert (=> b!1279909 (= e!731299 (and e!731298 mapRes!51998))))

(declare-fun condMapEmpty!51998 () Bool)

(declare-fun mapDefault!51998 () ValueCell!15917)

