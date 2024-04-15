; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83740 () Bool)

(assert start!83740)

(declare-fun b_free!19567 () Bool)

(declare-fun b_next!19567 () Bool)

(assert (=> start!83740 (= b_free!19567 (not b_next!19567))))

(declare-fun tp!68144 () Bool)

(declare-fun b_and!31197 () Bool)

(assert (=> start!83740 (= tp!68144 b_and!31197)))

(declare-fun b!977806 () Bool)

(declare-fun res!654425 () Bool)

(declare-fun e!551288 () Bool)

(assert (=> b!977806 (=> (not res!654425) (not e!551288))))

(declare-datatypes ((array!61078 0))(
  ( (array!61079 (arr!29397 (Array (_ BitVec 32) (_ BitVec 64))) (size!29878 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61078)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977806 (= res!654425 (validKeyInArray!0 (select (arr!29397 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35870 () Bool)

(declare-fun mapRes!35870 () Bool)

(assert (=> mapIsEmpty!35870 mapRes!35870))

(declare-fun mapNonEmpty!35870 () Bool)

(declare-fun tp!68143 () Bool)

(declare-fun e!551284 () Bool)

(assert (=> mapNonEmpty!35870 (= mapRes!35870 (and tp!68143 e!551284))))

(declare-datatypes ((V!35065 0))(
  ( (V!35066 (val!11331 Int)) )
))
(declare-datatypes ((ValueCell!10799 0))(
  ( (ValueCellFull!10799 (v!13892 V!35065)) (EmptyCell!10799) )
))
(declare-datatypes ((array!61080 0))(
  ( (array!61081 (arr!29398 (Array (_ BitVec 32) ValueCell!10799)) (size!29879 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61080)

(declare-fun mapKey!35870 () (_ BitVec 32))

(declare-fun mapRest!35870 () (Array (_ BitVec 32) ValueCell!10799))

(declare-fun mapValue!35870 () ValueCell!10799)

(assert (=> mapNonEmpty!35870 (= (arr!29398 _values!1278) (store mapRest!35870 mapKey!35870 mapValue!35870))))

(declare-fun b!977807 () Bool)

(declare-fun tp_is_empty!22561 () Bool)

(assert (=> b!977807 (= e!551284 tp_is_empty!22561)))

(declare-fun b!977809 () Bool)

(declare-fun e!551286 () Bool)

(declare-fun e!551287 () Bool)

(assert (=> b!977809 (= e!551286 (and e!551287 mapRes!35870))))

(declare-fun condMapEmpty!35870 () Bool)

(declare-fun mapDefault!35870 () ValueCell!10799)

(assert (=> b!977809 (= condMapEmpty!35870 (= (arr!29398 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10799)) mapDefault!35870)))))

(declare-fun b!977810 () Bool)

(assert (=> b!977810 (= e!551288 (not true))))

(declare-datatypes ((tuple2!14586 0))(
  ( (tuple2!14587 (_1!7304 (_ BitVec 64)) (_2!7304 V!35065)) )
))
(declare-datatypes ((List!20413 0))(
  ( (Nil!20410) (Cons!20409 (h!21571 tuple2!14586) (t!28927 List!20413)) )
))
(declare-datatypes ((ListLongMap!13273 0))(
  ( (ListLongMap!13274 (toList!6652 List!20413)) )
))
(declare-fun lt!433352 () ListLongMap!13273)

(declare-fun lt!433350 () tuple2!14586)

(declare-fun lt!433351 () tuple2!14586)

(declare-fun +!2952 (ListLongMap!13273 tuple2!14586) ListLongMap!13273)

(assert (=> b!977810 (= (+!2952 (+!2952 lt!433352 lt!433350) lt!433351) (+!2952 (+!2952 lt!433352 lt!433351) lt!433350))))

(declare-fun lt!433353 () V!35065)

(assert (=> b!977810 (= lt!433351 (tuple2!14587 (select (arr!29397 _keys!1544) from!1932) lt!433353))))

(declare-fun minValue!1220 () V!35065)

(assert (=> b!977810 (= lt!433350 (tuple2!14587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32370 0))(
  ( (Unit!32371) )
))
(declare-fun lt!433349 () Unit!32370)

(declare-fun addCommutativeForDiffKeys!556 (ListLongMap!13273 (_ BitVec 64) V!35065 (_ BitVec 64) V!35065) Unit!32370)

(assert (=> b!977810 (= lt!433349 (addCommutativeForDiffKeys!556 lt!433352 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29397 _keys!1544) from!1932) lt!433353))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15225 (ValueCell!10799 V!35065) V!35065)

(declare-fun dynLambda!1705 (Int (_ BitVec 64)) V!35065)

(assert (=> b!977810 (= lt!433353 (get!15225 (select (arr!29398 _values!1278) from!1932) (dynLambda!1705 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35065)

(declare-fun getCurrentListMapNoExtraKeys!3372 (array!61078 array!61080 (_ BitVec 32) (_ BitVec 32) V!35065 V!35065 (_ BitVec 32) Int) ListLongMap!13273)

(assert (=> b!977810 (= lt!433352 (+!2952 (getCurrentListMapNoExtraKeys!3372 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!977811 () Bool)

(declare-fun res!654429 () Bool)

(assert (=> b!977811 (=> (not res!654429) (not e!551288))))

(assert (=> b!977811 (= res!654429 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!977812 () Bool)

(declare-fun res!654423 () Bool)

(assert (=> b!977812 (=> (not res!654423) (not e!551288))))

(assert (=> b!977812 (= res!654423 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29878 _keys!1544))))))

(declare-fun b!977813 () Bool)

(assert (=> b!977813 (= e!551287 tp_is_empty!22561)))

(declare-fun b!977814 () Bool)

(declare-fun res!654427 () Bool)

(assert (=> b!977814 (=> (not res!654427) (not e!551288))))

(assert (=> b!977814 (= res!654427 (and (= (size!29879 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29878 _keys!1544) (size!29879 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977815 () Bool)

(declare-fun res!654428 () Bool)

(assert (=> b!977815 (=> (not res!654428) (not e!551288))))

(declare-datatypes ((List!20414 0))(
  ( (Nil!20411) (Cons!20410 (h!21572 (_ BitVec 64)) (t!28928 List!20414)) )
))
(declare-fun arrayNoDuplicates!0 (array!61078 (_ BitVec 32) List!20414) Bool)

(assert (=> b!977815 (= res!654428 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20411))))

(declare-fun res!654424 () Bool)

(assert (=> start!83740 (=> (not res!654424) (not e!551288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83740 (= res!654424 (validMask!0 mask!1948))))

(assert (=> start!83740 e!551288))

(assert (=> start!83740 true))

(assert (=> start!83740 tp_is_empty!22561))

(declare-fun array_inv!22765 (array!61080) Bool)

(assert (=> start!83740 (and (array_inv!22765 _values!1278) e!551286)))

(assert (=> start!83740 tp!68144))

(declare-fun array_inv!22766 (array!61078) Bool)

(assert (=> start!83740 (array_inv!22766 _keys!1544)))

(declare-fun b!977808 () Bool)

(declare-fun res!654426 () Bool)

(assert (=> b!977808 (=> (not res!654426) (not e!551288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61078 (_ BitVec 32)) Bool)

(assert (=> b!977808 (= res!654426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83740 res!654424) b!977814))

(assert (= (and b!977814 res!654427) b!977808))

(assert (= (and b!977808 res!654426) b!977815))

(assert (= (and b!977815 res!654428) b!977812))

(assert (= (and b!977812 res!654423) b!977806))

(assert (= (and b!977806 res!654425) b!977811))

(assert (= (and b!977811 res!654429) b!977810))

(assert (= (and b!977809 condMapEmpty!35870) mapIsEmpty!35870))

(assert (= (and b!977809 (not condMapEmpty!35870)) mapNonEmpty!35870))

(get-info :version)

(assert (= (and mapNonEmpty!35870 ((_ is ValueCellFull!10799) mapValue!35870)) b!977807))

(assert (= (and b!977809 ((_ is ValueCellFull!10799) mapDefault!35870)) b!977813))

(assert (= start!83740 b!977809))

(declare-fun b_lambda!14593 () Bool)

(assert (=> (not b_lambda!14593) (not b!977810)))

(declare-fun t!28926 () Bool)

(declare-fun tb!6365 () Bool)

(assert (=> (and start!83740 (= defaultEntry!1281 defaultEntry!1281) t!28926) tb!6365))

(declare-fun result!12727 () Bool)

(assert (=> tb!6365 (= result!12727 tp_is_empty!22561)))

(assert (=> b!977810 t!28926))

(declare-fun b_and!31199 () Bool)

(assert (= b_and!31197 (and (=> t!28926 result!12727) b_and!31199)))

(declare-fun m!904385 () Bool)

(assert (=> mapNonEmpty!35870 m!904385))

(declare-fun m!904387 () Bool)

(assert (=> start!83740 m!904387))

(declare-fun m!904389 () Bool)

(assert (=> start!83740 m!904389))

(declare-fun m!904391 () Bool)

(assert (=> start!83740 m!904391))

(declare-fun m!904393 () Bool)

(assert (=> b!977810 m!904393))

(declare-fun m!904395 () Bool)

(assert (=> b!977810 m!904395))

(assert (=> b!977810 m!904393))

(declare-fun m!904397 () Bool)

(assert (=> b!977810 m!904397))

(assert (=> b!977810 m!904395))

(declare-fun m!904399 () Bool)

(assert (=> b!977810 m!904399))

(declare-fun m!904401 () Bool)

(assert (=> b!977810 m!904401))

(declare-fun m!904403 () Bool)

(assert (=> b!977810 m!904403))

(declare-fun m!904405 () Bool)

(assert (=> b!977810 m!904405))

(assert (=> b!977810 m!904405))

(declare-fun m!904407 () Bool)

(assert (=> b!977810 m!904407))

(assert (=> b!977810 m!904401))

(declare-fun m!904409 () Bool)

(assert (=> b!977810 m!904409))

(declare-fun m!904411 () Bool)

(assert (=> b!977810 m!904411))

(assert (=> b!977810 m!904409))

(assert (=> b!977810 m!904411))

(declare-fun m!904413 () Bool)

(assert (=> b!977810 m!904413))

(declare-fun m!904415 () Bool)

(assert (=> b!977808 m!904415))

(declare-fun m!904417 () Bool)

(assert (=> b!977815 m!904417))

(assert (=> b!977806 m!904393))

(assert (=> b!977806 m!904393))

(declare-fun m!904419 () Bool)

(assert (=> b!977806 m!904419))

(check-sat (not mapNonEmpty!35870) (not b_lambda!14593) (not b_next!19567) (not b!977808) (not b!977806) (not b!977815) tp_is_empty!22561 b_and!31199 (not start!83740) (not b!977810))
(check-sat b_and!31199 (not b_next!19567))
