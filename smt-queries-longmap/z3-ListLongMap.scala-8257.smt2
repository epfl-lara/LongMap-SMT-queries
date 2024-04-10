; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100492 () Bool)

(assert start!100492)

(declare-fun b_free!25815 () Bool)

(declare-fun b_next!25815 () Bool)

(assert (=> start!100492 (= b_free!25815 (not b_next!25815))))

(declare-fun tp!90435 () Bool)

(declare-fun b_and!42517 () Bool)

(assert (=> start!100492 (= tp!90435 b_and!42517)))

(declare-fun b!1200332 () Bool)

(declare-fun res!799027 () Bool)

(declare-fun e!681673 () Bool)

(assert (=> b!1200332 (=> (not res!799027) (not e!681673))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77811 0))(
  ( (array!77812 (arr!37550 (Array (_ BitVec 32) (_ BitVec 64))) (size!38086 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77811)

(assert (=> b!1200332 (= res!799027 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38086 _keys!1208))))))

(declare-fun mapNonEmpty!47621 () Bool)

(declare-fun mapRes!47621 () Bool)

(declare-fun tp!90434 () Bool)

(declare-fun e!681671 () Bool)

(assert (=> mapNonEmpty!47621 (= mapRes!47621 (and tp!90434 e!681671))))

(declare-datatypes ((V!45819 0))(
  ( (V!45820 (val!15316 Int)) )
))
(declare-datatypes ((ValueCell!14550 0))(
  ( (ValueCellFull!14550 (v!17954 V!45819)) (EmptyCell!14550) )
))
(declare-fun mapRest!47621 () (Array (_ BitVec 32) ValueCell!14550))

(declare-fun mapKey!47621 () (_ BitVec 32))

(declare-datatypes ((array!77813 0))(
  ( (array!77814 (arr!37551 (Array (_ BitVec 32) ValueCell!14550)) (size!38087 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77813)

(declare-fun mapValue!47621 () ValueCell!14550)

(assert (=> mapNonEmpty!47621 (= (arr!37551 _values!996) (store mapRest!47621 mapKey!47621 mapValue!47621))))

(declare-fun b!1200333 () Bool)

(declare-fun e!681676 () Bool)

(declare-fun e!681675 () Bool)

(assert (=> b!1200333 (= e!681676 (not e!681675))))

(declare-fun res!799030 () Bool)

(assert (=> b!1200333 (=> res!799030 e!681675)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1200333 (= res!799030 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200333 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39798 0))(
  ( (Unit!39799) )
))
(declare-fun lt!544014 () Unit!39798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77811 (_ BitVec 64) (_ BitVec 32)) Unit!39798)

(assert (=> b!1200333 (= lt!544014 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200334 () Bool)

(declare-fun res!799026 () Bool)

(assert (=> b!1200334 (=> (not res!799026) (not e!681673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77811 (_ BitVec 32)) Bool)

(assert (=> b!1200334 (= res!799026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200335 () Bool)

(declare-fun res!799031 () Bool)

(assert (=> b!1200335 (=> (not res!799031) (not e!681673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200335 (= res!799031 (validMask!0 mask!1564))))

(declare-fun b!1200336 () Bool)

(declare-fun tp_is_empty!30519 () Bool)

(assert (=> b!1200336 (= e!681671 tp_is_empty!30519)))

(declare-fun b!1200337 () Bool)

(declare-fun res!799035 () Bool)

(assert (=> b!1200337 (=> (not res!799035) (not e!681673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1200337 (= res!799035 (and (= (size!38087 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38086 _keys!1208) (size!38087 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200338 () Bool)

(assert (=> b!1200338 (= e!681673 e!681676)))

(declare-fun res!799034 () Bool)

(assert (=> b!1200338 (=> (not res!799034) (not e!681676))))

(declare-fun lt!544012 () array!77811)

(assert (=> b!1200338 (= res!799034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544012 mask!1564))))

(assert (=> b!1200338 (= lt!544012 (array!77812 (store (arr!37550 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38086 _keys!1208)))))

(declare-fun b!1200339 () Bool)

(declare-fun res!799029 () Bool)

(assert (=> b!1200339 (=> (not res!799029) (not e!681673))))

(assert (=> b!1200339 (= res!799029 (= (select (arr!37550 _keys!1208) i!673) k0!934))))

(declare-fun b!1200340 () Bool)

(declare-fun e!681672 () Bool)

(declare-fun e!681674 () Bool)

(assert (=> b!1200340 (= e!681672 (and e!681674 mapRes!47621))))

(declare-fun condMapEmpty!47621 () Bool)

(declare-fun mapDefault!47621 () ValueCell!14550)

(assert (=> b!1200340 (= condMapEmpty!47621 (= (arr!37551 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14550)) mapDefault!47621)))))

(declare-fun b!1200341 () Bool)

(assert (=> b!1200341 (= e!681674 tp_is_empty!30519)))

(declare-fun b!1200342 () Bool)

(declare-fun res!799032 () Bool)

(assert (=> b!1200342 (=> (not res!799032) (not e!681673))))

(declare-datatypes ((List!26426 0))(
  ( (Nil!26423) (Cons!26422 (h!27631 (_ BitVec 64)) (t!39221 List!26426)) )
))
(declare-fun arrayNoDuplicates!0 (array!77811 (_ BitVec 32) List!26426) Bool)

(assert (=> b!1200342 (= res!799032 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26423))))

(declare-fun b!1200343 () Bool)

(assert (=> b!1200343 (= e!681675 (or (not (= from!1455 i!673)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!38086 _keys!1208)) (bvslt (bvsub (size!38086 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!38086 _keys!1208) from!1455))))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45819)

(declare-fun zeroValue!944 () V!45819)

(declare-datatypes ((tuple2!19606 0))(
  ( (tuple2!19607 (_1!9814 (_ BitVec 64)) (_2!9814 V!45819)) )
))
(declare-datatypes ((List!26427 0))(
  ( (Nil!26424) (Cons!26423 (h!27632 tuple2!19606) (t!39222 List!26427)) )
))
(declare-datatypes ((ListLongMap!17575 0))(
  ( (ListLongMap!17576 (toList!8803 List!26427)) )
))
(declare-fun lt!544015 () ListLongMap!17575)

(declare-fun getCurrentListMapNoExtraKeys!5242 (array!77811 array!77813 (_ BitVec 32) (_ BitVec 32) V!45819 V!45819 (_ BitVec 32) Int) ListLongMap!17575)

(declare-fun dynLambda!3162 (Int (_ BitVec 64)) V!45819)

(assert (=> b!1200343 (= lt!544015 (getCurrentListMapNoExtraKeys!5242 lt!544012 (array!77814 (store (arr!37551 _values!996) i!673 (ValueCellFull!14550 (dynLambda!3162 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38087 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544013 () ListLongMap!17575)

(assert (=> b!1200343 (= lt!544013 (getCurrentListMapNoExtraKeys!5242 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200344 () Bool)

(declare-fun res!799033 () Bool)

(assert (=> b!1200344 (=> (not res!799033) (not e!681676))))

(assert (=> b!1200344 (= res!799033 (arrayNoDuplicates!0 lt!544012 #b00000000000000000000000000000000 Nil!26423))))

(declare-fun b!1200345 () Bool)

(declare-fun res!799025 () Bool)

(assert (=> b!1200345 (=> (not res!799025) (not e!681673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200345 (= res!799025 (validKeyInArray!0 k0!934))))

(declare-fun res!799028 () Bool)

(assert (=> start!100492 (=> (not res!799028) (not e!681673))))

(assert (=> start!100492 (= res!799028 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38086 _keys!1208))))))

(assert (=> start!100492 e!681673))

(assert (=> start!100492 tp_is_empty!30519))

(declare-fun array_inv!28618 (array!77811) Bool)

(assert (=> start!100492 (array_inv!28618 _keys!1208)))

(assert (=> start!100492 true))

(assert (=> start!100492 tp!90435))

(declare-fun array_inv!28619 (array!77813) Bool)

(assert (=> start!100492 (and (array_inv!28619 _values!996) e!681672)))

(declare-fun mapIsEmpty!47621 () Bool)

(assert (=> mapIsEmpty!47621 mapRes!47621))

(assert (= (and start!100492 res!799028) b!1200335))

(assert (= (and b!1200335 res!799031) b!1200337))

(assert (= (and b!1200337 res!799035) b!1200334))

(assert (= (and b!1200334 res!799026) b!1200342))

(assert (= (and b!1200342 res!799032) b!1200332))

(assert (= (and b!1200332 res!799027) b!1200345))

(assert (= (and b!1200345 res!799025) b!1200339))

(assert (= (and b!1200339 res!799029) b!1200338))

(assert (= (and b!1200338 res!799034) b!1200344))

(assert (= (and b!1200344 res!799033) b!1200333))

(assert (= (and b!1200333 (not res!799030)) b!1200343))

(assert (= (and b!1200340 condMapEmpty!47621) mapIsEmpty!47621))

(assert (= (and b!1200340 (not condMapEmpty!47621)) mapNonEmpty!47621))

(get-info :version)

(assert (= (and mapNonEmpty!47621 ((_ is ValueCellFull!14550) mapValue!47621)) b!1200336))

(assert (= (and b!1200340 ((_ is ValueCellFull!14550) mapDefault!47621)) b!1200341))

(assert (= start!100492 b!1200340))

(declare-fun b_lambda!21011 () Bool)

(assert (=> (not b_lambda!21011) (not b!1200343)))

(declare-fun t!39220 () Bool)

(declare-fun tb!10615 () Bool)

(assert (=> (and start!100492 (= defaultEntry!1004 defaultEntry!1004) t!39220) tb!10615))

(declare-fun result!21807 () Bool)

(assert (=> tb!10615 (= result!21807 tp_is_empty!30519)))

(assert (=> b!1200343 t!39220))

(declare-fun b_and!42519 () Bool)

(assert (= b_and!42517 (and (=> t!39220 result!21807) b_and!42519)))

(declare-fun m!1106667 () Bool)

(assert (=> start!100492 m!1106667))

(declare-fun m!1106669 () Bool)

(assert (=> start!100492 m!1106669))

(declare-fun m!1106671 () Bool)

(assert (=> b!1200338 m!1106671))

(declare-fun m!1106673 () Bool)

(assert (=> b!1200338 m!1106673))

(declare-fun m!1106675 () Bool)

(assert (=> b!1200339 m!1106675))

(declare-fun m!1106677 () Bool)

(assert (=> b!1200342 m!1106677))

(declare-fun m!1106679 () Bool)

(assert (=> b!1200333 m!1106679))

(declare-fun m!1106681 () Bool)

(assert (=> b!1200333 m!1106681))

(declare-fun m!1106683 () Bool)

(assert (=> b!1200343 m!1106683))

(declare-fun m!1106685 () Bool)

(assert (=> b!1200343 m!1106685))

(declare-fun m!1106687 () Bool)

(assert (=> b!1200343 m!1106687))

(declare-fun m!1106689 () Bool)

(assert (=> b!1200343 m!1106689))

(declare-fun m!1106691 () Bool)

(assert (=> b!1200334 m!1106691))

(declare-fun m!1106693 () Bool)

(assert (=> b!1200335 m!1106693))

(declare-fun m!1106695 () Bool)

(assert (=> mapNonEmpty!47621 m!1106695))

(declare-fun m!1106697 () Bool)

(assert (=> b!1200344 m!1106697))

(declare-fun m!1106699 () Bool)

(assert (=> b!1200345 m!1106699))

(check-sat (not b!1200345) (not b!1200334) b_and!42519 (not start!100492) (not mapNonEmpty!47621) (not b!1200335) (not b!1200344) tp_is_empty!30519 (not b!1200333) (not b!1200343) (not b!1200338) (not b_next!25815) (not b_lambda!21011) (not b!1200342))
(check-sat b_and!42519 (not b_next!25815))
