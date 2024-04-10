; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97834 () Bool)

(assert start!97834)

(declare-fun b_free!23535 () Bool)

(declare-fun b_next!23535 () Bool)

(assert (=> start!97834 (= b_free!23535 (not b_next!23535))))

(declare-fun tp!83308 () Bool)

(declare-fun b_and!37853 () Bool)

(assert (=> start!97834 (= tp!83308 b_and!37853)))

(declare-fun b!1119694 () Bool)

(declare-fun res!747948 () Bool)

(declare-fun e!637656 () Bool)

(assert (=> b!1119694 (=> (not res!747948) (not e!637656))))

(declare-datatypes ((array!73013 0))(
  ( (array!73014 (arr!35159 (Array (_ BitVec 32) (_ BitVec 64))) (size!35695 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73013)

(declare-datatypes ((List!24462 0))(
  ( (Nil!24459) (Cons!24458 (h!25667 (_ BitVec 64)) (t!34989 List!24462)) )
))
(declare-fun arrayNoDuplicates!0 (array!73013 (_ BitVec 32) List!24462) Bool)

(assert (=> b!1119694 (= res!747948 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24459))))

(declare-fun b!1119695 () Bool)

(declare-fun res!747950 () Bool)

(declare-fun e!637658 () Bool)

(assert (=> b!1119695 (=> (not res!747950) (not e!637658))))

(declare-fun lt!497825 () array!73013)

(assert (=> b!1119695 (= res!747950 (arrayNoDuplicates!0 lt!497825 #b00000000000000000000000000000000 Nil!24459))))

(declare-fun b!1119696 () Bool)

(declare-fun e!637653 () Bool)

(declare-fun e!637657 () Bool)

(declare-fun mapRes!43915 () Bool)

(assert (=> b!1119696 (= e!637653 (and e!637657 mapRes!43915))))

(declare-fun condMapEmpty!43915 () Bool)

(declare-datatypes ((V!42547 0))(
  ( (V!42548 (val!14089 Int)) )
))
(declare-datatypes ((ValueCell!13323 0))(
  ( (ValueCellFull!13323 (v!16722 V!42547)) (EmptyCell!13323) )
))
(declare-datatypes ((array!73015 0))(
  ( (array!73016 (arr!35160 (Array (_ BitVec 32) ValueCell!13323)) (size!35696 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73015)

(declare-fun mapDefault!43915 () ValueCell!13323)

(assert (=> b!1119696 (= condMapEmpty!43915 (= (arr!35160 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13323)) mapDefault!43915)))))

(declare-fun b!1119697 () Bool)

(declare-fun res!747946 () Bool)

(assert (=> b!1119697 (=> (not res!747946) (not e!637656))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119697 (= res!747946 (validKeyInArray!0 k0!934))))

(declare-fun b!1119698 () Bool)

(declare-fun e!637654 () Bool)

(declare-fun tp_is_empty!28065 () Bool)

(assert (=> b!1119698 (= e!637654 tp_is_empty!28065)))

(declare-fun b!1119699 () Bool)

(declare-fun res!747949 () Bool)

(assert (=> b!1119699 (=> (not res!747949) (not e!637656))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119699 (= res!747949 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35695 _keys!1208))))))

(declare-fun b!1119700 () Bool)

(declare-fun res!747947 () Bool)

(assert (=> b!1119700 (=> (not res!747947) (not e!637656))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73013 (_ BitVec 32)) Bool)

(assert (=> b!1119700 (= res!747947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!747951 () Bool)

(assert (=> start!97834 (=> (not res!747951) (not e!637656))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97834 (= res!747951 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35695 _keys!1208))))))

(assert (=> start!97834 e!637656))

(assert (=> start!97834 tp_is_empty!28065))

(declare-fun array_inv!27012 (array!73013) Bool)

(assert (=> start!97834 (array_inv!27012 _keys!1208)))

(assert (=> start!97834 true))

(assert (=> start!97834 tp!83308))

(declare-fun array_inv!27013 (array!73015) Bool)

(assert (=> start!97834 (and (array_inv!27013 _values!996) e!637653)))

(declare-fun b!1119701 () Bool)

(declare-fun res!747952 () Bool)

(assert (=> b!1119701 (=> (not res!747952) (not e!637656))))

(assert (=> b!1119701 (= res!747952 (= (select (arr!35159 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43915 () Bool)

(assert (=> mapIsEmpty!43915 mapRes!43915))

(declare-fun b!1119702 () Bool)

(assert (=> b!1119702 (= e!637657 tp_is_empty!28065)))

(declare-fun b!1119703 () Bool)

(assert (=> b!1119703 (= e!637656 e!637658)))

(declare-fun res!747942 () Bool)

(assert (=> b!1119703 (=> (not res!747942) (not e!637658))))

(assert (=> b!1119703 (= res!747942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497825 mask!1564))))

(assert (=> b!1119703 (= lt!497825 (array!73014 (store (arr!35159 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35695 _keys!1208)))))

(declare-fun b!1119704 () Bool)

(declare-fun e!637655 () Bool)

(assert (=> b!1119704 (= e!637658 (not e!637655))))

(declare-fun res!747945 () Bool)

(assert (=> b!1119704 (=> res!747945 e!637655)))

(assert (=> b!1119704 (= res!747945 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119704 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36744 0))(
  ( (Unit!36745) )
))
(declare-fun lt!497823 () Unit!36744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73013 (_ BitVec 64) (_ BitVec 32)) Unit!36744)

(assert (=> b!1119704 (= lt!497823 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119705 () Bool)

(declare-fun res!747943 () Bool)

(assert (=> b!1119705 (=> (not res!747943) (not e!637656))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1119705 (= res!747943 (and (= (size!35696 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35695 _keys!1208) (size!35696 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43915 () Bool)

(declare-fun tp!83309 () Bool)

(assert (=> mapNonEmpty!43915 (= mapRes!43915 (and tp!83309 e!637654))))

(declare-fun mapValue!43915 () ValueCell!13323)

(declare-fun mapRest!43915 () (Array (_ BitVec 32) ValueCell!13323))

(declare-fun mapKey!43915 () (_ BitVec 32))

(assert (=> mapNonEmpty!43915 (= (arr!35160 _values!996) (store mapRest!43915 mapKey!43915 mapValue!43915))))

(declare-fun b!1119706 () Bool)

(assert (=> b!1119706 (= e!637655 true)))

(declare-fun zeroValue!944 () V!42547)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42547)

(declare-datatypes ((tuple2!17678 0))(
  ( (tuple2!17679 (_1!8850 (_ BitVec 64)) (_2!8850 V!42547)) )
))
(declare-datatypes ((List!24463 0))(
  ( (Nil!24460) (Cons!24459 (h!25668 tuple2!17678) (t!34990 List!24463)) )
))
(declare-datatypes ((ListLongMap!15647 0))(
  ( (ListLongMap!15648 (toList!7839 List!24463)) )
))
(declare-fun lt!497822 () ListLongMap!15647)

(declare-fun getCurrentListMapNoExtraKeys!4329 (array!73013 array!73015 (_ BitVec 32) (_ BitVec 32) V!42547 V!42547 (_ BitVec 32) Int) ListLongMap!15647)

(declare-fun dynLambda!2433 (Int (_ BitVec 64)) V!42547)

(assert (=> b!1119706 (= lt!497822 (getCurrentListMapNoExtraKeys!4329 lt!497825 (array!73016 (store (arr!35160 _values!996) i!673 (ValueCellFull!13323 (dynLambda!2433 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35696 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497824 () ListLongMap!15647)

(assert (=> b!1119706 (= lt!497824 (getCurrentListMapNoExtraKeys!4329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119707 () Bool)

(declare-fun res!747944 () Bool)

(assert (=> b!1119707 (=> (not res!747944) (not e!637656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119707 (= res!747944 (validMask!0 mask!1564))))

(assert (= (and start!97834 res!747951) b!1119707))

(assert (= (and b!1119707 res!747944) b!1119705))

(assert (= (and b!1119705 res!747943) b!1119700))

(assert (= (and b!1119700 res!747947) b!1119694))

(assert (= (and b!1119694 res!747948) b!1119699))

(assert (= (and b!1119699 res!747949) b!1119697))

(assert (= (and b!1119697 res!747946) b!1119701))

(assert (= (and b!1119701 res!747952) b!1119703))

(assert (= (and b!1119703 res!747942) b!1119695))

(assert (= (and b!1119695 res!747950) b!1119704))

(assert (= (and b!1119704 (not res!747945)) b!1119706))

(assert (= (and b!1119696 condMapEmpty!43915) mapIsEmpty!43915))

(assert (= (and b!1119696 (not condMapEmpty!43915)) mapNonEmpty!43915))

(get-info :version)

(assert (= (and mapNonEmpty!43915 ((_ is ValueCellFull!13323) mapValue!43915)) b!1119698))

(assert (= (and b!1119696 ((_ is ValueCellFull!13323) mapDefault!43915)) b!1119702))

(assert (= start!97834 b!1119696))

(declare-fun b_lambda!18505 () Bool)

(assert (=> (not b_lambda!18505) (not b!1119706)))

(declare-fun t!34988 () Bool)

(declare-fun tb!8347 () Bool)

(assert (=> (and start!97834 (= defaultEntry!1004 defaultEntry!1004) t!34988) tb!8347))

(declare-fun result!17255 () Bool)

(assert (=> tb!8347 (= result!17255 tp_is_empty!28065)))

(assert (=> b!1119706 t!34988))

(declare-fun b_and!37855 () Bool)

(assert (= b_and!37853 (and (=> t!34988 result!17255) b_and!37855)))

(declare-fun m!1034919 () Bool)

(assert (=> start!97834 m!1034919))

(declare-fun m!1034921 () Bool)

(assert (=> start!97834 m!1034921))

(declare-fun m!1034923 () Bool)

(assert (=> b!1119704 m!1034923))

(declare-fun m!1034925 () Bool)

(assert (=> b!1119704 m!1034925))

(declare-fun m!1034927 () Bool)

(assert (=> b!1119700 m!1034927))

(declare-fun m!1034929 () Bool)

(assert (=> mapNonEmpty!43915 m!1034929))

(declare-fun m!1034931 () Bool)

(assert (=> b!1119701 m!1034931))

(declare-fun m!1034933 () Bool)

(assert (=> b!1119694 m!1034933))

(declare-fun m!1034935 () Bool)

(assert (=> b!1119697 m!1034935))

(declare-fun m!1034937 () Bool)

(assert (=> b!1119706 m!1034937))

(declare-fun m!1034939 () Bool)

(assert (=> b!1119706 m!1034939))

(declare-fun m!1034941 () Bool)

(assert (=> b!1119706 m!1034941))

(declare-fun m!1034943 () Bool)

(assert (=> b!1119706 m!1034943))

(declare-fun m!1034945 () Bool)

(assert (=> b!1119703 m!1034945))

(declare-fun m!1034947 () Bool)

(assert (=> b!1119703 m!1034947))

(declare-fun m!1034949 () Bool)

(assert (=> b!1119707 m!1034949))

(declare-fun m!1034951 () Bool)

(assert (=> b!1119695 m!1034951))

(check-sat (not b!1119707) (not b!1119700) tp_is_empty!28065 (not b!1119697) (not b!1119706) (not b!1119704) (not b!1119695) (not start!97834) (not b!1119703) b_and!37855 (not b_next!23535) (not b_lambda!18505) (not b!1119694) (not mapNonEmpty!43915))
(check-sat b_and!37855 (not b_next!23535))
