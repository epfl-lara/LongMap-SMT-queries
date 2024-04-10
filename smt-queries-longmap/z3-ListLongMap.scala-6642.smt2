; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83826 () Bool)

(assert start!83826)

(declare-fun b_free!19635 () Bool)

(declare-fun b_next!19635 () Bool)

(assert (=> start!83826 (= b_free!19635 (not b_next!19635))))

(declare-fun tp!68346 () Bool)

(declare-fun b_and!31359 () Bool)

(assert (=> start!83826 (= tp!68346 b_and!31359)))

(declare-fun b!979156 () Bool)

(declare-fun res!655273 () Bool)

(declare-fun e!551967 () Bool)

(assert (=> b!979156 (=> (not res!655273) (not e!551967))))

(declare-datatypes ((array!61277 0))(
  ( (array!61278 (arr!29496 (Array (_ BitVec 32) (_ BitVec 64))) (size!29975 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61277)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979156 (= res!655273 (validKeyInArray!0 (select (arr!29496 _keys!1544) from!1932)))))

(declare-fun b!979157 () Bool)

(declare-fun e!551969 () Bool)

(declare-fun e!551966 () Bool)

(declare-fun mapRes!35972 () Bool)

(assert (=> b!979157 (= e!551969 (and e!551966 mapRes!35972))))

(declare-fun condMapEmpty!35972 () Bool)

(declare-datatypes ((V!35155 0))(
  ( (V!35156 (val!11365 Int)) )
))
(declare-datatypes ((ValueCell!10833 0))(
  ( (ValueCellFull!10833 (v!13927 V!35155)) (EmptyCell!10833) )
))
(declare-datatypes ((array!61279 0))(
  ( (array!61280 (arr!29497 (Array (_ BitVec 32) ValueCell!10833)) (size!29976 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61279)

(declare-fun mapDefault!35972 () ValueCell!10833)

(assert (=> b!979157 (= condMapEmpty!35972 (= (arr!29497 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10833)) mapDefault!35972)))))

(declare-fun b!979158 () Bool)

(declare-fun res!655276 () Bool)

(assert (=> b!979158 (=> (not res!655276) (not e!551967))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61277 (_ BitVec 32)) Bool)

(assert (=> b!979158 (= res!655276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979159 () Bool)

(declare-fun e!551965 () Bool)

(assert (=> b!979159 (= e!551965 true)))

(declare-datatypes ((tuple2!14578 0))(
  ( (tuple2!14579 (_1!7300 (_ BitVec 64)) (_2!7300 V!35155)) )
))
(declare-fun lt!434214 () tuple2!14578)

(declare-datatypes ((List!20448 0))(
  ( (Nil!20445) (Cons!20444 (h!21606 tuple2!14578) (t!29039 List!20448)) )
))
(declare-datatypes ((ListLongMap!13275 0))(
  ( (ListLongMap!13276 (toList!6653 List!20448)) )
))
(declare-fun lt!434212 () ListLongMap!13275)

(declare-fun lt!434213 () tuple2!14578)

(declare-fun lt!434217 () ListLongMap!13275)

(declare-fun +!2958 (ListLongMap!13275 tuple2!14578) ListLongMap!13275)

(assert (=> b!979159 (= lt!434217 (+!2958 (+!2958 lt!434212 lt!434214) lt!434213))))

(declare-datatypes ((Unit!32555 0))(
  ( (Unit!32556) )
))
(declare-fun lt!434219 () Unit!32555)

(declare-fun lt!434218 () V!35155)

(declare-fun zeroValue!1220 () V!35155)

(declare-fun addCommutativeForDiffKeys!586 (ListLongMap!13275 (_ BitVec 64) V!35155 (_ BitVec 64) V!35155) Unit!32555)

(assert (=> b!979159 (= lt!434219 (addCommutativeForDiffKeys!586 lt!434212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29496 _keys!1544) from!1932) lt!434218))))

(declare-fun b!979160 () Bool)

(declare-fun tp_is_empty!22629 () Bool)

(assert (=> b!979160 (= e!551966 tp_is_empty!22629)))

(declare-fun b!979161 () Bool)

(declare-fun res!655274 () Bool)

(assert (=> b!979161 (=> (not res!655274) (not e!551967))))

(assert (=> b!979161 (= res!655274 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29975 _keys!1544))))))

(declare-fun b!979162 () Bool)

(declare-fun res!655271 () Bool)

(assert (=> b!979162 (=> (not res!655271) (not e!551967))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979162 (= res!655271 (and (= (size!29976 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29975 _keys!1544) (size!29976 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979163 () Bool)

(declare-fun res!655277 () Bool)

(assert (=> b!979163 (=> (not res!655277) (not e!551967))))

(assert (=> b!979163 (= res!655277 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979164 () Bool)

(declare-fun res!655275 () Bool)

(assert (=> b!979164 (=> (not res!655275) (not e!551967))))

(declare-datatypes ((List!20449 0))(
  ( (Nil!20446) (Cons!20445 (h!21607 (_ BitVec 64)) (t!29040 List!20449)) )
))
(declare-fun arrayNoDuplicates!0 (array!61277 (_ BitVec 32) List!20449) Bool)

(assert (=> b!979164 (= res!655275 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20446))))

(declare-fun b!979165 () Bool)

(declare-fun e!551968 () Bool)

(assert (=> b!979165 (= e!551968 tp_is_empty!22629)))

(declare-fun b!979166 () Bool)

(assert (=> b!979166 (= e!551967 (not e!551965))))

(declare-fun res!655270 () Bool)

(assert (=> b!979166 (=> res!655270 e!551965)))

(assert (=> b!979166 (= res!655270 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29496 _keys!1544) from!1932)))))

(declare-fun lt!434215 () ListLongMap!13275)

(declare-fun lt!434211 () tuple2!14578)

(assert (=> b!979166 (= (+!2958 lt!434215 lt!434214) (+!2958 lt!434217 lt!434211))))

(declare-fun lt!434216 () ListLongMap!13275)

(assert (=> b!979166 (= lt!434217 (+!2958 lt!434216 lt!434214))))

(assert (=> b!979166 (= lt!434214 (tuple2!14579 (select (arr!29496 _keys!1544) from!1932) lt!434218))))

(assert (=> b!979166 (= lt!434215 (+!2958 lt!434216 lt!434211))))

(declare-fun minValue!1220 () V!35155)

(assert (=> b!979166 (= lt!434211 (tuple2!14579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434210 () Unit!32555)

(assert (=> b!979166 (= lt!434210 (addCommutativeForDiffKeys!586 lt!434216 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29496 _keys!1544) from!1932) lt!434218))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15282 (ValueCell!10833 V!35155) V!35155)

(declare-fun dynLambda!1745 (Int (_ BitVec 64)) V!35155)

(assert (=> b!979166 (= lt!434218 (get!15282 (select (arr!29497 _values!1278) from!1932) (dynLambda!1745 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979166 (= lt!434216 (+!2958 lt!434212 lt!434213))))

(assert (=> b!979166 (= lt!434213 (tuple2!14579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3359 (array!61277 array!61279 (_ BitVec 32) (_ BitVec 32) V!35155 V!35155 (_ BitVec 32) Int) ListLongMap!13275)

(assert (=> b!979166 (= lt!434212 (getCurrentListMapNoExtraKeys!3359 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!35972 () Bool)

(assert (=> mapIsEmpty!35972 mapRes!35972))

(declare-fun mapNonEmpty!35972 () Bool)

(declare-fun tp!68347 () Bool)

(assert (=> mapNonEmpty!35972 (= mapRes!35972 (and tp!68347 e!551968))))

(declare-fun mapKey!35972 () (_ BitVec 32))

(declare-fun mapValue!35972 () ValueCell!10833)

(declare-fun mapRest!35972 () (Array (_ BitVec 32) ValueCell!10833))

(assert (=> mapNonEmpty!35972 (= (arr!29497 _values!1278) (store mapRest!35972 mapKey!35972 mapValue!35972))))

(declare-fun res!655272 () Bool)

(assert (=> start!83826 (=> (not res!655272) (not e!551967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83826 (= res!655272 (validMask!0 mask!1948))))

(assert (=> start!83826 e!551967))

(assert (=> start!83826 true))

(assert (=> start!83826 tp_is_empty!22629))

(declare-fun array_inv!22805 (array!61279) Bool)

(assert (=> start!83826 (and (array_inv!22805 _values!1278) e!551969)))

(assert (=> start!83826 tp!68346))

(declare-fun array_inv!22806 (array!61277) Bool)

(assert (=> start!83826 (array_inv!22806 _keys!1544)))

(assert (= (and start!83826 res!655272) b!979162))

(assert (= (and b!979162 res!655271) b!979158))

(assert (= (and b!979158 res!655276) b!979164))

(assert (= (and b!979164 res!655275) b!979161))

(assert (= (and b!979161 res!655274) b!979156))

(assert (= (and b!979156 res!655273) b!979163))

(assert (= (and b!979163 res!655277) b!979166))

(assert (= (and b!979166 (not res!655270)) b!979159))

(assert (= (and b!979157 condMapEmpty!35972) mapIsEmpty!35972))

(assert (= (and b!979157 (not condMapEmpty!35972)) mapNonEmpty!35972))

(get-info :version)

(assert (= (and mapNonEmpty!35972 ((_ is ValueCellFull!10833) mapValue!35972)) b!979165))

(assert (= (and b!979157 ((_ is ValueCellFull!10833) mapDefault!35972)) b!979160))

(assert (= start!83826 b!979157))

(declare-fun b_lambda!14679 () Bool)

(assert (=> (not b_lambda!14679) (not b!979166)))

(declare-fun t!29038 () Bool)

(declare-fun tb!6441 () Bool)

(assert (=> (and start!83826 (= defaultEntry!1281 defaultEntry!1281) t!29038) tb!6441))

(declare-fun result!12871 () Bool)

(assert (=> tb!6441 (= result!12871 tp_is_empty!22629)))

(assert (=> b!979166 t!29038))

(declare-fun b_and!31361 () Bool)

(assert (= b_and!31359 (and (=> t!29038 result!12871) b_and!31361)))

(declare-fun m!906409 () Bool)

(assert (=> b!979164 m!906409))

(declare-fun m!906411 () Bool)

(assert (=> b!979166 m!906411))

(declare-fun m!906413 () Bool)

(assert (=> b!979166 m!906413))

(declare-fun m!906415 () Bool)

(assert (=> b!979166 m!906415))

(declare-fun m!906417 () Bool)

(assert (=> b!979166 m!906417))

(declare-fun m!906419 () Bool)

(assert (=> b!979166 m!906419))

(declare-fun m!906421 () Bool)

(assert (=> b!979166 m!906421))

(declare-fun m!906423 () Bool)

(assert (=> b!979166 m!906423))

(declare-fun m!906425 () Bool)

(assert (=> b!979166 m!906425))

(assert (=> b!979166 m!906413))

(declare-fun m!906427 () Bool)

(assert (=> b!979166 m!906427))

(declare-fun m!906429 () Bool)

(assert (=> b!979166 m!906429))

(assert (=> b!979166 m!906415))

(assert (=> b!979166 m!906429))

(declare-fun m!906431 () Bool)

(assert (=> b!979166 m!906431))

(declare-fun m!906433 () Bool)

(assert (=> b!979159 m!906433))

(assert (=> b!979159 m!906433))

(declare-fun m!906435 () Bool)

(assert (=> b!979159 m!906435))

(assert (=> b!979159 m!906413))

(assert (=> b!979159 m!906413))

(declare-fun m!906437 () Bool)

(assert (=> b!979159 m!906437))

(declare-fun m!906439 () Bool)

(assert (=> b!979158 m!906439))

(assert (=> b!979156 m!906413))

(assert (=> b!979156 m!906413))

(declare-fun m!906441 () Bool)

(assert (=> b!979156 m!906441))

(declare-fun m!906443 () Bool)

(assert (=> start!83826 m!906443))

(declare-fun m!906445 () Bool)

(assert (=> start!83826 m!906445))

(declare-fun m!906447 () Bool)

(assert (=> start!83826 m!906447))

(declare-fun m!906449 () Bool)

(assert (=> mapNonEmpty!35972 m!906449))

(check-sat (not mapNonEmpty!35972) (not b_next!19635) (not b!979159) (not b_lambda!14679) (not b!979166) (not b!979164) (not b!979158) (not start!83826) tp_is_empty!22629 (not b!979156) b_and!31361)
(check-sat b_and!31361 (not b_next!19635))
