; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38586 () Bool)

(assert start!38586)

(declare-fun b_free!9123 () Bool)

(declare-fun b_next!9123 () Bool)

(assert (=> start!38586 (= b_free!9123 (not b_next!9123))))

(declare-fun tp!32492 () Bool)

(declare-fun b_and!16509 () Bool)

(assert (=> start!38586 (= tp!32492 b_and!16509)))

(declare-fun b!399595 () Bool)

(declare-fun res!229788 () Bool)

(declare-fun e!241295 () Bool)

(assert (=> b!399595 (=> (not res!229788) (not e!241295))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399595 (= res!229788 (validKeyInArray!0 k0!794))))

(declare-fun b!399596 () Bool)

(declare-fun res!229791 () Bool)

(assert (=> b!399596 (=> (not res!229791) (not e!241295))))

(declare-datatypes ((array!23921 0))(
  ( (array!23922 (arr!11410 (Array (_ BitVec 32) (_ BitVec 64))) (size!11762 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23921)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399596 (= res!229791 (or (= (select (arr!11410 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11410 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399597 () Bool)

(declare-fun e!241299 () Bool)

(declare-datatypes ((V!14445 0))(
  ( (V!14446 (val!5047 Int)) )
))
(declare-datatypes ((tuple2!6682 0))(
  ( (tuple2!6683 (_1!3352 (_ BitVec 64)) (_2!3352 V!14445)) )
))
(declare-datatypes ((List!6608 0))(
  ( (Nil!6605) (Cons!6604 (h!7460 tuple2!6682) (t!11782 List!6608)) )
))
(declare-datatypes ((ListLongMap!5595 0))(
  ( (ListLongMap!5596 (toList!2813 List!6608)) )
))
(declare-fun call!28034 () ListLongMap!5595)

(declare-fun call!28033 () ListLongMap!5595)

(assert (=> b!399597 (= e!241299 (= call!28034 call!28033))))

(declare-fun res!229793 () Bool)

(assert (=> start!38586 (=> (not res!229793) (not e!241295))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38586 (= res!229793 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11762 _keys!709))))))

(assert (=> start!38586 e!241295))

(declare-fun tp_is_empty!10005 () Bool)

(assert (=> start!38586 tp_is_empty!10005))

(assert (=> start!38586 tp!32492))

(assert (=> start!38586 true))

(declare-datatypes ((ValueCell!4659 0))(
  ( (ValueCellFull!4659 (v!7294 V!14445)) (EmptyCell!4659) )
))
(declare-datatypes ((array!23923 0))(
  ( (array!23924 (arr!11411 (Array (_ BitVec 32) ValueCell!4659)) (size!11763 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23923)

(declare-fun e!241298 () Bool)

(declare-fun array_inv!8358 (array!23923) Bool)

(assert (=> start!38586 (and (array_inv!8358 _values!549) e!241298)))

(declare-fun array_inv!8359 (array!23921) Bool)

(assert (=> start!38586 (array_inv!8359 _keys!709)))

(declare-fun b!399598 () Bool)

(declare-fun e!241296 () Bool)

(assert (=> b!399598 (= e!241296 tp_is_empty!10005)))

(declare-fun minValue!515 () V!14445)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14445)

(declare-fun lt!187595 () array!23921)

(declare-fun bm!28030 () Bool)

(declare-fun v!412 () V!14445)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!54641 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1030 (array!23921 array!23923 (_ BitVec 32) (_ BitVec 32) V!14445 V!14445 (_ BitVec 32) Int) ListLongMap!5595)

(assert (=> bm!28030 (= call!28034 (getCurrentListMapNoExtraKeys!1030 (ite c!54641 _keys!709 lt!187595) (ite c!54641 _values!549 (array!23924 (store (arr!11411 _values!549) i!563 (ValueCellFull!4659 v!412)) (size!11763 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399599 () Bool)

(declare-fun res!229795 () Bool)

(declare-fun e!241293 () Bool)

(assert (=> b!399599 (=> (not res!229795) (not e!241293))))

(declare-datatypes ((List!6609 0))(
  ( (Nil!6606) (Cons!6605 (h!7461 (_ BitVec 64)) (t!11783 List!6609)) )
))
(declare-fun arrayNoDuplicates!0 (array!23921 (_ BitVec 32) List!6609) Bool)

(assert (=> b!399599 (= res!229795 (arrayNoDuplicates!0 lt!187595 #b00000000000000000000000000000000 Nil!6606))))

(declare-fun b!399600 () Bool)

(declare-fun res!229794 () Bool)

(assert (=> b!399600 (=> (not res!229794) (not e!241295))))

(assert (=> b!399600 (= res!229794 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6606))))

(declare-fun b!399601 () Bool)

(declare-fun e!241297 () Bool)

(declare-fun mapRes!16629 () Bool)

(assert (=> b!399601 (= e!241298 (and e!241297 mapRes!16629))))

(declare-fun condMapEmpty!16629 () Bool)

(declare-fun mapDefault!16629 () ValueCell!4659)

(assert (=> b!399601 (= condMapEmpty!16629 (= (arr!11411 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4659)) mapDefault!16629)))))

(declare-fun b!399602 () Bool)

(declare-fun res!229790 () Bool)

(assert (=> b!399602 (=> (not res!229790) (not e!241295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399602 (= res!229790 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16629 () Bool)

(assert (=> mapIsEmpty!16629 mapRes!16629))

(declare-fun b!399603 () Bool)

(declare-fun res!229786 () Bool)

(assert (=> b!399603 (=> (not res!229786) (not e!241295))))

(assert (=> b!399603 (= res!229786 (and (= (size!11763 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11762 _keys!709) (size!11763 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28031 () Bool)

(assert (=> bm!28031 (= call!28033 (getCurrentListMapNoExtraKeys!1030 (ite c!54641 lt!187595 _keys!709) (ite c!54641 (array!23924 (store (arr!11411 _values!549) i!563 (ValueCellFull!4659 v!412)) (size!11763 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16629 () Bool)

(declare-fun tp!32493 () Bool)

(assert (=> mapNonEmpty!16629 (= mapRes!16629 (and tp!32493 e!241296))))

(declare-fun mapRest!16629 () (Array (_ BitVec 32) ValueCell!4659))

(declare-fun mapValue!16629 () ValueCell!4659)

(declare-fun mapKey!16629 () (_ BitVec 32))

(assert (=> mapNonEmpty!16629 (= (arr!11411 _values!549) (store mapRest!16629 mapKey!16629 mapValue!16629))))

(declare-fun b!399604 () Bool)

(declare-fun res!229797 () Bool)

(assert (=> b!399604 (=> (not res!229797) (not e!241295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23921 (_ BitVec 32)) Bool)

(assert (=> b!399604 (= res!229797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399605 () Bool)

(declare-fun res!229787 () Bool)

(assert (=> b!399605 (=> (not res!229787) (not e!241293))))

(assert (=> b!399605 (= res!229787 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11762 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399606 () Bool)

(declare-fun +!1101 (ListLongMap!5595 tuple2!6682) ListLongMap!5595)

(assert (=> b!399606 (= e!241299 (= call!28033 (+!1101 call!28034 (tuple2!6683 k0!794 v!412))))))

(declare-fun b!399607 () Bool)

(declare-fun res!229789 () Bool)

(assert (=> b!399607 (=> (not res!229789) (not e!241295))))

(declare-fun arrayContainsKey!0 (array!23921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399607 (= res!229789 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399608 () Bool)

(declare-fun res!229796 () Bool)

(assert (=> b!399608 (=> (not res!229796) (not e!241295))))

(assert (=> b!399608 (= res!229796 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11762 _keys!709))))))

(declare-fun b!399609 () Bool)

(assert (=> b!399609 (= e!241295 e!241293)))

(declare-fun res!229792 () Bool)

(assert (=> b!399609 (=> (not res!229792) (not e!241293))))

(assert (=> b!399609 (= res!229792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187595 mask!1025))))

(assert (=> b!399609 (= lt!187595 (array!23922 (store (arr!11410 _keys!709) i!563 k0!794) (size!11762 _keys!709)))))

(declare-fun b!399610 () Bool)

(assert (=> b!399610 (= e!241293 (not true))))

(assert (=> b!399610 e!241299))

(assert (=> b!399610 (= c!54641 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12110 0))(
  ( (Unit!12111) )
))
(declare-fun lt!187594 () Unit!12110)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!313 (array!23921 array!23923 (_ BitVec 32) (_ BitVec 32) V!14445 V!14445 (_ BitVec 32) (_ BitVec 64) V!14445 (_ BitVec 32) Int) Unit!12110)

(assert (=> b!399610 (= lt!187594 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!313 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399611 () Bool)

(assert (=> b!399611 (= e!241297 tp_is_empty!10005)))

(assert (= (and start!38586 res!229793) b!399602))

(assert (= (and b!399602 res!229790) b!399603))

(assert (= (and b!399603 res!229786) b!399604))

(assert (= (and b!399604 res!229797) b!399600))

(assert (= (and b!399600 res!229794) b!399608))

(assert (= (and b!399608 res!229796) b!399595))

(assert (= (and b!399595 res!229788) b!399596))

(assert (= (and b!399596 res!229791) b!399607))

(assert (= (and b!399607 res!229789) b!399609))

(assert (= (and b!399609 res!229792) b!399599))

(assert (= (and b!399599 res!229795) b!399605))

(assert (= (and b!399605 res!229787) b!399610))

(assert (= (and b!399610 c!54641) b!399606))

(assert (= (and b!399610 (not c!54641)) b!399597))

(assert (= (or b!399606 b!399597) bm!28031))

(assert (= (or b!399606 b!399597) bm!28030))

(assert (= (and b!399601 condMapEmpty!16629) mapIsEmpty!16629))

(assert (= (and b!399601 (not condMapEmpty!16629)) mapNonEmpty!16629))

(get-info :version)

(assert (= (and mapNonEmpty!16629 ((_ is ValueCellFull!4659) mapValue!16629)) b!399598))

(assert (= (and b!399601 ((_ is ValueCellFull!4659) mapDefault!16629)) b!399611))

(assert (= start!38586 b!399601))

(declare-fun m!394067 () Bool)

(assert (=> start!38586 m!394067))

(declare-fun m!394069 () Bool)

(assert (=> start!38586 m!394069))

(declare-fun m!394071 () Bool)

(assert (=> b!399602 m!394071))

(declare-fun m!394073 () Bool)

(assert (=> mapNonEmpty!16629 m!394073))

(declare-fun m!394075 () Bool)

(assert (=> bm!28031 m!394075))

(declare-fun m!394077 () Bool)

(assert (=> bm!28031 m!394077))

(declare-fun m!394079 () Bool)

(assert (=> b!399610 m!394079))

(declare-fun m!394081 () Bool)

(assert (=> b!399599 m!394081))

(declare-fun m!394083 () Bool)

(assert (=> b!399595 m!394083))

(assert (=> bm!28030 m!394075))

(declare-fun m!394085 () Bool)

(assert (=> bm!28030 m!394085))

(declare-fun m!394087 () Bool)

(assert (=> b!399609 m!394087))

(declare-fun m!394089 () Bool)

(assert (=> b!399609 m!394089))

(declare-fun m!394091 () Bool)

(assert (=> b!399600 m!394091))

(declare-fun m!394093 () Bool)

(assert (=> b!399596 m!394093))

(declare-fun m!394095 () Bool)

(assert (=> b!399606 m!394095))

(declare-fun m!394097 () Bool)

(assert (=> b!399607 m!394097))

(declare-fun m!394099 () Bool)

(assert (=> b!399604 m!394099))

(check-sat tp_is_empty!10005 (not b!399600) (not b!399599) (not mapNonEmpty!16629) (not b_next!9123) (not bm!28031) (not b!399602) (not b!399606) (not bm!28030) (not start!38586) (not b!399595) b_and!16509 (not b!399610) (not b!399604) (not b!399607) (not b!399609))
(check-sat b_and!16509 (not b_next!9123))
