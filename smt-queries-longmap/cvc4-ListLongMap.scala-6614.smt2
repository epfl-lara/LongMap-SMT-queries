; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83616 () Bool)

(assert start!83616)

(declare-fun mapIsEmpty!35708 () Bool)

(declare-fun mapRes!35708 () Bool)

(assert (=> mapIsEmpty!35708 mapRes!35708))

(declare-fun b!976927 () Bool)

(declare-fun e!550603 () Bool)

(declare-fun tp_is_empty!22463 () Bool)

(assert (=> b!976927 (= e!550603 tp_is_empty!22463)))

(declare-fun b!976928 () Bool)

(declare-fun e!550605 () Bool)

(assert (=> b!976928 (= e!550605 tp_is_empty!22463)))

(declare-fun mapNonEmpty!35708 () Bool)

(declare-fun tp!67960 () Bool)

(assert (=> mapNonEmpty!35708 (= mapRes!35708 (and tp!67960 e!550605))))

(declare-datatypes ((V!34933 0))(
  ( (V!34934 (val!11282 Int)) )
))
(declare-datatypes ((ValueCell!10750 0))(
  ( (ValueCellFull!10750 (v!13843 V!34933)) (EmptyCell!10750) )
))
(declare-datatypes ((array!60953 0))(
  ( (array!60954 (arr!29339 (Array (_ BitVec 32) ValueCell!10750)) (size!29818 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60953)

(declare-fun mapRest!35708 () (Array (_ BitVec 32) ValueCell!10750))

(declare-fun mapValue!35708 () ValueCell!10750)

(declare-fun mapKey!35708 () (_ BitVec 32))

(assert (=> mapNonEmpty!35708 (= (arr!29339 _values!1278) (store mapRest!35708 mapKey!35708 mapValue!35708))))

(declare-fun b!976929 () Bool)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun e!550606 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!60955 0))(
  ( (array!60956 (arr!29340 (Array (_ BitVec 32) (_ BitVec 64))) (size!29819 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60955)

(assert (=> b!976929 (= e!550606 (and (= (size!29818 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29819 _keys!1544) (size!29818 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (not (= (size!29819 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)))))))

(declare-fun res!653925 () Bool)

(assert (=> start!83616 (=> (not res!653925) (not e!550606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83616 (= res!653925 (validMask!0 mask!1948))))

(assert (=> start!83616 e!550606))

(assert (=> start!83616 true))

(declare-fun e!550602 () Bool)

(declare-fun array_inv!22681 (array!60953) Bool)

(assert (=> start!83616 (and (array_inv!22681 _values!1278) e!550602)))

(declare-fun array_inv!22682 (array!60955) Bool)

(assert (=> start!83616 (array_inv!22682 _keys!1544)))

(declare-fun b!976926 () Bool)

(assert (=> b!976926 (= e!550602 (and e!550603 mapRes!35708))))

(declare-fun condMapEmpty!35708 () Bool)

(declare-fun mapDefault!35708 () ValueCell!10750)

