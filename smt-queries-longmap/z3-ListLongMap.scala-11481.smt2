; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133686 () Bool)

(assert start!133686)

(declare-fun b!1563030 () Bool)

(declare-fun e!871107 () Bool)

(declare-fun e!871104 () Bool)

(declare-fun mapRes!59529 () Bool)

(assert (=> b!1563030 (= e!871107 (and e!871104 mapRes!59529))))

(declare-fun condMapEmpty!59529 () Bool)

(declare-datatypes ((V!59899 0))(
  ( (V!59900 (val!19468 Int)) )
))
(declare-datatypes ((ValueCell!18354 0))(
  ( (ValueCellFull!18354 (v!22220 V!59899)) (EmptyCell!18354) )
))
(declare-datatypes ((array!104240 0))(
  ( (array!104241 (arr!50312 (Array (_ BitVec 32) ValueCell!18354)) (size!50862 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104240)

(declare-fun mapDefault!59529 () ValueCell!18354)

(assert (=> b!1563030 (= condMapEmpty!59529 (= (arr!50312 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18354)) mapDefault!59529)))))

(declare-fun b!1563031 () Bool)

(declare-fun tp_is_empty!38769 () Bool)

(assert (=> b!1563031 (= e!871104 tp_is_empty!38769)))

(declare-fun b!1563032 () Bool)

(declare-fun e!871105 () Bool)

(assert (=> b!1563032 (= e!871105 tp_is_empty!38769)))

(declare-fun mapIsEmpty!59529 () Bool)

(assert (=> mapIsEmpty!59529 mapRes!59529))

(declare-fun b!1563033 () Bool)

(declare-fun res!1068566 () Bool)

(declare-fun e!871108 () Bool)

(assert (=> b!1563033 (=> (not res!1068566) (not e!871108))))

(declare-datatypes ((array!104242 0))(
  ( (array!104243 (arr!50313 (Array (_ BitVec 32) (_ BitVec 64))) (size!50863 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104242)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104242 (_ BitVec 32)) Bool)

(assert (=> b!1563033 (= res!1068566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1068565 () Bool)

(assert (=> start!133686 (=> (not res!1068565) (not e!871108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133686 (= res!1068565 (validMask!0 mask!947))))

(assert (=> start!133686 e!871108))

(assert (=> start!133686 true))

(declare-fun array_inv!39105 (array!104240) Bool)

(assert (=> start!133686 (and (array_inv!39105 _values!487) e!871107)))

(declare-fun array_inv!39106 (array!104242) Bool)

(assert (=> start!133686 (array_inv!39106 _keys!637)))

(declare-fun b!1563034 () Bool)

(declare-fun res!1068567 () Bool)

(assert (=> b!1563034 (=> (not res!1068567) (not e!871108))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563034 (= res!1068567 (and (= (size!50862 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50863 _keys!637) (size!50862 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563035 () Bool)

(assert (=> b!1563035 (= e!871108 false)))

(declare-fun lt!671823 () Bool)

(declare-datatypes ((List!36506 0))(
  ( (Nil!36503) (Cons!36502 (h!37948 (_ BitVec 64)) (t!51353 List!36506)) )
))
(declare-fun arrayNoDuplicates!0 (array!104242 (_ BitVec 32) List!36506) Bool)

(assert (=> b!1563035 (= lt!671823 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36503))))

(declare-fun mapNonEmpty!59529 () Bool)

(declare-fun tp!113364 () Bool)

(assert (=> mapNonEmpty!59529 (= mapRes!59529 (and tp!113364 e!871105))))

(declare-fun mapKey!59529 () (_ BitVec 32))

(declare-fun mapRest!59529 () (Array (_ BitVec 32) ValueCell!18354))

(declare-fun mapValue!59529 () ValueCell!18354)

(assert (=> mapNonEmpty!59529 (= (arr!50312 _values!487) (store mapRest!59529 mapKey!59529 mapValue!59529))))

(assert (= (and start!133686 res!1068565) b!1563034))

(assert (= (and b!1563034 res!1068567) b!1563033))

(assert (= (and b!1563033 res!1068566) b!1563035))

(assert (= (and b!1563030 condMapEmpty!59529) mapIsEmpty!59529))

(assert (= (and b!1563030 (not condMapEmpty!59529)) mapNonEmpty!59529))

(get-info :version)

(assert (= (and mapNonEmpty!59529 ((_ is ValueCellFull!18354) mapValue!59529)) b!1563032))

(assert (= (and b!1563030 ((_ is ValueCellFull!18354) mapDefault!59529)) b!1563031))

(assert (= start!133686 b!1563030))

(declare-fun m!1438681 () Bool)

(assert (=> b!1563033 m!1438681))

(declare-fun m!1438683 () Bool)

(assert (=> start!133686 m!1438683))

(declare-fun m!1438685 () Bool)

(assert (=> start!133686 m!1438685))

(declare-fun m!1438687 () Bool)

(assert (=> start!133686 m!1438687))

(declare-fun m!1438689 () Bool)

(assert (=> b!1563035 m!1438689))

(declare-fun m!1438691 () Bool)

(assert (=> mapNonEmpty!59529 m!1438691))

(check-sat (not b!1563035) (not mapNonEmpty!59529) tp_is_empty!38769 (not start!133686) (not b!1563033))
(check-sat)
