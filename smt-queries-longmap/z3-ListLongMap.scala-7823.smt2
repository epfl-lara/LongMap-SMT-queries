; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97684 () Bool)

(assert start!97684)

(declare-fun mapIsEmpty!43690 () Bool)

(declare-fun mapRes!43690 () Bool)

(assert (=> mapIsEmpty!43690 mapRes!43690))

(declare-fun b!1116576 () Bool)

(declare-fun res!745547 () Bool)

(declare-fun e!636157 () Bool)

(assert (=> b!1116576 (=> (not res!745547) (not e!636157))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116576 (= res!745547 (validMask!0 mask!1564))))

(declare-fun b!1116577 () Bool)

(declare-fun res!745543 () Bool)

(assert (=> b!1116577 (=> (not res!745543) (not e!636157))))

(declare-datatypes ((array!72727 0))(
  ( (array!72728 (arr!35016 (Array (_ BitVec 32) (_ BitVec 64))) (size!35552 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72727)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116577 (= res!745543 (= (select (arr!35016 _keys!1208) i!673) k0!934))))

(declare-fun b!1116579 () Bool)

(declare-fun e!636154 () Bool)

(declare-fun tp_is_empty!27915 () Bool)

(assert (=> b!1116579 (= e!636154 tp_is_empty!27915)))

(declare-fun b!1116580 () Bool)

(declare-fun res!745544 () Bool)

(assert (=> b!1116580 (=> (not res!745544) (not e!636157))))

(declare-datatypes ((List!24370 0))(
  ( (Nil!24367) (Cons!24366 (h!25575 (_ BitVec 64)) (t!34851 List!24370)) )
))
(declare-fun arrayNoDuplicates!0 (array!72727 (_ BitVec 32) List!24370) Bool)

(assert (=> b!1116580 (= res!745544 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24367))))

(declare-fun b!1116581 () Bool)

(declare-fun e!636159 () Bool)

(assert (=> b!1116581 (= e!636159 tp_is_empty!27915)))

(declare-fun b!1116582 () Bool)

(declare-fun res!745552 () Bool)

(assert (=> b!1116582 (=> (not res!745552) (not e!636157))))

(assert (=> b!1116582 (= res!745552 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35552 _keys!1208))))))

(declare-fun b!1116583 () Bool)

(declare-fun res!745550 () Bool)

(assert (=> b!1116583 (=> (not res!745550) (not e!636157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72727 (_ BitVec 32)) Bool)

(assert (=> b!1116583 (= res!745550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!745551 () Bool)

(assert (=> start!97684 (=> (not res!745551) (not e!636157))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97684 (= res!745551 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35552 _keys!1208))))))

(assert (=> start!97684 e!636157))

(declare-fun array_inv!26910 (array!72727) Bool)

(assert (=> start!97684 (array_inv!26910 _keys!1208)))

(assert (=> start!97684 true))

(declare-datatypes ((V!42347 0))(
  ( (V!42348 (val!14014 Int)) )
))
(declare-datatypes ((ValueCell!13248 0))(
  ( (ValueCellFull!13248 (v!16647 V!42347)) (EmptyCell!13248) )
))
(declare-datatypes ((array!72729 0))(
  ( (array!72730 (arr!35017 (Array (_ BitVec 32) ValueCell!13248)) (size!35553 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72729)

(declare-fun e!636155 () Bool)

(declare-fun array_inv!26911 (array!72729) Bool)

(assert (=> start!97684 (and (array_inv!26911 _values!996) e!636155)))

(declare-fun b!1116578 () Bool)

(declare-fun e!636158 () Bool)

(assert (=> b!1116578 (= e!636158 (not true))))

(declare-fun arrayContainsKey!0 (array!72727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116578 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36644 0))(
  ( (Unit!36645) )
))
(declare-fun lt!497156 () Unit!36644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72727 (_ BitVec 64) (_ BitVec 32)) Unit!36644)

(assert (=> b!1116578 (= lt!497156 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43690 () Bool)

(declare-fun tp!82934 () Bool)

(assert (=> mapNonEmpty!43690 (= mapRes!43690 (and tp!82934 e!636159))))

(declare-fun mapRest!43690 () (Array (_ BitVec 32) ValueCell!13248))

(declare-fun mapValue!43690 () ValueCell!13248)

(declare-fun mapKey!43690 () (_ BitVec 32))

(assert (=> mapNonEmpty!43690 (= (arr!35017 _values!996) (store mapRest!43690 mapKey!43690 mapValue!43690))))

(declare-fun b!1116584 () Bool)

(declare-fun res!745549 () Bool)

(assert (=> b!1116584 (=> (not res!745549) (not e!636158))))

(declare-fun lt!497155 () array!72727)

(assert (=> b!1116584 (= res!745549 (arrayNoDuplicates!0 lt!497155 #b00000000000000000000000000000000 Nil!24367))))

(declare-fun b!1116585 () Bool)

(declare-fun res!745548 () Bool)

(assert (=> b!1116585 (=> (not res!745548) (not e!636157))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116585 (= res!745548 (and (= (size!35553 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35552 _keys!1208) (size!35553 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116586 () Bool)

(assert (=> b!1116586 (= e!636157 e!636158)))

(declare-fun res!745545 () Bool)

(assert (=> b!1116586 (=> (not res!745545) (not e!636158))))

(assert (=> b!1116586 (= res!745545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497155 mask!1564))))

(assert (=> b!1116586 (= lt!497155 (array!72728 (store (arr!35016 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35552 _keys!1208)))))

(declare-fun b!1116587 () Bool)

(declare-fun res!745546 () Bool)

(assert (=> b!1116587 (=> (not res!745546) (not e!636157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116587 (= res!745546 (validKeyInArray!0 k0!934))))

(declare-fun b!1116588 () Bool)

(assert (=> b!1116588 (= e!636155 (and e!636154 mapRes!43690))))

(declare-fun condMapEmpty!43690 () Bool)

(declare-fun mapDefault!43690 () ValueCell!13248)

(assert (=> b!1116588 (= condMapEmpty!43690 (= (arr!35017 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13248)) mapDefault!43690)))))

(assert (= (and start!97684 res!745551) b!1116576))

(assert (= (and b!1116576 res!745547) b!1116585))

(assert (= (and b!1116585 res!745548) b!1116583))

(assert (= (and b!1116583 res!745550) b!1116580))

(assert (= (and b!1116580 res!745544) b!1116582))

(assert (= (and b!1116582 res!745552) b!1116587))

(assert (= (and b!1116587 res!745546) b!1116577))

(assert (= (and b!1116577 res!745543) b!1116586))

(assert (= (and b!1116586 res!745545) b!1116584))

(assert (= (and b!1116584 res!745549) b!1116578))

(assert (= (and b!1116588 condMapEmpty!43690) mapIsEmpty!43690))

(assert (= (and b!1116588 (not condMapEmpty!43690)) mapNonEmpty!43690))

(get-info :version)

(assert (= (and mapNonEmpty!43690 ((_ is ValueCellFull!13248) mapValue!43690)) b!1116581))

(assert (= (and b!1116588 ((_ is ValueCellFull!13248) mapDefault!43690)) b!1116579))

(assert (= start!97684 b!1116588))

(declare-fun m!1032739 () Bool)

(assert (=> b!1116578 m!1032739))

(declare-fun m!1032741 () Bool)

(assert (=> b!1116578 m!1032741))

(declare-fun m!1032743 () Bool)

(assert (=> start!97684 m!1032743))

(declare-fun m!1032745 () Bool)

(assert (=> start!97684 m!1032745))

(declare-fun m!1032747 () Bool)

(assert (=> b!1116583 m!1032747))

(declare-fun m!1032749 () Bool)

(assert (=> b!1116580 m!1032749))

(declare-fun m!1032751 () Bool)

(assert (=> b!1116576 m!1032751))

(declare-fun m!1032753 () Bool)

(assert (=> b!1116587 m!1032753))

(declare-fun m!1032755 () Bool)

(assert (=> b!1116586 m!1032755))

(declare-fun m!1032757 () Bool)

(assert (=> b!1116586 m!1032757))

(declare-fun m!1032759 () Bool)

(assert (=> b!1116584 m!1032759))

(declare-fun m!1032761 () Bool)

(assert (=> mapNonEmpty!43690 m!1032761))

(declare-fun m!1032763 () Bool)

(assert (=> b!1116577 m!1032763))

(check-sat (not mapNonEmpty!43690) tp_is_empty!27915 (not b!1116584) (not start!97684) (not b!1116580) (not b!1116578) (not b!1116583) (not b!1116587) (not b!1116586) (not b!1116576))
(check-sat)
