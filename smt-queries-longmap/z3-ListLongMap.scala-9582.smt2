; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113356 () Bool)

(assert start!113356)

(declare-fun b_free!31407 () Bool)

(declare-fun b_next!31407 () Bool)

(assert (=> start!113356 (= b_free!31407 (not b_next!31407))))

(declare-fun tp!110026 () Bool)

(declare-fun b_and!50667 () Bool)

(assert (=> start!113356 (= tp!110026 b_and!50667)))

(declare-fun b!1345358 () Bool)

(declare-fun res!892686 () Bool)

(declare-fun e!765570 () Bool)

(assert (=> b!1345358 (=> (not res!892686) (not e!765570))))

(declare-datatypes ((array!91654 0))(
  ( (array!91655 (arr!44283 (Array (_ BitVec 32) (_ BitVec 64))) (size!44833 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91654)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1345358 (= res!892686 (not (= (select (arr!44283 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345359 () Bool)

(declare-fun e!765575 () Bool)

(assert (=> b!1345359 (= e!765570 e!765575)))

(declare-fun res!892682 () Bool)

(assert (=> b!1345359 (=> (not res!892682) (not e!765575))))

(declare-datatypes ((V!54979 0))(
  ( (V!54980 (val!18778 Int)) )
))
(declare-datatypes ((tuple2!24206 0))(
  ( (tuple2!24207 (_1!12114 (_ BitVec 64)) (_2!12114 V!54979)) )
))
(declare-datatypes ((List!31362 0))(
  ( (Nil!31359) (Cons!31358 (h!32567 tuple2!24206) (t!45926 List!31362)) )
))
(declare-datatypes ((ListLongMap!21863 0))(
  ( (ListLongMap!21864 (toList!10947 List!31362)) )
))
(declare-fun lt!595335 () ListLongMap!21863)

(declare-fun lt!595333 () V!54979)

(declare-fun contains!9123 (ListLongMap!21863 (_ BitVec 64)) Bool)

(declare-fun +!4828 (ListLongMap!21863 tuple2!24206) ListLongMap!21863)

(assert (=> b!1345359 (= res!892682 (contains!9123 (+!4828 lt!595335 (tuple2!24207 (select (arr!44283 _keys!1571) from!1960) lt!595333)) k0!1142))))

(declare-fun minValue!1245 () V!54979)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54979)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17805 0))(
  ( (ValueCellFull!17805 (v!21426 V!54979)) (EmptyCell!17805) )
))
(declare-datatypes ((array!91656 0))(
  ( (array!91657 (arr!44284 (Array (_ BitVec 32) ValueCell!17805)) (size!44834 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91656)

(declare-fun getCurrentListMapNoExtraKeys!6470 (array!91654 array!91656 (_ BitVec 32) (_ BitVec 32) V!54979 V!54979 (_ BitVec 32) Int) ListLongMap!21863)

(assert (=> b!1345359 (= lt!595335 (getCurrentListMapNoExtraKeys!6470 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22369 (ValueCell!17805 V!54979) V!54979)

(declare-fun dynLambda!3767 (Int (_ BitVec 64)) V!54979)

(assert (=> b!1345359 (= lt!595333 (get!22369 (select (arr!44284 _values!1303) from!1960) (dynLambda!3767 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!892676 () Bool)

(assert (=> start!113356 (=> (not res!892676) (not e!765570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113356 (= res!892676 (validMask!0 mask!1977))))

(assert (=> start!113356 e!765570))

(declare-fun tp_is_empty!37407 () Bool)

(assert (=> start!113356 tp_is_empty!37407))

(assert (=> start!113356 true))

(declare-fun array_inv!33371 (array!91654) Bool)

(assert (=> start!113356 (array_inv!33371 _keys!1571)))

(declare-fun e!765573 () Bool)

(declare-fun array_inv!33372 (array!91656) Bool)

(assert (=> start!113356 (and (array_inv!33372 _values!1303) e!765573)))

(assert (=> start!113356 tp!110026))

(declare-fun b!1345360 () Bool)

(declare-fun e!765572 () Bool)

(assert (=> b!1345360 (= e!765572 tp_is_empty!37407)))

(declare-fun mapIsEmpty!57817 () Bool)

(declare-fun mapRes!57817 () Bool)

(assert (=> mapIsEmpty!57817 mapRes!57817))

(declare-fun b!1345361 () Bool)

(declare-fun res!892685 () Bool)

(assert (=> b!1345361 (=> (not res!892685) (not e!765570))))

(assert (=> b!1345361 (= res!892685 (and (= (size!44834 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44833 _keys!1571) (size!44834 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345362 () Bool)

(declare-fun res!892678 () Bool)

(assert (=> b!1345362 (=> (not res!892678) (not e!765575))))

(assert (=> b!1345362 (= res!892678 (not (= k0!1142 (select (arr!44283 _keys!1571) from!1960))))))

(declare-fun mapNonEmpty!57817 () Bool)

(declare-fun tp!110025 () Bool)

(assert (=> mapNonEmpty!57817 (= mapRes!57817 (and tp!110025 e!765572))))

(declare-fun mapRest!57817 () (Array (_ BitVec 32) ValueCell!17805))

(declare-fun mapValue!57817 () ValueCell!17805)

(declare-fun mapKey!57817 () (_ BitVec 32))

(assert (=> mapNonEmpty!57817 (= (arr!44284 _values!1303) (store mapRest!57817 mapKey!57817 mapValue!57817))))

(declare-fun b!1345363 () Bool)

(declare-fun res!892681 () Bool)

(assert (=> b!1345363 (=> (not res!892681) (not e!765570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345363 (= res!892681 (validKeyInArray!0 (select (arr!44283 _keys!1571) from!1960)))))

(declare-fun b!1345364 () Bool)

(declare-fun res!892680 () Bool)

(assert (=> b!1345364 (=> (not res!892680) (not e!765570))))

(assert (=> b!1345364 (= res!892680 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44833 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345365 () Bool)

(declare-fun res!892679 () Bool)

(assert (=> b!1345365 (=> (not res!892679) (not e!765570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91654 (_ BitVec 32)) Bool)

(assert (=> b!1345365 (= res!892679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345366 () Bool)

(declare-fun res!892677 () Bool)

(assert (=> b!1345366 (=> (not res!892677) (not e!765570))))

(declare-datatypes ((List!31363 0))(
  ( (Nil!31360) (Cons!31359 (h!32568 (_ BitVec 64)) (t!45927 List!31363)) )
))
(declare-fun arrayNoDuplicates!0 (array!91654 (_ BitVec 32) List!31363) Bool)

(assert (=> b!1345366 (= res!892677 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31360))))

(declare-fun b!1345367 () Bool)

(declare-fun e!765571 () Bool)

(assert (=> b!1345367 (= e!765571 tp_is_empty!37407)))

(declare-fun b!1345368 () Bool)

(declare-fun res!892684 () Bool)

(assert (=> b!1345368 (=> (not res!892684) (not e!765570))))

(declare-fun getCurrentListMap!5901 (array!91654 array!91656 (_ BitVec 32) (_ BitVec 32) V!54979 V!54979 (_ BitVec 32) Int) ListLongMap!21863)

(assert (=> b!1345368 (= res!892684 (contains!9123 (getCurrentListMap!5901 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345369 () Bool)

(assert (=> b!1345369 (= e!765575 (not true))))

(assert (=> b!1345369 (contains!9123 lt!595335 k0!1142)))

(declare-datatypes ((Unit!44129 0))(
  ( (Unit!44130) )
))
(declare-fun lt!595334 () Unit!44129)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!395 ((_ BitVec 64) (_ BitVec 64) V!54979 ListLongMap!21863) Unit!44129)

(assert (=> b!1345369 (= lt!595334 (lemmaInListMapAfterAddingDiffThenInBefore!395 k0!1142 (select (arr!44283 _keys!1571) from!1960) lt!595333 lt!595335))))

(declare-fun b!1345370 () Bool)

(assert (=> b!1345370 (= e!765573 (and e!765571 mapRes!57817))))

(declare-fun condMapEmpty!57817 () Bool)

(declare-fun mapDefault!57817 () ValueCell!17805)

(assert (=> b!1345370 (= condMapEmpty!57817 (= (arr!44284 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17805)) mapDefault!57817)))))

(declare-fun b!1345371 () Bool)

(declare-fun res!892683 () Bool)

(assert (=> b!1345371 (=> (not res!892683) (not e!765570))))

(assert (=> b!1345371 (= res!892683 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!113356 res!892676) b!1345361))

(assert (= (and b!1345361 res!892685) b!1345365))

(assert (= (and b!1345365 res!892679) b!1345366))

(assert (= (and b!1345366 res!892677) b!1345364))

(assert (= (and b!1345364 res!892680) b!1345368))

(assert (= (and b!1345368 res!892684) b!1345358))

(assert (= (and b!1345358 res!892686) b!1345363))

(assert (= (and b!1345363 res!892681) b!1345371))

(assert (= (and b!1345371 res!892683) b!1345359))

(assert (= (and b!1345359 res!892682) b!1345362))

(assert (= (and b!1345362 res!892678) b!1345369))

(assert (= (and b!1345370 condMapEmpty!57817) mapIsEmpty!57817))

(assert (= (and b!1345370 (not condMapEmpty!57817)) mapNonEmpty!57817))

(get-info :version)

(assert (= (and mapNonEmpty!57817 ((_ is ValueCellFull!17805) mapValue!57817)) b!1345360))

(assert (= (and b!1345370 ((_ is ValueCellFull!17805) mapDefault!57817)) b!1345367))

(assert (= start!113356 b!1345370))

(declare-fun b_lambda!24529 () Bool)

(assert (=> (not b_lambda!24529) (not b!1345359)))

(declare-fun t!45925 () Bool)

(declare-fun tb!12367 () Bool)

(assert (=> (and start!113356 (= defaultEntry!1306 defaultEntry!1306) t!45925) tb!12367))

(declare-fun result!25825 () Bool)

(assert (=> tb!12367 (= result!25825 tp_is_empty!37407)))

(assert (=> b!1345359 t!45925))

(declare-fun b_and!50669 () Bool)

(assert (= b_and!50667 (and (=> t!45925 result!25825) b_and!50669)))

(declare-fun m!1232767 () Bool)

(assert (=> b!1345359 m!1232767))

(declare-fun m!1232769 () Bool)

(assert (=> b!1345359 m!1232769))

(declare-fun m!1232771 () Bool)

(assert (=> b!1345359 m!1232771))

(declare-fun m!1232773 () Bool)

(assert (=> b!1345359 m!1232773))

(declare-fun m!1232775 () Bool)

(assert (=> b!1345359 m!1232775))

(assert (=> b!1345359 m!1232771))

(assert (=> b!1345359 m!1232773))

(assert (=> b!1345359 m!1232767))

(declare-fun m!1232777 () Bool)

(assert (=> b!1345359 m!1232777))

(declare-fun m!1232779 () Bool)

(assert (=> b!1345359 m!1232779))

(declare-fun m!1232781 () Bool)

(assert (=> b!1345365 m!1232781))

(assert (=> b!1345358 m!1232779))

(assert (=> b!1345363 m!1232779))

(assert (=> b!1345363 m!1232779))

(declare-fun m!1232783 () Bool)

(assert (=> b!1345363 m!1232783))

(assert (=> b!1345362 m!1232779))

(declare-fun m!1232785 () Bool)

(assert (=> b!1345369 m!1232785))

(assert (=> b!1345369 m!1232779))

(assert (=> b!1345369 m!1232779))

(declare-fun m!1232787 () Bool)

(assert (=> b!1345369 m!1232787))

(declare-fun m!1232789 () Bool)

(assert (=> b!1345366 m!1232789))

(declare-fun m!1232791 () Bool)

(assert (=> mapNonEmpty!57817 m!1232791))

(declare-fun m!1232793 () Bool)

(assert (=> b!1345368 m!1232793))

(assert (=> b!1345368 m!1232793))

(declare-fun m!1232795 () Bool)

(assert (=> b!1345368 m!1232795))

(declare-fun m!1232797 () Bool)

(assert (=> start!113356 m!1232797))

(declare-fun m!1232799 () Bool)

(assert (=> start!113356 m!1232799))

(declare-fun m!1232801 () Bool)

(assert (=> start!113356 m!1232801))

(check-sat (not start!113356) (not b!1345369) (not b!1345363) (not b!1345365) (not b_next!31407) (not b!1345359) (not b!1345366) (not mapNonEmpty!57817) tp_is_empty!37407 (not b!1345368) b_and!50669 (not b_lambda!24529))
(check-sat b_and!50669 (not b_next!31407))
