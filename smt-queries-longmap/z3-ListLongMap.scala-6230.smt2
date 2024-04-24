; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79820 () Bool)

(assert start!79820)

(declare-fun b_free!17701 () Bool)

(declare-fun b_next!17701 () Bool)

(assert (=> start!79820 (= b_free!17701 (not b_next!17701))))

(declare-fun tp!61559 () Bool)

(declare-fun b_and!29003 () Bool)

(assert (=> start!79820 (= tp!61559 b_and!29003)))

(declare-fun b!937392 () Bool)

(declare-datatypes ((Unit!31575 0))(
  ( (Unit!31576) )
))
(declare-fun e!526427 () Unit!31575)

(declare-fun e!526420 () Unit!31575)

(assert (=> b!937392 (= e!526427 e!526420)))

(declare-fun lt!422633 () (_ BitVec 64))

(declare-datatypes ((array!56411 0))(
  ( (array!56412 (arr!27141 (Array (_ BitVec 32) (_ BitVec 64))) (size!27601 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56411)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!937392 (= lt!422633 (select (arr!27141 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97689 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937392 (= c!97689 (validKeyInArray!0 lt!422633))))

(declare-fun b!937393 () Bool)

(declare-fun res!630899 () Bool)

(declare-fun e!526425 () Bool)

(assert (=> b!937393 (=> (not res!630899) (not e!526425))))

(declare-datatypes ((List!19101 0))(
  ( (Nil!19098) (Cons!19097 (h!20249 (_ BitVec 64)) (t!27338 List!19101)) )
))
(declare-fun arrayNoDuplicates!0 (array!56411 (_ BitVec 32) List!19101) Bool)

(assert (=> b!937393 (= res!630899 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19098))))

(declare-fun mapNonEmpty!32085 () Bool)

(declare-fun mapRes!32085 () Bool)

(declare-fun tp!61560 () Bool)

(declare-fun e!526426 () Bool)

(assert (=> mapNonEmpty!32085 (= mapRes!32085 (and tp!61560 e!526426))))

(declare-datatypes ((V!31911 0))(
  ( (V!31912 (val!10155 Int)) )
))
(declare-datatypes ((ValueCell!9623 0))(
  ( (ValueCellFull!9623 (v!12677 V!31911)) (EmptyCell!9623) )
))
(declare-fun mapValue!32085 () ValueCell!9623)

(declare-fun mapRest!32085 () (Array (_ BitVec 32) ValueCell!9623))

(declare-datatypes ((array!56413 0))(
  ( (array!56414 (arr!27142 (Array (_ BitVec 32) ValueCell!9623)) (size!27602 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56413)

(declare-fun mapKey!32085 () (_ BitVec 32))

(assert (=> mapNonEmpty!32085 (= (arr!27142 _values!1231) (store mapRest!32085 mapKey!32085 mapValue!32085))))

(declare-fun b!937394 () Bool)

(declare-fun tp_is_empty!20209 () Bool)

(assert (=> b!937394 (= e!526426 tp_is_empty!20209)))

(declare-fun mapIsEmpty!32085 () Bool)

(assert (=> mapIsEmpty!32085 mapRes!32085))

(declare-fun e!526428 () Bool)

(declare-fun b!937395 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937395 (= e!526428 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937396 () Bool)

(declare-fun e!526419 () Bool)

(assert (=> b!937396 (= e!526419 tp_is_empty!20209)))

(declare-fun b!937397 () Bool)

(declare-fun e!526423 () Bool)

(assert (=> b!937397 (= e!526425 e!526423)))

(declare-fun res!630898 () Bool)

(assert (=> b!937397 (=> (not res!630898) (not e!526423))))

(declare-datatypes ((tuple2!13320 0))(
  ( (tuple2!13321 (_1!6671 (_ BitVec 64)) (_2!6671 V!31911)) )
))
(declare-datatypes ((List!19102 0))(
  ( (Nil!19099) (Cons!19098 (h!20250 tuple2!13320) (t!27339 List!19102)) )
))
(declare-datatypes ((ListLongMap!12019 0))(
  ( (ListLongMap!12020 (toList!6025 List!19102)) )
))
(declare-fun lt!422632 () ListLongMap!12019)

(declare-fun contains!5097 (ListLongMap!12019 (_ BitVec 64)) Bool)

(assert (=> b!937397 (= res!630898 (contains!5097 lt!422632 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31911)

(declare-fun minValue!1173 () V!31911)

(declare-fun getCurrentListMap!3262 (array!56411 array!56413 (_ BitVec 32) (_ BitVec 32) V!31911 V!31911 (_ BitVec 32) Int) ListLongMap!12019)

(assert (=> b!937397 (= lt!422632 (getCurrentListMap!3262 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937398 () Bool)

(declare-fun e!526421 () Bool)

(assert (=> b!937398 (= e!526423 e!526421)))

(declare-fun res!630901 () Bool)

(assert (=> b!937398 (=> (not res!630901) (not e!526421))))

(declare-fun v!791 () V!31911)

(declare-fun lt!422629 () V!31911)

(assert (=> b!937398 (= res!630901 (and (= lt!422629 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!844 (ListLongMap!12019 (_ BitVec 64)) V!31911)

(assert (=> b!937398 (= lt!422629 (apply!844 lt!422632 k0!1099))))

(declare-fun b!937399 () Bool)

(declare-fun res!630902 () Bool)

(assert (=> b!937399 (=> (not res!630902) (not e!526425))))

(assert (=> b!937399 (= res!630902 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27601 _keys!1487))))))

(declare-fun b!937400 () Bool)

(declare-fun lt!422623 () ListLongMap!12019)

(assert (=> b!937400 (= (apply!844 lt!422623 k0!1099) lt!422629)))

(declare-fun lt!422631 () Unit!31575)

(declare-fun lt!422625 () V!31911)

(declare-fun addApplyDifferent!423 (ListLongMap!12019 (_ BitVec 64) V!31911 (_ BitVec 64)) Unit!31575)

(assert (=> b!937400 (= lt!422631 (addApplyDifferent!423 lt!422632 lt!422633 lt!422625 k0!1099))))

(assert (=> b!937400 (not (= lt!422633 k0!1099))))

(declare-fun lt!422628 () Unit!31575)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56411 (_ BitVec 64) (_ BitVec 32) List!19101) Unit!31575)

(assert (=> b!937400 (= lt!422628 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19098))))

(assert (=> b!937400 e!526428))

(declare-fun c!97687 () Bool)

(assert (=> b!937400 (= c!97687 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422627 () Unit!31575)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!293 (array!56411 array!56413 (_ BitVec 32) (_ BitVec 32) V!31911 V!31911 (_ BitVec 64) (_ BitVec 32) Int) Unit!31575)

(assert (=> b!937400 (= lt!422627 (lemmaListMapContainsThenArrayContainsFrom!293 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937400 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19098)))

(declare-fun lt!422630 () Unit!31575)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56411 (_ BitVec 32) (_ BitVec 32)) Unit!31575)

(assert (=> b!937400 (= lt!422630 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937400 (contains!5097 lt!422623 k0!1099)))

(declare-fun lt!422624 () tuple2!13320)

(declare-fun +!2839 (ListLongMap!12019 tuple2!13320) ListLongMap!12019)

(assert (=> b!937400 (= lt!422623 (+!2839 lt!422632 lt!422624))))

(declare-fun lt!422634 () Unit!31575)

(declare-fun addStillContains!542 (ListLongMap!12019 (_ BitVec 64) V!31911 (_ BitVec 64)) Unit!31575)

(assert (=> b!937400 (= lt!422634 (addStillContains!542 lt!422632 lt!422633 lt!422625 k0!1099))))

(assert (=> b!937400 (= (getCurrentListMap!3262 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2839 (getCurrentListMap!3262 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422624))))

(assert (=> b!937400 (= lt!422624 (tuple2!13321 lt!422633 lt!422625))))

(declare-fun get!14323 (ValueCell!9623 V!31911) V!31911)

(declare-fun dynLambda!1636 (Int (_ BitVec 64)) V!31911)

(assert (=> b!937400 (= lt!422625 (get!14323 (select (arr!27142 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1636 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422626 () Unit!31575)

(declare-fun lemmaListMapRecursiveValidKeyArray!219 (array!56411 array!56413 (_ BitVec 32) (_ BitVec 32) V!31911 V!31911 (_ BitVec 32) Int) Unit!31575)

(assert (=> b!937400 (= lt!422626 (lemmaListMapRecursiveValidKeyArray!219 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937400 (= e!526420 lt!422631)))

(declare-fun b!937391 () Bool)

(declare-fun Unit!31577 () Unit!31575)

(assert (=> b!937391 (= e!526420 Unit!31577)))

(declare-fun res!630903 () Bool)

(assert (=> start!79820 (=> (not res!630903) (not e!526425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79820 (= res!630903 (validMask!0 mask!1881))))

(assert (=> start!79820 e!526425))

(assert (=> start!79820 true))

(assert (=> start!79820 tp_is_empty!20209))

(declare-fun e!526422 () Bool)

(declare-fun array_inv!21194 (array!56413) Bool)

(assert (=> start!79820 (and (array_inv!21194 _values!1231) e!526422)))

(assert (=> start!79820 tp!61559))

(declare-fun array_inv!21195 (array!56411) Bool)

(assert (=> start!79820 (array_inv!21195 _keys!1487)))

(declare-fun b!937401 () Bool)

(assert (=> b!937401 (= e!526421 false)))

(declare-fun lt!422622 () Unit!31575)

(assert (=> b!937401 (= lt!422622 e!526427)))

(declare-fun c!97688 () Bool)

(assert (=> b!937401 (= c!97688 (validKeyInArray!0 k0!1099))))

(declare-fun b!937402 () Bool)

(assert (=> b!937402 (= e!526428 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937403 () Bool)

(declare-fun Unit!31578 () Unit!31575)

(assert (=> b!937403 (= e!526427 Unit!31578)))

(declare-fun b!937404 () Bool)

(declare-fun res!630900 () Bool)

(assert (=> b!937404 (=> (not res!630900) (not e!526425))))

(assert (=> b!937404 (= res!630900 (and (= (size!27602 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27601 _keys!1487) (size!27602 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937405 () Bool)

(assert (=> b!937405 (= e!526422 (and e!526419 mapRes!32085))))

(declare-fun condMapEmpty!32085 () Bool)

(declare-fun mapDefault!32085 () ValueCell!9623)

(assert (=> b!937405 (= condMapEmpty!32085 (= (arr!27142 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9623)) mapDefault!32085)))))

(declare-fun b!937406 () Bool)

(declare-fun res!630897 () Bool)

(assert (=> b!937406 (=> (not res!630897) (not e!526425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56411 (_ BitVec 32)) Bool)

(assert (=> b!937406 (= res!630897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79820 res!630903) b!937404))

(assert (= (and b!937404 res!630900) b!937406))

(assert (= (and b!937406 res!630897) b!937393))

(assert (= (and b!937393 res!630899) b!937399))

(assert (= (and b!937399 res!630902) b!937397))

(assert (= (and b!937397 res!630898) b!937398))

(assert (= (and b!937398 res!630901) b!937401))

(assert (= (and b!937401 c!97688) b!937392))

(assert (= (and b!937401 (not c!97688)) b!937403))

(assert (= (and b!937392 c!97689) b!937400))

(assert (= (and b!937392 (not c!97689)) b!937391))

(assert (= (and b!937400 c!97687) b!937395))

(assert (= (and b!937400 (not c!97687)) b!937402))

(assert (= (and b!937405 condMapEmpty!32085) mapIsEmpty!32085))

(assert (= (and b!937405 (not condMapEmpty!32085)) mapNonEmpty!32085))

(get-info :version)

(assert (= (and mapNonEmpty!32085 ((_ is ValueCellFull!9623) mapValue!32085)) b!937394))

(assert (= (and b!937405 ((_ is ValueCellFull!9623) mapDefault!32085)) b!937396))

(assert (= start!79820 b!937405))

(declare-fun b_lambda!14121 () Bool)

(assert (=> (not b_lambda!14121) (not b!937400)))

(declare-fun t!27337 () Bool)

(declare-fun tb!6087 () Bool)

(assert (=> (and start!79820 (= defaultEntry!1235 defaultEntry!1235) t!27337) tb!6087))

(declare-fun result!12015 () Bool)

(assert (=> tb!6087 (= result!12015 tp_is_empty!20209)))

(assert (=> b!937400 t!27337))

(declare-fun b_and!29005 () Bool)

(assert (= b_and!29003 (and (=> t!27337 result!12015) b_and!29005)))

(declare-fun m!872393 () Bool)

(assert (=> b!937398 m!872393))

(declare-fun m!872395 () Bool)

(assert (=> b!937392 m!872395))

(declare-fun m!872397 () Bool)

(assert (=> b!937392 m!872397))

(declare-fun m!872399 () Bool)

(assert (=> mapNonEmpty!32085 m!872399))

(declare-fun m!872401 () Bool)

(assert (=> b!937395 m!872401))

(declare-fun m!872403 () Bool)

(assert (=> b!937397 m!872403))

(declare-fun m!872405 () Bool)

(assert (=> b!937397 m!872405))

(declare-fun m!872407 () Bool)

(assert (=> b!937406 m!872407))

(declare-fun m!872409 () Bool)

(assert (=> b!937393 m!872409))

(declare-fun m!872411 () Bool)

(assert (=> start!79820 m!872411))

(declare-fun m!872413 () Bool)

(assert (=> start!79820 m!872413))

(declare-fun m!872415 () Bool)

(assert (=> start!79820 m!872415))

(declare-fun m!872417 () Bool)

(assert (=> b!937400 m!872417))

(declare-fun m!872419 () Bool)

(assert (=> b!937400 m!872419))

(declare-fun m!872421 () Bool)

(assert (=> b!937400 m!872421))

(declare-fun m!872423 () Bool)

(assert (=> b!937400 m!872423))

(declare-fun m!872425 () Bool)

(assert (=> b!937400 m!872425))

(declare-fun m!872427 () Bool)

(assert (=> b!937400 m!872427))

(declare-fun m!872429 () Bool)

(assert (=> b!937400 m!872429))

(declare-fun m!872431 () Bool)

(assert (=> b!937400 m!872431))

(assert (=> b!937400 m!872427))

(assert (=> b!937400 m!872429))

(declare-fun m!872433 () Bool)

(assert (=> b!937400 m!872433))

(declare-fun m!872435 () Bool)

(assert (=> b!937400 m!872435))

(declare-fun m!872437 () Bool)

(assert (=> b!937400 m!872437))

(declare-fun m!872439 () Bool)

(assert (=> b!937400 m!872439))

(declare-fun m!872441 () Bool)

(assert (=> b!937400 m!872441))

(declare-fun m!872443 () Bool)

(assert (=> b!937400 m!872443))

(declare-fun m!872445 () Bool)

(assert (=> b!937400 m!872445))

(assert (=> b!937400 m!872419))

(declare-fun m!872447 () Bool)

(assert (=> b!937400 m!872447))

(declare-fun m!872449 () Bool)

(assert (=> b!937401 m!872449))

(check-sat (not b!937400) (not b!937392) (not b!937406) tp_is_empty!20209 (not b!937398) b_and!29005 (not b_lambda!14121) (not b!937397) (not b!937401) (not mapNonEmpty!32085) (not b!937393) (not start!79820) (not b_next!17701) (not b!937395))
(check-sat b_and!29005 (not b_next!17701))
