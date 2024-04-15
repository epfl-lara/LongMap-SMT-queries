; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110638 () Bool)

(assert start!110638)

(declare-fun b_free!29473 () Bool)

(declare-fun b_next!29473 () Bool)

(assert (=> start!110638 (= b_free!29473 (not b_next!29473))))

(declare-fun tp!103741 () Bool)

(declare-fun b_and!47663 () Bool)

(assert (=> start!110638 (= tp!103741 b_and!47663)))

(declare-fun mapIsEmpty!54433 () Bool)

(declare-fun mapRes!54433 () Bool)

(assert (=> mapIsEmpty!54433 mapRes!54433))

(declare-fun b!1309069 () Bool)

(declare-fun e!746876 () Bool)

(assert (=> b!1309069 (= e!746876 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87315 0))(
  ( (array!87316 (arr!42138 (Array (_ BitVec 32) (_ BitVec 64))) (size!42690 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87315)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52041 0))(
  ( (V!52042 (val!17676 Int)) )
))
(declare-fun minValue!1296 () V!52041)

(declare-datatypes ((ValueCell!16703 0))(
  ( (ValueCellFull!16703 (v!20302 V!52041)) (EmptyCell!16703) )
))
(declare-datatypes ((array!87317 0))(
  ( (array!87318 (arr!42139 (Array (_ BitVec 32) ValueCell!16703)) (size!42691 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87317)

(declare-fun zeroValue!1296 () V!52041)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585042 () Bool)

(declare-datatypes ((tuple2!22844 0))(
  ( (tuple2!22845 (_1!11433 (_ BitVec 64)) (_2!11433 V!52041)) )
))
(declare-datatypes ((List!29973 0))(
  ( (Nil!29970) (Cons!29969 (h!31178 tuple2!22844) (t!43571 List!29973)) )
))
(declare-datatypes ((ListLongMap!20501 0))(
  ( (ListLongMap!20502 (toList!10266 List!29973)) )
))
(declare-fun contains!8343 (ListLongMap!20501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5161 (array!87315 array!87317 (_ BitVec 32) (_ BitVec 32) V!52041 V!52041 (_ BitVec 32) Int) ListLongMap!20501)

(assert (=> b!1309069 (= lt!585042 (contains!8343 (getCurrentListMap!5161 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309071 () Bool)

(declare-fun res!869025 () Bool)

(assert (=> b!1309071 (=> (not res!869025) (not e!746876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87315 (_ BitVec 32)) Bool)

(assert (=> b!1309071 (= res!869025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309072 () Bool)

(declare-fun res!869028 () Bool)

(assert (=> b!1309072 (=> (not res!869028) (not e!746876))))

(declare-datatypes ((List!29974 0))(
  ( (Nil!29971) (Cons!29970 (h!31179 (_ BitVec 64)) (t!43572 List!29974)) )
))
(declare-fun arrayNoDuplicates!0 (array!87315 (_ BitVec 32) List!29974) Bool)

(assert (=> b!1309072 (= res!869028 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29971))))

(declare-fun b!1309073 () Bool)

(declare-fun res!869027 () Bool)

(assert (=> b!1309073 (=> (not res!869027) (not e!746876))))

(assert (=> b!1309073 (= res!869027 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42690 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!869029 () Bool)

(assert (=> start!110638 (=> (not res!869029) (not e!746876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110638 (= res!869029 (validMask!0 mask!2040))))

(assert (=> start!110638 e!746876))

(assert (=> start!110638 tp!103741))

(declare-fun array_inv!32039 (array!87315) Bool)

(assert (=> start!110638 (array_inv!32039 _keys!1628)))

(assert (=> start!110638 true))

(declare-fun tp_is_empty!35203 () Bool)

(assert (=> start!110638 tp_is_empty!35203))

(declare-fun e!746877 () Bool)

(declare-fun array_inv!32040 (array!87317) Bool)

(assert (=> start!110638 (and (array_inv!32040 _values!1354) e!746877)))

(declare-fun b!1309070 () Bool)

(declare-fun res!869026 () Bool)

(assert (=> b!1309070 (=> (not res!869026) (not e!746876))))

(assert (=> b!1309070 (= res!869026 (and (= (size!42691 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42690 _keys!1628) (size!42691 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309074 () Bool)

(declare-fun e!746878 () Bool)

(assert (=> b!1309074 (= e!746878 tp_is_empty!35203)))

(declare-fun b!1309075 () Bool)

(assert (=> b!1309075 (= e!746877 (and e!746878 mapRes!54433))))

(declare-fun condMapEmpty!54433 () Bool)

(declare-fun mapDefault!54433 () ValueCell!16703)

(assert (=> b!1309075 (= condMapEmpty!54433 (= (arr!42139 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16703)) mapDefault!54433)))))

(declare-fun b!1309076 () Bool)

(declare-fun e!746879 () Bool)

(assert (=> b!1309076 (= e!746879 tp_is_empty!35203)))

(declare-fun mapNonEmpty!54433 () Bool)

(declare-fun tp!103742 () Bool)

(assert (=> mapNonEmpty!54433 (= mapRes!54433 (and tp!103742 e!746879))))

(declare-fun mapKey!54433 () (_ BitVec 32))

(declare-fun mapValue!54433 () ValueCell!16703)

(declare-fun mapRest!54433 () (Array (_ BitVec 32) ValueCell!16703))

(assert (=> mapNonEmpty!54433 (= (arr!42139 _values!1354) (store mapRest!54433 mapKey!54433 mapValue!54433))))

(assert (= (and start!110638 res!869029) b!1309070))

(assert (= (and b!1309070 res!869026) b!1309071))

(assert (= (and b!1309071 res!869025) b!1309072))

(assert (= (and b!1309072 res!869028) b!1309073))

(assert (= (and b!1309073 res!869027) b!1309069))

(assert (= (and b!1309075 condMapEmpty!54433) mapIsEmpty!54433))

(assert (= (and b!1309075 (not condMapEmpty!54433)) mapNonEmpty!54433))

(get-info :version)

(assert (= (and mapNonEmpty!54433 ((_ is ValueCellFull!16703) mapValue!54433)) b!1309076))

(assert (= (and b!1309075 ((_ is ValueCellFull!16703) mapDefault!54433)) b!1309074))

(assert (= start!110638 b!1309075))

(declare-fun m!1198803 () Bool)

(assert (=> b!1309071 m!1198803))

(declare-fun m!1198805 () Bool)

(assert (=> start!110638 m!1198805))

(declare-fun m!1198807 () Bool)

(assert (=> start!110638 m!1198807))

(declare-fun m!1198809 () Bool)

(assert (=> start!110638 m!1198809))

(declare-fun m!1198811 () Bool)

(assert (=> b!1309072 m!1198811))

(declare-fun m!1198813 () Bool)

(assert (=> mapNonEmpty!54433 m!1198813))

(declare-fun m!1198815 () Bool)

(assert (=> b!1309069 m!1198815))

(assert (=> b!1309069 m!1198815))

(declare-fun m!1198817 () Bool)

(assert (=> b!1309069 m!1198817))

(check-sat b_and!47663 (not b!1309072) (not b!1309071) (not b!1309069) tp_is_empty!35203 (not start!110638) (not mapNonEmpty!54433) (not b_next!29473))
(check-sat b_and!47663 (not b_next!29473))
