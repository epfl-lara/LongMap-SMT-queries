; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131806 () Bool)

(assert start!131806)

(declare-fun mapIsEmpty!58396 () Bool)

(declare-fun mapRes!58396 () Bool)

(assert (=> mapIsEmpty!58396 mapRes!58396))

(declare-fun b!1543209 () Bool)

(declare-fun res!1058879 () Bool)

(declare-fun e!858772 () Bool)

(assert (=> b!1543209 (=> (not res!1058879) (not e!858772))))

(declare-datatypes ((array!102816 0))(
  ( (array!102817 (arr!49610 (Array (_ BitVec 32) (_ BitVec 64))) (size!50160 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102816)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102816 (_ BitVec 32)) Bool)

(assert (=> b!1543209 (= res!1058879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58396 () Bool)

(declare-fun tp!110923 () Bool)

(declare-fun e!858770 () Bool)

(assert (=> mapNonEmpty!58396 (= mapRes!58396 (and tp!110923 e!858770))))

(declare-fun mapKey!58396 () (_ BitVec 32))

(declare-datatypes ((V!58837 0))(
  ( (V!58838 (val!18975 Int)) )
))
(declare-datatypes ((ValueCell!17987 0))(
  ( (ValueCellFull!17987 (v!21776 V!58837)) (EmptyCell!17987) )
))
(declare-datatypes ((array!102818 0))(
  ( (array!102819 (arr!49611 (Array (_ BitVec 32) ValueCell!17987)) (size!50161 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102818)

(declare-fun mapValue!58396 () ValueCell!17987)

(declare-fun mapRest!58396 () (Array (_ BitVec 32) ValueCell!17987))

(assert (=> mapNonEmpty!58396 (= (arr!49611 _values!470) (store mapRest!58396 mapKey!58396 mapValue!58396))))

(declare-fun b!1543210 () Bool)

(assert (=> b!1543210 (= e!858772 false)))

(declare-fun lt!665945 () Bool)

(declare-datatypes ((List!35911 0))(
  ( (Nil!35908) (Cons!35907 (h!37352 (_ BitVec 64)) (t!50605 List!35911)) )
))
(declare-fun arrayNoDuplicates!0 (array!102816 (_ BitVec 32) List!35911) Bool)

(assert (=> b!1543210 (= lt!665945 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35908))))

(declare-fun b!1543211 () Bool)

(declare-fun res!1058878 () Bool)

(assert (=> b!1543211 (=> (not res!1058878) (not e!858772))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543211 (= res!1058878 (and (= (size!50161 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50160 _keys!618) (size!50161 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543212 () Bool)

(declare-fun tp_is_empty!37795 () Bool)

(assert (=> b!1543212 (= e!858770 tp_is_empty!37795)))

(declare-fun res!1058880 () Bool)

(assert (=> start!131806 (=> (not res!1058880) (not e!858772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131806 (= res!1058880 (validMask!0 mask!926))))

(assert (=> start!131806 e!858772))

(assert (=> start!131806 true))

(declare-fun e!858774 () Bool)

(declare-fun array_inv!38597 (array!102818) Bool)

(assert (=> start!131806 (and (array_inv!38597 _values!470) e!858774)))

(declare-fun array_inv!38598 (array!102816) Bool)

(assert (=> start!131806 (array_inv!38598 _keys!618)))

(declare-fun b!1543213 () Bool)

(declare-fun e!858771 () Bool)

(assert (=> b!1543213 (= e!858771 tp_is_empty!37795)))

(declare-fun b!1543214 () Bool)

(assert (=> b!1543214 (= e!858774 (and e!858771 mapRes!58396))))

(declare-fun condMapEmpty!58396 () Bool)

(declare-fun mapDefault!58396 () ValueCell!17987)

