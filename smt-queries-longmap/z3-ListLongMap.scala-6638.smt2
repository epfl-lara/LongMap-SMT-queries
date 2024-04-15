; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83782 () Bool)

(assert start!83782)

(declare-fun b_free!19609 () Bool)

(declare-fun b_next!19609 () Bool)

(assert (=> start!83782 (= b_free!19609 (not b_next!19609))))

(declare-fun tp!68269 () Bool)

(declare-fun b_and!31281 () Bool)

(assert (=> start!83782 (= tp!68269 b_and!31281)))

(declare-fun b!978478 () Bool)

(declare-fun res!654867 () Bool)

(declare-fun e!551599 () Bool)

(assert (=> b!978478 (=> (not res!654867) (not e!551599))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61154 0))(
  ( (array!61155 (arr!29435 (Array (_ BitVec 32) (_ BitVec 64))) (size!29916 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61154)

(assert (=> b!978478 (= res!654867 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29916 _keys!1544))))))

(declare-fun b!978479 () Bool)

(declare-fun res!654870 () Bool)

(assert (=> b!978479 (=> (not res!654870) (not e!551599))))

(declare-datatypes ((V!35121 0))(
  ( (V!35122 (val!11352 Int)) )
))
(declare-datatypes ((ValueCell!10820 0))(
  ( (ValueCellFull!10820 (v!13913 V!35121)) (EmptyCell!10820) )
))
(declare-datatypes ((array!61156 0))(
  ( (array!61157 (arr!29436 (Array (_ BitVec 32) ValueCell!10820)) (size!29917 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61156)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!978479 (= res!654870 (and (= (size!29917 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29916 _keys!1544) (size!29917 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978480 () Bool)

(declare-fun res!654869 () Bool)

(assert (=> b!978480 (=> (not res!654869) (not e!551599))))

(declare-datatypes ((List!20446 0))(
  ( (Nil!20443) (Cons!20442 (h!21604 (_ BitVec 64)) (t!29002 List!20446)) )
))
(declare-fun arrayNoDuplicates!0 (array!61154 (_ BitVec 32) List!20446) Bool)

(assert (=> b!978480 (= res!654869 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20443))))

(declare-fun b!978481 () Bool)

(declare-fun e!551602 () Bool)

(declare-fun tp_is_empty!22603 () Bool)

(assert (=> b!978481 (= e!551602 tp_is_empty!22603)))

(declare-fun b!978482 () Bool)

(declare-fun e!551601 () Bool)

(declare-fun mapRes!35933 () Bool)

(assert (=> b!978482 (= e!551601 (and e!551602 mapRes!35933))))

(declare-fun condMapEmpty!35933 () Bool)

(declare-fun mapDefault!35933 () ValueCell!10820)

(assert (=> b!978482 (= condMapEmpty!35933 (= (arr!29436 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10820)) mapDefault!35933)))))

(declare-fun b!978483 () Bool)

(declare-fun res!654868 () Bool)

(assert (=> b!978483 (=> (not res!654868) (not e!551599))))

(assert (=> b!978483 (= res!654868 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!654865 () Bool)

(assert (=> start!83782 (=> (not res!654865) (not e!551599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83782 (= res!654865 (validMask!0 mask!1948))))

(assert (=> start!83782 e!551599))

(assert (=> start!83782 true))

(assert (=> start!83782 tp_is_empty!22603))

(declare-fun array_inv!22795 (array!61156) Bool)

(assert (=> start!83782 (and (array_inv!22795 _values!1278) e!551601)))

(assert (=> start!83782 tp!68269))

(declare-fun array_inv!22796 (array!61154) Bool)

(assert (=> start!83782 (array_inv!22796 _keys!1544)))

(declare-fun b!978484 () Bool)

(declare-fun res!654864 () Bool)

(assert (=> b!978484 (=> (not res!654864) (not e!551599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978484 (= res!654864 (validKeyInArray!0 (select (arr!29435 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35933 () Bool)

(assert (=> mapIsEmpty!35933 mapRes!35933))

(declare-fun mapNonEmpty!35933 () Bool)

(declare-fun tp!68270 () Bool)

(declare-fun e!551600 () Bool)

(assert (=> mapNonEmpty!35933 (= mapRes!35933 (and tp!68270 e!551600))))

(declare-fun mapKey!35933 () (_ BitVec 32))

(declare-fun mapValue!35933 () ValueCell!10820)

(declare-fun mapRest!35933 () (Array (_ BitVec 32) ValueCell!10820))

(assert (=> mapNonEmpty!35933 (= (arr!29436 _values!1278) (store mapRest!35933 mapKey!35933 mapValue!35933))))

(declare-fun b!978485 () Bool)

(assert (=> b!978485 (= e!551599 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14620 0))(
  ( (tuple2!14621 (_1!7321 (_ BitVec 64)) (_2!7321 V!35121)) )
))
(declare-datatypes ((List!20447 0))(
  ( (Nil!20444) (Cons!20443 (h!21605 tuple2!14620) (t!29003 List!20447)) )
))
(declare-datatypes ((ListLongMap!13307 0))(
  ( (ListLongMap!13308 (toList!6669 List!20447)) )
))
(declare-fun lt!433668 () ListLongMap!13307)

(declare-fun lt!433665 () tuple2!14620)

(declare-fun lt!433667 () tuple2!14620)

(declare-fun +!2969 (ListLongMap!13307 tuple2!14620) ListLongMap!13307)

(assert (=> b!978485 (= (+!2969 (+!2969 lt!433668 lt!433665) lt!433667) (+!2969 (+!2969 lt!433668 lt!433667) lt!433665))))

(declare-fun lt!433666 () V!35121)

(assert (=> b!978485 (= lt!433667 (tuple2!14621 (select (arr!29435 _keys!1544) from!1932) lt!433666))))

(declare-fun minValue!1220 () V!35121)

(assert (=> b!978485 (= lt!433665 (tuple2!14621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32404 0))(
  ( (Unit!32405) )
))
(declare-fun lt!433664 () Unit!32404)

(declare-fun addCommutativeForDiffKeys!573 (ListLongMap!13307 (_ BitVec 64) V!35121 (_ BitVec 64) V!35121) Unit!32404)

(assert (=> b!978485 (= lt!433664 (addCommutativeForDiffKeys!573 lt!433668 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29435 _keys!1544) from!1932) lt!433666))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15256 (ValueCell!10820 V!35121) V!35121)

(declare-fun dynLambda!1722 (Int (_ BitVec 64)) V!35121)

(assert (=> b!978485 (= lt!433666 (get!15256 (select (arr!29436 _values!1278) from!1932) (dynLambda!1722 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35121)

(declare-fun getCurrentListMapNoExtraKeys!3389 (array!61154 array!61156 (_ BitVec 32) (_ BitVec 32) V!35121 V!35121 (_ BitVec 32) Int) ListLongMap!13307)

(assert (=> b!978485 (= lt!433668 (+!2969 (getCurrentListMapNoExtraKeys!3389 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978486 () Bool)

(declare-fun res!654866 () Bool)

(assert (=> b!978486 (=> (not res!654866) (not e!551599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61154 (_ BitVec 32)) Bool)

(assert (=> b!978486 (= res!654866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978487 () Bool)

(assert (=> b!978487 (= e!551600 tp_is_empty!22603)))

(assert (= (and start!83782 res!654865) b!978479))

(assert (= (and b!978479 res!654870) b!978486))

(assert (= (and b!978486 res!654866) b!978480))

(assert (= (and b!978480 res!654869) b!978478))

(assert (= (and b!978478 res!654867) b!978484))

(assert (= (and b!978484 res!654864) b!978483))

(assert (= (and b!978483 res!654868) b!978485))

(assert (= (and b!978482 condMapEmpty!35933) mapIsEmpty!35933))

(assert (= (and b!978482 (not condMapEmpty!35933)) mapNonEmpty!35933))

(get-info :version)

(assert (= (and mapNonEmpty!35933 ((_ is ValueCellFull!10820) mapValue!35933)) b!978487))

(assert (= (and b!978482 ((_ is ValueCellFull!10820) mapDefault!35933)) b!978481))

(assert (= start!83782 b!978482))

(declare-fun b_lambda!14635 () Bool)

(assert (=> (not b_lambda!14635) (not b!978485)))

(declare-fun t!29001 () Bool)

(declare-fun tb!6407 () Bool)

(assert (=> (and start!83782 (= defaultEntry!1281 defaultEntry!1281) t!29001) tb!6407))

(declare-fun result!12811 () Bool)

(assert (=> tb!6407 (= result!12811 tp_is_empty!22603)))

(assert (=> b!978485 t!29001))

(declare-fun b_and!31283 () Bool)

(assert (= b_and!31281 (and (=> t!29001 result!12811) b_and!31283)))

(declare-fun m!905141 () Bool)

(assert (=> mapNonEmpty!35933 m!905141))

(declare-fun m!905143 () Bool)

(assert (=> b!978480 m!905143))

(declare-fun m!905145 () Bool)

(assert (=> b!978484 m!905145))

(assert (=> b!978484 m!905145))

(declare-fun m!905147 () Bool)

(assert (=> b!978484 m!905147))

(assert (=> b!978485 m!905145))

(declare-fun m!905149 () Bool)

(assert (=> b!978485 m!905149))

(declare-fun m!905151 () Bool)

(assert (=> b!978485 m!905151))

(declare-fun m!905153 () Bool)

(assert (=> b!978485 m!905153))

(declare-fun m!905155 () Bool)

(assert (=> b!978485 m!905155))

(declare-fun m!905157 () Bool)

(assert (=> b!978485 m!905157))

(assert (=> b!978485 m!905145))

(declare-fun m!905159 () Bool)

(assert (=> b!978485 m!905159))

(assert (=> b!978485 m!905157))

(declare-fun m!905161 () Bool)

(assert (=> b!978485 m!905161))

(assert (=> b!978485 m!905149))

(declare-fun m!905163 () Bool)

(assert (=> b!978485 m!905163))

(declare-fun m!905165 () Bool)

(assert (=> b!978485 m!905165))

(assert (=> b!978485 m!905155))

(declare-fun m!905167 () Bool)

(assert (=> b!978485 m!905167))

(assert (=> b!978485 m!905163))

(assert (=> b!978485 m!905151))

(declare-fun m!905169 () Bool)

(assert (=> b!978486 m!905169))

(declare-fun m!905171 () Bool)

(assert (=> start!83782 m!905171))

(declare-fun m!905173 () Bool)

(assert (=> start!83782 m!905173))

(declare-fun m!905175 () Bool)

(assert (=> start!83782 m!905175))

(check-sat (not b_next!19609) (not b!978485) tp_is_empty!22603 (not b_lambda!14635) (not start!83782) (not b!978486) (not mapNonEmpty!35933) (not b!978480) b_and!31283 (not b!978484))
(check-sat b_and!31283 (not b_next!19609))
