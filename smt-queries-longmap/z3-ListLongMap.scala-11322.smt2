; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131786 () Bool)

(assert start!131786)

(declare-fun b!1543166 () Bool)

(declare-fun e!858798 () Bool)

(declare-fun e!858801 () Bool)

(declare-fun mapRes!58441 () Bool)

(assert (=> b!1543166 (= e!858798 (and e!858801 mapRes!58441))))

(declare-fun condMapEmpty!58441 () Bool)

(declare-datatypes ((V!58877 0))(
  ( (V!58878 (val!18990 Int)) )
))
(declare-datatypes ((ValueCell!18002 0))(
  ( (ValueCellFull!18002 (v!21787 V!58877)) (EmptyCell!18002) )
))
(declare-datatypes ((array!102802 0))(
  ( (array!102803 (arr!49604 (Array (_ BitVec 32) ValueCell!18002)) (size!50156 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102802)

(declare-fun mapDefault!58441 () ValueCell!18002)

(assert (=> b!1543166 (= condMapEmpty!58441 (= (arr!49604 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18002)) mapDefault!58441)))))

(declare-fun b!1543167 () Bool)

(declare-fun res!1058886 () Bool)

(declare-fun e!858800 () Bool)

(assert (=> b!1543167 (=> (not res!1058886) (not e!858800))))

(declare-datatypes ((array!102804 0))(
  ( (array!102805 (arr!49605 (Array (_ BitVec 32) (_ BitVec 64))) (size!50157 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102804)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1543167 (= res!1058886 (and (= (size!50156 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50157 _keys!618) (size!50156 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58441 () Bool)

(assert (=> mapIsEmpty!58441 mapRes!58441))

(declare-fun res!1058884 () Bool)

(assert (=> start!131786 (=> (not res!1058884) (not e!858800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131786 (= res!1058884 (validMask!0 mask!926))))

(assert (=> start!131786 e!858800))

(assert (=> start!131786 true))

(declare-fun array_inv!38787 (array!102802) Bool)

(assert (=> start!131786 (and (array_inv!38787 _values!470) e!858798)))

(declare-fun array_inv!38788 (array!102804) Bool)

(assert (=> start!131786 (array_inv!38788 _keys!618)))

(declare-fun mapNonEmpty!58441 () Bool)

(declare-fun tp!110969 () Bool)

(declare-fun e!858799 () Bool)

(assert (=> mapNonEmpty!58441 (= mapRes!58441 (and tp!110969 e!858799))))

(declare-fun mapKey!58441 () (_ BitVec 32))

(declare-fun mapValue!58441 () ValueCell!18002)

(declare-fun mapRest!58441 () (Array (_ BitVec 32) ValueCell!18002))

(assert (=> mapNonEmpty!58441 (= (arr!49604 _values!470) (store mapRest!58441 mapKey!58441 mapValue!58441))))

(declare-fun b!1543168 () Bool)

(assert (=> b!1543168 (= e!858800 false)))

(declare-fun lt!665704 () Bool)

(declare-datatypes ((List!35967 0))(
  ( (Nil!35964) (Cons!35963 (h!37409 (_ BitVec 64)) (t!50653 List!35967)) )
))
(declare-fun arrayNoDuplicates!0 (array!102804 (_ BitVec 32) List!35967) Bool)

(assert (=> b!1543168 (= lt!665704 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35964))))

(declare-fun b!1543169 () Bool)

(declare-fun tp_is_empty!37825 () Bool)

(assert (=> b!1543169 (= e!858801 tp_is_empty!37825)))

(declare-fun b!1543170 () Bool)

(assert (=> b!1543170 (= e!858799 tp_is_empty!37825)))

(declare-fun b!1543171 () Bool)

(declare-fun res!1058885 () Bool)

(assert (=> b!1543171 (=> (not res!1058885) (not e!858800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102804 (_ BitVec 32)) Bool)

(assert (=> b!1543171 (= res!1058885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131786 res!1058884) b!1543167))

(assert (= (and b!1543167 res!1058886) b!1543171))

(assert (= (and b!1543171 res!1058885) b!1543168))

(assert (= (and b!1543166 condMapEmpty!58441) mapIsEmpty!58441))

(assert (= (and b!1543166 (not condMapEmpty!58441)) mapNonEmpty!58441))

(get-info :version)

(assert (= (and mapNonEmpty!58441 ((_ is ValueCellFull!18002) mapValue!58441)) b!1543170))

(assert (= (and b!1543166 ((_ is ValueCellFull!18002) mapDefault!58441)) b!1543169))

(assert (= start!131786 b!1543166))

(declare-fun m!1423881 () Bool)

(assert (=> start!131786 m!1423881))

(declare-fun m!1423883 () Bool)

(assert (=> start!131786 m!1423883))

(declare-fun m!1423885 () Bool)

(assert (=> start!131786 m!1423885))

(declare-fun m!1423887 () Bool)

(assert (=> mapNonEmpty!58441 m!1423887))

(declare-fun m!1423889 () Bool)

(assert (=> b!1543168 m!1423889))

(declare-fun m!1423891 () Bool)

(assert (=> b!1543171 m!1423891))

(check-sat tp_is_empty!37825 (not b!1543171) (not mapNonEmpty!58441) (not b!1543168) (not start!131786))
(check-sat)
