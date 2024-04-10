; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20630 () Bool)

(assert start!20630)

(declare-fun b_free!5289 () Bool)

(declare-fun b_next!5289 () Bool)

(assert (=> start!20630 (= b_free!5289 (not b_next!5289))))

(declare-fun tp!18898 () Bool)

(declare-fun b_and!12035 () Bool)

(assert (=> start!20630 (= tp!18898 b_and!12035)))

(declare-fun b!205848 () Bool)

(declare-fun res!99563 () Bool)

(declare-fun e!134585 () Bool)

(assert (=> b!205848 (=> (not res!99563) (not e!134585))))

(declare-datatypes ((array!9501 0))(
  ( (array!9502 (arr!4501 (Array (_ BitVec 32) (_ BitVec 64))) (size!4826 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9501)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9501 (_ BitVec 32)) Bool)

(assert (=> b!205848 (= res!99563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205849 () Bool)

(declare-fun res!99571 () Bool)

(assert (=> b!205849 (=> (not res!99571) (not e!134585))))

(declare-datatypes ((List!2865 0))(
  ( (Nil!2862) (Cons!2861 (h!3503 (_ BitVec 64)) (t!7796 List!2865)) )
))
(declare-fun arrayNoDuplicates!0 (array!9501 (_ BitVec 32) List!2865) Bool)

(assert (=> b!205849 (= res!99571 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2862))))

(declare-fun b!205850 () Bool)

(declare-fun e!134584 () Bool)

(declare-fun tp_is_empty!5145 () Bool)

(assert (=> b!205850 (= e!134584 tp_is_empty!5145)))

(declare-fun res!99569 () Bool)

(assert (=> start!20630 (=> (not res!99569) (not e!134585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20630 (= res!99569 (validMask!0 mask!1149))))

(assert (=> start!20630 e!134585))

(declare-datatypes ((V!6507 0))(
  ( (V!6508 (val!2617 Int)) )
))
(declare-datatypes ((ValueCell!2229 0))(
  ( (ValueCellFull!2229 (v!4587 V!6507)) (EmptyCell!2229) )
))
(declare-datatypes ((array!9503 0))(
  ( (array!9504 (arr!4502 (Array (_ BitVec 32) ValueCell!2229)) (size!4827 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9503)

(declare-fun e!134587 () Bool)

(declare-fun array_inv!2975 (array!9503) Bool)

(assert (=> start!20630 (and (array_inv!2975 _values!649) e!134587)))

(assert (=> start!20630 true))

(assert (=> start!20630 tp_is_empty!5145))

(declare-fun array_inv!2976 (array!9501) Bool)

(assert (=> start!20630 (array_inv!2976 _keys!825)))

(assert (=> start!20630 tp!18898))

(declare-fun b!205851 () Bool)

(declare-fun res!99566 () Bool)

(assert (=> b!205851 (=> (not res!99566) (not e!134585))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205851 (= res!99566 (= (select (arr!4501 _keys!825) i!601) k0!843))))

(declare-fun b!205852 () Bool)

(declare-fun e!134588 () Bool)

(assert (=> b!205852 (= e!134588 true)))

(declare-datatypes ((tuple2!3970 0))(
  ( (tuple2!3971 (_1!1996 (_ BitVec 64)) (_2!1996 V!6507)) )
))
(declare-datatypes ((List!2866 0))(
  ( (Nil!2863) (Cons!2862 (h!3504 tuple2!3970) (t!7797 List!2866)) )
))
(declare-datatypes ((ListLongMap!2883 0))(
  ( (ListLongMap!2884 (toList!1457 List!2866)) )
))
(declare-fun lt!104987 () ListLongMap!2883)

(declare-fun lt!104990 () ListLongMap!2883)

(declare-fun lt!104985 () tuple2!3970)

(declare-fun +!484 (ListLongMap!2883 tuple2!3970) ListLongMap!2883)

(assert (=> b!205852 (= lt!104987 (+!484 lt!104990 lt!104985))))

(declare-datatypes ((Unit!6258 0))(
  ( (Unit!6259) )
))
(declare-fun lt!104982 () Unit!6258)

(declare-fun lt!104983 () ListLongMap!2883)

(declare-fun minValue!615 () V!6507)

(declare-fun v!520 () V!6507)

(declare-fun addCommutativeForDiffKeys!183 (ListLongMap!2883 (_ BitVec 64) V!6507 (_ BitVec 64) V!6507) Unit!6258)

(assert (=> b!205852 (= lt!104982 (addCommutativeForDiffKeys!183 lt!104983 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8786 () Bool)

(declare-fun mapRes!8786 () Bool)

(declare-fun tp!18899 () Bool)

(declare-fun e!134586 () Bool)

(assert (=> mapNonEmpty!8786 (= mapRes!8786 (and tp!18899 e!134586))))

(declare-fun mapKey!8786 () (_ BitVec 32))

(declare-fun mapValue!8786 () ValueCell!2229)

(declare-fun mapRest!8786 () (Array (_ BitVec 32) ValueCell!2229))

(assert (=> mapNonEmpty!8786 (= (arr!4502 _values!649) (store mapRest!8786 mapKey!8786 mapValue!8786))))

(declare-fun b!205853 () Bool)

(declare-fun res!99568 () Bool)

(assert (=> b!205853 (=> (not res!99568) (not e!134585))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205853 (= res!99568 (and (= (size!4827 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4826 _keys!825) (size!4827 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205854 () Bool)

(assert (=> b!205854 (= e!134586 tp_is_empty!5145)))

(declare-fun mapIsEmpty!8786 () Bool)

(assert (=> mapIsEmpty!8786 mapRes!8786))

(declare-fun b!205855 () Bool)

(assert (=> b!205855 (= e!134587 (and e!134584 mapRes!8786))))

(declare-fun condMapEmpty!8786 () Bool)

(declare-fun mapDefault!8786 () ValueCell!2229)

(assert (=> b!205855 (= condMapEmpty!8786 (= (arr!4502 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2229)) mapDefault!8786)))))

(declare-fun b!205856 () Bool)

(declare-fun e!134583 () Bool)

(assert (=> b!205856 (= e!134585 (not e!134583))))

(declare-fun res!99565 () Bool)

(assert (=> b!205856 (=> res!99565 e!134583)))

(assert (=> b!205856 (= res!99565 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!104991 () ListLongMap!2883)

(declare-fun zeroValue!615 () V!6507)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1027 (array!9501 array!9503 (_ BitVec 32) (_ BitVec 32) V!6507 V!6507 (_ BitVec 32) Int) ListLongMap!2883)

(assert (=> b!205856 (= lt!104991 (getCurrentListMap!1027 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104981 () ListLongMap!2883)

(declare-fun lt!104989 () array!9503)

(assert (=> b!205856 (= lt!104981 (getCurrentListMap!1027 _keys!825 lt!104989 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104980 () ListLongMap!2883)

(declare-fun lt!104984 () ListLongMap!2883)

(assert (=> b!205856 (and (= lt!104980 lt!104984) (= lt!104984 lt!104980))))

(assert (=> b!205856 (= lt!104984 (+!484 lt!104983 lt!104985))))

(assert (=> b!205856 (= lt!104985 (tuple2!3971 k0!843 v!520))))

(declare-fun lt!104986 () Unit!6258)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!140 (array!9501 array!9503 (_ BitVec 32) (_ BitVec 32) V!6507 V!6507 (_ BitVec 32) (_ BitVec 64) V!6507 (_ BitVec 32) Int) Unit!6258)

(assert (=> b!205856 (= lt!104986 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!140 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!401 (array!9501 array!9503 (_ BitVec 32) (_ BitVec 32) V!6507 V!6507 (_ BitVec 32) Int) ListLongMap!2883)

(assert (=> b!205856 (= lt!104980 (getCurrentListMapNoExtraKeys!401 _keys!825 lt!104989 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205856 (= lt!104989 (array!9504 (store (arr!4502 _values!649) i!601 (ValueCellFull!2229 v!520)) (size!4827 _values!649)))))

(assert (=> b!205856 (= lt!104983 (getCurrentListMapNoExtraKeys!401 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205857 () Bool)

(declare-fun res!99567 () Bool)

(assert (=> b!205857 (=> (not res!99567) (not e!134585))))

(assert (=> b!205857 (= res!99567 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4826 _keys!825))))))

(declare-fun b!205858 () Bool)

(assert (=> b!205858 (= e!134583 e!134588)))

(declare-fun res!99570 () Bool)

(assert (=> b!205858 (=> res!99570 e!134588)))

(assert (=> b!205858 (= res!99570 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205858 (= lt!104991 lt!104990)))

(declare-fun lt!104988 () tuple2!3970)

(assert (=> b!205858 (= lt!104990 (+!484 lt!104983 lt!104988))))

(assert (=> b!205858 (= lt!104981 lt!104987)))

(assert (=> b!205858 (= lt!104987 (+!484 lt!104984 lt!104988))))

(assert (=> b!205858 (= lt!104981 (+!484 lt!104980 lt!104988))))

(assert (=> b!205858 (= lt!104988 (tuple2!3971 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205859 () Bool)

(declare-fun res!99564 () Bool)

(assert (=> b!205859 (=> (not res!99564) (not e!134585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205859 (= res!99564 (validKeyInArray!0 k0!843))))

(assert (= (and start!20630 res!99569) b!205853))

(assert (= (and b!205853 res!99568) b!205848))

(assert (= (and b!205848 res!99563) b!205849))

(assert (= (and b!205849 res!99571) b!205857))

(assert (= (and b!205857 res!99567) b!205859))

(assert (= (and b!205859 res!99564) b!205851))

(assert (= (and b!205851 res!99566) b!205856))

(assert (= (and b!205856 (not res!99565)) b!205858))

(assert (= (and b!205858 (not res!99570)) b!205852))

(assert (= (and b!205855 condMapEmpty!8786) mapIsEmpty!8786))

(assert (= (and b!205855 (not condMapEmpty!8786)) mapNonEmpty!8786))

(get-info :version)

(assert (= (and mapNonEmpty!8786 ((_ is ValueCellFull!2229) mapValue!8786)) b!205854))

(assert (= (and b!205855 ((_ is ValueCellFull!2229) mapDefault!8786)) b!205850))

(assert (= start!20630 b!205855))

(declare-fun m!233519 () Bool)

(assert (=> b!205858 m!233519))

(declare-fun m!233521 () Bool)

(assert (=> b!205858 m!233521))

(declare-fun m!233523 () Bool)

(assert (=> b!205858 m!233523))

(declare-fun m!233525 () Bool)

(assert (=> start!20630 m!233525))

(declare-fun m!233527 () Bool)

(assert (=> start!20630 m!233527))

(declare-fun m!233529 () Bool)

(assert (=> start!20630 m!233529))

(declare-fun m!233531 () Bool)

(assert (=> b!205849 m!233531))

(declare-fun m!233533 () Bool)

(assert (=> b!205848 m!233533))

(declare-fun m!233535 () Bool)

(assert (=> b!205852 m!233535))

(declare-fun m!233537 () Bool)

(assert (=> b!205852 m!233537))

(declare-fun m!233539 () Bool)

(assert (=> mapNonEmpty!8786 m!233539))

(declare-fun m!233541 () Bool)

(assert (=> b!205856 m!233541))

(declare-fun m!233543 () Bool)

(assert (=> b!205856 m!233543))

(declare-fun m!233545 () Bool)

(assert (=> b!205856 m!233545))

(declare-fun m!233547 () Bool)

(assert (=> b!205856 m!233547))

(declare-fun m!233549 () Bool)

(assert (=> b!205856 m!233549))

(declare-fun m!233551 () Bool)

(assert (=> b!205856 m!233551))

(declare-fun m!233553 () Bool)

(assert (=> b!205856 m!233553))

(declare-fun m!233555 () Bool)

(assert (=> b!205851 m!233555))

(declare-fun m!233557 () Bool)

(assert (=> b!205859 m!233557))

(check-sat b_and!12035 (not b!205852) tp_is_empty!5145 (not b!205859) (not start!20630) (not b!205848) (not b!205858) (not b_next!5289) (not mapNonEmpty!8786) (not b!205849) (not b!205856))
(check-sat b_and!12035 (not b_next!5289))
