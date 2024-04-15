; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133610 () Bool)

(assert start!133610)

(declare-fun mapIsEmpty!59490 () Bool)

(declare-fun mapRes!59490 () Bool)

(assert (=> mapIsEmpty!59490 mapRes!59490))

(declare-fun mapNonEmpty!59490 () Bool)

(declare-fun tp!113326 () Bool)

(declare-fun e!870713 () Bool)

(assert (=> mapNonEmpty!59490 (= mapRes!59490 (and tp!113326 e!870713))))

(declare-datatypes ((V!59865 0))(
  ( (V!59866 (val!19455 Int)) )
))
(declare-datatypes ((ValueCell!18341 0))(
  ( (ValueCellFull!18341 (v!22203 V!59865)) (EmptyCell!18341) )
))
(declare-fun mapValue!59490 () ValueCell!18341)

(declare-fun mapKey!59490 () (_ BitVec 32))

(declare-fun mapRest!59490 () (Array (_ BitVec 32) ValueCell!18341))

(declare-datatypes ((array!104110 0))(
  ( (array!104111 (arr!50248 (Array (_ BitVec 32) ValueCell!18341)) (size!50800 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104110)

(assert (=> mapNonEmpty!59490 (= (arr!50248 _values!487) (store mapRest!59490 mapKey!59490 mapValue!59490))))

(declare-fun b!1562483 () Bool)

(declare-fun res!1068319 () Bool)

(declare-fun e!870711 () Bool)

(assert (=> b!1562483 (=> (not res!1068319) (not e!870711))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104112 0))(
  ( (array!104113 (arr!50249 (Array (_ BitVec 32) (_ BitVec 64))) (size!50801 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104112)

(assert (=> b!1562483 (= res!1068319 (and (= (size!50800 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50801 _keys!637) (size!50800 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068320 () Bool)

(assert (=> start!133610 (=> (not res!1068320) (not e!870711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133610 (= res!1068320 (validMask!0 mask!947))))

(assert (=> start!133610 e!870711))

(assert (=> start!133610 true))

(declare-fun e!870715 () Bool)

(declare-fun array_inv!39241 (array!104110) Bool)

(assert (=> start!133610 (and (array_inv!39241 _values!487) e!870715)))

(declare-fun array_inv!39242 (array!104112) Bool)

(assert (=> start!133610 (array_inv!39242 _keys!637)))

(declare-fun b!1562484 () Bool)

(declare-fun e!870712 () Bool)

(assert (=> b!1562484 (= e!870715 (and e!870712 mapRes!59490))))

(declare-fun condMapEmpty!59490 () Bool)

(declare-fun mapDefault!59490 () ValueCell!18341)

(assert (=> b!1562484 (= condMapEmpty!59490 (= (arr!50248 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18341)) mapDefault!59490)))))

(declare-fun b!1562485 () Bool)

(declare-fun tp_is_empty!38743 () Bool)

(assert (=> b!1562485 (= e!870713 tp_is_empty!38743)))

(declare-fun b!1562486 () Bool)

(assert (=> b!1562486 (= e!870712 tp_is_empty!38743)))

(declare-fun b!1562487 () Bool)

(assert (=> b!1562487 (= e!870711 false)))

(declare-fun lt!671498 () Bool)

(declare-datatypes ((List!36541 0))(
  ( (Nil!36538) (Cons!36537 (h!37984 (_ BitVec 64)) (t!51380 List!36541)) )
))
(declare-fun arrayNoDuplicates!0 (array!104112 (_ BitVec 32) List!36541) Bool)

(assert (=> b!1562487 (= lt!671498 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36538))))

(declare-fun b!1562488 () Bool)

(declare-fun res!1068321 () Bool)

(assert (=> b!1562488 (=> (not res!1068321) (not e!870711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104112 (_ BitVec 32)) Bool)

(assert (=> b!1562488 (= res!1068321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133610 res!1068320) b!1562483))

(assert (= (and b!1562483 res!1068319) b!1562488))

(assert (= (and b!1562488 res!1068321) b!1562487))

(assert (= (and b!1562484 condMapEmpty!59490) mapIsEmpty!59490))

(assert (= (and b!1562484 (not condMapEmpty!59490)) mapNonEmpty!59490))

(get-info :version)

(assert (= (and mapNonEmpty!59490 ((_ is ValueCellFull!18341) mapValue!59490)) b!1562485))

(assert (= (and b!1562484 ((_ is ValueCellFull!18341) mapDefault!59490)) b!1562486))

(assert (= start!133610 b!1562484))

(declare-fun m!1437633 () Bool)

(assert (=> mapNonEmpty!59490 m!1437633))

(declare-fun m!1437635 () Bool)

(assert (=> start!133610 m!1437635))

(declare-fun m!1437637 () Bool)

(assert (=> start!133610 m!1437637))

(declare-fun m!1437639 () Bool)

(assert (=> start!133610 m!1437639))

(declare-fun m!1437641 () Bool)

(assert (=> b!1562487 m!1437641))

(declare-fun m!1437643 () Bool)

(assert (=> b!1562488 m!1437643))

(check-sat (not start!133610) (not b!1562488) (not b!1562487) (not mapNonEmpty!59490) tp_is_empty!38743)
(check-sat)
