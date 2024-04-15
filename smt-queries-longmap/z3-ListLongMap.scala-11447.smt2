; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133430 () Bool)

(assert start!133430)

(declare-fun b!1560173 () Bool)

(declare-fun e!869355 () Bool)

(declare-fun e!869354 () Bool)

(declare-fun mapRes!59220 () Bool)

(assert (=> b!1560173 (= e!869355 (and e!869354 mapRes!59220))))

(declare-fun condMapEmpty!59220 () Bool)

(declare-datatypes ((V!59625 0))(
  ( (V!59626 (val!19365 Int)) )
))
(declare-datatypes ((ValueCell!18251 0))(
  ( (ValueCellFull!18251 (v!22113 V!59625)) (EmptyCell!18251) )
))
(declare-datatypes ((array!103768 0))(
  ( (array!103769 (arr!50077 (Array (_ BitVec 32) ValueCell!18251)) (size!50629 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103768)

(declare-fun mapDefault!59220 () ValueCell!18251)

(assert (=> b!1560173 (= condMapEmpty!59220 (= (arr!50077 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18251)) mapDefault!59220)))))

(declare-fun b!1560175 () Bool)

(declare-fun res!1066934 () Bool)

(declare-fun e!869352 () Bool)

(assert (=> b!1560175 (=> (not res!1066934) (not e!869352))))

(declare-datatypes ((array!103770 0))(
  ( (array!103771 (arr!50078 (Array (_ BitVec 32) (_ BitVec 64))) (size!50630 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103770)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103770 (_ BitVec 32)) Bool)

(assert (=> b!1560175 (= res!1066934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560176 () Bool)

(declare-fun tp_is_empty!38563 () Bool)

(assert (=> b!1560176 (= e!869354 tp_is_empty!38563)))

(declare-fun b!1560177 () Bool)

(declare-fun res!1066933 () Bool)

(assert (=> b!1560177 (=> (not res!1066933) (not e!869352))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560177 (= res!1066933 (and (= (size!50629 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50630 _keys!637) (size!50629 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59220 () Bool)

(assert (=> mapIsEmpty!59220 mapRes!59220))

(declare-fun b!1560174 () Bool)

(assert (=> b!1560174 (= e!869352 false)))

(declare-fun lt!670715 () Bool)

(declare-datatypes ((List!36438 0))(
  ( (Nil!36435) (Cons!36434 (h!37881 (_ BitVec 64)) (t!51163 List!36438)) )
))
(declare-fun arrayNoDuplicates!0 (array!103770 (_ BitVec 32) List!36438) Bool)

(assert (=> b!1560174 (= lt!670715 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36435))))

(declare-fun res!1066935 () Bool)

(assert (=> start!133430 (=> (not res!1066935) (not e!869352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133430 (= res!1066935 (validMask!0 mask!947))))

(assert (=> start!133430 e!869352))

(assert (=> start!133430 true))

(declare-fun array_inv!39125 (array!103768) Bool)

(assert (=> start!133430 (and (array_inv!39125 _values!487) e!869355)))

(declare-fun array_inv!39126 (array!103770) Bool)

(assert (=> start!133430 (array_inv!39126 _keys!637)))

(declare-fun b!1560178 () Bool)

(declare-fun e!869353 () Bool)

(assert (=> b!1560178 (= e!869353 tp_is_empty!38563)))

(declare-fun mapNonEmpty!59220 () Bool)

(declare-fun tp!112876 () Bool)

(assert (=> mapNonEmpty!59220 (= mapRes!59220 (and tp!112876 e!869353))))

(declare-fun mapKey!59220 () (_ BitVec 32))

(declare-fun mapRest!59220 () (Array (_ BitVec 32) ValueCell!18251))

(declare-fun mapValue!59220 () ValueCell!18251)

(assert (=> mapNonEmpty!59220 (= (arr!50077 _values!487) (store mapRest!59220 mapKey!59220 mapValue!59220))))

(assert (= (and start!133430 res!1066935) b!1560177))

(assert (= (and b!1560177 res!1066933) b!1560175))

(assert (= (and b!1560175 res!1066934) b!1560174))

(assert (= (and b!1560173 condMapEmpty!59220) mapIsEmpty!59220))

(assert (= (and b!1560173 (not condMapEmpty!59220)) mapNonEmpty!59220))

(get-info :version)

(assert (= (and mapNonEmpty!59220 ((_ is ValueCellFull!18251) mapValue!59220)) b!1560178))

(assert (= (and b!1560173 ((_ is ValueCellFull!18251) mapDefault!59220)) b!1560176))

(assert (= start!133430 b!1560173))

(declare-fun m!1435425 () Bool)

(assert (=> b!1560175 m!1435425))

(declare-fun m!1435427 () Bool)

(assert (=> b!1560174 m!1435427))

(declare-fun m!1435429 () Bool)

(assert (=> start!133430 m!1435429))

(declare-fun m!1435431 () Bool)

(assert (=> start!133430 m!1435431))

(declare-fun m!1435433 () Bool)

(assert (=> start!133430 m!1435433))

(declare-fun m!1435435 () Bool)

(assert (=> mapNonEmpty!59220 m!1435435))

(check-sat tp_is_empty!38563 (not b!1560174) (not start!133430) (not b!1560175) (not mapNonEmpty!59220))
(check-sat)
