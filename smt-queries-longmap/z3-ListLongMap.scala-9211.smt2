; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110616 () Bool)

(assert start!110616)

(declare-fun b_free!29451 () Bool)

(declare-fun b_next!29451 () Bool)

(assert (=> start!110616 (= b_free!29451 (not b_next!29451))))

(declare-fun tp!103674 () Bool)

(declare-fun b_and!47659 () Bool)

(assert (=> start!110616 (= tp!103674 b_and!47659)))

(declare-fun b!1308875 () Bool)

(declare-fun res!868890 () Bool)

(declare-fun e!746744 () Bool)

(assert (=> b!1308875 (=> (not res!868890) (not e!746744))))

(declare-datatypes ((array!87356 0))(
  ( (array!87357 (arr!42158 (Array (_ BitVec 32) (_ BitVec 64))) (size!42708 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87356)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52011 0))(
  ( (V!52012 (val!17665 Int)) )
))
(declare-datatypes ((ValueCell!16692 0))(
  ( (ValueCellFull!16692 (v!20292 V!52011)) (EmptyCell!16692) )
))
(declare-datatypes ((array!87358 0))(
  ( (array!87359 (arr!42159 (Array (_ BitVec 32) ValueCell!16692)) (size!42709 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87358)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308875 (= res!868890 (and (= (size!42709 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42708 _keys!1628) (size!42709 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308876 () Bool)

(declare-fun e!746743 () Bool)

(declare-fun tp_is_empty!35181 () Bool)

(assert (=> b!1308876 (= e!746743 tp_is_empty!35181)))

(declare-fun b!1308877 () Bool)

(declare-fun res!868892 () Bool)

(assert (=> b!1308877 (=> (not res!868892) (not e!746744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87356 (_ BitVec 32)) Bool)

(assert (=> b!1308877 (= res!868892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54400 () Bool)

(declare-fun mapRes!54400 () Bool)

(declare-fun tp!103675 () Bool)

(declare-fun e!746745 () Bool)

(assert (=> mapNonEmpty!54400 (= mapRes!54400 (and tp!103675 e!746745))))

(declare-fun mapKey!54400 () (_ BitVec 32))

(declare-fun mapRest!54400 () (Array (_ BitVec 32) ValueCell!16692))

(declare-fun mapValue!54400 () ValueCell!16692)

(assert (=> mapNonEmpty!54400 (= (arr!42159 _values!1354) (store mapRest!54400 mapKey!54400 mapValue!54400))))

(declare-fun res!868893 () Bool)

(assert (=> start!110616 (=> (not res!868893) (not e!746744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110616 (= res!868893 (validMask!0 mask!2040))))

(assert (=> start!110616 e!746744))

(assert (=> start!110616 tp!103674))

(declare-fun array_inv!31865 (array!87356) Bool)

(assert (=> start!110616 (array_inv!31865 _keys!1628)))

(assert (=> start!110616 true))

(assert (=> start!110616 tp_is_empty!35181))

(declare-fun e!746747 () Bool)

(declare-fun array_inv!31866 (array!87358) Bool)

(assert (=> start!110616 (and (array_inv!31866 _values!1354) e!746747)))

(declare-fun b!1308878 () Bool)

(declare-fun res!868889 () Bool)

(assert (=> b!1308878 (=> (not res!868889) (not e!746744))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1308878 (= res!868889 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42708 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308879 () Bool)

(assert (=> b!1308879 (= e!746747 (and e!746743 mapRes!54400))))

(declare-fun condMapEmpty!54400 () Bool)

(declare-fun mapDefault!54400 () ValueCell!16692)

(assert (=> b!1308879 (= condMapEmpty!54400 (= (arr!42159 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16692)) mapDefault!54400)))))

(declare-fun b!1308880 () Bool)

(assert (=> b!1308880 (= e!746744 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585195 () Bool)

(declare-fun minValue!1296 () V!52011)

(declare-fun zeroValue!1296 () V!52011)

(declare-datatypes ((tuple2!22746 0))(
  ( (tuple2!22747 (_1!11384 (_ BitVec 64)) (_2!11384 V!52011)) )
))
(declare-datatypes ((List!29887 0))(
  ( (Nil!29884) (Cons!29883 (h!31092 tuple2!22746) (t!43493 List!29887)) )
))
(declare-datatypes ((ListLongMap!20403 0))(
  ( (ListLongMap!20404 (toList!10217 List!29887)) )
))
(declare-fun contains!8367 (ListLongMap!20403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5230 (array!87356 array!87358 (_ BitVec 32) (_ BitVec 32) V!52011 V!52011 (_ BitVec 32) Int) ListLongMap!20403)

(assert (=> b!1308880 (= lt!585195 (contains!8367 (getCurrentListMap!5230 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308881 () Bool)

(declare-fun res!868891 () Bool)

(assert (=> b!1308881 (=> (not res!868891) (not e!746744))))

(declare-datatypes ((List!29888 0))(
  ( (Nil!29885) (Cons!29884 (h!31093 (_ BitVec 64)) (t!43494 List!29888)) )
))
(declare-fun arrayNoDuplicates!0 (array!87356 (_ BitVec 32) List!29888) Bool)

(assert (=> b!1308881 (= res!868891 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29885))))

(declare-fun b!1308882 () Bool)

(assert (=> b!1308882 (= e!746745 tp_is_empty!35181)))

(declare-fun mapIsEmpty!54400 () Bool)

(assert (=> mapIsEmpty!54400 mapRes!54400))

(assert (= (and start!110616 res!868893) b!1308875))

(assert (= (and b!1308875 res!868890) b!1308877))

(assert (= (and b!1308877 res!868892) b!1308881))

(assert (= (and b!1308881 res!868891) b!1308878))

(assert (= (and b!1308878 res!868889) b!1308880))

(assert (= (and b!1308879 condMapEmpty!54400) mapIsEmpty!54400))

(assert (= (and b!1308879 (not condMapEmpty!54400)) mapNonEmpty!54400))

(get-info :version)

(assert (= (and mapNonEmpty!54400 ((_ is ValueCellFull!16692) mapValue!54400)) b!1308882))

(assert (= (and b!1308879 ((_ is ValueCellFull!16692) mapDefault!54400)) b!1308876))

(assert (= start!110616 b!1308879))

(declare-fun m!1199143 () Bool)

(assert (=> b!1308877 m!1199143))

(declare-fun m!1199145 () Bool)

(assert (=> start!110616 m!1199145))

(declare-fun m!1199147 () Bool)

(assert (=> start!110616 m!1199147))

(declare-fun m!1199149 () Bool)

(assert (=> start!110616 m!1199149))

(declare-fun m!1199151 () Bool)

(assert (=> mapNonEmpty!54400 m!1199151))

(declare-fun m!1199153 () Bool)

(assert (=> b!1308881 m!1199153))

(declare-fun m!1199155 () Bool)

(assert (=> b!1308880 m!1199155))

(assert (=> b!1308880 m!1199155))

(declare-fun m!1199157 () Bool)

(assert (=> b!1308880 m!1199157))

(check-sat tp_is_empty!35181 (not start!110616) b_and!47659 (not b!1308880) (not b!1308881) (not b!1308877) (not mapNonEmpty!54400) (not b_next!29451))
(check-sat b_and!47659 (not b_next!29451))
