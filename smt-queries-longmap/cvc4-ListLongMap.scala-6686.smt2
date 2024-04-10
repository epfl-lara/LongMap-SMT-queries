; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84092 () Bool)

(assert start!84092)

(declare-fun mapNonEmpty!36371 () Bool)

(declare-fun mapRes!36371 () Bool)

(declare-fun tp!69055 () Bool)

(declare-fun e!554264 () Bool)

(assert (=> mapNonEmpty!36371 (= mapRes!36371 (and tp!69055 e!554264))))

(declare-fun mapKey!36371 () (_ BitVec 32))

(declare-datatypes ((V!35509 0))(
  ( (V!35510 (val!11498 Int)) )
))
(declare-datatypes ((ValueCell!10966 0))(
  ( (ValueCellFull!10966 (v!14060 V!35509)) (EmptyCell!10966) )
))
(declare-datatypes ((array!61779 0))(
  ( (array!61780 (arr!29747 (Array (_ BitVec 32) ValueCell!10966)) (size!30226 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61779)

(declare-fun mapValue!36371 () ValueCell!10966)

(declare-fun mapRest!36371 () (Array (_ BitVec 32) ValueCell!10966))

(assert (=> mapNonEmpty!36371 (= (arr!29747 _values!1278) (store mapRest!36371 mapKey!36371 mapValue!36371))))

(declare-fun res!658037 () Bool)

(declare-fun e!554261 () Bool)

(assert (=> start!84092 (=> (not res!658037) (not e!554261))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84092 (= res!658037 (validMask!0 mask!1948))))

(assert (=> start!84092 e!554261))

(assert (=> start!84092 true))

(declare-fun e!554265 () Bool)

(declare-fun array_inv!23001 (array!61779) Bool)

(assert (=> start!84092 (and (array_inv!23001 _values!1278) e!554265)))

(declare-datatypes ((array!61781 0))(
  ( (array!61782 (arr!29748 (Array (_ BitVec 32) (_ BitVec 64))) (size!30227 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61781)

(declare-fun array_inv!23002 (array!61781) Bool)

(assert (=> start!84092 (array_inv!23002 _keys!1544)))

(declare-fun b!983320 () Bool)

(declare-fun res!658036 () Bool)

(assert (=> b!983320 (=> (not res!658036) (not e!554261))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983320 (= res!658036 (and (= (size!30226 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30227 _keys!1544) (size!30226 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983321 () Bool)

(declare-fun tp_is_empty!22895 () Bool)

(assert (=> b!983321 (= e!554264 tp_is_empty!22895)))

(declare-fun b!983322 () Bool)

(declare-fun e!554262 () Bool)

(assert (=> b!983322 (= e!554262 tp_is_empty!22895)))

(declare-fun b!983323 () Bool)

(assert (=> b!983323 (= e!554261 false)))

(declare-fun lt!436499 () Bool)

(declare-datatypes ((List!20608 0))(
  ( (Nil!20605) (Cons!20604 (h!21766 (_ BitVec 64)) (t!29399 List!20608)) )
))
(declare-fun arrayNoDuplicates!0 (array!61781 (_ BitVec 32) List!20608) Bool)

(assert (=> b!983323 (= lt!436499 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20605))))

(declare-fun b!983324 () Bool)

(assert (=> b!983324 (= e!554265 (and e!554262 mapRes!36371))))

(declare-fun condMapEmpty!36371 () Bool)

(declare-fun mapDefault!36371 () ValueCell!10966)

