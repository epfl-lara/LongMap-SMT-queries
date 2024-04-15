; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133746 () Bool)

(assert start!133746)

(declare-fun mapIsEmpty!59682 () Bool)

(declare-fun mapRes!59682 () Bool)

(assert (=> mapIsEmpty!59682 mapRes!59682))

(declare-fun b!1564171 () Bool)

(declare-fun res!1069425 () Bool)

(declare-fun e!871773 () Bool)

(assert (=> b!1564171 (=> (not res!1069425) (not e!871773))))

(declare-datatypes ((V!60033 0))(
  ( (V!60034 (val!19518 Int)) )
))
(declare-datatypes ((tuple2!25264 0))(
  ( (tuple2!25265 (_1!12643 (_ BitVec 64)) (_2!12643 V!60033)) )
))
(declare-datatypes ((List!36619 0))(
  ( (Nil!36616) (Cons!36615 (h!38062 tuple2!25264) (t!51458 List!36619)) )
))
(declare-datatypes ((ListLongMap!22699 0))(
  ( (ListLongMap!22700 (toList!11365 List!36619)) )
))
(declare-fun contains!10276 (ListLongMap!22699 (_ BitVec 64)) Bool)

(assert (=> b!1564171 (= res!1069425 (not (contains!10276 (ListLongMap!22700 Nil!36616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564172 () Bool)

(declare-fun res!1069420 () Bool)

(assert (=> b!1564172 (=> (not res!1069420) (not e!871773))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104356 0))(
  ( (array!104357 (arr!50370 (Array (_ BitVec 32) (_ BitVec 64))) (size!50922 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104356)

(declare-datatypes ((ValueCell!18404 0))(
  ( (ValueCellFull!18404 (v!22266 V!60033)) (EmptyCell!18404) )
))
(declare-datatypes ((array!104358 0))(
  ( (array!104359 (arr!50371 (Array (_ BitVec 32) ValueCell!18404)) (size!50923 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104358)

(assert (=> b!1564172 (= res!1069420 (and (= (size!50923 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50922 _keys!637) (size!50923 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564173 () Bool)

(declare-fun e!871777 () Bool)

(declare-fun tp_is_empty!38869 () Bool)

(assert (=> b!1564173 (= e!871777 tp_is_empty!38869)))

(declare-fun b!1564174 () Bool)

(declare-fun res!1069421 () Bool)

(assert (=> b!1564174 (=> (not res!1069421) (not e!871773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104356 (_ BitVec 32)) Bool)

(assert (=> b!1564174 (= res!1069421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1069424 () Bool)

(assert (=> start!133746 (=> (not res!1069424) (not e!871773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133746 (= res!1069424 (validMask!0 mask!947))))

(assert (=> start!133746 e!871773))

(assert (=> start!133746 true))

(declare-fun array_inv!39343 (array!104356) Bool)

(assert (=> start!133746 (array_inv!39343 _keys!637)))

(declare-fun e!871776 () Bool)

(declare-fun array_inv!39344 (array!104358) Bool)

(assert (=> start!133746 (and (array_inv!39344 _values!487) e!871776)))

(declare-fun b!1564175 () Bool)

(declare-fun e!871775 () Bool)

(assert (=> b!1564175 (= e!871776 (and e!871775 mapRes!59682))))

(declare-fun condMapEmpty!59682 () Bool)

(declare-fun mapDefault!59682 () ValueCell!18404)

(assert (=> b!1564175 (= condMapEmpty!59682 (= (arr!50371 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18404)) mapDefault!59682)))))

(declare-fun b!1564176 () Bool)

(assert (=> b!1564176 (= e!871775 tp_is_empty!38869)))

(declare-fun b!1564177 () Bool)

(declare-fun res!1069423 () Bool)

(assert (=> b!1564177 (=> (not res!1069423) (not e!871773))))

(declare-datatypes ((List!36620 0))(
  ( (Nil!36617) (Cons!36616 (h!38063 (_ BitVec 64)) (t!51459 List!36620)) )
))
(declare-fun arrayNoDuplicates!0 (array!104356 (_ BitVec 32) List!36620) Bool)

(assert (=> b!1564177 (= res!1069423 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36617))))

(declare-fun b!1564178 () Bool)

(declare-fun res!1069422 () Bool)

(assert (=> b!1564178 (=> (not res!1069422) (not e!871773))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564178 (= res!1069422 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50922 _keys!637)) (bvsge from!782 (size!50922 _keys!637))))))

(declare-fun b!1564179 () Bool)

(assert (=> b!1564179 (= e!871773 false)))

(declare-fun lt!671759 () Bool)

(assert (=> b!1564179 (= lt!671759 (contains!10276 (ListLongMap!22700 Nil!36616) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59682 () Bool)

(declare-fun tp!113608 () Bool)

(assert (=> mapNonEmpty!59682 (= mapRes!59682 (and tp!113608 e!871777))))

(declare-fun mapKey!59682 () (_ BitVec 32))

(declare-fun mapValue!59682 () ValueCell!18404)

(declare-fun mapRest!59682 () (Array (_ BitVec 32) ValueCell!18404))

(assert (=> mapNonEmpty!59682 (= (arr!50371 _values!487) (store mapRest!59682 mapKey!59682 mapValue!59682))))

(assert (= (and start!133746 res!1069424) b!1564172))

(assert (= (and b!1564172 res!1069420) b!1564174))

(assert (= (and b!1564174 res!1069421) b!1564177))

(assert (= (and b!1564177 res!1069423) b!1564178))

(assert (= (and b!1564178 res!1069422) b!1564171))

(assert (= (and b!1564171 res!1069425) b!1564179))

(assert (= (and b!1564175 condMapEmpty!59682) mapIsEmpty!59682))

(assert (= (and b!1564175 (not condMapEmpty!59682)) mapNonEmpty!59682))

(get-info :version)

(assert (= (and mapNonEmpty!59682 ((_ is ValueCellFull!18404) mapValue!59682)) b!1564173))

(assert (= (and b!1564175 ((_ is ValueCellFull!18404) mapDefault!59682)) b!1564176))

(assert (= start!133746 b!1564175))

(declare-fun m!1438767 () Bool)

(assert (=> mapNonEmpty!59682 m!1438767))

(declare-fun m!1438769 () Bool)

(assert (=> b!1564179 m!1438769))

(declare-fun m!1438771 () Bool)

(assert (=> start!133746 m!1438771))

(declare-fun m!1438773 () Bool)

(assert (=> start!133746 m!1438773))

(declare-fun m!1438775 () Bool)

(assert (=> start!133746 m!1438775))

(declare-fun m!1438777 () Bool)

(assert (=> b!1564177 m!1438777))

(declare-fun m!1438779 () Bool)

(assert (=> b!1564171 m!1438779))

(declare-fun m!1438781 () Bool)

(assert (=> b!1564174 m!1438781))

(check-sat tp_is_empty!38869 (not b!1564179) (not b!1564174) (not start!133746) (not mapNonEmpty!59682) (not b!1564177) (not b!1564171))
(check-sat)
