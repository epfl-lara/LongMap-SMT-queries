; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110912 () Bool)

(assert start!110912)

(declare-fun b_free!29747 () Bool)

(declare-fun b_next!29747 () Bool)

(assert (=> start!110912 (= b_free!29747 (not b_next!29747))))

(declare-fun tp!104563 () Bool)

(declare-fun b_and!47955 () Bool)

(assert (=> start!110912 (= tp!104563 b_and!47955)))

(declare-fun b!1313075 () Bool)

(declare-fun res!871760 () Bool)

(declare-fun e!748967 () Bool)

(assert (=> b!1313075 (=> (not res!871760) (not e!748967))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52405 0))(
  ( (V!52406 (val!17813 Int)) )
))
(declare-datatypes ((ValueCell!16840 0))(
  ( (ValueCellFull!16840 (v!20440 V!52405)) (EmptyCell!16840) )
))
(declare-datatypes ((array!87936 0))(
  ( (array!87937 (arr!42448 (Array (_ BitVec 32) ValueCell!16840)) (size!42998 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87936)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((array!87938 0))(
  ( (array!87939 (arr!42449 (Array (_ BitVec 32) (_ BitVec 64))) (size!42999 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87938)

(assert (=> b!1313075 (= res!871760 (and (= (size!42998 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42999 _keys!1628) (size!42998 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313076 () Bool)

(declare-fun res!871759 () Bool)

(assert (=> b!1313076 (=> (not res!871759) (not e!748967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87938 (_ BitVec 32)) Bool)

(assert (=> b!1313076 (= res!871759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313077 () Bool)

(declare-fun res!871757 () Bool)

(assert (=> b!1313077 (=> (not res!871757) (not e!748967))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313077 (= res!871757 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42999 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313078 () Bool)

(declare-fun e!748965 () Bool)

(declare-fun tp_is_empty!35477 () Bool)

(assert (=> b!1313078 (= e!748965 tp_is_empty!35477)))

(declare-fun b!1313079 () Bool)

(assert (=> b!1313079 (= e!748967 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52405)

(declare-fun zeroValue!1296 () V!52405)

(declare-fun lt!585639 () Bool)

(declare-datatypes ((tuple2!22966 0))(
  ( (tuple2!22967 (_1!11494 (_ BitVec 64)) (_2!11494 V!52405)) )
))
(declare-datatypes ((List!30102 0))(
  ( (Nil!30099) (Cons!30098 (h!31307 tuple2!22966) (t!43708 List!30102)) )
))
(declare-datatypes ((ListLongMap!20623 0))(
  ( (ListLongMap!20624 (toList!10327 List!30102)) )
))
(declare-fun contains!8477 (ListLongMap!20623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5340 (array!87938 array!87936 (_ BitVec 32) (_ BitVec 32) V!52405 V!52405 (_ BitVec 32) Int) ListLongMap!20623)

(assert (=> b!1313079 (= lt!585639 (contains!8477 (getCurrentListMap!5340 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!871758 () Bool)

(assert (=> start!110912 (=> (not res!871758) (not e!748967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110912 (= res!871758 (validMask!0 mask!2040))))

(assert (=> start!110912 e!748967))

(assert (=> start!110912 tp!104563))

(declare-fun array_inv!32067 (array!87938) Bool)

(assert (=> start!110912 (array_inv!32067 _keys!1628)))

(assert (=> start!110912 true))

(assert (=> start!110912 tp_is_empty!35477))

(declare-fun e!748966 () Bool)

(declare-fun array_inv!32068 (array!87936) Bool)

(assert (=> start!110912 (and (array_inv!32068 _values!1354) e!748966)))

(declare-fun b!1313080 () Bool)

(declare-fun e!748964 () Bool)

(assert (=> b!1313080 (= e!748964 tp_is_empty!35477)))

(declare-fun b!1313081 () Bool)

(declare-fun mapRes!54844 () Bool)

(assert (=> b!1313081 (= e!748966 (and e!748965 mapRes!54844))))

(declare-fun condMapEmpty!54844 () Bool)

(declare-fun mapDefault!54844 () ValueCell!16840)

