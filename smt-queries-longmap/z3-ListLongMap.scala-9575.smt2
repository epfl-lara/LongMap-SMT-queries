; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113536 () Bool)

(assert start!113536)

(declare-fun b_free!31363 () Bool)

(declare-fun b_next!31363 () Bool)

(assert (=> start!113536 (= b_free!31363 (not b_next!31363))))

(declare-fun tp!109893 () Bool)

(declare-fun b_and!50587 () Bool)

(assert (=> start!113536 (= tp!109893 b_and!50587)))

(declare-fun b!1345752 () Bool)

(declare-fun e!766042 () Bool)

(declare-fun tp_is_empty!37363 () Bool)

(assert (=> b!1345752 (= e!766042 tp_is_empty!37363)))

(declare-fun b!1345753 () Bool)

(declare-fun e!766043 () Bool)

(declare-fun e!766046 () Bool)

(declare-fun mapRes!57751 () Bool)

(assert (=> b!1345753 (= e!766043 (and e!766046 mapRes!57751))))

(declare-fun condMapEmpty!57751 () Bool)

(declare-datatypes ((V!54921 0))(
  ( (V!54922 (val!18756 Int)) )
))
(declare-datatypes ((ValueCell!17783 0))(
  ( (ValueCellFull!17783 (v!21399 V!54921)) (EmptyCell!17783) )
))
(declare-datatypes ((array!91675 0))(
  ( (array!91676 (arr!44289 (Array (_ BitVec 32) ValueCell!17783)) (size!44840 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91675)

(declare-fun mapDefault!57751 () ValueCell!17783)

(assert (=> b!1345753 (= condMapEmpty!57751 (= (arr!44289 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17783)) mapDefault!57751)))))

(declare-fun b!1345755 () Bool)

(declare-fun res!892530 () Bool)

(declare-fun e!766044 () Bool)

(assert (=> b!1345755 (=> (not res!892530) (not e!766044))))

(declare-datatypes ((array!91677 0))(
  ( (array!91678 (arr!44290 (Array (_ BitVec 32) (_ BitVec 64))) (size!44841 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91677)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345755 (= res!892530 (validKeyInArray!0 (select (arr!44290 _keys!1571) from!1960)))))

(declare-fun b!1345756 () Bool)

(declare-fun res!892525 () Bool)

(assert (=> b!1345756 (=> (not res!892525) (not e!766044))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345756 (= res!892525 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44841 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345757 () Bool)

(declare-fun res!892526 () Bool)

(assert (=> b!1345757 (=> (not res!892526) (not e!766044))))

(declare-fun minValue!1245 () V!54921)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54921)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24214 0))(
  ( (tuple2!24215 (_1!12118 (_ BitVec 64)) (_2!12118 V!54921)) )
))
(declare-datatypes ((List!31357 0))(
  ( (Nil!31354) (Cons!31353 (h!32571 tuple2!24214) (t!45873 List!31357)) )
))
(declare-datatypes ((ListLongMap!21879 0))(
  ( (ListLongMap!21880 (toList!10955 List!31357)) )
))
(declare-fun contains!9143 (ListLongMap!21879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5899 (array!91677 array!91675 (_ BitVec 32) (_ BitVec 32) V!54921 V!54921 (_ BitVec 32) Int) ListLongMap!21879)

(assert (=> b!1345757 (= res!892526 (contains!9143 (getCurrentListMap!5899 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345758 () Bool)

(declare-fun res!892528 () Bool)

(assert (=> b!1345758 (=> (not res!892528) (not e!766044))))

(assert (=> b!1345758 (= res!892528 (not (= (select (arr!44290 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57751 () Bool)

(assert (=> mapIsEmpty!57751 mapRes!57751))

(declare-fun b!1345759 () Bool)

(declare-fun res!892531 () Bool)

(assert (=> b!1345759 (=> (not res!892531) (not e!766044))))

(declare-datatypes ((List!31358 0))(
  ( (Nil!31355) (Cons!31354 (h!32572 (_ BitVec 64)) (t!45874 List!31358)) )
))
(declare-fun arrayNoDuplicates!0 (array!91677 (_ BitVec 32) List!31358) Bool)

(assert (=> b!1345759 (= res!892531 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31355))))

(declare-fun b!1345754 () Bool)

(assert (=> b!1345754 (= e!766046 tp_is_empty!37363)))

(declare-fun res!892529 () Bool)

(assert (=> start!113536 (=> (not res!892529) (not e!766044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113536 (= res!892529 (validMask!0 mask!1977))))

(assert (=> start!113536 e!766044))

(assert (=> start!113536 tp_is_empty!37363))

(assert (=> start!113536 true))

(declare-fun array_inv!33647 (array!91677) Bool)

(assert (=> start!113536 (array_inv!33647 _keys!1571)))

(declare-fun array_inv!33648 (array!91675) Bool)

(assert (=> start!113536 (and (array_inv!33648 _values!1303) e!766043)))

(assert (=> start!113536 tp!109893))

(declare-fun mapNonEmpty!57751 () Bool)

(declare-fun tp!109894 () Bool)

(assert (=> mapNonEmpty!57751 (= mapRes!57751 (and tp!109894 e!766042))))

(declare-fun mapValue!57751 () ValueCell!17783)

(declare-fun mapKey!57751 () (_ BitVec 32))

(declare-fun mapRest!57751 () (Array (_ BitVec 32) ValueCell!17783))

(assert (=> mapNonEmpty!57751 (= (arr!44289 _values!1303) (store mapRest!57751 mapKey!57751 mapValue!57751))))

(declare-fun b!1345760 () Bool)

(declare-fun res!892527 () Bool)

(assert (=> b!1345760 (=> (not res!892527) (not e!766044))))

(assert (=> b!1345760 (= res!892527 (and (= (size!44840 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44841 _keys!1571) (size!44840 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345761 () Bool)

(declare-fun res!892532 () Bool)

(assert (=> b!1345761 (=> (not res!892532) (not e!766044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91677 (_ BitVec 32)) Bool)

(assert (=> b!1345761 (= res!892532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345762 () Bool)

(assert (=> b!1345762 (= e!766044 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(assert (= (and start!113536 res!892529) b!1345760))

(assert (= (and b!1345760 res!892527) b!1345761))

(assert (= (and b!1345761 res!892532) b!1345759))

(assert (= (and b!1345759 res!892531) b!1345756))

(assert (= (and b!1345756 res!892525) b!1345757))

(assert (= (and b!1345757 res!892526) b!1345758))

(assert (= (and b!1345758 res!892528) b!1345755))

(assert (= (and b!1345755 res!892530) b!1345762))

(assert (= (and b!1345753 condMapEmpty!57751) mapIsEmpty!57751))

(assert (= (and b!1345753 (not condMapEmpty!57751)) mapNonEmpty!57751))

(get-info :version)

(assert (= (and mapNonEmpty!57751 ((_ is ValueCellFull!17783) mapValue!57751)) b!1345752))

(assert (= (and b!1345753 ((_ is ValueCellFull!17783) mapDefault!57751)) b!1345754))

(assert (= start!113536 b!1345753))

(declare-fun m!1233645 () Bool)

(assert (=> b!1345755 m!1233645))

(assert (=> b!1345755 m!1233645))

(declare-fun m!1233647 () Bool)

(assert (=> b!1345755 m!1233647))

(declare-fun m!1233649 () Bool)

(assert (=> mapNonEmpty!57751 m!1233649))

(assert (=> b!1345758 m!1233645))

(declare-fun m!1233651 () Bool)

(assert (=> b!1345757 m!1233651))

(assert (=> b!1345757 m!1233651))

(declare-fun m!1233653 () Bool)

(assert (=> b!1345757 m!1233653))

(declare-fun m!1233655 () Bool)

(assert (=> b!1345761 m!1233655))

(declare-fun m!1233657 () Bool)

(assert (=> b!1345759 m!1233657))

(declare-fun m!1233659 () Bool)

(assert (=> start!113536 m!1233659))

(declare-fun m!1233661 () Bool)

(assert (=> start!113536 m!1233661))

(declare-fun m!1233663 () Bool)

(assert (=> start!113536 m!1233663))

(check-sat (not b!1345759) tp_is_empty!37363 (not b!1345755) (not b!1345761) (not start!113536) b_and!50587 (not b!1345757) (not b_next!31363) (not mapNonEmpty!57751))
(check-sat b_and!50587 (not b_next!31363))
