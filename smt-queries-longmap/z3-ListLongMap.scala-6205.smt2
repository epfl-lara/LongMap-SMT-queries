; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79346 () Bool)

(assert start!79346)

(declare-fun b_free!17551 () Bool)

(declare-fun b_next!17551 () Bool)

(assert (=> start!79346 (= b_free!17551 (not b_next!17551))))

(declare-fun tp!61098 () Bool)

(declare-fun b_and!28635 () Bool)

(assert (=> start!79346 (= tp!61098 b_and!28635)))

(declare-fun b!932042 () Bool)

(declare-fun res!627764 () Bool)

(declare-fun e!523403 () Bool)

(assert (=> b!932042 (=> (not res!627764) (not e!523403))))

(declare-datatypes ((array!56025 0))(
  ( (array!56026 (arr!26957 (Array (_ BitVec 32) (_ BitVec 64))) (size!27418 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56025)

(declare-datatypes ((List!19011 0))(
  ( (Nil!19008) (Cons!19007 (h!20153 (_ BitVec 64)) (t!27097 List!19011)) )
))
(declare-fun arrayNoDuplicates!0 (array!56025 (_ BitVec 32) List!19011) Bool)

(assert (=> b!932042 (= res!627764 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19008))))

(declare-fun b!932043 () Bool)

(declare-fun res!627757 () Bool)

(declare-fun e!523400 () Bool)

(assert (=> b!932043 (=> (not res!627757) (not e!523400))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932043 (= res!627757 (validKeyInArray!0 k0!1099))))

(declare-fun b!932044 () Bool)

(declare-fun res!627763 () Bool)

(assert (=> b!932044 (=> (not res!627763) (not e!523400))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932044 (= res!627763 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932045 () Bool)

(assert (=> b!932045 (= e!523403 e!523400)))

(declare-fun res!627759 () Bool)

(assert (=> b!932045 (=> (not res!627759) (not e!523400))))

(declare-datatypes ((V!31711 0))(
  ( (V!31712 (val!10080 Int)) )
))
(declare-datatypes ((tuple2!13258 0))(
  ( (tuple2!13259 (_1!6640 (_ BitVec 64)) (_2!6640 V!31711)) )
))
(declare-datatypes ((List!19012 0))(
  ( (Nil!19009) (Cons!19008 (h!20154 tuple2!13258) (t!27098 List!19012)) )
))
(declare-datatypes ((ListLongMap!11945 0))(
  ( (ListLongMap!11946 (toList!5988 List!19012)) )
))
(declare-fun lt!419589 () ListLongMap!11945)

(declare-fun contains!4986 (ListLongMap!11945 (_ BitVec 64)) Bool)

(assert (=> b!932045 (= res!627759 (contains!4986 lt!419589 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9548 0))(
  ( (ValueCellFull!9548 (v!12598 V!31711)) (EmptyCell!9548) )
))
(declare-datatypes ((array!56027 0))(
  ( (array!56028 (arr!26958 (Array (_ BitVec 32) ValueCell!9548)) (size!27419 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56027)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31711)

(declare-fun minValue!1173 () V!31711)

(declare-fun getCurrentListMap!3161 (array!56025 array!56027 (_ BitVec 32) (_ BitVec 32) V!31711 V!31711 (_ BitVec 32) Int) ListLongMap!11945)

(assert (=> b!932045 (= lt!419589 (getCurrentListMap!3161 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31848 () Bool)

(declare-fun mapRes!31848 () Bool)

(assert (=> mapIsEmpty!31848 mapRes!31848))

(declare-fun b!932046 () Bool)

(declare-fun e!523405 () Bool)

(declare-fun tp_is_empty!20059 () Bool)

(assert (=> b!932046 (= e!523405 tp_is_empty!20059)))

(declare-fun b!932047 () Bool)

(declare-fun e!523404 () Bool)

(assert (=> b!932047 (= e!523404 tp_is_empty!20059)))

(declare-fun b!932048 () Bool)

(declare-fun e!523406 () Bool)

(assert (=> b!932048 (= e!523406 (and e!523404 mapRes!31848))))

(declare-fun condMapEmpty!31848 () Bool)

(declare-fun mapDefault!31848 () ValueCell!9548)

(assert (=> b!932048 (= condMapEmpty!31848 (= (arr!26958 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9548)) mapDefault!31848)))))

(declare-fun b!932049 () Bool)

(declare-fun res!627760 () Bool)

(assert (=> b!932049 (=> (not res!627760) (not e!523403))))

(assert (=> b!932049 (= res!627760 (and (= (size!27419 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27418 _keys!1487) (size!27419 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932050 () Bool)

(declare-fun e!523401 () Bool)

(assert (=> b!932050 (= e!523401 (not (or (bvsge (size!27418 _keys!1487) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!27418 _keys!1487)) (bvsle (bvsub from!1844 #b00000000000000000000000000000001) (size!27418 _keys!1487)))))))

(declare-fun lt!419588 () tuple2!13258)

(declare-fun +!2798 (ListLongMap!11945 tuple2!13258) ListLongMap!11945)

(assert (=> b!932050 (contains!4986 (+!2798 lt!419589 lt!419588) k0!1099)))

(declare-fun lt!419592 () (_ BitVec 64))

(declare-datatypes ((Unit!31366 0))(
  ( (Unit!31367) )
))
(declare-fun lt!419590 () Unit!31366)

(declare-fun lt!419587 () V!31711)

(declare-fun addStillContains!487 (ListLongMap!11945 (_ BitVec 64) V!31711 (_ BitVec 64)) Unit!31366)

(assert (=> b!932050 (= lt!419590 (addStillContains!487 lt!419589 lt!419592 lt!419587 k0!1099))))

(assert (=> b!932050 (= (getCurrentListMap!3161 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2798 (getCurrentListMap!3161 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419588))))

(assert (=> b!932050 (= lt!419588 (tuple2!13259 lt!419592 lt!419587))))

(declare-fun get!14180 (ValueCell!9548 V!31711) V!31711)

(declare-fun dynLambda!1554 (Int (_ BitVec 64)) V!31711)

(assert (=> b!932050 (= lt!419587 (get!14180 (select (arr!26958 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1554 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419591 () Unit!31366)

(declare-fun lemmaListMapRecursiveValidKeyArray!162 (array!56025 array!56027 (_ BitVec 32) (_ BitVec 32) V!31711 V!31711 (_ BitVec 32) Int) Unit!31366)

(assert (=> b!932050 (= lt!419591 (lemmaListMapRecursiveValidKeyArray!162 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932051 () Bool)

(declare-fun res!627758 () Bool)

(assert (=> b!932051 (=> (not res!627758) (not e!523403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56025 (_ BitVec 32)) Bool)

(assert (=> b!932051 (= res!627758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932052 () Bool)

(assert (=> b!932052 (= e!523400 e!523401)))

(declare-fun res!627756 () Bool)

(assert (=> b!932052 (=> (not res!627756) (not e!523401))))

(assert (=> b!932052 (= res!627756 (validKeyInArray!0 lt!419592))))

(assert (=> b!932052 (= lt!419592 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!627755 () Bool)

(assert (=> start!79346 (=> (not res!627755) (not e!523403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79346 (= res!627755 (validMask!0 mask!1881))))

(assert (=> start!79346 e!523403))

(assert (=> start!79346 true))

(assert (=> start!79346 tp_is_empty!20059))

(declare-fun array_inv!21048 (array!56027) Bool)

(assert (=> start!79346 (and (array_inv!21048 _values!1231) e!523406)))

(assert (=> start!79346 tp!61098))

(declare-fun array_inv!21049 (array!56025) Bool)

(assert (=> start!79346 (array_inv!21049 _keys!1487)))

(declare-fun mapNonEmpty!31848 () Bool)

(declare-fun tp!61097 () Bool)

(assert (=> mapNonEmpty!31848 (= mapRes!31848 (and tp!61097 e!523405))))

(declare-fun mapRest!31848 () (Array (_ BitVec 32) ValueCell!9548))

(declare-fun mapKey!31848 () (_ BitVec 32))

(declare-fun mapValue!31848 () ValueCell!9548)

(assert (=> mapNonEmpty!31848 (= (arr!26958 _values!1231) (store mapRest!31848 mapKey!31848 mapValue!31848))))

(declare-fun b!932053 () Bool)

(declare-fun res!627762 () Bool)

(assert (=> b!932053 (=> (not res!627762) (not e!523400))))

(declare-fun v!791 () V!31711)

(declare-fun apply!779 (ListLongMap!11945 (_ BitVec 64)) V!31711)

(assert (=> b!932053 (= res!627762 (= (apply!779 lt!419589 k0!1099) v!791))))

(declare-fun b!932054 () Bool)

(declare-fun res!627761 () Bool)

(assert (=> b!932054 (=> (not res!627761) (not e!523403))))

(assert (=> b!932054 (= res!627761 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27418 _keys!1487))))))

(assert (= (and start!79346 res!627755) b!932049))

(assert (= (and b!932049 res!627760) b!932051))

(assert (= (and b!932051 res!627758) b!932042))

(assert (= (and b!932042 res!627764) b!932054))

(assert (= (and b!932054 res!627761) b!932045))

(assert (= (and b!932045 res!627759) b!932053))

(assert (= (and b!932053 res!627762) b!932044))

(assert (= (and b!932044 res!627763) b!932043))

(assert (= (and b!932043 res!627757) b!932052))

(assert (= (and b!932052 res!627756) b!932050))

(assert (= (and b!932048 condMapEmpty!31848) mapIsEmpty!31848))

(assert (= (and b!932048 (not condMapEmpty!31848)) mapNonEmpty!31848))

(get-info :version)

(assert (= (and mapNonEmpty!31848 ((_ is ValueCellFull!9548) mapValue!31848)) b!932046))

(assert (= (and b!932048 ((_ is ValueCellFull!9548) mapDefault!31848)) b!932047))

(assert (= start!79346 b!932048))

(declare-fun b_lambda!13867 () Bool)

(assert (=> (not b_lambda!13867) (not b!932050)))

(declare-fun t!27096 () Bool)

(declare-fun tb!5937 () Bool)

(assert (=> (and start!79346 (= defaultEntry!1235 defaultEntry!1235) t!27096) tb!5937))

(declare-fun result!11707 () Bool)

(assert (=> tb!5937 (= result!11707 tp_is_empty!20059)))

(assert (=> b!932050 t!27096))

(declare-fun b_and!28637 () Bool)

(assert (= b_and!28635 (and (=> t!27096 result!11707) b_and!28637)))

(declare-fun m!865481 () Bool)

(assert (=> b!932052 m!865481))

(declare-fun m!865483 () Bool)

(assert (=> b!932052 m!865483))

(declare-fun m!865485 () Bool)

(assert (=> b!932043 m!865485))

(declare-fun m!865487 () Bool)

(assert (=> b!932051 m!865487))

(declare-fun m!865489 () Bool)

(assert (=> b!932042 m!865489))

(declare-fun m!865491 () Bool)

(assert (=> mapNonEmpty!31848 m!865491))

(declare-fun m!865493 () Bool)

(assert (=> b!932045 m!865493))

(declare-fun m!865495 () Bool)

(assert (=> b!932045 m!865495))

(declare-fun m!865497 () Bool)

(assert (=> b!932050 m!865497))

(declare-fun m!865499 () Bool)

(assert (=> b!932050 m!865499))

(assert (=> b!932050 m!865497))

(declare-fun m!865501 () Bool)

(assert (=> b!932050 m!865501))

(declare-fun m!865503 () Bool)

(assert (=> b!932050 m!865503))

(assert (=> b!932050 m!865501))

(assert (=> b!932050 m!865503))

(declare-fun m!865505 () Bool)

(assert (=> b!932050 m!865505))

(declare-fun m!865507 () Bool)

(assert (=> b!932050 m!865507))

(declare-fun m!865509 () Bool)

(assert (=> b!932050 m!865509))

(declare-fun m!865511 () Bool)

(assert (=> b!932050 m!865511))

(assert (=> b!932050 m!865509))

(declare-fun m!865513 () Bool)

(assert (=> b!932050 m!865513))

(declare-fun m!865515 () Bool)

(assert (=> b!932050 m!865515))

(declare-fun m!865517 () Bool)

(assert (=> start!79346 m!865517))

(declare-fun m!865519 () Bool)

(assert (=> start!79346 m!865519))

(declare-fun m!865521 () Bool)

(assert (=> start!79346 m!865521))

(declare-fun m!865523 () Bool)

(assert (=> b!932053 m!865523))

(check-sat (not mapNonEmpty!31848) (not b!932043) (not b!932050) tp_is_empty!20059 (not b!932042) b_and!28637 (not b!932045) (not b!932052) (not b!932053) (not b_next!17551) (not b!932051) (not b_lambda!13867) (not start!79346))
(check-sat b_and!28637 (not b_next!17551))
