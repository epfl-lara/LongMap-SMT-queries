; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111068 () Bool)

(assert start!111068)

(declare-fun b_free!29903 () Bool)

(declare-fun b_next!29903 () Bool)

(assert (=> start!111068 (= b_free!29903 (not b_next!29903))))

(declare-fun tp!105031 () Bool)

(declare-fun b_and!48111 () Bool)

(assert (=> start!111068 (= tp!105031 b_and!48111)))

(declare-fun b!1315010 () Bool)

(declare-fun e!750133 () Bool)

(declare-fun tp_is_empty!35633 () Bool)

(assert (=> b!1315010 (= e!750133 tp_is_empty!35633)))

(declare-fun b!1315011 () Bool)

(declare-fun e!750135 () Bool)

(assert (=> b!1315011 (= e!750135 tp_is_empty!35633)))

(declare-fun b!1315012 () Bool)

(declare-fun e!750137 () Bool)

(assert (=> b!1315012 (= e!750137 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88230 0))(
  ( (array!88231 (arr!42595 (Array (_ BitVec 32) (_ BitVec 64))) (size!43145 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88230)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52613 0))(
  ( (V!52614 (val!17891 Int)) )
))
(declare-fun minValue!1296 () V!52613)

(declare-datatypes ((ValueCell!16918 0))(
  ( (ValueCellFull!16918 (v!20518 V!52613)) (EmptyCell!16918) )
))
(declare-datatypes ((array!88232 0))(
  ( (array!88233 (arr!42596 (Array (_ BitVec 32) ValueCell!16918)) (size!43146 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88232)

(declare-fun zeroValue!1296 () V!52613)

(declare-fun lt!585864 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23074 0))(
  ( (tuple2!23075 (_1!11548 (_ BitVec 64)) (_2!11548 V!52613)) )
))
(declare-datatypes ((List!30211 0))(
  ( (Nil!30208) (Cons!30207 (h!31416 tuple2!23074) (t!43817 List!30211)) )
))
(declare-datatypes ((ListLongMap!20731 0))(
  ( (ListLongMap!20732 (toList!10381 List!30211)) )
))
(declare-fun contains!8531 (ListLongMap!20731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5394 (array!88230 array!88232 (_ BitVec 32) (_ BitVec 32) V!52613 V!52613 (_ BitVec 32) Int) ListLongMap!20731)

(assert (=> b!1315012 (= lt!585864 (contains!8531 (getCurrentListMap!5394 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315013 () Bool)

(declare-fun res!872993 () Bool)

(assert (=> b!1315013 (=> (not res!872993) (not e!750137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88230 (_ BitVec 32)) Bool)

(assert (=> b!1315013 (= res!872993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!872994 () Bool)

(assert (=> start!111068 (=> (not res!872994) (not e!750137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111068 (= res!872994 (validMask!0 mask!2040))))

(assert (=> start!111068 e!750137))

(assert (=> start!111068 tp!105031))

(declare-fun array_inv!32169 (array!88230) Bool)

(assert (=> start!111068 (array_inv!32169 _keys!1628)))

(assert (=> start!111068 true))

(assert (=> start!111068 tp_is_empty!35633))

(declare-fun e!750134 () Bool)

(declare-fun array_inv!32170 (array!88232) Bool)

(assert (=> start!111068 (and (array_inv!32170 _values!1354) e!750134)))

(declare-fun mapIsEmpty!55078 () Bool)

(declare-fun mapRes!55078 () Bool)

(assert (=> mapIsEmpty!55078 mapRes!55078))

(declare-fun b!1315014 () Bool)

(declare-fun res!872992 () Bool)

(assert (=> b!1315014 (=> (not res!872992) (not e!750137))))

(assert (=> b!1315014 (= res!872992 (and (= (size!43146 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43145 _keys!1628) (size!43146 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315015 () Bool)

(declare-fun res!872991 () Bool)

(assert (=> b!1315015 (=> (not res!872991) (not e!750137))))

(assert (=> b!1315015 (= res!872991 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43145 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55078 () Bool)

(declare-fun tp!105030 () Bool)

(assert (=> mapNonEmpty!55078 (= mapRes!55078 (and tp!105030 e!750135))))

(declare-fun mapValue!55078 () ValueCell!16918)

(declare-fun mapRest!55078 () (Array (_ BitVec 32) ValueCell!16918))

(declare-fun mapKey!55078 () (_ BitVec 32))

(assert (=> mapNonEmpty!55078 (= (arr!42596 _values!1354) (store mapRest!55078 mapKey!55078 mapValue!55078))))

(declare-fun b!1315016 () Bool)

(declare-fun res!872990 () Bool)

(assert (=> b!1315016 (=> (not res!872990) (not e!750137))))

(declare-datatypes ((List!30212 0))(
  ( (Nil!30209) (Cons!30208 (h!31417 (_ BitVec 64)) (t!43818 List!30212)) )
))
(declare-fun arrayNoDuplicates!0 (array!88230 (_ BitVec 32) List!30212) Bool)

(assert (=> b!1315016 (= res!872990 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30209))))

(declare-fun b!1315017 () Bool)

(assert (=> b!1315017 (= e!750134 (and e!750133 mapRes!55078))))

(declare-fun condMapEmpty!55078 () Bool)

(declare-fun mapDefault!55078 () ValueCell!16918)

