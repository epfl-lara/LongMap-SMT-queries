; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111170 () Bool)

(assert start!111170)

(declare-fun b_free!30005 () Bool)

(declare-fun b_next!30005 () Bool)

(assert (=> start!111170 (= b_free!30005 (not b_next!30005))))

(declare-fun tp!105336 () Bool)

(declare-fun b_and!48213 () Bool)

(assert (=> start!111170 (= tp!105336 b_and!48213)))

(declare-fun b!1316330 () Bool)

(declare-fun res!873851 () Bool)

(declare-fun e!750902 () Bool)

(assert (=> b!1316330 (=> (not res!873851) (not e!750902))))

(declare-datatypes ((array!88428 0))(
  ( (array!88429 (arr!42694 (Array (_ BitVec 32) (_ BitVec 64))) (size!43244 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88428)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316330 (= res!873851 (not (validKeyInArray!0 (select (arr!42694 _keys!1628) from!2020))))))

(declare-fun mapIsEmpty!55231 () Bool)

(declare-fun mapRes!55231 () Bool)

(assert (=> mapIsEmpty!55231 mapRes!55231))

(declare-fun b!1316331 () Bool)

(declare-fun res!873858 () Bool)

(assert (=> b!1316331 (=> (not res!873858) (not e!750902))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52749 0))(
  ( (V!52750 (val!17942 Int)) )
))
(declare-fun minValue!1296 () V!52749)

(declare-datatypes ((ValueCell!16969 0))(
  ( (ValueCellFull!16969 (v!20569 V!52749)) (EmptyCell!16969) )
))
(declare-datatypes ((array!88430 0))(
  ( (array!88431 (arr!42695 (Array (_ BitVec 32) ValueCell!16969)) (size!43245 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88430)

(declare-fun zeroValue!1296 () V!52749)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23150 0))(
  ( (tuple2!23151 (_1!11586 (_ BitVec 64)) (_2!11586 V!52749)) )
))
(declare-datatypes ((List!30288 0))(
  ( (Nil!30285) (Cons!30284 (h!31493 tuple2!23150) (t!43894 List!30288)) )
))
(declare-datatypes ((ListLongMap!20807 0))(
  ( (ListLongMap!20808 (toList!10419 List!30288)) )
))
(declare-fun contains!8569 (ListLongMap!20807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5432 (array!88428 array!88430 (_ BitVec 32) (_ BitVec 32) V!52749 V!52749 (_ BitVec 32) Int) ListLongMap!20807)

(assert (=> b!1316331 (= res!873858 (contains!8569 (getCurrentListMap!5432 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1316332 () Bool)

(declare-fun res!873853 () Bool)

(assert (=> b!1316332 (=> (not res!873853) (not e!750902))))

(declare-datatypes ((List!30289 0))(
  ( (Nil!30286) (Cons!30285 (h!31494 (_ BitVec 64)) (t!43895 List!30289)) )
))
(declare-fun arrayNoDuplicates!0 (array!88428 (_ BitVec 32) List!30289) Bool)

(assert (=> b!1316332 (= res!873853 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30286))))

(declare-fun b!1316333 () Bool)

(declare-fun res!873857 () Bool)

(assert (=> b!1316333 (=> (not res!873857) (not e!750902))))

(assert (=> b!1316333 (= res!873857 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43244 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316334 () Bool)

(declare-fun res!873854 () Bool)

(assert (=> b!1316334 (=> (not res!873854) (not e!750902))))

(assert (=> b!1316334 (= res!873854 (and (= (size!43245 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43244 _keys!1628) (size!43245 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55231 () Bool)

(declare-fun tp!105337 () Bool)

(declare-fun e!750901 () Bool)

(assert (=> mapNonEmpty!55231 (= mapRes!55231 (and tp!105337 e!750901))))

(declare-fun mapValue!55231 () ValueCell!16969)

(declare-fun mapKey!55231 () (_ BitVec 32))

(declare-fun mapRest!55231 () (Array (_ BitVec 32) ValueCell!16969))

(assert (=> mapNonEmpty!55231 (= (arr!42695 _values!1354) (store mapRest!55231 mapKey!55231 mapValue!55231))))

(declare-fun b!1316335 () Bool)

(declare-fun tp_is_empty!35735 () Bool)

(assert (=> b!1316335 (= e!750901 tp_is_empty!35735)))

(declare-fun res!873852 () Bool)

(assert (=> start!111170 (=> (not res!873852) (not e!750902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111170 (= res!873852 (validMask!0 mask!2040))))

(assert (=> start!111170 e!750902))

(assert (=> start!111170 tp!105336))

(declare-fun array_inv!32245 (array!88428) Bool)

(assert (=> start!111170 (array_inv!32245 _keys!1628)))

(assert (=> start!111170 true))

(assert (=> start!111170 tp_is_empty!35735))

(declare-fun e!750899 () Bool)

(declare-fun array_inv!32246 (array!88430) Bool)

(assert (=> start!111170 (and (array_inv!32246 _values!1354) e!750899)))

(declare-fun b!1316336 () Bool)

(declare-fun res!873855 () Bool)

(assert (=> b!1316336 (=> (not res!873855) (not e!750902))))

(assert (=> b!1316336 (= res!873855 (not (= (select (arr!42694 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1316337 () Bool)

(assert (=> b!1316337 (= e!750902 (not (contains!8569 (getCurrentListMap!5432 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))))

(declare-fun b!1316338 () Bool)

(declare-fun res!873856 () Bool)

(assert (=> b!1316338 (=> (not res!873856) (not e!750902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88428 (_ BitVec 32)) Bool)

(assert (=> b!1316338 (= res!873856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316339 () Bool)

(declare-fun e!750898 () Bool)

(assert (=> b!1316339 (= e!750899 (and e!750898 mapRes!55231))))

(declare-fun condMapEmpty!55231 () Bool)

(declare-fun mapDefault!55231 () ValueCell!16969)

