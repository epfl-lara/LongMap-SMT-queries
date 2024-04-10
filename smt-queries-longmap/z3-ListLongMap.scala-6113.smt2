; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78788 () Bool)

(assert start!78788)

(declare-fun b_free!17001 () Bool)

(declare-fun b_next!17001 () Bool)

(assert (=> start!78788 (= b_free!17001 (not b_next!17001))))

(declare-fun tp!59444 () Bool)

(declare-fun b_and!27739 () Bool)

(assert (=> start!78788 (= tp!59444 b_and!27739)))

(declare-fun b!919600 () Bool)

(declare-fun e!516174 () Bool)

(declare-fun e!516173 () Bool)

(declare-fun mapRes!31020 () Bool)

(assert (=> b!919600 (= e!516174 (and e!516173 mapRes!31020))))

(declare-fun condMapEmpty!31020 () Bool)

(declare-datatypes ((V!30977 0))(
  ( (V!30978 (val!9805 Int)) )
))
(declare-datatypes ((ValueCell!9273 0))(
  ( (ValueCellFull!9273 (v!12323 V!30977)) (EmptyCell!9273) )
))
(declare-datatypes ((array!55002 0))(
  ( (array!55003 (arr!26446 (Array (_ BitVec 32) ValueCell!9273)) (size!26905 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55002)

(declare-fun mapDefault!31020 () ValueCell!9273)

(assert (=> b!919600 (= condMapEmpty!31020 (= (arr!26446 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9273)) mapDefault!31020)))))

(declare-fun res!620087 () Bool)

(declare-fun e!516171 () Bool)

(assert (=> start!78788 (=> (not res!620087) (not e!516171))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78788 (= res!620087 (validMask!0 mask!1881))))

(assert (=> start!78788 e!516171))

(assert (=> start!78788 true))

(declare-fun tp_is_empty!19509 () Bool)

(assert (=> start!78788 tp_is_empty!19509))

(declare-fun array_inv!20614 (array!55002) Bool)

(assert (=> start!78788 (and (array_inv!20614 _values!1231) e!516174)))

(assert (=> start!78788 tp!59444))

(declare-datatypes ((array!55004 0))(
  ( (array!55005 (arr!26447 (Array (_ BitVec 32) (_ BitVec 64))) (size!26906 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55004)

(declare-fun array_inv!20615 (array!55004) Bool)

(assert (=> start!78788 (array_inv!20615 _keys!1487)))

(declare-fun b!919601 () Bool)

(declare-fun res!620083 () Bool)

(assert (=> b!919601 (=> (not res!620083) (not e!516171))))

(declare-datatypes ((List!18548 0))(
  ( (Nil!18545) (Cons!18544 (h!19690 (_ BitVec 64)) (t!26279 List!18548)) )
))
(declare-fun arrayNoDuplicates!0 (array!55004 (_ BitVec 32) List!18548) Bool)

(assert (=> b!919601 (= res!620083 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18545))))

(declare-fun b!919602 () Bool)

(assert (=> b!919602 (= e!516173 tp_is_empty!19509)))

(declare-fun b!919603 () Bool)

(declare-fun e!516175 () Bool)

(assert (=> b!919603 (= e!516171 e!516175)))

(declare-fun res!620089 () Bool)

(assert (=> b!919603 (=> (not res!620089) (not e!516175))))

(declare-datatypes ((tuple2!12744 0))(
  ( (tuple2!12745 (_1!6383 (_ BitVec 64)) (_2!6383 V!30977)) )
))
(declare-datatypes ((List!18549 0))(
  ( (Nil!18546) (Cons!18545 (h!19691 tuple2!12744) (t!26280 List!18549)) )
))
(declare-datatypes ((ListLongMap!11441 0))(
  ( (ListLongMap!11442 (toList!5736 List!18549)) )
))
(declare-fun lt!412786 () ListLongMap!11441)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4782 (ListLongMap!11441 (_ BitVec 64)) Bool)

(assert (=> b!919603 (= res!620089 (contains!4782 lt!412786 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30977)

(declare-fun minValue!1173 () V!30977)

(declare-fun getCurrentListMap!2992 (array!55004 array!55002 (_ BitVec 32) (_ BitVec 32) V!30977 V!30977 (_ BitVec 32) Int) ListLongMap!11441)

(assert (=> b!919603 (= lt!412786 (getCurrentListMap!2992 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919604 () Bool)

(declare-fun res!620082 () Bool)

(assert (=> b!919604 (=> (not res!620082) (not e!516171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55004 (_ BitVec 32)) Bool)

(assert (=> b!919604 (= res!620082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919605 () Bool)

(declare-fun res!620088 () Bool)

(assert (=> b!919605 (=> (not res!620088) (not e!516175))))

(assert (=> b!919605 (= res!620088 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919606 () Bool)

(declare-fun res!620085 () Bool)

(assert (=> b!919606 (=> (not res!620085) (not e!516171))))

(assert (=> b!919606 (= res!620085 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26906 _keys!1487))))))

(declare-fun b!919607 () Bool)

(declare-fun e!516172 () Bool)

(assert (=> b!919607 (= e!516172 (not true))))

(assert (=> b!919607 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18545)))

(declare-datatypes ((Unit!31040 0))(
  ( (Unit!31041) )
))
(declare-fun lt!412791 () Unit!31040)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55004 (_ BitVec 32) (_ BitVec 32)) Unit!31040)

(assert (=> b!919607 (= lt!412791 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412790 () tuple2!12744)

(declare-fun +!2646 (ListLongMap!11441 tuple2!12744) ListLongMap!11441)

(assert (=> b!919607 (contains!4782 (+!2646 lt!412786 lt!412790) k0!1099)))

(declare-fun lt!412787 () V!30977)

(declare-fun lt!412788 () Unit!31040)

(declare-fun lt!412789 () (_ BitVec 64))

(declare-fun addStillContains!370 (ListLongMap!11441 (_ BitVec 64) V!30977 (_ BitVec 64)) Unit!31040)

(assert (=> b!919607 (= lt!412788 (addStillContains!370 lt!412786 lt!412789 lt!412787 k0!1099))))

(assert (=> b!919607 (= (getCurrentListMap!2992 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2646 (getCurrentListMap!2992 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412790))))

(assert (=> b!919607 (= lt!412790 (tuple2!12745 lt!412789 lt!412787))))

(declare-fun get!13869 (ValueCell!9273 V!30977) V!30977)

(declare-fun dynLambda!1435 (Int (_ BitVec 64)) V!30977)

(assert (=> b!919607 (= lt!412787 (get!13869 (select (arr!26446 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1435 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412792 () Unit!31040)

(declare-fun lemmaListMapRecursiveValidKeyArray!36 (array!55004 array!55002 (_ BitVec 32) (_ BitVec 32) V!30977 V!30977 (_ BitVec 32) Int) Unit!31040)

(assert (=> b!919607 (= lt!412792 (lemmaListMapRecursiveValidKeyArray!36 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919608 () Bool)

(declare-fun res!620086 () Bool)

(assert (=> b!919608 (=> (not res!620086) (not e!516171))))

(assert (=> b!919608 (= res!620086 (and (= (size!26905 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26906 _keys!1487) (size!26905 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919609 () Bool)

(declare-fun res!620084 () Bool)

(assert (=> b!919609 (=> (not res!620084) (not e!516175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919609 (= res!620084 (validKeyInArray!0 k0!1099))))

(declare-fun b!919610 () Bool)

(assert (=> b!919610 (= e!516175 e!516172)))

(declare-fun res!620080 () Bool)

(assert (=> b!919610 (=> (not res!620080) (not e!516172))))

(assert (=> b!919610 (= res!620080 (validKeyInArray!0 lt!412789))))

(assert (=> b!919610 (= lt!412789 (select (arr!26447 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919611 () Bool)

(declare-fun e!516169 () Bool)

(assert (=> b!919611 (= e!516169 tp_is_empty!19509)))

(declare-fun b!919612 () Bool)

(declare-fun res!620081 () Bool)

(assert (=> b!919612 (=> (not res!620081) (not e!516175))))

(declare-fun v!791 () V!30977)

(declare-fun apply!579 (ListLongMap!11441 (_ BitVec 64)) V!30977)

(assert (=> b!919612 (= res!620081 (= (apply!579 lt!412786 k0!1099) v!791))))

(declare-fun mapNonEmpty!31020 () Bool)

(declare-fun tp!59443 () Bool)

(assert (=> mapNonEmpty!31020 (= mapRes!31020 (and tp!59443 e!516169))))

(declare-fun mapValue!31020 () ValueCell!9273)

(declare-fun mapKey!31020 () (_ BitVec 32))

(declare-fun mapRest!31020 () (Array (_ BitVec 32) ValueCell!9273))

(assert (=> mapNonEmpty!31020 (= (arr!26446 _values!1231) (store mapRest!31020 mapKey!31020 mapValue!31020))))

(declare-fun mapIsEmpty!31020 () Bool)

(assert (=> mapIsEmpty!31020 mapRes!31020))

(assert (= (and start!78788 res!620087) b!919608))

(assert (= (and b!919608 res!620086) b!919604))

(assert (= (and b!919604 res!620082) b!919601))

(assert (= (and b!919601 res!620083) b!919606))

(assert (= (and b!919606 res!620085) b!919603))

(assert (= (and b!919603 res!620089) b!919612))

(assert (= (and b!919612 res!620081) b!919605))

(assert (= (and b!919605 res!620088) b!919609))

(assert (= (and b!919609 res!620084) b!919610))

(assert (= (and b!919610 res!620080) b!919607))

(assert (= (and b!919600 condMapEmpty!31020) mapIsEmpty!31020))

(assert (= (and b!919600 (not condMapEmpty!31020)) mapNonEmpty!31020))

(get-info :version)

(assert (= (and mapNonEmpty!31020 ((_ is ValueCellFull!9273) mapValue!31020)) b!919611))

(assert (= (and b!919600 ((_ is ValueCellFull!9273) mapDefault!31020)) b!919602))

(assert (= start!78788 b!919600))

(declare-fun b_lambda!13503 () Bool)

(assert (=> (not b_lambda!13503) (not b!919607)))

(declare-fun t!26278 () Bool)

(declare-fun tb!5581 () Bool)

(assert (=> (and start!78788 (= defaultEntry!1235 defaultEntry!1235) t!26278) tb!5581))

(declare-fun result!10985 () Bool)

(assert (=> tb!5581 (= result!10985 tp_is_empty!19509)))

(assert (=> b!919607 t!26278))

(declare-fun b_and!27741 () Bool)

(assert (= b_and!27739 (and (=> t!26278 result!10985) b_and!27741)))

(declare-fun m!853407 () Bool)

(assert (=> b!919612 m!853407))

(declare-fun m!853409 () Bool)

(assert (=> b!919603 m!853409))

(declare-fun m!853411 () Bool)

(assert (=> b!919603 m!853411))

(declare-fun m!853413 () Bool)

(assert (=> mapNonEmpty!31020 m!853413))

(declare-fun m!853415 () Bool)

(assert (=> b!919604 m!853415))

(declare-fun m!853417 () Bool)

(assert (=> start!78788 m!853417))

(declare-fun m!853419 () Bool)

(assert (=> start!78788 m!853419))

(declare-fun m!853421 () Bool)

(assert (=> start!78788 m!853421))

(declare-fun m!853423 () Bool)

(assert (=> b!919607 m!853423))

(declare-fun m!853425 () Bool)

(assert (=> b!919607 m!853425))

(declare-fun m!853427 () Bool)

(assert (=> b!919607 m!853427))

(declare-fun m!853429 () Bool)

(assert (=> b!919607 m!853429))

(declare-fun m!853431 () Bool)

(assert (=> b!919607 m!853431))

(assert (=> b!919607 m!853429))

(declare-fun m!853433 () Bool)

(assert (=> b!919607 m!853433))

(declare-fun m!853435 () Bool)

(assert (=> b!919607 m!853435))

(declare-fun m!853437 () Bool)

(assert (=> b!919607 m!853437))

(declare-fun m!853439 () Bool)

(assert (=> b!919607 m!853439))

(declare-fun m!853441 () Bool)

(assert (=> b!919607 m!853441))

(declare-fun m!853443 () Bool)

(assert (=> b!919607 m!853443))

(assert (=> b!919607 m!853423))

(assert (=> b!919607 m!853431))

(assert (=> b!919607 m!853439))

(declare-fun m!853445 () Bool)

(assert (=> b!919607 m!853445))

(declare-fun m!853447 () Bool)

(assert (=> b!919601 m!853447))

(declare-fun m!853449 () Bool)

(assert (=> b!919610 m!853449))

(declare-fun m!853451 () Bool)

(assert (=> b!919610 m!853451))

(declare-fun m!853453 () Bool)

(assert (=> b!919609 m!853453))

(check-sat (not b!919610) b_and!27741 (not mapNonEmpty!31020) (not b!919607) (not start!78788) (not b!919604) tp_is_empty!19509 (not b!919601) (not b_lambda!13503) (not b_next!17001) (not b!919609) (not b!919603) (not b!919612))
(check-sat b_and!27741 (not b_next!17001))
