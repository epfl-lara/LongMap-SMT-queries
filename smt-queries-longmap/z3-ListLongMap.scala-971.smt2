; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21048 () Bool)

(assert start!21048)

(declare-fun b_free!5575 () Bool)

(declare-fun b_next!5575 () Bool)

(assert (=> start!21048 (= b_free!5575 (not b_next!5575))))

(declare-fun tp!19783 () Bool)

(declare-fun b_and!12407 () Bool)

(assert (=> start!21048 (= tp!19783 b_and!12407)))

(declare-fun res!103343 () Bool)

(declare-fun e!137734 () Bool)

(assert (=> start!21048 (=> (not res!103343) (not e!137734))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21048 (= res!103343 (validMask!0 mask!1149))))

(assert (=> start!21048 e!137734))

(declare-datatypes ((V!6897 0))(
  ( (V!6898 (val!2763 Int)) )
))
(declare-datatypes ((ValueCell!2375 0))(
  ( (ValueCellFull!2375 (v!4758 V!6897)) (EmptyCell!2375) )
))
(declare-datatypes ((array!10073 0))(
  ( (array!10074 (arr!4781 (Array (_ BitVec 32) ValueCell!2375)) (size!5106 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10073)

(declare-fun e!137735 () Bool)

(declare-fun array_inv!3141 (array!10073) Bool)

(assert (=> start!21048 (and (array_inv!3141 _values!649) e!137735)))

(assert (=> start!21048 true))

(declare-fun tp_is_empty!5437 () Bool)

(assert (=> start!21048 tp_is_empty!5437))

(declare-datatypes ((array!10075 0))(
  ( (array!10076 (arr!4782 (Array (_ BitVec 32) (_ BitVec 64))) (size!5107 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10075)

(declare-fun array_inv!3142 (array!10075) Bool)

(assert (=> start!21048 (array_inv!3142 _keys!825)))

(assert (=> start!21048 tp!19783))

(declare-fun b!211615 () Bool)

(declare-fun e!137733 () Bool)

(assert (=> b!211615 (= e!137733 tp_is_empty!5437)))

(declare-fun mapNonEmpty!9242 () Bool)

(declare-fun mapRes!9242 () Bool)

(declare-fun tp!19784 () Bool)

(declare-fun e!137737 () Bool)

(assert (=> mapNonEmpty!9242 (= mapRes!9242 (and tp!19784 e!137737))))

(declare-fun mapKey!9242 () (_ BitVec 32))

(declare-fun mapRest!9242 () (Array (_ BitVec 32) ValueCell!2375))

(declare-fun mapValue!9242 () ValueCell!2375)

(assert (=> mapNonEmpty!9242 (= (arr!4781 _values!649) (store mapRest!9242 mapKey!9242 mapValue!9242))))

(declare-fun mapIsEmpty!9242 () Bool)

(assert (=> mapIsEmpty!9242 mapRes!9242))

(declare-fun b!211616 () Bool)

(assert (=> b!211616 (= e!137737 tp_is_empty!5437)))

(declare-datatypes ((tuple2!4126 0))(
  ( (tuple2!4127 (_1!2074 (_ BitVec 64)) (_2!2074 V!6897)) )
))
(declare-fun lt!108883 () tuple2!4126)

(declare-fun b!211617 () Bool)

(declare-fun e!137739 () Bool)

(declare-datatypes ((List!3010 0))(
  ( (Nil!3007) (Cons!3006 (h!3648 tuple2!4126) (t!7945 List!3010)) )
))
(declare-datatypes ((ListLongMap!3041 0))(
  ( (ListLongMap!3042 (toList!1536 List!3010)) )
))
(declare-fun lt!108885 () ListLongMap!3041)

(declare-fun lt!108884 () ListLongMap!3041)

(declare-fun +!565 (ListLongMap!3041 tuple2!4126) ListLongMap!3041)

(assert (=> b!211617 (= e!137739 (= lt!108885 (+!565 lt!108884 lt!108883)))))

(declare-fun e!137736 () Bool)

(assert (=> b!211617 e!137736))

(declare-fun res!103349 () Bool)

(assert (=> b!211617 (=> (not res!103349) (not e!137736))))

(declare-fun lt!108878 () ListLongMap!3041)

(assert (=> b!211617 (= res!103349 (= lt!108885 (+!565 lt!108878 lt!108883)))))

(declare-fun zeroValue!615 () V!6897)

(assert (=> b!211617 (= lt!108883 (tuple2!4127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!108881 () ListLongMap!3041)

(declare-fun lt!108880 () ListLongMap!3041)

(declare-fun b!211618 () Bool)

(assert (=> b!211618 (= e!137736 (= lt!108880 (+!565 lt!108881 lt!108883)))))

(declare-fun b!211619 () Bool)

(declare-fun res!103342 () Bool)

(assert (=> b!211619 (=> (not res!103342) (not e!137734))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211619 (= res!103342 (validKeyInArray!0 k0!843))))

(declare-fun b!211620 () Bool)

(declare-fun res!103346 () Bool)

(assert (=> b!211620 (=> (not res!103346) (not e!137734))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211620 (= res!103346 (and (= (size!5106 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5107 _keys!825) (size!5106 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211621 () Bool)

(declare-fun res!103345 () Bool)

(assert (=> b!211621 (=> (not res!103345) (not e!137734))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211621 (= res!103345 (= (select (arr!4782 _keys!825) i!601) k0!843))))

(declare-fun b!211622 () Bool)

(declare-fun res!103344 () Bool)

(assert (=> b!211622 (=> (not res!103344) (not e!137734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10075 (_ BitVec 32)) Bool)

(assert (=> b!211622 (= res!103344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211623 () Bool)

(assert (=> b!211623 (= e!137734 (not e!137739))))

(declare-fun res!103350 () Bool)

(assert (=> b!211623 (=> res!103350 e!137739)))

(assert (=> b!211623 (= res!103350 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6897)

(declare-fun getCurrentListMap!1072 (array!10075 array!10073 (_ BitVec 32) (_ BitVec 32) V!6897 V!6897 (_ BitVec 32) Int) ListLongMap!3041)

(assert (=> b!211623 (= lt!108880 (getCurrentListMap!1072 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108879 () array!10073)

(assert (=> b!211623 (= lt!108885 (getCurrentListMap!1072 _keys!825 lt!108879 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211623 (and (= lt!108878 lt!108884) (= lt!108884 lt!108878))))

(declare-fun v!520 () V!6897)

(assert (=> b!211623 (= lt!108884 (+!565 lt!108881 (tuple2!4127 k0!843 v!520)))))

(declare-datatypes ((Unit!6414 0))(
  ( (Unit!6415) )
))
(declare-fun lt!108882 () Unit!6414)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!213 (array!10075 array!10073 (_ BitVec 32) (_ BitVec 32) V!6897 V!6897 (_ BitVec 32) (_ BitVec 64) V!6897 (_ BitVec 32) Int) Unit!6414)

(assert (=> b!211623 (= lt!108882 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!213 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!495 (array!10075 array!10073 (_ BitVec 32) (_ BitVec 32) V!6897 V!6897 (_ BitVec 32) Int) ListLongMap!3041)

(assert (=> b!211623 (= lt!108878 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108879 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211623 (= lt!108879 (array!10074 (store (arr!4781 _values!649) i!601 (ValueCellFull!2375 v!520)) (size!5106 _values!649)))))

(assert (=> b!211623 (= lt!108881 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211624 () Bool)

(assert (=> b!211624 (= e!137735 (and e!137733 mapRes!9242))))

(declare-fun condMapEmpty!9242 () Bool)

(declare-fun mapDefault!9242 () ValueCell!2375)

(assert (=> b!211624 (= condMapEmpty!9242 (= (arr!4781 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2375)) mapDefault!9242)))))

(declare-fun b!211625 () Bool)

(declare-fun res!103347 () Bool)

(assert (=> b!211625 (=> (not res!103347) (not e!137734))))

(assert (=> b!211625 (= res!103347 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5107 _keys!825))))))

(declare-fun b!211626 () Bool)

(declare-fun res!103348 () Bool)

(assert (=> b!211626 (=> (not res!103348) (not e!137734))))

(declare-datatypes ((List!3011 0))(
  ( (Nil!3008) (Cons!3007 (h!3649 (_ BitVec 64)) (t!7946 List!3011)) )
))
(declare-fun arrayNoDuplicates!0 (array!10075 (_ BitVec 32) List!3011) Bool)

(assert (=> b!211626 (= res!103348 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3008))))

(assert (= (and start!21048 res!103343) b!211620))

(assert (= (and b!211620 res!103346) b!211622))

(assert (= (and b!211622 res!103344) b!211626))

(assert (= (and b!211626 res!103348) b!211625))

(assert (= (and b!211625 res!103347) b!211619))

(assert (= (and b!211619 res!103342) b!211621))

(assert (= (and b!211621 res!103345) b!211623))

(assert (= (and b!211623 (not res!103350)) b!211617))

(assert (= (and b!211617 res!103349) b!211618))

(assert (= (and b!211624 condMapEmpty!9242) mapIsEmpty!9242))

(assert (= (and b!211624 (not condMapEmpty!9242)) mapNonEmpty!9242))

(get-info :version)

(assert (= (and mapNonEmpty!9242 ((_ is ValueCellFull!2375) mapValue!9242)) b!211616))

(assert (= (and b!211624 ((_ is ValueCellFull!2375) mapDefault!9242)) b!211615))

(assert (= start!21048 b!211624))

(declare-fun m!239503 () Bool)

(assert (=> b!211622 m!239503))

(declare-fun m!239505 () Bool)

(assert (=> b!211618 m!239505))

(declare-fun m!239507 () Bool)

(assert (=> b!211619 m!239507))

(declare-fun m!239509 () Bool)

(assert (=> mapNonEmpty!9242 m!239509))

(declare-fun m!239511 () Bool)

(assert (=> start!21048 m!239511))

(declare-fun m!239513 () Bool)

(assert (=> start!21048 m!239513))

(declare-fun m!239515 () Bool)

(assert (=> start!21048 m!239515))

(declare-fun m!239517 () Bool)

(assert (=> b!211623 m!239517))

(declare-fun m!239519 () Bool)

(assert (=> b!211623 m!239519))

(declare-fun m!239521 () Bool)

(assert (=> b!211623 m!239521))

(declare-fun m!239523 () Bool)

(assert (=> b!211623 m!239523))

(declare-fun m!239525 () Bool)

(assert (=> b!211623 m!239525))

(declare-fun m!239527 () Bool)

(assert (=> b!211623 m!239527))

(declare-fun m!239529 () Bool)

(assert (=> b!211623 m!239529))

(declare-fun m!239531 () Bool)

(assert (=> b!211621 m!239531))

(declare-fun m!239533 () Bool)

(assert (=> b!211617 m!239533))

(declare-fun m!239535 () Bool)

(assert (=> b!211617 m!239535))

(declare-fun m!239537 () Bool)

(assert (=> b!211626 m!239537))

(check-sat (not start!21048) (not b!211626) (not b!211618) b_and!12407 (not b!211623) (not b!211619) (not b!211622) tp_is_empty!5437 (not b_next!5575) (not mapNonEmpty!9242) (not b!211617))
(check-sat b_and!12407 (not b_next!5575))
