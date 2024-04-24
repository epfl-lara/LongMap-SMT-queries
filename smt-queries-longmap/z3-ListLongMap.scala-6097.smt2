; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78858 () Bool)

(assert start!78858)

(declare-fun b_free!16903 () Bool)

(declare-fun b_next!16903 () Bool)

(assert (=> start!78858 (= b_free!16903 (not b_next!16903))))

(declare-fun tp!59150 () Bool)

(declare-fun b_and!27553 () Bool)

(assert (=> start!78858 (= tp!59150 b_and!27553)))

(declare-fun mapNonEmpty!30873 () Bool)

(declare-fun mapRes!30873 () Bool)

(declare-fun tp!59151 () Bool)

(declare-fun e!515727 () Bool)

(assert (=> mapNonEmpty!30873 (= mapRes!30873 (and tp!59151 e!515727))))

(declare-datatypes ((V!30847 0))(
  ( (V!30848 (val!9756 Int)) )
))
(declare-datatypes ((ValueCell!9224 0))(
  ( (ValueCellFull!9224 (v!12271 V!30847)) (EmptyCell!9224) )
))
(declare-fun mapRest!30873 () (Array (_ BitVec 32) ValueCell!9224))

(declare-datatypes ((array!54853 0))(
  ( (array!54854 (arr!26367 (Array (_ BitVec 32) ValueCell!9224)) (size!26827 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54853)

(declare-fun mapKey!30873 () (_ BitVec 32))

(declare-fun mapValue!30873 () ValueCell!9224)

(assert (=> mapNonEmpty!30873 (= (arr!26367 _values!1231) (store mapRest!30873 mapKey!30873 mapValue!30873))))

(declare-fun b!918494 () Bool)

(declare-fun res!618955 () Bool)

(declare-fun e!515725 () Bool)

(assert (=> b!918494 (=> (not res!618955) (not e!515725))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918494 (= res!618955 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918495 () Bool)

(declare-fun res!618958 () Bool)

(declare-fun e!515723 () Bool)

(assert (=> b!918495 (=> (not res!618958) (not e!515723))))

(declare-datatypes ((array!54855 0))(
  ( (array!54856 (arr!26368 (Array (_ BitVec 32) (_ BitVec 64))) (size!26828 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54855)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54855 (_ BitVec 32)) Bool)

(assert (=> b!918495 (= res!618958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918496 () Bool)

(declare-fun e!515728 () Bool)

(assert (=> b!918496 (= e!515725 e!515728)))

(declare-fun res!618959 () Bool)

(assert (=> b!918496 (=> (not res!618959) (not e!515728))))

(declare-fun lt!412408 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918496 (= res!618959 (validKeyInArray!0 lt!412408))))

(assert (=> b!918496 (= lt!412408 (select (arr!26368 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918497 () Bool)

(declare-fun tp_is_empty!19411 () Bool)

(assert (=> b!918497 (= e!515727 tp_is_empty!19411)))

(declare-fun b!918498 () Bool)

(declare-fun res!618961 () Bool)

(assert (=> b!918498 (=> (not res!618961) (not e!515725))))

(declare-fun v!791 () V!30847)

(declare-datatypes ((tuple2!12634 0))(
  ( (tuple2!12635 (_1!6328 (_ BitVec 64)) (_2!6328 V!30847)) )
))
(declare-datatypes ((List!18456 0))(
  ( (Nil!18453) (Cons!18452 (h!19604 tuple2!12634) (t!26081 List!18456)) )
))
(declare-datatypes ((ListLongMap!11333 0))(
  ( (ListLongMap!11334 (toList!5682 List!18456)) )
))
(declare-fun lt!412409 () ListLongMap!11333)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!562 (ListLongMap!11333 (_ BitVec 64)) V!30847)

(assert (=> b!918498 (= res!618961 (= (apply!562 lt!412409 k0!1099) v!791))))

(declare-fun mapIsEmpty!30873 () Bool)

(assert (=> mapIsEmpty!30873 mapRes!30873))

(declare-fun b!918499 () Bool)

(declare-fun res!618954 () Bool)

(assert (=> b!918499 (=> (not res!618954) (not e!515725))))

(assert (=> b!918499 (= res!618954 (validKeyInArray!0 k0!1099))))

(declare-fun b!918500 () Bool)

(assert (=> b!918500 (= e!515723 e!515725)))

(declare-fun res!618957 () Bool)

(assert (=> b!918500 (=> (not res!618957) (not e!515725))))

(declare-fun contains!4740 (ListLongMap!11333 (_ BitVec 64)) Bool)

(assert (=> b!918500 (= res!618957 (contains!4740 lt!412409 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30847)

(declare-fun minValue!1173 () V!30847)

(declare-fun getCurrentListMap!2937 (array!54855 array!54853 (_ BitVec 32) (_ BitVec 32) V!30847 V!30847 (_ BitVec 32) Int) ListLongMap!11333)

(assert (=> b!918500 (= lt!412409 (getCurrentListMap!2937 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918501 () Bool)

(assert (=> b!918501 (= e!515728 (not true))))

(declare-fun +!2627 (ListLongMap!11333 tuple2!12634) ListLongMap!11333)

(declare-fun get!13830 (ValueCell!9224 V!30847) V!30847)

(declare-fun dynLambda!1424 (Int (_ BitVec 64)) V!30847)

(assert (=> b!918501 (= (getCurrentListMap!2937 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2627 (getCurrentListMap!2937 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12635 lt!412408 (get!13830 (select (arr!26367 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1424 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30966 0))(
  ( (Unit!30967) )
))
(declare-fun lt!412407 () Unit!30966)

(declare-fun lemmaListMapRecursiveValidKeyArray!7 (array!54855 array!54853 (_ BitVec 32) (_ BitVec 32) V!30847 V!30847 (_ BitVec 32) Int) Unit!30966)

(assert (=> b!918501 (= lt!412407 (lemmaListMapRecursiveValidKeyArray!7 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918502 () Bool)

(declare-fun res!618963 () Bool)

(assert (=> b!918502 (=> (not res!618963) (not e!515723))))

(assert (=> b!918502 (= res!618963 (and (= (size!26827 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26828 _keys!1487) (size!26827 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!618960 () Bool)

(assert (=> start!78858 (=> (not res!618960) (not e!515723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78858 (= res!618960 (validMask!0 mask!1881))))

(assert (=> start!78858 e!515723))

(assert (=> start!78858 true))

(assert (=> start!78858 tp_is_empty!19411))

(declare-fun e!515722 () Bool)

(declare-fun array_inv!20660 (array!54853) Bool)

(assert (=> start!78858 (and (array_inv!20660 _values!1231) e!515722)))

(assert (=> start!78858 tp!59150))

(declare-fun array_inv!20661 (array!54855) Bool)

(assert (=> start!78858 (array_inv!20661 _keys!1487)))

(declare-fun b!918503 () Bool)

(declare-fun e!515724 () Bool)

(assert (=> b!918503 (= e!515722 (and e!515724 mapRes!30873))))

(declare-fun condMapEmpty!30873 () Bool)

(declare-fun mapDefault!30873 () ValueCell!9224)

(assert (=> b!918503 (= condMapEmpty!30873 (= (arr!26367 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9224)) mapDefault!30873)))))

(declare-fun b!918504 () Bool)

(declare-fun res!618962 () Bool)

(assert (=> b!918504 (=> (not res!618962) (not e!515723))))

(assert (=> b!918504 (= res!618962 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26828 _keys!1487))))))

(declare-fun b!918505 () Bool)

(declare-fun res!618956 () Bool)

(assert (=> b!918505 (=> (not res!618956) (not e!515723))))

(declare-datatypes ((List!18457 0))(
  ( (Nil!18454) (Cons!18453 (h!19605 (_ BitVec 64)) (t!26082 List!18457)) )
))
(declare-fun arrayNoDuplicates!0 (array!54855 (_ BitVec 32) List!18457) Bool)

(assert (=> b!918505 (= res!618956 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18454))))

(declare-fun b!918506 () Bool)

(assert (=> b!918506 (= e!515724 tp_is_empty!19411)))

(assert (= (and start!78858 res!618960) b!918502))

(assert (= (and b!918502 res!618963) b!918495))

(assert (= (and b!918495 res!618958) b!918505))

(assert (= (and b!918505 res!618956) b!918504))

(assert (= (and b!918504 res!618962) b!918500))

(assert (= (and b!918500 res!618957) b!918498))

(assert (= (and b!918498 res!618961) b!918494))

(assert (= (and b!918494 res!618955) b!918499))

(assert (= (and b!918499 res!618954) b!918496))

(assert (= (and b!918496 res!618959) b!918501))

(assert (= (and b!918503 condMapEmpty!30873) mapIsEmpty!30873))

(assert (= (and b!918503 (not condMapEmpty!30873)) mapNonEmpty!30873))

(get-info :version)

(assert (= (and mapNonEmpty!30873 ((_ is ValueCellFull!9224) mapValue!30873)) b!918497))

(assert (= (and b!918503 ((_ is ValueCellFull!9224) mapDefault!30873)) b!918506))

(assert (= start!78858 b!918503))

(declare-fun b_lambda!13419 () Bool)

(assert (=> (not b_lambda!13419) (not b!918501)))

(declare-fun t!26080 () Bool)

(declare-fun tb!5475 () Bool)

(assert (=> (and start!78858 (= defaultEntry!1235 defaultEntry!1235) t!26080) tb!5475))

(declare-fun result!10781 () Bool)

(assert (=> tb!5475 (= result!10781 tp_is_empty!19411)))

(assert (=> b!918501 t!26080))

(declare-fun b_and!27555 () Bool)

(assert (= b_and!27553 (and (=> t!26080 result!10781) b_and!27555)))

(declare-fun m!852619 () Bool)

(assert (=> b!918499 m!852619))

(declare-fun m!852621 () Bool)

(assert (=> b!918498 m!852621))

(declare-fun m!852623 () Bool)

(assert (=> start!78858 m!852623))

(declare-fun m!852625 () Bool)

(assert (=> start!78858 m!852625))

(declare-fun m!852627 () Bool)

(assert (=> start!78858 m!852627))

(declare-fun m!852629 () Bool)

(assert (=> b!918496 m!852629))

(declare-fun m!852631 () Bool)

(assert (=> b!918496 m!852631))

(declare-fun m!852633 () Bool)

(assert (=> b!918501 m!852633))

(declare-fun m!852635 () Bool)

(assert (=> b!918501 m!852635))

(declare-fun m!852637 () Bool)

(assert (=> b!918501 m!852637))

(declare-fun m!852639 () Bool)

(assert (=> b!918501 m!852639))

(assert (=> b!918501 m!852633))

(assert (=> b!918501 m!852635))

(declare-fun m!852641 () Bool)

(assert (=> b!918501 m!852641))

(declare-fun m!852643 () Bool)

(assert (=> b!918501 m!852643))

(assert (=> b!918501 m!852637))

(declare-fun m!852645 () Bool)

(assert (=> b!918501 m!852645))

(declare-fun m!852647 () Bool)

(assert (=> b!918495 m!852647))

(declare-fun m!852649 () Bool)

(assert (=> b!918505 m!852649))

(declare-fun m!852651 () Bool)

(assert (=> mapNonEmpty!30873 m!852651))

(declare-fun m!852653 () Bool)

(assert (=> b!918500 m!852653))

(declare-fun m!852655 () Bool)

(assert (=> b!918500 m!852655))

(check-sat (not b_next!16903) (not b!918498) (not b!918500) b_and!27555 (not b!918505) (not b!918496) tp_is_empty!19411 (not mapNonEmpty!30873) (not start!78858) (not b_lambda!13419) (not b!918499) (not b!918495) (not b!918501))
(check-sat b_and!27555 (not b_next!16903))
