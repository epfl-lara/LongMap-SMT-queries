; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110656 () Bool)

(assert start!110656)

(declare-fun b_free!29491 () Bool)

(declare-fun b_next!29491 () Bool)

(assert (=> start!110656 (= b_free!29491 (not b_next!29491))))

(declare-fun tp!103795 () Bool)

(declare-fun b_and!47699 () Bool)

(assert (=> start!110656 (= tp!103795 b_and!47699)))

(declare-fun b!1309355 () Bool)

(declare-fun res!869192 () Bool)

(declare-fun e!747045 () Bool)

(assert (=> b!1309355 (=> (not res!869192) (not e!747045))))

(declare-datatypes ((array!87434 0))(
  ( (array!87435 (arr!42197 (Array (_ BitVec 32) (_ BitVec 64))) (size!42747 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87434)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309355 (= res!869192 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42747 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309356 () Bool)

(declare-fun e!747043 () Bool)

(declare-fun tp_is_empty!35221 () Bool)

(assert (=> b!1309356 (= e!747043 tp_is_empty!35221)))

(declare-fun b!1309357 () Bool)

(assert (=> b!1309357 (= e!747045 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585255 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52065 0))(
  ( (V!52066 (val!17685 Int)) )
))
(declare-fun minValue!1296 () V!52065)

(declare-datatypes ((ValueCell!16712 0))(
  ( (ValueCellFull!16712 (v!20312 V!52065)) (EmptyCell!16712) )
))
(declare-datatypes ((array!87436 0))(
  ( (array!87437 (arr!42198 (Array (_ BitVec 32) ValueCell!16712)) (size!42748 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87436)

(declare-fun zeroValue!1296 () V!52065)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22770 0))(
  ( (tuple2!22771 (_1!11396 (_ BitVec 64)) (_2!11396 V!52065)) )
))
(declare-datatypes ((List!29914 0))(
  ( (Nil!29911) (Cons!29910 (h!31119 tuple2!22770) (t!43520 List!29914)) )
))
(declare-datatypes ((ListLongMap!20427 0))(
  ( (ListLongMap!20428 (toList!10229 List!29914)) )
))
(declare-fun contains!8379 (ListLongMap!20427 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5242 (array!87434 array!87436 (_ BitVec 32) (_ BitVec 32) V!52065 V!52065 (_ BitVec 32) Int) ListLongMap!20427)

(assert (=> b!1309357 (= lt!585255 (contains!8379 (getCurrentListMap!5242 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309358 () Bool)

(declare-fun e!747044 () Bool)

(assert (=> b!1309358 (= e!747044 tp_is_empty!35221)))

(declare-fun mapNonEmpty!54460 () Bool)

(declare-fun mapRes!54460 () Bool)

(declare-fun tp!103794 () Bool)

(assert (=> mapNonEmpty!54460 (= mapRes!54460 (and tp!103794 e!747043))))

(declare-fun mapRest!54460 () (Array (_ BitVec 32) ValueCell!16712))

(declare-fun mapValue!54460 () ValueCell!16712)

(declare-fun mapKey!54460 () (_ BitVec 32))

(assert (=> mapNonEmpty!54460 (= (arr!42198 _values!1354) (store mapRest!54460 mapKey!54460 mapValue!54460))))

(declare-fun b!1309359 () Bool)

(declare-fun res!869191 () Bool)

(assert (=> b!1309359 (=> (not res!869191) (not e!747045))))

(declare-datatypes ((List!29915 0))(
  ( (Nil!29912) (Cons!29911 (h!31120 (_ BitVec 64)) (t!43521 List!29915)) )
))
(declare-fun arrayNoDuplicates!0 (array!87434 (_ BitVec 32) List!29915) Bool)

(assert (=> b!1309359 (= res!869191 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29912))))

(declare-fun res!869189 () Bool)

(assert (=> start!110656 (=> (not res!869189) (not e!747045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110656 (= res!869189 (validMask!0 mask!2040))))

(assert (=> start!110656 e!747045))

(assert (=> start!110656 tp!103795))

(declare-fun array_inv!31889 (array!87434) Bool)

(assert (=> start!110656 (array_inv!31889 _keys!1628)))

(assert (=> start!110656 true))

(assert (=> start!110656 tp_is_empty!35221))

(declare-fun e!747046 () Bool)

(declare-fun array_inv!31890 (array!87436) Bool)

(assert (=> start!110656 (and (array_inv!31890 _values!1354) e!747046)))

(declare-fun b!1309360 () Bool)

(declare-fun res!869190 () Bool)

(assert (=> b!1309360 (=> (not res!869190) (not e!747045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87434 (_ BitVec 32)) Bool)

(assert (=> b!1309360 (= res!869190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309361 () Bool)

(assert (=> b!1309361 (= e!747046 (and e!747044 mapRes!54460))))

(declare-fun condMapEmpty!54460 () Bool)

(declare-fun mapDefault!54460 () ValueCell!16712)

