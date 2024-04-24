; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110688 () Bool)

(assert start!110688)

(declare-fun res!868003 () Bool)

(declare-fun e!746446 () Bool)

(assert (=> start!110688 (=> (not res!868003) (not e!746446))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110688 (= res!868003 (validMask!0 mask!2040))))

(assert (=> start!110688 e!746446))

(assert (=> start!110688 true))

(declare-datatypes ((V!51809 0))(
  ( (V!51810 (val!17589 Int)) )
))
(declare-datatypes ((ValueCell!16616 0))(
  ( (ValueCellFull!16616 (v!20211 V!51809)) (EmptyCell!16616) )
))
(declare-datatypes ((array!87127 0))(
  ( (array!87128 (arr!42039 (Array (_ BitVec 32) ValueCell!16616)) (size!42590 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87127)

(declare-fun e!746448 () Bool)

(declare-fun array_inv!32037 (array!87127) Bool)

(assert (=> start!110688 (and (array_inv!32037 _values!1354) e!746448)))

(declare-datatypes ((array!87129 0))(
  ( (array!87130 (arr!42040 (Array (_ BitVec 32) (_ BitVec 64))) (size!42591 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87129)

(declare-fun array_inv!32038 (array!87129) Bool)

(assert (=> start!110688 (array_inv!32038 _keys!1628)))

(declare-fun b!1308085 () Bool)

(assert (=> b!1308085 (= e!746446 false)))

(declare-fun lt!585452 () Bool)

(declare-datatypes ((List!29849 0))(
  ( (Nil!29846) (Cons!29845 (h!31063 (_ BitVec 64)) (t!43447 List!29849)) )
))
(declare-fun arrayNoDuplicates!0 (array!87129 (_ BitVec 32) List!29849) Bool)

(assert (=> b!1308085 (= lt!585452 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29846))))

(declare-fun b!1308086 () Bool)

(declare-fun e!746447 () Bool)

(declare-fun tp_is_empty!35029 () Bool)

(assert (=> b!1308086 (= e!746447 tp_is_empty!35029)))

(declare-fun b!1308087 () Bool)

(declare-fun mapRes!54172 () Bool)

(assert (=> b!1308087 (= e!746448 (and e!746447 mapRes!54172))))

(declare-fun condMapEmpty!54172 () Bool)

(declare-fun mapDefault!54172 () ValueCell!16616)

(assert (=> b!1308087 (= condMapEmpty!54172 (= (arr!42039 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16616)) mapDefault!54172)))))

(declare-fun b!1308088 () Bool)

(declare-fun e!746449 () Bool)

(assert (=> b!1308088 (= e!746449 tp_is_empty!35029)))

(declare-fun mapIsEmpty!54172 () Bool)

(assert (=> mapIsEmpty!54172 mapRes!54172))

(declare-fun b!1308089 () Bool)

(declare-fun res!868004 () Bool)

(assert (=> b!1308089 (=> (not res!868004) (not e!746446))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308089 (= res!868004 (and (= (size!42590 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42591 _keys!1628) (size!42590 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54172 () Bool)

(declare-fun tp!103252 () Bool)

(assert (=> mapNonEmpty!54172 (= mapRes!54172 (and tp!103252 e!746449))))

(declare-fun mapKey!54172 () (_ BitVec 32))

(declare-fun mapRest!54172 () (Array (_ BitVec 32) ValueCell!16616))

(declare-fun mapValue!54172 () ValueCell!16616)

(assert (=> mapNonEmpty!54172 (= (arr!42039 _values!1354) (store mapRest!54172 mapKey!54172 mapValue!54172))))

(declare-fun b!1308090 () Bool)

(declare-fun res!868002 () Bool)

(assert (=> b!1308090 (=> (not res!868002) (not e!746446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87129 (_ BitVec 32)) Bool)

(assert (=> b!1308090 (= res!868002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110688 res!868003) b!1308089))

(assert (= (and b!1308089 res!868004) b!1308090))

(assert (= (and b!1308090 res!868002) b!1308085))

(assert (= (and b!1308087 condMapEmpty!54172) mapIsEmpty!54172))

(assert (= (and b!1308087 (not condMapEmpty!54172)) mapNonEmpty!54172))

(get-info :version)

(assert (= (and mapNonEmpty!54172 ((_ is ValueCellFull!16616) mapValue!54172)) b!1308088))

(assert (= (and b!1308087 ((_ is ValueCellFull!16616) mapDefault!54172)) b!1308086))

(assert (= start!110688 b!1308087))

(declare-fun m!1199303 () Bool)

(assert (=> start!110688 m!1199303))

(declare-fun m!1199305 () Bool)

(assert (=> start!110688 m!1199305))

(declare-fun m!1199307 () Bool)

(assert (=> start!110688 m!1199307))

(declare-fun m!1199309 () Bool)

(assert (=> b!1308085 m!1199309))

(declare-fun m!1199311 () Bool)

(assert (=> mapNonEmpty!54172 m!1199311))

(declare-fun m!1199313 () Bool)

(assert (=> b!1308090 m!1199313))

(check-sat (not b!1308085) (not b!1308090) tp_is_empty!35029 (not start!110688) (not mapNonEmpty!54172))
(check-sat)
