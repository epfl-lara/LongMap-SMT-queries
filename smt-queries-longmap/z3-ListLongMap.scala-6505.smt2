; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83038 () Bool)

(assert start!83038)

(declare-fun b_free!18997 () Bool)

(declare-fun b_next!18997 () Bool)

(assert (=> start!83038 (= b_free!18997 (not b_next!18997))))

(declare-fun tp!66121 () Bool)

(declare-fun b_and!30495 () Bool)

(assert (=> start!83038 (= tp!66121 b_and!30495)))

(declare-fun b!967692 () Bool)

(declare-fun e!545570 () Bool)

(declare-fun tp_is_empty!21805 () Bool)

(assert (=> b!967692 (= e!545570 tp_is_empty!21805)))

(declare-fun b!967693 () Bool)

(declare-fun e!545573 () Bool)

(assert (=> b!967693 (= e!545573 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34057 0))(
  ( (V!34058 (val!10953 Int)) )
))
(declare-datatypes ((ValueCell!10421 0))(
  ( (ValueCellFull!10421 (v!13508 V!34057)) (EmptyCell!10421) )
))
(declare-datatypes ((array!59708 0))(
  ( (array!59709 (arr!28718 (Array (_ BitVec 32) ValueCell!10421)) (size!29198 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59708)

(declare-datatypes ((array!59710 0))(
  ( (array!59711 (arr!28719 (Array (_ BitVec 32) (_ BitVec 64))) (size!29199 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59710)

(declare-fun minValue!1342 () V!34057)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34057)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14074 0))(
  ( (tuple2!14075 (_1!7048 (_ BitVec 64)) (_2!7048 V!34057)) )
))
(declare-datatypes ((List!19922 0))(
  ( (Nil!19919) (Cons!19918 (h!21086 tuple2!14074) (t!28277 List!19922)) )
))
(declare-datatypes ((ListLongMap!12773 0))(
  ( (ListLongMap!12774 (toList!6402 List!19922)) )
))
(declare-fun contains!5514 (ListLongMap!12773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3635 (array!59710 array!59708 (_ BitVec 32) (_ BitVec 32) V!34057 V!34057 (_ BitVec 32) Int) ListLongMap!12773)

(assert (=> b!967693 (contains!5514 (getCurrentListMap!3635 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28719 _keys!1686) i!803))))

(declare-datatypes ((Unit!32262 0))(
  ( (Unit!32263) )
))
(declare-fun lt!431723 () Unit!32262)

(declare-fun lemmaInListMapFromThenInFromMinusOne!42 (array!59710 array!59708 (_ BitVec 32) (_ BitVec 32) V!34057 V!34057 (_ BitVec 32) (_ BitVec 32) Int) Unit!32262)

(assert (=> b!967693 (= lt!431723 (lemmaInListMapFromThenInFromMinusOne!42 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967694 () Bool)

(declare-fun res!647488 () Bool)

(assert (=> b!967694 (=> (not res!647488) (not e!545573))))

(assert (=> b!967694 (= res!647488 (and (= (size!29198 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29199 _keys!1686) (size!29198 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967695 () Bool)

(declare-fun res!647489 () Bool)

(assert (=> b!967695 (=> (not res!647489) (not e!545573))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967695 (= res!647489 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967696 () Bool)

(declare-fun e!545569 () Bool)

(assert (=> b!967696 (= e!545569 tp_is_empty!21805)))

(declare-fun b!967697 () Bool)

(declare-fun res!647484 () Bool)

(assert (=> b!967697 (=> (not res!647484) (not e!545573))))

(declare-datatypes ((List!19923 0))(
  ( (Nil!19920) (Cons!19919 (h!21087 (_ BitVec 64)) (t!28278 List!19923)) )
))
(declare-fun arrayNoDuplicates!0 (array!59710 (_ BitVec 32) List!19923) Bool)

(assert (=> b!967697 (= res!647484 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19920))))

(declare-fun b!967698 () Bool)

(declare-fun e!545572 () Bool)

(declare-fun mapRes!34702 () Bool)

(assert (=> b!967698 (= e!545572 (and e!545570 mapRes!34702))))

(declare-fun condMapEmpty!34702 () Bool)

(declare-fun mapDefault!34702 () ValueCell!10421)

(assert (=> b!967698 (= condMapEmpty!34702 (= (arr!28718 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10421)) mapDefault!34702)))))

(declare-fun res!647483 () Bool)

(assert (=> start!83038 (=> (not res!647483) (not e!545573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83038 (= res!647483 (validMask!0 mask!2110))))

(assert (=> start!83038 e!545573))

(assert (=> start!83038 true))

(declare-fun array_inv!22293 (array!59708) Bool)

(assert (=> start!83038 (and (array_inv!22293 _values!1400) e!545572)))

(declare-fun array_inv!22294 (array!59710) Bool)

(assert (=> start!83038 (array_inv!22294 _keys!1686)))

(assert (=> start!83038 tp!66121))

(assert (=> start!83038 tp_is_empty!21805))

(declare-fun mapIsEmpty!34702 () Bool)

(assert (=> mapIsEmpty!34702 mapRes!34702))

(declare-fun b!967699 () Bool)

(declare-fun res!647485 () Bool)

(assert (=> b!967699 (=> (not res!647485) (not e!545573))))

(assert (=> b!967699 (= res!647485 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29199 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29199 _keys!1686))))))

(declare-fun b!967700 () Bool)

(declare-fun res!647487 () Bool)

(assert (=> b!967700 (=> (not res!647487) (not e!545573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59710 (_ BitVec 32)) Bool)

(assert (=> b!967700 (= res!647487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967701 () Bool)

(declare-fun res!647486 () Bool)

(assert (=> b!967701 (=> (not res!647486) (not e!545573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967701 (= res!647486 (validKeyInArray!0 (select (arr!28719 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34702 () Bool)

(declare-fun tp!66120 () Bool)

(assert (=> mapNonEmpty!34702 (= mapRes!34702 (and tp!66120 e!545569))))

(declare-fun mapRest!34702 () (Array (_ BitVec 32) ValueCell!10421))

(declare-fun mapValue!34702 () ValueCell!10421)

(declare-fun mapKey!34702 () (_ BitVec 32))

(assert (=> mapNonEmpty!34702 (= (arr!28718 _values!1400) (store mapRest!34702 mapKey!34702 mapValue!34702))))

(declare-fun b!967702 () Bool)

(declare-fun res!647490 () Bool)

(assert (=> b!967702 (=> (not res!647490) (not e!545573))))

(assert (=> b!967702 (= res!647490 (contains!5514 (getCurrentListMap!3635 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28719 _keys!1686) i!803)))))

(assert (= (and start!83038 res!647483) b!967694))

(assert (= (and b!967694 res!647488) b!967700))

(assert (= (and b!967700 res!647487) b!967697))

(assert (= (and b!967697 res!647484) b!967699))

(assert (= (and b!967699 res!647485) b!967701))

(assert (= (and b!967701 res!647486) b!967702))

(assert (= (and b!967702 res!647490) b!967695))

(assert (= (and b!967695 res!647489) b!967693))

(assert (= (and b!967698 condMapEmpty!34702) mapIsEmpty!34702))

(assert (= (and b!967698 (not condMapEmpty!34702)) mapNonEmpty!34702))

(get-info :version)

(assert (= (and mapNonEmpty!34702 ((_ is ValueCellFull!10421) mapValue!34702)) b!967696))

(assert (= (and b!967698 ((_ is ValueCellFull!10421) mapDefault!34702)) b!967692))

(assert (= start!83038 b!967698))

(declare-fun m!896773 () Bool)

(assert (=> start!83038 m!896773))

(declare-fun m!896775 () Bool)

(assert (=> start!83038 m!896775))

(declare-fun m!896777 () Bool)

(assert (=> start!83038 m!896777))

(declare-fun m!896779 () Bool)

(assert (=> b!967702 m!896779))

(declare-fun m!896781 () Bool)

(assert (=> b!967702 m!896781))

(assert (=> b!967702 m!896779))

(assert (=> b!967702 m!896781))

(declare-fun m!896783 () Bool)

(assert (=> b!967702 m!896783))

(declare-fun m!896785 () Bool)

(assert (=> b!967697 m!896785))

(declare-fun m!896787 () Bool)

(assert (=> b!967700 m!896787))

(declare-fun m!896789 () Bool)

(assert (=> b!967693 m!896789))

(assert (=> b!967693 m!896781))

(assert (=> b!967693 m!896789))

(assert (=> b!967693 m!896781))

(declare-fun m!896791 () Bool)

(assert (=> b!967693 m!896791))

(declare-fun m!896793 () Bool)

(assert (=> b!967693 m!896793))

(assert (=> b!967701 m!896781))

(assert (=> b!967701 m!896781))

(declare-fun m!896795 () Bool)

(assert (=> b!967701 m!896795))

(declare-fun m!896797 () Bool)

(assert (=> mapNonEmpty!34702 m!896797))

(check-sat (not mapNonEmpty!34702) (not b!967697) (not b!967701) (not start!83038) (not b!967693) b_and!30495 (not b!967702) (not b!967700) tp_is_empty!21805 (not b_next!18997))
(check-sat b_and!30495 (not b_next!18997))
