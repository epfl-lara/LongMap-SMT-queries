; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131792 () Bool)

(assert start!131792)

(declare-fun mapIsEmpty!58450 () Bool)

(declare-fun mapRes!58450 () Bool)

(assert (=> mapIsEmpty!58450 mapRes!58450))

(declare-fun b!1543220 () Bool)

(declare-fun e!858842 () Bool)

(declare-fun e!858845 () Bool)

(assert (=> b!1543220 (= e!858842 (and e!858845 mapRes!58450))))

(declare-fun condMapEmpty!58450 () Bool)

(declare-datatypes ((V!58885 0))(
  ( (V!58886 (val!18993 Int)) )
))
(declare-datatypes ((ValueCell!18005 0))(
  ( (ValueCellFull!18005 (v!21790 V!58885)) (EmptyCell!18005) )
))
(declare-datatypes ((array!102812 0))(
  ( (array!102813 (arr!49609 (Array (_ BitVec 32) ValueCell!18005)) (size!50161 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102812)

(declare-fun mapDefault!58450 () ValueCell!18005)

(assert (=> b!1543220 (= condMapEmpty!58450 (= (arr!49609 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18005)) mapDefault!58450)))))

(declare-fun b!1543221 () Bool)

(declare-fun tp_is_empty!37831 () Bool)

(assert (=> b!1543221 (= e!858845 tp_is_empty!37831)))

(declare-fun mapNonEmpty!58450 () Bool)

(declare-fun tp!110978 () Bool)

(declare-fun e!858844 () Bool)

(assert (=> mapNonEmpty!58450 (= mapRes!58450 (and tp!110978 e!858844))))

(declare-fun mapValue!58450 () ValueCell!18005)

(declare-fun mapRest!58450 () (Array (_ BitVec 32) ValueCell!18005))

(declare-fun mapKey!58450 () (_ BitVec 32))

(assert (=> mapNonEmpty!58450 (= (arr!49609 _values!470) (store mapRest!58450 mapKey!58450 mapValue!58450))))

(declare-fun b!1543222 () Bool)

(declare-fun res!1058911 () Bool)

(declare-fun e!858843 () Bool)

(assert (=> b!1543222 (=> (not res!1058911) (not e!858843))))

(declare-datatypes ((array!102814 0))(
  ( (array!102815 (arr!49610 (Array (_ BitVec 32) (_ BitVec 64))) (size!50162 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102814)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1543222 (= res!1058911 (and (= (size!50161 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50162 _keys!618) (size!50161 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543223 () Bool)

(assert (=> b!1543223 (= e!858843 false)))

(declare-fun lt!665713 () Bool)

(declare-datatypes ((List!35968 0))(
  ( (Nil!35965) (Cons!35964 (h!37410 (_ BitVec 64)) (t!50654 List!35968)) )
))
(declare-fun arrayNoDuplicates!0 (array!102814 (_ BitVec 32) List!35968) Bool)

(assert (=> b!1543223 (= lt!665713 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35965))))

(declare-fun res!1058913 () Bool)

(assert (=> start!131792 (=> (not res!1058913) (not e!858843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131792 (= res!1058913 (validMask!0 mask!926))))

(assert (=> start!131792 e!858843))

(assert (=> start!131792 true))

(declare-fun array_inv!38789 (array!102812) Bool)

(assert (=> start!131792 (and (array_inv!38789 _values!470) e!858842)))

(declare-fun array_inv!38790 (array!102814) Bool)

(assert (=> start!131792 (array_inv!38790 _keys!618)))

(declare-fun b!1543224 () Bool)

(declare-fun res!1058912 () Bool)

(assert (=> b!1543224 (=> (not res!1058912) (not e!858843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102814 (_ BitVec 32)) Bool)

(assert (=> b!1543224 (= res!1058912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543225 () Bool)

(assert (=> b!1543225 (= e!858844 tp_is_empty!37831)))

(assert (= (and start!131792 res!1058913) b!1543222))

(assert (= (and b!1543222 res!1058911) b!1543224))

(assert (= (and b!1543224 res!1058912) b!1543223))

(assert (= (and b!1543220 condMapEmpty!58450) mapIsEmpty!58450))

(assert (= (and b!1543220 (not condMapEmpty!58450)) mapNonEmpty!58450))

(get-info :version)

(assert (= (and mapNonEmpty!58450 ((_ is ValueCellFull!18005) mapValue!58450)) b!1543225))

(assert (= (and b!1543220 ((_ is ValueCellFull!18005) mapDefault!58450)) b!1543221))

(assert (= start!131792 b!1543220))

(declare-fun m!1423917 () Bool)

(assert (=> mapNonEmpty!58450 m!1423917))

(declare-fun m!1423919 () Bool)

(assert (=> b!1543223 m!1423919))

(declare-fun m!1423921 () Bool)

(assert (=> start!131792 m!1423921))

(declare-fun m!1423923 () Bool)

(assert (=> start!131792 m!1423923))

(declare-fun m!1423925 () Bool)

(assert (=> start!131792 m!1423925))

(declare-fun m!1423927 () Bool)

(assert (=> b!1543224 m!1423927))

(check-sat (not mapNonEmpty!58450) tp_is_empty!37831 (not start!131792) (not b!1543223) (not b!1543224))
(check-sat)
