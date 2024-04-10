; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110594 () Bool)

(assert start!110594)

(declare-fun b_free!29429 () Bool)

(declare-fun b_next!29429 () Bool)

(assert (=> start!110594 (= b_free!29429 (not b_next!29429))))

(declare-fun tp!103609 () Bool)

(declare-fun b_and!47637 () Bool)

(assert (=> start!110594 (= tp!103609 b_and!47637)))

(declare-fun mapIsEmpty!54367 () Bool)

(declare-fun mapRes!54367 () Bool)

(assert (=> mapIsEmpty!54367 mapRes!54367))

(declare-fun b!1308500 () Bool)

(declare-fun res!868620 () Bool)

(declare-fun e!746578 () Bool)

(assert (=> b!1308500 (=> (not res!868620) (not e!746578))))

(declare-datatypes ((array!87316 0))(
  ( (array!87317 (arr!42138 (Array (_ BitVec 32) (_ BitVec 64))) (size!42688 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87316)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87316 (_ BitVec 32)) Bool)

(assert (=> b!1308500 (= res!868620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308501 () Bool)

(declare-fun e!746580 () Bool)

(declare-fun tp_is_empty!35159 () Bool)

(assert (=> b!1308501 (= e!746580 tp_is_empty!35159)))

(declare-fun b!1308502 () Bool)

(declare-fun res!868613 () Bool)

(assert (=> b!1308502 (=> (not res!868613) (not e!746578))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308502 (= res!868613 (not (= (select (arr!42138 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1308503 () Bool)

(declare-fun res!868616 () Bool)

(assert (=> b!1308503 (=> (not res!868616) (not e!746578))))

(assert (=> b!1308503 (= res!868616 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42688 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308504 () Bool)

(declare-fun res!868619 () Bool)

(assert (=> b!1308504 (=> (not res!868619) (not e!746578))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308504 (= res!868619 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!54367 () Bool)

(declare-fun tp!103608 () Bool)

(assert (=> mapNonEmpty!54367 (= mapRes!54367 (and tp!103608 e!746580))))

(declare-datatypes ((V!51981 0))(
  ( (V!51982 (val!17654 Int)) )
))
(declare-datatypes ((ValueCell!16681 0))(
  ( (ValueCellFull!16681 (v!20281 V!51981)) (EmptyCell!16681) )
))
(declare-datatypes ((array!87318 0))(
  ( (array!87319 (arr!42139 (Array (_ BitVec 32) ValueCell!16681)) (size!42689 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87318)

(declare-fun mapRest!54367 () (Array (_ BitVec 32) ValueCell!16681))

(declare-fun mapKey!54367 () (_ BitVec 32))

(declare-fun mapValue!54367 () ValueCell!16681)

(assert (=> mapNonEmpty!54367 (= (arr!42139 _values!1354) (store mapRest!54367 mapKey!54367 mapValue!54367))))

(declare-fun b!1308499 () Bool)

(declare-fun res!868617 () Bool)

(assert (=> b!1308499 (=> (not res!868617) (not e!746578))))

(declare-datatypes ((List!29871 0))(
  ( (Nil!29868) (Cons!29867 (h!31076 (_ BitVec 64)) (t!43477 List!29871)) )
))
(declare-fun arrayNoDuplicates!0 (array!87316 (_ BitVec 32) List!29871) Bool)

(assert (=> b!1308499 (= res!868617 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29868))))

(declare-fun res!868615 () Bool)

(assert (=> start!110594 (=> (not res!868615) (not e!746578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110594 (= res!868615 (validMask!0 mask!2040))))

(assert (=> start!110594 e!746578))

(assert (=> start!110594 tp!103609))

(declare-fun array_inv!31849 (array!87316) Bool)

(assert (=> start!110594 (array_inv!31849 _keys!1628)))

(assert (=> start!110594 true))

(assert (=> start!110594 tp_is_empty!35159))

(declare-fun e!746581 () Bool)

(declare-fun array_inv!31850 (array!87318) Bool)

(assert (=> start!110594 (and (array_inv!31850 _values!1354) e!746581)))

(declare-fun b!1308505 () Bool)

(declare-fun res!868614 () Bool)

(assert (=> b!1308505 (=> (not res!868614) (not e!746578))))

(declare-fun minValue!1296 () V!51981)

(declare-fun zeroValue!1296 () V!51981)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22730 0))(
  ( (tuple2!22731 (_1!11376 (_ BitVec 64)) (_2!11376 V!51981)) )
))
(declare-datatypes ((List!29872 0))(
  ( (Nil!29869) (Cons!29868 (h!31077 tuple2!22730) (t!43478 List!29872)) )
))
(declare-datatypes ((ListLongMap!20387 0))(
  ( (ListLongMap!20388 (toList!10209 List!29872)) )
))
(declare-fun contains!8359 (ListLongMap!20387 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5222 (array!87316 array!87318 (_ BitVec 32) (_ BitVec 32) V!51981 V!51981 (_ BitVec 32) Int) ListLongMap!20387)

(assert (=> b!1308505 (= res!868614 (contains!8359 (getCurrentListMap!5222 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1308506 () Bool)

(assert (=> b!1308506 (= e!746578 (not true))))

(assert (=> b!1308506 (contains!8359 (getCurrentListMap!5222 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43296 0))(
  ( (Unit!43297) )
))
(declare-fun lt!585162 () Unit!43296)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!12 (array!87316 array!87318 (_ BitVec 32) (_ BitVec 32) V!51981 V!51981 (_ BitVec 64) (_ BitVec 32) Int) Unit!43296)

(assert (=> b!1308506 (= lt!585162 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!12 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308507 () Bool)

(declare-fun res!868612 () Bool)

(assert (=> b!1308507 (=> (not res!868612) (not e!746578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308507 (= res!868612 (validKeyInArray!0 (select (arr!42138 _keys!1628) from!2020)))))

(declare-fun b!1308508 () Bool)

(declare-fun res!868618 () Bool)

(assert (=> b!1308508 (=> (not res!868618) (not e!746578))))

(assert (=> b!1308508 (= res!868618 (and (= (size!42689 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42688 _keys!1628) (size!42689 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308509 () Bool)

(declare-fun e!746579 () Bool)

(assert (=> b!1308509 (= e!746581 (and e!746579 mapRes!54367))))

(declare-fun condMapEmpty!54367 () Bool)

(declare-fun mapDefault!54367 () ValueCell!16681)

