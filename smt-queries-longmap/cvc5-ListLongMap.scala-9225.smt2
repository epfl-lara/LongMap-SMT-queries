; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110698 () Bool)

(assert start!110698)

(declare-fun b_free!29533 () Bool)

(declare-fun b_next!29533 () Bool)

(assert (=> start!110698 (= b_free!29533 (not b_next!29533))))

(declare-fun tp!103920 () Bool)

(declare-fun b_and!47741 () Bool)

(assert (=> start!110698 (= tp!103920 b_and!47741)))

(declare-fun b!1309939 () Bool)

(declare-fun res!869590 () Bool)

(declare-fun e!747360 () Bool)

(assert (=> b!1309939 (=> (not res!869590) (not e!747360))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87516 0))(
  ( (array!87517 (arr!42238 (Array (_ BitVec 32) (_ BitVec 64))) (size!42788 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87516)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52121 0))(
  ( (V!52122 (val!17706 Int)) )
))
(declare-fun minValue!1296 () V!52121)

(declare-datatypes ((ValueCell!16733 0))(
  ( (ValueCellFull!16733 (v!20333 V!52121)) (EmptyCell!16733) )
))
(declare-datatypes ((array!87518 0))(
  ( (array!87519 (arr!42239 (Array (_ BitVec 32) ValueCell!16733)) (size!42789 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87518)

(declare-fun zeroValue!1296 () V!52121)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22806 0))(
  ( (tuple2!22807 (_1!11414 (_ BitVec 64)) (_2!11414 V!52121)) )
))
(declare-datatypes ((List!29945 0))(
  ( (Nil!29942) (Cons!29941 (h!31150 tuple2!22806) (t!43551 List!29945)) )
))
(declare-datatypes ((ListLongMap!20463 0))(
  ( (ListLongMap!20464 (toList!10247 List!29945)) )
))
(declare-fun contains!8397 (ListLongMap!20463 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5260 (array!87516 array!87518 (_ BitVec 32) (_ BitVec 32) V!52121 V!52121 (_ BitVec 32) Int) ListLongMap!20463)

(assert (=> b!1309939 (= res!869590 (contains!8397 (getCurrentListMap!5260 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309940 () Bool)

(declare-fun res!869587 () Bool)

(assert (=> b!1309940 (=> (not res!869587) (not e!747360))))

(assert (=> b!1309940 (= res!869587 (not (= (select (arr!42238 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1309941 () Bool)

(declare-fun e!747362 () Bool)

(declare-fun tp_is_empty!35263 () Bool)

(assert (=> b!1309941 (= e!747362 tp_is_empty!35263)))

(declare-fun b!1309942 () Bool)

(declare-fun res!869589 () Bool)

(assert (=> b!1309942 (=> (not res!869589) (not e!747360))))

(assert (=> b!1309942 (= res!869589 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!54523 () Bool)

(declare-fun mapRes!54523 () Bool)

(declare-fun tp!103921 () Bool)

(declare-fun e!747359 () Bool)

(assert (=> mapNonEmpty!54523 (= mapRes!54523 (and tp!103921 e!747359))))

(declare-fun mapKey!54523 () (_ BitVec 32))

(declare-fun mapValue!54523 () ValueCell!16733)

(declare-fun mapRest!54523 () (Array (_ BitVec 32) ValueCell!16733))

(assert (=> mapNonEmpty!54523 (= (arr!42239 _values!1354) (store mapRest!54523 mapKey!54523 mapValue!54523))))

(declare-fun res!869584 () Bool)

(assert (=> start!110698 (=> (not res!869584) (not e!747360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110698 (= res!869584 (validMask!0 mask!2040))))

(assert (=> start!110698 e!747360))

(assert (=> start!110698 tp!103920))

(declare-fun array_inv!31917 (array!87516) Bool)

(assert (=> start!110698 (array_inv!31917 _keys!1628)))

(assert (=> start!110698 true))

(assert (=> start!110698 tp_is_empty!35263))

(declare-fun e!747358 () Bool)

(declare-fun array_inv!31918 (array!87518) Bool)

(assert (=> start!110698 (and (array_inv!31918 _values!1354) e!747358)))

(declare-fun b!1309943 () Bool)

(declare-fun res!869585 () Bool)

(assert (=> b!1309943 (=> (not res!869585) (not e!747360))))

(declare-datatypes ((List!29946 0))(
  ( (Nil!29943) (Cons!29942 (h!31151 (_ BitVec 64)) (t!43552 List!29946)) )
))
(declare-fun arrayNoDuplicates!0 (array!87516 (_ BitVec 32) List!29946) Bool)

(assert (=> b!1309943 (= res!869585 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29943))))

(declare-fun b!1309944 () Bool)

(declare-fun res!869588 () Bool)

(assert (=> b!1309944 (=> (not res!869588) (not e!747360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309944 (= res!869588 (validKeyInArray!0 (select (arr!42238 _keys!1628) from!2020)))))

(declare-fun b!1309945 () Bool)

(declare-fun res!869592 () Bool)

(assert (=> b!1309945 (=> (not res!869592) (not e!747360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87516 (_ BitVec 32)) Bool)

(assert (=> b!1309945 (= res!869592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309946 () Bool)

(assert (=> b!1309946 (= e!747358 (and e!747362 mapRes!54523))))

(declare-fun condMapEmpty!54523 () Bool)

(declare-fun mapDefault!54523 () ValueCell!16733)

