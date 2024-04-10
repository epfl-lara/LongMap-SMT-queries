; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110674 () Bool)

(assert start!110674)

(declare-fun b_free!29509 () Bool)

(declare-fun b_next!29509 () Bool)

(assert (=> start!110674 (= b_free!29509 (not b_next!29509))))

(declare-fun tp!103848 () Bool)

(declare-fun b_and!47717 () Bool)

(assert (=> start!110674 (= tp!103848 b_and!47717)))

(declare-fun b!1309571 () Bool)

(declare-fun e!747179 () Bool)

(declare-fun tp_is_empty!35239 () Bool)

(assert (=> b!1309571 (= e!747179 tp_is_empty!35239)))

(declare-fun res!869326 () Bool)

(declare-fun e!747180 () Bool)

(assert (=> start!110674 (=> (not res!869326) (not e!747180))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110674 (= res!869326 (validMask!0 mask!2040))))

(assert (=> start!110674 e!747180))

(assert (=> start!110674 tp!103848))

(declare-datatypes ((array!87468 0))(
  ( (array!87469 (arr!42214 (Array (_ BitVec 32) (_ BitVec 64))) (size!42764 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87468)

(declare-fun array_inv!31901 (array!87468) Bool)

(assert (=> start!110674 (array_inv!31901 _keys!1628)))

(assert (=> start!110674 true))

(assert (=> start!110674 tp_is_empty!35239))

(declare-datatypes ((V!52089 0))(
  ( (V!52090 (val!17694 Int)) )
))
(declare-datatypes ((ValueCell!16721 0))(
  ( (ValueCellFull!16721 (v!20321 V!52089)) (EmptyCell!16721) )
))
(declare-datatypes ((array!87470 0))(
  ( (array!87471 (arr!42215 (Array (_ BitVec 32) ValueCell!16721)) (size!42765 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87470)

(declare-fun e!747181 () Bool)

(declare-fun array_inv!31902 (array!87470) Bool)

(assert (=> start!110674 (and (array_inv!31902 _values!1354) e!747181)))

(declare-fun b!1309572 () Bool)

(assert (=> b!1309572 (= e!747180 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585282 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52089)

(declare-fun zeroValue!1296 () V!52089)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22786 0))(
  ( (tuple2!22787 (_1!11404 (_ BitVec 64)) (_2!11404 V!52089)) )
))
(declare-datatypes ((List!29929 0))(
  ( (Nil!29926) (Cons!29925 (h!31134 tuple2!22786) (t!43535 List!29929)) )
))
(declare-datatypes ((ListLongMap!20443 0))(
  ( (ListLongMap!20444 (toList!10237 List!29929)) )
))
(declare-fun contains!8387 (ListLongMap!20443 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5250 (array!87468 array!87470 (_ BitVec 32) (_ BitVec 32) V!52089 V!52089 (_ BitVec 32) Int) ListLongMap!20443)

(assert (=> b!1309572 (= lt!585282 (contains!8387 (getCurrentListMap!5250 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309573 () Bool)

(declare-fun res!869327 () Bool)

(assert (=> b!1309573 (=> (not res!869327) (not e!747180))))

(assert (=> b!1309573 (= res!869327 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42764 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54487 () Bool)

(declare-fun mapRes!54487 () Bool)

(assert (=> mapIsEmpty!54487 mapRes!54487))

(declare-fun b!1309574 () Bool)

(declare-fun e!747178 () Bool)

(assert (=> b!1309574 (= e!747178 tp_is_empty!35239)))

(declare-fun b!1309575 () Bool)

(declare-fun res!869325 () Bool)

(assert (=> b!1309575 (=> (not res!869325) (not e!747180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87468 (_ BitVec 32)) Bool)

(assert (=> b!1309575 (= res!869325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54487 () Bool)

(declare-fun tp!103849 () Bool)

(assert (=> mapNonEmpty!54487 (= mapRes!54487 (and tp!103849 e!747178))))

(declare-fun mapValue!54487 () ValueCell!16721)

(declare-fun mapKey!54487 () (_ BitVec 32))

(declare-fun mapRest!54487 () (Array (_ BitVec 32) ValueCell!16721))

(assert (=> mapNonEmpty!54487 (= (arr!42215 _values!1354) (store mapRest!54487 mapKey!54487 mapValue!54487))))

(declare-fun b!1309576 () Bool)

(declare-fun res!869324 () Bool)

(assert (=> b!1309576 (=> (not res!869324) (not e!747180))))

(assert (=> b!1309576 (= res!869324 (and (= (size!42765 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42764 _keys!1628) (size!42765 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309577 () Bool)

(assert (=> b!1309577 (= e!747181 (and e!747179 mapRes!54487))))

(declare-fun condMapEmpty!54487 () Bool)

(declare-fun mapDefault!54487 () ValueCell!16721)

