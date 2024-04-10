; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40254 () Bool)

(assert start!40254)

(declare-fun b_free!10521 () Bool)

(declare-fun b_next!10521 () Bool)

(assert (=> start!40254 (= b_free!10521 (not b_next!10521))))

(declare-fun tp!37092 () Bool)

(declare-fun b_and!18489 () Bool)

(assert (=> start!40254 (= tp!37092 b_and!18489)))

(declare-fun mapNonEmpty!19131 () Bool)

(declare-fun mapRes!19131 () Bool)

(declare-fun tp!37091 () Bool)

(declare-fun e!260112 () Bool)

(assert (=> mapNonEmpty!19131 (= mapRes!19131 (and tp!37091 e!260112))))

(declare-datatypes ((V!16669 0))(
  ( (V!16670 (val!5881 Int)) )
))
(declare-datatypes ((ValueCell!5493 0))(
  ( (ValueCellFull!5493 (v!8128 V!16669)) (EmptyCell!5493) )
))
(declare-fun mapRest!19131 () (Array (_ BitVec 32) ValueCell!5493))

(declare-fun mapKey!19131 () (_ BitVec 32))

(declare-datatypes ((array!27157 0))(
  ( (array!27158 (arr!13028 (Array (_ BitVec 32) ValueCell!5493)) (size!13380 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27157)

(declare-fun mapValue!19131 () ValueCell!5493)

(assert (=> mapNonEmpty!19131 (= (arr!13028 _values!549) (store mapRest!19131 mapKey!19131 mapValue!19131))))

(declare-fun b!441860 () Bool)

(declare-fun res!261659 () Bool)

(declare-fun e!260117 () Bool)

(assert (=> b!441860 (=> (not res!261659) (not e!260117))))

(declare-datatypes ((array!27159 0))(
  ( (array!27160 (arr!13029 (Array (_ BitVec 32) (_ BitVec 64))) (size!13381 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27159)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27159 (_ BitVec 32)) Bool)

(assert (=> b!441860 (= res!261659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441861 () Bool)

(declare-fun res!261662 () Bool)

(assert (=> b!441861 (=> (not res!261662) (not e!260117))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441861 (= res!261662 (or (= (select (arr!13029 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13029 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441862 () Bool)

(declare-fun res!261657 () Bool)

(assert (=> b!441862 (=> (not res!261657) (not e!260117))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!441862 (= res!261657 (and (= (size!13380 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13381 _keys!709) (size!13380 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!261655 () Bool)

(assert (=> start!40254 (=> (not res!261655) (not e!260117))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40254 (= res!261655 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13381 _keys!709))))))

(assert (=> start!40254 e!260117))

(declare-fun tp_is_empty!11673 () Bool)

(assert (=> start!40254 tp_is_empty!11673))

(assert (=> start!40254 tp!37092))

(assert (=> start!40254 true))

(declare-fun e!260118 () Bool)

(declare-fun array_inv!9456 (array!27157) Bool)

(assert (=> start!40254 (and (array_inv!9456 _values!549) e!260118)))

(declare-fun array_inv!9457 (array!27159) Bool)

(assert (=> start!40254 (array_inv!9457 _keys!709)))

(declare-fun b!441863 () Bool)

(declare-fun e!260113 () Bool)

(assert (=> b!441863 (= e!260117 e!260113)))

(declare-fun res!261653 () Bool)

(assert (=> b!441863 (=> (not res!261653) (not e!260113))))

(declare-fun lt!203030 () array!27159)

(assert (=> b!441863 (= res!261653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203030 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!441863 (= lt!203030 (array!27160 (store (arr!13029 _keys!709) i!563 k0!794) (size!13381 _keys!709)))))

(declare-fun b!441864 () Bool)

(assert (=> b!441864 (= e!260112 tp_is_empty!11673)))

(declare-fun b!441865 () Bool)

(declare-fun e!260114 () Bool)

(assert (=> b!441865 (= e!260113 e!260114)))

(declare-fun res!261656 () Bool)

(assert (=> b!441865 (=> (not res!261656) (not e!260114))))

(assert (=> b!441865 (= res!261656 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16669)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16669)

(declare-fun lt!203027 () array!27157)

(declare-datatypes ((tuple2!7828 0))(
  ( (tuple2!7829 (_1!3925 (_ BitVec 64)) (_2!3925 V!16669)) )
))
(declare-datatypes ((List!7823 0))(
  ( (Nil!7820) (Cons!7819 (h!8675 tuple2!7828) (t!13579 List!7823)) )
))
(declare-datatypes ((ListLongMap!6741 0))(
  ( (ListLongMap!6742 (toList!3386 List!7823)) )
))
(declare-fun lt!203028 () ListLongMap!6741)

(declare-fun getCurrentListMapNoExtraKeys!1575 (array!27159 array!27157 (_ BitVec 32) (_ BitVec 32) V!16669 V!16669 (_ BitVec 32) Int) ListLongMap!6741)

(assert (=> b!441865 (= lt!203028 (getCurrentListMapNoExtraKeys!1575 lt!203030 lt!203027 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16669)

(assert (=> b!441865 (= lt!203027 (array!27158 (store (arr!13028 _values!549) i!563 (ValueCellFull!5493 v!412)) (size!13380 _values!549)))))

(declare-fun lt!203029 () ListLongMap!6741)

(assert (=> b!441865 (= lt!203029 (getCurrentListMapNoExtraKeys!1575 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441866 () Bool)

(declare-fun res!261654 () Bool)

(assert (=> b!441866 (=> (not res!261654) (not e!260113))))

(assert (=> b!441866 (= res!261654 (bvsle from!863 i!563))))

(declare-fun b!441867 () Bool)

(declare-fun e!260116 () Bool)

(assert (=> b!441867 (= e!260118 (and e!260116 mapRes!19131))))

(declare-fun condMapEmpty!19131 () Bool)

(declare-fun mapDefault!19131 () ValueCell!5493)

(assert (=> b!441867 (= condMapEmpty!19131 (= (arr!13028 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5493)) mapDefault!19131)))))

(declare-fun b!441868 () Bool)

(assert (=> b!441868 (= e!260116 tp_is_empty!11673)))

(declare-fun b!441869 () Bool)

(declare-fun res!261661 () Bool)

(assert (=> b!441869 (=> (not res!261661) (not e!260117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441869 (= res!261661 (validMask!0 mask!1025))))

(declare-fun b!441870 () Bool)

(assert (=> b!441870 (= e!260114 (not true))))

(declare-fun +!1522 (ListLongMap!6741 tuple2!7828) ListLongMap!6741)

(assert (=> b!441870 (= (getCurrentListMapNoExtraKeys!1575 lt!203030 lt!203027 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1522 (getCurrentListMapNoExtraKeys!1575 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7829 k0!794 v!412)))))

(declare-datatypes ((Unit!13148 0))(
  ( (Unit!13149) )
))
(declare-fun lt!203026 () Unit!13148)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!691 (array!27159 array!27157 (_ BitVec 32) (_ BitVec 32) V!16669 V!16669 (_ BitVec 32) (_ BitVec 64) V!16669 (_ BitVec 32) Int) Unit!13148)

(assert (=> b!441870 (= lt!203026 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!691 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441871 () Bool)

(declare-fun res!261651 () Bool)

(assert (=> b!441871 (=> (not res!261651) (not e!260117))))

(assert (=> b!441871 (= res!261651 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13381 _keys!709))))))

(declare-fun b!441872 () Bool)

(declare-fun res!261658 () Bool)

(assert (=> b!441872 (=> (not res!261658) (not e!260117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441872 (= res!261658 (validKeyInArray!0 k0!794))))

(declare-fun b!441873 () Bool)

(declare-fun res!261660 () Bool)

(assert (=> b!441873 (=> (not res!261660) (not e!260113))))

(declare-datatypes ((List!7824 0))(
  ( (Nil!7821) (Cons!7820 (h!8676 (_ BitVec 64)) (t!13580 List!7824)) )
))
(declare-fun arrayNoDuplicates!0 (array!27159 (_ BitVec 32) List!7824) Bool)

(assert (=> b!441873 (= res!261660 (arrayNoDuplicates!0 lt!203030 #b00000000000000000000000000000000 Nil!7821))))

(declare-fun mapIsEmpty!19131 () Bool)

(assert (=> mapIsEmpty!19131 mapRes!19131))

(declare-fun b!441874 () Bool)

(declare-fun res!261663 () Bool)

(assert (=> b!441874 (=> (not res!261663) (not e!260117))))

(declare-fun arrayContainsKey!0 (array!27159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441874 (= res!261663 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441875 () Bool)

(declare-fun res!261652 () Bool)

(assert (=> b!441875 (=> (not res!261652) (not e!260117))))

(assert (=> b!441875 (= res!261652 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7821))))

(assert (= (and start!40254 res!261655) b!441869))

(assert (= (and b!441869 res!261661) b!441862))

(assert (= (and b!441862 res!261657) b!441860))

(assert (= (and b!441860 res!261659) b!441875))

(assert (= (and b!441875 res!261652) b!441871))

(assert (= (and b!441871 res!261651) b!441872))

(assert (= (and b!441872 res!261658) b!441861))

(assert (= (and b!441861 res!261662) b!441874))

(assert (= (and b!441874 res!261663) b!441863))

(assert (= (and b!441863 res!261653) b!441873))

(assert (= (and b!441873 res!261660) b!441866))

(assert (= (and b!441866 res!261654) b!441865))

(assert (= (and b!441865 res!261656) b!441870))

(assert (= (and b!441867 condMapEmpty!19131) mapIsEmpty!19131))

(assert (= (and b!441867 (not condMapEmpty!19131)) mapNonEmpty!19131))

(get-info :version)

(assert (= (and mapNonEmpty!19131 ((_ is ValueCellFull!5493) mapValue!19131)) b!441864))

(assert (= (and b!441867 ((_ is ValueCellFull!5493) mapDefault!19131)) b!441868))

(assert (= start!40254 b!441867))

(declare-fun m!428609 () Bool)

(assert (=> b!441873 m!428609))

(declare-fun m!428611 () Bool)

(assert (=> b!441875 m!428611))

(declare-fun m!428613 () Bool)

(assert (=> b!441860 m!428613))

(declare-fun m!428615 () Bool)

(assert (=> b!441865 m!428615))

(declare-fun m!428617 () Bool)

(assert (=> b!441865 m!428617))

(declare-fun m!428619 () Bool)

(assert (=> b!441865 m!428619))

(declare-fun m!428621 () Bool)

(assert (=> b!441870 m!428621))

(declare-fun m!428623 () Bool)

(assert (=> b!441870 m!428623))

(assert (=> b!441870 m!428623))

(declare-fun m!428625 () Bool)

(assert (=> b!441870 m!428625))

(declare-fun m!428627 () Bool)

(assert (=> b!441870 m!428627))

(declare-fun m!428629 () Bool)

(assert (=> b!441874 m!428629))

(declare-fun m!428631 () Bool)

(assert (=> b!441863 m!428631))

(declare-fun m!428633 () Bool)

(assert (=> b!441863 m!428633))

(declare-fun m!428635 () Bool)

(assert (=> b!441869 m!428635))

(declare-fun m!428637 () Bool)

(assert (=> b!441872 m!428637))

(declare-fun m!428639 () Bool)

(assert (=> start!40254 m!428639))

(declare-fun m!428641 () Bool)

(assert (=> start!40254 m!428641))

(declare-fun m!428643 () Bool)

(assert (=> b!441861 m!428643))

(declare-fun m!428645 () Bool)

(assert (=> mapNonEmpty!19131 m!428645))

(check-sat tp_is_empty!11673 (not b!441869) (not mapNonEmpty!19131) (not b!441874) (not b!441875) (not b!441873) (not b!441863) (not b!441860) (not b!441872) b_and!18489 (not b!441865) (not start!40254) (not b!441870) (not b_next!10521))
(check-sat b_and!18489 (not b_next!10521))
