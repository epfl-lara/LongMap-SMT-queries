; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110614 () Bool)

(assert start!110614)

(declare-fun b_free!29449 () Bool)

(declare-fun b_next!29449 () Bool)

(assert (=> start!110614 (= b_free!29449 (not b_next!29449))))

(declare-fun tp!103669 () Bool)

(declare-fun b_and!47657 () Bool)

(assert (=> start!110614 (= tp!103669 b_and!47657)))

(declare-fun mapIsEmpty!54397 () Bool)

(declare-fun mapRes!54397 () Bool)

(assert (=> mapIsEmpty!54397 mapRes!54397))

(declare-fun mapNonEmpty!54397 () Bool)

(declare-fun tp!103668 () Bool)

(declare-fun e!746729 () Bool)

(assert (=> mapNonEmpty!54397 (= mapRes!54397 (and tp!103668 e!746729))))

(declare-datatypes ((V!52009 0))(
  ( (V!52010 (val!17664 Int)) )
))
(declare-datatypes ((ValueCell!16691 0))(
  ( (ValueCellFull!16691 (v!20291 V!52009)) (EmptyCell!16691) )
))
(declare-fun mapRest!54397 () (Array (_ BitVec 32) ValueCell!16691))

(declare-fun mapKey!54397 () (_ BitVec 32))

(declare-datatypes ((array!87352 0))(
  ( (array!87353 (arr!42156 (Array (_ BitVec 32) ValueCell!16691)) (size!42706 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87352)

(declare-fun mapValue!54397 () ValueCell!16691)

(assert (=> mapNonEmpty!54397 (= (arr!42156 _values!1354) (store mapRest!54397 mapKey!54397 mapValue!54397))))

(declare-fun res!868874 () Bool)

(declare-fun e!746731 () Bool)

(assert (=> start!110614 (=> (not res!868874) (not e!746731))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110614 (= res!868874 (validMask!0 mask!2040))))

(assert (=> start!110614 e!746731))

(assert (=> start!110614 tp!103669))

(declare-datatypes ((array!87354 0))(
  ( (array!87355 (arr!42157 (Array (_ BitVec 32) (_ BitVec 64))) (size!42707 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87354)

(declare-fun array_inv!31863 (array!87354) Bool)

(assert (=> start!110614 (array_inv!31863 _keys!1628)))

(assert (=> start!110614 true))

(declare-fun tp_is_empty!35179 () Bool)

(assert (=> start!110614 tp_is_empty!35179))

(declare-fun e!746730 () Bool)

(declare-fun array_inv!31864 (array!87352) Bool)

(assert (=> start!110614 (and (array_inv!31864 _values!1354) e!746730)))

(declare-fun b!1308851 () Bool)

(declare-fun res!868877 () Bool)

(assert (=> b!1308851 (=> (not res!868877) (not e!746731))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308851 (= res!868877 (and (= (size!42706 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42707 _keys!1628) (size!42706 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308852 () Bool)

(assert (=> b!1308852 (= e!746729 tp_is_empty!35179)))

(declare-fun b!1308853 () Bool)

(declare-fun res!868878 () Bool)

(assert (=> b!1308853 (=> (not res!868878) (not e!746731))))

(declare-datatypes ((List!29885 0))(
  ( (Nil!29882) (Cons!29881 (h!31090 (_ BitVec 64)) (t!43491 List!29885)) )
))
(declare-fun arrayNoDuplicates!0 (array!87354 (_ BitVec 32) List!29885) Bool)

(assert (=> b!1308853 (= res!868878 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29882))))

(declare-fun b!1308854 () Bool)

(declare-fun res!868876 () Bool)

(assert (=> b!1308854 (=> (not res!868876) (not e!746731))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308854 (= res!868876 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42707 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308855 () Bool)

(declare-fun e!746732 () Bool)

(assert (=> b!1308855 (= e!746732 tp_is_empty!35179)))

(declare-fun b!1308856 () Bool)

(assert (=> b!1308856 (= e!746731 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52009)

(declare-fun zeroValue!1296 () V!52009)

(declare-fun lt!585192 () Bool)

(declare-datatypes ((tuple2!22744 0))(
  ( (tuple2!22745 (_1!11383 (_ BitVec 64)) (_2!11383 V!52009)) )
))
(declare-datatypes ((List!29886 0))(
  ( (Nil!29883) (Cons!29882 (h!31091 tuple2!22744) (t!43492 List!29886)) )
))
(declare-datatypes ((ListLongMap!20401 0))(
  ( (ListLongMap!20402 (toList!10216 List!29886)) )
))
(declare-fun contains!8366 (ListLongMap!20401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5229 (array!87354 array!87352 (_ BitVec 32) (_ BitVec 32) V!52009 V!52009 (_ BitVec 32) Int) ListLongMap!20401)

(assert (=> b!1308856 (= lt!585192 (contains!8366 (getCurrentListMap!5229 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1308857 () Bool)

(declare-fun res!868875 () Bool)

(assert (=> b!1308857 (=> (not res!868875) (not e!746731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87354 (_ BitVec 32)) Bool)

(assert (=> b!1308857 (= res!868875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308858 () Bool)

(assert (=> b!1308858 (= e!746730 (and e!746732 mapRes!54397))))

(declare-fun condMapEmpty!54397 () Bool)

(declare-fun mapDefault!54397 () ValueCell!16691)

