; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111154 () Bool)

(assert start!111154)

(declare-fun b_free!29989 () Bool)

(declare-fun b_next!29989 () Bool)

(assert (=> start!111154 (= b_free!29989 (not b_next!29989))))

(declare-fun tp!105289 () Bool)

(declare-fun b_and!48197 () Bool)

(assert (=> start!111154 (= tp!105289 b_and!48197)))

(declare-fun mapIsEmpty!55207 () Bool)

(declare-fun mapRes!55207 () Bool)

(assert (=> mapIsEmpty!55207 mapRes!55207))

(declare-fun b!1316079 () Bool)

(declare-fun e!750778 () Bool)

(assert (=> b!1316079 (= e!750778 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88396 0))(
  ( (array!88397 (arr!42678 (Array (_ BitVec 32) (_ BitVec 64))) (size!43228 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88396)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52729 0))(
  ( (V!52730 (val!17934 Int)) )
))
(declare-fun minValue!1296 () V!52729)

(declare-datatypes ((ValueCell!16961 0))(
  ( (ValueCellFull!16961 (v!20561 V!52729)) (EmptyCell!16961) )
))
(declare-datatypes ((array!88398 0))(
  ( (array!88399 (arr!42679 (Array (_ BitVec 32) ValueCell!16961)) (size!43229 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88398)

(declare-fun zeroValue!1296 () V!52729)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585993 () Bool)

(declare-datatypes ((tuple2!23138 0))(
  ( (tuple2!23139 (_1!11580 (_ BitVec 64)) (_2!11580 V!52729)) )
))
(declare-datatypes ((List!30276 0))(
  ( (Nil!30273) (Cons!30272 (h!31481 tuple2!23138) (t!43882 List!30276)) )
))
(declare-datatypes ((ListLongMap!20795 0))(
  ( (ListLongMap!20796 (toList!10413 List!30276)) )
))
(declare-fun contains!8563 (ListLongMap!20795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5426 (array!88396 array!88398 (_ BitVec 32) (_ BitVec 32) V!52729 V!52729 (_ BitVec 32) Int) ListLongMap!20795)

(assert (=> b!1316079 (= lt!585993 (contains!8563 (getCurrentListMap!5426 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1316080 () Bool)

(declare-fun res!873674 () Bool)

(assert (=> b!1316080 (=> (not res!873674) (not e!750778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88396 (_ BitVec 32)) Bool)

(assert (=> b!1316080 (= res!873674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!873673 () Bool)

(assert (=> start!111154 (=> (not res!873673) (not e!750778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111154 (= res!873673 (validMask!0 mask!2040))))

(assert (=> start!111154 e!750778))

(assert (=> start!111154 tp!105289))

(declare-fun array_inv!32231 (array!88396) Bool)

(assert (=> start!111154 (array_inv!32231 _keys!1628)))

(assert (=> start!111154 true))

(declare-fun tp_is_empty!35719 () Bool)

(assert (=> start!111154 tp_is_empty!35719))

(declare-fun e!750779 () Bool)

(declare-fun array_inv!32232 (array!88398) Bool)

(assert (=> start!111154 (and (array_inv!32232 _values!1354) e!750779)))

(declare-fun b!1316078 () Bool)

(declare-fun e!750782 () Bool)

(assert (=> b!1316078 (= e!750782 tp_is_empty!35719)))

(declare-fun b!1316081 () Bool)

(declare-fun e!750781 () Bool)

(assert (=> b!1316081 (= e!750781 tp_is_empty!35719)))

(declare-fun b!1316082 () Bool)

(declare-fun res!873672 () Bool)

(assert (=> b!1316082 (=> (not res!873672) (not e!750778))))

(assert (=> b!1316082 (= res!873672 (and (= (size!43229 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43228 _keys!1628) (size!43229 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316083 () Bool)

(declare-fun res!873671 () Bool)

(assert (=> b!1316083 (=> (not res!873671) (not e!750778))))

(declare-datatypes ((List!30277 0))(
  ( (Nil!30274) (Cons!30273 (h!31482 (_ BitVec 64)) (t!43883 List!30277)) )
))
(declare-fun arrayNoDuplicates!0 (array!88396 (_ BitVec 32) List!30277) Bool)

(assert (=> b!1316083 (= res!873671 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30274))))

(declare-fun b!1316084 () Bool)

(assert (=> b!1316084 (= e!750779 (and e!750782 mapRes!55207))))

(declare-fun condMapEmpty!55207 () Bool)

(declare-fun mapDefault!55207 () ValueCell!16961)

