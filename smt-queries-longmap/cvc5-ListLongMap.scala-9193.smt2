; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110506 () Bool)

(assert start!110506)

(declare-fun b_free!29341 () Bool)

(declare-fun b_next!29341 () Bool)

(assert (=> start!110506 (= b_free!29341 (not b_next!29341))))

(declare-fun tp!103345 () Bool)

(declare-fun b_and!47549 () Bool)

(assert (=> start!110506 (= tp!103345 b_and!47549)))

(declare-fun b!1307231 () Bool)

(declare-fun e!745922 () Bool)

(assert (=> b!1307231 (= e!745922 false)))

(declare-fun lt!585030 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87146 0))(
  ( (array!87147 (arr!42053 (Array (_ BitVec 32) (_ BitVec 64))) (size!42603 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87146)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!51865 0))(
  ( (V!51866 (val!17610 Int)) )
))
(declare-fun minValue!1296 () V!51865)

(declare-datatypes ((ValueCell!16637 0))(
  ( (ValueCellFull!16637 (v!20237 V!51865)) (EmptyCell!16637) )
))
(declare-datatypes ((array!87148 0))(
  ( (array!87149 (arr!42054 (Array (_ BitVec 32) ValueCell!16637)) (size!42604 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87148)

(declare-fun zeroValue!1296 () V!51865)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22674 0))(
  ( (tuple2!22675 (_1!11348 (_ BitVec 64)) (_2!11348 V!51865)) )
))
(declare-datatypes ((List!29814 0))(
  ( (Nil!29811) (Cons!29810 (h!31019 tuple2!22674) (t!43420 List!29814)) )
))
(declare-datatypes ((ListLongMap!20331 0))(
  ( (ListLongMap!20332 (toList!10181 List!29814)) )
))
(declare-fun contains!8331 (ListLongMap!20331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5194 (array!87146 array!87148 (_ BitVec 32) (_ BitVec 32) V!51865 V!51865 (_ BitVec 32) Int) ListLongMap!20331)

(assert (=> b!1307231 (= lt!585030 (contains!8331 (getCurrentListMap!5194 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1307232 () Bool)

(declare-fun res!867744 () Bool)

(assert (=> b!1307232 (=> (not res!867744) (not e!745922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87146 (_ BitVec 32)) Bool)

(assert (=> b!1307232 (= res!867744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307233 () Bool)

(declare-fun e!745920 () Bool)

(declare-fun tp_is_empty!35071 () Bool)

(assert (=> b!1307233 (= e!745920 tp_is_empty!35071)))

(declare-fun b!1307234 () Bool)

(declare-fun res!867742 () Bool)

(assert (=> b!1307234 (=> (not res!867742) (not e!745922))))

(declare-datatypes ((List!29815 0))(
  ( (Nil!29812) (Cons!29811 (h!31020 (_ BitVec 64)) (t!43421 List!29815)) )
))
(declare-fun arrayNoDuplicates!0 (array!87146 (_ BitVec 32) List!29815) Bool)

(assert (=> b!1307234 (= res!867742 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29812))))

(declare-fun res!867740 () Bool)

(assert (=> start!110506 (=> (not res!867740) (not e!745922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110506 (= res!867740 (validMask!0 mask!2040))))

(assert (=> start!110506 e!745922))

(assert (=> start!110506 tp!103345))

(declare-fun array_inv!31789 (array!87146) Bool)

(assert (=> start!110506 (array_inv!31789 _keys!1628)))

(assert (=> start!110506 true))

(assert (=> start!110506 tp_is_empty!35071))

(declare-fun e!745919 () Bool)

(declare-fun array_inv!31790 (array!87148) Bool)

(assert (=> start!110506 (and (array_inv!31790 _values!1354) e!745919)))

(declare-fun b!1307235 () Bool)

(declare-fun res!867741 () Bool)

(assert (=> b!1307235 (=> (not res!867741) (not e!745922))))

(assert (=> b!1307235 (= res!867741 (and (= (size!42604 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42603 _keys!1628) (size!42604 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54235 () Bool)

(declare-fun mapRes!54235 () Bool)

(assert (=> mapIsEmpty!54235 mapRes!54235))

(declare-fun b!1307236 () Bool)

(declare-fun e!745921 () Bool)

(assert (=> b!1307236 (= e!745921 tp_is_empty!35071)))

(declare-fun b!1307237 () Bool)

(assert (=> b!1307237 (= e!745919 (and e!745921 mapRes!54235))))

(declare-fun condMapEmpty!54235 () Bool)

(declare-fun mapDefault!54235 () ValueCell!16637)

