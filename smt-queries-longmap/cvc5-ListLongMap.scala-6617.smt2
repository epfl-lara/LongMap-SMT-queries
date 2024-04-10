; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83644 () Bool)

(assert start!83644)

(declare-fun b!977060 () Bool)

(declare-fun e!550731 () Bool)

(declare-fun tp_is_empty!22477 () Bool)

(assert (=> b!977060 (= e!550731 tp_is_empty!22477)))

(declare-fun b!977061 () Bool)

(declare-fun e!550728 () Bool)

(assert (=> b!977061 (= e!550728 tp_is_empty!22477)))

(declare-fun res!653975 () Bool)

(declare-fun e!550729 () Bool)

(assert (=> start!83644 (=> (not res!653975) (not e!550729))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83644 (= res!653975 (validMask!0 mask!1948))))

(assert (=> start!83644 e!550729))

(assert (=> start!83644 true))

(declare-datatypes ((V!34953 0))(
  ( (V!34954 (val!11289 Int)) )
))
(declare-datatypes ((ValueCell!10757 0))(
  ( (ValueCellFull!10757 (v!13850 V!34953)) (EmptyCell!10757) )
))
(declare-datatypes ((array!60983 0))(
  ( (array!60984 (arr!29352 (Array (_ BitVec 32) ValueCell!10757)) (size!29831 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60983)

(declare-fun e!550730 () Bool)

(declare-fun array_inv!22691 (array!60983) Bool)

(assert (=> start!83644 (and (array_inv!22691 _values!1278) e!550730)))

(declare-datatypes ((array!60985 0))(
  ( (array!60986 (arr!29353 (Array (_ BitVec 32) (_ BitVec 64))) (size!29832 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60985)

(declare-fun array_inv!22692 (array!60985) Bool)

(assert (=> start!83644 (array_inv!22692 _keys!1544)))

(declare-fun b!977062 () Bool)

(declare-fun res!653974 () Bool)

(assert (=> b!977062 (=> (not res!653974) (not e!550729))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977062 (= res!653974 (and (= (size!29831 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29832 _keys!1544) (size!29831 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35735 () Bool)

(declare-fun mapRes!35735 () Bool)

(declare-fun tp!67987 () Bool)

(assert (=> mapNonEmpty!35735 (= mapRes!35735 (and tp!67987 e!550728))))

(declare-fun mapRest!35735 () (Array (_ BitVec 32) ValueCell!10757))

(declare-fun mapKey!35735 () (_ BitVec 32))

(declare-fun mapValue!35735 () ValueCell!10757)

(assert (=> mapNonEmpty!35735 (= (arr!29352 _values!1278) (store mapRest!35735 mapKey!35735 mapValue!35735))))

(declare-fun b!977063 () Bool)

(assert (=> b!977063 (= e!550729 (and (bvsle #b00000000000000000000000000000000 (size!29832 _keys!1544)) (bvsge (size!29832 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!977064 () Bool)

(assert (=> b!977064 (= e!550730 (and e!550731 mapRes!35735))))

(declare-fun condMapEmpty!35735 () Bool)

(declare-fun mapDefault!35735 () ValueCell!10757)

