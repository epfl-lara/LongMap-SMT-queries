; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110868 () Bool)

(assert start!110868)

(declare-fun b_free!29479 () Bool)

(declare-fun b_next!29479 () Bool)

(assert (=> start!110868 (= b_free!29479 (not b_next!29479))))

(declare-fun tp!103758 () Bool)

(declare-fun b_and!47689 () Bool)

(assert (=> start!110868 (= tp!103758 b_and!47689)))

(declare-fun b!1310510 () Bool)

(declare-fun e!747799 () Bool)

(declare-fun tp_is_empty!35209 () Bool)

(assert (=> b!1310510 (= e!747799 tp_is_empty!35209)))

(declare-fun b!1310511 () Bool)

(declare-fun res!869621 () Bool)

(declare-fun e!747797 () Bool)

(assert (=> b!1310511 (=> (not res!869621) (not e!747797))))

(declare-datatypes ((array!87475 0))(
  ( (array!87476 (arr!42213 (Array (_ BitVec 32) (_ BitVec 64))) (size!42764 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87475)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310511 (= res!869621 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42764 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310512 () Bool)

(declare-fun e!747796 () Bool)

(assert (=> b!1310512 (= e!747796 tp_is_empty!35209)))

(declare-fun mapNonEmpty!54442 () Bool)

(declare-fun mapRes!54442 () Bool)

(declare-fun tp!103759 () Bool)

(assert (=> mapNonEmpty!54442 (= mapRes!54442 (and tp!103759 e!747799))))

(declare-datatypes ((V!52049 0))(
  ( (V!52050 (val!17679 Int)) )
))
(declare-datatypes ((ValueCell!16706 0))(
  ( (ValueCellFull!16706 (v!20301 V!52049)) (EmptyCell!16706) )
))
(declare-fun mapRest!54442 () (Array (_ BitVec 32) ValueCell!16706))

(declare-datatypes ((array!87477 0))(
  ( (array!87478 (arr!42214 (Array (_ BitVec 32) ValueCell!16706)) (size!42765 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87477)

(declare-fun mapValue!54442 () ValueCell!16706)

(declare-fun mapKey!54442 () (_ BitVec 32))

(assert (=> mapNonEmpty!54442 (= (arr!42214 _values!1354) (store mapRest!54442 mapKey!54442 mapValue!54442))))

(declare-fun b!1310513 () Bool)

(declare-fun res!869620 () Bool)

(assert (=> b!1310513 (=> (not res!869620) (not e!747797))))

(declare-datatypes ((List!29971 0))(
  ( (Nil!29968) (Cons!29967 (h!31185 (_ BitVec 64)) (t!43569 List!29971)) )
))
(declare-fun arrayNoDuplicates!0 (array!87475 (_ BitVec 32) List!29971) Bool)

(assert (=> b!1310513 (= res!869620 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29968))))

(declare-fun res!869617 () Bool)

(assert (=> start!110868 (=> (not res!869617) (not e!747797))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110868 (= res!869617 (validMask!0 mask!2040))))

(assert (=> start!110868 e!747797))

(assert (=> start!110868 tp!103758))

(declare-fun array_inv!32165 (array!87475) Bool)

(assert (=> start!110868 (array_inv!32165 _keys!1628)))

(assert (=> start!110868 true))

(assert (=> start!110868 tp_is_empty!35209))

(declare-fun e!747798 () Bool)

(declare-fun array_inv!32166 (array!87477) Bool)

(assert (=> start!110868 (and (array_inv!32166 _values!1354) e!747798)))

(declare-fun b!1310514 () Bool)

(declare-fun res!869619 () Bool)

(assert (=> b!1310514 (=> (not res!869619) (not e!747797))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310514 (= res!869619 (and (= (size!42765 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42764 _keys!1628) (size!42765 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310515 () Bool)

(declare-fun res!869618 () Bool)

(assert (=> b!1310515 (=> (not res!869618) (not e!747797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87475 (_ BitVec 32)) Bool)

(assert (=> b!1310515 (= res!869618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54442 () Bool)

(assert (=> mapIsEmpty!54442 mapRes!54442))

(declare-fun b!1310516 () Bool)

(assert (=> b!1310516 (= e!747798 (and e!747796 mapRes!54442))))

(declare-fun condMapEmpty!54442 () Bool)

(declare-fun mapDefault!54442 () ValueCell!16706)

(assert (=> b!1310516 (= condMapEmpty!54442 (= (arr!42214 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16706)) mapDefault!54442)))))

(declare-fun b!1310517 () Bool)

(assert (=> b!1310517 (= e!747797 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52049)

(declare-fun lt!585713 () Bool)

(declare-fun zeroValue!1296 () V!52049)

(declare-datatypes ((tuple2!22812 0))(
  ( (tuple2!22813 (_1!11417 (_ BitVec 64)) (_2!11417 V!52049)) )
))
(declare-datatypes ((List!29972 0))(
  ( (Nil!29969) (Cons!29968 (h!31186 tuple2!22812) (t!43570 List!29972)) )
))
(declare-datatypes ((ListLongMap!20477 0))(
  ( (ListLongMap!20478 (toList!10254 List!29972)) )
))
(declare-fun contains!8416 (ListLongMap!20477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5258 (array!87475 array!87477 (_ BitVec 32) (_ BitVec 32) V!52049 V!52049 (_ BitVec 32) Int) ListLongMap!20477)

(assert (=> b!1310517 (= lt!585713 (contains!8416 (getCurrentListMap!5258 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110868 res!869617) b!1310514))

(assert (= (and b!1310514 res!869619) b!1310515))

(assert (= (and b!1310515 res!869618) b!1310513))

(assert (= (and b!1310513 res!869620) b!1310511))

(assert (= (and b!1310511 res!869621) b!1310517))

(assert (= (and b!1310516 condMapEmpty!54442) mapIsEmpty!54442))

(assert (= (and b!1310516 (not condMapEmpty!54442)) mapNonEmpty!54442))

(get-info :version)

(assert (= (and mapNonEmpty!54442 ((_ is ValueCellFull!16706) mapValue!54442)) b!1310510))

(assert (= (and b!1310516 ((_ is ValueCellFull!16706) mapDefault!54442)) b!1310512))

(assert (= start!110868 b!1310516))

(declare-fun m!1200965 () Bool)

(assert (=> b!1310515 m!1200965))

(declare-fun m!1200967 () Bool)

(assert (=> b!1310513 m!1200967))

(declare-fun m!1200969 () Bool)

(assert (=> mapNonEmpty!54442 m!1200969))

(declare-fun m!1200971 () Bool)

(assert (=> b!1310517 m!1200971))

(assert (=> b!1310517 m!1200971))

(declare-fun m!1200973 () Bool)

(assert (=> b!1310517 m!1200973))

(declare-fun m!1200975 () Bool)

(assert (=> start!110868 m!1200975))

(declare-fun m!1200977 () Bool)

(assert (=> start!110868 m!1200977))

(declare-fun m!1200979 () Bool)

(assert (=> start!110868 m!1200979))

(check-sat (not b_next!29479) (not start!110868) b_and!47689 (not b!1310517) (not mapNonEmpty!54442) tp_is_empty!35209 (not b!1310513) (not b!1310515))
(check-sat b_and!47689 (not b_next!29479))
