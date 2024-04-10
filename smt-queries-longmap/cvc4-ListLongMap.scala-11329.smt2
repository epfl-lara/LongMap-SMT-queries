; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131882 () Bool)

(assert start!131882)

(declare-fun mapNonEmpty!58510 () Bool)

(declare-fun mapRes!58510 () Bool)

(declare-fun tp!111037 () Bool)

(declare-fun e!859341 () Bool)

(assert (=> mapNonEmpty!58510 (= mapRes!58510 (and tp!111037 e!859341))))

(declare-datatypes ((V!58937 0))(
  ( (V!58938 (val!19013 Int)) )
))
(declare-datatypes ((ValueCell!18025 0))(
  ( (ValueCellFull!18025 (v!21814 V!58937)) (EmptyCell!18025) )
))
(declare-fun mapRest!58510 () (Array (_ BitVec 32) ValueCell!18025))

(declare-fun mapKey!58510 () (_ BitVec 32))

(declare-fun mapValue!58510 () ValueCell!18025)

(declare-datatypes ((array!102956 0))(
  ( (array!102957 (arr!49680 (Array (_ BitVec 32) ValueCell!18025)) (size!50230 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102956)

(assert (=> mapNonEmpty!58510 (= (arr!49680 _values!470) (store mapRest!58510 mapKey!58510 mapValue!58510))))

(declare-fun b!1543893 () Bool)

(declare-fun res!1059220 () Bool)

(declare-fun e!859340 () Bool)

(assert (=> b!1543893 (=> (not res!1059220) (not e!859340))))

(declare-datatypes ((array!102958 0))(
  ( (array!102959 (arr!49681 (Array (_ BitVec 32) (_ BitVec 64))) (size!50231 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102958)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1543893 (= res!1059220 (and (= (size!50230 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50231 _keys!618) (size!50230 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543894 () Bool)

(declare-fun e!859342 () Bool)

(declare-fun tp_is_empty!37871 () Bool)

(assert (=> b!1543894 (= e!859342 tp_is_empty!37871)))

(declare-fun b!1543895 () Bool)

(assert (=> b!1543895 (= e!859341 tp_is_empty!37871)))

(declare-fun b!1543896 () Bool)

(declare-fun res!1059222 () Bool)

(assert (=> b!1543896 (=> (not res!1059222) (not e!859340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102958 (_ BitVec 32)) Bool)

(assert (=> b!1543896 (= res!1059222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059221 () Bool)

(assert (=> start!131882 (=> (not res!1059221) (not e!859340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131882 (= res!1059221 (validMask!0 mask!926))))

(assert (=> start!131882 e!859340))

(assert (=> start!131882 true))

(declare-fun e!859344 () Bool)

(declare-fun array_inv!38645 (array!102956) Bool)

(assert (=> start!131882 (and (array_inv!38645 _values!470) e!859344)))

(declare-fun array_inv!38646 (array!102958) Bool)

(assert (=> start!131882 (array_inv!38646 _keys!618)))

(declare-fun mapIsEmpty!58510 () Bool)

(assert (=> mapIsEmpty!58510 mapRes!58510))

(declare-fun b!1543897 () Bool)

(assert (=> b!1543897 (= e!859344 (and e!859342 mapRes!58510))))

(declare-fun condMapEmpty!58510 () Bool)

(declare-fun mapDefault!58510 () ValueCell!18025)

