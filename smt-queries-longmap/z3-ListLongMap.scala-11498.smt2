; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134208 () Bool)

(assert start!134208)

(declare-fun b!1566920 () Bool)

(declare-fun res!1070414 () Bool)

(declare-fun e!873482 () Bool)

(assert (=> b!1566920 (=> (not res!1070414) (not e!873482))))

(declare-datatypes ((array!104552 0))(
  ( (array!104553 (arr!50460 (Array (_ BitVec 32) (_ BitVec 64))) (size!51011 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104552)

(declare-datatypes ((List!36603 0))(
  ( (Nil!36600) (Cons!36599 (h!38063 (_ BitVec 64)) (t!51442 List!36603)) )
))
(declare-fun arrayNoDuplicates!0 (array!104552 (_ BitVec 32) List!36603) Bool)

(assert (=> b!1566920 (= res!1070414 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36600))))

(declare-fun mapNonEmpty!59682 () Bool)

(declare-fun mapRes!59682 () Bool)

(declare-fun tp!113607 () Bool)

(declare-fun e!873484 () Bool)

(assert (=> mapNonEmpty!59682 (= mapRes!59682 (and tp!113607 e!873484))))

(declare-fun mapKey!59682 () (_ BitVec 32))

(declare-datatypes ((V!60033 0))(
  ( (V!60034 (val!19518 Int)) )
))
(declare-datatypes ((ValueCell!18404 0))(
  ( (ValueCellFull!18404 (v!22262 V!60033)) (EmptyCell!18404) )
))
(declare-fun mapValue!59682 () ValueCell!18404)

(declare-fun mapRest!59682 () (Array (_ BitVec 32) ValueCell!18404))

(declare-datatypes ((array!104554 0))(
  ( (array!104555 (arr!50461 (Array (_ BitVec 32) ValueCell!18404)) (size!51012 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104554)

(assert (=> mapNonEmpty!59682 (= (arr!50461 _values!487) (store mapRest!59682 mapKey!59682 mapValue!59682))))

(declare-fun b!1566921 () Bool)

(declare-fun res!1070410 () Bool)

(assert (=> b!1566921 (=> (not res!1070410) (not e!873482))))

(declare-datatypes ((tuple2!25242 0))(
  ( (tuple2!25243 (_1!12632 (_ BitVec 64)) (_2!12632 V!60033)) )
))
(declare-datatypes ((List!36604 0))(
  ( (Nil!36601) (Cons!36600 (h!38064 tuple2!25242) (t!51443 List!36604)) )
))
(declare-datatypes ((ListLongMap!22685 0))(
  ( (ListLongMap!22686 (toList!11358 List!36604)) )
))
(declare-fun contains!10360 (ListLongMap!22685 (_ BitVec 64)) Bool)

(assert (=> b!1566921 (= res!1070410 (not (contains!10360 (ListLongMap!22686 Nil!36601) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566922 () Bool)

(declare-fun res!1070413 () Bool)

(assert (=> b!1566922 (=> (not res!1070413) (not e!873482))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566922 (= res!1070413 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51011 _keys!637)) (bvsge from!782 (size!51011 _keys!637))))))

(declare-fun b!1566923 () Bool)

(declare-fun e!873481 () Bool)

(declare-fun e!873483 () Bool)

(assert (=> b!1566923 (= e!873481 (and e!873483 mapRes!59682))))

(declare-fun condMapEmpty!59682 () Bool)

(declare-fun mapDefault!59682 () ValueCell!18404)

(assert (=> b!1566923 (= condMapEmpty!59682 (= (arr!50461 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18404)) mapDefault!59682)))))

(declare-fun b!1566924 () Bool)

(declare-fun res!1070409 () Bool)

(assert (=> b!1566924 (=> (not res!1070409) (not e!873482))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104552 (_ BitVec 32)) Bool)

(assert (=> b!1566924 (= res!1070409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566925 () Bool)

(declare-fun tp_is_empty!38869 () Bool)

(assert (=> b!1566925 (= e!873483 tp_is_empty!38869)))

(declare-fun mapIsEmpty!59682 () Bool)

(assert (=> mapIsEmpty!59682 mapRes!59682))

(declare-fun b!1566926 () Bool)

(assert (=> b!1566926 (= e!873484 tp_is_empty!38869)))

(declare-fun b!1566927 () Bool)

(declare-fun res!1070412 () Bool)

(assert (=> b!1566927 (=> (not res!1070412) (not e!873482))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566927 (= res!1070412 (and (= (size!51012 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51011 _keys!637) (size!51012 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1070411 () Bool)

(assert (=> start!134208 (=> (not res!1070411) (not e!873482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134208 (= res!1070411 (validMask!0 mask!947))))

(assert (=> start!134208 e!873482))

(assert (=> start!134208 true))

(declare-fun array_inv!39457 (array!104552) Bool)

(assert (=> start!134208 (array_inv!39457 _keys!637)))

(declare-fun array_inv!39458 (array!104554) Bool)

(assert (=> start!134208 (and (array_inv!39458 _values!487) e!873481)))

(declare-fun b!1566928 () Bool)

(assert (=> b!1566928 (= e!873482 false)))

(declare-fun lt!672953 () Bool)

(assert (=> b!1566928 (= lt!672953 (contains!10360 (ListLongMap!22686 Nil!36601) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134208 res!1070411) b!1566927))

(assert (= (and b!1566927 res!1070412) b!1566924))

(assert (= (and b!1566924 res!1070409) b!1566920))

(assert (= (and b!1566920 res!1070414) b!1566922))

(assert (= (and b!1566922 res!1070413) b!1566921))

(assert (= (and b!1566921 res!1070410) b!1566928))

(assert (= (and b!1566923 condMapEmpty!59682) mapIsEmpty!59682))

(assert (= (and b!1566923 (not condMapEmpty!59682)) mapNonEmpty!59682))

(get-info :version)

(assert (= (and mapNonEmpty!59682 ((_ is ValueCellFull!18404) mapValue!59682)) b!1566926))

(assert (= (and b!1566923 ((_ is ValueCellFull!18404) mapDefault!59682)) b!1566925))

(assert (= start!134208 b!1566923))

(declare-fun m!1441917 () Bool)

(assert (=> b!1566924 m!1441917))

(declare-fun m!1441919 () Bool)

(assert (=> start!134208 m!1441919))

(declare-fun m!1441921 () Bool)

(assert (=> start!134208 m!1441921))

(declare-fun m!1441923 () Bool)

(assert (=> start!134208 m!1441923))

(declare-fun m!1441925 () Bool)

(assert (=> b!1566921 m!1441925))

(declare-fun m!1441927 () Bool)

(assert (=> mapNonEmpty!59682 m!1441927))

(declare-fun m!1441929 () Bool)

(assert (=> b!1566928 m!1441929))

(declare-fun m!1441931 () Bool)

(assert (=> b!1566920 m!1441931))

(check-sat (not b!1566924) (not b!1566921) (not start!134208) (not mapNonEmpty!59682) tp_is_empty!38869 (not b!1566928) (not b!1566920))
(check-sat)
