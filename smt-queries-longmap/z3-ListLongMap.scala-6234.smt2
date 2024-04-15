; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79658 () Bool)

(assert start!79658)

(declare-fun b_free!17725 () Bool)

(declare-fun b_next!17725 () Bool)

(assert (=> start!79658 (= b_free!17725 (not b_next!17725))))

(declare-fun tp!61631 () Bool)

(declare-fun b_and!29015 () Bool)

(assert (=> start!79658 (= tp!61631 b_and!29015)))

(declare-fun b!936849 () Bool)

(declare-datatypes ((Unit!31525 0))(
  ( (Unit!31526) )
))
(declare-fun e!526050 () Unit!31525)

(declare-fun Unit!31527 () Unit!31525)

(assert (=> b!936849 (= e!526050 Unit!31527)))

(declare-fun b!936850 () Bool)

(declare-fun e!526052 () Unit!31525)

(assert (=> b!936850 (= e!526052 e!526050)))

(declare-fun lt!422497 () (_ BitVec 64))

(declare-datatypes ((array!56373 0))(
  ( (array!56374 (arr!27127 (Array (_ BitVec 32) (_ BitVec 64))) (size!27588 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56373)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!936850 (= lt!422497 (select (arr!27127 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97448 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936850 (= c!97448 (validKeyInArray!0 lt!422497))))

(declare-fun b!936851 () Bool)

(declare-fun res!630699 () Bool)

(declare-fun e!526056 () Bool)

(assert (=> b!936851 (=> (not res!630699) (not e!526056))))

(declare-datatypes ((List!19153 0))(
  ( (Nil!19150) (Cons!19149 (h!20295 (_ BitVec 64)) (t!27413 List!19153)) )
))
(declare-fun arrayNoDuplicates!0 (array!56373 (_ BitVec 32) List!19153) Bool)

(assert (=> b!936851 (= res!630699 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19150))))

(declare-fun b!936852 () Bool)

(declare-fun e!526055 () Bool)

(assert (=> b!936852 (= e!526056 e!526055)))

(declare-fun res!630701 () Bool)

(assert (=> b!936852 (=> (not res!630701) (not e!526055))))

(declare-datatypes ((V!31943 0))(
  ( (V!31944 (val!10167 Int)) )
))
(declare-datatypes ((tuple2!13408 0))(
  ( (tuple2!13409 (_1!6715 (_ BitVec 64)) (_2!6715 V!31943)) )
))
(declare-datatypes ((List!19154 0))(
  ( (Nil!19151) (Cons!19150 (h!20296 tuple2!13408) (t!27414 List!19154)) )
))
(declare-datatypes ((ListLongMap!12095 0))(
  ( (ListLongMap!12096 (toList!6063 List!19154)) )
))
(declare-fun lt!422501 () ListLongMap!12095)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5065 (ListLongMap!12095 (_ BitVec 64)) Bool)

(assert (=> b!936852 (= res!630701 (contains!5065 lt!422501 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9635 0))(
  ( (ValueCellFull!9635 (v!12691 V!31943)) (EmptyCell!9635) )
))
(declare-datatypes ((array!56375 0))(
  ( (array!56376 (arr!27128 (Array (_ BitVec 32) ValueCell!9635)) (size!27589 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56375)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31943)

(declare-fun minValue!1173 () V!31943)

(declare-fun getCurrentListMap!3227 (array!56373 array!56375 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 32) Int) ListLongMap!12095)

(assert (=> b!936852 (= lt!422501 (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936853 () Bool)

(declare-fun e!526051 () Bool)

(assert (=> b!936853 (= e!526055 e!526051)))

(declare-fun res!630697 () Bool)

(assert (=> b!936853 (=> (not res!630697) (not e!526051))))

(declare-fun v!791 () V!31943)

(declare-fun lt!422502 () V!31943)

(assert (=> b!936853 (= res!630697 (and (= lt!422502 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!838 (ListLongMap!12095 (_ BitVec 64)) V!31943)

(assert (=> b!936853 (= lt!422502 (apply!838 lt!422501 k0!1099))))

(declare-fun b!936855 () Bool)

(assert (=> b!936855 (= e!526051 false)))

(declare-fun lt!422500 () Unit!31525)

(assert (=> b!936855 (= lt!422500 e!526052)))

(declare-fun c!97450 () Bool)

(assert (=> b!936855 (= c!97450 (validKeyInArray!0 k0!1099))))

(declare-fun b!936856 () Bool)

(declare-fun e!526054 () Bool)

(assert (=> b!936856 (= e!526054 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936857 () Bool)

(declare-fun e!526057 () Bool)

(declare-fun tp_is_empty!20233 () Bool)

(assert (=> b!936857 (= e!526057 tp_is_empty!20233)))

(declare-fun b!936858 () Bool)

(declare-fun lt!422494 () ListLongMap!12095)

(assert (=> b!936858 (= (apply!838 lt!422494 k0!1099) lt!422502)))

(declare-fun lt!422493 () V!31943)

(declare-fun lt!422499 () Unit!31525)

(declare-fun addApplyDifferent!423 (ListLongMap!12095 (_ BitVec 64) V!31943 (_ BitVec 64)) Unit!31525)

(assert (=> b!936858 (= lt!422499 (addApplyDifferent!423 lt!422501 lt!422497 lt!422493 k0!1099))))

(assert (=> b!936858 (not (= lt!422497 k0!1099))))

(declare-fun lt!422504 () Unit!31525)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56373 (_ BitVec 64) (_ BitVec 32) List!19153) Unit!31525)

(assert (=> b!936858 (= lt!422504 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19150))))

(assert (=> b!936858 e!526054))

(declare-fun c!97449 () Bool)

(assert (=> b!936858 (= c!97449 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422498 () Unit!31525)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!301 (array!56373 array!56375 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 64) (_ BitVec 32) Int) Unit!31525)

(assert (=> b!936858 (= lt!422498 (lemmaListMapContainsThenArrayContainsFrom!301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936858 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19150)))

(declare-fun lt!422496 () Unit!31525)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56373 (_ BitVec 32) (_ BitVec 32)) Unit!31525)

(assert (=> b!936858 (= lt!422496 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936858 (contains!5065 lt!422494 k0!1099)))

(declare-fun lt!422495 () tuple2!13408)

(declare-fun +!2854 (ListLongMap!12095 tuple2!13408) ListLongMap!12095)

(assert (=> b!936858 (= lt!422494 (+!2854 lt!422501 lt!422495))))

(declare-fun lt!422505 () Unit!31525)

(declare-fun addStillContains!543 (ListLongMap!12095 (_ BitVec 64) V!31943 (_ BitVec 64)) Unit!31525)

(assert (=> b!936858 (= lt!422505 (addStillContains!543 lt!422501 lt!422497 lt!422493 k0!1099))))

(assert (=> b!936858 (= (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2854 (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422495))))

(assert (=> b!936858 (= lt!422495 (tuple2!13409 lt!422497 lt!422493))))

(declare-fun get!14306 (ValueCell!9635 V!31943) V!31943)

(declare-fun dynLambda!1610 (Int (_ BitVec 64)) V!31943)

(assert (=> b!936858 (= lt!422493 (get!14306 (select (arr!27128 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1610 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422503 () Unit!31525)

(declare-fun lemmaListMapRecursiveValidKeyArray!218 (array!56373 array!56375 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 32) Int) Unit!31525)

(assert (=> b!936858 (= lt!422503 (lemmaListMapRecursiveValidKeyArray!218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936858 (= e!526050 lt!422499)))

(declare-fun b!936859 () Bool)

(declare-fun e!526053 () Bool)

(assert (=> b!936859 (= e!526053 tp_is_empty!20233)))

(declare-fun b!936860 () Bool)

(declare-fun res!630700 () Bool)

(assert (=> b!936860 (=> (not res!630700) (not e!526056))))

(assert (=> b!936860 (= res!630700 (and (= (size!27589 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27588 _keys!1487) (size!27589 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!630695 () Bool)

(assert (=> start!79658 (=> (not res!630695) (not e!526056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79658 (= res!630695 (validMask!0 mask!1881))))

(assert (=> start!79658 e!526056))

(assert (=> start!79658 true))

(assert (=> start!79658 tp_is_empty!20233))

(declare-fun e!526058 () Bool)

(declare-fun array_inv!21164 (array!56375) Bool)

(assert (=> start!79658 (and (array_inv!21164 _values!1231) e!526058)))

(assert (=> start!79658 tp!61631))

(declare-fun array_inv!21165 (array!56373) Bool)

(assert (=> start!79658 (array_inv!21165 _keys!1487)))

(declare-fun b!936854 () Bool)

(declare-fun res!630696 () Bool)

(assert (=> b!936854 (=> (not res!630696) (not e!526056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56373 (_ BitVec 32)) Bool)

(assert (=> b!936854 (= res!630696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936861 () Bool)

(declare-fun mapRes!32121 () Bool)

(assert (=> b!936861 (= e!526058 (and e!526053 mapRes!32121))))

(declare-fun condMapEmpty!32121 () Bool)

(declare-fun mapDefault!32121 () ValueCell!9635)

(assert (=> b!936861 (= condMapEmpty!32121 (= (arr!27128 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9635)) mapDefault!32121)))))

(declare-fun b!936862 () Bool)

(declare-fun arrayContainsKey!0 (array!56373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936862 (= e!526054 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936863 () Bool)

(declare-fun Unit!31528 () Unit!31525)

(assert (=> b!936863 (= e!526052 Unit!31528)))

(declare-fun mapIsEmpty!32121 () Bool)

(assert (=> mapIsEmpty!32121 mapRes!32121))

(declare-fun mapNonEmpty!32121 () Bool)

(declare-fun tp!61632 () Bool)

(assert (=> mapNonEmpty!32121 (= mapRes!32121 (and tp!61632 e!526057))))

(declare-fun mapKey!32121 () (_ BitVec 32))

(declare-fun mapRest!32121 () (Array (_ BitVec 32) ValueCell!9635))

(declare-fun mapValue!32121 () ValueCell!9635)

(assert (=> mapNonEmpty!32121 (= (arr!27128 _values!1231) (store mapRest!32121 mapKey!32121 mapValue!32121))))

(declare-fun b!936864 () Bool)

(declare-fun res!630698 () Bool)

(assert (=> b!936864 (=> (not res!630698) (not e!526056))))

(assert (=> b!936864 (= res!630698 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27588 _keys!1487))))))

(assert (= (and start!79658 res!630695) b!936860))

(assert (= (and b!936860 res!630700) b!936854))

(assert (= (and b!936854 res!630696) b!936851))

(assert (= (and b!936851 res!630699) b!936864))

(assert (= (and b!936864 res!630698) b!936852))

(assert (= (and b!936852 res!630701) b!936853))

(assert (= (and b!936853 res!630697) b!936855))

(assert (= (and b!936855 c!97450) b!936850))

(assert (= (and b!936855 (not c!97450)) b!936863))

(assert (= (and b!936850 c!97448) b!936858))

(assert (= (and b!936850 (not c!97448)) b!936849))

(assert (= (and b!936858 c!97449) b!936862))

(assert (= (and b!936858 (not c!97449)) b!936856))

(assert (= (and b!936861 condMapEmpty!32121) mapIsEmpty!32121))

(assert (= (and b!936861 (not condMapEmpty!32121)) mapNonEmpty!32121))

(get-info :version)

(assert (= (and mapNonEmpty!32121 ((_ is ValueCellFull!9635) mapValue!32121)) b!936857))

(assert (= (and b!936861 ((_ is ValueCellFull!9635) mapDefault!32121)) b!936859))

(assert (= start!79658 b!936861))

(declare-fun b_lambda!14113 () Bool)

(assert (=> (not b_lambda!14113) (not b!936858)))

(declare-fun t!27412 () Bool)

(declare-fun tb!6111 () Bool)

(assert (=> (and start!79658 (= defaultEntry!1235 defaultEntry!1235) t!27412) tb!6111))

(declare-fun result!12063 () Bool)

(assert (=> tb!6111 (= result!12063 tp_is_empty!20233)))

(assert (=> b!936858 t!27412))

(declare-fun b_and!29017 () Bool)

(assert (= b_and!29015 (and (=> t!27412 result!12063) b_and!29017)))

(declare-fun m!871037 () Bool)

(assert (=> b!936850 m!871037))

(declare-fun m!871039 () Bool)

(assert (=> b!936850 m!871039))

(declare-fun m!871041 () Bool)

(assert (=> b!936855 m!871041))

(declare-fun m!871043 () Bool)

(assert (=> b!936852 m!871043))

(declare-fun m!871045 () Bool)

(assert (=> b!936852 m!871045))

(declare-fun m!871047 () Bool)

(assert (=> b!936862 m!871047))

(declare-fun m!871049 () Bool)

(assert (=> b!936853 m!871049))

(declare-fun m!871051 () Bool)

(assert (=> b!936851 m!871051))

(declare-fun m!871053 () Bool)

(assert (=> b!936854 m!871053))

(declare-fun m!871055 () Bool)

(assert (=> b!936858 m!871055))

(declare-fun m!871057 () Bool)

(assert (=> b!936858 m!871057))

(declare-fun m!871059 () Bool)

(assert (=> b!936858 m!871059))

(declare-fun m!871061 () Bool)

(assert (=> b!936858 m!871061))

(declare-fun m!871063 () Bool)

(assert (=> b!936858 m!871063))

(declare-fun m!871065 () Bool)

(assert (=> b!936858 m!871065))

(assert (=> b!936858 m!871061))

(assert (=> b!936858 m!871063))

(declare-fun m!871067 () Bool)

(assert (=> b!936858 m!871067))

(declare-fun m!871069 () Bool)

(assert (=> b!936858 m!871069))

(declare-fun m!871071 () Bool)

(assert (=> b!936858 m!871071))

(declare-fun m!871073 () Bool)

(assert (=> b!936858 m!871073))

(declare-fun m!871075 () Bool)

(assert (=> b!936858 m!871075))

(declare-fun m!871077 () Bool)

(assert (=> b!936858 m!871077))

(declare-fun m!871079 () Bool)

(assert (=> b!936858 m!871079))

(declare-fun m!871081 () Bool)

(assert (=> b!936858 m!871081))

(declare-fun m!871083 () Bool)

(assert (=> b!936858 m!871083))

(assert (=> b!936858 m!871073))

(declare-fun m!871085 () Bool)

(assert (=> b!936858 m!871085))

(declare-fun m!871087 () Bool)

(assert (=> mapNonEmpty!32121 m!871087))

(declare-fun m!871089 () Bool)

(assert (=> start!79658 m!871089))

(declare-fun m!871091 () Bool)

(assert (=> start!79658 m!871091))

(declare-fun m!871093 () Bool)

(assert (=> start!79658 m!871093))

(check-sat (not b!936858) (not b!936854) (not b!936855) tp_is_empty!20233 (not b!936851) (not b_next!17725) (not b!936853) b_and!29017 (not mapNonEmpty!32121) (not start!79658) (not b_lambda!14113) (not b!936862) (not b!936850) (not b!936852))
(check-sat b_and!29017 (not b_next!17725))
