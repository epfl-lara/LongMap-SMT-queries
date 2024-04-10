; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81966 () Bool)

(assert start!81966)

(declare-fun mapNonEmpty!33469 () Bool)

(declare-fun mapRes!33469 () Bool)

(declare-fun tp!64047 () Bool)

(declare-fun e!538648 () Bool)

(assert (=> mapNonEmpty!33469 (= mapRes!33469 (and tp!64047 e!538648))))

(declare-datatypes ((V!32989 0))(
  ( (V!32990 (val!10553 Int)) )
))
(declare-datatypes ((ValueCell!10021 0))(
  ( (ValueCellFull!10021 (v!13108 V!32989)) (EmptyCell!10021) )
))
(declare-fun mapValue!33469 () ValueCell!10021)

(declare-fun mapKey!33469 () (_ BitVec 32))

(declare-datatypes ((array!58109 0))(
  ( (array!58110 (arr!27934 (Array (_ BitVec 32) ValueCell!10021)) (size!28413 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58109)

(declare-fun mapRest!33469 () (Array (_ BitVec 32) ValueCell!10021))

(assert (=> mapNonEmpty!33469 (= (arr!27934 _values!1197) (store mapRest!33469 mapKey!33469 mapValue!33469))))

(declare-fun b!956077 () Bool)

(declare-fun res!640219 () Bool)

(declare-fun e!538645 () Bool)

(assert (=> b!956077 (=> (not res!640219) (not e!538645))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58111 0))(
  ( (array!58112 (arr!27935 (Array (_ BitVec 32) (_ BitVec 64))) (size!28414 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58111)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956077 (= res!640219 (and (= (size!28413 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28414 _keys!1441) (size!28413 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956078 () Bool)

(assert (=> b!956078 (= e!538645 false)))

(declare-fun lt!430085 () Bool)

(declare-datatypes ((List!19466 0))(
  ( (Nil!19463) (Cons!19462 (h!20624 (_ BitVec 64)) (t!27827 List!19466)) )
))
(declare-fun arrayNoDuplicates!0 (array!58111 (_ BitVec 32) List!19466) Bool)

(assert (=> b!956078 (= lt!430085 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19463))))

(declare-fun b!956079 () Bool)

(declare-fun tp_is_empty!21005 () Bool)

(assert (=> b!956079 (= e!538648 tp_is_empty!21005)))

(declare-fun b!956080 () Bool)

(declare-fun e!538647 () Bool)

(assert (=> b!956080 (= e!538647 tp_is_empty!21005)))

(declare-fun res!640220 () Bool)

(assert (=> start!81966 (=> (not res!640220) (not e!538645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81966 (= res!640220 (validMask!0 mask!1823))))

(assert (=> start!81966 e!538645))

(assert (=> start!81966 true))

(declare-fun e!538646 () Bool)

(declare-fun array_inv!21677 (array!58109) Bool)

(assert (=> start!81966 (and (array_inv!21677 _values!1197) e!538646)))

(declare-fun array_inv!21678 (array!58111) Bool)

(assert (=> start!81966 (array_inv!21678 _keys!1441)))

(declare-fun mapIsEmpty!33469 () Bool)

(assert (=> mapIsEmpty!33469 mapRes!33469))

(declare-fun b!956081 () Bool)

(assert (=> b!956081 (= e!538646 (and e!538647 mapRes!33469))))

(declare-fun condMapEmpty!33469 () Bool)

(declare-fun mapDefault!33469 () ValueCell!10021)

