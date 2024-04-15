; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20362 () Bool)

(assert start!20362)

(declare-fun b_free!5017 () Bool)

(declare-fun b_next!5017 () Bool)

(assert (=> start!20362 (= b_free!5017 (not b_next!5017))))

(declare-fun tp!18082 () Bool)

(declare-fun b_and!11737 () Bool)

(assert (=> start!20362 (= tp!18082 b_and!11737)))

(declare-fun b!200788 () Bool)

(declare-fun res!95782 () Bool)

(declare-fun e!131629 () Bool)

(assert (=> b!200788 (=> (not res!95782) (not e!131629))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200788 (= res!95782 (validKeyInArray!0 k0!843))))

(declare-fun b!200789 () Bool)

(declare-fun e!131626 () Bool)

(declare-fun e!131631 () Bool)

(declare-fun mapRes!8378 () Bool)

(assert (=> b!200789 (= e!131626 (and e!131631 mapRes!8378))))

(declare-fun condMapEmpty!8378 () Bool)

(declare-datatypes ((V!6145 0))(
  ( (V!6146 (val!2481 Int)) )
))
(declare-datatypes ((ValueCell!2093 0))(
  ( (ValueCellFull!2093 (v!4445 V!6145)) (EmptyCell!2093) )
))
(declare-datatypes ((array!8963 0))(
  ( (array!8964 (arr!4231 (Array (_ BitVec 32) ValueCell!2093)) (size!4557 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8963)

(declare-fun mapDefault!8378 () ValueCell!2093)

(assert (=> b!200789 (= condMapEmpty!8378 (= (arr!4231 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2093)) mapDefault!8378)))))

(declare-fun b!200790 () Bool)

(declare-fun res!95780 () Bool)

(assert (=> b!200790 (=> (not res!95780) (not e!131629))))

(declare-datatypes ((array!8965 0))(
  ( (array!8966 (arr!4232 (Array (_ BitVec 32) (_ BitVec 64))) (size!4558 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8965)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8965 (_ BitVec 32)) Bool)

(assert (=> b!200790 (= res!95780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200791 () Bool)

(declare-fun e!131630 () Bool)

(assert (=> b!200791 (= e!131629 (not e!131630))))

(declare-fun res!95784 () Bool)

(assert (=> b!200791 (=> res!95784 e!131630)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200791 (= res!95784 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6145)

(declare-fun zeroValue!615 () V!6145)

(declare-datatypes ((tuple2!3728 0))(
  ( (tuple2!3729 (_1!1875 (_ BitVec 64)) (_2!1875 V!6145)) )
))
(declare-datatypes ((List!2650 0))(
  ( (Nil!2647) (Cons!2646 (h!3288 tuple2!3728) (t!7572 List!2650)) )
))
(declare-datatypes ((ListLongMap!2631 0))(
  ( (ListLongMap!2632 (toList!1331 List!2650)) )
))
(declare-fun lt!99528 () ListLongMap!2631)

(declare-fun getCurrentListMap!896 (array!8965 array!8963 (_ BitVec 32) (_ BitVec 32) V!6145 V!6145 (_ BitVec 32) Int) ListLongMap!2631)

(assert (=> b!200791 (= lt!99528 (getCurrentListMap!896 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99524 () array!8963)

(declare-fun lt!99516 () ListLongMap!2631)

(assert (=> b!200791 (= lt!99516 (getCurrentListMap!896 _keys!825 lt!99524 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99520 () ListLongMap!2631)

(declare-fun lt!99525 () ListLongMap!2631)

(assert (=> b!200791 (and (= lt!99520 lt!99525) (= lt!99525 lt!99520))))

(declare-fun lt!99530 () ListLongMap!2631)

(declare-fun lt!99527 () tuple2!3728)

(declare-fun +!380 (ListLongMap!2631 tuple2!3728) ListLongMap!2631)

(assert (=> b!200791 (= lt!99525 (+!380 lt!99530 lt!99527))))

(declare-fun v!520 () V!6145)

(assert (=> b!200791 (= lt!99527 (tuple2!3729 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6012 0))(
  ( (Unit!6013) )
))
(declare-fun lt!99518 () Unit!6012)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!55 (array!8965 array!8963 (_ BitVec 32) (_ BitVec 32) V!6145 V!6145 (_ BitVec 32) (_ BitVec 64) V!6145 (_ BitVec 32) Int) Unit!6012)

(assert (=> b!200791 (= lt!99518 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!55 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!306 (array!8965 array!8963 (_ BitVec 32) (_ BitVec 32) V!6145 V!6145 (_ BitVec 32) Int) ListLongMap!2631)

(assert (=> b!200791 (= lt!99520 (getCurrentListMapNoExtraKeys!306 _keys!825 lt!99524 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200791 (= lt!99524 (array!8964 (store (arr!4231 _values!649) i!601 (ValueCellFull!2093 v!520)) (size!4557 _values!649)))))

(assert (=> b!200791 (= lt!99530 (getCurrentListMapNoExtraKeys!306 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8378 () Bool)

(assert (=> mapIsEmpty!8378 mapRes!8378))

(declare-fun b!200792 () Bool)

(declare-fun res!95781 () Bool)

(assert (=> b!200792 (=> (not res!95781) (not e!131629))))

(assert (=> b!200792 (= res!95781 (and (= (size!4557 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4558 _keys!825) (size!4557 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200793 () Bool)

(declare-fun e!131628 () Bool)

(assert (=> b!200793 (= e!131630 e!131628)))

(declare-fun res!95783 () Bool)

(assert (=> b!200793 (=> res!95783 e!131628)))

(assert (=> b!200793 (= res!95783 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99523 () ListLongMap!2631)

(declare-fun lt!99519 () ListLongMap!2631)

(assert (=> b!200793 (= lt!99523 lt!99519)))

(declare-fun lt!99526 () ListLongMap!2631)

(assert (=> b!200793 (= lt!99519 (+!380 lt!99526 lt!99527))))

(declare-fun lt!99522 () Unit!6012)

(declare-fun addCommutativeForDiffKeys!89 (ListLongMap!2631 (_ BitVec 64) V!6145 (_ BitVec 64) V!6145) Unit!6012)

(assert (=> b!200793 (= lt!99522 (addCommutativeForDiffKeys!89 lt!99530 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99515 () tuple2!3728)

(assert (=> b!200793 (= lt!99516 (+!380 lt!99523 lt!99515))))

(declare-fun lt!99521 () tuple2!3728)

(assert (=> b!200793 (= lt!99523 (+!380 lt!99525 lt!99521))))

(declare-fun lt!99529 () ListLongMap!2631)

(assert (=> b!200793 (= lt!99528 lt!99529)))

(assert (=> b!200793 (= lt!99529 (+!380 lt!99526 lt!99515))))

(assert (=> b!200793 (= lt!99526 (+!380 lt!99530 lt!99521))))

(assert (=> b!200793 (= lt!99516 (+!380 (+!380 lt!99520 lt!99521) lt!99515))))

(assert (=> b!200793 (= lt!99515 (tuple2!3729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200793 (= lt!99521 (tuple2!3729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!95786 () Bool)

(assert (=> start!20362 (=> (not res!95786) (not e!131629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20362 (= res!95786 (validMask!0 mask!1149))))

(assert (=> start!20362 e!131629))

(declare-fun array_inv!2761 (array!8963) Bool)

(assert (=> start!20362 (and (array_inv!2761 _values!649) e!131626)))

(assert (=> start!20362 true))

(declare-fun tp_is_empty!4873 () Bool)

(assert (=> start!20362 tp_is_empty!4873))

(declare-fun array_inv!2762 (array!8965) Bool)

(assert (=> start!20362 (array_inv!2762 _keys!825)))

(assert (=> start!20362 tp!18082))

(declare-fun b!200787 () Bool)

(declare-fun e!131625 () Bool)

(assert (=> b!200787 (= e!131625 tp_is_empty!4873)))

(declare-fun b!200794 () Bool)

(declare-fun res!95779 () Bool)

(assert (=> b!200794 (=> (not res!95779) (not e!131629))))

(assert (=> b!200794 (= res!95779 (= (select (arr!4232 _keys!825) i!601) k0!843))))

(declare-fun b!200795 () Bool)

(assert (=> b!200795 (= e!131631 tp_is_empty!4873)))

(declare-fun b!200796 () Bool)

(declare-fun res!95778 () Bool)

(assert (=> b!200796 (=> (not res!95778) (not e!131629))))

(declare-datatypes ((List!2651 0))(
  ( (Nil!2648) (Cons!2647 (h!3289 (_ BitVec 64)) (t!7573 List!2651)) )
))
(declare-fun arrayNoDuplicates!0 (array!8965 (_ BitVec 32) List!2651) Bool)

(assert (=> b!200796 (= res!95778 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2648))))

(declare-fun b!200797 () Bool)

(assert (=> b!200797 (= e!131628 true)))

(assert (=> b!200797 (= (+!380 lt!99519 lt!99515) (+!380 lt!99529 lt!99527))))

(declare-fun lt!99517 () Unit!6012)

(assert (=> b!200797 (= lt!99517 (addCommutativeForDiffKeys!89 lt!99526 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8378 () Bool)

(declare-fun tp!18083 () Bool)

(assert (=> mapNonEmpty!8378 (= mapRes!8378 (and tp!18083 e!131625))))

(declare-fun mapKey!8378 () (_ BitVec 32))

(declare-fun mapValue!8378 () ValueCell!2093)

(declare-fun mapRest!8378 () (Array (_ BitVec 32) ValueCell!2093))

(assert (=> mapNonEmpty!8378 (= (arr!4231 _values!649) (store mapRest!8378 mapKey!8378 mapValue!8378))))

(declare-fun b!200798 () Bool)

(declare-fun res!95785 () Bool)

(assert (=> b!200798 (=> (not res!95785) (not e!131629))))

(assert (=> b!200798 (= res!95785 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4558 _keys!825))))))

(assert (= (and start!20362 res!95786) b!200792))

(assert (= (and b!200792 res!95781) b!200790))

(assert (= (and b!200790 res!95780) b!200796))

(assert (= (and b!200796 res!95778) b!200798))

(assert (= (and b!200798 res!95785) b!200788))

(assert (= (and b!200788 res!95782) b!200794))

(assert (= (and b!200794 res!95779) b!200791))

(assert (= (and b!200791 (not res!95784)) b!200793))

(assert (= (and b!200793 (not res!95783)) b!200797))

(assert (= (and b!200789 condMapEmpty!8378) mapIsEmpty!8378))

(assert (= (and b!200789 (not condMapEmpty!8378)) mapNonEmpty!8378))

(get-info :version)

(assert (= (and mapNonEmpty!8378 ((_ is ValueCellFull!2093) mapValue!8378)) b!200787))

(assert (= (and b!200789 ((_ is ValueCellFull!2093) mapDefault!8378)) b!200795))

(assert (= start!20362 b!200789))

(declare-fun m!227019 () Bool)

(assert (=> start!20362 m!227019))

(declare-fun m!227021 () Bool)

(assert (=> start!20362 m!227021))

(declare-fun m!227023 () Bool)

(assert (=> start!20362 m!227023))

(declare-fun m!227025 () Bool)

(assert (=> b!200797 m!227025))

(declare-fun m!227027 () Bool)

(assert (=> b!200797 m!227027))

(declare-fun m!227029 () Bool)

(assert (=> b!200797 m!227029))

(declare-fun m!227031 () Bool)

(assert (=> b!200793 m!227031))

(declare-fun m!227033 () Bool)

(assert (=> b!200793 m!227033))

(declare-fun m!227035 () Bool)

(assert (=> b!200793 m!227035))

(declare-fun m!227037 () Bool)

(assert (=> b!200793 m!227037))

(declare-fun m!227039 () Bool)

(assert (=> b!200793 m!227039))

(declare-fun m!227041 () Bool)

(assert (=> b!200793 m!227041))

(assert (=> b!200793 m!227033))

(declare-fun m!227043 () Bool)

(assert (=> b!200793 m!227043))

(declare-fun m!227045 () Bool)

(assert (=> b!200793 m!227045))

(declare-fun m!227047 () Bool)

(assert (=> mapNonEmpty!8378 m!227047))

(declare-fun m!227049 () Bool)

(assert (=> b!200790 m!227049))

(declare-fun m!227051 () Bool)

(assert (=> b!200788 m!227051))

(declare-fun m!227053 () Bool)

(assert (=> b!200791 m!227053))

(declare-fun m!227055 () Bool)

(assert (=> b!200791 m!227055))

(declare-fun m!227057 () Bool)

(assert (=> b!200791 m!227057))

(declare-fun m!227059 () Bool)

(assert (=> b!200791 m!227059))

(declare-fun m!227061 () Bool)

(assert (=> b!200791 m!227061))

(declare-fun m!227063 () Bool)

(assert (=> b!200791 m!227063))

(declare-fun m!227065 () Bool)

(assert (=> b!200791 m!227065))

(declare-fun m!227067 () Bool)

(assert (=> b!200794 m!227067))

(declare-fun m!227069 () Bool)

(assert (=> b!200796 m!227069))

(check-sat (not b!200788) (not b!200797) (not b!200791) (not b!200796) (not mapNonEmpty!8378) b_and!11737 (not b!200793) (not start!20362) tp_is_empty!4873 (not b_next!5017) (not b!200790))
(check-sat b_and!11737 (not b_next!5017))
