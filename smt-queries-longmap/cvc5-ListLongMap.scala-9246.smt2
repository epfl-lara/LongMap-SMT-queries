; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110824 () Bool)

(assert start!110824)

(declare-fun b_free!29659 () Bool)

(declare-fun b_next!29659 () Bool)

(assert (=> start!110824 (= b_free!29659 (not b_next!29659))))

(declare-fun tp!104298 () Bool)

(declare-fun b_and!47867 () Bool)

(assert (=> start!110824 (= tp!104298 b_and!47867)))

(declare-fun b!1311775 () Bool)

(declare-fun res!870860 () Bool)

(declare-fun e!748305 () Bool)

(assert (=> b!1311775 (=> (not res!870860) (not e!748305))))

(declare-datatypes ((array!87766 0))(
  ( (array!87767 (arr!42363 (Array (_ BitVec 32) (_ BitVec 64))) (size!42913 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87766)

(declare-datatypes ((V!52289 0))(
  ( (V!52290 (val!17769 Int)) )
))
(declare-datatypes ((ValueCell!16796 0))(
  ( (ValueCellFull!16796 (v!20396 V!52289)) (EmptyCell!16796) )
))
(declare-datatypes ((array!87768 0))(
  ( (array!87769 (arr!42364 (Array (_ BitVec 32) ValueCell!16796)) (size!42914 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87768)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1311775 (= res!870860 (and (= (size!42914 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42913 _keys!1628) (size!42914 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311776 () Bool)

(declare-fun res!870855 () Bool)

(assert (=> b!1311776 (=> (not res!870855) (not e!748305))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52289)

(declare-fun zeroValue!1296 () V!52289)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22902 0))(
  ( (tuple2!22903 (_1!11462 (_ BitVec 64)) (_2!11462 V!52289)) )
))
(declare-datatypes ((List!30041 0))(
  ( (Nil!30038) (Cons!30037 (h!31246 tuple2!22902) (t!43647 List!30041)) )
))
(declare-datatypes ((ListLongMap!20559 0))(
  ( (ListLongMap!20560 (toList!10295 List!30041)) )
))
(declare-fun contains!8445 (ListLongMap!20559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5308 (array!87766 array!87768 (_ BitVec 32) (_ BitVec 32) V!52289 V!52289 (_ BitVec 32) Int) ListLongMap!20559)

(assert (=> b!1311776 (= res!870855 (contains!8445 (getCurrentListMap!5308 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311777 () Bool)

(declare-fun res!870861 () Bool)

(assert (=> b!1311777 (=> (not res!870861) (not e!748305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87766 (_ BitVec 32)) Bool)

(assert (=> b!1311777 (= res!870861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311778 () Bool)

(assert (=> b!1311778 (= e!748305 (not true))))

(assert (=> b!1311778 (contains!8445 (getCurrentListMap!5308 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43356 0))(
  ( (Unit!43357) )
))
(declare-fun lt!585507 () Unit!43356)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!5 (array!87766 array!87768 (_ BitVec 32) (_ BitVec 32) V!52289 V!52289 (_ BitVec 64) (_ BitVec 32) Int) Unit!43356)

(assert (=> b!1311778 (= lt!585507 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!5 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun res!870854 () Bool)

(assert (=> start!110824 (=> (not res!870854) (not e!748305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110824 (= res!870854 (validMask!0 mask!2040))))

(assert (=> start!110824 e!748305))

(assert (=> start!110824 tp!104298))

(declare-fun array_inv!32015 (array!87766) Bool)

(assert (=> start!110824 (array_inv!32015 _keys!1628)))

(assert (=> start!110824 true))

(declare-fun tp_is_empty!35389 () Bool)

(assert (=> start!110824 tp_is_empty!35389))

(declare-fun e!748304 () Bool)

(declare-fun array_inv!32016 (array!87768) Bool)

(assert (=> start!110824 (and (array_inv!32016 _values!1354) e!748304)))

(declare-fun b!1311779 () Bool)

(declare-fun res!870859 () Bool)

(assert (=> b!1311779 (=> (not res!870859) (not e!748305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311779 (= res!870859 (validKeyInArray!0 (select (arr!42363 _keys!1628) from!2020)))))

(declare-fun b!1311780 () Bool)

(declare-fun res!870857 () Bool)

(assert (=> b!1311780 (=> (not res!870857) (not e!748305))))

(assert (=> b!1311780 (= res!870857 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42913 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54712 () Bool)

(declare-fun mapRes!54712 () Bool)

(declare-fun tp!104299 () Bool)

(declare-fun e!748303 () Bool)

(assert (=> mapNonEmpty!54712 (= mapRes!54712 (and tp!104299 e!748303))))

(declare-fun mapKey!54712 () (_ BitVec 32))

(declare-fun mapValue!54712 () ValueCell!16796)

(declare-fun mapRest!54712 () (Array (_ BitVec 32) ValueCell!16796))

(assert (=> mapNonEmpty!54712 (= (arr!42364 _values!1354) (store mapRest!54712 mapKey!54712 mapValue!54712))))

(declare-fun b!1311781 () Bool)

(declare-fun e!748306 () Bool)

(assert (=> b!1311781 (= e!748304 (and e!748306 mapRes!54712))))

(declare-fun condMapEmpty!54712 () Bool)

(declare-fun mapDefault!54712 () ValueCell!16796)

