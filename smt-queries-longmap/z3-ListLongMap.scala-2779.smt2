; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40548 () Bool)

(assert start!40548)

(declare-fun b_free!10573 () Bool)

(declare-fun b_next!10573 () Bool)

(assert (=> start!40548 (= b_free!10573 (not b_next!10573))))

(declare-fun tp!37539 () Bool)

(declare-fun b_and!18595 () Bool)

(assert (=> start!40548 (= tp!37539 b_and!18595)))

(declare-fun b!447013 () Bool)

(declare-fun res!265429 () Bool)

(declare-fun e!262544 () Bool)

(assert (=> b!447013 (=> (not res!265429) (not e!262544))))

(declare-datatypes ((array!27634 0))(
  ( (array!27635 (arr!13262 (Array (_ BitVec 32) (_ BitVec 64))) (size!13614 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27634)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27634 (_ BitVec 32)) Bool)

(assert (=> b!447013 (= res!265429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19500 () Bool)

(declare-fun mapRes!19500 () Bool)

(assert (=> mapIsEmpty!19500 mapRes!19500))

(declare-fun res!265432 () Bool)

(assert (=> start!40548 (=> (not res!265432) (not e!262544))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40548 (= res!265432 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13614 _keys!709))))))

(assert (=> start!40548 e!262544))

(declare-fun tp_is_empty!11911 () Bool)

(assert (=> start!40548 tp_is_empty!11911))

(assert (=> start!40548 tp!37539))

(assert (=> start!40548 true))

(declare-datatypes ((V!16987 0))(
  ( (V!16988 (val!6000 Int)) )
))
(declare-datatypes ((ValueCell!5612 0))(
  ( (ValueCellFull!5612 (v!8256 V!16987)) (EmptyCell!5612) )
))
(declare-datatypes ((array!27636 0))(
  ( (array!27637 (arr!13263 (Array (_ BitVec 32) ValueCell!5612)) (size!13615 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27636)

(declare-fun e!262547 () Bool)

(declare-fun array_inv!9690 (array!27636) Bool)

(assert (=> start!40548 (and (array_inv!9690 _values!549) e!262547)))

(declare-fun array_inv!9691 (array!27634) Bool)

(assert (=> start!40548 (array_inv!9691 _keys!709)))

(declare-fun b!447014 () Bool)

(declare-fun res!265435 () Bool)

(assert (=> b!447014 (=> (not res!265435) (not e!262544))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447014 (= res!265435 (validKeyInArray!0 k0!794))))

(declare-fun b!447015 () Bool)

(declare-fun res!265436 () Bool)

(assert (=> b!447015 (=> (not res!265436) (not e!262544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447015 (= res!265436 (validMask!0 mask!1025))))

(declare-fun b!447016 () Bool)

(declare-fun res!265430 () Bool)

(assert (=> b!447016 (=> (not res!265430) (not e!262544))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447016 (= res!265430 (or (= (select (arr!13262 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13262 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447017 () Bool)

(declare-fun res!265439 () Bool)

(declare-fun e!262546 () Bool)

(assert (=> b!447017 (=> (not res!265439) (not e!262546))))

(declare-fun lt!203926 () array!27634)

(declare-datatypes ((List!7845 0))(
  ( (Nil!7842) (Cons!7841 (h!8697 (_ BitVec 64)) (t!13599 List!7845)) )
))
(declare-fun arrayNoDuplicates!0 (array!27634 (_ BitVec 32) List!7845) Bool)

(assert (=> b!447017 (= res!265439 (arrayNoDuplicates!0 lt!203926 #b00000000000000000000000000000000 Nil!7842))))

(declare-fun b!447018 () Bool)

(declare-fun res!265437 () Bool)

(assert (=> b!447018 (=> (not res!265437) (not e!262544))))

(assert (=> b!447018 (= res!265437 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7842))))

(declare-fun b!447019 () Bool)

(declare-fun res!265431 () Bool)

(assert (=> b!447019 (=> (not res!265431) (not e!262544))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447019 (= res!265431 (and (= (size!13615 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13614 _keys!709) (size!13615 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447020 () Bool)

(declare-fun e!262548 () Bool)

(assert (=> b!447020 (= e!262548 tp_is_empty!11911)))

(declare-fun b!447021 () Bool)

(declare-fun e!262545 () Bool)

(assert (=> b!447021 (= e!262547 (and e!262545 mapRes!19500))))

(declare-fun condMapEmpty!19500 () Bool)

(declare-fun mapDefault!19500 () ValueCell!5612)

(assert (=> b!447021 (= condMapEmpty!19500 (= (arr!13263 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5612)) mapDefault!19500)))))

(declare-fun mapNonEmpty!19500 () Bool)

(declare-fun tp!37538 () Bool)

(assert (=> mapNonEmpty!19500 (= mapRes!19500 (and tp!37538 e!262548))))

(declare-fun mapKey!19500 () (_ BitVec 32))

(declare-fun mapValue!19500 () ValueCell!5612)

(declare-fun mapRest!19500 () (Array (_ BitVec 32) ValueCell!5612))

(assert (=> mapNonEmpty!19500 (= (arr!13263 _values!549) (store mapRest!19500 mapKey!19500 mapValue!19500))))

(declare-fun b!447022 () Bool)

(assert (=> b!447022 (= e!262546 false)))

(declare-fun minValue!515 () V!16987)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7774 0))(
  ( (tuple2!7775 (_1!3898 (_ BitVec 64)) (_2!3898 V!16987)) )
))
(declare-datatypes ((List!7846 0))(
  ( (Nil!7843) (Cons!7842 (h!8698 tuple2!7774) (t!13600 List!7846)) )
))
(declare-datatypes ((ListLongMap!6689 0))(
  ( (ListLongMap!6690 (toList!3360 List!7846)) )
))
(declare-fun lt!203925 () ListLongMap!6689)

(declare-fun zeroValue!515 () V!16987)

(declare-fun getCurrentListMapNoExtraKeys!1590 (array!27634 array!27636 (_ BitVec 32) (_ BitVec 32) V!16987 V!16987 (_ BitVec 32) Int) ListLongMap!6689)

(assert (=> b!447022 (= lt!203925 (getCurrentListMapNoExtraKeys!1590 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447023 () Bool)

(declare-fun res!265434 () Bool)

(assert (=> b!447023 (=> (not res!265434) (not e!262544))))

(assert (=> b!447023 (= res!265434 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13614 _keys!709))))))

(declare-fun b!447024 () Bool)

(declare-fun res!265438 () Bool)

(assert (=> b!447024 (=> (not res!265438) (not e!262544))))

(declare-fun arrayContainsKey!0 (array!27634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447024 (= res!265438 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447025 () Bool)

(assert (=> b!447025 (= e!262544 e!262546)))

(declare-fun res!265440 () Bool)

(assert (=> b!447025 (=> (not res!265440) (not e!262546))))

(assert (=> b!447025 (= res!265440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203926 mask!1025))))

(assert (=> b!447025 (= lt!203926 (array!27635 (store (arr!13262 _keys!709) i!563 k0!794) (size!13614 _keys!709)))))

(declare-fun b!447026 () Bool)

(assert (=> b!447026 (= e!262545 tp_is_empty!11911)))

(declare-fun b!447027 () Bool)

(declare-fun res!265433 () Bool)

(assert (=> b!447027 (=> (not res!265433) (not e!262546))))

(assert (=> b!447027 (= res!265433 (bvsle from!863 i!563))))

(assert (= (and start!40548 res!265432) b!447015))

(assert (= (and b!447015 res!265436) b!447019))

(assert (= (and b!447019 res!265431) b!447013))

(assert (= (and b!447013 res!265429) b!447018))

(assert (= (and b!447018 res!265437) b!447023))

(assert (= (and b!447023 res!265434) b!447014))

(assert (= (and b!447014 res!265435) b!447016))

(assert (= (and b!447016 res!265430) b!447024))

(assert (= (and b!447024 res!265438) b!447025))

(assert (= (and b!447025 res!265440) b!447017))

(assert (= (and b!447017 res!265439) b!447027))

(assert (= (and b!447027 res!265433) b!447022))

(assert (= (and b!447021 condMapEmpty!19500) mapIsEmpty!19500))

(assert (= (and b!447021 (not condMapEmpty!19500)) mapNonEmpty!19500))

(get-info :version)

(assert (= (and mapNonEmpty!19500 ((_ is ValueCellFull!5612) mapValue!19500)) b!447020))

(assert (= (and b!447021 ((_ is ValueCellFull!5612) mapDefault!19500)) b!447026))

(assert (= start!40548 b!447021))

(declare-fun m!432315 () Bool)

(assert (=> b!447022 m!432315))

(declare-fun m!432317 () Bool)

(assert (=> b!447015 m!432317))

(declare-fun m!432319 () Bool)

(assert (=> b!447025 m!432319))

(declare-fun m!432321 () Bool)

(assert (=> b!447025 m!432321))

(declare-fun m!432323 () Bool)

(assert (=> b!447016 m!432323))

(declare-fun m!432325 () Bool)

(assert (=> b!447013 m!432325))

(declare-fun m!432327 () Bool)

(assert (=> mapNonEmpty!19500 m!432327))

(declare-fun m!432329 () Bool)

(assert (=> start!40548 m!432329))

(declare-fun m!432331 () Bool)

(assert (=> start!40548 m!432331))

(declare-fun m!432333 () Bool)

(assert (=> b!447014 m!432333))

(declare-fun m!432335 () Bool)

(assert (=> b!447024 m!432335))

(declare-fun m!432337 () Bool)

(assert (=> b!447017 m!432337))

(declare-fun m!432339 () Bool)

(assert (=> b!447018 m!432339))

(check-sat (not mapNonEmpty!19500) (not b!447015) (not b_next!10573) tp_is_empty!11911 (not b!447014) (not b!447018) b_and!18595 (not b!447025) (not b!447017) (not start!40548) (not b!447024) (not b!447022) (not b!447013))
(check-sat b_and!18595 (not b_next!10573))
